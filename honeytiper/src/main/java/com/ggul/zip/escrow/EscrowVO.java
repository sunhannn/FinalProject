package com.ggul.zip.escrow;

import java.util.Date;

public class EscrowVO {

	private String escrow_user_id;
	private int escrow_tiper_code;
	private int escrow_lesson_num;
	private int escrow_status;
	private int escrow_price;
	private Date escrow_start;
	private Date escrow_end;
	
	private String startDate;
    private String endDate;
	
    private String tiper_user_id;
    private String lesson_title;
    
    private String search_condition;
    private String search_keyword;
    
    private int escrow_num;

    public int getEscrow_num() {
    		return escrow_num;
    	}
    	public void setEscrow_num(int escrow_num) {
    		this.escrow_num = escrow_num;
    	}
    
    
	public String getSearch_condition() {
		return search_condition;
	}
	public void setSearch_condition(String search_condition) {
		this.search_condition = search_condition;
	}
	public String getSearch_keyword() {
		return search_keyword;
	}
	public void setSearch_keyword(String search_keyword) {
		this.search_keyword = search_keyword;
	}
	public String getTiper_user_id() {
		return tiper_user_id;
	}
	public void setTiper_user_id(String tiper_user_id) {
		this.tiper_user_id = tiper_user_id;
	}
	public String getLesson_title() {
		return lesson_title;
	}
	public void setLesson_title(String lesson_title) {
		this.lesson_title = lesson_title;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getEscrow_user_id() {
		return escrow_user_id;
	}
	public void setEscrow_user_id(String escrow_user_id) {
		this.escrow_user_id = escrow_user_id;
	}
	public int getEscrow_tiper_code() {
		return escrow_tiper_code;
	}
	public void setEscrow_tiper_code(int escrow_tiper_code) {
		this.escrow_tiper_code = escrow_tiper_code;
	}
	public int getEscrow_lesson_num() {
		return escrow_lesson_num;
	}
	public void setEscrow_lesson_num(int escrow_lesson_num) {
		this.escrow_lesson_num = escrow_lesson_num;
	}
	public int getEscrow_status() {
		return escrow_status;
	}
	public void setEscrow_status(int escrow_status) {
		this.escrow_status = escrow_status;
	}
	public int getEscrow_price() {
		return escrow_price;
	}
	public void setEscrow_price(int escrow_price) {
		this.escrow_price = escrow_price;
	}
	public Date getEscrow_start() {
		return escrow_start;
	}
	public void setEscrow_start(Date escrow_start) {
		this.escrow_start = escrow_start;
	}
	public Date getEscrow_end() {
		return escrow_end;
	}
	public void setEscrow_end(Date escrow_end) {
		this.escrow_end = escrow_end;
	}
	@Override
	public String toString() {
		return "EscrowVO [escrow_user_id=" + escrow_user_id + ", escrow_tiper_code=" + escrow_tiper_code
				+ ", escrow_lesson_num=" + escrow_lesson_num + ", escrow_status=" + escrow_status + ", escrow_price="
				+ escrow_price + ", escrow_start=" + escrow_start + ", escrow_end=" + escrow_end + "]";
	}

	
	
}
