package com.ggul.zip.queen.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ggul.zip.faq.impl.FaqDAO;
import com.ggul.zip.queen.QueenService;
import com.ggul.zip.queen.QueenVO;


@Service("queenService")
public class QueenServiceImpl implements QueenService{
	
	@Autowired
	private QueenDAO mybatis;

	public List<QueenVO> getChart(QueenVO vo) {
		return mybatis.getChart(vo);
	}
	
	public String weekTop() {
		return mybatis.weekTop();
	}

	public String weekAvg() {
		return mybatis.weekAvg();
	}

	public String weekTotal() {
		return mybatis.weekTotal();
	}

	public String monthTop() {
		return mybatis.monthTop();
		
	}

	public String monthAvg() {
		return mybatis.monthAvg();
		
	}

	public String monthTotal() {
		return mybatis.monthTotal();
		
	}


}
