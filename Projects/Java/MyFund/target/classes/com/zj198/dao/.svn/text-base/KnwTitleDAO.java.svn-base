package com.zj198.dao;

import java.util.List;

import com.zj198.model.KnwTitle;
import com.zj198.util.Pager;

public interface KnwTitleDAO extends BaseDAO<KnwTitle, Integer> {

	/**根据新闻类别查找,并分页*/
	public Pager findKnwTitleByType(Integer typeId, int pageSize, int pageNo, short isAuthenticated, int isActive);
	
	/**不分页*/
	public List<KnwTitle> findKnwTitleByType(Integer typeId);
	
	/**查找未经审核的新闻*/
	public Pager findUnAuthenticatedList(int pageSize, int pageNo);
	
	/**根据新闻类别查找最新的num条已发布记录*/
	public List<KnwTitle> findLastestByType(Integer typeId,Integer num);
}
