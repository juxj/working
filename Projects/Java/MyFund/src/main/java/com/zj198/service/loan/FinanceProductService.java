package com.zj198.service.loan;

import java.util.List;

import com.zj198.action.loan.model.FindFinanceAdminSpModel;
import com.zj198.action.loan.model.PreviewFinanceProSrModel;
import com.zj198.model.PrdDatafileList;
import com.zj198.model.PrdExtendsProperty;
import com.zj198.model.PrdFinance;
import com.zj198.model.vo.FinanceAreaModel;
import com.zj198.model.vo.FinanceIndustryModel;
import com.zj198.service.loan.model.FinanceProductSpModel;
import com.zj198.service.loan.model.FinanceProductSrModel;
import com.zj198.util.Pager;

/**
 * @author 岳龙
 * Description:
 * CreateAuthor:岳龙
 * CreateDate:2012-7-05 14:54:57
 */
public interface FinanceProductService {

	public List<PrdFinance> findFinanceImportent(Integer number);
	public FinanceProductSrModel saveFinance(FinanceProductSpModel spModel);
	public void searchDateFile();
	
	/**
	 * 查询产品结果
	 * @param obj
	 * @param pageSize
	 * @param pageNo
	 * @return
	 */
	public Pager findProByCond(int pageNo, int pageSize, Integer financeType, String purposeType, Long financeAmount, Integer financeDate, String mortgageType, String userType, String checkTime, String companyAllAsset, String creditAcount, String experience,
 String needEnsure, String operatIncome, Integer settingYear, String bankSalaryList, String repaymentType, Integer runningArea, Integer industryId, Integer childId, Integer selectArea);
	
	/**
	 * 查询资料清单
	 * @return
	 */
	public List<PrdDatafileList> findDataFileListAll();
	
	public List<PrdFinance> findFinanceByUser(Integer userId) ;
	public PrdFinance getFinance(Integer id);
	
	public List<FinanceAreaModel> findFiananceArea(Integer financeId);
	public List<FinanceIndustryModel> findFiananceInducty(Integer financeId);
	public FinanceProductSpModel getFinanceProductToEdit(Integer productId);
	public Pager findFinanceAdmin(FindFinanceAdminSpModel spModel);
	public void updateFinanceStatus(PrdFinance pro);

	/**
	 * 金融机构产品推荐
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @param pageNo
	 * @param pageSize
	 * @param wherejpql
	 * @param queryParams
	 * @param orderby
	 * @return
	 */
	public List<PrdFinance> getRecProByLoan(Object[] queryParams);

	/**
	 * 管理员推荐产品
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-7-20| 上午11:28:29
	 * @param whereHql
	 * @return
	 */
	public List<PrdFinance> recomPro(Object[] params);

	/**
	 * 管理员推荐产品
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-8-3| 下午2:35:28
	 * @param financeType
	 * @param loanAmount
	 * @param loanMonth
	 * @param orgId
	 * @return
	 */
	public List<PrdFinance> recomPro(Integer financeType, Long loanAmount, Integer loanMonth, String orgId);
	public PreviewFinanceProSrModel priviewFinance(FinanceProductSpModel spModel);
	public FinanceProductSrModel updateFinance(FinanceProductSpModel spModel);
	public void updateRecommendFinance(PrdFinance product);
	public List<PrdExtendsProperty> getFinancePropertys(Integer financeId);
}
