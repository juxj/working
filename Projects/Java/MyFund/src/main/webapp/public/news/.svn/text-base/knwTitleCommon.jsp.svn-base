<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>理财服务产品页_中国资金网</title>
	<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
	<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
	<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
	<script type="text/javascript" src="/script/load-news.js" > </script>
  </head>
  <body>
	<div class="header index_header"><jsp:include page="/public/head1.jsp" /></div>
	<div class="clear"> &nbsp; </div><div class="hr_10"> &nbsp; </div> 
	<div class="M_menu"><a href="/news/InfoCenter.act">信息中心</a>&nbsp;&nbsp;>&nbsp;&nbsp;
		${knwTitle.typeName }</div>
	<div class="hr_10"> &nbsp; </div> 	
	<div class="M_out">	
  	<div class="M_out_L">
		<div class="box_5">
	        <h5 style="line-height:30px;">${knwTitle.title}</h5>
	        <hr style="width:100%;"/>	        
	        <div class="hr_10"> &nbsp;</div>		
			<p class="txt_content_guide">${knwTitle.contents }</p>　         　        
        </div>
    </div>    
    <div class="M_out_right_text fr">
    <div class="menu_red white">
      <h6>用户指南</h6>
    </div>
    <div class="box_3">
      <div style="background: #f4f4f4; font-weight: bolder; color: #333; line-height:30px; padding-left:20px;">注册与登录</div>
      <ul class="new_li">
		<s:iterator id="item" value="knwTitleMap['NEWS_REGISTER_LOGIN']">
	        	<li>	          	
					<s:if test="#item.title.length()>25">
						<a href="/news/Info.act?id=${item.id}">
						<s:property value="#item.title.substring(0,25)"></s:property>...</a>
					</s:if><s:else>
						<a href="/news/Info.act?id=${item.id}">${item.title}</a>
					</s:else>				
	       		</li>
		</s:iterator>  
      </ul>
      <div style="background: #f4f4f4; font-weight: bolder; color: #333; line-height:30px; padding-left:20px;">融资与服务</div>
      <ul class="new_li">
		<s:iterator id="item" value="knwTitleMap['NEWS_FINANCING_SERVICE']">
	        	<li>	          	
					<s:if test="#item.title.length()>25">
						<a href="/news/Info.act?id=${item.id}">
						<s:property value="#item.title.substring(0,25)"></s:property>...</a>
					</s:if><s:else>
						<a href="/news/Info.act?id=${item.id}">${item.title}</a>
					</s:else>			
	       		</li>
		</s:iterator>  
      </ul>
      <div style="background: #f4f4f4; font-weight: bolder; color: #333; line-height:30px; padding-left:20px;">服务协议与规则</div>
      <ul class="new_li">
		<s:iterator id="item" value="knwTitleMap['NEWS_SERVICE_AGREEMENT']">
	        	<li>	          	
					<s:if test="#item.title.length()>25">
						<a href="/news/Info.act?id=${item.id}">
						<s:property value="#item.title.substring(0,25)"></s:property>...</a>
					</s:if><s:else>
						<a href="/news/Info.act?id=${item.id}">${item.title}</a>
					</s:else>			
	       		</li>
		</s:iterator>  
      </ul>
      <div style="background: #f4f4f4; font-weight: bolder; color: #333; line-height:30px; padding-left:20px;">常见问题</div>
      <ul class="new_li">
		<s:iterator id="item" value="knwTitleMap['NEWS_COMMON_ISSUES']">
	        	<li>	          	
					<s:if test="#item.title.length()>25">
						<a href="/news/Info.act?id=${item.id}">
						<s:property value="#item.title.substring(0,25)"></s:property>...</a>
					</s:if><s:else>
						<a href="/news/Info.act?id=${item.id}">${item.title}</a>
					</s:else>		
	       		</li>
		</s:iterator>  
      </ul>                  
    </div>    
    

    </div>
</div>	
	<div class="clear"> &nbsp; </div>
	<div class="hr_10"> &nbsp;</div>
  	<!--主体部分结束-->
	<jsp:include page="/public/bottom.jsp" />
  </body>
  </html>
  
