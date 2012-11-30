package com.zj198.model;

import java.util.Date;

/**
 * UsrUser entity. @author MyEclipse Persistence Tools
 */

public class UsrUser implements java.io.Serializable {

	private static final long serialVersionUID = 2145802999065739257L;
	private Integer id;
	private Short type;
	private String username;
	private String password;
	private String realname;
	private Short gender;
	private Date createdt;
	private Date updatedt;
	private Short status;
	private String mobile;
	private String email;
	private String passtoken;
	private String activecode;
	private Short activetype;
	private Short auditstatus;
	private String avatar;
	private Integer viptype;
	private String logo;
	private Integer oldid;
	
	private Integer userTypeGroup;//非数据库映射对象

	/** default constructor */
	public UsrUser() {
	}

	//简单用户对象，用于存放登录用户在session中
	public UsrUser(Integer id, Short type,String username, String realname, String email, String mobile,Short gender,Short status,Short activetype, Short auditstatus,Integer userTypeGroup,String avatar,Integer viptype) {
		super();
		this.id = id;
		this.type = type;
		this.username = username;
		this.realname = realname;
		this.email = email;
		this.mobile = mobile;
		this.gender = gender;
		this.status = status;
		this.activetype = activetype;
		this.auditstatus = auditstatus;
		this.userTypeGroup = userTypeGroup;
		this.avatar=avatar;
		this.viptype=viptype;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Short getType() {
		return this.type;
	}

	public void setType(Short type) {
		this.type = type;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getCreatedt() {
		return this.createdt;
	}

	public void setCreatedt(Date createdt) {
		this.createdt = createdt;
	}

	public Date getUpdatedt() {
		return this.updatedt;
	}

	public void setUpdatedt(Date updatedt) {
		this.updatedt = updatedt;
	}

	public Short getStatus() {
		return this.status;
	}

	public void setStatus(Short status) {
		this.status = status;
	}

	public String getMobile() {
		return this.mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPasstoken() {
		return this.passtoken;
	}

	public void setPasstoken(String passtoken) {
		this.passtoken = passtoken;
	}
	public String getActivecode() {
		return activecode;
	}
	public void setActivecode(String activecode) {
		this.activecode = activecode;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public Short getGender() {
		return gender;
	}
	public void setGender(Short gender) {
		this.gender = gender;
	}
	public Short getActivetype() {
		return activetype;
	}
	public void setActivetype(Short activetype) {
		this.activetype = activetype;
	}
	public Short getAuditstatus() {
		return auditstatus;
	}
	public void setAuditstatus(Short auditstatus) {
		this.auditstatus = auditstatus;
	}
	public Integer getUserTypeGroup() {
		return userTypeGroup;
	}
	public void setUserTypeGroup(Integer userTypeGroup) {
		this.userTypeGroup = userTypeGroup;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public Integer getViptype() {
		return viptype;
	}
	public void setViptype(Integer viptype) {
		this.viptype = viptype;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public Integer getOldid() {
		return oldid;
	}

	public void setOldid(Integer oldid) {
		this.oldid = oldid;
	}

}