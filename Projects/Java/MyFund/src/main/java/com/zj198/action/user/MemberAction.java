package com.zj198.action.user;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.time.DateUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.model.DicProvince;
import com.zj198.model.OrdMembership;
import com.zj198.model.UsrCompany;
import com.zj198.model.UsrMemberPeroid;
import com.zj198.model.UsrPerson;
import com.zj198.model.UsrUser;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.user.AccountService;
import com.zj198.service.user.MemberService;
import com.zj198.service.user.ProfileService;
import com.zj198.util.Constants;
import com.zj198.util.DateUtil;
import com.zj198.util.PropertiesUtil;
import com.zj198.util.payment.unionpay.PaymentConf;
import com.zj198.util.payment.unionpay.PaymentUtils;

/**
 * @author Administrator
 *
 */
/**
 * @author Administrator
 *
 */
public class MemberAction extends BaseAction{
	private Integer memberType;
	private List<DicProvince> listProvince;
	private List<OrdMembership> ordMSList;
	private OrdMembership ordMembership;
	private MemberService memberService;
	private DictoryDataService  dictoryDataService;
	private AccountService accountService;
	private Integer ordId;
	private Map<String,String> profileMap;
	private UsrPerson usrPerson;
	private UsrCompany usrCompany;
	private ProfileService profileService;
	private Integer sendway;

	/**
	 * 跳转到 选择资信通选择类型 
	 */
	public String execute(){
//		new PaymentQuery().queryTrans("01", "2012110715583122", "20121107155831");
		return "memberType";
	}
	
