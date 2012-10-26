package com.zj198.service.loan.impl;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;

import com.zj198.action.loan.model.FinanceProductExtendModel;
import com.zj198.action.loan.model.FindFinanceAdminSpModel;
import com.zj198.action.loan.model.PreviewFinanceProSrModel;
import com.zj198.dao.DicBankDAO;
import com.zj198.dao.DicCityDAO;
import com.zj198.dao.DicIndustryDAO;
import com.zj198.dao.DicProvinceDAO;
import com.zj198.dao.PrdDatafileListDAO;
import com.zj198.dao.PrdExtendsPropertyDAO;
import com.zj198.dao.PrdFinanceAreaDAO;
import com.zj198.dao.PrdFinanceDatafileDAO;
import com.zj198.dao.PrdFinanceInductyDAO;
import com.zj198.dao.PrdFinanceInterestDAO;
import com.zj198.dao.PrdFinanceDAO;
import com.zj198.dao.PrdPropertyDicDAO;
import com.zj198.dao.UsrBankDAO;
import com.zj198.dao.UsrUserDAO;
import com.zj198.model.DicBank;
import com.zj198.model.PrdDatafileList;
import com.zj198.model.PrdExtendsProperty;
import com.zj198.model.PrdFinanceArea;
import com.zj198.model.PrdFinanceDatafile;
import com.zj198.model.PrdFinanceInducty;
import com.zj198.model.PrdFinanceInterest;
import com.zj198.model.PrdFinance;
import com.zj198.model.PrdPropertyDic;
import com.zj198.model.UsrBank;
import com.zj198.model.UsrUser;
import com.zj198.model.vo.FinanceAreaModel;
import com.zj198.model.vo.FinanceIndustryModel;
import com.zj198.service.loan.FinanceProductService;
import com.zj198.service.loan.model.FinanceProductSpModel;
import com.zj198.service.loan.model.FinanceProductSrModel;
import com.zj198.util.Constants;
import com.zj198.util.OrderNOCreator;
import com.zj198.util.Pager;
import com.zj198.util.StringUtil;
/**
 * @author 岳龙
 * Description:
 * CreateAuthor:岳龙
 * CreateDate:2012-7-05 14:54:57
 */
public class FinanceProductServiceImpl implements FinanceProductService {
	private PrdFinanceDAO prdFinanceDAO;
	private PrdFinanceInterestDAO prdFinanceInterestDAO;
	private PrdFinanceAreaDAO prdFinanceAreaDAO;
	private PrdFinanceInductyDAO prdFinanceInductyDAO;
	private PrdFinanceDatafileDAO prdFinanceDatafileDAO;
	private PrdDatafileListDAO prdDatafileListDAO;
	private DicProvinceDAO dicProvinceDAO;
	private DicCityDAO dicCityDAO;
	private DicIndustryDAO dicIndustryDAO;
	private UsrUserDAO usrUserDAO;
	private PrdExtendsPropertyDAO prdExtendsPropertyDAO;
	private PrdPropertyDicDAO prdPropertyDicDAO;
	
	public void setPrdFinanceDAO(PrdFinanceDAO prdFinanceDAO) {
		this.prdFinanceDAO = prdFinanceDAO;
	}
	
	public List<PrdDatafileList> findDataFileListAll(){
		return prdDatafileListDAO.findAll();
	}
	/**
	 * @author 岳龙
	 * Description:
	 * CreateAuthor:岳龙
	 * CreateDate:2012-7-05 14:54:57
	 * @param 
	 * @return 
	 */
	public List<PrdFinance> findFinanceImportent(Integer number) {
		return this.prdFinanceDAO.findFinanceImportent(number);
	}
	/**
	 * @author 岳龙
	 * Description:
	 * CreateAuthor:岳龙
	 * CreateDate:2012-7-05 14:54:57
	 * @param 
	 * @return 
	 */
	public List<PrdFinance> findFinanceByUser(Integer userId) {
		return prdFinanceDAO.findFinanceByUser(userId);
	}
	
	public Pager findFinanceAdmin(FindFinanceAdminSpModel spModel){
		return prdFinanceDAO.findFinanceAdmin(spModel);
	}
	
	public void updateRecommendFinance(PrdFinance product){
		PrdFinance f = prdFinanceDAO.get(product.getId());
		f.setRecommendStatus(product.getRecommendStatus());
		if(StringUtils.isBlank(product.getRecommendName())){
			f.setRecommendName(f.getFinanceName());
		}else{			
			f.setRecommendName(product.getRecommendName());
		}
		f.setRecommendNo(product.getRecommendNo());
		f.setRecommendTime(new Date());
		prdFinanceDAO.update(f);
	}
	
