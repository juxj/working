package com.zj198.dao;

import java.util.List;

import com.zj198.model.FundFile;

public interface FundFileDAO extends BaseDAO<FundFile, Integer> {
	/**根据基金id法律文件*/
	public FundFile getFileByFundId(Integer id);
	public List<FundFile> findFileByFundId(Integer id);
}
