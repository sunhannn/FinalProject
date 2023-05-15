package com.ggul.zip.payment;

import java.util.Date;

public class PointVO {

	private int point_num;
	private String point_id;
	private int point_price;
	private String point_history;
	private Date point_time;
	private int user_point;
	private String user_id;
	
	
	private String searchCondition;
    private String searchKeyword;
   
    private String startDate;
    private String endDate;
    
    private String price_type;
    
    private String search_condition;
    private String search_keyword;
    
	
    
    
    
    
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
	public String getPrice_type() {
		return price_type;
	}
	public void setPrice_type(String price_type) {
		this.price_type = price_type;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public int getPoint_num() {
		return point_num;
	}
	public void setPoint_num(int point_num) {
		this.point_num = point_num;
	}
	public String getPoint_id() {
		return point_id;
	}
	public void setPoint_id(String point_id) {
		this.point_id = point_id;
	}
	public int getPoint_price() {
		return point_price;
	}
	public void setPoint_price(int point_price) {
		this.point_price = point_price;
	}
	public String getPoint_history() {
		return point_history;
	}
	public void setPoint_history(String point_history) {
		this.point_history = point_history;
	}
	public Date getPoint_time() {
		return point_time;
	}
	public void setPoint_time(Date point_time) {
		this.point_time = point_time;
	}
	public int getUser_point() {
		return user_point;
	}
	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	@Override
	public String toString() {
		return "PointVO [point_num=" + point_num + ", point_id=" + point_id + ", point_price=" + point_price
				+ ", point_history=" + point_history + ", point_time=" + point_time + ", user_point=" + user_point
				+ ", user_id=" + user_id + "]";
	}

	
}
