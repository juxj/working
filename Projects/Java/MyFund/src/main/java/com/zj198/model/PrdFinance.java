package com.zj198.model;

import java.util.Date;
import java.util.Set;


/**
 * OrdFinanceProduct entity. @author MyEclipse Persistence Tools
 */

public class PrdFinance implements java.io.Serializable {

	private static final long serialVersionUID = 1330824047057277268L;
	private Integer bankSalaryList;
	private Integer checkTime;
	private Integer companyAllAsset;
	private Date createdt;
	private Integer creditAcount;
	private Set<PrdFinanceDatafile> dataFiles;
	private Integer experience;
	private Set<PrdFinanceArea> financeAreas;
	private Long financeBigamount;
	private Set<PrdFinanceInducty> financeInductys;
	private Long financeLittleamount;
	private Integer financeLittledt;
	private Integer financeMostdt;
	private String financeName;
	private Integer financeType;
	private Integer house;
	private String houseProperty;
	private Integer id;
	private Set<PrdFinanceInterest> interests;
	private Integer interestType;
	private Integer isdeleted;
	private String mortgageType;
	private Integer needEnsure;
	private Integer operatIncome;
	private String otherRequire;
	private String proIntroduce;
	private String proSpecial;
	private Integer proStatus;
	private String purposeType;
	private String repaymentType;
	private Integer runningArea;
	private Integer salaryIncome;
	private Integer salaryPutWay;
	private Integer settingYear;
	private Integer surplus;
	
	private String uploadWay;
	private Integer userId;
	private Integer useTime;
	private Integer workTime;

	private Integer userType;
	private Double littleInterest;
	private Double bigInterest;

	// 是否已经被选择推荐
	private Integer isRecommend;
	private String financeNum;
	
	private Double serviceCost;
	
	private String logo;
	private Integer recommendStatus;
	private String recommendName;
	private Date recommendTime;
	private Integer recommendNo;

	/** default constructor */
	public PrdFinance() {
	}

	public Integer getBankSalaryList() {
		return this.bankSalaryList;
	}

	public Integer getCheckTime() {
		return this.checkTime;
	}

	public Integer getCompanyAllAsset() {
		return this.companyAllAsset;
	}

	public Date getCreatedt() {
		return this.createdt;
	}

	public Integer getCreditAcount() {
		return this.creditAcount;
	}

	public Set<PrdFinanceDatafile> getDataFiles() {
		return dataFiles;
	}

	public Integer getExperience() {
		return this.experience;
	}

	public Set<PrdFinanceArea> getFinanceAreas() {
		return financeAreas;
	}

	public Long getFinanceBigamount() {
		return this.financeBigamount;
	}

	public Set<PrdFinanceInducty> getFinanceInductys() {
		return financeInductys;
	}

	public Long getFinanceLittleamount() {
		return this.financeLittleamount;
	}

	public Integer getFinanceLittledt() {
		return this.financeLittledt;
	}

	public Integer getFinanceMostdt() {
		return this.financeMostdt;
	}

	public String getFinanceName() {
		return this.financeName;
	}

	public Integer getFinanceType() {
		return this.financeType;
	}

	public Integer getHouse() {
		return this.house;
	}

	public String getHouseProperty() {
		return this.houseProperty;
	}

	// Property accessors
	public Integer getId() {
		return this.id;
	}

	public Set<PrdFinanceInterest> getInterests() {
		return interests;
	}

	public Integer getInterestType() {
		return this.interestType;
	}

	

	public Integer getIsdeleted() {
		return this.isdeleted;
	}

	public String getMortgageType() {
		return mortgageType;
	}

	public Integer getNeedEnsure() {
		return this.needEnsure;
	}

	public Integer getOperatIncome() {
		return this.operatIncome;
	}

	public String getOtherRequire() {
		return this.otherRequire;
	}

	public String getProIntroduce() {
		return this.proIntroduce;
	}

	public String getProSpecial() {
		return proSpecial;
	}

	public Integer getProStatus() {
		return this.proStatus;
	}

	public String getPurposeType() {
		return purposeType;
	}

	public String getRepaymentType() {
		return repaymentType;
	}

	public Integer getRunningArea() {
		return this.runningArea;
	}

	public Integer getSalaryIncome() {
		return this.salaryIncome;
	}

	

	public Integer getSalaryPutWay() {
		return this.salaryPutWay;
	}

	public Integer getSettingYear() {
		return this.settingYear;
	}

	public Integer getSurplus() {
		return this.surplus;
	}

