package com.zj198.dao.hibernate;

import java.util.List;

import org.springframework.util.StringUtils;

import com.zj198.dao.CfsRptItemDAO;
import com.zj198.model.CfsRptItem;

public class CfsRptItemDAOImpl extends HibernateDAO<CfsRptItem, Integer> implements CfsRptItemDAO {

	@Override
	public List<CfsRptItem> findCfsRptItemsByVersion() {
		String hql="from CfsRptItem";
		return list(hql);
	}

	@Override
	public List<CfsRptItem> findRptItemByTypeCode(String code) {
		String hql="from CfsRptItem as model where model.cfsRptTypeCode=:code";
		if(StringUtils.hasText(code)){
			List<CfsRptItem> items=list(hql,"code",code);
			if(items.size()>0){
				return items;
			}
		}
		return null;
	}


}
