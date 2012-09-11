package com.zj198.service.sin;

import java.util.Date;
import java.util.List;

import com.zj198.model.PrdServiceItem;
import com.zj198.model.OrdServiceInfo;
import com.zj198.model.SinServiceLevel;
import com.zj198.model.DicServiceType;
import com.zj198.model.UsrUser;
import com.zj198.util.Pager;

public interface ServiceInfoService {
	
	/*** 服务类型 通过id获得服务类型* @param id* @return */
	public DicServiceType getSinTypeById(Integer id);
	/*** 服务类型  列表* @return*/
	public List<DicServiceType> findSinTypeList();
	/*** 服务类型  保存* @param instance*/
	public void saveSinType(DicServiceType instance);
	/*** 服务类型  删除* @param instance*/
	public void deleteSinType(DicServiceType instance);
	/*** 服务信息  一条* @param id* @return*/
	public PrdServiceItem getPrdServiceItemById(Integer id);
	/*** 根据某种服务类型返回 服务详细信息  list* @param typeId * @return*/
	public List<PrdServiceItem> findPrdServiceItemByType(Integer typeId);
	/** 服务信息  保存 @param instance */
	public void savePrdServiceItem(PrdServiceItem instance);
	/** 服务信息  删除一条*/
	public void deletePrdServiceItem(PrdServiceItem instance);
	/**最近发布的服务信息*/
	public List<PrdServiceItem> findPrdServiceItemByRecentN(int n);
	
	/**获取可用服务信息*/
	public Pager findServiceItemByAvailable(int typeId, int pageSize, int pageNo);
	
	/**保存服务申请订单*/
	public void saveOrdServiceInfo(OrdServiceInfo instance);
	
	/**获取未经审核的服务信息*/
	public Pager findUnauthorizedServiceInfo(int pageSize, int pageNo);
	
	/**按发布者查询*/
	public Pager findPrdServiceItemByPublisher(int contactId, int pageSize, int pageNo);
	
	/**管理员获取未经审核的服务服务订单*/
	public Pager findUnauthorizedOrdServiceInfo(int pageSize, int pageNo);
	
	/**按发布者查询已申请的订单*/
	public Pager findOrdServiceInfoByPublisher(int contactId, int pageSize, int pageNo);
	
	/**按申请者查询服务订单*/
	public Pager findOrdServiceInfosByApplicant(int userId, int pageSize, int pageNo);
	
	/**获取订单明细*/
	public OrdServiceInfo getOrdServiceInfoById(Integer id);
	
	/**获取服务评价得分*/
	public List<SinServiceLevel> findSinServiceLevels(Integer itemId);
	
	/**根据服务信息查找订单*/
	public Pager findByServiceItem(Integer itemId, Integer serviceLevel, int pageSize, int pageNo);
	
	
	public OrdServiceInfo getOrdServiceItemByApplicant(UsrUser user, int serviceId);
	
	/**管理员多条件查询*/
	public Pager findByAdmin(String title, String companyName, String typeName, 
			Date issuedDate,  Date expiredDate, Short isAuthenticated, int pageSize, int pageNo);
	
}
