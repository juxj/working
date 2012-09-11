package com.zj198.model;

import java.util.Date;


/**
 * PrdFinanceImportant entity. @author MyEclipse Persistence Tools
 */

public class PrdFinanceImportant implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer financeId;
	private String showName;
	private String content;
	private Date createDt;
	private Integer financeNo;

	// Constructors

	/** default constructor */
	public PrdFinanceImportant() {
	}

	/** full constructor */
	public PrdFinanceImportant(Integer financeId, String showName,
			String content, Date createDt, Integer financeNo) {
		this.financeId = financeId;
		this.showName = showName;
		this.content = content;
		this.createDt = createDt;
		this.financeNo = financeNo;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getFinanceId() {
		return this.financeId;
	}

	public void setFinanceId(Integer financeId) {
		this.financeId = financeId;
	}

	public String getShowName() {
		return this.showName;
	}

	public void setShowName(String showName) {
		this.showName = showName;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreateDt() {
		return this.createDt;
	}

	public void setCreateDt(Date createDt) {
		this.createDt = createDt;
	}

	public Integer getFinanceNo() {
		return this.financeNo;
	}

	public void setFinanceNo(Integer financeNo) {
		this.financeNo = financeNo;
	}

}