package com.zj198.action.admin.loan;

import com.zj198.action.BaseAction;
import com.zj198.model.PrdRecommendation;
import com.zj198.service.finservice.FinanceProdService;
import com.zj198.util.Constants;

public class FinanceRecommendAction extends BaseAction{
	private FinanceProdService financeProdService;
	private PrdRecommendation prdRecommendation;
	public String execute() {
		financeProdService.saveOrUpdateLoanRecommend(prdRecommendation);
		return SUCCESS;
	}
	
	public String getRecommend(){
		if(prdRecommendation != null && prdRecommendation.getProdId() != null){			
			PrdRecommendation p = financeProdService.getPrdRecommendationByProduct(Constants.PRD_RECOMMEND_TYPE_LOAN, prdRecommendation.getProdId());
			if(p != null){
				prdRecommendation = p;
			}else{
				prdRecommendation.setTypeId(Constants.PRD_RECOMMEND_TYPE_LOAN);
			}
		}else{
			prdRecommendation = new PrdRecommendation();
			prdRecommendation.setTypeId(Constants.PRD_RECOMMEND_TYPE_LOAN);
		}
		
		return "recommendPage";
	}

	public PrdRecommendation getPrdRecommendation() {
		return prdRecommendation;
	}
	public void setPrdRecommendation(PrdRecommendation prdRecommendation) {
		this.prdRecommendation = prdRecommendation;
	}


	public void setFinanceProdService(FinanceProdService financeProdService) {
		this.financeProdService = financeProdService;
	}

}
