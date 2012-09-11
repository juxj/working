package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.NtyReceiverDAO;
import com.zj198.model.NtyReceiver;

public class NtyReceiverDAOImpl extends HibernateDAO<NtyReceiver, Long> implements NtyReceiverDAO {

	@Override
	public void upIsRead(Long mid) {
		String hql = "from NtyReceiver o where o.messageid = :messageid";
		List<NtyReceiver> list = list(hql, "messageid", mid);
		if (list != null && list.size() > 0) {
			NtyReceiver n = list.get(0);
			if (n.getIsRead() != 1) {
				n.setIsRead(1);
				update(n);
			}
		}
	}

}
