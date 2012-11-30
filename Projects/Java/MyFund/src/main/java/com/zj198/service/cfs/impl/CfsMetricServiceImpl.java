package com.zj198.service.cfs.impl;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;

import org.apache.commons.lang3.StringUtils;

import com.google.gson.Gson;
import com.zj198.model.CfsMetric;
import com.zj198.model.CfsRptFormular;
import com.zj198.model.CfsRptFormularGroup;
import com.zj198.model.CfsRptProp;
import com.zj198.model.CfsRptStyle;
import com.zj198.model.CfsUsrMetric;
import com.zj198.model.UsrUser;
import com.zj198.model.vo.CfsComparedReport;
import com.zj198.model.vo.CfsComparedValue;
import com.zj198.model.vo.MetricAmount;
import com.zj198.model.vo.YearStatus;
import com.zj198.service.cfs.CfsMetricService;
import com.zj198.util.StringUtil;

public class CfsMetricServiceImpl extends CfsBaseService implements CfsMetricService{

	public List<CfsComparedReport> getComparedReportList(UsrUser user, String rptTypeCode, Integer year){
		
		List<YearStatus> yearStatusList = this.getFiscalYearList(user, rptTypeCode);
		String version = "";
		for (YearStatus yearStatus : yearStatusList){
			if (yearStatus.getYear().intValue()==year){
				version = yearStatus.getVersion();
				break;
			}
		}
		
		List<CfsRptStyle> cfsRptStyleList = this.findRptStyleByVersionTypeCode(version, rptTypeCode);
		List<CfsComparedReport> cfsComparedReportList = this.getBlankComparedReportWithItems(cfsRptStyleList);
		List<CfsComparedValue> cfsComparedValueList = this.getCfsComparedValueList(rptTypeCode, user.getId(), year);
		Map<String, List<Double>> preValueMap = new HashMap<String, List<Double>>();
		Map<String, List<Double>> currValueMap =  new HashMap<String, List<Double>>();
		for (CfsComparedReport cr : cfsComparedReportList) {
			if (cr.getIsDataItem().equals("1")) {
				Double preYearValue = this.getRptCellData(user.getId(), rptTypeCode, cr.getItemCode(), year-1);
				Double currYearValue = this.getRptCellData(user.getId(), rptTypeCode, cr.getItemCode(), year);
				Double preBaseValue = this.getComparedBaseValue(cfsComparedValueList, year-1, cr.getItemPropCode());
				Double currBaseValue = this.getComparedBaseValue(cfsComparedValueList, year, cr.getItemPropCode());
				
				cr.setPreYearValue(preYearValue);
				cr.setCurrYearValue(currYearValue);
				cr.setPreYearPcnt(preYearValue/preBaseValue);
				cr.setCurrYearPcnt(currYearValue/currBaseValue);
				cr.setDiffValue(cr.getCurrYearPcnt()-cr.getPreYearPcnt());
				if (StringUtil.isNullOrBlank(cr.getHasFormular()) && cr.getIsDataItem().equals("1")) {
					if (!this.isZero(cr.getCurrYearPcnt())) {
						String rankCode = cr.getRankCode();
						List<Double> list =  preValueMap.get(rankCode);
						if (list == null) {
							list = new ArrayList<Double>();
						}
						list.add(cr.getCurrYearPcnt());
						preValueMap.put(rankCode, list);
					}
					
					if (!this.isZero(cr.getDiffValue())) {
						String rankCode = cr.getRankCode();
						List<Double> list =  currValueMap.get(rankCode);
						if (list == null) {
							list = new ArrayList<Double>();
						}
						list.add(cr.getDiffValue());
						currValueMap.put(rankCode, list);
					}
				}
			}
		}
		cfsComparedReportList = this.setConclusions(cfsComparedReportList, preValueMap, currValueMap);
		return cfsComparedReportList;
	}
	
	private boolean isZero(Double val) {
		return Math.abs(val.doubleValue())<0.00001;
	}
	
	private List<CfsComparedReport> setConclusions(List<CfsComparedReport> cfsComparedReportList, 
			Map<String, List<Double>> preValueMap, Map<String, List<Double>> currValueMap ){
		
		for (CfsComparedReport cr : cfsComparedReportList) {
			String rankCode = cr.getRankCode();
			
			if (StringUtil.isNullOrBlank(cr.getHasFormular()) && cr.getIsDataItem().equals("1")) {
				if (!this.isZero(cr.getPreYearPcnt())) {
					cr.setRank1(this.getRankOrder(preValueMap.get(rankCode), cr.getCurrYearPcnt(), 1));
				}
				if (!this.isZero(cr.getCurrYearPcnt())) {
					cr.setRank2(this.getRankOrder(currValueMap.get(rankCode), cr.getDiffValue(), 1));
				}
				
				if (cr.getRank1() != null && cr.getRank2() != null) {
					if ((cr.getRank1().intValue()<=5) || (cr.getRank2().intValue()<=5)) {
						cr.setConclusion("关注");
					}
				}
			}
		}
		return cfsComparedReportList;
	}
	
