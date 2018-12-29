<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShopCart.aspx.cs" Inherits="NET55.Sisyphus.Web.Home.Page.ShopCart" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>购物车页面</title>

    <link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
    <link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />
    <link href="../css/cartstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/optstyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
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
                <div class="menu-hd"><a href="Index.aspx" target="_top" class="h">商城首页</a></div>
            </div>
            <div class="topMessage my-shangcheng">
                <div class="menu-hd MyShangcheng"><a href="../person/index.aspx" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
            </div>
            <div class="topMessage mini-cart">
                <div class="menu-hd"><a id="mc-menu-hd" href="ShopCart.aspx" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h"><%=new Maticsoft.BLL.CartBll().GetRecordCount("UserId="+((Maticsoft.Model.Users)Session["user"]).Id) %></strong></a></div>
            </div>

        </ul>
    </div>

    <!--悬浮搜索框-->

    <div class="nav white">
        <div class="logo">
            <img src="/BookCovers/logo.png" />
        </div>
        <div class="logoBig">
            <li>
                <img src="/BookCovers/logo.png" /></li>
        </div>

        <div class="search-bar pr">
            <a name="index_none_header_sysc" href="javascript:;"></a>
            <form>
                <input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
                <input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
                <div id="sr" style="width: 524px; height: auto; position: absolute;"></div>
            </form>
        </div>
    </div>

    <div class="clear"></div>

    <!--购物车 -->
    <div class="concent">
        <div id="cartTable">
            <div class="cart-table-th">
                <div class="wp">
                    <div class="th th-chk">
                        <div id="J_SelectAll1" class="select-all J_SelectAll">
                        </div>
                    </div>
                    <div class="th th-item">
                        <div class="td-inner">商品信息</div>
                    </div>
                    <div class="th th-price">
                        <div class="td-inner">单价</div>
                    </div>
                    <div class="th th-amount">
                        <div class="td-inner">数量</div>
                    </div>
                    <div class="th th-sum">
                        <div class="td-inner">金额</div>
                    </div>
                    <div class="th th-op">
                        <div class="td-inner">操作</div>
                    </div>
                </div>
            </div>
            <div class="clear"></div>

            <tr class="item-list">
                <div class="bundle  bundle-last ">
                    <div class="bundle-hd">
                        <div class="bd-promos">
                            <div class="bd-has-promo">已享优惠:<span class="bd-has-promo-content"><%=cartList.Count>0?"省￥20.00":"" %></span>&nbsp;&nbsp;</div>
                            <div class="act-promo">
                                <a href="javascript:;" target="_blank">买得多，省得多<span class="gt">&gt;&gt;</span></a>
                            </div>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="bundle-main">
                        <input type="hidden" id="allcartId" value="" />

                        <%
                            if (cartList.Count <= 0)
                            {
                        %>

                        <h1>购物车里什么都没有</h1>

                        <%
                            }
                            else
                            {
                                foreach (var item in cartList)
                                {
                        %>
                        <ul class="item-content clearfix">
                            <li class="td td-chk">
                                <div class="cart-checkbox ">
                                    <input class="check" name="items[]" type="checkbox">
                                    <input type="hidden" name="checkedcartid" value="<%=item.Id %>" />
                                    <label for="J_CheckBox_170037950254"></label>
                                </div>
                            </li>
                            <li class="td td-item">
                                <div class="item-pic">
                                    <a href="javascript:;" target="_blank" data-title="<%=bbll.GetModel(item.BookId).Title %>" class="J_MakePoint" data-point="tbcart.8.12">
                                        <img src="/BookCovers/<%=bbll.GetModel(item.BookId).ISBN %>.jpg" class="itempic J_ItemImg"></a>
                                </div>
                                <div class="item-info">
                                    <div class="item-basic-info">
                                        <a href="#" target="_blank" title="<%=bbll.GetModel(item.BookId).Title %>" class="item-title J_MakePoint" data-point="tbcart.8.11"><%=bbll.GetModel(item.BookId).Title %></a>
                                    </div>
                                </div>
                            </li>
                            <li class="td td-info">
                                <div class="item-props item-props-can">
                                </div>
                            </li>
                            <li class="td td-price">
                                <div class="item-price price-promo-promo">
                                    <div class="price-content">
                                        <div class="price-line">
                                            <em class="price-original"><%=(bbll.GetModel(item.BookId).UnitPrice+20).ToString("f2") %></em>
                                        </div>
                                        <div class="price-line">
                                            <em class="J_Price price-now" name="" tabindex="0"><%=(bbll.GetModel(item.BookId).UnitPrice).ToString("f2") %></em>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="td td-amount">
                                <div class="amount-wrapper ">
                                    <div class="item-amount ">
                                        <div class="sl">
                                            <input type="hidden" name="price" value="<%=bbll.GetModel(item.BookId).UnitPrice.ToString("f2") %>" />
                                            <input class="min am-btn" name="jian" type="button" value="-" />
                                            <input class="text_box" name="shuliang" type="text" value="<%=item.Count %>" style="width: 30px;" />
                                            <input class="add am-btn" name="jia" type="button" value="+" />
                                            <input type="hidden" name="cartid" value="<%=item.Id %>" />
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="td td-sum">
                                <div class="td-inner">
                                    <em tabindex="0" name="totalprice" class="J_ItemSum number"><%=(bbll.GetModel(item.BookId).UnitPrice*item.Count).ToString("f2") %></em>

                                </div>
                            </li>
                            <li class="td td-op">
                                <div class="td-inner">
                                    <input type="hidden" name="delcartid" value="<%=item.Id %>" />
                                    <a href="javascript:;" name="delete" data-point-url="#" class="delete">删除</a>
                                </div>
                            </li>
                        </ul>
                        <%
                                }
                            } %>
                    </div>
                </div>
            </tr>
            <div class="clear"></div>
            <script type="text/javascript">
                $(function () {
                    //数量变动-
                    $("input[name='jian']").click(function () {
                        var upd = $(this);
                        //获取该商品是否被选中
                        var check = upd.parent().parent().parent().parent().parent().children().eq(0).children().children().first();
                        if (upd.next().val() > 1) {

                            upd.next().val(upd.next().val() - 1);
                            var cartid = upd.next().next().next().val();
                            $.post('../Ashx/updateCart.ashx', { count: upd.next().val(), cartid: cartid }, function (aa) {
                                //数量
                                var sl = upd.next().val();
                                //价格
                                var price = upd.prev().val();
                                //总价
                                upd.parent().parent().parent().parent().next().children().children().text(sl * price + ".00");
                                //如果该商品被选中
                                if (check.prop("checked")) {
                                    //总价
                                    $('#J_Total').text(parseInt($('#J_Total').text()) - parseInt(price) + ".00");
                                }
                            });
                        }

                    });
                    //数量变动+
                    $("input[name='jia']").click(function () {
                        var upd = $(this);
                        upd.prev().val(parseInt(upd.prev().val()) + 1);
                        var check = upd.parent().parent().parent().parent().parent().children().eq(0).children().children().first();
                        $.post('../Ashx/updateCart.ashx', { count: upd.prev().val(), cartid: upd.next().val() }, function (bb) {
                            //数量
                            var sl = upd.prev().val();
                            //价格
                            var price = upd.prev().prev().prev().val();
                            //总价
                            upd.parent().parent().parent().parent().next().children().children().text(sl * price + ".00");

                            if (check.prop("checked")) {
                                //总价
                                $('#J_Total').text(parseInt($('#J_Total').text()) + parseInt(price) + ".00");
                            }
                        });
                    });
                    //右下角统计数量与价钱,复选框勾选与取消
                    $('li .cart-checkbox input[class="check"]').click(function () {
                        var check = $(this);
                        var totalprice = parseInt(check.parent().parent().next().next().next().next().next().children().children().text());

                        if (check.prop("checked")) {
                            $('#J_SelectedItemsCount').text(parseInt($('#J_SelectedItemsCount').text()) + 1);
                            //给隐藏域赋值
                            $('#allcartId').val($('#allcartId').val() + "," + check.next().val());
                            //总价
                            $('#J_Total').text(parseInt($('#J_Total').text()) + totalprice + ".00");
                        } else {
                            $('#J_SelectedItemsCount').text(parseInt($('#J_SelectedItemsCount').text()) - 1);
                            //修改隐藏域的值
                            $('#allcartId').val($('#allcartId').val().replace("," + check.next().val(), ""));
                            //总价
                            $('#J_Total').text(parseInt($('#J_Total').text()) - totalprice + ".00");
                        }
                    });

                    //全选复选框勾选与取消
                    $('#J_SelectAllCbx2').click(function () {
                        if ($('#J_SelectAllCbx2').prop("checked")) {
                            $("li .cart-checkbox input[class='check']").attr("checked", "checked");
                            var totalprice = 0;
                            $('em[name="totalprice"]').each(function () {
                                totalprice += parseInt($(this).text());
                            });
                            //总价
                            $('#J_Total').text(totalprice + ".00");
                            //计件
                            $('#J_SelectedItemsCount').text($('em[name="totalprice"]').length);
                            //修改隐藏域的值
                            $("li .cart-checkbox input[class='check']").each(function () {
                                $('#allcartId').val($('#allcartId').val() + "," + $(this).next().val());
                            });

                        } else {
                            $("li .cart-checkbox input").removeAttr("checked");
                            //总价
                            $('#J_Total').text("0.00");
                            //计件
                            $('#J_SelectedItemsCount').text(0);

                            $('#allcartId').val("");
                        }
                    });

                    //删除按钮点击事件
                    $('a[name="delete"]').click(function () {
                        var self = $(this);
                        var cartid = self.prev().val();
                        $.post('../Ashx/DeleteCart.ashx', { cartId: cartid }, function (cc) {
                            if (cc == "ok") {
                                window.location.reload();
                            } else {
                                swal("提  示", "服务器繁忙，请稍后重试", "error");
                            }
                        });
                    });


                    //结算按钮点击事件
                    $('#pay').click(function () {
                        var count = parseInt($('#J_SelectedItemsCount').text());
                        if (count > 0) {
                            $.post('../Ashx/AddOrder.ashx', { cartIds: $('#allcartId').val() }, function (dd) {
                                window.location.href = "../Page/PayPage.aspx?orderId=" + dd;
                            });
                        } else {
                            $('#pay').css("disabled", "disabled");
                        }
                    });
                });
            </script>

        </div>
        <div class="clear"></div>

        <div class="float-bar-wrapper">
            <div id="J_SelectAll2" class="select-all J_SelectAll">
                <div class="cart-checkbox">
                    <input class="check-all check" id="J_SelectAllCbx2" name="select-all" value="true" type="checkbox">
                    <label for="J_SelectAllCbx2"></label>
                </div>
                <span>全选</span>
            </div>
            <div class="float-bar-right">
                <div class="amount-sum">
                    <span class="txt">已选商品</span>
                    <em id="J_SelectedItemsCount">0</em><span class="txt">件</span>
                    <div class="arrow-box">
                        <span class="selected-items-arrow"></span>
                        <span class="arrow"></span>
                    </div>
                </div>
                <div class="price-sum">
                    <span class="txt">合计:</span>
                    <strong class="price">¥<em id="J_Total">0.00</em></strong>
                </div>
                <div class="btn-area" id="pay">
                    <a href="javascript:;" id="J_Go" class="submit-btn submit-btn-disabled" aria-label="请注意如果没有选择宝贝，将无法结算">
                        <span>结&nbsp;算</span></a>
                </div>
            </div>

        </div>

        <div class="footer">
            <div class="footer-hd">
                <p>
                    <a href="javascript:;">西西弗</a>
                    <b>|</b>
                    <a href="Index.aspx">商城首页</a>
                    <b>|</b>
                    <a href="javascript:;">支付宝</a>
                    <b>|</b>
                    <a href="javascript:;">物流</a>
                </p>
            </div>
            <div class="footer-bd">
                <p>
                    <a href="javascript:;">关于西西弗</a>
                    <a href="javascript:;">合作伙伴</a>
                    <a href="javascript:;">联系我们</a>
                    <a href="/Common/Map.aspx">网站地图</a>
                    <em>© 2015-2025 Hengwang.com 版权所有</em>
                </p>
            </div>
        </div>

    </div>

    <!--操作页面-->

    <div class="theme-popover-mask"></div>

    <div class="theme-popover">
        <div class="theme-span"></div>
        <div class="theme-poptit h-title">
            <a href="javascript:;" title="关闭" class="close">×</a>
        </div>
        <div class="theme-popbod dform">
            <form class="theme-signin" name="loginform" action="" method="post">

                <div class="theme-signin-left">

                    <li class="theme-options">
                        <div class="cart-title">颜色：</div>
                        <ul>
                            <li class="sku-line selected">12#川南玛瑙<i></i></li>
                            <li class="sku-line">10#蜜橘色+17#樱花粉<i></i></li>
                        </ul>
                    </li>
                    <li class="theme-options">
                        <div class="cart-title">包装：</div>
                        <ul>
                            <li class="sku-line selected">包装：裸装<i></i></li>
                            <li class="sku-line">两支手袋装（送彩带）<i></i></li>
                        </ul>
                    </li>
                    <div class="theme-options">
                        <div class="cart-title number">数量</div>
                        <dd>
                            <input class="min am-btn am-btn-default" name="" type="button" value="-" />
                            <input class="text_box" name="" type="text" value="1" style="width: 30px;" />
                            <input class="add am-btn am-btn-default" name="" type="button" value="+" />
                            <span class="tb-hidden">库存<span class="stock">1000</span>件</span>
                        </dd>

                    </div>
                    <div class="clear"></div>
                    <div class="btn-op">
                        <div class="btn am-btn am-btn-warning">确认</div>
                        <div class="btn close am-btn am-btn-warning">取消</div>
                    </div>

                </div>
                <div class="theme-signin-right">
                    <div class="img-info">
                        <img src="../images/kouhong.jpg_80x80.jpg" />
                    </div>
                    <div class="text-info">
                        <span class="J_Price price-now">¥39.00</span>
                        <span id="Stock" class="tb-hidden">库存<span class="stock">1000</span>件</span>
                    </div>
                </div>

            </form>
        </div>
    </div>
    <!--引导 -->
    <div class="navCir">
        <li><a href="home.html"><i class="am-icon-home "></i>首页</a></li>
        <li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
        <li class="active"><a href="shopcart.html"><i class="am-icon-shopping-basket"></i>购物车</a></li>
        <li><a href="../person/index.html"><i class="am-icon-user"></i>我的</a></li>
    </div>
</body>

</html>
