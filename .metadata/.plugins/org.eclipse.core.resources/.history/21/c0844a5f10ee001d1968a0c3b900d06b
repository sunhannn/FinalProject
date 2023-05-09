package com.ggul.zip.user.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

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
	public UserVO chkMail(UserVO vo, Model model) {
		return userDAO.chkMail(vo, model);
	}

	@Override
	public UserVO getUSerByEmail(UserVO vo) {
		return userDAO.getUSerByEmail(vo);
	}

	@Override
	public void smsSend(UserVO vo, Model model) {
		userDAO.smsSend(vo, model);
	}

	@Override
	public void findUser(UserVO vo, Model model) {
		userDAO.findUser(vo, model);
		
	}

	@Override
	public boolean updatePW(UserVO vo) {
		return userDAO.updatePW(vo);
	}

	
	
	
	//소연누나부분
	
	public UserVO getUserSY(UserVO vo) {
		return userDAO.getUserSY(vo);
	}
	
	
//	@Override
	public List<UserVO> getUserList(UserVO vo) {
		System.out.println("유저서비스도착");
		return userDAO.getUserList(vo);
	}
	
	@Override
	public ArrayList<UserVO> getUserListPostSearch(HashMap<String,Object> map){
		return (ArrayList<UserVO>) userDAO.getUserListPostSearch(map);
	}

	
	
	
	
	
	//상현이부분
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

	
	
	
}
