package com.zj198.dao.hibernate;

import java.util.Hashtable;
import java.util.List;

import com.zj198.dao.NtyMessageDAO;
import com.zj198.model.NtyMessage;
import com.zj198.util.Pager;

public class NtyMessageDAOImpl extends HibernateDAO<NtyMessage, Long> implements NtyMessageDAO {

	/**
	 * 只显示最近2条置顶信息
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-8-7| 下午2:31:49
	 * @param uid
	 * @return
	 */
	public List<NtyMessage> findTopMsgs(Integer uid) {
		String hql = "from NtyMessage o where o.type = 1 and o.isSenderDeleted = 0 and exists (select u.id from NtyReceiver u where u.isReceiverDeleted = 0 and u.messageid = o.id and u.receiver = :receiver) order by o.id desc";
		return findTopRows(hql, 2, "receiver", uid);
	}

	/**
	 * 分页显示一般信息(所有信息)
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-8-7| 下午2:31:49
	 * @param pageNo
	 * @param pageSize
	 * @param uid
	 * @return
	 */
	public Pager findComMsgs(Integer pageNo, Integer pageSize, Integer uid) {
		Hashtable<String, Object> j = new Hashtable<String, Object>();
		String hql = "from NtyMessage o where o.type = 2 and o.isSenderDeleted = 0 and exists (select u.id from NtyReceiver u where u.isReceiverDeleted = 0 and u.messageid = o.id and u.receiver = :receiver) order by id desc";
		j.put("receiver", uid);
		return super.pagedQuery(hql, pageNo, pageSize, j);
	}

	/**
	 * 分页显示一般信息(未读)
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-8-7| 下午2:31:49
	 * @param pageNo
	 * @param pageSize
	 * @param uid
	 * @return
	 */
	public Pager findComMsgsNoRead(Integer pageNo, Integer pageSize, Integer uid) {
		Hashtable<String, Object> j = new Hashtable<String, Object>();
		String hql = "from NtyMessage o where o.type = 2 and o.isSenderDeleted = 0 and exists (select u.id from NtyReceiver u where u.isRead = 0 and u.isReceiverDeleted = 0 and u.messageid = o.id and u.receiver = :receiver) order by id desc";
		j.put("receiver", uid);
		return pagedQuery(hql, pageNo, pageSize, j);
	}

	/**
	 * 分页显示一般信息(已读)
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-8-7| 下午2:31:49
	 * @param pageNo
	 * @param pageSize
	 * @param uid
	 * @return
	 */
	public Pager findComMsgsRead(Integer pageNo, Integer pageSize, Integer uid) {
		Hashtable<String, Object> j = new Hashtable<String, Object>();
		String hql = "from NtyMessage o where o.type = 2 and o.isSenderDeleted = 0 and exists (select u.id from NtyReceiver u where u.isRead = 1 and u.isReceiverDeleted = 0 and u.messageid = o.id and u.receiver = :receiver) order by id desc";
		j.put("receiver", uid);
		return pagedQuery(hql, pageNo, pageSize, j);
	}

	/**
	 * 获取消息条数
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-8-7| 下午2:31:49
	 * @return
	 */
	public Integer getMsgNo(Integer uid) {
		String hql = "from NtyMessage o where o.isSenderDeleted = 0 and exists (select u.id from NtyReceiver u where u.isRead = 0 and u.isReceiverDeleted = 0 and u.messageid = o.id and u.receiver = :receiver) order by id desc";
		return getTotalRows(hql, "receiver", uid);
	}
}
