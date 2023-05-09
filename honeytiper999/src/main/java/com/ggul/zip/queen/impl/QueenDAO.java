package com.ggul.zip.queen.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ggul.zip.queen.QueenVO;


@Repository
public class QueenDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	
	//글목록 조회
	public List<QueenVO> getChart(QueenVO vo){
		System.out.println("==>mybatis로 getChart() 기능처리 : " + vo.getChart_select());
		return mybatis.selectList("QueenDAO.getChart", vo);
	}
	
	
	
	public String weekTop() {
		return mybatis.selectOne("QueenDAO.getWeekTop");
	}
	
	public String weekAvg() {
		return mybatis.selectOne("QueenDAO.getWeekAvg");
	}
	
	public String weekTotal() {
		return mybatis.selectOne("QueenDAO.getWeekTotal");
	}
	
	
	
	public String monthTop() {
		return mybatis.selectOne("QueenDAO.getMonthTop");
	}
	
	public String monthAvg() {
		return mybatis.selectOne("QueenDAO.getMonthAvg");
	}
	
	public String monthTotal() {
		return mybatis.selectOne("QueenDAO.getMonthTotal");
	}
	

}
