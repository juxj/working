package com.zj198.util;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.zj198.model.DicInvestRange;


public class Constants{
	
	//投资俱乐部
	public static final int CLUB_INVEST_STYLE = 1;
	public static final int CLUB_AMOUNT_RANGE = 2;
	public static final int CLUB_PAWN_ITEM_TYPE = 3;
	public static final int CLUB_GUARANTEE_TYPE = 4;
	public static final int CLUB_LOAD_USAGE = 5;
	public static final int CLUB_PROJECT_TYPE = 6;
	public static final int CLUB_FINANCE_TYPE = 7;
	public static final int CLUB_TIME_INTERVAL = 8;
	public static final int CLUB_INDUSTRY_LIST = 20;
	public static final int CLUB_PROVINCE_LIST = 21;
	
	
	//新闻类型
	public static final int ANNOUNCED_NEWS = 1;	//首页公告
	public static final int FINANCING_CASE = 2;	//融资案例
	
	
	public static final int GOVERMENT_NEWS = 3;	//政府动态
	public static final int FINANCE_NEWS = 4;	//金融资讯
	public static final int SITE_NEWS = 5;		//资金网动态
	
	public static final int FINANCING_NEWS = 6;	//融资资讯
	public static final int FINANCIAL_NEWS = 7;	//理财资讯

	public static final int NEWS_FINANCING_DICTIONARY = 13; //融资词典
	public static final int NEWS_FINACING_ENCYCLOPEDIA = 14; //金融百科
	public static final int NEWS_COMMON_ISSUES = 15; //常见问题
	public static final int NEWS_REGISTER_LOGIN = 16;  //注册与登录
	public static final int NEWS_FINANCING_SERVICE = 17;//融资与服务
	public static final int NEWS_SERVICE_AGREEMENT = 18; //服务协议与规则
	public static final int FINANCING_GUIDE = 19;		//融资指南
	
	public static final String FILE_NAME_ZJ198_FINANCE_AGREE = "\\downloadfile\\zj198_finance_agree.pdf";
	public static final String SHOW_NAME_ZJ198_FINANCE_AGREE = "融资咨询服务协议书";
	
	//上传文件安全属性
	public static final int UPLOAD_PRIVACY_PUBLIC=1;//公开访问
	public static final int UPLOAD_PRIVACY_PRIVATE=2;//需要action访问,在WEB-INF下
	
	//合约
	public static final int CONTRACT_GROUP = 47; 
	
	//性别
	public static final short USER_GENDER_FEMALE = 0;
	public static final short USER_GENDER_MALE = 1;
	
	//用户状态
	public static final short USER_STATUS_AVAILABLE = 0;	//正常
	public static final short USER_STATUS_BLOCKED = 1;		//阻止登录
	//用户信息验证情况
	public static final short USER_ACTIVE_NONE = 0;			//无验证
	public static final short USER_ACTIVE_EMAIL = 1;		//email已验证
	public static final short USER_ACTIVE_MOBILE = 2;		//mobile已验证
	public static final short USER_ACTIVE_ALL = 3;			//email,mobile全部已验证
	
	//用户审核状态
	public static final short USER_AUDITSTATUS_NONE = 0;	//未审核
	public static final short USER_AUDITSTATUS_WAIT = 1;	//待审核
	public static final short USER_AUDITSTATUS_DONE = 2;	//已审核
	
	//用户付费状态
	public static final int USER_VIPTYPE_NONE = 0;		//未付费
	public static final int USER_VIPTYPE_COMMON = 1;	//资信通认证会员
	public static final int USER_VIPTYPE_VIP = 2;		//资信通vip会员
	public static final Double USER_VIPTYPE_COMMON_COST = 365.0;	//资信通认证会员费用
	public static final Double USER_VIPTYPE_VIP_COST = 5000.0;		//资信通vip会员费用
	
