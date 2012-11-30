package com.zj198.service.loan.impl;

import java.util.Date;

import org.apache.commons.lang3.StringUtils;

import com.zj198.dao.DicCommonDAO;
import com.zj198.dao.OrdCheckLogDAO;
import com.zj198.dao.PrdFinanceDAO;
import com.zj198.model.OrdCheckLog;
import com.zj198.model.OrdFinanceApply;
import com.zj198.model.PrdFinance;
import com.zj198.service.common.DictoryDataService;
import com.zj198.service.loan.OrdLogService;
import com.zj198.util.Constants;
import com.zj198.util.OrderMessageUtil;

public class OrdLogServiceImpl implements OrdLogService {

	private OrdCheckLogDAO ordCheckLogDAO;
	private DicCommonDAO dicCommonDAO;
	private DictoryDataService dictoryDataService;
	private PrdFinanceDAO prdFinanceDAO;
	
	

	//dao的set方法
	
	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}

	public void setPrdFinanceDAO(PrdFinanceDAO prdFinanceDAO) {
		this.prdFinanceDAO = prdFinanceDAO;
	}

	public void setOrdCheckLogDAO(OrdCheckLogDAO ordCheckLogDAO) {
		this.ordCheckLogDAO = ordCheckLogDAO;
	}

	public void setDicCommonDAO(DicCommonDAO dicCommonDAO) {
		this.dicCommonDAO = dicCommonDAO;
	}

	//dao的实现方法
	
	public void saveLogByStatus(String logType, String logView,
			OrdFinanceApply apply, String realname) {

		OrdCheckLog log = new OrdCheckLog();
		log.setOrdId(apply.getId());
		log.setCreateUserName(realname);
		log.setCheckLogType(logType);
		log.setCreateUserType(0);
		log.setCheckStatus(apply.getApplyStatus());
		log.setCreatedt(new Date());
		// 记录填写意见信息
		if (StringUtils.isBlank(logView)) {
			String logContent = OrderMessageUtil.getMessage(apply.getApplyStatus().toString());
			if(logContent.contains("%s")){
				PrdFinance product = prdFinanceDAO.get(apply.getFinanceId());
				logContent = logContent.replaceAll("%s", dictoryDataService.getCompanyNameByUserId(product.getUserId()));
			}
			log.setCheckView(logContent);
		} else {
			log.setCheckView(logView);
		}
		log.setOrdType(Constants.ORD_CHECK_TYPE_APPLY);
		ordCheckLogDAO.save(log);
	}
}
