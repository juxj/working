package com.zj198.model;

import java.util.Date;


/**
 * OrdRequestAllocation entity. @author MyEclipse Persistence Tools
 */

public class OrdRequestAllocation implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer requestId;
	private Integer orgId;
	private Date createDt;
	private Integer createUserId;
	private Integer createUserType;

	// Constructors

	/** default constructor */
	public OrdRequestAllocation() {
	}

	/** full constructor */
	public OrdRequestAllocation(Integer requestId, Integer orgId,
			Date createDt, Integer createUserId, Integer createUserType) {
		this.requestId = requestId;
		this.orgId = orgId;
		this.createDt = createDt;
		this.createUserId = createUserId;
		this.createUserType = createUserType;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getRequestId() {
		return this.requestId;
	}

	public void setRequestId(Integer requestId) {
		this.requestId = requestId;
	}

	public Integer getOrgId() {
		return this.orgId;
	}

	public void setOrgId(Integer orgId) {
		this.orgId = orgId;
	}

	public Date getCreateDt() {
		return this.createDt;
	}

	public void setCreateDt(Date createDt) {
		this.createDt = createDt;
	}

	public Integer getCreateUserId() {
		return this.createUserId;
	}

	public void setCreateUserId(Integer createUserId) {
		this.createUserId = createUserId;
	}

	public Integer getCreateUserType() {
		return this.createUserType;
	}

	public void setCreateUserType(Integer createUserType) {
		this.createUserType = createUserType;
	}

}