	//与用户付费相关
	public static final int USER = 2;		//寄送方式
	public static final int USER_VIPTYPE_PAYSTATUS_OFF = 0;		//付款装态——未付款
	public static final int USER_VIPTYPE_PAYSTATUS_ON = 1;		//寄送方式——已付款
	public static final int USER_VIPTYPE_ISCANCELLED_ON = 0;		//订单装态——正常
	public static final int USER_VIPTYPE_ISCANCELLED_OFF = 1;		//订单装态——取消
	public static final Integer USER_VIPTYPE_PEROID_STATUS_BEFORE = 2;		//会员信息状态---过期
	public static final Integer USER_VIPTYPE_PEROID_STATUS_NOW = 1;		//会员信息状态---当前有效
	public static final Integer USER_VIPTYPE_PEROID_STATUS_AFTER = 0;		//会员信息状态---未使用
	//通知消息队列状态
	public static final int NTYMESSAGEQUEUE_STATUS_NEW = 0;			//新消息
	public static final int NTYMESSAGEQUEUE_STATUS_PROCESSING = 1;	//处理中
	public static final int NTYMESSAGEQUEUE_STATUS_SUCCESS = 2;		//已成功
	public static final int NTYMESSAGEQUEUE_STATUS_FAILURE = 9;		//已失败
	//通知消息队列类型
	public static final int NTYMESSAGEQUEUE_TYPE_EMAIL = 1;			//发送邮件
	public static final int NTYMESSAGEQUEUE_TYPE_SMS = 2;			//发送短信
	public static final int NTYMESSAGEQUEUE_TYPE_INSITE = 4;		//站内通知
	public static final int NTYMESSAGEQUEUE_INSIDE = 0;				//发送内部短信
	public static final int NTYMESSAGEQUEUE_OUTSIDE = 1;			//发送外部短信
	
	
	//扩展属性分类
	public static final Integer EXTENDS_PROPERTY_FINANCE = 1;  //融资产品
	
	//扩展属性类型
	public static final Integer EXTENDS_PROPERTY_TYPE_TEXT = 1;			//单行文本框
	public static final Integer EXTENDS_PROPERTY_TYPE_TEXTAREA = 2;		//多行文本框
	public static final Integer EXTENDS_PROPERTY_TYPE_SELECT = 3;		//下拉选择框
	public static final Integer EXTENDS_PROPERTY_TYPE_CHECKBOX = 4;		//多选框
	
	//用户类型
	public static final short USER_TYPE_NULL = 0;			//*未设置类型*
	public static final short USER_TYPE_PERSON = 1;			//个人
	public static final short USER_TYPE_PRODUCT = 2;		//生产型企业
	public static final short USER_TYPE_TRADE = 3;			//贸易型企业
	public static final short USER_TYPE_PROTRAMIX = 4;		//工贸一体型企业
	public static final short USER_TYPE_SERVICE = 5;		//服务型企业
	public static final short USER_TYPE_BANK = 6;			//银行
	public static final short USER_TYPE_INSURANCE = 7;		//保险公司
	public static final short USER_TYPE_LOAN = 8;			//小额贷款公司
	public static final short USER_TYPE_HOCK = 9;			//典当公司
	public static final short USER_TYPE_GUARANTEE = 10;		//担保公司
	public static final short USER_TYPE_RENT = 11;			//融资租赁公司
	public static final short USER_TYPE_PRIORG = 12;		//民间机构
	public static final short USER_TYPE_ACCOUNT = 13;		//会计师事务所
	public static final short USER_TYPE_ASSESSMENT = 14;	//评估公司
	public static final short USER_TYPE_REGULATE = 15;		//第三方监管公司
	public static final short USER_TYPE_LAWFIRM = 16;		//律师事务所
	public static final short USER_TYPE_INVESTCONST = 17;	//投资咨询公司
	
	//用户类型组
	public static final int USERTYPE_GROUP_COMPANY = 1;		//企业
	public static final int USERTYPE_GROUP_BANK = 2;		//银行
	public static final int USERTYPE_GROUP_FINANCEORG = 3;	//金融机构
	public static final int USERTYPE_GROUP_SERVICEORG = 4;	//服务机构
	public static final int USERTYPE_GROUP_PERSONAL = 5;	//个人
	
	//有  无
	public static final int LOANREQUEST_HAVE =1;
	public static final int LOANREQUEST_NO_HAVE = 0;
	
	//基础字典数据分类group
	public static final int BASEDATA_GROUP_EDUCATION = 1;	//教育学历
	public static final int BASEDATA_GROUP_IMTOOL = 2;		//即时通讯工具
	public static final int BASEDATA_GROUP_MARRY = 3;		//婚姻状态
	public static final int BASEDATA_GROUP_FUNDTYPE = 4;	//基金类型
	
