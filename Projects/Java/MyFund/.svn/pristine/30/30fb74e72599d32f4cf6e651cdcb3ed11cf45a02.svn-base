package com.zj198.action.serviceInfo;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.transaction.annotation.Transactional;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.model.DicCommon;
import com.zj198.model.DicUsertype;
import com.zj198.model.OrdServiceInfo;
import com.zj198.model.PrdRecommendation;
import com.zj198.model.PrdServiceItem;
import com.zj198.model.UsrCompany;
import com.zj198.model.UsrUser;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.finservice.FinanceProdService;
import com.zj198.service.sin.ServiceInfoService;
import com.zj198.service.user.ProfileService;
import com.zj198.util.Constants;
import com.zj198.util.Pager;

public class ServiceOrderAction extends BaseAction  implements Action{

	private static int PAGE_SIZE = 10;
	//Service
	private DictoryDataService dictoryDataService;
	private ServiceInfoService serviceInfoService;
	private FinanceProdService financeProdService;
	private ProfileService profileService;
	
	/*服务需求*/
	private String requirements;
	private Integer typeId;
	private Integer itemId;
	private Integer orderId;
	private Integer pageNo=1;
	private Integer orderStatus;
	private OrdServiceInfo ordServiceInfo;
	
	private List<DicCommon> serviceLevelList;
	private List<PrdRecommendation> bankFinanceRecommendationList;

	/**显示订单详细信息*/
	public String showSinOrderDetail() {
		this.bankFinanceRecommendationList = this.financeProdService.findRecommendationByTopNumber(1, 5);
		this.ordServiceInfo = this.serviceInfoService.getOrdServiceInfoById(orderId);
		return "siOrderDetail";
	}
	
