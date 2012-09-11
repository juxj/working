package com.zj198.dao;

import java.util.List;

import com.zj198.action.loan.model.FindFinanceAdminSpModel;
import com.zj198.model.PrdFinance;
import com.zj198.util.Pager;

public interface PrdFinanceDAO extends BaseDAO<PrdFinance, Integer> {

	public List<PrdFinance> findFinanceByUser(Integer userId);

	public Pager findFinanceAdmin(FindFinanceAdminSpModel spModel);

	public List<PrdFinance> getProByRec(Object[] queryParams);

	/**
	 * @description 根据proIds以 o.id in (1,2,3,4)这种方式得到产品集合
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-7-19| 下午1:45:39
	 * @param ids
	 * @return
	 */
	public List<PrdFinance> getListByIds(Object[] ids);

	/**
	 * 返回List集合
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-7-20| 上午11:37:16
	 * @param pageNo
	 * @param pageSize
	 * @param whereHql
	 * @param query
	 * @param orderby
	 * @return
	 */
	public List<PrdFinance> getByWhere(Object[] query);
	
	/**
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-8-3| 下午2:37:48
	 * @param financeType
	 * @param loanAmount
	 * @param loanMonth
	 * @param orgId
	 * @return
	 */
	public List<PrdFinance> recomPro(Integer financeType, Long loanAmount, Integer loanMonth, String orgId);

	public Pager findProByCond(int pageNo, int pageSize, Integer financeType, String purposeType, Long financeAmount, Integer financeDate, String mortgageType, String userType, String checkTime, String companyAllAsset, String creditAcount, String experience, String needEnsure, String operatIncome, Integer settingYear, String bankSalaryList, String repaymentType, Integer runningArea, Integer industryId, Integer childId);
	public List<PrdFinance> findFinanceImportent(Integer number);

}
