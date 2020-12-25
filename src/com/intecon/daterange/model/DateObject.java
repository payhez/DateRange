package com.intecon.daterange.model;

public class DateObject {
	
	private String startDate;
	private String endDate;
	
	public DateObject(String startDate, String endDate) {
		super();
		this.startDate = startDate;
		this.endDate = endDate;
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
	
	
}
