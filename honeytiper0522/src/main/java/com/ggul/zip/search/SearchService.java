package com.ggul.zip.search;

import java.util.List;

import com.ggul.zip.lesson.LessonVO;

public interface SearchService {
	
	List<LessonVO> getSearchCate(LessonVO vo);
	
	List<LessonVO> getSearchAll(LessonVO vo);
	
	List<LessonVO> getPartSearchList(LessonVO vo);
	
	List<LessonVO> getSearchList(LessonVO vo);

}
