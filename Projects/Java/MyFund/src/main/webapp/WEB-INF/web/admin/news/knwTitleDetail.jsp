<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>理财服务产品页_中国资金网</title>
	<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
	<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
	<script type="text/javascript" src="/script/load-news.js" > </script>
  </head>
  <body>
	<div class="header index_header"><jsp:include page="/public/head1.jsp" /></div>
	<div class="clear"> &nbsp; </div><div class="hr_10"> &nbsp; </div> 
	<div class="M_menu"><a href="/">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/news/InfoCenter.act">信息中心</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="#">${knwTitle.typeName }</a></div>
	<div class="hr_10"> &nbsp; </div> 
	
	<div class="M_out">
	
  	<div class="M_out_L">
		<div style="font-size:14px; border:1px solid #CCC; padding:20px; line-height:30px;">
	        <h3 style="text-align:center; line-height:30px;">${knwTitle.title}</h3>
	        <hr style="width:100%;"/>
	        <h6 style="text-align:center; line-height:30px;"> ${knwTitle.author} &nbsp; &nbsp;&nbsp; ${knwTitle.issuedDate}</h6>
	        <div class="hr_20"> &nbsp;</div>		
			<p style="text-indent:24px;">${knwTitle.contents }</p>　
            <p style="text-indent:24px;"></p>
            <p style="text-indent:24px;"></p>
            <p style="text-indent:24px; text-align:right">${knwTitle.source} &nbsp; &nbsp;&nbsp;</p>
            <p style="text-indent:24px;"></p>                            　        
        </div>
      	<div class="hr_10"> &nbsp; </div>
        <div><img src="/images/img_lc.jpg" /></div>
    </div>
    <div class="fr" style="width:230px;">
	  	<div class="M_out_right">
	    	<img src="/images/nsbank.png" style="margin-bottom:10px;"/>
	    </div>
	    <div class="M_out_right_text">
	    	<h1>热门融资产品</h1>
	        <div class="box_3">
	          <ul class="new_li">
	            <li><a href="">标题栏全部使用字体，不使用图标；</a></li>
	            <li><a href="">网站边框和图片使用直角边框（圆角边框）；</a></li>
	            <li><a href="">样式边框使用灰色；</a></li>
	            <li><a href="">顶栏设计需考虑到不同分辨率的通栏效果，预留样式；</a></li>
	            <li><a href="">插图设计：主题插图或者抠像插图设计风格，符合主题，无版权问题。（或对图片是用二次加工设计）；</a></li>
	            <li><a href="">网站边框和图片使用直角边框（圆角边框）；</a></li>
	          </ul>
	        </div>
	    </div>
		<div class="hr_10"> &nbsp;</div>
	    <div class="M_out_right_text">
	    	<h1>热门理财产品</h1>
	        <div class="box_3">
	          <ul class="new_li">
	            <li><a href="">标题栏全部使用字体，不使用图标；</a></li>
	            <li><a href="">网站边框和图片使用直角边框（圆角边框）；</a></li>
	            <li><a href="">样式边框使用灰色；</a></li>
	            <li><a href="">顶栏设计需考虑到不同分辨率的通栏效果，预留样式；</a></li>
	            <li><a href="">插图设计：主题插图或者抠像插图设计风格，符合主题，无版权问题。（或对图片是用二次加工设计）；</a></li>
	            <li><a href="">网站边框和图片使用直角边框（圆角边框）；</a></li>
	          </ul>
	        </div>
	    </div>
	  </div>
</div>	
	<div class="clear"> &nbsp; </div>
	<div class="hr_10"> &nbsp;</div>
  	<!--主体部分结束-->
	<jsp:include page="/public/bottom.jsp" />
  </body>
  </html>
  
