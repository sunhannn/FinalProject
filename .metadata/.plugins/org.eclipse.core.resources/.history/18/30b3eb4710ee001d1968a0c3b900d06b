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
	
	//전화번호로 회원정보 가져오기
	public void findUser(UserVO vo, Model model) {
		UserVO user = mybatis.selectOne("UserDAO.findUser", vo);
		model.addAttribute("user_id", user.getUser_id());
	}

	// 아이디 중복확인
	public UserVO chkId(UserVO vo, Model model) {
			return (UserVO) model.addAttribute("user", mybatis.selectOne("UserDAO.viewUser", vo));
	}
	
	//카카오 로그인 실행
	public UserVO getUSerByEmail(UserVO vo) {
		UserVO user = mybatis.selectOne("UserDAO.kakaoUser", vo);
		
		if( user != null) {
			return user;
		} else {
		}
		return user;
	}
	
	//sms 전송
	public void smsSend(UserVO vo, Model model) {
		String api_key = "NCS3NRGWZCCP73VT";
	    String api_secret = "HDNZWRIYPKS6LZDZRGODXKANQGXW5YYW";
	    Message coolsms = new Message(api_key, api_secret);
	    
	    //난수생성
  		Random random = new Random();
  		int checkNum = random.nextInt(888888) + 111111;

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", vo.getUser_tel());    // 수신전화번호
	    params.put("from", "01049914741");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	    params.put("type", "SMS");
	    params.put("text", "[TEST] 인증번호는" + "["+ checkNum +"]" + "입니다."); // 문자 내용 입력
	    params.put("app_version", "test app 1.2"); // application name and version
	    
	    String num = Integer.toString(checkNum);

	    try {
	        JSONObject obj = (JSONObject) coolsms.send(params);
	        model.addAttribute("num", num);
	      } catch (CoolsmsException e) {
	      }
	}
	
	//메일 전송
	void mailSend(String userEmail, Model model) {
		
		//난수생성
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		
		try {
			MailHandler mailHandler = new MailHandler(java);
			mailHandler.setTo(userEmail);
			mailHandler.setSubject("꿀TIPer 인증번호입니다");
			mailHandler.setText(
					"회원가입시 필요한 인증번호입니다." +
	                "<br><br>" + 
	                "인증 번호는 [ " + checkNum + " ] 입니다." + 
	                "<br>" + 
	                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.",
					true);
			mailHandler.setFrom("ggul.tiper@gmail.com");
			
			mailHandler.send();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		String num = Integer.toString(checkNum);
		model.addAttribute("sendNum", num);
	}
	
	//메일 중복확인
	public UserVO chkMail(UserVO vo, Model model) {
			vo =  mybatis.selectOne("UserDAO.viewMail", vo);
			if(vo == null) {
			} else {
			}
			return vo;
	}
	
	
	//비밀번호 암호화
	String hashedChk(String password) {
		
		String passwordHashed = BCrypt.hashpw(password, BCrypt.gensalt());
		boolean isValidPassword = BCrypt.checkpw(password, passwordHashed);
		
		if (isValidPassword) {
			return passwordHashed;
		} else {
			return null;
		}
		
	}
	
	//db비밀번호, 입력 비밀번호 매칭
	boolean pwMatchChk(String chkPassword, String password) {
		
		boolean chkMatch = false;
		
		if (chkPassword != null && password != null) {
			chkMatch = BCrypt.checkpw(chkPassword, password);
		}
		return chkMatch;
	}
	
	//비밀번호 변경
	boolean updatePW(UserVO vo) {
		int i = mybatis.update("UserDAO.updatePW", vo);
		
		if(i != 0) {
			return true;
		} else {
			return false;
		}
	}
	
	
	
	
	
	
	
	
	
	//소연누나부분
	
	// 회원정보 조회
	public UserVO getUserSY(UserVO vo) {
		return mybatis.selectOne("UserDAO.getUserSY", vo);
	}
	
	// 회원목록 조회
	public List<UserVO> getUserList(UserVO vo) {
		return  mybatis.selectList("UserDAO.getUserListSY", vo);
	}
	
	
// 회원정보 검색	
	public List<UserVO> getUserListPostSearch(HashMap<String, Object> map){
		return  mybatis.selectList("UserDAO.getUserListPostSearch", map);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//상현이부분
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
	//탈퇴
	int delUser(UserVO vo) {
		return mybatis.update("UserDAO.deleteUser", vo);
	}
	
}
