package com.zj198.service.fund;

import java.util.Date;
import java.util.List;

import com.zj198.model.Fund;
import com.zj198.model.FundAnnouncement;
import com.zj198.model.FundCharge;
import com.zj198.model.FundCompany;
import com.zj198.model.FundDividend;
import com.zj198.model.FundFile;
import com.zj198.model.FundInvest;
import com.zj198.model.FundManager;
import com.zj198.model.FundRoi;
import com.zj198.model.FundSales;
import com.zj198.util.Pager;



public interface FundService {
	/**基金基本信息列表----list*/
	public Pager findFundAll(String catelogName, String companyName,String fundCode, String fullName,Date[] issuedDt,Integer pageSize, Integer pageNo);
	/**基金公司----list*/
	public Pager findComAll(int pageSize, int pageNo);
	
	/**基金公司*/
	public FundCompany getFundCompanyById(Integer id);
	/**基金相关公告*/
	public FundAnnouncement getFundAnnouncementByFundId(Integer id);
	/**根据基金id基金经理*/
	public FundManager getManagerByFundId(Integer id);
	/**根据基金id投次回报*/
	public FundRoi getRoiByFundId(Integer id);
	/**根据基金id投资组合*/
	public FundInvest getInvestByFundId(Integer id);
	/**根据基金id法律文件*/
	public FundFile getFileByFundId(Integer id);
	/**根据基金id基金分红*/
	public FundDividend getDividendByFundId(Integer id);
	/**根据基金id基金费率*/
	public FundCharge getChargeByFundId(Integer id);
	/**根据基金id sales*/
	public FundSales getSalesByFundId(Integer id);
	/**根据基金id Nav*/
	public Pager getNavByFundId(Integer id,Integer pageNo, Integer pageSize);
	/**admin修改fund信息*/
	public void updateFund(Fund fund);
	/**根据Id查看fund信息*/
	public Fund getFundById(Integer id);
	//find------------------------
	/**基金相关公告*/
	public List<FundAnnouncement> findFundAnnouncementByFundId(Integer id);
	/**根据基金id基金经理*/
	public List<FundManager> findManagerByFundId(Integer id);
	/**根据基金id投次回报*/
	public List<FundRoi> findRoiByFundId(Integer id);
	/**根据基金id投资组合*/
	public List<FundInvest> findInvestByFundId(Integer id);
	/**根据基金id法律文件*/
	public List<FundFile> findFileByFundId(Integer id);
	/**根据基金id基金分红*/
	public List<FundDividend> findDividendByFundId(Integer id);
	/**根据基金id基金费率*/
	public List<FundCharge> findChargeByFundId(Integer id);
	/**根据基金id sales*/
	public List<FundSales> findSalesByFundId(Integer id);
}
