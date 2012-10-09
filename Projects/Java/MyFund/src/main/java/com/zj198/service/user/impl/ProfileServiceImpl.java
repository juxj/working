package com.zj198.service.user.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.dao.DicUsertypeDAO;
import com.zj198.dao.UsrBankDAO;
import com.zj198.dao.UsrCompanyDAO;
import com.zj198.dao.UsrFinanceorgDAO;
import com.zj198.dao.UsrLoginhistoryDAO;
import com.zj198.dao.UsrMenuDAO;
import com.zj198.dao.UsrOrgAttachDAO;
import com.zj198.dao.UsrPersonDAO;
import com.zj198.dao.UsrServiceorgDAO;
import com.zj198.dao.UsrUserDAO;
import com.zj198.model.DicUsertype;
import com.zj198.model.UserModel;
import com.zj198.model.UsrBank;
import com.zj198.model.UsrCompany;
import com.zj198.model.UsrFinanceorg;
import com.zj198.model.UsrLoginhistory;
import com.zj198.model.UsrMenu;
import com.zj198.model.UsrOrgAttach;
import com.zj198.model.UsrPerson;
import com.zj198.model.UsrServiceorg;
import com.zj198.model.UsrUser;
import com.zj198.service.user.ProfileService;
import com.zj198.util.Constants;
import com.zj198.util.NumberUtil;

public class ProfileServiceImpl implements ProfileService {
	
	private UsrUserDAO usrUserDAO;
	private DicUsertypeDAO dicUsertypeDAO;
	private UsrPersonDAO usrPersonDAO;
	private UsrBankDAO usrBankDAO;
	private UsrFinanceorgDAO usrFinanceorgDAO;
	private UsrServiceorgDAO usrServiceorgDAO;
	private UsrCompanyDAO usrCompanyDAO;
	private UsrLoginhistoryDAO usrLoginhistoryDAO;
	private UsrMenuDAO usrMenuDAO;
	private UsrOrgAttachDAO usrOrgAttachDAO;
	
	public void setUsrLoginhistoryDAO(UsrLoginhistoryDAO usrLoginhistoryDAO) {
		this.usrLoginhistoryDAO = usrLoginhistoryDAO;
	}
	public void setUsrUserDAO(UsrUserDAO usrUserDAO) {
		this.usrUserDAO = usrUserDAO;
	}
	public void setDicUsertypeDAO(DicUsertypeDAO dicUsertypeDAO) {
		this.dicUsertypeDAO = dicUsertypeDAO;
	}
	public void setUsrPersonDAO(UsrPersonDAO usrPersonDAO) {
		this.usrPersonDAO = usrPersonDAO;
	}
	public void setUsrBankDAO(UsrBankDAO usrBankDAO) {
		this.usrBankDAO = usrBankDAO;
	}
	public void setUsrFinanceorgDAO(UsrFinanceorgDAO usrFinanceorgDAO) {
		this.usrFinanceorgDAO = usrFinanceorgDAO;
	}
	public void setUsrServiceorgDAO(UsrServiceorgDAO usrServiceorgDAO) {
		this.usrServiceorgDAO = usrServiceorgDAO;
	}
	public void setUsrCompanyDAO(UsrCompanyDAO usrCompanyDAO) {
		this.usrCompanyDAO = usrCompanyDAO;
	}
	public void setUsrMenuDAO(UsrMenuDAO usrMenuDAO) {
		this.usrMenuDAO = usrMenuDAO;
	}
	public void setUsrOrgAttachDAO(UsrOrgAttachDAO usrOrgAttachDAO) {
		this.usrOrgAttachDAO = usrOrgAttachDAO;
	}
	@Override
	public void saveorupdate(Object profile) {
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser)context.getSession().get("_user");
		DicUsertype ut = dicUsertypeDAO.get(user.getType()+0);
		if(ut==null){
			return;
		}
//		if(user.getAuditstatus()==Constants.USER_AUDITSTATUS_DONE){//如果是已审核，则状态修改为未审核
//			user.setAuditstatus(Constants.USER_AUDITSTATUS_WAIT);
//			//更新session
//			context.getSession().put("_user", user);
//			UsrUser fullUser = usrUserDAO.get(user.getId());
//			//更新数据库
//			fullUser.setAuditstatus(Constants.USER_AUDITSTATUS_WAIT);
//			usrUserDAO.update(fullUser);
//		}
		switch (ut.getGroup()){
			case Constants.USERTYPE_GROUP_COMPANY:
				saveOrUpdateCompanyProfile((UsrCompany)profile,user.getId());
				break;
			case Constants.USERTYPE_GROUP_BANK:
				saveOrUpdateBankProfile((UsrBank)profile,user.getId());
				break;
			case Constants.USERTYPE_GROUP_FINANCEORG:
				saveOrUpdateFinanceorgProfile((UsrFinanceorg)profile,user.getId());
				break;
			case Constants.USERTYPE_GROUP_SERVICEORG:
				saveOrUpdateServiceorgProfile((UsrServiceorg)profile,user.getId());
				break;
			case Constants.USERTYPE_GROUP_PERSONAL:
				saveOrUpdatePersonProfile((UsrPerson)profile,user.getId());
				break;
		}
	}
	
	private void saveOrUpdatePersonProfile(UsrPerson profile,int uid){
		profile.setUserid(uid);
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser)context.getSession().get("_user");
		int item=0;
