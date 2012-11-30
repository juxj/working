package com.zj198.service.fund.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.zj198.dao.FundAnnouncementDAO;
import com.zj198.dao.FundChargeDAO;
import com.zj198.dao.FundCompanyDAO;
import com.zj198.dao.FundDAO;
import com.zj198.dao.FundDividendDAO;
import com.zj198.dao.FundFileDAO;
import com.zj198.dao.FundInvestDAO;
import com.zj198.dao.FundManagerDAO;
import com.zj198.dao.FundNavDAO;
import com.zj198.dao.FundRoiDAO;
import com.zj198.dao.FundSalesDAO;
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
import com.zj198.service.fund.FundService;
import com.zj198.util.Pager;

public class FundServiceImpl implements FundService{
	private FundDAO fundDAO;
	private FundAnnouncementDAO fundAnnouncementDAO;
	private FundChargeDAO fundChargeDAO;
	private FundCompanyDAO fundCompanyDAO;
	private FundDividendDAO fundDividendDAO;
	private FundFileDAO fundFileDAO;
	private FundInvestDAO fundInvestDAO;
	private FundManagerDAO fundManagerDAO;
	private FundNavDAO fundNavDAO;
	private FundRoiDAO fundRoiDAO;
	private FundSalesDAO fundSalesDAO;

	
	public FundDAO getFundDAO() {
		return fundDAO;
	}

	public FundAnnouncementDAO getFundAnnouncementDAO() {
		return fundAnnouncementDAO;
	}

	public FundChargeDAO getFundChargeDAO() {
		return fundChargeDAO;
	}

	public FundCompanyDAO getFundCompanyDAO() {
		return fundCompanyDAO;
	}

	public FundDividendDAO getFundDividendDAO() {
		return fundDividendDAO;
	}

	public FundFileDAO getFundFileDAO() {
		return fundFileDAO;
	}

	public FundInvestDAO getFundInvestDAO() {
		return fundInvestDAO;
	}

	public FundManagerDAO getFundManagerDAO() {
		return fundManagerDAO;
	}

	public FundNavDAO getFundNavDAO() {
		return fundNavDAO;
	}

	public FundRoiDAO getFundRoiDAO() {
		return fundRoiDAO;
	}

	public void setFundDAO(FundDAO fundDAO) {
		this.fundDAO = fundDAO;
	}

	public FundSalesDAO getFundSalesDAO() {
		return fundSalesDAO;
	}

	public void setFundSalesDAO(FundSalesDAO fundSalesDAO) {
		this.fundSalesDAO = fundSalesDAO;
	}

	public void setFundAnnouncementDAO(FundAnnouncementDAO fundAnnouncementDAO) {
		this.fundAnnouncementDAO = fundAnnouncementDAO;
	}

	public void setFundChargeDAO(FundChargeDAO fundChargeDAO) {
		this.fundChargeDAO = fundChargeDAO;
	}

	public void setFundCompanyDAO(FundCompanyDAO fundCompanyDAO) {
		this.fundCompanyDAO = fundCompanyDAO;
	}

	public void setFundDividendDAO(FundDividendDAO fundDividendDAO) {
		this.fundDividendDAO = fundDividendDAO;
	}

	public void setFundFileDAO(FundFileDAO fundFileDAO) {
		this.fundFileDAO = fundFileDAO;
	}

	public void setFundInvestDAO(FundInvestDAO fundInvestDAO) {
		this.fundInvestDAO = fundInvestDAO;
	}

	public void setFundManagerDAO(FundManagerDAO fundManagerDAO) {
		this.fundManagerDAO = fundManagerDAO;
	}

	public void setFundNavDAO(FundNavDAO fundNavDAO) {
		this.fundNavDAO = fundNavDAO;
	}

	public void setFundRoiDAO(FundRoiDAO fundRoiDAO) {
		this.fundRoiDAO = fundRoiDAO;
	}

	//----------------------------------------
	@Override
	public Pager findFundAll(String catelogName, String companyName, String fundCode, String fullName,Date[] issuedDt,Integer pageSize, Integer pageNo) {
		return fundDAO.findFundAll(catelogName,companyName,fundCode,fullName,issuedDt,pageSize, pageNo);
	}

	@Override
	public FundAnnouncement getFundAnnouncementByFundId(Integer id) {
		return fundAnnouncementDAO.getAnnByFundId(id);
	}

	@Override
	public FundManager getManagerByFundId(Integer id) {
		return fundManagerDAO.getManagerByFundId(id);
	}

	@Override
	public FundRoi getRoiByFundId(Integer id) {
		return fundRoiDAO.getRoiByFundId(id);
	}

	@Override
	public FundInvest getInvestByFundId(Integer id) {
		return fundInvestDAO.getInvestByFundId(id);
	}

	@Override
	public FundFile getFileByFundId(Integer id) {
		return fundFileDAO.getFileByFundId(id);
	}

	@Override
	public FundDividend getDividendByFundId(Integer id) {
		return fundDividendDAO.getDividendByFundId(id);
	}

	@Override
	public FundCharge getChargeByFundId(Integer id) {
		return fundChargeDAO.getChargeByFundId(id);
	}

	@Override
	public Pager findComAll(int pageSize, int pageNo) {
		return fundCompanyDAO.findAll(pageSize, pageNo);
	}

	@Override
	public FundSales getSalesByFundId(Integer id) {
		return fundSalesDAO.getSalesByFundId(id);
	}

	@Override
	public FundCompany getFundCompanyById(Integer id) {
		return fundCompanyDAO.get(id);
	}

	@Override
	public void updateFund(Fund fund) {
		fund.setLastUpdatedTime(Calendar.getInstance().getTime());
		fundDAO.update(fund);
	}

	@Override
	public Fund getFundById(Integer id) {
		return fundDAO.get(id);
	}

	@Override
	public Pager getNavByFundId(Integer id,Integer pageNo, Integer pageSize) {
		return fundNavDAO.getNavByFundId(id,pageNo,pageSize);
	}

	@Override
	public List<FundAnnouncement> findFundAnnouncementByFundId(Integer id) {
		return fundAnnouncementDAO.findAnnByFundId(id);
	}

	@Override
	public List<FundManager> findManagerByFundId(Integer id) {
		return fundManagerDAO.findManagerByFundId(id);
	}

	@Override
	public List<FundRoi> findRoiByFundId(Integer id) {
		return fundRoiDAO.findRoiByFundId(id);
	}

	@Override
	public List<FundInvest> findInvestByFundId(Integer id) {
		return fundInvestDAO.findInvestByFundId(id);
	}

	@Override
	public List<FundFile> findFileByFundId(Integer id) {
		return fundFileDAO.findFileByFundId(id);
	}

	@Override
	public List<FundDividend> findDividendByFundId(Integer id) {
		return fundDividendDAO.findDividendByFundId(id);
	}

	@Override
	public List<FundCharge> findChargeByFundId(Integer id) {
		return fundChargeDAO.findChargeByFundId(id);
	}

	@Override
	public List<FundSales> findSalesByFundId(Integer id) {
		return fundSalesDAO.findSalesByFundId(id);
	}
	
}
