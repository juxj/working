package com.zj198.dao.hibernate;

import java.util.List;

import com.zj198.dao.NtyMessageQueueDAO;
import com.zj198.model.NtyMessageQueue;

public class NtyMessageQueueDAOImpl extends HibernateDAO<NtyMessageQueue, Long> implements NtyMessageQueueDAO {

	@Override
	public List<NtyMessageQueue> findByStatusType(int status,int type) {
		String hql="from NtyMessageQueue as model where model.status=:status and model.type=:type";
		return list(hql,"status",status,"type",type);
	}

}
