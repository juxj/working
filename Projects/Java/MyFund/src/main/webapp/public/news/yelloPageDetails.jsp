<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@taglib prefix="common" uri="/Common"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>信息中心_金融黄页详情页_中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/public.js" > </script>
<script type="text/javascript" src="/script/load-news.js" > </script>
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
    $(function(){
    	var sb = $(".box_3 ul li");
    	sb.click(function() {
    		$(this).addClass('sel').siblings().removeClass();
    		var h = $(".box_3 ul li[class=sel]").html();
    		$.post("/news/yellowPage!appendToIndex2.act",{type:this.value},function(data){
            	$("#table").html(data);
            	$("#titles").html(h);
            });
    	});
    });
</script>
<style>
.sel {	background: #97181d; }
</style>
</head>

<body>
<!--头部-->
	<div class="header index_header"><jsp:include page="/public/head1.jsp" /></div>
	<div class="clear"> &nbsp; </div><div class="hr_10"> &nbsp; </div> 
<!--头部结束-->
  <!--信息中心金融黄页详情页-->
  <div class="M_menu">
  	<a href="/news/InfoCenter.act">信息中心</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;金融黄页
  </div>
  <div class="hr_10"> &nbsp; </div> 
  <div class="M_out">
	<!--左边-->
  	<div class="M_out_L">
        <div style="width:708px; height:auto; border:1px solid #d3d3d3;">
			<div style="width:660px; margin: 0 auto; margin-top: 25px; margin-bottom: 25px;">
				<h2 style="border-bottom:1px solid #d3d3d3; padding-bottom: 20px;" id="titles"><common:print valueId="type" /> </h2>
				<div id="table" style="padding-top: 10px;">
				<jsp:include page="/public/news/yelloPage.jsp"/>
				</div>
			</div>
        </div>
      <div class="hr_10"> &nbsp; </div>
    </div>
	<!--左边-->
    <div class="M_out_right_text fr">
    	<h1 style="padding-left: 5px;">金融黄页</h1>
        <div class="box_3">
          <ul class="new_li">
          	<s:iterator value="commons">
            <li value="${id }" style="background: none;" <s:if test="id==type">class="sel"</s:if>><a href="javascript:void(0);">${name}</a></li>
            </s:iterator>
          </ul>
        </div>
    </div>
  </div>    
  <!--信息中心金融黄页详情页--> 
<div class="clear"> &nbsp; </div>
<div class="hr_20"> &nbsp; </div>
<!--foot-->
	<jsp:include page="/public/bottom.jsp" />
<!--foot-->
</body>
</html>
