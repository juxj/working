package com.zj198.model;

import java.util.Date;

/**
 * AdsPost entity. @author MyEclipse Persistence Tools
 */

public class AdsPost implements java.io.Serializable {

	private static final long serialVersionUID = 5353868033738527346L;
	private Integer id;
	private Date startdate;
	private Date enddate;
	private Integer status;
	private Integer placeid;
	private String itemids;

	public AdsPost() {
	}

	// Property accessors
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getStartdate() {
		return this.startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	public Date getEnddate() {
		return this.enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getPlaceid() {
		return this.placeid;
	}

	public void setPlaceid(Integer placeid) {
		this.placeid = placeid;
	}

	public String getItemids() {
		return this.itemids;
	}

	public void setItemids(String itemids) {
		this.itemids = itemids;
	}

}