	private Integer getRankOrder(List<Double> list, Double value, Integer direction) {
		Integer result =0;
		for (Double d : list) {
			if (direction.intValue() == 0) {
				if (d.doubleValue()<value.doubleValue()) {
					result ++;
				}
			} else {
				if (d.doubleValue()>value.doubleValue()) {
					result ++;
				}
			}
		}
		return result+1;
	}
	
	private Double getComparedBaseValue(List<CfsComparedValue> cfsComparedValueList, Integer year, String propCode){
		Double value = 0.0;
		for (CfsComparedValue cv : cfsComparedValueList) {
			if (cv.getYear().intValue() == year.intValue()
					&& cv.getPropItemCode().equals(propCode)) {
				value = cv.getValue();
			}
		}
		return value;
	}
	
	private List<CfsComparedValue> getCfsComparedValueList(String rptTypeCode, Integer userId, Integer year) {
		List<CfsRptProp> cfsRptPropList = this.getCfsRptPropListByType(rptTypeCode);
		List<CfsComparedValue> cfsComparedValueList = new ArrayList<CfsComparedValue>();
		for (CfsRptProp prop : cfsRptPropList) {
			if (prop.getRankCode() != null) {
				for (int m=year-1; m<=year; m++) {
					CfsComparedValue cv = new CfsComparedValue();
					cv.setPropItemCode(prop.getCode());
					cv.setYear(m);
					Double value = 0.0;
					String[] comparedDataCode = prop.getComparedDataCode().split(",");
					int length = comparedDataCode.length;
					for (int i=0; i<length; i++) {
						value = value + this.getRptCellData(userId, rptTypeCode, comparedDataCode[i], m);
					}
					cv.setValue(value);
					cfsComparedValueList.add(cv);
				}
			}
		}
		return cfsComparedValueList;
	}
	
	private List<CfsComparedReport> getBlankComparedReportWithItems(List<CfsRptStyle> cfsRptStyleList){
		List<CfsComparedReport> cfsComparedReportList = new ArrayList<CfsComparedReport>();
		
		for (CfsRptStyle rptStyle : cfsRptStyleList) {
			if (rptStyle.getRankCode() != null) {
				CfsComparedReport cr = new CfsComparedReport();
				cr.setItemCode(rptStyle.getCode());
				cr.setItemName(rptStyle.getName());
				cr.setItemPropCode(rptStyle.getCfsRptPropCode());
				if (StringUtils.isNotBlank(rptStyle.getFormular())){
					cr.setHasFormular("1");
				}
				cr.setIsDataItem(rptStyle.getIsDataItem());
				cr.setColumnId(rptStyle.getColumnId());
				cfsComparedReportList.add(cr);
				cr.setRankCode(rptStyle.getRankCode());
			}
		}
		return cfsComparedReportList;
	}
	
	@Override
	public void saveGeneratedMetricReports(Integer userId, Integer fiscalYear) {
		List<CfsMetric> cfsMetricList = cfsMetricDAO.findAll();
		for (CfsMetric metric: cfsMetricList){
			if (metric.getIsRpt()) {
				this.generateMetricReportByMetric(metric,userId , fiscalYear);
			}
		}
	}
	
	private Map<String, Object> generateMetricReportByMetric(CfsMetric metric, Integer userId, Integer rptYear){
		Gson gson = new Gson();
		String[] years = metric.getYears().split(",");
		String[] fixedItems = metric.getFixedItems().split(",");
		java.lang.reflect.Type type = new com.google.gson.reflect.TypeToken<List<CfsRptFormularGroup>>() {}.getType();    
		List<CfsRptFormularGroup> groups = gson.fromJson(metric.getValueItems(), type);
		List<String> titles = new ArrayList<String>();
		titles.add("Items");
		int cnt = groups.size();
		CfsRptFormularGroup group = groups.get(0);
		List<CfsRptFormular> formulars = group.getFormulars();
		List<Map<String, Double>> yearDataList = new ArrayList<Map<String, Double>>();
		
		Map<String, Double> totalValues = new HashMap<String, Double>();
		Map<String, Double> yearData = null;
		if (cnt>1) {
			int year = rptYear.intValue() + StringUtil.getMinValue(years) -1;
			titles.add(String.valueOf(year));
			yearData = this.getYearData(userId, 0, year, formulars, totalValues);
			totalValues.putAll(yearData);
			yearData = StringUtil.getSortedMapByKey(yearData, 1);
			yearDataList.add(yearData);
			group = groups.get(1);
			formulars = group.getFormulars();
		}
		
		int n = 1;
		for(String year : years) {
			int tmp = Integer.valueOf(year)+rptYear;
			titles.add(String.valueOf(tmp));
			List<CfsRptFormular> updatedFormulars = this.updateFormularId(n, formulars);
			yearData = this.getYearData(userId, n, tmp, updatedFormulars, totalValues);
			this.updateMetricData(userId, updatedFormulars, tmp, yearData);
			yearDataList.add(StringUtil.getSortedMapByKey(yearData, 1));
			n++;
		}
		List<Object> rows = this.getRows(fixedItems, yearDataList);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("title", titles);
		result.put("data", rows);
		return result;
	}
	
