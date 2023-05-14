package com.ggul.zip.lesson;

import java.util.HashMap;
import java.util.List;

import com.ggul.zip.escrow.EscrowVO;


public interface LessonDetailService {


	//글상세 조회
	LessonDetailVO getLessonDetail(LessonDetailVO ldvo);
	
	//글 상세 조회에 들어갈 강의 당 리뷰리스트
	List<ReviewVO> getReviewList(ReviewVO rvo);

	//글목록 조회
	List<LessonDetailVO> getLessonList(LessonDetailVO ldvo);
	
	//Ajax를 위한 총 리스트 가져오기
	List<ReviewVO> getTotalReviewList(HashMap<String, Object> map);
	
	double getSugarAvg(int lesson_num);
	int isDupEscrowLesson(EscrowVO evo);
}