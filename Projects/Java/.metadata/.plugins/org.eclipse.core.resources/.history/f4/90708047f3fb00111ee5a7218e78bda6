package com.zj198.action.admin.authorize;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.model.AdmUser;
import com.zj198.model.PrdServiceItem;
import com.zj198.model.OrdServiceInfo;
import com.zj198.service.sin.ServiceInfoService;
import com.zj198.util.Pager;

public class ServiceInfoAuthorizeAction extends BaseAction {

	private static int pageSize = 20;
	private int pageNo = 1 ;
	
	/**信息服务*/
	private ServiceInfoService serviceInfoService;
	private Integer itemId;
	private PrdServiceItem sinItem;
	private String isAuthenticated;
	private Pager pager;
	private Integer orderId;
	private Short status;
	private OrdServiceInfo sinOrder;
	
	/**显示未审核的服务信息*/
	public String showUnauthorizedServiceInfo(){
		if (sinItem == null) {
			this.sinItem = new PrdServiceItem();
			sinItem.setIsAuthenticated(Short.valueOf("0"));
		}
		pager = this.serviceInfoService.findByAdmin(sinItem.getTitle(), sinItem.getCompanyName(), 
				sinItem.getTypeName(), sinItem.getIssuedDate(), sinItem.getExpiredDate(), 
				sinItem.getIsAuthenticated(), pageSize, pageNo);
		return "unauthorizedServiceInfo";
	}
	/**显示未审核的服务服务订单*/
	public String showServiceOrderForm(){
		pager = this.serviceInfoService.findUnauthorizedOrdServiceInfo(pageSize, pageNo);
		return "unauthorizedServiceOrder";
	}
	
	/**显示服务信息详情*/
	public String showDetail(){
		this.sinItem = this.serviceInfoService.getPrdServiceItemById(itemId);
		return "siDetail";
	}
	
	/**显示服务订单详情*/
	public String showOrderForm(){
		this.sinOrder = this.serviceInfoService.getOrdServiceInfoById(orderId);
		return "sinOrder";
	}
	
	/**审核服务方发布的服务信息*/
	public String authorizeServiceInfo() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		ActionContext context = ActionContext.getContext();	
		AdmUser admin = (AdmUser)context.getSession().get("_admin");
		
		sinItem = this.serviceInfoService.getPrdServiceItemById(Integer.valueOf(itemId));
		if (sinItem != null) {
			sinItem.setAuthorizedDate(Calendar.getInstance().getTime());
			sinItem.setAuthorizedBy(admin.getRealname());
			sinItem.setIsAuthenticated(Short.valueOf(isAuthenticated));
			this.serviceInfoService.savePrdServiceItem(sinItem);
			response.getWriter().write("{\"status\":\"success\"}");
		} else {
			response.getWriter().write("{\"status\":\"failure\"}");
		}
		return null;
	}
	
	/**审核服务服务订单*/
	public String authorizeServiceOrder() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		sinOrder = this.serviceInfoService.getOrdServiceInfoById(Integer.valueOf(orderId));
		if (sinOrder != null) {
			sinOrder.setStatus(status);
			this.serviceInfoService.saveOrdServiceInfo(sinOrder);
			response.getWriter().write("{\"status\":\"success\"}");
		} else {
			response.getWriter().write("{\"status\":\"failure\"}");
		}
		return null;
	}

	
	@Override
	public String execute() throws Exception {
		return null;
	}


	public ServiceInfoService getServiceInfoService() {
		return serviceInfoService;
	}


	public void setServiceInfoService(ServiceInfoService serviceInfoService) {
		this.serviceInfoService = serviceInfoService;
	}


	public Integer getItemId() {
		return itemId;
	}


	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}


	public PrdServiceItem getSinItem() {
		return sinItem;
	}


	public void setSinItem(PrdServiceItem sinItem) {
		this.sinItem = sinItem;
	}


	public String getIsAuthenticated() {
		return isAuthenticated;
	}

	public void setIsAuthenticated(String isAuthenticated) {
		this.isAuthenticated = isAuthenticated;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
	public Integer getOrderId() {
		return orderId;
	}
	
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public OrdServiceInfo getSinOrder() {
		return sinOrder;
	}

	public void setStatus(Short status) {
		this.status = status;
	}

	public Pager getPager() {
		return pager;
	}

}
