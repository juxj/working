package com.zj198.model;

/**
 * CfsRptParams entity. @author MyEclipse Persistence Tools
 */

public class CfsRptParams implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = -3765761409872114600L;
	private Integer id;
	private Integer minYears;
	private String versions;
	private String currVerersion;

	// Constructors

	/** default constructor */
	public CfsRptParams() {
	}

	/** full constructor */
	public CfsRptParams(Integer minYears, String versions, String currVerersion) {
		this.minYears = minYears;
		this.versions = versions;
		this.currVerersion = currVerersion;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getMinYears() {
		return this.minYears;
	}

	public void setMinYears(Integer minYears) {
		this.minYears = minYears;
	}

	public String getVersions() {
		return this.versions;
	}

	public void setVersions(String versions) {
		this.versions = versions;
	}

	public String getCurrVerersion() {
		return this.currVerersion;
	}

	public void setCurrVerersion(String currVerersion) {
		this.currVerersion = currVerersion;
	}

}