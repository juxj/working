package com.zj198.model;

import java.util.Date;

/**
 * UsrContract entity. @author MyEclipse Persistence Tools
 */

public class UsrContract implements java.io.Serializable {

	// Fields
	
	private static final long serialVersionUID = 4925111760686712013L;
	private Integer id;
	private Integer userId;
	private String title;
	private String userName;
	private String contractTypeId;
	private String contractTypeName;
	private Date signedDate;
	private String contractNumber;

	// Constructors

	/** default constructor */
	public UsrContract() {
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getContractTypeId() {
		return this.contractTypeId;
	}

	public void setContractTypeId(String contractTypeId) {
		this.contractTypeId = contractTypeId;
	}

	public String getContractTypeName() {
		return this.contractTypeName;
	}

	public void setContractTypeName(String contractTypeName) {
		this.contractTypeName = contractTypeName;
	}

	public Date getSignedDate() {
		return signedDate;
	}

	public void setSignedDate(Date signedDate) {
		this.signedDate = signedDate;
	}

	public String getContractNumber() {
		return this.contractNumber;
	}

	public void setContractNumber(String contractNumber) {
		this.contractNumber = contractNumber;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

}