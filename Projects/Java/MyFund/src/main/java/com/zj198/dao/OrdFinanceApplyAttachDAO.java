package com.zj198.dao;

import java.util.List;

import com.zj198.model.OrdFinanceApplyAttach;
import com.zj198.model.vo.FinanceApplyAttachModel;

/**
 * @author 岳龙
 * Description:
 * CreateAuthor:岳龙
 * CreateDate:2012-7-05 15:09:59
 */
public interface OrdFinanceApplyAttachDAO extends BaseDAO<OrdFinanceApplyAttach, Integer>{
	public List<FinanceApplyAttachModel> findApplyAttach(Integer applyId);
	public List<FinanceApplyAttachModel> findApplyAttachSupply(Integer applyId);
	
	/**
	 * 批量删除申贷材料
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-31|下午1:36:55
	 * @param ids
	 */
	public void deleteAttach(Integer[] ids);
	
}
