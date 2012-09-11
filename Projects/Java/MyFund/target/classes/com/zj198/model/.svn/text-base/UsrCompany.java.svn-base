package com.zj198.model;

import java.util.Date;

import com.zj198.util.Constants;
import com.zj198.util.StringUtil;

/**
 * UsrCompany entity. @author MyEclipse Persistence Tools
 */

public class UsrCompany implements java.io.Serializable {

	private static final long serialVersionUID = 4707900699553079060L;
	private Integer userid;
	private String companyname;
	private String licensecode;
	private String organizationcode;
	private String faxcode;
	private String bankpermitcode;
	private String loancard;
	private String legalperson;
	private Integer regprovinceid;
	private Integer regcityid;
	private Integer regdistrictid;
	private String regaddress;
	private String regpostcode;
	private Date registerdate;
	private Double registeredcapital;
	private Integer enterprisetypeid;
	private Integer employeesid;
	private Integer industryparentid;
	private Integer industryid;
	private String bizscope;
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
	private Integer lpeducation;
	private Integer lpmarry;
	private Integer lpindustryyears;
	private String lpcid;
	private String lpmobile;
	private String lphometel;
	private Integer lpliveprovinceid;
	private Integer lplivecityid;
	private Integer lplivedistrictid;
	private String lpliveaddress;
	private String lplivepostcode;
	private Integer lphkprovinceid;
	private Integer lphkcityid;
	private Integer lphkdistrictid;
	private String lphkaddress;
	private String lphkpostcode;
	private Integer completeratebase;

	/** default constructor */
	public UsrCompany() {
	}
	
