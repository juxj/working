package com.zj198.util.tag;

import java.lang.reflect.Array;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.components.UIBean;
import org.apache.struts2.util.ContainUtil;
import org.apache.struts2.util.MakeIterator;
import org.apache.struts2.views.annotations.StrutsTagAttribute;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ValueStack;
import com.zj198.model.DicCommon;
import com.zj198.service.common.DictoryDataService;
import com.zj198.util.Constants;

public abstract class CommonListUIBean extends UIBean{
	  protected Object list;
	  protected String listKey;
	  protected String listValue;
	  protected boolean throwExceptionOnNullValueAttribute = false;
	  protected String valueSetId;
	  protected String valueSetMap;

	  protected CommonListUIBean(ValueStack stack, HttpServletRequest request, HttpServletResponse response) {
	    super(stack, request, response);
	  }

	  public void evaluateExtraParams() {
	    Object value = null;
		
//	    if(this.value != null && this.value.trim().length() > 0){
//	    	if(this.value.startsWith("#{") && this.value.endsWith("}")){
//	    		this.value = this.value.substring(2,this.value.length()-1);
//	    		Object obj = this.getStack().findValue(this.value);
//	    		if(obj != null){
//	    			Object[] objarr = (Object[])obj;
//	    			this.value = "{";
//	    			for(Object o:objarr){	    				
//	    				this.value = this.value + o.toString() + ",";
//	    			}
//	    			this.value = this.value.substring(0,this.value.length()-1) + "}";
//	    		}
//	    		addParameter("value", this.value);
//	    	}
//	    }
		if(valueSetId != null && !valueSetId.trim().equals("")){
			ApplicationContext ac = (ApplicationContext) (new ActionContext(this.stack.getContext())).getApplication().get(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
			DictoryDataService dictoryDataService = (DictoryDataService) ac.getBean("dictoryDataService");
			List<DicCommon> commons = dictoryDataService.findCommonDataByGroupId(Integer.valueOf(valueSetId));
			addParameter("list", commons);
			addParameter("listSize", commons.size());
			this.listKey = "id";
			this.listValue= "name";
			value = commons;
		}else if(valueSetMap != null && !valueSetMap.trim().equals("")){
			LinkedHashMap<String, String> v = Constants.getValueSet().get(valueSetMap);
			addParameter("list", v);
			addParameter("listSize", v.size());
			this.listKey = "key";
			this.listValue= "value";
		}else{
			if (this.list == null) {
				this.list = this.parameters.get("list");
			}
			
			if (this.list instanceof String)
				value = findValue((String)this.list);
			else if (this.list instanceof Collection)
				value = this.list;
			else if (MakeIterator.isIterable(this.list)) {
				value = MakeIterator.convert(this.list);
			}
			if (value == null) {
				if (this.throwExceptionOnNullValueAttribute)
				{
					value = findValue((this.list == null) ? (String)this.list : this.list.toString(), "list", "The requested list key '" + this.list + "' could not be resolved as a collection/array/map/enumeration/iterator type. " + "Example: people or people.{name}");
				}
				else
				{
					value = findValue((this.list == null) ? (String)this.list : this.list.toString());
				}
			}
			if (value instanceof Collection)
				addParameter("list", value);
			else {
				addParameter("list", MakeIterator.convert(value));
			}
			
			if (value instanceof Collection)
				addParameter("listSize", Integer.valueOf(((Collection)value).size()));
			else if (value instanceof Map)
				addParameter("listSize", Integer.valueOf(((Map)value).size()));
			else if ((value != null) && (value.getClass().isArray())) {
				addParameter("listSize", Integer.valueOf(Array.getLength(value)));
			}
		}

	    if (this.listKey != null) {
	      this.listKey = stripExpressionIfAltSyntax(this.listKey);
	      addParameter("listKey", this.listKey);
	    } else if (value instanceof Map) {
	      addParameter("listKey", "key");
	    }

	    if (this.listValue != null) {
	      this.listValue = stripExpressionIfAltSyntax(this.listValue);
	      addParameter("listValue", this.listValue);
	    } else if (value instanceof Map) {
	      addParameter("listValue", "value");
	    }
	  }

	  public boolean contains(Object obj1, Object obj2) {
	    return ContainUtil.contains(obj1, obj2);
	  }

	  protected Class getValueClassType() {
	    return null;
	  }

	  @StrutsTagAttribute(description="Iterable source to populate from. If the list is a Map (key, value), the Map key will become the option 'value' parameter and the Map value will become the option body.", required=true)
	  public void setList(Object list)
	  {
	    this.list = list;
	  }

	  @StrutsTagAttribute(description=" Property of list objects to get field value from")
	  public void setListKey(String listKey) {
	    this.listKey = listKey;
	  }

	  @StrutsTagAttribute(description="Property of list objects to get field content from")
	  public void setListValue(String listValue) {
	    this.listValue = listValue;
	  }

	  public void setThrowExceptionOnNullValueAttribute(boolean throwExceptionOnNullValueAttribute)
	  {
	    this.throwExceptionOnNullValueAttribute = throwExceptionOnNullValueAttribute;
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
