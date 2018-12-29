<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="address.aspx.cs" Inherits="NET55.Sisyphus.Web.Home.person.address" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>地址管理</title>

    <link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

    <link href="../css/personal.css" rel="stylesheet" type="text/css">
    <link href="../css/addstyle.css" rel="stylesheet" type="text/css">
    <link href="../css/dicss.css" rel="stylesheet" />
    <script src="../js/jquery-1.7.2.min.js"></script>
    <script src="../js/jquery.validate.min.js"></script>
    <script src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>
    <script src="../js/distpicker.data.js"></script>
    <script src="../js/distpicker.js"></script>
    <script src="../js/main.js"></script>
    <script src="../js/dijs.js"></script>
    <script src="../js/Search.js"></script>
    <script>
        //删除收货地址
        function delClick(Id) {
            $.post('../Ashx/DeleteAddress.ashx', { Id: Id }, function (isok) {
                swal({
                    title: "确定删除吗？",
                    text: "你将无法恢复该收货地址！",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "确定删除！",
                    closeOnConfirm: false
                }, function () {
                    if (isok == "ok") {
                        window.location.reload();
                    } else {
                        swal("提示", "服务器繁忙，请稍后重试", "error");
                    }
                });

            });
        }
        $(function () {
            //修改地址
            $('a[name="updClick"]').click(function () {
                $('#shouhuoren').val($(this).parent().prev().prev().children().children().first().text());
                $('#shoujihao').val($(this).parent().prev().prev().children().children().first().next().text());
                $('#xiangxidizhi').val($(this).parent().prev().children().children().eq(1).text());
                var dizhiId = $(this).prev().val();
                $('#my-prompt').modal({
                    relatedTarget: this,
                    onConfirm: function (e) {
                        $.post('/Home/Ashx/UpdateAddress.ashx', { Id: dizhiId, name: $('#shouhuoren').val(), phone: $('#shoujihao').val(), dizhi: $('#xiangxidizhi').val() }, function (info) {
                            if (info == "ok") {
                                window.location.reload();
                            } else {
                                swal("", "服务器繁忙，请稍后重试！！", "error");
                            }
                        });
                    },
                    onCancel: function (e) {

                    }
                });
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
                        <div class="topMessage favorite">
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

                <div class="user-address">
                    <!--标题 -->
                    <div class="am-cf am-padding">
                        <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">地址管理</strong> / <small>Address&nbsp;list</small></div>
                    </div>
                    <hr />
                    <ul class="am-avg-sm-1 am-avg-md-3 am-thumbnails" id="chose_address">
                        <%
                            if (UserAddressList.Count <= 0)
                            {%>
                        <h1>您还没有收货地址，先添加一个地址吧</h1>
                        <% }
                            else
                            {
                                foreach (var item in UserAddressList)
                                {
                        %>
                        <li class="user-addresslist">
                            <p class="new-tit new-p-re">
                                <span class="new-txt"><%=item.Name %></span>
                                <span class="new-txt-rd2"><%=item.Phone %></span>
                            </p>
                            <div class="new-mu_l2a new-p-re">
                                <p class="new-mu_l2cw">
                                    <span class="title">地址：</span>
                                    <span class="province"><%=item.Address %></span>
                                </p>
                            </div>
                            <div class="new-addr-btn">
                                <input type="hidden" value="<%=item.Id %>" />
                                <a href="javascript:;" name="updClick"><i class="am-icon-edit"></i>编辑</a>
                                <span class="new-addr-bar">|</span>
                                <a href="javascript:void(0);" onclick="delClick(<%=item.Id %>);"><i class="am-icon-trash"></i>删除</a>
                            </div>
                        </li>
                        <%
                                }
                            } %>
                    </ul>
                    <div class="clear"></div>
                    <a class="new-abtn-type" data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0}">添加新地址</a>
                    <!--例子-->
                    <div class="am-modal am-modal-no-btn" id="doc-modal-1">

                        <div class="add-dress">

                            <!--标题 -->
                            <div class="am-cf am-padding">
                                <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add&nbsp;address</small></div>
                            </div>
                            <hr />

                            <div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
                                <form class="am-form am-form-horizontal" id="frm" data-am-validator>

                                    <div class="am-form-group">
                                        <label for="user-name" class="am-form-label">收货人</label>
                                        <div class="am-form-content">
                                            <input type="text" id="user-name" placeholder="收货人" required />
                                        </div>
                                    </div>

                                    <div class="am-form-group">
                                        <label for="user-phone" class="am-form-label">手机号码</label>
                                        <div class="am-form-content">
                                            <input id="user-phone" placeholder="手机号必填" type="email" required />
                                        </div>
                                    </div>
                                    <div class="am-form-group">
                                        <label for="user-address" class="am-form-label">所在地</label>

                                        <div class="am-form-content address">

                                            <div data-toggle="distpicker">
                                                <div class="form-group">
                                                    <select class="form-control" id="province1"></select>
                                                </div>
                                                <div class="form-group">
                                                    <select class="form-control" id="city1"></select>
                                                </div>
                                                <div class="form-group">
                                                    <select class="form-control" id="district1"></select>
                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="am-form-group">
                                        <label for="user-intro" class="am-form-label">详细地址</label>
                                        <div class="am-form-content">
                                            <textarea class="" rows="3" id="user-intro" placeholder="输入详细地址"></textarea>
                                            <small>100字以内写出你的详细地址...</small>
                                        </div>
                                    </div>

                                    <div class="am-form-group">
                                        <div class="am-u-sm-9 am-u-sm-push-3">
                                            <a id="address_Add" class="am-btn am-btn-danger">保存</a>
                                            <a href="javascript: void(0)" class="am-close am-btn am-btn-danger" data-am-modal-close>取消</a>
                                        </div>
                                    </div>
                                </form>
                            </div>

                        </div>

                    </div>

                </div>

                <script type="text/javascript">
                    $(document).ready(function () {
                        $(".new-option-r").click(function () {
                            $(this).parent('.user-addresslist').addClass("defaultAddr").siblings().removeClass("defaultAddr");
                        });

                        var $ww = $(window).width();
                        if ($ww > 640) {
                            $("#doc-modal-1").removeClass("am-modal am-modal-no-btn")
                        }
                        //添加地址
                        $('#address_Add').click(function () {
                            if ($('#frm').validator('isFormValid')) {
                                var uname = $('#user-name').val();
                                var uphone = $('#user-phone').val();
                                var province = $('#province1').val();
                                var city = $('#city1').val();
                                var district = $('#district1').val();
                                var xxdizhi = $('#user-intro').val();
                                $.post('../Ashx/Add_address.ashx', { name: uname, phone: uphone, dizhi: province + city + district + xxdizhi }, function (msg) {
                                    if (msg == "ok") {
                                        window.location.reload();
                                    } else {
                                        swal("提 示", "服务器正忙，请稍后重试", "error");
                                    }
                                });
                            }
                        });
                    });
                </script>

                <div class="clear"></div>

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
                        <li class="active"><a href="address.aspx">收货地址</a></li>
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


    <div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt">
        <div class="am-modal-dialog">
            <div class="am-modal-hd">修改收货地址</div>
            <div class="am-modal-bd">
                <input type="text" id="shouhuoren" class="am-modal-prompt-input" placeholder="收货人">
                <input type="text" id="shoujihao" class="am-modal-prompt-input" placeholder="手机号">
                <input type="text" id="xiangxidizhi" class="am-modal-prompt-input" placeholder="详细地址" />
            </div>

            <div class="am-modal-footer">
                <span class="am-modal-btn" data-am-modal-cancel>取消</span>
                <span class="am-modal-btn" data-am-modal-confirm>确认修改</span>
            </div>
        </div>
    </div>
</body>

</html>
