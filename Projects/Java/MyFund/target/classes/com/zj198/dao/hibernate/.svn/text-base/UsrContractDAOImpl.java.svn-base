package com.zj198.dao.hibernate;

import com.zj198.dao.UsrContractDAO;
import com.zj198.model.UsrContract;
import com.zj198.util.Pager;

public class UsrContractDAOImpl extends HibernateDAO<UsrContract, Integer> implements UsrContractDAO {

	@Override
	public Pager findUserContracts(Integer userId, int pageSize, int pageNo) {
		//TODO:此处传一个userId就可以，不需要传user对象
		//TODO:已改
		String hql = "from UsrContract where userId = :userId";
		return pagedQuery(hql, pageNo, pageSize,"userId", userId);
	}
	
	public Pager findUserContracts(int pageSize, int pageNo){
		String hql = "from UsrContract";
		return pagedQuery(hql, pageNo, pageSize);
	}


}
