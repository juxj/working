package com.zj198.action.admin.user;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.zj198.action.BaseAction;
import com.zj198.model.OrdMembership;
import com.zj198.model.UsrMemberPeroid;
import com.zj198.service.user.AccountService;
import com.zj198.service.user.MemberService;
import com.zj198.util.Constants;
import com.zj198.util.DateUtil;
import com.zj198.util.Pager;

public class PayManagementAction extends BaseAction{
	
	private List<OrdMembership> ordMSList;
	private MemberService memberService;
	private UsrMemberPeroid usrMemberPeroid;
	private OrdMembership ordMembership;
	private AccountService accountService;
	private Pager pager;
	private Integer pageNo;
	private Integer cost; //管理员后台更改付费
	private Integer ordType;  //服务类型
	private Integer ordStatus;  //付款状态----会员状态
	private Integer ordWay;  //付款方式
	private Integer delete;  //订单状态
	private Integer ucId;  //会员信息id----
	private Integer ordId;   //订单id
	private String ordName;  //用户名
	private Date[] startdt; //开始时间
	private Date[] createdt;//创建时间
	private Integer userId; //用户id
	
	private static final Integer pageSize=10;
	/**显示所有付款订单*/
	public String execute(){
		Integer id = null;
		Integer userid = null;
		//SELECT o.*,u.username FROM ORD_MEMBERSHIP as o,USR_USER as u where o.user_id=u.id
		pager=memberService.findAllOrdMP(id, userid, pageNo, pageSize);
		return "payDetails";
	}
	/**管理员后台  改成已付款 并生成会员信息*/
	public String payCost(){
		if(ordId != null){
			OrdMembership ordMembership = memberService.getOrdMPById(ordId);
			if(ordMembership != null){
				memberService.updateOrdMPStatus(ordId, Constants.USER_VIPTYPE_PAYSTATUS_ON);
				UsrMemberPeroid usrMemberPeroidOld =memberService.getUsrMP(ordMembership.getUserId());
				UsrMemberPeroid usrMemberPeroid=new UsrMemberPeroid();
				if(usrMemberPeroidOld != null){
					Date now = Calendar.getInstance().getTime();
					usrMemberPeroid.setUserId(ordMembership.getUserId());
					usrMemberPeroid.setMemberStart(usrMemberPeroidOld.getMemberEnd());
					usrMemberPeroid.setMemberEnd(DateUtil.addDay(usrMemberPeroid.getMemberStart(), 365));
					usrMemberPeroid.setCreateTime(now);
					usrMemberPeroid.setMemberType(ordMembership.getMemberType());
					usrMemberPeroid.setOrderId(ordId);
					usrMemberPeroid.setStatus(Constants.USER_VIPTYPE_PEROID_STATUS_AFTER);
				}else{
					Date now = Calendar.getInstance().getTime();
					usrMemberPeroid.setUserId(ordMembership.getUserId());
					usrMemberPeroid.setMemberStart(now);
					usrMemberPeroid.setMemberEnd(DateUtil.addDay(usrMemberPeroid.getMemberStart(), 365));
					usrMemberPeroid.setCreateTime(now);
					usrMemberPeroid.setMemberType(ordMembership.getMemberType());
					usrMemberPeroid.setOrderId(ordId);
					usrMemberPeroid.setStatus(Constants.USER_VIPTYPE_PEROID_STATUS_NOW);
					accountService.updateUserVip(ordMembership.getUserId(), ordMembership.getMemberType());
				}
				memberService.saveUsrMP(usrMemberPeroid);
				msg=SUCCESS;
			}else{
				return ERROR;
			}
			msg="没有此订单";
		}
		return "ajax";
	}
	/**显示所有会员用户*/
	public String showMember(){
		pager=memberService.findAllUsrMP(ordId, ordName, ordStatus, ordType, startdt, createdt, pageNo, pageSize);
		return "memberDetails";
	}
	/**根据id显示会员用户*/
	public String showProfile(){
		if(ucId != null){
			usrMemberPeroid=memberService.getUsrMPById(ucId);
		}else{
			return ERROR;
		}
		return "memberDetails";
	}
	/**根据订单编号显示订单详情*/
	public String showOrd(){
		//System.out.println(ordId);
		if(ordId != null && ordId>-1){
			ordMembership=memberService.getOrdMPById(ordId);
		}else{
			return ERROR;
		}
		return "_ordInfo";
	}
	//-------------get  set
	public List<OrdMembership> getOrdMSList() {
		return ordMSList;
	}
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	public Pager getPager() {
		return pager;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public void setCost(Integer cost) {
		this.cost = cost;
	}
	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}
	public UsrMemberPeroid getUsrMemberPeroid() {
		return usrMemberPeroid;
	}
	public void setUcId(Integer ucId) {
		this.ucId = ucId;
	}
	public Integer getOrdType() {
		return ordType;
	}
	public Integer getOrdStatus() {
		return ordStatus;
	}
	public Integer getOrdWay() {
		return ordWay;
	}
	public Integer getDelete() {
		return delete;
	}
	public String getOrdName() {
		return ordName;
	}
	public void setOrdType(Integer ordType) {
		this.ordType = ordType;
	}
	public void setOrdStatus(Integer ordStatus) {
		this.ordStatus = ordStatus;
	}
	public void setOrdWay(Integer ordWay) {
		this.ordWay = ordWay;
	}
	public void setDelete(Integer delete) {
		this.delete = delete;
	}
	public void setOrdName(String ordName) {
		this.ordName = ordName;
	}
	public Date[] getStartdt() {
		return startdt;
	}
	public Date[] getCreatedt() {
		return createdt;
	}
	public void setStartdt(Date[] startdt) {
		this.startdt = startdt;
	}
	public void setCreatedt(Date[] createdt) {
		this.createdt = createdt;
	}
	public Integer getOrdId() {
		return ordId;
	}
	public void setOrdId(Integer ordId) {
		this.ordId = ordId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public OrdMembership getOrdMembership() {
		return ordMembership;
	}
	
}
