package com.zj198.service.mch;

import java.util.List;

import com.zj198.model.MchBank;
import com.zj198.model.MchCharge;
import com.zj198.model.MchType;

public interface MemberChargeService {
	/**
	 * 通过id查找某种收费类型
	 * @param id
	 * @return MchType对象
	 */
	public MchType getMchType(Integer id);
	/**
	 * 返回所有的收费类型
	 * @return List<MchType>
	 */
	public List<MchType> getMchTypeList();
	/**
	 * 增加某种收费类型
	 * @param instance
	 */
	public void saveMchType(MchType instance);
	/**
	 * 删除某种类型
	 * @param instance
	 */
	public void deleteMchType(MchType instance);
	
	public MchCharge getMchCharge(Integer id);
	public List<MchCharge> getMchChargeList();
	public void saveMchCharge(MchCharge instance);
	public void deleteMchCharge(MchCharge instance);
	public List<MchCharge> getMchChargeByType(Integer typeId);
	
	public MchBank getMchBankById(Integer id);
	public List<MchBank> getMchBankList();
	public void saveMchBank(MchBank instance);
	public void deleteMchBank(MchBank instance);
	
}
