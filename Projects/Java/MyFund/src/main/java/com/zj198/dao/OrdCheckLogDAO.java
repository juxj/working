package com.zj198.dao;

import java.util.List;

import com.zj198.model.OrdCheckLog;

/**
 * @author 岳龙
 * Description:
 * CreateAuthor:岳龙
 * CreateDate:2012-7-05 15:09:59
 */
public interface OrdCheckLogDAO extends BaseDAO<OrdCheckLog, Integer>{
	/**
	 * 资金网查看全部日志
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-11-13|下午1:59:03
	 * @param applyId
	 * @return
	 */
	public List<OrdCheckLog> findApplyCheck(Integer applyId);
	
	/**
	 * 资金网显示前三条日志记录
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-11-13|下午1:59:25
	 * @param applyId
	 * @param num
	 * @return
	 */
	public List<OrdCheckLog> findApplyCheck(Integer applyId,Integer num);
	
	/**
	 * 企业或者个人查看全部日志记录(checkLogType='01' or checkLogType='11')
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-11-13|上午11:36:34
	 * @param applyId
	 * @return
	 */
	public List<OrdCheckLog> findAllLogByComOrPle(Integer applyId);
	
	/**
	 * 企业或者个人显示前三条日志记录(checkLogType='01' or checkLogType='11')
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-11-13|上午11:36:34
	 * @param applyId
	 * @return
	 */
	public List<OrdCheckLog> findTopLogByComOrPle(Integer applyId, Integer num);
	
	/**
	 * 金融机构查看全部日志记录(checkLogType='10' or checkLogType='11')
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-11-13|上午11:36:34
	 * @param applyId
	 * @return
	 */
	public List<OrdCheckLog> findAllLogByLoan(Integer applyId);
	
	/**
	 * 金融机构显示前三条日志记录(checkLogType='10' or checkLogType='11')
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-11-13|上午11:36:34
	 * @param applyId
	 * @return
	 */
	public List<OrdCheckLog> findTopLogByLoan(Integer applyId, Integer num);
	
	
	
}
