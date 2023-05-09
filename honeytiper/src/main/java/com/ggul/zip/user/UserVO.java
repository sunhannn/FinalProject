package com.ggul.zip.user;

import java.util.Date;

public class UserVO {
	
	private String user_id;
	private String user_name;
	private String user_pw;
	private String user_addr1;
	private String user_addr2;
	private String user_addr3;
	private String user_addr4;
	private String user_tel;
	private String user_email;
	private Date user_date;
	private int user_role;
	private String user_cate;
	private int user_point; 
	
	
	//소연누나부분
	private String user_search;
	private String user_condition;
	
	//정성현부분
	private int tiper_agree;
	private String tiper_img;
	private Date tiper_date;
	private String tiper_cate1;
	private String report_cont;
	private String report_date;
	private String report_lesson_num;
	private int report_num;
	
	
	public String getUser_search() {
		return user_search;
	}
	public void setUser_search(String user_search) {
		this.user_search = user_search;
	}
	public String getUser_condition() {
		return user_condition;
	}
	public void setUser_condition(String user_condition) {
		this.user_condition = user_condition;
	}
	
	
	
	
	
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_addr1() {
		return user_addr1;
	}
	public void setUser_addr1(String user_addr1) {
		this.user_addr1 = user_addr1;
	}
	public String getUser_addr2() {
		return user_addr2;
	}
	public void setUser_addr2(String user_addr2) {
		this.user_addr2 = user_addr2;
	}
	public String getUser_addr3() {
		return user_addr3;
	}
	public void setUser_addr3(String user_addr3) {
		this.user_addr3 = user_addr3;
	}
	public String getUser_addr4() {
		return user_addr4;
	}
	public void setUser_addr4(String user_addr4) {
		this.user_addr4 = user_addr4;
	}
	public String getUser_tel() {
		return user_tel;
	}
	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public Date getUser_date() {
		return user_date;
	}
	public void setUser_date(Date user_date) {
		this.user_date = user_date;
	}
	public int getUser_role() {
		return user_role;
	}
	public void setUser_role(int user_role) {
		this.user_role = user_role;
	}
	public String getUser_cate() {
		return user_cate;
	}
	public void setUser_cate(String user_cate) {
		this.user_cate = user_cate;
	}
	public int getUser_point() {
		return user_point;
	}
	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}
	
	public int getTiper_agree() {
		return tiper_agree;
	}
	public void setTiper_agree(int tiper_agree) {
		this.tiper_agree = tiper_agree;
	}
	public String getTiper_img() {
		return tiper_img;
	}
	public void setTiper_img(String tiper_img) {
		this.tiper_img = tiper_img;
	}
	public Date getTiper_date() {
		return tiper_date;
	}
	public void setTiper_date(Date tiper_date) {
		this.tiper_date = tiper_date;
	}
	public String getTiper_cate1() {
		return tiper_cate1;
	}
	public void setTiper_cate1(String tiper_cate1) {
		this.tiper_cate1 = tiper_cate1;
	}
	public String getReport_cont() {
		return report_cont;
	}
	public void setReport_cont(String report_cont) {
		this.report_cont = report_cont;
	}
	public String getReport_date() {
		return report_date;
	}
	public void setReport_date(String report_date) {
		this.report_date = report_date;
	}
	public String getReport_lesson_num() {
		return report_lesson_num;
	}
	public void setReport_lesson_num(String report_lesson_num) {
		this.report_lesson_num = report_lesson_num;
	}
	public int getReport_num() {
		return report_num;
	}
	public void setReport_num(int report_num) {
		this.report_num = report_num;
	}
	@Override
	public String toString() {
		return "UserVO [user_id=" + user_id + ", user_name=" + user_name + ", user_pw=" + user_pw + ", user_addr1="
				+ user_addr1 + ", user_addr2=" + user_addr2 + ", user_addr3=" + user_addr3 + ", user_addr4="
				+ user_addr4 + ", user_tel=" + user_tel + ", user_email=" + user_email + ", user_date=" + user_date
				+ ", user_role=" + user_role + ", user_cate=" + user_cate + ", user_point=" + user_point
				+ ", user_search=" + user_search + ", user_condition=" + user_condition + ", tiper_agree=" + tiper_agree
				+ ", tiper_img=" + tiper_img + ", tiper_date=" + tiper_date + ", tiper_cate1=" + tiper_cate1
				+ ", report_cont=" + report_cont + ", report_date=" + report_date + ", report_lesson_num="
				+ report_lesson_num + ", report_num=" + report_num + "]";
	}
	
}
