package com.ggul.zip.user;

import java.sql.Date;

public class ReportVO {
	
	private int report_num;
	private String report_user_id;
	private String report_cont;
	private Date report_date;
	private int report_lesson_num;
	private String report_reported_id;
	private String report_reported_name;
	private int report_status;
	
	public int getReport_num() {
		return report_num;
	}
	public void setReport_num(int report_num) {
		this.report_num = report_num;
	}
	public String getReport_user_id() {
		return report_user_id;
	}
	public void setReport_user_id(String report_user_id) {
		this.report_user_id = report_user_id;
	}
	public String getReport_cont() {
		return report_cont;
	}
	public void setReport_cont(String report_cont) {
		this.report_cont = report_cont;
	}
	public Date getReport_date() {
		return report_date;
	}
	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}
	public int getReport_lesson_num() {
		return report_lesson_num;
	}
	public void setReport_lesson_num(int report_lesson_num) {
		this.report_lesson_num = report_lesson_num;
	}
	public String getReport_reported_id() {
		return report_reported_id;
	}
	public void setReport_reported_id(String report_reported_id) {
		this.report_reported_id = report_reported_id;
	}
	public String getReport_reported_name() {
		return report_reported_name;
	}
	public void setReport_reported_name(String report_reported_name) {
		this.report_reported_name = report_reported_name;
	}
	public int getReport_status() {
		return report_status;
	}
	public void setReport_status(int report_status) {
		this.report_status = report_status;
	}
	@Override
	public String toString() {
		return "ReportVO [report_num=" + report_num + ", report_user_id=" + report_user_id + ", report_cont="
				+ report_cont + ", report_date=" + report_date + ", report_lesson_num=" + report_lesson_num
				+ ", report_reported_id=" + report_reported_id + ", report_reported_name=" + report_reported_name
				+ ", report_status=" + report_status + "]";
	}

}

	
	
