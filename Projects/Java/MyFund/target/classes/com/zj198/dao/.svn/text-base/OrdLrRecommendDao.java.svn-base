package com.zj198.dao;

import java.util.List;

import com.zj198.model.OrdLrRecommend;

public interface OrdLrRecommendDao extends BaseDAO<OrdLrRecommend, Integer> {

	/**
	 * @description 根据需求ID,推荐产品的机构类型(资金网0,金融机构1),获取已经选择过的推荐产品ID集合
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-7-19| 上午10:04:59
	 * @param id
	 * @return
	 */
	public List<Integer> getByRequestId(Integer id, Integer recommendType);

	/**
	 * @description 根据需求ID,获取已经选择过的推荐产品集合
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-7-19| 上午10:44:59
	 * @param id
	 * @return
	 */
	public List<OrdLrRecommend> getByRequestAdminID(Integer id);

	/**
	 * @description 根据需求ID,获取已经选择过的推荐产品集合
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-7-19| 上午10:44:59
	 * @param id
	 * @return
	 */
	public List<OrdLrRecommend> getByRequestLoanID(Integer id);

}
