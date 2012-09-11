package com.zj198.util.tag;

import org.apache.struts2.views.jsp.ui.AbstractUITag;

public abstract class AbstractCommonListTag extends AbstractUITag
{
	  protected String list;
	  protected String listKey;
	  protected String listValue;

	  protected void populateParams()
	  {
	    super.populateParams();

	    CommonListUIBean listUIBean = (CommonListUIBean)this.component;
	    listUIBean.setList(this.list);
	    listUIBean.setListKey(this.listKey);
	    listUIBean.setListValue(this.listValue);
	    listUIBean.setThrowExceptionOnNullValueAttribute(true);
	  }

	  public void setList(String list) {
	    this.list = list;
	  }

	  public void setListKey(String listKey) {
	    this.listKey = listKey;
	  }

	  public void setListValue(String listValue) {
	    this.listValue = listValue;
	  }
	}