package com.zj198.service.cfs;

import java.util.List;
import java.util.Map;

import com.zj198.model.CfsMetric;
import com.zj198.model.CfsRptData;
import com.zj198.model.CfsRptFormular;
import com.zj198.model.CfsRptItem;
import com.zj198.model.CfsRptParams;
import com.zj198.model.CfsRptProp;
import com.zj198.model.CfsRptStyle;
import com.zj198.model.CfsRptType;
import com.zj198.model.CfsUsrRpt;
import com.zj198.model.UsrUser;
import com.zj198.model.vo.YearStatus;

public interface ReportService {
	/**
	 * CfsRptData.java     --报表
	 * CfsRptItem.java     --报表项目
	 * CfsRptParams.java   --参数
	 * CfsRptProp.java     --项目属性
	 * CfsRptType.java     --报表类型
	 * CfsUsrRpt.java      --用户所要填写的报表
	 */
	/**查询用户有没有 报表记录*/
	public CfsUsrRpt getCfsUsrRptByUserId(Integer userId);
	/**获取一些报表的参数*/
	public CfsRptParams getRptParams();
	/**更改报表状态等*/
	public void saveOrUpdateCfsUsrRpt(CfsUsrRpt cfsUsrRpt);
	/**增加用户会计年度报表*/
	public void saveOrUpdateCfsRptData(CfsRptData report);
	/**根据cfsRptItem.code usr_id and code and cfs_rpt_type_code取到单条数据*/
	public CfsRptData getCfsRptDataByCode(String code,Integer userid,String typeCode);
	/**初始化    一个报表:*/
	public void initializeUserBlankReport(UsrUser user,String[] years);
	/**取出   版本的报表 */
	public List<CfsRptItem> getCfsRptItems();
	/**取出   版本的报表 */
	public List<CfsRptType> findCfsRptTypeList();
	
	public List<CfsMetric> findCfsMetricList();
	
	/**
	 * 检查未完成的报表,返回List<YearStatus>.
	 * @param user
	 * @return
	 */
	public List<YearStatus> getUserReportsByCompletionStatus(UsrUser user, Integer completionStatus);
	
	/**初始化或更新用户的报表*/
	public void saveInitializeUserReports(UsrUser user, String[] fiscalYears, String[] versions);
	
	/** 根据userid  和typcode{01:资产负债表,02:利润及利润分配表,03:现金流量表}  取出用报表*/
	public List<CfsRptData> findCfsRptDataByUseridTypeCode(Integer userid,String code);
	
	/**根据报表版本version 和报表类型 typecode {01:资产负债表,02:利润及利润分配表,03:现金流量表} 取出报表样式*/
	public List<CfsRptStyle> findRptStyleByVersionTypeCode(String version,String code);
	
	/**根据报表版本version 和报表类型 typecode {01:资产负债表,02:利润及利润分配表,03:现金流量表} 取出报表项目*/
	public List<CfsRptItem> findRptItemByTypeCode(String code);
	/**根据报表类型 code {01:资产负债表,02:利润及利润分配表,03:现金流量表} 取出报表类型属性*/
	public CfsRptType getRptTypeByCode(String code);
	/**更新报表数据   cfsRptData*/
	
	public List<CfsRptProp> getCfsRptPropListByType(String rptTypeCode);
	
	public String getRptJsonDataByRptCode(UsrUser user, String rptTypeCode);
	
}