	/**改变订单状态*/
	public String changeOrderStatus()  throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		String result = "{\"status\":\"failure\",\"msg\":\"操作失败\"}";
		this.ordServiceInfo = this.serviceInfoService.getOrdServiceInfoById(orderId);
		ActionContext context = ActionContext.getContext();	
		context.getSession().get("_user");
		ordServiceInfo.setStatus(this.orderStatus.shortValue());
		this.serviceInfoService.saveOrdServiceInfo(ordServiceInfo);
		result = "{\"status\":\"success\",\"msg\":\"操作成功\"}";
		response.getWriter().write(result);
		return null;
	}
	
	
	/**申请人所申请的订单*/
	public String showSinOrdersByApplicant(){
		this.serviceLevelList = this.dictoryDataService.findCommonDataByGroupId(40);
		pager = this.serviceInfoService.findOrdServiceInfosByApplicant(getUser().getId(), PAGE_SIZE, pageNo);
		return "applicantOrders";
	}
	
	public String apply() throws IOException {
		ActionContext context = ActionContext.getContext();	
		UsrUser user = (UsrUser)context.getSession().get("_user");
		if (null != user) {
			DicUsertype userType = this.dictoryDataService.getDicUserTypeById(user.getType());
			int group = userType.getGroup();
			HttpServletResponse response = ServletActionContext.getResponse();
			if (group != Constants.USERTYPE_GROUP_PERSONAL && group != Constants.USERTYPE_GROUP_COMPANY) { 
				response.getWriter().write("{\"status\":\"failure\"}");
			} else {
				response.getWriter().write("{\"status\":\"success\"}");
			}
		} 
		return null;
	}
	
	
	/**企业或个人申请服务*/
	@Transactional
	public String applyService() throws IOException {
			UsrUser user = getUser();
			HttpServletResponse response = ServletActionContext.getResponse();
			
			response.setContentType("text/html");
			response.setCharacterEncoding("gbk");
			OrdServiceInfo order = this.serviceInfoService.getOrdServiceItemByApplicant(user, itemId);
			
			if (order != null )  {
				response.getWriter().write("{\"status\":\"success\", \"info\":\"对不起，您已经申请了此项服务，只是尚未通过本站管理审核，请耐心等待\"}");
				return null;
			}
			
			if (null == user) {
				response.getWriter().write("{\"status\":\"failure\", \"info\":\"login\"}");
				return null;
			} else {
				DicUsertype userType = this.dictoryDataService.getDicUserTypeById(user.getType());
				int group = userType.getGroup();
				if (group == Constants.USERTYPE_GROUP_PERSONAL || group == Constants.USERTYPE_GROUP_COMPANY) { 
					
					PrdServiceItem prdServiceItem = serviceInfoService.getPrdServiceItemById(itemId);
					
					String userTypeName = "";
					if (group == Constants.USERTYPE_GROUP_PERSONAL) {
						userTypeName = "个人";
					}
					
					if (group == Constants.USERTYPE_GROUP_COMPANY) {
						userTypeName = "企业";
					}
					
					if (prdServiceItem.getTargetName().indexOf(userTypeName)<0) {
						response.getWriter().write("{\"status\":\"success\", \"info\":\"对不起，您还不能申请此项服务，此服务只对"+prdServiceItem.getTargetName()+"开放\"}");
						return null;
					}
					
					order = new OrdServiceInfo();
					order.setApplyDate(Calendar.getInstance().getTime());
					order.setContactId(user.getId());
					order.setContactName(user.getRealname());
					order.setItemId(itemId);
					order.setItemTitle(prdServiceItem.getTitle());
					order.setItemTypeId(prdServiceItem.getTypeId());
					order.setItemTypeName(prdServiceItem.getTypeName());
					order.setStatus(Short.valueOf("0"));
					order.setServiceNo(prdServiceItem.getServiceNo());
					order.setVendorId(prdServiceItem.getCompanyId());
					order.setVendorName(prdServiceItem.getCompanyName());
					order.setRequirements(requirements);
					
					if (group == Constants.USERTYPE_GROUP_COMPANY) {
						UsrCompany org = (UsrCompany) profileService.getProfiles(user.getId());
						order.setOrgId(org.getUserid());
						order.setOrgName(org.getCompanyname());
					}
					
					if (group == Constants.USERTYPE_GROUP_PERSONAL) {
						order.setOrgId(user.getId());
						order.setOrgName(user.getRealname());
					}
					serviceInfoService.saveOrdServiceInfo(order);
					prdServiceItem.setApplyCount(prdServiceItem.getApplyCount()+1);
					serviceInfoService.savePrdServiceItem(prdServiceItem);
					response.getWriter().write("{\"status\":\"success\", \"info\":\"保存成功,请至<a href='/user/UserAction.act'>用户中心</a>查看订单情况.\"}");
				} else {
					response.getWriter().write("{\"status\":\"success\", \"info\":\"对不起，您的用户类型不支持此操作！.\"}");
					return ERROR;
				}
			}
		return null;
	}

	
	
	/**显示信息发布者收到的服务订单*/
	public String showPublisherOrders() {
		pager = this.serviceInfoService.findOrdServiceInfoByPublisher(this.getUser().getId(), PAGE_SIZE, pageNo);
		return "publisherOrders";
	}
	
	
	public String getRequirements() {
		return requirements;
	}

	public void setRequirements(String requirements) {
		this.requirements = requirements;
	}

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public Integer getItemId() {
		return itemId;
	}

	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}

	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}

	public void setServiceInfoService(ServiceInfoService serviceInfoService) {
		this.serviceInfoService = serviceInfoService;
	}

	public void setProfileService(ProfileService profileService) {
		this.profileService = profileService;
	}

	@Override
	public String execute() throws Exception {
		return null;
	}
	
	public List<DicCommon> getServiceLevelList() {
		return serviceLevelList;
	}

	
	public void setOrdServiceInfo(OrdServiceInfo ordServiceInfo) {
		this.ordServiceInfo = ordServiceInfo;
	}

	public OrdServiceInfo getOrdServiceInfo() {
		return ordServiceInfo;
	}

	public Integer getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}

	private UsrUser getUser(){
		ActionContext context = ActionContext.getContext();	
		UsrUser user = (UsrUser)context.getSession().get("_user");
		return user;
	}

	public List<PrdRecommendation> getBankFinanceRecommendationList() {
		return bankFinanceRecommendationList;
	}

	public void setFinanceProdService(FinanceProdService financeProdService) {
		this.financeProdService = financeProdService;
	}

}
