package com.zj198.dao;

import com.zj198.model.AdmUser;

public interface AdmUserDAO extends BaseDAO<AdmUser, Integer> {
	public AdmUser getByUsername(String username);
}
