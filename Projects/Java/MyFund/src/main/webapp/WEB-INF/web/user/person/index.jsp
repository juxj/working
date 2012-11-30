<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>个人用户中心_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/profile.js" > </script>
<script type="text/javascript">
$(function() {
showApply();
});

function showApply(){
   	var url = "/user/loan/uncheck/unCheckApply.act";
   	$.post(url,{}, function(data){
   		var da = $('#finance_apply_list');
   		da.html(data);
   	}, 'html');
   	$.post("/user/loan/uncheck/unCheckRequest!loanRequestHome.act",{}, function(data){
   		$('#loan_request_list').html(data);
   	});
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
      <h6> ${session._user.realname}</h6>
    </div>
    <div class="user_real fl">
      <h6>尊敬的 ${session._user.realname} <s:if test="#session._user.gender==1">先生：</s:if><s:else>女士：</s:else></h6>
      <p class="notice">您上次登录的时间为 <font color="#CC0000"><s:date name="usrLoginhistory.logindt" format="yyyy-MM-dd HH:mm:ss" /></font>，如有疑问请及时修改密码并联系客服。</p>
      <span class="msg">您有（<a class="red" href="/user/message!viewMsg.act"><s:if test="msgNo==null">0</s:if><s:else>${msgNo }</s:else></a>）条新消息</span>
      <s:if test="#session._user.activetype==0 || #session._user.activetype==1"><p class="mobile">您的手机尚未通过验证，为了您更方便开展业务，<a href="/user/regInfo.act"><font style="color: red;">请验证</font></a>您的手机。</p></s:if>
      <p><s:if test="#session._user.viptype == 1"><a href="/user/payment.act" class="btn_s bred">成为通资信通vip会员</a>&nbsp;&nbsp;&nbsp;<a href="/user/payment.act">了解详情...</a></s:if><s:elseif test="#session._user.viptype == 0"><a href="/user/payment.act" class="btn_s bred">成为通资信通会员</a>&nbsp;&nbsp;&nbsp;<a href="/user/payment.act" class="btn_s bred">成为通资信通vip会员</a></s:elseif></p>
    </div>
    <div class="clear"> &nbsp; </div>
  </div>
  <div class="hr_10"> &nbsp; </div>
  <div class="grid_710">
 	 <div class="hr_10"> &nbsp; </div>
    <!-- 快速申请 -->
    <div id="loan_request_list">
    
    </div>
    <div class="hr_10"> &nbsp; </div>
    <!-- 融资申请 -->
    <div id="finance_apply_list">
    
    </div>
    <div class="hr_10"> &nbsp; </div>
    <div id="div_request_info">
    	<s:include value="../common/_request_info.jsp"></s:include>
    </div>
    <div class="hr_10"> &nbsp; </div>
    <table class="gold-table" border="0" cellspacing="0" cellpadding="0">
      <caption>
      <span class="fr view_all"><a href="/service/serviceOrder!showSinOrdersByApplicant.act">查看全部»</a></span>
      <h6>服务申请</h6>
      <span class="leftdetail"><a href="/service/serviceItem!showHome.act" target="_blank">立即申请</a></span>
      </caption>
      <s:if test="sinOrderList.data.size()>0">
	       <tr>
	      	<th width="26%">服务标题</th>
	        <th width="26%">服务方</th>
	        <th width="12%">服务类型</th>
	        <th>申请日期</th>
	        <th>状态</th>
	        <th style="text-align:right; padding-right:60px;">操作</th>
	      </tr>
	      <s:iterator value="sinOrderList.data" id="item">
	       <tr>
	       	  <td  title="${item.itemTitle}">
					<s:if test="#item.itemTitle.length()>10">
   						<a href="/service/serviceOrder!showSinOrderDetail.act?orderId=${item.id}"><s:property value="#item.itemTitle.substring(0,10)"></s:property>...</a>
   					</s:if><s:else>
   						<a href="/service/serviceOrder!showSinOrderDetail.act?orderId=${item.id}">${item.itemTitle}</a>
   					</s:else>
	       	  </td>
	          <td>${item.vendorName }</td>
	          <td>${item.itemTypeName }</td>
	          <td><s:date name="#item.applyDate"></s:date> </td>
	          <td>
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
	          <td id="order_operations_${item.id}">
		          	<s:if test="#item.status==1">
		          		<a href="javascript:showAssessmentPage(${item.id})">评价</a> &nbsp;
		          	</s:if>
		          	<s:else>
		          		--
		          	</s:else>
		          	&nbsp;
	          </td>
	       </tr>
	    　</s:iterator>
	  </s:if>　
	  <s:else>
		<tr>
			<td colspan="6" style="text-align:center">暂无申请记录</td>
		</tr>
	</s:else>
    </table>
    <div class="hr_10"> &nbsp; </div>
    <!-- 
    <div class="box_4"><img src="/images/ad_708.jpg" /></div>
     -->
  </div>
  <div class="grid_230">
    <div class="menu_blue white"><span class="fr white"><a href="/loan/LoanService.act">更多»</a></span>
      <h6>推荐融资产品</h6>
    </div>
    <div class="box_3">
      <div class="qyrz-top">
           <s:action name="financeProduct!findRecom" namespace="/loan" executeResult="true"></s:action>
       </div>
    </div>
    <div class="hr_10"> &nbsp; </div>
    <div class="menu_blue white"><span class="fr white"><a href="/finance/bankProduct!search.act">更多»</a></span>
      <h6>推荐理财产品</h6>
    </div>
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