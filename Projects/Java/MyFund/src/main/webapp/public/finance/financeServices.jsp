<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>理财产品_中国资金网</title>
<meta name="keywords" content="理财，理财产品，信托，信托产品，理财顾问，银行理财产品"/>
<meta name="description" content="找理财产品就上中国资金网!中国资金网在理财服务领域深耕多年，拥有丰富的经验和资源，与国内外多家银行及理财服务机构建立长期稳定的合作关系，可以为个人提供各种类型的理财服务。"/>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/mark.js"></script>

<script type="text/javascript" src="/script/public.js"> </script>
<script type="text/javascript" src="/script/load-finance.js" > </script>
<script type="text/javascript">
$(document).ready(function(){
	$('.xxkbox:gt(0)').hide();//让从大于0开始的div都隐藏 
	$('.first').show();//让从第二个选项卡开始，选项卡中的第一个xxkbox显示出来，以便于页面多次使用 
	var sb = $('.tab_menu ul li');
	sb.hover(function(){
		$(this).addClass('hover').siblings().removeClass();
		var nb = sb .index(this);
		var news_box = $('.xxkbox').eq(nb-3);
		news_box.show().siblings().hide();
	});
	$(".user_login_menu li").click(function() {
		$(this).addClass("selected").siblings().removeClass("selected");
		var num = $(this).index();
        $(".user_login_content>div").eq(num).attr("class", "on").siblings().attr("class", "off");
    });
    
});
function showNewsHome(typeId){
	url = "/news/Info!infoGroup.act?typeId="+typeId;
	window.location.href = url;
}

