package com.zj198.action.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.model.DicBank;
import com.zj198.model.DicCity;
import com.zj198.model.DicCommon;
import com.zj198.model.DicDistrict;
import com.zj198.model.DicIndustry;
import com.zj198.model.DicProvince;
import com.zj198.model.UsrBank;
import com.zj198.model.UsrCompany;
import com.zj198.model.UsrFinanceorg;
import com.zj198.model.UsrOrgAttach;
import com.zj198.model.UsrPerson;
import com.zj198.model.UsrServiceorg;
import com.zj198.model.UsrUser;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.user.AccountService;
import com.zj198.service.user.ProfileService;
import com.zj198.util.Constants;
import com.zj198.util.PropertiesUtil;
import com.zj198.util.SecurityUtil;
import com.zj198.util.StringUtil;

/**
 * profile类
 * @author Patrick
 *
 */
public class ProfileAction extends BaseAction  {
	private UsrPerson usrPerson;
	private UsrBank usrBank;
	private UsrFinanceorg usrFinanceorg;
	private UsrServiceorg usrServiceorg;
	private UsrCompany usrCompany;
	private UsrUser usrUser;
	
    private AccountService accountService;
	private DictoryDataService  dictoryDataService;
	private ProfileService profileService;
    private List<DicProvince> listProvince;
	private Map<String,List<DicCommon>> dataMap;
	private List<DicIndustry> industryList;
	private List<DicIndustry> industry;
    private Map<String,String> profileMap;
	private Map<String,List<DicCity>> cityMap;
	private Map<String,List<DicDistrict>> districtMap;
	private List<DicBank> bankList;
	