	/**保护审核字段*** @param usrCompany*/
	public void setAuditFields(UsrCompany usrCompany) {
		this.companyname = usrCompany.companyname;
		this.licensecode = usrCompany.licensecode;
		this.organizationcode = usrCompany.organizationcode;
		this.industryparentid = usrCompany.industryparentid;
		this.industryid = usrCompany.industryid;
		this.bizprovinceid = usrCompany.bizprovinceid;
		this.bizcityid = usrCompany.bizcityid;
		this.bizdistrictid = usrCompany.bizdistrictid;
		this.bizaddress = usrCompany.bizaddress;
		this.bizpostcode = usrCompany.bizpostcode;
		this.linkname = usrCompany.linkname;
		this.linkgender = usrCompany.linkgender;
		this.linkemail = usrCompany.linkemail;
		this.linktelephone = usrCompany.linktelephone;
	}
	/**验证审核字段 // 返回字段以0#或1#开头   0#验证正确  1#验证失败*/
	public String validAuditFields(UsrCompany usrCompany) {
		String msg="1#";
		if(!StringUtil.validString(usrCompany.companyname) || !StringUtil.validlength(usrCompany.companyname, 30)){
			msg+="企业名称填写错误。";
			return msg;
		}
		if(!StringUtil.validLicCode(usrCompany.licensecode) || !StringUtil.validlength(usrCompany.licensecode, 15)){
			msg+="营业执照号码填写错误。";
			return msg;
		}
		if(!StringUtil.validOrganization(usrCompany.organizationcode) || !StringUtil.validlength(usrCompany.organizationcode, 10)){
			msg+="组织机构代码号码填写错误。";
			return msg;
		}
		if(!StringUtil.validAddress(usrCompany.bizaddress) || !StringUtil.validlength(usrCompany.bizaddress, 32)){
			msg+="经营详细地址填写错误。";
			return msg;
		}
		if(!StringUtil.validCode(usrCompany.bizpostcode)){
			msg+="经营地址邮编填写错误。";
			return msg;
		}
		if(!StringUtil.validRname(usrCompany.linkname)){
			msg+="联系人姓名填写错误，只能为中文。";
			return msg;
		}
		if(usrCompany.linkgender!=null && usrCompany.linkgender!=Constants.USER_GENDER_FEMALE && usrCompany.linkgender!=Constants.USER_GENDER_MALE){
			msg+="请正确选择联系人性别。";
			return msg;
		}
		if(!StringUtil.validEmail(usrCompany.linkemail)){
			msg+="联系人邮箱填写错误。";
			return msg;
		}
		if(!StringUtil.validMobile(usrCompany.linktelephone)){
			msg+="联系人电话填写错误。";
			return msg;
		}
		msg="0#";
		return msg;
	}
	/**融资申请必填字段** @param this* @param usrCompany*/
	public void setLoanFields(UsrCompany usrCompany) {
		this.faxcode = usrCompany.faxcode;
		this.bankpermitcode = usrCompany.bankpermitcode;
		this.loancard = usrCompany.loancard;
		this.legalperson = usrCompany.legalperson;
		this.regprovinceid = usrCompany.regprovinceid;
		this.regcityid = usrCompany.regcityid;
		this.regdistrictid = usrCompany.regdistrictid;
		this.regaddress = usrCompany.regaddress;
		this.regpostcode = usrCompany.regpostcode;
		this.registerdate = usrCompany.registerdate;
		this.registeredcapital = usrCompany.registeredcapital;
		this.enterprisetypeid = usrCompany.enterprisetypeid;
		this.employeesid = usrCompany.employeesid;
		this.bizscope = usrCompany.bizscope;
		this.department = usrCompany.department;
		this.position = usrCompany.position;
		this.lpeducation = usrCompany.lpeducation;
		this.lpmarry = usrCompany.lpmarry;
		this.lpindustryyears = usrCompany.lpindustryyears;
		this.lpcid = usrCompany.lpcid;
		this.lpmobile = usrCompany.lpmobile;
		this.lphometel = usrCompany.lphometel;
		this.lpliveprovinceid = usrCompany.lpliveprovinceid;
		this.lplivecityid = usrCompany.lplivecityid;
		this.lplivedistrictid = usrCompany.lplivedistrictid;
		this.lpliveaddress = usrCompany.lpliveaddress;
		this.lplivepostcode = usrCompany.lplivepostcode;
		this.lphkprovinceid = usrCompany.lphkprovinceid;
		this.lphkcityid = usrCompany.lphkcityid;
		this.lphkdistrictid = usrCompany.lphkdistrictid;
		this.lphkaddress = usrCompany.lphkaddress;
		this.lphkpostcode = usrCompany.lphkpostcode;
	}
	/**验证融资申请必填字段 // 返回字段以0#或1#开头   0#验证正确  1#验证失败*/
	public String validLoanFields(UsrCompany usrCompany) {
		String msg="1#";
		if(!StringUtil.validLicCode(usrCompany.faxcode) || !StringUtil.validlength(usrCompany.faxcode, 15)){
			msg+="税务登记证号码填写错误。";
			return msg;
		}
		if(!StringUtil.validLicCode(usrCompany.loancard) || !StringUtil.validlength(usrCompany.loancard, 30)){
			msg+="贷款卡号填写错误。";
			return msg;
		}
		if(!StringUtil.validAddress(usrCompany.regaddress) || !StringUtil.validlength(usrCompany.regaddress, 32)){
			msg+="注册详细地址填写错误。";
			return msg;
		}
		if(!StringUtil.validCode(usrCompany.regpostcode)){
			msg+="注册地址邮编填写错误。";
			return msg;
		}
		if(!StringUtil.validLicCode(usrCompany.bankpermitcode) || !StringUtil.validlength(usrCompany.bankpermitcode, 30)){
			msg+="开户许可证号码填写错误。";
			return msg;
		}
		if(!StringUtil.validRname(usrCompany.legalperson)){
			msg+="法人填写错误。";
			return msg;
		}
		if(!StringUtil.validDouble(usrCompany.registeredcapital) || !StringUtil.validlengthD(usrCompany.registeredcapital, 12)){
			msg+="注册资本填写错误,只能为数字或小数点后面为0且不大于12个字符。";
			return msg;
		}
		if(!StringUtil.validlength(usrCompany.bizscope, 250)){
			msg+="经营范围填写字符过长，200个字符以内。";
			return msg;
		}
		if(!StringUtil.validString(usrCompany.department) || !StringUtil.validlength(usrCompany.department, 8)){
			msg+="联系人所属部门填写错误。";
			return msg;
		}
		if(!StringUtil.validString(usrCompany.position) || !StringUtil.validlength(usrCompany.position, 8)){
			msg+="联系人职位填写错误。";
			return msg;
		}
		if(!StringUtil.validCID(usrCompany.lpcid)){
			msg+="法人身份证号填写错误。";
			return msg;
		}
		if(!StringUtil.validMobile(usrCompany.lpmobile)){
			msg+="法人手机号码填写错误。";
			return msg;
		}
		if(!StringUtil.validPhone(usrCompany.lphometel)){
			msg+="法人家庭电话填写错误。";
			return msg;
		}
		if(!StringUtil.validAddress(usrCompany.lpliveaddress) || !StringUtil.validlength(usrCompany.lpliveaddress, 32)){
			msg+="法人常住详细地址写错误。";
			return msg;
		}
		if(!StringUtil.validCode(usrCompany.lplivepostcode)){
			msg+="法人常住地址邮政编码填写错误。";
			return msg;
		}
		if(!StringUtil.validAddress(usrCompany.lphkaddress) || !StringUtil.validlength(usrCompany.lphkaddress, 32)){
			msg+="法人户口地址填写错误。";
			return msg;
		}
		if(!StringUtil.validCode(usrCompany.lphkpostcode)){
			msg+="法人户口邮政编码填写错误。";
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

	public String getCompanyname() {
		return this.companyname;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
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

	public String getBankpermitcode() {
		return this.bankpermitcode;
	}

	public void setBankpermitcode(String bankpermitcode) {
		this.bankpermitcode = bankpermitcode;
	}

	public String getLoancard() {
		return this.loancard;
	}

	public void setLoancard(String loancard) {
		this.loancard = loancard;
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

	public Integer getEnterprisetypeid() {
		return this.enterprisetypeid;
	}

	public void setEnterprisetypeid(Integer enterprisetypeid) {
		this.enterprisetypeid = enterprisetypeid;
	}

	public Integer getEmployeesid() {
		return this.employeesid;
	}

	public void setEmployeesid(Integer employeesid) {
		this.employeesid = employeesid;
	}

	public Integer getIndustryid() {
		return this.industryid;
	}

	public void setIndustryid(Integer industryid) {
		this.industryid = industryid;
	}

	public Integer getIndustryparentid() {
		return industryparentid;
	}

	public void setIndustryparentid(Integer industryparentid) {
		this.industryparentid = industryparentid;
	}

	public String getBizscope() {
		return this.bizscope;
	}

	public void setBizscope(String bizscope) {
		this.bizscope = bizscope;
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

	public Integer getLpeducation() {
		return this.lpeducation;
	}

	public void setLpeducation(Integer lpeducation) {
		this.lpeducation = lpeducation;
	}

	public Integer getLpmarry() {
		return this.lpmarry;
	}

	public void setLpmarry(Integer lpmarry) {
		this.lpmarry = lpmarry;
	}

	public Integer getLpindustryyears() {
		return this.lpindustryyears;
	}

	public void setLpindustryyears(Integer lpindustryyears) {
		this.lpindustryyears = lpindustryyears;
	}

	public String getLpcid() {
		return this.lpcid;
	}

	public void setLpcid(String lpcid) {
		this.lpcid = lpcid;
	}

	public String getLpmobile() {
		return this.lpmobile;
	}

	public void setLpmobile(String lpmobile) {
		this.lpmobile = lpmobile;
	}

	public String getLphometel() {
		return this.lphometel;
	}

	public void setLphometel(String lphometel) {
		this.lphometel = lphometel;
	}

	public Integer getLpliveprovinceid() {
		return this.lpliveprovinceid;
	}

	public void setLpliveprovinceid(Integer lpliveprovinceid) {
		this.lpliveprovinceid = lpliveprovinceid;
	}

	public Integer getLplivecityid() {
		return this.lplivecityid;
	}

	public void setLplivecityid(Integer lplivecityid) {
		this.lplivecityid = lplivecityid;
	}

	public Integer getLplivedistrictid() {
		return this.lplivedistrictid;
	}

	public void setLplivedistrictid(Integer lplivedistrictid) {
		this.lplivedistrictid = lplivedistrictid;
	}

	public String getLpliveaddress() {
		return this.lpliveaddress;
	}

	public void setLpliveaddress(String lpliveaddress) {
		this.lpliveaddress = lpliveaddress;
	}

	public String getLplivepostcode() {
		return this.lplivepostcode;
	}

	public void setLplivepostcode(String lplivepostcode) {
		this.lplivepostcode = lplivepostcode;
	}

	public Integer getLphkprovinceid() {
		return this.lphkprovinceid;
	}

	public void setLphkprovinceid(Integer lphkprovinceid) {
		this.lphkprovinceid = lphkprovinceid;
	}

	public Integer getLphkcityid() {
		return this.lphkcityid;
	}

	public void setLphkcityid(Integer lphkcityid) {
		this.lphkcityid = lphkcityid;
	}

	public Integer getLphkdistrictid() {
		return this.lphkdistrictid;
	}

	public void setLphkdistrictid(Integer lphkdistrictid) {
		this.lphkdistrictid = lphkdistrictid;
	}

	public String getLphkaddress() {
		return this.lphkaddress;
	}

	public void setLphkaddress(String lphkaddress) {
		this.lphkaddress = lphkaddress;
	}

	public String getLphkpostcode() {
		return this.lphkpostcode;
	}

	public void setLphkpostcode(String lphkpostcode) {
		this.lphkpostcode = lphkpostcode;
	}

	public Integer getCompleteratebase() {
		return completeratebase;
	}

	public void setCompleteratebase(Integer completeratebase) {
		this.completeratebase = completeratebase;
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

}