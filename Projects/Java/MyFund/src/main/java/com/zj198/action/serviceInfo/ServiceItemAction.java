package com.zj198.action.serviceInfo;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.model.DicCommon;
import com.zj198.model.DicProvince;
import com.zj198.model.DicServiceType;
import com.zj198.model.PrdServiceItem;
import com.zj198.model.UsrServiceorg;
import com.zj198.model.UsrUser;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.sin.ServiceInfoService;
import com.zj198.service.user.ProfileService;
import com.zj198.util.Pager;

public class ServiceItemAction extends BaseAction{

	private final static Integer PAGE_SIZE = 20;
	
	private DictoryDataService dictoryDataService;
	private ServiceInfoService serviceInfoService;
	private UsrServiceorg usrServiceorg;
	private ProfileService profileService;
	
	private PrdServiceItem prdServiceItem;
	private Integer typeId;
	private Integer itemId;
	private Pager pager;
	private Integer isCancelled;
	private Integer pageNo=1;
	
	private List<PrdServiceItem> serviceItemList;
	private List<DicProvince> provinceList;
	
	private Map<String,List<DicCommon>> dataMap;
	private List<DicServiceType> sinTypeList;
	
	
	public String findInfo(){
	    pager=serviceInfoService.findServiceItemByAvailable(typeId, PAGE_SIZE, 1);
		return "serviceInfoList";
	}
	/**
	 * 增加服务信息
	 * @return
	 */
	public String addInfo(){
		/*取得当前用户*/
		UsrUser user = this.getUser();
		usrServiceorg=(UsrServiceorg)profileService.getProfiles(user.getId());
		
		/*取得FORM所用的参数*/
		sinTypeList=serviceInfoService.findSinTypeList();
		dataMap = new HashMap<String,List<DicCommon>>();
		dataMap.put("area", dictoryDataService.findCommonDataByGroupId(30));
		dataMap.put("obj", dictoryDataService.findCommonDataByGroupId(31));
		this.provinceList = this.dictoryDataService.findAllProvince();
		/*设定默认值*/
		prdServiceItem=new PrdServiceItem();
		prdServiceItem.setContactId(user.getId());
		prdServiceItem.setContactName(user.getRealname());
		prdServiceItem.setCompanyId(usrServiceorg.getUserid());
		prdServiceItem.setCompanyName(usrServiceorg.getOrgname());
		prdServiceItem.setPosition(usrServiceorg.getPosition());
		prdServiceItem.setIssuedDate(Calendar.getInstance().getTime());
		prdServiceItem.setIsAuthenticated(Short.valueOf("0"));
		prdServiceItem.setIsCancelled(Short.valueOf("0"));
		prdServiceItem.setApplyCount(0);
		return "serviceAddInfo";
	}
	
	/**
	 * 保存服务信息
	 * @return
	 */
	public String saveInfo(){
		typeId=prdServiceItem.getTypeId();
		Date issuedDate = prdServiceItem.getIssuedDate();
		Date expiredDate = prdServiceItem.getExpiredDate();
		if (issuedDate == null){
			issuedDate = Calendar.getInstance().getTime();
		}
		if (expiredDate != null) {
			if (expiredDate.before(issuedDate)) {
				this.msg = "过期日不能小于发布日！";
				return ERROR;
			}
		}
		serviceInfoService.savePrdServiceItem(prdServiceItem);
		return this.showServiceInfoHomeByPublisher();
	}
	
	/**编辑服务信息*/
	public String editInfo(){
		UsrUser user = this.getUser();
		usrServiceorg=(UsrServiceorg)profileService.getProfiles(user.getId());
		sinTypeList=serviceInfoService.findSinTypeList();
		dataMap = new HashMap<String,List<DicCommon>>();
		this.provinceList = this.dictoryDataService.findAllProvince();
		dataMap.put("obj", dictoryDataService.findCommonDataByGroupId(31));
		if (prdServiceItem != null && prdServiceItem.getId() != null) {
			prdServiceItem=serviceInfoService.getPrdServiceItemById(prdServiceItem.getId());
		} else {
			prdServiceItem = new PrdServiceItem();
			prdServiceItem.setCompanyId(user.getId());
			prdServiceItem.setCompanyName(usrServiceorg.getOrgname());
			prdServiceItem.setContactId(user.getId());
			prdServiceItem.setContactName(user.getRealname());
		}
		return "serviceAddInfo";
	}
	/**删除服务信息*/
	public String deleteInfo(){
		typeId=prdServiceItem.getTypeId();
		serviceInfoService.deletePrdServiceItem(prdServiceItem);
		return "successInfo";
	}
	