	// private
	private String password;
	private String oldPwd;
	private String verifycode;
	private Integer companyMark;//company提交哪个from表单的标示 1企业基本信息 需审核  2 融资申请信息
	/**
	 * 如果用户没有填写过profile信息 则强制填写  但可以跳过
	 * @return
	 */
	@Override
	public String execute(){
		ActionContext ctx = ActionContext.getContext();
		UsrUser user = (UsrUser)ctx.getSession().get("_user");
		if(profileService.getProfiles(user.getId())==null){
			return edit();
		}else{
			return getUserInfo(user);
		}
	}
	public String viewUserInfo(){
		if(usrUser.getId() != null){
			UsrUser user = accountService.getUserById(usrUser.getId());
			if(user.getType() < 6){//只能查看企业与个人详情
				return this.getUserInfo(user);
			}
		}
		return ERROR;
	}
	private String getUserInfo(UsrUser user){
		int groupid = profileService.getGroupidByUserType(user.getType());
		switch (groupid){
			case Constants.USERTYPE_GROUP_BANK:
				usrBank = (UsrBank)profileService.getProfiles(user.getId());
				profileMap=new HashMap<String,String>();
				if(user.getAuditstatus()==Constants.USER_AUDITSTATUS_NONE){
					String bankName="";
					if(usrBank.getBankid()!=null && usrBank.getBankid()!=0){
						bankName=dictoryDataService.getDicBankById(usrBank.getBankid()).getName();
					}
					profileMap.put("bankName",bankName);
				}
				profileMap.put("address",dictoryDataService.getPCDNameByIds(usrBank.getProvinceid(), usrBank.getCityid(), usrBank.getDistrictid()));
				return "bankProfile";
			case Constants.USERTYPE_GROUP_COMPANY:
				profileMap=new HashMap<String,String>();
				usrCompany = (UsrCompany)profileService.getProfiles(user.getId());
				String industry="";
				if(usrCompany.getIndustryid()!=null && usrCompany.getIndustryid()!=0){
					industry=dictoryDataService.getIndustryById(usrCompany.getIndustryid()).getName();
				}
				profileMap.put("industry", industry);
				profileMap.put("bizaddress",dictoryDataService.getPCDNameByIds(usrCompany.getBizprovinceid(), usrCompany.getBizcityid(), usrCompany.getBizdistrictid()));
				if(companyMark == null){
					return "auditCompanyProfile";
				}else if(companyMark == 1){
					return "auditCompanyProfile";
				}
				profileMap.put("regaddress",dictoryDataService.getPCDNameByIds(usrCompany.getRegprovinceid(), usrCompany.getRegcityid(), usrCompany.getRegdistrictid()));
				profileMap.put("lpliveaddress",dictoryDataService.getPCDNameByIds(usrCompany.getLpliveprovinceid(), usrCompany.getLplivecityid(), usrCompany.getLplivedistrictid()));
				profileMap.put("lphkaddress",dictoryDataService.getPCDNameByIds(usrCompany.getLphkprovinceid(), usrCompany.getLphkcityid(), usrCompany.getLphkdistrictid()));
				profileMap.put("companyType", dictoryDataService.getValueNameById(usrCompany.getEnterprisetypeid()));
				profileMap.put("companyTmployee", dictoryDataService.getValueNameById(usrCompany.getEmployeesid()));
				profileMap.put("eduAtion", dictoryDataService.getValueNameById(usrCompany.getLpeducation()));
				profileMap.put("marry", dictoryDataService.getValueNameById(usrCompany.getLpmarry()));
				profileMap.put("workYears", dictoryDataService.getValueNameById(usrCompany.getLpindustryyears()));
				return "companyProfile";
			case Constants.USERTYPE_GROUP_FINANCEORG:
				profileMap=new HashMap<String,String>();
				usrFinanceorg = (UsrFinanceorg)profileService.getProfiles(user.getId());
				List<UsrOrgAttach> FusrOrgAttachList = profileService.fintByUid(user.getId());
				if(FusrOrgAttachList.size() != 0){
					for(UsrOrgAttach usrOrgAttach : FusrOrgAttachList){
						if(usrOrgAttach.getAttachType() == Constants.BASEDATA_GROUP_ORG_ATTACH_BUSINESS){
							profileMap.put("business",usrOrgAttach.getOldFileName());
							profileMap.put("businessId",usrOrgAttach.getId().toString());
						}else if(usrOrgAttach.getAttachType() == Constants.BASEDATA_GROUP_ORG_ATTACH_ORGANIZATION){
							profileMap.put("orgAnization",usrOrgAttach.getOldFileName());
							profileMap.put("orgAnizationId",usrOrgAttach.getId().toString());
						}else if(usrOrgAttach.getAttachType() == Constants.BASEDATA_GROUP_ORG_ATTACH_TAXREGISTRATION){
							profileMap.put("taxregistration",usrOrgAttach.getOldFileName());
							profileMap.put("taxregistrationId",usrOrgAttach.getId().toString());
						}
					}
				}
				profileMap.put("regaddress", dictoryDataService.getPCDNameByIds(usrFinanceorg.getRegprovinceid(), usrFinanceorg.getRegcityid(), usrFinanceorg.getRegdistrictid()));
				profileMap.put("bizaddress", dictoryDataService.getPCDNameByIds(usrFinanceorg.getBizprovinceid(), usrFinanceorg.getBizcityid(), usrFinanceorg.getBizdistrictid()));
				profileMap.put("companyType",dictoryDataService.getValueNameById(usrFinanceorg.getOrgtypeid()));
				return "financeorgProfile";
			case Constants.USERTYPE_GROUP_PERSONAL:
				profileMap=new HashMap<String,String>();
				usrPerson = (UsrPerson)profileService.getProfiles(user.getId());
				profileMap.put("address", dictoryDataService.getPCDNameByIds(usrPerson.getProvinceid(), usrPerson.getCityid(), usrPerson.getDistrictid()));
				profileMap.put("psersoncareer",dictoryDataService.getValueNameById(usrPerson.getCareerid()) );
				profileMap.put("eduAtion",dictoryDataService.getValueNameById(usrPerson.getEducation()) );
				profileMap.put("imtype1", dictoryDataService.getValueNameById(usrPerson.getIm1type()));
				profileMap.put("imtype2",dictoryDataService.getValueNameById(usrPerson.getIm2type()) );
				profileMap.put("imtype3", dictoryDataService.getValueNameById(usrPerson.getIm3type()));
				return "personProfile";
			case Constants.USERTYPE_GROUP_SERVICEORG:
				usrServiceorg = (UsrServiceorg)profileService.getProfiles(user.getId());
				profileMap=new HashMap<String,String>();
				List<UsrOrgAttach> SusrOrgAttachList = profileService.fintByUid(user.getId());
				if(SusrOrgAttachList.size() != 0){
					for(UsrOrgAttach usrOrgAttach : SusrOrgAttachList){
						if(usrOrgAttach.getAttachType() == Constants.BASEDATA_GROUP_ORG_ATTACH_BUSINESS){
							profileMap.put("business",usrOrgAttach.getOldFileName());
							profileMap.put("businessId",usrOrgAttach.getId().toString());
						}else if(usrOrgAttach.getAttachType() == Constants.BASEDATA_GROUP_ORG_ATTACH_ORGANIZATION){
							profileMap.put("orgAnization",usrOrgAttach.getOldFileName());
							profileMap.put("orgAnizationId",usrOrgAttach.getId().toString());
						}else if(usrOrgAttach.getAttachType() == Constants.BASEDATA_GROUP_ORG_ATTACH_TAXREGISTRATION){
							profileMap.put("taxregistration",usrOrgAttach.getOldFileName());
							profileMap.put("taxregistrationId",usrOrgAttach.getId().toString());
						}
					}
				}
				profileMap.put("regaddress", dictoryDataService.getPCDNameByIds(usrServiceorg.getRegprovinceid(), usrServiceorg.getRegcityid(), usrServiceorg.getRegdistrictid()));
				profileMap.put("bizaddress", dictoryDataService.getPCDNameByIds(usrServiceorg.getBizprovinceid(), usrServiceorg.getBizcityid(), usrServiceorg.getBizdistrictid()));
				profileMap.put("companyType", dictoryDataService.getValueNameById(usrServiceorg.getOrgtypeid()));
				profileMap.put("serviceproduct", dictoryDataService.getValueNamesByIds(usrServiceorg.getServiceproduct()));
				return "serviceorgProfile";
		}
		return ERROR;
	}
	
