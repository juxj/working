package com.zj198.dao.hibernate;

import java.util.List;

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
		String hql = "from OrdFaAttachList t where t.attachId= :attachId";
		return list(hql,"attachId", attachId);
	}
}
