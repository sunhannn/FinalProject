package com.ggul.zip.lesson.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ggul.zip.escrow.EscrowVO;
import com.ggul.zip.lesson.LessonDetailService;
import com.ggul.zip.lesson.LessonDetailVO;
import com.ggul.zip.lesson.ReviewVO;



@Service("lessonDetailService")
public class LessonDetailServiceImpl implements LessonDetailService {
	
	@Autowired
	private LessonDetailDAO lessonDAO;

	@Override
	public LessonDetailVO getLessonDetail(LessonDetailVO ldvo) {
//		boardDAO.updateCnt(ldvo);
		return lessonDAO.getLessonDetail(ldvo);
	}
	
	@Override
	public List<ReviewVO> getReviewList(ReviewVO rvo) {
		return lessonDAO.getReviewList(rvo);
	}

	@Override
	public List<LessonDetailVO> getLessonList(LessonDetailVO ldvo) {
		return lessonDAO.getLessonList(ldvo);
	}
	
	//Ajax를 위한 총 리스트 가져오기
	@Override
	public List<ReviewVO> getTotalReviewList(HashMap<String, Object> map){
		return lessonDAO.getTotalReviewList(map);
	}
	
	@Override
	public double getSugarAvg(int lesson_num) {
		return lessonDAO.getSugarAvg(lesson_num);
	}
	
	@Override
	public int isDupEscrowLesson (EscrowVO evo){
		int result = lessonDAO.isDupEscrowLesson(evo);
		return result;
	}
	

	

}
