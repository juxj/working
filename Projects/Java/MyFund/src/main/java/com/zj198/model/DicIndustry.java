package com.zj198.model;

/**
 * DicIndustry entity. @author MyEclipse Persistence Tools
 */

public class DicIndustry implements java.io.Serializable {

	private static final long serialVersionUID = -5909997323537840355L;
	private Integer id;
	private String name;
	private Integer parentid;
	private Integer seq;

	/** default constructor */
	public DicIndustry() {
	}

	// Property accessors
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getParentid() {
		return parentid;
	}

	public void setParentid(Integer parentid) {
		this.parentid = parentid;
	}

	public Integer getSeq() {
		return seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
	}

}