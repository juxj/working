package com.zj198.model;

import java.util.Date;


/**
 * CfsUsrRpt entity. @author MyEclipse Persistence Tools
 */

public class CfsUsrRpt implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -321831511121808069L;
	// Fields

	private Integer id;
	private Integer usrId;
	private String usrName;
	private String fiscalYears;
	private String fiscalYearStatus;
	private String versions;
	private Date lastModifiedTime;

	// Constructors

	/** default constructor */
	public CfsUsrRpt() {
	}

	/** full constructor */
	public CfsUsrRpt(Integer usrId, String usrName, String fiscalYears,
			String fiscalYearStatus, String versions, Date lastModifiedTime) {
		this.usrId = usrId;
		this.usrName = usrName;
		this.fiscalYears = fiscalYears;
		this.fiscalYearStatus = fiscalYearStatus;
		this.versions = versions;
		this.lastModifiedTime = lastModifiedTime;
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

	public String getUsrName() {
		return this.usrName;
	}

	public void setUsrName(String usrName) {
		this.usrName = usrName;
	}

	public String getFiscalYears() {
		return this.fiscalYears;
	}

	public void setFiscalYears(String fiscalYears) {
		this.fiscalYears = fiscalYears;
	}

	public String getFiscalYearStatus() {
		return this.fiscalYearStatus;
	}

	public void setFiscalYearStatus(String fiscalYearStatus) {
		this.fiscalYearStatus = fiscalYearStatus;
	}

	public String getVersions() {
		return this.versions;
	}

	public void setVersions(String versions) {
		this.versions = versions;
	}

	public Date getLastModifiedTime() {
		return this.lastModifiedTime;
	}

	public void setLastModifiedTime(Date lastModifiedTime) {
		this.lastModifiedTime = lastModifiedTime;
	}

}