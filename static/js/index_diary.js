$(function () {
    var $w = $(window).width();
        if ($w < 1183) {
            $("#sidebar").hide();
            $("#mainstay").removeAttr("class", "col-md-8");
            $("#mainstay").addClass("col-md-12");
        } else {
            $("#sidebar").show();
            $("#mainstay").removeAttr("class", "col-md-12");
            $("#mainstay").addClass("col-md-8");
        }
    $(window).resize(function () {          //当浏览器大小变化时
        var $w = $(window).width();
        if ($w < 1183) {
            $("#sidebar").hide();
            $("#mainstay").removeAttr("class", "col-md-8");
            $("#mainstay").addClass("col-md-12");
        } else {
            $("#sidebar").show();
            $("#mainstay").removeAttr("class", "col-md-12");
            $("#mainstay").addClass("col-md-8");
        }
    });

})