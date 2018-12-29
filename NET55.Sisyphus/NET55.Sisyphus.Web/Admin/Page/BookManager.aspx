<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookManager.aspx.cs" Inherits="NET55.Sisyphus.Web.Admin.Page.BookManager" %>

<!DOCTYPE html>

<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>书籍管理</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="../assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="../assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="../assets/css/admin.css">
    <link rel="stylesheet" href="../assets/css/app.css">
    <link href="../assets/css/dicss.css" rel="stylesheet" />
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/amazeui.min.js"></script>
    <script src="../assets/js/app.js"></script>
    <script src="../assets/js/dijs.js"></script>
    <script src="../assets/js/exits.js"></script>
    <script>
        // $.post('/Admin/Ashx/DaleteBookManager.ashx', { Bookid: Bookid }, function (msg) {
        $(function () {
            //删除书籍的信息
            $('button[name="delete"]').click(function () {
                //获取用户选择的ID
                var Bookid = $(this).prev().prev().val();
                swal({
                    title: "确定删除吗？",
                    text: "你将无法恢复该书籍的信息！",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "确定删除！",
                    cancelButtonText: "取消删除！",
                    closeOnConfirm: false,
                    closeOnCancel: false
                }, function (isConfirm) {
                    if (isConfirm) {
                        $.post('/Admin/Ashx/DaleteBookManager.ashx', { Bookid: Bookid }, function (msg) {
                            if (msg == "ok") {
                                swal({
                                    title: "提 示",
                                    text: "删除书籍信息成功！",
                                    type: "success",
                                    showCancelButton: false,
                                    confirmButtonColor: "#DD6B55",
                                    confirmButtonText: "OK！",
                                    closeOnConfirm: false
                                }, function () {
                                    window.location.reload();
                                });
                            }
                        });
                    }
                    else {
                        swal({
                            title: "提 示",
                            text: "删除数据信息失败！",
                            type: "error",
                            showCancelButton: false,
                            confirmButtonColor: "#DD6B55",
                            confirmButtonText: "No！",
                            closeOnConfirm: false
                        }, function () {
                            window.location.reload();
                        });
                    }
                });
            });
            //编辑书籍的信息
            $('button[name="edit"]').click(function () {
                //获取用户选择的ID
                var Bookid = $(this).prev().val();
                window.location.href = "EditBook.aspx?bookId="+Bookid;
            });
            //新增
            $('button[name="btn"]').click(function () {
                window.location.href = "/Admin/Page/BooksAdd.aspx";
            });
        })
    </script>
</head>

