package com.zj198.service.finservice.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.zj198.dao.FudBaseDAO;
import com.zj198.dao.FudHisvalueDAO;
import com.zj198.dao.PrdBankfinanceDAO;
import com.zj198.dao.PrdFinanceDAO;
import com.zj198.dao.PrdRecommendationDAO;
import com.zj198.dao.UsrUserDAO;
import com.zj198.model.FudBase;
import com.zj198.model.FudHisvalue;
import com.zj198.model.PrdBankfinance;
import com.zj198.model.PrdFinance;
import com.zj198.model.PrdRecommendation;
import com.zj198.model.UsrUser;
import com.zj198.service.finservice.FinanceProdService;
import com.zj198.util.Constants;
import com.zj198.util.Pager;

public class FinanceProdServiceImpl implements FinanceProdService {
	
	private FudBaseDAO fundBaseDAO;
	private FudHisvalueDAO fundHistoryDAO;
	private PrdBankfinanceDAO prdBankfinanceDAO;
	
	private PrdRecommendationDAO prdRecommendationDAO;
	private PrdFinanceDAO prdFinanceDAO;
	private UsrUserDAO usrUserDAO;
	

	/**
	 * @function: 根据基金类型进行查询,并分页.
	 * @param typeName
	 * @param pageSize
	 * @param pageNo
	 * @return
	 */
	@Override
	public Pager findRecentlyList(String typeName, int pageSize,
			int pageNo) {
		return this.fundHistoryDAO.findRecentlyList(typeName, pageSize, pageNo);
	}
	
	/*
	 * 取得最近时间的基金数据
	 * @see com.zj198.service.finservice.FinanceProdService#findRecentlyList()
	 */
	@Override
	public List<FudHisvalue> findRecentlyList() {
		return this.fundHistoryDAO.findRecentlyList();
	}
	
	/*
	 * 根据基金代码查询基金的历史数据
	 * @see com.zj198.service.finservice.FinanceProdService#findAllByFundCode(java.lang.String)
	 */
	@Override
	public List<FudHisvalue> findAllByFundCode(String fundCode) {
		return this.fundHistoryDAO.findByFundCode(fundCode);
	}
	/*
	 * 根据基金代码查询基金的历史数据,分页
	 */

	@Override
	public Pager  findAllByFundCode(String fundCode, int pageSize,
			int pageNo) {
		return this.fundHistoryDAO.findAllByFundCode(fundCode, pageSize, pageNo);
	}

	/*
	 * 根据收益率进行排名,取前Ｎ个.
	 * @see com.zj198.service.finservice.FinanceProdService#findByBenefitRate(java.lang.Integer)
	 */
	@Override
	public List<PrdBankfinance> findByBenefitRate(Integer num) {
		return this.prdBankfinanceDAO.findByBenefitRate(num);
	}

	/*
	 * 根据银行产品代码进行查询具体信息
	 * @see com.zj198.service.finservice.FinanceProdService#getBankfinanceByCode(java.lang.String)
	 */
	@Override
	public PrdBankfinance getBankfinanceByCode(String code) {
		return this.prdBankfinanceDAO.getByCode(code);
	}
	
	public PrdBankfinance getBankfinanceById(int id) {
		return this.prdBankfinanceDAO.get(id);
	}
	
	/*
	 * 查找全部银行产品,并分页
	 * @see com.zj198.service.finservice.FinanceProdService#findAll(int, int)
	 */
	@Override
	public Pager findAll(int pageSize, int pageNo) {
		return this.prdBankfinanceDAO.findAll(pageSize, pageNo);
	}

	/**
	 * 根据多条件进行查询,条件内容写在Query数据中,并分页.此条件由URL传入,以顺序编号,共六个条件.
	 * query[0]:销售状态
	 * query[1]:银行
	 * query[2]:投资期限
	 * query[3]:产品年收益率
	 * query[4]:最低投资金额
	 * queyr[5]:根据用户输入的基金名称进行模糊查询
	 * @see com.zj198.service.finservice.FinanceProdService#findBankProductsByMultiQuery(java.lang.String[], int, int)
	 */
	public Pager findBankProductsByMultiQuery(String[] query,
			int pageSize, int pageNo) {
		return this.prdBankfinanceDAO.findByMultiConditions(query, pageSize, pageNo);
	}

	@Override
	public Map<String, Object> findFundItemByMultiQuery(String[] query,
			int pageSize, int pageNo) {
		return null;
	}
	
	public void setPrdBankfinanceDAO(PrdBankfinanceDAO prdBankfinanceDAO) {
		this.prdBankfinanceDAO = prdBankfinanceDAO;
	}
	
