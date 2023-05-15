package com.ggul.zip.lesson;

import java.sql.Date;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class LessonVO {
	private int lesson_num;
	private int lesson_tiper_code;
	private String lesson_user_id;
	private String lesson_title;
	private String lesson_info;
	private String lesson_cate;
	private String lesson_img;
	private int lesson_onoff;
	private String lesson_date;



	// 여기서 부터
	private String lesson_user_name;			// users테이블의 user_name 사용위해 추가
	private String tiper_addr; 			// tiper테이블의 tiper_addr 사용위해 추가
	private String lesson_search;		// index에서 검색어 넘어오는 값 받으려고 추가
	private String search_detail;		// index에서 검색어 넘어오는 값 받으려고 추가
	private String search_keyword;		// index에서 검색어 넘어오는 값 받으려고 추가
	private double review_score; 		// main-mapping.xml에서 사용위해 추가
	private String user_id;
	
	
	
	//소연누나부분
	
	private MultipartFile uploadFile;
	private String tiper_user_id; //강사아이디 (강의/강사 List)
	private String tiper_info;  //강사소개 (강의/강사 List)
	private double review_sugar; //당도평점 (강의/강사 List)
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	public String getTiper_user_id() {
		return tiper_user_id;
	}

	public void setTiper_user_id(String tiper_user_id) {
		this.tiper_user_id = tiper_user_id;
	}

	public String getTiper_info() {
		return tiper_info;
	}

	public void setTiper_info(String tiper_info) {
		this.tiper_info = tiper_info;
	}

	public double getReview_sugar() {
		return review_sugar;
	}

	public void setReview_sugar(double review_sugar) {
		this.review_sugar = review_sugar;
	}

	
	
	
	
	
	
	
	public String getLesson_condition() {
		return lesson_condition;
	}

	public void setLesson_condition(String lesson_condition) {
		this.lesson_condition = lesson_condition;
	}

	private String lesson_condition;
	


	public String getLesson_user_name() {
		return lesson_user_name;
	}

	public void setLesson_user_name(String lesson_user_name) {
		this.lesson_user_name = lesson_user_name;
	}

	public String getTiper_addr() {
		return tiper_addr;
	}

	public void setTiper_addr(String tiper_addr) {
		this.tiper_addr = tiper_addr;
	}

	public String getLesson_search() {
		return lesson_search;
	}

	public void setLesson_search(String lesson_search) {
		this.lesson_search = lesson_search;
	}
	
	public String getSearch_detail() {
		return search_detail;
	}

	public void setSearch_detail(String search_detail) {
		this.search_detail = search_detail;
	}
	
	public String getSearch_keyword() {
		return search_keyword;
	}

	public void setSearch_keyword(String search_keyword) {
		this.search_keyword = search_keyword;
	}

	public double getReview_score() {
		return review_score;
	}

	public void setReview_score(double review_score) {
		this.review_score = review_score;
	}
	
	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	// 여기까지 추가됨

	
	
	public int getLesson_num() {
		return lesson_num;
	}

	public void setLesson_num(int lesson_num) {
		this.lesson_num = lesson_num;
	}

	public int getLesson_tiper_code() {
		return lesson_tiper_code;
	}

	public void setLesson_tiper_code(int lesson_tiper_code) {
		this.lesson_tiper_code = lesson_tiper_code;
	}

	public String getLesson_user_id() {
		return lesson_user_id;
	}

	public void setLesson_user_id(String lesson_user_id) {
		this.lesson_user_id = lesson_user_id;
	}

	public String getLesson_title() {
		return lesson_title;
	}

	public void setLesson_title(String lesson_title) {
		this.lesson_title = lesson_title;
	}

	public String getLesson_info() {
		return lesson_info;
	}

	public void setLesson_info(String lesson_info) {
		this.lesson_info = lesson_info;
	}

	public String getLesson_cate() {
		return lesson_cate;
	}

	public void setLesson_cate(String lesson_cate) {
		this.lesson_cate = lesson_cate;
	}

	public String getLesson_img() {
		return lesson_img;
	}

	public void setLesson_img(String lesson_img) {
		this.lesson_img = lesson_img;
	}

	public int getLesson_onoff() {
		return lesson_onoff;
	}

	public void setLesson_onoff(int lesson_onoff) {
		this.lesson_onoff = lesson_onoff;
	}

	public String getLesson_date() {
		return lesson_date;
	}

	public void setLesson_date(String lesson_date) {
		this.lesson_date = lesson_date;
	}
	
	
}