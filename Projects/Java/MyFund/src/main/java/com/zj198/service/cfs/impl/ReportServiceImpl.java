package com.zj198.service.cfs.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.google.gson.Gson;
import com.zj198.model.CfsMetric;
import com.zj198.model.CfsRptData;
import com.zj198.model.CfsRptItem;
import com.zj198.model.CfsRptType;
import com.zj198.model.CfsUsrMetric;
import com.zj198.model.CfsUsrRpt;
import com.zj198.model.UsrUser;
import com.zj198.model.vo.MetricAmount;
import com.zj198.model.vo.ReportAmount;
import com.zj198.model.vo.RptStatus;
import com.zj198.model.vo.YearStatus;
import com.zj198.service.cfs.ReportService;
import com.zj198.util.StringUtil;

public class ReportServiceImpl extends CfsBaseService implements  ReportService{

	/**
	 * 检查未完成的报表,返回List<YearStatus>.
	 * @param user
	 * @return
	 */
	public List<YearStatus> getUserReportsByCompletionStatus(UsrUser user, Integer completionStatus){
		CfsUsrRpt cfsUsrRpt = this.getCfsUsrRptByUserId(user.getId());
		List<YearStatus> list = this.getFiscalYearList(cfsUsrRpt);
		for (YearStatus yearStatus : list) {
			List<RptStatus> rptStatusList = yearStatus.getData();
			List<RptStatus> result = new ArrayList<RptStatus>();
			for (RptStatus rptStatus : rptStatusList) {
				if (completionStatus.intValue() == 0) {
					if (rptStatus.getStatus() < 5) {
						result.add(rptStatus);
					}
				} else {
					if (rptStatus.getStatus() > 5) {
						result.add(rptStatus);
					}
				}
				
			}
			yearStatus.setData(result);
		}
		return list;
	}
	
	/**初始化或更新用户的报表*/
	public void saveInitializeUserReports(UsrUser user, String[] fiscalYears, String[] versions){
		this.updateUsrRptGeneralInfo(user, fiscalYears, versions);
		this.initializeUserBlankReport(user, fiscalYears);
		this.initializeBlankUsrMetric(user, fiscalYears);
	}
	
	//**初始化或更新用户的报表*/
	private void updateUsrRptGeneralInfo(UsrUser user, String[] fiscalYears, String[] versions) {
		CfsUsrRpt cfsUsrRpt = this.getCfsUsrRptByUserId(user.getId());
		if (cfsUsrRpt == null) {
			cfsUsrRpt = new CfsUsrRpt();
			cfsUsrRpt.setUsrId(user.getId());
			cfsUsrRpt.setUsrName(user.getUsername());
		}
		String fiscalYearInDB = cfsUsrRpt.getFiscalYears();
		if (StringUtils.isNotBlank(fiscalYearInDB)) {
			cfsUsrRpt.setFiscalYears(fiscalYearInDB+","+StringUtil.getStrByArray(fiscalYears));
			cfsUsrRpt.setVersions(cfsUsrRpt.getVersions()+","+StringUtil.getStrByArray(versions));
		} else {
			cfsUsrRpt.setFiscalYears(StringUtil.getStrByArray(fiscalYears));
			cfsUsrRpt.setVersions(StringUtil.getStrByArray(versions));
		}
		cfsUsrRpt.setFiscalYearStatus(this.getInitializeUserRptStatus(cfsUsrRpt, fiscalYears, versions));
		this.saveOrUpdateCfsUsrRpt(cfsUsrRpt);
	}
	//**初始化或更新用户的报表*/
	private String getInitializeUserRptStatus(CfsUsrRpt cfsUsrRpt, String[] fiscalYears, String[] versions){
		
		List<YearStatus> rptYearStatusList = this.getFiscalYearList(cfsUsrRpt);
		
		if (rptYearStatusList == null || rptYearStatusList.size()<1) {
			rptYearStatusList = new ArrayList<YearStatus>();
		}
		
		List<CfsRptType> cfsRptTypeList = this.findCfsRptTypeList();
		int m = 0;
		for (String year : fiscalYears) {
			YearStatus yearStatus = new YearStatus();
			yearStatus.setYear(Integer.valueOf(year));
			yearStatus.setVersion(versions[m]);
			List<RptStatus> rptStatusList = new ArrayList<RptStatus>();
			for(CfsRptType cfsRptType : cfsRptTypeList) {
				RptStatus status = new RptStatus();
				status.setCode(cfsRptType.getCode());
				status.setStatus(0);
				rptStatusList.add(status);
			}
			yearStatus.setData(rptStatusList);
			rptYearStatusList.add(yearStatus);
			m++;
		}
		return gson.toJson(rptYearStatusList);
	}
	
	
	