	/**
	 * 编辑信息页
	 * @return
	 */
	public String edit(){
		ActionContext ctx = ActionContext.getContext();
		UsrUser user = (UsrUser)ctx.getSession().get("_user");
		int groupid = profileService.getGroupidByUserType(user.getType());
		switch (groupid){
			case Constants.USERTYPE_GROUP_BANK:
				listProvince=dictoryDataService.findAllProvince();
				cityMap = new HashMap<String,List<DicCity>>();
				districtMap = new HashMap<String,List<DicDistrict>>();
				usrBank = (UsrBank)profileService.getProfiles(user.getId());
				if(user.getAuditstatus()==Constants.USER_AUDITSTATUS_NONE){
					bankList=dictoryDataService.findDicBankList();
				}
				if(usrBank!=null){
					cityMap.put("City", dictoryDataService.findCityByProvinceid(usrBank.getProvinceid()));
					districtMap.put("District", dictoryDataService.findDistrictByCityid(usrBank.getCityid()));
				}
				usrBank = (UsrBank)profileService.getProfiles(user.getId());
				return "editBankProfile";
			case Constants.USERTYPE_GROUP_COMPANY:
				listProvince=dictoryDataService.findAllProvince();
				dataMap = new HashMap<String,List<DicCommon>>();
				cityMap = new HashMap<String,List<DicCity>>();
				districtMap = new HashMap<String,List<DicDistrict>>();
				usrCompany = (UsrCompany)profileService.getProfiles(user.getId());
				if(usrCompany==null){
					companyMark=1;
				}
				if(companyMark==1){   //跳转到编辑企业基本信息页面
					if(usrCompany!=null){
						cityMap.put("bizCity", dictoryDataService.findCityByProvinceid(usrCompany.getBizprovinceid()));
						districtMap.put("bizDistrict", dictoryDataService.findDistrictByCityid(usrCompany.getBizcityid()));
						industry=dictoryDataService.findIndustryByParentid(usrCompany.getIndustryparentid());
					}
					industryList = dictoryDataService.findIndustryByParentid(0);
					return "editCompanyAduit";
				}else{                //跳转到编辑企业详细信息页面
					profileMap=new HashMap<String,String>();
					String industrys="";
					if(usrCompany.getIndustryid()!=null && usrCompany.getIndustryid()!=0){
						industrys=dictoryDataService.getIndustryById(usrCompany.getIndustryid()).getName();
					}
					profileMap.put("industry", industrys);
					profileMap.put("bizaddress",dictoryDataService.getPCDNameByIds(usrCompany.getBizprovinceid(), usrCompany.getBizcityid(), usrCompany.getBizdistrictid()));
					cityMap.put("regCity", dictoryDataService.findCityByProvinceid(usrCompany.getRegprovinceid()));
					districtMap.put("regDistrict", dictoryDataService.findDistrictByCityid(usrCompany.getRegcityid()));
					cityMap.put("lpliveCity", dictoryDataService.findCityByProvinceid(usrCompany.getLpliveprovinceid()));
					districtMap.put("lpliveDistrict", dictoryDataService.findDistrictByCityid(usrCompany.getLplivecityid()));
					cityMap.put("lphkCity", dictoryDataService.findCityByProvinceid(usrCompany.getLphkprovinceid()));
					districtMap.put("lphkDistrict", dictoryDataService.findDistrictByCityid(usrCompany.getLphkcityid()));
					dataMap.put("companyType", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_COMPANYTYPE));
					dataMap.put("companyTmployee", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_COMPANYEMPLOYEE));
					dataMap.put("eduAtion", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_EDUCATION));
					dataMap.put("marry", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_MARRY));
					dataMap.put("workYears", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_WORKYEARS));
					return "editCompanyProfile";
				}
			case Constants.USERTYPE_GROUP_FINANCEORG:
				listProvince=dictoryDataService.findAllProvince();
				dataMap = new HashMap<String,List<DicCommon>>();
				cityMap = new HashMap<String,List<DicCity>>();
				districtMap = new HashMap<String,List<DicDistrict>>();
				profileMap=new HashMap<String,String>();
				usrFinanceorg = (UsrFinanceorg)profileService.getProfiles(user.getId());
				dataMap.put("companyType", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_COMPANYTYPE));
				if(usrFinanceorg!=null){
					cityMap.put("bizCity", dictoryDataService.findCityByProvinceid(usrFinanceorg.getBizprovinceid()));
					districtMap.put("bizDistrict", dictoryDataService.findDistrictByCityid(usrFinanceorg.getBizcityid()));
					cityMap.put("regCity", dictoryDataService.findCityByProvinceid(usrFinanceorg.getRegprovinceid()));
					districtMap.put("regDistrict", dictoryDataService.findDistrictByCityid(usrFinanceorg.getRegcityid()));
				}
				List<UsrOrgAttach> FusrOrgAttachList = profileService.fintByUid(user.getId());
				if(FusrOrgAttachList.size() != 0){
					for(UsrOrgAttach usrOrgAttach : FusrOrgAttachList){
						if(usrOrgAttach.getAttachType() == Constants.BASEDATA_GROUP_ORG_ATTACH_BUSINESS){
							profileMap.put("business",usrOrgAttach.getOldFileName());
							profileMap.put("businessId",usrOrgAttach.getId().toString());
						}else if(usrOrgAttach.getAttachType() == Constants.BASEDATA_GROUP_ORG_ATTACH_ORGANIZATION){
							profileMap.put("orgAnization",usrOrgAttach.getOldFileName());
							profileMap.put("orgAnizationId",usrOrgAttach.getId().toString());
						}else if(usrOrgAttach.getAttachType() == Constants.BASEDATA_GROUP_ORG_ATTACH_TAXREGISTRATION){
							profileMap.put("taxregistration",usrOrgAttach.getOldFileName());
							profileMap.put("taxregistrationId",usrOrgAttach.getId().toString());
						}
					}
				}
				return "editFinanceorgProfile";
			case Constants.USERTYPE_GROUP_PERSONAL:
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
				return "editPersonProfile";
			case Constants.USERTYPE_GROUP_SERVICEORG:
				listProvince=dictoryDataService.findAllProvince();
				dataMap = new HashMap<String,List<DicCommon>>();
				cityMap = new HashMap<String,List<DicCity>>();
				districtMap = new HashMap<String,List<DicDistrict>>();
				profileMap=new HashMap<String,String>();
				usrServiceorg = (UsrServiceorg)profileService.getProfiles(user.getId());
				if(usrServiceorg!=null){
					cityMap.put("regCity", dictoryDataService.findCityByProvinceid(usrServiceorg.getRegprovinceid()));
					districtMap.put("regDistrict", dictoryDataService.findDistrictByCityid(usrServiceorg.getRegcityid()));
					cityMap.put("bizCity", dictoryDataService.findCityByProvinceid(usrServiceorg.getBizprovinceid()));
					districtMap.put("bizDistrict", dictoryDataService.findDistrictByCityid(usrServiceorg.getBizcityid()));
				}
				dataMap.put("companyType", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_COMPANYTYPE));
				dataMap.put("serviceproduct", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_SERVICEPRODUCT));
				List<UsrOrgAttach> SusrOrgAttachList = profileService.fintByUid(user.getId());
				if(SusrOrgAttachList.size() != 0){
					for(UsrOrgAttach usrOrgAttach : SusrOrgAttachList){
						if(usrOrgAttach.getAttachType() == Constants.BASEDATA_GROUP_ORG_ATTACH_BUSINESS){
							profileMap.put("business",usrOrgAttach.getOldFileName());
							profileMap.put("businessId",usrOrgAttach.getId().toString());
						}else if(usrOrgAttach.getAttachType() == Constants.BASEDATA_GROUP_ORG_ATTACH_ORGANIZATION){
							profileMap.put("orgAnization",usrOrgAttach.getOldFileName());
							profileMap.put("orgAnizationId",usrOrgAttach.getId().toString());
						}else if(usrOrgAttach.getAttachType() == Constants.BASEDATA_GROUP_ORG_ATTACH_TAXREGISTRATION){
							profileMap.put("taxregistration",usrOrgAttach.getOldFileName());
							profileMap.put("taxregistrationId",usrOrgAttach.getId().toString());
						}
					}
				}
				return "editServiceorgProfile";
		}
		return ERROR;
	}
	
	/**
	 * 保存profile信息,同时根据结果更新session中的status
	 * @return
	 */
	public String update(){
		if(usrBank==null && usrCompany==null && usrFinanceorg==null && usrPerson==null && usrServiceorg==null){
			msg="不可重复提交";
			return execute();
		}
		String message;  //验证返回的msg
		ActionContext ctx = ActionContext.getContext();
		UsrUser user = (UsrUser)ctx.getSession().get("_user");
		UsrUser usrUser =accountService.getUserById(user.getId());
		int groupid = profileService.getGroupidByUserType(user.getType());
		if(groupid !=Constants.USERTYPE_GROUP_COMPANY && groupid != Constants.USERTYPE_GROUP_PERSONAL){
			if(usrUser.getAuditstatus() == Constants.USER_AUDITSTATUS_DONE){
				msg="管理员已审核不可修改，如需修改请联系管理员。";
				return execute();
			}
		}
		switch (groupid){
			case Constants.USERTYPE_GROUP_BANK:
				if(usrUser.getAuditstatus()==Constants.USER_AUDITSTATUS_NONE){//判断user auditstatus - Patrick
					message=usrBank.validAuditFields(usrBank);
					if(message.startsWith("1#")){
						msg=message.substring(2, message.length());
						listProvince=dictoryDataService.findAllProvince();
						cityMap = new HashMap<String,List<DicCity>>();
						districtMap = new HashMap<String,List<DicDistrict>>();
						if(user.getAuditstatus() != Constants.USER_AUDITSTATUS_DONE){
							bankList=dictoryDataService.findDicBankList();
						}
						cityMap.put("City", dictoryDataService.findCityByProvinceid(usrBank.getProvinceid()));
						districtMap.put("District", dictoryDataService.findDistrictByCityid(usrBank.getCityid()));
						return "editBankProfile";
					}
				}
				//判断user auditstatus 如果为1  或者2 需对不可修改字段进行保护    《管理员审核时 对不可修改字段必须填写才可通过》
				if(usrUser.getAuditstatus() != Constants.USER_AUDITSTATUS_NONE){
					UsrBank old_UsrBank = (UsrBank)profileService.getProfiles(usrUser.getId());
					old_UsrBank.setAuditFields(usrBank);
					profileService.saveorupdate(old_UsrBank, user.getId());
				}else{
					if(usrBank.getBankid()!=null && usrBank.getBankid()!=0){
						bankList=dictoryDataService.findDicBankList();
						if(bankList.get(usrBank.getBankid()-1)!=null){
							usrUser.setLogo(bankList.get(usrBank.getBankid()-1).getLogo());
							if(accountService.updateUser(usrUser)<0){
								msg="银行选择错误。";
								return ERROR;
							}
						}
					}
					profileService.saveorupdate(usrBank, user.getId());
				}
				break;
			case Constants.USERTYPE_GROUP_COMPANY:
				//TODO:需要对保护的字段不验证
				//审核的状态重新定义
				UsrCompany old_UsrCompany = (UsrCompany)profileService.getProfiles(usrUser.getId());
				if(old_UsrCompany!=null){
					if(companyMark == 1){
						message=usrCompany.validAuditFields(usrCompany);
						if(message.startsWith("1#")){
							msg=message.substring(2, message.length());
							listProvince=dictoryDataService.findAllProvince();
							dataMap = new HashMap<String,List<DicCommon>>();
							cityMap = new HashMap<String,List<DicCity>>();
							districtMap = new HashMap<String,List<DicDistrict>>();
							cityMap.put("bizCity", dictoryDataService.findCityByProvinceid(usrCompany.getBizprovinceid()));
							districtMap.put("bizDistrict", dictoryDataService.findDistrictByCityid(usrCompany.getBizcityid()));
							industry=dictoryDataService.findIndustryByParentid(usrCompany.getIndustryparentid());
							industryList = dictoryDataService.findIndustryByParentid(0);
							return "editCompanyAduit";
						}
						old_UsrCompany.setAuditFields(usrCompany);
					}else if(companyMark == 2){
						message=usrCompany.validLoanFields(usrCompany);
						if(message.startsWith("1#")){
							msg=message.substring(2, message.length());
							listProvince=dictoryDataService.findAllProvince();
							dataMap = new HashMap<String,List<DicCommon>>();
							cityMap = new HashMap<String,List<DicCity>>();
							districtMap = new HashMap<String,List<DicDistrict>>();
							profileMap=new HashMap<String,String>();
							String industrys="";
							if(usrCompany.getIndustryid()!=null && usrCompany.getIndustryid()!=0){
								industrys=dictoryDataService.getIndustryById(usrCompany.getIndustryid()).getName();
							}
							profileMap.put("industry", industrys);
							profileMap.put("bizaddress",dictoryDataService.getPCDNameByIds(usrCompany.getBizprovinceid(), usrCompany.getBizcityid(), usrCompany.getBizdistrictid()));
							cityMap.put("regCity", dictoryDataService.findCityByProvinceid(usrCompany.getRegprovinceid()));
							districtMap.put("regDistrict", dictoryDataService.findDistrictByCityid(usrCompany.getRegcityid()));
							cityMap.put("lpliveCity", dictoryDataService.findCityByProvinceid(usrCompany.getLpliveprovinceid()));
							districtMap.put("lpliveDistrict", dictoryDataService.findDistrictByCityid(usrCompany.getLplivecityid()));
							cityMap.put("lphkCity", dictoryDataService.findCityByProvinceid(usrCompany.getLphkprovinceid()));
							districtMap.put("lphkDistrict", dictoryDataService.findDistrictByCityid(usrCompany.getLphkcityid()));
							dataMap.put("companyType", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_COMPANYTYPE));
							dataMap.put("companyTmployee", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_COMPANYEMPLOYEE));
							dataMap.put("eduAtion", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_EDUCATION));
							dataMap.put("marry", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_MARRY));
							dataMap.put("workYears", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_WORKYEARS));
							return "editCompanyProfile";
						}
						old_UsrCompany.setLoanFields(usrCompany);
					}else{
						companyMark=2;
					}
					profileService.saveorupdate(old_UsrCompany, user.getId());
				}else{
					message=usrCompany.validAuditFields(usrCompany);
					if(message.startsWith("1#")){
						msg=message.substring(2, message.length());
						listProvince=dictoryDataService.findAllProvince();
						dataMap = new HashMap<String,List<DicCommon>>();
						cityMap = new HashMap<String,List<DicCity>>();
						districtMap = new HashMap<String,List<DicDistrict>>();
						cityMap.put("bizCity", dictoryDataService.findCityByProvinceid(usrCompany.getBizprovinceid()));
						districtMap.put("bizDistrict", dictoryDataService.findDistrictByCityid(usrCompany.getBizcityid()));
						industry=dictoryDataService.findIndustryByParentid(usrCompany.getIndustryparentid());
						industryList = dictoryDataService.findIndustryByParentid(0);
						return "editCompanyAduit";
					}
					message=usrCompany.validLoanFields(usrCompany);
					if(message.startsWith("1#")){
						msg=message.substring(2, message.length());
						listProvince=dictoryDataService.findAllProvince();
						dataMap = new HashMap<String,List<DicCommon>>();
						cityMap = new HashMap<String,List<DicCity>>();
						districtMap = new HashMap<String,List<DicDistrict>>();
						profileMap=new HashMap<String,String>();
						String industrys="";
						if(usrCompany.getIndustryid()!=null && usrCompany.getIndustryid()!=0){
							industrys=dictoryDataService.getIndustryById(usrCompany.getIndustryid()).getName();
						}
						profileMap.put("industry", industrys);
						profileMap.put("bizaddress",dictoryDataService.getPCDNameByIds(usrCompany.getBizprovinceid(), usrCompany.getBizcityid(), usrCompany.getBizdistrictid()));
						cityMap.put("regCity", dictoryDataService.findCityByProvinceid(usrCompany.getRegprovinceid()));
						districtMap.put("regDistrict", dictoryDataService.findDistrictByCityid(usrCompany.getRegcityid()));
						cityMap.put("lpliveCity", dictoryDataService.findCityByProvinceid(usrCompany.getLpliveprovinceid()));
						districtMap.put("lpliveDistrict", dictoryDataService.findDistrictByCityid(usrCompany.getLplivecityid()));
						cityMap.put("lphkCity", dictoryDataService.findCityByProvinceid(usrCompany.getLphkprovinceid()));
						districtMap.put("lphkDistrict", dictoryDataService.findDistrictByCityid(usrCompany.getLphkcityid()));
						dataMap.put("companyType", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_COMPANYTYPE));
						dataMap.put("companyTmployee", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_COMPANYEMPLOYEE));
						dataMap.put("eduAtion", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_EDUCATION));
						dataMap.put("marry", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_MARRY));
						dataMap.put("workYears", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_WORKYEARS));
						return "editCompanyProfile";
					}
					profileService.saveorupdate(usrCompany, user.getId());
				}
				break;
			case Constants.USERTYPE_GROUP_FINANCEORG:
				//TODO:需要对保护的字段不验证
				message=usrFinanceorg.validAuditFields(usrFinanceorg);
				if(message.startsWith("1#")){
					msg=message.substring(2, message.length());
					listProvince=dictoryDataService.findAllProvince();
					dataMap = new HashMap<String,List<DicCommon>>();
					cityMap = new HashMap<String,List<DicCity>>();
					districtMap = new HashMap<String,List<DicDistrict>>();
					profileMap=new HashMap<String,String>();
					dataMap.put("companyType", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_COMPANYTYPE));
					cityMap.put("bizCity", dictoryDataService.findCityByProvinceid(usrFinanceorg.getBizprovinceid()));
					districtMap.put("bizDistrict", dictoryDataService.findDistrictByCityid(usrFinanceorg.getBizcityid()));
					cityMap.put("regCity", dictoryDataService.findCityByProvinceid(usrFinanceorg.getRegprovinceid()));
					districtMap.put("regDistrict", dictoryDataService.findDistrictByCityid(usrFinanceorg.getRegcityid()));
					List<UsrOrgAttach> FusrOrgAttachList = profileService.fintByUid(user.getId());
					if(FusrOrgAttachList.size() != 0){
						for(UsrOrgAttach usrOrgAttach : FusrOrgAttachList){
							if(usrOrgAttach.getAttachType() == Constants.BASEDATA_GROUP_ORG_ATTACH_BUSINESS){
								profileMap.put("business",usrOrgAttach.getOldFileName());
								profileMap.put("businessId",usrOrgAttach.getId().toString());
							}else if(usrOrgAttach.getAttachType() == Constants.BASEDATA_GROUP_ORG_ATTACH_ORGANIZATION){
								profileMap.put("orgAnization",usrOrgAttach.getOldFileName());
								profileMap.put("orgAnizationId",usrOrgAttach.getId().toString());
							}else if(usrOrgAttach.getAttachType() == Constants.BASEDATA_GROUP_ORG_ATTACH_TAXREGISTRATION){
								profileMap.put("taxregistration",usrOrgAttach.getOldFileName());
								profileMap.put("taxregistrationId",usrOrgAttach.getId().toString());
							}
						}
					}
					return "editFinanceorgProfile";
				}
