/*
通用数据水平层级选择控件
作者：绿豆糕
版本：v0.70
修改时间：2010年11月22日
要求数据格式：纯文本，数据项之间以","分隔，数据项数值和描述文本之间以":"分隔，可以在参数中自定义分隔符。
*/
;(function($){
//弹出层
var defaultarr;
$.openLayer = function(p){
	var param = $.extend({
		maxItems : 500,					//最多选取项数字限制
		showLevel : 5,					//显示级别
		oneLevel : true,				//是否限制选择相同级别的数据，可以不为同一个父节点，
										//false为不限制，可以同时选择不同级别的数据，true为限制。
		onePLevel : false,				//是否限制选择相同级别,并且是同一个父节点的数据，
										//false为不限制，可以同时选择不同级别的数据，true为限制。
										//此参数只有在oneLevel:true时才有效
		splitChar : ",:",				//数据分隔符，第一个字符为各项之间的分隔符，第二个为每项中id和显示字符串的分隔符。
		returnValue : "",				//以，分隔的选取结果id存放的位置id，默认为一个input。
		returnText : "",				//以，分隔的选取结果文字存放的位置id，可以为span，div等容器。
		title : "",				//弹出窗口标题
		width : 650,					//弹出窗口宽度
		span_width : {d1:70,d3:150},	//可以自定义每一层级数据项显示宽度，用来对其排版。
		url : "",						//ajax请求url
		pid : "0",						//父id
		shared : true,					//如果页面中有多于1个的弹出选择,是否共享缓存数据
		index : 1,						//如果页面中有多于1个的弹出选择,如果不共享之前的操作界面则必须设置不同的index值，否则不同的弹出选择共享相同的操作界面。
		cacheEnable : true,				//是否允许缓存
		dragEnable : true,				//是否允许鼠标拖动
		pText : "",
		topNum:1,
		defaultValue:""
	},p||{});

	var fs = {
		init_Container : function(){	//初始化头部和内容容器
			//标题
			//var TITLE = param.title + ",最多能选择 " + param.maxItems + " 项！";
			var TITLE = "";
			var CLOSE = "<span id='_cancel' style='cursor:pointer;'>[取消]</span>&nbsp;&nbsp;<span id='_ok' style='cursor:pointer;'>[确定]</span>";
			//头部
			var htmlDiv = "<div id='heads'><div id='headdiv'><span id='title'>" + TITLE + "</span><span id='close'>" + CLOSE + "</span></div>";
			//内容容器创建部分
			htmlDiv += "<div id='container'></div></div>";
			return htmlDiv;
		},
		init_area : function(){			//初始化数据容器
			var _container = $("#container");
			//已选择项容器
			var selArea = $("<div id='selArea'><div>已选择项目：</div></div>");
			_container.append(selArea); 
			if (param.maxItems == 1){ selArea.hide(); }

			//初始化第一层级数据容器，以后各级容器都clone本容器
			var d1 = $("<div id='d1'></div>");
			var dc = $("<div id='dc'></div>");

			_container.append(dc).append(d1);//加入数据容器中
			dc.hide();
			fs.add_data(d1);//添加数据
		},
		add_data : function(targetid){					//添加数据到容器，添加事件，初始化下一层次容器
			targetid.nextAll().remove();				//删除目标容器之后的所有同级别容器

			var pid = param.pid;						//查询数据的参数，父id
			var url = param.url;						//ajax查询url
			var data = "";								//返回数据变量

			if(param.cacheEnable){ data = _cache[pid];}	//如果cache开启则首先从cache中取得数据
			
			//如果cache中没有数据并且url和pid都设置了,发起ajax请求
			if ((data == null || data == "") &&  url != ""){
				$.ajax({
					type : "post",						//post方式
					url : url,							//ajax查询url
					data : {pid:pid},					//参数
					async : false,						//同步方式，便于拿到返回数据做统一处理
					beforeSend : function (){ },		//ajax查询请求之前动作，比如提示信息……
					success : function (d) {			//ajax请求成功后返回数据
						data = d;
						if(param.cacheEnable){ _cache[pid] = data;}		//cache允许,保存数据到cache
					}
				});
			}

			//cache和ajax都没有数据或者错误,添加提示信息返回
			if(data == "" || data == null){
				targetid.empty().show().append($("<span style='color:red;'>没有下级数据！</span>"));
				return;
			}

			var span_width = eval("param.span_width."+targetid.attr("id"));			//每个数据显示项的宽度
			span_width = (span_width == undefined ? param.span_width.d1:span_width );//没有设置的话，就使用第一个数据容器的值
			var inspan_width = ($.browser.msie)?1:3;								//内部文字和checkbox之间的距离
	
			var dat = data.split(param.splitChar.charAt(0));						//根据设定分隔符对数据做第一次分隔，获得数据项数组
			var html = [];															//格式化数据存放容器，为了提高效率，使用了数组
			var ss = [];
			var ht = [];
			//循环获得格式化的显示字符串
			for(var i = 0 ; i < dat.length ; i++){
				ht = [];
				ss = dat[i].split(param.splitChar.charAt(1));		//第二次分隔，获得每个数据项中的数据值和显示字符串
				st = 0;
				if(defaultarr.length>0){
					for(s=0;s<defaultarr.length;s++){
						if(defaultarr[s] == ss[0]){
							st = 1;
						}
					}
				}
				html.push("<span title='"+dat[i]+"' name='"+pid+"' style='width:"+span_width+"px;white-space:nowrap;float:left;'>");
				html.push("<input type='checkbox' value='" + ss[0] + "' " + (st == 1?'checked':'') + ">");
				html.push("<span name='"+targetid.attr("id")+"' style='margin-left:"+inspan_width+"px;'>" + ss[1] + "</span>");
				html.push("</span>");
				//html.push(ht);
				ht.push("<span title='"+dat[i]+"' name='"+pid+"' style='width:"+span_width+"px;white-space:nowrap;float:left;'>");
				ht.push("<input type='checkbox' value='" + ss[0] + "' " + (st == 1?'checked':'') + ">");
				ht.push("<span name='"+targetid.attr("id")+"' style='margin-left:"+inspan_width+"px;'>" + ss[1] + "</span>");
				ht.push("</span>");
				if(st == 1){
					$("#selArea").append($(ht.join("")));
				}
			}
			targetid.empty().show().append($(html.join("")));		//格式化的html代码放入目标容器
			if(param.maxItems > 1){fs.change_status(targetid);}		//同步状态,单选状态无必要
				
			fs.add_input_event(targetid);							//加入input的事件绑定
			fs.add_span_event(targetid);							//加入span的事件绑定
		},
		init_event : function(){		//绑定已选择框中checkbox的事件，确定，取消事件响应
			$("#selArea").find(":input").live("click",function(){
				$(this).parent().remove();
				$("#container > div").find(":input[value="+this.value+"]").attr("checked",false);
			});
			$("#_cancel").click(function(){
				$("#bodybg").hide();
				$("#popupAddr").fadeOut();
			});
			$("#_ok").click(function(){
				var vals = "";
				var txts = "";
				$("#selArea").find(":input").each(function(i){
					vals += ("," + this.value);
					txts += ("," + $(this).next().text());
				});
				fs.set_returnVals(param.returnValue,vals);
				fs.set_returnVals(param.returnText,txts);
		
				$("#bodybg").hide();
				$("#popupAddr").fadeOut();
			});
		},
		change_status : function(targetid){ //切换不同元素，形成不同下级列表时候，同步已选择区的元素和新形成区元素的选中状态
			var selArea = $("#selArea");
			var selinputs = selArea.find(":input");
			var vals =[];

			if(selinputs.length > 0){
				selinputs.each(function(){ vals.push(this.value); });
			}
			targetid.find(":input").each(function(){
				if($.inArray(this.value,vals) != -1){ this.checked = true; }
			});
		},
		add_input_event : function(targetid){	//新生成的元素集合添加input的单击事件响应
			var selArea = $("#selArea");
			targetid.find(":input").click(function(){
				if (param.maxItems == 1){
					selArea.find("span").remove();
					$("#container > div").find(":checked:first").not($(this)).attr("checked",false);
					$(this).css("color","white");
					selArea.append($(this).parent().clone());
					$("#_ok").click();
				}else {
					if(this.checked && fs.check_level(this) && fs.check_num(this)){
						selArea.append($(this).parent().clone().css({"width":"","background":"","border":""}));
					}else{
						selArea.find(":input[value="+this.value+"]").parent().remove();
					}			
				}
			});
		},
		add_span_event : function(targetid){	//新生成的元素集合添加span的单击事件响应
			var maxlev = param.showLevel;
			var thislevel = parseInt(targetid.attr("id").substring(1));
	
			var spans = targetid.children("span");
			spans.children("span").click(function(e){
				if (maxlev > thislevel){
					var next=$("#dc").clone();
					next.attr("id","d"+(thislevel+1));
					targetid.after(next);
			
					spans.css({"background":"","border":"","margin":""});
					$(this).parent().css({"background":"orange","border":"1px ridge","margin":"-1"});
					param.pid = $(this).prev().val();
					fs.add_data(next,param);
				}else{
					alert("当前设置只允许显示" +  maxlev + "层数据！");
				}
			});
		},
		check_num : function(obj){	//检测最多可选择数量
			if($("#selArea").find(":input").size() < param.maxItems){
				return true;
			}else{
				obj.checked = false;
				alert("最多只能选择"+param.maxItems+"个选项");
				return false;
			}
		},
		check_level : function(obj){	//检测是否允许选取同级别选项或者同父id选项
			var selobj = $("#selArea > span");
			if(selobj.length ==0) return true;

			var oneLevel = param.oneLevel;
			if(oneLevel == false){
				return true;
			}else{
				var selLevel = selobj.find("span:first").attr("name");		//已选择元素的级别
				var thislevel = $(obj).next().attr("name");					//当前元素级别
				if(selLevel != thislevel) {//
					obj.checked = false;
					alert("当前设定只允许选择同一级别的元素！");
					return  false;
				}else{
					var onePLevel = param.onePLevel;		//是否设定只允许选择同一父id的同级元素
					if (onePLevel == false) {
						return true;
					}else{
						var parentId = selobj.attr("name");					//已选择元素的父id
						var thisParentId = $(obj).parent().attr("name");	//当前元素父id
						if (parentId != thisParentId){
							obj.checked = false;
							alert("当前设定只允许选择同一级别并且相同上级的元素！");
							return false;
						}
						return true;
					}
				}
			}
		},
		set_returnVals : function(id,vals) {	//按"确定"按钮时处理、设置返回值
			if(id != ""){
				var Container = $("#" + id);
				if(Container.length > 0){
					if(Container.is("input")){
						Container.val(vals.substring(1));
					}else{
						Container.text(vals.substring(1));
					}
				}
			}	
		},
		init_style : function() {	//初始化css
			var _margin = 4;
			var _width = param.width-_margin*5;

			var css = [];
			var aotu = "border:2px groove";
			css.push("#popupAddr {position:absolute;border:3px ridge;width:"+param.width+"px;height:auto;background-color:#e3e3e3;z-index:99;-moz-box-shadow:5px 5px 5px rgba(0,0,0,0.5);box-shadow:5px 5px 5px rgba(0,0,0,0.5);filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=5,OffY=5,Color=gray);-ms-filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=5,OffY=5,Color='gray');}");
			css.push("#bodybg {width:100%;z-index:98;position:absolute;top:0;left:0;background-color:#fff;opacity:0.1;filter:alpha(opacity =10);}");
			css.push("#heads {width:100%;font-size:12px;margin:0 auto;}");
			css.push("#headdiv {color:white;background-color:#97181D;font-size:13px;height:25px;margin:1px;" +aotu+"}");
			css.push("#title {line-height:30px;padding-left:20px;float:left;}");
			css.push("#close {float:right;padding-right:12px;line-height:30px;}");
			css.push("#container {width:100%;height:auto;}");
			css.push("#selArea {width:"+_width+"px;height:48px;margin:"+_margin+"px;padding:5px;background-color:#f4f4f4;float:left;"+aotu+"}");
			css.push("#pbar {width:"+_width+"px;height:12px;margin:4px;-moz-box-sizing: border-box;display:block;overflow: hidden;font-size:1px;border:1px solid red;background:#333333;float:left;}");
	
			var d_css = "{width:"+_width+"px;margin:"+_margin+"px;padding:5px;height:auto;background-color:khaki;float:left;"+aotu+"}";
			css.push("dc "+d_css);
			for (i = 1; i <=param.showLevel; i++) { css.push("#d" + i + " " + d_css); }
			$("head").append($("<style>"+css.join(" ")+"</style>"));
		}
	};

	defaultarr = param.defaultValue.split(',');
	
	if (window._cache == undefined || !param.shared ){ _cache = {}; }
	if (window._index == undefined) { _index = param.index; }

	fs.init_style();//初始化样式

	var popupDiv = $("#popupAddr");	//创建一个div元素
	if (popupDiv.length == 0 ) {
		popupDiv = $("<div id='popupAddr'></div>");
		$("body").append(popupDiv);
	}
//	var yPos = ($(window).height()-popupDiv.height()) / 2;
//	var yPos =1050;
	var yPos = param.topNum + 20;
	
	var xPos = ($(window).width()-popupDiv.width()) / 2;
//	alert(yPos + ", " + xPos);
	popupDiv.css({"top": yPos,"left": xPos}).show();
	
	var bodyBack = $("#bodybg");  //创建背景层
	if (bodyBack.length == 0 ) {
		bodyBack = $("<div id='bodybg'></div>");
		bodyBack.height($(window).height());
		$("body").append(bodyBack);
		popupDiv.html(fs.init_Container());	//弹出层内容
		fs.init_area();
		fs.init_event();
	}else {
		if (_index != param.index) {
			popupDiv.html(fs.init_Container(param));
			fs.init_area();
			fs.init_event();
			_index = param.index;
		}
	}

	if (param.dragEnable) {		//允许鼠标拖动
		var _move=false;		//移动标记
		var _x,_y;				//鼠标离控件左上角的相对位置
		popupDiv.mousedown(function(e){
			_move=true;
			_x=e.pageX-parseInt(popupDiv.css("left"));
			_y=e.pageY-parseInt(popupDiv.css("top"));
		}).mousemove(function(e){
			if(_move){
				var x=e.pageX-_x;//移动时根据鼠标位置计算控件左上角的绝对位置
				var y=e.pageY-_y;
				popupDiv.css({top:y,left:x});//控件新位置
		}}).mouseup(function(){ _move=false; });
	}
	bodyBack.show();
	popupDiv.fadeIn();
}

})(jQuery)