function showBankProductHome() {
	$("#frmSearchBankProduct").submit();
}
</script>
</head>
<body>
<!--头部-->
<div class="header index_header">
<jsp:include page="/public/head1.jsp" />
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分开始-->
<div class="container_960">
    <div class="grid_230">
		<div class="user_login fr">
		<div class="menu_red white">
      	<h6>银行理财</h6>
    	</div>
      <div class="box_3"  style="padding-bottom:20px;">
          <form id="frmSearchBankProduct" action="/finance/bankProduct!search.act" class="box_form1" method="post">
          	<input type="hidden" id="q0" name="query" value="0"/>
            <dl>
              <dd><h6>发行银行</h6>
              	<s:select id="q1" name="query" list="bankList" label="name" listValue="name" listKey="name"/>
              </dd>
              <dd><h6>产品期限</h6>
              	<s:select id="q2" name="query" list="investmentCycle" label="name" listValue="name" listKey="id"></s:select>
              </dd>
              <dd><h6>年化收益率</h6>
           		<s:select id="q3" name="query" list="investmentReturnRate" label="name" listValue="name" listKey="id"></s:select>
              </dd>
              <dd><h6>起购金额</h6>
              		<s:select id="q4" name="query" list="investmentQuota" label="name" listValue="name" listKey="id"></s:select>
			      	<input id="q5" name="query" maxlength="30" type="hidden"/>
              </dd>
            </dl>
          <div style="margin-left:70px;">
            <input  type="submit" value="搜索" class="btnsub bred" name="" style="width:100px;" />
          </div>            
          </form>
      </div>
    </div>
    <!--列表1开始-->
       <div class="hr_10"> &nbsp; </div>
       <div ><a href="/finance/fund.act"><img src="/images/ad_c2_1.jpg" width="230" height="90" /></a></div>
       <div class="hr_10"> &nbsp; </div>
       <div class="menu_red white">
      <h6>理财工具</h6>
    </div>
    <div class="box_3">
      <ul class="new_li">
       	<jsp:include page="_financing_tools.jsp" />
      </ul>
    </div>
   <!--列表1结束-->
    <div class="hr_10"> &nbsp; </div>
    <div><img src="/images/ad_c2_2.jpg" width="230" height="280" /></div>
    <div class="hr_10"> &nbsp; </div>
   </div>
    <div class="grid_710">
        <div class="focus"> 
          <!-- size: 708px * 293px -->
            <div class="img"><img src="/images/img_lc_index.jpg"/></div>
        </div>
        <div class="hr_10"> &nbsp; </div>
           <!--中间部分开始-->
           <div>
                <div class="menu_red white"><span class="fr white"><a href="javascript:showBankProductHome()">更多»</a></span>
                  <h6 class="white_dot">银行理财</h6>
                </div>
                <div class = "box_3" >
                <table class="gold-table" style="margin-bottom: 15px;">
                      <tr >
                        <th>产品名称</th>
                        <th>发行银行</th>
                        <th>起销日期</th>
                        <th>投资期限</th>
                        <th>起购金额</th>
                        <th style="padding-right: 10px; ">预期年化收益率</th>
                      </tr>          
                      <s:iterator id ="item" value="bankProductList">  
					  <tr class="txt_content" >
						  	<td style="padding-left: 20px;" title="${item.name}" ><a href="/finance/bankProduct!showDetails.act?id=${item.id}" >
						  		<s:if test="%{null!=#item.name&&#item.name.length()>20}"><s:property value="%{#item.name.substring(0, 20)}" />..</s:if>
						  			<s:else>${item.name}</s:else>
						  		</a></td>
	   						<td style="padding-left: 20px; ">${item.bank}</td>
	   						<td style="padding-left: 20px; "><s:date name="#item.sellstart" format="yyyy-MM-dd"/></td>
	   						<td style="padding-left: 20px; ">${item.manageperiod}</td>
	   						<td style="padding-left: 20px; ">${item.minamount}</td>
	   						<td style="padding-left: 50px; ">${item.benefitrate}%</td>
					</tr> 
					</s:iterator>
        
                </table>    
                </div>
                <div class="contantfirst">
                <table class="gold-table" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <th>产品名称</th>
                        <th>发行银行</th>
                        <th>起销日期</th>
                        <th>投资期限</th>
                        <th>起点金额</th>
                        <th>预期年收益率</th>
                      </tr>
                      <s:iterator id ="item" value="bankProductList">
					  <tr>
					  	<td><a href="/finance/bankProduct!showDetails.act?id=${item.id}"> ${item.name} </a> </td>
   						<td>${item.bank}</td>
   						<td><s:date name="#item.sellstart" format="yyyy-MM-dd"/></td>
   						<td>${item.manageperiod}</td>
   						<td>${item.minamount}</td>
   						<td>${item.benefitrate}</td>
					</tr>
					</s:iterator>
                </table>                            
                </div>
           </div>
           <!--中间部分结束-->
          <div class="hr_10"> &nbsp; </div>
           <!--列表2开始-->
            <div class="main02_box">
              <div class="main02_box_li">
                <div class="menu_red white"><span class="fr white"><a href="/finance/bankProduct!getList.act">更多»</a></span>
                  <h6>热门理财产品</h6>
                </div>
                <div class="box_3" style="padding-left:5px;padding-top:15px;height:165px;">
	        	<div >
				    <table >
					  <s:iterator value="bankFinanceRecommendationList" id="item" >
					   <tr>
					     <td style="vertical-align: middle;">
							<s:if test="logo == null">
						        <img src="/images/banklogo/zj198.jpg" class="td_img" style="white-space: nowrap;"/>
					        </s:if>
					        <s:else>
					        	<img src="/images/banklogo/${item.logo}" class="td_img" style="white-space: nowrap;"/>
					        </s:else>
					     </td>
					     <td class="hot_connect">
					     	<a href="/finance/bankProduct!showDetails.act?id=${item.prodId}">
					     		<s:if test="#item.title != null && #item.title.length()>27">
									<s:property value="#item.title.substring(0,27)"></s:property>...
								</s:if><s:else>
									${item.title}
								</s:else>
					     	</a>
					     </td>
					   </tr>
					  </s:iterator>
					</table>
			    </div>
	        </div>
             </div>
              <div class="main02_box_li" style="float:right;">
                <div class="menu_red white"><span class="fr white"><a href="javascript:showNewsHome(7)">更多»</a></span>
                  <h6>理财资讯</h6>
                </div>
                <div class="box_3">
                  <ul class="new_li">
                  <s:iterator value="financeInfoNews" id="item" status="st">
		       	  	<s:if test="#st.first">
		       	  		<li class="hover"> <a href="/news/Info.act?id=${item.id}">${item.title}</a> </li>
		       	  	</s:if>
						<s:else>
							<li > <a href="/news/Info.act?id=${item.id}">${item.title}</a> </li>
						</s:else>
		       	  </s:iterator>
                  </ul>
                </div>
              </div>

           <div class="clear"> &nbsp; </div>
           <div class="hr_10"> &nbsp;</div>
           <div ><img src="/images/img_lc.jpg" width="710" height="110" /></div>
           <div class="hr_10"> &nbsp;</div>
    </div>
 </div>
</div>
<!--主体部分结束-->
<jsp:include page="/public/bottom.jsp" />
</body>
</html>