//		计算资料完整度，联系方式填一种即算完成
		if(StringUtils.isNotBlank(profile.getCid())){item++;}
		if(profile.getBirthday()==null){item++;}
		if(profile.getEducation() !=null && profile.getEducation() != 0){item++;}
		if(profile.getProvinceid()!=null && profile.getProvinceid()!=0){item++;}
		if(profile.getCityid()!=null && profile.getCityid()!=0){item++;}
		if(profile.getDistrictid()!=null && profile.getDistrictid()!=0){item++;}
		if(StringUtils.isNotBlank(profile.getAddress())){item++;}
		if(StringUtils.isNotBlank(profile.getPostcode())){item++;}
		//if(StringUtils.isNotBlank(profile.getTelephone())){item++;}
		if(profile.getCareerid()!=null && profile.getCareerid()!=0){item++;}
		if((profile.getIm1type()!=null && profile.getIm1type()!=0)|| (profile.getIm2type()!=null && profile.getIm2type()!=0)||(profile.getIm3type()!=null && profile.getIm3type()!=0)){item++;}
		UsrUser usrUser=usrUserDAO.get(user.getId());
		if(item==9){
			usrUser.setAuditstatus(Constants.USER_AUDITSTATUS_DONE);
			user.setAuditstatus(Constants.USER_AUDITSTATUS_DONE);
			context.getSession().put("_user", user);
			usrUserDAO.update(usrUser);
		}else{
			usrUser.setAuditstatus(Constants.USER_AUDITSTATUS_NONE);
			user.setAuditstatus(Constants.USER_AUDITSTATUS_NONE);
			context.getSession().put("_user", user);
			usrUserDAO.update(usrUser);
		}
		profile.setCompleterate(item*100/10);
		usrPersonDAO.saveOrUpdate(profile);
	}
	
	private void saveOrUpdateBankProfile(UsrBank profile,int uid){
		profile.setUserid(uid);
//		计算资料完整度
		int item=0;
//		if(profile.getBankid()!=null){item++;} TODO:需要分配银行ID?
		if(StringUtils.isNotBlank(profile.getDepartment())){item++;}
		if(StringUtils.isNotBlank(profile.getDetailname())){item++;}
		if(StringUtils.isNotBlank(profile.getLinkemail())){item++;}
		if(StringUtils.isNotBlank(profile.getLinkname())){item++;}
		if(profile.getLinkgenderr()!=null){item++;}
		if(StringUtils.isNotBlank(profile.getLinktelephone())){item++;}
		if(StringUtils.isNotBlank(profile.getPosition())){item++;}
		if(StringUtils.isNotBlank(profile.getRemarks())){item++;}
		if(profile.getProvinceid() != null && profile.getProvinceid() != 0){item++;}
		if(profile.getCityid() != null && profile.getCityid() != 0){item++;}
		if(profile.getDistrictid() != null && profile.getDistrictid() != 0){item++;}
		if(StringUtils.isNotBlank(profile.getAddress())){item++;}
		if(StringUtils.isNotBlank(profile.getPostcode())){item++;}
		profile.setCompleterate(item*100/13);
		usrBankDAO.saveOrUpdate(profile);
	}
	
	private void saveOrUpdateServiceorgProfile(UsrServiceorg profile,int uid){
		profile.setUserid(uid);
//		计算资料完整度
		int item=0;
		if(StringUtils.isNotBlank(profile.getOrgname())){item++;}
		if(StringUtils.isNotBlank(profile.getLicensecode())){item++;}
		if(StringUtils.isNotBlank(profile.getOrganizationcode())){item++;}
		if(StringUtils.isNotBlank(profile.getFaxcode())){item++;}
		if(StringUtils.isNotBlank(profile.getLegalperson())){item++;}
		if(profile.getRegprovinceid()!=null && profile.getRegprovinceid()!=0){item++;}
		if(profile.getRegcityid()!=null && profile.getRegcityid()!=0){item++;}
		if(profile.getRegdistrictid()!=null && profile.getRegdistrictid()!=0){item++;}
		if(StringUtils.isNotBlank(profile.getRegaddress())){item++;}
		if(StringUtils.isNotBlank(profile.getRegpostcode())){item++;}
		if(profile.getRegisterdate()!=null){item++;}
		if(profile.getRegisteredcapital()!=null){item++;}
		if(profile.getOrgtypeid()!=null && profile.getOrgtypeid()!=0){item++;}
		if(profile.getBizprovinceid()!=null && profile.getBizprovinceid()!=0){item++;}
		if(profile.getBizcityid()!=null && profile.getBizcityid()!=0){item++;}
		if(profile.getBizdistrictid()!=null && profile.getBizdistrictid()!=0){item++;}
		if(StringUtils.isNotBlank(profile.getBizaddress())){item++;}
		if(StringUtils.isNotBlank(profile.getBizpostcode())){item++;}
		if(StringUtils.isNotBlank(profile.getLinkname())){item++;}
		if(profile.getLinkgender()!=null){item++;}
		if(StringUtils.isNotBlank(profile.getLinkemail())){item++;}
		if(StringUtils.isNotBlank(profile.getLinktelephone())){item++;}
		if(StringUtils.isNotBlank(profile.getDepartment())){item++;}
		if(StringUtils.isNotBlank(profile.getPosition())){item++;}
		if(StringUtils.isNotBlank(profile.getRemarks())){item++;}
		if(StringUtils.isNotBlank(profile.getServiceproduct())){item++;}
		profile.setCompleterate(item*100/26);
		usrServiceorgDAO.saveOrUpdate(profile);
	}
	
	private void saveOrUpdateFinanceorgProfile(UsrFinanceorg profile,int uid){
		profile.setUserid(uid);
//		计算资料完整度
		int item=0;
		if(StringUtils.isNotBlank(profile.getOrgname())){item++;}
		if(StringUtils.isNotBlank(profile.getLicensecode())){item++;}
		if(StringUtils.isNotBlank(profile.getOrganizationcode())){item++;}
		if(StringUtils.isNotBlank(profile.getFaxcode())){item++;}
		if(StringUtils.isNotBlank(profile.getLegalperson())){item++;}
		if(profile.getRegprovinceid()!=null && profile.getRegprovinceid()!=0){item++;}
		if(profile.getRegcityid()!=null && profile.getRegcityid()!=0){item++;}
		if(profile.getRegdistrictid()!=null && profile.getRegdistrictid()!=0){item++;}
		if(StringUtils.isNotBlank(profile.getRegaddress())){item++;}
		if(StringUtils.isNotBlank(profile.getRegpostcode())){item++;}
		if(profile.getRegisterdate()!=null){item++;}
		if(profile.getRegisteredcapital()!=null){item++;}
		if(profile.getOrgtypeid()!=null && profile.getOrgtypeid()!=0){item++;}
		if(StringUtils.isNotBlank(profile.getBizscope())){item++;}
		if(profile.getBizprovinceid()!=null && profile.getBizprovinceid()!=0){item++;}
		if(profile.getBizcityid()!=null && profile.getBizcityid()!=0){item++;}
		if(profile.getBizdistrictid()!=null && profile.getBizdistrictid()!=0){item++;}
		if(StringUtils.isNotBlank(profile.getBizaddress())){item++;}
		if(StringUtils.isNotBlank(profile.getBizpostcode())){item++;}
		if(StringUtils.isNotBlank(profile.getLinkname())){item++;}
		if(profile.getLinkgender()!=null){item++;}
		if(StringUtils.isNotBlank(profile.getLinkemail())){item++;}
		if(StringUtils.isNotBlank(profile.getLinktelephone())){item++;}
		if(StringUtils.isNotBlank(profile.getDepartment())){item++;}
		if(StringUtils.isNotBlank(profile.getPosition())){item++;}
		if(StringUtils.isNotBlank(profile.getRemarks())){item++;}
		profile.setCompleterate(item*100/26);
		usrFinanceorgDAO.saveOrUpdate(profile);
	}
	
	private void saveOrUpdateCompanyProfile(UsrCompany profile,int uid){
		profile.setUserid(uid);
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser)context.getSession().get("_user");
		int itembaseAudit=0;
		if(StringUtils.isNotBlank(profile.getCompanyname())){itembaseAudit++;}
		if(StringUtils.isNotBlank(profile.getOrganizationcode())){itembaseAudit++;}
		if(StringUtils.isNotBlank(profile.getLicensecode())){itembaseAudit++;}
		if(profile.getIndustryid()!=null && profile.getIndustryid()!=0){itembaseAudit++;}
		if(profile.getIndustryparentid()!=null && profile.getIndustryparentid()!=0){itembaseAudit++;}
		if(profile.getBizprovinceid()!=null && profile.getBizprovinceid()!=0){itembaseAudit++;}
		if(profile.getBizcityid()!=null && profile.getBizcityid()!=0){itembaseAudit++;}
		if(profile.getBizdistrictid()!=null && profile.getBizdistrictid()!=0){itembaseAudit++;}
		if(StringUtils.isNotBlank(profile.getBizaddress())){itembaseAudit++;}
		if(StringUtils.isNotBlank(profile.getBizpostcode())){itembaseAudit++;}
		if(StringUtils.isNotBlank(profile.getLinkname())){itembaseAudit++;}
		if(profile.getLinkgender()!=null){itembaseAudit++;}
		if(StringUtils.isNotBlank(profile.getLinkemail())){itembaseAudit++;}
		if(StringUtils.isNotBlank(profile.getLinktelephone())){itembaseAudit++;}
		UsrUser usrUser=usrUserDAO.get(user.getId());
		if(itembaseAudit==14){
			usrUser.setAuditstatus(Constants.USER_AUDITSTATUS_DONE);
			user.setAuditstatus(Constants.USER_AUDITSTATUS_DONE);
			context.getSession().put("_user", user);
			usrUserDAO.update(usrUser);
		}else{
			usrUser.setAuditstatus(Constants.USER_AUDITSTATUS_NONE);
			user.setAuditstatus(Constants.USER_AUDITSTATUS_NONE);
			context.getSession().put("_user", user);
			usrUserDAO.update(usrUser);
		}
		//企业信息完成度
		int itembase=0;
		if(StringUtils.isNotBlank(profile.getFaxcode())){itembase++;}
		if(StringUtils.isNotBlank(profile.getBankpermitcode())){itembase++;}
		if(StringUtils.isNotBlank(profile.getLoancard())){itembase++;}
		if(StringUtils.isNotBlank(profile.getLegalperson())){itembase++;}
		if(profile.getRegprovinceid()!=null && profile.getRegprovinceid()!=0){itembase++;}
		if(profile.getRegcityid()!=null && profile.getRegcityid()!=0){itembase++;}
		if(profile.getRegdistrictid()!=null && profile.getRegdistrictid()!=0){itembase++;}
		if(StringUtils.isNotBlank(profile.getRegaddress())){itembase++;}
		if(StringUtils.isNotBlank(profile.getRegpostcode())){itembase++;}
		if(profile.getRegisterdate()!=null){itembase++;}
		if(profile.getRegisteredcapital()!=null){itembase++;}
		if(profile.getEnterprisetypeid()!=null && profile.getEnterprisetypeid()!=0){itembase++;}
		if(profile.getEmployeesid()!=null && profile.getEmployeesid()!=0){itembase++;}
		if(StringUtils.isNotBlank(profile.getBizscope())){itembase++;}
		if(StringUtils.isNotBlank(profile.getDepartment())){itembase++;}
		if(StringUtils.isNotBlank(profile.getPosition())){itembase++;}
