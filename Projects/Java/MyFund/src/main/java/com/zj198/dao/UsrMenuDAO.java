package com.zj198.dao;

import java.util.List;

import com.zj198.model.UsrMenu;

public interface UsrMenuDAO extends BaseDAO<UsrMenu, Integer> {
	public List<UsrMenu> findMenuListByGroupType(Integer userTypeGroup);
}
