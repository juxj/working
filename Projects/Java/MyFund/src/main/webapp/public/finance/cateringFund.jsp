<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>融资餐饮基金页_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/public.js" > </script>
<script type="text/javascript" src="/script/load-finance.js" > </script>
<script language="javascript">
//通用选项卡(控制head)
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
<div class="header index_header">
<jsp:include page="/public/head1.jsp"/>
  <div class="clear"> &nbsp; </div>
</div>
<!--头部-->
<!--餐饮页面-->
<div class="container_950">
	<img src="/images/cy_01_s1.jpg" /><img src="/images/cy_02_s1.jpg" /><img src="/images/cy_03_s1.jpg" /><img src="/images/cy_04_s1.jpg" /><a href="/loan/financeProduct!cusViewFinance.act?product.id=17"><img src="/images/cy_05_s1.jpg" /></a><img src="/images/cy_06_s1.jpg" />
</div>
<!--餐饮页面-->
<div class="clear"> &nbsp; </div>
<!--footer-->
<jsp:include page="/public/bottom.jsp" />
<!--footer-->
</body>
</html>