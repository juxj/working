package com.zj198.action.user;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.model.DicCommon;
import com.zj198.model.DicInvestRange;
import com.zj198.model.DicUsertype;
import com.zj198.model.PrdRecommendation;
import com.zj198.model.UsrBank;
import com.zj198.model.UsrCompany;
import com.zj198.model.UsrFinanceorg;
import com.zj198.model.UsrLoginhistory;
import com.zj198.model.UsrMenu;
import com.zj198.model.UsrServiceorg;
import com.zj198.model.UsrUser;
import com.zj198.service.club.SupplyRequestService;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.finservice.FinanceProdService;
import com.zj198.service.message.NtyMessageService;
import com.zj198.service.sin.ServiceInfoService;
import com.zj198.service.user.AccountService;
import com.zj198.service.user.ProfileService;
import com.zj198.util.Constants;
import com.zj198.util.Pager;

public class UserAction extends BaseAction {
	
	/**用户中心首页中所取的每项数据记录数*/
	private static Integer pageSize = 3;
	
	private Short userType;
	private String typeName;
	private String userTypeName;
	private AccountService accountService;
	private ProfileService profileService;
	private UsrLoginhistory usrLoginhistory;
	private DictoryDataService dictoryDataService;
	private NtyMessageService ntyMessageService;
    private Map<Integer, List<DicUsertype>> map;
    
    /**用户申请的服务订单*/
    private ServiceInfoService serviceInfoService;
    private FinanceProdService financeProdService;
    private SupplyRequestService supplyRequestService;
    private Pager sinOrderList;
    private List<DicCommon> serviceLevelList;
    private List<Object> supplyInfoList;
    private List<Object> requestInfoList;
    private List<DicInvestRange> investStyleList;
	private List<DicInvestRange> amountRangeList;
	private List<DicInvestRange> projectTypeList;
    
    /**用户已发布的服务信息*/
    private Pager sinItemList;
    private List<PrdRecommendation> bankFinanceRecommendationList;

	// 消息总条数
	private Integer msgNo;
	/**
	 * 用户中心首页
	 */
	@Override
	public String execute(){
		ActionContext context = ActionContext.getContext();	
		UsrUser user = (UsrUser)context.getSession().get("_user");
		context.getSession().remove("mparamid");
		//context.getSession().put("show_home_page", true);
		//用户中心菜单--patrick
//		if(Constants.MENU_MAP.get(user.getUserTypeGroup())==null){
//			List<UsrMenu> menuList = profileService.findMenuListByGroupType(user.getUserTypeGroup());
//			Constants.MENU_MAP.put(user.getUserTypeGroup(),menuList);
//		}
		this.bankFinanceRecommendationList = this.financeProdService.findRecommendationByTopNumber(1, 5);
		usrLoginhistory=profileService.getLoginHistory();
		if(profileService.getProfiles(user.getId())!=null){
			int groupId = profileService.getGroupidByUserType(user.getType());
			typeName=dictoryDataService.getDicUserTypeById(user.getType()).getName();
			// 获取消息总条数
			msgNo = ntyMessageService.getMsgNo(user.getId());
			switch (groupId){
				case Constants.USERTYPE_GROUP_BANK:
					UsrBank bank=(UsrBank)profileService.getProfiles(user.getId());
				    userTypeName=bank.getDetailname();
				    this.getClbSupplyInfoList(user.getId());
					return "bankCenter";
				case Constants.USERTYPE_GROUP_COMPANY:
					UsrCompany userCompany = (UsrCompany)profileService.getProfiles(user.getId());
				    userTypeName=userCompany.getCompanyname();
					this.findSinOrderListByApplicant(user);
					this.getClbRequestInfoList(user.getId());
					return "companyCenter";
				case Constants.USERTYPE_GROUP_FINANCEORG:
					UsrFinanceorg financeorg = (UsrFinanceorg)profileService.getProfiles(user.getId());
				    userTypeName=financeorg.getOrgname();
				    this.getClbSupplyInfoList(user.getId());
					return "financeorgCenter";
				case Constants.USERTYPE_GROUP_PERSONAL:
					this.findSinOrderListByApplicant(user);
					this.getClbRequestInfoList(user.getId());
					return "personCenter";
				case Constants.USERTYPE_GROUP_SERVICEORG:
					UsrServiceorg serviceorg  = (UsrServiceorg) profileService.getProfiles(user.getId());
				    userTypeName=serviceorg.getOrgname();
					this.findSinOrderListByPublisher(user);
					this.findSinItemListByPublisher(user);
					return "serviceorgCenter";
				}
			}else{
				return "editCenter";
		}
		return ERROR;
	}
	
