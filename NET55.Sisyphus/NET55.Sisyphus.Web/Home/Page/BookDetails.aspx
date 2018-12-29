<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookDetails.aspx.cs" Inherits="NET55.Sisyphus.Web.Home.Page.BookDetails" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>商品详情</title>

    <link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
    <link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
    <link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />
    <link type="text/css" href="../css/optstyle.css" rel="stylesheet" />
    <link type="text/css" href="../css/style.css" rel="stylesheet" />

    <script type="text/javascript" src="../basic/js/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="../basic/js/quick_links.js"></script>

    <script type="text/javascript" src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>
    <script type="text/javascript" src="../js/jquery.imagezoom.min.js"></script>
    <script type="text/javascript" src="../js/jquery.flexslider.js"></script>
    <script type="text/javascript" src="../js/list.js"></script>
    <script src="../ckeditor/ckeditor.js"></script>
    <link href="../css/dicss.css" rel="stylesheet" />
    <script src="../js/dijs.js"></script>
    <script src="../js/Search.js"></script>
    <script>

        //将时间戳转换为日期
        function formatDate(NewDtime) {
            var dt = new Date(parseInt(NewDtime.slice(6, 19)));
            var year = dt.getFullYear();
            var month = dt.getMonth() + 1;
            var date = dt.getDate();
            var hour = dt.getHours();
            var minute = dt.getMinutes();
            var second = dt.getSeconds();
            return year + "-" + month + "-" + date + " " + getzf(hour) + ":" + getzf(minute) + ":" + getzf(second);
        }

        //补0操作
        function getzf(num) {
            if (parseInt(num) < 10) {
                num = '0' + num;
            }
            return num;
        }
        //加载所有评论
        function LoadComment() {
            $('#commentul').empty();

            $.post('/Home/Ashx/LoadComment.ashx', { bookid: $('#BookId').val() }, function (data) {
                $.each(data, function (i, v) {
                    $('<li class="am-comment"><!-- 评论容器 --><a href=""><img class="am-comment-avatar" src="../images/hwbn40x40.jpg" /><!-- 评论者头像 --></a><div class="am-comment-main"><!-- 评论内容容器 --><header class="am-comment-hd"><!--<h3 class="am-comment-title">评论标题</h3>--><div class="am-comment-meta"><!-- 评论元数据 --><a href="#link-to-user" class="am-comment-author">h***n (匿名)</a><!-- 评论者 -->评论于<time datetime="">' + formatDate(v.CreateDateTime) + '</time></div></header><div class="am-comment-bd"><div class="tb-rev-item " data-id="258040417670"><div class="J_TbcRate_ReviewContent tb-tbcr-content ">' + v.Msg + '</div></div></div><!-- 评论内容 --></div></li>').appendTo($('#commentul'));
                });
            }, 'json');
        }

        $(function () {
            //富文本
            CKEDITOR.replace('content',
             {
                 extraPlugins: 'bbcode',
                 removePlugins: 'bidi,button,dialogadvtab,div,filebrowser,flash,format,forms,horizontalrule,iframe,indent,justify,liststyle,pagebreak,showborders,stylescombo,table,tabletools,templates',
                 toolbar:
                 [
                     ['Source', '-', 'Save', 'NewPage', '-', 'Undo', 'Redo'],
                     ['Find', 'Replace', '-', 'SelectAll', 'RemoveFormat'],
                     ['Link', 'Unlink', 'Image'],
                     '/',
                     ['FontSize', 'Bold', 'Italic', 'Underline'],
                     ['NumberedList', 'BulletedList', '-', 'Blockquote'],
                     ['TextColor', '-', 'Smiley', 'SpecialChar', '-', 'Maximize']
                 ],
                 smiley_images:
                 [
                     'regular_smile.gif', 'sad_smile.gif', 'wink_smile.gif', 'teeth_smile.gif', 'tounge_smile.gif',
                     'embaressed_smile.gif', 'omg_smile.gif', 'whatchutalkingabout_smile.gif', 'angel_smile.gif', 'shades_smile.gif',
                     'cry_smile.gif', 'kiss.gif'
                 ],
                 smiley_descriptions:
                 [
                     'smiley', 'sad', 'wink', 'laugh', 'cheeky', 'blush', 'surprise',
                     'indecision', 'angel', 'cool', 'crying', 'kiss'
                 ]
             });
            //评论
            $('#ping').click(function () {
                var oEditor = CKEDITOR.instances.content;
                var desc = oEditor.getData();
                if (desc.length > 0) {
                    $.post('/Home/Ashx/AddComment.ashx', { content: desc, bookid: $('#BookId').val() }, function (msg) {
                        if (msg == "ok") {
                            swal("提 示", "评论成功", "success");
                            LoadComment();
                            oEditor.setData();
                        }
                        else if (msg == "no") {
                            swal("提 示", "内容包含敏感词，不允发表！！！", "error");
                            oEditor.setData();
                        }
                        else if (msg == "error") {
                            swal("提 示", "系统繁忙，请稍后重试", "error");
                            oEditor.setData();
                        }
                    });
                }
                else {
                    $('#error').text('亲，请先填写评论哟').show();
                }
            });
            //加载评论
            LoadComment();

            //加入购物车
            $('#LikBasket').click(function () {
                $.post('../Ashx/CartLogin.ashx', {}, function (msg) {
                    if (msg == "ok") {
                        //已经登录
                        $.post('../Ashx/AddCart.ashx', { bookid: $('#BookId').val(), count: $('#text_box').val() }, function (cart) {
                            swal("提 示", "添加购物车成功", "success");
                        });
                    } else {
                        //没有登录
                        $('#my-prompt').modal({
                            relatedTarget: this,
                            onConfirm: function (e) {
                                if (e.data[0].length > 0 && e.data[1].length > 0) {
                                    $.post('../Ashx/CartLoginJudgment.ashx', { uid: e.data[0], password: e.data[1] }, function (mess) {
                                        if (mess == "ok") {
                                            swal("提 示", "登录成功，请重新点击加入购物车", "success");
                                        } else {
                                            swal("提 示", "用户名或密码错误", "error");
                                            $('#usename').val("");
                                            $('#usepwd').val("");
                                        }
                                    });
                                } else {
                                    swal("提示", "用户名或密码不能为空", "error");
                                    $('#usename').val("");
                                    $('#usepwd').val("");
                                }
                            },
                            onCancel: function (e) {

                            }
                        });
                    }
                });
            });

            //数量框数量判断
            $('#text_box').blur(function () {
                if (!/^[0-9]+$/.test($(this).val())) {
                    $(this).val(1);
                }
                var kucun = $('#kucun').text();
                if (parseInt($('#text_box').val()) > parseInt(kucun)) {
                    $('#text_box').val(kucun);
                }
            });
            //右侧购物车按钮点击事件
            $('#shopCart').click(function () {
                $.post('../Ashx/CartLogin.ashx', {}, function (msg) {
                    if (msg == "ok") {
                        //已经登录
                        window.location.href = "./ShopCart.aspx";
                    } else {
                        //没有登录
                        $('#my-prompt').modal({
                            relatedTarget: this,
                            onConfirm: function (e) {
                                if (e.data[0].length > 0 && e.data[1].length > 0) {
                                    $.post('../Ashx/CartLoginJudgment.ashx', { uid: e.data[0], password: e.data[1] }, function (mess) {
                                        if (mess == "ok") {
                                            window.location.href = "./ShopCart.aspx";
                                        } else {
                                            swal("提 示", "用户名或密码错误", "error");
                                            $('#usename').val("");
                                            $('#usepwd').val("");
                                        }
                                    });
                                } else {
                                    swal("提示", "用户名或密码不能为空", "error");
                                    $('#usename').val("");
                                    $('#usepwd').val("");
                                }
                            },
                            onCancel: function (e) {

                            }
                        });
                    }
                });
            });
            //立即购买
            $('#LikBuy').click(function () {
                $.post('../Ashx/CartLogin.ashx', {}, function (msg) {
                    if (msg == "ok") {
                        $.post('../Ashx/BuyNow.ashx', { bookId: $('#BookId').val(), count: $('#text_box').val() }, function (order) {
                            window.location.href = "../Page/PayPage.aspx?orderId=" + order;

                        });
                    } else {
                        //没有登录
                        $('#my-prompt').modal({
                            relatedTarget: this,
                            onConfirm: function (e) {
                                if (e.data[0].length > 0 && e.data[1].length > 0) {
                                    $.post('../Ashx/CartLoginJudgment.ashx', { uid: e.data[0], password: e.data[1] }, function (mess) {
                                        if (mess == "ok") {
                                            $.post('../Ashx/BuyNow.ashx', { bookId: $('#BookId').val(), count: $('#text_box').val() }, function (order) {
                                                window.location.href = "../Page/PayPage.aspx?orderId=" + order;
                                            });
                                        } else {
                                            swal("提 示", "用户名或密码错误", "error");
                                            $('#usename').val("");
                                            $('#usepwd').val("");
                                        }
                                    });
                                } else {
                                    swal("提示", "用户名或密码不能为空", "error");
                                    $('#usename').val("");
                                    $('#usepwd').val("");
                                }
                            },
                            onCancel: function (e) {

                            }
                        });
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
                <div class="menu-hd"><a id="mc-menu-hd" href="ShopCart.aspx" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
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
                <div id="sr" style="width: 524px; height: auto;"></div>
            </form>
        </div>
    </div>

    <div class="clear"></div>
    <b class="line"></b>
    <div class="listMain">

        <!--分类-->
        <div class="nav-table">
            <div class="long-title"><span class="all-goods">热门分类</span></div>
            <div class="nav-cont">
                <ul>
                    <li class="index"><a href="Index.aspx">首页</a></li>
                    <li class="qc"><a href="javascript:;">闪购</a></li>
                    <li class="qc"><a href="BookList.aspx">全部分类</a></li>
                    <li class="qc"><a href="javascript:;">团购</a></li>
                    <li class="qc last"><a href="javascript:;">大包装</a></li>
                </ul>

            </div>
        </div>
        <ol class="am-breadcrumb am-breadcrumb-slash">
            <li><a href="Index.aspx">首页</a></li>
            <li><a href="BookList.aspx">分类</a></li>
            <li class="am-active">内容</li>
        </ol>
        <script type="text/javascript">
            $(function () { });
            $(window).load(function () {
                $('.flexslider').flexslider({
                    animation: "slide",
                    start: function (slider) {
                        $('body').removeClass('loading');
                    }
                });
            });
        </script>
        <div class="scoll">
            <section class="slider">
                <div class="flexslider">
                    <ul class="slides">
                        <li>
                            <img src="../images/01.jpg" title="pic" />
                        </li>
                        <li>
                            <img src="../images/02.jpg" />
                        </li>
                        <li>
                            <img src="../images/03.jpg" />
                        </li>
                    </ul>
                </div>
            </section>
        </div>

        <!--放大镜-->

        <div class="item-inform">
            <div class="clearfixLeft" id="clearcontent">

                <div class="box">
                    <script type="text/javascript">
                        $(document).ready(function () {
                            $(".jqzoom").imagezoom();
                            $("#thumblist li a").click(function () {
                                $(this).parents("li").addClass("tb-selected").siblings().removeClass("tb-selected");
                                $(".jqzoom").attr('src', $(this).find("img").attr("mid"));
                                $(".jqzoom").attr('rel', $(this).find("img").attr("big"));
                            });
                        });
                    </script>

                    <div class="tb-booth tb-pic tb-s310">
                        <a href="javascript:;">
                            <img src="/BookCovers/<%=books.ISBN %>.jpg" alt="细节展示放大镜特效" /></a>
                    </div>

                </div>

                <div class="clear"></div>
            </div>

            <div class="clearfixRight">

                <!--规格属性-->
                <!--名称-->
                <div class="tb-detail-hd">
                    <h1><%=books.Title %>
                    </h1>
                </div>
                <div class="tb-detail-list">
                    <!--价格-->
                    <div class="tb-detail-price">
                        <li class="price iteminfo_price">
                            <dt>促销价</dt>
                            <dd><em>¥</em><b class="sys_item_price"><%=books.UnitPrice.ToString("f2") %></b>  </dd>
                        </li>
                        <li class="price iteminfo_mktprice">
                            <dt>原价</dt>
                            <dd><em>¥</em><b class="sys_item_mktprice"><%=(books.UnitPrice+20).ToString("f2") %></b></dd>
                        </li>
                        <div class="clear"></div>
                    </div>


                    <!--销量-->
                    <ul class="tm-ind-panel">
                        <li class="tm-ind-item tm-ind-sellCount canClick">
                            <div class="tm-indcon"><span class="tm-label">月销量</span><span class="tm-count">1015</span></div>
                        </li>
                        <li class="tm-ind-item tm-ind-sumCount canClick">
                            <div class="tm-indcon"><span class="tm-label">累计销量</span><span class="tm-count">6015</span></div>
                        </li>
                        <li class="tm-ind-item tm-ind-reviewCount canClick tm-line3">
                            <div class="tm-indcon"><span class="tm-label">累计评价</span><span class="tm-count">640</span></div>
                        </li>
                    </ul>
                    <div class="clear"></div>

                    <!--各种规格-->
                    <dl class="iteminfo_parameter sys_item_specpara">
                        <dt class="theme-login">
                            <div class="cart-title">可选规格<span class="am-icon-angle-right"></span></div>
                        </dt>
                        <dd>
                            <!--操作页面-->

                            <div class="theme-popover-mask"></div>

                            <div class="theme-popover">
                                <div class="theme-span"></div>
                                <div class="theme-poptit">
                                    <a href="javascript:;" title="关闭" class="close">×</a>
                                </div>
                                <div class="theme-popbod dform">
                                    <form class="theme-signin" name="loginform" action="" method="post">

                                        <div class="theme-signin-left">

                                            <div class="theme-options">
                                                <div class="cart-title number">数量</div>
                                                <dd>
                                                    <input id="min" class="am-btn am-btn-default" name="" type="button" value="-" />
                                                    <input id="text_box" name="" type="text" value="1" style="width: 30px;" />
                                                    <input id="add" class="am-btn am-btn-default" name="" type="button" value="+" />
                                                    <span id="Stock" class="tb-hidden">库存<span class="stock" id="kucun">1000</span>件</span>
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
                                                <img src="../images/songzi.jpg" />
                                            </div>
                                            <div class="text-info">
                                                <span class="J_Price price-now">¥39.00</span>
                                                <span id="Span1" class="tb-hidden">库存<span class="stock">1000</span>件</span>
                                            </div>
                                        </div>

                                    </form>
                                </div>
                            </div>

                        </dd>
                    </dl>
                    <div class="clear"></div>
                    <!--活动	-->
                    <div class="shopPromotion gold">
                        
                        <div class="clear"></div>
                        <div class="coupon">
                            <dt class="tb-metatit">优惠券</dt>
                            <div class="gold-list">
                                <ul>
                                    <li>125减5</li>
                                    <li>198减10</li>
                                    <li>298减20</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="pay">
                    <div class="pay-opt">
                        <a href="Index.aspx"><span class="am-icon-home am-icon-fw">首页</span></a>
                        <a><span class="am-icon-heart am-icon-fw">收藏</span></a>

                    </div>
                    <li>
                        <div class="clearfix tb-btn tb-btn-buy theme-login">
                            <a id="LikBuy" title="点此按钮到下一步确认购买信息" href="javascript:;">立即购买</a>
                        </div>
                    </li>
                    <li>
                        <div class="clearfix tb-btn tb-btn-basket theme-login">
                            <a id="LikBasket" title="加入购物车" href="javascript:;"><i></i>加入购物车</a>
                        </div>
                    </li>
                </div>

            </div>

            <div class="clear"></div>

        </div>



        <!-- introduce-->

        <div class="introduce">
            <div class="browse">
                <div class="mc">
                    <ul>
                        <div class="mt">
                            <h2>看了又看</h2>
                        </div>
                        <%for (int i = 0; i < booksList.Count; i++)
                          {
                              if (i == 0)
                              {%>
                        <li class="first">
                            <%}
                              else
                              {%>
                            <li>
                                <%}%>
                                <div class="p-img">
                                    <a href="?id=<%=booksList[i].Id %>">
                                        <img class="" src="/BookCovers/<%=booksList[i].ISBN %>.jpg">
                                    </a>
                                </div>
                                <div class="p-name">
                                    <a href="#"><%=booksList[i].Title %>
                                    </a>
                                </div>
                                <div class="p-price"><strong>￥<%=booksList[i].UnitPrice.ToString("f2") %></strong></div>
                            </li>
                            <%  } %>
                    </ul>
                </div>
            </div>
            <div class="introduceMain">
                <div class="am-tabs" data-am-tabs>
                    <ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
                        <li class="am-active">
                            <a href="#">

                                <span class="index-needs-dt-txt">宝贝详情</span></a>

                        </li>

                        <li>
                            <a href="#">

                                <span class="index-needs-dt-txt">全部评价</span></a>

                        </li>

                        <li>
                            <a href="#">

                                <span class="index-needs-dt-txt">猜你喜欢</span></a>
                        </li>
                    </ul>

                    <div class="am-tabs-bd">

                        <div class="am-tab-panel am-fade am-in am-active">
                            <div class="J_Brand">

                                <div class="attr-list-hd tm-clear">
                                    <h4>产品参数：</h4>
                                </div>
                                <div class="clear"></div>
                                <ul id="J_AttrUL">
                                    <li title="">产品名称：&nbsp;<%=books.Title.Length>18?books.Title.Substring(0,18):books.Title %></li>
                                    <li title="">是否是套装：&nbsp;否</li>
                                    <li title="">书名：&nbsp;<%=books.Title.Length>18?books.Title.Substring(0,18):books.Title %></li>
                                    <li title="">定价：&nbsp;<%=books.UnitPrice.ToString("f2") %></li>
                                    <li title="">出版社:&nbsp;<%=pbll.GetNameById(books.PublisherId) %></li>
                                    <li title="">出版时间:&nbsp;<%=books.PublishDate.ToString("yyyy-MM-dd") %></li>
                                    <li title="">库存量：&nbsp;500</li>
                                    <li title="">图书类型:&nbsp;<%=cbll.GetNameById(books.CategoryId) %></li>
                                    <li title="">作者:&nbsp;<%=books.Author %></li>
                                    <li title="">字数:&nbsp;<%=books.WordsCount %></li>
                                    <li title="">书名：&nbsp;<%=books.Title.Length>18?books.Title.Substring(0,18):books.Title %></li>
                                    <li title="">ISBN编号:&nbsp;<%=books.ISBN %></li>
                                </ul>
                                <div class="clear"></div>
                            </div>

                            <div class="details">
                                <div class="attr-list-hd after-market-hd">
                                    <h4>本书描述</h4>
                                </div>
                                <div class="twlistNews">
                                    <%=books.ContentDescription %>
                                </div>
                            </div>
                            <div class="clear"></div>
                        </div>

                        <div class="am-tab-panel am-fade">

                            <div class="actor-new">
                                <div class="rate">
                                    <strong>100<span>%</span></strong><br>
                                    <span>好评度</span>
                                </div>
                                <dl>
                                    <dt>买家印象</dt>
                                    <dd class="p-bfc">
                                        <q class="comm-tags"><span>价格实惠</span><em>(2177)</em></q>
                                        <q class="comm-tags"><span>包裹完整</span><em>(1860)</em></q>
                                        <q class="comm-tags"><span>内容精彩</span><em>(1823)</em></q>
                                        <q class="comm-tags"><span>商品不错</span><em>(1689)</em></q>
                                        <q class="comm-tags"><span>无异味</span><em>(1488)</em></q>
                                        <q class="comm-tags"><span>送货速度快</span><em>(1392)</em></q>
                                        <q class="comm-tags"><span>附送小玩意</span><em>(1119)</em></q>
                                        <q class="comm-tags"><span>特价买的</span><em>(865)</em></q>
                                        <q class="comm-tags"><span>内容充实</span><em>(831)</em></q>
                                    </dd>
                                </dl>
                            </div>
                            <div class="clear"></div>
                            <div class="tb-r-filter-bar">
                                <ul class=" tb-taglist am-avg-sm-4">
                                    <li class="tb-taglist-li tb-taglist-li-current">
                                        <div class="comment-info">
                                            <span>全部评价</span>
                                            <span class="tb-tbcr-num">(<%=count %>)</span>
                                        </div>
                                    </li>

                                </ul>
                            </div>
                            <div class="clear"></div>

                            <ul class="am-comments-list am-comments-list-flip" id="commentul">
                            </ul>
                            <div class="clear"></div>

                            <div>
                                <input type="hidden" id="BookId" value="<%=books.Id %>" />
                                <textarea id="content" name="content" rows="8"></textarea>
                                <div id="error" style="display: none" class="am-alert-danger"></div>
                                <input type="button" id="ping" name="tijiao" value="评   论" class="am-btn am-btn-warning am-btn-xl" />
                            </div>

                            <div class="clear"></div>


                            <div class="tb-reviewsft">
                                <div class="tb-rate-alert type-attention">购买前请查看该商品的 <a href="javascript:;" target="_blank">购物保障</a>，明确您的售后保障权益。</div>
                            </div>

                        </div>

                        <div class="am-tab-panel am-fade">
                            <div class="like">
                                <ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
                                    <%foreach (var item in guestLike)
                                      {
                                    %>
                                    <li>
                                        <div class="i-pic limit">
                                            <img src="/BookCovers/<%=item.ISBN %>.jpg" />
                                            <p>

                                                <span><%=item.Title %></span>
                                            </p>
                                            <p class="price fl">
                                                <b>¥</b>
                                                <strong><%=item.UnitPrice.ToString("f2") %></strong>
                                            </p>
                                        </div>
                                    </li>
                                    <%
                                      } %>
                                </ul>
                            </div>
                            <div class="clear"></div>
                        </div>

                    </div>

                </div>

                <div class="clear"></div>

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

        </div>
    </div>
    <!--菜单 -->
    <div class="tip">
        <div id="sidebar">
            <div id="wrap">

                <div id="shopCart" class="item">
                    <a href="javascript:;">
                        <span class="message"></span>
                    </a>
                    <p>
                        购物车
						
                    </p>
                    <p class="cart_num"><%=Session["user"]==null?0:cb.GetRecordCount("UserId="+((Maticsoft.Model.Users)Session["user"]).Id) %></p>
                </div>



                <div class="quick_toggle">
                    <li class="qtitem">
                        <a href="#"><span class="kfzx"></span></a>
                        <div class="mp_tooltip">客服中心<i class="icon_arrow_right_black"></i></div>
                    </li>
                    <!--二维码 -->
                    <li class="qtitem">
                        <a href="#none"><span class="mpbtn_qrcode"></span></a>
                        <div class="mp_qrcode" style="display: none;">
                            <img src="../images/weixin_code_145.png" /><i class="icon_arrow_white"></i>
                        </div>
                    </li>
                    <li class="qtitem">
                        <a href="#top" class="return_top"><span class="top"></span></a>
                    </li>
                </div>

                <!--回到顶部 -->
                <div id="quick_links_pop" class="quick_links_pop hide"></div>

            </div>

        </div>
        <div id="prof-content" class="nav-content">
            <div class="nav-con-close">
                <i class="am-icon-angle-right am-icon-fw"></i>
            </div>
            <div>
                我
				
            </div>
        </div>
        <div id="shopCart-content" class="nav-content">
            <div class="nav-con-close">
                <i class="am-icon-angle-right am-icon-fw"></i>
            </div>
            <div>
                购物车
				
            </div>
        </div>
        <div id="asset-content" class="nav-content">
            <div class="nav-con-close">
                <i class="am-icon-angle-right am-icon-fw"></i>
            </div>
            <div>
                资产
				
            </div>

            <div class="ia-head-list">
                <a href="javascript:;" target="_blank" class="pl">
                    <div class="num">0</div>
                    <div class="text">优惠券</div>
                </a>
                <a href="javascript:;" target="_blank" class="pl">
                    <div class="num">0</div>
                    <div class="text">红包</div>
                </a>
                <a href="javascript:;" target="_blank" class="pl money">
                    <div class="num">￥0</div>
                    <div class="text">余额</div>
                </a>
            </div>

        </div>
        <div id="foot-content" class="nav-content">
            <div class="nav-con-close">
                <i class="am-icon-angle-right am-icon-fw"></i>
            </div>
            <div>
                足迹
				
            </div>
        </div>
        <div id="brand-content" class="nav-content">
            <div class="nav-con-close">
                <i class="am-icon-angle-right am-icon-fw"></i>
            </div>
            <div>
                收藏
				
            </div>
        </div>
        <div id="broadcast-content" class="nav-content">
            <div class="nav-con-close">
                <i class="am-icon-angle-right am-icon-fw"></i>
            </div>
            <div>
                充值
            </div>
        </div>
    </div>
    <div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt">
        <div class="am-modal-dialog">
            <div class="am-modal-hd">西西弗</div>
            <div class="am-modal-bd">
                请登录
      <input type="text" id="usename" class="am-modal-prompt-input">
                <input type="password" id="usepwd" class="am-modal-prompt-input">
            </div>
            <div class="am-modal-footer">
                <span class="am-modal-btn" data-am-modal-cancel>取消</span>
                <span class="am-modal-btn" data-am-modal-confirm>登录</span>
            </div>
        </div>
    </div>

</body>

</html>
