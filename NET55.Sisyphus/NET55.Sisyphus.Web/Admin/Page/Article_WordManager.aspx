<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Article_WordManager.aspx.cs" Inherits="Web.Admin.Page.Article_WordManager" %>


<!DOCTYPE html>

<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>敏感/禁用词管理</title>
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
    <link href="../assets/css/dicss.css" rel="stylesheet" />
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/dijs.js"></script>
    <script src="../assets/js/echarts.min.js"></script>
    <script src="../assets/js/amazeui.min.js"></script>
    <script src="../assets/js/dijs.js"></script>
    <script src="../assets/js/exits.js"></script>
    <script>
        $(function () {
            $('#add').click(function () {
                $('#my-prompt').modal({
                    relatedTarget: this,
                    onConfirm: function (e) {
                        $.post('../Ashx/AddArticle.ashx', { name: e.data[0], ci: e.data[1] }, function (msg) {
                            if (msg == "kong") {
                                swal('提示', '请输入词组', 'error');
                            } else if (msg == "no") {
                                swal('提示', '添加失败', 'error');
                            } else {
                                swal({
                                    title: '添加成功',
                                    type: 'success'
                                }, function () {
                                    window.location.reload();
                                })
                            }
                        });
                    },
                    onCancel: function (e) {
                    }
                });
            });
            $('a[href="javascript:;?id=id"]').click(function () {
                var aimg = $(this);
                $('#my-confirm').modal({
                    relatedTarget: this,
                    onConfirm: function (e) {
                        $.post('../Ashx/DeleteArticle.ashx', { id: aimg.prev().val() }, function (msg) {
                            if (msg == "ok") {
                                swal({
                                    title: '删除成功',
                                    type: 'success'
                                }, function () {
                                    window.location.reload();
                                })
                            } else {
                                swal('提示', '删除失败', 'error');
                            }
                        });
                    },
                    // closeOnConfirm: false,
                    onCancel: function () {
                    }
                });
            });
        });
    </script>
</head>

<body data-type="index">


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
                        <a href="Article_WordManager.aspx" class="nav-link tpl-left-nav-link-list active">
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
                敏感/禁用词管理
            </div>
            <ol class="am-breadcrumb">
                <li><a href="javascript:;" class="am-icon-home">首页</a></li>
                <li><a href="Article_WordManager.aspx">敏感/禁用词管理</a></li>
            </ol>

            <div class="tpl-portlet-components">

                <div class="tpl-block">
                    <div class="am-g">
                        <div class="am-u-sm-12 am-u-md-12">
                            <div class="am-btn-toolbar">
                                <div class="am-btn-group am-btn-group-xs" id="add">
                                    <button type="button" class="am-btn am-btn-default am-btn-success"><span class="am-icon-plus"></span>新增</button>
                                </div>
                            </div>
                        </div>
                        <div class="am-u-sm-12">
                            <form class="am-form">
                                <table class="am-table am-table-striped am-table-hover table-main">
                                    <thead>
                                        <tr>
                                            <th class="table-id">ID</th>
                                            <th class="table-title">词组</th>
                                            <th class="table-author am-hide-sm-only">是否是禁用词</th>
                                            <th class="table-author am-hide-sm-only">是否是敏感词</th>
                                            <th class="table-author am-hide-sm-only">替换词</th>
                                            <th class="table-set">操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%foreach (var item in wordList)
                                          {
                                        %>
                                        <tr>
                                            <td><%=item.Id %></td>
                                            <td><%=item.WordPattern %></td>
                                            <td><%=item.IsForbid?"是":"否" %></td>
                                            <td class="am-hide-sm-only"><%=item.IsMod?"是":"否" %></td>
                                            <td class="am-hide-sm-only"><%=item.ReplaceWord.Length>0?item.ReplaceWord:"无" %></td>
                                            <td>
                                                <div class="am-btn-toolbar">
                                                    <div class="am-btn-group am-btn-group-xs">
                                                        <input type="hidden" name="id" value="<%=item.Id %>" />
                                                        <a href="javascript:;?id=id" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"><span class="am-icon-trash-o"></span>删除</a>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <%
                                          } %>
                                    </tbody>
                                </table>
                                <div class="am-cf">

                                    <div class="am-fr">
                                        <ul class="am-pagination tpl-pagination">
                                            <%=Common.PageBarHelper.GetPagaBar(pageIndex,pageCount) %>
                                        </ul>
                                    </div>
                                </div>
                                <hr>
                            </form>
                        </div>

                    </div>
                </div>
                <div class="tpl-alert"></div>
            </div>

        </div>

    </div>
    <script src="../assets/js/iscroll.js"></script>
    <script src="../assets/js/app.js"></script>
    <div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt">
        <div class="am-modal-dialog">
            <div class="am-modal-hd">西西弗书店</div>
            <div class="am-modal-bd">
                新增
                <input type="text" class="am-modal-prompt-input" name="name" id="name" placeholder="请输入词组" />
                <select class="am-modal-prompt-input" name="ci" id="ci">
                    <option value="禁用词">禁用词</option>
                    <option value="敏感词">敏感词</option>
                </select>


            </div>
            <div class="am-modal-footer">
                <span class="am-modal-btn" data-am-modal-cancel>取消</span>
                <span class="am-modal-btn" data-am-modal-confirm>提交</span>
            </div>
        </div>
    </div>
    <div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
        <div class="am-modal-dialog">
            <div class="am-modal-hd">西西弗书店</div>
            <div class="am-modal-bd">
                你，确定要删除这条记录吗？
            </div>
            <div class="am-modal-footer">
                <span class="am-modal-btn" data-am-modal-cancel>取消</span>
                <span class="am-modal-btn" data-am-modal-confirm>确定</span>
            </div>
        </div>
    </div>
</body>

</html>
