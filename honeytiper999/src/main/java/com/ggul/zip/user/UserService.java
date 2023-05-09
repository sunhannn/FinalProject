package com.ggul.zip.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.ui.Model;

public interface UserService {

	public UserVO getUser(UserVO vo);
	
	public UserVO joinUser(UserVO vo);
	
	public UserVO chkId(UserVO vo);
	
	public void mailSend(String userEmail, Model model);
	
	public boolean pwMatchChk(String chkPassword, String password);
	
	public String hashedChk(String password);
	
	public UserVO chkMail(UserVO vo, Model model);
	
	public UserVO getUSerByEmail(UserVO vo);
	
	public void smsSend(UserVO vo, Model model);
	
	public void findUser(UserVO vo, Model model);
	
	public boolean updatePW(UserVO vo);
	
	
	
	
	//소연누나부분
	public UserVO getUserSY(UserVO vo);
	
	List<UserVO> getUserList(UserVO vo);

	ArrayList<UserVO> getUserListPostSearch(HashMap<String, Object> map);
	
	
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


	int addUser(UserVO vo);

	int delUser(UserVO vo);

	int checkUser(UserVO vo);

	int loginUser(UserVO vo);

	int pointSelect(UserVO vo);

	int updateUser(UserVO vo);

	UserVO selectName(UserVO vo);

	int pointTake(UserVO vo);
	
	
}