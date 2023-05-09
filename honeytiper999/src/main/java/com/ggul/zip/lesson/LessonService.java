package com.ggul.zip.lesson;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface LessonService {
	List<LessonVO> getUserLessonList(LessonVO lessonVO);

	List<LessonVO> selectLessonTiper(LessonVO lessonVO);

	List<LessonVO> selectLessonName(LessonVO lessonVO);

	LessonVO selectLessonNum(LessonVO lessonVO);

	int lessonUpdate(LessonVO lessonVO);

	int lessonMake(LessonVO lessonVO);
	
	
	//소연누나부분
	LessonVO getLesson(LessonVO vo);


	List<LessonVO> getLessonList(LessonVO vo);


	ArrayList<LessonVO> getLessonListPostSearch(HashMap<String, Object> map);
}
