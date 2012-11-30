package com.zj198.dao.hibernate;

import java.util.List;

import org.hibernate.Query;

import com.zj198.dao.OrdFaAttachListDAO;
import com.zj198.model.OrdFaAttachList;
/**
 * @author 岳龙
 * Description:
 * CreateAuthor:岳龙
 * CreateDate:2012-7-17 15:47:30
 */
public class OrdFaAttachListDAOImpl extends HibernateDAO<OrdFaAttachList, Integer> implements OrdFaAttachListDAO {
	public List<OrdFaAttachList> findAttachList(Integer attachId){
		String hql = "from OrdFaAttachList t where t.isDeleted=0 and t.attachId= :attachId";
		return list(hql,"attachId", attachId);
	}
	
	public Integer countAttachList(Integer attachId){
		String hql = "select count(*) from OrdFaAttachList t where t.isDeleted=0 and t.attachId= :attachId";
		Query q =this.getSession().createQuery(hql);
		q.setParameter("attachId", attachId);
		List<Object> list = q.list();
		if(list != null && list.size() > 0){
			return new Integer(list.get(0).toString());
		}else{
			return 0;
		}
	}
}
