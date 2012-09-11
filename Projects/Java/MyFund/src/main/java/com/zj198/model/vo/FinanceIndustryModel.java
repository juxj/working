package com.zj198.model.vo;

import com.zj198.model.PrdFinanceInducty;

public class FinanceIndustryModel extends PrdFinanceInducty{
	private static final long serialVersionUID = 1999958400169746703L;
	private String name;
	
	public FinanceIndustryModel(Integer id, Integer financeId
			, Integer industryId, Integer industryChildid
			, String name){
		super(id,financeId,industryId, industryChildid);
		this.name = name;
	}
	public FinanceIndustryModel(){
		
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
