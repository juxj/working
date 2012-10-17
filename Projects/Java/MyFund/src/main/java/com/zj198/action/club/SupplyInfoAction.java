package com.zj198.action.club;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.model.ClbSupplyInfo;
import com.zj198.model.DicBank;
import com.zj198.model.DicIndustry;
import com.zj198.model.DicInvestRange;
import com.zj198.model.DicProvince;
import com.zj198.model.DicUsertype;
import com.zj198.model.PrdRecommendation;
import com.zj198.model.UsrBank;
import com.zj198.model.UsrCompany;
import com.zj198.model.UsrFinanceorg;
import com.zj198.model.UsrServiceorg;
import com.zj198.model.UsrUser;
import com.zj198.service.club.SupplyRequestService;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.finservice.FinanceProdService;
import com.zj198.service.user.AccountService;
import com.zj198.service.user.ProfileService;
import com.zj198.util.Constants;
import com.zj198.util.Pager;
import com.zj198.util.StringUtil;

public class SupplyInfoAction extends BaseClubAction {

	private final static int PAGE_SIZE = 10;
	private final static int PAGE_SIZE_20 = 20;
	
	private SupplyRequestService supplyRequestService;
	private DictoryDataService dictoryDataService;
	
	private List<String> checkedItems;
	private List<String> checkedProvinces;
	private List<String> checkedIndustry;
	private List<String> checkedServiceType;
	private List<String[]> userInfoList;
	
	private int pageNo = 1;
	private Pager pager;
	private int clbSupplyInfoId;
	private ClbSupplyInfo clbSupplyInfo;
	

	private List<DicInvestRange> investStyleList;
	private List<DicInvestRange> amountRangeList;
	private List<DicInvestRange> pawnItemList;
	private List<DicInvestRange> guaranteeTypeList;
	private List<DicInvestRange> loanUsageList;
	private List<DicInvestRange> timeIntervalList;
	private List industryList;
	private List provinceList;
	
	private String investType;
	private Integer lastDisplayDate;
	
	private String redirect;
	private String[] query;
	
	private List<PrdRecommendation> bankFinanceRecommendationList;
	private FinanceProdService financeProdService;
	
	
	public String editInstitution(){
		this.initializeParameters();
		if (clbSupplyInfo == null) {
			this.clbSupplyInfo = new ClbSupplyInfo();
			this.clbSupplyInfo.setInvestType(this.investType);
		}
		return redirect;
	}
	
	public String delete() {
		this.supplyRequestService.deleteSupplyInfo(clbSupplyInfoId);
		return this.showUserHome(); 
	}
	
	public String editLoanInfo(){
		this.initializeParameters();
		this.loanUsageList = this.supplyRequestService.findDicInvestRangeList(Constants.CLUB_LOAD_USAGE);
		if (clbSupplyInfo == null) {
			this.clbSupplyInfo = new ClbSupplyInfo();
			this.clbSupplyInfo.setInvestType(this.investType);
		}
		return "editLoanInfo";
	}
	
	public String editGuaranteeInfo(){
		this.initializeParameters();
		this.guaranteeTypeList = this.supplyRequestService.findDicInvestRangeList(Constants.CLUB_GUARANTEE_TYPE);
		if (clbSupplyInfo == null) {
			this.clbSupplyInfo = new ClbSupplyInfo();
			this.clbSupplyInfo.setInvestType(this.investType);
		}
		return "editGuaranteeInfo";
	}

	public String editPawnInfo(){
		this.initializeParameters();
		this.pawnItemList = this.supplyRequestService.findDicInvestRangeList(Constants.CLUB_PAWN_ITEM_TYPE);
		if (clbSupplyInfo == null) {
			this.clbSupplyInfo = new ClbSupplyInfo();
			this.clbSupplyInfo.setInvestType(this.investType);
		}
		return "editPawnInfo";
	}
	
