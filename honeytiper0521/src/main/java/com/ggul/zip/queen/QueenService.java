package com.ggul.zip.queen;

import java.util.List;

import com.ggul.zip.user.UserVO;


public interface QueenService {
	
	//차트에 필요한 값 가져오기
	List<QueenVO> getChart(QueenVO vo);
	
	//일주일중 최고매출
	String weekTop();
	//일주일중 평균매출
	String weekAvg();
	//일주일중 총매출
	String weekTotal();
	
	//한달간중 최고매출
	String monthTop();
	//한달간의 평균매출
	String monthAvg();
	//한달간의 총매출
	String monthTotal();
	
	
	//승희
	public boolean updateAdminInfo(UserVO vo);
	
	
	
	
	//소연
	public String hashedChk(String password);

}
