package com.zj198.model;

import java.util.Date;


/**
 * FundInvest entity. @author MyEclipse Persistence Tools
 */

public class FundInvest implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Integer fundId;
	private String overall;
	private String stockIndustry;
	private String stockTop;
	private String bondCatelog;
	private String bondTop;
	private String fundCode;
	private String fundName;
	private Date createdTime;
	private Date lastUpdatedTime;

	// Constructors

	/** default constructor */
	public FundInvest() {
	}

	/** full constructor */
	public FundInvest(Integer fundId, String overall, String stockIndustry,
			String stockTop, String bondCatelog, String bondTop,
			String fundCode, String fundName, Date createdTime,
			Date lastUpdatedTime) {
		this.fundId = fundId;
		this.overall = overall;
		this.stockIndustry = stockIndustry;
		this.stockTop = stockTop;
		this.bondCatelog = bondCatelog;
		this.bondTop = bondTop;
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

	public String getOverall() {
		return this.overall;
	}

	public void setOverall(String overall) {
		this.overall = overall;
	}

	public String getStockIndustry() {
		return this.stockIndustry;
	}

	public void setStockIndustry(String stockIndustry) {
		this.stockIndustry = stockIndustry;
	}

	public String getStockTop() {
		return this.stockTop;
	}

	public void setStockTop(String stockTop) {
		this.stockTop = stockTop;
	}

	public String getBondCatelog() {
		return this.bondCatelog;
	}

	public void setBondCatelog(String bondCatelog) {
		this.bondCatelog = bondCatelog;
	}

	public String getBondTop() {
		return this.bondTop;
	}

	public void setBondTop(String bondTop) {
		this.bondTop = bondTop;
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