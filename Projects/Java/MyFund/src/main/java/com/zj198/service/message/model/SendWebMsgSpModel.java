package com.zj198.service.message.model;

/**
 * 
 * @description : 二期新增：发送站点消息参数VO
 * @author: zeroleavebaoyang@gmail.com
 * @since: 2012-10-23|下午1:30:35
 */
public class SendWebMsgSpModel {
	private String messageType;
	private Integer userId;
	private String title;
	private String content;
	private Integer sendUserId;
	

	public SendWebMsgSpModel(Integer userId, Integer sendUserId, String title, String content) {
		this.userId = userId;
		this.title = title;
		this.content = content;
		this.sendUserId = sendUserId;
	}

	public String getMessageType() {
		return messageType;
	}

	public void setMessageType(String messageType) {
		this.messageType = messageType;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getSendUserId() {
		return sendUserId;
	}

	public void setSendUserId(Integer sendUserId) {
		this.sendUserId = sendUserId;
	}

}
