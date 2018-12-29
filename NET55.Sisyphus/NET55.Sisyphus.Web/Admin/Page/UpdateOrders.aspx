<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateOrders.aspx.cs" Inherits="NET55.Sisyphus.Web.Admin.Page.UpdateOrders" %>

<!DOCTYPE html>

<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>修改订单信息</title>
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
                        <a href="OrderManager.aspx" class="nav-link tpl-left-nav-link-list active">
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
                订单管理
            </div>
            <ol class="am-breadcrumb">
                <li><a href="javascript:;" class="am-icon-home">首页</a></li>
                <li><a href="OrderManager.aspx">订单管理</a></li>
                <li class="am-active">修改订单信息</li>
            </ol>
            <div class="tpl-portlet-components">

                <div class="tpl-block ">

                    <div class="am-g tpl-amazeui-form">


                        <div class="am-u-sm-12 am-u-md-9">
                            <form class="am-form am-form-horizontal">
                                <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">订单号 / OrderID</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" readonly="readonly" id="order-Id" placeholder="订单号 / OrderID" value="<%=order.OrderId %>">
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="user-email" class="am-u-sm-3 am-form-label">下单时间 / Time</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" readonly="readonly" id="order-time" placeholder="下单时间 / Time" value="<%=order.OrderDate %>">
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="user-phone" class="am-u-sm-3 am-form-label">下单用户 / User</label>
                                    <div class="am-u-sm-9">
                                        <input type="tel" id="order-user" readonly="readonly" placeholder="下单用户 / User" value="<%=ub.GetModel(order.UserId).Name %>">
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="user-QQ" class="am-u-sm-3 am-form-label">总价/TotalPrice</label>
                                    <div class="am-u-sm-9">
                                        <input type="number" readonly="readonly" id="totalprice" placeholder="总价" value="<%=order.TotalPrice.ToString("f2") %>">
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="user-intro" class="am-u-sm-3 am-form-label">订单状态 / state</label>
                                    <div class="am-u-sm-9">
                                        <%if (order.state == 0)
                                          {%>
                                        <input type="text" id="order-state" readonly="readonly" placeholder="订单状态 / state" value="未付款">
                                        <% }
                                          else if (order.state == 1)
                                          {%>
                                        <input type="text" id="order-state" readonly="readonly" placeholder="订单状态 / state" value="已付款未发货">
                                        <%}
                                          else if (order.state == 2)
                                          {%>
                                        <input type="text" id="order-state" readonly="readonly" placeholder="订单状态 / state" value="已完成">
                                        <% } %>
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="user-weibo" class="am-u-sm-3 am-form-label">寄送地址 / address</label>
                                    <div class="am-u-sm-9">
                                        <textarea class="" rows="5" id="user-intro" placeholder="寄送地址">
                                             <%if (order.PostAddress.Length > 1)
                                                  {
                                                %>
                                                <%=order.PostAddress %>
                                                <%
                                                  }
                                                  else
                                                  {%>
                                                <%=order.PostAddress.Length>0?uab.GetModel(Convert.ToInt32(order.PostAddress)).Address.Trim():"暂无" %>
                                                <% } %>
                                         </textarea>
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <div class="am-u-sm-9 am-u-sm-push-3">
                                        <button type="button" id="btnsure" class="am-btn am-btn-primary">保存修改</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
    <script>
        $(function () {
            $('#btnsure').click(function () {
                var orderId = $('#order-Id').val();
                var address = $('#user-intro').val();
                swal({
                    title: "确认修改？",
                    text: "修改前请先与客户达成一致意见",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    cancelButtonText: "取消",
                    confirmButtonText: "确定",
                    closeOnConfirm: false
                }, function () {
                    $.post('../Ashx/UpdateOrder.ashx', { orderId:orderId, address: address }, function (msg) {
                        if (msg == "ok") {
                            swal({
                                title: '修改成功',
                                type: 'success'
                            }, function () {
                                window.location.href = "../Page/OrderManager.aspx";
                            });
                        }
                        else {
                            swal("提 示", "服务器繁忙，请稍后重试", "error");
                        }
                    });
                });
            });
        });
    </script>
</body>

</html>
