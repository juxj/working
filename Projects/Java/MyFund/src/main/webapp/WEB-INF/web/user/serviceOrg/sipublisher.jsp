<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>服务机构用户中心_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/profile.js" > </script>
<script language="javascript">

	function toPage(pageNo, useless) {
		document.getElementById("pageNo").value=pageNo;
		var frmQueryServiceItem = document.getElementById("frmQueryServiceItem");
		frmQueryServiceItem.submit();
	}

	function changeSinItemStatus(itemId, isCancelled) {
		var url = '/service/serviceItem!cancelSinItem.act?itemId='+itemId+'&isCancelled='+isCancelled;
		$.ajax({
			url: url
		}).done(
			function(data, status, response) {
				var text = jQuery.parseJSON(response['responseText']);
				if (text.status =='success') {
					var t1 = '#cancel_'+itemId;
					var t2 = '#user_status_'+itemId;
					$(t1).html("已取消");
					$(t2).html("已取消");
				} else {
					alert('操作失败');
				}
			}		
		);	
	}
	
	function edit(){
		var url = "/service/userServiceItem!addInfo.act";
		var user_status = "${session._user.auditstatus}";
		if (user_status != "2") {
			alert("您的注册资料尚未通过审核，暂不能发布此信息!");
		} else {
			window.location.href = url;
		}
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
<div class="M_menu">
服务管理&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;服务产品管理
</div>
<div class="hr_10"> &nbsp; </div>
<div class="container_950 box_4" style="height:90px;">
	<div class="P_title">服务产品管理</div>
	<div class="line"><input name="" type="button" value="发布新服务"  class="but_gray" style="float: right; margin-right: 10px;" onclick="edit();"/></div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--服务产品管理-->
<div class="container_960">
	<!-- 表格 -->
	<div class="M_BOX">
		<form id="frmQueryServiceItem" action="/service/userServiceItem!showServiceInfoHomeByPublisher.act" >
			<input type="hidden" id="pageNo" name="pageNo"/>
		</form>
	   	<table class="container_950 center box_4">
	   		<tr class="top_color">
	   			<td style="padding-left:25px;">服务标题</td>
				<td>服务编号</td>
	   			<td>服务类型</td>
	   			<td>费用范围</td>
	   			<td>服务区域</td>
	   			<td>服务对象</td>
	   			<td>发布日期</td>
	   			<td>截止日期</td>
	   			<td>状态</td>
	   			<td>操作</td>
	   		</tr>
	   		<s:if test="pager.data.size()>0">
		   		<s:iterator id="item" value="pager.data">
	  			<tr class="top_color01">
	  				<td title="${item.title }">
	  					<div style="width:160px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">
	  					${item.title }
	  					</div>
	  				</td>
	  				<td>
	  					<div style="width:60px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">
	  					${item.typeName }
	  					</div>
	  				</td>
	  				<td>
	  					<div style="width:60px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">
	  					${item.chargeRange }
	  					</div>
	  				</td>
	  				<td title="${item.regionName }">
	  					<div style="width:60px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">
	  					${item.regionName }
	  					</div>
	  				</td>
	  				<td>${item.targetName }</td>
	  				<td><s:date name="#item.issuedDate"/></td>
	  				<td><s:date name="#item.expiredDate"/></td>
	  				<td>
	  					<s:if test="#item.isAuthenticated==0">
	  						待审核
	  					</s:if> 
	  					
	  					<s:if test="#item.isAuthenticated==1">
	  						通过审核
	  					</s:if> 
	  					
	  					<s:if test="#item.isAuthenticated==2">
	  						未通过审核
	  					</s:if> 
	  					
	  					<s:if test="#item.isAuthenticated==-1">
	  						已取消
	  					</s:if> 
	  				</td>
	  				<td id="user_status_${item.id}">
	  					<s:if test="#item.isCancelled==1">
	  						已取消
	  					</s:if> 
	  					<s:if test="#item.isCancelled==0">
	  						已启用
	  					</s:if> 
	  				</td>
	  				<td id="cancel_${item.id}">
	  					<s:if test="#item.isAuthenticated==0 and #item.isCancelled==0">
	  						<a href="javascript:changeSinItemStatus(${item.id},1)">取消</a>
	  					</s:if> <s:else>
	  						<a href="javascript:changeSinItemStatus(${item.id},1)">停用</a>
	  					</s:else>
	  				</td>
	  			</tr>
	  			</s:iterator>
	  			</s:if>
		</table>
	  </div>
	  <div class="hr_10"> &nbsp; </div>
	  <div style="width:960px; margin:0 auto; text-align:right;">
	 	<jsp:include page="/public/pagination.jsp" />
     </div>
		<s:else>
      	<div class="container_950 box_4">
			<div class="l_out">
				<h1 class="l_title">您还没有发布过服务产品</h1>
				<p>
				您可以<a href="/service/userServiceItem!addInfo.act">点此发布服务产品</a>
				</p>
			</div>
		</div>
		</s:else>
</div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>
