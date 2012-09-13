<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>用户中心-账户管理-消息与提醒</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/jquery-ui.css" type="text/css" media="screen, projection" />	
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" ></script>
<script type="text/javascript" src="/script/jquery.ui.min.js" > </script>
<script type="text/javascript" src="/script/jquery.ui.dialog.min.js" > </script>
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
	});

	function toPage(pageNum, pageSize) {
		var url = "/news/ntyMessage!viewMsg.act?pager.currentPage=" + pageNum
				+ "&pager.pageCount=" + pageSize;
		$('#comForm').attr('action', url);
		$('#comForm').submit();
	}

	$(function() {
		$("#selectall").toggle(function() {
			$("#selectall").each(function() {
				$("input[name='msgIds']").attr('checked', true);
			});
			$(this).html('取消');
		}, function() {
			$("#selectall").each(function() {
				$("input[name='msgIds']").attr('checked', false);
			});
			$(this).html('全选');
		});
	})

	function delAll() {
		if ($("input[name='msgIds']:checked").length == 0) {
			alert("请选择要删除的数据");
			return false;
		}
		if (window.confirm('你确定要删除该记录！')) {
			var url = "/news/ntyMessage!delAll.act";
			$('#comForm').attr('action', url);
			$('#comForm').submit();
			return true;
		} else {
			return false;
		}
	}
	function del(mId) {
		if (window.confirm('你确定要删除该记录！')) {
			location.href= "/news/ntyMessage!delAll.act?mid="+mId;
			return true;
		} else {
			return false;
		}
	}
	function detail(con,mid){
		$('#content').html(con);
		$('#content').dialog({width:700,modal:true});
		$.ajax({
			url : '/news/ntyMessage!upIsRead.act',
			dataType : 'json',
			type : 'post',
			data : {mid: mid},
			cache : false,
			success : function(r) {
				if (r.success) {
					//console.info(r);
				}
			}
		});
	}
	
</script>
</head>

<body>
<!--头部-->
<div class="header user_header">
<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
<div class="hr_10"> &nbsp; </div>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="M_menu">
账户管理&nbsp;&nbsp;<b>&gt;</b>&nbsp;&nbsp;消息与提醒
</div>
<div class="hr_10"> &nbsp; </div>
<div class="container_950">
	<div class="P_title" style="border-bottom:5px solid #003961;">消息与提醒</div>
</div>
<div class="hr_10"> &nbsp;</div>
<!--消息与提醒-->
<div style="width:950px; margin: 0 auto;" class="box_4">
	  <div class="menu_red n_title">
	  	<h6 style="font-weight:bolder">置顶消息</h6>
	  </div>
		<table class="n_table">
		<s:if test="topMsgs.size>0">
		<s:iterator value="topMsgs" var="j">
		  <tr>
		    <td><a href="javascript:void(0);" onclick="detail('${j.contents}',${j.id });">${j.title } </a></td>
		    <td><s:date name="#j.senddt " /> </td>
		    <td><a href="javascript:void(0);" onclick="detail('${j.contents}',${j.id });">查看</a></td>
		  </tr>
		 </s:iterator>
		 </s:if>
		 <s:else>
		 <tr><td colspan="3">暂无</td></tr>
		 </s:else>
		</table>	     	
</div>
<div class="hr_10"> &nbsp;</div>
<div style="width:950px; margin: 0 auto;" class="box_4">
	  <div class="menu_red n_title">
	  	<h6 style="font-weight:bolder;">收到的消息</h6>
	  </div>
	  <form id="comForm" action="" name="">
		<table class="n_table">
		  <tr>
		    <td colspan="6" class="b_td"><a href="/news/ntyMessage!viewMsg.act"  <s:if test="css==-1">class="a_active"</s:if> >所有消息</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/news/ntyMessage!unRead.act" <s:if test="css==0">class="a_active"</s:if>>未读消息</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/news/ntyMessage!read.act" <s:if test="css==1">class="a_active"</s:if> >已读消息</a></td>
		  </tr>
		  <s:iterator value="pager.data" var="j">
		  <tr>
		  <!-- 
		    <td style="padding-top:15px;" align="center"><input name="msgIds" type="checkbox" value="${j.id }" /></td>
		   -->
		    <td><a href="javascript:void(0);" onclick="detail('${j.contents}',${j.id });">${j.title }</a></td>
		    <td><s:date name="#j.senddt " /></td>
		    <td>&nbsp;</td>
		    <td>&nbsp;</td>
		    <td align="center"><a href="javascript:void(0);" onclick="detail('${j.contents}',${j.id });">查看</a>&nbsp; 
		    <!-- |&nbsp;<a href="javascript:void(0);" onclick="del(${j.id });">删除</a> -->
		    </td>
		  </tr>
		  </s:iterator>
		  <!-- 
		  <tr>
		    <td colspan="6" class="view_detail" style="padding-top:10px;">
		    	<a href="javascript:void(0);" id="selectall" >全选</a>
		    	<a href="javascript:void(0);" onclick="delAll();" >删除</a>
		    </td>
		  </tr>
		   -->
		  <tr>
		        <td style="padding-left:22px; font-size:14px;" colspan="5">
		        <div class="pagination right">
				<s:include value="/public/pagination.jsp"/>
				</div>
				</td>
		   </tr>
		</table>
	</form>		     	
</div>

<!--弹出框内容登录页面-->
<div id="content" style="display:none;" title="查看详细：">
	
</div>

<!--消息与提醒--> 
<div class="clear"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp" />
</body>
</html>
