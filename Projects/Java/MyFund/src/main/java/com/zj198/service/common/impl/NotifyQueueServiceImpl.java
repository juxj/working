package com.zj198.service.common.impl;

import java.util.Calendar;
import java.util.List;

import com.zj198.dao.NtyMessageQueueDAO;
import com.zj198.model.NtyMessageQueue;
import com.zj198.service.common.NotifyQueueService;
import com.zj198.util.Constants;

public class NotifyQueueServiceImpl implements NotifyQueueService {
	private NtyMessageQueueDAO ntyMessageQueueDAO;

	public void setNtyMessageQueueDAO(NtyMessageQueueDAO ntyMessageQueueDAO) {
		this.ntyMessageQueueDAO = ntyMessageQueueDAO;
	}

	@Override
	public void addNewMessage(NtyMessageQueue message) {
		message.setStatus(Constants.NTYMESSAGEQUEUE_STATUS_NEW);
		message.setCreatedt(Calendar.getInstance().getTime());
		ntyMessageQueueDAO.save(message);
	}

	@Override
	public void update(NtyMessageQueue message) {
		ntyMessageQueueDAO.update(message);		
	}

	@Override
	public List<NtyMessageQueue> findNeedSendByType_tx(int type) {
		List<NtyMessageQueue> list = ntyMessageQueueDAO.findByStatusType(Constants.NTYMESSAGEQUEUE_STATUS_NEW,type);
		for(NtyMessageQueue message: list){
			message.setStatus(Constants.NTYMESSAGEQUEUE_STATUS_PROCESSING);
			ntyMessageQueueDAO.update(message);
		}
		return list;
	}
	
	
}
