package com.ggul.zip.queen;


public class QueenVO {

	private double sales_value;
	private String sales_date;
	private String chart_select;
	
	private String weektop_sales;
	private String weekavg_sales;
	private String weektotal_sales;
	
	private String monthtop_sales;
	private String monthavg_sales;
	private String monthtotal_sales;
	
	public double getSales_value() {
		return sales_value;
	}
	public void setSales_value(double sales_value) {
		this.sales_value = sales_value;
	}
	public String getSales_date() {
		return sales_date;
	}
	public void setSales_date(String sales_date) {
		this.sales_date = sales_date;
	}
	public String getChart_select() {
		return chart_select;
	}
	public void setChart_select(String chart_select) {
		this.chart_select = chart_select;
	}
	public String getWeektop_sales() {
		return weektop_sales;
	}
	public void setWeektop_sales(String weektop_sales) {
		this.weektop_sales = weektop_sales;
	}
	public String getWeekavg_sales() {
		return weekavg_sales;
	}
	public void setWeekavg_sales(String weekavg_sales) {
		this.weekavg_sales = weekavg_sales;
	}
	public String getWeektotal_sales() {
		return weektotal_sales;
	}
	public void setWeektotal_sales(String weektotal_sales) {
		this.weektotal_sales = weektotal_sales;
	}
	public String getMonthtop_sales() {
		return monthtop_sales;
	}
	public void setMonthtop_sales(String monthtop_sales) {
		this.monthtop_sales = monthtop_sales;
	}
	public String getMonthavg_sales() {
		return monthavg_sales;
	}
	public void setMonthavg_sales(String monthavg_sales) {
		this.monthavg_sales = monthavg_sales;
	}
	public String getMonthtotal_sales() {
		return monthtotal_sales;
	}
	public void setMonthtotal_sales(String monthtotal_sales) {
		this.monthtotal_sales = monthtotal_sales;
	}
	@Override
	public String toString() {
		return "QueenVO [sales_value=" + sales_value + ", sales_date=" + sales_date + ", chart_select=" + chart_select
				+ ", weektop_sales=" + weektop_sales + ", weekavg_sales=" + weekavg_sales + ", weektotal_sales="
				+ weektotal_sales + ", monthtop_sales=" + monthtop_sales + ", monthavg_sales=" + monthavg_sales
				+ ", monthtotal_sales=" + monthtotal_sales + "]";
	}
	
	
	
}
