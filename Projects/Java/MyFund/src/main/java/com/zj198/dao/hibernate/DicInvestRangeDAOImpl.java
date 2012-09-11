package com.zj198.dao.hibernate;

import java.util.List;
import java.util.Map;

import com.zj198.dao.DicInvestRangeDAO;
import com.zj198.model.DicInvestRange;
import com.zj198.util.Constants;

public class DicInvestRangeDAOImpl extends HibernateDAO<DicInvestRange, Integer> implements
		DicInvestRangeDAO {

	Map<Integer, List<DicInvestRange>> parameters = Constants.CLUB_PARAMETERS;
	
	@Override
	public List<DicInvestRange> findDicInvestRangeListByType(int typeId) {
		List<DicInvestRange> result = parameters.get(typeId);
		if (result == null) {
			String hql = "from DicInvestRange where paramTypeId = :paramTypeId";
			result =  this.list(hql, "paramTypeId", typeId);
			parameters.put(typeId, result);
		}
		return result;
	}

	

}
