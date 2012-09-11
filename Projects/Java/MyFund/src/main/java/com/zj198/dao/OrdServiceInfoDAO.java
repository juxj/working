package com.zj198.dao;

import java.util.List;

import com.zj198.model.OrdServiceInfo;
import com.zj198.model.SinServiceLevel;
import com.zj198.model.UsrUser;
import com.zj198.util.Pager;

public interface OrdServiceInfoDAO extends BaseDAO<OrdServiceInfo, Integer> {

	/**管理员获取未经审核的服务服务订单*/
	public Pager findUnauthorizedOrdServiceInfo(int pageSize, int pageNo);
	
	/**保存服务申请订单*/
	public void saveOrdServiceInfo(OrdServiceInfo instance);
	
	/**按发布者查询已申请的订单*/
	public Pager findOrdServiceInfoByPublisher(int contactId,
			int pageSize, int pageNo);
	
	/**按申请者查询服务订单*/
	public Pager findOrdServiceInfosByApplicant(int userId, int pageSize, int pageNo);
	
	/**查询服务等级的评价列表*/
	public List<SinServiceLevel> findServiceLevels(int itemId);
	
	/**根据服务信息查找订单*/
	public Pager findByServiceItem(int itemId, Integer serviceLevel, int pageSize, int pageNo);
	
	/**查找申请人所申请的未审核的订单*/
	public OrdServiceInfo getOrdServiceInfoByApplicant(UsrUser user, int serviceId);
	
}
