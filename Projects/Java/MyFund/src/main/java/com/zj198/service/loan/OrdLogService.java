package com.zj198.service.loan;

import com.zj198.model.OrdFinanceApply;

/**
 * 订单日志保存
 * 
 * @author zeroleavebaoyang@gmail.com
 * @since 2012-11-1|下午3:40:47
 */
public interface OrdLogService {

	/**
	 * 抽取订单状态变化时记录日志的方法
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-11-1|下午3:43:23
	 * @param logType
	 * @param logView
	 * @param apply
	 * @param realname
	 */
	public void saveLogByStatus(String logType, String logView,
			OrdFinanceApply apply, String realname);
}
