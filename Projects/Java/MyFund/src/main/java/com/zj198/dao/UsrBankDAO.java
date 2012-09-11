package com.zj198.dao;

import java.util.List;

import com.zj198.model.UsrBank;

public interface UsrBankDAO extends BaseDAO<UsrBank, Integer>{
	public UsrBank getByUid(Integer uid);
	public List<UsrBank> findUsrBanksByName(String name);
}
