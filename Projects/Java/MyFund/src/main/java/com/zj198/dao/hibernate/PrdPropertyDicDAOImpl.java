package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.PrdPropertyDicDAO;
import com.zj198.model.PrdPropertyDic;

public class PrdPropertyDicDAOImpl extends HibernateDAO<PrdPropertyDic, Integer> implements PrdPropertyDicDAO {
	public List<PrdPropertyDic> findPropertyDic(Integer groupId){
		String hql = "from PrdPropertyDic t where t.groupId = :groupId";
		return this.list(hql, "groupId", groupId);
	}
	
	public List<PrdPropertyDic> findPropertyDic(Integer groupId, String values){
		String hql = "from PrdPropertyDic t where t.groupId = :groupId and t.dicValue in (" + values + ")";
		return this.list(hql, "groupId", groupId);
	}
}
