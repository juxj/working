<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="common" uri="/Common"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>推荐产品</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/module.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-validate.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/jquery.validate.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.datepicker.min.js"></script>
<script type="text/javascript" src="/script/jquery.ui.dialog.min.js" > </script>
<style>
.ctl {
	table-layout: fixed
}

.ctl td {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	padding: 2px
}
</style>
<script type="text/javascript">
    $(function() {
    	$("#timeOne").datepicker();
    	$("#timeTwo").datepicker();
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
    function selectDetail(id){
    	window.open("/loan/financeProduct!cusViewFinance.act?product.id="+id);
    	//location.href = "/loan/financeProduct!cusViewFinance.act?product.id="+id;
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
  <!--资金网推荐产品-->
  <div class="M_menu">
  	<a href="#">首页</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;<a href="#">融资管理</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;<a href="/user/loan/LoanRequest!loanManage.act">融资意向单管理</a>&nbsp;&nbsp;<b>></b>&nbsp;&nbsp;<a href="#">推荐产品</a>
  </div>
  <div class="M_menu" style="border: 0px;">
  	根据您的需求，中国资金网在进行了详尽的分析后为您推荐以下几款最为适合您的融资产品
  </div>
  <div class="M_box">
        <table border="0" cellspacing="0" class="ctl" cellpadding="0" style="width:100%" >
     	<tr class="BankProductHeader">
     		<th width="16%" style="padding-left:25px;">融资渠道/项目</th>
            <th width="10%">金额</th>
	        <th>期限</th>
	        <th>基准年利率</th>
	        <th>浮动范围</th>
	        <th width="15%;">还款方式</th>
	        <th >产品特点</th>
	        <th >审批时间</th>
            <th align="center">操作</th>
          </tr>
		 	<s:iterator id ="item" value="recommendByAdm">
			<tr  class="gold_connect">
				<td width="16%" style="padding-left:25px;">
					<s:if test="logo == null">
				        <img src="/images/banklogo/zj198.jpg"  class="td_img" style="white-space: nowrap;">
			        </s:if>
			        <s:else>
			        	<img src="/images/banklogo/${logo }"  class="td_img" style="white-space: nowrap;">
			        </s:else>
			        <div style="padding-left:35px;">        
			        	<common:print valueId="userId" type="user"/><br/>
			        	${financeName }
			        </div>
				</td>
		        <td width="10%"><s:number name="financeLittleamount" />~<s:number name="financeBigamount" />万元</td>
		        <td width="15%">${loan.loanMonth }个月</td>
		        <td>
		        	<common:print valueId="loan.loanMonth" type="rate"/>%
		        	<s:if test="serviceCost != null && serviceCost > 0">
		        		<br/>另收${serviceCost }%服务费
		        	</s:if>
		        </td>
		        <td>
		        	<s:if test="interestType == 155">
		        		<s:iterator value="interests">
		        			<s:if test="loan.loanMonth > financeStartdt && loan.loanMonth <= financeEnddt">
		        				+${rateUp }%
		        			</s:if>
		        		</s:iterator>
		        	</s:if>
		        </td>
		        <td><common:print valueId="repaymentType" /></td>
		       	<td><common:print valueId="proSpecial" /></td>
		        <td>${checkTime }个工作日</td>
		        <td width="10%"><input  type="button" value="查看" class="but_gray" onclick="selectDetail(${id})" name="" style="width:80px;" /></td>
			</tr>
			</s:iterator>
        </table>
  </div>
   <div class="hr_10"> &nbsp;</div>
  <!--资金网推荐产品--> 
  
  <!--金融机构推荐产品-->
  <div class="M_menu" style="border: 0px;">
  	另外，银行或贷款机构也为您推荐了以下产品
  </div>
  <div class="M_box">
        <table border="0" cellspacing="0" class="ctl" cellpadding="0" style="width:100%" >
     	<tr class="BankProductHeader">
     		<th width="16%" style="padding-left:25px;">融资渠道/项目</th>
            <th width="10%">金额</th>
	        <th>期限</th>
	        <th>基准年利率</th>
	        <th>浮动范围</th>
	        <th width="15%;">还款方式</th>
	        <th >产品特点</th>
	        <th >审批时间</th>
            <th align="center">操作</th>
          </tr>
		 	<s:iterator id ="item" value="recommendByOrg">
			<tr  class="gold_connect">
				<td width="16%" style="padding-left:25px;">
					<s:if test="logo == null">
				        <img src="/images/banklogo/zj198.jpg"  class="td_img" style="white-space: nowrap;">
			        </s:if>
			        <s:else>
			        	<img src="/images/banklogo/${logo }"  class="td_img" style="white-space: nowrap;">
			        </s:else>
			        <div style="padding-left:35px;">        
			        	<common:print valueId="userId" type="user"/><br/>
			        	${financeName }
			        </div>
				</td>
		        <td width="10%"><s:number name="financeLittleamount" />~<s:number name="financeBigamount" />万元</td>
		        <td width="15%">${loan.loanMonth }个月</td>
		        <td>
		        	<common:print valueId="loan.loanMonth" type="rate"/>%
		        	<s:if test="serviceCost != null && serviceCost > 0">
		        		<br/>另收${serviceCost }%服务费
		        	</s:if>
		        </td>
		        <td>
		        	<s:if test="interestType == 155">
		        		<s:iterator value="interests">
		        			<s:if test="loan.loanMonth > financeStartdt && loan.loanMonth <= financeEnddt">
		        				+${rateUp }%
		        			</s:if>
		        		</s:iterator>
		        	</s:if>
		        </td>
		        <td><common:print valueId="repaymentType" /></td>
		       	<td><common:print valueId="proSpecial" /></td>
		        <td>${checkTime }个工作日</td>
		        <td width="10%"><input  type="button" value="查看" class="but_gray" onclick="selectDetail(${id})" name="" style="width:80px;" /></td>
			</tr>
			</s:iterator>
        </table>
  </div>
   <div class="hr_10"> &nbsp;</div>
  <!--金融机构推荐产品--> 
<div class="clear"> &nbsp; </div>
<div class="hr_20"> &nbsp; </div>

    
</div>
<!--弹出框内容推荐产品页面-->
<!--foot-->
<jsp:include page="/public/bottom.jsp" />
<!--foot-->
</body>
</html>
