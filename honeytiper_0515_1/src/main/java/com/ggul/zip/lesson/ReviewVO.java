package com.ggul.zip.lesson;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class ReviewVO {
	private int review_num;
	private int review_lesson_num;
	private String review_cont;
	private String review_writer;
	private int review_sugar;
	private Date review_date;
	
	private int lesson_num;
	private double review_sugarAvg;
	private String select_key;
	
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public int getReview_lesson_num() {
		return review_lesson_num;
	}
	public void setReview_lesson_num(int review_lesson_num) {
		this.review_lesson_num = review_lesson_num;
	}
	public String getReview_cont() {
		return review_cont;
	}
	public void setReview_cont(String review_cont) {
		this.review_cont = review_cont;
	}
	public String getReview_writer() {
		return review_writer;
	}
	public void setReview_writer(String review_writer) {
		this.review_writer = review_writer;
	}
	public int getReview_sugar() {
		return review_sugar;
	}
	public void setReview_sugar(int review_sugar) {
		this.review_sugar = review_sugar;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public int getLesson_num() {
		return lesson_num;
	}
	public void setLesson_num(int lesson_num) {
		this.lesson_num = lesson_num;
	}
	public double getReview_sugarAvg() {
		return review_sugarAvg;
	}
	public void setReview_sugarAvg(double review_sugarAvg) {
		this.review_sugarAvg = review_sugarAvg;
	}

	public String getSelect_key() {
		return select_key;
	}
	public void setSelect_key(String select_key) {
		this.select_key = select_key;
	}
	@Override
	public String toString() {
		return "ReviewVO [review_num=" + review_num + ", review_lesson_num=" + review_lesson_num + ", review_cont="
				+ review_cont + ", review_writer=" + review_writer + ", review_sugar=" + review_sugar + ", review_date="
				+ review_date + ", lesson_num=" + lesson_num + ", review_sugarAvg=" + review_sugarAvg + "]";
	}

	
}
