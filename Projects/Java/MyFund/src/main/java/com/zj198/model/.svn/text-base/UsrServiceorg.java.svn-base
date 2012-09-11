package com.zj198.model;

import java.util.Date;
import java.util.List;

import com.zj198.util.Constants;
import com.zj198.util.StringUtil;

/**
 * UsrServiceorg entity. @author MyEclipse Persistence Tools
 */

public class UsrServiceorg implements java.io.Serializable {

	private static final long serialVersionUID = 118033208121229435L;
	private Integer userid;
	private String orgname;
	private String licensecode;
	private String organizationcode;
	private String faxcode;
	private String legalperson;
	private Integer regprovinceid;
	private Integer regcityid;
	private Integer regdistrictid;
	private String regaddress;
	private String regpostcode;
	private Date registerdate;
	private Double registeredcapital;
	private Integer orgtypeid;
	private Integer bizprovinceid;
	private Integer bizcityid;
	private Integer bizdistrictid;
	private String bizaddress;
	private String bizpostcode;
	private String linkname;
	private Short linkgender;
	private String linkemail;
	private String linktelephone;
	private String department;
	private String position;
	private String remarks;
	private Integer completerate;
	private String serviceproduct;
	
	/** default constructor */
	public UsrServiceorg() {
	}
//	/**保护审核字段*** @param usrServiceorg*/       
//	public void setAuditFields(UsrServiceorg usrServiceorg) {
//		this.orgname = usrServiceorg.orgname;                    //机构名称
//		this.licensecode = usrServiceorg.licensecode;            //营业执照号码
//		this.organizationcode = usrServiceorg.organizationcode;  //组织机构号码证
//		this.faxcode = usrServiceorg.faxcode;                    //税务登记证
//		this.regprovinceid = usrServiceorg.regprovinceid;        //注册地址省id
//		this.regcityid = usrServiceorg.regcityid;                //注册地址城市id
//		this.regdistrictid = usrServiceorg.regdistrictid;        //注册地址区县id
//		this.regaddress = usrServiceorg.regaddress;              //注册地址详细地址
//		this.regpostcode = usrServiceorg.regpostcode;            //注册地址邮政编码
//		this.registerdate = usrServiceorg.registerdate;          //注册日期
//		this.legalperson = usrServiceorg.legalperson;
//		this.registeredcapital = usrServiceorg.registeredcapital;
//		this.orgtypeid = usrServiceorg.orgtypeid;
//		this.bizprovinceid = usrServiceorg.bizprovinceid;
//		this.bizcityid = usrServiceorg.bizcityid;
//		this.bizdistrictid = usrServiceorg.bizdistrictid;
//		this.bizaddress = usrServiceorg.bizaddress;
//		this.bizpostcode = usrServiceorg.bizpostcode;
//		this.linkname = usrServiceorg.linkname;
//		this.linkgender = usrServiceorg.linkgender;
//		this.linkemail = usrServiceorg.linkemail;
//		this.linktelephone = usrServiceorg.linktelephone;
//		this.department = usrServiceorg.department;
//		this.position = usrServiceorg.position;
//		this.remarks = usrServiceorg.remarks;
//		this.serviceproduct = usrServiceorg.serviceproduct;
//	}
	/**验证审核字段 // 返回字段以0#或1#开头   0#验证正确  1#验证失败*/
	public String validAuditFields(UsrServiceorg usrServiceorg) {
		String msg="1#";
		if(!StringUtil.validString(usrServiceorg.orgname) || !StringUtil.validlength(usrServiceorg.orgname, 32)){
			msg+="服务机构名称填写错误。";
			return msg;
		}
		if(!StringUtil.validLicCode(usrServiceorg.licensecode) || !StringUtil.validlength(usrServiceorg.licensecode, 15)){
			msg+="营业执照号码填写错误。";
			return msg;
		}
		if(!StringUtil.validOrganization(usrServiceorg.organizationcode) || !StringUtil.validlength(usrServiceorg.organizationcode, 10)){
			msg+="组织机构代码证号码填写错误。";
			return msg;
		}
		if(!StringUtil.validLicCode(usrServiceorg.faxcode) || !StringUtil.validlength(usrServiceorg.faxcode, 15)){
			msg+="税务登记证号码填写错误。";
			return msg;
		}
		if(!StringUtil.validAddress(usrServiceorg.regaddress) || !StringUtil.validlength(usrServiceorg.regaddress, 32)){
			msg+="注册详细地址填写错误。";
			return msg;
		}
		if(!StringUtil.validCode(usrServiceorg.regpostcode)){
			msg+="注册地址邮政编码填写错误。";
			return msg;
		}
		if(!StringUtil.validRname(usrServiceorg.legalperson)){
			msg+="法人姓名填写错误，只能为中文。";
			return msg;
		}
		if(!StringUtil.validDouble(usrServiceorg.registeredcapital) || !StringUtil.validlengthD(usrServiceorg.registeredcapital, 12)){
			msg+="注册资本填写错误,只能为整数字且不大于12个字符。";
			return msg;
		}
		if(!StringUtil.validString(usrServiceorg.bizaddress) || !StringUtil.validlength(usrServiceorg.bizaddress, 32)){
			msg+="经营详细地址填写错误。";
			return msg;
		}
		if(!StringUtil.validCode(usrServiceorg.bizpostcode)){
			msg+="注册地址邮政编码填写错误。";
			return msg;
		}
		if(!StringUtil.validRname(usrServiceorg.linkname)){
			msg+="联系人姓名填写错误，只能为中文。";
			return msg;
		}
		if(usrServiceorg.linkgender!=null && usrServiceorg.linkgender!=Constants.USER_GENDER_FEMALE && usrServiceorg.linkgender!=Constants.USER_GENDER_MALE){
			msg+="请选择联系人性别。";
			return msg;
		}
		if(!StringUtil.validString(usrServiceorg.department) || !StringUtil.validlength(usrServiceorg.department, 8)){
			msg+="联系人所属部门填写错误。";
			return msg;
		}
		if(!StringUtil.validString(usrServiceorg.position) || !StringUtil.validlength(usrServiceorg.position, 8)){
			msg+="联系人职位填写错误。";
			return msg;
		}
		if(!StringUtil.validlength(usrServiceorg.remarks, 250)){
			msg+="服务机构介绍填写字符过长，200个字符以内。";
			return msg;
		}
		if(!StringUtil.validEmail(usrServiceorg.linkemail)){
			msg+="联系人邮箱填写错误。";
			return msg;
		}
		if(!StringUtil.validMobile(usrServiceorg.linktelephone)){
			msg+="联系人电话填写错误。";
			return msg;
		}
		if(!StringUtil.validlength(usrServiceorg.serviceproduct, 50)){
			msg+="服务产品填写错误。";
			return msg;
		}
		msg="0#";
		return msg;
	}
//	/**非审核非必填字段 对审核字段的保护 在待审核状态下使用*/
//	public void setOthersFields(UsrServiceorg usrServiceorg){
//		
//	}
//	/**验证非审核非必填字段 // 返回字段以0#或1#开头   0#验证正确  1#验证失败*/
//	public String validOthersFields(UsrServiceorg usrServiceorg){
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

