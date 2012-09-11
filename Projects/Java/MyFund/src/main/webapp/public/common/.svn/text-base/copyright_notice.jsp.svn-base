<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.zj198.model.UsrUser"  %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>版权声明_中国资金网</title>
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
  	<a href="/Index.act">首页</a>&nbsp;&nbsp;<b>	&gt;</b>&nbsp;&nbsp;<a href="/news/InfoCenter.act">信息中心</a>&nbsp;&nbsp;<b>	&gt;</b>&nbsp;&nbsp;<a href="/public/common/copyright_notice.jsp">版权声明</a>
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
				<h5>版权声明</h5>
				<hr style="width:100%;"/>
				<div class="hr_20"> &nbsp;</div>
				<div class="txt_content_new">
					<p>中国资金网（www.zj198.com）由鼎辉信息技术（上海）有限公司负责独立运营并提供技术和服务支持。为了保护版权人的合法权益，根据《中华人民共和国著作权法》等法律规定，中国资金网作出如下版权声明： </p>　
		            <p>中国资金网的内容，包括但不限于文字、LOGO商标、图表图片、设计等由鼎辉信息技术（上海）有限公司完成，以上作品的著作权利属于该公司。</p>
		            <p>未经版权人许可，任何个人或组织不得对中国资金网内容进行复制、传播、转载、展示或是将其用于任何商业目的。</p>
					<p>中国资金网用户发表、转载的所有文章及其它资料（如示例代码、图片等）的版权归原作者所有，中国资金网用户同时保证上传、转载、发表的内容不侵犯他人版权，本网站保有使用权。其他任何单位或个人转载中国资金网发表的文章的，需经原作者同意，并注明转载自中国资金网。本网站保留追究非法转载者法律责任的权利。 </p>
		            <p>任何单位或个人认为本网站网页内容（包括但不限于本网各会员发布的供求信息、招聘信息等）可能涉嫌侵犯其信息网络传播权，应该及时向本网站提出书面的权利通知（通知地址请见本网站页面上公布的联系地址、电话），并提供身份证明、权属证明及详细侵权情况证明。本网站在收到上述法律文件后将会根据中国法律法规和政府规范性文件采取尽快核实有关内容并移除相关涉嫌侵权的内容或屏蔽相关链接。</p>　　
				</div>
			</div>
        </div>
      <div class="hr_10"> &nbsp; </div>
    </div>
	<!--右边-->
  </div>    
  <!--关于我们页面--> 
<div class="clear"> &nbsp; </div>
<div class="hr_20"> &nbsp; </div>
<!--foot-->
<jsp:include page="/public/bottom.jsp" />
<!--foot-->
</body>
</html>
