package com.zj198.dao;

import java.util.List;

import com.zj198.model.CfsUsrMetric;
import com.zj198.model.UsrUser;

public interface CfsUsrMetricDAO extends BaseDAO<CfsUsrMetric, Integer>{
	public CfsUsrMetric getUserMetricByMetricId(UsrUser user, Integer metricId);
	public CfsUsrMetric getUserMetricByMetricCode(Integer userId, String metricCode);
	public List<CfsUsrMetric> getCfsUsrMetricListByUser(Integer userId);
}
