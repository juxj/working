package com.zj198.action.admin.fund;

import java.util.Date;

import com.zj198.action.BaseAction;
import com.zj198.model.Fund;
import com.zj198.service.fund.FundService;
import com.zj198.util.Pager;

public class FundAction extends BaseAction {
	private FundService fundService;
	private Fund fund;
	
	private Integer fundId;
	
	private String catelogName;
	private String companyName;
	private String fundCode;
	private String fullName;
	private Date[] issuedDt;
	
	private static final Integer pageSize =10;
	private Integer pageNo = 1;
	private Pager pager;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	/**基金基本信息列表*/
	public String fundList(){
		pager=fundService.findFundAll(catelogName, companyName, fundCode, fullName, issuedDt, pageSize, pageNo);
		return "fundList";
	}
	/**基金Fund详细信息*/
	public String fundProfile(){
		fund=fundService.getFundById(fundId);
		return "fundProfile";
	}
	/**admin修改基金Fund详细信息*/
	public String updateFundProfile(){
		
		fundService.updateFund(fund);
		return SUCCESS;
		
	}
	//------------get  set-----------------
	public Integer getPageNo() {
		return pageNo;
	}
	public Pager getPager() {
		return pager;
	}
	public void setFundService(FundService fundService) {
		this.fundService = fundService;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public Fund getFund() {
		return fund;
	}
	public void setFund(Fund fund) {
		this.fund = fund;
	}
	public void setFundId(Integer fundId) {
		this.fundId = fundId;
	}
	public Integer getFundId() {
		return fundId;
	}
	

}
