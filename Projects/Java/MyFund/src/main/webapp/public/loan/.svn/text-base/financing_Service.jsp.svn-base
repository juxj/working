<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>融资服务_中国资金网</title>
<meta name="keywords" content="融资，贷款,银行，担保，上海贷款，创业贷款，无抵押贷款，担保贷款,风险投资"/>
<meta name="description" content="融资、贷款就上中国资金网!中国资金网在金融服务领域深耕多年，拥有丰富的经验和资源，与国内外多家银行及金融机构建立长期稳定的合作关系，可以为企业及个人提供各种类型的融资服务。"/>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/index.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" ></script>
<script type="text/javascript" src="/script/load-loan.js"></script>
<script language="javascript">
$(document).ready(function() {
//通用选项卡
    $('.xxkbox:gt(0)').hide(); //让从大于0开始的div都隐藏 
    $('.first').show(); //让从第二个选项卡开始，选项卡中的第一个xxkbox显示出来，以便于页面多次使用； 
    var sb = $('.tab_menu ul li');
    sb.hover(function() {
        $(this).addClass('hover').siblings().removeClass();
        var nb = sb.index(this);
        $('.xxkbox').eq(nb).show().siblings().hide();
    });
    //} 

//通用选项卡2
    $('.xxkbox2:gt(0)').hide(); //让从大于0开始的div都隐藏 
    $('.first2').show(); //让从第二个选项卡开始，选项卡中的第一个xxkbox显示出来，以便于页面多次使用； 
    var sb = $('.tab_menu2 ul li');
    sb.click(function() {
        $(this).addClass('hover').siblings().removeClass();
        var nb = sb.index(this);
        $('.xxkbox2').eq(nb).show().siblings().hide();
    });
    //} 

//$('.defaultvalue').css('color','#000000'); 
    $('.defaultvalue').each(function(){   
        $(this).data( "txt", $.trim($(this).val()) );   
    }).focus(function(){   
        // 获得焦点时判断域内的值是否和默认值相同，如果相同则清空   
        //$(this).css('color','#333');   
        if ( $.trim($(this).val()) === $(this).data("txt") ) {   
            $(this).val("");   
        }   
    }).blur(function(){      
        if ( $.trim($(this).val()) === "") {   
            //$(this).css('color','#000000');   
            $(this).val( $(this).data("txt") );   
        }   
    }   
    );   
}); 
//文本框触发焦点效果s
$(function() {
    $(".input-text,textarea").focus(function() {
        $(this).addClass("input-focus");
    }).blur(function() {
        $(this).removeClass("input-focus");
    });
});

function CompanySubmit(){
	var amount1 = $('#searchForm1 input[name=financeAmount]').val();
	var date1 = $('#searchForm1 input[name=financeDate]').val();
	if(amount1=="不限"){
		 $('#searchForm1 input[name=financeAmount]').val("");
	}
	if(date1==null || date1==""){
		$("#erro").html("请输入期限");
		return false;
	}
	/*if(!((/^(\+|-)?\d+$/.test(amount1)) || amount1<0)){
		$("#erro").html("金额必须输入整数");
		return false;
	}*/
	if(!((/^(\+|-)?\d+$/.test(date1)) || date1<0)){
		$("#erro").html("期限必须输入整数");
		return false;
	}
	$('#searchForm1').submit();
}
function PersonSubmit(){
	var a2 = $('#searchForm2 input[name=financeAmount]').val();
	var d2 = $('#searchForm2 input[name=financeDate]').val();

	if(a2=="不限"){
		 $('#searchForm2 input[name=financeAmount]').val("");
	}
	if(d2==null || d2==""){
		$("#error").html("请输入期限");
		return false;
	}
	/*if(!((/^(\+|-)?\d+$/.test(a2)) || a2<0)){
		$("#error").html("金额必须输入整数");
		return false;
	}*/
	if(!((/^(\+|-)?\d+$/.test(d2)) || d2<0)){
		$("#error").html("期限必须输入整数");
		return false;
	}
	$('#searchForm2').submit();
}
</script>
<style>
.box_form dl dd{width:300px;}
</style>
</head>

