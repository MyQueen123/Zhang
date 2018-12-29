<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditBook.aspx.cs" Inherits="Book_City.Admin.Page.EditBook" %>

<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>修改图书信息</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="../assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="../assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="../assets/css/admin.css">
    <link rel="stylesheet" href="../assets/css/app.css">
    <link href="../assets/css/dicss.css" rel="stylesheet" />
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/amazeui.min.js"></script>
    <script src="../assets/js/app.js"></script>
    <script src="../assets/js/dijs.js"></script>
    <script src="../assets/js/exits.js"></script>
    <script>
        $(function () {
            $('#YCWZ').click(function () {
                $('#EAuthor').toggle();
            });

            $('#Author').click(function () {
                $('#Introduction').toggle();
            });

            $('#TOC').click(function () {
                $('#Div2').toggle();
            });

            $('#Content').click(function () {
                $('#ContentDescription').toggle();
            });

             
            if ($('#frm').validator('isFormValid')) {

                $("#upload").click(function () {
                    var formData = new FormData($('#frm')[0]);
                    $.ajax({
                        type: 'post',
                        url: "/Admin/Ashx/EditBookManager.ashx",
                        data: formData,
                        cache: false,
                        processData: false,
                        contentType: false,
                    }).success(function (data) {
                        window.location.href = "/Admin/Page/BookManager.aspx";
                    }).error(function () {
                        swal('编辑失败！');
                    });
                });

            }

        });

    </script>


</head>

