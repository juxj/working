package com.zj198.util.tag;

import java.io.Writer;

import org.apache.struts2.components.Component;

import com.opensymphony.xwork2.util.ValueStack;

public class IfNullCommon extends Component{
	private String value;
	
	public IfNullCommon(ValueStack value){
		super(value);
	}
	
	@Override
	public boolean start(Writer arg0){
		boolean result = super.start(arg0);
		try {
			String str = "--";
			boolean isValid = true;
			Object obj = null;
			if(isValid){
				obj = this.getStack().findValue(value);
				isValid = obj == null ? false : true;
			}
			if(isValid){
				str = obj.toString().trim();
			}
			arg0.write(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

}