//		profile.setCompleteratebase(itembase*100/29);
		
		//法人信息完成度
//		int itemlegal=0;
		if(profile.getLpeducation()!=null && profile.getLpeducation()!=0){itembase++;}
		if(profile.getLpmarry()!=null && profile.getLpmarry()!=0){itembase++;}
		if(profile.getLpindustryyears()!=null && profile.getLpindustryyears()!=0){itembase++;}
		if(StringUtils.isNotBlank(profile.getLpcid())){itembase++;}
		if(StringUtils.isNotBlank(profile.getLpmobile())){itembase++;}
		if(StringUtils.isNotBlank(profile.getLphometel())){itembase++;}
		if(profile.getLpliveprovinceid()!=null && profile.getLpliveprovinceid()!=0){itembase++;}
		if(profile.getLplivecityid()!=null && profile.getLplivecityid()!=0){itembase++;}
		if(profile.getLplivedistrictid()!=null && profile.getLplivedistrictid()!=0){itembase++;}
		if(StringUtils.isNotBlank(profile.getLpliveaddress())){itembase++;}
		if(StringUtils.isNotBlank(profile.getLplivepostcode())){itembase++;}
		if(profile.getLphkprovinceid()!=null && profile.getLphkprovinceid()!=0){itembase++;}
		if(profile.getLphkcityid()!=null && profile.getLphkcityid()!=0){itembase++;}
		if(profile.getLphkdistrictid()!=null && profile.getLphkdistrictid()!=0){itembase++;}
		if(StringUtils.isNotBlank(profile.getLphkaddress())){itembase++;}
		if(StringUtils.isNotBlank(profile.getLphkpostcode())){itembase++;}
		
