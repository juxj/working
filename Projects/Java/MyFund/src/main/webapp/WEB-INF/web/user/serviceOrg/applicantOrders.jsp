<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>�û�����_�й��ʽ���</title>
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
<!--ͷ��-->
<div class="header user_header">
<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--���岿��-->
	<div class="clear"> &nbsp; </div>
	<div class="M_menu">
  		�������&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;�����������
    </div>
    <div class="hr_10"> &nbsp; </div>
	<div class="container_950 box_4">
		<div class="P_title" style="border-bottom:5px solid #003961;">�����������</div>

	<!-- ��ȡ�õĽ��ֵ���ڣ�,����ʾ����ı�� -->
	<form id="frmQueryApplicantOrders" action="/service/serviceOrder!showSinOrdersByApplicant.act" method="post">
		<input type="hidden" id="pageNo" name="pageNo" value="${pageNo }"/>
	</form>
	</div>
	<!-- ��� -->
	<div class="container_950 box_3">
		   	<table class="gold-table" border="0" cellspacing="0" cellpadding="0" style="border-top:none;" >
		   		<tr>
		   			<th>������</th>
		   			<th>������</th>
		   			<th>�������</th>
		   			<th>��������</th>
		   			<th>���뷽����</th>
		   			<th>����ʱ��</th>
		   			<th>״̬</th>
		   			<th>����</th>
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
			          		��ȷ��
			          	</s:if>
			          	<s:if test="#item.status==-1">
			          		�Ѿܾ�
			          	</s:if>
			          	<s:if test="#item.status==1">
			          		������
			          	</s:if>
			          	<s:if test="#item.status==2">
			          		�ѽ���
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
			<h1 class="l_title">����û���ύ����������</h1>
			<p>
			������ȥ<a href="/service/serviceItem!showHome.act">���ʷ���Ƶ��</a>�����ʺ����ķ����Ʒ
			</p>
			</s:if><s:elseif test="#session._user.userTypeGroup==4">
			<h1 class="l_title">����û���յ�����������</h1>
			<p>
			������<a href="/service/userServiceItem!addInfo.act">��˷��������Ʒ</a>
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
<!--β��-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
	<div id="dialog-message" style="display: none;" title="������������">
		<form id="frmAssessment">
		<s:radio id="serviceLevel" list="serviceLevelList" listKey="id" listValue="name" name="serviceLevel"></s:radio>
		<textarea id="txtAssessment" rows="7" cols="30"></textarea>
		</form>
	</div>
</body>
</html>