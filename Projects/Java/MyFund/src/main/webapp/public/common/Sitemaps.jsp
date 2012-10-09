<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.zj198.model.UsrUser"  %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>网站地图_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/public2.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/public.js" > </script>
<script language="javascript">
//通用选项卡
$(document).ready(function() {
    $('.xxkbox:gt(0)').hide(); //让从大于0开始的div都隐藏 
    $('.first').show(); //让从第二个选项卡开始，选项卡中的第一个xxkbox显示出来，以便于页面多次使用； 
    var sb = $('.tab_menu ul li');
    sb.hover(function() {
        $(this).addClass('hover').siblings().removeClass();
        var nb = sb.index(this);
        $('.xxkbox').eq(nb).show().siblings().hide();
    });
    //} 
});
</script>

</head>

<body>
<!--头部-->
<div class="header user_header2 reg_header">
<div class="container_960 top">
    <div class="fl logo">
      <h1><a href="/Index.act">中国资金网</a></h1>
    </div>
    <div class="fr logo_r">
      <div class="hr_10"> &nbsp; </div>
      <div class="user_menu">
      <% if(request.getSession().getAttribute("_user")!=null){ %>
      <%=((UsrUser)request.getSession().getAttribute("_user")).getRealname()%>
      	 您好，欢迎来到中国资金网！ | <a href="/Account!logout.act"> 退出</a>
      <%}else{ %>
        <a href="/Account.act"> 登录</a><a href="/Register.act">注册</a>
      <%} %> | <font color="#555"><a href="/user/UserAction.act">用户中心</a></font>
      </div>
      <div class="hr_10"> &nbsp; </div>
      <div class="pic_logo_r fr"><img src="/images/logo_right_pic.jpg" alt="" /></div>
    </div>
    <div class="clear"> &nbsp; </div>
  </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--头部结束-->
  <!--关于我们页面-->
  <div class="M_menu">
  	<a href="/Index.act">首页</a>&nbsp;&nbsp;<b>	&gt;</b>&nbsp;&nbsp;<a href="/news/InfoCenter.act">信息中心</a>&nbsp;&nbsp;<b>	&gt;</b>&nbsp;&nbsp;<a href="/public/common/about_us.jsp">关于我们</a>
  </div>
  <div class="hr_10"> &nbsp; </div> 
  <div class="M_out">
    <div class="M_out_right_text fl">
    	<h1 style="padding-left: 5px;">中国资金网</h1>
        <div class="box_5" >
          <p class="about_list" ><a href="/public/common/about_us.jsp">关于我们</a></p>
          <hr width="100%"/>
          <p class="about_list" ><a href="/public/common/copyright_notice.jsp">版权声明</a></p>
          <hr width="100%"/>
          <p class="about_list" ><a href="/public/common/disclaimer.jsp">免责声明</a></p>
          <hr width="100%"/>
          <p class="about_list" ><a href="/public/common/friend_link.jsp">友情链接</a></p>
          <hr width="100%"/>
          <p class="about_list" ><a href="/public/common/Sitemaps.jsp">网站地图</a></p>
          <hr width="100%"/>
          <p class="about_list" ><a href="#">用户帮助</a></p>
        </div>
    </div>
	<!--右边-->
  	<div class="fr">
        <div style="width:708px; height:auto;">
			<div class="box_5">
				<h5>网站地图</h5>
				<hr style="width:100%;"/>
				<div class="hr_20"> &nbsp;</div>
				<table border="0" cellspacing="0" cellpadding="0" class="map_connect">
				  <tr>
				    <td colspan="6" class="map_title"><a href="/Index.act">首页</a></td>
				  </tr>
				  <tr>
				    <td><a href="/loan/LoanRequest.act?loan.applyType=136">融资意向快速申请</a></td>
				    <td><a href="#">融资工具</a></td>
				    <td><a href="/news/Info!infoGroup.act?typeId=2">融资案例</a></td>
				    <td><a href="/loan/financeProduct.act">热门融资产品</a></td>
				    <td><a href="/finance/bankProduct!getList.act">热门理财产品</a></td>
				    <td><a href="/service/serviceItem!showHome.act">热门服务</a></td>
				  </tr>
				  <tr>
				    <td><a href="/news/Info!infoGroup.act?typeId=3">政策走势</a></td>
				    <td><a href="/news/Info!infoGroup.act?typeId=4">金融快讯</a></td>
				    <td><a href="/news/Info!infoGroup.act?typeId=5">本站动态</a></td>
				    <td colspan="3"><a href="/user/UserAction.act">用户中心</a></td>
				  </tr>				 
				</table>
				<table border="0" cellspacing="0" cellpadding="0" class="map_connect">
				  <tr>&nbsp;</tr>
				  <tr>
				    <td colspan="6" class="map_title"><a href="/loan/LoanService.act">融资服务</a></td>
				  </tr>
				  <tr>
				    <td><a href="/loan/financeProduct.act">融资产品搜索</a></td>
				    <td><a href="#">融资俱乐部</a></td>
				    <td><a href="/loan/financeProduct.act">热门融资产品</a></td>
				    <td><a href="/service/serviceItem!showHome.act">热门服务</a></td>
				    <td><a href="/news/Info!infoGroup.act?typeId=6">融资资讯</a></td>
				    <td><a href="/news/Info!infoGroup.act?typeId=19">融资指南</a></td>
				  </tr>
				</table>
				<table border="0" cellspacing="0" cellpadding="0" class="map_connect">
				  <tr>&nbsp;</tr>
				  <tr>
				    <td colspan="6" class="map_title"><a href="/finance/financeProduct.act">理财服务</a></td>
				  </tr>
				  <tr>
				    <td><a href="/finance/bankProduct!search.act">理财产品搜索</a></td>
				    <td><a href="/finance/bankProduct!search.act">银行理财产品</a></td>
				    <td><a href="/finance/bankProduct!search.act">热门理财产品</a></td>
				    <td><a href="#">理财工具</a></td>
				    <td><a href="/news/Info!infoGroup.act?typeId=7">理财资讯</a></td>
				    <td>&nbsp;</td>
				  </tr>
				</table>
				<table border="0" cellspacing="0" cellpadding="0" class="map_connect">
				  <tr>&nbsp;</tr>
				  <tr>
				    <td colspan="6" class="map_title"><a href="/news/InfoCenter.act">信息中心</a></td>
				  </tr>
				  <tr>
				    <td><a href="/news/Info!infoGroup.act?typeId=3">政策走势</a></td>
				    <td><a href="/news/Info!infoGroup.act?typeId=4">金融快讯</a></td>
				    <td><a href="/news/Info!infoGroup.act?typeId=5">本站动态</a></td>
				    <td><a href="#">金融黄页</a></td>
				    <td><a href="/news/Info.act?id=107">金融百科</a></td>
				    <td><a href="/news/Info.act?id=111">用户指南</a></td>
				  </tr>
				</table> 														
			</div>
        </div>
      <div class="hr_10"> &nbsp; </div>
    </div>
	<!--右边-->
  </div>    
  <!--关于我们页面--> 
<!--foot-->
<jsp:include page="/public/bottom.jsp" />
<!--foot-->
</body>
</html>
