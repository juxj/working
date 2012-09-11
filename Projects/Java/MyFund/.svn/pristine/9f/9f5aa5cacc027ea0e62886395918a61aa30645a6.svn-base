package com.zj198.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;

import freemarker.template.Configuration;
import freemarker.template.Template;

public class FreemarkerUtil {	
	public static String getContent(String templateVar,Map<String, Object> params,boolean ifSaveFile,String savePath,String saveName) throws Exception{
		Template template = getTemplate(templateVar);
        if(ifSaveFile){
        	ActionContext ctx = ActionContext.getContext();
            ServletContext sctx = (ServletContext) ctx.get(ServletActionContext.SERVLET_CONTEXT);
            savePath = sctx.getRealPath(savePath);
        	creatDirs(savePath,saveName);
        	File staticFile = new File(savePath + File.separator + saveName);
        	Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(staticFile),"UTF-8"));
        	template.process(params,out);
        	out.flush();
        	return "";
        }else{
			StringWriter writer = new StringWriter();
			template.process(params, writer);
			return writer.toString();
        }
	}
	
    private static boolean creatDirs(String path,String filename){
    	File file = new File(path + filename);
        return file.getParentFile().mkdirs();   	
    }
        
	private static Template getTemplate(String templateVar) throws Exception{
		Configuration cfg = new Configuration();  
		cfg.setClassForTemplateLoading(FreemarkerUtil.class, "/templates/");  
		cfg.setEncoding(Locale.getDefault(), "UTF-8");  
		return cfg.getTemplate(templateVar);
	}
}
