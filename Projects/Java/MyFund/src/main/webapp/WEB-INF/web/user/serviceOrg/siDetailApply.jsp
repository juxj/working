<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>理财服务详情页_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/public.js" > </script>
</head>
<body>
<!--头部开始-->
<div class="header index_header">
<jsp:include page="/public/head1.jsp" />
<div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--头部结束-->
  <!--理财服务详情页面开始-->
  <div class="M_menu">
  	<a href="/service/serviceInfo!showServiceItemHome.act">服务产品</a>&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;产品详情
  </div>
  <div class="hr_10"> &nbsp; </div> 
  <div class="M_out">
  	<div class="M_out_L">
  		<input type="hidden" id="sinItemId" value="${sinItem.id}"/>
        <!--表格部分开始-->
        <table border="0" cellspacing="0" cellpadding="0" class="Search_table">
          <tr>
            <td class="Search_t_connect">服务标题</td>
            <td colspan="3" style="padding-left:10px;">${sinItem.title}</td>
          </tr>
          <tr>
			<td class="Search_t_connect">服务类别</td>
			<td class="Search_t_connect01">${sinItem.typeName}</td>
			<td  class="Search_t_connect">收费标准</td>
			<td class="Search_t_connect01">${sinItem.chargeRange}</td>
		</tr>
		<tr>
			<td  class="Search_t_connect">面向区域</td>
			<td class="Search_t_connect01">${sinItem.regionName}</td>
			<td  class="Search_t_connect">服务对象</td>
			<td class="Search_t_connect01">${sinItem.targetName}</td>
		</tr>
		<tr>
			<td class="Search_t_connect">服务内容</td>
			<td colspan="3" class="Search_t_connect01">${sinItem.serviceInfo}</td>
		</tr>
		<tr>
			<td class="Search_t_connect" style="vertical-align:middle">服务评价</td>
			<td colspan="4" class="Search_t_connect01">
				<div id="accessmentsHeader">
					<input type="hidden" id="levelId" value="0"/>
					<dl>
						<dd><a id="showAssessment_0"
							style="background-color:#97181d; 
							color:white; 
							font-weight:bolder;
							padding:3px" 
							href="javascript:showAssessments(${sinItem.id}, 0, 1);">全部</a>&nbsp;&nbsp;&nbsp;&nbsp;</dd>
						<s:iterator id="level" value="serviceLevels">
							<dd><a id="showAssessment_${level.id}" href="javascript:showAssessments(${sinItem.id}, ${level.id}, 1);">${level.name}(${level.cnt})</a> &nbsp;&nbsp;&nbsp;&nbsp;</dd>
						</s:iterator>
					</dl>
				</div>
				<div id="divAssessments">
					<jsp:include page="/WEB-INF/web/user/serviceOrg/_ssessments.jsp" />
				</div>
			</td>
		</tr>
        </table>
        <div class="hr_10"> &nbsp; </div>
        <div align="center">
        	<p></p>
        	<form id="frmApplyService" action="/service/serviceCenter!applyService.act" method="post">
        		<input type="hidden" id="itemId" name="itemId" value="${sinItem.id }"/>
        		<textarea id="requiremnts" rows="8" cols="99" name="requirements"></textarea>
        		<input id="btnApply" type="submit" value="保存"/>
        	</form>
        </div>
        <!--表格部分结束-->
      <div class="hr_10"> &nbsp; </div>
        <div><img src="/images/img_lc.jpg" /></div>
    </div>
  	<div class="M_out_right fr">
    	<img src="/images/nsbank.png" style="margin-bottom:10px;"/>
    </div>
    <div class="M_out_right_text fr">
    	<h1>热销银行理财产品</h1>
        <div class="box_3">
          <ul class="new_li">
          	<jsp:include page="/public/news/_hot_sale_items.jsp" />
          </ul>
        </div>
    </div>
  </div>
  <!--理财服务详情页面结束--> 
<div class="clear"> &nbsp; </div>
<div class="hr_20"> &nbsp; </div>
<jsp:include page="/public/bottom.jsp" />
</body>
</html>