	private void initializeParameters() {
		provinceList = this.dictoryDataService.findAllProvince();
		this.amountRangeList = this.supplyRequestService.findDicInvestRangeList(Constants.CLUB_AMOUNT_RANGE);
		this.industryList = this.dictoryDataService.findIndustryByParentid(0);
		this.timeIntervalList = this.supplyRequestService.findDicInvestRangeList(Constants.CLUB_TIME_INTERVAL);
		this.investStyleList = this.supplyRequestService.findDicInvestRangeList(Constants.CLUB_INVEST_STYLE);
	}
	
	public String save(){
		UsrUser user = this.getUser();
		this.clbSupplyInfo.setInfoMobile(user.getMobile());
		this.clbSupplyInfo.setInfoUserName(user.getRealname());
		this.clbSupplyInfo.setInfoEmail(user.getEmail());
		this.clbSupplyInfo.setUserid(user.getId());
		
		this.clbSupplyInfo.setCreateDate(new Timestamp(System.currentTimeMillis()));
		this.clbSupplyInfo.setLastPostDate(new Timestamp(System.currentTimeMillis()));
		Calendar calendar  = Calendar.getInstance();
		calendar.add(Calendar.MONTH, lastDisplayDate);
		this.clbSupplyInfo.setLastDisplayDate(new Timestamp(calendar.getTimeInMillis()));
		this.clbSupplyInfo.setIndexDisplay("F");
		this.clbSupplyInfo.setRank("0");
		this.clbSupplyInfo.setHit(Long.valueOf("0"));
		
		int group = this.profileService.getGroupidByUserType(user.getType());
		Object obj = this.profileService.getProfiles(user.getId());
		DicUsertype userType = this.dictoryDataService.getDicUserTypeById(user.getType());
		
		if (userType != null) {
			//this.clbSupplyInfo.setCompanytype(userType.getName());
		}
		if (group == Constants.USERTYPE_GROUP_BANK) {
			UsrBank userBank = (UsrBank) obj;
			this.clbSupplyInfo.setInfoIllimite(userBank.getLinktelephone());
			this.clbSupplyInfo.setInfoCompanyinfo(userBank.getRemarks());
			if (userBank.getBankid() != null) {
				DicBank bank = this.dictoryDataService.getDicBankById(userBank.getBankid());
				this.clbSupplyInfo.setInfoUrl(bank.getWebsite());
				this.clbSupplyInfo.setInfoCompanyname(bank.getName());
			}
			//TODO: 未到传真数据.
			//this.clbSupplyInfo.setInfoFax()
			//TODO: 未找到银行地址.
			//this.clbSupplyInfo.setInfoAddress(user.);
		}
		
		if (group == Constants.USERTYPE_GROUP_FINANCEORG) {
			UsrFinanceorg org = (UsrFinanceorg) obj;
			this.clbSupplyInfo.setInfoIllimite(org.getLinktelephone());
			this.clbSupplyInfo.setInfoFax(org.getFaxcode());
			//TODO: 未找到非银行金融机构的网站.
			//this.clbSupplyInfo.setInfoUrl();
			this.clbSupplyInfo.setInfoCompanyname(org.getOrgname());
			this.clbSupplyInfo.setInfoCompanyinfo(org.getRemarks());
		}
		this.supplyRequestService.saveClbSupplyInfo(clbSupplyInfo);
		return this.showUserHome();
	}
	
