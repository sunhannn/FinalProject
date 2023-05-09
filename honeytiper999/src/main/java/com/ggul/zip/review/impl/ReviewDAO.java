package com.ggul.zip.review.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ggul.zip.review.ReviewVO;

@Repository
public class ReviewDAO {

	@Autowired
	SqlSessionTemplate mybatis;

	int reviewInsert(ReviewVO reviewVO) {

		return mybatis.insert("reviewDAO.reviewInsert", reviewVO);

	}

}
