package com.zj198.util.tag;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.components.Component;
import org.apache.struts2.views.jsp.ComponentTagSupport;

import com.opensymphony.xwork2.util.ValueStack;

public class ImgCommonTag extends ComponentTagSupport{

	private String src;
	private String cssClass;
	protected String style;
	/**
	 * 显示图片类型
	 * B：大图片
	 * M：中图片
	 * S：小图片
	 */
	private String type;
	
	@Override
	public Component getBean(ValueStack stack, HttpServletRequest request, HttpServletResponse response){
		return new ImgCommon(stack);
	}
	
	protected void populateParams(){
		super.populateParams();
		ImgCommon img = (ImgCommon) component;
		img.setType(type);
		img.setSrc(src);
		img.setCssClass(cssClass);
		img.setStyle(style);
	}

	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

	public String getCssClass() {
		return cssClass;
	}

	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	

}
