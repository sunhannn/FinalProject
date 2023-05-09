package com.ggul.zip.escrow.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ggul.zip.escrow.EscrowVO;


@Repository
public class EscrowDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	public List<EscrowVO> getEscrowList(EscrowVO vo){
		System.out.println("에스크로 리스트 다오를 가는가");
		return mybatis.selectList("EscrowDAO.getEscrowList", vo);
	}
	
	public List<EscrowVO> getEscrowListByStatus(EscrowVO vo){
		return mybatis.selectList("EscrowDAO.getEscrowListByStatus", vo);
	}
}
