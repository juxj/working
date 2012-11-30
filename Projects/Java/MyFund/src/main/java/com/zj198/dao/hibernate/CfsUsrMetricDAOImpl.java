package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.CfsUsrMetricDAO;
import com.zj198.model.CfsUsrMetric;
import com.zj198.model.UsrUser;

public class CfsUsrMetricDAOImpl extends HibernateDAO<CfsUsrMetric, Integer> implements CfsUsrMetricDAO {

	@Override
	public CfsUsrMetric getUserMetricByMetricId(UsrUser user, Integer metricId) {
		CfsUsrMetric result = null;
		String hql = "from CfsUsrMetric where usrId= :userId and cfsMetricId = :cfsMetricId";
		List<CfsUsrMetric> list = this.list(hql, "userId", user.getId(), "cfsMetricId", metricId);
		if (list != null && list.size()>0) {
			result = list.get(0);
		}
		return result ;
	}

	@Override
	public CfsUsrMetric getUserMetricByMetricCode(Integer userId,
			String metricCode) {
		CfsUsrMetric result = null;
		String hql = "from CfsUsrMetric where usrId= :userId and cfsMetricCode = :cfsMetricCode";
		List<CfsUsrMetric> list = this.list(hql, "userId", userId, "cfsMetricCode", metricCode);
		if (list != null && list.size()>0) {
			result = list.get(0);
		}
		return result ;
	}

	@Override
	public List<CfsUsrMetric> getCfsUsrMetricListByUser(Integer userId) {
		String hql = "from CfsUsrMetric where usrId= :userId";
		return this.list(hql, "userId", userId);
	}


}
