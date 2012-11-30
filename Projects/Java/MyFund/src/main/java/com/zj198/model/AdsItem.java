package com.zj198.model;

/**
 * AdsItem entity. @author MyEclipse Persistence Tools
 */

public class AdsItem implements java.io.Serializable {

	private static final long serialVersionUID = 1289433256894859268L;
	private Integer id;
	private String content;
	private String name;

	public AdsItem() {
	}

	// Property accessors
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

}