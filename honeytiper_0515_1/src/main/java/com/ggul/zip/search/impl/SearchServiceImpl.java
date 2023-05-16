package com.ggul.zip.search.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ggul.zip.lesson.LessonVO;
import com.ggul.zip.search.SearchService;

@Service("searchService")
public class SearchServiceImpl implements SearchService{

	@Autowired
	private SearchDAO searchDAO;
	
	public List<LessonVO> getSearchCate(LessonVO vo){
		return searchDAO.getSearchCate(vo);
	}
	
	public List<LessonVO> getSearchAll(LessonVO vo){
		return searchDAO.getSearchAll(vo);
	}
	
	public List<LessonVO> getPartSearchList(LessonVO vo){
		return searchDAO.getPartSearchList(vo);
	}

	public List<LessonVO> getSearchList(LessonVO vo){
		return searchDAO.getSearchList(vo);
	}
}
