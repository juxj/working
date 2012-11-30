package com.zj198.action.cfs;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.zj198.model.CfsRptData;
import com.zj198.model.CfsRptItem;
import com.zj198.model.CfsRptParams;
import com.zj198.model.CfsRptStyle;
import com.zj198.model.CfsRptType;
import com.zj198.model.CfsUsrRpt;
import com.zj198.model.UsrUser;
import com.zj198.model.vo.ReportAmount;
import com.zj198.model.vo.RptStatus;
import com.zj198.model.vo.YearStatus;
import com.zj198.service.cfs.ReportService;
import com.zj198.util.DateUtil;
import com.zj198.util.StringUtil;

/**
 * FinancingAnalysisAction类
 */
public class CfsReportAction extends CfsBaseAction  {
	private ReportService reportService;
	private String[] versions;
	
	private List<CfsRptStyle> rptStyles;
	private List<String> years;
	private String[] fiscalYears;
	private Map<String,List<String>> mapList;
	private String code;  //生成哪种类型的报表    code {01:资产负债表,02:利润及利润分配表,03:现金流量表}
	private Integer columns;  //各项目在报表中的列位置
	private String json;   //某一年份或两年的报表数据
	private Integer dataYear;   //要取当前年份的报表
	private String inputYaers;   //报表中有几年的报表   0   1
	private CfsRptType cfsRptType;
	/**json*/
	Gson gson = new Gson();
	
	/**查询用户是否有报表需要填写    未发现数据则需初始化*/
	@Override
	public String execute(){
		return null;
	}
	
	public String showInitializePage() {
		UsrUser user = this.getSessionUser();
		CfsUsrRpt cfsUsrRpt = reportService.getCfsUsrRptByUserId(user.getId());
		int currYear =DateUtil.getStringByLastYear(Calendar.getInstance().getTime());
		CfsRptParams params= reportService.getRptParams();
		int minYears= params.getMinYears();
		versions = params.getVersions().split(",");
		years=new ArrayList<String>();
		
		for(int i=0;i<minYears;i++){
			years.add(String.valueOf(currYear-i));
		}
		
		List<String> tmp = new ArrayList<String>();
		if(cfsUsrRpt != null){
			String[] fiscalYears = cfsUsrRpt.getFiscalYears().split(",");
			for (String year: years) {
				boolean existing = false;
				for (String fiscalYear : fiscalYears){
					if (fiscalYear.trim().equals(year.trim())) {
						existing = true;
					}
				}
				if (!existing) {
					tmp.add(year);
				}
			}
			years = tmp;
		}
		
		if(years.size() == 0){
			return "showRptsInProcess";
		}
		return "initialize";
		
	}
	
	public String saveUsrRptConfig(){
		Integer size = this.fiscalYears.length;
		versions = new String[size];
		if (size>0){
			if (this.checkContinousOfYears(fiscalYears)) {
				int m = 0;
				for (String year : fiscalYears){
					String key = "version_"+year;
					versions[m] = this.getRequestValue(key);
					m++;
				}
				UsrUser user = this.getSessionUser();
				this.reportService.saveInitializeUserReports(user, fiscalYears, versions);
			} else {
				return this.showInitializePage();
			}
		} else {
			// raise errors.
		}
		return "showRptsInProcess";
	}
	
	
	/**检查用户可填的报表*/
	public String showRptsInProcess(){
		UsrUser user = this.getSessionUser();
		CfsUsrRpt cfsUsrRpt=reportService.getCfsUsrRptByUserId(user.getId());
		String yearStatus = cfsUsrRpt.getFiscalYearStatus();
		java.lang.reflect.Type type = new com.google.gson.reflect.TypeToken<List<YearStatus>>() {}.getType();    
		List<YearStatus> list = gson.fromJson(yearStatus, type);
		int j=0;
		years=new ArrayList<String>();
		mapList=new HashMap<String, List<String>>();
		for(YearStatus ys : list){
			j=0;
			List<String> statuslist= new ArrayList<String>();
			for(int i=0;i<ys.getData().size();i++){
				if(ys.getData().get(i).getStatus() == 0 || ys.getData().get(i).getStatus() == 1){
					statuslist.add(ys.getData().get(i).getCode());
					j=j+1;
				}
			}
			if( j != 0){
				years.add(ys.getYear().toString());
				mapList.put(ys.getYear().toString(), statuslist);
			}
		}
		
		if (years.size()==0) {
			return "showCompletedFiscalYears";
		}
		return "reports_in_process";
	}
	
	/**生成未填写的报表*/
	public String showReportForm(){
		ActionContext ctx = ActionContext.getContext();
		UsrUser user = (UsrUser)ctx.getSession().get("_user");
		cfsRptType = this.reportService.getRptTypeByCode(code);
		String internalValidation = cfsRptType.getInternalValidation();
		if (StringUtils.isNotBlank(internalValidation)){
			internalValidation = internalValidation.replace("\"", "\\\"");
			cfsRptType.setInternalValidation(internalValidation);
		}
		
		CfsUsrRpt cfsUsrRpt =reportService.getCfsUsrRptByUserId(user.getId());
		String yearStatus = cfsUsrRpt.getFiscalYearStatus();
		java.lang.reflect.Type type = new com.google.gson.reflect.TypeToken<List<YearStatus>>() {}.getType();    
		List<YearStatus> list = gson.fromJson(yearStatus, type);
		String version = "";
		for (YearStatus ys : list) {
			if (ys.getYear().intValue() == dataYear) {
				version = ys.getVersion();
			}
		}
		CfsRptType rptType =reportService.getRptTypeByCode(code);
		columns = rptType.getColumns();
		inputYaers = rptType.getInputYears();
		rptStyles=reportService.findRptStyleByVersionTypeCode(version, code);
		return "report";
	}
	
