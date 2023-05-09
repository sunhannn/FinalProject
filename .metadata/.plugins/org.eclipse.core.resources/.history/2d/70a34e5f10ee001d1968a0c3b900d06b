package com.ggul.zip.tiper.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ggul.zip.tiper.TiperService;
import com.ggul.zip.tiper.TiperVO;

@Service("tiperService")
public class TiperServiceImpl implements TiperService {

	@Autowired
	private TiperDAO tiperDAO;

	@Override
	public int insertTiper(TiperVO tiperVO) {

		return tiperDAO.tiperInsert(tiperVO);
	}

	@Override
	public TiperVO selectTiper(TiperVO tiperVO) {

		return tiperDAO.selectTiper(tiperVO);
	}

	@Override
	public int tiperUpdate(TiperVO tiperVO) {

		return tiperDAO.tiperUpdate(tiperVO);
	}

	@Override
	public int selecTiperCount(TiperVO tiperVO) {
		return tiperDAO.selectTiperCount(tiperVO);
	}

	@Override
	public int tiperInitialization(TiperVO tiperVO) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	
	//상현이부분
	@Override
	public TiperVO selectTiperInfo(TiperVO tiperVO) {

		return tiperDAO.selectTiper(tiperVO);
	}
	
}
