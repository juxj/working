package com.zj198.model;

import java.util.Date;


/**
 * UsrOrgAttach entity. @author MyEclipse Persistence Tools
 */

public class UsrOrgAttach implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userId;
	private Integer userType;
	private Integer attachType;
	private String fileName;
	private String oldFileName;
	private String filePath;
	private Date createDt;
	private Integer attachStatus;

	// Constructors

	/** default constructor */
	public UsrOrgAttach() {
	}

	/** full constructor */
	public UsrOrgAttach(Integer userId, Integer userType, Integer attachType,
			String fileName, String oldFileName, String filePath,
			Date createDt) {
		this.userId = userId;
		this.userType = userType;
		this.attachType = attachType;
		this.fileName = fileName;
		this.oldFileName = oldFileName;
		this.filePath = filePath;
		this.createDt = createDt;
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

	public Integer getUserType() {
		return this.userType;
	}

	public void setUserType(Integer userType) {
		this.userType = userType;
	}

	public Integer getAttachType() {
		return this.attachType;
	}

	public void setAttachType(Integer attachType) {
		this.attachType = attachType;
	}

	public String getFileName() {
		return this.fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getOldFileName() {
		return this.oldFileName;
	}

	public void setOldFileName(String oldFileName) {
		this.oldFileName = oldFileName;
	}

	public String getFilePath() {
		return this.filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getCreateDt() {
		return this.createDt;
	}

	public void setCreateDt(Date createDt) {
		this.createDt = createDt;
	}

	public Integer getAttachStatus() {
		return attachStatus;
	}

	public void setAttachStatus(Integer attachStatus) {
		this.attachStatus = attachStatus;
	}

}