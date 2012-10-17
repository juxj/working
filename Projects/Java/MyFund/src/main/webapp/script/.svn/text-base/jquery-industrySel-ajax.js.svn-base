/*
通用数据水平层级选择控件
作者：绿豆糕
版本：v0.70
修改时间：2010年11月22日
要求数据格式：纯文本，数据项之间以","分隔，数据项数值和描述文本之间以":"分隔，可以在参数中自定义分隔符。
*/
;(function($){
//弹出层
$.openLayer_indust = function(p){
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
		title : "绿豆糕通用水平选择器 ver：0.70",				//弹出窗口标题
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
			var CLOSE = "<span id='indust_cancel' style='cursor:pointer;'>[取消]</span>&nbsp;&nbsp;<span id='indust_ok' style='cursor:pointer;'>[确定]</span>";
			//头部
			var htmlDiv = "<div id='industheads'><div id='industheaddiv'><span id='industtitle'>" + TITLE + "</span><span id='industclose'>" + CLOSE + "</span></div>";
			//内容容器创建部分
			htmlDiv += "<div id='industcontainer'></div></div>";
			return htmlDiv;
		},
		init_area : function(){			//初始化数据容器
			var _container = $("#industcontainer");
			//已选择项容器
			var selArea = $("<div id='industselArea'><div>已选择项目：</div></div>");
			_container.append(selArea); 
			if (param.maxItems == 1){ selArea.hide(); }

			//初始化第一层级数据容器，以后各级容器都clone本容器
			var d1 = $("<div id='industd1'></div>");
			var dc = $("<div id='industdc'></div>");

			_container.append(dc).append(d1);//加入数据容器中
			dc.hide();
			fs.add_data(d1);//添加数据
		},
		add_data : function(targetid){					//添加数据到容器，添加事件，初始化下一层次容器
			targetid.nextAll().remove();				//删除目标容器之后的所有同级别容器

			var pid = param.pid;						//查询数据的参数，父id
			var url = param.url;						//ajax查询url
			var data = "";								//返回数据变量

			if(param.cacheEnable){ data = _cache_indust[pid];}	//如果cache开启则首先从cache中取得数据
			
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
						if(param.cacheEnable){ _cache_indust[pid] = data;}		//cache允许,保存数据到cache
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
					$("#industselArea").append($(ht.join("")));
				}
			}
			targetid.empty().show().append($(html.join("")));		//格式化的html代码放入目标容器
			if(param.maxItems > 1){fs.change_status(targetid);}		//同步状态,单选状态无必要
				
			fs.add_input_event(targetid);							//加入input的事件绑定
			fs.add_span_event(targetid);							//加入span的事件绑定
		},
		init_event : function(){		//绑定已选择框中checkbox的事件，确定，取消事件响应
			$("#industselArea").find(":input").live("click",function(){
				$(this).parent().remove();
				$("#industcontainer > div").find(":input[value="+this.value+"]").attr("checked",false);
			});
			$("#indust_cancel").click(function(){
				$("#industbodybg").hide();
				$("#industpopupAddr").fadeOut();
			});
			$("#indust_ok").click(function(){
				var vals = "";
				var txts = "";
				$("#industselArea").find(":input").each(function(i){
					vals += ("," + this.value);
					txts += ("," + $(this).next().text());
				});
				fs.set_returnVals(param.returnValue,vals);
				fs.set_returnVals(param.returnText,txts);
		
				$("#industbodybg").hide();
				$("#industpopupAddr").fadeOut();
			});
		},
		change_status : function(targetid){ //切换不同元素，形成不同下级列表时候，同步已选择区的元素和新形成区元素的选中状态
			var selArea = $("#industselArea");
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
			var selArea = $("#industselArea");
			targetid.find(":input").click(function(){
				if (param.maxItems == 1){
					selArea.find("span").remove();
					$("#industcontainer > div").find(":checked:first").not($(this)).attr("checked",false);
					$(this).css("color","white");
					selArea.append($(this).parent().clone());
					$("#indust_ok").click();
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
			var thislevel = parseInt(targetid.attr("id").substring(7));
	
			var spans = targetid.children("span");
			spans.children("span").click(function(e){
				if (maxlev > thislevel){
					var next=$("#industdc").clone();
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
			if($("#industselArea").find(":input").size() < param.maxItems){
				return true;
			}else{
				obj.checked = false;
				alert("最多只能选择"+param.maxItems+"个选项");
				return false;
			}
		},
		check_level : function(obj){	//检测是否允许选取同级别选项或者同父id选项
			var selobj = $("#industselArea > span");
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
			css.push("#industpopupAddr {position:absolute;border:3px ridge;width:"+param.width+"px;height:auto;background-color:#e3e3e3;z-index:99;-moz-box-shadow:5px 5px 5px rgba(0,0,0,0.5);box-shadow:5px 5px 5px rgba(0,0,0,0.5);filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=5,OffY=5,Color=gray);-ms-filter:progid:DXImageTransform.Microsoft.dropshadow(OffX=5,OffY=5,Color='gray');}");
			css.push("#industbodybg {width:100%;z-index:98;position:absolute;top:0;left:0;background-color:#fff;opacity:0.1;filter:alpha(opacity =10);}");
			css.push("#industheads {width:100%;font-size:12px;margin:0 auto;}");
			css.push("#industheaddiv {color:white;background-color:#97181D;font-size:13px;height:25px;margin:1px;" +aotu+"}");
			css.push("#industtitle {line-height:30px;padding-left:20px;float:left;}");
			css.push("#industclose {float:right;padding-right:12px;line-height:30px;}");
			css.push("#industcontainer {width:100%;height:auto;}");
			css.push("#industselArea {width:"+_width+"px;height:48px;margin:"+_margin+"px;padding:5px;background-color:#f4f4f4;float:left;"+aotu+"}");
			css.push("#industpbar {width:"+_width+"px;height:12px;margin:4px;-moz-box-sizing: border-box;display:block;overflow: hidden;font-size:1px;border:1px solid red;background:#333333;float:left;}");
	
			var d_css = "{width:"+_width+"px;margin:"+_margin+"px;padding:5px;height:auto;background-color:khaki;float:left;"+aotu+"}";
			css.push("dc "+d_css);
			for (i = 1; i <=param.showLevel; i++) { css.push("#industd" + i + " " + d_css); }
			$("head").append($("<style>"+css.join(" ")+"</style>"));
		}
	};

	defaultarr = param.defaultValue.split(',');
	if (window._cache_indust == undefined || !param.shared ){ _cache_indust = {}; }
	if (window._index == undefined) { _index = param.index; }

	fs.init_style();//初始化样式
	var popupDiv = $("#industpopupAddr");	//创建一个div元素
	if (popupDiv.length == 0 ) {
		popupDiv = $("<div id='industpopupAddr' style='display:none;'></div>");
		$("body").append(popupDiv);
		//$(popupDiv).dialog({width:650,modal:true});
	}
//	var yPos = ($(window).height()-popupDiv.height()) / 2;
//	var yPos = 1650;
	var yPos = param.topNum + 20;
	
	var xPos = ($(window).width()-popupDiv.width()) / 2;
	popupDiv.css({"top": yPos,"left": xPos}).show();
	var bodyBack = $("#industbodybg");  //创建背景层
	if (bodyBack.length == 0 ) {
		bodyBack = $("<div id='industbodybg'></div>");
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
//_cache_indust ={"0":"M1:农、林、牧、渔业,M2:采矿业,M3:制造业,M4:电力、热力、燃气及水生产和供应业,M5:建筑业,M6:批发和零售业,M7:交通运输、仓储和邮政业,M8:住宿和餐饮业,M9:信息传输、软件和信息技术服务业,M10:金融业,M11:房地产业,M12:租赁和商务服务业,M13:科学研究和技术服务业,M14:居民服务、修理和其他服务业,M15:教育,M16:文化、体育和娱乐业,M33:纺织业"

_cache_indust ={"0":"M8:住宿和餐饮业,M6:批发和零售业,M3:制造业,M5:建筑业,M12:租赁和商务服务业,M13:科学研究和技术服务业,M14:居民服务、修理和其他服务业,M7:交通运输、仓储和邮政业,M11:房地产业,M2:采矿业,M9:信息传输、软件和信息技术服务业,M4:电力、热力、燃气及水生产和供应业,M15:教育,M16:文化、体育和娱乐业,M10:金融业,M1:农、林、牧、渔业"
,"M1":"C17:农业,C18:林业,C19:畜牧业,C20:渔业,C21:农、林、牧、渔服务业"
,"M2":"C22:煤炭开采和洗选业,C23:石油和天然气开采业,C24:黑色金属矿采选业,C25:有色金属矿采选业,C26:非金属矿采选业,C27:开采辅助活动,C28:其他采矿业"
,"M3":"C29:农副食品加工业,C30:食品制造业,C31:酒、饮料和精制茶制造业,C32:烟草制品业,C33:纺织业,C34:纺织服装、服饰业,C35:皮革、毛皮、羽毛及其制品和制鞋业,C36:木材加工和木、竹、藤、棕、草制品业,C37:家具制造业,C38:造纸和纸制品业,C39:印刷和记录媒介复制业,C40:文教、工美、体育和娱乐用品制造业,C41:石油加工、炼焦和核燃料加工业,C42:化学原料和化学制品制造业,C43:医药制造业,C44:化学纤维制造业,C45:橡胶和塑料制品业,C46:非金属矿物制品业,C47:黑色金属冶炼和压延加工业,C48:有色金属冶炼和压延加工业,C49:金属制品业,C50:通用设备制造业,C51:专用设备制造业,C52:汽车制造业,C53:铁路、船舶、航空航天和其他运输设备制造业,C54:电气机械和器材制造业,C55:计算机、通信和其他电子设备制造业,C56:仪器仪表制造业,C57:其他制造业,C58:废弃资源综合利用业,C59:金属制品、机械和设备修理业"
,"M4":"C60:电力、热力生产和供应业,C61:燃气生产和供应业,C62:水的生产和供应业"
,"M5":"C63:房屋建筑业,C64:土木工程建筑业,C65:建筑安装业,C66:建筑装饰和其他建筑业"
,"M6":"C67:批发业,C68:零售业"
,"M7":"C69:铁路运输业,C70:道路运输业,C71:水上运输业,C72:航空运输业,C73:管道运输业,C74:装卸搬运和运输代理业,C75:仓储业,C76:邮政业"
,"M8":"C77:住宿业,C78:餐饮业"
,"M9":"C79:电信、广播电视和卫星传输服务,C80:互联网和相关服务,C81:软件和信息技术服务业"
,"M10":"C82:货币金融服务,C83:资本市场服务,C84:保险业,C85:其他金融业"
,"M12":"C87:租赁业,C88:商务服务业"
,"M13":"C89:研究和试验发展,C90:专业技术服务业,C91:科技推广和应用服务业"
,"M14":"C92:居民服务业,C93:机动车、电子产品和日用产品修理业,C94:其他服务业"
,"M16":"C96:新闻和出版业,C97:广播、电视、电影和影视录音制作业,C98:文化艺术业,C99:体育,C100:娱乐业"};						//缓存