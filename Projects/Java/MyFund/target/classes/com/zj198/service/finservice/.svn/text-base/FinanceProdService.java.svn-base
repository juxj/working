package com.zj198.service.finservice;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.zj198.model.FudBase;
import com.zj198.model.FudHisvalue;
import com.zj198.model.PrdBankfinance;
import com.zj198.model.PrdRecommendation;
import com.zj198.util.Pager;

public interface FinanceProdService {
	
	/**
	 * @function:根据用户提供的基金代码，查询相应的基金详细信息
	 * @param fundCode
	 * @return
	 */
	public FudBase getBaseByFundCode(String fundCode);
	
	
	/**
	 * @function: 查询最近日期的基金数据
	 * @param date
	 * @return
	 */
	public List<FudHisvalue> findRecentlyList();
	
	/**
	 * @function: 根据基金类型进行查询,并分页.
	 * @param typeName
	 * @param pageSize
	 * @param pageNo
	 * @return
	 */
	public Pager findRecentlyList(String typeName, int pageSize, int pageNo);
	
	/**
	 * @function: 查询指定基金代码的全部历史数据,不分页
	 * @param fundCode
	 * @return
	 */
	public List<FudHisvalue> findAllByFundCode(String fundCode);
	
	public PrdBankfinance getBankfinanceById(int id);
	/**
	 * 查询指定基金代码的全部历史数据,分页
	 * @param fundCode
	 * @param pageSize
	 * @param pageNo
	 * @return
	 */
	public Pager findAllByFundCode(String fundCode, int pageSize, int pageNo);
	
	
	/**
	 * 获取收益比率最高的num条银行理财产品
	 * @param top
	 * @return
	 */
	public List<PrdBankfinance> findByBenefitRate(Integer num);
	
	/***
	 * 
	 * @param code
	 * @return
	 */
	public PrdBankfinance getBankfinanceByCode(String code);
	
	/**
	 * @function: 查询
	 * @param pageSize
	 * @param pageNo
	 * @return
	 */
	public Pager findAll(int pageSize, int pageNo);
	
	
	/**
	 * 根据多条件进行查询,条件内容写在Query数据中,并分页.此条件由URL传入,以顺序编号,共六个条件.<br>
	 * query[0]:销售状态<br/>
	 * query[1]:银行<br/>
	 * query[2]:投资期限<br/>
	 * query[3]:产品年收益率<br/>
	 * query[4]:最低投资金额<br/>
	 * queyr[5]:根据用户输入的基金名称进行模糊查询<br/>
	 * @see com.zj198.service.finservice.FinanceProdService#findBankProductsByMultiQuery(java.lang.String[], int, int)
	 * @param query
	 * @param pageSize
	 * @param pageNo
	 * @return
	 */
	public Pager findBankProductsByMultiQuery(String query[], int pageSize, int pageNo);
	
	
	/**
	 * 多条件查询基金
	 * @param query
	 * @param pageSize
	 * @param pageNo
	 * @return
	 */
	public Map<String, Object> findFundItemByMultiQuery(String query[], int pageSize, int pageNo);
	
	
	public PrdRecommendation getPrdRecommendationById(int id);
	
	public void savePrdRecommendation(PrdRecommendation instance, int oldSequence);
	
	public void deletePrdRecommendation(PrdRecommendation instance);

	public PrdRecommendation getPrdRecommendationByProduct(int typeId,
			int prodId);
	
	public List<PrdRecommendation> findRecommendationByTopNumber(int typeId, int number);
	
	public Pager findByRecommedation(String name, String bank, Date startDate,  Date endDate,  int status, int pageSize, int pageNo);
	
}