	public String getOrgname() {
		return this.orgname;
	}

	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}

	public String getLicensecode() {
		return this.licensecode;
	}

	public void setLicensecode(String licensecode) {
		this.licensecode = licensecode;
	}

	public String getOrganizationcode() {
		return this.organizationcode;
	}

	public void setOrganizationcode(String organizationcode) {
		this.organizationcode = organizationcode;
	}

	public String getFaxcode() {
		return this.faxcode;
	}

	public void setFaxcode(String faxcode) {
		this.faxcode = faxcode;
	}

	public String getLegalperson() {
		return this.legalperson;
	}

	public void setLegalperson(String legalperson) {
		this.legalperson = legalperson;
	}

	public Integer getRegprovinceid() {
		return this.regprovinceid;
	}

	public void setRegprovinceid(Integer regprovinceid) {
		this.regprovinceid = regprovinceid;
	}

	public Integer getRegcityid() {
		return this.regcityid;
	}

	public void setRegcityid(Integer regcityid) {
		this.regcityid = regcityid;
	}

	public Integer getRegdistrictid() {
		return this.regdistrictid;
	}

	public void setRegdistrictid(Integer regdistrictid) {
		this.regdistrictid = regdistrictid;
	}

	public String getRegaddress() {
		return this.regaddress;
	}

	public void setRegaddress(String regaddress) {
		this.regaddress = regaddress;
	}

	public String getRegpostcode() {
		return this.regpostcode;
	}

	public void setRegpostcode(String regpostcode) {
		this.regpostcode = regpostcode;
	}

	public Date getRegisterdate() {
		return this.registerdate;
	}

	public void setRegisterdate(Date registerdate) {
		this.registerdate = registerdate;
	}

	public Double getRegisteredcapital() {
		return this.registeredcapital;
	}

	public void setRegisteredcapital(Double registeredcapital) {
		this.registeredcapital = registeredcapital;
	}

	public Integer getOrgtypeid() {
		return this.orgtypeid;
	}

	public void setOrgtypeid(Integer orgtypeid) {
		this.orgtypeid = orgtypeid;
	}

	public Integer getBizprovinceid() {
		return this.bizprovinceid;
	}

	public void setBizprovinceid(Integer bizprovinceid) {
		this.bizprovinceid = bizprovinceid;
	}

	public Integer getBizcityid() {
		return this.bizcityid;
	}

	public void setBizcityid(Integer bizcityid) {
		this.bizcityid = bizcityid;
	}

	public Integer getBizdistrictid() {
		return this.bizdistrictid;
	}

	public void setBizdistrictid(Integer bizdistrictid) {
		this.bizdistrictid = bizdistrictid;
	}

	public String getBizaddress() {
		return this.bizaddress;
	}

	public void setBizaddress(String bizaddress) {
		this.bizaddress = bizaddress;
	}

	public String getBizpostcode() {
		return this.bizpostcode;
	}

	public void setBizpostcode(String bizpostcode) {
		this.bizpostcode = bizpostcode;
	}

	public String getLinkname() {
		return this.linkname;
	}

	public void setLinkname(String linkname) {
		this.linkname = linkname;
	}

	public Short getLinkgender() {
		return this.linkgender;
	}

	public void setLinkgender(Short linkgender) {
		this.linkgender = linkgender;
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

	public String getLinkemail() {
		return linkemail;
	}

	public void setLinkemail(String linkemail) {
		this.linkemail = linkemail;
	}

	public String getLinktelephone() {
		return linktelephone;
	}

	public void setLinktelephone(String linktelephone) {
		this.linktelephone = linktelephone;
	}

	public String getServiceproduct() {
		return serviceproduct;
	}

	public void setServiceproduct(String serviceproduct) {
		this.serviceproduct = serviceproduct;
	}
	//显示用
	public List<String> getServiceproductList(){
		return StringUtil.getStringList(serviceproduct);
	}
}