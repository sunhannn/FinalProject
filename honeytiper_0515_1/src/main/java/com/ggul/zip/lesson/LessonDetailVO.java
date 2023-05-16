package com.ggul.zip.lesson;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class LessonDetailVO {
	private int lesson_num;
	private int lesson_code_tiper;
	private String lesson_title;
	private String lesson_info;
	private String lesson_cate;
	private String lesson_img;
	private int lesson_sugar;
	private int lesson_onoff;
	private Date lesson_date;
	
	private String tiper_addr;
	private String user_name;
	private String user_email;
	private String tiper_info;
	private String tiper_user_id;
	private String tiper_code;
	private String tiper_img;
	
	public int getLesson_num() {
		return lesson_num;
	}
	public void setLesson_num(int lesson_num) {
		this.lesson_num = lesson_num;
	}
	public int getLesson_code_tiper() {
		return lesson_code_tiper;
	}
	public void setLesson_code_tiper(int lesson_code_tiper) {
		this.lesson_code_tiper = lesson_code_tiper;
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
	public int getLesson_sugar() {
		return lesson_sugar;
	}
	public void setLesson_sugar(int lesson_sugar) {
		this.lesson_sugar = lesson_sugar;
	}
	public int getLesson_onoff() {
		return lesson_onoff;
	}
	public void setLesson_onoff(int lesson_onoff) {
		this.lesson_onoff = lesson_onoff;
	}
	public Date getLesson_date() {
		return lesson_date;
	}
	public void setLesson_date(Date lesson_date) {
		this.lesson_date = lesson_date;
	}
	public String getTiper_addr() {
		return tiper_addr;
	}
	public void setTiper_addr(String tiper_addr) {
		this.tiper_addr = tiper_addr;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getTiper_info() {
		return tiper_info;
	}
	public void setTiper_info(String tiper_info) {
		this.tiper_info = tiper_info;
	}
	public String getTiper_user_id() {
		return tiper_user_id;
	}
	public void setTiper_user_id(String tiper_user_id) {
		this.tiper_user_id = tiper_user_id;
	}
	public String getTiper_img() {
		return tiper_img;
	}
	public void setTiper_img(String tiper_img) {
		this.tiper_img = tiper_img;
	}
	public String getTiper_code() {
		return tiper_code;
	}
	public void setTiper_code(String tiper_code) {
		this.tiper_code = tiper_code;
	}
	@Override
	public String toString() {
		return "LessonDetailVO [lesson_num=" + lesson_num + ", lesson_code_tiper=" + lesson_code_tiper
				+ ", lesson_title=" + lesson_title + ", lesson_info=" + lesson_info + ", lesson_cate=" + lesson_cate
				+ ", lesson_img=" + lesson_img + ", lesson_sugar=" + lesson_sugar + ", lesson_onoff=" + lesson_onoff
				+ ", lesson_date=" + lesson_date + ", tiper_addr=" + tiper_addr + ", user_name=" + user_name
				+ ", user_email=" + user_email + ", tiper_info=" + tiper_info + ", tiper_user_id=" + tiper_user_id
				+ ", tiper_code=" + tiper_code + ", tiper_img=" + tiper_img + ", getLesson_num()=" + getLesson_num()
				+ ", getLesson_code_tiper()=" + getLesson_code_tiper() + ", getLesson_title()=" + getLesson_title()
				+ ", getLesson_info()=" + getLesson_info() + ", getLesson_cate()=" + getLesson_cate()
				+ ", getLesson_img()=" + getLesson_img() + ", getLesson_sugar()=" + getLesson_sugar()
				+ ", getLesson_onoff()=" + getLesson_onoff() + ", getLesson_date()=" + getLesson_date()
				+ ", getTiper_addr()=" + getTiper_addr() + ", getUser_name()=" + getUser_name() + ", getUser_email()="
				+ getUser_email() + ", getTiper_info()=" + getTiper_info() + ", getTiper_user_id()="
				+ getTiper_user_id() + ", getTiper_img()=" + getTiper_img() + ", getTiper_code()=" + getTiper_code()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}

	
	
	
	
}
