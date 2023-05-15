package com.ggul.zip.search.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ggul.zip.lesson.LessonVO;

@Repository
public class SearchDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public List<LessonVO> getSearchCate(LessonVO vo){
		return mybatis.selectList("SearchDAO.getSearchCate", vo);
	}
	
	public List<LessonVO> getSearchAll(LessonVO vo){
		return mybatis.selectList("SearchDAO.getSearchAll", vo);
	}

	public List<LessonVO> getPartSearchList(LessonVO vo) {
		return mybatis.selectList("SearchDAO.getPartSearchList", vo);
	}
	
	public List<LessonVO> getSearchList(LessonVO vo) {
		return mybatis.selectList("SearchDAO.getSearchList", vo);
	}
	
	
	
}
