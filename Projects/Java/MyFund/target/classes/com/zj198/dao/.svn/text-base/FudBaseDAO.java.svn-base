package com.zj198.dao;

import java.util.List;

import com.zj198.model.FudBase;
import com.zj198.util.Pager;

public interface FudBaseDAO extends BaseDAO<FudBase, String> {

	public FudBase getByFudCode(String fundCode);
	public List<String> findUniqueFundCompany();
	public Pager findFudItemsByMultiQuery(String[] query, int pageSize, int pageNo);
}
