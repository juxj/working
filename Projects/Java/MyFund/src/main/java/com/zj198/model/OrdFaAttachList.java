package com.zj198.model;

import java.util.Date;

/**
 * OrdFaAttachList entity. @author MyEclipse Persistence Tools
 */

public class OrdFaAttachList implements java.io.Serializable {

	private static final long serialVersionUID = -3731729641617737941L;
	private Integer id;
	private Integer attachId;
	private String oldFileName;
	private String fileName;
	private String uploadPath;
	private Date createdt;
	private Date updatedt;
	private Integer createUserId;
	private String ext;
	private Integer isDeleted;

	public String getExt() {
		return ext;
	}

	public void setExt(String ext) {
		this.ext = ext;
	}

	/** default constructor */
	public OrdFaAttachList() {
	}

	// Property accessors
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getAttachId() {
		return this.attachId;
	}

	public void setAttachId(Integer attachId) {
		this.attachId = attachId;
	}

	public String getOldFileName() {
		return this.oldFileName;
	}

	public void setOldFileName(String oldFileName) {
		this.oldFileName = oldFileName;
	}

	public String getFileName() {
		return this.fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getUploadPath() {
		return this.uploadPath;
	}

	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}

	
	public Integer getCreateUserId() {
		return this.createUserId;
	}

	public void setCreateUserId(Integer createUserId) {
		this.createUserId = createUserId;
	}

	public Date getCreatedt() {
		return createdt;
	}

	public void setCreatedt(Date createdt) {
		this.createdt = createdt;
	}

	public Date getUpdatedt() {
		return updatedt;
	}

	public void setUpdatedt(Date updatedt) {
		this.updatedt = updatedt;
	}

	public Integer getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(Integer isDeleted) {
		this.isDeleted = isDeleted;
	}

}