package com.zj198.model;

import java.util.Date;


/**
 * PrdExtendsValue entity. @author MyEclipse Persistence Tools
 */

public class PrdExtendsValue implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer extendsType;
	private Integer rowId;
	private Integer propertyId;
	private String entityValue;
	private String dicValue;
	private String fieldCode;
	private String fieldName;
	private Date createDt;
	private Integer createUserId;
	private Integer fieldType;

	// Constructors

	/** default constructor */
	public PrdExtendsValue() {
	}

	/** full constructor */
	public PrdExtendsValue(Integer extendsType, Integer rowId,
			Integer propertyId, String entityValue, String dicValue,
			String fieldCode, String fieldName, Date createDt,
			Integer createUserId) {
		this.extendsType = extendsType;
		this.rowId = rowId;
		this.propertyId = propertyId;
		this.entityValue = entityValue;
		this.dicValue = dicValue;
		this.fieldCode = fieldCode;
		this.fieldName = fieldName;
		this.createDt = createDt;
		this.createUserId = createUserId;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getExtendsType() {
		return this.extendsType;
	}

	public void setExtendsType(Integer extendsType) {
		this.extendsType = extendsType;
	}

	public Integer getRowId() {
		return this.rowId;
	}

	public void setRowId(Integer rowId) {
		this.rowId = rowId;
	}

	public Integer getPropertyId() {
		return this.propertyId;
	}

	public void setPropertyId(Integer propertyId) {
		this.propertyId = propertyId;
	}

	public String getEntityValue() {
		return this.entityValue;
	}

	public void setEntityValue(String entityValue) {
		this.entityValue = entityValue;
	}

	public String getDicValue() {
		return this.dicValue;
	}

	public void setDicValue(String dicValue) {
		this.dicValue = dicValue;
	}

	public String getFieldCode() {
		return this.fieldCode;
	}

	public void setFieldCode(String fieldCode) {
		this.fieldCode = fieldCode;
	}

	public String getFieldName() {
		return this.fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public Date getCreateDt() {
		return this.createDt;
	}

	public void setCreateDt(Date createDt) {
		this.createDt = createDt;
	}

	public Integer getCreateUserId() {
		return this.createUserId;
	}

	public void setCreateUserId(Integer createUserId) {
		this.createUserId = createUserId;
	}

	public Integer getFieldType() {
		return fieldType;
	}

	public void setFieldType(Integer fieldType) {
		this.fieldType = fieldType;
	}

}