package com.zj198.util.tag;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.components.Component;

import com.opensymphony.xwork2.util.ValueStack;

public class CheckboxCommonTag extends AbstractCommonListTag
{
	  private static final long serialVersionUID = 4023034029558150010L;

	  protected String valueSetId;
	  protected String valueSetMap;
	  
	  public Component getBean(ValueStack stack, HttpServletRequest req, HttpServletResponse res)
	  {
	    return new CheckboxCommon(stack, req, res);
	  }
	  protected void populateParams() {
		    super.populateParams();

		    CheckboxCommon checkbox = (CheckboxCommon)this.component;
		    checkbox.setValueSetId(this.valueSetId);
		    checkbox.setValueSetMap(this.valueSetMap);
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
	}