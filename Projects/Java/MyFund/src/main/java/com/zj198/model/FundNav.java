package com.zj198.model;

import java.util.Date;

/**
 * FundNav entity. @author MyEclipse Persistence Tools
 */

public class FundNav implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Integer fundId;
	private String fundCode;
	private String fundName;
	private Date navDate;
	private Float nav;
	private Float accumulatedNav;

	// Constructors

	/** default constructor */
	public FundNav() {
	}

	/** full constructor */
	public FundNav(Integer fundId, String fundCode, String fundName,
			Date navDate, Float nav, Float accumulatedNav) {
		this.fundId = fundId;
		this.fundCode = fundCode;
		this.fundName = fundName;
		this.navDate = navDate;
		this.nav = nav;
		this.accumulatedNav = accumulatedNav;
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

	public Date getNavDate() {
		return this.navDate;
	}

	public void setNavDate(Date navDate) {
		this.navDate = navDate;
	}

	public Float getNav() {
		return this.nav;
	}

	public void setNav(Float nav) {
		this.nav = nav;
	}

	public Float getAccumulatedNav() {
		return this.accumulatedNav;
	}

	public void setAccumulatedNav(Float accumulatedNav) {
		this.accumulatedNav = accumulatedNav;
	}

}