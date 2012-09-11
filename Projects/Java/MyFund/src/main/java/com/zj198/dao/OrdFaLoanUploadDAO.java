package com.zj198.dao;

import java.util.List;

import com.zj198.model.OrdFaLoanUpload;

/**
 * @author 岳龙
 * Description:
 * CreateAuthor:岳龙
 * CreateDate:2012-7-25 16:37:43
 */
public interface OrdFaLoanUploadDAO extends BaseDAO<OrdFaLoanUpload, Integer>{
	public List<OrdFaLoanUpload> findLoanUpload(Integer dataId);
}