<body data-type="generalComponents">


    <header class="am-topbar am-topbar-inverse admin-header">
        <div class="am-topbar-brand">
            <a href="javascript:;" class="tpl-logo">
                <img src="../assets/img/logo.png" alt="">
            </a>
        </div>
        <div class="am-icon-list tpl-header-nav-hover-ico am-fl am-margin-right">
        </div>

        <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

        <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

            <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list tpl-header-list">
                
                <li class="am-hide-sm-only"><a href="javascript:;" id="admin-fullscreen" class="tpl-header-list-link"><span class="am-icon-arrows-alt"></span><span class="admin-fullText">开启全屏</span></a></li>

                <li class="am-dropdown" data-am-dropdown data-am-dropdown-toggle>
                    <a class="am-dropdown-toggle tpl-header-list-link" href="javascript:;">
                        <span class="tpl-header-list-user-nick"><%=((Maticsoft.Model.UserInfo)Session["admin"]).UserName %></span><span class="tpl-header-list-user-ico">
                            <img src="../assets/img/user01.png"></span>
                    </a>
                    <ul class="am-dropdown-content">
                        <li><a href="javascript:;" id="exits"><span class="am-icon-power-off"></span>退出</a></li>
                    </ul>
                </li>
                <li><a href="javascript:;" class="tpl-header-list-link"><span class="am-icon-sign-out tpl-header-list-ico-out-size"></span></a></li>
            </ul>
        </div>
    </header>







    <div class="tpl-page-container tpl-page-header-fixed">

        <div class="tpl-left-nav tpl-left-nav-hover">
            <div class="tpl-left-nav-title">
                管理列表
            </div>
            <div class="tpl-left-nav-list">
                <ul class="tpl-left-nav-menu">
                    <li class="tpl-left-nav-item">
                        <a href="Index.aspx" class="nav-link">
                            <i class="am-icon-user"></i>
                            <span>用户管理</span>
                        </a>
                    </li>

                    <li class="tpl-left-nav-item">
                        <a href="AdvertisingManager.aspx" class="nav-link tpl-left-nav-link-list">
                            <i class="am-icon-bullhorn"></i>
                            <span>广告管理</span>
                        </a>
                    </li>

                    <li class="tpl-left-nav-item">
                        <a href="OrderManager.aspx" class="nav-link tpl-left-nav-link-list">
                            <i class="am-icon-map"></i>
                            <span>订单管理</span>
                        </a>
                    </li>

                    <li class="tpl-left-nav-item">
                        <a href="SearchManager.aspx" class="nav-link tpl-left-nav-link-list">
                            <i class="am-icon-search"></i>
                            <span>搜索关键字管理</span>
                        </a>
                    </li>

                    <li class="tpl-left-nav-item">
                        <a href="Article_WordManager.aspx" class="nav-link tpl-left-nav-link-list">
                            <i class="am-icon-exclamation-triangle"></i>
                            <span>敏感/禁用词管理</span>
                        </a>
                    </li>

                    <li class="tpl-left-nav-item">
                        <a href="javascript:;" class="nav-link tpl-left-nav-link-list active">
                            <i class="am-icon-book"></i>
                            <span>书籍管理</span>
                            <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                        </a>
                        <ul class="tpl-left-nav-sub-menu" style="display:block">
                            <li>
                                <a href="BookTypeManager.aspx">
                                    <i class="am-icon-angle-right"></i>
                                    <span>书籍类型管理</span>
                                </a>

                                <a href="BookManager.aspx" class="active">
                                    <i class="am-icon-angle-right"></i>
                                    <span>书籍管理</span>
                                </a>

                                <a href="CommentManager.aspx">
                                    <i class="am-icon-angle-right"></i>
                                    <span>评论列表</span>
                                </a>
                        </ul>
                    </li>

                </ul>
            </div>
        </div>





        <div class="tpl-content-wrapper">
            <div class="tpl-content-page-title">
                书籍管理
            </div>
            <ol class="am-breadcrumb">
                <li><a href="javascript:;" class="am-icon-home">首页</a></li>
                <li><a href="BookManager.aspx">书籍管理</a></li>
            </ol>

            <div class="tpl-portlet-components">

                <div class="tpl-block">

                    <div class="am-g">
                        <div class="am-u-sm-12 am-u-md-12">
                            <div class="am-btn-toolbar">
                                <div class="am-btn-group am-btn-group-xs">
                                    <button type="button" class="am-btn am-btn-default am-btn-success" name="btn"><span class="am-icon-plus"></span>新增</button>
                                </div>
                            </div>
                        </div>
                        <div class="tpl-table-images">
                            <%foreach (var item in bookList)
                              {
                            %>
                            <div class="am-u-sm-12 am-u-md-6 am-u-lg-4" style="height: 600px">
                                <div class="tpl-table-images-content">
                                    <div class="tpl-table-images-content-i-time">发布时间：<%=item.PublishDate.ToString("yyyy-MM-dd") %></div>
                                    <div class="tpl-i-title">
                                        <%=item.Title %>
                                    </div>
                                    <a href="javascript:;" class="tpl-table-images-content-i">
                                        <div class="tpl-table-images-content-i-info">
                                            <span class="ico" style="color: darkcyan">
                                                <%=item.Author %>
                                            </span>

                                        </div>
                                        <span class="tpl-table-images-content-i-shadow"></span>

                                        <img style="width: 250px; height: 303px" src="/BookCovers/<%=item.ISBN %>.jpg" alt="">
                                    </a>
                                    <div class="tpl-table-images-content-block">
                                        <div class="tpl-i-font">
                                            <%=item.ContentDescription %>
                                        </div>
                                        <div class="tpl-i-more">
                                            <ul>
                                                <li><span class="am-icon-weixin am-text-success">点击量：<%=item.Clicks %></span></li>
                                            </ul>
                                        </div>
                                        <div class="am-btn-toolbar">
                                            <div class="am-btn-group am-btn-group-xs tpl-edit-content-btn">
                                                <input type="hidden" name="Bookid" value="<%=item.Id %>" />
                                                <button type="button" class="am-btn am-btn-default am-btn-secondary" name="edit"><span class="am-icon-edit"></span>编辑</button>
                                                <button type="button" class="am-btn am-btn-default am-btn-danger" name="delete"><span class="am-icon-trash-o"></span>删除</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
                              } %>

                            <div class="am-u-lg-12">
                                <div class="am-cf">

                                    <div class="am-fr">
                                        <ul class="am-pagination tpl-pagination">
                                            <%=Common.PageBarHelper.GetPagaBar(pageIndex,pageCount) %>
                                        </ul>
                                    </div>
                                </div>
                                <hr>
                            </div>

                        </div>

                    </div>
                </div>
                <div class="tpl-alert"></div>
            </div>

        </div>

    </div>
</body>

</html>
