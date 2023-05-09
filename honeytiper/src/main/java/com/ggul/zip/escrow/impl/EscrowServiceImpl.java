package com.ggul.zip.escrow.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ggul.zip.escrow.EscrowService;
import com.ggul.zip.escrow.EscrowVO;

@Service("escrowService")
public class EscrowServiceImpl implements EscrowService {

	@Autowired
	private EscrowDAO mybatis;
	
	@Override
	public List<EscrowVO> getEscrowList(EscrowVO vo) {
		return mybatis.getEscrowList(vo);
	}
	public List<EscrowVO> getEscrowListByStatus(EscrowVO vo){
		return mybatis.getEscrowListByStatus(vo);
	}
}