	public FinanceProductSpModel getFinanceProductToEdit(Integer productId){
		FinanceProductSpModel spModel = new FinanceProductSpModel();
		PrdFinance product = prdFinanceDAO.get(productId);
		FinanceProductExtendModel peModel = new FinanceProductExtendModel();
		
		spModel.setProductSpecial(StringUtil.getArrayByStr(product.getProSpecial()));
		spModel.setUploadWay(StringUtil.getArrayByStr(product.getUploadWay()));
		
		spModel.setRepaymentType(StringUtil.getArrayByStr(product.getRepaymentType()));
		spModel.setMortgage(StringUtil.getArrayByStr(product.getMortgageType()));
		spModel.setPurposeCompany(StringUtil.getArrayByStr(product.getPurposeType()));
		
		spModel.setPurposePersonBuy(StringUtil.getArrayByStr(product.getPurposeType()));
		spModel.setPurposePersonRunning(StringUtil.getArrayByStr(product.getPurposeType()));
		spModel.setHousePro(StringUtil.getArrayByStr(product.getHouseProperty()));
//		spModel.setRepaymentTypeHouse(StringUtil.getArrayByStr(product.getRepaymentType()));
		
		product.setRepaymentType("{157, 158}");
		
		peModel.setCompanyAllAsset(product.getCompanyAllAsset());
		peModel.setOperatIncome(product.getOperatIncome());
		peModel.setSettingYear(product.getSettingYear());
		peModel.setNeedEnsure(product.getNeedEnsure());
		peModel.setExperience(product.getExperience());
		peModel.setRunningArea(product.getRunningArea());
		peModel.setCreditAcount(product.getCreditAcount());
		peModel.setBankSalaryList(product.getBankSalaryList());
		peModel.setSalaryIncome(product.getSalaryIncome());
		peModel.setSalaryPutWay(product.getSalaryPutWay());
		peModel.setWorkTime(product.getWorkTime());
		peModel.setHouse(product.getHouse());
		peModel.setUseTime(product.getUseTime());
		peModel.setSurplus(product.getSurplus());
		
//		if(product.getOtherRequire() != null){
//			product.setOtherRequire(product.getOtherRequire().replaceAll("\r\n", "<br/>"));
//		}
//		if(product.getProIntroduce() != null){
//			product.setProIntroduce(product.getProIntroduce().replaceAll("\r\n", "<br/>"));
//		}
		product.getInterests().size();
//		if(product.getInterestType() != null && product.getInterestType().intValue() == 155){
//			java.util.Iterator<OrdFinanceInterest> iter = product.getInterests().iterator();
//			if(iter.hasNext()){
//				spModel.setInterest1(iter.next());
//			}
//			if(iter.hasNext()){
//				spModel.setInterest2(iter.next());
//			}
//			if(iter.hasNext()){
//				spModel.setInterest3(iter.next());
//			}
//			if(iter.hasNext()){
//				spModel.setInterest4(iter.next());
//			}
//			if(iter.hasNext()){
//				spModel.setInterest5(iter.next());
//			}
//		}
		List<FinanceAreaModel> areas = prdFinanceAreaDAO.findFiananceArea(product.getId());
		if(areas != null && areas.size() > 0){
			String areaStr = "";
			String areaName = "";
			for(FinanceAreaModel fam:areas){
				if(fam.getCityId().intValue() == 0 && fam.getProvinceId().intValue() == 0){
					spModel.setSelectArea("0");
				}else if(fam.getCityId().intValue() != 0){
					areaStr = areaStr + "C" + fam.getCityId() + ",";
					areaName = areaName + fam.getName() + ",";
				}else if(fam.getProvinceId().intValue() != 0){
					areaStr = areaStr + "P" + fam.getProvinceId() + ",";
					areaName = areaName + fam.getName() + ",";
				}
			}
			if(areaStr.length() > 0){
				spModel.setSelectArea("1");
				areaStr = areaStr.substring(0, areaStr.length()-1);
				areaName = areaName.substring(0, areaName.length()-1);
			}
			spModel.setCitySel(areaStr);
			spModel.setCitySelName(areaName);
			spModel.setSelectArea("1");
		}else{
			spModel.setSelectArea("0");
		}
	
		List<FinanceIndustryModel> industry = prdFinanceInductyDAO.findFiananceInducty(product.getId());
		if(industry != null && industry.size() > 0){
			String industryStr = "";
			String induName = "";
			for(FinanceIndustryModel fam:industry){
				if(fam.getIndustryId().intValue() == 0 && fam.getIndustryChildid().intValue() == 0){
					spModel.setIndustryStatus("0");
				}else if(fam.getIndustryId().intValue() != 0){
					industryStr = industryStr + "M" + fam.getIndustryId() + ",";
					induName = induName + fam.getName() + ",";
				}else if(fam.getIndustryChildid().intValue() != 0){
					industryStr = industryStr + "C" + fam.getIndustryChildid() + ",";
					induName = induName + fam.getName() + ",";
				}
			}
			if(industryStr.length() > 0){
				spModel.setIndustryStatus("1");
				industryStr = industryStr.substring(0, industryStr.length() -1);
				induName = induName.substring(0, induName.length() -1);
			}
			spModel.setIndustrySel(industryStr);
			spModel.setIndustrySelName(induName);
			spModel.setIndustryStatus("1");
		}else{
			spModel.setIndustryStatus("0");
		}
		List<PrdDatafileList> dataFileList = this.findDataFileListAll();
		Set<PrdFinanceDatafile> dfs = product.getDataFiles();
		if(dfs != null && dfs.size() > 0){
			StringBuffer dfStr = new StringBuffer();
			for(PrdFinanceDatafile df:dfs){
//				if(df.getOtherMemo() != null){
//					df.setOtherMemo(df.getOtherMemo().replaceAll("\r\n", "<br/>"));
//				}
				for(PrdDatafileList odfl : dataFileList){
					if(odfl.getId().intValue() == df.getDatafileId().intValue()){
						odfl.setSelectStatus("1");
						odfl.setDataNum(df.getNeedNum());
						odfl.setDataMemo(df.getDataSupply());
						odfl.setHaveMemo(df.getHaveMemo());
						odfl.setOtherMemo(df.getOtherMemo());
					}
				}
				dfStr.append(df.getDatafileId()).append("/")
					.append(df.getDataName()).append("/")
					.append(df.getNeedNum() == null ?"":df.getNeedNum()).append("/")
					.append(df.getDataSupply() == null ?"":df.getDataSupply()).append("/")
					.append(df.getHaveMemo() != null && df.getHaveMemo().intValue() == 1?df.getOtherMemo():"").append("#");
			}
			spModel.setDatalistStr(dfStr.toString());
		}
		spModel.setDataFileList(dataFileList);
		spModel.setFinanceExtend(peModel);
		spModel.setProduct(product);
		spModel.setExtendsPropertyList(prdExtendsPropertyDAO.getFinancePropertys(product.getId()));
		return spModel;
	}
	public FinanceProductSrModel updateFinance(FinanceProductSpModel spModel) {
		FinanceProductSrModel srModel = new FinanceProductSrModel();
		PrdFinance newpro = spModel.getProduct();
		PrdFinance product = prdFinanceDAO.get(newpro.getId());
		
		FinanceProductExtendModel pe = spModel.getFinanceExtend();
		
		Integer financeType = newpro.getFinanceType();
		
		product.setFinanceType(newpro.getFinanceType());
		product.setFinanceName(newpro.getFinanceName());
		product.setFinanceLittledt(newpro.getFinanceLittledt());
		product.setFinanceMostdt(newpro.getFinanceMostdt());
		product.setFinanceLittleamount(newpro.getFinanceLittleamount());
		product.setFinanceBigamount(newpro.getFinanceBigamount());
		product.setInterestType(newpro.getInterestType());
		product.setCheckTime(newpro.getCheckTime());
		product.setProIntroduce(newpro.getProIntroduce());
		product.setOtherRequire(newpro.getOtherRequire());
		
		product.setProSpecial(StringUtil.getStrByArray(spModel.getProductSpecial()));
		product.setUploadWay(StringUtil.getStrByArray(spModel.getUploadWay()));
	
		if(financeType.intValue() == 151){
			product.setRepaymentType(StringUtil.getStrByArray(spModel.getRepaymentType()));
			product.setMortgageType(StringUtil.getStrByArray(spModel.getMortgage()));
			product.setPurposeType(StringUtil.getStrByArray(spModel.getPurposeCompany()));
			product.setCompanyAllAsset(pe.getCompanyAllAsset());
			product.setOperatIncome(pe.getOperatIncome());
			product.setSettingYear(pe.getSettingYear());
		}else if(financeType.intValue() == 152){
			product.setRepaymentType(StringUtil.getStrByArray(spModel.getRepaymentType()));
			product.setMortgageType(StringUtil.getStrByArray(spModel.getMortgage()));
			product.setPurposeType(StringUtil.getStrByArray(spModel.getPurposePersonRunning()));
			product.setCompanyAllAsset(pe.getCompanyAllAsset());
			product.setNeedEnsure(pe.getNeedEnsure());
			product.setExperience(pe.getExperience());
			product.setRunningArea(pe.getRunningArea());
			product.setCreditAcount(pe.getCreditAcount());
			product.setBankSalaryList(pe.getBankSalaryList());
		}else if(financeType.intValue() == 153){
			product.setRepaymentType(StringUtil.getStrByArray(spModel.getRepaymentType()));
			product.setMortgageType(StringUtil.getStrByArray(spModel.getMortgage()));
			product.setPurposeType(StringUtil.getStrByArray(spModel.getPurposePersonBuy()));
			product.setSalaryIncome(pe.getSalaryIncome());
			product.setSalaryPutWay(pe.getSalaryPutWay());
			product.setWorkTime(pe.getWorkTime());
			product.setHouse(pe.getHouse());
			product.setCreditAcount(pe.getCreditAcount());
			product.setBankSalaryList(pe.getBankSalaryList());
		}else if(financeType.intValue() == 154){
			product.setHouseProperty(StringUtil.getStrByArray(spModel.getHousePro()));
//			product.setRepaymentType(StringUtil.getStrByArray(spModel.getRepaymentTypeHouse()));
			product.setUseTime(pe.getUseTime());
			product.setSurplus(pe.getSurplus());
			product.setSalaryIncome(pe.getSalaryIncome());
			product.setSalaryPutWay(pe.getSalaryPutWay());
			product.setWorkTime(pe.getWorkTime());
			product.setHouse(pe.getHouse());
			product.setCreditAcount(pe.getCreditAcount());
			product.setBankSalaryList(pe.getBankSalaryList());
		}
		
		
//		if(product.getOtherRequire() != null){
//			product.setOtherRequire(product.getOtherRequire().replaceAll("\r\n", "<br/>"));
//		}
//		if(product.getProIntroduce() != null){
//			product.setProIntroduce(product.getProIntroduce().replaceAll("\r\n", "<br/>"));
//		}
		
//		product.setUserId(spModel.getUserId());
//		product.setUserType(spModel.getUserType());
//		product.setCreatedt(new Date());
//		product.setProStatus(new Integer(196));//草稿状态
		
		Set<PrdFinanceInterest> intset = new LinkedHashSet<PrdFinanceInterest>();
		
		Double[] rate = {5.85,6.31,6.4,6.65,6.8};
		String[] rateStr = {"六月以内（含六月)","六个月至一年（含一年）","一至三年（含三年）","三至五年（含五年）","五年以上"};
		Integer[][] ratedt = {{0,6},{6,12},{12,36},{36,60},{60,1000}};
		if(product.getInterests() != null && product.getInterests().size() > 0 ){
			for(PrdFinanceInterest o: product.getInterests()){
				prdFinanceInterestDAO.deleteObject(o);
			}
		}
		if(product.getInterestType() != null && product.getInterestType().intValue() == 155){
			Double maxRate = null;
			int status = 0;
			for(int i = 0, s = spModel.getRateStId(); i < spModel.getRateUp().length; i++, s++){
				status = 0;
				Double rateup = Double.valueOf(Math.round(rate[s-1] * (100 + spModel.getRateUp()[i])))/100;
				if(status == 0){					
					PrdFinanceInterest interest = new PrdFinanceInterest();
					interest.setFinanceId(product.getId());
					interest.setCreatedt(new Date());
					interest.setFinanceStartdt(ratedt[s-1][0]);
					interest.setFinanceEnddt(ratedt[s-1][1]);
					interest.setInterestMemo(rateStr[s-1]);
					interest.setRateUp(spModel.getRateUp()[i]);
					interest.setInterestBig(rateup);
					prdFinanceInterestDAO.save(interest);
					intset.add(interest);
				}
				if(i == 0){
					maxRate = rateup;
				}else if(rateup > maxRate){
					maxRate = rateup;
				}
			}
			product.setInterests(intset);
//			product.setLittleInterest(interest1.getInterestLittle());
			product.setBigInterest(maxRate);
		}else{
			int littledt = product.getFinanceLittledt();
			int mostdt = product.getFinanceMostdt();
			int limist = 1;
			int limien = 5;
			if(littledt > 60){
				limist = 5;
			}else if(littledt > 36 && littledt <=60){
				limist = 4;
			}else if(littledt > 12 && littledt <=36){
				limist = 3;
			}else if(littledt > 6 && littledt <=12){
				limist = 2;
			}else if(littledt <= 12){
				limist = 1;
			}
			if(mostdt > 60){
				limien = 5;
			}else if(mostdt > 36 && mostdt <=60){
				limien = 4;
			}else if(mostdt > 12 && mostdt <=36){
				limien = 3;
			}else if(mostdt > 6 && mostdt <=12){
				limien = 2;
			}else if(mostdt <= 12){
				limien = 1;
			}
			
			for(int i = limist; i<=limien;i++){
				PrdFinanceInterest interest = new PrdFinanceInterest();
				interest.setFinanceId(product.getId());
				interest.setCreatedt(new Date());
				interest.setFinanceStartdt(ratedt[i-1][0]);
				interest.setFinanceEnddt(ratedt[i-1][1]);
				interest.setInterestMemo(rateStr[i-1]);
//				interest.setRateUp(spModel.getRateUp()[i]);
//				Double rateup = Double.valueOf(Math.round(rate[i-1] * (100 + spModel.getRateUp()[i])))/100;
//				interest.setInterestBig(rateup);
				prdFinanceInterestDAO.save(interest);
			}
		}
		
		if(product.getLogo() == null || product.getLogo().equals("")){
			if(spModel.getUser() != null){				
				UsrUser user = usrUserDAO.get(spModel.getUser().getId());
				product.setLogo(user.getLogo());
			}
		}
		
		prdFinanceDAO.update(product);
		
		product.setInterests(intset);
		if(spModel.getSelectArea()!= null && spModel.getSelectArea().equals("0")){
			if(product.getFinanceAreas().size() > 1){
				for(PrdFinanceArea a: product.getFinanceAreas()){
					prdFinanceAreaDAO.delete(a.getId());
				}
				PrdFinanceArea area = new PrdFinanceArea();
				area.setFinanceId(product.getId());
				area.setCityId(new Integer(0));
				area.setProvinceId(new Integer(0));
				prdFinanceAreaDAO.save(area);
			}else if(product.getFinanceAreas().size() == 1){
				PrdFinanceArea area = product.getFinanceAreas().iterator().next();
				if(area.getCityId().intValue() != 0 || area.getProvinceId().intValue() != 0){
					area.setCityId(new Integer(0));
					area.setProvinceId(new Integer(0));
					prdFinanceAreaDAO.update(area);
				}
			}else{
				PrdFinanceArea area = new PrdFinanceArea();
				area.setFinanceId(product.getId());
				area.setCityId(new Integer(0));
				area.setProvinceId(new Integer(0));
				prdFinanceAreaDAO.save(area);
			}
		}else{
			if(product.getFinanceAreas() != null && product.getFinanceAreas().size() > 0 ){
				for(PrdFinanceArea o: product.getFinanceAreas()){
					prdFinanceAreaDAO.deleteObject(o);
				}
			}
			if(spModel.getCitySel() != null && !spModel.getCitySel().trim().equals("")){
				String[] citys = spModel.getCitySel().split(",");
				for(String city:citys){
					String c = city.substring(0,1);
					if(c.equals("P")){
						Integer pid = Integer.valueOf(city.substring(1));
						PrdFinanceArea area = new PrdFinanceArea();
						area.setFinanceId(product.getId());
						area.setProvinceId(pid);
						area.setCityId(Integer.valueOf(0));
						prdFinanceAreaDAO.save(area);
					}else if(c.equals("C")){
						Integer cid = Integer.valueOf(city.substring(1));
						PrdFinanceArea area = new PrdFinanceArea();
						area.setFinanceId(product.getId());
						area.setCityId(cid);
						area.setProvinceId(Integer.valueOf(0));
						prdFinanceAreaDAO.save(area);
					}
				}
			}
		}
		
		if(spModel.getIndustryStatus()!= null && spModel.getIndustryStatus().equals("0")){
			if(product.getFinanceInductys().size() > 1){
				for(PrdFinanceInducty a: product.getFinanceInductys()){
					prdFinanceInductyDAO.delete(a.getId());
				}
				PrdFinanceInducty indu = new PrdFinanceInducty();
				indu.setFinanceId(product.getId());
				indu.setIndustryId(Integer.valueOf(0));
				indu.setIndustryChildid(Integer.valueOf(0));
				prdFinanceInductyDAO.save(indu);
			}else if(product.getFinanceInductys().size() == 1){
				PrdFinanceInducty indu = product.getFinanceInductys().iterator().next();
				if(indu.getIndustryId().intValue() != 0 || indu.getIndustryChildid().intValue() != 0){
					indu.setIndustryChildid(new Integer(0));
					indu.setIndustryId(new Integer(0));
					prdFinanceInductyDAO.update(indu);
				}
			}else{
				PrdFinanceInducty indu = new PrdFinanceInducty();
				indu.setFinanceId(product.getId());
				indu.setIndustryId(Integer.valueOf(0));
				indu.setIndustryChildid(Integer.valueOf(0));
				prdFinanceInductyDAO.save(indu);
			}
			
		}else{
			if(product.getFinanceInductys() != null && product.getFinanceInductys().size() > 0){
				for(PrdFinanceInducty a: product.getFinanceInductys()){
					prdFinanceInductyDAO.delete(a.getId());
				}
			}
			if(spModel.getIndustrySel() != null && !spModel.getIndustrySel().trim().equals("")){
				String[] industrys = spModel.getIndustrySel().split(",");
				for(String industry:industrys){
					String c = industry.substring(0,1);
					if(c.equals("M")){
						Integer iid = Integer.valueOf(industry.substring(1));
						PrdFinanceInducty indu = new PrdFinanceInducty();
						indu.setFinanceId(product.getId());
						indu.setIndustryId(iid);
						indu.setIndustryChildid(Integer.valueOf(0));
						prdFinanceInductyDAO.save(indu);
					}else if(c.equals("C")){
						Integer iid = Integer.valueOf(industry.substring(1));
						PrdFinanceInducty indu = new PrdFinanceInducty();
						indu.setFinanceId(product.getId());
						indu.setIndustryId(Integer.valueOf(0));
						indu.setIndustryChildid(iid);
						prdFinanceInductyDAO.save(indu);
					}
				}
			}
		}
		
		if(spModel.getDatalistStr() != null && !spModel.getDatalistStr().trim().equals("")){
			String ds = spModel.getDatalistStr();
			ds = ds.substring(0, ds.length()-1);
			String[] data = ds.split("#");
			if(product.getDataFiles() != null && product.getDataFiles().size() > 0){
				for(PrdFinanceDatafile o : product.getDataFiles()){
					prdFinanceDatafileDAO.delete(o.getId());
				}
			}
			Set<PrdFinanceDatafile> sdfset = new LinkedHashSet<PrdFinanceDatafile>();
			for(String d:data){
				String[] f = d.split("/");
				PrdFinanceDatafile df = new PrdFinanceDatafile();
				df.setDatafileId(Integer.valueOf(f[0]));
				
				if(f.length >= 2){						
					df.setDataName(f[1]);
				}
				if(f.length >= 3 && f[2].length() > 0){						
					df.setNeedNum(Integer.valueOf(f[2]));
				}
				if(f.length >= 4){
					df.setDataSupply(f[3]);						
				}
				if(f.length >=5 && f[4].length() > 0){
//					df.setOtherMemo(f[4].replaceAll("\r\n", "<br/>"));
					df.setOtherMemo(f[4]);
					df.setHaveMemo(Integer.valueOf(1));
				}
				
				prdFinanceDatafileDAO.saveOrUpdate(df);
				
//				if(df.getOtherMemo() != null){
//					df.setOtherMemo(df.getOtherMemo().replaceAll("\r\n", "<br/>"));
//				}
				sdfset.add(df);
			}
			product.setDataFiles(sdfset);
		}else{
			if(product.getDataFiles() != null && product.getDataFiles().size() > 0){
				for(PrdFinanceDatafile o : product.getDataFiles()){
					prdFinanceDatafileDAO.delete(o.getId());
				}
			}
		}
		
		/**
		 * 扩展属性保存
		 */
		List<PrdExtendsProperty> extendsList = prdExtendsPropertyDAO.getFinancePropertys(product.getId());
		if(extendsList != null && extendsList.size() > 0){
			for(PrdExtendsProperty p :extendsList){
				List<PrdPropertyDic> pd = prdPropertyDicDAO.findPropertyDic(p.getId());
				if(pd != null && pd.size() > 0){
					for(PrdPropertyDic dic : pd){
						prdPropertyDicDAO.deleteObject(dic);
					}
				}
				prdExtendsPropertyDAO.deleteObject(p);
			}
		}
		List<PrdExtendsProperty> plist = new ArrayList<PrdExtendsProperty>();
		if(spModel.getExtendsName() != null && spModel.getExtendsName().length > 0){
			int j = 0;
			for(int i = 0; i< spModel.getExtendsName().length; i++){
				PrdExtendsProperty pro = new PrdExtendsProperty();
				pro.setExtendsType(Constants.EXTENDS_PROPERTY_FINANCE);
				pro.setRowId(product.getId());
				pro.setFieldName(spModel.getExtendsName()[i]);
				pro.setFieldType(spModel.getExtendsType()[i]);
				String pv = "";
				if(spModel.getExtendsType()[i] == 3 || spModel.getExtendsType()[i] == 4){
					pv = spModel.getExtendsValue()[j++];
					pro.setFieldValue(pv);
				}
				pro.setFieldvalueNullAble(0);
				pro.setStatus(0);
				prdExtendsPropertyDAO.save(pro);
				plist.add(pro);
				if(spModel.getExtendsType()[i] == 3 || spModel.getExtendsType()[i] == 4){
					if(pv != null && pv.length() > 0){
						String[] pstr = pv.split("#");
						for(int k = 0; k < pstr.length; k++){
							PrdPropertyDic dic = new PrdPropertyDic();
							dic.setGroupId(pro.getId());
							dic.setDicValue(k + 1);
							dic.setDicName(pstr[k]);
							prdPropertyDicDAO.save(dic);
						}
					}
				}
			}
		}
		srModel.setExtendsPropertyList(plist);
//		if(product.getOtherRequire() != null){
//			product.setOtherRequire(product.getOtherRequire().replaceAll("\r\n", "<br/>"));
//		}
//		if(product.getProIntroduce() != null){
//			product.setProIntroduce(product.getProIntroduce().replaceAll("\r\n", "<br/>"));
//		}
		
		srModel.setProduct(product);
		
		return srModel;
	}
	/**
	 * @author 岳龙
	 * Description:
	 * CreateAuthor:岳龙
	 * CreateDate:2012-7-05 14:54:57
	 * @param 
	 * @return 
	 */
	public FinanceProductSrModel saveFinance(FinanceProductSpModel spModel) {
		FinanceProductSrModel srModel = new FinanceProductSrModel();
		PrdFinance product = spModel.getProduct();
		FinanceProductExtendModel pe = spModel.getFinanceExtend();
		
		Integer financeType = product.getFinanceType();
		
		product.setProSpecial(StringUtil.getStrByArray(spModel.getProductSpecial()));
		product.setUploadWay(StringUtil.getStrByArray(spModel.getUploadWay()));
	
		if(financeType.intValue() == 151){
			product.setRepaymentType(StringUtil.getStrByArray(spModel.getRepaymentType()));
			product.setMortgageType(StringUtil.getStrByArray(spModel.getMortgage()));
			product.setPurposeType(StringUtil.getStrByArray(spModel.getPurposeCompany()));
			product.setCompanyAllAsset(pe.getCompanyAllAsset());
			product.setOperatIncome(pe.getOperatIncome());
			product.setSettingYear(pe.getSettingYear());
		}else if(financeType.intValue() == 152){
			product.setRepaymentType(StringUtil.getStrByArray(spModel.getRepaymentType()));
			product.setMortgageType(StringUtil.getStrByArray(spModel.getMortgage()));
			product.setPurposeType(StringUtil.getStrByArray(spModel.getPurposePersonRunning()));
			product.setCompanyAllAsset(pe.getCompanyAllAsset());
			product.setNeedEnsure(pe.getNeedEnsure());
			product.setExperience(pe.getExperience());
			product.setRunningArea(pe.getRunningArea());
			product.setCreditAcount(pe.getCreditAcount());
			product.setBankSalaryList(pe.getBankSalaryList());
		}else if(financeType.intValue() == 153){
			product.setRepaymentType(StringUtil.getStrByArray(spModel.getRepaymentType()));
			product.setMortgageType(StringUtil.getStrByArray(spModel.getMortgage()));
			product.setPurposeType(StringUtil.getStrByArray(spModel.getPurposePersonBuy()));
			product.setSalaryIncome(pe.getSalaryIncome());
			product.setSalaryPutWay(pe.getSalaryPutWay());
			product.setWorkTime(pe.getWorkTime());
			product.setHouse(pe.getHouse());
			product.setCreditAcount(pe.getCreditAcount());
			product.setBankSalaryList(pe.getBankSalaryList());
		}else if(financeType.intValue() == 154){
			product.setHouseProperty(StringUtil.getStrByArray(spModel.getHousePro()));
//			product.setRepaymentType(StringUtil.getStrByArray(spModel.getRepaymentTypeHouse()));
			product.setUseTime(pe.getUseTime());
			product.setSurplus(pe.getSurplus());
			product.setSalaryIncome(pe.getSalaryIncome());
			product.setSalaryPutWay(pe.getSalaryPutWay());
			product.setWorkTime(pe.getWorkTime());
			product.setHouse(pe.getHouse());
			product.setCreditAcount(pe.getCreditAcount());
			product.setBankSalaryList(pe.getBankSalaryList());
		}
		
//		if(product.getOtherRequire() != null){
//			product.setOtherRequire(product.getOtherRequire().replaceAll("\r\n", "<br/>"));
//		}
//		if(product.getProIntroduce() != null){
//			product.setProIntroduce(product.getProIntroduce().replaceAll("\r\n", "<br/>"));
//		}
		UsrUser user = usrUserDAO.get(spModel.getUser().getId());
		product.setLogo(user.getLogo());
		
		product.setUserId(spModel.getUser().getId());
		product.setUserType(Integer.valueOf(spModel.getUser().getType()));
		product.setCreatedt(new Date());
		product.setProStatus(new Integer(196));//草稿状态
		prdFinanceDAO.save(product);
		
		product.setFinanceNum(OrderNOCreator.rapidFinanceProductOrderNO(product.getId()));
		
		Double[] rate = {5.85,6.31,6.4,6.65,6.8};
		String[] rateStr = {"六月以内（含六月)","六个月至一年（含一年）","一至三年（含三年）","三至五年（含五年）","五年以上"};
		Integer[][] ratedt = {{0,6},{6,12},{12,36},{36,60},{60,1000}};
		if(product.getInterestType() != null && product.getInterestType().intValue() == 155){
			Set<PrdFinanceInterest> intset = new LinkedHashSet<PrdFinanceInterest>();
			Double maxRate = null;
			for(int i = 0, s = spModel.getRateStId(); i < spModel.getRateUp().length; i++, s++){
				PrdFinanceInterest interest = new PrdFinanceInterest();
				interest.setFinanceId(product.getId());
				interest.setCreatedt(new Date());
				interest.setFinanceStartdt(ratedt[s-1][0]);
				interest.setFinanceEnddt(ratedt[s-1][1]);
				interest.setInterestMemo(rateStr[s-1]);
				interest.setRateUp(spModel.getRateUp()[i]);
				Double rateup = Double.valueOf(Math.round(rate[s-1] * (100 + spModel.getRateUp()[i])))/100;
				interest.setInterestBig(rateup);
				prdFinanceInterestDAO.save(interest);
				intset.add(interest);
				if(i == 0){
					maxRate = rateup;
				}else if(rateup > maxRate){
					maxRate = rateup;
				}
			}
			product.setInterests(intset);
//			product.setLittleInterest(interest1.getInterestLittle());
			product.setBigInterest(maxRate);
		}else{
			int littledt = product.getFinanceLittledt();
			int mostdt = product.getFinanceMostdt();
			int limist = 1;
			int limien = 5;
			if(littledt > 60){
				limist = 5;
			}else if(littledt > 36 && littledt <=60){
				limist = 4;
			}else if(littledt > 12 && littledt <=36){
				limist = 3;
			}else if(littledt > 6 && littledt <=12){
				limist = 2;
			}else if(littledt <= 12){
				limist = 1;
			}
			if(mostdt > 60){
				limien = 5;
			}else if(mostdt > 36 && mostdt <=60){
				limien = 4;
			}else if(mostdt > 12 && mostdt <=36){
				limien = 3;
			}else if(mostdt > 6 && mostdt <=12){
				limien = 2;
			}else if(mostdt <= 12){
				limien = 1;
			}
			
			for(int i = limist; i<=limien;i++){
				PrdFinanceInterest interest = new PrdFinanceInterest();
				interest.setFinanceId(product.getId());
				interest.setCreatedt(new Date());
				interest.setFinanceStartdt(ratedt[i-1][0]);
				interest.setFinanceEnddt(ratedt[i-1][1]);
				interest.setInterestMemo(rateStr[i-1]);
//				interest.setRateUp(spModel.getRateUp()[i]);
//				Double rateup = Double.valueOf(Math.round(rate[i-1] * (100 + spModel.getRateUp()[i])))/100;
//				interest.setInterestBig(rateup);
				prdFinanceInterestDAO.save(interest);
			}
		}
		
		
		if((spModel.getSelectArea()!= null && spModel.getSelectArea().equals("0")) || spModel.getCitySel() == null || spModel.getCitySel().trim().equals("")){
			PrdFinanceArea area = new PrdFinanceArea();
			area.setFinanceId(product.getId());
			area.setCityId(new Integer(0));
			area.setProvinceId(new Integer(0));
			prdFinanceAreaDAO.save(area);
		}else{
			if(spModel.getCitySel() != null && !spModel.getCitySel().trim().equals("")){
				String[] citys = spModel.getCitySel().split(",");
				for(String city:citys){
					String c = city.substring(0,1);
					if(c.equals("P")){
						PrdFinanceArea area = new PrdFinanceArea();
						area.setFinanceId(product.getId());
						area.setProvinceId(Integer.valueOf(city.substring(1)));
						area.setCityId(Integer.valueOf(0));
						prdFinanceAreaDAO.save(area);
					}else if(c.equals("C")){
						PrdFinanceArea area = new PrdFinanceArea();
						area.setFinanceId(product.getId());
						area.setCityId(Integer.valueOf(city.substring(1)));
						area.setProvinceId(Integer.valueOf(0));
						prdFinanceAreaDAO.save(area);
					}
				}
			}
		}
		
		if((spModel.getIndustryStatus()!= null && spModel.getIndustryStatus().equals("0")) || spModel.getIndustrySel() == null || spModel.getIndustrySel().trim().equals("")){
			PrdFinanceInducty indu = new PrdFinanceInducty();
			indu.setFinanceId(product.getId());
			indu.setIndustryId(Integer.valueOf(0));
			indu.setIndustryChildid(Integer.valueOf(0));
			prdFinanceInductyDAO.save(indu);
		}else{
			if(spModel.getIndustrySel() != null && !spModel.getIndustrySel().trim().equals("")){
				String[] industrys = spModel.getIndustrySel().split(",");
				for(String industry:industrys){
					String c = industry.substring(0,1);
					if(c.equals("M")){
						PrdFinanceInducty indu = new PrdFinanceInducty();
						indu.setFinanceId(product.getId());
						indu.setIndustryId(Integer.valueOf(industry.substring(1)));
						indu.setIndustryChildid(Integer.valueOf(0));
						prdFinanceInductyDAO.save(indu);
					}else if(c.equals("C")){
						PrdFinanceInducty indu = new PrdFinanceInducty();
						indu.setFinanceId(product.getId());
						indu.setIndustryId(Integer.valueOf(0));
						indu.setIndustryChildid(Integer.valueOf(industry.substring(1)));
						prdFinanceInductyDAO.save(indu);
					}
				}
			}
		}
		
		if(spModel.getDatalistStr() != null && !spModel.getDatalistStr().trim().equals("")){
			String ds = spModel.getDatalistStr();
			ds = ds.substring(0, ds.length()-1);
			String[] data = ds.split("#");
			Set<PrdFinanceDatafile> sdfset = new LinkedHashSet<PrdFinanceDatafile>();
			for(String d:data){
				String[] f = d.split("/");
				PrdFinanceDatafile df = new PrdFinanceDatafile();
				df.setFinanceId(product.getId());
				df.setDatafileId(Integer.valueOf(f[0]));
				if(f.length >= 2){						
					df.setDataName(f[1]);
				}
				if(f.length >= 3 && f[2].length() > 0){						
					df.setNeedNum(Integer.valueOf(f[2]));
				}
				if(f.length >= 4){
					df.setDataSupply(f[3]);						
				}
				if(f.length >=5 && f[4].length() > 0){
//					df.setOtherMemo(f[4].replaceAll("\r\n", "<br/>"));
					df.setOtherMemo(f[4]);
					df.setHaveMemo(Integer.valueOf(1));
				}
				
				prdFinanceDatafileDAO.save(df);
//				if(df.getOtherMemo() != null){
//					df.setOtherMemo(df.getOtherMemo().replaceAll("\r\n", "<br/>"));
//				}
				sdfset.add(df);
			}
			product.setDataFiles(sdfset);
		}
		
		prdFinanceDAO.update(product);
		
		
		/**
		 * 扩展属性保存
		 */
		List<PrdExtendsProperty> plist = new ArrayList<PrdExtendsProperty>();
		if(spModel.getExtendsName() != null && spModel.getExtendsName().length > 0){
			int j = 0;
			for(int i = 0; i< spModel.getExtendsName().length; i++){
				PrdExtendsProperty pro = new PrdExtendsProperty();
				pro.setExtendsType(Constants.EXTENDS_PROPERTY_FINANCE);
				pro.setRowId(product.getId());
				pro.setFieldName(spModel.getExtendsName()[i]);
				pro.setFieldType(spModel.getExtendsType()[i]);
				String pv = "";
				if(spModel.getExtendsType()[i] == 3 || spModel.getExtendsType()[i] == 4){
					pv = spModel.getExtendsValue()[j++];
					pro.setFieldValue(pv);
				}
				pro.setFieldvalueNullAble(0);
				pro.setStatus(0);
				prdExtendsPropertyDAO.save(pro);
				plist.add(pro);
				
				if(spModel.getExtendsType()[i] == 3 || spModel.getExtendsType()[i] == 4){
					if(pv != null && pv.length() > 0){
						String[] pstr = pv.split("#");
						for(int k = 0; k < pstr.length; k++){
							PrdPropertyDic dic = new PrdPropertyDic();
							dic.setGroupId(pro.getId());
							dic.setDicValue(k + 1);
							dic.setDicName(pstr[k]);
							prdPropertyDicDAO.save(dic);
						}
					}
				}
			}
		}
		spModel.setExtendsPropertyList(plist);
		
//		if(product.getOtherRequire() != null){
//			product.setOtherRequire(product.getOtherRequire().replaceAll("\r\n", "<br/>"));
//		}
//		if(product.getProIntroduce() != null){
//			product.setProIntroduce(product.getProIntroduce().replaceAll("\r\n", "<br/>"));
//		}
		
		return srModel;
	}
	/**
	 * @author 岳龙
	 * Description:
	 * CreateAuthor:岳龙
	 * CreateDate:2012-7-05 14:54:57
	 * @param 
	 * @return 
	 */
	public PreviewFinanceProSrModel priviewFinance(FinanceProductSpModel spModel) {
		PreviewFinanceProSrModel srModel = new PreviewFinanceProSrModel();
		PrdFinance product = spModel.getProduct();
		FinanceProductExtendModel pe = spModel.getFinanceExtend();
		
		Integer financeType = product.getFinanceType();
		
		product.setProSpecial(StringUtil.getStrByArray(spModel.getProductSpecial()));
		product.setUploadWay(StringUtil.getStrByArray(spModel.getUploadWay()));
	
		if(financeType.intValue() == 151){
			product.setRepaymentType(StringUtil.getStrByArray(spModel.getRepaymentType()));
			product.setMortgageType(StringUtil.getStrByArray(spModel.getMortgage()));
			product.setPurposeType(StringUtil.getStrByArray(spModel.getPurposeCompany()));
			product.setCompanyAllAsset(pe.getCompanyAllAsset());
			product.setOperatIncome(pe.getOperatIncome());
			product.setSettingYear(pe.getSettingYear());
		}else if(financeType.intValue() == 152){
			product.setRepaymentType(StringUtil.getStrByArray(spModel.getRepaymentType()));
			product.setMortgageType(StringUtil.getStrByArray(spModel.getMortgage()));
			product.setPurposeType(StringUtil.getStrByArray(spModel.getPurposePersonRunning()));
			product.setCompanyAllAsset(pe.getCompanyAllAsset());
			product.setNeedEnsure(pe.getNeedEnsure());
			product.setExperience(pe.getExperience());
			product.setRunningArea(pe.getRunningArea());
			product.setCreditAcount(pe.getCreditAcount());
			product.setBankSalaryList(pe.getBankSalaryList());
		}else if(financeType.intValue() == 153){
			product.setRepaymentType(StringUtil.getStrByArray(spModel.getRepaymentType()));
			product.setMortgageType(StringUtil.getStrByArray(spModel.getMortgage()));
			product.setPurposeType(StringUtil.getStrByArray(spModel.getPurposePersonBuy()));
			product.setSalaryIncome(pe.getSalaryIncome());
			product.setSalaryPutWay(pe.getSalaryPutWay());
			product.setWorkTime(pe.getWorkTime());
			product.setHouse(pe.getHouse());
			product.setCreditAcount(pe.getCreditAcount());
			product.setBankSalaryList(pe.getBankSalaryList());
		}else if(financeType.intValue() == 154){
			product.setHouseProperty(StringUtil.getStrByArray(spModel.getHousePro()));
//			product.setRepaymentType(StringUtil.getStrByArray(spModel.getRepaymentTypeHouse()));
			product.setUseTime(pe.getUseTime());
			product.setSurplus(pe.getSurplus());
			product.setSalaryIncome(pe.getSalaryIncome());
			product.setSalaryPutWay(pe.getSalaryPutWay());
			product.setWorkTime(pe.getWorkTime());
			product.setHouse(pe.getHouse());
			product.setCreditAcount(pe.getCreditAcount());
			product.setBankSalaryList(pe.getBankSalaryList());
		}
		
		if(product.getOtherRequire() != null){
			product.setOtherRequire(product.getOtherRequire().replaceAll("\r\n", "<br/>"));
		}
		if(product.getProIntroduce() != null){
			product.setProIntroduce(product.getProIntroduce().replaceAll("\r\n", "<br/>"));
		}
		
		if(product.getInterestType() != null && product.getInterestType().intValue() == 155){
			Double[] rate = {5.85,6.31,6.4,6.65,6.8};
			String[] rateStr = {"六月以内（含六月)","六个月至一年（含一年）","一至三年（含三年）","三至五年（含五年）","五年以上"};
			Integer[][] ratedt = {{0,6},{6,12},{12,36},{36,60},{60,1000}};
			Set<PrdFinanceInterest> intset = new LinkedHashSet<PrdFinanceInterest>();
			Double maxRate = null;
			for(int i = 0, s = spModel.getRateStId(); i < spModel.getRateUp().length; i++, s++){
				PrdFinanceInterest interest = new PrdFinanceInterest();
				interest.setFinanceId(product.getId());
				interest.setCreatedt(new Date());
				interest.setFinanceStartdt(ratedt[s-1][0]);
				interest.setFinanceEnddt(ratedt[s-1][1]);
				interest.setInterestMemo(rateStr[s-1]);
				interest.setRateUp(spModel.getRateUp()[i]);
				Double rateup = Double.valueOf(Math.round(rate[s-1] * (100 + spModel.getRateUp()[i])))/100;
				interest.setInterestBig(rateup);
				intset.add(interest);
				if(i == 0){
					maxRate = rateup;
				}else if(rateup > maxRate){
					maxRate = rateup;
				}
			}
			product.setInterests(intset);
//			product.setLittleInterest(interest1.getInterestLittle());
			product.setBigInterest(maxRate);
		}
		
		List<FinanceAreaModel> productAreaList = new ArrayList<FinanceAreaModel>();
		if(spModel.getSelectArea()!= null && spModel.getSelectArea().equals("0")){
			
		}else{
			if(spModel.getCitySel() != null && !spModel.getCitySel().trim().equals("")){
				String[] citys = spModel.getCitySel().split(",");
				for(String city:citys){
					String c = city.substring(0,1);
					if(c.equals("P")){
						FinanceAreaModel area = new FinanceAreaModel();
						area.setFinanceId(product.getId());
						area.setProvinceId(Integer.valueOf(city.substring(1)));
						area.setCityId(Integer.valueOf(0));
						area.setName(dicProvinceDAO.get(area.getProvinceId()).getName());
						productAreaList.add(area);
					}else if(c.equals("C")){
						FinanceAreaModel area = new FinanceAreaModel();
						area.setFinanceId(product.getId());
						area.setCityId(Integer.valueOf(city.substring(1)));
						area.setProvinceId(Integer.valueOf(0));
						area.setName(dicCityDAO.get(area.getCityId()).getName());
						productAreaList.add(area);
					}
				}
			}
		}
		srModel.setProductAreaList(productAreaList);
		List<FinanceIndustryModel> productIndustryList = new ArrayList<FinanceIndustryModel>();
		if(spModel.getIndustryStatus()!= null && spModel.getIndustryStatus().equals("0")){
		}else{
			if(spModel.getIndustrySel() != null && !spModel.getIndustrySel().trim().equals("")){
				String[] industrys = spModel.getIndustrySel().split(",");
				for(String industry:industrys){
					String c = industry.substring(0,1);
					if(c.equals("M")){
						FinanceIndustryModel indu = new FinanceIndustryModel();
						indu.setFinanceId(product.getId());
						indu.setIndustryId(Integer.valueOf(industry.substring(1)));
						indu.setIndustryChildid(Integer.valueOf(0));
						indu.setName(dicIndustryDAO.get(indu.getIndustryId()).getName());
						productIndustryList.add(indu);
					}else if(c.equals("C")){
						FinanceIndustryModel indu = new FinanceIndustryModel();
						indu.setFinanceId(product.getId());
						indu.setIndustryId(Integer.valueOf(0));
						indu.setIndustryChildid(Integer.valueOf(industry.substring(1)));
						indu.setName(dicIndustryDAO.get(indu.getIndustryChildid()).getName());
						productIndustryList.add(indu);
					}
				}
			}
		}
		srModel.setProductIndustryList(productIndustryList);
		
		if(spModel.getDatalistStr() != null && !spModel.getDatalistStr().trim().equals("")){
			String ds = spModel.getDatalistStr();
			ds = ds.substring(0, ds.length()-1);
			String[] data = ds.split("#");
			Set<PrdFinanceDatafile> sdfset = new LinkedHashSet<PrdFinanceDatafile>();
			for(String d:data){
				String[] f = d.split("/");
				PrdFinanceDatafile df = new PrdFinanceDatafile();
				df.setFinanceId(product.getId());
				df.setDatafileId(Integer.valueOf(f[0]));
				if(f.length >= 2){						
					df.setDataName(f[1]);
				}
				if(f.length >= 3 && f[2].length() > 0){						
					df.setNeedNum(Integer.valueOf(f[2]));
				}
				if(f.length >= 4){
					df.setDataSupply(f[3]);						
				}
				if(f.length >=5 && f[4].length() > 0){
					df.setOtherMemo(f[4].replaceAll("\r\n", "<br/>"));
//					df.setOtherMemo(f[4]);
					df.setHaveMemo(Integer.valueOf(1));
				}
				sdfset.add(df);
			}
			product.setDataFiles(sdfset);
		}
		
		/**
		 * 扩展属性保存
		 */
		List<PrdExtendsProperty> plist = new ArrayList<PrdExtendsProperty>();
		if(spModel.getExtendsName() != null && spModel.getExtendsName().length > 0){
			int j = 0;
			for(int i = 0; i< spModel.getExtendsName().length; i++){
				PrdExtendsProperty pro = new PrdExtendsProperty();
				pro.setExtendsType(Constants.EXTENDS_PROPERTY_FINANCE);
				pro.setRowId(product.getId());
				pro.setFieldName(spModel.getExtendsName()[i]);
				pro.setFieldType(spModel.getExtendsType()[i]);
				String pv = "";
				if(spModel.getExtendsType()[i] == 3 || spModel.getExtendsType()[i] == 4){
					pv = spModel.getExtendsValue()[j++];
					pro.setFieldValue(pv);
				}
				plist.add(pro);
			}
		}
		srModel.setExtendsPropertyList(plist);
		return srModel;
	}
	/**
	 * @author 岳龙
	 * Description:
	 * CreateAuthor:岳龙
	 * CreateDate:2012-7-05 14:54:57
	 * @param 
	 * @return 
	 */
	public PrdFinance getFinance(Integer id) {
		PrdFinance product = prdFinanceDAO.get(id);
		product.getInterests().size();
		product.getDataFiles().size();
		return product;
	}
	public List<PrdExtendsProperty> getFinancePropertys(Integer financeId){
		List<PrdExtendsProperty> plist = this.prdExtendsPropertyDAO.getFinancePropertys(financeId);
		for(PrdExtendsProperty p : plist){
			p.getPropertyDicSet().size();
		}
		return plist;
	}
	
