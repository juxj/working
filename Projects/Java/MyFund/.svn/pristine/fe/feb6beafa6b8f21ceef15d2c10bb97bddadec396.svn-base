package com.zj198.action.admin.authorize;

import java.util.Calendar;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.zj198.action.BaseAction;
import com.zj198.model.DicBank;
import com.zj198.model.PrdBankfinance;
import com.zj198.model.PrdRecommendation;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.finservice.FinanceProdService;
import com.zj198.util.Pager;

public class BankProductAction extends BaseAction {

	private final static int PAGE_SIZE = 20;
	private int pageNo;
	
	private Pager pager;
	private int typeId;
	private int prodId;
	private int oldSequence;
	
	private FinanceProdService financeProdService;
	
	private PrdRecommendation prdRecommendation;
	private PrdBankfinance prdBankfinance;
	private int recommendationStatus = 1;
	
	private List<DicBank> bankList;
	private DictoryDataService dictoryDataService;
	
	@Override
	public String execute() throws Exception {
		if (prdBankfinance == null) {
			prdBankfinance = new PrdBankfinance();
		}
		this.pager = this.financeProdService.findByRecommedation(prdBankfinance.getName(), prdBankfinance.getBank(), prdBankfinance.getSellstart(), prdBankfinance.getSellend(), recommendationStatus, PAGE_SIZE, pageNo);
		return SUCCESS;
	}
	
	public String savePrdRecommendation() {
		
		if (prdRecommendation.getBankId() != null) {
			DicBank bank = this.dictoryDataService.getDicBankById(prdRecommendation.getBankId());
			prdRecommendation.setLogo(bank.getLogo());
		}
		
		this.financeProdService.savePrdRecommendation(prdRecommendation, oldSequence);
		this.pager = this.financeProdService.findAll(PAGE_SIZE, pageNo);
		return SUCCESS;
	}
	
	public String editPrdRecommedation() {
		this.bankList = this.dictoryDataService.findDicBankList();
		this.prdRecommendation = this.financeProdService.getPrdRecommendationByProduct(typeId, prodId);
		
		if (prdRecommendation == null) {
			this.prdRecommendation = new PrdRecommendation();
		}
		
		if (prdRecommendation.getId() == null) {
			PrdBankfinance pbf = this.financeProdService.getBankfinanceById(prodId);
			this.prdRecommendation.setOriginalName(pbf.getName());
			this.prdRecommendation.setTypeId(typeId);
			this.prdRecommendation.setStatus(1);
			this.prdRecommendation.setSequence(1);
			this.prdRecommendation.setProdId(prodId);
			this.prdRecommendation.setCreatedDate(Calendar.getInstance().getTime());
			this.prdRecommendation.setLastUpdatedDate(Calendar.getInstance().getTime());
			
			for(DicBank bank : bankList) {
				if (bank.getName().equalsIgnoreCase(pbf.getBank())) {
					if (StringUtils.isNotBlank(bank.getLogo())){
						prdRecommendation.setBankId( bank.getId());
						prdRecommendation.setLogo(bank.getLogo());
					}
				}
			}
		}
		
		this.oldSequence = this.prdRecommendation.getSequence();
		
		return "recommedation";
	}

	public Pager getPager() {
		return pager;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}

	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	public int getProdId() {
		return prodId;
	}

	public void setProdId(int prodId) {
		this.prodId = prodId;
	}

	public void setFinanceProdService(FinanceProdService financeProdService) {
		this.financeProdService = financeProdService;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public PrdRecommendation getPrdRecommendation() {
		return prdRecommendation;
	}

	public void setPrdRecommendation(PrdRecommendation prdRecommendation) {
		this.prdRecommendation = prdRecommendation;
	}

	public int getOldSequence() {
		return oldSequence;
	}

	public void setOldSequence(int oldSequence) {
		this.oldSequence = oldSequence;
	}

	public PrdBankfinance getPrdBankfinance() {
		return prdBankfinance;
	}

	public void setPrdBankfinance(PrdBankfinance prdBankfinance) {
		this.prdBankfinance = prdBankfinance;
	}

	public int getRecommendationStatus() {
		return recommendationStatus;
	}

	public void setRecommendationStatus(int recommendationStatus) {
		this.recommendationStatus = recommendationStatus;
	}

	public List<DicBank> getBankList() {
		return bankList;
	}

	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}
	
	
}
