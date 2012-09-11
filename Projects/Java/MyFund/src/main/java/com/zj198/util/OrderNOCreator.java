package com.zj198.util;

import org.apache.commons.lang3.ArrayUtils;


public class OrderNOCreator {
	private static final String LR="R";//快速融资申请
	private static final String UF="U";//会员费订单
	private static final String SI="S";//服务信息编号
	private static final String SO="O";//服务订单号
	private static final String FA = "F";//融资申请
	private static final String FP = "P";//融资产品
	
	/**
	 * 融资正式申请订单号生成
	 * @param 订单表自增长的id
	 * @return String类型订单号
	 */
	public static String rapidFinanceProductOrderNO(int id){
		return FP+createOrderNo(id);
	}
	/**
	 * 融资正式申请订单号生成
	 * @param 订单表自增长的id
	 * @return String类型订单号
	 */
	public static String rapidFinanceApplyOrderNO(int id){
		return FA+createOrderNo(id);
	}
	/**
	 * 快速融资订单号生成
	 * @param 订单表自增长的id
	 * @return String类型订单号
	 */
	public static String rapidRequestOrderNO(int id){
		return LR+createOrderNo(id);
	}
	
	/**服务信息编号*/
	public static String getServiceInfoNumber(int id) {
		return SI+createOrderNo(id);
	}
	
	/**服务信息订单号*/
	public static String getServiceOrderNumber(int id) {
		return SO+createOrderNo(id);
	}
	
	
	/**
	 * 会员付会员费订单号生成
	 * @param 订单表自增长的id
	 * @return String类型订单号
	 */
	public static String userFeeOrderNO(int id){
		return UF+createOrderNo(id);
	}
	
	
	//私有方法，生成订单号, 参数传入订单表id, id是大于0的数字
	private static String createOrderNo(int id){
		
		//String str = String.format("%08d", id);
		
	
		id+=10000000;
		String[] o=String.valueOf(id).split("");
		int l = o.length;
		ArrayUtils.reverse(o);
		//1234567==>2573416
		String[] s={o[1],o[6],o[3],o[4],o[0],o[2],o[5]};
		for(int i=0;i<s.length;i++){
			o[i]=String.valueOf(9-Integer.parseInt(s[i]));
		}
		String f="";
		for(int i=l-1;i>=0;i--){
			f+=o[i];
		}
		return f;
	}
	
}