<body>
<!--头部-->
<div class="header index_header">
<jsp:include page="/public/head1.jsp"/>
  <div class="clear"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分-->
<!--tab-->
<div style="width:950px; margin:0 auto;">
	<div style="width:630px; height:auto; float:left;">
        <div style="width:628px; height:313px; border : #d6d6d6 solid 1px; background: url(/images/tab_bg.jpg) 0 0 no-repeat; position:relative;">
          <div class="gray news_menu tab_menu2" >
            <ul>
              <li class="hover" style="width:314px;">企业</li>
              <li style="width:313px;">个人</li>
            </ul>
          </div>
          <div class="hr_20">&nbsp; </div>
          <div >
            <div class="xxkbox2" >
            <div class="fl" style="width:320px;">
              <s:form cssClass="box_form" id="searchForm1" action="financeProduct.act" namespace="/loan" method="post">
                <dl>
                  <dd>
                    <h6 style="width:80px;"><span class="txt-impt"></span>类别：</h6>
                    <select name="financeType" style="width:195px;">
                      <option value="151">企业经营贷款</option>
                    </select>
                  </dd>
                  <dd>
                    <h6 style="width:80px;">用途：</h6>
                    <common:select headerKey="-1" headerValue="--不限--" style="width:195px;" name="purposeType" valueSetId="14"/>
                  </dd>
                  <dd>
                    <h6 style="width:80px;">金额：</h6>
                    <input type=text name="financeAmount" class="input-text defaultvalue" style="width:160px;" value="不限"/>万元
                  </dd>
                  <dd>
                    <h6 style="width:80px;">期限：</h6>
                    <input type=text name="financeDate" class="input-text defaultvalue" style="width:160px;" value="12"/>个月
                  </dd>
                  <dd>
                  	<font style="padding-left: 40px;" color="#97181d" id="erro"></font>
                  </dd>
                </dl>
               </div> 
                <div class="fr" style="padding-top: 18px;"><a href="/loan/financeProduct!financeSearchDetail.act?financeType=151&financeDate=12"><img src="/images/img_tab_loan1.gif" /></a></div>
                <div style="position:absolute; top:258px; left:205px;">
                  <input type="button" onfocus="this.blur()" onclick="CompanySubmit();" class="but_gray" style="width:200px;" value="搜 索" />
                </div>              
              </s:form>
            </div>
            <div class="xxkbox2">
            <div class="fl" style="width:320px;">
              <s:form cssClass="box_form" id="searchForm2" action="financeProduct.act" namespace="/loan" method="post">
                <input id="poseId" type="hidden" name="poseId" value=""/>
                <dl>
                  <dd>
                    <h6 style="width:80px;"><span class="txt-impt"></span>类别：</h6>
                    <select name="financeType" class="required" style="width:190px;">
                      <option id="23" value="152">个人经营性贷款</option>
                    </select>
                  </dd>
                  <dd>
                    <h6 id="purpose_h6" style="width:80px;">用途：</h6>
                    <common:select valueSetId="23"  headerKey="-1" headerValue="--不限--" style="width:190px;" name="purposeType"></common:select>
                  </dd>
                  <dd>
                    <h6 style="width:80px;">金额：</h6>
                    <input type=text name="financeAmount" value="不限" class="input-text defaultvalue" style="width:160px;"/>万元
                  </dd>
                  <dd>
                    <h6 style="width:80px;">期限：</h6>
                    <input type=text name="financeDate" value="12"  class="input-text defaultvalue" style="width:160px;"/>个月
                  </dd>
                  <dd>
                  	<font style="padding-left: 40px;" color="#97181d" id="error"></font>
                  </dd>                  
                  </dl>
                </div> 
                <div class="fr" style="padding-top: 18px;"><a href="/loan/financeProduct.act?financeType=152&financeDate=12"><img src="/images/img_tab_loan2.gif" /></a></div>                  
                 <div style="position:absolute; top:258px; left:205px;">
	                <input type="button" onfocus="this.blur()" onclick="PersonSubmit();" class="but_gray" style="width:200px;" value="搜 索" />
	             </div>	                  
              </s:form>        
            </div>        
          </div>
        </div>          
        <div class="hr_10"> &nbsp; </div>
        <!-- 投资俱乐部 -->
        <div class="grid_350" style=" overflow:hidden;">
        <div style="width:630px; height:107px;"><a href="/Account.act"><img src="/images/img_loan_Club.jpg" /></a></div>
        <div class="hr_10"> &nbsp; </div>        
         <div class="menu_red white"><span class="fr white"></span>
            <h6 class="white_dot">融资俱乐部</h6>
          </div>
        <div class="box_3">
          <div class="gray news_menu tab_menu2">
            <ul>
              <li class="hover" style="width:313px">找资金</li>
              <li style="width:314px">找项目</li>
            </ul>
          </div>
          <div>
          	<div class="xxkbox2 first2">
				  <s:if test="supplyInfoList.size>0">
				  	<ul style="float:left;margin-right:50px;width:260px;"  class="new_li">
						<s:iterator id="item" value="supplyInfoList" status="st">
						<li title="${item.title}"><a href="/service/supplyInfoAction!detail.act?clbSupplyInfoId=${item.id }">
							<s:if test="#item.title.length()>50">
								<s:property value="#item.title.substring(0,50)"></s:property>...
							</s:if><s:else>
								${item.title}
							</s:else>
						</a></li>
						<s:if test="#st.index == 4">
							</ul><ul class="new_li" >
						</s:if>
						</s:iterator>
					</ul>
					
					</s:if>
					<s:else>
						<li>无记录</li>
					</s:else>
                <span class="fr" style="padding-right: 13px;padding-bottom: 10px;"><a href="/service/supplyInfoAction!home.act?pageNo=1">更多»</a></span>
            </div> 
            <div class="xxkbox2">
            	<s:if test="requestInfoList.size>0">
            		<ul style="float:left;margin-right:50px;width:260px;"  class="new_li">
						<s:iterator id="item" value="requestInfoList" status="st">
							<li title="${item.title}">
							<a href="/service/requestInfoAction!detail.act?clbRequestInfoId=${item.id }">
								<s:if test="#item.title != null && #item.title.length()>20">
									<s:property value="#item.title.substring(0,20)"></s:property>...
								</s:if><s:else>
									${item.title}
								</s:else>
							</a></li>
							<s:if test="#st.index == 4">
								</ul><ul class="new_li" >
							</s:if>
						</s:iterator>
					</ul>				  
					</s:if>				
					<s:else>
						<li>无记录</li>
					</s:else>
				  <span class="fr" style="padding-right: 13px;padding-bottom: 10px;"><a href="/service/requestInfoAction!home.act?pageNo=1">更多»</a></span>
            	
            	
          </div>      
          </div>        
          </div>
          </div>
        <div class="hr_10"> &nbsp;</div> 
               
        <!-- 热门融资产品 <div class="grid_350">
          <div class="menu_red white"><span class="fr white"><a href="">更多»</a></span>
            <h6 class="white_dot">热门融资产品</h6>
          </div>
          <div class="box_3" style="overflow:hidden; height:auto; width: 628px">
            <div class="hr_10"> &nbsp; </div>
            <div class="hr_10"> &nbsp; </div>
            <div class="qyrz-top">
                <table class="qyrz-top_table" width="600px">
                  <tr>
                    <td><img src="/images/icons/hq_icon.jpg" /></td>
                    <td class="hot_connect">花旗银行-幸福时贷 年利率0.73%，无信用记录也可申请</td>
                  </tr>
                  <tr>
                    <td><img src="/images/icons/pa_icon.jpg" /></td>
                    <td class="hot_connect">平安银行-无抵押速贷 有1年以上房贷记录即可申请，当天放款</td>
                  </tr>
                  <tr>
                    <td><img src="/images/icons/pa_icon.jpg" /></td>
                    <td class="hot_connect">宜信-薪薪贷 条件宽松，月打卡工资满2000元即可申请 </td>
                  </tr>
                  <tr>
                    <td><img src="/images/icons/pa_icon.jpg" /></td>
                    <td class="hot_connect">工商银行-房屋按揭贷款 首套房8.5折，处理速度快</td>
                  </tr>
                  <tr>
                    <td><img src="/images/icons/zg_icon.jpg" /></td>
                    <td class="hot_connect">深圳发展银行-车贷 买二手车也可贷款，年利率0.82%起，无其他费用</td>
                  </tr> 
                </table>
            </div>
            <div class="hr_10"> &nbsp; </div>
          </div>
        </div>
        <!--热门融资产品-->
        <!--资讯部分-->
	    <!--news-->
	        <div class="grid_350 box_4 fl" style="width:308px;height:auto; overflow:hidden; float:left; margin-right:10px;">
	          <div class="menu_red white grid_350" style="width:308px; border-bottom:1px solid #d7d7d7; background-color:#f9f9f7; color: #424240;">
	          <span class="fr"><a href="/news/Info!infoGroup.act?typeId=6" style="color: #424240;">更多»</a></span>
	            <h6 style="font-weight:bolder">融资资讯</h6>
	          </div>
	          <div>
	            <jsp:include page="/public/news/_financing_news.jsp" />
	          </div>
	        </div>
	    <!--news-->
	    
	    <!--news-->
	        <div class="grid_350 box_4 fl" style="width:308px;height:auto; overflow:hidden;">
	          <div class="menu_red white grid_350" style="width:308px; border-bottom:1px solid #d7d7d7; background-color:#f9f9f7; color: #424240;">
	          <span class="fr"><a href="/news/Info!infoGroup.act?typeId=19" style="color: #424240;">更多»</a></span>
	            <h6 style="font-weight:bolder">融资指南</h6>
	          </div>
	          <div>
	            <jsp:include page="/public/news/_financing_guide_news.jsp" />
	          </div>
	        </div>
	    <!--news-->
	    <!--资讯部分-->          
	</div>
    <!--中间右边部分-->	
    <div style="width:310px; float:right;">
        <div style="width:310px; height:315px;"><a href="/finance/financeProduct!cateringf.act"><img src="/images/shipin_img.jpg" /></a></div>
        <div class="hr_10"> &nbsp; </div>
	    <div class="grid_350 fr" style="width:310px; overflow:hidden;">
	      <div class="menu_red white grid_350" >
	      	<h6>热门融资产品</h6>
	      </div>
	        <div class="box_3 " style="padding-left:5px;padding-top:15px;padding-bottom:15px;">
	            <s:action name="financeProduct!findRecom" namespace="/loan" executeResult="true"></s:action>
	        </div>
	    </div>
        <div class="hr_10"> &nbsp; </div>
	    <div class="grid_350 fr" style="width:308px; overflow:hidden;">
	      <div class="menu_red white grid_350">
	      	<h6 >热门服务</h6>
	      </div>
	      <div class="box_3 " style="padding-bottom:10px;">
		     	<ul class="xxkbox first new_li">
			        <s:iterator id="item" value="serviceItemList" status="s">
			        	<li>
			        		<a href="/service/serviceItem!showSinItemDetail.act?itemId=${item.id}">${item.typeName} | ${item.title}</a>
			        	</li>
			        </s:iterator>			        
		     	</ul>
				<span class="fr" style="margin-right:15px; margin-bottom:5px;"><a href="/service/serviceItem!showHome.act">更多»</a></span>		     		     	
	      </div>
	    </div>
	    <!-- 	    	            
        <div class="hr_10"> &nbsp; </div>    
        <div style="width:310px; height:140px; float:right; background:url(/images/rz_bottom_img.jpg) 0 0 no-repeat;"></div> 
        -->
    </div>
    <!--中间右边部分-->  
</div>
<!--主体部分结束-->
<div class="clear"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--foot-->
<jsp:include page="/public/bottom.jsp" />
<!--foot-->
</body>
</html>