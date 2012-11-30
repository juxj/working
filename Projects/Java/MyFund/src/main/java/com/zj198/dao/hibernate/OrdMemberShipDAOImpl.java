package com.zj198.dao.hibernate;

import java.util.Hashtable;
import java.util.List;

import com.zj198.dao.OrdMemberShipDAO;
import com.zj198.model.OrdMembership;
import com.zj198.util.Pager;

public class OrdMemberShipDAOImpl  extends HibernateDAO<OrdMembership, Integer> implements  OrdMemberShipDAO{

	@Override
	public List<OrdMembership> findOrdMSByUserid(Integer userid) {
		String hql="from OrdMembership as model where model.userId=:userid and model.iscancelled = 0";
		return list(hql,"userid", userid);
	}
	/**
	 *  
	 * @return
		@Override
	 */
	public Pager findAllOrdMS(Integer id,Integer userid,Integer pageNo, Integer pageSize) {
		String hql = "select new com.zj198.model.OrdMembership(o.id, o.userId, o.payAmount,o.memberType,o.invoiceType,o.invoiceSendway,o.payStatus, o.payWay, o.payTime, o.createTime,o.iscancelled, u.username)from OrdMembership as o,UsrUser as u where o.userId=u.id";
		Hashtable<String, Object> paramMap = new Hashtable<String, Object>();
		if(id!=null && id!=-1){
			hql+=" and o.id=:id";
			paramMap.put("id", id);
		}
		if(userid!=null && userid!=-1){
			hql+=" and o.userId=:userid";
			paramMap.put("userid", userid);
		}
		return  pagedQuery(hql+=" order by o.createTime desc",pageNo,pageSize,paramMap);
	}

}
