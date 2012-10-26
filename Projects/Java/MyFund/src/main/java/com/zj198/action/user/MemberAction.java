package com.zj198.action.user;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.model.DicProvince;
import com.zj198.model.OrdMembership;
import com.zj198.model.UsrMemberPeroid;
import com.zj198.model.UsrUser;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.user.AccountService;
import com.zj198.service.user.MemberService;
import com.zj198.util.Constants;
import com.zj198.util.DateUtil;

public class MemberAction extends BaseAction{
	private int mType;
	private List<DicProvince> listProvince;
	private List<OrdMembership> ordMSList;
	private OrdMembership ordMembership;
	private MemberService memberService;
	private DictoryDataService  dictoryDataService;
	private AccountService accountService;
	private Integer ordId;
	
	/**
	 * 判断是否是企业或个人  跳转到详情页
	 */
	public String execute(){
//		public String capitalLetter(){
		ActionContext context = ActionContext.getContext();	
		UsrUser user = (UsrUser)context.getSession().get("_user");
//		if(user.getUserTypeGroup() != Constants.USERTYPE_GROUP_COMPANY && user.getUserTypeGroup() != Constants.USERTYPE_GROUP_PERSONAL){
//			msg="只有企业和个人才能申请会员";
//			return "error";
//		}
		return "capital";
	}
	
	/**
	 * 企业和个人申请会员  根据传入数据判断是申请认证还是vip
	 */
	public String memberType(){
//		if(mType == Integer.parseInt(PropertiesUtil.getByKey("userType"))){
//			ActionContext context = ActionContext.getContext();	
//			UsrUser user = (UsrUser)context.getSession().get("_user");
//		}else if(mType == Integer.parseInt(PropertiesUtil.getByKey("userVip"))){
//			
//		}
		listProvince=dictoryDataService.findAllProvince();
		return "payment";
	}
	/**
	 * 用户填完信息   保存成功  跳转付款页面
	 * @param mType
	 */
	public String next(){
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
			ordMembership.setUserId(user.getId());
			memberService.saveOrdMP(ordMembership);
		}
		msg="订单已成功 ，正等待付款";
		return "next";
	}
	/**用户付款*/
	public String paymentManagement(){
		ActionContext context = ActionContext.getContext();	
		UsrUser user = (UsrUser)context.getSession().get("_user");
		if(ordId != null && ordId!=0){
			if(user.getViptype() == Constants.USER_VIPTYPE_NONE){
			}else if(user.getViptype() == Constants.USER_VIPTYPE_COMMON){
			}else if(user.getViptype() == Constants.USER_VIPTYPE_VIP){
			}
		}else{
			return ERROR;
		}
		if(ordId != null && ordId!=0){
			//OrdMembership ordMembershipOld=memberService.getOrdMPById(ordId);
			OrdMembership ordMembership_new=memberService.getOrdMPById(ordId);
			memberService.updateOrdMPStatus(ordId, Constants.USER_VIPTYPE_PAYSTATUS_ON);
			UsrMemberPeroid usrMemberPeroidOld =memberService.getUsrMP(user.getId());
			UsrMemberPeroid usrMemberPeroid=new UsrMemberPeroid();
			if(usrMemberPeroidOld != null){
				Date now = Calendar.getInstance().getTime();
				usrMemberPeroid.setUserId(user.getId());
				usrMemberPeroid.setMemberStart(usrMemberPeroidOld.getMemberEnd());
				usrMemberPeroid.setMemberEnd(DateUtil.addDay(usrMemberPeroid.getMemberStart(), 365));
				usrMemberPeroid.setCreateTime(now);
				usrMemberPeroid.setMemberType(ordMembership_new.getMemberType());
				usrMemberPeroid.setOrderId(ordId);
				usrMemberPeroid.setStatus(Constants.USER_VIPTYPE_PEROID_STATUS_AFTER);
			}else{
				Date now = Calendar.getInstance().getTime();
				usrMemberPeroid.setUserId(user.getId());
				usrMemberPeroid.setMemberStart(now);
				usrMemberPeroid.setMemberEnd(DateUtil.addDay(usrMemberPeroid.getMemberStart(), 365));
				usrMemberPeroid.setCreateTime(now);
				usrMemberPeroid.setMemberType(ordMembership_new.getMemberType());
				usrMemberPeroid.setOrderId(ordId);
				usrMemberPeroid.setStatus(Constants.USER_VIPTYPE_PEROID_STATUS_NOW);
				accountService.updateUserVip(8, ordMembership_new.getMemberType());
			}
			memberService.saveUsrMP(usrMemberPeroid);
			msg=SUCCESS;
		}else{
			return ERROR;
		}
		return "payCost";
	}
	/**用户付款*/
	public String payNext(){
		ActionContext context = ActionContext.getContext();	
		UsrUser user = (UsrUser)context.getSession().get("_user");
		if(ordId != null && ordId!=0){
			ordMembership=memberService.getOrdMPById(ordId);
			if(user.getViptype() == Constants.USER_VIPTYPE_NONE){
			}else if(user.getViptype() == Constants.USER_VIPTYPE_COMMON){
			}else if(user.getViptype() == Constants.USER_VIPTYPE_VIP){
			}
		}else{
			return ERROR;
		}
		return "next";
	}
	/**付款管理列表*/
	public String details(){
		ActionContext context = ActionContext.getContext();	
		UsrUser user = (UsrUser)context.getSession().get("_user");
		ordMSList=memberService.findOrdMPByUserid(user.getId());
		return "details";
	}
	/**用户删除订单*/
	public String deleteOrd(){
		if(ordId != null && ordId!=0){
			memberService.deleteOrdMPById(ordId);
		}else{
			return ERROR;
		}
		msg="删除成功。";
		return details();
	}
	//------------get  and    set---------
	public void setMType(int mType) {
		this.mType = mType;
	}
	public int getMType() {
		return mType;
	}
	public OrdMembership getOrdMembership() {
		return ordMembership;
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
	
}
