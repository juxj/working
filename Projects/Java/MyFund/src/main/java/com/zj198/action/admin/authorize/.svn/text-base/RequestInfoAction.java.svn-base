package com.zj198.action.admin.authorize;

import java.sql.Timestamp;
import java.util.List;

import com.zj198.model.ClbRequestInfo;
import com.zj198.model.DicIndustry;
import com.zj198.model.DicInvestRange;
import com.zj198.model.DicProvince;
import com.zj198.model.PrdRecommendation;
import com.zj198.service.club.SupplyRequestService;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.finservice.FinanceProdService;
import com.zj198.util.Constants;
import com.zj198.util.Pager;

public class RequestInfoAction {

	private final static int PAGE_SIZE = 20;

	private Pager pager;
	private int pageNo;
	private int id;
	private int rank;
	
	private ClbRequestInfo requestInfo;
	private SupplyRequestService supplyRequestService;
	private FinanceProdService financeProdService;
	private DictoryDataService dictoryDataService;
	
	private List<PrdRecommendation> bankFinanceRecommendationList;
	private List<DicIndustry> industryList;
	private List<DicProvince> provinceList;
	private List<DicInvestRange> financingTypeList;
	
	
	/**分页显示未审核的用户需求*/
	public String showHome() {
		financingTypeList = this.supplyRequestService.findDicInvestRangeList(Constants.CLUB_FINANCE_TYPE);
		this.industryList = this.dictoryDataService.findDicIndustryList();
		this.provinceList = this.dictoryDataService.findAllProvince();
		
		if (this.requestInfo == null){
			this.requestInfo = new ClbRequestInfo();
		}
		this.pager = this.supplyRequestService
				.findRequestInfoListByAdmin(this.requestInfo, PAGE_SIZE, pageNo);
		return "requestInfoHome";
	}

	/**改变需求的状态，包括通过，拒绝*/
	public String changeRequestInfoStatus() {
		requestInfo = this.supplyRequestService.getClbRequestInofById(id);
		requestInfo.setRank(rank);
		Timestamp st = new Timestamp(System.currentTimeMillis());
		requestInfo.setLastPostDate(st);
		this.supplyRequestService.saveClbRequestInfo(requestInfo);
		return null;
	}
	
	/**查看用户需求明细*/
	public String showRequestInfoDetail() {
		bankFinanceRecommendationList = this.financeProdService.findRecommendationByTopNumber(1, 4);
		requestInfo = this.supplyRequestService.getClbRequestInofById(id);
		return "requestInfoDetail";
	}

	public Pager getPager() {
		return pager;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}


	public List<DicProvince> getProvinceList() {
		return provinceList;
	}

	public int getPageNo() {
		return pageNo;
	}

	public List<DicInvestRange> getFinancingTypeList() {
		return financingTypeList;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}


	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}

	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getRank() {
		return rank;
	}


	public void setRank(int rank) {
		this.rank = rank;
	}


	public ClbRequestInfo getRequestInfo() {
		return requestInfo;
	}


	public void setRequestInfo(ClbRequestInfo requestInfo) {
		this.requestInfo = requestInfo;
	}


	public List<DicIndustry> getIndustryList() {
		return industryList;
	}

	public SupplyRequestService getSupplyRequestService() {
		return supplyRequestService;
	}


	public void setSupplyRequestService(SupplyRequestService supplyRequestService) {
		this.supplyRequestService = supplyRequestService;
	}

	public List<PrdRecommendation> getBankFinanceRecommendationList() {
		return bankFinanceRecommendationList;
	}

	public void setBankFinanceRecommendationList(
			List<PrdRecommendation> bankFinanceRecommendationList) {
		this.bankFinanceRecommendationList = bankFinanceRecommendationList;
	}

	public FinanceProdService getFinanceProdService() {
		return financeProdService;
	}

	public void setFinanceProdService(FinanceProdService financeProdService) {
		this.financeProdService = financeProdService;
	}

	
	

}
