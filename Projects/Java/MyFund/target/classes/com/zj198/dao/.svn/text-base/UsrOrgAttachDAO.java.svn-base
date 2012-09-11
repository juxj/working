package com.zj198.dao;

import java.util.List;

import com.zj198.model.UsrOrgAttach;

public interface UsrOrgAttachDAO extends BaseDAO<UsrOrgAttach, Integer> {
	/**根据用户id查询 用户上传所有组件*/
	public List<UsrOrgAttach> fintByUid(Integer uid);
	/**根据上传的id查询 用户上传组件*/
	public UsrOrgAttach getById(Integer id);
	/**根据用户id和上传类型 查询 用户上传组件*/
	public UsrOrgAttach getByUidAttachType(Integer uid ,Integer type);
}