	public void initializeUserBlankReport(UsrUser user, String[] years) {
		List<CfsRptItem> rptItems = this.getCfsRptItems();
		for (CfsRptItem item : rptItems){
			CfsRptData data=this.getCfsRptDataByCode(item.getCode(), user.getId(), item.getCfsRptTypeCode());
			if(data == null){
				data =new CfsRptData();
				data.setUsrId(user.getId());
				data.setCreatedBy(user.getUsername());
				data.setCreatedDate(Calendar.getInstance().getTime());
				data.setLastModifiedBy(user.getUsername());
				data.setLastModifiedDate(Calendar.getInstance().getTime());
				data.setCfsRptTypeId(item.getCfsRptTypeId());
				data.setCfsRptTypeCode(item.getCfsRptTypeCode());
				data.setCode(item.getCode());
				data.setName(item.getName());
			}
			data.setAmount(this.getBlankUsrRptAmount(item, years, data.getAmount()));
			this.saveOrUpdateCfsRptData(data);
		}
	}
	
	public void initializeBlankUsrMetric(UsrUser user, String[] years){
		List<CfsMetric> metricList = this.findCfsMetricList();
		for (CfsMetric metric : metricList){
			CfsUsrMetric userMetric = this.cfsUsrMetricDAO.getUserMetricByMetricId(user, metric.getId());
			if (userMetric == null) {
				userMetric = new CfsUsrMetric();
				userMetric.setCfsMetricCode(metric.getCode());
				userMetric.setCfsMetricName(metric.getName());
				userMetric.setMeasurementInterval(metric.getMeasurementInterval());
				userMetric.setUsrId(user.getId());
				userMetric.setCfsMetricId(metric.getId());
			}
			
			List<MetricAmount> list = this.getMetricAmountList(userMetric);
			
			if (list == null) {
				list = new ArrayList<MetricAmount>();
			}
			
			for (String year : years) {
				MetricAmount metricAmount = new MetricAmount();
				metricAmount.setCode(userMetric.getCfsMetricCode());
				metricAmount.setYear(Integer.parseInt(year));
				metricAmount.setValue((double) 0);
				list.add(metricAmount);
			}
			userMetric.setMetricValues(gson.toJson(list));
			this.cfsUsrMetricDAO.save(userMetric);
		}
	}
	
	private String getBlankUsrRptAmount(CfsRptItem item, String[] year,String amount){
		List<ReportAmount> amountList = null;
		amountList = this.getReportAmountList(amount);
		
		if (amountList == null || amountList.size()<1) {
			amountList = new ArrayList<ReportAmount>();
		}
		
		for (int i=0; i<year.length; i++) {
			ReportAmount am = new ReportAmount();
			am.setRpt(item.getCfsRptTypeCode());
			am.setCode(item.getCode());
			am.setYear(Integer.parseInt(year[i]));
			am.setValue((double) 0);
			amountList.add(am);
		}
		String json = gson.toJson(amountList);
		return json;
	}
	
	@Override
	public String getRptJsonDataByRptCode(UsrUser user, String rptTypeCode) {
		List<CfsRptData> cfsRptDataList = this.findCfsRptDataByUseridTypeCode(user.getId(), rptTypeCode);
		List<ReportAmount> amountList = new ArrayList<ReportAmount>();
		for(int i=0;i<cfsRptDataList.size();i++){
			List<ReportAmount> aList = new ArrayList<ReportAmount>();
			aList=this.getReportAmountList(cfsRptDataList.get(i));
			amountList.addAll(aList);
		}
		String json=gson.toJson(amountList);
		return json;
	}

	
}
