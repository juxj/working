package com.zj198.util.tag;

import java.io.Writer;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.components.Component;

import com.opensymphony.xwork2.util.ValueStack;

public class ImgCommon extends Component{
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
	
	public ImgCommon(ValueStack value){
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
				if(src.startsWith("{") && src.endsWith("}")){
					src = src.substring(1, src.length()-1);
					obj = this.getStack().findValue(src);
				}else{
					obj = src;
				}
				isValid = obj == null ? false : true;
			}
			
			if(isValid){
				src = obj.toString().trim();
				str.append("<img src='");
				String newSrc = src;
				if(type != null ){
					type = type.toUpperCase();
					if(type.equals("B")){
						newSrc = src.substring(0,src.lastIndexOf(".")) + "_b" + src.substring(src.lastIndexOf("."),src.length());
					}else if(type.equals("M")){
						newSrc = src.substring(0,src.lastIndexOf(".")) + "_m" + src.substring(src.lastIndexOf("."),src.length());
					}else if(type.equals("S")){
						newSrc = src.substring(0,src.lastIndexOf(".")) + "_s" + src.substring(src.lastIndexOf("."),src.length());
					}
				}
				str.append(newSrc).append("'");
				if(StringUtils.isNotBlank(cssClass)){
					str.append(" class='").append(cssClass).append("'");
				}
				if(StringUtils.isNotBlank(style)){
					str.append(" style='").append(style).append("'");
				}
			}
			arg0.write(str.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

}