_cache ={"0":"P1:北京市,P2:天津市,P3:河北省,P4:山西省,P5:内蒙古自治区,P6:辽宁省,P7:吉林省,P8:黑龙江省,P9:上海市,P10:江苏省,P11:浙江省,P12:安徽省,P13:福建省,P14:江西省,P15:山东省,P16:河南省,P17:湖北省,P18:湖南省,P19:广东省,P20:广西壮族自治区,P21:海南省,P22:重庆市,P23:四川省,P24:贵州省,P25:云南省,P26:西藏自治区,P27:陕西省,P28:甘肃省,P29:青海省,P30:宁夏回族自治区,P31:新疆维吾尔自治区"
,"P3":"C5:石家庄市,C6:唐山市,C7:秦皇岛市,C8:邯郸市,C9:邢台市,C10:保定市,C11:张家口市,C12:承德市,C13:沧州市,C14:廊坊市,C15:衡水市"
,"P4":"C16:太原市,C17:大同市,C18:阳泉市,C19:长治市,C20:晋城市,C21:朔州市,C22:晋中市,C23:运城市,C24:忻州市,C25:临汾市,C26:吕梁市"
,"P5":"C27:呼和浩特市,C28:包头市,C29:乌海市,C30:赤峰市,C31:通辽市,C32:鄂尔多斯市,C33:呼伦贝尔市,C34:巴彦淖尔市,C35:乌兰察布市,C36:兴安盟,C37:锡林郭勒盟,C38:阿拉善盟"
,"P6":"C39:沈阳市,C40:大连市,C41:鞍山市,C42:抚顺市,C43:本溪市,C44:丹东市,C45:锦州市,C46:营口市,C47:阜新市,C48:辽阳市,C49:盘锦市,C50:铁岭市,C51:朝阳市,C52:葫芦岛市"
,"P7":"C53:长春市,C54:吉林市,C55:四平市,C56:辽源市,C57:通化市,C58:白山市,C59:松原市,C60:白城市,C61:延边朝鲜族自治州"
,"P8":"C62:哈尔滨市,C63:齐齐哈尔市,C64:鸡西市,C65:鹤岗市,C66:双鸭山市,C67:大庆市,C68:伊春市,C69:佳木斯市,C70:七台河市,C71:牡丹江市,C72:黑河市,C73:绥化市,C74:大兴安岭地区"
,"P10":"C77:南京市,C78:无锡市,C79:徐州市,C80:常州市,C81:苏州市,C82:南通市,C83:连云港市,C84:淮安市,C85:盐城市,C86:扬州市,C87:镇江市,C88:泰州市,C89:宿迁市"
,"P11":"C90:杭州市,C91:宁波市,C92:温州市,C93:嘉兴市,C94:湖州市,C95:绍兴市,C96:金华市,C97:衢州市,C98:舟山市,C99:台州市,C100:丽水市"
,"P12":"C101:合肥市,C102:芜湖市,C103:蚌埠市,C104:淮南市,C105:马鞍山市,C106:淮北市,C107:铜陵市,C108:安庆市,C109:黄山市,C110:滁州市,C111:阜阳市,C112:宿州市,C113:巢湖市,C114:六安市,C115:亳州市,C116:池州市,C117:宣城市"
,"P13":"C118:福州市,C119:厦门市,C120:莆田市,C121:三明市,C122:泉州市,C123:漳州市,C124:南平市,C125:龙岩市,C126:宁德市"
,"P14":"C127:南昌市,C128:景德镇市,C129:萍乡市,C130:九江市,C131:新余市,C132:鹰潭市,C133:赣州市,C134:吉安市,C135:宜春市,C136:抚州市,C137:上饶市"
,"P15":"C138:济南市,C139:青岛市,C140:淄博市,C141:枣庄市,C142:东营市,C143:烟台市,C144:潍坊市,C145:济宁市,C146:泰安市,C147:威海市,C148:日照市,C149:莱芜市,C150:临沂市,C151:德州市,C152:聊城市,C153:滨州市,C154:荷泽市"
,"P16":"C155:郑州市,C156:开封市,C157:洛阳市,C158:平顶山市,C159:安阳市,C160:鹤壁市,C161:新乡市,C162:焦作市,C163:濮阳市,C164:许昌市,C165:漯河市,C166:三门峡市,C167:南阳市,C168:商丘市,C169:信阳市,C170:周口市,C171:驻马店市"
,"P17":"C172:武汉市,C173:黄石市,C174:十堰市,C175:宜昌市,C176:襄樊市,C177:鄂州市,C178:荆门市,C179:孝感市,C180:荆州市,C181:黄冈市,C182:咸宁市,C183:随州市,C184:恩施土家族苗族自治州,C185:省直辖行政单位"
,"P18":"C186:长沙市,C187:株洲市,C188:湘潭市,C189:衡阳市,C190:邵阳市,C191:岳阳市,C192:常德市,C193:张家界市,C194:益阳市,C195:郴州市,C196:永州市,C197:怀化市,C198:娄底市,C199:湘西土家族苗族自治州"
,"P19":"C200:广州市,C201:韶关市,C202:深圳市,C203:珠海市,C204:汕头市,C205:佛山市,C206:江门市,C207:湛江市,C208:茂名市,C209:肇庆市,C210:惠州市,C211:梅州市,C212:汕尾市,C213:河源市,C214:阳江市,C215:清远市,C216:东莞市,C217:中山市,C218:潮州市,C219:揭阳市,C220:云浮市"
,"P20":"C221:南宁市,C222:柳州市,C223:桂林市,C224:梧州市,C225:北海市,C226:防城港市,C227:钦州市,C228:贵港市,C229:玉林市,C230:百色市,C231:贺州市,C232:河池市,C233:来宾市,C234:崇左市"
,"P21":"C235:海口市,C236:三亚市,C237:省直辖县级行政单位"
,"P23":"C241:成都市,C242:自贡市,C243:攀枝花市,C244:泸州市,C245:德阳市,C246:绵阳市,C247:广元市,C248:遂宁市,C249:内江市,C250:乐山市,C251:南充市,C252:眉山市,C253:宜宾市,C254:广安市,C255:达州市,C256:雅安市,C257:巴中市,C258:资阳市,C259:阿坝藏族羌族自治州,C260:甘孜藏族自治州,C261:凉山彝族自治州"
,"P24":"C262:贵阳市,C263:六盘水市,C264:遵义市,C265:安顺市,C266:铜仁地区,C267:黔西南布依族苗族自治州,C268:毕节地区,C269:黔东南苗族侗族自治州,C270:黔南布依族苗族自治州"
,"P25":"C271:昆明市,C272:曲靖市,C273:玉溪市,C274:保山市,C275:昭通市,C276:丽江市,C277:思茅市,C278:临沧市,C279:楚雄彝族自治州,C280:红河哈尼族彝族自治州,C281:文山壮族苗族自治州,C282:西双版纳傣族自治州,C283:大理白族自治州,C284:德宏傣族景颇族自治州,C285:怒江傈僳族自治州,C286:迪庆藏族自治州"
,"P26":"C287:拉萨市,C288:昌都地区,C289:山南地区,C290:日喀则地区,C291:那曲地区,C292:阿里地区,C293:林芝地区"
,"P27":"C294:西安市,C295:铜川市,C296:宝鸡市,C297:咸阳市,C298:渭南市,C299:延安市,C300:汉中市,C301:榆林市,C302:安康市,C303:商洛市"
,"P28":"C304:兰州市,C305:嘉峪关市,C306:金昌市,C307:白银市,C308:天水市,C309:武威市,C310:张掖市,C311:平凉市,C312:酒泉市,C313:庆阳市,C314:定西市,C315:陇南市,C316:临夏回族自治州,C317:甘南藏族自治州"
,"P29":"C318:西宁市,C319:海东地区,C320:海北藏族自治州,C321:黄南藏族自治州,C322:海南藏族自治州,C323:果洛藏族自治州,C324:玉树藏族自治州,C325:海西蒙古族藏族自治州"
,"P30":"C326:银川市,C327:石嘴山市,C328:吴忠市,C329:固原市,C330:中卫市"
,"P31":"C331:乌鲁木齐市,C332:克拉玛依市,C333:吐鲁番地区,C334:哈密地区,C335:昌吉回族自治州,C336:博尔塔拉蒙古自治州,C337:巴音郭楞蒙古自治州,C338:阿克苏地区,C339:克孜勒苏柯尔克孜自治州,C340:喀什地区,C341:和田地区,C342:伊犁哈萨克自治州,C343:塔城地区,C344:阿勒泰地区,C345:省直辖行政单位"};						//缓存