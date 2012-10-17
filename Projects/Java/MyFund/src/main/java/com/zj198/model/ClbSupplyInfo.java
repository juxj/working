package com.zj198.model;

import java.sql.Timestamp;

/**
 * ClbSupplyInfo entity. @author MyEclipse Persistence Tools
 */

public class ClbSupplyInfo implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = -4092615773448922273L;
	private Integer id;
	private Integer userid;
	private String title;
	private Timestamp createDate;
	private Timestamp lastPostDate;
	private Timestamp deleteDate;
	private Timestamp lastDisplayDate;
	private String indexDisplay;
	private String editor;
	private String investType;
	private String rank;
	private String workTranche;
	private String workRange;
	private String workRangeBank;
	private String workCycle;
	private String workArea;
	private String workTrade;
	private String aptitudes;
	private String companytype;
	private String productCycle;
	private String productPrice;
	private String remark;
	private String infoUserName;
	private String infoMobile;
	private String infoIllimite;
	private String infoFax;
	private String infoEmail;
	private String infoAddress;
	private String infoUrl;
	private String infoCompanyname;
	private String infoCompanyinfo;
	private Long investIdOld;
	private Long hit;
	private Timestamp lastPostDateBak;

	// Constructors

	/** default constructor */
	public ClbSupplyInfo() {
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Timestamp getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public Timestamp getLastPostDate() {
		return this.lastPostDate;
	}

	public void setLastPostDate(Timestamp lastPostDate) {
		this.lastPostDate = lastPostDate;
	}

	public Timestamp getDeleteDate() {
		return this.deleteDate;
	}

	public void setDeleteDate(Timestamp deleteDate) {
		this.deleteDate = deleteDate;
	}

	public Timestamp getLastDisplayDate() {
		return this.lastDisplayDate;
	}

	public void setLastDisplayDate(Timestamp lastDisplayDate) {
		this.lastDisplayDate = lastDisplayDate;
	}

	public String getIndexDisplay() {
		return this.indexDisplay;
	}

	public void setIndexDisplay(String indexDisplay) {
		this.indexDisplay = indexDisplay;
	}

	public String getEditor() {
		return this.editor;
	}

	public void setEditor(String editor) {
		this.editor = editor;
	}

	public String getInvestType() {
		return this.investType;
	}

	public void setInvestType(String investType) {
		this.investType = investType;
	}

	public String getRank() {
		return this.rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getWorkTranche() {
		return this.workTranche;
	}

	public void setWorkTranche(String workTranche) {
		this.workTranche = workTranche;
	}

	public String getWorkRange() {
		return this.workRange;
	}

	public void setWorkRange(String workRange) {
		this.workRange = workRange;
	}

	public String getWorkRangeBank() {
		return this.workRangeBank;
	}

	public void setWorkRangeBank(String workRangeBank) {
		this.workRangeBank = workRangeBank;
	}

	public String getWorkCycle() {
		return this.workCycle;
	}

	public void setWorkCycle(String workCycle) {
		this.workCycle = workCycle;
	}

	public String getWorkArea() {
		return this.workArea;
	}

	public void setWorkArea(String workArea) {
		this.workArea = workArea;
	}

	public String getWorkTrade() {
		return this.workTrade;
	}

	public void setWorkTrade(String workTrade) {
		this.workTrade = workTrade;
	}

	public String getAptitudes() {
		return this.aptitudes;
	}

	public void setAptitudes(String aptitudes) {
		this.aptitudes = aptitudes;
	}

	public String getCompanytype() {
		return this.companytype;
	}

	public void setCompanytype(String companytype) {
		this.companytype = companytype;
	}

	public String getProductCycle() {
		return this.productCycle;
	}

	public void setProductCycle(String productCycle) {
		this.productCycle = productCycle;
	}

	public String getProductPrice() {
		return this.productPrice;
	}

	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getInfoUserName() {
		return this.infoUserName;
	}

	public void setInfoUserName(String infoUserName) {
		this.infoUserName = infoUserName;
	}

	public String getInfoMobile() {
		return this.infoMobile;
	}

	public void setInfoMobile(String infoMobile) {
		this.infoMobile = infoMobile;
	}

	public String getInfoIllimite() {
		return this.infoIllimite;
	}

	public void setInfoIllimite(String infoIllimite) {
		this.infoIllimite = infoIllimite;
	}

	public String getInfoFax() {
		return this.infoFax;
	}

	public void setInfoFax(String infoFax) {
		this.infoFax = infoFax;
	}

	public String getInfoEmail() {
		return this.infoEmail;
	}

	public void setInfoEmail(String infoEmail) {
		this.infoEmail = infoEmail;
	}

	public String getInfoAddress() {
		return this.infoAddress;
	}

	public void setInfoAddress(String infoAddress) {
		this.infoAddress = infoAddress;
	}

	public String getInfoUrl() {
		return this.infoUrl;
	}

	public void setInfoUrl(String infoUrl) {
		this.infoUrl = infoUrl;
	}

	public String getInfoCompanyname() {
		return this.infoCompanyname;
	}

	public void setInfoCompanyname(String infoCompanyname) {
		this.infoCompanyname = infoCompanyname;
	}

	public String getInfoCompanyinfo() {
		return this.infoCompanyinfo;
	}

	public void setInfoCompanyinfo(String infoCompanyinfo) {
		this.infoCompanyinfo = infoCompanyinfo;
	}

	public Long getInvestIdOld() {
		return this.investIdOld;
	}

	public void setInvestIdOld(Long investIdOld) {
		this.investIdOld = investIdOld;
	}

	public Long getHit() {
		return this.hit;
	}

	public void setHit(Long hit) {
		this.hit = hit;
	}

	public Timestamp getLastPostDateBak() {
		return this.lastPostDateBak;
	}

	public void setLastPostDateBak(Timestamp lastPostDateBak) {
		this.lastPostDateBak = lastPostDateBak;
	}

}