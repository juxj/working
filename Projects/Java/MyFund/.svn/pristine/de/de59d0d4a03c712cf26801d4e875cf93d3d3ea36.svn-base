package com.zj198.task;

import java.util.List;

import com.zj198.model.NtyMessageQueue;
import com.zj198.service.common.NotifyQueueService;
import com.zj198.util.Constants;
import com.zj198.util.MailSendUtil;

//TODO：多台机器同时执行需考虑并发事务错误?, 还需考虑做成多线程发送
public class MailSendTask {
	private NotifyQueueService notifyQueueService;
	public void setNotifyQueueService(NotifyQueueService notifyQueueService) {
		this.notifyQueueService = notifyQueueService;
	}

	public void run() throws Exception{
		List<NtyMessageQueue> list = notifyQueueService.findNeedSendByType_tx(Constants.NTYMESSAGEQUEUE_TYPE_EMAIL);
		for(NtyMessageQueue message:list){
			MailSendUtil.sendMail(message.getTitle(), message.getContent(), message.getReceiver());
			message.setStatus(Constants.NTYMESSAGEQUEUE_STATUS_SUCCESS);
			notifyQueueService.update(message);
		}
		if(list.size()>0){
			System.out.println("====MailSend Task finished to send "+list.size()+" email(s). ====");
		}
	}
}
