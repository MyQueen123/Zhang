<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Retrieve_Password.aspx.cs" Inherits="NET55.Sisyphus.Web.Home.Page.Retrieve_Password" %>

<!DOCTYPE html>
<html>

<head lang="en">
    <meta charset="UTF-8">
    <title>找回密码</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="stylesheet" href="../AmazeUI-2.4.2/assets/css/amazeui.min.css" />
    <link href="../css/dlstyle.css" rel="stylesheet" type="text/css">
    <link href="../css/dicss.css" rel="stylesheet" />
    <script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="../AmazeUI-2.4.2/assets/js/jquery.validate.min.js"></script>
    <script src="../AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
    <script src="../js/dijs.js"></script>
    <script src="../js/gt.js"></script>
    <script>

        //递归函数获取按钮计时
        function sendCode() {
            $('#sendMobileCode').click(function () {
                var phone = $('#phone').val();
                var btn = $(this);
                if (/^1[3-9]\d{9}$/.test(phone)) {
                    $.post('../Ashx/sendPhoneVali.ashx?op=find', { phone: phone }, function (msg) {
                        if (msg == "nofind") {
                            swal("错  误", "未找到该用户名，请重试", "error");
                        } else
                        {
                            alert(msg);
                            btn.unbind('click');
                            var ti = 6;
                            var time = setInterval(function () {
                                ti--;
                                if (ti == 0) {
                                    $('#dyMobileButton').text('获取');
                                    clearInterval(time);
                                    sendCode();
                                }
                                else {
                                    $('#dyMobileButton').text(ti);
                                }
                            }, 1000)
                        }
                    });
                }
                else {
                    swal('提  示', '请输入正确的手机号码！！！', 'error');
                }
            });
        }
        $(function () {
            sendCode();

            //注册按钮点击事件
            $('#sub').click(function () {
                //表单验证成功
                if ($('#frm').validator('isFormValid')) {
                    $.post('/Home/Ashx/Retrieve_Pwd.ashx', { telphone: $('#phone').val(), pwd: $('#password1').val(), repwd: $('#password2').val(), yan: $('#code').val() }, function (msg) {
                        if (msg == "ok") {

                            //------------
                            swal({
                                title: "成功",
                                text: "需要直接登录吗？",
                                type: "success",
                                showCancelButton: true,
                                confirmButtonColor: "#DD6B55",
                                confirmButtonText: "直接登录",
                                cancelButtonText: "算了吧",
                                closeOnConfirm: false,
                                closeOnCancel: false
                            }
                            , function (isConfirm) {
                                if (isConfirm) {

                                    window.location.href = "/Home/Page/Index.aspx";
                                }
                                else {
                                    window.location.href = "./Login.aspx";
                                }
                            });
                            //--------------
                        }
                        else {
                            sweetAlert("出错了", msg, "error");
                        }
                    });

                }
            });

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
                        width: '100%',
                        product: "embed", // 产品形式，包括：float，embed，popup。注意只对PC版验证码有效
                        offline: !data.success, // 表示用户后台检测极验服务器是否宕机，一般不需要关注
                        new_captcha: data.new_captcha
                        // 更多配置参数请参见：http://www.geetest.com/install/sections/idx-client-sdk.html#config
                    }, handlerEmbed);
                }
            });
        });
    </script>
</head>

<body>

    <div class="login-boxtitle">
        <a href="Login.aspx">
            <img alt="" src="/BookCovers/logo.png" /></a>
    </div>

    <div class="res-banner">
        <div class="res-main">
            <div class="login-banner-bg">
                <span></span>
                <img src="../images/big.jpg" />
            </div>
            <div class="login-box">

                <div class="am-tabs" id="doc-my-tabs">
                    <ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">

                        <li><a href="">找回密码</a></li>
                    </ul>

                    <div class="am-tabs-bd">

                        <div class="am-tab-panel">
                            <form id="frm" method="post" data-am-validator>
                                <div class="user-phone">
                                    <label for="phone"><i class="am-icon-mobile-phone am-icon-md"></i></label>
                                    <input type="tel" name="telphone" id="phone" placeholder="请输入手机号" minlength="11" maxlength="11" required />
                                </div>
                                <div class="verification">
                                    <label for="code"><i class="am-icon-code-fork"></i></label>
                                    <input type="tel" name="" id="code" placeholder="请输入验证码" minlength="4" maxlength="4" required />
                                    <a class="btn" href="javascript:void(0);" id="sendMobileCode">
                                        <span id="dyMobileButton">获取</span></a>
                                </div>
                                <div class="user-pass">
                                    <label for="password"><i class="am-icon-lock"></i></label>
                                    <input type="password" name="pwd" id="password1" placeholder="新密码" minlength="6" maxlength="16" required />
                                </div>
                                <div class="user-pass">
                                    <label for="passwordRepeat"><i class="am-icon-lock"></i></label>
                                    <input type="password" name="repwd" id="password2" placeholder="确认密码" minlength="6" maxlength="16" required />
                                </div>
                                <div id="embed-captcha"></div>
                            </form>

                            <div class="am-cf">
                                <input type="submit" name="" disabled="disabled" id="sub" value="确认" class="am-btn am-btn-primary am-btn-sm am-fl">
                            </div>

                        </div>

                        <script>
                            $(function () {
                                $('#doc-my-tabs').tabs();
                            })
                        </script>

                    </div>
                </div>

            </div>
        </div>

        <div class="footer ">
            <div class="footer-hd ">
                <p>
                    <a href="javascript:; ">恒望科技</a>
                    <b>|</b>
                    <a href="Index.aspx">商城首页</a>
                    <b>|</b>
                    <a href="javascript:; ">支付宝</a>
                    <b>|</b>
                    <a href="javascript:;">物流</a>
                </p>
            </div>
            <div class="footer-bd ">
                <p>
                    <a href="javascript:; ">关于恒望</a>
                    <a href="javascript:; ">合作伙伴</a>
                    <a href="javascript:; ">联系我们</a>
                    <a href="/Common/Map.aspx">网站地图</a>
                    <em>© 2015-2025 Hengwang.com 版权所有</em>
                </p>
            </div>
        </div>
</body>
<script>
    
</script>
</html>
