<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="orderinfo.aspx.cs" Inherits="NET55.Sisyphus.Web.Home.person.orderinfo" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>订单详情</title>

    <link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

    <link href="../css/personal.css" rel="stylesheet" type="text/css">
    <link href="../css/orstyle.css" rel="stylesheet" type="text/css">

    <script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>
    <script src="../js/Search.js"></script>
    <script>
        $(function () {
            //退出登录
            $("#tuichu").click(function () {
                swal({
                    title: "确定退出吗？",
                    text: "您必须登录之后才能进行商品购买！",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "确定退出",
                    cancelButtonText: "取消",
                    closeOnConfirm: false,
                    closeOnCancel: false
                },
                function (isConfirm) {
                    if (isConfirm) {
                        window.location.href = "../Ashx/exits.ashx";
                    }
                });
            });
        });
    </script>
</head>

<body>
    <!--头 -->
    <header>
        <article>
            <div class="mt-logo">
                <!--顶部导航条 -->
                <div class="am-container header">
                    <ul class="message-l">
                        <div class="topMessage">
                            <div class="menu-hd">
                                <%if (Session["user"] == null)
                                  { %>
                                <a href="Login.aspx" target="_top" class="h">亲，请登录</a>
                                <a href="Register.aspx" target="_top">免费注册</a>
                                <%}
                                  else
                                  { %>
                                <a href="javascript:;" target="_top" class="h">欢迎你</a>
                                <a href="javascript:;" target="_top"><%=((Maticsoft.Model.Users)Session["user"]).Name %></a>
                                <a href="javascript:;" id="tuichu" target="_top">退出登录</a>
                                <%} %>
                            </div>
                        </div>
                    </ul>
                    <ul class="message-r">
                        <div class="topMessage home">
                            <div class="menu-hd"><a href="/Home/Page/Index.aspx" target="_top" class="h">商城首页</a></div>
                        </div>
                        <div class="topMessage my-shangcheng">
                            <div class="menu-hd MyShangcheng"><a href="index.aspx" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
                        </div>
                        <div class="topMessage mini-cart">
                            <div class="menu-hd"><a id="mc-menu-hd" href="/Home/Page/ShopCart.aspx" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
                        </div>
                    </ul>
                </div>

                <!--悬浮搜索框-->

                <div class="nav white">
                    <div class="logoBig">
                        <li>
                            <img src="../images/logobig.png" /></li>
                    </div>

                    <div class="search-bar pr">
                        <a name="index_none_header_sysc" href="#"></a>
                        <form>
                            <input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
                            <input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
                            <div id="sr" style="width: 524px; height: auto; position: absolute;"></div>
                        </form>
                    </div>
                </div>

                <div class="clear"></div>
            </div>
            </div>
		
        </article>
    </header>
    <div class="nav-table">
        <div class="long-title"><span class="all-goods">全部分类</span></div>
        <div class="nav-cont">
            <ul>
                <li class="index"><a href="/Home/Page/Index.aspx">首页</a></li>
                <li class="qc"><a href="#">闪购</a></li>
                <li class="qc"><a href="/Home/Page/BookList.aspx">全部分类</a></li>
                <li class="qc"><a href="#">团购</a></li>
                <li class="qc last"><a href="#">大包装</a></li>
            </ul>
          
        </div>
    </div>
    <b class="line"></b>
    <div class="center">
        <div class="col-main">
            <div class="main-wrap">

                <div class="user-orderinfo">

                    <!--标题 -->
                    <div class="am-cf am-padding">
                        <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单详情</strong> / <small>Order&nbsp;details</small></div>
                    </div>
                    <hr />
                    
                    <div class="order-infoaside">
                        <div class="order-logistics">
                            <a href="javascript:;">
                                <div class="icon-log">
                                    <i>
                                        <img src="../images/receive.png"></i>
                                </div>
                                <div class="latest-logistics">
                                    <p class="text">正在努力为您安排发货，请见谅，谢谢</p>
                                    <div class="time-list">
                                        <span class="date">2015-12-19</span><span class="week"><%=DateTime.Now.ToShortDateString()+days %></span><span class="time"><%=DateTime.Now.ToShortTimeString() %></span>
                                    </div>
                                    <div class="inquire">
                                        <span class="package-detail">物流：天天快递</span>
                                        <span class="package-detail">快递单号: </span>
                                        <span class="package-number"><%=o.OrderId %></span>
                                    </div>
                                </div>
                                <span class="am-icon-angle-right icon"></span>
                            </a>
                            <div class="clear"></div>
                        </div>
                        <div class="order-addresslist">
                            <div class="order-address">
                                <div class="icon-add">
                                </div>
                                <p class="new-tit new-p-re">
                                    <span class="new-txt"><%=u.Name %></span>
                                    <span class="new-txt-rd2"><%=u.Phone.Substring(0,3) %>********</span>
                                </p>
                                <div class="new-mu_l2a new-p-re">
                                    <p class="new-mu_l2cw">
                                        <span class="title">收货地址：</span>
                                        <span class="province"><%=ua.Address %></span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="order-infomain">

                        <div class="order-top">
                            <div class="th th-item">
                                <td class="td-inner">商品</td>
                            </div>
                            <div class="th th-price">
                                <td class="td-inner">单价</td>
                            </div>
                            <div class="th th-number">
                                <td class="td-inner">数量</td>
                            </div>
                            <div class="th th-operation">
                                <td class="td-inner">商品操作</td>
                            </div>
                            <div class="th th-amount">
                                <td class="td-inner">合计</td>
                            </div>
                            <div class="th th-status">
                                <td class="td-inner">交易状态</td>
                            </div>
                            <div class="th th-change">
                                <td class="td-inner">交易操作</td>
                            </div>
                        </div>

                        <div class="order-main">

                            <div class="order-status3">
                                <div class="order-title">
                                    <div class="dd-num">订单编号：<a href="javascript:;"><%=o.OrderId %></a></div>
                                    <span>成交时间：<%=o.OrderDate %></span>
                                    <!--    <em>店铺：小桔灯</em>-->
                                </div>
                                <div class="order-content">
                                    <div class="order-left">
                                        <%foreach (var item in obb.GetModelList("OrderID='"+o.OrderId+"'"))
                                          {
                                              %>
                                        <ul class="item-list">
                                            <li class="td td-item">
                                                <div class="item-pic">
                                                    <a href="javascript:;" class="J_MakePoint">
                                                        <img src="/BookCovers/<%=bbll.GetModel(item.BookID).ISBN %>.jpg" class="itempic J_ItemImg">
                                                    </a>
                                                </div>
                                                <div class="item-info">
                                                    <div class="item-basic-info">
                                                        <a href="javascript:;">
                                                            <p><%=bbll.GetModel(item.BookID).Title %> </p>
                                                            <p class="info-little">
                                                                书籍类型：<%=new Maticsoft.BLL.CategoriesBll().GetModel(bbll.GetModel(item.BookID).CategoryId).Name %>
                                                            </p>
                                                        </a>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="td td-price">
                                                <div class="item-price">
                                                    <%=item.UnitPrice.ToString("f2") %>
												
                                                </div>
                                            </li>
                                            <li class="td td-number">
                                                <div class="item-number">
                                                    <span>×</span>2
												
                                                </div>
                                            </li>
                                            <li class="td td-operation">
                                                <div class="item-operation">
                                                    退款/退货
												
                                                </div>
                                            </li>
                                        </ul>
                                        <%
                                          } %>
                                        

                                    </div>
                                    <div class="order-right">
                                        <li class="td td-amount">
                                            <div class="item-amount">
                                                <%=o.TotalPrice.ToString("f2") %>
                                            </div>
                                        </li>
                                        <div class="move-right">
                                            <li class="td td-status">
                                                <div class="item-status">
                                                    <p class="Mystatus">等待卖家发货</p>
                                                </div>
                                            </li>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!--底部-->
            <div class="footer">
                <div class="footer-hd">
                    <p>
                        <a href="javascript:;">恒望科技</a>
                        <b>|</b>
                        <a href="/Home/Page/Index.aspx">商城首页</a>
                        <b>|</b>
                        <a href="javascript:;">支付宝</a>
                        <b>|</b>
                        <a href="javascript:;">物流</a>
                    </p>
                </div>
                <div class="footer-bd">
                    <p>
                        <a href="javascript:;">关于恒望</a>
                        <a href="javascript:;">合作伙伴</a>
                        <a href="javascript:;">联系我们</a>
                        <a href="javascript:;">网站地图</a>
                        <em>© 2015-2025 Hengwang.com 版权所有</em>
                    </p>
                </div>
            </div>

        </div>
        <aside class="menu">
            <ul>
                <li class="person">
                    <a href="index.aspx">个人中心</a>
                </li>
                <li class="person">
                    <a href="javascript:;">个人资料</a>
                    <ul>
                        <li><a href="information.aspx">个人信息</a></li>
                        <li><a href="safety.aspx">安全设置</a></li>
                        <li><a href="address.aspx">收货地址</a></li>
                    </ul>
                </li>
                <li class="person">
                    <a href="javascript:;">我的交易</a>
                    <ul>
                        <li class="active"><a href="order.aspx">订单管理</a></li>
                    </ul>
                </li>
                <li class="person">
                    <a href="javascript:;">我的资产</a>
                    <ul>
                        <li><a href="bill.aspx">账单明细</a></li>
                    </ul>
                </li>
            </ul>

        </aside>
    </div>

</body>

</html>
