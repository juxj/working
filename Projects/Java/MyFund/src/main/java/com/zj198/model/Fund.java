package com.zj198.model;

import java.util.Date;

/**
 * Fund entity. @author MyEclipse Persistence Tools
 */

public class Fund implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String code;
	private String shortName;
	private String fullName;
	private String issuedDate;
	private String catelogName;
	private String manager;
	private String administrator;
	private String custodian;
	private String investmentGoal;
	private String investmentVision;
	private String investmentScale;
	private String investmentStrategy;
	private String characteristics;
	private String benchmark;
	private String operationMode;
	private Integer fundCompanyId;
	private String fundCompanyName;
	private String catelogId;
	private String status;
	private Date createdTime;
	private Date lastUpdatedTime;

	// Constructors

	/** default constructor */
	public Fund() {
	}

	/** full constructor */
	public Fund(String code, String shortName, String fullName,
			String issuedDate, String catelogName, String manager,
			String administrator, String custodian, String investmentGoal,
			String investmentVision, String investmentScale,
			String investmentStrategy, String characteristics,
			String benchmark, String operationMode, Integer fundCompanyId,
			String fundCompanyName, String catelogId, String status,
			Date createdTime, Date lastUpdatedTime) {
		this.code = code;
		this.shortName = shortName;
		this.fullName = fullName;
		this.issuedDate = issuedDate;
		this.catelogName = catelogName;
		this.manager = manager;
		this.administrator = administrator;
		this.custodian = custodian;
		this.investmentGoal = investmentGoal;
		this.investmentVision = investmentVision;
		this.investmentScale = investmentScale;
		this.investmentStrategy = investmentStrategy;
		this.characteristics = characteristics;
		this.benchmark = benchmark;
		this.operationMode = operationMode;
		this.fundCompanyId = fundCompanyId;
		this.fundCompanyName = fundCompanyName;
		this.catelogId = catelogId;
		this.status = status;
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

	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getShortName() {
		return this.shortName;
	}

	public void setShortName(String shortName) {
		this.shortName = shortName;
	}

	public String getFullName() {
		return this.fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getIssuedDate() {
		return this.issuedDate;
	}

	public void setIssuedDate(String issuedDate) {
		this.issuedDate = issuedDate;
	}

	public String getCatelogName() {
		return this.catelogName;
	}

	public void setCatelogName(String catelogName) {
		this.catelogName = catelogName;
	}

	public String getManager() {
		return this.manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public String getAdministrator() {
		return this.administrator;
	}

	public void setAdministrator(String administrator) {
		this.administrator = administrator;
	}

	public String getCustodian() {
		return this.custodian;
	}

	public void setCustodian(String custodian) {
		this.custodian = custodian;
	}

	public String getInvestmentGoal() {
		return this.investmentGoal;
	}

	public void setInvestmentGoal(String investmentGoal) {
		this.investmentGoal = investmentGoal;
	}

	public String getInvestmentVision() {
		return this.investmentVision;
	}

	public void setInvestmentVision(String investmentVision) {
		this.investmentVision = investmentVision;
	}

	public String getInvestmentScale() {
		return this.investmentScale;
	}

	public void setInvestmentScale(String investmentScale) {
		this.investmentScale = investmentScale;
	}

	public String getInvestmentStrategy() {
		return this.investmentStrategy;
	}

	public void setInvestmentStrategy(String investmentStrategy) {
		this.investmentStrategy = investmentStrategy;
	}

	public String getCharacteristics() {
		return this.characteristics;
	}

	public void setCharacteristics(String characteristics) {
		this.characteristics = characteristics;
	}

	public String getBenchmark() {
		return this.benchmark;
	}

	public void setBenchmark(String benchmark) {
		this.benchmark = benchmark;
	}

	public String getOperationMode() {
		return this.operationMode;
	}

	public void setOperationMode(String operationMode) {
		this.operationMode = operationMode;
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

	public String getCatelogId() {
		return this.catelogId;
	}

	public void setCatelogId(String catelogId) {
		this.catelogId = catelogId;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
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