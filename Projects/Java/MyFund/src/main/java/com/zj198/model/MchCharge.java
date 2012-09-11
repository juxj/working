package com.zj198.model;

import java.util.Date;

/**
 * MchCharge entity. @author MyEclipse Persistence Tools
 */

public class MchCharge implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 131496517350933711L;
	private Integer id;
	private Integer companyId;
	private String companyName;
	private Integer contactId;
	private String contactName;
	private Date applyDate;
	private Integer typeId;
	private String typeName;
	private Integer charge;
	private Integer bankId;
	private String bankName;
	private Date settlementDate;
	private Short settlementStatus;
	private Short status;

	// Constructors

	/** default constructor */
	public MchCharge() {
	}

	/** full constructor */
	public MchCharge(Integer companyId, String companyName, Integer contactId,
			String contactName, Date applyDate, Integer typeId,
			String typeName, Integer charge, Integer bankId, String bankName,
			Date settlementDate, Short settlementStatus, Short status) {
		this.companyId = companyId;
		this.companyName = companyName;
		this.contactId = contactId;
		this.contactName = contactName;
		this.applyDate = applyDate;
		this.typeId = typeId;
		this.typeName = typeName;
		this.charge = charge;
		this.bankId = bankId;
		this.bankName = bankName;
		this.settlementDate = settlementDate;
		this.settlementStatus = settlementStatus;
		this.status = status;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getCompanyId() {
		return this.companyId;
	}

	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}

	public String getCompanyName() {
		return this.companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public Integer getContactId() {
		return this.contactId;
	}

	public void setContactId(Integer contactId) {
		this.contactId = contactId;
	}

	public String getContactName() {
		return this.contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	public Date getApplyDate() {
		return this.applyDate;
	}

	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}

	public Integer getTypeId() {
		return this.typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public String getTypeName() {
		return this.typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public Integer getCharge() {
		return this.charge;
	}

	public void setCharge(Integer charge) {
		this.charge = charge;
	}

	public Integer getBankId() {
		return this.bankId;
	}

	public void setBankId(Integer bankId) {
		this.bankId = bankId;
	}

	public String getBankName() {
		return this.bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public Date getSettlementDate() {
		return this.settlementDate;
	}

	public void setSettlementDate(Date settlementDate) {
		this.settlementDate = settlementDate;
	}

	public Short getSettlementStatus() {
		return this.settlementStatus;
	}

	public void setSettlementStatus(Short settlementStatus) {
		this.settlementStatus = settlementStatus;
	}

	public Short getStatus() {
		return this.status;
	}

	public void setStatus(Short status) {
		this.status = status;
	}

}