var time;
$(document).ready(function(){
		 $("#lifirst li").each(function(index){
			 $(this).mousemove(function(){
				 var liset = $(this);
				 clearTimeout(setTimeout("0")-1);
				 time = setTimeout(function(){
				     $("#lifirst li.tabin").removeClass("tabin");
				     liset.addClass("tabin");
				     $("div.indiv").removeClass("indiv");
				     $("div.contantfirst").eq(index).addClass("indiv");
				 },300);
			 }).mouseout(function(){
				 clearTimeout(time);
			 });
		 });
});