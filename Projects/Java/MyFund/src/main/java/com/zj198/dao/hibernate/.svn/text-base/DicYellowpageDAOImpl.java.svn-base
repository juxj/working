package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.DicYellowpageDAO;
import com.zj198.model.DicYellowpage;

public class DicYellowpageDAOImpl extends HibernateDAO<DicYellowpage, Integer> implements DicYellowpageDAO {

	public List<DicYellowpage> findPageByType(Integer type) {
		return findTopRows("from DicYellowpage o where o.type = :type", 16, "type", type);
	}

	@Override
	public List<DicYellowpage> findPageByTypeAll(Integer type) {
		return list("from DicYellowpage o where o.type = :type", "type", type);
	}

}