	public static final int BASEDATA_GROUP_PERSONCAREER = 5;	//个人职业
	public static final int BASEDATA_GROUP_COMPANYTYPE = 6;		//企业类型,机构类型
	public static final int BASEDATA_GROUP_COMPANYEMPLOYEE = 7;	//企业员工人数
	public static final int BASEDATA_GROUP_WORKYEARS = 8;		//行业年限
	public static final int BASEDATA_GROUP_SERVICEPRODUCT = 9;	//服务机构的服务产品
	
	public static final int BASEDATA_GROUP_LOANTYPE = 10;		//
	public static final int BASEDATA_GROUP_LOANPURPOSE = 14;			//企业贷款用途
//	public static final int BASEDATA_GROUP_MORTGAGE = 15;					//抵押物
	public static final int BASEDATA_GROUP_RUNNINGTYPE = 1;			//企业经营类型 用户类型表（DIC_USERTYPE：group）
	public static final int BASEDATA_GROUP_PERSONSPEND = 17;			//个人消费贷款用途
	public static final int BASEDATA_GROUP_COMPANYNATURE = 18;			//现单位性质
	public static final int BASEDATA_GROUP_WORKTIME = 19;			//工作时长
	public static final int BASEDATA_GROUP_SALARY = 20;			//税后月收入
	public static final int BASEDATA_GROUP_PUTSALARYTYPE = 21;			//发薪方式
	public static final int BASEDATA_GROUP_SALARYLIST = 22;			//银行流水
	public static final int BASEDATA_GROUP_PERSONRUNNING = 23;			//个人经营贷款用途
	public static final int BASEDATA_GROUP_ALLYEARSALES = 24;			//年营业额
	public static final int BASEDATA_GROUP_HOUSENATURN = 25;			//房屋性质
	public static final int BASEDATA_GROUP_REPAYMENTTYPE = 26;			//还款方式
	public static final int BASEDATA_GROUP_LOANAPPLYTYPE=27;	        //快速融资申请类型
	public static final int BASEDATA_GROUP_CHECKSTATUS=29;			//快速申请状态
	
	public static final int BASEDATA_GROUP_FINANCE_TYPE=32;//融资贷款类型32
	public static final int BASEDATA_GROUP_RATE_TYPE=33;//贷款利率类型33
	public static final int BASEDATA_GROUP_FINANCE_REPAYMENT_TYPE=34;//支持还款方式34
	public static final int BASEDATA_GROUP_MORTGAGE_TYPE=35;//抵押类型35
	public static final int BASEDATA_GROUP_FINANCE_SPECIAL=36;//贷款产品特色36
	public static final int BASEDATA_GROUP_DATA_PUT_WAY=37;//补充资料递交方式37
	
	public static final int BASEDATA_GROUP_ORG_ATTACH_TYPE = 57;	//非银行金融机构附件类型
	
	/**组织机构附件类型*/
	public static final int BASEDATA_GROUP_ORG_ATTACH_ORGANIZATION  = 279;	//组织机构附件类型
	/**营业执照附件类型*/
	public static final int BASEDATA_GROUP_ORG_ATTACH_BUSINESS = 280;	//营业执照附件类型
	/**税务登记证附件类型*/
	public static final int BASEDATA_GROUP_ORG_ATTACH_TAXREGISTRATION = 281;	//税务登记证附件类型
	/**有效状态*/
	public static final int BASEDATA_GROUP_ORG_ATTACH_STATUS_ON = 1;	//有效状态
	/**无效状态*/
	public static final int BASEDATA_GROUP_ORG_ATTACH_STATUS_OFF = 0;	//无效状态
	
	public static final String LOAN_EMAIL = "shixl@zj198.com"; // "zeroleavebaoyang@gmail.com";//// 接受邮件地址

	public static final String LOAN_BCC = "shenyd@zj198.com";// 暂时硬编码
	
	/**审核日志类型*/
	public static final Integer ORD_CHECK_TYPE_REQUEST = 323;
	public static final Integer ORD_CHECK_TYPE_APPLY = 324;
	
