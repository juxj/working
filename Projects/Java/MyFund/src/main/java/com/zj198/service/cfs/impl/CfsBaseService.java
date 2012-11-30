package com.zj198.service.cfs.impl;

import java.util.Calendar;
import java.util.List;

import com.google.gson.Gson;
import com.zj198.dao.CfsMetricDAO;
import com.zj198.dao.CfsRptDataDAO;
import com.zj198.dao.CfsRptItemDAO;
import com.zj198.dao.CfsRptParamsDAO;
import com.zj198.dao.CfsRptPropDAO;
import com.zj198.dao.CfsRptStyleDAO;
import com.zj198.dao.CfsRptTypeDAO;
import com.zj198.dao.CfsUsrMetricDAO;
import com.zj198.dao.CfsUsrRptDAO;
import com.zj198.model.CfsMetric;
import com.zj198.model.CfsRptData;
import com.zj198.model.CfsRptItem;
import com.zj198.model.CfsRptParams;
import com.zj198.model.CfsRptProp;
import com.zj198.model.CfsRptStyle;
import com.zj198.model.CfsRptType;
import com.zj198.model.CfsUsrMetric;
import com.zj198.model.CfsUsrRpt;
import com.zj198.model.UsrUser;
import com.zj198.model.vo.MetricAmount;
import com.zj198.model.vo.ReportAmount;
import com.zj198.model.vo.YearStatus;

public class CfsBaseService {

	protected CfsRptDataDAO cfsRptDataDAO;
	protected CfsRptItemDAO cfsRptItemDAO;
	protected CfsRptParamsDAO cfsRptParamsDAO;
	protected CfsRptPropDAO cfsRptPropDAO;
	protected CfsRptTypeDAO cfsRptTypeDAO;
	protected CfsUsrRptDAO cfsUsrRptDAO;
	protected CfsMetricDAO cfsMetricDAO;
	protected CfsRptStyleDAO cfsRptStyleDAO;
	protected CfsUsrMetricDAO cfsUsrMetricDAO;
	protected  Gson gson = new Gson();
	
	
	protected List<ReportAmount> getReportAmountList(CfsRptData cfsRptData){
		java.lang.reflect.Type type = new com.google.gson.reflect.TypeToken<List<ReportAmount>>() {}.getType();
		return gson.fromJson(cfsRptData.getAmount(), type);
	}
	
	protected List<ReportAmount> getReportAmountList(String json){
		java.lang.reflect.Type type = new com.google.gson.reflect.TypeToken<List<ReportAmount>>() {}.getType();
		return gson.fromJson(json, type);
	}
	
	protected List<MetricAmount> getMetricAmountList(CfsUsrMetric userMetric) {
		java.lang.reflect.Type type = new com.google.gson.reflect.TypeToken<List<MetricAmount>>() {}.getType();
		return gson.fromJson(userMetric.getMetricValues(), type);
	}
	
	protected List<YearStatus> getFiscalYearList(UsrUser user, String rptTypeCode) {
		java.lang.reflect.Type type = new com.google.gson.reflect.TypeToken<List<YearStatus>>() {}.getType();
		CfsUsrRpt cfsUsrRpt = this.getCfsUsrRptByUserId(user.getId());
		return gson.fromJson(cfsUsrRpt.getFiscalYearStatus(), type);
	}
	
	protected List<YearStatus> getFiscalYearList(CfsUsrRpt cfsUsrRpt) {
		java.lang.reflect.Type type = new com.google.gson.reflect.TypeToken<List<YearStatus>>() {}.getType();
		return gson.fromJson(cfsUsrRpt.getFiscalYearStatus(), type);
	}
	
	public List<CfsUsrMetric> getCfsUserMetricListByUser(UsrUser user) {
		return this.cfsUsrMetricDAO.getCfsUsrMetricListByUser(user.getId());
	}
	
	public CfsUsrRpt getCfsUsrRptByUserId(Integer userId) {
		return cfsUsrRptDAO.getCfsUsrRptByUserId(userId);
	}

	public CfsRptParams getRptParams() {
		return cfsRptParamsDAO.get(1);
	}

	public CfsRptData getCfsRptDataByCode(String code,Integer userid,String typeCode) {
		return cfsRptDataDAO.getCfsRptDataByCode(code, userid, typeCode);
	}

	public List<CfsRptType> findCfsRptTypeList() {
		return cfsRptTypeDAO.findAll();
	}

	public List<CfsRptData> findCfsRptDataByUseridTypeCode(Integer userid, String code) {
		return cfsRptDataDAO.findCfsRptDataByUseridTypeCode(userid, code);
	}

	public List<CfsRptStyle> findRptStyleByVersionTypeCode(String version, String code) {
		return cfsRptStyleDAO.findRptStyleByVersionTypeCode(version, code);
	}

	public List<CfsRptItem> findRptItemByTypeCode(String code) {
		return cfsRptItemDAO.findRptItemByTypeCode(code);
	}

	public CfsRptType getRptTypeByCode(String code) {
		return cfsRptTypeDAO.getRptTypeByCode(code);
	}
	
	public List<CfsRptProp> getCfsRptPropListByType(String rptTypeCode) {
		return this.cfsRptPropDAO.getCfsRptPropListByType(rptTypeCode);
	}
	
	public void saveOrUpdateCfsRptData(CfsRptData report) {
		cfsRptDataDAO.saveOrUpdate(report);
	}
	
	public List<CfsMetric> findCfsMetricList() {
		return this.cfsMetricDAO.findAll();
	}

	public void saveOrUpdateCfsUsrRpt(CfsUsrRpt cfsUsrRpt) {
		cfsUsrRpt.setLastModifiedTime(Calendar.getInstance().getTime());
		cfsUsrRptDAO.saveOrUpdate(cfsUsrRpt);
	}
	
	public List<CfsRptItem> getCfsRptItems(){
		return this.cfsRptItemDAO.findAll();
	}
	
	public void setCfsRptDataDAO(CfsRptDataDAO cfsRptDataDAO) {
		this.cfsRptDataDAO = cfsRptDataDAO;
	}
	public void setCfsRptItemDAO(CfsRptItemDAO cfsRptItemDAO) {
		this.cfsRptItemDAO = cfsRptItemDAO;
	}
	public void setCfsRptParamsDAO(CfsRptParamsDAO cfsRptParamsDAO) {
		this.cfsRptParamsDAO = cfsRptParamsDAO;
	}
	public void setCfsRptPropDAO(CfsRptPropDAO cfsRptPropDAO) {
		this.cfsRptPropDAO = cfsRptPropDAO;
	}
	public void setCfsRptTypeDAO(CfsRptTypeDAO cfsRptTypeDAO) {
		this.cfsRptTypeDAO = cfsRptTypeDAO;
	}
	public void setCfsUsrRptDAO(CfsUsrRptDAO cfsUsrRptDAO) {
		this.cfsUsrRptDAO = cfsUsrRptDAO;
	}
	public void setCfsMetricDAO(CfsMetricDAO cfsMetricDAO) {
		this.cfsMetricDAO = cfsMetricDAO;
	}
	public void setCfsRptStyleDAO(CfsRptStyleDAO cfsRptStyleDAO) {
		this.cfsRptStyleDAO = cfsRptStyleDAO;
	}
	public void setCfsUsrMetricDAO(CfsUsrMetricDAO cfsUsrMetricDAO) {
		this.cfsUsrMetricDAO = cfsUsrMetricDAO;
	}
	
	
}
