package com.zj198.action.club;

import java.sql.Timestamp;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.model.ClbRequestInfo;
import com.zj198.model.DicIndustry;
import com.zj198.model.DicInvestRange;
import com.zj198.model.DicProvince;
import com.zj198.model.PrdRecommendation;
import com.zj198.model.UsrCompany;
import com.zj198.model.UsrPerson;
import com.zj198.model.UsrUser;
import com.zj198.service.club.SupplyRequestService;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.finservice.FinanceProdService;
import com.zj198.service.user.ProfileService;
import com.zj198.util.Constants;
import com.zj198.util.Pager;
import com.zj198.util.StringUtil;

public class RequestInfoAction extends BaseAction {
	
	private static final int PAGE_SIZE = 10;
	private static final int PAGE_SIZE_20 = 20;
	private Integer pageNo = 1;
	private Pager pager;
	private Integer clbRequestInfoId;
	private ClbRequestInfo clbRequestInfo;
	private SupplyRequestService supplyRequestService;
	private DictoryDataService dictoryDataService;
	private FinanceProdService financeProdService;
	private ProfileService profileService;
	
	private List<DicIndustry> industryList;
	private List<DicProvince> provinceList;
	private List<DicInvestRange> projectTypeList;
	private List<DicInvestRange> financingTypeList;
	private String[] query;
	
	private List<String> checkedFinanceTypeList;
	
	private List<PrdRecommendation> bankFinanceRecommendationList;
	
	
	public String delete() {
		this.supplyRequestService.deleteRequestInfo(clbRequestInfoId);
		return this.showUserHome();
	}
	
	public String edit(){
		industryList = this.dictoryDataService.findDicIndustryList();
		provinceList = this.dictoryDataService.findAllProvince();
		projectTypeList = this.supplyRequestService.findDicInvestRangeList(Constants.CLUB_PROJECT_TYPE);
		financingTypeList = this.supplyRequestService.findDicInvestRangeList(Constants.CLUB_FINANCE_TYPE);
		
		if (this.clbRequestInfoId == null) {
			this.clbRequestInfo = new ClbRequestInfo();
		}  else {
			this.clbRequestInfo = this.supplyRequestService.getClbRequestInofById(clbRequestInfoId);
			this.checkedFinanceTypeList = StringUtil.getStringList(clbRequestInfo.getFinanceType());
		}
		return "edit";
	}
	
	public String detail(){
		bankFinanceRecommendationList = this.financeProdService.findRecommendationByTopNumber(1, 5);
		this.industryList = this.dictoryDataService.findDicIndustryList();
		this.financingTypeList = this.supplyRequestService.findDicInvestRangeList(Constants.CLUB_FINANCE_TYPE);
		projectTypeList = this.supplyRequestService.findDicInvestRangeList(Constants.CLUB_PROJECT_TYPE);
		this.clbRequestInfo = this.supplyRequestService.getClbRequestInofById(clbRequestInfoId);
		return "detail";
		
	}
	
	public String home() {
		provinceList = this.dictoryDataService.findAllProvince();
		this.industryList = this.dictoryDataService.findDicIndustryList();
		this.financingTypeList = this.supplyRequestService.findDicInvestRangeList(Constants.CLUB_FINANCE_TYPE);
		
		if (StringUtil.isNullOrBlank(query)) {
			pager = this.supplyRequestService.findRequestInfoList(PAGE_SIZE, pageNo);
		} else {
			pager = this.supplyRequestService.findByHomeQuery(PAGE_SIZE, pageNo, query);
		}
		
		return "home";
	}
	
	public String showUserHome(){
		projectTypeList = this.supplyRequestService.findDicInvestRangeList(Constants.CLUB_PROJECT_TYPE);
		pager = this.supplyRequestService.findRequestInfoListByUser(this.getUser().getId(), pageNo, PAGE_SIZE_20);
		return "userHome";
	}
	
