var checkformresult=0;

function check_username() {
	var username_error = $("#username_error");
	if(/^\w{6,18}$/.test($("#username").val())){
		username_error.html("");
	}else{
		username_error.addClass("txt-err");
		username_error.html("6-18个字符，可使用字母、数字、下划线。");
		checkformresult=1;
	}
}
function check_email() {
	var email_error = $("#email_error");
	if(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test($("#email").val())){
		email_error.html("");
	}else if(!$("#email").val()){
		email_error.addClass("txt-err");
		email_error.html("请输入邮箱。");
		checkformresult=1;
	}else{
		email_error.addClass("txt-err");
		email_error.html("邮箱格式错误。");
		checkformresult=1;
	}
}
function check_pass() {
	var pass_error = $("#pass_error");
	if(/^\w{6,16}$/.test($("#pass").val())){
		pass_error.html("");
	}else{
		pass_error.addClass("txt-err");
		pass_error.html("6~16个字符，区分大小写。");
		checkformresult=1;
	}
}
function check_rpass() {
	var rpass_error = $("#rpass_error");
	if($("#pass").val()==$("#rpass").val()){
		rpass_error.html("");
	}else{
		rpass_error.addClass("txt-err");
		rpass_error.html("输入的密码不一致。");
		checkformresult=1;
	}
}
function check_mobile() {
	var mobile_error = $("#mobile_error");
	if(/^1\d{10}$/.test($("#mobile").val())){
		mobile_error.html("");
	}else if(!$("#mobile").val()){
		mobile_error.addClass("txt-err");
		mobile_error.html("请输入手机号码。");
		checkformresult=1;
	}else{
		mobile_error.addClass("txt-err");
		mobile_error.html("手机号码格式错误。");
		checkformresult=1;
	}
}
function check_fullname() {
	var fullname_error = $("#fullname_error");
	if(/^[\u4e00-\u9fa5]{1,6}$/.test($("#fullname").val())){
		fullname_error.html("");
	}else if(!$("#fullname").val()){
		fullname_error.addClass("txt-err");
		fullname_error.html("请输入真实姓名。");
		checkformresult=1;
	}else{
		fullname_error.addClass("txt-err");
		fullname_error.html("姓名必须为1到6个汉字。");
		checkformresult=1;
	}
}
function checkAll(){
	checkformresult=0;
	check_username();check_email();check_pass();check_rpass();check_mobile();check_fullname();
}
function checkform(){
	checkAll();
	if(checkformresult==0){
		$("#regform").submit();
	}else{
		check_username();check_email();check_pass();check_rpass();check_mobile();check_fullname();
	}
}