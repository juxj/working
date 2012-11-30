package com.zj198.model;

import java.util.Date;
import java.util.Set;

/**
 * PrdExtendsProperty entity. @author MyEclipse Persistence Tools
 */

public class PrdExtendsProperty implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer extendsType;
	private Integer rowId;
	private String fieldCode;
	private String fieldName;
	private Integer fieldType;
	private String fieldMemo;
	private String fieldValue;
	private Integer fieldvalueNullAble;
	private String fieldDefaultvalue;
	private Date createDt;
	private Integer createUserId;
	private Integer status;
	private Set<PrdPropertyDic> propertyDicSet;
	private String entityValue;
	// Constructors

	/** default constructor */
	public PrdExtendsProperty() {
	}

	/** full constructor */
	public PrdExtendsProperty(Integer extendsType, Integer rowId,
			String fieldCode, String fieldName, Integer fieldType,
			String fieldMemo, String fieldValue, Integer fieldvalueNullAble,
			String fieldDefaultvalue, Date createDt, Integer createUserId,
			Integer status) {
		this.extendsType = extendsType;
		this.rowId = rowId;
		this.fieldCode = fieldCode;
		this.fieldName = fieldName;
		this.fieldType = fieldType;
		this.fieldMemo = fieldMemo;
		this.fieldValue = fieldValue;
		this.fieldvalueNullAble = fieldvalueNullAble;
		this.fieldDefaultvalue = fieldDefaultvalue;
		this.createDt = createDt;
		this.createUserId = createUserId;
		this.status = status;
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

	public Integer getFieldType() {
		return this.fieldType;
	}

	public void setFieldType(Integer fieldType) {
		this.fieldType = fieldType;
	}

	public String getFieldMemo() {
		return this.fieldMemo;
	}

	public void setFieldMemo(String fieldMemo) {
		this.fieldMemo = fieldMemo;
	}

	public String getFieldValue() {
		return this.fieldValue;
	}

	public void setFieldValue(String fieldValue) {
		this.fieldValue = fieldValue;
	}

	public Integer getFieldvalueNullAble() {
		return this.fieldvalueNullAble;
	}

	public void setFieldvalueNullAble(Integer fieldvalueNullAble) {
		this.fieldvalueNullAble = fieldvalueNullAble;
	}

	public String getFieldDefaultvalue() {
		return this.fieldDefaultvalue;
	}

	public void setFieldDefaultvalue(String fieldDefaultvalue) {
		this.fieldDefaultvalue = fieldDefaultvalue;
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

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Set<PrdPropertyDic> getPropertyDicSet() {
		return propertyDicSet;
	}

	public void setPropertyDicSet(Set<PrdPropertyDic> propertyDicSet) {
		this.propertyDicSet = propertyDicSet;
	}

	public String getEntityValue() {
		return entityValue;
	}

	public void setEntityValue(String entityValue) {
		this.entityValue = entityValue;
	}

}