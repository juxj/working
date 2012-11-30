package com.zj198.dao.hibernate;

import java.util.Hashtable;
import java.util.List;

import com.zj198.dao.OrdCheckLogDAO;
import com.zj198.model.OrdCheckLog;
import com.zj198.util.Constants;

/**
 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-7-05 15:09:59
 */
public class OrdCheckLogDAOImpl extends HibernateDAO<OrdCheckLog, Integer> implements OrdCheckLogDAO {
	/**
	 * 融资申请审核日志查询
	 */
	public List<OrdCheckLog> findApplyCheck(Integer applyId) {
		String hql = "from OrdCheckLog t where t.ordType=:ordType and t.ordId=:applyId order by id desc";
		return this.list(hql, "ordType", Constants.ORD_CHECK_TYPE_APPLY, "applyId", applyId);
	}

	/**
	 * 融资申请审核日志查询
	 */
	public List<OrdCheckLog> findApplyCheck(Integer applyId, Integer num) {
		String hql = "from OrdCheckLog t where t.ordType=:ordType and t.ordId=:applyId order by id desc";
		Hashtable<String, Object> params = new Hashtable<String, Object>();
		params.put("ordType", Constants.ORD_CHECK_TYPE_APPLY);
		params.put("applyId", applyId);
		return this.findTopRows(hql, num, params);
	}

	/**
	 * 企业或者个人查看全部日志记录(checkLogType='01' or checkLogType='11')
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-11-13|上午11:36:34
	 * @param applyId
	 * @return
	 */
	public List<OrdCheckLog> findAllLogByComOrPle(Integer applyId) {
		String hql = "from OrdCheckLog t where t.ordType=:ordType and t.ordId=:applyId and (t.checkLogType = '10' or t.checkLogType = '11') order by id desc";
		return this.list(hql, "ordType", Constants.ORD_CHECK_TYPE_APPLY, "applyId", applyId);
	}

	/**
	 * 企业或者个人显示前三条日志记录(checkLogType='01' or checkLogType='11')
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-11-13|上午11:36:34
	 * @param applyId
	 * @return
	 */
	public List<OrdCheckLog> findTopLogByComOrPle(Integer applyId, Integer num) {
		String hql = "from OrdCheckLog t where t.ordType=:ordType and t.ordId=:applyId and (t.checkLogType = '10' or t.checkLogType = '11') order by id desc";
		Hashtable<String, Object> params = new Hashtable<String, Object>();
		params.put("ordType", Constants.ORD_CHECK_TYPE_APPLY);
		params.put("applyId", applyId);
		return this.findTopRows(hql, num, params);
	}
	
	/**
	 * 金融机构查看全部日志记录(checkLogType='10' or checkLogType='11')
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-11-13|上午11:36:34
	 * @param applyId
	 * @return
	 */
	public List<OrdCheckLog> findAllLogByLoan(Integer applyId) {
		String hql = "from OrdCheckLog t where t.ordType=:ordType and t.ordId=:applyId and (t.checkLogType = '10' or t.checkLogType = '11') order by id desc";
		return this.list(hql, "ordType", Constants.ORD_CHECK_TYPE_APPLY, "applyId", applyId);
	}

	/**
	 * 金融机构显示前三条日志记录(checkLogType='10' or checkLogType='11')
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-11-13|上午11:36:34
	 * @param applyId
	 * @return
	 */
	public List<OrdCheckLog> findTopLogByLoan(Integer applyId, Integer num) {
		String hql = "from OrdCheckLog t where t.ordType=:ordType and t.ordId=:applyId and (t.checkLogType = '10' or t.checkLogType = '11') order by id desc";
		Hashtable<String, Object> params = new Hashtable<String, Object>();
		params.put("ordType", Constants.ORD_CHECK_TYPE_APPLY);
		params.put("applyId", applyId);
		return this.findTopRows(hql, num, params);
	}
}
