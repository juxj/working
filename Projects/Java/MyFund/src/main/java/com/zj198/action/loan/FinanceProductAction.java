package com.zj198.action.loan;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.action.loan.model.PreviewFinanceProSrModel;
import com.zj198.model.DicCommon;
import com.zj198.model.DicIndustry;
import com.zj198.model.DicUsertype;
import com.zj198.model.PrdDatafileList;
import com.zj198.model.PrdExtendsProperty;
import com.zj198.model.PrdFinance;
import com.zj198.model.PrdFinanceDatafile;
import com.zj198.model.PrdPropertyDic;
import com.zj198.model.UsrUser;
import com.zj198.model.vo.FinanceAreaModel;
import com.zj198.model.vo.FinanceIndustryModel;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.loan.FinanceProductService;
import com.zj198.service.loan.OrdLrRecommendService;
import com.zj198.service.loan.model.FinanceProductSpModel;
import com.zj198.service.loan.model.FinanceProductSrModel;
import com.zj198.util.Constants;

/**
 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-7-05 14:54:57
 * @modify zeroleavebaoyang@gmail.com
 * @since 2012-7-18 | 13:23:49
 */
public class FinanceProductAction extends BaseAction {
	private FinanceProductService financeProductService;
	private DictoryDataService dictoryDataService;
	private PrdFinance product;
	private List<PrdDatafileList> dataFileList;
	private Map<String, List<?>> dataMap;
	private List<DicUsertype> finaceTypeList;
	private List<DicCommon> mortgageTypeList;
	private List<DicCommon> repaymentTypeList;
	private List<DicCommon> purposeTypeList;
	private List<FinanceAreaModel> productAreaList;
	private List<FinanceIndustryModel> productIndustryList;
	// ajax二级联动ID
	private Integer purposeId;
	private Integer industryId;
	private Integer childId;
	// 行业级联
	private List<DicIndustry> industryList;
	// (企业经营贷款151)条件筛选的隐藏域
	private Integer financeType;
	private Long financeAmount;
	private Integer financeDate;
	private String purposeType;
	private String userType;
	private String mortgageType;
	private String repaymentType;
	private String checkTime;
	private String companyAllAsset;
	private String operatIncome;
	private Integer settingYear;
	// 所属行业 (父行业&&子行业)
	
	// 筛选菜单 收缩状态
	private String shrink;

	// (个人经营性贷款152)条件筛选的隐藏域
	private String needEnsure;
	private String experience;
	private Integer runningArea;
	private String creditAcount;
	private String bankSalaryList;
	// 产品推荐列表
	private List<PrdFinance> recommendProducts;

	public String execute() {
		getMapSource();
		pager = financeProductService.findProByCond(pager == null ? 1 : pager.getCurrentPage(), pager == null ? 20 : pager.getPageCount(), financeType, purposeType, financeAmount, financeDate, mortgageType, userType, checkTime, companyAllAsset, creditAcount, experience, needEnsure, operatIncome, settingYear, bankSalaryList, repaymentType, runningArea, industryId, childId);
		return "financeSearchDetail";
	}

	public String cusViewFinance() {
		product = financeProductService.getFinance(product.getId());
		productAreaList = financeProductService.findFiananceArea(product.getId());
		productIndustryList = financeProductService.findFiananceInducty(product.getId());
		
		if(product.getOtherRequire() != null){
			product.setOtherRequire(product.getOtherRequire().replaceAll("\r\n", "<br/>"));
		}
		if(product.getProIntroduce() != null){
			product.setProIntroduce(product.getProIntroduce().replaceAll("\r\n", "<br/>"));
		}
		if(product.getDataFiles() != null){			
			for(PrdFinanceDatafile df: product.getDataFiles()){
				if(df.getOtherMemo() != null){
					df.setOtherMemo(df.getOtherMemo().replaceAll("\r\n", "<br/>"));
				}
			}
		}
		recommendProducts = this.financeProductService.findFinanceImportent(5);
		return "custom_view_finance";
	}
	

