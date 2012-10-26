<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>服务机构用户中心_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/profile.js" > </script>
</head>
<body>
<!--头部-->
<div class="header user_header">
<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分-->
<div class="container_960">
  <div class="user_box">
    <div class="user_info fl"> <img class="user_logo fl" src="<s:if test="#session._user.avatar!=null">${session._user.avatar}</s:if><s:else>/images/member_logo.jpg</s:else>" alt="${session._user.realname}" />
        <h6> ${typeName } <font style="color: red;">&nbsp;&nbsp;&nbsp;<s:if test="#session._user.auditstatus==0">未审核</s:if><s:elseif test="#session._user.auditstatus==1">待审核</s:elseif><s:elseif test="#session._user.auditstatus==2">已审核</s:elseif></font></h6>
        <span id="mail">
        	<s:if test="#session._user.activetype==1 || #session._user.activetype==3"><a class="mail_on" title="Email已认证"></a></s:if><s:else><a class="mail_off" title="Email未认证"></a></s:else>
        </span>
        <span id="mobile">
        	<s:if test="#session._user.activetype==2 || #session._user.activetype==3"><a class="mobile_on" title="手机号码已认证"></a></s:if><s:else><a class="mobile_off" title="手机号码未认证"></a></s:else>
        </span>
        <span id="ca"><a class="ca_off" title="CA证书未认证"></a></span>
        <span id="vip">
        <s:if test="#session._user.viptype==2"><a class="vip_on" title="资信通vip会员"></a></s:if><s:elseif test="#session._user.viptype==1"><a class="vip_on" title="资信通认证会员"></a></s:elseif><s:else><a class="vip_off" title="非资信通会员"></a></s:else>
        </span>
      <div class="hr_10"> &nbsp; </div>
      <h6>${userTypeName }</h6>
    </div>
    <div class="user_real fl">
      <h6>尊敬的 ${session._user.realname} <s:if test="#session._user.gender==1">先生：</s:if><s:else>女士：</s:else></h6>
      <p class="notice">您上次登录的时间为 <font color="#CC0000"><s:date name="usrLoginhistory.logindt" format="yyyy-MM-dd HH:mm:ss" /></font>，如有疑问请及时修改密码并联系客服。</p>
      <span class="msg">您有（<a class="red" href="/user/message!viewMsg.act"><s:if test="msgNo==null">0</s:if><s:else>${msgNo }</s:else></a>）条新消息</span>
      <p>查看您的<a href="/user/Profile.act"><font style="color: red;">详细信息</font></a>。</p>
    </div>
    <div class="clear"> &nbsp; </div>
  </div>
  <div class="hr_10"> &nbsp; </div>
  <div class="grid_710">
    <div class="hr_10"> &nbsp; </div>
    <table class="gold-table" border="0" cellspacing="0" cellpadding="0">
      <caption>
      <span class="fr view_all"><a href="/service/serviceOrder!showPublisherOrders.act">查看全部»</a></span>
      <h6>服务订单</h6>
      </caption>
      <s:if test="sinOrderList.data.size>0">
      <tr>
        <th>申请编号</th>
		<th>服务编号</th>
		<th>服务标题</th>
		<th>服务类型</th>
		<th>申请方名称</th>
		<th>申请时间</th>
		<th>状态</th>
      </tr>
		<s:iterator id="item" value="sinOrderList.data">
		<tr  class="gold_connect">
			<td>${item.orderNo }</td>
			<td>${item.serviceNo }</td>
			<td title="点击查看服务详情"><a href="/service/serviceItem!showSinItemDetail.act?itemId=${item.itemId }">${item.itemTitle}</a></td>
			<td>${item.itemTypeName }</td>
			<td>${item.contactName }</td>
			<td><s:date name="#item.applyDate"/></td>
			<td id="status_${item.id}">
				<s:if test="#item.status==0">
		       		待确认
		       	</s:if>
		       	<s:if test="#item.status==1">
		       		已受理
		       	</s:if>
		       	<s:if test="#item.status==-1">
		       		已拒绝
		       	</s:if>
			</td>
		</tr>
		</s:iterator>
		</s:if> <s:else>
			<tr>
				<td colspan="7" style="text-align:center">暂无申请记录</td>
			</tr>
		</s:else>
    </table>
    <div class="hr_10"> &nbsp; </div>
    <table class="gold-table" border="0" cellspacing="0" cellpadding="0">
      <caption>
      <span class="fr view_all"><a href="/service/userServiceItem!showServiceInfoHomeByPublisher.act">查看全部»</a></span>
      <h6>已发布服务</h6>
      </caption>
       <s:if test="sinItemList.data.size>0">
      <tr>
        <th>服务主题</th>
		<th>服务类型</th>
		<th>费用范围</th>
		<th>服务区域</th>
		<th>发布日期</th>
		<th>截止日期</th>
		<th>审核状态</th>
      </tr>
		<s:iterator id="item" value="sinItemList.data">
		<tr  class="gold_connect">
			<td title="${item.title }">
				<s:if test="#item.title.length()>10">
					<s:property value="#item.title.substring(0,10)"></s:property>...
				</s:if><s:else>
					${item.title}
				</s:else>
			</td>
			<td>${item.typeName }</td>
			<td>${item.chargeRange }</td>
			<td>${item.regionName }</td>
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
		</tr>
		</s:iterator>
		</s:if> <s:else>
			<tr>
				<td colspan="7" style="text-align:center">暂无申请记录</td>
			</tr>
		</s:else>
    </table>
    <div class="hr_10"> &nbsp; </div>
    <!-- 
    <div class="box_4"><img src="/images/ad_708.jpg" /></div>
     -->
  </div>
  <div class="grid_230">
    <div class="hr_10"> &nbsp; </div>
    <div class="menu_blue white"><span class="fr white"><a href="/finance/bankProduct!search.act">更多»</a></span>
      <h6>推荐理财产品</h6>
    </div>
    <div class="box_3">
      <ul class="new_li">
         <s:iterator id="item" value="bankFinanceRecommendationList">
            <li><a target="_blank" href="/finance/bankProduct!showDetails.act?id=${item.prodId}">${item.title }</a></li>
         </s:iterator>
      </ul>
    </div>
    <div class="hr_10"> &nbsp; </div>
    <div class="menu_blue white">
      <h6>实用工具</h6>
    </div>
    <div class="box_3">
      <ul class="new_li">
        <jsp:include page="/public/finance/_financing_tools.jsp" />
      </ul>
    </div>
  </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>