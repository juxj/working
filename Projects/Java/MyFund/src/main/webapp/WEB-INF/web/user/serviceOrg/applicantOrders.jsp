<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>用户中心_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript">
	function toPage(pageNo, useless){
		document.getElementById("pageNo").value=pageNo;
		document.getElementById("frmQueryApplicantOrders").submit();
	}
</script>
</head>
<body>
<!--头部-->
<div class="header user_header">
<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分-->
	<div class="clear"> &nbsp; </div>
	<div class="M_menu">
  		服务管理&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;服务申请管理
    </div>
    <div class="hr_10"> &nbsp; </div>
	<div class="container_950 box_4">
		<div class="P_title" style="border-bottom:5px solid #003961;">服务申请管理</div>

	<!-- 当取得的结果值大于０,才显示下面的表格 -->
	<form id="frmQueryApplicantOrders" action="/service/serviceOrder!showSinOrdersByApplicant.act" method="post">
		<input type="hidden" id="pageNo" name="pageNo" value="${pageNo }"/>
	</form>
	</div>
	<!-- 表格 -->
	<div class="container_950 box_3">
		   	<table class="gold-table" border="0" cellspacing="0" cellpadding="0" style="border-top:none;" >
		   		<tr>
		   			<th>申请编号</th>
		   			<th>服务编号</th>
		   			<th>服务标题</th>
		   			<th>服务类型</th>
		   			<th>申请方名称</th>
		   			<th>申请时间</th>
		   			<th>状态</th>
		   			<th>操作</th>
		   		</tr>
		   		<s:if test="pager.data.size()>0">
			   		<s:iterator id="item" value="pager.data">
		  			<tr class="top_color01">
		  				<td style="padding-left:20px;"><a href="/service/serviceOrder!showSinOrderDetail.act?orderId=${item.id}">${item.orderNo}</a></td>
		  				<td style="padding-left:20px;">${item.serviceNo }</td>
		  				<td style="padding-left:20px;">
		  					<label title="${item.itemTitle}">
								<s:if test="#item.itemTitle.length()>25">
			   						<a href="/service/serviceOrder!showSinOrderDetail.act?orderId=${item.id}"><s:property value="#item.itemTitle.substring(0,25)"></s:property>...</a>
			   					</s:if><s:else>
			   						<a href="/service/serviceOrder!showSinOrderDetail.act?orderId=${item.id}">${item.itemTitle}</a>
			   					</s:else>
			  				</label>
		  				</td>
		  				<td style="padding-left:20px;">${item.itemTypeName }</td>
		  				<td style="padding-left:20px;">${item.contactName }</td>
		  				<td style="padding-left:20px;"><s:date name="#item.applyDate"/></td>
		  				<td style="padding-left:20px;" id="order_status_${item.id}">
			          	<s:if test="#item.status==0">
			          		待确认
			          	</s:if>
			          	<s:if test="#item.status==-1">
			          		已拒绝
			          	</s:if>
			          	<s:if test="#item.status==1">
			          		已受理
			          	</s:if>
			          	<s:if test="#item.status==2">
			          		已结束
			          	</s:if>
			          </td>
			          <td style="padding-left:20px;" id="order_operations_${item.id}">
				          	--
			          </td>
		  			</tr>
		  			</s:iterator>
		  		</s:if>
			</table>
	<s:if test="pager.data.size()<=0">
	
		<div class="l_out">
			<s:if test="#session._user.userTypeGroup==5 || #session._user.userTypeGroup==1">
			<h1 class="l_title">您还没有提交过服务申请</h1>
			<p>
			您可以去<a href="/service/serviceItem!showHome.act">融资服务频道</a>搜索适合您的服务产品
			</p>
			</s:if><s:elseif test="#session._user.userTypeGroup==4">
			<h1 class="l_title">您还没有收到过服务申请</h1>
			<p>
			您可以<a href="/service/userServiceItem!addInfo.act">点此发布服务产品</a>
			</p>
			</s:elseif>
		</div>
	
	 </s:if>
			 <div style="margin:0 auto; text-align:right;">
			      <div class="pages01">
			      	<jsp:include page="/public/pagination.jsp" />
			   </div>
		     </div>
	</div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
	<div id="dialog-message" style="display: none;" title="服务质量评价">
		<form id="frmAssessment">
		<s:radio id="serviceLevel" list="serviceLevelList" listKey="id" listValue="name" name="serviceLevel"></s:radio>
		<textarea id="txtAssessment" rows="7" cols="30"></textarea>
		</form>
	</div>
</body>
</html>