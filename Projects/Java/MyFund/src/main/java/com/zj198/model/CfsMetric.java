package com.zj198.model;

/**
 * CfsMetric entity. @author MyEclipse Persistence Tools
 */

public class CfsMetric implements java.io.Serializable {

	// Fields

	private Integer id;
	private String code;
	private String name;
	private String parentId;
	private Boolean isRpt;
	private String years;
	private String formular;
	private String comments;
	private String usedItems;
	private String fixedItems;
	private String valueItems;
	private String measurementInterval;
	private String status;

	// Constructors

	/** default constructor */
	public CfsMetric() {
	}

	/** full constructor */
	public CfsMetric(String code, String name, String parentId, Boolean isRpt,
			String years, String formular, String comments, String usedItems,
			String fixedItems, String valueItems, String measurementInterval,
			String status) {
		this.code = code;
		this.name = name;
		this.parentId = parentId;
		this.isRpt = isRpt;
		this.years = years;
		this.formular = formular;
		this.comments = comments;
		this.usedItems = usedItems;
		this.fixedItems = fixedItems;
		this.valueItems = valueItems;
		this.measurementInterval = measurementInterval;
		this.status = status;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getParentId() {
		return this.parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public Boolean getIsRpt() {
		return this.isRpt;
	}

	public void setIsRpt(Boolean isRpt) {
		this.isRpt = isRpt;
	}

	public String getYears() {
		return this.years;
	}

	public void setYears(String years) {
		this.years = years;
	}

	public String getFormular() {
		return this.formular;
	}

	public void setFormular(String formular) {
		this.formular = formular;
	}

	public String getComments() {
		return this.comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getUsedItems() {
		return this.usedItems;
	}

	public void setUsedItems(String usedItems) {
		this.usedItems = usedItems;
	}

	public String getFixedItems() {
		return this.fixedItems;
	}

	public void setFixedItems(String fixedItems) {
		this.fixedItems = fixedItems;
	}

	public String getValueItems() {
		return this.valueItems;
	}

	public void setValueItems(String valueItems) {
		this.valueItems = valueItems;
	}

	public String getMeasurementInterval() {
		return this.measurementInterval;
	}

	public void setMeasurementInterval(String measurementInterval) {
		this.measurementInterval = measurementInterval;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}