package com.zj198.task;

import java.util.List;

import com.zj198.model.NtyMessageQueue;
import com.zj198.service.common.NotifyQueueService;
import com.zj198.util.Constants;
import com.zj198.util.SmsUtil;

public class SmsSendTask {
	private NotifyQueueService notifyQueueService;
	public void setNotifyQueueService(NotifyQueueService notifyQueueService) {
		this.notifyQueueService = notifyQueueService;
	}

	public void run() throws Exception{
		List<NtyMessageQueue> list = notifyQueueService.findNeedSendByType_tx(Constants.NTYMESSAGEQUEUE_TYPE_SMS);
		int s=0;
		int f=0;
		for(NtyMessageQueue message:list){
			if(SmsUtil.sendSms(message.getReceiver(), message.getContent())){
				message.setStatus(Constants.NTYMESSAGEQUEUE_STATUS_SUCCESS);
				notifyQueueService.update(message);
				s++;
			}else{
				f++;
			}
		}
		if(list.size()>0){
			System.out.println("====SmsSend Task: Success "+s+" ,Failure "+f+" . ====");
		}
	}
}
