package com.zj198.model;

import java.util.Date;

import com.zj198.util.DateUtil;
import com.zj198.util.StringUtil;

/**
 * UsrPerson entity. @author MyEclipse Persistence Tools
 */

public class UsrPerson implements java.io.Serializable {

	private static final long serialVersionUID = -7991545208281323048L;
	private Integer userid;
	private String cid;
	private Integer provinceid;
	private Date birthday;
	private Integer education;
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
	
	/** default constructor */
	public UsrPerson() {
	}

//	/**停用******/
//	/**保护审核字段*** @param usrPerson*/       
//	public void setAuditFields(UsrPerson usrPerson) {
//		
//	}
//	/**停用******/
//	/**验证审核字段 // 返回字段以0#或1#开头   0#验证正确  1#验证失败*/
//	public String validAuditFields(UsrPerson usrPerson){
//		String msg="1#";
//		
//		msg="0#";
//		return msg;
//	}
//	/**非审核非必填字段 对审核字段的保护 在待审核状态下使用*/
//	public void setOthersFields(UsrPerson usrPerson) {
//		this.provinceid = usrPerson.provinceid;
//		this.education = usrPerson.education;
//		this.cityid = usrPerson.cityid;
//		this.districtid = usrPerson.districtid;
//		this.address = usrPerson.address;
//		this.postcode = usrPerson.postcode;
//		this.careerid = usrPerson.careerid;
//		this.telephone = usrPerson.telephone;
//		this.im1type = usrPerson.im1type;
//		this.im1 = usrPerson.im1;
//		this.im2type = usrPerson.im2type;
//		this.im2 = usrPerson.im2;
//		this.im3type = usrPerson.im3type;
//		this.im3 = usrPerson.im3;
//		this.cid = usrPerson.cid;
//		this.birthday = usrPerson.birthday;
//	}
	/**验证非审核非必填字段 // 返回字段以0#或1#开头   0#验证正确  1#验证失败*/
	public String validOthersFields(UsrPerson usrPerson){
		String msg="1#";
		if(!StringUtil.validAddress(usrPerson.address) || !StringUtil.validlength(usrPerson.address, 32)){
			msg+="详细地址填写错误。";
			return msg;
		}
		if(!StringUtil.validCode(usrPerson.postcode)){
			msg+="邮政编码填写错误。";
			return msg;
		}
		if(!StringUtil.validPhone(usrPerson.telephone)){
			msg+="固定电话填写错误。";
			return msg;
		}
		if(!StringUtil.validContacInfo(usrPerson.getIm1()) || !StringUtil.validContacInfo(usrPerson.getIm2()) || !StringUtil.validContacInfo(usrPerson.getIm3())){
			msg+="联系方式填写错误";
			return msg;
		}
		if(!StringUtil.validCID(usrPerson.cid)){
			msg+="身份证号码填写错误";
			return msg;
		}
		if(!DateUtil.validDate(usrPerson.getBirthday())){
			msg+="生日不大于18周岁";
			return msg;
		}
		msg="0#";
		return msg;
	}
	// Property accessors
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
		return completerate;
	}

	public void setCompleterate(Integer completerate) {
		this.completerate = completerate;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public Integer getEducation() {
		return education;
	}

	public void setEducation(Integer education) {
		this.education = education;
	}
}