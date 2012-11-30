package com.zj198.model;

import java.util.Date;

/**
 * FundCharge entity. @author MyEclipse Persistence Tools
 */

public class FundCharge implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = -3063960955554904660L;
	private Integer id;
	private Integer fundId;
	private String buy;
	private String application;
	private String redemption;
	private String management;
	private String extra;
	private String fundCode;
	private String fundName;
	private Date createdTime;
	private Date lastUpdatedTime;

	// Constructors

	/** default constructor */
	public FundCharge() {
	}

	/** full constructor */
	public FundCharge(Integer fundId, String buy, String application,
			String redemption, String management, String extra,
			String fundCode, String fundName, Date createdTime,
			Date lastUpdatedTime) {
		this.fundId = fundId;
		this.buy = buy;
		this.application = application;
		this.redemption = redemption;
		this.management = management;
		this.extra = extra;
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

	public String getBuy() {
		return this.buy;
	}

	public void setBuy(String buy) {
		this.buy = buy;
	}

	public String getApplication() {
		return this.application;
	}

	public void setApplication(String application) {
		this.application = application;
	}

	public String getRedemption() {
		return this.redemption;
	}

	public void setRedemption(String redemption) {
		this.redemption = redemption;
	}

	public String getManagement() {
		return this.management;
	}

	public void setManagement(String management) {
		this.management = management;
	}

	public String getExtra() {
		return this.extra;
	}

	public void setExtra(String extra) {
		this.extra = extra;
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