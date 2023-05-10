package com.ggul.zip.review.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ggul.zip.lesson.ReviewVO;
import com.ggul.zip.user.ReportVO;

@Repository
public class ReviewDAO {

	@Autowired
	SqlSessionTemplate mybatis;

	int reviewInsert(ReviewVO reviewVO) {

		return mybatis.insert("reviewDAO.reviewInsert", reviewVO);

	}
	
	// TIPER_AGREE를 1로 업데이트
			public void reportLessonNum(ReportVO vo) {
				System.out.println("===>mybatis로 reportLessonNum() 기능처리");

				mybatis.update("UserDAO.reportLessonNum", vo);
			}

}
