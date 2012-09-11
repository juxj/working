package com.zj198.filter;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 特殊字符转义
 * 
 * @author zeroleavebaoyang@gmail.com
 * @time 2012-8-13| 下午4:38:58
 */
public class IllegalCharacterFilter implements Filter {

	public void init(FilterConfig config) throws ServletException {

		System.out.println("com.zj198.filter.IllegalCharacterFilter-->初始化");
	}

	@SuppressWarnings("unchecked")
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest servletrequest = (HttpServletRequest) request;
		HttpServletResponse servletresponse = (HttpServletResponse) response;
		String param = "";
		String paramValue = "";
		// 设置请求编码格式
		servletresponse.setContentType("text/html");
		servletresponse.setCharacterEncoding("UTF-8");
		servletrequest.setCharacterEncoding("UTF-8");
		Enumeration<String> params = request.getParameterNames();
		// 循环读取参数
		while (params.hasMoreElements()) {
			param = (String) params.nextElement(); // 获取请求中的参数
			// System.out.println(param);
			String[] values = servletrequest.getParameterValues(param);// 获得每个参数对应的值
			// System.out.println(values[0]);
			for (int i = 0; i < values.length; i++) {
				paramValue = values[i];
				// 转换目标字符变成对象字符，可以多个。后期扩展特殊字符库用于管理
				// paramValue = paramValue.replaceAll("'", "");
				// paramValue = paramValue.replaceAll("@", "");
				// paramValue = paramValue.replaceAll("胡锦涛", "***");
				paramValue = paramValue.replaceAll("<", "&lt;");
				paramValue = paramValue.replaceAll(">", "&gt;");
				// 这里还可以增加，如领导人 自动转义成****,可以从数据库中读取非法关键字。
				// values[i] = paramValue;
				// System.out.println(paramValue);
			}
			// 把转义后的参数重新放回request中
			request.setAttribute(param, paramValue);
		}
		// 继续向下 执行请求，如果有其他过滤器则执行过滤器
		arg2.doFilter(request, response);
	}

	public void destroy() {
		System.out.println("com.zj198.filter.IllegalCharacterFilter-->销毁");
	}
}
