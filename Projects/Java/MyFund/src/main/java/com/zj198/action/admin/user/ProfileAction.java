package com.zj198.action.admin.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
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

public class ProfileAction extends BaseAction{
	private UsrPerson usrPerson;
	private UsrBank usrBank;
	private UsrFinanceorg usrFinanceorg;
	private UsrServiceorg usrServiceorg;
	private UsrCompany usrCompany;
	private UsrUser usrUser;
	
	private Integer userId;
	private Short type;
	private Short audit;
	private Short alu;//管理员模拟用户登录标示
	
	private ProfileService profileService;
	private DictoryDataService  dictoryDataService;
	private AccountService accountService;
	private Map<String,String> profileMap;
	
	//用户类型的详细信息  需审核
	public String execute(){
		if(userId==null || userId==0){
			msg="没有此用户。";
			return ERROR;
		}
		if(type==null || type==0){
			msg="没有此类型。";
			return ERROR;
		}
		if(profileService.getProfiles(userId)==null){
			msg="该用户未填充信息。";
		}
		int groupid = profileService.getGroupidByUserType(type);
		if(alu != null){
			UsrUser _user = accountService.getUserById(userId);
			ActionContext context = ActionContext.getContext();
			int userTypeGroup = 0;
			if(_user.getType()!=Constants.USER_TYPE_NULL){
				userTypeGroup =groupid;
			}
			_user.setUserTypeGroup(userTypeGroup);
			context.getSession().put("_user", _user);
//				String prefix = getServletContext().getRealPath("/");
//				String file = getInitParameter("log4j-init-file");
//				// if the log4j-init-file is not set, then no point in trying
//				if (file != null) {
//				PropertyConfigurator.configure(prefix + file);
//				}
			return "adminLoginUser";
		}
		switch (groupid){
			case Constants.USERTYPE_GROUP_BANK:
				usrBank = (UsrBank)profileService.getProfiles(userId);
				if(usrBank!=null){
					profileMap=new HashMap<String,String>();
					String bankName="";
					if(usrBank.getBankid()!=null && usrBank.getBankid()!=0){
						bankName=dictoryDataService.findDicBankList().get(usrBank.getBankid()-1).getName();
					}
					profileMap.put("bankName",bankName);
					profileMap.put("address",dictoryDataService.getPCDNameByIds(usrBank.getProvinceid(), usrBank.getCityid(), usrBank.getDistrictid()));
				}
				return "bankProfile";
			case Constants.USERTYPE_GROUP_COMPANY:
				usrCompany = (UsrCompany)profileService.getProfiles(userId);
				if(usrCompany!=null){
					profileMap=new HashMap<String,String>();
					String industry="";
					if(usrCompany.getIndustryid()!=null && usrCompany.getIndustryid()!=0){
						industry=dictoryDataService.getIndustryById(usrCompany.getIndustryid()).getName();
					}
					profileMap.put("industry", industry);
					profileMap.put("bizaddress",dictoryDataService.getPCDNameByIds(usrCompany.getBizprovinceid(), usrCompany.getBizcityid(), usrCompany.getBizdistrictid()));
					profileMap.put("regaddress",dictoryDataService.getPCDNameByIds(usrCompany.getRegprovinceid(), usrCompany.getRegcityid(), usrCompany.getRegdistrictid()));
					profileMap.put("lpliveaddress",dictoryDataService.getPCDNameByIds(usrCompany.getLpliveprovinceid(), usrCompany.getLplivecityid(), usrCompany.getLplivedistrictid()));
					profileMap.put("lphkaddress",dictoryDataService.getPCDNameByIds(usrCompany.getLphkprovinceid(), usrCompany.getLphkcityid(), usrCompany.getLphkdistrictid()));
					profileMap.put("companyType", dictoryDataService.getValueNameById(usrCompany.getEnterprisetypeid()));
					profileMap.put("companyTmployee", dictoryDataService.getValueNameById(usrCompany.getEmployeesid()));
					profileMap.put("eduAtion", dictoryDataService.getValueNameById(usrCompany.getLpeducation()));
					profileMap.put("marry", dictoryDataService.getValueNameById(usrCompany.getLpmarry()));
					profileMap.put("workYears", dictoryDataService.getValueNameById(usrCompany.getLpindustryyears()));
				}
				return "companyProfile";
			case Constants.USERTYPE_GROUP_FINANCEORG:
				usrFinanceorg = (UsrFinanceorg)profileService.getProfiles(userId);
				if(usrFinanceorg!=null){
					profileMap=new HashMap<String,String>();
					List<UsrOrgAttach> FusrOrgAttachList = profileService.fintByUid(userId);
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
				}
				return "financeorgProfile";
			case Constants.USERTYPE_GROUP_PERSONAL:
				usrPerson = (UsrPerson)profileService.getProfiles(userId);
				if(usrPerson!=null){
					profileMap=new HashMap<String,String>();
					profileMap.put("realname", accountService.getUserById(userId).getRealname());
					profileMap.put("address", dictoryDataService.getPCDNameByIds(usrPerson.getProvinceid(), usrPerson.getCityid(), usrPerson.getDistrictid()));
					profileMap.put("psersoncareer",dictoryDataService.getValueNameById(usrPerson.getCareerid()) );
					profileMap.put("eduAtion",dictoryDataService.getValueNameById(usrPerson.getEducation()) );
					profileMap.put("imtype1", dictoryDataService.getValueNameById(usrPerson.getIm1type()));
					profileMap.put("imtype2",dictoryDataService.getValueNameById(usrPerson.getIm2type()) );
					profileMap.put("imtype3", dictoryDataService.getValueNameById(usrPerson.getIm3type()));
				}
				return "personProfile";
			case Constants.USERTYPE_GROUP_SERVICEORG:
				usrServiceorg = (UsrServiceorg)profileService.getProfiles(userId);
				if(usrServiceorg!=null){
					profileMap=new HashMap<String,String>();
					List<UsrOrgAttach> SusrOrgAttachList = profileService.fintByUid(userId);
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
				}
				return "serviceorgProfile";
		}
		return ERROR;
	}
	/**更改用户审核状态*/
	public String audit(){
		if(audit != null && audit == Constants.USER_AUDITSTATUS_NONE && type!= null && type !=0){
			int groupid = profileService.getGroupidByUserType(type);
			if(groupid == Constants.USERTYPE_GROUP_BANK){
				usrBank = (UsrBank)profileService.getProfiles(userId);
				if(usrBank!=null){
					if(usrBank.getBankid()!=null && usrBank.getBankid()!=0){
						usrBank.setDetailname(dictoryDataService.getDicBankById(usrBank.getBankid()).getName()+" "+usrBank.getDetailname());
//						UsrUser _user = accountService.getUserById(userId);
//						ActionContext context = ActionContext.getContext();
//						int userTypeGroup = 0;
//						if(_user.getType()!=Constants.USER_TYPE_NULL){
//							userTypeGroup =groupid;
//						}
//						_user.setUserTypeGroup(userTypeGroup);
//						context.getSession().put("_user", _user);
						profileService.saveorupdate(usrBank,userId);
//						context.getSession().remove("_user");
					}else{
						msg="未选择银行名称";
						return "ajax";
					}
				}
			}
		}
		if(userId!=null && userId!=0){
			if(audit !=null && audit == Constants.USER_AUDITSTATUS_DONE){
				accountService.updateUserAudit(userId, Constants.USER_AUDITSTATUS_WAIT);
				audit=Constants.USER_AUDITSTATUS_WAIT;
				msg="1";
				return "ajax";
			}else if(audit !=null && audit == Constants.USER_AUDITSTATUS_WAIT){
				accountService.updateUserAudit(userId, Constants.USER_AUDITSTATUS_DONE);
				audit=Constants.USER_AUDITSTATUS_DONE;
				msg="2";
				return "ajax";
			}else if(audit !=null && audit == Constants.USER_AUDITSTATUS_NONE){
				accountService.updateUserAudit(userId, Constants.USER_AUDITSTATUS_DONE);
				audit=Constants.USER_AUDITSTATUS_DONE;
				msg="2";
				return "ajax";
			}else{
				msg="2";
				return "ajax";
			}
		}else{
			msg="没有用户。";
			return ERROR;
		}
	}
	
	//set   get
	public UsrPerson getUsrPerson() {
		return usrPerson;
	}
	public UsrBank getUsrBank() {
		return usrBank;
	}
	public UsrFinanceorg getUsrFinanceorg() {
		return usrFinanceorg;
	}
	public UsrServiceorg getUsrServiceorg() {
		return usrServiceorg;
	}
	public UsrCompany getUsrCompany() {
		return usrCompany;
	}
	public UsrUser getUsrUser() {
		return usrUser;
	}
	public void setProfileService(ProfileService profileService) {
		this.profileService = profileService;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public void setType(Short type) {
		this.type = type;
	}
	public Short getType() {
		return type;
	}
	public void setAudit(Short audit) {
		this.audit = audit;
	}
	public Short getAudit() {
		return audit;
	}
	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}
	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}
	public Map<String, String> getProfileMap() {
		return profileMap;
	}
	public void setAlu(Short alu) {
		this.alu = alu;
	}
}
