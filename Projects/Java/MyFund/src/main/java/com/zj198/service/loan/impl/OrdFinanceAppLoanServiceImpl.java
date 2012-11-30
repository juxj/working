package com.zj198.service.loan.impl;

import java.util.Date;
import java.util.List;

import com.zj198.action.loan.model.AppLoanAttachSpModel;
import com.zj198.dao.OrdAppLoanDAO;
import com.zj198.dao.OrdFaLoanDataDAO;
import com.zj198.dao.OrdFaLoanUploadDAO;
import com.zj198.dao.OrdFinanceApplyDAO;
import com.zj198.dao.PrdFinanceDAO;
import com.zj198.model.OrdFaLoanData;
import com.zj198.model.OrdFaLoanUpload;
import com.zj198.model.OrdFinanceAppLoan;
import com.zj198.model.OrdFinanceApply;
import com.zj198.service.loan.OrdFinanceAppLoanService;
import com.zj198.util.Constants;
import com.zj198.util.Pager;
import com.zj198.util.UploadUtil;

public class OrdFinanceAppLoanServiceImpl implements OrdFinanceAppLoanService {

	private OrdAppLoanDAO ordAppLoanDAO;
	private OrdFaLoanDataDAO ordFaLoanDataDAO;
	private OrdFaLoanUploadDAO ordFaLoanUploadDAO;
	private OrdFinanceApplyDAO ordFinanceApplyDAO;
	private PrdFinanceDAO prdFinanceDAO;

	public void setOrdAppLoanDAO(OrdAppLoanDAO ordAppLoanDAO) {
		this.ordAppLoanDAO = ordAppLoanDAO;
	}

	@Override
	public OrdFinanceAppLoan findByAppId(Integer id) {
		return ordAppLoanDAO.findByAppId(id);
	}

	@Override
	public void save(OrdFinanceAppLoan o) {
		o.setLoanStatus(new Integer(221));//贷后管理中
		o.setProductName(prdFinanceDAO.get(o.getProductId()).getFinanceName());
		ordAppLoanDAO.save(o);
		OrdFinanceApply apply = ordFinanceApplyDAO.get(o.getApplyId());
		//update finance status
		apply.setApplyStatus(Constants.ORD_ORG_PUT_MONEY);//已放款
		ordFinanceApplyDAO.update(apply);
	}
	public void updateAppLoanStatus(OrdFinanceAppLoan o) {
		OrdFinanceAppLoan a = ordAppLoanDAO.get(o.getId());
		a.setLoanStatus(o.getLoanStatus());
		ordAppLoanDAO.update(a);
	}
	public void saveLoanAttach(OrdFaLoanData d){
		d.setSupplyCreatedt(new Date());
		d.setUploadStatus(new Integer(212));
		d.setIsdeleted(new Integer(0));
		ordFaLoanDataDAO.save(d);
		OrdFinanceAppLoan a = ordAppLoanDAO.get(d.getAppLoanId());
		a.setLoanStatus(new Integer(222));
		ordAppLoanDAO.update(a);
	}
	public List<OrdFaLoanData> findFaLoanData(Integer appLoanId){
		return ordFaLoanDataDAO.findFaLoanData(appLoanId);
	}
	public void saveUploadAttach(AppLoanAttachSpModel spModel){
		String newFileName = UploadUtil.upload(spModel.getUpload(), spModel.getUploadFileName(), "loan",Constants.UPLOAD_PRIVACY_PRIVATE);
		OrdFaLoanUpload fu = new OrdFaLoanUpload();
		fu.setCreatedt(new Date());
		fu.setCreateUserId(spModel.getUserId());
		fu.setDataId(spModel.getLoanDataId());
		fu.setFileName(newFileName);
		fu.setOldFileName(spModel.getUploadFileName());
		ordFaLoanUploadDAO.save(fu);
		OrdFaLoanData d = ordFaLoanDataDAO.get(spModel.getLoanDataId());
		d.setUploadStatus(new Integer(213));
		ordFaLoanDataDAO.update(d);
	}
	
	//setter and getter
	public OrdFaLoanData getLoanData(Integer dataId){
		return this.ordFaLoanDataDAO.get(dataId);
	}
	public void updateLoanData(OrdFaLoanData ld){
		OrdFaLoanData d = this.ordFaLoanDataDAO.get(ld.getId());
		d.setUploadStatus(ld.getUploadStatus());
		ordFaLoanDataDAO.update(d);
	}
	public List<OrdFaLoanUpload> findLoanUpload(Integer dataId){
		return this.ordFaLoanUploadDAO.findLoanUpload(dataId);
	}
	public OrdFaLoanUpload getOrdFaLoanUpload(Integer id){
		return this.ordFaLoanUploadDAO.get(id);
	}

	@Override
	public Pager getList(Integer userId, Integer page, Integer pageSize) {
		return ordAppLoanDAO.getList(userId, page, pageSize);
	}
	
	public List<OrdFinanceAppLoan> findAppLoan(Integer userId){
		return ordAppLoanDAO.findAppLoan(userId);
	}

	public void setOrdFaLoanDataDAO(OrdFaLoanDataDAO ordFaLoanDataDAO) {
		this.ordFaLoanDataDAO = ordFaLoanDataDAO;
	}

	public void setOrdFaLoanUploadDAO(OrdFaLoanUploadDAO ordFaLoanUploadDAO) {
		this.ordFaLoanUploadDAO = ordFaLoanUploadDAO;
	}

	public void setOrdFinanceApplyDAO(OrdFinanceApplyDAO ordFinanceApplyDAO) {
		this.ordFinanceApplyDAO = ordFinanceApplyDAO;
	}

	public void setPrdFinanceDAO(PrdFinanceDAO prdFinanceDAO) {
		this.prdFinanceDAO = prdFinanceDAO;
	}

}
