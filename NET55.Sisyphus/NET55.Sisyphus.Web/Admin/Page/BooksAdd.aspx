<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BooksAdd.aspx.cs" Inherits="Book_city.Admin.Page.BooksAdd" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>新增书籍信息 </title>
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
    <script src="../assets/js/echarts.min.js"></script>
     <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/amazeui.min.js"></script>
    <script src="../assets/js/dijs.js"></script>
    <script src="../assets/js/exits.js"></script>
       <script>
           $(function () {
               $('button').click(function () {
                   if ($('#form').validator('isFormValid')) {
                       var formData = new FormData($('#form')[0]);
                       $.ajax({
                           type: "post",
                           data: formData,
                           url: "/Admin/Ashx/BooksAdd.ashx",
                           cache: false,
                           processData: false,
                           contentType: false,
                           success: function (msg) {
                                   if (msg=="ok") {
                                       window.location.href = "/Admin/Page/BookManager.aspx";
                                   }
                           }
                       });
                   }
               });
           });
    </script>
</head>

<body data-type="index">


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
                            <img src="../assets/img/user01.png"></span>
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
                新增书籍管理
            </div>
            <ol class="am-breadcrumb">
                <li><a href="javascript:;" class="am-icon-home">首页</a></li>
                <li><a href="CommentManager.aspx">新增书籍</a></li>
            </ol>

            <div class="tpl-block ">

                <div class="am-g tpl-amazeui-form">

                    <div class="am-u-sm-12 am-u-md-9">
                        <form class="am-form am-form-horizontal" method="post" data-am-validator id="form" enctype="multipart/form-data">
                            <fieldset>
                                <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">书籍名称 / Title</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" name="Title" id="Title" placeholder="书籍名称 / Title" required />
                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <label for="user-phone" class="am-u-sm-3 am-form-label">书籍类型 / <span class="tpl-form-line-small-title">Categories</span></label>
                                    <div class="am-u-sm-9">
                                        <select data-am-selected="{searchBox: 1}" id="Categories" name="Categories" >
                                            <%foreach (var item in CategoriesList)
                                              {
                                            %>
                                            <option value="<%=item.Id %>"><%=item.Name %></option>
                                            <%
                                          } %>
                                        </select>
                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <label for="user-email" class="am-u-sm-3 am-form-label">作者 / Author</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" id="Author" name="Author" placeholder="作者 / Author" required />
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="user-phone" class="am-u-sm-3 am-form-label">书籍类型 / <span class="tpl-form-line-small-title">PublisherId</span></label>
                                    <div class="am-u-sm-9">
                                        <select data-am-selected="{searchBox: 1}" id="PublisherId" name="PublisherId" >
                                            <%foreach (var item in PublishersList)
                                              {
                                            %>
                                            <option value="<%=item.Id %>"><%=item.Name %></option>
                                            <%
                                          } %>
                                        </select>
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="user-QQ" class="am-u-sm-3 am-form-label">词数 / WordsCount</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" id="WordsCount" name="WordsCount" placeholder="词数 / WordsCount" required />
                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <label for="user-weibo" class="am-u-sm-3 am-form-label">价格 / UnitPrice</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" id="UnitPrice" name="UnitPrice" placeholder="价格 / UnitPrice" required />
                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <label for="user-weibo" class="am-u-sm-3 am-form-label">作者介绍 / AurhorDescription</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" id="AurhorDescription" name="AurhorDescription" placeholder="作者介绍 / AurhorDescription" required />
                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <label for="user-weibo" class="am-u-sm-3 am-form-label">评论 / EditorComment</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" id="EditorComment" name="EditorComment" placeholder="评论 / EditorComment" required />
                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <label for="user-weibo" class="am-u-sm-3 am-form-label">章节描述 / TOC</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" id="TOC" name="TOC" placeholder="评论 / EditorComment" required />
                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <label for="user-intro" class="am-u-sm-3 am-form-label">书籍简介 /  ContentDescription</label>
                                    <div class="am-u-sm-9">
                                        <textarea class="" rows="5" id="ContentDescription" name="ContentDescription" placeholder="书籍简介 / ContentDescription" required></textarea>
                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <label for="user-weibo" class="am-u-sm-3 am-form-label">封面图 <span class="tpl-form-line-small-title">Images</span></label>
                                    <div class="am-u-sm-9">
                                        <div class="am-form-group am-form-file">
                                            <button type="button" class="am-btn am-btn-danger am-btn-sm">
                                                <i class="am-icon-cloud-upload"></i>添加封面图片</button>
                                            <input id="file" name="file" type="file" multiple required />
                                        </div>

                                    </div>
                                </div>

                                <div class="am-form-group">
                                    <div class="am-u-sm-9 am-u-sm-push-3">
                                        <button type="button" class="am-btn am-btn-primary">确定添加</button>
                                    </div>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>

        </div>

    </div>
   <script src="../assets/js/iscroll.js"></script>
    <script src="../assets/js/app.js"></script>
 
</body>

</html>
