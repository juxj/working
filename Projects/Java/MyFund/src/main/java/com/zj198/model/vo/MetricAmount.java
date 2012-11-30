package com.zj198.model.vo;

public class MetricAmount {
	
	private String code;
	private Integer year;
	private Double value;
	
	//-----get   set-------------

	public String getCode() {
		return code;
	}
	public Integer getYear() {
		return year;
	}
	public Double getValue() {
		return value;
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
