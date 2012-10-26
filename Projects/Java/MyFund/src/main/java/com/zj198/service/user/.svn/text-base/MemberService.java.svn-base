package com.zj198.service.user;

import java.util.List;

import com.zj198.model.OrdMembership;
import com.zj198.model.UsrMemberPeroid;
import com.zj198.util.Pager;


public interface MemberService {
	
	/**
	 *增加用户的付款信息
	 */
	public void saveOrdMP(OrdMembership ordMembership);
	/**
	 *增加会员信息
	 */
	public void saveUsrMP(UsrMemberPeroid usrMemberPeroid);
	/**
	 * 更新订单列表
	 */
	public void updateOrdMP(OrdMembership ordMembership);
	
	/**
	 * 根据id更改付款信息状态
	 * @param id
	 */
	public void updateOrdMPStatus(Integer id,Integer status);
	/**
	 * 根据id删除付款信息
	 * @param id
	 */
	public void deleteOrdMPById(Integer id);
	/**
	 * 根据id查询付款信息
	 * @param id
	 */
	public OrdMembership getOrdMPById(Integer id);
	/**
	 * 根据用户id查询所有付款信息---列表
	 * @param userid
	 */
	public List<OrdMembership> findOrdMPByUserid(Integer userid);
	/*** 管理员取所有用户的付款信息---列表*/
	public Pager findAllOrdMP(Integer id,Integer userid,Integer pageNo, Integer pageSize);
	/*** 管理员取所有会员信息---列表*/
	public Pager findAllUsrMP(Integer id, Integer userid, Integer orderId,Integer memberType, Integer pageNo, Integer pageSize);
	/*** 管理员取会员信息最后一条 有返回最后一条信息  没有则为null---列表*/
	public UsrMemberPeroid getUsrMP(Integer userid);
	/*** 管理员根据id取会员详细信息 没有则为null---*/
	public UsrMemberPeroid getUsrMPById(Integer id);
}
