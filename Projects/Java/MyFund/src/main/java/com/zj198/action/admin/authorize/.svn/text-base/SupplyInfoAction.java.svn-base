package com.zj198.action.admin.authorize;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import com.zj198.action.BaseAction;
import com.zj198.model.ClbSupplyInfo;
import com.zj198.model.DicInvestRange;
import com.zj198.service.club.SupplyRequestService;
import com.zj198.service.common.DictoryDataService;
import com.zj198.util.Constants;
import com.zj198.util.Pager;

public class SupplyInfoAction extends BaseAction {

	private final static int PAGE_SIZE = 20;

	private Pager pager;
	private int pageNo;
	private int id;
	private int rank;
	private List<DicInvestRange> amountRangeList;
	

	private ClbSupplyInfo supplyInfo;
	

	private SupplyRequestService supplyRequestService;
	
	
	public String showHome() {
		if (this.supplyInfo == null) {
			this.supplyInfo = new ClbSupplyInfo();
		}
		this.amountRangeList = this.supplyRequestService.findDicInvestRangeList(Constants.CLUB_AMOUNT_RANGE);
		this.pager = this.supplyRequestService.findSupplyInfoByAdmin(supplyInfo,
				PAGE_SIZE, pageNo);
		return "supplyInfoHome";
	}


	public String changeSupplyInfoStatus() {
		supplyInfo = this.supplyRequestService.getClbSupplyInfoById(id);
		supplyInfo.setRank(Integer.valueOf(rank).toString());
		Timestamp st = new Timestamp(System.currentTimeMillis());
		supplyInfo.setLastPostDate(st);
		this.supplyRequestService.saveClbSupplyInfo(supplyInfo);
		return null;
	}

	public String showSupplyInfoDetail() {
		supplyInfo = this.supplyRequestService.getClbSupplyInfoById(id);
		return "supplyInfoDetail";
	}

	
	public Pager getPager() {
		return pager;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public void setSupplyRequestService(
			SupplyRequestService supplyRequestService) {
		this.supplyRequestService = supplyRequestService;
	}

	public ClbSupplyInfo getSupplyInfo() {
		return supplyInfo;
	}

	public void setSupplyInfo(ClbSupplyInfo supplyInfo) {
		this.supplyInfo = supplyInfo;
	}


	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String execute() throws Exception {
		return null;
	}

	public List<DicInvestRange> getAmountRangeList() {
		return amountRangeList;
	}
	

}
