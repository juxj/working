package com.zj198.util.tag;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.components.Component;
import org.apache.struts2.views.jsp.ComponentTagSupport;

import com.opensymphony.xwork2.util.ValueStack;

public class IfNullCommonTag extends ComponentTagSupport{

	private String value;
	
	@Override
	public Component getBean(ValueStack stack, HttpServletRequest request, HttpServletResponse response){
		return new IfNullCommon(stack);
	}
	
	protected void populateParams(){
		super.populateParams();
		IfNullCommon print = (IfNullCommon) component;
		print.setValue(value);
	}

	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}

}
