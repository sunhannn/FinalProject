package com.ggul.zip.faq.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ggul.zip.faq.FaqService;
import com.ggul.zip.faq.FaqVO;


@Service("faqService")
public class FaqServiceImpl implements FaqService{

	@Autowired
	private FaqDAO mybatis;
	
	
	@Override
	public void insertFaq(FaqVO vo) {
		mybatis.insertFaq(vo);
	}

	@Override
	public void updateFaq(FaqVO vo) {
		mybatis.updateFaq(vo);
	}

	@Override
	public void deleteFaq(FaqVO vo) {
		mybatis.deleteFaq(vo);
	}

	@Override
	public List<FaqVO> getFaqList(FaqVO vo) {
		return mybatis.getFaqList(vo);
	}

	@Override
	public FaqVO getFaq(FaqVO vo) {
		return mybatis.getFaq(vo);
	}

	
	
}
