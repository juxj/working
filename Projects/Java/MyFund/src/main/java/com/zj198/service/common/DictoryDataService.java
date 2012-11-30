package com.zj198.service.common;

import java.util.List;
import java.util.Map;

import com.zj198.model.DicBank;
import com.zj198.model.DicBaseRate;
import com.zj198.model.DicCity;
import com.zj198.model.DicCommon;
import com.zj198.model.DicDistrict;
import com.zj198.model.DicIndustry;
import com.zj198.model.DicProvince;
import com.zj198.model.DicUsertype;

public interface DictoryDataService {

	/**
	 * 某行业分类的所有子类
	 * @param parentId 父id，一级父id为0
	 * @return 分类List
	 */
	public List<DicIndustry> findDicIndustryList();
	public List<DicIndustry> findIndustryByParentid(Integer parentId);
	/**根据行业id取出对象*/
	public DicIndustry getIndustryById(Integer id);
	
	/**
	 * 所有省列表
	 * @return 省List
	 */
	public List<DicProvince> findAllProvince();

	/**
	 * 某省所有城市
	 * @param provinceId
	 * @return 城市List
	 */
	public List<DicCity> findCityByProvinceid(Integer provinceId);

	/**
	 * 某城市所有区
	 * @param CityId
	 * @return 区List
	 */
	public List<DicDistrict> findDistrictByCityid(Integer cityId);
	
	
	/**
	 * 所有用户类型
	 * @return 用户类型List
	 */
	public List<DicUsertype> findAllUsertype();
	
	/**
	 * 所有用户类型,按分组显示Integer为组别
	 * @return 用户按组分类的Map
	 */
	public Map<Integer,List<DicUsertype>> findAllUerttypeGroupByGroup();
	
	/**
	 * 根据分类搜索某一类基础字典数据
	 * @param groupId
	 * @return
	 */
	public List<DicCommon> findCommonDataByGroupId(Integer groupId);
	
	
	/**
	 * 查找所的银行数据
	 * @return
	 */
	public List<DicBank> findDicBankList();
	
	/**Get dicBank By Id.*/
	public DicBank getDicBankById(int id);
	
	/**
	 * 查找基金公司
	 * @return
	 */
	public List<String> getUniqueFundFirmList();
	
	/**
	 * 按组获取用户类型清单
	 * @param groupId
	 * @return
	 */
	public List<DicUsertype> findUserTypeByGroup(Integer groupId);


	 /**
     * 
     * @Author zeroleavebaoyang@gmail.com
     * @Description
     * @param optValue 传递一个的类型为Integer的属性值, 如：3
     * @return 返回 如：政府机关
     */
    public String setNameRepaceId(int optValue);

    /**
     * 
     * @Author zeroleavebaoyang@gmail.com
     * @Description
     * @param optValue 传递参数如：,6,8,
     * @return 返回如： 银行,信贷机构
     */
    public String setNameRepaceId(String optValue);

	
	/**获取用户类型*/
	public DicUsertype getDicUserTypeById(int id) ;
	/**
	 * 通过ID获取字典中的Name
	 * @param valueId
	 * @return
	 */
	public String getValueNameById(Integer valueId);
	/**
	 * 通过ID组成的字符串返回Name
	 * @param ids
	 * @return
	 */
	public String getValueNamesByIds(String ids);
	
	/** Get DicProvince By Id*/
	public DicProvince getDicProvince(Integer id);
	
	/**Get DicCity By Id*/
	public DicCity getDicCity(Integer id);
	/**Get DicDistrict By Id*/
	public DicDistrict getDicDistrict(Integer id);
	
	/**
	 * 根据用户ID获取公司名称
	 * @param userId
	 * @return
	 */
	public String getCompanyNameByUserId(Integer userId);
	
	public String getIndustryNameById(Integer id);
	/*** 根据传入的 province  city district ID 获取全名* @param Id*/
	public String getPCDNameByIds(Integer pId,Integer cId,Integer dId);
	public List<DicBaseRate> findBaseRate();
}
