package com.zj198.dao;

import java.util.List;

import com.zj198.model.OrdMembership;
import com.zj198.util.Pager;

public interface OrdMemberShipDAO extends BaseDAO<OrdMembership, Integer>{
	/**
	 * @description 用户付款管理-----》查询
	 * @param userId
	 * @return list<ordMemberShip>
	 */
	public List<OrdMembership> findOrdMSByUserid(Integer userid);
	/**
	 * @description 管理员付款管理-----》查询所有
	 * @return list<ordMemberShip>
	 */
	public Pager findAllOrdMS(Integer id,Integer userid,Integer pageNo, Integer pageSize);
}
