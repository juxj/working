package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.DicIndustryDAO;
import com.zj198.model.DicIndustry;

public class DicIndustryDAOImpl extends HibernateDAO<DicIndustry, Integer> implements DicIndustryDAO {

	@Override
	public List<DicIndustry> findByParentid(Integer parentId) {
		String hql="from DicIndustry as model where model.parentid=:parentId order by seq";
		return list(hql,"parentId", parentId);
	}

}
