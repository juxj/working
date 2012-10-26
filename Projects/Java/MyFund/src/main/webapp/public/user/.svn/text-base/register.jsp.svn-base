<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>注册页面-中国资金网</title>
<link rel="stylesheet" href="/css/public.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/public2.css" type="text/css" media="screen, projection" />
<link rel="stylesheet" href="/css/reg.css" type="text/css" media="screen, projection" />
<script type="text/javascript" src="/script/jquery-1.7.2.min.js" > </script>
<script type="text/javascript" src="/script/register.js" > </script>
<script type="text/javascript">
$(function() {
    $(".input-text").focus(function() {
        $(this).addClass("input-focus");
    }).blur(function() {
        $(this).removeClass("input-focus");
    });
	$(".close").click(function() {
        $(this).parent().fadeTo(400, 0,
        function() {
            $(this).slideUp(400);
        });
        return false;
    });
});
</script>
<s:if test="msg!=null"><script type="text/javascript">checkAll();</script> </s:if>
</head>
<body>
<!--头部2-->
<div class="header user_header2 reg_header">
<jsp:include page="/public/head3.jsp"></jsp:include>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--主体部分-->
<div class="container_960">
  <div class="box_948"> <span class="yourposition">新用户注册</span>
  <s:if test="msg!=null">
      <div class="notification attention png_bg"> <a href="#" class="close"><img src="/images/icons/cross_grey_small.png"  title="关闭此信息" alt="关闭" /></a>
        <div>${msg }</div>
      </div>
      </s:if>
    <div class="hr_10"> &nbsp; </div>
    <div class="fl" style="width:650px">
    <form id="regform" class="out_box_form" action="/Register!register.act" method="post">
      <dl>
        <dd>
          <h6><span class="txt-impt">*</span>用户名：</h6>
          <input id="username" name="username" onblur="check_username()" type=text value="${username}" class="input-text" />
          <span id="username_error" class="txt-info">6-18个字符，可使用字母、数字、下划线。</span></dd>
        <dd>
          <h6><span class="txt-impt">*</span>密码：</h6>
          <input id="pass" name="password" onblur="check_pass()" type=password value="" class="input-text" />
          <span id="pass_error" class="txt-info">6~16个字符，区分大小写。</span></dd>
        <dd>
          <h6><span class="txt-impt">*</span>确认密码：</h6>
          <input id="rpass" onblur="check_rpass()" type=password value="" class="input-text" />
          <span id="rpass_error" class="txt-info">请再次输入密码。</span></dd>
        <dd>
          <h6><span class="txt-impt">*</span>姓名：</h6>
          <input id="fullname" name="realname" onblur="check_fullname()" type=text value="${realname}" class="input-text" style="width: 85px;"/>
          &nbsp;&nbsp;
          <s:if test="gender==null">
          <s:radio name="gender" list="#{1:'先生',0:'女士'}" value="1" listKey="key" listValue="value"/>
          </s:if><s:else>
          <s:radio name="gender" list="#{1:'先生',0:'女士'}" value="gender" listKey="key" listValue="value"/>
          </s:else>
          <span id="fullname_error" class="txt-info">请输入真实姓名。</span></dd>
        <dd>
          <h6><span class="txt-impt">*</span>邮箱：</h6>
          <input id="email" name="email" onblur="check_email()" type=text value="${email}" class="input-text" />
          <span id="email_error" class="txt-info">邮箱用于激活用户、找回密码等。</span></dd>
        <dd>
          <h6><span class="txt-impt">*</span>手机号：</h6>
          <input id="mobile" name="mobile" onblur="check_mobile()" type=text value="${mobile}" class="input-text" />
          <span id="mobile_error" class="txt-info">常用的手机号码，用于接受通知和验证等。</span></dd>
        <dd>
          <h6>&nbsp; </h6>
          <input id=u4 type="button" onclick="checkform()" class="btnsub bred"  value="同意以下协议并提交" />
        </dd>
      </dl>
      <textarea class="txt_tiaokuan" readonly="readonly">
本网站由鼎辉信息技术（上海）有限公司负责运营【以下本网站均指中国资金网及鼎辉信息技术（上海）有限公司】。请您使用本网站之前敬请仔细阅本服务协议。通过访问或使用本网站，您即明确同意遵守本服务协议并接受之约束。如果您不接受本服务条款的全部规定，则请勿使用本网站。您一旦使用本网站的服务，即视为您已了解并完全同意本服务协议各项内容，包括本网站对服务协议随时做出的任何修改。除非另有规定，否则任何变更或修改将在修订内容于本网站发布之时立即生效，您对本网站的使用、继续使用将表明您接受此等变更或修改。如您不同意本服务协议及/或随时对其的修改、及/或法律声明，您可以主动取消本网站提供的服务。

    1.注册要求及隐私保护
        1.本网站只接受具备完全民事行为能力的自然人，或者是具有合法经营资格的实体组织成为网站用户。如您不符合资格，请勿注册。否则，本网站保留中止或终止您用户资格的权利。
        2.用户在申请使用本网站服务时，必须提供真实、有效的个人资料，并不断更新注册资料。如果因注册信息不真实而引起的问题及其后果，本网站不承担任何责任。倘若本网站发现用户的注册资料是虚假、不准确或不完整的，则可自行决定终止该用户的帐号。
        3.用户注册成功后，本网站将提供用户一个用户帐号及相应的密码，该用户帐号和密码由用户自行负责保管；用户应当对以其用户帐号进行的所有活动和事件负法律责任。
        4.因您保管疏忽或因黑客行为、计算机病毒侵入或发作致使帐号、密码被他人非法使用、盗用、篡改或丢失的，本网站不承担责任。如您发现任何非法使用用户帐号或安全漏洞的情况，请立即与本网站联系。
        5.本网站保证不对外公开或向第三方提供用户注册的个人资料信息，及用户在使用服务时存储的非公开内容信息，但下列情况除外：
           1.事先获得用户的明确授权许可；
           2.按照相关司法机关或政府主管部门的要求；
           3.只有透露用户的个人资料，才能提供用户所要求的相应产品和服务；
           4.以维护本网站合法权益之目的；
           5.维护社会公众利益；
           6.符合其他合法要求；
           7.由于与本网站链接的其它网站所造成用户资料泄露及由此而导致的任何法律争议和后果。 
        6.用户连续6个月未登录的帐号，本网站保留关闭的权利。 
    2.服务内容及费用 

