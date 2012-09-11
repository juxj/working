package com.zj198.service.sin.impl;

import java.util.Date;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.dao.DicServiceTypeDAO;
import com.zj198.dao.OrdServiceInfoDAO;
import com.zj198.dao.PrdServiceItemDAO;
import com.zj198.model.DicServiceType;
import com.zj198.model.OrdServiceInfo;
import com.zj198.model.PrdServiceItem;
import com.zj198.model.SinServiceLevel;
import com.zj198.model.UsrUser;
import com.zj198.util.OrderNOCreator;
import com.zj198.util.Pager;

public class ServiceInfoServiceImpl implements
		com.zj198.service.sin.ServiceInfoService {

	private DicServiceTypeDAO dicServiceTypeDAO;
	private PrdServiceItemDAO prdServiceItemDAO;
	private OrdServiceInfoDAO ordServiceInfoDAO;

	/**按申请者查询服务订单*/
	public Pager findOrdServiceInfosByApplicant(int userId, int pageSize, int pageNo){
		return ordServiceInfoDAO.findOrdServiceInfosByApplicant(userId, pageSize, pageNo);
	}
	@Override
	public Pager findOrdServiceInfoByPublisher(int contactId,
			int pageSize, int pageNo) {
		return this.ordServiceInfoDAO.findOrdServiceInfoByPublisher(contactId, pageSize, pageNo);
	}

	@Override
	public Pager findPrdServiceItemByPublisher(int contactId, int pageSize,
			int pageNo) {
		return this.prdServiceItemDAO.findByPublisher(contactId, pageSize, pageNo);
	}
	
	@Override
	public Pager findUnauthorizedServiceInfo(int pageSize,
			int pageNo) {
		return this.prdServiceItemDAO.findUnauthorizedServiceInfo(pageSize, pageNo);
	}
	
	public Pager findByAdmin(String title, String companyName, String typeName, 
			Date issuedDate,  Date expiredDate, Short isAuthenticated, int pageSize, int pageNo) {
		return this.prdServiceItemDAO.findByAdmin(title, companyName, typeName, issuedDate, expiredDate, isAuthenticated, pageSize, pageNo);
	}
	
	@Override
	public Pager findServiceItemByAvailable(int typeId, int pageSize, int pageNo) {
		return this.prdServiceItemDAO.findServiceItemByAvailable(typeId, pageSize, pageNo);
	}

	@Override
	public void saveOrdServiceInfo(OrdServiceInfo instance) {
		if (instance.getId() == null) {
			this.ordServiceInfoDAO.save(instance);
			instance.setOrderNo(OrderNOCreator.getServiceOrderNumber(instance.getId()));
			this.ordServiceInfoDAO.update(instance);
		} else {
			this.ordServiceInfoDAO.update(instance);
		}
	}
	
	public OrdServiceInfo getOrdServiceItemByApplicant(UsrUser user, int serviceId){
		return this.ordServiceInfoDAO.getOrdServiceInfoByApplicant(user, serviceId);
	}
	
	@Override
	public DicServiceType getSinTypeById(Integer id) {
		return this.dicServiceTypeDAO.get(id);
	}

	@Override
	public List<DicServiceType> findSinTypeList() {
		return this.dicServiceTypeDAO.findAll();
	}

	@Override
	public void saveSinType(DicServiceType instance) {
		ActionContext ctx = ActionContext.getContext();
		UsrUser user = (UsrUser)ctx.getSession().get("_user");
		if(instance.getId()== null){
			instance.setIsCancelled((short)0);
			dicServiceTypeDAO.save(instance);
		}else{
			dicServiceTypeDAO.update(instance);
		}
	}

	@Override
	public void deleteSinType(DicServiceType instance) {
		this.dicServiceTypeDAO.deleteObject(instance);
	}

	@Override
	public PrdServiceItem getPrdServiceItemById(Integer id) {
		return this.prdServiceItemDAO.get(id);
	}
	
	

	@Override
	public List<PrdServiceItem> findPrdServiceItemByType(Integer typeId) {
		return this.prdServiceItemDAO.findPrdServiceItemByType(typeId);
	}

	@Override
	public void savePrdServiceItem(PrdServiceItem instance) {
//		ActionContext ctx = ActionContext.getContext();
//		UsrUser user = (UsrUser)ctx.getSession().get("_user");
		if(instance.getId()==null){
			instance.setIsCancelled((short)0);
			//instance.setCompanyId(user.getId());
			instance.setIsAuthenticated((short) 0);
			//instance.setLastModifiedBy(user.getUsername());
			instance.setApplyCount(0);
			prdServiceItemDAO.save(instance);
			
			String serviceNo = OrderNOCreator.getServiceInfoNumber(instance.getId());
			instance.setServiceNo(serviceNo);
			prdServiceItemDAO.update(instance);
			
		}else{
			prdServiceItemDAO.update(instance);
		}
	}

	@Override
	public void deletePrdServiceItem(PrdServiceItem instance) {
		this.prdServiceItemDAO.deleteObject(instance);
	}

	@Override
	public List<PrdServiceItem> findPrdServiceItemByRecentN(int n) {
		return this.prdServiceItemDAO.findPrdServiceItemByRecentN(n);
	}

	public DicServiceTypeDAO getDicServiceTypeDAO() {
		return dicServiceTypeDAO;
	}

	public void setDicServiceTypeDAO(DicServiceTypeDAO dicServiceTypeDAO) {
		this.dicServiceTypeDAO = dicServiceTypeDAO;
	}

	public PrdServiceItemDAO getPrdServiceItemDAO() {
		return prdServiceItemDAO;
	}

	public void setPrdServiceItemDAO(PrdServiceItemDAO prdServiceItemDAO) {
		this.prdServiceItemDAO = prdServiceItemDAO;
	}

	public OrdServiceInfoDAO getOrdSeerviceInfoDAO() {
		return ordServiceInfoDAO;
	}

	public void setOrdServiceInfoDAO(OrdServiceInfoDAO ordServiceInfoDAO) {
		this.ordServiceInfoDAO = ordServiceInfoDAO;
	}
	@Override
	public OrdServiceInfo getOrdServiceInfoById(Integer id) {
		return this.ordServiceInfoDAO.get(id);
	}
	@Override
	public List<SinServiceLevel> findSinServiceLevels(Integer itemId) {
		return this.ordServiceInfoDAO.findServiceLevels(itemId);
	}
	@Override
	public Pager findByServiceItem(Integer itemId, Integer serviceLevel, int pageSize, int pageNo) {
		return this.ordServiceInfoDAO.findByServiceItem(itemId, serviceLevel, pageSize, pageNo);
	}
	@Override
	public Pager findUnauthorizedOrdServiceInfo(int pageSize, int pageNo) {
		return this.ordServiceInfoDAO.findUnauthorizedOrdServiceInfo(pageSize, pageNo);
	}
	
}
