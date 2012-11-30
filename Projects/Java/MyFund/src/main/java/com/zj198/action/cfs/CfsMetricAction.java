package com.zj198.action.cfs;

import java.util.ArrayList;
import java.util.List;

import com.zj198.model.CfsRptData;
import com.zj198.model.CfsRptProp;
import com.zj198.model.CfsRptStyle;
import com.zj198.model.CfsRptType;
import com.zj198.model.CfsUsrMetric;
import com.zj198.model.UsrUser;
import com.zj198.model.vo.CfsComparedReport;
import com.zj198.model.vo.RptStatus;
import com.zj198.model.vo.YearStatus;
import com.zj198.service.cfs.CfsMetricService;
import com.zj198.service.cfs.ReportService;

public class CfsMetricAction extends CfsBaseAction {

	private ReportService reportService;
	private CfsMetricService cfsMetricSerivce;
	private String[] fiscalYears;
	private Integer fiscalYear;
	private List<CfsUsrMetric> cfsUsrMetricList;
	private String rptCode;
	private List<CfsRptProp> cfsRptPropList;
	private List<CfsRptData> cfsRptDataList;
	private List<CfsRptStyle> cfsRptStyleList;
	private List<CfsComparedReport> cfsComparedReportList;
	private CfsRptType cfsRptType;

	public String showCompletedFiscalYears() {
		UsrUser user = this.getSessionUser();
		List<YearStatus>  yearStatusList = this.reportService.getUserReportsByCompletionStatus(user, 0);
		List<CfsRptType>  reportTypeList = this.reportService.findCfsRptTypeList();
		fiscalYears = new String[yearStatusList.size()];
		int m = 0;
		for (YearStatus yearStatus : yearStatusList) {
			List<RptStatus> list = yearStatus.getData();
			if (list.size()==reportTypeList.size()) {
				fiscalYears[m] = yearStatus.getYear().toString();
				m ++;
			}
		}
		return "completedReports";
	}
	
	public String showFinacingMetricReport()  {
		//this.cfsMetricSerivce.saveGeneratedMetricReports(this.getSessionUser().getId(), fiscalYear);
		this.cfsUsrMetricList = this.cfsMetricSerivce.getCfsUserMetricListByUser(this.getSessionUser());
		List<CfsUsrMetric> tmp = new ArrayList<CfsUsrMetric>();
		for(CfsUsrMetric userMetric : cfsUsrMetricList) {
			userMetric.setMetricValues(userMetric.getMetricValues().replace("\"", "\\\""));
			tmp.add(userMetric);
		}
		cfsUsrMetricList = tmp;
		return "finacingMetricReport";
	}
	
	public String showComparedReport(){
		this.cfsRptType = this.reportService.getRptTypeByCode(rptCode);
		//cfsRptPropList = this.reportService.getCfsRptPropListByType(rptCode);
		//cfsRptDataList = this.reportService.findCfsRptDataByUseridTypeCode(this.getSessionUser().getId(), rptCode);
		//cfsRptStyleList = this.reportService.findRptStyleByVersionTypeCode("2012", rptCode);
		cfsComparedReportList = this.cfsMetricSerivce.getComparedReportList(getSessionUser(), rptCode, fiscalYear);
		return "commonSizeRpt";
	}
	
	
	public List<CfsComparedReport> getCfsComparedReportList() {
		return cfsComparedReportList;
	}

	public CfsRptType getCfsRptType() {
		return cfsRptType;
	}

	public List<CfsRptStyle> getCfsRptStyleList() {
		return cfsRptStyleList;
	}

	public List<CfsRptData> getCfsRptDataList() {
		return cfsRptDataList;
	}

	public List<CfsRptProp> getCfsRptPropList() {
		return cfsRptPropList;
	}

	public void setReportService(ReportService reportService) {
		this.reportService = reportService;
	}

	public String[] getFiscalYears() {
		return fiscalYears;
	}

	public void setFiscalYear(Integer fiscalYear) {
		this.fiscalYear = fiscalYear;
	}

	public void setCfsMetricSerivce(CfsMetricService cfsMetricSerivce) {
		this.cfsMetricSerivce = cfsMetricSerivce;
	}

	public Integer getFiscalYear() {
		return fiscalYear;
	}

	public List<CfsUsrMetric> getCfsUsrMetricList() {
		return cfsUsrMetricList;
	}

	public void setRptCode(String rptCode) {
		this.rptCode = rptCode;
	}
	
	

}
