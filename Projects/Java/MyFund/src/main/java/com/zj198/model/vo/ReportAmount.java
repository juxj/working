package com.zj198.model.vo;

public class ReportAmount {
	
	private String rpt;
	private String code;
	private Integer year;
	private Double value;
	
	//-----get   set-------------
	public String getRpt() {
		return rpt;
	}
	public String getCode() {
		return code;
	}
	public Integer getYear() {
		return year;
	}
	public Double getValue() {
		return value;
	}
	public void setRpt(String rpt) {
		this.rpt = rpt;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public void setYear(Integer year) {
		this.year = year;
	}
	public void setValue(Double value) {
		this.value = value;
	}
}
