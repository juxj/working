package com.zj198.dao.hibernate;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;

import com.zj198.dao.OrdServiceInfoDAO;
import com.zj198.model.DicCommon;
import com.zj198.model.OrdServiceInfo;
import com.zj198.model.SinServiceLevel;
import com.zj198.model.UsrUser;
import com.zj198.util.Pager;

public class OrdServiceInfoDAOImpl extends HibernateDAO<OrdServiceInfo, Integer> implements OrdServiceInfoDAO {

	@Override
	public void saveOrdServiceInfo(OrdServiceInfo instance) {
		super.saveOrUpdate(instance);
	}

	@Override
	public Pager findOrdServiceInfoByPublisher(int contactId, int pageSize, int pageNo) {
		String hql = "from OrdServiceInfo where vendorId = :vendorId order by applyDate desc";
		return pagedQuery(hql, pageNo, pageSize,"vendorId", contactId);
	}
	
	public OrdServiceInfo getOrdServiceInfoByApplicant(UsrUser user, int serviceId) {
		OrdServiceInfo result = null;
		String hql = "from OrdServiceInfo where contactId = :contactId and itemId = :itemId and status=0 order by  applyDate desc";
		List<OrdServiceInfo> list = this.list(hql, "contactId", user.getId(), "itemId", serviceId);
		if (list.size()>0) {
			result = list.get(0);
		}
		return result;
	}
	
	/**按申请者查询服务订单*/
	public Pager findOrdServiceInfosByApplicant(int userId, int pageSize, int pageNo){
		String hql = "from OrdServiceInfo where orgId = :userId  order by applyDate desc";
		return pagedQuery(hql, pageNo, pageSize,"userId", userId);
	}

	@Override
	public List<SinServiceLevel> findServiceLevels(int itemId) {
		
		/*从字典表中找出有关服务评价的分类*/
		String dicCommonHql = "from DicCommon as dc where dc.group = 40";
		List<DicCommon> dicCommons = getQuery(dicCommonHql).list(); 
		/*从订单表中服务评价的内容*/
		String OrdServiceInfoHql = "select serviceLevel as id,  count(id) as cnt,  itemId from OrdServiceInfo" +
				" group by serviceLevel having itemId = :itemId and serviceLevel is not null";
		Hashtable<String,Object> params = new Hashtable<String, Object>();
		params.put("itemId", itemId);
		List<SinServiceLevel> serviceLevels = getQuery(OrdServiceInfoHql,params).list();
		
		List<SinServiceLevel> result = new ArrayList<SinServiceLevel>();
		
		for (DicCommon dicCommon : dicCommons) {
			SinServiceLevel level = new SinServiceLevel();
			level.setId(dicCommon.getId());
			level.setName(dicCommon.getName());
			
			Iterator it = serviceLevels.iterator();
			
			while(it.hasNext()) {
				Object[] obj = (Object[])it.next();
				Integer id = (Integer) obj[0];
				if (id.equals(level.getId())){
					Long cnt = (Long)obj[1];
					level.setCnt(cnt.intValue());
				}
			}
			
			if (level.getCnt() == null) {
				level.setCnt(0);
			}
			
			result.add(level);
		}
		
		return result;
	}

	@Override
	public Pager findByServiceItem(int itemId, Integer serviceLevel, int pageSize, int pageNo) {
		Hashtable<String, Object> params = new Hashtable<String, Object>();
		String hql ="from OrdServiceInfo where itemId = :itemId and assessment is not null";
		params.put("itemId", itemId);
		if (serviceLevel != null && serviceLevel.intValue()>0 ){
			hql = hql + " and serviceLevel = :serviceLevel";
			params.put("serviceLevel", serviceLevel);
		}
		return pagedQuery(hql, pageNo, pageSize,params);
	}

	@Override
	public Pager findUnauthorizedOrdServiceInfo(int pageSize, int pageNo) {
		String hql = "from OrdServiceInfo where status = 0";
		return pagedQuery(hql, pageNo, pageSize);
	}

}
