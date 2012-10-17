<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta keyword="${knwTitle.keyword}" />
	<title>${knwTitle.title}_中国资金网</title>
	<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
	<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
	<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
	<script type="text/javascript" src="/script/load-news.js" > </script>
  </head>
  <body>
	<div class="header index_header"><jsp:include page="/public/head1.jsp" /></div>
	<div class="clear"> &nbsp; </div><div class="hr_10"> &nbsp; </div> 
	<div class="M_menu"><a href="/news/InfoCenter.act">信息中心</a>&nbsp;&nbsp;>&nbsp;&nbsp;
		<a href="/news/Info!infoGroup.act?typeId=${knwTitle.typeId }">${knwTitle.typeName }</a> >&nbsp;&nbsp; 详细页面</div>
	<div class="hr_10"> &nbsp; </div> 
	
	<div class="M_out">
	
  	<div class="M_out_L">
		<div style="font-size:14px; border:1px solid #CCC; padding:20px; line-height:25px;">
	        <h5 style="text-align:center; line-height:30px; color:#97181d ">${knwTitle.title}</h5>
	        <hr style="width:100%;"/>
	        <h6 style="text-align:center; line-height:30px;"> ${knwTitle.author} &nbsp; &nbsp;&nbsp; <s:date name="knwTitle.issuedDate" /></h6>
	        <div class="hr_20"> &nbsp;</div>		
			<p style="text-indent:24px;">${knwTitle.contents }</p>　
            <p style="text-indent:24px;"></p>
            <p style="text-indent:24px;"></p>
            <p style="text-indent:24px; text-align:right">来源: &nbsp;&nbsp; ${knwTitle.source} &nbsp; &nbsp;&nbsp;</p>
            <p style="text-indent:24px;"></p>                            　        
        </div>
      	<div class="hr_10"> &nbsp; </div>
        <div><img src="/images/img_lc.jpg" /></div>
    </div>
    <div class="fr" style="width:230px;">
    <!-- 
	  	<div class="M_out_right">
	    	<img src="/images/nsbank.png" style="margin-bottom:10px;"/>
	    </div>
	     -->
	    <div class="M_out_right_text">
    	<h1>热门融资产品</h1>
        <div class="box_3">
          <div class="qyrz-top">
	            <s:action name="financeProduct!findRecom" namespace="/loan" executeResult="true"></s:action>
	        </div>
        </div>
	    </div>
		<div class="hr_10"> &nbsp;</div>
	    <div class="M_out_right_text">
	    	<h1>热门理财产品</h1>
	        <div class="box_3">
	        	<div class="qyrz-top" style="width : 230px;">
				    <table class="qyrz-top_table">
					  <s:iterator value="bankFinanceRecommendationList" id="item" >
					   <tr>
					     <td style="vertical-align: middle;">
							<s:if test="logo == null">
						        <img src="/images/banklogo/zj198.jpg" class="td_img" style="white-space: nowrap;"/>
					        </s:if>
					        <s:else>
					        	<img src="/images/banklogo/${item.logo}" class="td_img" style="white-space: nowrap;"/>
					        </s:else>
					     </td>
					     <td class="hot_connect">
					     	<a href="/finance/bankProduct!showDetails.act?id=${item.prodId}">
					     		<s:if test="#item.title != null && #item.title.length()>15">
									<s:property value="#item.title.substring(0,15)"></s:property>...
								</s:if><s:else>
									${item.title}
								</s:else>
					     	</a>
					     </td>
					   </tr>
					  </s:iterator>
					</table>
			    </div>
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
  
