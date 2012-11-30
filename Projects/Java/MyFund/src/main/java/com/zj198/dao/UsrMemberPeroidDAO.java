package com.zj198.dao;

import java.util.Date;

import com.zj198.model.UsrMemberPeroid;
import com.zj198.util.Pager;

public interface UsrMemberPeroidDAO extends BaseDAO<UsrMemberPeroid, Integer> {
	/**
	 * @description 管理员 会员信息-----》查询所有
	 * @return list<UsrMemberPeroid>
	 * id 订单id   username  会员名称   memberType   会员类型    status  会员状态  Date[] stardt 开始时间 Date[] createdt 创建时间
	 */
	public Pager findAllUsrMP(Integer ordId,String username,Integer status,Integer memberType,Date[] startdt,Date[] createdt,Integer pageNo, Integer pageSize);
	/**
	 * 管理员取会员信息的最后一条信息
	 * @param userid
	 * @return
	 */
	public UsrMemberPeroid getUsrMP(Integer userid);
}
