package com.zj198.dao.hibernate;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Query;

import com.zj198.action.loan.model.FindFinanceAdminSpModel;
import com.zj198.dao.PrdFinanceDAO;
import com.zj198.model.PrdFinance;
import com.zj198.model.PrdRecommendation;
import com.zj198.util.Constants;
import com.zj198.util.Pager;

/**
 * 
 * @author zeroleavebaoyang@gmail.com
 * @since 2012-7-2|下午4:32:33
 */
@SuppressWarnings("unchecked")
public class PrdFinanceDAOImpl extends HibernateDAO<PrdFinance, Integer> implements PrdFinanceDAO {


	public List<PrdFinance> findFinanceByUser(Integer userId) {
		String hql = "from PrdFinance t where t.proStatus!=200 and t.userId=:user_id order by t.id desc";
		return list(hql, "user_id", userId);
	}
	
	public Pager findFinanceAdmin(FindFinanceAdminSpModel spModel) {
		StringBuffer sql = new StringBuffer();
		sql.append("select {t.*},{t1.*} from PRD_FINANCE t left join (select * from PRD_RECOMMENDATION where type_id=:typeid and status=1) t1 on t.id=t1.prod_id");
		sql.append(" where t.pro_status in (197,198,199)");
		
		Hashtable<String, Object> params = new Hashtable<String, Object>();
		params.put("typeid", Constants.PRD_RECOMMEND_TYPE_LOAN);
		if(StringUtils.isNotBlank(spModel.getProductNum())){
			sql.append(" and t.finance_num like :financeNum");
			params.put("financeNum", "%" + spModel.getProductNum() + "%");
		}
		if(StringUtils.isNotBlank(spModel.getProductName())){
			sql.append(" and t.finance_name like :productName");
			params.put("productName", "%" + spModel.getProductName() + "%");
		}
		if(spModel.getFinanceType() != null && spModel.getFinanceType() >= 0){
			sql.append(" and t.finance_type = :financeType");
			params.put("financeType", spModel.getFinanceType());
		}
		if(spModel.getStatus() != null && spModel.getStatus() >= 0){
			sql.append(" and t.pro_status = :prostatus");
			params.put("prostatus", spModel.getStatus());
		}
		if(spModel.getStartDt() != null){
			sql.append(" and date(t.createdt) >= :startdt");
			params.put("startdt", spModel.getStartDt());
		}
		if(spModel.getEndDt() != null){
			sql.append(" and date(t.createdt) <= :enddt");
			params.put("enddt", spModel.getEndDt());
		}
		if(spModel.getRecommendStatus() != null && spModel.getRecommendStatus() >=0){
			sql.append(" and IFNULL(t1.status,0) = :recommendStatus");
			params.put("recommendStatus", spModel.getRecommendStatus());
		}
		sql.append(" order by t.id desc");
		
		Map<String,Class> entityMap = new HashMap<String, Class>();
		entityMap.put("t", PrdFinance.class);
		entityMap.put("t1", PrdRecommendation.class);
		
		Pager pager = pagedComplexSqlQuery(sql.toString(), entityMap, spModel.getPager().getCurrentPage(), spModel.getPager().getPageCount(), params);
		List<Object> list = pager.getData();
		List<Object> newList = new ArrayList<Object>();
		if(list != null && list.size() > 0){			
			for(int i = 0; i < list.size(); i++){
				Object[] obj = (Object[]) list.get(i);
				PrdFinance p = null;
				PrdRecommendation r = null;
				if(obj[0] instanceof PrdFinance){					
					p = (PrdFinance) obj[0];
					r = (PrdRecommendation) obj[1];
				}else{
					p = (PrdFinance) obj[1];
					r = (PrdRecommendation) obj[0];
				}
				if(r == null){					
					p.setRecommendStatus(0);
				}else{					
					p.setRecommendStatus(r.getStatus());
					p.setRecommendNo(r.getSequence());
				}
				newList.add(p);
			}
		}
		pager.setData(newList);
		
		return pager;
	}

