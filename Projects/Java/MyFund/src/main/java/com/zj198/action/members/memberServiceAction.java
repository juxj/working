package com.zj198.action.members;

import java.util.List;

import com.zj198.action.BaseAction;
import com.zj198.model.MchBank;
import com.zj198.model.MchCharge;
import com.zj198.model.MchType;
import com.zj198.service.mch.MemberChargeService;

public class memberServiceAction extends BaseAction{
	private MchType mchType;
	private MchBank mchBank;
	private MchCharge mchCharge;
	private MemberChargeService memberChargeService;
	private List<MchType> typeList;
	
	/**
	 * 收费类型首页
	 */
	public String execute(){
		typeList=memberChargeService.getMchTypeList();
		return "typeList";
	}
	public String saveType(){
		memberChargeService.saveMchType(mchType);
		return SUCCESS;
	}
	public String addType(){
		mchType=new MchType();
		return "addType";
	}
	public String deleteType(){
		memberChargeService.deleteMchType(mchType);
		return SUCCESS;
	}
	
	//get  and  set 
	public MchType getMchType() {
		return mchType;
	}
	public void setMchType(MchType mchType) {
		this.mchType = mchType;
	}
	public MchBank getMchBank() {
		return mchBank;
	}
	public void setMchBank(MchBank mchBank) {
		this.mchBank = mchBank;
	}
	public MchCharge getMchCharge() {
		return mchCharge;
	}
	public void setMchCharge(MchCharge mchCharge) {
		this.mchCharge = mchCharge;
	}
	public void setMemberChargeService(MemberChargeService memberChargeService) {
		this.memberChargeService = memberChargeService;
	}
	public List<MchType> getTypeList() {
		return typeList;
	}
}