//				UsrFinanceorg old_UsrFinanceorg = (UsrFinanceorg)profileService.getProfiles(usrUser.getId());
				if(usrUser.getAuditstatus() != Constants.USER_AUDITSTATUS_DONE){
					profileService.saveorupdate(usrFinanceorg, user.getId());
				}
				break;
			case Constants.USERTYPE_GROUP_PERSONAL:
				//TODO:需要对保护的字段不验证
				message=usrPerson.validOthersFields(usrPerson);
				if(message.startsWith("1#")){
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
					return "editPersonProfile";
				}
				//审核的状态重新定义
//				UsrPerson old_UsrPerson = (UsrPerson)profileService.getProfiles(usrUser.getId());
//				if(old_UsrPerson!=null){
//					System.out.println(usrPerson.getPostcode());
//					old_UsrPerson.setOthersFields(usrPerson);
//					profileService.saveorupdate(old_UsrPerson);
//				}else{
					profileService.saveorupdate(usrPerson, user.getId());
//				}
				break;
			case Constants.USERTYPE_GROUP_SERVICEORG:
				//TODO:需要对保护的字段不验证
				message=usrServiceorg.validAuditFields(usrServiceorg);
				if(message.startsWith("1#")){
					msg=message.substring(2, message.length());
					listProvince=dictoryDataService.findAllProvince();
					dataMap = new HashMap<String,List<DicCommon>>();
					cityMap = new HashMap<String,List<DicCity>>();
					districtMap = new HashMap<String,List<DicDistrict>>();
					profileMap=new HashMap<String,String>();
					cityMap.put("regCity", dictoryDataService.findCityByProvinceid(usrServiceorg.getRegprovinceid()));
					districtMap.put("regDistrict", dictoryDataService.findDistrictByCityid(usrServiceorg.getRegcityid()));
					cityMap.put("bizCity", dictoryDataService.findCityByProvinceid(usrServiceorg.getBizprovinceid()));
					districtMap.put("bizDistrict", dictoryDataService.findDistrictByCityid(usrServiceorg.getBizcityid()));
					dataMap.put("companyType", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_COMPANYTYPE));
					dataMap.put("serviceproduct", dictoryDataService.findCommonDataByGroupId(Constants.BASEDATA_GROUP_SERVICEPRODUCT));
					List<UsrOrgAttach> SusrOrgAttachList = profileService.fintByUid(user.getId());
					if(SusrOrgAttachList.size() != 0){
						for(UsrOrgAttach usrOrgAttach : SusrOrgAttachList){
							if(usrOrgAttach.getAttachType() == Constants.BASEDATA_GROUP_ORG_ATTACH_BUSINESS){
								profileMap.put("business",usrOrgAttach.getOldFileName());
								profileMap.put("businessId",usrOrgAttach.getId().toString());
							}else if(usrOrgAttach.getAttachType() == Constants.BASEDATA_GROUP_ORG_ATTACH_ORGANIZATION){
								profileMap.put("orgAnization",usrOrgAttach.getOldFileName());
								profileMap.put("orgAnizationId",usrOrgAttach.getId().toString());
							}else if(usrOrgAttach.getAttachType() == Constants.BASEDATA_GROUP_ORG_ATTACH_TAXREGISTRATION){
								profileMap.put("taxregistration",usrOrgAttach.getOldFileName());
								profileMap.put("taxregistrationId",usrOrgAttach.getId().toString());
							}
						}
					}
					return "editServiceorgProfile";
				}
				//判断user auditstatus 如果为1  或者2 需对不可修改字段进行保护    《管理员审核时 对不可修改字段必须填写才可通过》
