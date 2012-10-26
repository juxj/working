package com.zj198.model;

import java.util.Calendar;
import java.util.Date;

import com.zj198.util.DateUtil;

/**
 * UsrMemberPeroid entity. @author MyEclipse Persistence Tools
 */

public class UsrMemberPeroid implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Integer userId;
	private Date memberStart;
	private Date memberEnd;
	private Integer memberType;
	private Date createTime;
	private Integer orderId;
	private Integer status;
	
	private Integer days;
	private String username;

	// Constructors

	/** default constructor */
	public UsrMemberPeroid() {
	}

	/** 复合查询 constructor */
	public UsrMemberPeroid(Integer userId, Date memberStart,
			Date memberEnd, Integer memberType, Date createTime,
			Integer orderId, Integer status,String username) {
		this.userId = userId;
		this.memberStart = memberStart;
		this.memberEnd = memberEnd;
		this.memberType = memberType;
		this.createTime = createTime;
		this.orderId = orderId;
		this.status = status;
		this.username=username;
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

	public Date getMemberStart() {
		return this.memberStart;
	}

	public void setMemberStart(Date memberStart) {
		this.memberStart = memberStart;
	}

	public Date getMemberEnd() {
		return this.memberEnd;
	}

	public void setMemberEnd(Date memberEnd) {
		this.memberEnd = memberEnd;
	}

	public Integer getMemberType() {
		return this.memberType;
	}

	public void setMemberType(Integer memberType) {
		this.memberType = memberType;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getOrderId() {
		return this.orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Integer getDays() {
		return DateUtil.differDays(Calendar.getInstance().getTime(), getMemberEnd());
	}
}