	/**解析提交的报表数据  并更改对应的报表*/
	public String saveReportData(){
		
		List<CfsRptItem> reportItems = this.reportService.findRptItemByTypeCode(code);
		
		for(CfsRptItem item : reportItems) {
			
			String key1="name_"+code+"_"+item.getCode()+"_"+Integer.valueOf(dataYear);
			String key2="name_"+code+"_"+item.getCode()+"_"+Integer.valueOf(dataYear-1);
			
			String currYearValue = this.getRequestValue(key1);
			String previousYearValue = this.getRequestValue(key2);
			
			CfsRptData cfsRptData = this.reportService.getCfsRptDataByCode(item.getCode(), this.getSessionUser().getId(), code);
			java.lang.reflect.Type type = new com.google.gson.reflect.TypeToken<List<ReportAmount>>() {}.getType();    
			List<ReportAmount> reportAmounts = gson.fromJson(cfsRptData.getAmount(), type);
			List<ReportAmount> tmp = new ArrayList<ReportAmount>();
			
			for (ReportAmount reportAmount : reportAmounts){
				
				if (StringUtils.isNotBlank(currYearValue)) {
					if (reportAmount.getYear().intValue() == dataYear.intValue()) {
						reportAmount.setValue(Double.valueOf(currYearValue));
					}
				}
				
				if (StringUtils.isNotBlank(previousYearValue)) {
					if (reportAmount.getYear().intValue() == dataYear.intValue() -1) {
						reportAmount.setValue(Double.valueOf(previousYearValue));
					}
				}
				tmp.add(reportAmount);
			}
			
			cfsRptData.setAmount(gson.toJson(tmp));
			this.reportService.saveOrUpdateCfsRptData(cfsRptData);
		}
		return "showRptsInProcess";
	}
	
	/**生成未填写的报表*/
	public String getReportDataByJson(){
		UsrUser user = this.getSessionUser();
		json = this.reportService.getRptJsonDataByRptCode(getSessionUser(), code);
		return "json";
	}
	
	//判断年份的连续性
	private boolean checkContinousOfYears(String [] value){
		UsrUser user = this.getSessionUser();
		CfsUsrRpt cfsUsrRpt = reportService.getCfsUsrRptByUserId(user.getId());
		
		if(cfsUsrRpt == null){
			cfsUsrRpt = new CfsUsrRpt();
		}
		if(fiscalYears.length>0){
			if(cfsUsrRpt.getFiscalYears() != null){
				List<String> oldYears = StringUtil.getStringList(cfsUsrRpt.getFiscalYears());
				List<String> newYears = new ArrayList<String>();
				for(int i=0;i<fiscalYears.length;i++){
					newYears.add(fiscalYears[i]);
				}
				for(int i=0;i<newYears.size();i++){
					Collections.sort(oldYears);
					if(Integer.parseInt(oldYears.get(oldYears.size()-1)) == Integer.parseInt(newYears.get(i))-1){
						oldYears.add(newYears.get(i));
						newYears.set(i, "0");
						i=-1;
						continue;
					}else if(Integer.parseInt(oldYears.get(0)) == Integer.parseInt(newYears.get(i))+1){
						oldYears.add(newYears.get(i));
						newYears.set(i, "0");
						i=-1;
						continue;
					}
				}
				for(int i=0;i<newYears.size();i++){
					if(!newYears.get(i).equals("0")){
						msg="请选择连续的年份";
						return false;
					}
				}
			}
		}
		return true;
	}
		
	//报表数据生成json
	private CfsRptData updateRepDataAmount(CfsRptData data,double value,Integer year){
		java.lang.reflect.Type type = new com.google.gson.reflect.TypeToken<List<ReportAmount>>() {}.getType();    
		List<ReportAmount> list = gson.fromJson(data.getAmount(), type);
		for (int i =0 ;i<list.size();i++) {
			if(list.get(i).getRpt().equalsIgnoreCase(data.getCfsRptTypeCode()) && list.get(i).getCode().equalsIgnoreCase(data.getCode()) && list.get(i).getYear()- year ==0){
				list.get(i).setValue(value);
			}
		}
		String json = gson.toJson(list);
		data.setAmount(json);
		return data;
	}
	//---------------get   and  set-------------------
	public void setReportService(ReportService reportService) {
		this.reportService = reportService;
	}
	public String[] getVersions() {
		return versions;
	}
	public List<CfsRptStyle> getRptStyles() {
		return rptStyles;
	}
	public List<String> getYears() {
		return years;
	}
	public Map<String, List<String>> getMapList() {
		return mapList;
	}
	public String getCode() {
		return code;
	}
	public Integer getColumns() {
		return columns;
	}
	public String getJson() {
		return json;
	}
	public Integer getDataYear() {
		return dataYear;
	}
	public String getInputYaers() {
		return inputYaers;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public void setDataYear(Integer dataYear) {
		this.dataYear = dataYear;
	}
	public void setFiscalYears(String[] fiscalYears) {
		this.fiscalYears = fiscalYears;
	}

	public CfsRptType getCfsRptType() {
		return cfsRptType;
	}

}
