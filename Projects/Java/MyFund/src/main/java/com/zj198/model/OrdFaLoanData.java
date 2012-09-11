package com.zj198.model;

import java.util.Date;


/**
 * OrdFaLoanData entity. @author MyEclipse Persistence Tools
 */

public class OrdFaLoanData implements java.io.Serializable {

	private static final long serialVersionUID = 7377914187935036247L;
	private Integer id;
	private Integer appLoanId;
	private Integer uploadStatus;
	private Integer checkStatus;
	private String supplyName;
	private String supplyMemo;
	private String supplyWay;
	private Date supplyCreatedt;
	private Integer isdeleted;

	/** default constructor */
	public OrdFaLoanData() {
	}

	// Property accessors
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getAppLoanId() {
		return this.appLoanId;
	}

	public void setAppLoanId(Integer appLoanId) {
		this.appLoanId = appLoanId;
	}

	public Integer getUploadStatus() {
		return this.uploadStatus;
	}

	public void setUploadStatus(Integer uploadStatus) {
		this.uploadStatus = uploadStatus;
	}

	public Integer getCheckStatus() {
		return this.checkStatus;
	}

	public void setCheckStatus(Integer checkStatus) {
		this.checkStatus = checkStatus;
	}

	public String getSupplyName() {
		return this.supplyName;
	}

	public void setSupplyName(String supplyName) {
		this.supplyName = supplyName;
	}

	public String getSupplyMemo() {
		return this.supplyMemo;
	}

	public void setSupplyMemo(String supplyMemo) {
		this.supplyMemo = supplyMemo;
	}

	public String getSupplyWay() {
		return this.supplyWay;
	}

	public void setSupplyWay(String supplyWay) {
		this.supplyWay = supplyWay;
	}

	public Date getSupplyCreatedt() {
		return this.supplyCreatedt;
	}

	public void setSupplyCreatedt(Date supplyCreatedt) {
		this.supplyCreatedt = supplyCreatedt;
	}

	public Integer getIsdeleted() {
		return this.isdeleted;
	}

	public void setIsdeleted(Integer isdeleted) {
		this.isdeleted = isdeleted;
	}

}