//				UsrServiceorg old_UsrServiceorg = (UsrServiceorg)profileService.getProfiles(usrUser.getId());
				if(usrUser.getAuditstatus() != Constants.USER_AUDITSTATUS_DONE){
					profileService.saveorupdate(usrServiceorg, user.getId());
				}
				break;
			default:
				return ERROR;
		}
//		if(usrUser!=null){
//			if(usrUser.getAuditstatus()!=Constants.USER_AUDITSTATUS_NONE){
//				usrUser.setAuditstatus(Constants.USER_AUDITSTATUS_WAIT);
//				user.setAuditstatus(Constants.USER_AUDITSTATUS_WAIT);
//				if(accountService.updateUser(usrUser)>0){
//					ctx.getSession().put("_user", user);
//					msg="保存成功。";
//					return execute();
//				}
//				msg="注册信息未更新成功。";
//				return execute();
//			}
//			return execute();
//		}
		ActionContext ectx = ActionContext.getContext();
		UsrUser euser = (UsrUser)ectx.getSession().get("_user");
		if(euser.getAuditstatus() != Constants.USER_AUDITSTATUS_DONE && (euser.getUserTypeGroup() == Constants.USERTYPE_GROUP_PERSONAL || euser.getUserTypeGroup() == Constants.USERTYPE_GROUP_COMPANY)){
			if(companyMark == null || companyMark == 2){
				msg="保存成功,您当前账户基本信息未填写完整请继续填写。";
			}else{
				msg="保存成功,您当前账户信息未填写完整请继续填写。";
			}
			return edit();
		}else{
			msg="保存成功。";
			return execute();
		}
	}
	
	/**显示注册信息----*/
	public String regInfo(){
		ActionContext ctx = ActionContext.getContext();
		UsrUser user = (UsrUser)ctx.getSession().get("_user");
		usrUser = accountService.getUserById(user.getId());
		return "regInfo";
	}

	/**更改登录密码----*/
	public String editPwd(){
		ActionContext ctx = ActionContext.getContext();
		UsrUser user = (UsrUser)ctx.getSession().get("_user");
		usrUser = accountService.getUserById(user.getId());
		if(usrUser.getPassword().equals(SecurityUtil.getMD5(oldPwd))){
			if(StringUtil.validPwd(password)){
				usrUser.setPassword(SecurityUtil.getMD5(password));
				if(accountService.updateUser(usrUser)>0){
					msg=SUCCESS;
					return "ajax";
				}
				msg="新密码设置失败。";
				return "ajax";
			}
			msg="请重新输入正确的新密码。";
			return "ajax";
		}
		msg="原密码输入错误";
		return "ajax";
	}
	/**
	 * 验证手机
	 * @return
	 */
	public String validMoblie(){
		//TODO:regInfo手机验证
		ActionContext ctx = ActionContext.getContext();
		UsrUser user = (UsrUser)ctx.getSession().get("_user");
		if(accountService.activeUser_tx(user.getUsername(), verifycode)>0){
			user.setActivetype(Constants.USER_ACTIVE_ALL);
			ctx.getSession().put("_user", user);
			msg=SUCCESS;
			return "ajax";
		}
		msg="手机验证错误，请填写正确的验证码。";
		return "ajax";
	}
	/**
	 * 验证邮箱
	 * @return
	 */
	public String validEmail(){
		//TODO:regInfo邮箱验证
		ActionContext ctx = ActionContext.getContext();
		UsrUser user = (UsrUser)ctx.getSession().get("_user");
		if(accountService.activeUser_tx(user.getUsername(), verifycode)>0){
			user.setActivetype(Constants.USER_ACTIVE_ALL);
			ctx.getSession().put("_user", user);
			msg=SUCCESS;
			return "ajax";
		}
		msg="邮箱验证错误，请填写正确的验证码。";
		return "ajax";
	}
	
	//setter and getter
	public Map<String, List<DicCity>> getCityMap() {
		return cityMap;
	}
	public Map<String, String> getProfileMap() {
		return profileMap;
	}
	public Map<String, List<DicDistrict>> getDistrictMap() {
		return districtMap;
	}
	public UsrPerson getUsrPerson() {
		return usrPerson;
	}
	public List<DicProvince> getListProvince() {
		return listProvince;
	}
	public void setUsrPerson(UsrPerson usrPerson) {
		this.usrPerson = usrPerson;
	}
	public UsrBank getUsrBank() {
		return usrBank;
	}
	public void setUsrBank(UsrBank usrBank) {
		this.usrBank = usrBank;
	}
	public UsrFinanceorg getUsrFinanceorg() {
		return usrFinanceorg;
	}
	public void setUsrFinanceorg(UsrFinanceorg usrFinanceorg) {
		this.usrFinanceorg = usrFinanceorg;
	}
	public UsrServiceorg getUsrServiceorg() {
		return usrServiceorg;
	}
	public void setUsrServiceorg(UsrServiceorg usrServiceorg) {
		this.usrServiceorg = usrServiceorg;
	}
	public UsrCompany getUsrCompany() {
		return usrCompany;
	}
	public void setUsrCompany(UsrCompany usrCompany) {
		this.usrCompany = usrCompany;
	}
	public void setProfileService(ProfileService profileService) {
		this.profileService = profileService;
	}
	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}
	public Map<String, List<DicCommon>> getDataMap() {
		return dataMap;
	}
	public List<DicIndustry> getIndustryList() {
		return industryList;
	}
	public List<DicIndustry> getIndustry() {
		return industry;
	}

	public UsrUser getUsrUser() {
		return usrUser;
	}

	public void setUsrUser(UsrUser usrUser) {
		this.usrUser = usrUser;
	}

	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setOldPwd(String oldPwd) {
		this.oldPwd = oldPwd;
	}

	public void setVerifycode(String verifycode) {
		this.verifycode = verifycode;
	}

	public List<DicBank> getBankList() {
		return bankList;
	}
	public void setCompanyMark(Integer companyMark) {
		this.companyMark = companyMark;
	}

}
