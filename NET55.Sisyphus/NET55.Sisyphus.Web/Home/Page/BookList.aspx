<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookList.aspx.cs" Inherits="NET55.Sisyphus.Web.Home.Page.BookList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>全部图书</title>

    <link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
    <link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />

    <link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />

    <link href="../css/seastyle.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../basic/js/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="../js/script.js"></script>
    <script src="../js/jquery.validate.min.js"></script>
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
                <div class="menu-hd"><a href="#" target="_top" class="h">商城首页</a></div>
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
            <a name="index_none_header_sysc" href="#"></a>
            <form action="/Home/Page/SearchDetails.aspx">
                <input id="searchInput" name="zi" type="text" placeholder="搜索" autocomplete="off" required />
                <input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
                <div id="sr" style="width: 524px; height: auto;"></div>
            </form>
        </div>
    </div>

    <div class="clear"></div>
    <b class="line"></b>
    <div class="search">
        <div class="search-list">
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


            <div class="am-g am-g-fixed">
                <div class="am-u-sm-12 am-u-md-12">
                    <div class="theme-popover">

                        <ul class="select">

                            <div class="clear"></div>
                            <li class="select-list">
                                <dl id="select1">
                                    <dt class="am-badge am-round">图书类型</dt>

                                    <div class="dd-conent">
                                        <%if (string.IsNullOrEmpty(Request["typeId"]))
                                          { %>
                                        <dd class="select-all selected">
                                            <%}
                                          else
                                          {%>
                                            <dd>
                                                <%} %>

                                                <a href="?index=1">全部</a></dd>

                                            <%foreach (var type in typelist)
                                              {
                                                  if (Request["typeId"] != type.Id + "")
                                                  {
                                            %>
                                            <dd><a href="?typeId=<%=type.Id%>&index=1"><%=type.Name%></a></dd>
                                            <% 
                                                  }
                                                  else
                                                  {%>
                                            <dd class="selected"><a href="?typeId=<%=type.Id%>&index=1"><%=type.Name%></a></dd>
                                            <% }
                                              } %>
                                    </div>

                                </dl>
                            </li>


                        </ul>
                        <div class="clear"></div>
                    </div>
                    <div class="search-content">
                        <div class="sort">
                            <li class="first"><a title="综合">综合排序</a></li>
                            <li><a title="销量">销量排序</a></li>
                            <li><a title="价格">价格优先</a></li>
                        </div>
                        <div class="clear"></div>

                        <ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes" id="allbookul">

                            <%foreach (var item in bookslist)
                              {
                            %>
                            <li>
                                <a href="BookDetails_<%=item.Id %>.aspx">
                                    <div class="i-pic limit">
                                        <img style="width: 200px; height: 248px" src="/BookCovers/<%=item.ISBN %>.jpg" />
                                        <p class="title fl"><%=item.Title %></p>
                                        <p class="price fl">
                                            <b>¥</b>
                                            <strong><%=item.UnitPrice.ToString("f2") %></strong>
                                        </p>
                                        <p class="number fl">
                                            销量<span>1110</span>
                                        </p>
                                    </div>

                                </a>

                            </li>
                            <%
                              } %>
                        </ul>
                    </div>
                    <div class="search-side">

                        <div class="side-title">
                            经典搭配
							
                        </div>
                        <%
                            foreach (var bk in ramdomBooks)
                            {
                        %>
                        <li>
                            <div class="i-pic check">
                                <img style="width: 200px; height: 248px" src="/BookCovers/<%=bk.ISBN %>.jpg" />
                                <p class="title fl"><%=bk.Title %></p>
                                <p class="price fl">
                                    <b>¥</b>
                                    <strong><%=bk.UnitPrice.ToString("f2") %></strong>
                                </p>
                                <p class="number fl">
                                    销量<span>1110</span>
                                </p>
                            </div>
                        </li>
                        <%
                            } %>
                    </div>
                    <div class="clear"></div>
                    <!--分页 -->
                    <ul class="am-pagination am-pagination-right">
                        <%if (Request["typeId"] != null)
                          { %>
                        <%=Common.PageBarHelper.GetPagaBar(pageIndex,pageCount,Request["typeId"]) %>
                        <%}
                          else
                          { %>
                        <%=Common.PageBarHelper.GetPagaBar(pageIndex,pageCount) %>
                        <%} %>
                    </ul>

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

    </div>

    <!--引导 -->
    <div class="navCir">
        <li><a href="Index.aspx"><i class="am-icon-home "></i>首页</a></li>
        <li><a href="BookList.aspx"><i class="am-icon-list"></i>分类</a></li>
        <li><a href="ShopCart.aspx"><i class="am-icon-shopping-basket"></i>购物车</a></li>
        <li><a href="../person/index.aspx"><i class="am-icon-user"></i>我的</a></li>
    </div>

    <!--菜单 -->
    <div class="tip">
        <div id="sidebar">
            <div id="wrap">

                <div id="shopCart" class="item">
                    <a href="ShopCart.aspx">
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
                <a href="#" target="_blank" class="pl">
                    <div class="num">0</div>
                    <div class="text">优惠券</div>
                </a>
                <a href="#" target="_blank" class="pl">
                    <div class="num">0</div>
                    <div class="text">红包</div>
                </a>
                <a href="#" target="_blank" class="pl money">
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
    <script>
        window.jQuery || document.write('<script src="basic/js/jquery-1.9.min.js"><\/script>');
    </script>
    <script type="text/javascript" src="../basic/js/quick_links.js"></script>

    <div class="theme-popover-mask"></div>

</body>

</html>
