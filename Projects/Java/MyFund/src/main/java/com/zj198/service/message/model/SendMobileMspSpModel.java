package com.zj198.service.message.model;

/**
 * 
 * @description : 二期新增：通用发短信参数VO
 * @author: zeroleavebaoyang@gmail.com
 * @since: 2012-10-23|下午1:26:46
 */
public class SendMobileMspSpModel {
	private Integer sendType;
	private String content;
	private String mobile;
	private Integer sendUserId;
	private String title;
	
	//new
	public SendMobileMspSpModel() {
	}

	public SendMobileMspSpModel(String title, String content, String mobile) {
		this.title = title;
		this.content = content;
		this.mobile = mobile;
	}
	
	 
	//getter and setter
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}


	public Integer getSendType() {
		return sendType;
	}

	public void setSendType(Integer sendType) {
		this.sendType = sendType;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public Integer getSendUserId() {
		return sendUserId;
	}

	public void setSendUserId(Integer sendUserId) {
		this.sendUserId = sendUserId;
	}

}
