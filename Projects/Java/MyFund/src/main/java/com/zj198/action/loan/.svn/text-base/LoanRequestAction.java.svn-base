package com.zj198.action.loan;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.action.loan.model.LoanOrgCountModel;
import com.zj198.model.DicCity;
import com.zj198.model.DicCommon;
import com.zj198.model.DicDistrict;
import com.zj198.model.DicIndustry;
import com.zj198.model.DicProvince;
import com.zj198.model.DicUsertype;
import com.zj198.model.OrdLoanRequest;
import com.zj198.model.UsrCompany;
import com.zj198.model.UsrPerson;
import com.zj198.model.UsrUser;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.loan.LoanRequestService;
import com.zj198.service.user.AccountService;
import com.zj198.service.user.ProfileService;
import com.zj198.util.Constants;

/**
 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-6-20 10:07:45
 * @modify: zeroleavebaoyang@gmail.com
 * @modifytime: 2012-6-28 13:21:23
 */
public class LoanRequestAction extends BaseAction {
	private DictoryDataService dictoryDataService;
	private LoanRequestService loanRequestService;
	private String applyNum;
	private Map<String, List<DicCommon>> dataMap;
	private Integer industryId;
	private List<DicIndustry> industryList;// 行业
	private List<DicProvince> listProvince;// 所有省份
	private OrdLoanRequest loan;
	private String[] loanObjects;
	private LoanOrgCountModel loanOrgCountModel;// 贷款机构汇总
	private AccountService accountService;
	private Integer maxBound;
	private Integer minBound;
	private List<DicUsertype> userTypeList;
	/**
	 * -------------如果用户申请融资未审核 为企业或个人用户 显示编辑信息  （林明）
	 */
	private UsrPerson usrPerson;
	private Map<String,List<DicCity>> cityMap;
	private Map<String,List<DicDistrict>> districtMap;
	private ProfileService profileService;
	private UsrCompany usrCompany;
	private List<DicIndustry> industry;
	/**
	 * 基准利率
	 */
	private Double baseRate;

