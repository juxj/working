package com.zj198.model;

/**
 * PrdPropertyDic entity. @author MyEclipse Persistence Tools
 */

public class PrdPropertyDic implements java.io.Serializable {

	// Fields

	private Integer id;
	private String dicName;
	private Integer dicValue;
	private Integer groupId;
	private Integer selected;

	// Constructors

	/** default constructor */
	public PrdPropertyDic() {
	}

	/** full constructor */
	public PrdPropertyDic(String dicName, Integer dicValue, Integer groupId) {
		this.dicName = dicName;
		this.dicValue = dicValue;
		this.groupId = groupId;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDicName() {
		return this.dicName;
	}

	public void setDicName(String dicName) {
		this.dicName = dicName;
	}

	public Integer getDicValue() {
		return this.dicValue;
	}

	public void setDicValue(Integer dicValue) {
		this.dicValue = dicValue;
	}

	public Integer getGroupId() {
		return this.groupId;
	}

	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}

	public Integer getSelected() {
		return selected;
	}

	public void setSelected(Integer selected) {
		this.selected = selected;
	}

}