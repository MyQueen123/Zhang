<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bill.aspx.cs" Inherits="NET55.Sisyphus.Web.Home.person.bill" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>个人账单</title>

    <link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

    <link href="../css/personal.css" rel="stylesheet" type="text/css">
    <link href="../css/blstyle.css" rel="stylesheet" type="text/css">
    <script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
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

                <div class="user-bill">
                    <!--标题 -->
                    <div class="am-cf am-padding">
                        <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">账单</strong> / <small>Electronic&nbsp;bill</small></div>
                    </div>
                    <hr />

                    <div class="ebill-section">
                        <div class="ebill-title-section">
                            <h2 class="trade-title section-title">交易
                            <span class="desc">（金额单位：元）</span>
                            </h2>

                            <div class=" ng-scope">
                                <div class="trade-circle-select  slidedown-">
                                    <a href="javascript:void(0);" class="current-circle ng-binding">2018/9/01 - 2018/9/30</a>

                                </div>
                                <span class="title-tag"><i class="num ng-binding">12</i>月</span>
                            </div>
                        </div>

                        <div class="module-income ng-scope">
                            <div class="income-slider ">
                                <div class="block-income block  fn-left">
                                    <h3 class="income-title block-title">支出
                                      <span class="num ng-binding"><%=allbill.ToString("f2") %>
                                      </span>
                                    </h3>

                                    <div ng-class="shoppingChart" class="catatory-details  fn-hide shopping">
                                        <div class="catatory-chart fn-left fn-hide">
                                            <div class="title">类型</div>
                                            <ul>
                                                <%foreach (var item in orderbookList)
                                                  {
                                                %>
                                                <li class="ng-scope  delete-false">
                                                    <%=new Maticsoft.BLL.CategoriesBll().GetModel(new Maticsoft.BLL.BooksBll().GetModel(item.BookID).CategoryId).Name %>
                                                </li>
                                                <%
                                                  } %>
                                            </ul>
                                        </div>
                                        <div class="catatory-detail fn-left">
                                            <div class="title ng-binding">
                                                购买商品
                                            </div>
                                            <ul>
                                                <%foreach (var item in orderbookList)
                                                  {
                                                %>
                                                <li class="ng-scope  delete-false">

                                                    <div class="  ng-scope">
                                                        <a href="javascript:;" class="text fn-left ">
                                                            <span class="emoji-span ng-binding"><%=new Maticsoft.BLL.BooksBll().GetModel(item.BookID).Title %></span>
                                                            <span class="amount fn-right ng-binding"><%=(item.UnitPrice*item.Quantity).ToString("f2") %></span>
                                                        </a>
                                                    </div>
                                                </li>
                                                <%
                                                  } %>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <!--消费走势-->
                            <div class="module-consumeTrend inner-module">
                                <h3 class="module-title">消费走势</h3>
                                <div id="consumeTrend-chart" class="consumeTrend-chart">
                                </div>
                            </div>

                            <!--银行卡使用情况-->

                            <div class="module-card inner-module">
                                <h3 class="module-title">银行卡使用情况</h3>
                                <div class="card-chart valid">
                                    <div class="cards-carousel">
                                        <div class="mask">

                                            <div class="bac fn-left"></div>
                                            <div class="bank ng-binding" style="background-image: url(../images/combo.png);">中国农业银行</div>
                                            <div class="details">
                                                <a>查看详情</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="cards-details">
                                        <div class="bank-name">
                                            <div class="name fn-left" style="background-image: url(../images/combo.png);"></div>
                                            <span class="close fn-right"><a>X</a></span>
                                        </div>
                                        <div class="bank-detail">
                                            <div class="totalin fn-left">
                                                <span class="fn-left">流入</span>
                                                <span class="amount fn-right">0.00</span>
                                            </div>
                                            <div class="totalout fn-left">
                                                <span class="fn-left">流出</span>
                                                <span class="amount fn-right"><%=allbill.ToString("f2") %></span>
                                            </div>
                                            <div class="expand fn-left">
                                                <span class="fn-left">支出</span>
                                                <span class="amount fn-right">0.00</span>
                                            </div>
                                            <div class="withdraw fn-left">
                                                <span class="fn-left">提现</span>
                                                <span class="amount fn-right">0.00
                                                </span>
                                            </div>
                                            <div class="recharge fn-left">
                                                <span class="fn-left">充值</span>
                                                <span class="amount fn-right">0.00
                                                </span>
                                            </div>

                                            <div class="refund fn-left">
                                                <span class="fn-left">银行卡退款</span>
                                                <span class="amount fn-right ">0.00</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <script>
                                $(document).ready(function (ev) {

                                    $('.cards-carousel .details').on('click', function (ev) {
                                        $('.cards-details').css("display", "block");
                                        $('.cards-carousel').css("display", "none");
                                    });

                                    $('.cards-details .close').on('click', function (ev) {
                                        $('.cards-details').css("display", "none");
                                        $('.cards-carousel').css("display", "block");
                                    });

                                });
                            </script>

                        </div>

                    </div>

                </div>
            </div>
            <!--底部-->
            <div class="footer">
                <div class="footer-hd">
                    <p>
                        <a href="#">恒望科技</a>
                        <b>|</b>
                        <a href="#">商城首页</a>
                        <b>|</b>
                        <a href="#">支付宝</a>
                        <b>|</b>
                        <a href="#">物流</a>
                    </p>
                </div>
                <div class="footer-bd">
                    <p>
                        <a href="#">关于恒望</a>
                        <a href="#">合作伙伴</a>
                        <a href="#">联系我们</a>
                        <a href="#">网站地图</a>
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
                        <li><a href="order.aspx">订单管理</a></li>
                    </ul>
                </li>
                <li class="person">
                    <a href="javascript:;">我的资产</a>
                    <ul>
                        <li class="active"><a href="bill.aspx">账单明细</a></li>
                    </ul>
                </li>
            </ul>

        </aside>
    </div>

</body>

</html>