	public String edit(){
		
		if (this.clbSupplyInfoId <1 ) {
			this.clbSupplyInfo = new ClbSupplyInfo();
			return "edit";
		} else {
			this.clbSupplyInfo = this.supplyRequestService.getClbSupplyInfoById(this.clbSupplyInfoId);
			
			this.checkedProvinces = StringUtil.getStringList(clbSupplyInfo.getWorkArea());
			this.checkedIndustry = StringUtil.getStringList(clbSupplyInfo.getWorkTrade());
			this.checkedItems = StringUtil.getStringList(this.clbSupplyInfo.getWorkRange());
			
			
			investType = this.clbSupplyInfo.getInvestType();
			this.initializeParameters();
			
			if (investType.equalsIgnoreCase("10001")) {
				return this.editPawnInfo();
			} 
			
			if (investType.equalsIgnoreCase("10002")){
				return this.editGuaranteeInfo();
			}
			
			if (investType.equalsIgnoreCase("10003")){
				return this.editLoanInfo();
			}
			
			if (investType.equalsIgnoreCase("30001")){
				this.redirect =  "editInstitutionBank";
			} 
			
			if (investType.equalsIgnoreCase("30002")){
				
				this.redirect = "editInstitutionInsurance";
			}
			
			if (investType.equalsIgnoreCase("30003")){
				this.redirect = "editInstitutionTrust";
			} 
			
			if (investType.equalsIgnoreCase("30004")){
				this.redirect = "editInstitutionStock";
				return this.editInstitution();
			} 

			if (investType.equalsIgnoreCase("30005")){
				this.redirect = "editInstitutionRent";
				return this.editInstitution();
			}

			if (investType.equalsIgnoreCase("30006")){
				this.redirect = "editInstitutionFund";
			} 
			
			if (investType.equalsIgnoreCase("30007")){
				this.redirect = "editInstitutionFinance";
			} 
			
			if (investType.indexOf("2000")>-1){
				this.redirect = "editProjectInvest";
			}
			return this.editInstitution();
		}
	}
	
	
	public String editFirstStep(){
		this.investStyleList = this.supplyRequestService.findDicInvestRangeList(Constants.CLUB_INVEST_STYLE);
		return "editFirstStep";
	}
	
	public String showUserHome(){
		this.initializeParameters();
		pager = this.supplyRequestService.findClbSupplyInfoListByUser(this.getUser().getId(), pageNo, PAGE_SIZE_20);
		return "userHome";
	}
	
	public String home() {
		this.userInfoList = new ArrayList<String[]>();
		this.initializeParameters();
		
		if (StringUtil.isNullOrBlank(query)) {
			pager = this.supplyRequestService.findClbSupplyInfoList(PAGE_SIZE, pageNo);
		} else {
			pager = this.supplyRequestService.findClbSupplyInfoList(PAGE_SIZE, pageNo, query);
		}
		
		List<Object> list = pager.getData();
		
		for (int i=0; i<list.size(); i++) {
			String userInfo[] = new String[2];
			ClbSupplyInfo clbSupplyInfo = (ClbSupplyInfo) list.get(i);
			UsrUser user = accountService.getUserById(clbSupplyInfo.getUserid());
			if (user != null) {
				userInfo = this.getUserInfo(user);
			}
			this.userInfoList.add(userInfo);
		}
		
		return "home";
	}
	
	public String detail(){
		String result = "detail";
		this.initializeParameters();
		bankFinanceRecommendationList = this.financeProdService.findRecommendationByTopNumber(1, 5);
		this.clbSupplyInfo = this.supplyRequestService.getClbSupplyInfoById(clbSupplyInfoId);
		
		String investType = clbSupplyInfo.getInvestType();
		
		if (StringUtils.isNotBlank(investType)) {
		
			if (investType.equalsIgnoreCase("10001")) result = "pawn_detail";
			if (investType.equalsIgnoreCase("10002")) result = "guarantee_detail";
			if (investType.equalsIgnoreCase("10003")) result = "loan_detail";
			
			if (investType.indexOf("2000")>-1) result = "project_invest_detail";
			
			if (investType.equalsIgnoreCase("30001")) result = "institution_bank_detail";
			if (investType.equalsIgnoreCase("30002")) result = "institution_insurance_detail";
			if (investType.equalsIgnoreCase("30003")) result = "institution_trust_detail";
			if (investType.equalsIgnoreCase("30004")) result = "institution_stock_detail";
			if (investType.equalsIgnoreCase("30005")) result = "institution_rent_detail";
			if (investType.equalsIgnoreCase("30006")) result = "institution_fund_detail";
			if (investType.equalsIgnoreCase("30007")) result = "institution_finance_detail";
			
		}
		
		return result;
	}
	
