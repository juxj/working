package com.zj198.dao;

import java.util.List;

import com.zj198.model.DicUsertype;


public interface DicUsertypeDAO extends BaseDAO<DicUsertype, Integer>{
	public List<DicUsertype> findByGroup(Integer groupId);
}