	/**
	 * 融资申请单状态
	 */
	public static final Integer ORD_FINANCE_STATUS_ZJW_CHECKING = 301;
	public static final Integer ORD_FINANCE_STATUS_ZJW_WAIT_UPLOAD = 302;
	public static final Integer ORD_FINANCE_STATUS_ZJW_WAIT_UPDATE = 303;
	public static final Integer ORD_FINANCE_STATUS_ZJW_UPLOAD_CHECK = 304;
	public static final Integer ORD_FINANCE_STATUS_ZJW_CHECKPASS = 305;
	public static final Integer ORD_FINANCE_STATUS_ZJW_CHECK_FAILURE = 311;
	public static final Integer ORD_FINANCE_STATUS_ORG_WAIT_CHECK = 306;
	public static final Integer ORD_FINANCE_STATUS_ORG_CHECKING = 307;
	public static final Integer ORD_FINANCE_STATUS_ORG_WAIT_UPLOAD = 308;
	public static final Integer ORD_FINANCE_STATUS_ORG_WAIT_MONEY = 309;
	public static final Integer ORD_FINANCE_STATUS_ORG_PUT_MONEY = 310;
	public static final Integer ORD_FINANCE_STATUS_ORG_CHECK_FAILURE = 312;
	
//	//---begin 改用memecached缓存，以下变量将废弃--Patrick
	//用户中心菜单,非final，第一次调用填充，同种用户共用,需要调整至DAO--patrick
//	public static Map<Integer,List<UsrMenu>> MENU_MAP = new HashMap<Integer,List<UsrMenu>>();
//	//Common字典数据缓存,非直接取用，仅可以从DAO层取用，reference DicCommonDAOImpl.java
//	//按group缓存
//	public static Map<Integer,List<DicCommon>> COMMON_DATA_GROUP_MAP = new HashMap<Integer,List<DicCommon>>();
//	//单个common缓存
//	public static Map<Integer,DicCommon> COMMON_DATA_ID = new HashMap<Integer,DicCommon>();
//	public static Map<Integer, List<KnwTitle>> NEWS_MAP = new HashMap<Integer, List<KnwTitle>>();
//	//---end 改用memecached缓存，以上变量将废弃--Patrick
	
	public static Map<Integer, List<DicInvestRange>> CLUB_PARAMETERS = new HashMap<Integer, List<DicInvestRange>>();
	
//	public static List<Object> REQUEST_INFO_LIST  = new ArrayList<Object>();
//	public static List<Object> SUPPLY_INFO_LIST = new ArrayList<Object>();
	
