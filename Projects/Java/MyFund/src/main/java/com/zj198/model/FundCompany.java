package com.zj198.model;

import java.util.Date;


/**
 * FundCompany entity. @author MyEclipse Persistence Tools
 */

public class FundCompany implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String shortName;
	private String fullName;
	private String webSite;
	private String configFile;
	private String status;
	private String tabs;
	private Date lastUpdatedTime;

	// Constructors

	/** default constructor */
	public FundCompany() {
	}

	/** full constructor */
	public FundCompany(String shortName, String fullName, String webSite,
			String configFile, String status, Date lastUpdatedTime,String tabs) {
		this.shortName = shortName;
		this.fullName = fullName;
		this.webSite = webSite;
		this.configFile = configFile;
		this.status = status;
		this.lastUpdatedTime = lastUpdatedTime;
		this.tabs=tabs;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getShortName() {
		return this.shortName;
	}

	public void setShortName(String shortName) {
		this.shortName = shortName;
	}

	public String getFullName() {
		return this.fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getWebSite() {
		return this.webSite;
	}

	public void setWebSite(String webSite) {
		this.webSite = webSite;
	}

	public String getConfigFile() {
		return this.configFile;
	}

	public void setConfigFile(String configFile) {
		this.configFile = configFile;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getLastUpdatedTime() {
		return this.lastUpdatedTime;
	}

	public void setLastUpdatedTime(Date lastUpdatedTime) {
		this.lastUpdatedTime = lastUpdatedTime;
	}

	public String getTabs() {
		return tabs;
	}

	public void setTabs(String tabs) {
		this.tabs = tabs;
	}

}