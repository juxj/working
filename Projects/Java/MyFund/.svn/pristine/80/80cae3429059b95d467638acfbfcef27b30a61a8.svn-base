package com.zj198.service.common;

import java.util.List;

import com.zj198.model.NtyMessageQueue;

//通知队列Service
public interface NotifyQueueService {

	/**
	 * 增加新消息
	 * @param message
	 */
	public void addNewMessage(NtyMessageQueue message);
	
	/**
	 * 更新消息状态，一般在处理完发送事宜后调用
	 * @param message
	 * @return
	 */
	public void update(NtyMessageQueue message);
	
	/**
	 * 获取所有需要处理的Email消息,同时设定状态为处理中
	 * @return 需要处理的消息的list
	 */
	public List<NtyMessageQueue> findNeedSendByType_tx(int type);
	
	/**
	 * 获取所有需要处理的Email消息,同时设定状态为处理中
	 * @return 需要处理的消息的list
	 */
//	public List<NtyMessageQueue> findAllNeedSend_tx();
}
