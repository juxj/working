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
		<div style="font-size:14px; border:1px solid #CCC; padding:20px; line-height:30px;">
	        <h5 style="line-height:30px; color:#003961;">${knwTitle.title}</h5>
	        <hr style="width:100%;"/>      
			<p class="txt_content_new">${knwTitle.contents }</p>　
        </div>
    </div>
    <div class="box_4 fr" style="width:230px;">
		<div style="width:183px; heigth:60px; margin-left: 20px;margin-top: 20px; ">
			<s:if test="knwTitle.typeId == 13">
				<img src="/images/rzcd_img.jpg" />
			</s:if>
			<s:else>
				<img src="/images/lcbk_img.jpg" />
			</s:else>
		</div>
        <div class="txt_content">
        	<table >
              <tr>
        		<s:iterator value="siteNews" id="item" status="st">
	       			<s:if test="#st.odd">
	       				<tr><td width="100px;">
	       				<s:if test="#item.title.length()>7">
		       				<a href="/news/Info.act?id=${item.id}" ><s:property value="#item.title.substring(0,7)"></s:property></a>
	       				</s:if>
	       				<s:else>
	       					<a href="/news/Info.act?id=${item.id}" >${item.title}</a>
	       				</s:else>
	       				</td>
	       			</s:if>
	                <s:else>
	                	<td class="hot_connect">
	                	<s:if test="#item.title.length()>7">
		       				<a href="/news/Info.act?id=${item.id}" ><s:property value="#item.title.substring(0,7)"></s:property></a>
	       				</s:if>
	       				<s:else>
	       					<a href="/news/Info.act?id=${item.id}" >${item.title}</a>
	       				</s:else>
	                	</td></tr>
	                </s:else>
	                <s:if test="#st.odd && #st.last">
	                	<td></td></tr>
	                </s:if>
        		</s:iterator>
                     
            </table>
        </div>	
    </div>
</div>	
	<div class="clear"> &nbsp; </div>
	<div class="hr_10"> &nbsp;</div>
  	<!--主体部分结束-->
	<jsp:include page="/public/bottom.jsp" />
  </body>
  </html>
  