//		profile.setCompleteratelegalperson(itembase*100/16);
		profile.setCompleteratebase(itembase*100/32);
		usrCompanyDAO.saveOrUpdate(profile);
	}

	@Override
	public Object getProfiles(Integer uid) {
		UsrUser user = usrUserDAO.get(uid);
		int groupid = this.getGroupidByUserType(user.getType());
		switch (groupid){
			case Constants.USERTYPE_GROUP_COMPANY:
				return usrCompanyDAO.getByUid(uid);
			case Constants.USERTYPE_GROUP_BANK:
				return usrBankDAO.getByUid(uid);
			case Constants.USERTYPE_GROUP_FINANCEORG:
				return usrFinanceorgDAO.getByUid(uid);
			case Constants.USERTYPE_GROUP_SERVICEORG:
				return usrServiceorgDAO.getByUid(uid);
			case Constants.USERTYPE_GROUP_PERSONAL:
				return usrPersonDAO.getByUid(uid);
		}
		return null;
	}
	
	@Override
	public int getGroupidByUserType(Short userType) {
		DicUsertype ut = dicUsertypeDAO.get(userType+0);
		if(ut==null){
			return 0;
		}else{
			return ut.getGroup();
		}
	}
	
	@Override
	public UsrLoginhistory getLoginHistory(){
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser)context.getSession().get("_user");
		return usrLoginhistoryDAO.getLastByUid(user.getId());
	}

	@Override
	public List<UsrMenu> findMenuListByUid(Integer userTypeGroup){
		List<UsrMenu> all = usrMenuDAO.findAll();
		List<UsrMenu> list = new ArrayList<UsrMenu>();
		for(UsrMenu menu:all){
			if(NumberUtil.ifExist(menu.getRights(),(2<<userTypeGroup)/4)){
				list.add(menu);
			}
		}
		return list;
	}
	
	@Override
	public List<UserModel> getUserList(Short userType, String userName) {
		switch (userType) {
			case 1: return this.getCompanyList(userName);
			case 2: return this.getUsrBankList(userName);
			case 3: return this.getFinanceOrgList(userName);
			case 4: return this.findServiceOrgList(userName);
			case 5: return this.getPersonList(userName);
		}
		return null;
	}
	
	private UserModel getUserModel(Integer id, String name) {
		UserModel um = new UserModel();
		um.setId(id);
		um.setName(name);
		return um;
	}
	
	private List<UserModel> getCompanyList(String name) {
		List<UserModel> result = new ArrayList<UserModel>();
		List<UsrCompany> list = this.usrCompanyDAO.findUsrCompaniesByName(name);
		for (UsrCompany company : list){
			 result.add(this.getUserModel(company.getUserid(), company.getCompanyname()));
		}
		return result;
	}
	
	private List<UserModel>  getUsrBankList(String name){
		List<UserModel> result = new ArrayList<UserModel>();
		List<UsrBank> list = this.usrBankDAO.findUsrBanksByName(name);
		for (UsrBank bank : list){
			result.add(this.getUserModel(bank.getUserid(), bank.getDetailname()));
		}
		return result;
	}
	
	private List<UserModel>  getFinanceOrgList(String name) {
		List<UserModel> result = new ArrayList<UserModel>();
		List<UsrFinanceorg> list = this.usrFinanceorgDAO.findUsrFinanceOrgsByName(name);
		for (UsrFinanceorg ufo : list){
			result.add(this.getUserModel(ufo.getUserid(), ufo.getOrgname()));
		}
		return result;
	}
	
	private List<UserModel>  findServiceOrgList(String name) {
		List<UserModel> result = new ArrayList<UserModel>();
		List<UsrServiceorg> list = this.usrServiceorgDAO.findUsrServiceOrgsByName(name);//TODO:应该用find--patrick
		for (UsrServiceorg uso : list){
			result.add(this.getUserModel(uso.getUserid(), uso.getOrgname()));
		}
		return result;
	}
	
	private List<UserModel>  getPersonList(String name) {
		List<UserModel> result = new ArrayList<UserModel>();
		List<UsrUser> list = this.usrUserDAO.getUserList(name);//TODO:应该用find--patrick
		for (UsrUser user : list){
			result.add(this.getUserModel(user.getId(), user.getRealname()+"("+user.getUsername()+")"));
		}
		return result;
	}
	@Override
	public List<UsrOrgAttach> fintByUid(Integer uid) {
		// TODO Auto-generated method stub
		
		return usrOrgAttachDAO.fintByUid(uid);
	}
	@Override
	public UsrOrgAttach getById(Integer id) {
		// TODO Auto-generated method stub
		return usrOrgAttachDAO.getById(id);
	}
	@Override
	public void save(UsrOrgAttach usrOrgAttach) {
		// TODO Auto-generated method stub
		usrOrgAttach.setCreateDt(Calendar.getInstance().getTime());
		usrOrgAttach.setAttachStatus(Constants.BASEDATA_GROUP_ORG_ATTACH_STATUS_ON);
		usrOrgAttachDAO.save(usrOrgAttach);
	}
	@Override
	public void update(UsrOrgAttach usrOrgAttach) {
		// TODO Auto-generated method stub
		usrOrgAttach.setAttachStatus(Constants.BASEDATA_GROUP_ORG_ATTACH_STATUS_OFF);
		usrOrgAttachDAO.update(usrOrgAttach);
	}
	@Override
	public UsrOrgAttach getByUidAttachType(Integer uid, Integer type) {
		// TODO Auto-generated method stub
		return usrOrgAttachDAO.getByUidAttachType(uid, type);
	}
	
}
