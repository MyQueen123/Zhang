<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="safety.aspx.cs" Inherits="NET55.Sisyphus.Web.Home.person.safety" %>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>安全设置</title>

		<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="../css/personal.css" rel="stylesheet" type="text/css">
		<link href="../css/infstyle.css" rel="stylesheet" type="text/css">
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
								<li><img src="../images/logobig.png" /></li>
							</div>

							<div class="search-bar pr">
								<a name="index_none_header_sysc" href="#"></a>
								<form>
									<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
									<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
                                    <div id="sr" style="width: 524px; height: auto;position:absolute;"></div>
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

					<!--标题 -->
					<div class="user-safety">
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">账户安全</strong> / <small>Set&nbsp;up&nbsp;Safety</small></div>
						</div>
						<hr/>

						<!--头像 -->
						<div class="user-infoPic">

							<div class="filePic">
								<img class="am-circle am-img-thumbnail" src="../images/getAvatar.do.jpg" alt="" />
							</div>

							<p class="am-form-help">头像</p>

							<div class="info-m">
								<div><b>用户名：<i><%=u.Name %></i></b></div>
								<div class="u-level">
									<span class="rank r2">
							             <s class="vip1"></s><a class="classes" href="#">铜牌会员</a>
						            </span>
								</div>
								<div class="u-safety">
									<a href="safety.html">
									 账户安全
									<span class="u-profile"><i class="bc_ee0000" style="width: 60px;" width="0">60分</i></span>
									</a>
								</div>
							</div>
						</div>

						<div class="check">
							<ul>
								<li>
									<i class="i-safety-lock"></i>
									<div class="m-left">
										<div class="fore1">登录密码</div>
										<div class="fore2"><small>为保证您购物安全，建议您定期更改密码以保护账户安全。</small></div>
									</div>
									<div class="fore3">
										<a href="password.aspx">
											<div class="am-btn am-btn-secondary">修改</div>
										</a>
									</div>
								</li>

								<li>
									<i class="i-safety-iphone"></i>
									<div class="m-left">
										<div class="fore1">手机验证</div>
										<div class="fore2"><small>您验证的手机：<%=u.Phone.Substring(0,3) %>******** 若已丢失或停用，请立即更换</small></div>
									</div>
									<div class="fore3">
										<a href="bindphone.aspx">
											<div class="am-btn am-btn-secondary">换绑</div>
										</a>
									</div>
								</li>
								<li>
									<i class="i-safety-mail"></i>
									<div class="m-left">
										<div class="fore1">邮箱验证</div>
										<div class="fore2"><small>您验证的邮箱：<%=u.Mail.Length>0?u.Mail.Substring(0,3):"" %>*****.com 可用于快速找回登录密码</small></div>
									</div>
									<div class="fore3">
										<a href="email.aspx">
											<div class="am-btn am-btn-secondary">换绑</div>
										</a>
									</div>
								</li>
							</ul>
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