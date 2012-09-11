package com.zj198.action.loan;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.dao.OrdLoanRequestDAO;
import com.zj198.model.OrdLoanRequest;
import com.zj198.model.PrdFinance;
import com.zj198.model.OrdLrRecommend;
import com.zj198.model.UsrUser;
import com.zj198.service.loan.LoanRequestService;
import com.zj198.service.loan.OrdLrRecommendService;

public class OrdLrRecommendAction extends BaseAction {

	private OrdLrRecommendService ordLrRecommendService;
	private LoanRequestService loanRequestService;
	// 已经被选择的产品ID
	private String[] checkId;
	// 融资需求的ID
	private Integer requestId;
	// 查看推荐产品集合
	private List<PrdFinance> recommendByOrg;
	private List<PrdFinance> recommendByAdm;
	private OrdLoanRequest loan;
	/**
	 * 金融机构：选择最多三条推荐产品
	 * 
	 * @author: zeroleavebaoyang@gmail.com
	 * @since: 2012-7-18 | 14:34:13
	 * @return
	 */
	public String selectRecProdcut() {
		if (checkId != null && checkId.length > 0) {
			int[] intTemp = new int[checkId.length];
			for (int i = 0; i < intTemp.length; i++) {
				intTemp[i] = Integer.parseInt(checkId[i]);
			}
			ActionContext context = ActionContext.getContext();
			UsrUser user = (UsrUser) context.getSession().get("_user");
			List<OrdLrRecommend> list = new ArrayList<OrdLrRecommend>();
			for (int i = 0; i < intTemp.length; i++) {
				OrdLrRecommend o = new OrdLrRecommend();
				o.setFinanceId(intTemp[i]);
				o.setRequestId(requestId);
				o.setCreatedt(new Date());
				o.setRecommendType(0);
				o.setCreateUserId(user.getId());
				list.add(o);
			}
			ordLrRecommendService.saveSelRecProByLoan(requestId, list);
		}
		return null;
	}


	/**
	 * 非金融机构查看推荐产品
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @time 2012-7-19| 下午1:41:12
	 * @return
	 */
	public String lookRecPro() {
		loan = loanRequestService.getOrdDetailById(requestId);
		List<Integer> proIds = ordLrRecommendService.getByRequestId(requestId, 0);
		if (proIds != null && proIds.size() > 0) {
			recommendByOrg = ordLrRecommendService.getListByIds(proIds.toArray());
		}
		List<Integer> pids = ordLrRecommendService.getByRequestId(requestId, 1);
		if (pids != null && pids.size() > 0) {
			recommendByAdm = ordLrRecommendService.getListByIds(pids.toArray());
		}
		return "lookRecPro";
	}

	public void setOrdLrRecommendService(OrdLrRecommendService ordLrRecommendService) {
		this.ordLrRecommendService = ordLrRecommendService;
	}

	public String execute() throws Exception {
		return null;
	}

	public Integer getRequestId() {
		return requestId;
	}

	public void setRequestId(Integer requestId) {
		this.requestId = requestId;
	}

	public void setCheckId(String checkId) {

		this.checkId = checkId.split(",");

	}

	public List<PrdFinance> getRecommendByOrg() {
		return recommendByOrg;
	}

	public void setRecommendByOrg(List<PrdFinance> recommendByOrg) {
		this.recommendByOrg = recommendByOrg;
	}

	public List<PrdFinance> getRecommendByAdm() {
		return recommendByAdm;
	}

	public void setRecommendByAdm(List<PrdFinance> recommendByAdm) {
		this.recommendByAdm = recommendByAdm;
	}


	public OrdLoanRequest getLoan() {
		return loan;
	}


	public void setLoan(OrdLoanRequest loan) {
		this.loan = loan;
	}


	public void setLoanRequestService(LoanRequestService loanRequestService) {
		this.loanRequestService = loanRequestService;
	}

}