	public void setFundBaseDAO(FudBaseDAO fundBaseDAO) {
		this.fundBaseDAO = fundBaseDAO;
	}
	public void setFundHistoryDAO(FudHisvalueDAO fundHistoryDAO) {
		this.fundHistoryDAO = fundHistoryDAO;
	}
	
	@Override
	public FudBase getBaseByFundCode(String fundCode) {
		return this.fundBaseDAO.getByFudCode(fundCode);
	}

	@Override
	public PrdRecommendation getPrdRecommendationById(int id) {
		return this.prdRecommendationDAO.get(id);
	}
	

	@Override
	public void savePrdRecommendation(PrdRecommendation instance, int oldSequence) {
		
		if (instance.getId() == null) {
			this.prdRecommendationDAO.updateSequence(instance.getTypeId(), instance.getSequence(), 1);
			this.prdRecommendationDAO.save(instance);
		} else {
			
			if (instance.getSequence() != oldSequence) {
				PrdRecommendation target = this.prdRecommendationDAO.getPrdRecommendationBySequence(instance.getTypeId(), instance.getSequence());
				if (target.getId() != instance.getId()) {
					target.setSequence(oldSequence);
					this.prdRecommendationDAO.update(target);
				}
			}
			this.prdRecommendationDAO.update(instance);
		}
	}
	
	public Pager findByRecommedation(String name, String bank, Date startDate,  Date endDate,  int status, int pageSize, int pageNo ) {
		return this.prdBankfinanceDAO.findByRecommedation(name, bank, startDate, endDate, status, pageSize, pageNo);
	}
	


	@Override
	public void deletePrdRecommendation(PrdRecommendation instance) {
		this.prdRecommendationDAO.updateSequence(
					instance.getTypeId(), instance.getSequence(), -1);
		instance.setSequence(null);
		instance.setStatus(0);
		this.prdRecommendationDAO.update(instance);
	}
	
	public void saveOrUpdateLoanRecommend(PrdRecommendation recommend){
		
		if(recommend.getId() != null){
			PrdRecommendation rec = prdRecommendationDAO.get(recommend.getId());
			if(rec.getSequence().intValue() != recommend.getSequence().intValue() && recommend.getStatus().intValue() == 1){
				if(prdRecommendationDAO.getPrdRecommendationBySequence(recommend.getTypeId(), recommend.getSequence()) != null){
					prdRecommendationDAO.updatePrdRecommendSeq(recommend.getTypeId(), recommend.getSequence());
				}
			}
			rec.setLastUpdatedDate(new Date());
			rec.setTitle(recommend.getTitle());
			rec.setSequence(recommend.getSequence());
			rec.setStatus(recommend.getStatus());
			prdRecommendationDAO.update(rec);
		}else{
			if(prdRecommendationDAO.getPrdRecommendationBySequence(recommend.getTypeId(), recommend.getSequence()) != null){
				prdRecommendationDAO.updatePrdRecommendSeq(recommend.getTypeId(), recommend.getSequence());
			}
			recommend.setCreatedDate(new Date());
			recommend.setLastUpdatedDate(new Date());
			PrdFinance finance = prdFinanceDAO.get(recommend.getProdId());
			recommend.setOriginalName(finance.getFinanceName());
			if(recommend.getTitle() == null || recommend.getTitle().equals("")){
				recommend.setTitle(finance.getFinanceName());
			}
			UsrUser user = usrUserDAO.get(finance.getUserId());
			recommend.setLogo(user.getLogo());
			prdRecommendationDAO.save(recommend);
		}

	}
	
	

	public PrdRecommendationDAO getPrdRecommendationDAO() {
		return prdRecommendationDAO;
	}

	public void setPrdRecommendationDAO(PrdRecommendationDAO prdRecommendationDAO) {
		this.prdRecommendationDAO = prdRecommendationDAO;
	}

	@Override
	public PrdRecommendation getPrdRecommendationByProduct(int typeId,
			int prodId) {
		return this.prdRecommendationDAO.getPrdRecommendationByProduct(typeId, prodId);
	}

	@Override
	public List<PrdRecommendation> findRecommendationByTopNumber(int typeId, int number) {
		return this.prdRecommendationDAO.findByTopNumber(typeId, number);
	}

	public void setPrdFinanceDAO(PrdFinanceDAO prdFinanceDAO) {
		this.prdFinanceDAO = prdFinanceDAO;
	}

	public void setUsrUserDAO(UsrUserDAO usrUserDAO) {
		this.usrUserDAO = usrUserDAO;
	}



}