	/**
	 * 填写订单信息
	 */
	public String orderEdit(){
		ActionContext ctx = ActionContext.getContext();	
		UsrUser user = (UsrUser)ctx.getSession().get("_user");
		if(ordId != null && ordId > 0){
			ordMembership=memberService.getOrdMPById(ordId);
			if(ordMembership == null || ordMembership.getUserId()-user.getId()!=0){
				return ERROR;
			}
		}
		if(ordMembership == null){
			ordMembership=new OrdMembership();
		}
		if(memberType == null ){}else if(memberType == Constants.USER_VIPTYPE_COMMON || memberType == Constants.USER_VIPTYPE_VIP){
			ordMembership.setMemberType(memberType);
			if(ordMembership.getMemberType() == Constants.USER_VIPTYPE_COMMON){
				ordMembership.setPayAmount(Constants.USER_VIPTYPE_COMMON_COST);
			}else if(ordMembership.getMemberType() == Constants.USER_VIPTYPE_VIP){
				ordMembership.setPayAmount(Constants.USER_VIPTYPE_VIP_COST);
			}else{
				return ERROR;
			}
		}
		int groupid = profileService.getGroupidByUserType(user.getType());
		switch (groupid){
			case Constants.USERTYPE_GROUP_PERSONAL:
				usrPerson = (UsrPerson)profileService.getProfiles(user.getId());
				ordMembership.setProvinceid(usrPerson.getProvinceid());
				ordMembership.setCityid(usrPerson.getCityid());
				ordMembership.setDistrictid(usrPerson.getDistrictid());
				ordMembership.setPostcode(usrPerson.getPostcode());
				ordMembership.setInvoiceReceiver(user.getRealname());
				ordMembership.setAddress(usrPerson.getAddress());
				ordMembership.setTelphone(usrPerson.getTelephone());
				break;
			case Constants.USERTYPE_GROUP_COMPANY:
				usrCompany = (UsrCompany)profileService.getProfiles(user.getId());
				ordMembership.setProvinceid(usrCompany.getBizprovinceid());
				ordMembership.setCityid(usrCompany.getBizcityid());
				ordMembership.setDistrictid(usrCompany.getBizdistrictid());
				ordMembership.setPostcode(usrCompany.getBizpostcode());
				ordMembership.setInvoiceReceiver(usrCompany.getLinkname());
				ordMembership.setAddress(usrCompany.getBizaddress());
				ordMembership.setTelphone(usrCompany.getLinktelephone());
				break;
			default:
				return ERROR;
		}
		profileMap=new HashMap<String,String>();
		profileMap.put("address", dictoryDataService.getPCDNameByIds(ordMembership.getProvinceid(), ordMembership.getCityid(), ordMembership.getDistrictid()));
		listProvince=dictoryDataService.findAllProvince();
		return "orderEdit";
	}
	/**
	 * 用户填完信息   订单保存成功  跳转订单查看
	 * @param memberType
	 */
	public String saveOrder(){
		if(ordMembership != null){
			ActionContext context = ActionContext.getContext();	
			UsrUser user = (UsrUser)context.getSession().get("_user");
			if(ordMembership.getMemberType() == Constants.USER_VIPTYPE_COMMON){
				ordMembership.setPayAmount(Constants.USER_VIPTYPE_COMMON_COST);
			}else if(ordMembership.getMemberType() == Constants.USER_VIPTYPE_VIP){
				ordMembership.setPayAmount(Constants.USER_VIPTYPE_VIP_COST);
			}else{
				return ERROR;
			}
			if(ordMembership.getInvoiceSendway() == 1){
				if(sendway == 1 ){
					int groupid = profileService.getGroupidByUserType(user.getType());
					switch (groupid){
						case Constants.USERTYPE_GROUP_BANK:
							usrPerson = (UsrPerson)profileService.getProfiles(user.getId());
							ordMembership.setProvinceid(usrPerson.getProvinceid());
							ordMembership.setCityid(usrPerson.getCityid());
							ordMembership.setDistrictid(usrPerson.getDistrictid());
							ordMembership.setPostcode(usrPerson.getPostcode());
							ordMembership.setInvoiceReceiver(user.getRealname());
							ordMembership.setAddress(usrPerson.getAddress());
							ordMembership.setTelphone(usrPerson.getTelephone());
							break;
						case Constants.USERTYPE_GROUP_COMPANY:
							usrCompany = (UsrCompany)profileService.getProfiles(user.getId());
							ordMembership.setProvinceid(usrCompany.getBizprovinceid());
							ordMembership.setCityid(usrCompany.getBizcityid());
							ordMembership.setDistrictid(usrCompany.getBizdistrictid());
							ordMembership.setPostcode(usrCompany.getBizpostcode());
							ordMembership.setInvoiceReceiver(usrCompany.getLinkname());
							ordMembership.setTelphone(usrCompany.getLinktelephone());
							break;
						default:
							return ERROR;
					}
				}
			}
			ordMembership.setUserId(user.getId());
			memberService.saveOrdMP(ordMembership);
		}
		if(ordMembership.getInvoiceSendway() == 1){
			profileMap=new HashMap<String,String>();
			profileMap.put("address", dictoryDataService.getPCDNameByIds(ordMembership.getProvinceid(), ordMembership.getCityid(), ordMembership.getDistrictid()));
		}
		msg="订单已生成成功 ，请确认订单信息。";
		return "orderView";
	}
	/**
	 * 用户填完信息   订单保存成功  跳转订单查看
	 * @param memberType
	 */
	public String orderView(){
		if(ordId == null ){
			return ERROR;
		}
		ActionContext ctx = ActionContext.getContext();	
		UsrUser user = (UsrUser)ctx.getSession().get("_user");
		ordMembership=memberService.getOrdMPById(ordId);
		if(ordMembership==null || ordMembership.getUserId()-user.getId()!=0){
			return ERROR;
		}
		if(ordMembership.getInvoiceSendway() == 1){
			profileMap=new HashMap<String,String>();
			profileMap.put("address", dictoryDataService.getPCDNameByIds(ordMembership.getProvinceid(), ordMembership.getCityid(), ordMembership.getDistrictid()));
		}
		return "orderView";
	}
	
