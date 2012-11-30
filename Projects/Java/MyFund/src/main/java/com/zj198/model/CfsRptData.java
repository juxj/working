package com.zj198.model;

import java.util.Date;

/**
 * CfsRptData entity. @author MyEclipse Persistence Tools
 */

public class CfsRptData implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 691749933808573417L;
	private Integer id;
	private Integer usrId;
	private String code;
	private String name;
	private String amount;
	private String comments;
	private Integer cfsRptTypeId;
	private String cfsRptTypeCode;
	private String createdBy;
	private Date createdDate;
	private String lastModifiedBy;
	private Date lastModifiedDate;

	// Constructors

	/** default constructor */
	public CfsRptData() {
	}

	/** full constructor */
	public CfsRptData(Integer usrId, String code, String name, String amount,
			String comments, Integer cfsRptTypeId, String cfsRptTypeCode,
			String createdBy, Date createdDate, String lastModifiedBy,
			Date lastModifiedDate) {
		this.usrId = usrId;
		this.code = code;
		this.name = name;
		this.amount = amount;
		this.comments = comments;
		this.cfsRptTypeId = cfsRptTypeId;
		this.cfsRptTypeCode = cfsRptTypeCode;
		this.createdBy = createdBy;
		this.createdDate = createdDate;
		this.lastModifiedBy = lastModifiedBy;
		this.lastModifiedDate = lastModifiedDate;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUsrId() {
		return this.usrId;
	}

	public void setUsrId(Integer usrId) {
		this.usrId = usrId;
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

	public String getAmount() {
		return this.amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getComments() {
		return this.comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public Integer getCfsRptTypeId() {
		return this.cfsRptTypeId;
	}

	public void setCfsRptTypeId(Integer cfsRptTypeId) {
		this.cfsRptTypeId = cfsRptTypeId;
	}

	public String getCfsRptTypeCode() {
		return this.cfsRptTypeCode;
	}

	public void setCfsRptTypeCode(String cfsRptTypeCode) {
		this.cfsRptTypeCode = cfsRptTypeCode;
	}

	public String getCreatedBy() {
		return this.createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public Date getCreatedDate() {
		return this.createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getLastModifiedBy() {
		return this.lastModifiedBy;
	}

	public void setLastModifiedBy(String lastModifiedBy) {
		this.lastModifiedBy = lastModifiedBy;
	}

	public Date getLastModifiedDate() {
		return this.lastModifiedDate;
	}

	public void setLastModifiedDate(Date lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}

}