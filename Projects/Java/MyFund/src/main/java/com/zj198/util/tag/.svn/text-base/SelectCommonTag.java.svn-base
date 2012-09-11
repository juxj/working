package com.zj198.util.tag;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.components.Component;

import com.opensymphony.xwork2.util.ValueStack;

public class SelectCommonTag extends AbstractCommonListTag
{
	  private static final long serialVersionUID = 6121715260335609618L;
	  protected String emptyOption;
	  protected String headerKey;
	  protected String headerValue;
	  protected String multiple;
	  protected String size;
	  protected String valueSetId;
	  protected String valueSetMap;

	  public Component getBean(ValueStack stack, HttpServletRequest req, HttpServletResponse res)
	  {
	    return new SelectCommon(stack, req, res);
	  }

	  protected void populateParams() {
	    super.populateParams();

	    SelectCommon select = (SelectCommon)this.component;
	    select.setEmptyOption(this.emptyOption);
	    select.setHeaderKey(this.headerKey);
	    select.setHeaderValue(this.headerValue);
	    select.setMultiple(this.multiple);
	    select.setSize(this.size);
	    select.setValueSetId(this.valueSetId);
	    select.setValueSetMap(this.valueSetMap);
	  }

	  public void setEmptyOption(String emptyOption) {
	    this.emptyOption = emptyOption;
	  }

	  public void setHeaderKey(String headerKey) {
	    this.headerKey = headerKey;
	  }

	  public void setHeaderValue(String headerValue) {
	    this.headerValue = headerValue;
	  }

	  public void setMultiple(String multiple) {
	    this.multiple = multiple;
	  }

	  public void setSize(String size) {
	    this.size = size;
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
	}