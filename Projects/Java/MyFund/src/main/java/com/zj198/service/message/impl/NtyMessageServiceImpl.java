package com.zj198.service.message.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.zj198.dao.NtyMessageDAO;
import com.zj198.dao.NtyMessageQueueDAO;
import com.zj198.dao.NtyReceiverDAO;
import com.zj198.model.NtyMessage;
import com.zj198.model.NtyMessageQueue;
import com.zj198.model.NtyReceiver;
import com.zj198.model.OrdFinanceApply;
import com.zj198.model.PrdFinance;
import com.zj198.model.UsrUser;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.message.NtyMessageService;
import com.zj198.service.message.model.AddMessageSpModel;
import com.zj198.service.message.model.SendEmailMsgSpModel;
import com.zj198.service.message.model.SendMobileMspSpModel;
import com.zj198.service.message.model.SendWebMsgSpModel;
import com.zj198.util.Constants;
import com.zj198.util.FreemarkerUtil;
import com.zj198.util.Pager;
import com.zj198.util.PropertiesUtil;

public class NtyMessageServiceImpl implements NtyMessageService {
	private NtyMessageDAO ntyMessageDAO;
	private NtyMessageQueueDAO NtyMessageQueueDAO;
	private NtyReceiverDAO ntyReceiverDAO;
	private DictoryDataService dictoryDataService;

	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}

	/**
	 * 发送新消息
	 */
	public void addNewMessage(AddMessageSpModel spModel) {
		NtyMessage message = spModel.getMessage();
		message.setSenddt(new Date());
		message.setSender(spModel.getSendUserId());
		message.setIsSenderDeleted(new Integer(0));
		if (message.getType() == null) {
			message.setType(new Integer(2));// 类型 1重要消息 2普通消息
		}
		ntyMessageDAO.save(message);

		if (spModel.getReceiverId() != null) {
			for (Integer receive : spModel.getReceiverId()) {
				NtyReceiver r = new NtyReceiver();
				r.setReceiver(receive);
				r.setIsRead(new Integer(0));
				r.setMessageid(message.getId());
				r.setIsReceiverDeleted(new Integer(0));
				ntyReceiverDAO.save(r);
			}
		}
	}

	public void setNtyMessageDAO(NtyMessageDAO ntyMessageDAO) {
		this.ntyMessageDAO = ntyMessageDAO;
	}

	public void setNtyMessageQueueDAO(NtyMessageQueueDAO ntyMessageQueueDAO) {
		NtyMessageQueueDAO = ntyMessageQueueDAO;
	}

	public void setNtyReceiverDAO(NtyReceiverDAO ntyReceiverDAO) {
		this.ntyReceiverDAO = ntyReceiverDAO;
	}

	public List<NtyMessage> findTopMsgs(Integer uid) {
		return ntyMessageDAO.findTopMsgs(uid);
	}

	@Override
	public Pager findComMsgs(Integer pageNo, Integer pageSize, Integer uid) {
		return ntyMessageDAO.findComMsgs(pageNo, pageSize, uid);
	}

	@Override
	public void deleteAll(String[] msgIds) {
		if (msgIds != null && msgIds.length > 0) {
			for (int i = 0; i < msgIds.length; i++) {
				Long j = Long.parseLong(msgIds[i]);
				NtyMessage m = ntyMessageDAO.get(j);
				m.setIsSenderDeleted(1);
				ntyMessageDAO.update(m);
			}
		}
	}

	@Override
	public void updateIsRead(Long mid) {
		ntyReceiverDAO.upIsRead(mid);
	}

	@Override
	public Pager findComMsgsNoRead(Integer pageNo, Integer pageSize, Integer uid) {
		return ntyMessageDAO.findComMsgsNoRead(pageNo, pageSize, uid);
	}

	@Override
	public Pager findComMsgsRead(Integer pageNo, Integer pageSize, Integer uid) {
		return ntyMessageDAO.findComMsgsRead(pageNo, pageSize, uid);
	}

	@Override
	public Integer getMsgNo(Integer uid) {
		return ntyMessageDAO.getMsgNo(uid);
	}

	/*-----------------------------------------第二期--------------------------------------------------*/

	public void sendMobileMsg(SendMobileMspSpModel mobileBean) {
		NtyMessageQueue j = new NtyMessageQueue();
		j.setTitle(mobileBean.getTitle());
		j.setContent(mobileBean.getContent());
		j.setReceiver(mobileBean.getMobile());
		j.setType(Constants.NTYMESSAGEQUEUE_TYPE_SMS);// 短信
		j.setStatus(Constants.NTYMESSAGEQUEUE_STATUS_NEW);
		j.setCreatedt(Calendar.getInstance().getTime());
		NtyMessageQueueDAO.save(j);
	}

	public void sendEmailMsg(SendEmailMsgSpModel emailBean) {
		NtyMessageQueue j = new NtyMessageQueue();
		j.setTitle(emailBean.getTitle());
		j.setContent(emailBean.getContent());
		if (emailBean.getSendType() == 0) {
			j.setReceiver(emailBean.getReceiver());// 外部邮件
		} else {
			j.setReceiver(PropertiesUtil.getByKey("loan.servicer.shixl"));
		}
		j.setType(Constants.NTYMESSAGEQUEUE_TYPE_EMAIL);// 邮件
		j.setStatus(Constants.NTYMESSAGEQUEUE_STATUS_NEW);
		j.setCreatedt(Calendar.getInstance().getTime());
		NtyMessageQueueDAO.save(j);

	}

	public void sendWebMsg(SendWebMsgSpModel webBean) {
		NtyMessage message = new NtyMessage();
		message.setSenddt(new Date());
		message.setSender(webBean.getSendUserId());
		message.setContents(webBean.getContent());
		message.setTitle(webBean.getTitle());
		message.setIsSenderDeleted(new Integer(0));
		if (message.getType() == null) {
			message.setType(new Integer(2));// 类型 1重要消息 2普通消息
		}
		ntyMessageDAO.save(message);

		if (webBean.getUserId() != null) {
			NtyReceiver r = new NtyReceiver();
			r.setReceiver(webBean.getUserId());
			r.setIsRead(new Integer(0));
			r.setMessageid(message.getId());
			r.setIsReceiverDeleted(new Integer(0));
			ntyReceiverDAO.save(r);
		}
	}

	public String getServiceBody(OrdFinanceApply apply, String pointContent, UsrUser u, PrdFinance p, String template) {
		try {
			Map<String, Object> j = new HashMap<String, Object>();
			String accountTime = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(apply.getCreatedt());
			j.put("accountTime", accountTime);
			j.put("applyNum", apply.getApplyNum());
			j.put("applyUser", u.getRealname());
			j.put("mobile", u.getMobile() == null ? "暂无" : u.getMobile());
			j.put("applyAmount", apply.getLoanAmount());
			j.put("applyDate", apply.getLoanMonth());
			j.put("productName", p.getFinanceName());
			j.put("pointContent", pointContent);
			return FreemarkerUtil.getContent(template, j, false, null, null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public String getCustomerBody(OrdFinanceApply apply, String pointContent, UsrUser u, PrdFinance p, String template) {
		try {
			Map<String, Object> j = new HashMap<String, Object>();
			String applyTime = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(apply.getCreatedt());
			j.put("userName", u.getRealname());
			j.put("productOrgName", dictoryDataService.getCompanyNameByUserId(p.getUserId()));
			j.put("applyTime", applyTime);
			j.put("applyNum", apply.getApplyNum());
			j.put("productName", p.getFinanceName());
			j.put("pointContent", pointContent);
			return FreemarkerUtil.getContent(template, j, false, null, null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public SendEmailMsgSpModel getEmailModel(String title, Integer type, String recevier, String body) {
		SendEmailMsgSpModel email = new SendEmailMsgSpModel();
		email.setTitle(title);
		email.setSendType(type == null ? 0 : type);
		email.setContent(body);
		email.setReceiver(recevier);
		return email;
	}
}
