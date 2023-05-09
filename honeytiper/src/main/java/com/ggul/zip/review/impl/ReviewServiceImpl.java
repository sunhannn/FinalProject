package com.ggul.zip.review.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ggul.zip.review.ReviewService;
import com.ggul.zip.review.ReviewVO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDAO reviewDAO;

	@Override
	public int ReviewInsert(ReviewVO reviewVO) {
		return reviewDAO.reviewInsert(reviewVO);
	}
}
