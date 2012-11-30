package com.zj198.model;

/**
 * CfsRptType entity. @author MyEclipse Persistence Tools
 */

public class CfsRptType implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = -6148539296189519769L;
	private Integer id;
	private String code;
	private String shortName;
	private String fullName;
	private Integer columns;
	private String inputYears;
	private String internalValidation;
	private String externalValidation;

	// Constructors

	/** default constructor */
	public CfsRptType() {
	}

	/** full constructor */
	public CfsRptType(String code, String shortName, String fullName,
			Integer columns,String inputYears,String internalValidation,String externalValidation) {
		this.code = code;
		this.shortName = shortName;
		this.fullName = fullName;
		this.columns = columns;
		this.inputYears=inputYears;
		this.internalValidation=internalValidation;
		this.externalValidation=externalValidation;
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

	public Integer getColumns() {
		return this.columns;
	}

	public void setColumns(Integer columns) {
		this.columns = columns;
	}

	public String getInputYears() {
		return inputYears;
	}

	public void setInputYears(String inputYears) {
		this.inputYears = inputYears;
	}

	public String getInternalValidation() {
		return internalValidation;
	}

	public String getExternalValidation() {
		return externalValidation;
	}

	public void setInternalValidation(String internalValidation) {
		this.internalValidation = internalValidation;
	}

	public void setExternalValidation(String externalValidation) {
		this.externalValidation = externalValidation;
	}

}