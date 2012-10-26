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
	private AccountService accountService;
	private Pager pager;
	private Integer pageNo;
	private Integer cost; //管理员后台更改付费
	private Integer ordType;  //服务类型
	private Integer ordStatus;  //付款状态
	private Integer ordWay;  //付款方式
	private Integer delete;  //订单状态
	private Integer ucId;  //会员信息id
	private String ordName;  //用户名
	
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
		if(cost != null){
			Integer userId =8;
			memberService.updateOrdMPStatus(cost, Constants.USER_VIPTYPE_PAYSTATUS_ON);
			UsrMemberPeroid usrMemberPeroidOld =memberService.getUsrMP(userId);
			//List<UsrMemberPeroid> usrMPList =memberService.findOrdMPByUserid(userId);
			UsrMemberPeroid usrMemberPeroid=new UsrMemberPeroid();
			if(usrMemberPeroidOld != null){
				Date now = Calendar.getInstance().getTime();
				usrMemberPeroid.setUserId(userId);
				usrMemberPeroid.setMemberStart(usrMemberPeroidOld.getMemberEnd());
				usrMemberPeroid.setMemberEnd(DateUtil.addDay(usrMemberPeroid.getMemberStart(), 365));
				usrMemberPeroid.setCreateTime(now);
				usrMemberPeroid.setMemberType(Constants.USER_VIPTYPE_COMMON);
				usrMemberPeroid.setOrderId(cost);
				usrMemberPeroid.setStatus(Constants.USER_VIPTYPE_PEROID_STATUS_AFTER);
			}else{
				Date now = Calendar.getInstance().getTime();
				usrMemberPeroid.setUserId(userId);
				usrMemberPeroid.setMemberStart(now);
				usrMemberPeroid.setMemberEnd(DateUtil.addDay(usrMemberPeroid.getMemberStart(), 365));
				usrMemberPeroid.setCreateTime(now);
				usrMemberPeroid.setMemberType(Constants.USER_VIPTYPE_COMMON);
				usrMemberPeroid.setOrderId(cost);
				usrMemberPeroid.setStatus(Constants.USER_VIPTYPE_PEROID_STATUS_NOW);
				accountService.updateUserVip(8, Constants.USER_VIPTYPE_COMMON);
			}
			memberService.saveUsrMP(usrMemberPeroid);
			msg=SUCCESS;
		}else{
			return ERROR;
		}
		return "ajax";
	}
	/**显示所有会员用户*/
	public String showMember(){
		Integer id = null;
		Integer userid = null;
		Integer orderId = null;
		Integer memberType = null;
		pager=memberService.findAllUsrMP(id, userid, orderId, memberType, pageNo, pageSize);
		return "memberDetails";
	}
	/**显示所有会员用户*/
	public String showProfile(){
		if(ucId != null){
			usrMemberPeroid=memberService.getUsrMPById(ucId);
		}else{
			return ERROR;
		}
		return "memberDetails";
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
	
}
