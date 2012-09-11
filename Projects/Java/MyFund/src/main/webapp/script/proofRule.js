// 审核后无法修改
//jQuery.validator.addMethod("notrevise", function(value, element) {
//return this.optional(element) ||false;
//}, "审核后无法修改。");
// 身份证号码验证
jQuery.validator.addMethod("idcardno", function(value, element) {
	var tel =/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$|^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$/;
	return this.optional(element) || (tel.test(value));
}, "身份证号码错误");
//汉字和字母
jQuery.validator.addMethod("chne", function(value, element) {
var tel =/^[\u4e00-\u9fa5\w\s\(\)]+$/;
return this.optional(element) || (tel.test(value));
}, "不允许特殊字符.");
//组织机构代码验证
jQuery.validator.addMethod("Organization", function(value, element) {
return this.optional(element) || /^([0-9A-Z]){8}-[0-9|X]$/.test(value);
}, "格式错误");
//字母数字
jQuery.validator.addMethod("alnum", function(value, element) {
return this.optional(element) || /^[a-zA-Z0-9]+$/.test(value);
}, "只能包括英文字母和数字");
// 汉字
jQuery.validator.addMethod("chcharacter", function(value, element) {
var tel = /^[\u4e00-\u9fa5]+$/;
return this.optional(element) || (tel.test(value));
}, "请输入汉字");
// 字符最小长度验证（一个中文字符长度为2）
jQuery.validator.addMethod("stringMinLength", function(value, element, param) {
var length = value.length;
for ( var i = 0; i < value.length; i++) {
if (value.charCodeAt(i) > 127) {
length++;
}
}
return this.optional(element) || (length >= param);
}, $.validator.format("长度不能小于{0}."));
// 字符最大长度验证（一个中文字符长度为2）
jQuery.validator.addMethod("stringMaxLength", function(value, element, param) {
var length = value.length;
for ( var i = 0; i < value.length; i++) {
if (value.charCodeAt(i) > 127) {
length++;
}
}
return this.optional(element) || (length <= param);
}, $.validator.format("字符长度不能大于{0}，一个中文字符长度为2."));

// 字符验证
jQuery.validator.addMethod("string", function(value, element) {
return this.optional(element) || /^[\u0391-\uFFE5\w]+$/.test(value);
}, "不允许包含特殊符号.");
//手机和电话号码验证

// 手机号码验证
jQuery.validator.addMethod("mobile", function(value, element) {
var tel = /^((13[0-9])|(15[^4,\d])|(18[0,5-9]))\d{8}$|^[0]{1}[0-9]{2,3}-[0-9]{7,8}$|^[0]{1}[0-9]{2,3}[0-9]{7,8}$/;
return this.optional(element) || (tel.test(value));
}, "联系电话格式错误.");
// 电话号码验证
jQuery.validator.addMethod("phone", function(value, element) {
var tel = /^[0]{1}[0-9]{2,3}-[0-9]{7,8}|[0]{1}[0-9]{2,3}[0-9]{7,8}$/;
return this.optional(element) || (tel.test(value));
}, "电话号码格式错误.");
//电子邮箱
jQuery.validator.addMethod("iemail", function(value, element) {
var tel = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/g;
return this.optional(element) || (tel.test(value));
}, "邮箱错误.");
//个人的联系方式
jQuery.validator.addMethod("ContacInfo", function(value, element) {
var tel = /^[\w\@\.\-]*$/;
return this.optional(element) || (tel.test(value));
}, "格式错误.");
// 邮政编码验证
jQuery.validator.addMethod("zipCode", function(value, element) {
var tel = /^[0-9]{6}$/;
return this.optional(element) || (tel.test(value));
}, "邮政编码格式错误.");
// 必须以特定字符串开头验证
jQuery.validator.addMethod("begin", function(value, element, param) {
var begin = new RegExp("^" + param);
return this.optional(element) || (begin.test(value));
}, $.validator.format("必须以 {0} 开头."));
// 验证两次输入值是否不相同
jQuery.validator.addMethod("notEqualTo", function(value, element, param) {
return value= $(param).val();
}, $.validator.format("两次输入不能相同."));
// 验证值不允许与特定值等于
jQuery.validator.addMethod("notEqual", function(value, element, param) {
return value = param;
}, $.validator.format("输入值不允许为{0}."));
// 验证值必须大于特定值(不能等于)
jQuery.validator.addMethod("gt", function(value, element, param) {
return value > param;
}, $.validator.format("输入值必须大于{0}."));
// 验证值小数位数不能超过两位
jQuery.validator.addMethod("decimal", function(value, element) {
var decimal = /^-?\d+(\.\d{1,2})?$/;
return this.optional(element) || (decimal.test(value));}, "小数位数不能超过两位.");