	public Pager findFinanceAdmin_old(FindFinanceAdminSpModel spModel) {
//		String hql = "from PrdFinance t where t.proStatus in (197,198,199) order by t.id desc";
		StringBuffer hql = new StringBuffer();
		hql.append("from PrdFinance t where t.proStatus in (197,198,199)");
		Hashtable<String, Object> params = new Hashtable<String, Object>();
		if(StringUtils.isNotBlank(spModel.getProductNum())){
			hql.append(" and t.financeNum like :financeNum");
			params.put("financeNum", "%" + spModel.getProductNum() + "%");
		}
		if(StringUtils.isNotBlank(spModel.getProductName())){
			hql.append(" and t.financeName like :productName");
			params.put("productName", "%" + spModel.getProductName() + "%");
		}
		if(spModel.getFinanceType() != null && spModel.getFinanceType() >= 0){
			hql.append(" and t.financeType = :financeType");
			params.put("financeType", spModel.getFinanceType());
		}
		if(spModel.getStatus() != null && spModel.getStatus() >= 0){
			hql.append(" and t.proStatus = :prostatus");
			params.put("prostatus", spModel.getStatus());
		}
		if(spModel.getRecommendStatus() != null && spModel.getRecommendStatus() >= 0){
			hql.append(" and IFNULL(t.recommendStatus,0) = :recommendStatus");
			params.put("recommendStatus", spModel.getRecommendStatus());
		}
		if(spModel.getStartDt() != null){
			hql.append(" and date(t.createdt) >= :startdt");
			params.put("startdt", spModel.getStartDt());
		}
		if(spModel.getEndDt() != null){
			hql.append(" and date(t.createdt) <= :enddt");
			params.put("enddt", spModel.getEndDt());
		}
		hql.append(" order by t.id desc");
		
		return pagedQuery(hql.toString(), spModel.getPager().getCurrentPage(), spModel.getPager().getPageCount(), params);
	}

	public List<PrdFinance> getProByRec(Object[] queryParams) {
		String hql = "from PrdFinance o where o.proStatus = 198 and o.userId = ? and o.financeType = ?";
		Query q = this.getSession().createQuery(hql);
		for (int i = 0; i < queryParams.length; i++) {
			q.setParameter(i, queryParams[i]);
		}
		return q.list();
	}

	public List<PrdFinance> getListByIds(Object[] ids) {
		List<PrdFinance> ordFinanceProducts = null;
		if (ids != null && ids.length > 0) {
			StringBuffer sb = new StringBuffer();
			for (int j = 0; j < ids.length; j++) {
				sb.append("?").append(",");
			}
			sb.deleteCharAt(sb.length() - 1);
			Query q = this.getSession().createQuery("from PrdFinance o where o.id in (" + sb.toString() + ")");
			for (int i = 0; i < ids.length; i++) {
				q.setParameter(i, ids[i]);
			}
			ordFinanceProducts = q.list();
		}
		return ordFinanceProducts;
	}

	public List<PrdFinance> getByWhere(Object[] queryParams) {
		StringBuffer sb = new StringBuffer("from PrdFinance o where o.financeType = ? and exists (select u.id from UsrUser u where o.userId = u.id and (");
		if (queryParams != null && queryParams.length > 1) {
			for (int i = 1; i < queryParams.length; i++) {
				sb.append(" u.type = ? ").append("or");
			}
			sb.delete(sb.length() - 2, sb.length());
			sb.append("))");
		} else {
			sb.delete(sb.length() - 6, sb.length());
			sb.append(")");
		}
		Query query = this.getSession().createQuery(sb.toString());
		if (queryParams != null && queryParams.length > 0) {
			for (int i = 0; i < queryParams.length; i++) {
				query.setParameter(i, queryParams[i]);
			}
		}
		return query.list();
	}