	public static Map<String, LinkedHashMap<String, String>> valueSet = getValueSet();
	public static Map<String, LinkedHashMap<String, String>> getValueSet(){
		Map<String, LinkedHashMap<String, String>> m = new HashMap<String, LinkedHashMap<String, String>>();
		LinkedHashMap<String, String> v1 = new LinkedHashMap<String, String> ();
		v1.put("1", "需要");
		v1.put("0", "不需要");
		m.put("ZJ101", v1);//101  需要 不需要
		LinkedHashMap<String, String> v2 = new LinkedHashMap<String, String> ();
		v2.put("1", "是");
		v2.put("0", "否");
		m.put("ZJ102", v2);//102  是 否
		LinkedHashMap<String, String> v3 = new LinkedHashMap<String, String> ();
		v3.put("1", "必须");
		v3.put("0", "非必须");
		m.put("ZJ103", v3);//103  必须 非必须
		//#{0:'不限', 10:'10万元以上', 20:'20万元以上', 30:'30万元以上'}
		LinkedHashMap<String, String> v4 = new LinkedHashMap<String, String> ();
		v4.put("0", "不限");
		v4.put("300", "300万元以上");
		v4.put("500", "500万元以上");
		v4.put("1000", "1000万元以上");
		v4.put("5000", "5000万元以上");
		v4.put("10000", "10000万元以上");
		m.put("ZJ104", v4);
		//#{0:'不限', 1:'1年', 2:'2年', 3:'3年', 4:'4年', 5:'5年及以上'}
		LinkedHashMap<String, String> v5 = new LinkedHashMap<String, String> ();
		v5.put("0", "不限");
		v5.put("1", "1年");
		v5.put("2", "2年");
		v5.put("3", "3年");
		v5.put("4", "4年");
		v5.put("5", "5年及以上");
		m.put("ZJ105", v5);
		//#{0:'不限', 1:'一年以上',  3:'三年以上', 5:'五年以上', 10:'十年以上', 20:'二十年以上'}
		LinkedHashMap<String, String> v6 = new LinkedHashMap<String, String> ();
		v6.put("0", "不限");
		v6.put("1", "一年以上");
		v6.put("3", "三年以上");
		v6.put("5", "五年以上");
		v6.put("10", "十年以上");
		v6.put("20", "二十年以上");
		m.put("ZJ106", v6);
		//#{0:'不限', 2000:'2000元以上', 5000:'5000元以上', 10000:'10000元以上'}
		LinkedHashMap<String, String> v7 = new LinkedHashMap<String, String> ();
		v7.put("0", "不限");
		v7.put("2000", "2000元以上");
		v7.put("5000", "5000元以上");
		v7.put("10000", "10000元以上");
		m.put("ZJ107", v7);
//		#{0:'不限', 1:'须打卡'}
		LinkedHashMap<String, String> v8 = new LinkedHashMap<String, String> ();
		v8.put("0", "不限");
		v8.put("1", "须打卡");
		m.put("ZJ108", v8);
//		#{0:'不限', 12:'一年以上', 36:'三年以年'}
		LinkedHashMap<String, String> v9 = new LinkedHashMap<String, String> ();
		v9.put("0", "不限");
		v9.put("12", "一年以上");
		v9.put("36", "三年以上");
		m.put("ZJ109", v9);
		LinkedHashMap<String, String> v10 = new LinkedHashMap<String, String> ();
		v10.put("6", "银行");
		v10.put("7", "信托公司");
		v10.put("8", "小额贷款公司");
		v10.put("9", "典当公司");
		v10.put("10", "担保公司");
		v10.put("11", "融资租赁公司");
		v10.put("12", "民间资本");
		m.put("ZJ110", v10);
		LinkedHashMap<String, String> v11 = new LinkedHashMap<String, String> ();
		v11.put("2", "生产型企业");
		v11.put("3", "贸易型企业");
		v11.put("4", "工贸一体型企业");
		v11.put("5", "服务型企业");
		m.put("ZJ111", v11);
		
		LinkedHashMap<String, String> v12 = new LinkedHashMap<String, String> ();
		v12.put("0", "不限");
		v12.put("100", "100万元以上");
		v12.put("300", "300万元以上");
		v12.put("500", "500万元以上");
		v12.put("1000", "1000万元以上");
		v12.put("5000", "5000万元以上");
		m.put("ZJ112", v12);

		LinkedHashMap<String, String> v13 = new LinkedHashMap<String, String>();
		v13.put("1", "农、林、牧、渔业");
		v13.put("2", "采矿业");
		v13.put("3", "制造业");
		v13.put("4", "电力、热力、燃气及水生产和供应业");
		v13.put("5", "建筑业");
		v13.put("6", "批发和零售业");
		v13.put("7", "交通运输、仓储和邮政业");
		v13.put("8", "住宿和餐饮业");
		v13.put("9", "信息传输、软件和信息技术服务业");
		v13.put("10", "金融业");
		v13.put("11", "房地产业");
		v13.put("12", "租赁和商务服务业");
		v13.put("13", "科学研究和技术服务业");
		v13.put("14", "居民服务、修理和其他服务业");
		v13.put("15", "教育");
		v13.put("16", "文化、体育和娱乐业");
		m.put("ZJ113", v13);
		
		LinkedHashMap<String, String> v14 = new LinkedHashMap<String, String> ();
		v14.put("1", "单行文本框");
		v14.put("2", "多行文本框");
		v14.put("3", "下拉选择框");
		v14.put("4", "多选框");
		m.put("ZJ114", v14);
		
		LinkedHashMap<String, String> v15 = new LinkedHashMap<String, String> ();
		v15.put("197", "待审核");
		v15.put("198", "已发布");
		v15.put("199", "已撤销");
		m.put("ZJ115", v15);
		
		return m;
	}
	
	public static InterestBean[] getInterestArr(){
		InterestBean[] i = new InterestBean[5];
		i[0] = new InterestBean(new Integer(0),new Integer(6), new Double(5.85));
		i[1] = new InterestBean(new Integer(6),new Integer(12), new Double(6.31));
		i[2] = new InterestBean(new Integer(12),new Integer(36), new Double(6.4));
		i[3] = new InterestBean(new Integer(36),new Integer(60), new Double(6.65));
		i[4] = new InterestBean(new Integer(60),new Integer(1000), new Double(6.8));
		return i;
	}

}