	/**
	 * @description: 选择贷款类型搜索,显示结果,并且附带条件筛选的详细检索
	 * @author: zeroleavebaoyang@gmail.com
	 * @since: 2012-7-10 | 11:04:12
	 * @return
	 */
	public String financeSearchDetail() {
		getMapSource();
		pager = financeProductService.findProByCond(pager == null ? 1 : pager.getCurrentPage(), pager == null ? 20 : pager.getPageCount(), financeType, purposeType, financeAmount, financeDate, mortgageType, userType, checkTime, companyAllAsset, creditAcount, experience, needEnsure, operatIncome, settingYear, bankSalaryList, repaymentType, runningArea, industryId, childId);
		return "financeSearchDetail";
	}

	/**
	 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-7-05 14:54:57
	 * @param
	 * @return
	 */
	public String searchDateFile() {
		// INIT
		financeProductService.searchDateFile();
		return "searchDateFile";
	}

	public void setFinanceProductService(FinanceProductService financeProductService) {
		this.financeProductService = financeProductService;
	}

	/**
	 * 
	 * @Author zeroleavebaoyang@gmail.com
	 * @Description 用途异步级联显示
	 * @return
	 */
	public String purpose() {
		purposeTypeList = dictoryDataService.findCommonDataByGroupId(purposeId);
		return "purposeTypeList";
	}

	/**
	 * 
	 * @Author zeroleavebaoyang@gmail.com
	 * @Description 行业异步级联显示
	 * @return
	 */
	public String industry() {
		industryList = dictoryDataService.findIndustryByParentid(industryId);
		return "industryList";
	}

	/**
	 * 待筛选的条件列表
	 */
	private void getMapSource() {
		// 从DIC_USERTYPE中取得融资渠道类型
		dataMap = new HashMap<String, List<?>>();
		finaceTypeList = (List<DicUsertype>) dictoryDataService.findUserTypeByGroup(3);
		// 从DIC_COMMON中取得融资担保方式
		mortgageTypeList = dictoryDataService.findCommonDataByGroupId(35);
		// 从DIC_COMMON中取得融资担保方式
		repaymentTypeList = dictoryDataService.findCommonDataByGroupId(34);
		dataMap.put("finaceType", finaceTypeList);
		dataMap.put("mortgageType", mortgageTypeList);
		dataMap.put("repaymentType", repaymentTypeList);
	}
	public String findRecom(){
		recommendProducts = financeProductService.findFinanceImportent(5);
		return "recommendProduct";
	}
	//setter and getter

	public PrdFinance getProduct() {
		return product;
	}

	public void setProduct(PrdFinance product) {
		this.product = product;
	}

	public List<PrdDatafileList> getDataFileList() {
		return dataFileList;
	}

	public void setDataFileList(List<PrdDatafileList> dataFileList) {
		this.dataFileList = dataFileList;
	}

