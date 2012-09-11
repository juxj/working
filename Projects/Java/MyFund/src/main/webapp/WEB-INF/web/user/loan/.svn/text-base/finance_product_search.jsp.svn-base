<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>产品查询</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript">
    $(function() {
        var index = 0;
		showImg(index);//初始化
        $(".focus .btn span").mouseover(function() {
            index = $(".focus .btn span").index(this);
            showImg(index);
        });
        //滑入停止动画，滑出开始动画.
        $('.focus').hover(function() {
            if (MyTime) {
                clearInterval(MyTime);
            }
        },function() {
            MyTime = setInterval(function() {
                showImg(index);
				index++;
                if (index == 3) {
                    index = 0;
                }
            },3000);
        });
        //自动开始
        var MyTime = setInterval(function() {
            showImg(index);
			 index++;
            if (index == 3) {
                index = 0;
            }
        },3000);
    })
    //关键函数：通过控制i，来显示不同的幻灯片
    function showImg(i) {
        $(".img img").eq(i).stop(true, true).fadeIn(800).parent().siblings().find("img").hide();
        $(".btn span").eq(i).addClass("hov").siblings().removeClass("hov");
    }

	function doQuery(pageNo) {
		document.getElementById("pageNo").value = pageNo;
		form = document.getElementById("frmproductManage");
		form.submit();
	}
	function search(){
		document.getElementById("financeBigamount").value = $('#financeLittleamount').val();
		document.getElementById("financeMostdt").value = $('#financeLittledt').val();
		var form = document.getElementById("searchForm");
		form.submit();
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
<!--头部结束-->
  <!--理财服务产品列表页面开始-->
  <div class="M_menu">
  	<a href="#">首页</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;<a href="#">融资管理</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;<a href="#">搜索融资产品</a>
  </div>
  <div class="M_menu" style="margin-top: 20px; height: 150px;">
  <form id="searchForm" action="/user/loan/financeProduct.act" method="post">
    <input name="product.financeBigamount" type="hidden" id="financeBigamount"/>
    <input name="product.financeMostdt" type="hidden" id="financeMostdt"/>
	<table style="margin-top: 20px;">
		<tr>
			<td width="25%" align="right">贷款用途:</td>
			<td width="25%" style="padding:5px;"><s:textfield name="product.purposeType"/></td>
			<td width="25%" align="right">贷款金额:</td>
			<td width="25%" style="padding:5px;"><s:textfield id="financeLittleamount" name="product.financeLittleamount"/></td>
		</tr>
		<tr>
			<td width="25%" align="right">贷款期限:</td>
			<td width="25%" style="padding:5px;"><s:textfield id="financeLittledt" name="product.financeLittledt"/></td>
			<td width="25%" align="right">贷款类型:</td>
			<td width="25%" style="padding:5px;"><s:textfield id="financeType" name="product.financeType"/></td>
		</tr>
		<tr>
			<td colspan="4" align="center"><input type="button" onclick="search()" value="搜索" style="width:100px;"/></td>
		</tr>
	</table>
	</form>
  </div>
  <!--理财服务产品列表页面结束--> 
<div class="clear"> &nbsp; </div>
<div class="hr_20"> &nbsp; </div>
<!--foot-->
<jsp:include page="/public/bottom.jsp" />
<!--foot-->
</body>
</html>
