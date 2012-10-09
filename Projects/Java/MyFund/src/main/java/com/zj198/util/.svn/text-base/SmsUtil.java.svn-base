package com.zj198.util;

import java.util.ArrayList;
import java.util.UUID;

import com.esms.MessageData;
import com.esms.PostMsg;
import com.esms.common.entity.Account;
import com.esms.common.entity.GsmsResponse;
import com.esms.common.entity.MTPack;

public class SmsUtil {
	private static Account ac;
	private static PostMsg pm;
	static{
		String username=PropertiesUtil.getByKey("sms.sender.username");
		String password=PropertiesUtil.getByKey("sms.sender.password");
		String ip=PropertiesUtil.getByKey("sms.sender.ip");
		int port=Integer.parseInt(PropertiesUtil.getByKey("sms.sender.port"));
		ac = new Account(username,password);
		pm = new PostMsg();
		pm.getCmHost().setHost(ip, port);//设置网关的IP和port，用于发送信息
	}
	
	/**
	 * 发送单条短信
	 * @param mobile手机号码
	 * @param content发送内容（请限制在61长度以内，中文、标点、空格、英文字母、数字都算1个长度）
	 */
	public static boolean sendSms(String mobile, String content){
		if(mobile==null || content==null){
			return false;
		}
		MTPack pack = new MTPack();
		pack.setBatchID(UUID.randomUUID());
		pack.setBatchName("batchName");
		pack.setMsgType(MTPack.MsgType.SMS);
		pack.setSendType(MTPack.SendType.MASS);
		
		ArrayList<MessageData> msgs = new ArrayList<MessageData>();
		msgs.add(new MessageData(mobile, content));
		pack.setMsgs(msgs);
		GsmsResponse resp = pm.post(ac, pack);
		if(resp.toString().indexOf("result=SUCCESS")>0){
			return true;
		}
		return false;
	}
	
	/**
	 * 发送多条短信，内容相同
	 * @param mobiles手机号码们
	 * @param content发送内容（请限制在61长度以内，中文、标点、空格、英文字母、数字都算1个长度）
	 */
	public static boolean sendSmsGroup(String[] mobiles, String content){
		if(mobiles==null || content==null){
			return false;
		}
		MTPack pack = new MTPack();
		pack.setBatchID(UUID.randomUUID());
		pack.setBatchName("batchName");
		pack.setMsgType(MTPack.MsgType.SMS);
		pack.setSendType(MTPack.SendType.GROUP);
		
		ArrayList<MessageData> msgs = new ArrayList<MessageData>();
		for(String m:mobiles){
			msgs.add(new MessageData(m, content));
		}
		pack.setMsgs(msgs);
		GsmsResponse resp = pm.post(ac, pack);
		if(resp.toString().indexOf("result=SUCCESS")>0){
			return true;
		}
		return false;
	}
	
	/**
	 * 发送多条短信，内容不同
	 * @param mobiles手机号码们
	 * @param content发送内容们（请限制在61长度以内，中文、标点、空格、英文字母、数字都算1个长度）
	 */
	public static boolean sendSmsGroup(String[] mobiles, String[] contents){
		if(mobiles==null || contents==null || mobiles.length!=contents.length){
			return false;
		}
		MTPack pack = new MTPack();
		pack.setBatchID(UUID.randomUUID());
		pack.setBatchName("batchName");
		pack.setMsgType(MTPack.MsgType.SMS);
		pack.setSendType(MTPack.SendType.GROUP);
		
		ArrayList<MessageData> msgs = new ArrayList<MessageData>();
		int size=mobiles.length;
		for(int i=0;i<size;i++){
			msgs.add(new MessageData(mobiles[i], contents[i]));
		}
		pack.setMsgs(msgs);
		GsmsResponse resp = pm.post(ac, pack);
		if(resp.toString().indexOf("result=SUCCESS")>0){
			return true;
		}
		return false;
	}
	
//	public static void main(String[] args) {
//	Account ac = new Account("shdhtz", "123456");//
//	PostMsg pm = new PostMsg();
//	pm.getCmHost().setHost("211.147.239.62", 9080);//设置网关的IP和port，用于发送信息
////	pm.getWsHost().setHost("211.147.239.62", 9070);//设置网关的 IP和port，用于获取账号信息、上行、状态报告等
//	
//	MTPack pack = new MTPack();
//	pack.setBatchID(UUID.randomUUID());
//	pack.setBatchName("短信测试批次");
//	pack.setMsgType(MTPack.MsgType.SMS);
//	pack.setSendType(MTPack.SendType.MASS);
//	
//	
//	ArrayList<MessageData> msgs = new ArrayList<MessageData>();
//	
//	/** 单发，一号码一内容 */
//	msgs.add(new MessageData("13918187318", "最后一次非业务直接测试。"));
//	pack.setMsgs(msgs);
//	GsmsResponse resp = pm.post(ac, pack);
//	System.out.println(resp);
//}

}
