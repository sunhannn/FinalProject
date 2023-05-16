package com.ggul.zip.lesson.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.ObjectUtils;

import com.ggul.zip.escrow.EscrowVO;
import com.ggul.zip.lesson.LessonDetailVO;
import com.ggul.zip.lesson.ReviewVO;


@Repository
public class LessonDetailDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	//글상세 조회
	public LessonDetailVO getLessonDetail(LessonDetailVO ldvo) {
		return (LessonDetailVO) mybatis.selectOne("LessonDAO.getLessonDetail", ldvo);
	}
	
	public List<ReviewVO> getReviewList(ReviewVO rvo) {
		return mybatis.selectList("LessonDAO.getReviewList", rvo);
	}
	
	//글목록 조회
	public List<LessonDetailVO> getLessonList(LessonDetailVO ldvo) {
		return mybatis.selectList("LessonDAO.getLessonList", ldvo);
	}
	
	//Ajax를 위한 총 리뷰 리스트 가져오기
	public List<ReviewVO> getTotalReviewList(HashMap<String, Object> map){
		return mybatis.selectList("LessonDAO.getTotalReviewList", map);
	}
	
	//달아요 평점 가져오기
		public double getSugarAvg(int lesson_num) {
			if(mybatis.selectOne("LessonDAO.getSugarAvg", lesson_num) == null) {
			return 98.98;
			}else {
			return mybatis.selectOne("LessonDAO.getSugarAvg", lesson_num);
			}
		}
		
		// 중복된 수강신청 내역 있는지 확인
		public int isDupEscrowLesson(EscrowVO vo) {
			System.out.println("===>mybatis로 isDupEscrowLesson() 기능처리");

			Object result = mybatis.selectList("LessonDAO.isDupEscrowLesson", vo);

			if (ObjectUtils.isEmpty(result) == false) {
				return 1;
			} else {
				return 0;
			}
		}
			

}