<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.zj198.model.UsrUser"  %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>关于我们_中国资金网</title>
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
				<h5>关于我们</h5>
				<hr style="width:100%;"/>
				<div class="hr_20"> &nbsp;</div>
				<div class="txt_content_new">
					<p >中国资金网是中国领先的第三方金融服务电子平台，致力于为中小企业服务，打造以资金信息为核心，集融资、投资理财为一体的金融服务中间平台。</p>
		            <p >中国资金网由上海鼎辉投资管理有限公司投资，总部位于上海浦东金融中心，由鼎辉信息技术（上海）有限公司独立专业运营。</p>
		            <p >中国资金网集聚众多的金融产品和企业需求信息，我们为金融机构和企业搭建一个高效的中间平台，快速促成资金方和需求方的有效对接，成为连接全国金融机构投资者和融资者的强大桥梁和纽带，打造资本合理流通与资源合理配置的优秀第三方金融服务平台。</p>
		            <p >中国资金网拥有经验丰富的专业团队，为客户提供最优质的融资理财中间服务，提高融资理财效率，为客户降低成本，尽心服务每一位客户，支援企业快速发展!</p>　　
	            	<p >我们的服务：</p>
	            	<p >企业融资服务（企业融资评估服务、融资配套服务）</p>
	            	<p >创新行业基金</p>
	            	<p >企业/个人理财服务</p>
	            	<p >企业增值服务</p>
				</div>
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
