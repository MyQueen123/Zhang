<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="NET55.Sisyphus.Web.Home.person.index" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>个人中心</title>

    <link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
    <link href="../css/personal.css" rel="stylesheet" type="text/css">
    <link href="../css/systyle.css" rel="stylesheet" type="text/css">
    <script src="../js/jquery.min.js"></script>
    <script src="../js/Search.js"></script>
    <script>
        $(function () {
            $('#change').click(function () {
                window.location.reload();
            });
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
                <div class="wrap-left">
                    <div class="wrap-list">
                        <div class="m-user">
                            <!--个人信息 -->
                            <div class="m-bg"></div>
                            <div class="m-userinfo">
                                <div class="m-baseinfo">
                                    <a href="information.aspx">
                                        <img src="../images/getAvatar.do.jpg">
                                    </a>
                                    <em class="s-name"><%=((Maticsoft.Model.Users)Session["user"]).Name %><span class="vip1"></em>
                                    <div class="s-prestige am-btn am-round">
                                        </span>会员福利
                                    </div>
                                </div>
                                <div class="m-right">
                                    <div class="m-address">
                                        <a href="address.aspx" class="i-trigger">我的收货地址</a>
                                    </div>
                                </div>
                            </div>

                            <!--个人资产-->

                        </div>
                        <div class="box-container-bottom"></div>

                        <!--订单 -->
                        <div class="m-order">
                            <div class="s-bar">
                                <i class="s-icon"></i>我的订单
									<a class="i-load-more-item-shadow" href="order.aspx">全部订单</a>
                            </div>
                            <ul>
                                <li><a href="order.aspx"><i>
                                    <img src="../images/pay.png" /></i><span>待付款</span></a></li>
                                <li><a href="order.aspx"><i>
                                    <img src="../images/send.png" /></i><span>待发货<em class="m-num"><%=allcount %></em></span></a></li>
                                <li><a href="order.aspx"><i>
                                    <img src="../images/receive.png" /></i><span>待收货</span></a></li>
                                <li><a href="order.aspx"><i>
                                    <img src="../images/comment.png" /></i><span>待评价</span></a></li>
                                
                            </ul>
                        </div>
                        <!--九宫格-->
                        <div class="user-patternIcon">
                            <div class="s-bar">
                                <i class="s-icon"></i>我的常用
                            </div>
                            <ul>

                                <a href="../Page/ShopCart.aspx">
                                    <li class="am-u-sm-4"><i class="am-icon-shopping-basket am-icon-md"></i>
                                        <img src="../images/iconbig.png" /><p>购物车</p>
                                    </li>
                                </a>
                                <a href="collection.html">
                                    <li class="am-u-sm-4"><i class="am-icon-heart am-icon-md"></i>
                                        <img src="../images/iconsmall1.png" /><p>我的收藏</p>
                                    </li>
                                </a>
                                <a href="../home/home.html">
                                    <li class="am-u-sm-4"><i class="am-icon-gift am-icon-md"></i>
                                        <img src="../images/iconsmall0.png" /><p>为你推荐</p>
                                    </li>
                                </a>
                                <a href="comment.html">
                                    <li class="am-u-sm-4"><i class="am-icon-pencil am-icon-md"></i>
                                        <img src="../images/iconsmall3.png" /><p>好评宝贝</p>
                                    </li>
                                </a>
                                <a href="foot.html">
                                    <li class="am-u-sm-4"><i class="am-icon-clock-o am-icon-md"></i>
                                        <img src="../images/iconsmall2.png" /><p>我的足迹</p>
                                    </li>
                                </a>
                            </ul>
                        </div>


                        <!--优品推荐 -->
                        <div class="you-like">
                            <div class="s-bar">
                                我的收藏
                                <a class="i-load-more-item-shadow" id="change" href="javascript:;"><i class="am-icon-refresh am-icon-fw"></i>换一组</a>
                            </div>
                            <div class="s-content">
                                <%foreach (var item in youbkList)
                                  {
                                %>
                                <div class="s-item-wrap">
                                    <div class="s-item">

                                        <div class="s-pic">
                                            <a href="/Home/Page/BookDetails_<%=item.Id %>.aspx" class="s-pic-link">
                                                <img style="height:220px" src="/BookCovers/<%=item.ISBN %>.jpg" alt="" title="<%=item.Title %>" class="s-pic-img s-guess-item-img">
                                            </a>
                                        </div>
                                        <div class="s-price-box">
                                            <span class="s-price"><em class="s-price-sign">¥</em><em class="s-value"><%=item.UnitPrice.ToString("f2") %></em></span>
                                            <span class="s-history-price"><em class="s-price-sign">¥</em><em class="s-value"><%=(item.UnitPrice+100).ToString("f2") %></em></span>

                                        </div>
                                        <div class="s-title"><a href="/Home/Page/BookDetails_<%=item.Id %>.aspx" title="<%=item.Title %>"><%=item.Title %></a></div>
                                        <div class="s-extra-box">
                                            <span class="s-comment">好评: 99.93%</span>
                                            <span class="s-sales">月销: 278</span>

                                        </div>
                                    </div>
                                </div>
                                <%
                                  } %>
                            </div>

                            <div class="s-more-btn i-load-more-item" data-screen="0"><i class="am-icon-refresh am-icon-fw"></i>更多</div>

                        </div>

                    </div>
                </div>
                <div class="wrap-right">

                    <!-- 日历-->
                    <div class="day-list">
                        <div class="s-bar">
                            <a class="i-history-trigger s-icon" href="javascript:;"></a>我的日历
								<a class="i-setting-trigger s-icon" href="javascript:;"></a>
                        </div>
                        <div class="s-care s-care-noweather">
                            <div class="s-date">
                                <em><%=DateTime.Now.Day %></em>
                                <span><%=DateTime.Now.DayOfWeek %></span>
                                <span><%=DateTime.Now.Year %>.<%=DateTime.Now.Month %></span>
                            </div>
                        </div>
                    </div>
                    <!--新品 -->
                    <div class="new-goods">
                        <div class="s-bar">
                            <i class="s-icon"></i>今日新品
								<a class="i-load-more-item-shadow">15款新品</a>
                        </div>
                        <div class="new-goods-info">
                            <a class="shop-info" href="/Home/Page/BookDetails.aspx?bookid=<%=bk.Id %>" target="_blank">
                                <div class="face-img-panel">
                                    <img src="/BookCovers/<%=bk.ISBN %>.jpg" alt="">
                                </div>
                                <span class="new-goods-num ">6</span>
                                <span class="shop-title">￥<%=bk.UnitPrice.ToString("f2") %></span>
                            </a>
                        </div>
                    </div>

                    <!--热卖推荐 -->
                    <div class="new-goods">
                        <div class="s-bar">
                            <i class="s-icon"></i>热卖推荐
                        </div>
                        <div class="new-goods-info">
                            <a class="shop-info" href="/Home/Page/BookDetails.aspx?bookid=<%=hotbk.Id %>" target="_blank">
                                <div>
                                    <img src="/BookCovers/<%=hotbk.ISBN %>.jpg" alt="">
                                </div>
                                <span class="one-hot-goods">￥<%=hotbk.UnitPrice.ToString("f2") %></span>
                            </a>
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
                <li class="person active">
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
                        <li><a href="order.aspx">订单管理</a></li>
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
    <!--引导 -->
    <div class="navCir">
        <li><a href="../home/home.html"><i class="am-icon-home "></i>首页</a></li>
        <li><a href="../home/sort.html"><i class="am-icon-list"></i>分类</a></li>
        <li><a href="../home/shopcart.html"><i class="am-icon-shopping-basket"></i>购物车</a></li>
        <li class="active"><a href="index.html"><i class="am-icon-user"></i>我的</a></li>
    </div>
</body>

</html>
