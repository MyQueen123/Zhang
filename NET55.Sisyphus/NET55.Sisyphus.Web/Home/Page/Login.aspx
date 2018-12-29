<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="NET55.Sisyphus.Web.Home.Page.Login" %>

<!DOCTYPE html>
<html>

<head lang="en">
    <meta charset="UTF-8">
    <title>登录</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="stylesheet" href="../AmazeUI-2.4.2/assets/css/amazeui.css" />
    <link href="../css/dlstyle.css" rel="stylesheet" type="text/css">
    <link href="../css/dicss.css" rel="stylesheet" />
    <script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="../AmazeUI-2.4.2/assets/js/jquery.validate.min.js"></script>
    <script src="../AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
    <script src="../js/dijs.js"></script>
    <script src="../js/gt.js"></script>
    <script>
        function picture() {
            //图片验证码
            var handlerEmbed = function (captchaObj) {
                $("#embed-submit").click(function (e) {

                });
                // 将验证码加到id为captcha的元素里，同时会有三个input的值：geetest_challenge, geetest_validate, geetest_seccode
                captchaObj.appendTo("#embed-captcha");
                captchaObj.onReady(function () {

                });
                captchaObj.onSuccess(function () {
                    $('#sub').removeAttr('disabled');
                });
            };
            $.ajax({
                // 获取id，challenge，success（是否启用failback）
                url: "/Home/Ashx/JiYan.ashx?t=" + (new Date()).getTime(), // 加随机数防止缓存
                type: "get",
                dataType: "json",
                success: function (data) {
                    // 使用initGeetest接口
                    // 参数1：配置参数
                    // 参数2：回调，回调的第一个参数验证码对象，之后可以使用它做appendTo之类的事件
                    initGeetest({
                        gt: data.gt,
                        challenge: data.challenge,
                        width:'100%',
                        product: "embed", // 产品形式，包括：float，embed，popup。注意只对PC版验证码有效
                        offline: !data.success, // 表示用户后台检测极验服务器是否宕机，一般不需要关注
                        new_captcha: data.new_captcha
                        // 更多配置参数请参见：http://www.geetest.com/install/sections/idx-client-sdk.html#config
                    }, handlerEmbed);
                }
            });
        }
        $(function () {
            $(':submit').click(function () {
                if ($('#frmlogin').validator('isFormValid')) {
                    
                    $.post('/Home/Ashx/Login.ashx', $('#frmlogin').serialize(), function (msg) {
                        if (msg == "ok") {
                            window.location.href = "/Home/Page/Index.aspx";
                        }
                        else{
                            swal('提示', '用户名或密码错误，请重试', 'error');

                            $('#embed-captcha').children().remove();
                            picture();
                            $('#sub').attr('disabled','disabled');
                        }
                    });
                }
            });


            picture();

            $('#remember-me').change(function () {
                if ($('#remember-me').prop('checked')) {
                    $('#isremember').val("选中");
                } else {
                    $('#isremember').val("未选中");
                }
            });
           
        });
    </script>
</head>

<body>

    <div class="login-boxtitle">
        <a href="Index.aspx">
            <img alt="logo" src="/BookCovers/logo.png" /></a>
    </div>

    <div class="login-banner">
        <div class="login-main">
            <div class="login-banner-bg"><span></span>
                <img src="../images/big.png" /></div>
            <div class="login-box">

                <h3 class="title">登录商城</h3>

                <div class="clear"></div>

                <div class="login-form">
                    <form id="frmlogin"  data-am-validator>
                        <div class="user-name">
                            <label for="user"><i class="am-icon-user"></i></label>
                            <input type="text" name="loginID" id="user" placeholder="请输入手机号码" value="<%=Request.Cookies["username"]==null?"":Request.Cookies["username"].Value %>" minlength="11" maxlength="11" required />
                        </div>
                        <div class="user-pass">
                            <label for="password"><i class="am-icon-lock"></i></label>
                            <input type="password" name="pwd" id="password" placeholder="请输入密码"  value="<%=Request.Cookies["userpwd"]==null?"":Request.Cookies["userpwd"].Value %>" minlength="6" required />
                        </div>
                        <div id="embed-captcha"></div>
                        <input type="hidden" name="rem" id="isremember"/>
                    </form>
                </div>

                <div class="login-links">
                    <label for="remember-me">
                        <input id="remember-me"  type="checkbox" <%=Request.Cookies["userpwd"]==null?"":"checked" %> >记住密码</label>
                    <a href="../Page/Retrieve_Password.aspx" class="am-fr">忘记密码</a>
                    <a href="Register.aspx" class="zcnext am-fr am-btn-default">注册</a>
                    <br />
                </div>
                <div class="am-cf">
                    <input type="submit" name="" id="sub" disabled="disabled" value="登 录" class="am-btn am-btn-primary am-btn-sm">
                </div>
                <div class="partner">
                    <h3>合作账号</h3>
                    <div class="am-btn-group">
                        <li><a href="javascript:;"><i class="am-icon-qq am-icon-sm"></i><span>QQ登录</span></a></li>
                        <li><a href="javascript:;"><i class="am-icon-weibo am-icon-sm"></i><span>微博登录</span> </a></li>
                        <li><a href="javascript:;"><i class="am-icon-weixin am-icon-sm"></i><span>微信登录</span> </a></li>
                    </div>
                </div>

            </div>
        </div>
    </div>

    
    <div class="footer ">
        <div class="footer-hd ">
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
        <div class="footer-bd ">
            <p>
                <a href="javascript:;">关于西西弗</a>
                <a href="javascript:;">合作伙伴</a>
                <a href="javascript:;">联系我们</a>
                <a href="/Common/Map.aspx">网站地图</a>
                <em>© 2015-2025 Hengwang.com 版权所有</em>
            </p>
        </div>
    </div>
</body>

</html>
