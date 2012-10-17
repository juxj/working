package com.zj198.model;

import java.util.Date;

/**
 * NtyMessageQueue entity. @author MyEclipse Persistence Tools
 */

public class NtyMessageQueue implements java.io.Serializable {

	private static final long serialVersionUID = 3894724293493793093L;
	private Long id;
	private Integer type;
	private String title;
	private String content;
	private String receiver;
	private Integer status;
	private Date createdt;
	private String financeName;

	public String getFinanceName() {
		return financeName;
	}

	public void setFinanceName(String financeName) {
		this.financeName = financeName;
	}

	/** default constructor */
	public NtyMessageQueue() {
	}

	// Property accessors
	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getType() {
		return this.type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReceiver() {
		return this.receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getCreatedt() {
		return createdt;
	}

	public void setCreatedt(Date createdt) {
		this.createdt = createdt;
	}

}