package com.zj198.model;

import java.util.Date;


/**
 * OrdFinanceAppLoan entity. @author MyEclipse Persistence Tools
 */

public class OrdFinanceAppLoan implements java.io.Serializable {

	private static final long serialVersionUID = 8473073382818625807L;
	private Integer applyId;
	private Integer blockSum;
	private Integer capitalWay;
	private String contractNum;
	private Integer currencyType;
	private String customerName;
	private Double ensureRate;
	private Integer financeType;
	private String firstApprovalUser;
	private Integer id;
	private Double interestRate;
	private Integer interestWay;
	private Double loanAmount;
	private Date loanDate;
	private Date loanEndDate;
	private Integer loanMonth;
	private String memo;
	private String mortgageOrg;
	private Integer mortgageType;
	private Integer orgId;
	private Integer productId;
	private Double repaymentAmount;
	private Date secondApprovalDt;
	private String secondApprovalUser;
	private Double sumLoanAmount;
	private String productName;
	private Integer loanStatus;
	private Date createDt;

	/** default constructor */
	public OrdFinanceAppLoan() {
	}

	// Property accessors
	public Integer getApplyId() {
		return this.applyId;
	}

	public Integer getBlockSum() {
		return this.blockSum;
	}

	public Integer getCapitalWay() {
		return this.capitalWay;
	}

	public String getContractNum() {
		return this.contractNum;
	}

	public Integer getCurrencyType() {
		return this.currencyType;
	}

	public String getCustomerName() {
		return this.customerName;
	}

	public Double getEnsureRate() {
		return this.ensureRate;
	}

	public Integer getFinanceType() {
		return this.financeType;
	}

	public String getFirstApprovalUser() {
		return this.firstApprovalUser;
	}

	public Integer getId() {
		return this.id;
	}

	public Double getInterestRate() {
		return this.interestRate;
	}

	public Integer getInterestWay() {
		return this.interestWay;
	}

	public Double getLoanAmount() {
		return this.loanAmount;
	}

	public Date getLoanDate() {
		return this.loanDate;
	}

	public Date getLoanEndDate() {
		return this.loanEndDate;
	}

	public Integer getLoanMonth() {
		return this.loanMonth;
	}

	public String getMemo() {
		return this.memo;
	}

	public String getMortgageOrg() {
		return this.mortgageOrg;
	}

	public Integer getMortgageType() {
		return this.mortgageType;
	}

	public Integer getOrgId() {
		return this.orgId;
	}

	public Integer getProductId() {
		return this.productId;
	}

	public Double getRepaymentAmount() {
		return this.repaymentAmount;
	}

	public Date getSecondApprovalDt() {
		return this.secondApprovalDt;
	}

	public String getSecondApprovalUser() {
		return this.secondApprovalUser;
	}

	public Double getSumLoanAmount() {
		return this.sumLoanAmount;
	}

	public void setApplyId(Integer applyId) {
		this.applyId = applyId;
	}

	public void setBlockSum(Integer blockSum) {
		this.blockSum = blockSum;
	}

	public void setCapitalWay(Integer capitalWay) {
		this.capitalWay = capitalWay;
	}

	public void setContractNum(String contractNum) {
		this.contractNum = contractNum;
	}

	public void setCurrencyType(Integer currencyType) {
		this.currencyType = currencyType;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public void setEnsureRate(Double ensureRate) {
		this.ensureRate = ensureRate;
	}

	public void setFinanceType(Integer financeType) {
		this.financeType = financeType;
	}

	public void setFirstApprovalUser(String firstApprovalUser) {
		this.firstApprovalUser = firstApprovalUser;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setInterestRate(Double interestRate) {
		this.interestRate = interestRate;
	}

	public void setInterestWay(Integer interestWay) {
		this.interestWay = interestWay;
	}

	public void setLoanAmount(Double loanAmount) {
		this.loanAmount = loanAmount;
	}

	public void setLoanDate(Date loanDate) {
		this.loanDate = loanDate;
	}

	public void setLoanEndDate(Date loanEndDate) {
		this.loanEndDate = loanEndDate;
	}

	public void setLoanMonth(Integer loanMonth) {
		this.loanMonth = loanMonth;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public void setMortgageOrg(String mortgageOrg) {
		this.mortgageOrg = mortgageOrg;
	}

	public void setMortgageType(Integer mortgageType) {
		this.mortgageType = mortgageType;
	}

	public void setOrgId(Integer orgId) {
		this.orgId = orgId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public void setRepaymentAmount(Double repaymentAmount) {
		this.repaymentAmount = repaymentAmount;
	}

	public void setSecondApprovalDt(Date secondApprovalDt) {
		this.secondApprovalDt = secondApprovalDt;
	}

	public void setSecondApprovalUser(String secondApprovalUser) {
		this.secondApprovalUser = secondApprovalUser;
	}

	public void setSumLoanAmount(Double sumLoanAmount) {
		this.sumLoanAmount = sumLoanAmount;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Integer getLoanStatus() {
		return loanStatus;
	}

	public void setLoanStatus(Integer loanStatus) {
		this.loanStatus = loanStatus;
	}

	public Date getCreateDt() {
		return createDt;
	}

	public void setCreateDt(Date createDt) {
		this.createDt = createDt;
	}

}