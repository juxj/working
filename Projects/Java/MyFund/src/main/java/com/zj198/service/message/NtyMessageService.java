package com.zj198.service.message;

import java.util.List;

import com.zj198.model.NtyMessage;
import com.zj198.model.OrdFinanceApply;
import com.zj198.model.PrdFinance;
import com.zj198.model.UsrUser;
import com.zj198.service.message.model.AddMessageSpModel;
import com.zj198.service.message.model.SendMobileMspSpModel;
import com.zj198.service.message.model.SendEmailMsgSpModel;
import com.zj198.service.message.model.SendWebMsgSpModel;
import com.zj198.util.Pager;

public interface NtyMessageService {
	public void addNewMessage(AddMessageSpModel spModel);

	public List<NtyMessage> findTopMsgs(Integer uid);

	public Pager findComMsgs(Integer pageNo, Integer pageSize, Integer uid);

	public Pager findComMsgsNoRead(Integer pageNo, Integer pageSize, Integer uid);

	public Pager findComMsgsRead(Integer pageNo, Integer pageSize, Integer uid);

	public void deleteAll(String[] msgIds);

	public void updateIsRead(Long mid);

	public Integer getMsgNo(Integer uid);
	
	/*-----------------------------------------------第二期-----------------------------------------------*/
	
	/**
	 * 发送短信
	 * @author:zeroleavebaoyang@gmail.com
	 * @param mobileBean 
	 */
	public void sendMobileMsg(SendMobileMspSpModel mobileBean);
	
	/**
	 * 发送邮件
	 * @author:zeroleavebaoyang@gmail.com
	 * @param emailBean 
	 */
	public void sendEmailMsg(SendEmailMsgSpModel emailBean);
	
	/**
	 * 发送站点消息
	 * @author:zeroleavebaoyang@gmail.com
	 * @param webBean 
	 */
	public void sendWebMsg(SendWebMsgSpModel webBean);
	
	public String getServiceBody(OrdFinanceApply apply, String pointContent, UsrUser u, PrdFinance p, String template);
	
	public String getCustomerBody(OrdFinanceApply apply, String pointContent, UsrUser u, PrdFinance p, String template);
	
	public SendEmailMsgSpModel getEmailModel(String title, Integer type, String recevier, String body);
	
}