	public List<FinanceAreaModel> findFiananceArea(Integer financeId){
		return prdFinanceAreaDAO.findFiananceArea(financeId);
	}
	public List<FinanceIndustryModel> findFiananceInducty(Integer financeId){
		return prdFinanceInductyDAO.findFiananceInducty(financeId);
	}
	
	
	/**
	 * @author 岳龙
	 * Description:
	 * CreateAuthor:岳龙
	 * CreateDate:2012-7-05 14:54:57
	 * @param 
	 * @return 
	 */
	public void updateFinanceStatus(PrdFinance pro) {
		PrdFinance oldpro = prdFinanceDAO.get(pro.getId());
		oldpro.setProStatus(pro.getProStatus());
		prdFinanceDAO.saveOrUpdate(oldpro);
	}
	
	/**
	 * @author 岳龙 Description: CreateAuthor:岳龙 CreateDate:2012-7-05 14:54:57
	 * @param
	 * @return
	 */
	public void searchDateFile() {
	}

	public Pager findProByCond(int currentPage, int pageCount, Integer financeType, String purposeType, Long financeAmount, Integer financeDate, String mortgageType, String userType, String checkTime, String companyAllAsset, String creditAcount, String experience,
 String needEnsure, String operatIncome, Integer settingYear, String bankSalaryList, String repaymentType, Integer runningArea, Integer industryId, Integer childId, Integer selectArea) {
		
		Pager page = prdFinanceDAO.findProByCond(currentPage, pageCount, financeType, purposeType, financeAmount, financeDate, mortgageType, userType, checkTime, companyAllAsset, creditAcount, experience, needEnsure, operatIncome, settingYear, bankSalaryList, repaymentType, runningArea, industryId, childId, selectArea);
		if(page.getData() != null && page.getData().size() > 0){
			for(Object obj : page.getData()){
				PrdFinance p = (PrdFinance) obj;
				p.getInterests().size();
			}
		}
		return page;
	}
	//setter and getter
	public void setPrdFinanceInterestDAO(PrdFinanceInterestDAO prdFinanceInterestDAO) {
		this.prdFinanceInterestDAO = prdFinanceInterestDAO;
	}
	public void setPrdFinanceAreaDAO(PrdFinanceAreaDAO prdFinanceAreaDAO) {
		this.prdFinanceAreaDAO = prdFinanceAreaDAO;
	}
	public void setPrdFinanceInductyDAO(PrdFinanceInductyDAO prdFinanceInductyDAO) {
		this.prdFinanceInductyDAO = prdFinanceInductyDAO;
	}
	public void setPrdFinanceDatafileDAO(PrdFinanceDatafileDAO prdFinanceDatafileDAO) {
		this.prdFinanceDatafileDAO = prdFinanceDatafileDAO;
	}
	public void setPrdDatafileListDAO(PrdDatafileListDAO prdDatafileListDAO) {
		this.prdDatafileListDAO = prdDatafileListDAO;
	}

