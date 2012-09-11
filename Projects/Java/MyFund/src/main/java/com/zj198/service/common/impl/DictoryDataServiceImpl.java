package com.zj198.service.common.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.zj198.dao.DicBankDAO;
import com.zj198.dao.DicCityDAO;
import com.zj198.dao.DicCommonDAO;
import com.zj198.dao.DicDistrictDAO;
import com.zj198.dao.DicIndustryDAO;
import com.zj198.dao.DicProvinceDAO;
import com.zj198.dao.DicUsertypeDAO;
import com.zj198.dao.FudBaseDAO;
import com.zj198.dao.UsrBankDAO;
import com.zj198.dao.UsrCompanyDAO;
import com.zj198.dao.UsrFinanceorgDAO;
import com.zj198.dao.UsrUserDAO;
import com.zj198.model.DicBank;
import com.zj198.model.DicCity;
import com.zj198.model.DicCommon;
import com.zj198.model.DicDistrict;
import com.zj198.model.DicIndustry;
import com.zj198.model.DicProvince;
import com.zj198.model.DicUsertype;
import com.zj198.model.UsrBank;
import com.zj198.model.UsrCompany;
import com.zj198.model.UsrFinanceorg;
import com.zj198.model.UsrUser;
import com.zj198.service.common.DictoryDataService;

public class DictoryDataServiceImpl implements DictoryDataService {
	
	private DicCityDAO dicCityDAO;
	private DicProvinceDAO dicProvinceDAO;
	private DicDistrictDAO dicDistrictDAO;
	private DicUsertypeDAO dicUsertypeDAO;
	private DicIndustryDAO dicIndustryDAO;
	private DicCommonDAO dicCommonDAO;
	private DicBankDAO dicBankDAO;
	private FudBaseDAO fundBaseDAO;
	
	private UsrBankDAO usrBankDAO;
	private UsrFinanceorgDAO usrFinanceorgDAO;
	private UsrUserDAO usrUserDAO;
	private UsrCompanyDAO usrCompanyDAO;
	
	public List<DicIndustry> findDicIndustryList() {
		return dicIndustryDAO.findAll();
	}
	
	public String getCompanyNameByUserId(Integer userId){
		String companyName = "";
		UsrUser user = usrUserDAO.get(userId);
		DicUsertype userType = dicUsertypeDAO.get(Integer.valueOf(user.getType()));
		if(userType.getGroup().intValue() == 2){
			UsrBank bank = usrBankDAO.get(userId);
			if(bank != null){
				companyName = bank.getDetailname();
			}
		}else if(userType.getGroup().intValue() == 3){
			UsrFinanceorg financeOrg = usrFinanceorgDAO.get(userId);
			if(financeOrg != null){
				companyName = financeOrg.getOrgname();
			}
		}else if(userType.getGroup().intValue() == 1){
			UsrCompany company = usrCompanyDAO.get(userId);
			if(company != null){
				companyName = company.getCompanyname();
			}
		}
		return companyName;
	}
	
	public String getValueNameById(Integer valueId){
		if(valueId != null && valueId !=0){
			DicCommon common = dicCommonDAO.get(valueId);
			return common.getName();
		}
		return "";
	}
	public String getValueNamesByIds(String ids){
		if(StringUtils.isNotBlank(ids)){
			StringBuffer str = new StringBuffer();
			List<DicCommon> commons = dicCommonDAO.findByIds(ids);
			if(commons != null && commons.size() > 0){
				for(int i = 0; i< commons.size(); i++){
					str.append(commons.get(i).getName());
					if(i  != (commons.size()-1)){
						str.append(",");
					}
				}
			}
			return str.toString();
		}
		return "";
	}
    public String setNameRepaceId(int optValue) {
        StringBuffer sb = new StringBuffer();
        List<DicCommon> coms = dicCommonDAO.findAll();
        for (DicCommon com : coms) {
            if (optValue == com.getId()) {
                sb.append(com.getName());
                break;
            }
        }
        return sb.toString();
    }

    public String setNameRepaceId(String optValue) {
        StringBuffer sb = new StringBuffer();
        if (optValue.length() > 0 && optValue != null) {
            String[] opts = optValue.split(",");
            if (opts.length > 0 && opts != null) {
                int[] opti = new int[opts.length];
                for (int i = 1; i < opts.length; i++) {
                    opti[i] = Integer.parseInt(opts[i]);
                }
                List<DicCommon> coms = dicCommonDAO.findAll();
                for (int i = 0; i < opti.length; i++) {
                    for (DicCommon com : coms) {
                        if (opti[i] == com.getId()) {
                            sb.append(com.getName()).append(",");
                            break;
                        }
                    }
                }
                sb.deleteCharAt(sb.lastIndexOf(","));
            }
        }
        return sb.toString();
    }
	
