<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderManager.aspx.cs" Inherits="NET55.Sisyphus.Web.Admin.Page.OrderManager" %>

<!DOCTYPE html>

<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>订单管理</title>
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
    <script src="../assets/js/echarts.min.js"></script>
    <script src="../assets/js/dijs.js"></script>
    <script src="../assets/js/exits.js"></script>
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
            </ol>

            <div class="tpl-portlet-components">

                <div class="tpl-block">
                    <div class="am-g">
                        <div class="am-u-sm-12">
                            <form class="am-form">
                                <table class="am-table am-table-striped am-table-hover table-main">
                                    <thead>
                                        <tr>
                                            <th class="table-title">订单编号</th>
                                            <th class="table-type">下单时间</th>
                                            <th class="table-author am-hide-sm-only">下单用户</th>
                                            <th class="table-date am-hide-sm-only">总价</th>
                                            <th class="table-date am-hide-sm-only">寄送地址</th>
                                            <th class="table-date am-hide-sm-only">状态</th>
                                            <th class="table-set">操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%foreach (var item in orderList)
                                          {
                                        %>
                                        <tr>
                                            <td><a href="OrderDetails.aspx?OrderId=<%=item.OrderId %>"><%=item.OrderId %></a></td>
                                            <td><%=item.OrderDate %></td>
                                            <td><%=ub.GetModel(item.UserId).Name%></td>
                                            <td class="am-hide-sm-only"><%=item.TotalPrice.ToString("f2") %></td>
                                            <td class="am-hide-sm-only">
                                                <%if (item.PostAddress.Length > 1)
                                                  {
                                                %>
                                                <%=item.PostAddress %>
                                                <%
                                                  }
                                                  else
                                                  {%>
                                                <%=item.PostAddress.Length>0?uab.GetModel(Convert.ToInt32(item.PostAddress)).Address.Trim():"暂无" %>
                                                <% } %>
                                                
                                            </td>
                                            <td>
                                                <%if (item.state == 0)
                                                  {%>
                                                  未付款
                                                 <% }
                                                  else if (item.state == 1)
                                                  {%>
                                                  已付款
                                                  <%}
                                                  else if (item.state == 2)
                                                  {%>
                                                  已完成
                                                 <% } %>
                                            </td>
                                            <td>
                                                <div class="am-btn-toolbar">
                                                    <div class="am-btn-group am-btn-group-xs">
                                                        <%if (item.state == 0)
                                                          {%>
                                                        <a class="am-btn am-btn-default am-btn-xs am-text-secondary" href="javascript:alert('该订单尚未付款，暂不可操作');"><span class="am-icon-pencil-square-o"></span>编辑</a>
                                                        <% }
                                                          else if(item.state==1)
                                                          {%>
                                                        <a class="am-btn am-btn-default am-btn-xs am-text-secondary" href="UpdateOrders.aspx?orderId=<%=item.OrderId %>"><span class="am-icon-pencil-square-o"></span>编辑</a>
                                                        <%}%>
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
</body>

</html>
