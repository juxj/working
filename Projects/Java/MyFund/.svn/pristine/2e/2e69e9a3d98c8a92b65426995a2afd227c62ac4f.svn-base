<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>融资理财资讯_中国资金网</title>
<meta name="keywords" content="融资资讯，金融资讯，理财资讯，金融政策，金融知识，理财知识，理财故事，名人理财"/>
<meta name="description" content="看金融理财资讯，就上中国资金网!中国资金网每日更新金融、融资、理财、政策走势、名人理财等讯息，为您提供全方位、多角度的资讯服务。"/>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
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

//通用选项卡2
$(document).ready(function() {
	$('.tab_menu2 ul li:first').addClass('hover');
    $('.xxkbox2:gt(0)').hide(); //让从大于0开始的div都隐藏 
    $('.first2').show(); //让从第二个选项卡开始，选项卡中的第一个xxkbox显示出来，以便于页面多次使用； 
    var sb = $('.tab_menu2 ul li');
    sb.click(function() {
        $(this).addClass('hover').siblings().removeClass();
        $.post("/news/yellowPage!appendToIndex.act",{type:this.value},function(data){
        	$('.xxkbox2').html(data);
        })
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
        $.post("/news/yellowPage!appendToIndex.act",{type:255},function(data){
        	$('.xxkbox2').html(data);
        })
    })
    //关键函数：通过控制i，来显示不同的幻灯片
    function showImg(i) {
        $(".img img").eq(i).stop(true, true).fadeIn(800).parent().siblings().find("img").hide();
        $(".btn span").eq(i).addClass("hov").siblings().removeClass("hov");
    }
    
    function more(){
    	var type = $('.tab_menu2 ul li[class=hover]').val();
    	location.href = "/news/yellowPage!appendAllList.act?type="+type;
    }
    	
</script>
</head>

<body>
<!--头部-->
<div class="header index_header">
<jsp:include page="/public/head1.jsp"/>
  <div class="clear"> &nbsp; </div>
</div>
<!--主体部分-->
<div class="hr_10"> &nbsp; </div>
<!--主体部分开始-->
<div class="container_950" style="border:none;">
    <div class="grid_630 fl">
    	<div class="focus" style="width: 630px; height: 180px;"> 
	      <!-- size: 708px * 293px -->
	        <div class="btn"> <span class="hov">1</span><span>2</span><span>3</span> </div>
	        <div class="img"> <a><img src="/images/info_img1.jpg" alt="中国资金网承办2012上海中小企业融资对接会！" /></a> <a><img src="/images/info_img2.jpg" alt="中国资金网荣获“上海市中小企业公共服务示范平台！" /></a> <a><img src="/images/info_img3.jpg" alt="私募债融资交流会成功召开！" /></a> </div>
	    </div>
        <div class="hr_10">&nbsp;</div>
        <div class="box_4 fl" style="width:308px; height:180px; overflow:hidden; margin-right:10px;">
          <div class="menu_red" style="border-bottom:5px solid #97181d; background-color:#f9f9f7; color: #424240;"><span class="fr">
          <a href="/news/Info!infoGroup.act?typeId=3" style="color: #424240;">更多»</a></span>
            <h6 style="font-weight:bolder">政策走势</h6>
          </div>
          <div>
                <ul class="xxkbox first new_li">
                    <jsp:include page="/public/news/_goverment_news.jsp" />
                </ul>
          </div>
        </div>
        <div class="box_4 fl" style="width:308px; height:180px; overflow:hidden;">
          <div class="menu_red" style="border-bottom:5px solid #97181d; background-color:#f9f9f7; color: #424240;"><span class="fr">
          		<a href="/news/Info!infoGroup.act?typeId=4" style="color: #424240;">更多»</a></span>
            <h6 style="font-weight:bolder">金融快讯</h6>
          </div>
          <div>
                <ul class="xxkbox first new_li">
                    <jsp:include page="/public/news/_finance_news.jsp" />
                </ul>
          </div>
        </div>
    <!--理财资讯-->
    <div class="hr_10"> &nbsp; </div>
    <div class="clear"> &nbsp; </div>
    <!--金融黄页-->
        <div class="box_4 fl" style="width:628px; height:auto; overflow:hidden; padding-bottom:8px;">
          <div class="menu_red" style="border-bottom:5px solid #97181d; background-color:#f9f9f7; color: #424240;">
            <h6 style="font-weight:bolder">金融黄页</h6>
          </div>
           <!--tab开始-->
        	<div >
              <div class="news_menu tab_menu2" style="background:#f9f9f7;">
                <ul  >
                  <s:iterator value="commons">
	               <li style="width:auto; padding:0 15px; font-weight:normal; font-size:12px;" value="<s:property value="id"/>"> <a href="javascript:void(0);"><s:property value="name"/></a> </li>   
                  </s:iterator>
                </ul>
              </div>
              <div>
                 <ul class="xxkbox2" style="margin-top:10px; margin-left:20px;">
                </ul>
              </div>
                <div style="float:right; margin-right:20px;"><a href="javascript:more();">更多»</a></div>              
            </div>
           <!--tab结束-->	
        </div>
    <!--金融黄页-->
    <div class="hr_10"> &nbsp; </div>
    <!--用户指南-->    
        <div style="width:630px; height:auto; ">
            <div class="menu_red white"><span class="fr white">
            	<s:if test="commonIssueList.size>0"><s:iterator value="commonIssueList" begin="0" end="0">
            		<a href="/news/Info.act?id=${id}">更多»</a>
            	</s:iterator></s:if>
            </span>
            <h6 class="white_dot">用户指南</h6>
            </div>
            <div  class="box_3" style="padding-bottom:20px;">
            <div style="float:left; ">
	            <div style="float:left; margin : 20px 0 0 20px;"><a href="#"><img src="/images/ques.jpg" /></a></div>	
	             <ul class="new_li" style="float:left; width:230px;" >
	               <s:iterator id="item" value="commonIssueList" status="st">
	               <s:if test="#st.index<5">
					<li>
						<s:if test="#item.url.length()>8">
							<s:if test="#item.title.length()>25">
								<a href="${item.url}"  target="_blank"><s:property value="#item.title.substring(0,25)"></s:property>...</a>
							</s:if>
							<s:else> 
								<a href="${item.url}"  target="_blank">${item.title}</a>
							</s:else>
						</s:if> 
						<s:else>
							<s:if test="#item.title.length()>25">
								<a href="/news/Info.act?id=${item.id}"  target="_blank">
								<s:property value="#item.title.substring(0,25)"></s:property>...</a>
							</s:if><s:else>
								<a href="/news/Info.act?id=${item.id}"  target="_blank">${item.title}</a>
							</s:else>
						</s:else>
					</li>
					</s:if>
					</s:iterator>
	              </ul>
	              <ul class="new_li"  style="float:right; width:230px;">
	               <s:iterator id="item" value="commonIssueList" status="st">
	               <s:if test="#st.index>4">
					<li>
						<s:if test="#item.url.length()>8">
							<s:if test="#item.title.length()>25">
								<a href="${item.url}"  target="_blank"><s:property value="#item.title.substring(0,25)"></s:property>...</a>
							</s:if>
							<s:else>
								<a href="${item.url}"  target="_blank">${item.title}</a>
							</s:else>
						</s:if> 
						<s:else>
							<s:if test="#item.title.length()>25">
								<a href="/news/Info.act?id=${item.id}"  target="_blank">
								<s:property value="#item.title.substring(0,25)"></s:property>...</a>
							</s:if><s:else>
								<a href="/news/Info.act?id=${item.id}"  target="_blank">${item.title}</a>
							</s:else>
						</s:else>
					</li>
					</s:if>
					</s:iterator>
	              </ul>
              </div>
			<div >    
            <!--用户指南（1）-->
                <div style="width:190px; overflow:hidden; float:left; margin : 0 0 0 20px;">
                  <div style="border-bottom:5px solid #464646; color:#000;">
                    <h6 style="font-weight:normal; margin-bottom:5px; color:#97181d;">注册与登录</h6>
                  </div>
                    <table class="banking_table">
                    
                      <s:iterator id="item" value="registerLoginList" status="st">
						<tr>
							<td class="hot_connect01" style="padding:0px;">
							<s:if test="#item.url.length()>8">
								<s:if test="#item.title.length()>25">
									<a href="${item.url}"  target="_blank"><s:property value="#item.title.substring(0,25)"></s:property>...</a>
								</s:if>
								<s:else>
									<a href="${item.url}"  target="_blank">${item.title}</a>
								</s:else>
							</s:if> 
							<s:else>
								<s:if test="#item.title.length()>25">
									<a href="/news/Info.act?id=${item.id}"  target="_blank">
									<s:property value="#item.title.substring(0,25)"></s:property>...</a>
								</s:if><s:else>
									<a href="/news/Info.act?id=${item.id}"  target="_blank">${item.title}</a>
								</s:else>
							</s:else>
							</td> 
						 </tr>
						</s:iterator>
                    </table> 
                </div>
            <!--用户指南(1)-->
            <!--用户指南（2）-->
                <div style="width:190px; overflow:hidden; float:left; margin : 0 0 0 10px;">
                  <div style="border-bottom:5px solid #464646; color:#000;">
                    <h6 style="font-weight:normal; margin-bottom:5px; color:#97181d;">融资与服务</h6>
                  </div>
                    <table class="banking_table">
                       <s:iterator id="item" value="financingServiceList" status="st">
						<tr>
							<td class="hot_connect01" style="padding:0px;">
							<s:if test="#item.url.length()>8">
								<s:if test="#item.title.length()>25">
									<a href="${item.url}"><s:property value="#item.title.substring(0,25)"></s:property>...</a>
								</s:if>
								<s:else>
									<a href="${item.url}">${item.title}</a>
								</s:else>
							</s:if> 
							<s:else>
								<s:if test="#item.title.length()>25" >
									<a href="/news/Info.act?id=${item.id}"  target="_blank">
									<s:property value="#item.title.substring(0,25)" ></s:property>...</a>
								</s:if><s:else>
									<a href="/news/Info.act?id=${item.id}"  target="_blank">${item.title}</a>
								</s:else>
							</s:else>
							</td> 
						 </tr>
						</s:iterator>                     
                    </table> 
                </div>
            <!--用户指南(2)-->    
            <!--用户指南（3）-->
                <div style="width:190px; overflow:hidden; float:right; margin: 2px 18px 0 0;">
                  <div style="border-bottom:5px solid #464646; color:#000;">
                    <h6 style="font-weight:normal; margin-bottom:3px; color:#97181d;">服务协议与规则</h6>
                  </div>
                    <table class="banking_table">
                      <s:iterator id="item" value="serviceAgreementList" status="st">
						<tr>
							<td class="hot_connect01" style="padding:0px;">
							<s:if test="#item.url.length()>8">
								<s:if test="#item.title.length()>25">
									<a href="${item.url}" target="_blank"><s:property value="#item.title.substring(0,25)"></s:property>...</a>
								</s:if>
								<s:else>
									<a href="${item.url}" target="_blank">${item.title}</a>
								</s:else>
							</s:if> 
							<s:else>
								<s:if test="#item.title.length()>25">
									<a href="/news/Info.act?id=${item.id}" target="_blank">
									<s:property value="#item.title.substring(0,25)"></s:property>...</a>
								</s:if><s:else>
									<a href="/news/Info.act?id=${item.id}" target="_blank">${item.title}</a>
								</s:else>
							</s:else>
							</td> 
						 </tr>
						</s:iterator>                
                    </table> 
                </div>
            <!--用户指南(3)-->
             </div>
            </div>            
        </div>
     <!--用户指南-->            
    </div>    
    <div class="grid_310 fr">
    <!--公司新闻-->
        <div class="box_4" style="width:308px; height:180px; overflow:hidden;">
          <div class="menu_red" style="border-bottom:5px solid #97181d; background-color:#f9f9f7; color: #424240;"><span class="fr">
          	<a href="/news/Info!infoGroup.act?typeId=5" style="color: #424240;">更多»</a></span>
            <h6 style="font-weight:bolder">本站动态</h6>
          </div>
          <div>
                <ul class="xxkbox first new_li">
                    <jsp:include page="/public/news/_site_news.jsp" />
                </ul>
          </div>
        </div>
    <!--公司新闻-->
    <div class="hr_10">&nbsp;</div>
    <!--电子版下载-->
	<div><a href="#"><img src="/images/download.jpg" /></a></div>
    <!--电子版下载-->
    <div class="hr_10">&nbsp;</div>
    <!--金融百科-->
    <div style="width:310px; overflow:hidden;">
        <div class="menu_red">
          <h6>金融百科</h6>
        </div>
      <div class="box_3 qyrz">
        <div class="qyrz-top" style="padding-left:20px;">
        	<table class="qyrz-top_table">
        		<tr>
        		<td rowspan="6" style="vertical-align:middle;"><img src="/images/rzcd.jpg" /></td>
        		</tr>
              <s:iterator id="item" value="financingDictionaryList" status="st">
						<tr>
							<td class="hot_connect01" style="padding-left:8px;">
							<s:if test="#item.url.length()>8">
								<s:if test="#item.title.length()>25">
									<a href="${item.url}"><s:property value="#item.title.substring(0,25)"></s:property>...</a>
								</s:if>
								<s:else>
									<a href="${item.url}">${item.title}</a>
								</s:else>
							</s:if> 
							<s:else>
								<s:if test="#item.title.length()>25">
									<a href="/news/Info.act?id=${item.id}">
									<s:property value="#item.title.substring(0,25)"></s:property>...</a>
								</s:if><s:else>
									<a href="/news/Info.act?id=${item.id}">${item.title}</a>
								</s:else>
							</s:else>
							</td> 
						 </tr>
						</s:iterator>    
            </table>
        </div>
        <div class="more">
        	<s:if test="financingDictionaryList.size>0"><s:iterator value="financingDictionaryList" begin="0" end="0">
           		<a href="/news/Info.act?id=${id}">更多»</a>
           	</s:iterator></s:if>
        </div>
        <hr style="width:90%" />
        <div class="qyrz-top" style="padding-left:20px;">
        	<table class="qyrz-top_table">
        		<tr>
        		<td rowspan="6" style="vertical-align: middle;"><img src="/images/lcbk.jpg" /></td>
        		</tr>
               <s:iterator id="item" value="financingEncyclopediaList" status="st">
				<tr>
					
					<td class="hot_connect01" style="padding-left:8px;">
					<s:if test="#item.url.length()>8">
						<s:if test="#item.title.length()>25">
							<a href="${item.url}"><s:property value="#item.title.substring(0,25)"></s:property>...</a>
						</s:if>
						<s:else>
							<a href="${item.url}">${item.title}</a>
						</s:else>
					</s:if> 
					<s:else>
						<s:if test="#item.title.length()>25">
							<a href="/news/Info.act?id=${item.id}">
							<s:property value="#item.title.substring(0,25)"></s:property>...</a>
						</s:if><s:else>
							<a href="/news/Info.act?id=${item.id}">${item.title}</a>
						</s:else>
					</s:else>
					</td> 
				 </tr>
				</s:iterator>  
            </table>
      </div>
      <div class="more">
      		<s:if test="financingEncyclopediaList.size>0"><s:iterator value="financingEncyclopediaList" begin="0" end="0">
           		<a href="/news/Info.act?id=${id}">更多»</a>
           	</s:iterator></s:if>
      </div>
    </div>
    <!--金融百科-->
    <div class="hr_10">&nbsp;</div>
    <!--下载-->
    <div style="width:310px; overflow:hidden; display: none;">
        <div class="menu_red white">
          <h6>下载</h6>
        </div>
        <div class="box_3">
          <ul class="new_li" style="float:left;">
            <li><a href="">ca证书下载</a></li>
            <li><a href="">安全控件下载</a></li>        
          </ul>
          <ul class="new_li">
            <li><a href="">安全控件下载</a></li>
            <li><a href="">安全控件下载</a></li>        
          </ul>
        </div>
    </div>
    <!--下载-->
    <!--图片-->   
	<div style="float:right; margin-top:0px;"><img src="/images/rz_bottom_img.jpg" /></div> 
    <!--图片-->
    </div>
  </div>
</div>
<div class="hr_10">&nbsp;</div>
<!--主体部分结束-->
<jsp:include page="/public/bottom.jsp" />
<!--foot-->
</body>
</html>
