<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>融资服务_中国资金网</title>
<meta name="keywords" content=""/>
<meta name="description" content=""/>
<link href="/favicon.ico" rel="icon" type="image/x-icon" />
<link href="/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link href="/favicon.ico" rel="bookmark" type="image/x-icon" />
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/index.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
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

//通用选项卡2
$(document).ready(function() {
    $('.xxkbox2:gt(0)').hide(); //让从大于0开始的div都隐藏 
    $('.first2').show(); //让从第二个选项卡开始，选项卡中的第一个xxkbox显示出来，以便于页面多次使用； 
    var sb = $('.tab_menu2 ul li');
    sb.click(function() {
        $(this).addClass('hover').siblings().removeClass();
        var nb = sb.index(this);
        $('.xxkbox2').eq(nb).show().siblings().hide();
    });
    //} 
});

//文本框触发焦点效果s
$(function() {
    $(".input-text,textarea").focus(function() {
        $(this).addClass("input-focus");
    }).blur(function() {
        $(this).removeClass("input-focus");
    })
})
</script>

<style>
.focus { position:relative; width:708px; height:293px; overflow:hidden; }
.focus img.img { width:708px; height:293px; display:none; }
.focus img.img a { position:absolute; top:0; display:block; }
.focus .btn { position:absolute; z-index:100; bottom:5px; right:5px; }
.focus .btn span { float:left; text-align:center; background:#fff; cursor:pointer; width:16px; height:16px; line-height:16px; margin:3px 2px 0 2px; border:1px solid #fff; color:#9b0583; font-family:Arial; font-size:0.9em; }
.focus .btn span.hov { width:21px; height:21px; margin:0 2px; font-weight:bold; font-size:1.4em; background:#97181d; line-height:21px; border:1px solid #fff; color:#fff; }
</style>
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
</script>
</head>

<body>
<!--头部-->
<div class="header index_header">
  <div class="container_960 top">
    <div class="fl logo">
      <h1><a  href="http://www.zj198.com">中国资金网</a></h1>
    </div>
    <div class="fr logo_r">
      <div class="hr_10"> &nbsp; </div>
      <div class="user_menu"><a href="user_login.html">登录</a> <a href="reg.html">注册</a> <a class="home_page" href="reg.html">网站首页</a></div>
      <div class="hr_10"> &nbsp; </div>
      <div class="pic_logo_r fr"><img src="/images/logo_right_pic.jpg" /></div>
    </div>
    <div class="clear"> &nbsp; </div>
  </div>
  <div class="container_960">
    <div class="tab_menu index_nav">
      <ul>
        <li><a href="/">首 页</a></li>
        <li><a href="/">融资服务</a></li>
        <li class="hover"><a href="/">理财产品</a></li>
        <li><a href="/">增值服务</a></li>
        <li><a href="/">资 讯</a></li>
        <li><a href="/">帮助中心</a></li>
      </ul>
    </div>
    <div class="clear"> &nbsp; </div>
    <div class="index_subnav">
      <div class="xxkbox"> <font class="fl" style="line-height:36px; font-weight:bold;">网站公告：</font>
        <ul class="fl" id="IssueList" style="height:24px;line-height:24px;overflow:hidden; margin-top:6px;width:800px;">
          <li><a href='' title="2011年上海市国民经济和社会发展统计公报">2011年上海市国民经济和社会上海市国民经济和社上海市国民经济和社展统计公海市国民经济和社展统计公海市国民经国民经济和社展统计公报</a></li>
          <li><a href='' title="上海市事业单位2012年公开招聘笔试成绩查询及最低合格分数线公告">上海市事业单位2012上海市国民经济和社上海市国民经济和社年公开招聘笔试成绩查</a></li>
          <li><a href='' title="上海市人民代表大会常务委员会关于接受朱建业、邱鲁军辞去有关职务的请求的决定">上海市人上海市国民经济和社上海市国民经济和社民代表大会常务委员会关于接受</a></li>
          <li><a href='' title="上海市人民代表大会常务委员会公告(第7号)">上海市人民代表大会常务委上海市国民经济和社上海市国民经济和社员会公告(第</a></li>
          <li><a href='' title="上海市人民代表大会常务委员会公告(第8号)">上海市人民代表大会常务委上海市国民经济和社上海市国民经济和社员会公告(第</a></li>
          <li><a href='' title="上海市人民代表大会常务委员会公告(第9号)">上海市人民代表大会常务委上海市国民经济和社上海市国民经济和社员会公告(第</a></li>
        </ul>
<script type=text/javascript>
<!--
function Scroll(ul, delay, speed, lineHeight) { 
var slideBox = (typeof ul == 'string')?document.getElementById(ul):ul; 
var delay = delay||1000; 
var speed=speed||20; 
var lineHeight = lineHeight||24; 
    var tid = null, pause = false; 
    var start = function() { 
     tid=setInterval(slide, speed); 
    } 
    var slide = function() { 
     if (pause) return; 
     slideBox.scrollTop += 2; 
     if (slideBox.scrollTop % lineHeight == 0) { 
         clearInterval(tid); 
         slideBox.appendChild(slideBox.getElementsByTagName('li')[0]); 
         slideBox.scrollTop = 0; 
         setTimeout(start, delay); 
        } 
    } 
    slideBox.onmouseover=function(){pause=true;} 
    slideBox.onmouseout=function(){pause=false;} 
    setTimeout(start, 2000); 
} 
-->
</script> 
        <script language="JavaScript" type="text/javascript">Scroll('IssueList', 2000, 32, 24);//停留时间，相对速度（越小越快）,每次滚动多少，最好和Li的Line-height一致。</script> 
      </div>
      <div class="xxkbox"><a href="">企业融资贷款</a> | <a href="">个人消费贷款</a> | <a href="">个人经营贷款</a></div>
      <div class="xxkbox"><a href="">基金</a> | <a href="">股票</a> | <a href="">期货</a> | <a href="">银行产品</a></div>
      <div class="xxkbox"><a href="">B2C交易平台</a> | <a href="">资金管理</a> | <a href="">其他服务</a></div>
      <div class="xxkbox"><a href="">政府动态</a> | <a href="">金融资讯</a> | <a href="">中国资金网动态</a></div>
      <div class="xxkbox"><a href="">融资指南</a> | <a href="">法律政策</a> | <a href="">会员条款</a> | <a href="">申请流程</a></div>
    </div>
  </div>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>

<!--主体部分开始-->
<!--tab-->
<div style="width:950px; margin:0 auto;">
	<div style="width:630px; height:1000px; float:left;">
    <div class="center" style="width:630px; height:358px; float:left; border : #d6d6d6 solid 1px;">
      <div class="gray news_menu tab_menu2">
        <ul>
          <li class="hover" >企业基本信息</li>
          <li>企业法人信息</li>
        </ul>
      </div>
      <div class="hr_10"> &nbsp; </div>
      <div class="hr_10"> &nbsp; </div>
      <div class="xxkContent">
        <div class="xxkbox2" >
          <form class="box_form" action="/member.html">
            <dl>
              <dd>
                <h6><span class="txt-impt">*</span>贷款类别：</h6>
                <select name="" style="width:198px;">
                  <option value="" selected="selected">请选择</option>
                  <option value="企业经营性贷款">企业经营性贷款</option>
                </select>
              </dd>
              <dd>
                <h6>贷款用途：</h6>
                <select name="" style="width:198px;">
                  <option value="" selected="selected">请选择</option>
                  <option value="企业经营性贷款">企业经营贷款</option>
                </select>
              </dd>
              <dd>
                <h6>贷款金额：</h6>
                <input type=text value="" class="input-text" />万元
              </dd>
              <dd>
                <h6>贷款期限：</h6>
                <input type=text value="" class="input-text" />个月
              </dd>
              <dd>
              <h6>是否有抵押物：</h6>
              <input name="" type="radio" value="" />能提供
              <input name="" type="radio" value="" />无法提供
              </dd>
            <div style="margin-left:170px; margin-top:20px;">
              <input type="button" onfocus="this.blur()" onclick="this.form.submit()" class="but_gray" style="width:200px;" value="搜素" />
            </div>              
            <div class="hr_10"> &nbsp; </div>
          </form>
        </div>
        <div class="xxkbox2">
          <form class="box_form" action="/member.html">
            <dl>
              <dd>
                <h6><span class="txt-impt">*</span>11111贷款类别：</h6>
                <select name="" style="width:198px;">
                  <option value="" selected="selected">请选择</option>
                  <option value="企业经营性贷款">企业经营性贷款</option>
                </select>
              </dd>
              <dd>
                <h6>贷款用途：</h6>
                <select name="" style="width:198px;">
                  <option value="" selected="selected">请选择</option>
                  <option value="企业经营性贷款">企业经营性贷款</option>
                </select>
              </dd>
              <dd>
                <h6>贷款金额：</h6>
                <input type=text value="" class="input-text" />万元
              </dd>
              <dd>
                <h6>贷款期限：</h6>
                <input type=text value="" class="input-text" />个月
              </dd>
              <dd>
              <h6>是否有抵押物：</h6>
              <input name="" type="radio" value="" />能提供
              <input name="" type="radio" value="" />无法提供
              </dd>
            <div class="center" style="margin-left:170px; margin-top:20px;">
              <input type="button" onfocus="this.blur()" onclick="this.form.submit()" class="but_gray" style="width:200px;" value="搜素" />
            </div>              
            <div class="hr_10"> &nbsp; </div>
          </form>        
        </div>        
      </div>
      <div class="hr_10"> &nbsp; </div>
      <!--热门融资产品-->
    <div class="grid_350 fl">
      <div class="menu_red white"><span class="fr white"><a href="">更多»</a></span>
        <h6 class="white_dot">热门融资产品</h6>
      </div>
      <div class="box_3" style="overflow:auto; height:auto; width: 628px">
        <div class="hr_10"> &nbsp; </div>
        <div class="hr_10"> &nbsp; </div>
        <div class="qyrz-top">
        	<table class="qyrz-top_table">
              <tr>
                <td><img src="/images/icons/zg_icon.jpg" /></td>
                <td class="hot_connect">中国银行&nbsp;&nbsp;&nbsp;无担保贷款</td>
              </tr>
              <tr>
                <td><img src="/images/icons/js_icon.jpg" /></td>
                <td class="hot_connect">建设银行上海分行&nbsp;&nbsp;&nbsp;中小企业无抵押速贷</td>
              </tr>
              <tr>
                <td><img src="/images/icons/pa_icon.jpg" /></td>
                <td class="hot_connect">平安银行&nbsp;&nbsp;&nbsp;信用贷款最高500万</td>
              </tr>
              <tr>
                <td><img src="/images/icons/hq_icon.jpg" /></td>
                <td class="hot_connect">花旗银行&nbsp;&nbsp;&nbsp;小企业生产经营性贷款</td>
              </tr>
              <tr>
                <td><img src="/images/icons/hq_icon.jpg" /></td>
                <td class="hot_connect">花旗银行&nbsp;&nbsp;&nbsp;小企业生产经营性贷款</td>
              </tr> 
            </table>
        </div>
        <div class="hr_10"> &nbsp; </div>
      </div>
    </div>
      <!--热门融资产品-->
   <div class="hr_10"> &nbsp; </div>   
    <!--热门融资产品-->
    <div class="grid_350 fl">
      <div class="menu_red white"><span class="fr white"><a href="">更多»</a></span>
        <h6 class="white_dot">热门融资服务</h6>
      </div>
     <div class="box_3" style="overflow:auto; height:auto; width: 628px">
        <div class="hr_10"> &nbsp; </div>
        <div class="hr_10"> &nbsp; </div>
        <div class="qyrz-top">
        	<table class="qyrz-top_table">
              <tr>
                <td><img src="/images/icons/zg_icon.jpg" /></td>
                <td class="hot_connect">中国银行&nbsp;&nbsp;&nbsp;无担保贷款</td>
              </tr>
              <tr>
                <td><img src="/images/icons/js_icon.jpg" /></td>
                <td class="hot_connect">建设银行上海分行&nbsp;&nbsp;&nbsp;中小企业无抵押速贷</td>
              </tr>
              <tr>
                <td><img src="/images/icons/pa_icon.jpg" /></td>
                <td class="hot_connect">平安银行&nbsp;&nbsp;&nbsp;信用贷款最高500万</td>
              </tr>
              <tr>
                <td><img src="/images/icons/hq_icon.jpg" /></td>
                <td class="hot_connect">花旗银行&nbsp;&nbsp;&nbsp;小企业生产经营性贷款</td>
              </tr>
              <tr>
                <td><img src="/images/icons/hq_icon.jpg" /></td>
                <td class="hot_connect">花旗银行&nbsp;&nbsp;&nbsp;小企业生产经营性贷款</td>
              </tr> 
            </table>
        </div>
        <div class="hr_10"> &nbsp; </div>
      </div>
      <div class="hr_10"> &nbsp; </div>
<!--news-->
    <div class="grid_350 box_4 fl" style="width:308px;height:134px; overflow:hidden; float:left; margin-right:10px;">
      <div class="menu_red white grid_350" style="width:308px; border-bottom:1px solid #d7d7d7; background-color:#f9f9f7; color:#000;"><span class="fr"><a href="" style="color:#000;">更多»</a></span>
      	<h6 style="font-weight:bolder">融资资讯</h6>
      </div>
      <div class="xxkContent">
      	<s:iterator value="newsGroupTitles" id="list" status="st">
      		<s:if test="#st.first">
       	  		<ul class="xxkbox first new_li">
       	  			<s:iterator value="#list" id="item">
			          <li><a href="/news/knwContent!showHome.act?titleId=${item.id}">${item.title}</a></li>
		          	</s:iterator>
		        </ul>
       	  	</s:if>
			<s:else>
				 <ul class="xxkbox new_li">
		          	<s:iterator value="#list" id="item">
			          <li><a href="/news/knwContent!showHome.act?titleId=${item.id}">${item.title}</a></li>
		          	<href="/news/knwTitle!showDetail.act:else>
      	</s:iterator>
      </div>
    </div>
<!--news-->

<!--news-->
    <div class="grid_350 box_4 fl" style="width:308px;height:134px; overflow:hidden;">
      <div class="menu_red white grid_350" style="width:308px; href="/news/knwTitle!showDetail.actckground-color:#f9f9f7; color:#000;"><span class="fr"><a href="" style="color:#000;">更多»</a></span>
      	<h6 style="font-weight:bolder">融资指南</h6>
      </div>
      <div class="xxkContent">
      	<s:iterator value="newsGroupTitles" id="list" status="st">
      		<s:if test="#st.first">
       	  		<ul class="xxkbox first new_li">
       	  			<s:iterator value="#list" id="item">
			          <li><a href="/news/knwContent!showHome.act?titleId=${item.id}">${item.title}</a></li>
		          	</s:iterator>
		        </ul>
       	  	</s:if>
			<s:else>
				 <ul class="xxkbox new_li">
		          	<s:iterator value="#list" id="item">
			          <li><a href="/news/knwContent!showHome.act?titleId=${item.id}">${item.title}</a></li>
		          	</s:iterator>
		        </uhref="/news/knwTitle!showDetail.act>
      </div>
    </div>
<!--news-->
    </div>
      <!--热门融资产品-->              
    </div>
  </div>
    <div style="width:310px; float:right;">
    <!--中间右边部分-->
    <div style="width:308px; height:356px; float:right; backgrhref="/news/knwTitle!showDetail.act0 no-repeat; border:1px solid #CCC;"><input type="button" onfocus="this.blur()" onclick="this.form.submit()" class="but_gray" style="width:200px; margin-top:310px; margin-left:60px;" value="立刻查阅详情" /></div>
    <div class="hr_10"> &nbsp; </div>
       <!--中间右边部分-->
<!--    <div style="width:308px; height:356px; float:right; background:url(/images/cy.jpg) 0 0 no-repeat; border:1px solid #CCC;"><input type="button" onfocus="this.blur()" onclick="this.form.submit()" class="but_gray" style="width:200px; margin-top:310px; margin-left:60px;" value="立刻查阅详情" /></div>
    <div class="hr_10"> &nbsp; </div>-->
<!--    <div class="menu_red white"><span class="fr white"><a href="">更多»</a></span>
      <h6>融资案例</h6>
    </div>
    <div class="box_3">
      <ul class="new_li">
        <li><a href="">标题栏全部使用字体，不使用图标；</a></li>
        <li><a href="">网站边框和图片使用直角边框（圆角边框）；</a></li>
        <li><a href="">样式边框使用灰色；</a></li>
        <li><a href="">顶栏设计需考虑到不同分辨率的通栏效果，预留样式；</a></li>
        <li><a href="">插图设计：主题插图或者抠像插图设计风格，符合主题，无版权问题。（或对图片是用二次加工设计）；</a></li>
        <li><a href="">网站边框和图片使用直角边框（圆角边框）；</a></li>
      </ul>
    </div>-->
     <div class="grid_350 box_4 fl" style="width:308px;height:134px; overflow:hidden;">
     <div class="menu_red white"><span class="fr white"></span>
        <h6 class="white_dot">投资俱乐部</h6>
      </div>
    <div class="gray news_menu tab_menu2">
        <ul>
          <li class="hover" style="width: 154px">找项目</li>
          <li style="width: 153px">找资金</li>
        </ul>
      </div>
      <div class="xxkContent">
      <div class="xxkbox2" style="display: block;">
        <a href="">上海科发生物公司获得招商银行31万...</a><br/>
        <a href="">上海欧特商务公司获得中国银行120万...</a><br/>
        <a href="">上海西里餐饮公司获得上海银行12万...</a><br/>
        </div> 
        <div class="xxkbox2">
        <a href="">上海科发生物公司获得招商银行280万...</a><br/>
        <a href="">上海欧特商务公司获得中国银行150万...</a><br/>
        <a href="">上海西里餐饮公司获得上海银行280万...</a><br/>
        </div>        
      </div>
      </div>
    <div class="hr_10"> &nbsp; </div>    
    <!--2111111-->
     <div style="width:308px; height:143px; float:right; background:url(/images/rz_bottom_img.jpg) 0 0 no-repeat; border:1px solid #CCC;"></div>
    <!--中间右边部分-->
    </div>  
  <script language="javascript"> 
  new PCAS("province","city","area");
  new PCAS("province1","city1","area1");
  new PCAS("province2","city2","area2");
  new PCAS("province3","city3","area3");
</script>
</div>
<!--主体部分结束-->
<div class="clear"> &nbsp; </div>
<div class="hr_20"> &nbsp; </div>
<!--foot-->
<div class="footer">
  <div class="footer-nav"><a href="/">安全说明</a>|<a href="/">关于我们</a>|<a href="/">联系我们</a>|<a href="/">法律声明</a>|<a href="/">友情链接</a>|<a href="/">意见反馈</a>|<a href="/">隐私保密条款</a></div>
  <p class="copyright">客服热线：400123456  融资服务热线：021-60007888  理财服务热线：40084008<br />
    2012 <font style="font-family:'Arial';">&copy;</font> 版权所有 鼎辉信息技术（上海）有限公司</p>
</div>
<!--foot-->
</body>
</html>
