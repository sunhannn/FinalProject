package com.ggul.zip.tiper.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ggul.zip.tiper.TiperVO;

@Repository
public class TiperDAO {

	@Autowired
	SqlSessionTemplate mybatis;

	int tiperInsert(TiperVO tiperVO) {
		return mybatis.insert("TiperDAO.tiperInsert", tiperVO);
	}

	TiperVO selectTiper(TiperVO tiperVO) {
		return mybatis.selectOne("TiperDAO.selectTiperInfo", tiperVO);
	}

	int tiperUpdate(TiperVO tiperVO) {
		return mybatis.update("TiperDAO.tiperUpdate", tiperVO);
	}

	int selectTiperCount(TiperVO tiperVO) {
		return mybatis.selectOne("TiperDAO.selectTiper", tiperVO);
	}

	int tiperInitialization(TiperVO tiperVO) {
		return mybatis.update("TiperDAO.tiperInitialization", tiperVO);
	}

}
