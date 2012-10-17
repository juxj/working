package com.zj198.util.tag;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.components.Component;
import org.apache.struts2.views.jsp.ComponentTagSupport;

import com.opensymphony.xwork2.util.ValueStack;

public class PrintCommonTag extends ComponentTagSupport{

	private String valueId;
	private String valueSetId;
	protected String valueSetMap;
	private String type;
	private String divide;
	
	@Override
	public Component getBean(ValueStack stack, HttpServletRequest request, HttpServletResponse response){
		return new PrintCommon(stack);
	}
	
	protected void populateParams(){
		super.populateParams();
		PrintCommon print = (PrintCommon) component;
		print.setValueId(valueId);
		print.setValueSetId(valueSetId);
		print.setValueSetMap(valueSetMap);
		print.setType(type);
		print.setDivide(divide);
	}
	
	public String getValueId() {
		return valueId;
	}
	public void setValueId(String valueId) {
		this.valueId = valueId;
	}
	public String getValueSetId() {
		return valueSetId;
	}
	public void setValueSetId(String valueSetId) {
		this.valueSetId = valueSetId;
	}

	public String getValueSetMap() {
		return valueSetMap;
	}

	public void setValueSetMap(String valueSetMap) {
		this.valueSetMap = valueSetMap;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDivide() {
		return divide;
	}

	public void setDivide(String divide) {
		this.divide = divide;
	}

}