	/**edit profile跳过*/
	public String next(){
		ActionContext context = ActionContext.getContext();	
		UsrUser user = (UsrUser)context.getSession().get("_user");
		context.getSession().remove("mparamid");
//		//用户中心菜单--patrick
//		if(Constants.MENU_MAP.get(user.getUserTypeGroup())==null){
//			List<UsrMenu> menuList = profileService.findMenuListByGroupType(user.getUserTypeGroup());
//			Constants.MENU_MAP.put(user.getUserTypeGroup(),menuList);
//		}
		usrLoginhistory=profileService.getLoginHistory();
		int groupId = profileService.getGroupidByUserType(user.getType());
		typeName=dictoryDataService.getDicUserTypeById(user.getType()).getName();
		this.bankFinanceRecommendationList = this.financeProdService.findRecommendationByTopNumber(1, 5);
		
		switch (groupId){
			case Constants.USERTYPE_GROUP_BANK:
				return "bankCenter";
			case Constants.USERTYPE_GROUP_COMPANY:
				this.findSinOrderListByApplicant(user);
				return "companyCenter";
			case Constants.USERTYPE_GROUP_FINANCEORG:
				return "financeorgCenter";
			case Constants.USERTYPE_GROUP_PERSONAL:
				this.findSinOrderListByApplicant(user);
				return "personCenter";
			case Constants.USERTYPE_GROUP_SERVICEORG:
				this.findSinOrderListByPublisher(user);
				this.findSinItemListByPublisher(user);
				return "serviceorgCenter";
			}
		return ERROR;
	}
	/**
	 * 确定用户类型
	 * @return
	 */
	public String type(){
		if(userType!=null){
			ActionContext context = ActionContext.getContext();	
			UsrUser user = (UsrUser)context.getSession().get("_user");
			if(user.getType()==Constants.USER_TYPE_NULL){ //仅未选择类型的用户才可更新
				int dbtype = accountService.updateUserType(user.getId(),userType);
				if(dbtype>0){
					user.setType((short)dbtype);
					user.setUserTypeGroup(dictoryDataService.getDicUserTypeById(userType).getGroup());
					context.getSession().put("_user",user);
					return "userCenter";
				}else{
					Map<Integer,List<DicUsertype>> map = dictoryDataService.findAllUerttypeGroupByGroup();
					HttpServletRequest request = ServletActionContext.getRequest();
					request.setAttribute("userTypeMap", map);
					return "chooseType";
				}
			}
		}else{		
			msg="请选择正确的类型。";
			Map<Integer,List<DicUsertype>> map = dictoryDataService.findAllUerttypeGroupByGroup();
			HttpServletRequest request = ServletActionContext.getRequest();
			request.setAttribute("userTypeMap", map);
		    return "chooseType";
		}
		return ERROR;
	}
	public String capitalLetter(){
//		ActionContext context = ActionContext.getContext();	
//		UsrUser user = (UsrUser)context.getSession().get("_user");
		return "capital";
	}
	/**取得用户所申请的服务订单*/
	private void findSinOrderListByApplicant(UsrUser user) {
		this.serviceLevelList = this.dictoryDataService.findCommonDataByGroupId(40);
		sinOrderList = this.serviceInfoService.findOrdServiceInfosByApplicant(user.getId(), pageSize,1);
	}
	
	/**取得发布者收到的服务订单*/
	private void findSinOrderListByPublisher(UsrUser user) {
		sinOrderList = this.serviceInfoService.findOrdServiceInfoByPublisher(user.getId(), pageSize, 1);
	}
	
	/**取得发布者所发布的服务信息*/
	private void findSinItemListByPublisher(UsrUser user) {
		sinItemList = this.serviceInfoService.findPrdServiceItemByPublisher(user.getId(), pageSize, 1);
	}
	
	
	private void getClbSupplyInfoList(int userId) {
		 this.supplyInfoList = this.supplyRequestService.findClbSupplyInfoListByUser(userId, 1, 3).getData();
		 this.amountRangeList = this.supplyRequestService.findDicInvestRangeList(Constants.CLUB_AMOUNT_RANGE);
		 this.investStyleList = this.supplyRequestService.findDicInvestRangeList(Constants.CLUB_INVEST_STYLE);
	}
	
	
	private void getClbRequestInfoList(int userId) {
		this.requestInfoList = this.supplyRequestService.findRequestInfoListByUser(userId, 1, 3).getData();
		projectTypeList = this.supplyRequestService.findDicInvestRangeList(Constants.CLUB_PROJECT_TYPE);
	}
	
	//setter and getter
	public void setUserType(Short userType) {
		this.userType = userType;
	}
	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}
	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}
	public void setProfileService(ProfileService profileService) {
		this.profileService = profileService;
	}
	public Map<Integer, List<DicUsertype>> getMap() {
		return map;
	}
	public String getTypeName() {
		return typeName;
	}
	public UsrLoginhistory getUsrLoginhistory() {
		return usrLoginhistory;
	}

	public ServiceInfoService getServiceInfoService() {
		return serviceInfoService;
	}

	public void setServiceInfoService(ServiceInfoService serviceInfoService) {
		this.serviceInfoService = serviceInfoService;
	}

	public Pager getSinOrderList() {
		return sinOrderList;
	}

	public Pager getSinItemList() {
		return sinItemList;
	}

	public List<DicCommon> getServiceLevelList() {
		return serviceLevelList;
	}

	public void setServiceLevelList(List<DicCommon> serviceLevelList) {
		this.serviceLevelList = serviceLevelList;
	}
	public String getUserTypeName() {
		return userTypeName;
	}

	public Integer getMsgNo() {
		return msgNo;
	}

	public void setMsgNo(Integer msgNo) {
		this.msgNo = msgNo;
	}

	public void setNtyMessageService(NtyMessageService ntyMessageService) {
		this.ntyMessageService = ntyMessageService;
	}


	public List<PrdRecommendation> getBankFinanceRecommendationList() {
		return bankFinanceRecommendationList;
	}


	public void setFinanceProdService(FinanceProdService financeProdService) {
		this.financeProdService = financeProdService;
	}


	public List<Object> getSupplyInfoList() {
		return supplyInfoList;
	}


	public List<Object> getRequestInfoList() {
		return requestInfoList;
	}


	public void setSupplyRequestService(SupplyRequestService supplyRequestService) {
		this.supplyRequestService = supplyRequestService;
	}




	public List<DicInvestRange> getInvestStyleList() {
		return investStyleList;
	}




	public List<DicInvestRange> getAmountRangeList() {
		return amountRangeList;
	}




	public List<DicInvestRange> getProjectTypeList() {
		return projectTypeList;
	}
	
	

}
