package com.ggul.zip.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Random;

import org.json.simple.JSONObject;
import org.mindrot.jbcrypt.BCrypt;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;

import com.ggul.zip.escrow.EscrowVO;
import com.ggul.zip.lesson.LessonVO;
import com.ggul.zip.user.ReportVO;
import com.ggul.zip.user.UserVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Repository
public class UserDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	@Autowired
	private JavaMailSenderImpl java;

	// 회원정보 가져오기
	public UserVO getUser(UserVO vo) {
		return mybatis.selectOne("UserDAO.viewUser", vo);
	}

	// 회원 가입
	public UserVO joinUser(UserVO vo) {

		mybatis.insert("UserDAO.joinUser", vo);
		return vo;
	}

	// 회원 조회
	public UserVO viewUser(UserVO vo) {
		return mybatis.selectOne("UserDAO.viewUser", vo);
	}

	// 블랙리스트 조회
	public String viewBlackList(UserVO vo) {
		UserVO black = mybatis.selectOne("UserDAO.viewUser", vo);

		System.out.println("black 출력 : " + black);

		int role = black.getUser_role();
		String role_st = String.valueOf(role);

		System.out.println("role_st 출력 : " + role_st);

		if (role_st.equals("3")) {
			return "말벌";
		} else if (role_st.equals("4")) {
			return "탈퇴";
		} else {
			return "로그인";
		}
	}

	// 전화번호, 이름으로 회원정보 가져오기
		public List<String> findUser(UserVO vo, Model model) {
			List<String> user = mybatis.selectList("UserDAO.findUser", vo);
			
			if (user != null) {
				model.addAttribute("vali", true);
			}else {
				model.addAttribute("vali", false);
			}
			return user;
		}

	// 아이디, 전화번호로 회원정보 가져오기
	public boolean findUserPW(UserVO vo) {
		UserVO user = mybatis.selectOne("UserDAO.findUserPW", vo);
		int role = user.getUser_role();
		String user_role = String.valueOf(role);

		if (user_role.equals("3") || user_role.equals("4")) {
			return false;
		} else {
			return true;
		}
	}

	// 아이디 중복확인
	public UserVO chkId(UserVO vo, Model model) {
		return (UserVO) model.addAttribute("user", mybatis.selectOne("UserDAO.viewUser", vo));
	}

	// 카카오 회원가입
	public UserVO joinKakaoUser(UserVO vo) {
		int insert = mybatis.insert("UserDAO.joinKakaoUser", vo);
		if (insert < 1) {
			System.out.println("회원가입 안됐음");
		}
		return vo;
	}

	// 카카오 로그인 실행
	public UserVO getUserByKakaoAccount(UserVO vo) {
		UserVO user = mybatis.selectOne("UserDAO.kakaoUser", vo);

		if (user != null) {
			System.out.println("db에 있음");
		} else {
			System.out.println("db에 없음");
		}
		return user;
	}

	// 개인정보 수정
	boolean updateUserInfo(UserVO vo) {
		int i = mybatis.update("UserDAO.updateUserInfo", vo);

		if (i != 0) {
			return true;
		} else {
			return false;
		}
	}

	// sms 전송
	public void smsSend(UserVO vo, Model model) {
		String api_key = "NCS3NRGWZCCP73VT";
		String api_secret = "HDNZWRIYPKS6LZDZRGODXKANQGXW5YYW";
		Message coolsms = new Message(api_key, api_secret);

		// 난수생성
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", vo.getUser_tel()); // 수신전화번호
		params.put("from", "01049914741"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		params.put("type", "SMS");
		params.put("text", "[TEST] 인증번호는" + "[" + checkNum + "]" + "입니다."); // 문자 내용 입력
		params.put("app_version", "test app 1.2"); // application name and version

		String num = Integer.toString(checkNum);

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			model.addAttribute("num", num);
		} catch (CoolsmsException e) {
		}
	}

	// 메일 전송
	void mailSend(String userEmail, Model model) {

		// 난수생성
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

		try {
			MailHandler mailHandler = new MailHandler(java);
			mailHandler.setTo(userEmail);
			mailHandler.setSubject("꿀TIPer 인증번호입니다");
			mailHandler.setText("회원가입시 필요한 인증번호입니다." + "<br><br>" + "인증 번호는 [ " + checkNum + " ] 입니다." + "<br>"
					+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.", true);
			mailHandler.setFrom("ggul.tiper@gmail.com");

			mailHandler.send();

		} catch (Exception e) {
			e.printStackTrace();
		}
		String num = Integer.toString(checkNum);
		model.addAttribute("sendNum", num);
	}

	// 비밀번호 암호화
	String hashedChk(String password) {

		String passwordHashed = BCrypt.hashpw(password, BCrypt.gensalt());
		boolean isValidPassword = BCrypt.checkpw(password, passwordHashed);

		if (isValidPassword) {
			return passwordHashed;
		} else {
			return null;
		}

	}

	// db비밀번호, 입력 비밀번호 매칭
	boolean pwMatchChk(String chkPassword, String password) {

		boolean chkMatch = false;

		if (chkPassword != null && password != null) {
			chkMatch = BCrypt.checkpw(chkPassword, password);
		}
		return chkMatch;
	}

	// 비밀번호 변경
	boolean updatePW(UserVO vo) {
		int i = mybatis.update("UserDAO.updatePW", vo);

		if (i != 0) {
			return true;
		} else {
			return false;
		}
	}

	
	
	
	// 소연누나부분
	// 회원상세 조회
	public UserVO getUserSY(UserVO vo) {
		return mybatis.selectOne("UserDAO.getUserSY", vo);
	}

	// 회원목록
	public List<UserVO> getUserList(UserVO vo) {
		return mybatis.selectList("UserDAO.getUserListSY", vo);
	}

	
	
	
	// 상현이부분
	int pointSelect(UserVO vo) {
		return mybatis.selectOne("UserDAO.pointSelect", vo);
	}

	int updateUser(UserVO vo) {
		return mybatis.update("UserDAO.updateUser", vo);
	}

	// 이름 조회
	UserVO selectName(UserVO vo) {
		return mybatis.selectOne("UserDAO.selectName", vo);
	}

	// 포인트 조회
	int pointTake(UserVO vo) {
		return mybatis.update("UserDAO.pointTake", vo);
	}

	// 탈퇴
	int delUser(UserVO vo) {
		return mybatis.update("UserDAO.deleteUser", vo);
	}
	
	public void updateEscrowReportUser(EscrowVO evo) {
		System.out.println("===>mybatis로 updateEscrowReportUser() 기능처리");

		mybatis.update("UserDAO.updateEscrowReportUser", evo);
	}

	// ===================================================================================
	// 정성현 - 블랙리스트 관리, 승급관리 ========================================================

	// 승급관리 : 검색 - 승급대기중인 Tiper리스트 불러오기
	public List<UserVO> searchPotentialTiperList(HashMap<String, Object> map) {
		System.out.println("===>mybatis로 searchPotentialTiperList() 기능처리");

		return mybatis.selectList("UserDAO.searchPotentialTiperList", map);
	}

	// 승급관리 : 승급 대기중인 회원 리스트 불러오기
	public List<UserVO> getPotentialTiperList(UserVO vo) {
		System.out.println("===>mybatis로 getPotentialTiperList() 기능처리");

		return mybatis.selectList("UserDAO.getPotentialTiperList", vo);
	}

	// TIPER_AGREE를 1로 업데이트
	public void updateTiperAgree(UserVO vo) {
		System.out.println("===>mybatis로 updateTiperAgree() 기능처리");

		mybatis.update("UserDAO.updateTiperAgree", vo);
	}

	// TIPER_AGREE를 2로 업데이트
	public void updateTiperReject(UserVO vo) {
		System.out.println("===>mybatis로 updateTiperReject() 기능처리");

		mybatis.update("UserDAO.updateTiperReject", vo);
	}
	
	// USER_ROLE을 1로 update
    public void updateTiperAgree10(UserVO vo) {
       System.out.println("===>mybatis로 updateTiperAgree10() 기능처리");

       mybatis.update("UserDAO.updateTiperAgree10", vo);
 }


	// 신고당한 유저리스트
	public List<ReportVO> getReportList(ReportVO vo) {
		System.out.println("===>mybatis로 getReportList() 기능처리");

		return mybatis.selectList("UserDAO.getReportList", vo);
	}

	// 신고처리됨 : REPORT_STATUS 0 -> 2 (정지처리됨)
	public void updateReportStatus(ReportVO rvo) {
		System.out.println("===>mybatis로 updateReportStatus() 기능처리");
		mybatis.update("UserDAO.updateReportStatus", rvo);
	}

	// 신고처리됨 : REPORT_STATUS 0 -> 1 (반려처리됨)
	public void updateReportStatus01(ReportVO rvo) {
		System.out.println("===>mybatis로 updateReportStatus01() 기능처리");
		mybatis.update("UserDAO.updateReportStatus01", rvo);
	}

	// 신고처리됨 : REPORT_STATUS 2 -> 3 (반려처리됨)
	public void updateReportStatus23(ReportVO rvo) {
		System.out.println("===>mybatis로 updateReportStatus23() 기능처리");
		mybatis.update("UserDAO.updateReportStatus23", rvo);
	}

	// 블랙리스트 관리 - 정지처리 : USER_ROLE -> 3 (블랙리스트)
	public void updateReportUserRole03(UserVO uvo) {
		System.out.println("===>mybatis로 updateReportUserRole03() 기능처리");
		mybatis.update("UserDAO.updateReportUserRole03", uvo);
	}

	// 블랙리스트 관리 - 정지처리 : USER_ROLE 3 -> 0 (블랙리스트)
	public void updateReportUserRole30(UserVO uvo) {
		System.out.println("===>mybatis로 updateReportUserRole30() 기능처리");
		mybatis.update("UserDAO.updateReportUserRole30", uvo);
	}

	// 블랙리스트 관리 - 정지처리 : LESSON_ONOFF 1 -> 0 (강의 중지)
	public void updateLessonOnoff(ReportVO rvo) {
		System.out.println("===>mybatis로 updateLessonOnoff() 기능처리");
		mybatis.update("UserDAO.updateLessonOnoff", rvo);
	}

	// 블랙리스트 관리 - USER_ROLE 3 여부 확인
	public int checkUserRole(UserVO uvo) {
		System.out.println("===>mybatis로 checkUserRole() 기능처리");
		return mybatis.selectOne("UserDAO.checkUserRole", uvo);
	}

	// 블랙리스트 관리 - 블랙리스트 가져오기
	public List<UserVO> getBlackList(UserVO vo) {
		System.out.println("===>mybatis로 getBlackList() 기능처리");

		return mybatis.selectList("UserDAO.getBlackList", vo);
	}

	// 블랙리스트 관리 : 조건에 따른 검색
	public List<UserVO> searchBlackList(HashMap<String, Object> map) {
		System.out.println("===>mybatis로 searchBlackList() 기능처리");

		return mybatis.selectList("UserDAO.searchBlackList", map);
	}

	// 정성현 : 마이페이지

	// 중복된 신고 있는지 확인
	public int isDupReport(ReportVO vo) {
		System.out.println("===>mybatis로 isDupReport() 기능처리");

		Object result = mybatis.selectList("UserDAO.isDupReport", vo);

		if (ObjectUtils.isEmpty(result) == false) {
			return 1;
		} else {

			return 0;
		}
	}

	// 강의를 신고
	public void reportLessonNum(ReportVO vo) {
		System.out.println("===>mybatis로 reportLessonNum() 기능처리");

		mybatis.update("UserDAO.reportLessonNum", vo);
	}

	// 마이페이지에 유저정보 가져오기
	public List<UserVO> getUserInfoMypage(UserVO vo) {
		System.out.println("===>mybatis로 getUserInfoMypage() 기능처리");
		return mybatis.selectList("UserDAO.getUserInfoMypage", vo);
	}

	// USER_ROLE을 1로 update
	public void updateUserRole01(UserVO vo) {
		System.out.println("===>mybatis로 updateUserRole01() 기능처리");

		mybatis.update("UserDAO.updateUserRole01", vo);
	}

	// ===5월 13일 업데이트=============================
	// escrow테이블에서 escrow_price 가져오기
	public int getEscrowPrice(EscrowVO vo) {
		System.out.println("===>mybatis로 getEscrowPrice() 기능처리");
		return mybatis.selectOne("UserDAO.getEscrowPrice", vo);
	}

	// lesson테이블에서 LessonTitle 가져오기 (escrow와 lesson을 join)
	public String getLessonTitle(LessonVO lvo) {
		System.out.println("===>mybatis로 getLessonTitle() 기능처리");
		return mybatis.selectOne("UserDAO.getLessonTitle", lvo);
	}

	// tiper테이블에서 tiper_user_id 가져오기 (escrow와 join해서)
	public String getTiperUserId(EscrowVO evo) {
		System.out.println("===>mybatis로 getTiperUserId() 기능처리");
		return mybatis.selectOne("UserDAO.getTiperUserId", evo);
	}

	// User_Point에 5% 차감된 포인트만큼 +update
	public void addUserPoint(UserVO vo) {
		System.out.println("===>mybatis로 addUserPoint() 기능처리");

		mybatis.update("UserDAO.addUserPoint", vo);
	}

	// 리뷰작성 시 해당 강의명을 가져오기
	public void insertLessonPrice(UserVO vo) {
		System.out.println("===>mybatis로 insertLessonPrice() 기능처리");

		mybatis.update("UserDAO.insertLessonPrice", vo);
	}

	// 마이페이지 : 해당 회원이 Tiper테이블에 있는지 확인
	public int isTiper(UserVO uvo) {
		System.out.println("===>mybatis로 isTiper() 기능처리");

		Object result = mybatis.selectList("UserDAO.isTiper", uvo);

		if (ObjectUtils.isEmpty(result) == false) {
			return 1;
		} else {
			return 0;
		}
	}

	// Tiper_agree값 가져오기
	public int isTiperAgree(UserVO uvo) {
		System.out.println("===>mybatis로 isTiperAgree() 기능처리");

		int result = 0;

		if (isTiper(uvo) == 0) {

			return 31;
		} else {

			result = mybatis.selectOne("UserDAO.isTiperAgree", uvo);

			if (result == 1) {
				return 1;
			} else if (result == 2) {
				return 2;
			} else if (result == 0) {
				return 0;
			} else {
				return 99;
			}
		}
	}

	// 신고 접수 시 Escrow테이블의 ESCROW_REPORT_STATUS 를 1로 업데이트
	public void updateEscrowReportStatus(EscrowVO evo) {
		System.out.println("===>mybatis로 updateEscrowReportStatus() 기능처리");

		mybatis.update("UserDAO.updateEscrowReportStatus", evo);
	}
	
	// User_Point에 5% 차감된 포인트만큼 +update
			public void addProfitSales(UserVO vo) {
				System.out.println("===>mybatis로 addProfitSales() 기능처리");

				mybatis.insert("UserDAO.addProfitSales", vo);
			}
}
