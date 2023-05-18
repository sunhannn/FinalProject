package com.ggul.zip.payment.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ggul.zip.payment.PointVO;

@Repository
public class PointDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// payment.jsp에 불러올 point테이블 리스트
	public List<PointVO> getPointList(PointVO vo) {
		List<PointVO> point = mybatis.selectList("PointDAO.getPointList", vo);
		return point;
	}

	// payment.jsp 토탈포인트 불러옴
	public PointVO callTotalPoint(PointVO vo) {
		return mybatis.selectOne("PointDAO.callTotalPoint", vo);
	}

	// 허니페이 충전시 결제넘버,유저아이디,금액,결제내용, 데이트 insert하는 실행문
	public void insertPoint(PointVO vo) {
		mybatis.insert("PointDAO.insertPoint", vo);
	}

	// 충전시 토탈허니페이를 업데이트함
	public void updateUserPoint(PointVO vo) {
		mybatis.update("PointDAO.updateUserPoint", vo);
	}

	// 강사 포인트 정산하기
	public void insertRefundPoint(PointVO vo) {
		mybatis.insert("PointDAO.insertRefundPoint", vo);
	}

}
