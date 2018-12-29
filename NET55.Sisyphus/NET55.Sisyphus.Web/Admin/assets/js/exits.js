$(function () {
    $("#exits").click(function () {
        swal({
            title: "确定退出吗？",
            text: "你退出将无法返回该页面！",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "确定退出！",
            closeOnConfirm: false
        },
         function () {
             window.location.href = "../Ashx/SignOutAdmin.ashx";
         });
    });
});
