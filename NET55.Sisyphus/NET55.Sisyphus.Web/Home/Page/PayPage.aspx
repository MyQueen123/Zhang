<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PayPage.aspx.cs" Inherits="NET55.Sisyphus.Web.Home.Page.PayPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>结算页面</title>

    <link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />

    <link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />
    <link href="../css/cartstyle.css" rel="stylesheet" type="text/css" />
    <link href="../css/dicss.css" rel="stylesheet" />
    <link href="../css/jsstyle.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery-1.7.2.min.js"></script>
    <script src="../js/jquery.validate.min.js"></script>
    <script src="../AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
    <script src="../js/Search.js"></script>
    <script type="text/javascript" src="../js/address.js"></script>
    <script src="../js/distpicker.data.js"></script>
    <script src="../js/distpicker.js"></script>
    <script src="../js/main.js"></script>
    <script src="../js/dijs.js"></script>
    <script>
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
        //选择地址
        $(function () {
            $('#chose_address li').click(function () {
                $('#judgement').val($(this).prev().val());
                $(this).eq($(this).index()).addClass("user-addresslist defaultAddr").siblings().removeClass("user-addresslist");
                //寄送到
                $('#toaddress').text($(this).children().children().next().children().next().text());
                //收货人
                $('#people').text($(this).children().children().children().first().text());
                //收货人电话
                $('#people_phone').text($(this).children().children().children().first().next().text());
            });

            $('#J_Go').click(function () {
                var addressId = $('#judgement').val();
                if (addressId == "") {
                    swal("提  示", "请选择地址", "error");

                } else {
                    var ordersId = $('#myorders').val();
                    window.location.href = "../Ashx/PayPage.ashx?orderId=" + ordersId + "&dizhiId=" + addressId;
                   
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
                <div class="menu-hd"><a id="mc-menu-hd" href="ShopCart.aspx" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h"><%=Session["user"]==null?0:cb.GetRecordCount("UserId="+((Maticsoft.Model.Users)Session["user"]).Id) %></strong></a></div>
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
    <input type="hidden" id="judgement" name="ischose" />
    <div class="clear"></div>
    <div class="concent">
        <!--地址 -->
        <div class="paycont">
            <div class="address">
                <h3>确认收货地址 </h3>
                <div class="control">
                    <div class="tc-btn createAddr theme-login am-btn am-btn-danger">使用新地址</div>
                </div>
                <div class="clear"></div>
                <ul id="chose_address">
                    <%
                        if (uadList.Count <= 0)
                        {
                    %>
                    <h1>请先填写收货地址</h1>
                    <%
                        }
                        else
                        {
                            foreach (var item in uadList)
                            {
                              
                    %>
                    <div class="per-border"></div>
                    <input type="hidden" name="name" value="<%=item.Id %>" />
                    <li class="user-addresslist">

                        <div class="address-left">
                            <div class="user DefaultAddr">

                                <span class="buy-address-detail">

                                    <span class="buy-user"><%=item.Name %> </span>
                                    <span class="buy-phone"><%=item.Phone %></span>

                                </span>
                            </div>
                            <div class="default-address DefaultAddr">
                                <span class="buy-line-title buy-line-title-type">收货地址：</span>
                                <span class="buy--address-detail">
                                    <%=item.Address %>
                                </span>
                            </div>
                        </div>
                        <div class="address-right">
                            <a href="../person/address.aspx">
                                <span class="am-icon-angle-right am-icon-lg"></span></a>
                        </div>
                        <div class="clear"></div>

                        <div class="new-addr-btn">
                            <a href="javascript:void(0);" onclick="delClick(<%=item.Id %>)">删除</a>
                        </div>

                    </li>
                    <%
                            }
                        } %>
                </ul>

                <div class="clear"></div>
            </div>
            <!--物流 -->
            <div class="logistics">
                <h3>选择物流方式</h3>
                <ul class="op_express_delivery_hot">
                    <li data-value="yuantong" class="OP_LOG_BTN"><i class="c-gap-right" style="background-position: 0px -468px"></i>圆通<span></span></li>
                    <li data-value="shentong" class="OP_LOG_BTN  "><i class="c-gap-right" style="background-position: 0px -1008px"></i>申通<span></span></li>
                    <li data-value="yunda" class="OP_LOG_BTN  "><i class="c-gap-right" style="background-position: 0px -576px"></i>韵达<span></span></li>
                    <li data-value="zhongtong" class="OP_LOG_BTN op_express_delivery_hot_last "><i class="c-gap-right" style="background-position: 0px -324px"></i>中通<span></span></li>
                    <li data-value="shunfeng" class="OP_LOG_BTN  op_express_delivery_hot_bottom selected"><i class="c-gap-right" style="background-position: 0px -180px"></i>顺丰<span></span></li>
                </ul>
            </div>
            <div class="clear"></div>

            <!--支付方式-->
            <div class="logistics">
                <h3>选择支付方式</h3>
                <ul class="pay-list">
                    <li class="pay card">
                        <img src="../images/wangyin.jpg" />银联<span></span></li>
                    <li class="pay qq">
                        <img src="../images/weizhifu.jpg" />微信<span></span></li>
                    <li class="pay taobao selected">
                        <img src="../images/zhifubao.jpg" />支付宝<span></span></li>
                </ul>
            </div>
            <div class="clear"></div>

            <!--订单 -->
            <div class="concent">
                <div id="payTable">
                    <h3>确认订单信息</h3>
                    <div class="cart-table-th">
                        <div class="wp">

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
                            <div class="th th-oplist">
                                <div class="td-inner">配送方式</div>
                            </div>

                        </div>
                    </div>
                    <div class="clear"></div>
                    <%foreach (var item in oblist)
                      {
                    %>
                    <tr class="item-list">
                        <div class="bundle  bundle-last">

                            <div class="bundle-main">
                                <ul class="item-content clearfix">
                                    <div class="pay-phone">
                                        <li class="td td-item">
                                            <div class="item-pic">
                                                <a href="javascript:;" class="J_MakePoint">
                                                    <img src="/BookCovers/<%=bbll.GetModel(item.BookID).ISBN %>.jpg" class="itempic J_ItemImg"></a>
                                            </div>
                                            <div class="item-info">
                                                <div class="item-basic-info">
                                                    <a href="javascript:;" class="item-title J_MakePoint" data-point="tbcart.8.11"><%=bbll.GetModel(item.BookID).Title %></a>
                                                </div>
                                            </div>
                                        </li>

                                        <li class="td td-price">
                                            <div class="item-price price-promo-promo">
                                                <div class="price-content">
                                                    <em class="J_Price price-now"><%=bbll.GetModel(item.BookID).UnitPrice.ToString("f2") %></em>
                                                </div>
                                            </div>
                                        </li>
                                    </div>
                                    <li class="td td-amount">
                                        <div class="amount-wrapper ">
                                            <div class="item-amount ">
                                                <span class="phone-title">购买数量</span>
                                                <div class="sl">
                                                    <%=item.Quantity %>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="td td-sum">
                                        <div class="td-inner">
                                            <em tabindex="0" class="J_ItemSum number"><%=(bbll.GetModel(item.BookID).UnitPrice*item.Quantity).ToString("f2") %></em>
                                        </div>
                                    </li>
                                    <li class="td td-oplist">
                                        <div class="td-inner">
                                            <span class="phone-title">配送方式</span>
                                            <div class="pay-logis">
                                                包邮
                                            </div>
                                        </div>
                                    </li>

                                </ul>
                                <div class="clear"></div>

                            </div>
                    </tr>
                    <%
                      } %>
                </div>
                <div class="clear"></div>
                <div class="pay-total">
                    <!--留言-->
                    <div class="order-extra">
                        <div class="order-user-info">
                            <div id="holyshit257" class="memo">
                                <label>买家留言：</label>
                                <input type="text" title="选填,对本次交易的说明（建议填写已经和卖家达成一致的说明）" placeholder="选填,建议填写和卖家达成一致的说明" class="memo-input J_MakePoint c2c-text-default memo-close">
                                <div class="msg hidden J-msg">
                                    <p class="error">最多输入500个字符</p>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="clear"></div>
                </div>
                <!--含运费小计 -->
                <div class="buy-point-discharge ">
                    <p class="price g_price ">
                        合计（含运费） <span>¥</span><em class="pay-sum" id="pay-sum">244.00</em>
                    </p>
                </div>

                <!--信息 -->
                <div class="order-go clearfix">
                    <div class="pay-confirm clearfix">
                        <div class="box">
                            <div tabindex="0" id="holyshit267" class="realPay">
                                <em class="t">实付款：</em>
                                <span class="price g_price ">
                                    <span>¥</span> <em class="style-large-bold-red " id="J_ActualFee">0.00</em>
                                </span>
                            </div>

                            <div id="holyshit268" class="pay-address">

                                <p class="buy-footer-address">
                                    <span class="buy-line-title buy-line-title-type">寄送至：</span>
                                    <span class="buy--address-detail">
                                        <span id="toaddress"></span>

                                    </span>
                                </p>
                                <p class="buy-footer-address">
                                    <span class="buy-line-title">收货人：</span>
                                    <span class="buy-address-detail">
                                        <span class="buy-user" id="people">姓名</span>
                                        <span class="buy-phone" id="people_phone">电话</span>
                                    </span>
                                </p>
                            </div>
                        </div>

                        <div id="holyshit269" class="submitOrder">
                            <div class="go-btn-wrap">
                                <input type="hidden" id="myorders" name="orderId" value="<%=orderId %>" />
                                <a id="J_Go" href="javascript:;" class="btn-go" tabindex="0" title="点击此按钮，提交订单">提交订单</a>
                                
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>

            <div class="clear"></div>
        </div>
    </div>
    <div class="footer">
        <div class="footer-hd">
            <p>
                <a href="javascript:;">恒望科技</a>
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
                <a href="javascript:;">关于恒望</a>
                <a href="javascript:;">合作伙伴</a>
                <a href="javascript:;">联系我们</a>
                <a href="/Common/Map.aspx">网站地图</a>
                <em>© 2015-2025 Hengwang.com 版权所有</em>
            </p>
        </div>
    </div>
    </div>
			<div class="theme-popover-mask"></div>
    <div class="theme-popover" id="address_Add">

        <!--标题 -->
        <div class="am-cf am-padding">
            <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add address</small></div>
        </div>
        <hr />

        <div class="am-u-md-12">
            <form  class="am-form am-form-horizontal" id="frm" data-am-validator>

                <div class="am-form-group">
                    <label for="user-name" class="am-form-label">收货人</label>
                    <div class="am-form-content">
                        <input type="text" id="user-name" placeholder="收货人" required />
                    </div>
                </div>

                <div class="am-form-group">
                    <label for="user-phone" class="am-form-label">手机号码</label>
                    <div class="am-form-content">
                        <input type="text" id="doc-vld-528" class="js-pattern-mobile" minlength="11" placeholder="手机号必填" required />
                    </div>
                </div>

                <div class="am-form-group">
                    <label for="user-phone" class="am-form-label">所在地</label>
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

                <div class="am-form-group theme-poptit">
                    <div class="am-u-sm-9 am-u-sm-push-3">
                        <div class="am-btn am-btn-danger" id="Add_address">保存</div>
                        <div class="am-btn am-btn-danger close">取消</div>
                    </div>
                </div>
            </form>
        </div>

    </div>

    <div class="clear"></div>
    <script>
        $(function () {
            var relprice = $('div[class="price-content"]').children();
            var allPirce = 0;
            relprice.each(function () {
                allPirce += parseInt(relprice.text());
            });

            $('#J_ActualFee').text(allPirce + ".00");
            $('#pay-sum').text(allPirce + ".00");
            //添加收货地址

            $('#Add_address').click(function () {
                    var uname = $('#user-name').val();
                    var uphone = $('#doc-vld-528').val();
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
                
            });

        });
    </script>
</body>
<
</html>
