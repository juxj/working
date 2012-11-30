package com.zj198.model;

import java.util.Date;

/**
 * FundRoi entity. @author MyEclipse Persistence Tools
 */

public class FundRoi implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Integer fundId;
	private Double day1;
	private Double week1;
	private Double month1;
	private Double month3;
	private Double month6;
	private Double year0;
	private Double year1;
	private Double year2;
	private Double year3;
	private Double accumulated;
	private String fundCode;
	private String fundName;
	private Date createdTime;
	private Date lastUpdatedTime;

	// Constructors

	/** default constructor */
	public FundRoi() {
	}

	/** full constructor */
	public FundRoi(Integer fundId, Double day1, Double week1, Double month1,
			Double month3, Double month6, Double year0, Double year1,
			Double year2, Double year3, Double accumulated, String fundCode,
			String fundName, Date createdTime, Date lastUpdatedTime) {
		this.fundId = fundId;
		this.day1 = day1;
		this.week1 = week1;
		this.month1 = month1;
		this.month3 = month3;
		this.month6 = month6;
		this.year0 = year0;
		this.year1 = year1;
		this.year2 = year2;
		this.year3 = year3;
		this.accumulated = accumulated;
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

	public Double getDay1() {
		return this.day1;
	}

	public void setDay1(Double day1) {
		this.day1 = day1;
	}

	public Double getWeek1() {
		return this.week1;
	}

	public void setWeek1(Double week1) {
		this.week1 = week1;
	}

	public Double getMonth1() {
		return this.month1;
	}

	public void setMonth1(Double month1) {
		this.month1 = month1;
	}

	public Double getMonth3() {
		return this.month3;
	}

	public void setMonth3(Double month3) {
		this.month3 = month3;
	}

	public Double getMonth6() {
		return this.month6;
	}

	public void setMonth6(Double month6) {
		this.month6 = month6;
	}

	public Double getYear0() {
		return this.year0;
	}

	public void setYear0(Double year0) {
		this.year0 = year0;
	}

	public Double getYear1() {
		return this.year1;
	}

	public void setYear1(Double year1) {
		this.year1 = year1;
	}

	public Double getYear2() {
		return this.year2;
	}

	public void setYear2(Double year2) {
		this.year2 = year2;
	}

	public Double getYear3() {
		return this.year3;
	}

	public void setYear3(Double year3) {
		this.year3 = year3;
	}

	public Double getAccumulated() {
		return this.accumulated;
	}

	public void setAccumulated(Double accumulated) {
		this.accumulated = accumulated;
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