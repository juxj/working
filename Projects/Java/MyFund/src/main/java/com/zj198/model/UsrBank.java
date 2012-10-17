package com.zj198.model;

import com.zj198.util.Constants;
import com.zj198.util.StringUtil;

/**
 * UsrBank entity. @author MyEclipse Persistence Tools
 */

public class UsrBank implements java.io.Serializable {

	private static final long serialVersionUID = 4768862790628908907L;
	private Integer userid;
	private Integer bankid;
	private String detailname;
	private String linkname;
	private Short linkgenderr;
	private String linkemail;
	private String linktelephone;
	private String department;
	private String position;
	private String remarks;
	private Integer completerate;
	private Integer provinceid;
	private Integer cityid;
	private Integer districtid;
	private String address;
	private String postcode;

	/** default constructor */
	public UsrBank() {
	}

	/**保护审核字段*** @param usrBank*/       
	public void setAuditFields( UsrBank usrBank) {
		this.linkname = usrBank.linkname;
		this.linkgenderr = usrBank.linkgenderr;
		this.linkemail = usrBank.linkemail;
		this.linktelephone = usrBank.linktelephone;
		this.department = usrBank.department;
		this.position = usrBank.position;
		this.remarks = usrBank.remarks;
		this.provinceid = usrBank.provinceid;
		this.cityid = usrBank.cityid;
		this.districtid = usrBank.districtid;
		this.address = usrBank.address;
		this.postcode = usrBank.postcode;
	}
	/**验证银行信息审核字段 // 返回字段以0#或1#开头   0#验证正确  1#验证失败*/
	public String validAuditFields(UsrBank usrBank){
		String msg="1#";
		if(!StringUtil.validlength(usrBank.bankid.toString(), 10)){
			msg+="银行名称填写错误。";
			return msg;
		}
		if(!StringUtil.validString(usrBank.detailname) || !StringUtil.validlength(usrBank.detailname, 30)){
			msg+="分行或支行名称填写错误。";
			return msg;
		}
		if(!StringUtil.validRname(usrBank.linkname) || !StringUtil.validlength(usrBank.linkname, 8)){
			msg+="联系人姓名填写错误，只能为中文。";
			return msg;
		}
		if(usrBank.linkgenderr!=null && usrBank.linkgenderr!=Constants.USER_GENDER_FEMALE && usrBank.linkgenderr!=Constants.USER_GENDER_MALE){
			msg+="请正确选择联系人性别。";
			return msg;
		}
		if(!StringUtil.validEmail(usrBank.linkemail) || !StringUtil.validlength(usrBank.linkemail, 32)){
			msg+="联系人邮箱填写错误。";
			return msg;
		}
		if(!StringUtil.validMobile(usrBank.linktelephone)){
			msg+="联系人电话填写错误。";
			return msg;
		}
		if(!StringUtil.validString(usrBank.department) || !StringUtil.validlength(usrBank.department, 12)){
			msg+="所属部门填写错误。";
			return msg;
		}
		if(!StringUtil.validString(usrBank.position) || !StringUtil.validlength(usrBank.position, 8)){
			msg+="职位填写错误。";
			return msg;
		}
		if(!StringUtil.validlength(usrBank.remarks, 250)){
			msg+="服务介绍填写大于200个字符。";
			return msg;
		}
		if(!StringUtil.validAddress(usrBank.address) || !StringUtil.validlength(usrBank.address, 32)){
			msg+="详细地址填写错误。";
			return msg;
		}
		if(!StringUtil.validCode(usrBank.postcode)){
			msg+="邮政编码填写错误。";
			return msg;
		}
		msg="0#";
		return msg;
	}
//	/**停用  */
//	/**非审核非必填字段 对审核字段的保护 在待审核状态下使用**@param usrBank*/
//	public void setOthersFields(UsrBank usrBank) {
//		
//	}
//	/**停用  */
//	/**验证银行信息非审核非必填字段 // 返回字段以0#或1#开头   0#验证正确  1#验证失败*/
//	public String validOthersFields(UsrBank usrBank){
//		String msg="1#";
//		
//		msg="0#";
//		return msg;
//	}
	// Property accessors
	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public Integer getBankid() {
		return this.bankid;
	}

	public void setBankid(Integer bankid) {
		this.bankid = bankid;
	}

	public String getDetailname() {
		return this.detailname;
	}

	public void setDetailname(String detailname) {
		this.detailname = detailname;
	}

	public String getLinkname() {
		return this.linkname;
	}

	public void setLinkname(String linkname) {
		this.linkname = linkname;
	}

	public Short getLinkgenderr() {
		return this.linkgenderr;
	}

	public void setLinkgenderr(Short linkgenderr) {
		this.linkgenderr = linkgenderr;
	}

	public String getLinkemail() {
		return this.linkemail;
	}

	public void setLinkemail(String linkemail) {
		this.linkemail = linkemail;
	}

	public String getLinktelephone() {
		return this.linktelephone;
	}

	public void setLinktelephone(String linktelephone) {
		this.linktelephone = linktelephone;
	}

	public String getDepartment() {
		return this.department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getPosition() {
		return this.position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getRemarks() {
		return this.remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Integer getCompleterate() {
		return completerate;
	}

	public void setCompleterate(Integer completerate) {
		this.completerate = completerate;
	}
	public Integer getProvinceid() {
		return provinceid;
	}
	public void setProvinceid(Integer provinceid) {
		this.provinceid = provinceid;
	}
	public Integer getCityid() {
		return cityid;
	}
	public void setCityid(Integer cityid) {
		this.cityid = cityid;
	}
	public Integer getDistrictid() {
		return districtid;
	}
	public void setDistrictid(Integer districtid) {
		this.districtid = districtid;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
}