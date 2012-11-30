package com.zj198.model;

import java.util.Date;

/**
 * FundManager entity. @author MyEclipse Persistence Tools
 */

public class FundManager implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String manager;
	private String resume;
	private String pic;
	private Date startDate;
	private Date endDate;
	private Integer fundCompanyId;
	private String fundCompanyName;
	private Integer fundId;
	private String fundCode;
	private String fundName;
	private String gender;

	// Constructors

	/** default constructor */
	public FundManager() {
	}

	/** full constructor */
	public FundManager(String manager, String resume, String pic,
			Date startDate, Date endDate, Integer fundCompanyId,
			String fundCompanyName, Integer fundId, String fundCode,
			String fundName ,String gender) {
		this.manager = manager;
		this.resume = resume;
		this.pic = pic;
		this.startDate = startDate;
		this.endDate = endDate;
		this.fundCompanyId = fundCompanyId;
		this.fundCompanyName = fundCompanyName;
		this.fundId = fundId;
		this.fundCode = fundCode;
		this.fundName = fundName;
		this.gender = gender;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getManager() {
		return this.manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public String getResume() {
		return this.resume;
	}

	public void setResume(String resume) {
		this.resume = resume;
	}

	public String getPic() {
		return this.pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public Date getStartDate() {
		return this.startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return this.endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Integer getFundCompanyId() {
		return this.fundCompanyId;
	}

	public void setFundCompanyId(Integer fundCompanyId) {
		this.fundCompanyId = fundCompanyId;
	}

	public String getFundCompanyName() {
		return this.fundCompanyName;
	}

	public void setFundCompanyName(String fundCompanyName) {
		this.fundCompanyName = fundCompanyName;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

}