	public void setDicCityDAO(DicCityDAO dicCityDAO) {
		this.dicCityDAO = dicCityDAO;
	}
	public void setDicProvinceDAO(DicProvinceDAO dicProvinceDAO) {
		this.dicProvinceDAO = dicProvinceDAO;
	}
	public void setDicDistrictDAO(DicDistrictDAO dicDistrictDAO) {
		this.dicDistrictDAO = dicDistrictDAO;
	}
	public void setDicUsertypeDAO(DicUsertypeDAO dicUsertypeDAO) {
		this.dicUsertypeDAO = dicUsertypeDAO;
	}
	public void setDicIndustryDAO(DicIndustryDAO dicIndustryDAO) {
		this.dicIndustryDAO = dicIndustryDAO;
	}
	public void setDicCommonDAO(DicCommonDAO dicCommonDAO) {
		this.dicCommonDAO = dicCommonDAO;
	}
	
	
	/**获取用户类型*/
	public DicUsertype getDicUserTypeById(int id){
		return dicUsertypeDAO.get(id);
	}
	
	
	@Override
	public List<DicIndustry> findIndustryByParentid(Integer parentId) {
		return dicIndustryDAO.findByParentid(parentId);
	}

	@Override
	public List<DicProvince> findAllProvince() {
		return dicProvinceDAO.findAll();
	}

	@Override
	public List<DicCity> findCityByProvinceid(Integer provinceId) {
		return dicCityDAO.findByProvinceid(provinceId);
	}

	@Override
	public List<DicDistrict> findDistrictByCityid(Integer cityId) {
		return dicDistrictDAO.findByCityid(cityId);
	}

	@Override
	public List<DicUsertype> findAllUsertype() {
		return dicUsertypeDAO.findAll();
	}

	@Override
	public Map<Integer, List<DicUsertype>> findAllUerttypeGroupByGroup() {
		List<DicUsertype> userTypeList = dicUsertypeDAO.findAll();
		Map<Integer, List<DicUsertype>> map = new HashMap<Integer, List<DicUsertype>>();
		for(DicUsertype ut:userTypeList){
			if(map.containsKey(ut.getGroup())){
				map.get(ut.getGroup()).add(ut);
			}else{
				List<DicUsertype> utList = new ArrayList<DicUsertype>();
				utList.add(ut);
				map.put(ut.getGroup(), utList);
			}
		}
		return map;
	}
	@Override
	public String getPCDNameByIds(Integer pId, Integer cId, Integer dId) {
		// 通过id 取城市的名字 然后合并
		String addr="";
		if(pId!=null && pId!=0){
			addr=this.getDicProvince(pId).getName();
		}
		if(cId!=null && cId!=0){
			addr+=" "+this.getDicCity(cId).getName();
		}
		if(dId!=null && dId!=0){
			addr+=" "+this.getDicDistrict(dId).getName();
		}
		return addr;
	}

	@Override
	public List<DicCommon> findCommonDataByGroupId(Integer groupId){
		return dicCommonDAO.findByGroupId(groupId);
	}
	
	@Override
	public List<DicBank> findDicBankList() {
		return this.dicBankDAO.findAll();
	}
	
	public DicBankDAO getDicBankDAO() {
		return dicBankDAO;
	}
	public void setDicBankDAO(DicBankDAO dicBankDAO) {
		this.dicBankDAO = dicBankDAO;
	}
	
	public FudBaseDAO getFundBaseDAO() {
		return fundBaseDAO;
	}
	public void setFundBaseDAO(FudBaseDAO fundBaseDAO) {
		this.fundBaseDAO = fundBaseDAO;
	}
	@Override
	public List<String> getUniqueFundFirmList() {
		return this.fundBaseDAO.findUniqueFundCompany();
	}
	
	
	public List<DicUsertype> findUserTypeByGroup(Integer groupId){
		return dicUsertypeDAO.findByGroup(groupId);
	}
	@Override
	public DicProvince getDicProvince(Integer id) {
		return this.dicProvinceDAO.get(id);
	}
	@Override
	public DicCity getDicCity(Integer id) {
		return this.dicCityDAO.get(id);
	}
	@Override
	public DicDistrict getDicDistrict(Integer id) {
		return this.dicDistrictDAO.get(id);
	}
	@Override
	public DicIndustry getIndustryById(Integer id) {
		
		return dicIndustryDAO.get(id);
	}


	public void setUsrBankDAO(UsrBankDAO usrBankDAO) {
		this.usrBankDAO = usrBankDAO;
	}



	public void setUsrFinanceorgDAO(UsrFinanceorgDAO usrFinanceorgDAO) {
		this.usrFinanceorgDAO = usrFinanceorgDAO;
	}

	public void setUsrCompanyDAO(UsrCompanyDAO usrCompanyDAO) {
		this.usrCompanyDAO = usrCompanyDAO;
	}

	public void setUsrUserDAO(UsrUserDAO usrUserDAO) {
		this.usrUserDAO = usrUserDAO;
	}

	@Override
	public DicBank getDicBankById(int id) {
		return this.dicBankDAO.get(id);
	}

	@Override
	public String getIndustryNameById(Integer id) {
		return dicIndustryDAO.get(id).getName();
	}

}
