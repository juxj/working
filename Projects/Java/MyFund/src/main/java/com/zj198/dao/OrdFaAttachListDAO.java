package com.zj198.dao;

import java.util.List;

import com.zj198.model.OrdFaAttachList;

/**
 * @author 岳龙
 * Description:
 * CreateAuthor:岳龙
 * CreateDate:2012-7-17 15:47:30
 */
public interface OrdFaAttachListDAO extends BaseDAO<OrdFaAttachList, Integer>{
	public List<OrdFaAttachList> findAttachList(Integer attachId);
	public Integer countAttachList(Integer attachId);
}