	private Short userType;
	private Integer groupType;
	private Integer typeId;
	private List<DicCommon> purposeTypeList;
	/**
	 * 企业快速申请融资第一步
	 * 
	 * @return
	 */
	public String busiFirst() {
		dataMap = new HashMap<String, List<DicCommon>>();
		/**
		 * 获取企业贷款用途字典
		 */
		dataMap.put("loanpurpose", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_LOANPURPOSE));
		userTypeList = dictoryDataService.findUserTypeByGroup(Integer.valueOf(Constants.BASEDATA_GROUP_RUNNINGTYPE));
		return "busiFirst";
	}

	public String execute() {
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		if (user != null) {
			int appType = loan.getApplyType().intValue();
			if (user.getUserTypeGroup().intValue() != 1 && user.getUserTypeGroup().intValue() != 5) {
				msg = "2";// 只有个人用户与企业用户可以申请融资！
			}
			if (appType == 136 && user.getUserTypeGroup() == 5) {
				msg = "3";// 个人用户不允许申请企业融资！
			}
			if (appType > 136 && user.getUserTypeGroup() == 1) {
				msg = "4";// 企业用户不允许申请个人融资！
			}
			if (msg != null && msg.length() > 0) {
				return loanThird();
			}
		}
		if (loan.getApplyType().intValue() == 136) {
			return busiFirst();
		} else if (loan.getApplyType().intValue() == 137) {
			return percostFirst();
		} else if (loan.getApplyType().intValue() == 138) {
			return perrunFirst();
		} else if (loan.getApplyType().intValue() == 139) {
			return perhouseFirst();
		}
		return busiFirst();
	}

	public String loanRequest_bak() {
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		if (user != null) {
			int appType = loan.getApplyType().intValue();
			if (user.getUserTypeGroup().intValue() != 1 && user.getUserTypeGroup().intValue() != 5) {
				msg = "2";// 只有个人用户与企业用户可以申请融资！
			}
			if (appType == 136 && user.getUserTypeGroup() == 5) {
				msg = "3";// 个人用户不允许申请企业融资！
			}
			if (appType > 136 && user.getUserTypeGroup() == 1) {
				msg = "4";// 企业用户不允许申请个人融资！
			}
			if (msg != null && msg.length() > 0) {
				return loanThird();
			}
		}
		if (loan.getApplyType().intValue() == 136) {
			return busiFirst();
		} else if (loan.getApplyType().intValue() == 137) {
			return percostFirst();
		} else if (loan.getApplyType().intValue() == 138) {
			return perrunFirst();
		} else if (loan.getApplyType().intValue() == 139) {
			return perhouseFirst();
		}
		return busiFirst();
	}
	
	/**
	 * 企业快速申请融资第二步 统计各种贷款机构的数量
	 * 
	 * @return
	 */
	public String loanSecond() {
		/**
		 * validate data
		 */
		if (loan.getApplyType().intValue() == 136) {// 企业快速申请融资
			if (loan.getLoanAmount() == null || loan.getLoanMonth() == null || loan.getLastyearCost() == null || loan.getLastyearDebt() == null || loan.getLastyearProfit() == null || loan.getLastyearVolume() == null || loan.getHaveMortgage() == null) {
				msg = "请填写完所有必填项，再提交申请！";
				return busiFirst();
			}
		}
		if (loan.getApplyType().intValue() == 137) {// 个人综合消费快速申请
			if (loan.getLoanAmount() == null || loan.getLoanMonth() == null || loan.getHaveMortgage() == null || loan.getCompanyType() == null || loan.getWorkTime() == null || loan.getSalaryLevel() == null || loan.getPutSalaryType() == null || loan.getHaveHouse() == null || loan.getHostoryLoan() == null || loan.getUserCreditCard() == null || loan.getBankSalaryList() == null) {
				msg = "请填写完所有必填项，再提交申请！";
				return percostFirst();
			}
		}
		if (loan.getApplyType().intValue() == 138) {// 个人经营快速申请
			if (loan.getLoanAmount() == null || loan.getLoanMonth() == null || loan.getHaveMortgage() == null || loan.getRunningTrade() == null || loan.getExperience() == null || loan.getAllyearVolume() == null || loan.getRunningArea() == null || loan.getHostoryLoan() == null || loan.getUserCreditCard() == null || loan.getBankSalaryList() == null) {
				msg = "请填写完所有必填项，再提交申请！";
				return perrunFirst();
			}
		}
		if (loan.getApplyType().intValue() == 139) {// 个人购房快速申请
			if (loan.getHouseNature() == null || loan.getLoanMonth() == null || loan.getRepaymentType() == null || loan.getBirthday() == null || loan.getTeachLevel() == null || loan.getCompanyType() == null || loan.getWorkTime() == null || loan.getSalaryLevel() == null || loan.getPutSalaryType() == null || loan.getHaveHouse() == null || loan.getUserCreditCard() == null || loan.getBankSalaryList() == null) {
				msg = "请填写完所有必填项，再提交申请！";
				return perhouseFirst();
			}
		}

		loanOrgCountModel = new LoanOrgCountModel();
		loanOrgCountModel.setBankNum(loanRequestService.countBankNum());
		loanOrgCountModel.setFinanceOrg(loanRequestService.countUserByType(Short.valueOf(Constants.USER_TYPE_RENT)));
		loanOrgCountModel.setInsuranceOrg(loanRequestService.countUserByType(Short.valueOf(Constants.USER_TYPE_INSURANCE)));
		loanOrgCountModel.setLittleLoan(loanRequestService.countUserByType(Short.valueOf(Constants.USER_TYPE_LOAN)));
		loanOrgCountModel.setPawnOrg(loanRequestService.countUserByType(Short.valueOf(Constants.USER_TYPE_HOCK)));
		loanOrgCountModel.setPopularOrg(loanRequestService.countUserByType(Short.valueOf(Constants.USER_TYPE_PRIORG)));
		loanOrgCountModel.setWarrantOrg(loanRequestService.countUserByType(Short.valueOf(Constants.USER_TYPE_GUARANTEE)));

		baseRate = loanRequestService.getBaseRate(loan.getLoanMonth());
		return "loanSecond";
	}

	/**
	 * 企业快速申请融资第三步
	 * 
	 * @return
	 */
	public String loanThird() {
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
//		UsrUser usrUser =accountService.getUserById(user.getId());
		if(user.getAuditstatus() != Constants.USER_AUDITSTATUS_DONE){
			if(user.getUserTypeGroup() == Constants.USERTYPE_GROUP_COMPANY){
				listProvince=dictoryDataService.findAllProvince();
				cityMap = new HashMap<String,List<DicCity>>();
				districtMap = new HashMap<String,List<DicDistrict>>();
				usrCompany = (UsrCompany)profileService.getProfiles(user.getId());
				if(usrCompany!=null){
					cityMap.put("bizCity", dictoryDataService.findCityByProvinceid(usrCompany.getBizprovinceid()));
					districtMap.put("bizDistrict", dictoryDataService.findDistrictByCityid(usrCompany.getBizcityid()));
					industry=dictoryDataService.findIndustryByParentid(usrCompany.getIndustryparentid());
				}
				industryList = dictoryDataService.findIndustryByParentid(0);
			}else if(user.getUserTypeGroup() == Constants.USERTYPE_GROUP_PERSONAL){
				listProvince=dictoryDataService.findAllProvince();
				dataMap = new HashMap<String,List<DicCommon>>();
				cityMap = new HashMap<String,List<DicCity>>();
				districtMap = new HashMap<String,List<DicDistrict>>();
				usrPerson = (UsrPerson)profileService.getProfiles(user.getId());
				if(usrPerson!=null){
					cityMap.put("city", dictoryDataService.findCityByProvinceid(usrPerson.getProvinceid()));
					districtMap.put("district", dictoryDataService.findDistrictByCityid(usrPerson.getCityid()));
				}
				dataMap.put("psersoncareer", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_PERSONCAREER));
				dataMap.put("mtool", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_IMTOOL));
				dataMap.put("eduAtion", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_EDUCATION));
			}
		}
		if (context.getSession().get("_user") == null) {
			msg = "1";//用户未登陆，不允许申请融资！
			return "loanThird";
		}
		int appType = loan.getApplyType().intValue();
		if (user.getUserTypeGroup().intValue() != 1 && user.getUserTypeGroup().intValue() != 5) {
			msg = "2";//只有个人用户与企业用户可以申请融资！
		}
		if (appType == 136 && user.getUserTypeGroup() == 5) {
			msg = "3";//个人用户不允许申请企业融资！
		}
		if (appType > 136 && user.getUserTypeGroup() == 1) {
			msg = "4";//企业用户不允许申请个人融资！
		}
		if(msg != null && msg.length() > 0){
			return "loanThird";
		}
		
		loan.setUserId(user.getId());
		applyNum = loanRequestService.saveLoanRequest(loan, loanObjects, minBound, maxBound);
		return "loanThird";
	}

	/**
	 * 用户更新profile信息   
	 * 
	 * @return
	 */
	public String auditProfile(){
		if(usrCompany==null && usrPerson==null){
			msg="不可重复提交";
			return ERROR;
		}
		String message;  //验证返回的msg
		ActionContext ctx = ActionContext.getContext();
		UsrUser user = (UsrUser)ctx.getSession().get("_user");
		UsrUser usrUser =accountService.getUserById(user.getId());
		int groupid = profileService.getGroupidByUserType(user.getType());
		switch (groupid){
			case Constants.USERTYPE_GROUP_COMPANY:
				//TODO:需要对保护的字段不验证
				if(usrUser.getAuditstatus()==Constants.USER_AUDITSTATUS_NONE){//判断user auditstatus - Patrick
					message=usrCompany.validAuditFields(usrCompany);
					if(message.startsWith("1#")){
						/**
						 * 验证失败，返回上一个页面
						 */
						msg=message.substring(2, message.length());
						listProvince=dictoryDataService.findAllProvince();
						cityMap = new HashMap<String,List<DicCity>>();
						districtMap = new HashMap<String,List<DicDistrict>>();
						cityMap.put("bizCity", dictoryDataService.findCityByProvinceid(usrCompany.getBizprovinceid()));
						districtMap.put("bizDistrict", dictoryDataService.findDistrictByCityid(usrCompany.getBizcityid()));
						industry=dictoryDataService.findIndustryByParentid(usrCompany.getIndustryparentid());
						industryList = dictoryDataService.findIndustryByParentid(0);
						return "loanThird";
					}
				}
				//判断user auditstatus 如果为1  或者2 需对不可修改字段进行保护    《管理员审核时 对不可修改字段必须填写才可通过》
				UsrCompany old_UsrCompany = (UsrCompany)profileService.getProfiles(usrUser.getId());
				if(old_UsrCompany!=null){
					old_UsrCompany.setAuditFields(usrCompany);
					profileService.saveorupdate(old_UsrCompany);
				}else{
					profileService.saveorupdate(usrCompany);
				}
				break;
			case Constants.USERTYPE_GROUP_PERSONAL:
				//TODO:需要对保护的字段不验证
				message=usrPerson.validOthersFields(usrPerson);
				if(message.startsWith("1#")){
					/**
					 * 验证失败，返回上一个页面
					 */
					msg=message.substring(2, message.length());
					
					listProvince=dictoryDataService.findAllProvince();
					dataMap = new HashMap<String,List<DicCommon>>();
					cityMap = new HashMap<String,List<DicCity>>();
					districtMap = new HashMap<String,List<DicDistrict>>();
					cityMap.put("city", dictoryDataService.findCityByProvinceid(usrPerson.getProvinceid()));
					districtMap.put("district", dictoryDataService.findDistrictByCityid(usrPerson.getCityid()));
					dataMap.put("psersoncareer", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_PERSONCAREER));
					dataMap.put("mtool", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_IMTOOL));
					dataMap.put("eduAtion", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_EDUCATION));
					return "loanThird";
				}
				//判断user auditstatus 如果为1  或者2 需对不可修改字段进行保护    《管理员审核时 对不可修改字段必须填写才可通过》
				
				profileService.saveorupdate(usrPerson);
				break;
		}
		msg="保存成功。";
		return "profileSuccess";
	}
	/**
	 * 个人综合消费快速申请融资第一步
	 * 
	 * @return
	 */
	public String percostFirst() {
		dataMap = new HashMap<String, List<DicCommon>>();
		dataMap.put("loanpurpose", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_PERSONSPEND));
		dataMap.put("teachlevel", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_EDUCATION));
		dataMap.put("companynature", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_COMPANYNATURE));
		dataMap.put("worktime", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_WORKTIME));
		dataMap.put("salary", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_SALARY));
		dataMap.put("putsalarytype", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_PUTSALARYTYPE));
		dataMap.put("salarylist", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_SALARYLIST));

		return "percostFirst";
	}

	/**
	 * 个人购房快速申请融资第一步
	 * 
	 * @return
	 */
	public String perhouseFirst() {
		dataMap = new HashMap<String, List<DicCommon>>();
		dataMap.put("housenaturn", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_HOUSENATURN));
		dataMap.put("teachlevel", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_EDUCATION));
		dataMap.put("companynature", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_COMPANYNATURE));
		dataMap.put("worktime", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_WORKTIME));
		dataMap.put("salary", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_SALARY));
		dataMap.put("putsalarytype", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_PUTSALARYTYPE));
		dataMap.put("repaymenttype", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_REPAYMENTTYPE));
		return "perhouseFirst";
	}

	/**
	 * 个人经营快速申请融资第一步
	 * 
	 * @return
	 */
	public String perrunFirst() {
		dataMap = new HashMap<String, List<DicCommon>>();
		industryList = dictoryDataService.findIndustryByParentid(0);
		dataMap.put("loanpurpose", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_PERSONRUNNING));
		dataMap.put("allyearsales", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_ALLYEARSALES));
		dataMap.put("salarylist", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_SALARYLIST));
		return "perrunFirst";
	}

	public String loanPurposeByTypeId() {
		if (typeId > 0) {
			purposeTypeList = dictoryDataService.findCommonDataByGroupId(typeId);
		}
		return "purposes";
	}

	public String getApplyNum() {
		return applyNum;
	}

	public void setApplyNum(String applyNum) {
		this.applyNum = applyNum;
	}

	public Map<String, List<DicCommon>> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<String, List<DicCommon>> dataMap) {
		this.dataMap = dataMap;
	}

	public Integer getIndustryId() {
		return industryId;
	}

	public void setIndustryId(Integer industryId) {
		this.industryId = industryId;
	}

	public List<DicIndustry> getIndustryList() {
		return industryList;
	}

	public void setIndustryList(List<DicIndustry> industryList) {
		this.industryList = industryList;
	}

	public List<DicProvince> getListProvince() {
		return listProvince;
	}

	public void setListProvince(List<DicProvince> listProvince) {
		this.listProvince = listProvince;
	}

	public OrdLoanRequest getLoan() {
		return loan;
	}

	public void setLoan(OrdLoanRequest loan) {
		this.loan = loan;
	}

	public String[] getLoanObjects() {
		return loanObjects;
	}

	public void setLoanObjects(String[] loanObjects) {
		this.loanObjects = loanObjects;
	}

	public LoanOrgCountModel getLoanOrgCountModel() {
		return loanOrgCountModel;
	}

	public void setLoanOrgCountModel(LoanOrgCountModel loanOrgCountModel) {
		this.loanOrgCountModel = loanOrgCountModel;
	}

	public Integer getMaxBound() {
		return maxBound;
	}

	public void setMaxBound(Integer maxBound) {
		this.maxBound = maxBound;
	}

	public Integer getMinBound() {
		return minBound;
	}

	public void setMinBound(Integer minBound) {
		this.minBound = minBound;
	}

	public List<DicUsertype> getUserTypeList() {
		return userTypeList;
	}

	public void setUserTypeList(List<DicUsertype> userTypeList) {
		this.userTypeList = userTypeList;
	}

	public UsrPerson getUsrPerson() {
		return usrPerson;
	}

	public void setUsrPerson(UsrPerson usrPerson) {
		this.usrPerson = usrPerson;
	}

	public Map<String, List<DicCity>> getCityMap() {
		return cityMap;
	}

	public void setCityMap(Map<String, List<DicCity>> cityMap) {
		this.cityMap = cityMap;
	}

	public Map<String, List<DicDistrict>> getDistrictMap() {
		return districtMap;
	}

	public void setDistrictMap(Map<String, List<DicDistrict>> districtMap) {
		this.districtMap = districtMap;
	}

	public UsrCompany getUsrCompany() {
		return usrCompany;
	}

	public void setUsrCompany(UsrCompany usrCompany) {
		this.usrCompany = usrCompany;
	}

	public List<DicIndustry> getIndustry() {
		return industry;
	}

	public void setIndustry(List<DicIndustry> industry) {
		this.industry = industry;
	}

	public Double getBaseRate() {
		return baseRate;
	}

	public void setBaseRate(Double baseRate) {
		this.baseRate = baseRate;
	}

	public Short getUserType() {
		return userType;
	}

	public void setUserType(Short userType) {
		this.userType = userType;
	}

	public Integer getGroupType() {
		return groupType;
	}

	public void setGroupType(Integer groupType) {
		this.groupType = groupType;
	}

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public List<DicCommon> getPurposeTypeList() {
		return purposeTypeList;
	}

	public void setPurposeTypeList(List<DicCommon> purposeTypeList) {
		this.purposeTypeList = purposeTypeList;
	}

	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}

	public void setLoanRequestService(LoanRequestService loanRequestService) {
		this.loanRequestService = loanRequestService;
	}

	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}

	public void setProfileService(ProfileService profileService) {
		this.profileService = profileService;
	}

	
}
