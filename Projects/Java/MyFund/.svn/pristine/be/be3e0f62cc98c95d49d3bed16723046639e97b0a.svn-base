package com.zj198.util;

import java.util.ArrayList;
import java.util.UUID;

import com.esms.MessageData;
import com.esms.PostMsg;
import com.esms.common.entity.Account;
import com.esms.common.entity.GsmsResponse;
import com.esms.common.entity.MTPack;

public class SmsUtil {

	public static void main(String[] args) {
		Account ac = new Account("shdhtz", "123456");//
		PostMsg pm = new PostMsg();
		pm.getCmHost().setHost("211.147.239.62", 9080);//设置网关的IP和port，用于发送信息
//		pm.getWsHost().setHost("211.147.239.62", 9070);//设置网关的 IP和port，用于获取账号信息、上行、状态报告等
		
		MTPack pack = new MTPack();
		pack.setBatchID(UUID.randomUUID());
		pack.setBatchName("短信测试批次");
		pack.setMsgType(MTPack.MsgType.SMS);
		pack.setSendType(MTPack.SendType.MASS);
		
		
		ArrayList<MessageData> msgs = new ArrayList<MessageData>();
		
		/** 单发，一号码一内容 */
		msgs.add(new MessageData("13918187318", "最后一次非业务直接测试。"));
		pack.setMsgs(msgs);
		GsmsResponse resp = pm.post(ac, pack);
		System.out.println(resp);
	}

}
