package com.zj198.service.loan;

import java.util.List;

import com.zj198.model.PrdFinance;
import com.zj198.model.OrdLrRecommend;

public interface OrdLrRecommendService {

	/**
	 * @description 循环保存推荐产品(admin)
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-7-19| 上午10:03:41
	 * @param list
	 */
	public void saveSelRecProByAdmin(Integer requestId, List<OrdLrRecommend> list);

	/**
	 * @description 循环保存推荐产品(loan)
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-7-19| 上午10:03:41
	 * @param list
	 */
	public void saveSelRecProByLoan(Integer requestId, List<OrdLrRecommend> list);

	/**
	 * @description 根据需求ID,发布推荐产品机构类型(金融网0，银行1),获取已经选择过的推荐产品ID集合
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-7-19| 上午10:04:59
	 * @param id
	 * @return
	 */
	public List<Integer> getByRequestId(Integer id, Integer recommendType);

	/**
	 * @description 根据proIds以 o.id in (1,2,3,4)这种方式得到产品集合
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-7-19| 下午1:45:39
	 * @param ids
	 * @return
	 */
	public List<PrdFinance> getListByIds(Object[] ids);


}
