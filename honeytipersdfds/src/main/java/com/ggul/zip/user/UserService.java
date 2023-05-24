package com.ggul.zip.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.ui.Model;

import com.ggul.zip.escrow.EscrowVO;
import com.ggul.zip.lesson.LessonVO;

public interface UserService {

	public UserVO getUser(UserVO vo);
	
	public UserVO joinUser(UserVO vo);
	
	public UserVO chkId(UserVO vo);
	
	public void mailSend(String userEmail, Model model);
	
	public boolean pwMatchChk(String chkPassword, String password);
	
	public String hashedChk(String password);
	
	public void smsSend(UserVO vo, Model model);
	
	public boolean findUserPW(UserVO vo);
	
	public void findUser(UserVO vo, Model model);
	
	public boolean updatePW(UserVO vo);
	
	public UserVO getUserByKakaoAccount(UserVO vo);
	
	public UserVO joinKakaoUser(UserVO vo);
	
	public boolean updateUserInfo(UserVO vo);
	
	public String viewBlackList(UserVO vo);
	
	
	
    //소연누나부분
    UserVO getUserSY(UserVO vo);
   
    List<UserVO> getUserList(UserVO vo);
	


	
	//상현이부분

//	public UserVO getUser(UserVO vo);
//
//	public UserVO joinUser(UserVO vo);
//
//	public UserVO chkId(UserVO vo);
//
//	public void mailSend(String userEmail, Model model);
//
//	public boolean pwMatchChk(String chkPassword, String password);
//
//	public String hashedChk(String password);
//
//	public UserVO chkMail(UserVO vo, Model model);
//
//	public UserVO getUSerByEmail(UserVO vo);
//
//	public void smsSend(UserVO vo, Model model);
//
//	public void findUser(UserVO vo, Model model);
//
//	public boolean updatePW(UserVO vo);

    void updateEscrowReportUser(EscrowVO evo);
    
	int addUser(UserVO vo);

	int delUser(UserVO vo);

	int checkUser(UserVO vo);

	int loginUser(UserVO vo);

	int pointSelect(UserVO vo);

	int updateUser(UserVO vo);

	UserVO selectName(UserVO vo);

	int pointTake(UserVO vo);
	
	//정성현 관리자 부분 ==========================================
	List<UserVO> getPotentialTiperList(UserVO vo);
	ArrayList<UserVO> searchPotentialTiperList(HashMap<String, Object> map);

	List<ReportVO> getReportList(ReportVO vo);

	void updateTiperAgree(UserVO vo);
	void updateTiperReject(UserVO vo);

	void updateReportStatus(ReportVO rvo);
	void updateReportStatus01(ReportVO rvo);
	void updateReportStatus23(ReportVO rvo);
	void updateReportUserRole03(UserVO uvo);
	void updateReportUserRole30(UserVO uvo);
	void updateLessonOnoff(ReportVO rvo);
	
	int checkUserRole(UserVO uvo);
	
	List<UserVO> getBlackList(UserVO vo);
	ArrayList<UserVO> searchBlackList(HashMap<String, Object> map);
	
	//정성현 마이페이지 =======
	void reportLessonNum(ReportVO rvo);
	int isDupReport(ReportVO rvo);
	List<UserVO> getUserInfoMypage(UserVO vo);
	void updateUserRole01(UserVO vo);
	
	int getEscrowPrice(EscrowVO evo);
	String getTiperUserId(EscrowVO evo);
	String getLessonTitle(LessonVO lvo);
	void addUserPoint(UserVO uvo);
	void insertLessonPrice(UserVO vo);
	int isTiper(UserVO uvo);
	int isTiperAgree(UserVO uvo);

	void updateEscrowReportStatus(EscrowVO evo);
	void addProfitSales(UserVO uvo);
	
}