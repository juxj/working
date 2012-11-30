package com.zj198.dao.hibernate;

import java.util.Hashtable;

import com.zj198.dao.FundNavDAO;
import com.zj198.model.FundNav;
import com.zj198.util.Pager;

public class FundNavDAOImpl  extends HibernateDAO<FundNav, Integer> implements  FundNavDAO{

	@Override
	public Pager getNavByFundId(Integer id,Integer pageNo, Integer pageSize) {
		String hql="from FundNav as model where 1=1";
		Hashtable<String, Object> paramMap = new Hashtable<String, Object>();
		if(id!=null && id!=-1){
			hql+=" and model.fundId=:id order by navDate desc";
			paramMap.put("id", id);
		}else{
			return null;
		}
		return pagedQuery(hql,pageNo,pageSize,paramMap);
	}

}
