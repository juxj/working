package com.zj198.model;

import java.util.Date;

/**
 * FundDividend entity. @author MyEclipse Persistence Tools
 */

public class FundDividend implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String year;
	private Date registerDate;
	private Date exDividendDate;
	private Date deliveredDate;
	private Float unit;
	private String solution;
	private String distributionType;
	private Integer fundId;
	private String fundCode;
	private String fundName;
	private Date createdTime;
	private Date lastUpdatedTime;

	// Constructors

	/** default constructor */
	public FundDividend() {
	}

	/** full constructor */
	public FundDividend(String year, Date registerDate,
			Date exDividendDate, Date deliveredDate, Float unit,
			String solution, String distributionType, Integer fundId,
			String fundCode, String fundName, Date createdTime,
			Date lastUpdatedTime) {
		this.year = year;
		this.registerDate = registerDate;
		this.exDividendDate = exDividendDate;
		this.deliveredDate = deliveredDate;
		this.unit = unit;
		this.solution = solution;
		this.distributionType = distributionType;
		this.fundId = fundId;
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

	public String getYear() {
		return this.year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public Date getRegisterDate() {
		return this.registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	public Date getExDividendDate() {
		return this.exDividendDate;
	}

	public void setExDividendDate(Date exDividendDate) {
		this.exDividendDate = exDividendDate;
	}

	public Date getDeliveredDate() {
		return this.deliveredDate;
	}

	public void setDeliveredDate(Date deliveredDate) {
		this.deliveredDate = deliveredDate;
	}

	public Float getUnit() {
		return this.unit;
	}

	public void setUnit(Float unit) {
		this.unit = unit;
	}

	public String getSolution() {
		return this.solution;
	}

	public void setSolution(String solution) {
		this.solution = solution;
	}

	public String getDistributionType() {
		return this.distributionType;
	}

	public void setDistributionType(String distributionType) {
		this.distributionType = distributionType;
	}

	public Integer getFundId() {
		return this.fundId;
	}

	public void setFundId(Integer fundId) {
		this.fundId = fundId;
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