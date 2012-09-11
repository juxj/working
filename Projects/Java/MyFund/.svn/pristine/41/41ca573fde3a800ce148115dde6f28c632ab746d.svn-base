package com.zj198.dao.hibernate;

import java.util.List;

import org.hibernate.Query;

import com.zj198.dao.UsrLoginhistoryDAO;
import com.zj198.model.UsrLoginhistory;

public class UsrLoginhistoryDAOImpl extends HibernateDAO<UsrLoginhistory, Integer> implements UsrLoginhistoryDAO {
	@Override
	public UsrLoginhistory getLastByUid(Integer uid){
		String hql="from UsrLoginhistory as model where model.uid=:uid order by model.logindt desc";
		Query query = getQuery(hql,"uid", uid);
		query.setMaxResults(2);//TODO:需要设置回0吗？是否会影响别处，历史经验似乎有影响，暂不确定，待确定
		List<UsrLoginhistory> loginHistoryList = query.list();
		if(loginHistoryList.size()==2){
			return loginHistoryList.get(1);
		}
		if(loginHistoryList.size()==1){
			return loginHistoryList.get(0);
		}
		return null;
	}
}
