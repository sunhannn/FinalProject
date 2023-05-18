package com.ggul.zip.payment;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.ggul.zip.user.UserVO;

public interface PointService {

	// 포인트 충전시 내역insert
	public void insertPoint(PointVO vo);

	// 충전,환불시 update하는 서비스
	public void updateUserPoint(PointVO vo);

	// pointInfo에서 select 포인트내역
	public List<PointVO> getPointList(PointVO vo);

	// 포인트내역에서 my허니페이 select
	public PointVO callTotalPoint(PointVO vo);

	// 강사포인트 정산 내역insert
	public void insertRefundPoint(PointVO vo);


}
