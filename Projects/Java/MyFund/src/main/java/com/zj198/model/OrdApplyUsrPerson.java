package com.zj198.model;

import java.util.Date;

/**
 * OrdApplyUsrPerson entity. @author MyEclipse Persistence Tools
 */

public class OrdApplyUsrPerson implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer applyId;
	private Integer userid;
	private String cid;
	private Integer provinceid;
	private Integer cityid;
	private Integer districtid;
	private String address;
	private String postcode;
	private Integer careerid;
	private String telephone;
	private Integer im1type;
	private String im1;
	private Integer im2type;
	private String im2;
	private Integer im3type;
	private String im3;
	private Integer completerate;
	private Integer education;
	private Date birthday;

	// Constructors

	/** default constructor */
	public OrdApplyUsrPerson() {
	}

	/** minimal constructor */
	public OrdApplyUsrPerson(Integer userid) {
		this.userid = userid;
	}

	/** full constructor */
	public OrdApplyUsrPerson(Integer applyId, Integer userid, String cid,
			Integer provinceid, Integer cityid, Integer districtid,
			String address, String postcode, Integer careerid,
			String telephone, Integer im1type, String im1, Integer im2type,
			String im2, Integer im3type, String im3, Integer completerate,
			Integer education, Date birthday) {
		this.applyId = applyId;
		this.userid = userid;
		this.cid = cid;
		this.provinceid = provinceid;
		this.cityid = cityid;
		this.districtid = districtid;
		this.address = address;
		this.postcode = postcode;
		this.careerid = careerid;
		this.telephone = telephone;
		this.im1type = im1type;
		this.im1 = im1;
		this.im2type = im2type;
		this.im2 = im2;
		this.im3type = im3type;
		this.im3 = im3;
		this.completerate = completerate;
		this.education = education;
		this.birthday = birthday;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getApplyId() {
		return this.applyId;
	}

	public void setApplyId(Integer applyId) {
		this.applyId = applyId;
	}

	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getCid() {
		return this.cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public Integer getProvinceid() {
		return this.provinceid;
	}

	public void setProvinceid(Integer provinceid) {
		this.provinceid = provinceid;
	}

	public Integer getCityid() {
		return this.cityid;
	}

	public void setCityid(Integer cityid) {
		this.cityid = cityid;
	}

	public Integer getDistrictid() {
		return this.districtid;
	}

	public void setDistrictid(Integer districtid) {
		this.districtid = districtid;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPostcode() {
		return this.postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public Integer getCareerid() {
		return this.careerid;
	}

	public void setCareerid(Integer careerid) {
		this.careerid = careerid;
	}

	public String getTelephone() {
		return this.telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public Integer getIm1type() {
		return this.im1type;
	}

	public void setIm1type(Integer im1type) {
		this.im1type = im1type;
	}

	public String getIm1() {
		return this.im1;
	}

	public void setIm1(String im1) {
		this.im1 = im1;
	}

	public Integer getIm2type() {
		return this.im2type;
	}

	public void setIm2type(Integer im2type) {
		this.im2type = im2type;
	}

	public String getIm2() {
		return this.im2;
	}

	public void setIm2(String im2) {
		this.im2 = im2;
	}

	public Integer getIm3type() {
		return this.im3type;
	}

	public void setIm3type(Integer im3type) {
		this.im3type = im3type;
	}

	public String getIm3() {
		return this.im3;
	}

	public void setIm3(String im3) {
		this.im3 = im3;
	}

	public Integer getCompleterate() {
		return this.completerate;
	}

	public void setCompleterate(Integer completerate) {
		this.completerate = completerate;
	}

	public Integer getEducation() {
		return this.education;
	}

	public void setEducation(Integer education) {
		this.education = education;
	}

	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

}