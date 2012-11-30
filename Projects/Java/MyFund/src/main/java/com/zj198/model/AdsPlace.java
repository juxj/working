package com.zj198.model;

/**
 * AdsPlace entity. @author MyEclipse Persistence Tools
 */

public class AdsPlace implements java.io.Serializable {

	private static final long serialVersionUID = -1132426634588544589L;
	private Integer id;
	private String placename;
	private Integer width;
	private Integer height;
	private Integer type;

	public AdsPlace() {
	}
	
	// Property accessors
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPlacename() {
		return this.placename;
	}

	public void setPlacename(String placename) {
		this.placename = placename;
	}

	public Integer getWidth() {
		return this.width;
	}

	public void setWidth(Integer width) {
		this.width = width;
	}

	public Integer getHeight() {
		return this.height;
	}

	public void setHeight(Integer height) {
		this.height = height;
	}

	public Integer getType() {
		return this.type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

}