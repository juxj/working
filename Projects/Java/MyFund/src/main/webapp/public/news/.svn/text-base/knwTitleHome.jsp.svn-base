<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>新闻_中国资金网</title>
	<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
	<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
	<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
	<script type="text/javascript" src="/script/load-news.js" > </script>
	<script language="javascript" >
		function showNewsHome(typeId, pageNo){
			url = "/news/Info!infoGroup.act?typeId="+typeId+"&pageNo="+pageNo;
			window.location.href = url;
		}
		
		function toPage(pageNo, pageCount) {
			var typeId = $("#typeId").attr("value");
			showNewsHome(typeId, pageNo);
		}
	</script>

  </head>
  
  <body>
	<div class="header index_header">
	<jsp:include page="/public/head1.jsp" />
	</div>
	<div class="clear"> &nbsp; </div>
	<div class="hr_10"> &nbsp; </div> 
	<div class="clear"> &nbsp; </div>

  <!--信息中心新闻列表页面开始-->
  	<div class="M_menu">
  		<p><a href="/news/InfoCenter.act">信息中心</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;${knwType.name }</p>
  	</div>
	<div class="hr_10"> &nbsp; </div>      	
  <div class="M_out">
  	<div class="M_out_L">
        <div class="box_4" style="overflow:hidden; ">
          <div class="menu_red" style="border-bottom:5px solid #97181d; background-color:#f9f9f7; color: #424240;">
            <h6 style="font-weight:bolder">${knwType.name }</h6> <input type="hidden" id="typeId" value="${typeId }"></input>
          </div>
          <div>
                <ul class="xxkbox first new_li">
	            	<s:if test="pager.data.size()>0">
				   	<s:iterator id ="item" value="pager.data">
							<s:if test="#item.url.length()>8">
								<li>
									<span style="float:right">
										<s:date name="#item.issuedDate"></s:date>
									</span>
									<div title="${item.title}" class="news_title">
										<a href="${item.url}" target="_blank">${item.title}</a>
									</div>
								</li>
							</s:if>
							<s:else>
								<li>
									<span style="float:right;">
										<s:date name="#item.issuedDate"></s:date>
									</span>
									<div title="${item.title}" >
										<a href="/news/Info.act?id=${item.id}" target="_blank">${item.title}</a>
									</div>
									
								</li>
							</s:else>
			    	</s:iterator>
			    	</s:if>
			    	<s:else>
						无记录
			    	</s:else>
                </ul>
          </div>
            <!--分页-->  
            <div style="margin-top:10px;">
               <jsp:include page="/public/pagination.jsp"></jsp:include>
            </div>
            <!--分页-->             
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
          <div class="qyrz-top">
	            <s:action name="financeProduct!findRecom" namespace="/loan" executeResult="true"></s:action>
	        </div>
        </div>
    </div>
    <div class="hr_10"> &nbsp; </div>
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
  <div class="hr_10"> &nbsp; </div>
	<!--主体部分结束-->
	<jsp:include page="/public/bottom.jsp" />
  </body>
</html>
