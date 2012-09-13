<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>理财服务详情页_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/public.js" > </script>
<script language="javascript">
	function apply(itemId) {
		$('#btnApply').attr('disabled', true);
		var url = '/service/serviceCenter!applyService.act?itemId='+itemId;
		$.ajax({
			url: url
		}).done(
			function(data, status, response) {
				var text = jQuery.parseJSON(response['responseText']);
				if (text.status =='success') {
					$('#btnApply').attr('value', '申请成功');
				} else {
					$('#btnApply').attr('disabled', false);
					$('#btnApply').attr('value', '申请失败,　点击可重试');
				}
			}		
		);		
	}
</script>
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
  	服务管理&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;我的服务订单
  </div>
  <div class="hr_10"> &nbsp; </div> 
  <div class="M_out">
  	<div class="M_out_L">
        <!--表格部分开始-->
        <table border="0" cellspacing="0" cellpadding="0" class="Search_table">
			<tr>
			   <td class="Search_t_connect">服务标题</td>
			   <td colspan="3" style="padding-left:10px;">${ordServiceInfo.itemTitle}</td>
			</tr>
	    	<tr>
	        	<td class="Search_t_connect">申请方</td>
	            <td style="padding-left:10px;">${ordServiceInfo.orgName}</td>
	            <td class="Search_t_connect">服务方</td>
				<td class="Search_t_connect01">${ordServiceInfo.vendorName}</td>
	        </tr>
	        <tr>
				<td class="Search_t_connect">申请日期</td>
				<td class="Search_t_connect01"><s:date name="ordServiceInfo.applyDate"/> </td>
				<td  class="Search_t_connect">申请人</td>
				<td class="Search_t_connect01">${ordServiceInfo.contactName}</td>
			</tr>
			<tr>
				<td  class="Search_t_connect">服务类型</td>
				<td class="Search_t_connect01">${ordServiceInfo.itemTypeName}</td>
				<td  class="Search_t_connect">订单状态</td>
				<td class="Search_t_connect01">
					<s:if test="ordServiceInfo.status==0">
		          		待确认
		          	</s:if>
		          	<s:if test="ordServiceInfo.status==-1">
		          		已拒绝
		          	</s:if>
		          	<s:if test="ordServiceInfo.status==1">
		          		已受理
		          	</s:if>
				</td>
			</tr>
        </table>
        <div class="hr_10"> &nbsp; </div>
       
        <!--表格部分结束-->
      <div class="hr_10"> &nbsp; </div>
        <div><img src="/images/img_lc.jpg" /></div>
    </div>
  	<div class="M_out_right fr">
    	<img src="/images/nsbank.png" style="margin-bottom:10px;"/>
    </div>
    <div class="M_out_right_text fr">
    	<h1>热门理财产品</h1>
        <div class="box_3">
          <ul class="new_li">
             <s:iterator id="item" value="bankFinanceRecommendationList">
                 <li><a target="_blank" href="/finance/bankProduct!showDetails.act?id=${item.prodId}">${item.title }</a></li>
             </s:iterator>
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
