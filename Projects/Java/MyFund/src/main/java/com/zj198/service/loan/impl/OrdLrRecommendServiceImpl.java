package com.zj198.service.loan.impl;

import java.util.ArrayList;
import java.util.List;

import com.zj198.dao.PrdFinanceDAO;
import com.zj198.dao.OrdLrRecommendDao;
import com.zj198.model.PrdFinance;
import com.zj198.model.OrdLrRecommend;
import com.zj198.service.loan.OrdLrRecommendService;

public class OrdLrRecommendServiceImpl implements OrdLrRecommendService {

	private OrdLrRecommendDao ordLrRecommendDao;
	private PrdFinanceDAO prdFinanceDAO;

	public void saveSelRecProByAdmin(Integer requestId, List<OrdLrRecommend> list1) {

		List<OrdLrRecommend> list2 = ordLrRecommendDao.getByRequestAdminID(requestId);
		List<OrdLrRecommend> list3 = new ArrayList<OrdLrRecommend>();
		if (list2 != null) {
			list3.addAll(list2);
			list2.removeAll(list1);
			for (OrdLrRecommend o : list2) {
				ordLrRecommendDao.deleteObject(o);
			}
		}
		if (list1 != null) {
			list1.removeAll(list3);
			for (OrdLrRecommend o : list1) {
				ordLrRecommendDao.save(o);
			}
		}
	}

	public void saveSelRecProByLoan(Integer requestId, List<OrdLrRecommend> list1) {
		List<OrdLrRecommend> list2 = ordLrRecommendDao.getByRequestLoanID(requestId);
		List<OrdLrRecommend> list3 = new ArrayList<OrdLrRecommend>();
		if (list2 != null) {
			list3.addAll(list2);
			list2.removeAll(list1);
			for (OrdLrRecommend o : list2) {
				ordLrRecommendDao.deleteObject(o);
			}
		}
		if (list1 != null) {
			list1.removeAll(list3);
			for (OrdLrRecommend o : list1) {
				ordLrRecommendDao.save(o);
			}
		}
	}

	public List<PrdFinance> getListByIds(Object[] ids) {
		List<PrdFinance> list = prdFinanceDAO.getListByIds(ids);
		for(PrdFinance p : list){
			p.getInterests().size();
		}
		return list;
	}

	public List<Integer> getByRequestId(Integer id, Integer recommendType) {

		return ordLrRecommendDao.getByRequestId(id, recommendType);
	}

	public void setOrdLrRecommendDao(OrdLrRecommendDao ordLrRecommendDao) {
		this.ordLrRecommendDao = ordLrRecommendDao;
	}

	public void setPrdFinanceDAO(PrdFinanceDAO prdFinanceDAO) {
		this.prdFinanceDAO = prdFinanceDAO;
	}

}
