package com.zj198.model;

/**
 * CfsRptItem entity. @author MyEclipse Persistence Tools
 */

public class CfsRptItem implements java.io.Serializable {

	// Fields

	private Integer id;
	private String code;
	private String name;
	private String isReduceItem;
	private String formular;
	private Integer cfsRptPropId;
	private String cfsRptPropCode;
	private String cfsRptPropName;
	private Integer cfsRptTypeId;
	private String cfsRptTypeCode;
	private String cfsRptTypeName;
	private String rankCode;

	// Constructors

	/** default constructor */
	public CfsRptItem() {
	}

	/** full constructor */
	public CfsRptItem(String code, String name, String isReduceItem,
			String formular, Integer cfsRptPropId, String cfsRptPropCode,
			String cfsRptPropName, Integer cfsRptTypeId, String cfsRptTypeCode,
			String cfsRptTypeName, String rankCode) {
		this.code = code;
		this.name = name;
		this.isReduceItem = isReduceItem;
		this.formular = formular;
		this.cfsRptPropId = cfsRptPropId;
		this.cfsRptPropCode = cfsRptPropCode;
		this.cfsRptPropName = cfsRptPropName;
		this.cfsRptTypeId = cfsRptTypeId;
		this.cfsRptTypeCode = cfsRptTypeCode;
		this.cfsRptTypeName = cfsRptTypeName;
		this.rankCode = rankCode;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIsReduceItem() {
		return this.isReduceItem;
	}

	public void setIsReduceItem(String isReduceItem) {
		this.isReduceItem = isReduceItem;
	}

	public String getFormular() {
		return this.formular;
	}

	public void setFormular(String formular) {
		this.formular = formular;
	}

	public Integer getCfsRptPropId() {
		return this.cfsRptPropId;
	}

	public void setCfsRptPropId(Integer cfsRptPropId) {
		this.cfsRptPropId = cfsRptPropId;
	}

	public String getCfsRptPropCode() {
		return this.cfsRptPropCode;
	}

	public void setCfsRptPropCode(String cfsRptPropCode) {
		this.cfsRptPropCode = cfsRptPropCode;
	}

	public String getCfsRptPropName() {
		return this.cfsRptPropName;
	}

	public void setCfsRptPropName(String cfsRptPropName) {
		this.cfsRptPropName = cfsRptPropName;
	}

	public Integer getCfsRptTypeId() {
		return this.cfsRptTypeId;
	}

	public void setCfsRptTypeId(Integer cfsRptTypeId) {
		this.cfsRptTypeId = cfsRptTypeId;
	}

	public String getCfsRptTypeCode() {
		return this.cfsRptTypeCode;
	}

	public void setCfsRptTypeCode(String cfsRptTypeCode) {
		this.cfsRptTypeCode = cfsRptTypeCode;
	}

	public String getCfsRptTypeName() {
		return this.cfsRptTypeName;
	}

	public void setCfsRptTypeName(String cfsRptTypeName) {
		this.cfsRptTypeName = cfsRptTypeName;
	}

	public String getRankCode() {
		return this.rankCode;
	}

	public void setRankCode(String rankCode) {
		this.rankCode = rankCode;
	}

}