	public String getUploadWay() {
		return uploadWay;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public Integer getUseTime() {
		return this.useTime;
	}

	public Integer getWorkTime() {
		return this.workTime;
	}

	public void setBankSalaryList(Integer bankSalaryList) {
		this.bankSalaryList = bankSalaryList;
	}

	public void setCheckTime(Integer checkTime) {
		this.checkTime = checkTime;
	}

	public void setCompanyAllAsset(Integer companyAllAsset) {
		this.companyAllAsset = companyAllAsset;
	}

	public void setCreatedt(Date createdt) {
		this.createdt = createdt;
	}

	public void setCreditAcount(Integer creditAcount) {
		this.creditAcount = creditAcount;
	}

	public void setDataFiles(Set<PrdFinanceDatafile> dataFiles) {
		this.dataFiles = dataFiles;
	}

	public void setExperience(Integer experience) {
		this.experience = experience;
	}

	public void setFinanceAreas(Set<PrdFinanceArea> financeAreas) {
		this.financeAreas = financeAreas;
	}

	public void setFinanceBigamount(Long financeBigamount) {
		this.financeBigamount = financeBigamount;
	}

	public void setFinanceInductys(Set<PrdFinanceInducty> financeInductys) {
		this.financeInductys = financeInductys;
	}

	public void setFinanceLittleamount(Long financeLittleamount) {
		this.financeLittleamount = financeLittleamount;
	}

	public void setFinanceLittledt(Integer financeLittledt) {
		this.financeLittledt = financeLittledt;
	}

	public void setFinanceMostdt(Integer financeMostdt) {
		this.financeMostdt = financeMostdt;
	}

	public void setFinanceName(String financeName) {
		this.financeName = financeName;
	}

	public void setFinanceType(Integer financeType) {
		this.financeType = financeType;
	}

	public void setHouse(Integer house) {
		this.house = house;
	}

	public void setHouseProperty(String houseProperty) {
		this.houseProperty = houseProperty;
	}


	public void setId(Integer id) {
		this.id = id;
	}

	public void setInterests(Set<PrdFinanceInterest> interests) {
		this.interests = interests;
	}

	public void setInterestType(Integer interestType) {
		this.interestType = interestType;
	}

	public void setIsdeleted(Integer isdeleted) {
		this.isdeleted = isdeleted;
	}

	public void setMortgageType(String mortgageType) {
		this.mortgageType = mortgageType;
	}

	public void setNeedEnsure(Integer needEnsure) {
		this.needEnsure = needEnsure;
	}

	public void setOperatIncome(Integer operatIncome) {
		this.operatIncome = operatIncome;
	}

	public void setOtherRequire(String otherRequire) {
		this.otherRequire = otherRequire;
	}

	public void setProIntroduce(String proIntroduce) {
		this.proIntroduce = proIntroduce;
	}

	public void setProSpecial(String proSpecial) {
		this.proSpecial = proSpecial;
	}

	public void setProStatus(Integer proStatus) {
		this.proStatus = proStatus;
	}

	public void setPurposeType(String purposeType) {
		this.purposeType = purposeType;
	}

	public void setRepaymentType(String repaymentType) {
		this.repaymentType = repaymentType;
	}

	public void setRunningArea(Integer runningArea) {
		this.runningArea = runningArea;
	}

	public void setSalaryIncome(Integer salaryIncome) {
		this.salaryIncome = salaryIncome;
	}

	public void setSalaryPutWay(Integer salaryPutWay) {
		this.salaryPutWay = salaryPutWay;
	}

	public void setSettingYear(Integer settingYear) {
		this.settingYear = settingYear;
	}

	public void setSurplus(Integer surplus) {
		this.surplus = surplus;
	}

	public void setUploadWay(String uploadWay) {
		this.uploadWay = uploadWay;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public void setUseTime(Integer useTime) {
		this.useTime = useTime;
	}

	public void setWorkTime(Integer workTime) {
		this.workTime = workTime;
	}

	public Integer getUserType() {
		return userType;
	}

	public void setUserType(Integer userType) {
		this.userType = userType;
	}

	public Double getLittleInterest() {
		return littleInterest;
	}

	public void setLittleInterest(Double littleInterest) {
		this.littleInterest = littleInterest;
	}

	public Double getBigInterest() {
		return bigInterest;
	}

	public void setBigInterest(Double bigInterest) {
		this.bigInterest = bigInterest;
	}

	public Integer getIsRecommend() {
		return isRecommend;
	}

	public void setIsRecommend(Integer isRecommend) {
		this.isRecommend = isRecommend;
	}

	public String getFinanceNum() {
		return financeNum;
	}

	public void setFinanceNum(String financeNum) {
		this.financeNum = financeNum;
	}

	public Double getServiceCost() {
		return serviceCost;
	}

	public void setServiceCost(Double serviceCost) {
		this.serviceCost = serviceCost;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public Integer getRecommendStatus() {
		return recommendStatus;
	}

	public void setRecommendStatus(Integer recommendStatus) {
		this.recommendStatus = recommendStatus;
	}

	public String getRecommendName() {
		return recommendName;
	}

	public void setRecommendName(String recommendName) {
		this.recommendName = recommendName;
	}

	public Date getRecommendTime() {
		return recommendTime;
	}

	public void setRecommendTime(Date recommendTime) {
		this.recommendTime = recommendTime;
	}

	public Integer getRecommendNo() {
		return recommendNo;
	}

	public void setRecommendNo(Integer recommendNo) {
		this.recommendNo = recommendNo;
	}

}