本网站的具体服务内容由本网站根据实际情况提供，例如融资、理财、增值服务等，本网站保留根据实际情况随时调整本网站平台提供的服务种类、形式。本网站不承担因业务调整给用户造成的损失。本网站对提供的服务拥有最终解释权。您因进行交易、向本网站获取有偿服务而发生的相关服务费用和所有应纳税赋，以及相关硬件、软件、通讯、网络服务及其他方面的费用均由您自行承担。本网站保留变更、中断或终止部分网络服务的权利。

   1.涉及第三方网站 

本网站的网站内容可能涉及由第三方所有、控制或者运营的其他网站的内容或链接（以下称“第三方网站”）。本网站不能保证也没有义务保证第三方网站上的信息的真实性和有效性。对于该等内容或链接，您确认按照第三方网站的服务协议确定相关权利义务，而不是按照本协议。第三方网站的内容、产品、广告和其他任何信息均由您自行判断并承担风险责任，而与本网站无关。

    1.不保证 

本网站提供的服务中不带有对本网站中的任何用户、任何交易的任何保证，无论是明示、默示或法定的，因此本网站及其股东、创建人、高级职员、董事、代理人、关联公司、母公司、子公司和雇员不保证由其他用户或机构提供的内容的真实性、充分性、及时性、可靠性、完整性和有效性，并且不承担任何由此引起的法律责任。

   1.免责声明 

在任何情况下，本网站对您使用本网站服务而产生的任何形式的直接或间接损失均不承担法律责任，包括但不限于资金损失、利润损失、交易中断损失等。因为本网站或者涉及的第三方网站的设备、系统问题或者因为计算机病毒造成的损失，本网站均不负责赔偿。如果因为用户违反有关法律或者本协议之规定，使本网站遭受任何损失，受到任何第三方的索赔，或任何行政管理部门的处罚，用户应对本网站作出相应的补偿。

    1.服务变更、中断或终止
        1.如因系统维护或升级的需要而需暂停网络服务、服务功能的调整，本网站将尽可能在网站上进行通告。由于用户未能及时查看、浏览通告信息而造成的损失，本网站不承担任何责任。
        2.用户同意，本网站可自行决定变更提供服务的内容，本网站可自行决定授权第三方向用户提供原本由本网站提供的服务，不需向用户承担任何因变更服务所产生的责任。
        3.如发生下列任何一种情形，本网站有权单方面中断或终止向用户提供服务而无需通知用户，无需对用户或第三方承担任何责任：
            1.用户提供的个人资料不真实；
            2.用户违反本服务条款；
            3.未经本网站同意，将本网站平台用于商业目的。 
        4.用户可随时根据需要通知本网站终止提供服务，用户服务终止后，用户使用服务的权利同时终止。自用户终止之日起，本网站与用户有关服务协议约定的权利义务不再履行。 
    2.服务协议的完善和修改
        1.本网站有权根据互联网的发展和中华人民共和国有关法律、法规的变化，不时地完善和修改本网站服务协议。
        2.本网站保留随时修改服务协议的权利，用户在使用本网站平台服务时，有必要对最新的本网站服务协议进行仔细阅读和重新确认，当发生有关争议时，应以最新的服务协议条款为准。 
    3.特别约定
        1.用户使用本服务的行为若有任何违反国家法律法规或侵犯任何第三方的合法权益的情形时，本网站有权直接删除该等违反规定之信息，并可以暂停或终止向该用户提供服务。
        2.若用户利用本服务从事任何违法或侵权行为，由用户自行承担全部责任，因此给本网站或任何第三方造成任何损失，用户应负责全额赔偿。并使本网站免受任何损害赔偿。
        3.所有发给用户的通告或通知都可以通过重要页面的公告、通告、电子邮件以及常规信件的形式传送。
        4.本服务协议最终解释权归本网站所有。 
    4.适用法律和管辖 

因本网站提供服务所产生的争议均适用中华人民共和国法律，并由鼎辉信息技术（上海）有限公司住所地人民法院管辖。 
</textarea>
    </form>
    </div>
    <div class="notice fr" style="font-size:14px;"><p>已有中国资金网账号,请直接登录</p><p><a class="btn blue1" href="/Account.act">直接登录</a></p></div>
    <div class="hr_10"> &nbsp; </div>
    <div class="hr_10"> &nbsp; </div>
  </div>
</div>
<div class="hr_10"> &nbsp; </div>
<div class="hr_10"> &nbsp; </div>
<!--尾部-->
<jsp:include page="/public/bottom.jsp"></jsp:include>
</body>
</html>