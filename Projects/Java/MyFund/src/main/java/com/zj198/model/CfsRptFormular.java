package com.zj198.model;

public class CfsRptFormular {

	private String id;
	private String rpt;
	private String code;
	private Integer year;
	private Integer type;
	private Double value;
	private String formular;
	private Integer ignore;
	private String metric;
	
	public String getMetric() {
		return metric;
	}
	public void setMetric(String metric) {
		this.metric = metric;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRpt() {
		return rpt;
	}
	public void setRpt(String rpt) {
		this.rpt = rpt;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Integer getYear() {
		return year;
	}
	public void setYear(Integer year) {
		this.year = year;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Double getValue() {
		return value;
	}
	public void setValue(Double value) {
		this.value = value;
	}
	public String getFormular() {
		return formular;
	}
	public void setFormular(String formular) {
		this.formular = formular;
	}
	public Integer getIgnore() {
		return ignore;
	}
	public void setIgnore(Integer ignore) {
		this.ignore = ignore;
	}

}
