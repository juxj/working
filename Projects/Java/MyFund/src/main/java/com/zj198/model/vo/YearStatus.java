package com.zj198.model.vo;

import java.util.List;

public class YearStatus {
	
	private Integer year;
	private String version;
	
	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	private List<RptStatus> data;
	
	public Integer getYear(){
		return year;
	}
	
	public void setYear(Integer year){
		this.year = year;
	}
	
	public List<RptStatus> getData(){
		return this.data;
	}
	
	public void setData(List<RptStatus> data){
		this.data = data;
	}
}
