package com.ggul.zip.lesson.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ggul.zip.lesson.LessonService;
import com.ggul.zip.lesson.LessonVO;

@Service("lessonService")
public class LessonServiceImpl implements LessonService {
	@Autowired
	private LessonDAO lessonDAO;

	@Override
	public List<LessonVO> getUserLessonList(LessonVO lessonVO) {
		return lessonDAO.getUserLessonList(lessonVO);
	}

	@Override
	public List<LessonVO> selectLessonTiper(LessonVO lessonVO) {

		return lessonDAO.selectselectLessonTiper(lessonVO);
	}

	@Override
	public List<LessonVO> selectLessonName(LessonVO lessonVO) {
		return lessonDAO.selectLessonName(lessonVO);
	}

	@Override
	public LessonVO selectLessonNum(LessonVO lessonVO) {

		return lessonDAO.selectLessonNum(lessonVO);
	}

	@Override
	public int lessonUpdate(LessonVO lessonVO) {
		return lessonDAO.lessonUpdate(lessonVO);
	}

	@Override
	public int lessonMake(LessonVO lessonVO) {
		return lessonDAO.lessonMake(lessonVO);
	}

	
	
	//소연누나부분
	@Override
	public LessonVO getLesson(LessonVO vo) {
		return lessonDAO.getLesson(vo);
	}

	@Override
	public List<LessonVO> getLessonList(LessonVO vo) {
		return lessonDAO.getLessonList(vo);
	}
	
	@Override
	public ArrayList<LessonVO> getLessonListPostSearch(HashMap<String,Object> map){
		return (ArrayList<LessonVO>) lessonDAO.getLessonListPostSearch(map);
	}
}