	public List<PrdFinance> getRecProByLoan(Object[] queryParams) {
		return prdFinanceDAO.getProByRec(queryParams);
	}

	@Override
	public List<PrdFinance> recomPro(Object[] params) {
		return prdFinanceDAO.getByWhere(params);
	}

	public void setDicProvinceDAO(DicProvinceDAO dicProvinceDAO) {
		this.dicProvinceDAO = dicProvinceDAO;
	}

	public void setDicCityDAO(DicCityDAO dicCityDAO) {
		this.dicCityDAO = dicCityDAO;
	}
	public void setDicIndustryDAO(DicIndustryDAO dicIndustryDAO) {
		this.dicIndustryDAO = dicIndustryDAO;
	}

	@Override
	public List<PrdFinance> recomPro(Integer financeType, Long loanAmount, Integer loanMonth, String orgId) {
		return prdFinanceDAO.recomPro(financeType, loanAmount, loanMonth, orgId);
	}

	public void setUsrUserDAO(UsrUserDAO usrUserDAO) {
		this.usrUserDAO = usrUserDAO;
	}

	public void setPrdExtendsPropertyDAO(PrdExtendsPropertyDAO prdExtendsPropertyDAO) {
		this.prdExtendsPropertyDAO = prdExtendsPropertyDAO;
	}

	public void setPrdPropertyDicDAO(PrdPropertyDicDAO prdPropertyDicDAO) {
		this.prdPropertyDicDAO = prdPropertyDicDAO;
	}


}
