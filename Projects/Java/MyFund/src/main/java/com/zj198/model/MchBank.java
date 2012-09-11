package com.zj198.model;

import java.util.Date;

/**
 * MchBank entity. @author MyEclipse Persistence Tools
 */

public class MchBank implements java.io.Serializable {

	// Fields
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String name;
	private Date startDate;
	private Date endDate;
	private Float discount;
	private String url;
	private Short status;

	// Constructors

	/** default constructor */
	public MchBank() {
	}

	/** full constructor */
	public MchBank(String name, Date startDate, Date endDate, Float discount,
			String url, Short status) {
		this.name = name;
		this.startDate = startDate;
		this.endDate = endDate;
		this.discount = discount;
		this.url = url;
		this.status = status;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getStartDate() {
		return this.startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return this.endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Float getDiscount() {
		return this.discount;
	}

	public void setDiscount(Float discount) {
		this.discount = discount;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Short getStatus() {
		return this.status;
	}

	public void setStatus(Short status) {
		this.status = status;
	}

}