	/**未登录用户可以看到的服务信息*/
	public String showHome(){
		typeId = typeId == null ? 0: typeId;
		pager = this.serviceInfoService.findServiceItemByAvailable(typeId, PAGE_SIZE, pageNo);
		this.sinTypeList = this.serviceInfoService.findSinTypeList();
		return "serviceItemHome";
	}
	
	/**取消服务信息(只有没经过审核的服务信息才可以被取消)*/
	public String cancelSinItem(){
		HttpServletResponse response = ServletActionContext.getResponse();
		boolean result = false;
		prdServiceItem = this.serviceInfoService.getPrdServiceItemById(Integer.valueOf(itemId));
		if (prdServiceItem != null) {
			try {
				prdServiceItem.setIsCancelled(this.isCancelled.shortValue());
				this.serviceInfoService.savePrdServiceItem(prdServiceItem);
				result = true;
			} catch (Exception e) {
				
			}
		} 
		
		try {
			if (result) {
				response.getWriter().write("{\"status\":\"success\"}");
			} else {
				response.getWriter().write("{\"status\":\"failure\"}");
			}
		} catch (Exception e) {
			
		}
		return null;
	}
	
	/**信息发布者所用的信息服务Home*/
	public String showServiceInfoHomeByPublisher() {
		ActionContext context = ActionContext.getContext();	
		UsrUser user = (UsrUser)context.getSession().get("_user");
		pager = this.serviceInfoService.findPrdServiceItemByPublisher(user.getId(), PAGE_SIZE, pageNo);
		return "serviceItemHome4Publisher";
	}
	
	/**显示服务信息明细*/
	public String showSinItemDetail() {
		this.serviceItemList = this.serviceInfoService.findPrdServiceItemByRecentN(5);
		this.prdServiceItem = this.serviceInfoService.getPrdServiceItemById(itemId);
		return "siDetail";
	}
	
	private UsrUser getUser(){
		ActionContext context = ActionContext.getContext();	
		return (UsrUser)context.getSession().get("_user");
	}
	
	@Override
	public String execute() throws Exception {
		return null;
	}
	public PrdServiceItem getPrdServiceItem() {
		return prdServiceItem;
	}
	public void setPrdServiceItem(PrdServiceItem prdServiceItem) {
		this.prdServiceItem = prdServiceItem;
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
	public Integer getIsCancelled() {
		return isCancelled;
	}
	public void setIsCancelled(Integer isCancelled) {
		this.isCancelled = isCancelled;
	}
	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public Map<String, List<DicCommon>> getDataMap() {
		return dataMap;
	}
	public void setDataMap(Map<String, List<DicCommon>> dataMap) {
		this.dataMap = dataMap;
	}
	public List<DicServiceType> getSinTypeList() {
		return sinTypeList;
	}
	public void setSinTypeList(List<DicServiceType> sinTypeList) {
		this.sinTypeList = sinTypeList;
	}
	public Pager getPager() {
		return pager;
	}
	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}
	public void setServiceInfoService(ServiceInfoService serviceInfoService) {
		this.serviceInfoService = serviceInfoService;
	}
	public void setUsrServiceorg(UsrServiceorg usrServiceorg) {
		this.usrServiceorg = usrServiceorg;
	}
	public void setProfileService(ProfileService profileService) {
		this.profileService = profileService;
	}
	public List<DicProvince> getProvinceList() {
		return provinceList;
	}
	public List<PrdServiceItem> getServiceItemList() {
		return serviceItemList;
	}
	
	
}
