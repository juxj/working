package com.zj198.model;

import java.util.Date;

/**
 * FundFile entity. @author MyEclipse Persistence Tools
 */

public class FundFile implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Integer fundId;
	private String title;
	private String url;
	private Date issuedDate;
	private String fundCode;
	private String fundName;
	private Date createdTime;
	private Date lastUpdatedTime;

	// Constructors

	/** default constructor */
	public FundFile() {
	}

	/** full constructor */
	public FundFile(Integer fundId, String title, String url,
			Date issuedDate, String fundCode, String fundName,
			Date createdTime, Date lastUpdatedTime) {
		this.fundId = fundId;
		this.title = title;
		this.url = url;
		this.issuedDate = issuedDate;
		this.fundCode = fundCode;
		this.fundName = fundName;
		this.createdTime = createdTime;
		this.lastUpdatedTime = lastUpdatedTime;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getFundId() {
		return this.fundId;
	}

	public void setFundId(Integer fundId) {
		this.fundId = fundId;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Date getIssuedDate() {
		return this.issuedDate;
	}

	public void setIssuedDate(Date issuedDate) {
		this.issuedDate = issuedDate;
	}

	public String getFundCode() {
		return this.fundCode;
	}

	public void setFundCode(String fundCode) {
		this.fundCode = fundCode;
	}

	public String getFundName() {
		return this.fundName;
	}

	public void setFundName(String fundName) {
		this.fundName = fundName;
	}

	public Date getCreatedTime() {
		return this.createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public Date getLastUpdatedTime() {
		return this.lastUpdatedTime;
	}

	public void setLastUpdatedTime(Date lastUpdatedTime) {
		this.lastUpdatedTime = lastUpdatedTime;
	}

}