	public String save(){
		UsrUser user = this.getUser();
		
		
		clbRequestInfo.setUserid(user.getId());
		clbRequestInfo.setUserName(user.getUsername());
		clbRequestInfo.setContact(user.getRealname());
		clbRequestInfo.setEmail(user.getEmail());
		clbRequestInfo.setMobile(user.getMobile());
		
		
		Object obj = profileService.getProfiles(user.getId());
		int group = profileService.getGroupidByUserType(user.getType().shortValue());
		
		if (group == Constants.USERTYPE_GROUP_COMPANY) {
			UsrCompany company = (UsrCompany) obj;
			clbRequestInfo.setAddress(company.getBizaddress());
			clbRequestInfo.setCompanyName(company.getCompanyname());
			clbRequestInfo.setFax(company.getFaxcode());
			clbRequestInfo.setZipCode(company.getBizpostcode());
		}
		
		if (group == Constants.USERTYPE_GROUP_PERSONAL){
			UsrPerson person = (UsrPerson) obj;
			clbRequestInfo.setAddress(person.getAddress());
			clbRequestInfo.setCompanyInfo(user.getRealname());
			clbRequestInfo.setZipCode(person.getPostcode());
		}
		

		clbRequestInfo.setAward(0);
		Timestamp st = new Timestamp(System.currentTimeMillis());
		clbRequestInfo.setLastPostDate(st);
		clbRequestInfo.setLastPostDate1(st);
		clbRequestInfo.setMoneyUnits(0);
		clbRequestInfo.setPointCard(0);
		clbRequestInfo.setPointNumber(0);
		clbRequestInfo.setRank(0);
		clbRequestInfo.setUserDeleted(0);
		clbRequestInfo.setIndexDisplay("F");
		
		clbRequestInfo.setCreateDate(st);
		
		
		this.supplyRequestService.saveClbRequestInfo(clbRequestInfo);
		projectTypeList = this.supplyRequestService.findDicInvestRangeList(Constants.CLUB_PROJECT_TYPE);
		pager = this.supplyRequestService.findRequestInfoListByUser(this.getUser().getId(), pageNo, PAGE_SIZE_20);
		
		return "userHome";
	}
	
	
	private UsrUser getUser(){
		ActionContext context = ActionContext.getContext();	
		UsrUser user = (UsrUser)context.getSession().get("_user");
		return user;
	}

	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}

	public Pager getPager() {
		return pager;
	}

	
	public void setSupplyRequestService(SupplyRequestService supplyRequestService) {
		this.supplyRequestService = supplyRequestService;
	}

	public Integer getClbRequestInfoId() {
		return clbRequestInfoId;
	}

	public void setClbRequestInfoId(Integer clbRequestInfoId) {
		this.clbRequestInfoId = clbRequestInfoId;
	}

	public ClbRequestInfo getClbRequestInfo() {
		return clbRequestInfo;
	}

	public void setClbRequestInfo(ClbRequestInfo clbRequestInfo) {
		this.clbRequestInfo = clbRequestInfo;
	}

	public List<DicIndustry> getIndustryList() {
		return industryList;
	}

	public List<DicProvince> getProvinceList() {
		return provinceList;
	}

	@Override
	public String execute() throws Exception {
		return null;
	}
	
	
	
	public List<DicInvestRange> getFinancingTypeList() {
		return financingTypeList;
	}

	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}

	public List<DicInvestRange> getProjectTypeList() {
		return projectTypeList;
	}

	public void setProfileService(ProfileService profileService) {
		this.profileService = profileService;
	}

	public String[] getQuery() {
		return query;
	}

	public void setQuery(String[] query) {
		this.query = query;
	}

	public FinanceProdService getFinanceProdService() {
		return financeProdService;
	}

	public void setFinanceProdService(FinanceProdService financeProdService) {
		this.financeProdService = financeProdService;
	}

	public List<PrdRecommendation> getBankFinanceRecommendationList() {
		return bankFinanceRecommendationList;
	}

	public void setBankFinanceRecommendationList(
			List<PrdRecommendation> bankFinanceRecommendationList) {
		this.bankFinanceRecommendationList = bankFinanceRecommendationList;
	}

	public List<String> getCheckedFinanceTypeList() {
		return checkedFinanceTypeList;
	}

}
