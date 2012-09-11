package com.zj198.util.tag;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.components.Component;

import com.opensymphony.xwork2.util.ValueStack;

public class RadioCommonTag extends AbstractCommonListTag
{
  private static final long serialVersionUID = -6497403399521333624L;

  protected String valueSetId;
  protected String valueSetMap;
  
  public Component getBean(ValueStack stack, HttpServletRequest req, HttpServletResponse res)
  {
    return new RadioCommon(stack, req, res);
  }
  
  protected void populateParams() {
	    super.populateParams();

	    RadioCommon radio = (RadioCommon)this.component;
	    radio.setValueSetId(this.valueSetId);
	    radio.setValueSetMap(this.valueSetMap);
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