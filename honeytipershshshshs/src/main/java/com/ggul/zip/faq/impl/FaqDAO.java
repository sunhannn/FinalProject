package com.ggul.zip.faq.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ggul.zip.faq.FaqVO;

@Repository
public class FaqDAO {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	//글상세조회
	public FaqVO getFaq(FaqVO vo) {
		return mybatis.selectOne("FaqDAO.getFaq",vo);
	}
	
	
	//글목록 조회
	public List<FaqVO> getFaqList(FaqVO vo){
		return mybatis.selectList("FaqDAO.getFaqList", vo);
	}
	
	// 글 등록
	public void insertFaq(FaqVO vo) {
		mybatis.insert("FaqDAO.insertFaq", vo);
	}
	
	// 글 수정
	public void updateFaq(FaqVO vo) {
		mybatis.update("FaqDAO.updateFaq", vo);
	}
	
	// 글 삭제
	public void deleteFaq(FaqVO vo) {
		mybatis.insert("FaqDAO.deleteFaq", vo);
	}
	
}