	public Map<String, List<?>> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<String, List<?>> dataMap) {
		this.dataMap = dataMap;
	}

	public List<DicUsertype> getFinaceTypeList() {
		return finaceTypeList;
	}

	public void setFinaceTypeList(List<DicUsertype> finaceTypeList) {
		this.finaceTypeList = finaceTypeList;
	}

	public List<DicCommon> getMortgageTypeList() {
		return mortgageTypeList;
	}

	public void setMortgageTypeList(List<DicCommon> mortgageTypeList) {
		this.mortgageTypeList = mortgageTypeList;
	}

	public List<DicCommon> getRepaymentTypeList() {
		return repaymentTypeList;
	}

	public void setRepaymentTypeList(List<DicCommon> repaymentTypeList) {
		this.repaymentTypeList = repaymentTypeList;
	}

	public List<DicCommon> getPurposeTypeList() {
		return purposeTypeList;
	}

	public void setPurposeTypeList(List<DicCommon> purposeTypeList) {
		this.purposeTypeList = purposeTypeList;
	}

	public List<FinanceAreaModel> getProductAreaList() {
		return productAreaList;
	}

	public void setProductAreaList(List<FinanceAreaModel> productAreaList) {
		this.productAreaList = productAreaList;
	}

	public List<FinanceIndustryModel> getProductIndustryList() {
		return productIndustryList;
	}

	public void setProductIndustryList(
			List<FinanceIndustryModel> productIndustryList) {
		this.productIndustryList = productIndustryList;
	}

	public Integer getPurposeId() {
		return purposeId;
	}

	public void setPurposeId(Integer purposeId) {
		this.purposeId = purposeId;
	}

	public Integer getIndustryId() {
		return industryId;
	}

	public void setIndustryId(Integer industryId) {
		this.industryId = industryId;
	}

	public Integer getChildId() {
		return childId;
	}

	public void setChildId(Integer childId) {
		this.childId = childId;
	}

	public List<DicIndustry> getIndustryList() {
		return industryList;
	}

	public void setIndustryList(List<DicIndustry> industryList) {
		this.industryList = industryList;
	}

	public Integer getFinanceType() {
		return financeType;
	}

	public void setFinanceType(Integer financeType) {
		this.financeType = financeType;
	}

	public Long getFinanceAmount() {
		return financeAmount;
	}

	public void setFinanceAmount(Long financeAmount) {
		this.financeAmount = financeAmount;
	}

	public Integer getFinanceDate() {
		return financeDate;
	}

	public void setFinanceDate(Integer financeDate) {
		this.financeDate = financeDate;
	}

	public String getPurposeType() {
		return purposeType;
	}

	public void setPurposeType(String purposeType) {
		this.purposeType = purposeType;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getMortgageType() {
		return mortgageType;
	}

	public void setMortgageType(String mortgageType) {
		this.mortgageType = mortgageType;
	}

	public String getRepaymentType() {
		return repaymentType;
	}

	public void setRepaymentType(String repaymentType) {
		this.repaymentType = repaymentType;
	}

	public String getCheckTime() {
		return checkTime;
	}

	public void setCheckTime(String checkTime) {
		this.checkTime = checkTime;
	}

	public String getCompanyAllAsset() {
		return companyAllAsset;
	}

	public void setCompanyAllAsset(String companyAllAsset) {
		this.companyAllAsset = companyAllAsset;
	}

	public String getOperatIncome() {
		return operatIncome;
	}

	public void setOperatIncome(String operatIncome) {
		this.operatIncome = operatIncome;
	}

	public Integer getSettingYear() {
		return settingYear;
	}

	public void setSettingYear(Integer settingYear) {
		this.settingYear = settingYear;
	}

	public String getNeedEnsure() {
		return needEnsure;
	}

	public void setNeedEnsure(String needEnsure) {
		this.needEnsure = needEnsure;
	}

	public String getExperience() {
		return experience;
	}

	public void setExperience(String experience) {
		this.experience = experience;
	}

	public Integer getRunningArea() {
		return runningArea;
	}

	public void setRunningArea(Integer runningArea) {
		this.runningArea = runningArea;
	}

	public String getCreditAcount() {
		return creditAcount;
	}

	public void setCreditAcount(String creditAcount) {
		this.creditAcount = creditAcount;
	}

	public String getBankSalaryList() {
		return bankSalaryList;
	}

	public void setBankSalaryList(String bankSalaryList) {
		this.bankSalaryList = bankSalaryList;
	}

	public List<PrdFinance> getRecommendProducts() {
		return recommendProducts;
	}

	public void setRecommendProducts(List<PrdFinance> recommendProducts) {
		this.recommendProducts = recommendProducts;
	}

	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}
	public String getShrink() {
		return shrink;
	}

	public void setShrink(String shrink) {
		this.shrink = shrink;
	}

}
