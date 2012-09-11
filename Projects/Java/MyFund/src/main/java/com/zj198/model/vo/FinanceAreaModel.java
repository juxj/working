package com.zj198.model.vo;

import com.zj198.model.PrdFinanceArea;

public class FinanceAreaModel extends PrdFinanceArea{
	private static final long serialVersionUID = -3926996516693700769L;
	private String name;
	
	public FinanceAreaModel(){
	}
	
	public FinanceAreaModel(Integer id,Integer financeId,Integer provinceId,Integer cityId, String name) {
		super(id,financeId, provinceId, cityId);
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
