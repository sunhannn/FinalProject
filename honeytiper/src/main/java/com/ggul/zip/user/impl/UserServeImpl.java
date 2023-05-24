package com.ggul.zip.user.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ggul.zip.escrow.EscrowVO;
import com.ggul.zip.lesson.LessonVO;
import com.ggul.zip.user.ReportVO;
import com.ggul.zip.user.UserService;
import com.ggul.zip.user.UserVO;

@Service("userService")
public class UserServeImpl implements UserService {

	@Autowired
	private UserDAO userDAO;

	@Override
	public UserVO getUser(UserVO vo) {
		return userDAO.getUser(vo);
	}

	@Override
	public UserVO joinUser(UserVO vo) {
		return userDAO.joinUser(vo);
	}

	@Override
	public UserVO chkId(UserVO vo) {
		return userDAO.viewUser(vo);
	}

	@Override
	public void mailSend(String userEmail, Model model) {
		userDAO.mailSend(userEmail, model);
	}

	@Override
	public boolean pwMatchChk(String chkPassword, String password) {
		return userDAO.pwMatchChk(chkPassword, password);
	}

	@Override
	public String hashedChk(String password) {
		return userDAO.hashedChk(password);
	}

	@Override
	public void smsSend(UserVO vo, Model model) {
		userDAO.smsSend(vo, model);
	}

	@Override
	public List<String> findUser(UserVO vo, Model model) {
		return userDAO.findUser(vo, model);

	}

	@Override
	public boolean updatePW(UserVO vo) {
		return userDAO.updatePW(vo);
	}

	@Override
	public boolean findUserPW(UserVO vo) {
		return userDAO.findUserPW(vo);

	}

	@Override
	public UserVO joinKakaoUser(UserVO vo) {
		return userDAO.joinKakaoUser(vo);
	}

	@Override
	public UserVO getUserByKakaoAccount(UserVO vo) {
		return userDAO.getUserByKakaoAccount(vo);
	}

	@Override
	public boolean updateUserInfo(UserVO vo) {
		return userDAO.updateUserInfo(vo);
	}

	@Override
	public String viewBlackList(UserVO vo) {
		return userDAO.viewBlackList(vo);
	}

	
	
	// 소연누나부분

	@Override
	public UserVO getUserSY(UserVO vo) {
		return userDAO.getUserSY(vo);
	}

	@Override
	public List<UserVO> getUserList(UserVO vo) {
		return userDAO.getUserList(vo);
	}

	
	
	// 상현이부분
	
	@Override
	public void updateEscrowReportUser(EscrowVO evo) {
		userDAO.updateEscrowReportUser(evo);
	}
	
	@Override
	public int delUser(UserVO vo) {
		return userDAO.delUser(vo);
	}

	@Override
	public int pointSelect(UserVO vo) {
		return userDAO.pointSelect(vo);
	}

	@Override
	public int updateUser(UserVO vo) {
		return userDAO.updateUser(vo);

	}

	@Override
	public UserVO selectName(UserVO vo) {
		return userDAO.selectName(vo);
	}

	@Override
	public int pointTake(UserVO vo) {
		return userDAO.pointTake(vo);
	}

	@Override
	public int addUser(UserVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int checkUser(UserVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int loginUser(UserVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 정성현 =============================
	@Override
	public List<UserVO> getPotentialTiperList(UserVO vo) {

		return userDAO.getPotentialTiperList(vo);
	}

	@Override
	public ArrayList<UserVO> searchPotentialTiperList(HashMap<String, Object> map) {
		return (ArrayList<UserVO>) userDAO.searchPotentialTiperList(map);
	}

	@Override
	public void updateTiperAgree(UserVO vo) {
		userDAO.updateTiperAgree(vo);
	}

	@Override
	public void updateTiperReject(UserVO vo) {
		userDAO.updateTiperReject(vo);
	}

	@Override
	public List<ReportVO> getReportList(ReportVO vo) {
		return userDAO.getReportList(vo);
	}

	@Override
	public void updateReportStatus(ReportVO rvo) {
		userDAO.updateReportStatus(rvo);
	}

	@Override
	public void updateReportStatus01(ReportVO rvo) {
		userDAO.updateReportStatus01(rvo);
	}

	@Override
	public void updateReportStatus23(ReportVO rvo) {
		userDAO.updateReportStatus23(rvo);
	}

	@Override
	public void updateReportUserRole03(UserVO uvo) {
		userDAO.updateReportUserRole03(uvo);
	}

	@Override
	public void updateReportUserRole30(UserVO uvo) {
		userDAO.updateReportUserRole30(uvo);
	}

	@Override
	public void updateLessonOnoff(ReportVO rvo) {
		userDAO.updateLessonOnoff(rvo);
	}

	@Override
	public int checkUserRole(UserVO uvo) {
		return userDAO.checkUserRole(uvo);
	}

	@Override
	public List<UserVO> getBlackList(UserVO vo) {

		return userDAO.getBlackList(vo);
	}

	@Override
	public ArrayList<UserVO> searchBlackList(HashMap<String, Object> map) {
		return (ArrayList<UserVO>) userDAO.searchBlackList(map);
	}

	// 정성현 마이페이지 ======================================================

	@Override
	public void reportLessonNum(ReportVO rvo) {
		userDAO.reportLessonNum(rvo);
	}

	@Override
	public int isDupReport(ReportVO rvo) {
		int result = userDAO.isDupReport(rvo);
		return result;
	}

	@Override
	public List<UserVO> getUserInfoMypage(UserVO vo) {
		return userDAO.getUserInfoMypage(vo);
	}

	@Override
	public void updateUserRole01(UserVO vo) {
		userDAO.updateUserRole01(vo);
	}

	@Override
	public int getEscrowPrice(EscrowVO evo) {
		return userDAO.getEscrowPrice(evo);
	}

	@Override
	public String getLessonTitle(LessonVO lvo) {
		return userDAO.getLessonTitle(lvo);
	}

	@Override
	public String getTiperUserId(EscrowVO evo) {
		return userDAO.getTiperUserId(evo);
	}

	@Override
	public void addUserPoint(UserVO vo) {
		userDAO.addUserPoint(vo);
	}

	@Override
	public void insertLessonPrice(UserVO vo) {
		userDAO.insertLessonPrice(vo);
	}

	@Override
	public int isTiper(UserVO tvo) {
		return userDAO.isTiper(tvo);
	}

	@Override
	public int isTiperAgree(UserVO uvo) {
		return userDAO.isTiperAgree(uvo);
	}

	@Override
	public void updateEscrowReportStatus(EscrowVO evo) {
		userDAO.updateEscrowReportStatus(evo);
	}
	@Override
	public void addProfitSales(UserVO vo) {
		userDAO.addProfitSales(vo);
	}
	@Override
	   public void updateTiperAgree10(UserVO vo) {
	      userDAO.updateTiperAgree10(vo);
	   }

	
}