	public List<PrdFinance> recomPro(Integer financeType, Long loanAmount, Integer loanMonth, String orgId) {
		String hql = "from PrdFinance o where 1=1 and o.proStatus = 198";
		Hashtable<String, Object> params = new Hashtable<String, Object>();
		if (financeType != null && financeType > 0) {
			hql = hql + " and o.financeType = :financeType";
			params.put("financeType", financeType);
		}
		if (loanAmount != null && loanAmount > 0) {
			hql = hql + " and o.financeLittleamount <= :financeLittleamount and o.financeBigamount >= :financeBigamount";
			params.put("financeLittleamount", loanAmount);
			params.put("financeBigamount", loanAmount);
		}
		if (loanMonth != null && loanMonth > 0) {
			hql = hql + " and o.financeLittledt <= :financeLittledt and o.financeMostdt >= :financeMostdt";
			params.put("financeLittledt", loanMonth);
			params.put("financeMostdt", loanMonth);
		}
		if (!StringUtils.isBlank(orgId)) {
			hql = hql + " and exists (select u.id from UsrUser u where o.userId = u.id and (";
			String[] opts = orgId.split(",");
			if (opts.length > 0 && opts != null) {
				for (int i = 1; i < opts.length; i++) {
					hql = hql + "u.type = :type" + i + " or ";
					params.put("type" + i, (short) Integer.parseInt(opts[i]));
				}
				hql = hql.substring(0, hql.length() - 4) + "))";

			} else {
				hql = hql.substring(0, hql.length() - 6) + ")";
			}
		}
//		System.out.println(hql);
		return list(hql, params);
	}
	public Pager findProByCond(int pageNo, int pageSize, Integer financeType, String purposeType, Long financeAmount, Integer financeDate, String mortgageType, String userType, String checkTime, String companyAllAsset, String creditAcount, String experience, String needEnsure, String operatIncome, Integer settingYear, String bankSalaryList, String repaymentType, Integer runningArea, Integer industryId, Integer childId, Integer selectArea) {
		Hashtable<String, Object> params = new Hashtable<String, Object>();
		StringBuffer sql = new StringBuffer();
		sql.append("select o.* from PRD_FINANCE as o")
			.append(" left join (select * from PRD_RECOMMENDATION where type_id=:typeId and status=1) r on o.id=r.prod_id")
			.append(" where o.pro_Status = 198");
		//String hql = "select * from PRD_FINANCE as o left join (select * from PRD_RECOMMENDATION where type_id=:typeId) r on o.id=r.prod_id where o.pro_Status = 198";
		// 贷款类型
		params.put("typeId", Constants.PRD_RECOMMEND_TYPE_LOAN);
		if (financeType != null) {
			sql.append(" and o.finance_Type = :financeType");
			params.put("financeType", financeType);
		}
		// 贷款用途
		if (!"-1".equals(purposeType) && StringUtils.isNotBlank(purposeType)) {
			sql.append(" and o.purpose_Type like :purposeType");
			params.put("purposeType", "%," + purposeType + ",%");
		}
		// 贷款金额 卡范围
		if (!"-1".equals(financeAmount) && financeAmount != null) {
			sql.append(" and o.finance_Littleamount <= :financeLittleamount and o.finance_Bigamount >= :financeBigamount");
			params.put("financeLittleamount", financeAmount);
			params.put("financeBigamount", financeAmount);
		}
		// 贷款期限
		if (!"-1".equals(financeDate) && financeDate != null) {
			sql.append(" and o.finance_Littledt <= :financeLittledt and o.finance_Mostdt >= :financeMostdt");
			params.put("financeLittledt", financeDate);
			params.put("financeMostdt", financeDate);
		}
		// 融资渠道
		if (!"-1".equals(userType) && StringUtils.isNotBlank(userType)) {
			sql.append(" and o.user_Type = :userType");
			// hql = hql +
			// " and exists (select id from UsrUser u where u.id = o.id and u.type = :type)";
			params.put("userType", Integer.parseInt(userType));
		}
		// 担保方式
		if (!"-1".equals(mortgageType) && StringUtils.isNotBlank(mortgageType)) {
			sql.append(" and o.mortgage_Type like :mortgageType");
			params.put("mortgageType", "%," + mortgageType + ",%");
		}
		// 还款方式
		if (!"-1".equals(repaymentType) && StringUtils.isNotBlank(repaymentType)) {
			sql.append(" and o.repayment_Type like :repaymentType");
			params.put("repaymentType", "%," + repaymentType + ",%");
		}
		// 审批时间(3,7)
		if (!"-1".equals(checkTime) && StringUtils.isNotBlank(checkTime)) {
			sql.append(" and o.check_Time >= :ftime and o.check_Time <= :stime");
			String[] opts = checkTime.split(",");
			if (opts.length > 0 && opts != null) {
				int[] opti = new int[opts.length];
				for (int i = 0; i < opts.length; i++) {
					opti[i] = Integer.parseInt(opts[i]);
				}
				params.put("ftime", opti[0]);
				params.put("stime", opti[1]);
			}
		}
		// 公司总资产
		if (!"-1".equals(companyAllAsset) && StringUtils.isNotBlank(companyAllAsset)) {
			String[] opts = companyAllAsset.split(",");
			if (opts.length > 0 && opts != null) {
				int[] opti = new int[opts.length];
				for (int i = 0; i < opts.length; i++) {
					opti[i] = Integer.parseInt(opts[i]);
				}
				sql.append(" and o.company_All_Asset in (0, :fset)");
				params.put("fset", opti[0]);
				// if (opti[1] == -1) {
				// hql = hql + " and o.companyAllAsset >= :fset";
				// params.put("fset", opti[0]);
				// } else {
				// hql = hql +
				// " and o.companyAllAsset >= :fset and o.companyAllAsset <= :sset";
				// params.put("fset", opti[0]);
				// params.put("sset", opti[1]);
				// }
			}
		}
		// 企业年营业收入
		if (!"-1".equals(operatIncome) && StringUtils.isNotBlank(operatIncome)) {
			String[] opts = operatIncome.split(",");
			if (opts.length > 0 && opts != null) {
				int[] opti = new int[opts.length];
				for (int i = 0; i < opts.length; i++) {
					opti[i] = Integer.parseInt(opts[i]);
				}
				sql.append(" and o.operat_Income in (0, :fcome)");
				params.put("fcome", opti[0]);
				// if (opti[1] == -1) {
				// hql = hql + " and o.operatIncome >= :fcome";
				// params.put("fcome", opti[0]);
				// } else {
				// hql = hql +
				// " and o.operatIncome >= :fcome and o.operatIncome <= :scome";
				// params.put("fcome", opti[0]);
				// params.put("scome", opti[1]);
				// }
			}
		}
		// 企业成立年数
		if (settingYear != null && settingYear > -1) {
			sql.append(" and o.setting_Year <= :settingYear");
			params.put("settingYear", settingYear);
		}
		// 保证金
		if (!"-1".equals(needEnsure) && StringUtils.isNotBlank(needEnsure)) {
			sql.append(" and o.need_Ensure <= :needEnsure");
			params.put("needEnsure", needEnsure);
		}
		// 申请人行业经验
		if (!"-1".equals(experience) && StringUtils.isNotBlank(experience)) {
			String[] opts = experience.split(",");
			if (opts.length > 0 && opts != null) {
				int[] opti = new int[opts.length];
				for (int i = 0; i < opts.length; i++) {
					opti[i] = Integer.parseInt(opts[i]);
				}
				sql.append(" and o.experience in (0, :fneed)");
				params.put("fneed", opti[0]);
				// if (opti[1] == -1) {
				// hql = hql + " and o.experience >= :fneed";
				// params.put("fneed", opti[0]);
				// } else {
				// hql = hql +
				// " and o.experience >= :fneed and o.experience <= :sneed";
				// params.put("fneed", opti[0]);
				// params.put("sneed", opti[1]);
				// }
			}
		}
		// 经营场所
		if (runningArea != null && runningArea > -1) {
			sql.append(" and o.running_Area = :runningArea");
			params.put("runningArea", runningArea);
		}
		// 只选择主行业
		if ((industryId != null && industryId > 0) && (childId == null || childId == 0)) {
			sql.append(" and exists (select id from PRD_FINANCE_INDUCTY t2 where o.id = t2.finance_Id and (t2.industry_Id = :industryId or t2.industry_Id = 0))");
			params.put("industryId", industryId);
		}
		// 同时选择主,子行业
		if (industryId != null && industryId > 0 && childId != null && childId > 0) {
			sql.append(" and exists (select id from PRD_FINANCE_INDUCTY t2 where o.id = t2.finance_Id and (t2.industry_Childid = :industryChildid or t2.industry_Childid = 0))");
			params.put("industryChildid", childId);
		}
		//二期新增一个地域筛选条件
		if(selectArea != null && selectArea >0){
			sql.append(" and exists (select id from PRD_FINANCE_AREA t3 where ((t3.province_Id = 0 and t3.city_Id = 0) or (t3.province_Id =:selectArea and t3.city_Id=0) or (t3.province_Id=0 and t3.city_Id in (select t4.id from PRD_FINANCE_AREA t4 where t4.province_Id =:selectArea))) and t3.finance_Id = o.id)");
			params.put("selectArea", selectArea);
		}
		sql.append(" order by IFNULL(r.sequence,100000), o.id desc");

		return super.pagedSqlQuery(sql.toString(),PrdFinance.class, pageNo, pageSize, params);
	}
/*
	public Pager findProByCond(int pageNo, int pageSize, Integer financeType, String purposeType, Long financeAmount, Integer financeDate, String mortgageType, String userType, String checkTime, String companyAllAsset, String creditAcount, String experience, String needEnsure, String operatIncome, Integer settingYear, String bankSalaryList, String repaymentType, Integer runningArea, Integer industryId, Integer childId, Integer selectArea) {
		Hashtable<String, Object> params = new Hashtable<String, Object>();
		String hql = "from PrdFinance as o where o.proStatus = 198";
		// 贷款类型
		if (financeType != null) {
			hql = hql + " and o.financeType = :financeType";
			params.put("financeType", financeType);
		}
		// 贷款用途
		if (!"-1".equals(purposeType) && StringUtils.isNotBlank(purposeType)) {
			hql = hql + " and o.purposeType like :purposeType";
			params.put("purposeType", "%," + purposeType + ",%");
		}
		// 贷款金额 卡范围
		if (!"-1".equals(financeAmount) && financeAmount != null) {
			hql = hql + " and o.financeLittleamount <= :financeLittleamount and financeBigamount >= :financeBigamount";
			params.put("financeLittleamount", financeAmount);
			params.put("financeBigamount", financeAmount);
		}
		// 贷款期限
		if (!"-1".equals(financeDate) && financeDate != null) {
			hql = hql + " and o.financeLittledt <= :financeLittledt and financeMostdt >= :financeMostdt";
			params.put("financeLittledt", financeDate);
			params.put("financeMostdt", financeDate);
		}
		// 融资渠道
		if (!"-1".equals(userType) && StringUtils.isNotBlank(userType)) {
			hql = hql + " and o.userType = :userType";
			// hql = hql +
			// " and exists (select id from UsrUser u where u.id = o.id and u.type = :type)";
			params.put("userType", Integer.parseInt(userType));
		}
		// 担保方式
		if (!"-1".equals(mortgageType) && StringUtils.isNotBlank(mortgageType)) {
			hql = hql + " and o.mortgageType like :mortgageType";
			params.put("mortgageType", "%," + mortgageType + ",%");
		}
		// 还款方式
		if (!"-1".equals(repaymentType) && StringUtils.isNotBlank(repaymentType)) {
			hql = hql + " and o.repaymentType like :repaymentType";
			params.put("repaymentType", "%," + repaymentType + ",%");
		}
		// 审批时间(3,7)
		if (!"-1".equals(checkTime) && StringUtils.isNotBlank(checkTime)) {
			hql = hql + " and o.checkTime >= :ftime and o.checkTime <= :stime";
			String[] opts = checkTime.split(",");
			if (opts.length > 0 && opts != null) {
				int[] opti = new int[opts.length];
				for (int i = 0; i < opts.length; i++) {
					opti[i] = Integer.parseInt(opts[i]);
				}
				params.put("ftime", opti[0]);
				params.put("stime", opti[1]);
			}
		}
		// 公司总资产
		if (!"-1".equals(companyAllAsset) && StringUtils.isNotBlank(companyAllAsset)) {
			String[] opts = companyAllAsset.split(",");
			if (opts.length > 0 && opts != null) {
				int[] opti = new int[opts.length];
				for (int i = 0; i < opts.length; i++) {
					opti[i] = Integer.parseInt(opts[i]);
				}
				hql = hql + " and o.companyAllAsset in (0, :fset)";
				params.put("fset", opti[0]);
				// if (opti[1] == -1) {
				// hql = hql + " and o.companyAllAsset >= :fset";
				// params.put("fset", opti[0]);
				// } else {
				// hql = hql +
				// " and o.companyAllAsset >= :fset and o.companyAllAsset <= :sset";
				// params.put("fset", opti[0]);
				// params.put("sset", opti[1]);
				// }
			}
		}
		// 企业年营业收入
		if (!"-1".equals(operatIncome) && StringUtils.isNotBlank(operatIncome)) {
			String[] opts = operatIncome.split(",");
			if (opts.length > 0 && opts != null) {
				int[] opti = new int[opts.length];
				for (int i = 0; i < opts.length; i++) {
					opti[i] = Integer.parseInt(opts[i]);
				}
				hql = hql + " and o.operatIncome in (0, :fcome)";
				params.put("fcome", opti[0]);
				// if (opti[1] == -1) {
				// hql = hql + " and o.operatIncome >= :fcome";
				// params.put("fcome", opti[0]);
				// } else {
				// hql = hql +
				// " and o.operatIncome >= :fcome and o.operatIncome <= :scome";
				// params.put("fcome", opti[0]);
				// params.put("scome", opti[1]);
				// }
			}
		}
		// 企业成立年数
		if (settingYear != null && settingYear > -1) {
			hql = hql + " and o.settingYear <= :settingYear";
			params.put("settingYear", settingYear);
		}
		// 保证金
		if (!"-1".equals(needEnsure) && StringUtils.isNotBlank(needEnsure)) {
			hql = hql + " and o.needEnsure <= :needEnsure";
			params.put("needEnsure", needEnsure);
		}
		// 申请人行业经验
		if (!"-1".equals(experience) && StringUtils.isNotBlank(experience)) {
			String[] opts = experience.split(",");
			if (opts.length > 0 && opts != null) {
				int[] opti = new int[opts.length];
				for (int i = 0; i < opts.length; i++) {
					opti[i] = Integer.parseInt(opts[i]);
				}
				hql = hql + " and o.experience in (0, :fneed)";
				params.put("fneed", opti[0]);
				// if (opti[1] == -1) {
				// hql = hql + " and o.experience >= :fneed";
				// params.put("fneed", opti[0]);
				// } else {
				// hql = hql +
				// " and o.experience >= :fneed and o.experience <= :sneed";
				// params.put("fneed", opti[0]);
				// params.put("sneed", opti[1]);
				// }
			}
		}
		// 经营场所
		if (runningArea != null && runningArea > -1) {
			hql = hql + " and o.runningArea = :runningArea";
			params.put("runningArea", runningArea);
		}
		// 只选择主行业
		if ((industryId != null && industryId > 0) && (childId == null || childId == 0)) {
			hql = hql + " and exists (select id from PrdFinanceInducty t2 where o.id = t2.financeId and (t2.industryId = :industryId or t2.industryId = 0))";
			params.put("industryId", industryId);
		}
		// 同时选择主,子行业
		if (industryId != null && industryId > 0 && childId != null && childId > 0) {
			hql = hql + " and exists (select id from PrdFinanceInducty t2 where o.id = t2.financeId and (t2.industryChildid = :industryChildid or t2.industryChildid = 0))";
			params.put("industryChildid", childId);
		}
		//二期新增一个地域筛选条件
		if(selectArea != null && selectArea >0){
			hql = hql + " and exists (select id from PrdFinanceArea t3 where ((t3.provinceId = 0 and t3.cityId = 0) or (t3.provinceId =:selectArea and t3.cityId=0) or (t3.provinceId=0 and t3.cityId in (select t4.id from PrdFinanceArea t4 where t4.provinceId =:selectArea))) and t3.financeId = o.id)";
			params.put("selectArea", selectArea);
		}
		hql = hql + " order by o.id desc";

		return super.pagedQuery(hql, pageNo, pageSize, params);
	}
	*/
	public List<PrdFinance> findFinanceImportent(Integer number){
		String hql = "from PrdFinance t where t.proStatus = 198 and t.recommendStatus=1 order by t.recommendNo asc, t.recommendTime desc";
		return this.findTopRows(hql, number);
	}

}