	//跳转支付--Patrick
	public String payment(){
		if(ordId == null ){
			return ERROR;
		}
		ActionContext ctx = ActionContext.getContext();	
		UsrUser user = (UsrUser)ctx.getSession().get("_user");
		OrdMembership order=memberService.getOrdMPById(ordId);
		if(order==null || order.getUserId()-user.getId()!=0){
			return ERROR;
		}
		
		HttpServletRequest request=(HttpServletRequest)ctx.get(ServletActionContext.HTTP_REQUEST );
		HttpServletResponse response = (HttpServletResponse)ctx.get(ServletActionContext.HTTP_RESPONSE);
		Date now = Calendar.getInstance().getTime();
		//商户需要组装如下对象的数据
		String[] valueVo = new String[]{
				PaymentConf.version,//协议版本
				PaymentConf.charset,//字符编码
	            "01",//交易类型
	            "",//原始交易流水号
	            PaymentConf.merCode,//商户代码
	            PaymentConf.merName,//商户简称
	            "",//收单机构代码（仅收单机构接入需要填写）
	            "",//商户类别（收单机构接入需要填写）
	            "http://"+PropertiesUtil.getByKey("url")+"/user/payment!memberType.act",//商品URL
	            "VIP会员费",//商品名称
	            order.getPayAmount().intValue()+"00",
//	            "500000",//商品单价 单位：分
	            "1",//商品数量
	            "0",//折扣 单位：分
	            "0",//运费 单位：分
//	            order.getId().toString(),//订单号（需要商户自己生成）
	            DateUtil.formatDateTime(now,"yyyyMMddHHmmss")+order.getId(),
//	            new SimpleDateFormat("yyyyMMddHHmmss").format(now)+order.getId(),//订单号（需要商户自己生成）
	            order.getPayAmount().intValue()+"00",//"500000",//交易金额 单位：分
	            "156",//交易币种
	            DateUtil.formatDateTime(now,"yyyyMMddHHmmss"),//交易时间
	            request.getRemoteAddr(),//"127.0.0.1",//用户IP
	            user.getRealname(),//"Patrick",//用户真实姓名
	            "",//默认支付方式
	            "",//默认银行编号
	            "300000",//交易超时时间
	            "http://"+PropertiesUtil.getByKey("url")+"/user/payment!orderList.act",// 前台回调商户URL
	            "http://"+PropertiesUtil.getByKey("url")+"/user/payment!backInterface.act",// 后台回调商户URL
	            ""//商户保留域
		};
		
//		String signType = request.getParameter("sign");
//		if (signType_SHA1withRSA.equalsIgnoreCase(signType)) {
//			signType = PaymentConf.signType;
//		}
		
		String html = new PaymentUtils().createPayHtml(valueVo, PaymentConf.signType);//跳转到银联页面支付
		
		response.setContentType("text/html;charset="+PaymentConf.charset);   
		response.setCharacterEncoding(PaymentConf.charset);
		try {
			response.getWriter().write(html);
		} catch (IOException e) {
			
		}
		response.setStatus(200);
		return null;
	}
	
