package com.ggul.zip.payment.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ggul.zip.payment.PointService;
import com.ggul.zip.payment.PointVO;

@Component("paymentService")
public class PointServiceImpl implements PointService {

	@Autowired
	private PointDAO pointDAO;

	// 포인트 충전시 서비스
	@Override
	public void insertPoint(PointVO vo) {
		pointDAO.insertPoint(vo);
	}

	// 충전후 update하는 서비스
	@Override
	public void updateUserPoint(PointVO vo) {
		pointDAO.updateUserPoint(vo);
	}

	// 포인트리스트select
	@Override
	public List<PointVO> getPointList(PointVO vo) {
		return pointDAO.getPointList(vo);
	}

	// 포인트내역에서 my허니페이 보여주는 서비스
	@Override
	public PointVO callTotalPoint(PointVO vo) {
		return pointDAO.callTotalPoint(vo);
	}

	// 강사 포인트 정산하기
	@Override
	public void insertRefundPoint(PointVO vo) {
		pointDAO.insertRefundPoint(vo);
	}


	
}
