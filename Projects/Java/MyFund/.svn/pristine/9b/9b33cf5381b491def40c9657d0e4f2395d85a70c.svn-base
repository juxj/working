<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.zj198.model.UsrUser"  %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>友情链接_中国资金网</title>
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
				<h5>友情链接</h5>
				<hr style="width:100%;"/>
				<div class="hr_10">&nbsp;</div>
				<table border="0" cellspacing="0" cellpadding="0" class="map_connect">
				  <tr>
				    <td colspan="6" class="map_title">图片链接</td>
				  </tr>
				  <tr>
				    <td><a href=""><img src="/images/linkimg/icbc.png" /></a></td>
				    <td><a href=""><img src="/images/linkimg/ccb.png" /></a></td>
				    <td><a href=""><img src="/images/linkimg/boc.png" /></a></td>
				    <td><a href=""><img src="/images/linkimg/abc.png" /></a></td>
				    <td colspan="2"><a href=""><img src="/images/linkimg/bankcomm.png" /></a></td>
				  </tr>
				  <tr>
				    <td><a href=""><img src="/images/linkimg/bos.png" /></a></td>				  
				    <td><a href=""><img src="/images/linkimg/sdb.png" /></a></td>
				    <td><a href=""><img src="/images/linkimg/cmb.png" /></a></td>
				    <td><a href=""><img src="/images/linkimg/hxb.png" /></a></td>
				    <td colspan="2"><a href=""><img src="/images/linkimg/cib.png" /></a></td>
				  </tr>
				  <tr>
				    <td><a href=""><img src="/images/linkimg/ecitic.png" /></a></td>				  
				    <td><a href=""><img src="/images/linkimg/gzcb.png" /></a></td>
				    <td><a href=""><img src="/images/linkimg/njcb.png" /></a></td>
				    <td colspan="3"><a href="http://www.chinabaohan.com/" target="_blank"/><img src="/images/linkimg/bhw.png" /></a></td>
				  </tr>				  
				</table>
				<table border="0" cellspacing="0" cellpadding="0" class="map_connect">
				  <tr>
				    <td colspan="8" class="map_title">文字链接</td>
				  </tr>
				  <tr>
				    <td><a href="http://www.bankhr.com/" target="_blank">金融英才</a></td>
				    <td><a href="http://mmm.zgjrw.com/" target="_blank" rel="nofollow">中国金融</a></td>
				    <td><a href="http://www.bankrate.com.cn/cms/calc_list.php" target="_blank">房贷计算器</a></td>
				    <td><a href="http://rent.gz.soufun.com" target="_blank" rel="nofollow">广州租房</a></td>
				    <td><a href="http://www.zj198.com/daikuan/fengxiantouzi.html" target="_blank">风险投资</a></td>
				    <td><a href="http://www.zj198.com/gxyxinvest/jiedai.html" target="_blank">借贷</a></td>
				    <td><a href="http://www.ajsc.cn/" target="_blank" rel="nofollow">爱家收藏</a></td>
				    <td><a href="http://www.zj198.com/daikuan/jiekuan.html" target="_blank">短期借款</a></td>
				  </tr>
				  <tr>
				    <td><a href="http://www.zj198.com/daikuan/diandang.html" target="_blank">上海典当行</a></td>				  
				    <td><a href="http://www.yonghua.net/" target="_blank" rel="nofollow">勇华股票投资</a></td>
				    <td><a href="http://www.jsinvest.com/" target="_blank">江苏投资</a></td>
				    <td><a href="http://www.hsbc.com.cn/1/2/" target="_blank">汇丰中国银行</a></td>
				    <td><a href="http://www.zj198.com/daikuan/shanghaidaikuan.html" target="_blank" title="上海贷款">上海贷款</a></td>
				    <td><a href="http://www.zj198.com/daikuan/" target="_blank" title="贷款">贷款</a></td>
				    <td><a href="http://www.zj198.com/gxyxexp/trust.htm" target="_blank">委托融资</a></td>
				    <td><a href="http://www.zj198.com/daikuan/guoqiaozijin.html" target="_blank">过桥资金</a></td>
				  </tr>
				  <tr>
				    <td><a href="http://www.zj198.com/daikuan/qiyedaikuan.html" target="_blank" title="企业贷款"> 企业贷款</a></td>
				    <td><a href="http://www.zj198.com/daikuan/wudiyadaikuan.html" target="_blank" title="无抵押贷款">无抵押贷款</a></td>
				    <td><a href="http://www.vip168168.com/" target="_blank">慧股时空网</a></td>
				    <td><a href="http://www.amoney.com.cn/" target="_blank">第一理财网</a></td>
				    <td colspan="3"><a href="http://www.smeclub.org/">上海企福汇俱乐部</a></td>				  
				  </tr>				  
				</table>
				<table border="0" cellspacing="0" cellpadding="0">
				  <tr>
				    <td class="map_title">链接说明</td>
				  </tr>
				  <tr>
				    <td>1、申请网站必须内容合法、健康、充实、无作弊、金融行业相关网站！</td>
				  </tr>
				  <tr>
				    <td>2、链接网站需有自己的特色和内容，更新及时，PR值≥4。</td>
				  </tr>	
				  <tr>
				    <td>3、申请前请先做好本站链接，如果本站未通过您的请求，您可以去掉我方链接;</td>
				  </tr>
				  <tr>
				    <td>4、联系电话：400-8890-198 Email:zj198@zj198.com</td>
				  </tr>	
				  <tr>
				    <td>我站链接信息：</td>
				  </tr>
				  <tr>
				    <td>1、链接文本：中国资金网</td>
				  </tr>
				  <tr>
				    <td>2、链接提示：国内最大的资金信息提供运营商</td>
				  </tr>
				  <tr>
				    <td>3、Logo地址：(88*31) http://www.zj198.com/images/logo1.png</td>
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
