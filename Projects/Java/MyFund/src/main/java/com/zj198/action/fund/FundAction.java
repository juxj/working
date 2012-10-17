package com.zj198.action.fund;

import java.util.List;

import com.zj198.action.BaseAction;
import com.zj198.action.fund.model.FundIntention;
import com.zj198.model.PrdRecommendation;
import com.zj198.service.finservice.FinanceProdService;
import com.zj198.service.loan.FinanceApplyService;

public class FundAction extends BaseAction {
	private FinanceApplyService financeApplyService;
	private FinanceProdService financeProdService;
	private FundIntention fundIntention;
	private List<PrdRecommendation> bankFinanceRecommendationList;
	
	/**新增了3个产品*/
	private int jtype;
	
	public String execute() {
		bankFinanceRecommendationList = this.financeProdService.findRecommendationByTopNumber(1, 4);
		String j = "SUCCESS";
		switch (jtype) {
		case 1:
			j = "view_fund1";
			break;
		case 2:
			j = "view_fund2";
			break;
		case 3:
			j = "view_fund3";
			break;
		}
		return j;
	}
	
	public String inputIntention(){
		return "input_intention";
	}
	
	public String saveIntention(){
		financeApplyService.saveFundIntention(fundIntention);
		return "success";
	}

	//setter and getter
	public FundIntention getFundIntention() {
		return fundIntention;
	}

	public void setFundIntention(FundIntention fundIntention) {
		this.fundIntention = fundIntention;
	}

	public void setFinanceApplyService(FinanceApplyService financeApplyService) {
		this.financeApplyService = financeApplyService;
	}

	public List<PrdRecommendation> getBankFinanceRecommendationList() {
		return bankFinanceRecommendationList;
	}

	public void setBankFinanceRecommendationList(
			List<PrdRecommendation> bankFinanceRecommendationList) {
		this.bankFinanceRecommendationList = bankFinanceRecommendationList;
	}

	public void setFinanceProdService(FinanceProdService financeProdService) {
		this.financeProdService = financeProdService;
	}

	public int getJtype() {
		return jtype;
	}

	public void setJtype(int jtype) {
		this.jtype = jtype;
	}
	
	
}
