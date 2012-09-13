<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>资信通vip宣传页</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/member1.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" ></script>
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

<style>
.zxt_m_rz{width:468px; height:200px; background: #f9f9f7; border-bottom:5px solid #97181d;}
.zxt_m_rz .rz_img{width:125px; height:80px; float: left; margin:25px 25px 0 25px;}
.zxt_m_rz .rz_connect{width:250px; float: left; margin-top:25px; line-height:30px;}
.zxt_left{width:410px; margin: 0 auto; margin-top: 20px; height:160px;}
.zxt_left .zxt_left_img{width:60px; height:60px; float: left;}
.zxt_left .zxt_left_rt{width:330px; float: right;}
</style>

</head>
<body>
<!--头部-->
<!--头部-->
<div class="header user_header">
	<jsp:include page="/WEB-INF/web/user/head.jsp"></jsp:include>
</div>
<div class="hr_10"> &nbsp; </div>
<!--资信通vip宣传页-->
<div class="container_950">
	<div><img src="/images/zxt_banner.jpg" alt="资信通vip宣传页" /></div>
	<div class="hr_10"> &nbsp; </div>
	<!--左边部分 -->
	<div class="box_4 fl" style="width:468px;">
		<div class="zxt_m_rz">
			<div class="rz_img"><img src="/images/rz_member.jpg" alt="资信通认证会员" /></div>
			<div class="rz_connect">
				<h1>资信通认证会员</h1>
				<h6>年费：365元人民币</h6>
				<h6>多重特权，融资全程无忧!</h6>
				<div class="center">
				  <input type="button"  class="but_gray"  value="申请资信通会员" />
				</div>
				<span>您也可以拨打客服热线400-8890-189进行申请</span>								
			</div>
		</div>	
		<div class="zxt_left">
			<div class="zxt_left_img"><img src="/images/m_icon01.jpg" alt="资信通认证会员" /></div>
			<div class="zxt_left_rt">
				<h6>身份认证，诚信保障</h6>
				<p>资信通认证会员将会有特殊的身份标示，同等条件下信息优先显示，受到更多金融机构的关注。</p>
			</div>
		</div>
		<div class="zxt_left">
			<div class="zxt_left_img"><img src="/images/m_icon03.jpg" alt="资信通认证会员" /></div>
			<div class="zxt_left_rt">
				<h6>全程融资服务追踪</h6>
				<p>中国资金网将指定专业金融服务人员为会员提供一对一的服务，全程协助融资业务的进行，如帮助提供融资咨询包括多家银行的融资产品选择、融资申请、融资审批状态实时追踪等。</p>
			</div>
		</div>
		<div class="zxt_left">
			<div class="zxt_left_img"><img src="/images/m_icon05.jpg" alt="资信通认证会员" /></div>
			<div class="zxt_left_rt">
				<h6>专业评估与建议</h6>
				<p>在整个申请融资过程中间，中国资金网的金融服务专员将会全程跟踪服务，在贷前为用户进行全面评估，向不满足银行申贷条件的用户出具改进或终止申贷的建议报告。</p>
			</div>
		</div>
		<div class="zxt_left">
			<div class="zxt_left_img"><img src="/images/m_icon06.jpg" alt="资信通认证会员" /></div>
			<div class="zxt_left_rt">
				<h6>专业评估工具</h6>
				<p>资信通认证会员可使用资信评估、财务分析、融资预测等专业分析工具，通过分析让您认清自己的财务现状，知己知彼才能百贷百胜！</p>
			</div>
		</div>
		<div class="zxt_left">
			<div class="zxt_left_img"><img src="/images/m_icon07.jpg" alt="资信通认证会员" /></div>
			<div class="zxt_left_rt">
				<h6>资金盾保护，安全有保障</h6>
				<p>资信通认证会员将能以优惠的价格购买资金网推出的资金盾，只要通过简单的绑定，便能全方位保护您的帐户安全，并且资金盾用户只需通过数字签名方式即可以通过线上传递文件，保证了您的文件信息安全，同时也免去您线下传递文件的种种繁琐操作，鼠标一点，轻松申请。</p>
			</div>
		</div>
		<div style="text-align:center; margin-bottom: 20px;"><input type="button" class="but_gray" value="立即申请"/></div>									
	</div>
	<!--右边部分 -->
	<div style="width:468px;" class="box_4 fr">
		<div class="zxt_m_rz">
			<div class="rz_img"><img src="/images/vip_member.jpg" alt="资信通VIP会员" /></div>
			<div class="rz_connect">
				<h1>资信通VIP会员</h1>
				<h6>年费：5000元人民币</h6>
				<h6>最高特权，尊享贵宾待遇!</h6>
				<div class="center">
				  <input type="button" onfocus="this.blur()" onclick="this.form.submit()" class="but_gray"  value="资信通VIP会员" />
				</div>
				<span>您也可以拨打客服热线400-8890-189进行申请</span>								
			</div>
		</div>
		<div class="zxt_left">
			<div class="zxt_left_img"><img src="/images/m_icon02.jpg" alt="资信通认证会员" /></div>
			<div class="zxt_left_rt">
				<h6>一对一融资顾问服务，尊享VIP待遇</h6>
				<p>中国资金网金融服务专员一对一专享服务升级：金融服务专员的融资融资咨询服务从贷前咨询升级为融资全流程服务，包括合同和放款过程追踪、还息还贷提醒、配合银行贷后管理等全流程的咨询和支持服务，全方位、全过程地为您的融资提供有力支持！</p>
			</div>
		</div>
		<div class="zxt_left">
			<div class="zxt_left_img"><img src="/images/m_icon04.jpg" alt="资信通认证会员" /></div>
			<div class="zxt_left_rt">
				<h6>专业贷后服务，让您再贷不难</h6>
				<p>资信通 VIP会员能独享中国资金网提供的贷后管理服务，包括贷后检查提醒、贷后管理软件工具、帮助会员在融资期内定期上传企业经营信息，获得良好的信用积累，获得更高的续贷机会！</p>
			</div>
		</div>
		<div class="zxt_left">
			<div class="zxt_left_img"><img src="/images/m_icon06.jpg" alt="资信通认证会员" /></div>
			<div class="zxt_left_rt">
				<h6>不限次使用专业评估工具</h6>
				<p>中国资金网提供会为资信通VIP会员提供完整的资信评估、财务分析、融资预测等专业分析工具，并且不限次数，您可随时随地进行评估与分析。通过分析让您认清自己的财务现状，知己知彼才能百贷百胜！</p>
			</div>
		</div>
		<div class="zxt_left">
			<div class="zxt_left_img"><img src="/images/m_icon07.jpg" alt="资信通认证会员" /></div>
			<div class="zxt_left_rt">
				<h6>资金盾保护，安全有保障</h6>
				<p>资信通认证会员将能以优惠的价格购买资金网推出的资金盾，只要通过简单的绑定，便能全方位保护您的帐户安全，并且资金盾用户只需通过数字签名方式即可以通过线上传递文件，保证了您的文件信息安全，同时也免去您线下传递文件的种种繁琐操作，鼠标一点，轻松申请。</p>
			</div>
		</div>
		<div class="zxt_left">
			<div class="zxt_left_img"><img src="/images/m_icon08.jpg" alt="资信通认证会员" /></div>
			<div class="zxt_left_rt">
				<h6>金融服务俱乐部，与资金方面对面</h6>
				<p>专业融资对接会。资信通会员能够参加中国资金网举办的有政府、行业协会、金融机构等参与的金融服务俱乐部等活动，与资金方面对面交流，扩大融资渠道和机会。</p>
			</div>
		</div>
		<div class="zxt_left">
			<div class="zxt_left_img"><img src="/images/m_icon09.jpg" alt="资信通认证会员" /></div>
			<div class="zxt_left_rt">
				<h6>第三方特惠服务，资金网替您省钱</h6>
				<p>资信通 VIP会员在申请中国资金网上的第三方服务时，可享受特别的优惠，资金网替你省钱！并且中国资金网还会联合第三方推出一系列针对VIP会员的特惠活动，多种特惠服务助您迈向成功！</p>
			</div>
		</div>				
		<div style="text-align:center; margin-bottom: 20px;"><input type="button" class="but_gray" value="立即申请"/></div>			
	</div>
	<div class="clear"> &nbsp;</div>	
</div>
<!--资信通vip宣传页--> 
<div class="clear"> &nbsp;</div>
<div class="hr_10"> &nbsp;</div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>