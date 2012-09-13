<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>中国资金网_融资理财第一门户</title>
<meta name="keywords" content="融资，理财，贷款,上海贷款，创业贷款，无抵押贷款，担保贷款,风险投资,资金网,鼎辉投资"/>
<meta name="description" content="找资金找项目就上中国资金网!中国资金网聚合众多金融、理财产品和企业需求信息，引领中国资本合理流通与资源合理配置，为客户提供最优质的融资、理财以及各种增值服务，是中国领先的一站式金融理财服务平台!"/>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/index.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/index.js" > </script>
<script type="text/javascript" src="/script/load-index.js" > </script>
<script type="text/javascript">
	function showNewsHome(typeId){
		url = "/news/Info!infoGroup.act?typeId="+typeId;
		window.location.href = url;
	}
	function smmn() {
		if($("#smm").val()=="139"){
			$("#mm").html("年");
		}else{
			$("#mm").html("月");
		}
	}
	$(document).ready(function(){ 
		smmn();
		$('.xxkbox:gt(0)').hide();//让从大于0开始的div都隐藏 
		$('.first').show();//让从第二个选项卡开始，选项卡中的第一个xxkbox显示出来，以便于页面多次使用 
		var sb = $('.tab_menu ul li');
		sb.hover(function(){
			$(this).addClass('hover').siblings().removeClass();
			var nb = sb .index(this);
			var news_box = $('.xxkbox').eq(nb-3);
			news_box.show().siblings().hide();
		});
	});
