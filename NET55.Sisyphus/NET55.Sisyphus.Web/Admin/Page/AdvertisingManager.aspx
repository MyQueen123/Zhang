<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdvertisingManager.aspx.cs" Inherits="Web.Admin.Page.AdvertisingManager" %>

<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>广告管理</title>
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
    <script src="../assets/js/dijs.js"></script>
    <script src="../assets/js/echarts.min.js"></script>
    <script src="../assets/js/amazeui.min.js"></script>
    <script src="../assets/js/exits.js"></script>
    <script>
        $(function () {
            //添加
            $('#add').click(function () {
                $('#my-prompt').modal({
                    relatedTarget: this,
                    onConfirm: function (e) {
                        var img = $('#img').val();
                        //alert(img);
                        var formData = new FormData($('#from')[0]);
                        $.ajax({
                            type: 'post',
                            url: "../Ashx/AdAdd.ashx",
                            data: formData,
                            cache: false,
                            processData: false,
                            contentType: false,
                        }).success(function (msg) {
                            if (msg == "ok") {
                                swal({
                                    title: '添加成功',
                                    type: 'success'
                                }, function () {
                                    window.location.reload();
                                })
                            } else {
                                swal('提示', '添加失败', 'error');
                            }
                        }).error(function () {
                            alert("上传失败");
                        });
                    },
                    onCancel: function (e) {
                    }
                });
            });

            //删除
            $('a[href="javascript:;?id=id"]').click(function () {
                var id = $(this).prev().prev().val();
                $('#my-confirm').modal({
                    relatedTarget: this,
                    onConfirm: function (e) {
                        $.post('../Ashx/AdDelete.ashx', { id: id }, function (msg) {
                            if (msg == "ok") {
                                swal({
                                    title: '成功',
                                    type: 'success'
                                }, function () {
                                    window.location.reload();
                                });
                            } else {
                                swal('提示', '服务器繁忙，请稍后重试', 'error');
                            }
                        });
                    },
                    // closeOnConfirm: false,
                    onCancel: function () {
                    }
                });
            });

            //修改
            $('a[href="javascript:;?Id=id"]').click(function () {
                var id = $(this).prev().val();
                var title = $(this).prev().prev().val();
                var ImgUrl = $(this).prev().prev().prev().val();
                //alert(title + ImgUrl);
                $('#title1').val(title);
                $('#Div1').modal({
                    relatedTarget: this,
                    onConfirm: function (e) {
                        var img = $('#img1').val();
                        var formData = new FormData($('#Form1')[0]);
                        $.ajax({
                            type: 'post',
                            url: "../Ashx/AdEdit.ashx?id=" + id,
                            data: formData,
                            cache: false,
                            processData: false,
                            contentType: false,
                        }).success(function (msg) {
                            if (msg == "ok") {
                                swal({
                                    title: '修改成功',
                                    type: 'success'
                                }, function () {
                                    window.location.reload();
                                });
                            } else {
                                swal('提示', '服务器繁忙，请稍后重试', 'error');
                            }
                        }).error(function () {
                            alert("上传失败");
                        });
                    }
                });
            });
        });
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
                        <li><a href="jajavascript:;" id="exits"><span class="am-icon-power-off"></span>退出</a></li>
                    </ul>
                </li>
                <li><a hrefjavascript:; class="tpl-header-list-link"><span class="am-icon-sign-out tpl-header-list-ico-out-size"></span></a></li>
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
                        <a href="AdvertisingManager.aspx" class="nav-link tpl-left-nav-link-list active">
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
                        <a href="javascript:;" class="nav-link tpl-left-nav-link-list">
                            <i class="am-icon-book"></i>
                            <span>书籍管理</span>
                            <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                        </a>
                        <ul class="tpl-left-nav-sub-menu">
                            <li>
                                <a href="BookTypeManager.aspx">
                                    <i class="am-icon-angle-right"></i>
                                    <span>书籍类型管理</span>
                                </a>

                                <a href="BookManager.aspx">
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
                广告管理
            </div>
            <ol class="am-breadcrumb">
                <li><a href="javascript:;" class="am-icon-home">首页</a></li>
                <li><a href="AdvertisingManager.aspx">广告管理</a></li>
            </ol>

            <div class="tpl-portlet-components">

                <div class="tpl-block">

                    <div class="am-g">
                        <div class="am-u-sm-12 am-u-md-12">
                            <div class="am-btn-toolbar">
                                <div class="am-btn-group am-btn-group-xs">
                                    <button type="button" class="am-btn am-btn-default am-btn-success" id="add"><span class="am-icon-plus"></span>新增</button>
                                </div>
                            </div>
                        </div>
                        <div class="tpl-table-images" id="dd">
                            <%foreach (var item in AdList)
                              {
                            %>
                            <div class="am-u-sm-12 am-u-md-6 am-u-lg-4">
                                <div class="tpl-table-images-content">
                                    <div class="tpl-table-images-content-i-time">发布时间：<%=item.CreateTime.ToString("yyyy-MM-dd") %></div>
                                    <div class="tpl-i-title">
                                        <%=item.Title %>
                                    </div>
                                    <a href="javascript:;" class="tpl-table-images-content-i">
                                        
                                        <span class="tpl-table-images-content-i-shadow"></span>
                                        <img src="/BookCovers/<%=item.ImgUrl %>" alt="" style="width: 260px; height: 200px;">
                                    </a>
                                    <div class="tpl-table-images-content-block">
                                        <div class="tpl-i-font">
                                            <%=item.IsDelete==false?"展示中":"未展示" %>
                                        </div>
                                       
                                        <div class="am-btn-toolbar">
                                            <div class="am-btn-group am-btn-group-xs tpl-edit-content-btn">
                                                <input type="hidden" name="id"  value="<%=item.ImgUrl %>" />
                                                <input type="hidden" name="id"  value="<%=item.Title %>" />
                                                <input type="hidden" name="id"  value="<%=item.Id %>" />
                                                <a class="am-btn am-btn-default am-btn-secondary" href="javascript:;?Id=id"><span class="am-icon-edit"></span>编辑</a>
                                                <a class="am-btn am-btn-default am-btn-danger" href="javascript:;?id=id"><span class="am-icon-trash-o"></span>删除</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
                              }%>
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

    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/amazeui.min.js"></script>
    <script src="../assets/js/app.js"></script>

    <form id="from" enctype="multipart/form-data">
        <div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt">
            <div class="am-modal-dialog">
                <div class="am-modal-hd">西西弗书店</div>
                <div class="am-modal-bd">
                    新增
                <input type="text" class="am-modal-prompt-input" name="title" id="title" placeholder="输入广告标题" />
                    <input type="file" class="am-modal-prompt-input" name="img" id="img" placeholder="请选择文件图片“" />
                </div>
                <div class="am-modal-footer">
                    <span class="am-modal-btn" data-am-modal-cancel>取消</span>
                    <span class="am-modal-btn" data-am-modal-confirm>提交</span>
                </div>
            </div>
        </div>
    </form>

     <form id="Form1" enctype="multipart/form-data">
        <div class="am-modal am-modal-prompt" tabindex="-1" id="Div1">
            <div class="am-modal-dialog">
                <div class="am-modal-hd">西西弗书店</div>
                <div class="am-modal-bd">
                    编辑
                <input type="text" class="am-modal-prompt-input" name="title" id="title1" placeholder="输入广告标题" />
                    <input type="file" class="am-modal-prompt-input" name="img" id="img1" placeholder="请选择文件图片“" />
                </div>
                <div class="am-modal-footer">
                    <span class="am-modal-btn" data-am-modal-cancel>取消</span>
                    <span class="am-modal-btn" data-am-modal-confirm>提交</span>
                </div>
            </div>
        </div>
    </form>


    <div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
        <div class="am-modal-dialog">
            <div class="am-modal-hd">西西弗书店</div>
            <div class="am-modal-bd">
                你，确定要删除这条广告记录吗？
            </div>
            <div class="am-modal-footer">
                <span class="am-modal-btn" data-am-modal-cancel>取消</span>
                <span class="am-modal-btn" data-am-modal-confirm>确定</span>
            </div>
        </div>
    </div>

</body>

</html>
