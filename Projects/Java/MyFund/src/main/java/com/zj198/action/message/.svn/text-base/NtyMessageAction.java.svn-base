package com.zj198.action.message;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.model.NtyMessage;
import com.zj198.model.UsrUser;
import com.zj198.service.loan.FinanceApplyService;
import com.zj198.service.message.NtyMessageService;
import com.zj198.service.message.model.AddMessageSpModel;

public class NtyMessageAction extends BaseAction {
	private NtyMessageService ntyMessageService;
	private FinanceApplyService financeApplyService;
	private AddMessageSpModel addMessageSpModel;
	private Integer applyId;
	// 置顶信息全部显示
	private List<NtyMessage> topMsgs;
	// 全选获取msgIds数组
	private String[] msgIds;
	// 删除单条记录
	private String mid;
	// 选择样式
	private String css;

	public String execute() {
		return null;
	}

	public String sendMessage() {
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		// AdmUser admin = (AdmUser) context.getSession().get("_admin");
		if (user == null) {
			return ERROR;
		}
		addMessageSpModel.setSendUserId(user.getId());
		Integer[] rid = new Integer[1];
		rid[0] = financeApplyService.findById(applyId).getUserId();
		addMessageSpModel.setReceiverId(rid);
		ntyMessageService.addNewMessage(addMessageSpModel);
		return SUCCESS;
	}

	/**
	 * 进入消息页面, 置顶信息(最近2条)+一般信息(所有信息：未读+已读)
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-8-8| 上午11:20:16
	 * @return
	 */
	public String viewMsg() {
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		if (user == null) {
			return ERROR;
		}
		css = "-1";
		// 显示置顶信息
		topMsgs = ntyMessageService.findTopMsgs(user.getId());
		// 分页显示一般信息(所有信息)
		pager = ntyMessageService.findComMsgs(pager == null ? 1 : pager.getCurrentPage(), pager == null ? 5 : pager.getPageCount(), user.getId());

		return "viewMsg";
	}

	/**
	 * 点击查看详情后,把未读信息的状态自动设置为已读状态
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-8-8| 上午11:21:48
	 * @return
	 */
	public String upIsRead() {
		HttpServletResponse response = ServletActionContext.getResponse();
		ntyMessageService.updateIsRead(Long.parseLong(mid));
		try {
			PrintWriter out = response.getWriter();
			out.write("[{success:true}]");
			out.flush();
			out.close();
			return null;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 选择未读信息
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-8-8| 上午11:31:08
	 * @return
	 */
	public String unRead() {
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		if (user == null) {
			return ERROR;
		}
		css = "0";
		// 显示置顶信息
		topMsgs = ntyMessageService.findTopMsgs(user.getId());
		// 分页显示一般信息(未读信息)
		pager = ntyMessageService.findComMsgsNoRead(pager == null ? 1 : pager.getCurrentPage(), pager == null ? 5 : pager.getPageCount(), user.getId());

		return "viewMsg";
	}

	/**
	 * 选择未读信息
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-8-8| 上午11:31:08
	 * @return
	 */
	public String read() {
		ActionContext context = ActionContext.getContext();
		UsrUser user = (UsrUser) context.getSession().get("_user");
		if (user == null) {
			return ERROR;
		}
		css = "1";
		// 显示置顶信息
		topMsgs = ntyMessageService.findTopMsgs(user.getId());
		// 分页显示一般信息(已读信息)
		pager = ntyMessageService.findComMsgsRead(pager == null ? 1 : pager.getCurrentPage(), pager == null ? 5 : pager.getPageCount(), user.getId());

		return "viewMsg";
	}

	/**
	 * 删除所选信息
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-8-8| 上午11:26:20
	 * @return
	 */
	public String delAll() {

		if (mid != null) {
			ntyMessageService.deleteAll(new String[] { mid });
		}
		if (msgIds != null && msgIds.length > 0) {
			ntyMessageService.deleteAll(msgIds);
		}
		return "delAll";
	}

	public void setNtyMessageService(NtyMessageService ntyMessageService) {
		this.ntyMessageService = ntyMessageService;
	}

	public AddMessageSpModel getAddMessageSpModel() {
		return addMessageSpModel;
	}

	public void setAddMessageSpModel(AddMessageSpModel addMessageSpModel) {
		this.addMessageSpModel = addMessageSpModel;
	}

	public Integer getApplyId() {
		return applyId;
	}

	public void setApplyId(Integer applyId) {
		this.applyId = applyId;
	}

	public void setFinanceApplyService(FinanceApplyService financeApplyService) {
		this.financeApplyService = financeApplyService;
	}

	public List<NtyMessage> getTopMsgs() {
		return topMsgs;
	}

	public void setTopMsgs(List<NtyMessage> topMsgs) {
		this.topMsgs = topMsgs;
	}

	public String[] getMsgIds() {
		return msgIds;
	}

	public void setMsgIds(String[] msgIds) {
		this.msgIds = msgIds;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getCss() {
		return css;
	}

	public void setCss(String css) {
		this.css = css;
	}



}
