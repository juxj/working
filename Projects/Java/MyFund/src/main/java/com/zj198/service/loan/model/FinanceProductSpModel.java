package com.zj198.service.loan.model;

import java.util.List;

import com.zj198.action.loan.model.FinanceProductExtendModel;
import com.zj198.model.PrdDatafileList;
import com.zj198.model.PrdExtendsProperty;
import com.zj198.model.PrdFinanceInterest;
import com.zj198.model.PrdFinance;
import com.zj198.model.UsrUser;

public class FinanceProductSpModel {
	private PrdFinance product;
	
	private FinanceProductExtendModel financeExtend = new FinanceProductExtendModel();
	private List<PrdDatafileList> dataFileList;
	private List<PrdExtendsProperty> extendsPropertyList;
	
	private Integer[] repaymentType;
	private Integer[] repaymentTypeHouse;
	private Integer[] housePro;
	private Integer[] mortgage;
	private Integer[] purposeCompany;
	private Integer[] purposePersonRunning;
	private Integer[] purposePersonBuy;
	private Integer[] productSpecial;
	private Integer[] uploadWay;
	
	private Integer userId;
	private Integer userType;
	private UsrUser user;
	
	private PrdFinanceInterest interest1;
	private PrdFinanceInterest interest2;
	private PrdFinanceInterest interest3;
	private PrdFinanceInterest interest4;
	private PrdFinanceInterest interest5;
	
	private String industrySel;
	private String citySel;
	private String selectArea;
	private String industryStatus;
	
	private String datalistStr;
	private String citySelName;
	private String industrySelName;
	
	private Integer[] rateUp;
	private Integer rateStId;
	private Integer rateEnId;
	private String[] extendsName;
	private Integer[] extendsType;
	private String[] extendsValue;
	
	private Integer[] rateDown;
	
	public Integer[] getRateUp() {
		return rateUp;
	}
	public void setRateUp(Integer[] rateUp) {
		this.rateUp = rateUp;
	}
	public Integer getRateStId() {
		return rateStId;
	}
	public void setRateStId(Integer rateStId) {
		this.rateStId = rateStId;
	}
	public Integer getRateEnId() {
		return rateEnId;
	}
	public void setRateEnId(Integer rateEnId) {
		this.rateEnId = rateEnId;
	}
	public PrdFinanceInterest getInterest1() {
		return interest1;
	}
	public void setInterest1(PrdFinanceInterest interest1) {
		this.interest1 = interest1;
	}
	public PrdFinanceInterest getInterest2() {
		return interest2;
	}
	public void setInterest2(PrdFinanceInterest interest2) {
		this.interest2 = interest2;
	}
	public PrdFinanceInterest getInterest3() {
		return interest3;
	}
	public void setInterest3(PrdFinanceInterest interest3) {
		this.interest3 = interest3;
	}
	public PrdFinance getProduct() {
		return product;
	}
	public void setProduct(PrdFinance product) {
		this.product = product;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public FinanceProductExtendModel getFinanceExtend() {
		return financeExtend;
	}
	public void setFinanceExtend(FinanceProductExtendModel financeExtend) {
		this.financeExtend = financeExtend;
	}
	
	public String getIndustrySel() {
		return industrySel;
	}
	public void setIndustrySel(String industrySel) {
		this.industrySel = industrySel;
	}
	public String getCitySel() {
		return citySel;
	}
	public void setCitySel(String citySel) {
		this.citySel = citySel;
	}
	public String getSelectArea() {
		return selectArea;
	}
	public void setSelectArea(String selectArea) {
		this.selectArea = selectArea;
	}
	public String getIndustryStatus() {
		return industryStatus;
	}
	public void setIndustryStatus(String industryStatus) {
		this.industryStatus = industryStatus;
	}
	public String getDatalistStr() {
		return datalistStr;
	}
	public void setDatalistStr(String datalistStr) {
		this.datalistStr = datalistStr;
	}
	public Integer getUserType() {
		return userType;
	}
	public void setUserType(Integer userType) {
		this.userType = userType;
	}
	public Integer[] getRepaymentType() {
		return repaymentType;
	}
	public void setRepaymentType(Integer[] repaymentType) {
		this.repaymentType = repaymentType;
	}
	public Integer[] getRepaymentTypeHouse() {
		return repaymentTypeHouse;
	}
	public void setRepaymentTypeHouse(Integer[] repaymentTypeHouse) {
		this.repaymentTypeHouse = repaymentTypeHouse;
	}
	public Integer[] getHousePro() {
		return housePro;
	}
	public void setHousePro(Integer[] housePro) {
		this.housePro = housePro;
	}
	public Integer[] getMortgage() {
		return mortgage;
	}
	public void setMortgage(Integer[] mortgage) {
		this.mortgage = mortgage;
	}
	public Integer[] getPurposeCompany() {
		return purposeCompany;
	}
	public void setPurposeCompany(Integer[] purposeCompany) {
		this.purposeCompany = purposeCompany;
	}
	public Integer[] getPurposePersonRunning() {
		return purposePersonRunning;
	}
	public void setPurposePersonRunning(Integer[] purposePersonRunning) {
		this.purposePersonRunning = purposePersonRunning;
	}
	public Integer[] getPurposePersonBuy() {
		return purposePersonBuy;
	}
	public void setPurposePersonBuy(Integer[] purposePersonBuy) {
		this.purposePersonBuy = purposePersonBuy;
	}
	public Integer[] getProductSpecial() {
		return productSpecial;
	}
	public void setProductSpecial(Integer[] productSpecial) {
		this.productSpecial = productSpecial;
	}
	public Integer[] getUploadWay() {
		return uploadWay;
	}
	public void setUploadWay(Integer[] uploadWay) {
		this.uploadWay = uploadWay;
	}
	public List<PrdDatafileList> getDataFileList() {
		return dataFileList;
	}
	public void setDataFileList(List<PrdDatafileList> dataFileList) {
		this.dataFileList = dataFileList;
	}
	public String getCitySelName() {
		return citySelName;
	}
	public void setCitySelName(String citySelName) {
		this.citySelName = citySelName;
	}
	public String getIndustrySelName() {
		return industrySelName;
	}
	public void setIndustrySelName(String industrySelName) {
		this.industrySelName = industrySelName;
	}
	public PrdFinanceInterest getInterest4() {
		return interest4;
	}
	public void setInterest4(PrdFinanceInterest interest4) {
		this.interest4 = interest4;
	}
	public PrdFinanceInterest getInterest5() {
		return interest5;
	}
	public void setInterest5(PrdFinanceInterest interest5) {
		this.interest5 = interest5;
	}
	public UsrUser getUser() {
		return user;
	}
	public String[] getExtendsName() {
		return extendsName;
	}
	public void setExtendsName(String[] extendsName) {
		this.extendsName = extendsName;
	}
	public Integer[] getExtendsType() {
		return extendsType;
	}
	public void setExtendsType(Integer[] extendsType) {
		this.extendsType = extendsType;
	}
	public String[] getExtendsValue() {
		return extendsValue;
	}
	public void setExtendsValue(String[] extendsValue) {
		this.extendsValue = extendsValue;
	}
	public void setUser(UsrUser user) {
		this.user = user;
	}
	public List<PrdExtendsProperty> getExtendsPropertyList() {
		return extendsPropertyList;
	}
	public void setExtendsPropertyList(List<PrdExtendsProperty> extendsPropertyList) {
		this.extendsPropertyList = extendsPropertyList;
	}
	public Integer[] getRateDown() {
		return rateDown;
	}
	public void setRateDown(Integer[] rateDown) {
		this.rateDown = rateDown;
	}
}
