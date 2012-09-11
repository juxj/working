package com.zj198.model;

import java.util.Date;

/**
 * AdmActionlog entity. @author MyEclipse Persistence Tools
 */

public class AdmActionlog implements java.io.Serializable {

	private static final long serialVersionUID = -1550547516031924896L;
	private Long id;
	private Integer admuid;
	private String action;
	private Integer targetid;
	private Date actiondt;

	/** default constructor */
	public AdmActionlog() {
	}

	// Property accessors
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getAdmuid() {
		return this.admuid;
	}

	public void setAdmuid(Integer admuid) {
		this.admuid = admuid;
	}

	public String getAction() {
		return this.action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public Integer getTargetid() {
		return this.targetid;
	}

	public void setTargetid(Integer targetid) {
		this.targetid = targetid;
	}

	public Date getActiondt() {
		return this.actiondt;
	}

	public void setActiondt(Date actiondt) {
		this.actiondt = actiondt;
	}

}