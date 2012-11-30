package com.zj198.util;

import java.util.HashMap;
import java.util.Map;

public class OrderMessageUtil {
	private static Map<String, String> map = null;
	private static void loadMap(){
		map = new HashMap<String, String>();
		map.put(Constants.ORD_ZJW_CHECKING + "", PropertiesUtil.getByKey(Constants.ORD_REMIND_ZJ_CUSTOMER));
		map.put(Constants.ORD_ZJW_WAIT_UPLOAD + "", PropertiesUtil.getByKey(Constants.ORD_REMIND_ZJ_BASEOK));
		map.put(Constants.ORD_ZJW_WAIT_UPDATE + "", PropertiesUtil.getByKey(Constants.ORD_REMIND_ZJ_NEEDUPDATE));
		map.put(Constants.ORD_ZJW_UPLOAD_CHECK + "", PropertiesUtil.getByKey(Constants.ORD_REMIND_ZJ_UPLOADCHECK));
		map.put(Constants.ORD_ZJW_CHECKPASS + "", PropertiesUtil.getByKey(Constants.ORD_REMIND_ZJ_OK));
		map.put(Constants.ORD_ZJW_CHECK_FAILURE + "", PropertiesUtil.getByKey(Constants.ORD_REMIND_ZJ_FAILURE));
		
		map.put(Constants.ORD_ORG_WAIT_CHECK + "", PropertiesUtil.getByKey(Constants.ORD_REMIND_ORG_WAIT));
		map.put(Constants.ORD_ORG_CHECKING + "", PropertiesUtil.getByKey(Constants.ORD_REMIND_ORG_CHECKING));
		map.put(Constants.ORD_ORG_WAIT_UPLOAD + "", PropertiesUtil.getByKey(Constants.ORD_REMIND_ORG_WAITUPLOAD));
		map.put(Constants.ORD_ORG_WAIT_MONEY + "", PropertiesUtil.getByKey(Constants.ORD_REMIND_ORG_OK));
		map.put(Constants.ORD_ORG_PUT_MONEY + "", PropertiesUtil.getByKey(Constants.ORD_REMIND_ORG_PUTMONEY));
		map.put(Constants.ORD_ORG_CHECK_FAILURE + "", PropertiesUtil.getByKey(Constants.ORD_REMIND_ORG_FAILURE));
	}
	public static String getMessage(String orderStatus){
		if(map == null){
			loadMap();
		}
		return map.get(orderStatus);
	}
	public static void main(String[] args) {
		System.out.println(OrderMessageUtil.getMessage("302"));
	}
}
