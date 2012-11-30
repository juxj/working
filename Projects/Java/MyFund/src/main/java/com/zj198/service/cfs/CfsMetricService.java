package com.zj198.service.cfs;

import java.util.List;

import com.zj198.model.CfsUsrMetric;
import com.zj198.model.UsrUser;
import com.zj198.model.vo.CfsComparedReport;

public interface CfsMetricService {
	public void saveGeneratedMetricReports(Integer userId, Integer fiscalYear);
	public List<CfsUsrMetric> getCfsUserMetricListByUser(UsrUser user);
	public List<CfsComparedReport> getComparedReportList(UsrUser user, String rptTypeCode, Integer year);
}