<body data-type="generalComponents">


    <header class="am-topbar am-topbar-inverse admin-header">
        <div class="am-topbar-brand">
            <a href="javascript:;" class="tpl-logo">
                <img src="../assets/img/logo.png" alt="">
            </a>
        </div>
        <div class="am-icon-list tpl-header-nav-hover-ico am-fl am-margin-right">
        </div>

        <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

        <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

            <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list tpl-header-list">
                <li class="am-hide-sm-only"><a href="javascript:;" id="admin-fullscreen" class="tpl-header-list-link"><span class="am-icon-arrows-alt"></span><span class="admin-fullText">开启全屏</span></a></li>

                <li class="am-dropdown" data-am-dropdown data-am-dropdown-toggle>
                    <a class="am-dropdown-toggle tpl-header-list-link" href="javascript:;">
                        <span class="tpl-header-list-user-nick"><%=((Maticsoft.Model.UserInfo)Session["admin"]).UserName %></span><span class="tpl-header-list-user-ico">
                            <img src="/Admin/assets/img/user01.png"></span>
                    </a>
                    <ul class="am-dropdown-content">
                        <li><a href="javascript:;" id="exits"><span class="am-icon-power-off"></span>退出</a></li>
                    </ul>
                </li>
                <li><a href="javascript:;" class="tpl-header-list-link"><span class="am-icon-sign-out tpl-header-list-ico-out-size"></span></a></li>
            </ul>
        </div>
    </header>







    <div class="tpl-page-container tpl-page-header-fixed">
        <div class="tpl-left-nav tpl-left-nav-hover">
            <div class="tpl-left-nav-title">
                管理列表
            </div>
            <div class="tpl-left-nav-list">
                <ul class="tpl-left-nav-menu">
                    <li class="tpl-left-nav-item">
                        <a href="Index.aspx" class="nav-link">
                            <i class="am-icon-user"></i>
                            <span>用户管理</span>
                        </a>
                    </li>

                    <li class="tpl-left-nav-item">
                        <a href="AdvertisingManager.aspx" class="nav-link tpl-left-nav-link-list">
                            <i class="am-icon-bullhorn"></i>
                            <span>广告管理</span>
                        </a>
                    </li>

                    <li class="tpl-left-nav-item">
                        <a href="OrderManager.aspx" class="nav-link tpl-left-nav-link-list">
                            <i class="am-icon-map"></i>
                            <span>订单管理</span>
                        </a>
                    </li>

                    <li class="tpl-left-nav-item">
                        <a href="SearchManager.aspx" class="nav-link tpl-left-nav-link-list">
                            <i class="am-icon-search"></i>
                            <span>搜索关键字管理</span>
                        </a>
                    </li>

                    <li class="tpl-left-nav-item">
                        <a href="Article_WordManager.aspx" class="nav-link tpl-left-nav-link-list">
                            <i class="am-icon-exclamation-triangle"></i>
                            <span>敏感/禁用词管理</span>
                        </a>
                    </li>

                    <li class="tpl-left-nav-item">
                        <a href="javascript:;" class="nav-link tpl-left-nav-link-list  active">
                            <i class="am-icon-book"></i>
                            <span>书籍管理</span>
                            <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                        </a>
                        <ul class="tpl-left-nav-sub-menu" style="display: block">
                            <li>
                                <a href="BookTypeManager.aspx">
                                    <i class="am-icon-angle-right"></i>
                                    <span>书籍类型管理</span>
                                </a>

                                <a href="BookManager.aspx">
                                    <i class="am-icon-angle-right"></i>
                                    <span>书籍管理</span>
                                </a>

                                <a href="CommentManager.aspx">
                                    <i class="am-icon-angle-right"></i>
                                    <span>评论列表</span>
                                </a>
                        </ul>
                    </li>

                </ul>
            </div>
        </div>



        <div class="tpl-content-wrapper">
            <div class="tpl-content-page-title">
                图书编辑
            </div>
            <ol class="am-breadcrumb">
                <li><a href="Index.aspx" class="am-icon-home">首页</a></li>
                <li><a href="BookManage.aspx">书籍管理</a></li>
                <li class="am-active">图书编辑</li>
            </ol>
            <div class="tpl-portlet-components">
                <div class="portlet-title">
                    <div class="caption font-green bold">
                        <span class="am-icon-code"></span>图书编辑
                    </div>

                </div>

                <div class="tpl-block">

                    <div class="am-g">
                        <div class="tpl-form-body tpl-form-line">
                            <form class="am-form tpl-form-line-form" id="frm" enctype="multipart/form-data" data-am-validator>
                                <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">标题 <span class="tpl-form-line-small-title">Title</span></label>
                                    <div class="am-u-sm-9">
                                        <input type="hidden" name="Bookid" value="<%=model.Id %>" />
                                        <input type="text" class="tpl-form-input" id="user-name" placeholder="请输入标题文字" name="Title" value="<%=model.Title.ToString() %>" minlength="2" maxlength="50" required />
                                        <small>请填写标题文字2-20字左右。</small>
                                    </div>
                                </div>


                                <div class="am-form-group">
                                    <label class="am-u-sm-3 am-form-label">作者 <span class="tpl-form-line-small-title">Author</span></label>
                                    <div class="am-u-sm-9">
                                        <input type="text" placeholder="输入作者名称" name="Author" value="<%=model.Author %>" minlength="2" required />
                                    </div>
                                </div>


                                <div class="am-form-group">
                                    <label class="am-u-sm-3 am-form-label">价格 <span class="tpl-form-line-small-title">Price</span></label>
                                    <div class="am-u-sm-9">
                                        <input type="tel" placeholder="输入图书价格" name="UnitPrice" value="<%=model.UnitPrice.ToString("f2") %>" required />
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label class="am-u-sm-3 am-form-label">字数 <span class="tpl-form-line-small-title">Words count</span></label>
                                    <div class="am-u-sm-9">
                                        <input type="tel" placeholder="输入图书字数" name="WordsCount" value="<%=model.WordsCount %>" required />
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="user-phone" class="am-u-sm-3 am-form-label">出版社<span class="tpl-form-line-small-title">Pabulish</span></label>
                                    <div class="am-u-sm-9">
                                        <select data-am-selected="{searchBox: 1}" name="PublisherId">
                                            <%foreach (var item in listPB)
                                              { %>
                                            <option value="<%=item.Id %>" <%=model.PublisherId==item.Id?"selected":"" %>><%=item.Name %></option>
                                            <%
                                            } %>
                                        </select>
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="user-phone" class="am-u-sm-3 am-form-label">图书类型<span class="tpl-form-line-small-title">Author</span></label>
                                    <div class="am-u-sm-9">
                                        <select data-am-selected="{searchBox: 1}" name="Categories">
                                            <%foreach (var item in list)
                                              {%>
                                            <option value="<%=item.Id %>" <%=model.CategoryId==item.Id?"selected":"" %>><%=item.Name %></option>
                                            <%
                                            } %>
                                        </select>
                                    </div>
                                </div>

                                <div class="am-form-group" id="Content">
                                    <label for="user-intro" class="am-u-sm-3 am-form-label">图书简介</label>
                                    <div class="am-u-sm-9">
                                        <div class="tpl-switch">
                                            <input type="checkbox" class="ios-switch bigswitch tpl-switch-btn" />
                                            <div class="tpl-switch-btn-view">
                                                <div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class="am-form-group" id="ContentDescription" style="display: none">
                                    <label for="user-intro" class="am-u-sm-3 am-form-label"></label>
                                    <div class="am-u-sm-9">
                                        <textarea class="" rows="10" id="Textarea2" placeholder="请输入图书简介" name="ContentDescription" required><%=model.ContentDescription%></textarea>
                                    </div>
                                </div>

                                <div class="am-form-group" id="YCWZ">
                                    <label for="user-intro" class="am-u-sm-3 am-form-label">编者的话</label>
                                    <div class="am-u-sm-9">
                                        <div class="tpl-switch">
                                            <input type="checkbox" class="ios-switch bigswitch tpl-switch-btn"  />
                                            <div class="tpl-switch-btn-view">
                                                <div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class="am-form-group" id="EAuthor" style="display: none">
                                    <label for="user-intro" class="am-u-sm-3 am-form-label"></label>
                                    <div class="am-u-sm-9">
                                        <textarea class="" rows="10" id="user-intro" placeholder="请输入编者的话" name="EditorComment" required><%=model.EditorComment %></textarea>
                                    </div>
                                </div>

                                <div class="am-form-group" id="Author">
                                    <label for="user-intro" class="am-u-sm-3 am-form-label">作者简介</label>
                                    <div class="am-u-sm-9">
                                        <div class="tpl-switch">
                                            <input type="checkbox" class="ios-switch bigswitch tpl-switch-btn" />
                                            <div class="tpl-switch-btn-view">
                                                <div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class="am-form-group" id="Introduction" style="display: none">
                                    <label for="user-intro" class="am-u-sm-3 am-form-label"></label>
                                    <div class="am-u-sm-9">
                                        <textarea class="" rows="10" id="Textarea1" placeholder="请输入作者简介" name="AurhorDescription" minlength="2" maxlength="50" required><%=model.AurhorDescription %></textarea>
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="user-weibo" class="am-u-sm-3 am-form-label">封面图 <span class="tpl-form-line-small-title">Images</span></label>
                                    <div class="am-u-sm-9">
                                        <div class="am-form-group am-form-file">
                                            <div class="tpl-form-file-img">
<%--                                                <img src="/BookCovers/<%=model.ISBN %>.jpg" alt="">--%>
                                                <input type="hidden" name="ISNB" value="<%=model.ISBN %>" />
                                            </div>
                                            <button type="button" class="am-btn am-btn-danger am-btn-sm">
                                                <i class="am-icon-cloud-upload"></i>修改封面图片</button>
                                            <input id="doc-form-file" type="file" name="file" multiple>
                                        </div>

                                    </div>
                                </div>

                                <div class="am-form-group" id="upload">
                                    <div class="am-u-sm-9 am-u-sm-push-3">
                                        <button type="button" class="am-btn am-btn-primary tpl-btn-bg-color-success ">提交</button>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>


            </div>

        </div>

    </div>


    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/amazeui.min.js"></script>
    <script src="assets/js/app.js"></script>
</body>

</html>
