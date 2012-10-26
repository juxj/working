package com.zj198.dao;

import com.zj198.model.UsrMemberPeroid;
import com.zj198.util.Pager;

public interface UsrMemberPeroidDAO extends BaseDAO<UsrMemberPeroid, Integer> {
	/**
	 * @description 管理员 会员信息-----》查询所有
	 * @return list<UsrMemberPeroid>
	 */
	public Pager findAllUsrMP(Integer id,Integer userid,Integer orderId,Integer memberType,Integer pageNo, Integer pageSize);
	/**
	 * 管理员取会员信息的最后一条信息
	 * @param userid
	 * @return
	 */
	public UsrMemberPeroid getUsrMP(Integer userid);
}
