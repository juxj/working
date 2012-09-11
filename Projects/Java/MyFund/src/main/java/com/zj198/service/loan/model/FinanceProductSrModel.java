package com.zj198.service.loan.model;

import java.util.List;

import com.zj198.model.PrdExtendsProperty;
import com.zj198.model.PrdFinance;

public class FinanceProductSrModel {
	private PrdFinance product;
	private List<PrdExtendsProperty> extendsPropertyList;

	public PrdFinance getProduct() {
		return product;
	}

	public void setProduct(PrdFinance product) {
		this.product = product;
	}

	public List<PrdExtendsProperty> getExtendsPropertyList() {
		return extendsPropertyList;
	}

	public void setExtendsPropertyList(List<PrdExtendsProperty> extendsPropertyList) {
		this.extendsPropertyList = extendsPropertyList;
	}
}
