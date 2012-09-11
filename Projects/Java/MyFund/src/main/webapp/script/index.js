$(function(){
    var index = 0;
    showImg(index); //初始化
    $(".focus .btn span").mouseover(function() {
        index = $(".focus .btn span").index(this);
        showImg(index);
    });
    //滑入停止动画，滑出开始动画.
    $('.focus').hover(function() {
        if (MyTime) {
            clearInterval(MyTime);
        }
    },
    function() {
        MyTime = setInterval(function(){
            showImg(index);
            index++;
            if (index == 3) {
                index = 0;
            }
        },
        3000);
    });
    //自动开始
    var MyTime = setInterval(function() {
        showImg(index);
        index++;
        if (index == 3) {
            index = 0;
        }
    },
    3000);
});
//关键函数：通过控制i，来显示不同的幻灯片
function showImg(i) {
    $(".img img").eq(i).stop(true, true).fadeIn(800).parent().siblings().find("img").hide();
    $(".btn span").eq(i).addClass("hov").siblings().removeClass("hov");
}