	private List<Object> getRows(String[] fixedItems, List<Map<String, Double>> yearDataList){
		List<Object> rows = new ArrayList<Object>();
		
		int n = 0;
		for(String item : fixedItems ){
			List<String> row = new ArrayList<String>();
			row.add(item);
			for(Map<String, Double> map : yearDataList) {
				Object[] keySet =  (Object[]) map.keySet().toArray();
				Object key = keySet[n];
				double value = 0;
				try {
					value = map.get(key).floatValue();
				} catch(Exception e) {
					
				}
				DecimalFormat df = new DecimalFormat("###############.00");
				row.add(String.valueOf(df.format(value)));
			}
			rows.add(row);
			n++;
		}
		
		return rows;
	}
	
	private Map<String, Double> getYearData(Integer userId, 
			int seq, int year, 
				List<CfsRptFormular> formulars, Map<String, Double> totalValues){
		Map<String, Double> map = new HashMap<String, Double>();
		List<String> defaultItems = new ArrayList<String>();
		for (CfsRptFormular formular : formulars){
			int dataType = formular.getType();
			if (dataType == -1) {
				defaultItems.add(formular.getId());
			}
			Map<String, Double> cellData = this.getCellData(userId, seq, year, formular, totalValues);
			map.putAll(cellData);
			totalValues.putAll(cellData);
		}
		
		for (String item : defaultItems){
			map.remove(item);
		}
		
		return map;
	}
	
	private Map<String, Double> getFormularCellData(CfsRptFormular formular, Map<String, Double> totalValues){
		Map<String, Double> map = new HashMap<String, Double>();
		String cellFormular = formular.getFormular();
		for (String key : totalValues.keySet()){
			if (totalValues.get(key) != null) {
				cellFormular = cellFormular.replaceAll(key, totalValues.get(key).toString());
			}
		}
		
		ScriptEngineManager manager = new ScriptEngineManager();
		ScriptEngine engine = manager.getEngineByName("js");
		
		Double value = 0.0;
		try{
			String result = engine.eval(cellFormular).toString();
			if (result != null) {
				value = Double.valueOf(result);
			}
		}  catch (Exception e){
		
		}
		map.put(formular.getId(), value);
		return map;
	}
	
	private Map<String, Double> getCellData(Integer userId, 
			int seq, int year, CfsRptFormular formular, Map<String, Double> totalValues){
		
		Map<String, Double> map = null;
		
		int dataType = formular.getType();
		int ignore = formular.getIgnore();
		
		if (ignore == dataType) {
			dataType = -1;
		}
		
		if (dataType ==0) {
			map = this.getRptCellData(userId, formular, year);
		}
		
		if (dataType ==1 ){
			map = this.getFormularCellData(formular, totalValues);
		}
		
		if (dataType < 0) {
			map = new HashMap<String, Double>();
			map.put(formular.getId(), formular.getValue());
		}
		return map;
	}
	
	private void updateMetricData(Integer userId,
			List<CfsRptFormular> formulars, Integer year, Map<String, Double> values) {
		for (CfsRptFormular formular : formulars) {
			String metricCode = formular.getMetric();
			if (StringUtils.isNotBlank(metricCode)){
				CfsUsrMetric userMetric = this.cfsUsrMetricDAO.getUserMetricByMetricCode(userId, metricCode);
				Gson gson = new Gson();
				java.lang.reflect.Type type = new com.google.gson.reflect.TypeToken<List<MetricAmount>>() {}.getType();
				List<MetricAmount> metricValues = gson.fromJson(userMetric.getMetricValues(), type);
				List<MetricAmount> tmp = new ArrayList<MetricAmount>();
				for (MetricAmount metricAmount : metricValues) {
					if (metricAmount.getYear().intValue() == year) {
						metricAmount.setValue(values.get(formular.getId()));
					}
					tmp.add(metricAmount);
				}
				userMetric.setMetricValues(gson.toJson(tmp));
				this.cfsUsrMetricDAO.save(userMetric);
			}
		}
	}
	
	private List<CfsRptFormular> updateFormularId(int n, List<CfsRptFormular> formulars){
		Gson gson = new Gson();
		String json = gson.toJson(formulars);
		json = json.replaceAll("n-1", String.valueOf(n-1));
		json = json.replaceAll("yn", "y"+String.valueOf(n));
		java.lang.reflect.Type type = new com.google.gson.reflect.TypeToken<List<CfsRptFormular>>() {}.getType();    
		return gson.fromJson(json, type);
	}

	public Map<String, Double> getRptCellData(Integer userId, CfsRptFormular formular, Integer year) {
		Map<String, Double> map = new HashMap<String, Double>();
		map.put(formular.getId(), this.getRptCellData(userId, formular.getRpt(), formular.getCode(), year));
		return map;
	}
	
	private Double getRptCellData(Integer userId, String cfsRptTypeCode, String itemCode, Integer year) {
		return this.cfsRptDataDAO.getRptCellData(userId, cfsRptTypeCode, itemCode, year);
	}

	
}
