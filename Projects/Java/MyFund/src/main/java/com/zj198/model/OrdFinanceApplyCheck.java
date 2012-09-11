package com.zj198.model;

import java.util.Date;


/**
 * OrdFinanceApplyCheck entity. @author MyEclipse Persistence Tools
 */

public class OrdFinanceApplyCheck implements java.io.Serializable {

	private static final long serialVersionUID = 1466430050113769871L;
	private Integer id;
	private Integer financeApplyId;
	private Integer checkStatus;
	private String checkView;
	private Date createdt;
	private Integer createUserId;

	/** default constructor */
	public OrdFinanceApplyCheck() {
	}

	// Property accessors
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getFinanceApplyId() {
		return this.financeApplyId;
	}

	public void setFinanceApplyId(Integer financeApplyId) {
		this.financeApplyId = financeApplyId;
	}

	public Integer getCheckStatus() {
		return this.checkStatus;
	}

	public void setCheckStatus(Integer checkStatus) {
		this.checkStatus = checkStatus;
	}

	public String getCheckView() {
		return this.checkView;
	}

	public void setCheckView(String checkView) {
		this.checkView = checkView;
	}

	public Date getCreatedt() {
		return this.createdt;
	}

	public void setCreatedt(Date createdt) {
		this.createdt = createdt;
	}

	public Integer getCreateUserId() {
		return this.createUserId;
	}

	public void setCreateUserId(Integer createUserId) {
		this.createUserId = createUserId;
	}

}