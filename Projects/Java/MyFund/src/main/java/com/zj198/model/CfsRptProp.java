package com.zj198.model;

/**
 * CfsRptProp entity. @author MyEclipse Persistence Tools
 */

public class CfsRptProp implements java.io.Serializable {

	// Fields

	private Integer id;
	private String code;
	private String name;
	private Integer cfsRptTypeId;
	private String cfsRptTypeCode;
	private String cfsRptName;
	private String comparedDataCode;
	private String rankCode;

	// Constructors

	/** default constructor */
	public CfsRptProp() {
	}

	/** full constructor */
	public CfsRptProp(String code, String name, Integer cfsRptTypeId,
			String cfsRptTypeCode, String cfsRptName, String comparedDataCode,
			String rankCode) {
		this.code = code;
		this.name = name;
		this.cfsRptTypeId = cfsRptTypeId;
		this.cfsRptTypeCode = cfsRptTypeCode;
		this.cfsRptName = cfsRptName;
		this.comparedDataCode = comparedDataCode;
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

	public String getCfsRptName() {
		return this.cfsRptName;
	}

	public void setCfsRptName(String cfsRptName) {
		this.cfsRptName = cfsRptName;
	}

	public String getComparedDataCode() {
		return this.comparedDataCode;
	}

	public void setComparedDataCode(String comparedDataCode) {
		this.comparedDataCode = comparedDataCode;
	}

	public String getRankCode() {
		return this.rankCode;
	}

	public void setRankCode(String rankCode) {
		this.rankCode = rankCode;
	}

}