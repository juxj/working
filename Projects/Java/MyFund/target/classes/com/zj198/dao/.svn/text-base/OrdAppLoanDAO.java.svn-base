package com.zj198.dao;

import java.util.List;

import com.zj198.model.OrdFinanceAppLoan;
import com.zj198.util.Pager;

public interface OrdAppLoanDAO extends BaseDAO<OrdFinanceAppLoan, Integer> {

	/**
	 * 根据申请ID,查看放款详情
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-7-23| 下午2:35:06
	 * @param appId
	 * @return
	 */
	public OrdFinanceAppLoan findByAppId(Integer appId);

	/**
	 * 分页显示所有的贷后管理
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-7-25| 下午2:29:00
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public Pager getList(Integer userId, Integer page, Integer pageSize);
	
	public List<OrdFinanceAppLoan> findAppLoan(Integer userId);
}