</script>
<style>
.focus { position:relative; width:710px; height:295px; overflow:hidden; }
.focus img.img { width:708px; height:293px; display:none; }
.focus img.img a { position:absolute; top:0; display:block; }
.focus .btn { position:absolute; z-index:100; bottom:5px; right:5px; }
.focus .btn span { float:left; text-align:center; background:#fff; cursor:pointer; width:16px; height:16px; line-height:16px; margin:3px 2px 0 2px; border:1px solid #fff; color:#9b0583; font-family:Arial; font-size:0.9em; }
.focus .btn span.hov { width:21px; height:21px; margin:0 2px; font-weight:bold; font-size:1.4em; background:#97181d; line-height:21px; border:1px solid #fff; color:#fff; }

.rzsq_bg{width:228px; height:101px; background:url('/images/ksqq_bg.jpg') no-repeat;}
.rzsq_but{width:91px; height:auto; float: right; margin-right:20px; margin-top:16px;}
.rzsq_but a{margin-bottom: 10px; display:block;}
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
<div class="container_960">
  <div class="grid_230">
    <div ><a href="http://www.ssme.gov.cn" target="_blank"><img src="/images/left_ad1.jpg" width="230" height="90" /></a></div>
    <div class="hr_10"> &nbsp; </div>
    <!--注释掉的部分 
    <div class="menu_red white">
      <h6>融资意向快速申请</h6>
    </div>
    <div class="box_3" style="background:#f9f9f7;">
      <form action="/loan/LoanRequest!loanRequest.act" method="post" style="padding:15px;">
        <ul class="Fast-reg">
          <li>
            <label>类别</label>
            <select id="smm" name="loan.applyType" onchange="javascript:smmn();">
              <option value="136">企业经营贷款</option>
              <option value="138">个人经营性贷款</option>
            </select>
          </li>
          <li>
            <label>金额</label>
            <input type="text" name="loan.loanAmount" value="" style="width:100px;"/>&nbsp;&nbsp;万元
          </li>
          <li>
            <label>期限</label>
            <input type="text" name="loan.loanMonth" value="" style="width:100px;"/>&nbsp;&nbsp;个月
          </li>
          <li style="text-align:center">
            <input  type="submit" value="立即申请" class="but_gray"  style="width:100px;" />
          </li>
        </ul>
      </form>
    </div>
     -->
    <div class="menu_red white">
      <h6>融资意向快速申请</h6>
    </div>
	<div class="box_3 rzsq_bg">
		<div class="rzsq_but">
			<a href="/loan/LoanRequest!loanRequest.act?loan.applyType=136"><img src="/images/bule_button.jpg" /></a>
			<a href="/loan/LoanRequest!loanRequest.act?loan.applyType=138"><img src="/images/orange_button.jpg" /></a>
		</div>		
	</div>         
    <div class="hr_10"> &nbsp; </div>
    <div class="fl"><a href="/user/UserAction.act"><img src="/images/cwfx.jpg" /></a></div>
    <div class="fr"><a href="/user/UserAction.act"><img src="/images/cwyc_index.jpg" /></a></div>
    <div class="hr_10"> &nbsp; </div>
    <div ><a href="/service/requestInfoAction!home.act?pageNo=1" target="_blank"><img src="/images/img_index_loan_Club.jpg" width="230" height="225"/></a></div>  
    <div class="hr_10"> &nbsp; </div>   
    <div class="menu_red white">
      <h6>融资案例</h6>
    </div>
    <div class="box_3">
      <ul class="new_li">
      	<s:iterator id="item" value="financingCases">
	        <li>
	        	<s:if test="#item.url.length()>8">
					<s:if test="#item.title.length()>25">
						<a href="${item.url} "  target="_blank">
							<s:property value="#item.title.substring(0,25)"></s:property>...</a>
						</s:if><s:else>
							<a href="${item.url}"  target="_blank">${item.title}</a>
						</s:else>
					</s:if> 
				<s:else>
					<s:if test="#item.title.length()>25">
					<a target="_blank"   href="/news/Info.act?id=${item.id}">
						<s:property value="#item.title.substring(0,25)"></s:property>...</a>
					</s:if><s:else>
						<a target="_blank"   href="/news/Info.act?id=${item.id}">${item.title}</a>
					</s:else>
				</s:else>
	        </li>
        </s:iterator>

      </ul>
    </div>
   <div class="hr_10"> &nbsp; </div> 
   <div ><a href="http://www.cbhb.com.cn" target="_blank"><img src="/images/h_img.jpg" width="230" height="140"/></a></div>
  </div>
  <div class="grid_710">
    <div class="focus"> 
      <!-- size: 708px * 293px -->
        <div class="btn"> <span class="hov">1</span><span>2</span><span>3</span> </div>
        <div class="img"> <a><img src="/images/focus1.jpg" alt="融资制胜，赢得先机" /></a> <a><img src="/images/focus2.jpg" alt="融资直通车" /></a> <a><img src="/images/focus3.jpg" alt="融资？为何找中国资金网" /></a> </div>
    </div>
    <div class="hr_10"> &nbsp; </div>
    <div ><a ><img src="/images/img_index_loan_process.jpg" width="710" height="76"/></a></div>
    <div class="hr_10"> &nbsp; </div>        
    <div class="grid_350 fl">
      <div class="menu_red white"><span class="fr white"><a href="/loan/LoanService.act">更多»</a></span>
        <h6 class="white_dot">企业融资服务</h6>
      </div>
      <div class="box_3 qyrz" style="height:auto;">
        <div class="hr_10"> &nbsp; </div>
        <div class="hr_10"> &nbsp; </div>
        <div class="qyrz-top">
        	<table class="qyrz-top_table">
              <tr>
                <td colspan="2" class="remen">热门融资产品</td>
              </tr>
            </table>
            <div>
            <table class="qyrz-top_table">
              <s:iterator value="prdFinanceList">
	              <tr>
	                <td style="vertical-align: middle;">
		                <s:if test="logo == null">
					        <img src="/images/banklogo/zj198.jpg"  class="td_img" style="white-space: nowrap;"/>
				        </s:if>
				        <s:else>
				        	<img src="/images/banklogo/${logo }"  class="td_img" style="white-space: nowrap;"/>
				        </s:else>
	                </td>
	                <td class="hot_connect">
	                	<a href="/loan/financeProduct!cusViewFinance.act?product.id=${id}">
	                		<s:if test="recommendName != null && recommendName.length()>22">
								<s:property value="recommendName.substring(0,22)"></s:property>...
							</s:if><s:else>
								${recommendName}
							</s:else>
	                	</a>
	                </td>
	              </tr>
              </s:iterator>
            </table>
            </div>
        </div>
        <div class="hr_10"> &nbsp; </div>
        <hr style="width:90%" />
        <div class="qyrz-bot">
          <div class="qyrz-bot-l fl">
            <h6 class="remen">集品餐饮基金</h6>
            <p>集品企联，只为优质餐饮企业量身定制的金融服务！创造餐饮行业的抱团价值，问题当然迎刃而解！</p>
            <span><a class="lchot" href="/finance/financeProduct!cateringf.act">了解详情</a></span> </div>
          <img class="fr" src="/images/sp.jpg" style="margin-top:10px;"/>
         </div>
      </div>
    </div>
    <div class="grid_350 fr">
      <div class="menu_red white"><span class="fr white"><a href="/finance/bankProduct!getList.act">更多»</a></span>
        <h6 class="white_dot">金融理财产品</h6>
      </div>
      <div class="box_3 qyrz" style="height:auto;">
        <div class="hr_10"> &nbsp; </div>
        <div class="hr_10"> &nbsp; </div>
        <div class="qyrz-top">
       	 <table class="qyrz-top_table">
              <tr>
                <td colspan="2" class="remen">热门理财产品</td>
              </tr>
              
              <s:iterator id="item" value="bankFinanceRecommendationList">
              <tr>
                <td style="vertical-align: middle;">
                	<s:if test="logo == null">
				        <img src="/images/banklogo/zj198.jpg" class="td_img" style="white-space: nowrap;"/>
			        </s:if>
			        <s:else>
			        	<img src="/images/banklogo/${item.logo}" class="td_img" style="white-space: nowrap;"/>
			        </s:else>
                </td>
                <td class="hot_connect"><a target="_blank" href="/finance/bankProduct!showDetails.act?id=${item.prodId}"><s:if test="%{null!=#item.title&&#item.title.length()>20}"><s:property value="#item.title.substring(0,20)"></s:property>...</s:if><s:else>${item.title }</s:else></a></td>
              </tr>
              </s:iterator>
             
            </table>
        </div>
        <div class="hr_10"> &nbsp; </div>
        <hr style="width:90%" />
        <div class="qyrz-bot">
          <div class="qyrz-bot-l fl">
            <h6 class="remen">理财产品类别</h6>
            <ul style="float:left; margin-right:60px;">
              <li><a href="/finance/bankProduct!getList.act">银行理财</a></li>
              <li><a>股票</a></li>
              <li><a>信托</a></li>
            </ul>
             <ul >
              <li><a>基金</a></li>
              <li><a>私募</a></li>
              <li><a>保险</a></li>
            </ul>
          </div>
          <img class="fr" src="/images/jrlc2.jpg"  style="margin-top:10px;"/> </div>
        <div class="hr_10"> &nbsp; </div>
        <div class="hr_5"> &nbsp; </div>
      </div>
    </div>
    <div class="hr_10"> &nbsp; </div>
    <div class="grid_350 box_4 fl" style="width:348px; ">
      <div class="gray news_menu tab_menu">
        <ul >
          <li class="hover">政策走势 </li>
          <li>金融快讯 </li>
          <li>本站动态 </li>
        </ul>
      </div>
      <div class="xxkContent">
        <ul class="xxkbox first new2_li">
          <s:iterator id="item" value="govermentNews" status="st">
           	<li class="new2_li_li">
				<s:if test="#item.url.length()>8">
					<s:if test="#item.title.length()>25">
						<a href="${item.url}"  target="_blank">
							<s:property value="#item.title.substring(0,25)"></s:property>...</a>
						</s:if><s:else>
							<a href="${item.url}"  target="_blank">${item.title}</a>
						</s:else>
					</s:if> 
				<s:else>
					<s:if test="#item.title.length()>25">
					<a target="_blank"  href="/news/Info.act?id=${item.id}">
						<s:property value="#item.title.substring(0,25)"></s:property>...</a>
					</s:if><s:else>
						<a target="_blank"  href="/news/Info.act?id=${item.id}">${item.title}</a>
					</s:else>
				</s:else>
		  </li>
          </s:iterator>
          
          <li class="fr"><a href="javascript:showNewsHome(3)">更多»</a></li>
          <li>&nbsp;</li>		  
        </ul>

        <ul class="xxkbox new2_li">
	          <s:iterator id="item" value="financeNews">
	          <li class="new2_li_li">
				<s:if test="#item.url.length()>8">
					<s:if test="#item.title.length()>25">
						<a href="${item.url} "  target="_blank">
							<s:property value="#item.title.substring(0,25)"></s:property>...</a>
						</s:if><s:else>
							<a href="${item.url}"  target="_blank">${item.title}</a>
						</s:else>
					</s:if> 
				<s:else>
					<s:if test="#item.title.length()>25">
					<a target="_blank"   href="/news/Info.act?id=${item.id}">
						<s:property value="#item.title.substring(0,25)"></s:property>...</a>
					</s:if><s:else>
						<a target="_blank"   href="/news/Info.act?id=${item.id}">${item.title}</a>
					</s:else>
				</s:else>
			  </li>
	          </s:iterator>
	          <li class="fr"><a href="javascript:showNewsHome(4)">更多»</a> </li>
	         <li>&nbsp;</li>		  
        </ul>
        <ul class="xxkbox new2_li">
	          <s:iterator id="item" value="siteNews">
	          <li class="new2_li_li">
					<s:if test="#item.url.length()>8">
						<s:if test="#item.title.length()>25">
							<a href="${item.url} "  target="_blank">
								<s:property value="#item.title.substring(0,25)"></s:property>...</a>
							</s:if><s:else>
								<a href="${item.url}"  target="_blank">${item.title}</a>
							</s:else>
						</s:if> 
					<s:else>
						<s:if test="#item.title.length()>25">
						<a target="_blank"   href="/news/Info.act?id=${item.id}">
							<s:property value="#item.title.substring(0,25)"></s:property>...</a>
						</s:if><s:else>
							<a target="_blank"   href="/news/Info.act?id=${item.id}">${item.title}</a>
						</s:else>
					</s:else>
				</li>				
	          </s:iterator>
	          <li class="fr"><a href="javascript:showNewsHome(5)">更多»</a> </li>
	           <li>&nbsp;</li>		  
        </ul>
      </div>
    </div>
    
    <div class="grid_350 box_4 fr" style="width:348px; height:208px; overflow:hidden;">
      <div class="menu_red white grid_350" style="width:348px; border-bottom:1px solid #d7d7d7; background-color:#f9f9f7; color: #424240;">
      	<h6 style="font-weight:bolder">热门服务</h6>
      </div>
      <div>
     	<ul class="xxkbox first new2_li">
	        <s:iterator id="item" value="serviceItemList" status="s">
	        	<li class="new2_li_li">
	        		<a href="/service/serviceItem!showSinItemDetail.act?itemId=${item.id}">${item.typeName} | ${item.title}</a>
	        	</li>
	        </s:iterator>
	        <li class="fr"><a href="/service/serviceItem!showHome.act">更多»</a></li>	
	        <li>&nbsp;</li>		        
     	</ul>
      </div>
    </div>
  </div>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="links container_960">
  <div class="menu_gray2">
    <h6>合作机构</h6>
  </div>
  <div class="box_3"> 
    <div class="hr_5"> &nbsp; </div>
    <ul class="bank_logo">
      <li><img src="/images/linkimg/icbc.png" /></li>
      <li><img src="/images/linkimg/ccb.png" /></li>
      <li><img src="/images/linkimg/boc.png" /></li>
      <li><img src="/images/linkimg/abc.png" /></li>
      <li><img src="/images/linkimg/bankcomm.png" /></li>
      <li><img src="/images/linkimg/sdb.png" /></li>
      <li><a href="http://www.jinyida.cn/" target="_blank"/><img src="/images/linkimg/jyd.png" /></a></li>
      <li><img src="/images/linkimg/cmb.png" /></li>
      <li><img src="/images/linkimg/hxb.png" /></li>
      <li><img src="/images/linkimg/cib.png" /></li>
      <li><img src="/images/linkimg/ecitic.png" /></li>
      <li><img src="/images/linkimg/gzcb.png" /></li>
      <li><img src="/images/linkimg/njcb.png" /></li>
      <li><a href="http://www.chinabaohan.com/" target="_blank"/><img src="/images/linkimg/bhw.png" /></a></li>
    </ul>
    <div class="hr_5"> &nbsp; </div>
  </div>
</div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp" />


</body>
</html>