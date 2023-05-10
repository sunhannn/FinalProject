package com.ggul.zip.notice;

public class NoticeVO {
	private int notice_num;
	private String notice_title;
	private String notice_cont;
	private String notice_date;
	private int notice_readcount;
	private int notice_pin;
	
	private String notice_search;
	private String notice_condition;
	
	private String notice_start;
	private String notice_end;
	
	public String getNotice_start() {
		return notice_start;
	}
	public void setNotice_start(String notice_start) {
		this.notice_start = notice_start;
	}
	public String getNotice_end() {
		return notice_end;
	}
	public void setNotice_end(String notice_end) {
		this.notice_end = notice_end;
	}
	public String getNotice_condition() {
		return notice_condition;
	}
	public void setNotice_condition(String notice_condition) {
		this.notice_condition = notice_condition;
	}
	public String getNotice_search() {
		return notice_search;
	}
	public void setNotice_search(String notice_search) {
		this.notice_search = notice_search;
	}
	
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_cont() {
		return notice_cont;
	}
	public void setNotice_cont(String notice_cont) {
		this.notice_cont = notice_cont;
	}
	public String getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}
	public int getNotice_readcount() {
		return notice_readcount;
	}
	public void setNotice_readcount(int notice_readcount) {
		this.notice_readcount = notice_readcount;
	}
	public int getNotice_pin() {
		return notice_pin;
	}
	public void setNotice_pin(int notice_pin) {
		this.notice_pin = notice_pin;
	}
	
}
