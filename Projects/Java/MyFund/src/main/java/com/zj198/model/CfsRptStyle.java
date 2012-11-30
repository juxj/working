package com.zj198.model;

/**
 * CfsRptStyle entity. @author MyEclipse Persistence Tools
 */

public class CfsRptStyle implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer lineNo;
	private String code;
	private String name;
	private Integer parentId;
	private Integer isReduceItem;
	private String formular;
	private Integer cfsRptPropId;
	private String cfsRptPropCode;
	private String cfsRptPropName;
	private Integer cfsRptTypeId;
	private String cfsRptTypeCode;
	private String cfsRptTypeName;
	private Integer columnId;
	private String version;
	private Integer provinceId;
	private String provinceName;
	private String isDataItem;
	private String rankCode;

	// Constructors

	/** default constructor */
	public CfsRptStyle() {
	}

	/** minimal constructor */
	public CfsRptStyle(String isDataItem) {
		this.isDataItem = isDataItem;
	}

	/** full constructor */
	public CfsRptStyle(Integer lineNo, String code, String name,
			Integer parentId, Integer isReduceItem, String formular,
			Integer cfsRptPropId, String cfsRptPropCode, String cfsRptPropName,
			Integer cfsRptTypeId, String cfsRptTypeCode, String cfsRptTypeName,
			Integer columnId, String version, Integer provinceId,
			String provinceName, String isDataItem, String rankCode) {
		this.lineNo = lineNo;
		this.code = code;
		this.name = name;
		this.parentId = parentId;
		this.isReduceItem = isReduceItem;
		this.formular = formular;
		this.cfsRptPropId = cfsRptPropId;
		this.cfsRptPropCode = cfsRptPropCode;
		this.cfsRptPropName = cfsRptPropName;
		this.cfsRptTypeId = cfsRptTypeId;
		this.cfsRptTypeCode = cfsRptTypeCode;
		this.cfsRptTypeName = cfsRptTypeName;
		this.columnId = columnId;
		this.version = version;
		this.provinceId = provinceId;
		this.provinceName = provinceName;
		this.isDataItem = isDataItem;
		this.rankCode = rankCode;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getLineNo() {
		return this.lineNo;
	}

	public void setLineNo(Integer lineNo) {
		this.lineNo = lineNo;
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

	public Integer getParentId() {
		return this.parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public Integer getIsReduceItem() {
		return this.isReduceItem;
	}

	public void setIsReduceItem(Integer isReduceItem) {
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

	public Integer getColumnId() {
		return this.columnId;
	}

	public void setColumnId(Integer columnId) {
		this.columnId = columnId;
	}

	public String getVersion() {
		return this.version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public Integer getProvinceId() {
		return this.provinceId;
	}

	public void setProvinceId(Integer provinceId) {
		this.provinceId = provinceId;
	}

	public String getProvinceName() {
		return this.provinceName;
	}

	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}

	public String getIsDataItem() {
		return this.isDataItem;
	}

	public void setIsDataItem(String isDataItem) {
		this.isDataItem = isDataItem;
	}

	public String getRankCode() {
		return this.rankCode;
	}

	public void setRankCode(String rankCode) {
		this.rankCode = rankCode;
	}

}