	/**支付第三方调用的返回action*/
	public void backInterface(){
		System.out.println("----back revoke begin------");
		ActionContext context = ActionContext.getContext();	
		HttpServletRequest request=(HttpServletRequest)context.get(ServletActionContext.HTTP_REQUEST);
		HttpServletResponse response = (HttpServletResponse)context.get(ServletActionContext.HTTP_RESPONSE);
		try {
			request.setCharacterEncoding(PaymentConf.charset);
		} catch (UnsupportedEncodingException e) {
		}
		
		String[] resArr = new String[PaymentConf.notifyVo.length]; 
		for(int i=0;i<PaymentConf.notifyVo.length;i++){
			resArr[i] = request.getParameter(PaymentConf.notifyVo[i]);
			System.out.println(PaymentConf.notifyVo[i]+" : "+resArr[i]);
		}
		String signature = request.getParameter(PaymentConf.signature);
		String signMethod = request.getParameter(PaymentConf.signMethod);
		
		response.setContentType("text/html;charset="+PaymentConf.charset);   
		response.setCharacterEncoding(PaymentConf.charset);
		
//		try {
			Boolean signatureCheck = new PaymentUtils().checkSign(resArr, signMethod, signature);
//			response.getWriter()
//			.append("建议前台通知和后台通知用两个类实现，后台通知进行商户的数据库等处理,前台通知实现客户浏览器跳转<br>")
//			.append("签名是否正确："+ signatureCheck)
//			.append("<br>交易是否成功："+"00".equals(resArr[10]));
//			if(!"00".equals(resArr[10])){
//				response.getWriter().append("<br>失败原因:"+resArr[11]);
//			}
//		} catch (IOException e) {
//			
//		}
		
		
//		UsrUser user = (UsrUser)context.getSession().get("_user");

		if(signatureCheck && "00".equals(resArr[10]) && ordId != null && ordId>0){
			//OrdMembership ordMembershipOld=memberService.getOrdMPById(ordId);
			OrdMembership ordMembership_new=memberService.getOrdMPById(ordId);
			memberService.updateOrdMPStatus(ordMembership_new.getId(), Constants.USER_VIPTYPE_PAYSTATUS_ON);
			UsrMemberPeroid usrMemberPeroidOld =memberService.getUsrMP(ordMembership_new.getUserId());
			UsrMemberPeroid usrMemberPeroid=new UsrMemberPeroid();
			Calendar now = DateUtils.truncate(Calendar.getInstance(), Calendar.DAY_OF_MONTH);
			if(usrMemberPeroidOld != null){
				usrMemberPeroid.setUserId(ordMembership_new.getUserId());
				usrMemberPeroid.setMemberStart(DateUtil.addDay(usrMemberPeroidOld.getMemberEnd(),1));
				usrMemberPeroid.setMemberEnd(DateUtil.addDay(usrMemberPeroid.getMemberStart(), 365));
				usrMemberPeroid.setCreateTime(now.getTime());
				usrMemberPeroid.setMemberType(ordMembership_new.getMemberType());
				usrMemberPeroid.setOrderId(ordMembership_new.getId());
				usrMemberPeroid.setStatus(Constants.USER_VIPTYPE_PEROID_STATUS_AFTER);
			}else{
				usrMemberPeroid.setUserId(ordMembership_new.getUserId());
				usrMemberPeroid.setMemberStart(now.getTime());
				usrMemberPeroid.setMemberEnd(DateUtil.addDay(usrMemberPeroid.getMemberStart(), 365));
				usrMemberPeroid.setCreateTime(now.getTime());
				usrMemberPeroid.setMemberType(ordMembership_new.getMemberType());
				usrMemberPeroid.setOrderId(ordMembership_new.getId());
				usrMemberPeroid.setStatus(Constants.USER_VIPTYPE_PEROID_STATUS_NOW);
				accountService.updateUserVip(ordMembership_new.getUserId(), ordMembership_new.getMemberType());
			}
			memberService.saveUsrMP(usrMemberPeroid);
			
			response.setStatus(HttpServletResponse.SC_OK);
		}else{
			response.setStatus(HttpServletResponse.SC_NOT_FOUND);
		}
		
		System.out.println("----back revoke end------");
//		return "error";
	}
//	/**用户付款*/
//	public String payNext(){
//		ActionContext context = ActionContext.getContext();	
//		UsrUser user = (UsrUser)context.getSession().get("_user");
//		if(ordId != null && ordId!=0){
//			ordMembership=memberService.getOrdMPById(ordId);
//			if(user.getViptype() == Constants.USER_VIPTYPE_NONE){
//				
//			}else if(user.getViptype() == Constants.USER_VIPTYPE_COMMON){
//				
//			}else if(user.getViptype() == Constants.USER_VIPTYPE_VIP){
//				
//			}
//		}else{
//			return ERROR;
//		}
//		return "next";
//	}
	
	/**付款管理列表*/
	public String orderList(){
		ActionContext context = ActionContext.getContext();	
		UsrUser user = (UsrUser)context.getSession().get("_user");
		ordMSList=memberService.findOrdMPByUserid(user.getId());
		return "orderList";
	}
	
	/**用户删除订单*/
	public String deleteOrd(){
		if(ordId != null && ordId!=0){
			ActionContext context = ActionContext.getContext();	
			UsrUser user = (UsrUser)context.getSession().get("_user");
			memberService.deleteOrdMPByIdUid(ordId,user.getId());
		}else{
			return ERROR;
		}
		msg="删除成功。";
		return orderList();
	}
	
	//------------get  and    set---------
	
	public OrdMembership getOrdMembership() {
		return ordMembership;
	}
	public void setMemberType(Integer memberType) {
		this.memberType = memberType;
	}

	public void setOrdMembership(OrdMembership ordMembership) {
		this.ordMembership = ordMembership;
	}
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	public List<DicProvince> getListProvince() {
		return listProvince;
	}

	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}

	public List<OrdMembership> getOrdMSList() {
		return ordMSList;
	}

	public void setOrdId(Integer ordId) {
		this.ordId = ordId;
	}

	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}

	public Map<String, String> getProfileMap() {
		return profileMap;
	}

	public UsrPerson getUsrPerson() {
		return usrPerson;
	}

	public UsrCompany getUsrCompany() {
		return usrCompany;
	}

	public void setProfileService(ProfileService profileService) {
		this.profileService = profileService;
	}

	public void setSendway(Integer sendway) {
		this.sendway = sendway;
	}

}
