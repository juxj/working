package com.zj198.service.loan.impl;

import java.util.List;

import com.zj198.dao.PrdFinanceAreaDAO;
import com.zj198.model.vo.FinanceAreaModel;
import com.zj198.service.loan.PrdFinanceAreaService;

public class PrdFinanceAreaServiceImpl implements PrdFinanceAreaService {

	public List<FinanceAreaModel> findFiananceArea(Integer financeId) {
		return prdFinanceAreaDAO.findFiananceArea(financeId);
	}

	private PrdFinanceAreaDAO prdFinanceAreaDAO;

	public void setPrdFinanceAreaDAO(PrdFinanceAreaDAO prdFinanceAreaDAO) {
		this.prdFinanceAreaDAO = prdFinanceAreaDAO;
	}

}