	private UsrUser getUser(){
		ActionContext context = ActionContext.getContext();	
		UsrUser user = (UsrUser)context.getSession().get("_user");
		return user;
	}
	
	@Override
	public String execute() throws Exception {
		return null;
	}
	
	public void setSupplyRequestService(SupplyRequestService supplyRequestService) {
		this.supplyRequestService = supplyRequestService;
	}
	
	

	public void setProfileService(ProfileService profileService) {
		this.profileService = profileService;
	}


	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}


	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getClbSupplyInfoId() {
		return clbSupplyInfoId;
	}
	
	

	public Integer getLastDisplayDate() {
		return lastDisplayDate;
	}


	public void setLastDisplayDate(Integer lastDisplayDate) {
		this.lastDisplayDate = lastDisplayDate;
	}


	public void setClbSupplyInfoId(int clbSupplyInfoId) {
		this.clbSupplyInfoId = clbSupplyInfoId;
	}

	public ClbSupplyInfo getClbSupplyInfo() {
		return clbSupplyInfo;
	}

	public void setClbSupplyInfo(ClbSupplyInfo clbSupplyInfo) {
		this.clbSupplyInfo = clbSupplyInfo;
	}

	public List<DicInvestRange> getLoanUsageList() {
		return loanUsageList;
	}

	public void setLoanUsageList(List<DicInvestRange> loanUsageList) {
		this.loanUsageList = loanUsageList;
	}

	public Pager getPager() {
		return pager;
	}

	public List<DicIndustry> getIndustryList() {
		return industryList;
	}
	public List<DicInvestRange> getInvestStyleList() {
		return investStyleList;
	}
	
	

	public String getInvestType() {
		return investType;
	}


	public void setInvestType(String investType) {
		this.investType = investType;
	}


	public void setInvestStyleList(List<DicInvestRange> investStyleList) {
		this.investStyleList = investStyleList;
	}

	public List<DicInvestRange> getAmountRangeList() {
		return amountRangeList;
	}

	public void setAmountRangeList(List<DicInvestRange> amountRangeList) {
		this.amountRangeList = amountRangeList;
	}

	public List<DicInvestRange> getPawnItemList() {
		return pawnItemList;
	}

	public void setPawnItemList(List<DicInvestRange> pawnItemList) {
		this.pawnItemList = pawnItemList;
	}

	public List<DicInvestRange> getGuaranteeTypeList() {
		return guaranteeTypeList;
	}

	public void setGuaranteeTypeList(List<DicInvestRange> guaranteeTypeList) {
		this.guaranteeTypeList = guaranteeTypeList;
	}

	public String getRedirect() {
		return redirect;
	}

	public void setRedirect(String redirect) {
		this.redirect = redirect;
	}

	public List<DicProvince> getProvinceList() {
		return provinceList;
	}

	public List<DicInvestRange> getTimeIntervalList() {
		return timeIntervalList;
	}

	public String[] getQuery() {
		return query;
	}
	
	public void setQuery(String[] query) {
		this.query = query;
	}

	public List<PrdRecommendation> getBankFinanceRecommendationList() {
		return bankFinanceRecommendationList;
	}

	public void setBankFinanceRecommendationList(
			List<PrdRecommendation> bankFinanceRecommendationList) {
		this.bankFinanceRecommendationList = bankFinanceRecommendationList;
	}

	public FinanceProdService getFinanceProdService() {
		return financeProdService;
	}

	public void setFinanceProdService(FinanceProdService financeProdService) {
		this.financeProdService = financeProdService;
	}

	public List<String> getCheckedItems() {
		return checkedItems;
	}

	public List<String> getCheckedProvinces() {
		return checkedProvinces;
	}

	public List<String> getCheckedIndustry() {
		return checkedIndustry;
	}

	public List<String> getCheckedServiceType() {
		return checkedServiceType;
	}

	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}

	public List<String[]> getUserInfoList() {
		return userInfoList;
	}
	

}
