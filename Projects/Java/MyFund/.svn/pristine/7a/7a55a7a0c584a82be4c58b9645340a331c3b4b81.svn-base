package com.zj198.service.loan.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.zj198.action.loan.model.FindFinanceAdminSpModel;
import com.zj198.action.loan.model.RequestSearch;
import com.zj198.dao.DicBaseRateDAO;
import com.zj198.dao.OrdLoanRequestDAO;
import com.zj198.dao.UsrBankDAO;
import com.zj198.dao.UsrUserDAO;
import com.zj198.model.DicBaseRate;
import com.zj198.model.NtyMessageQueue;
import com.zj198.model.OrdLoanRequest;
import com.zj198.model.UsrBank;
import com.zj198.model.UsrUser;
import com.zj198.service.common.NotifyQueueService;
import com.zj198.service.loan.LoanRequestService;
import com.zj198.util.Constants;
import com.zj198.util.FreemarkerUtil;
import com.zj198.util.OrderNOCreator;
import com.zj198.util.Pager;

/**
 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-6-20 10:07:46
 */
public class LoanRequestServiceImpl implements LoanRequestService {
	private UsrBankDAO usrBankDAO;
	private UsrUserDAO usrUserDAO;
	private OrdLoanRequestDAO ordLoanRequestDAO;
	private DicBaseRateDAO dicBaseRateDAO;

	public Pager findReqByCon(int currentPage, int pageCount, RequestSearch rq, Integer type) {
		return ordLoanRequestDAO.findReqByCon(currentPage, pageCount, rq, type);
	}

	public OrdLoanRequest getOrdDetailById(int id) {
		return ordLoanRequestDAO.get(id);
	}

	public Pager getPagationList(int userId, int pageNo, int pageSize) {
		return ordLoanRequestDAO.getPagationList(userId, pageNo, pageSize);
	}

	public Long countBankNum() {
		List<UsrBank> list = usrBankDAO.findAll();
		if (list != null && list.size() > 0) {
			return Long.valueOf(list.size());
		} else {
			return Long.valueOf(0);
		}
	}

	public Long countUserByType(Short type) {
		List<UsrUser> list = usrUserDAO.findUserByType(type);
//		System.out.println("d1#" + list.size());
		if (list != null && list.size() > 0) {
			return Long.valueOf(list.size());
		} else {
			return Long.valueOf(0);
		}
	}

	public Double getBaseRate(Integer month) {
		Double baseRate = new Double(0);// 基准利率
		List<DicBaseRate> list = dicBaseRateDAO.findAll();
		for (int i = 0; i < list.size(); i++) {
			DicBaseRate rate = list.get(i);
			if (month > rate.getStartdt() && month <= rate.getEnddt()) {
				baseRate = rate.getRate();
			}
		}
		return baseRate;
	}

	public String saveLoanRequest(OrdLoanRequest loan, String[] loanObjects, Integer minBound, Integer maxBound) {
		/**
		 * 将用户选择的贷款机构组合成一个字符串，以“，”分隔
		 */
		String loanOrg = "";
		if (loanObjects != null && loanObjects.length > 0) {
			loanOrg = ",";
			for (int i = 0; i < loanObjects.length; i++) {
				loanOrg += loanObjects[i] + ",";
			}
		}
		/**
		 * 根据基准利率计算用户可接受的利率范围
		 */
		// Double baseRate = new Double(0);//基准利率
		// List<OrdBaseRate> list = ordBaseRateDAO.findAllBaseRate();
		// for(int i = 0; i < list.size() ; i++){
		// OrdBaseRate rate = list.get(i);
		// if(loan.getLoanMonth()>rate.getStartdt() && loan.getLoanMonth() <=
		// rate.getEnddt()){
		// baseRate = rate.getRate();
		// }
		// }
		// Double rateLower = baseRate * (minBound/100);
		// Double rateUpper = baseRate * (maxBound/100);
		// loan.setRateLowerLimit(rateLower);
		// loan.setRateUpperLimit(rateUpper);

		loan.setLoanOrganization(loanOrg);
		loan.setCreatedt(new Date());
		loan.setIsdeleted(new Integer(0));
		loan.setApplyStatus(new Integer(143));// 待审核
		ordLoanRequestDAO.save(loan);

		String applyNum = OrderNOCreator.rapidRequestOrderNO(loan.getId().intValue());// 申请编号
		loan.setApplyNum(applyNum);
		ordLoanRequestDAO.update(loan);

		// 发送Email
		Map<String, Object> m = new HashMap<String, Object>();
		String body;
		try {
			m.put("currentTime", new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()));
			m.put("applyNum", applyNum);
			body = FreemarkerUtil.getContent("loanRequestTemplate.htm", m, false, null, null);
			NtyMessageQueue j = new NtyMessageQueue();
			j.setTitle("融资快速申请 - 中国资金网");
			j.setContent(body);
			j.setReceiver(Constants.LOAN_EMAIL);
			j.setType(Constants.NTYMESSAGEQUEUE_TYPE_EMAIL);
			notifyQueueService.addNewMessage(j);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return applyNum;
	}

	public void setUsrBankDAO(UsrBankDAO usrBankDAO) {
		this.usrBankDAO = usrBankDAO;
	}

	public void setUsrUserDAO(UsrUserDAO usrUserDAO) {
		this.usrUserDAO = usrUserDAO;
	}

	public void setOrdLoanRequestDAO(OrdLoanRequestDAO ordLoanRequestDAO) {
		this.ordLoanRequestDAO = ordLoanRequestDAO;
	}

	public void setDicBaseRateDAO(DicBaseRateDAO dicBaseRateDAO) {
		this.dicBaseRateDAO = dicBaseRateDAO;
	}

	public Map<String, Object> getScrollData(int pageNo, int pageSize, String wherejpql, Object[] queryParams, LinkedHashMap<String, String> orderby) {
		return null;
	}

	public Pager getAdminRequest(FindFinanceAdminSpModel spModel) {
		return ordLoanRequestDAO.getAdminRequest(spModel);
	}

	public void updateLoan(OrdLoanRequest olr) {
		OrdLoanRequest o = ordLoanRequestDAO.get(olr.getId());
		o.setApplyStatus(olr.getApplyStatus());
		ordLoanRequestDAO.saveOrUpdate(o);
	}

	private NotifyQueueService notifyQueueService;

	public void setNotifyQueueService(NotifyQueueService notifyQueueService) {
		this.notifyQueueService = notifyQueueService;
	}

	public List<OrdLoanRequest> getTopThree(int userId) {
		return ordLoanRequestDAO.getTopThree(userId);
	}

	public List<OrdLoanRequest> getTopThree() {
		return ordLoanRequestDAO.getTopThree();
	}
	
	

}
