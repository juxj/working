package com.zj198.util.tag;

import java.io.Writer;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.struts2.components.Component;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ValueStack;
import com.zj198.model.DicBaseRate;
import com.zj198.model.DicCommon;
import com.zj198.service.common.DictoryDataService;
import com.zj198.util.Constants;
import com.zj198.util.InterestBean;

public class PrintCommon extends Component{
	private String valueId;
	private String valueSetId;
	protected String valueSetMap;
	/**
	 * rate取值：true or false
	 * 为true时根据valueId输出基准利率
	 * type取值：rate or user
	 * rate：根据期限输出基准利率
	 * user：根据用户ID输入公司名称
	 */
	private String type;
	/**
	 * 分隔符
	 * 取值：comma(逗号)，br(换行)
	 * 默认为逗号
	 */
	private String divide;
	
	public PrintCommon(ValueStack value){
		super(value);
	}
	
	@Override
	public boolean start(Writer arg0){
		boolean result = super.start(arg0);
		try {
			StringBuilder str = new StringBuilder();
			boolean isValid = true;
			Object obj = null;
			if(isValid){
				if(valueId.startsWith("{") && valueId.endsWith("}")){
					valueId = valueId.substring(1, valueId.length()-1);
				}else if(valueId.startsWith("${") && valueId.endsWith("}")){
					valueId = valueId.substring(2, valueId.length()-1);
				}
				obj = this.getStack().findValue(valueId);
				isValid = obj == null ? false : true;
			}
			
			if(isValid){
				valueId = obj.toString().trim();
				if (valueId.indexOf(",") != -1) {
					if(valueId.startsWith(",")){
						valueId = valueId.substring(1);
					}
					if(valueId.endsWith(",")){
						valueId = valueId.substring(0, valueId.length() - 1);
					}
				}
				if(valueId.equals("")){
					return result;
				}
				String valueIdStr = "";
				if(valueSetMap != null && !valueSetMap.trim().equals("")){
					LinkedHashMap<String, String> v = Constants.getValueSet().get(valueSetMap);
					if(valueId.indexOf(",") != -1){
						String[] arr = valueId.split(",");
						for(String s:arr){
							valueIdStr +=v.get(s) + ",";
						}
						valueIdStr = valueIdStr.substring(0, valueIdStr.length()-1);
					}else{
						valueIdStr =v.get(valueId);
					}
				}else if(type != null && type.equals("rate")){
					ApplicationContext ac = (ApplicationContext) (new ActionContext(this.stack.getContext())).getApplication().get(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
					DictoryDataService dictoryDataService = (DictoryDataService) ac.getBean("dictoryDataService");
					List<DicBaseRate> brList = dictoryDataService.findBaseRate();
					Integer dt = Integer.valueOf(valueId);
					for(DicBaseRate b : brList){
						if(dt >b.getStartdt() && dt <= b.getEnddt()){
							valueIdStr = b.getRate().toString();
							break;
						}
					}
				}else if(type != null && type.equals("user")){
					ApplicationContext ac = (ApplicationContext) (new ActionContext(this.stack.getContext())).getApplication().get(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
					DictoryDataService dictoryDataService = (DictoryDataService) ac.getBean("dictoryDataService");
					valueIdStr = dictoryDataService.getCompanyNameByUserId(Integer.valueOf(valueId));
				}else{					
					if(!valueId.equals("")){
						ApplicationContext ac = (ApplicationContext) (new ActionContext(this.stack.getContext())).getApplication().get(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
						DictoryDataService dictoryDataService = (DictoryDataService) ac.getBean("dictoryDataService");
						if(valueId.indexOf(",") != -1){	
							String[] idss = valueId.split(",");
							StringBuffer strname = new StringBuffer();
							for(int m = 0; m < idss.length; m++){
								String name = dictoryDataService.getValueNameById(Integer.valueOf(idss[m]));
								strname.append(name);
								if(m  != (idss.length - 1)){
									if(divide != null && divide.equals("br")){
										strname.append("<br/>");
									}else{										
										strname.append(",");
									}
								}
							}
							valueIdStr = strname.toString();
						}else{
							valueIdStr = dictoryDataService.getValueNameById(Integer.valueOf(valueId));
						}
					}
				}
//				str.append("<label class='common_value'>" + valueIdStr + "</label>");
				str.append(valueIdStr);
			}
			arg0.write(str.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
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
