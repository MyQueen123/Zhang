<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bindphone.aspx.cs" Inherits="NET55.Sisyphus.Web.Home.person.bindphone" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>绑定手机</title>

    <link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

    <link href="../css/personal.css" rel="stylesheet" type="text/css">
    <link href="../css/stepstyle.css" rel="stylesheet" type="text/css">
    <link href="../css/dicss.css" rel="stylesheet" />
    <script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
    <script src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>
    <script src="../js/dijs.js"></script>
    <script src="../js/Search.js"></script>
    <script>
        function sendMobileCode() {
            $('#sendMobileCode').click(function () {
                var phone = $('#dianhua').val();
                var btn = $(this);

                $.post('../Ashx/sendPhoneVali.ashx?op=reg', {}, function (msg) {
                    alert(msg);
                    btn.unbind('click');
                    var ti = 6;
                    var time = setInterval(function () {
                        ti--;
                        if (ti == 0) {
                            $('#yanzheng').text('验证码');
                            clearInterval(time);
                            sendMobileCode();
                        }
                        else {
                            $('#yanzheng').text(ti);
                        }
                    }, 1000)
                });
            });
        }
        $(function () {
            sendMobileCode();
            

            $('#queding').click(function () {
                //表单验证成功
                if ($('#frm').validator('isFormValid')) {
                    var phone = $('#user-new-phone').val();
                    var yan = $('#user-code').val();
                    if (/^1[3-9]\d{9}$/.test(phone)) {
                        $.post('../Ashx/UpdatePhone.ashx', { phone: phone,yan:yan }, function (aaa) {
                            swal("提 示",aaa);
                        });
                    }
                }
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

                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">换绑手机</strong> / <small>Bind&nbsp;Phone</small></div>
                </div>
                <hr />
         
                <form class="am-form am-form-horizontal" id="frm" data-am-validator>
                    <div class="am-form-group bind">
                        <label for="user-phone" class="am-form-label">原手机号码</label>
                        <div class="am-form-content">
                            <span id="user-phone"><%=u.Phone.Substring(0,3) %>********</span>
                            <input type="hidden" id="dianhua" value="<%=u.Phone %>" />
                        </div>
                    </div>
                    <div class="am-form-group code">
                        <label for="user-code" class="am-form-label">验证码</label>
                        <div class="am-form-content">
                            <input type="tel" id="user-code" placeholder="短信验证码" required>
                        </div>
                        <a class="btn" href="javascript:void(0);" id="sendMobileCode">
                            <div class="am-btn am-btn-danger" id="yanzheng">验证码</div>
                        </a>
                    </div>
                    <div class="am-form-group">
                        <label for="user-new-phone" class="am-form-label">新手机号码</label>
                        <div class="am-form-content">
                            <input type="tel" id="user-new-phone" placeholder="绑定新手机号" required />
                        </div>
                    </div>

                    <div class="info-btn" id="queding">
                        <div class="am-btn am-btn-danger">保存修改</div>
                    </div>

                </form>

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
                        <li class="active"><a href="safety.aspx">安全设置</a></li>
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

</body>

</html>
