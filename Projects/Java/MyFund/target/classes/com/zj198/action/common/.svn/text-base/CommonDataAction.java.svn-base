package com.zj198.action.common;

import java.util.List;

import com.zj198.action.BaseAction;
import com.zj198.model.DicCity;
import com.zj198.model.DicDistrict;
import com.zj198.model.DicIndustry;
import com.zj198.model.DicProvince;
import com.zj198.service.common.DictoryDataService;

public class CommonDataAction extends BaseAction{
	private Integer provinceId;
	private Integer cityId;
	private Integer industryId;
	private List<DicProvince> listProvince;//省份
    private List<DicCity> listCity;//省份下的城市
    private List<DicDistrict> listDistrict;//城市下的区
    private List<DicIndustry> industry;
    
	private Integer id;//唯一的id值

    private DictoryDataService dictoryDataService;
    
    public String findIndustry() {
    	industry = dictoryDataService.findIndustryByParentid(industryId);
		return "industry";
	}
    
	public String findProvince() {
		listProvince = dictoryDataService.findAllProvince();
		return "provinceList";
	}
	
	public String findCity(){
		listCity = dictoryDataService.findCityByProvinceid(provinceId);
		return "cityList";
	}

	public String findDistrict(){
		listDistrict = dictoryDataService.findDistrictByCityid(cityId);
		return "districtList";
	}
	
	public String execute(){
		msg = dictoryDataService.getValueNameById(id);
		return "ajax";
	}
	
	//setter and getter
	public List<DicCity> getListCity() {
		return listCity;
	}
	public void setProvinceId(Integer provinceId) {
		this.provinceId = provinceId;
	}
	public void setCityId(Integer cityId) {
		this.cityId = cityId;
	}
	public List<DicProvince> getListProvince() {
		return listProvince;
	}
	public List<DicDistrict> getListDistrict() {
		return listDistrict;
	}
	public void setDictoryDataService(DictoryDataService dictoryDataService) {
		this.dictoryDataService = dictoryDataService;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public List<DicIndustry> getIndustry() {
		return industry;
	}

	public void setIndustryId(Integer industryId) {
		this.industryId = industryId;
	}

}
