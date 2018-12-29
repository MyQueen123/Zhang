<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Sisyphus.Home.Page.Index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>首页</title>

		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />

		<link href="../basic/css/demo.css" rel="stylesheet" type="text/css" />

		<link href="../css/hmstyle.css" rel="stylesheet" type="text/css"/>
		<link href="../css/skin.css" rel="stylesheet" type="text/css" />
        <link href="../css/dicss.css" rel="stylesheet" />
		<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="../AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
        <script src="../js/dijs.js"></script>
        <script src="../js/Search.js"></script>
        <style type="text/css">
            .tu {
                width: 160px;
                height: 160px;
            }
        </style>
        <script>
            $(function () {
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
		<div class="hmtop">
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
						<div class="menu-hd MyShangcheng"><a href="/Home/person/index.aspx" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
					</div>
					<div class="topMessage mini-cart">
						<div class="menu-hd"><a id="mc-menu-hd" href="/Home/Page/ShopCart.aspx" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h"><%=Session["user"]==null?0:cb.GetRecordCount("UserId="+((Maticsoft.Model.Users)Session["user"]).Id) %></strong></a></div>
					</div>
					
				</ul>
				</div>

				<!--悬浮搜索框-->

				<div class="nav white">
					<div class="logo"><img src="/BookCovers/logo.png" /></div>
					<div class="logoBig">
						<li><img src="/BookCovers/logo.png" /></li>
					</div>

					<div class="search-bar pr">
						<a name="index_none_header_sysc" href="javascript:;"></a>
						<form>
							<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
							<input id="ai-topsearch" class="submit am-btn" value="搜索"  type="submit">
                            <div id="sr" style="width: 524px; height: auto;position:absolute;"></div>
						</form>
					</div>
				</div>

				<div class="clear"></div>
			</div>
			<div class="banner">
                      <!--轮播 -->
						<div class="am-slider am-slider-default scoll" data-am-flexslider id="demo-slider-0">
							<ul class="am-slides">
								<li class="banner1"><a><img style="width:1349px;margin-left:-700px" src="/BookCovers/bg-1.jpg" /></a></li>
								<li class="banner2"><a><img style="width:1349px;height:430px;margin-left:-700px" src="/BookCovers/bg-2.jpg" /></a></li>
								<li class="banner3"><a><img style="width:1349px;margin-left:-700px" src="/BookCovers/bg-3.jpg" /></a></li>
								<li class="banner4"><a><img style="width:1349px;height:430px;margin-left:-700px" src="/BookCovers/bg-4.jpg" /></a></li>

							</ul>
						</div>
						<div class="clear"></div>	
			</div>
			<div class="shopNav">
				<div class="slideall">
					
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
		        				
						<!--侧边导航 -->
						<div id="nav" class="navfull">
							<div class="area clearfix">
								<div class="category-content" id="guide_2">
									
									<div class="category">
										<ul class="category-list" id="js_climit_li">
                                            <%  int i = 1; foreach (var item in typeList.Take(10))
                                                {

                                                    if (i == 10)
                                                    {%>
                                              <li class="appliance js_toggle relative last">
                                            <%    
                                                    }
                                                    else if (i == 1)
                                                    {
                                              %>
                                            	<li class="appliance js_toggle relative first">
                                                    <%}
                                                    else
                                                    { %>
                                                    <li class="appliance js_toggle relative ">
                                                    <%} %>
												<div class="category-info">
													<h3 class="category-name b-category-name"><i><img src="../images/cake.png"></i><a class="ml-22" title="<%=item.Name %>"><%=(item.Name).Length>10?(item.Name).Substring(0,8):item.Name %></a></h3>
													<em>&gt;</em></div>
												<div class="menu-item menu-in top">
													<div class="area-in">
														<div class="area-bg">
															<div class="menu-srot">
																<div class="sort-side">
                                                                    <dl class="dl-sort">
                                                                        <dt><span title="<%=item.Name %>"><%=item.Name %></span></dt>
                                                                     <%foreach (var ie in book.GetModelList("CategoryId=" + item.Id).Take(13))
                                                                       {
                                                                           %>
                                                                        <dd><a title="" href="/Home/Page/BookDetails_<%=ie.Id %>.aspx"><span><%=(ie.Title).Length>25?(ie.Title).Substring(0,20):ie.Title %></span></a></dd>
                                                                             
                                                                    <%}%>
																	</dl>
																</div>
																
															</div>
														</div>
													</div>
												</div>
											<b class="arrow"></b>	
											</li>

                                                 <% 
                                                                       i++;
                                                } %>
										
											
											
										
											
										</ul>
									</div>
								</div>

							</div>
						</div>
						
						
						<!--轮播-->
						
						<script type="text/javascript">
						    (function () {
						        $('.am-slider').flexslider();
						    });
						    $(document).ready(function () {
						        $("li").hover(function () {
						            $(".category-content .category-list li.first .menu-in").css("display", "none");
						            $(".category-content .category-list li.first").removeClass("hover");
						            $(this).addClass("hover");
						            $(this).children("div.menu-in").css("display", "block")
						        }, function () {
						            $(this).removeClass("hover")
						            $(this).children("div.menu-in").css("display", "none")
						        });
						    })
						</script>



					<!--小导航 -->
					<div class="am-g am-g-fixed smallnav">
						<div class="am-u-sm-3">
							<a href="sort.aspx"><img src="../images/navsmall.jpg" />
								<div class="title">商品分类</div>
							</a>
						</div>
						<div class="am-u-sm-3">
							<a href="javascript:;"><img src="../images/huismall.jpg" />
								<div class="title">大聚惠</div>
							</a>
						</div>
						<div class="am-u-sm-3">
							<a href="javascript:;"><img src="../images/mansmall.jpg" />
								<div class="title">个人中心</div>
							</a>
						</div>
						<div class="am-u-sm-3">
							<a href="javascript:;"><img src="../images/moneysmall.jpg" />
								<div class="title">投资理财</div>
							</a>
						</div>
					</div>


					
					<div class="clear"></div>
				</div>
				<script type="text/javascript">
				    if ($(window).width() < 640) {
				        function autoScroll(obj) {
				            $(obj).find("ul").animate({
				                marginTop: "-39px"
				            }, 500, function () {
				                $(this).css({
				                    marginTop: "0px"
				                }).find("li:first").appendTo(this);
				            })
				        }
				        $(function () {
				            setInterval('autoScroll(".demo")', 3000);
				        })
				    }
				</script>
			</div>
			<div class="shopMainbg">
				<div class="shopMain" id="shopmain">

					<!--今日推荐 -->

					<div class="am-g am-g-fixed recommendation">
						<div class="clock am-u-sm-3" ">
							<img src="../images/2018.png "></img>
							<p>今日<br>推荐</p>
						</div>
                        <%
                            int f = 0;
                            foreach (var item in tuijianlist)
                            {
                                f++;
                              %>
                        <div class="am-u-sm-4 am-u-lg-3 ">
							<div class="info ">
                                <%if (f == 1)
                                  { %>
                                <h3>简约的极致</h3>
								<h4>给心情一个偷懒的空间</h4>
                                <%}
                                  else if (f == 2)
                                  { %>
								 <h3>所有意外</h3>
								<h4>皆设计于意外之中</h4>
                                <%}
                                  else if (f == 3)
                                  { %>
                               <h3>留一本书</h3>
								<h4>给不眠的自己</h4>
                                <%} %>
							</div>
							<div class="recommendationMain one">
								<a href="BookDetails_<%=item.Id %>.aspx"><img style="height:135px;" src="/BookCovers/<%=item.ISBN %>.jpg"></img></a>
							</div>
						</div>		
                        <%
                            } %>
						

					</div>
					<div class="clear "></div>
					<!--热门活动 -->

					<div class="am-container activity ">
						<div class="shopTitle ">
							<h4>活动</h4>
							<h3>每期活动 优惠享不停 </h3>
							
						</div>
					  <div class="am-g am-g-fixed ">
						<%int r = 0;
        foreach (var item in hotList)
        {
            r++;
                                %>
                          <div class="am-u-sm-3 ">
						  <div class="icon-sale two "></div>
                              <%if (r == 1)
                                { %>	
							<h4>秒杀</h4>
                             <%}
                                else if (r == 2)
                                {%>
                             <h4>特惠</h4>
                           <% }
                                else if (r == 3)
                                { %>
                              <h4>团购</h4>
                             <%}
                                else if (r == 4)
                                { %>
                              <h4>超值</h4>
                              <%} %>
							<div class="activityMain ">
								<img style="width:250px;height:310px" src="/BookCovers/<%=item.ISBN %>.jpg"></img>
							</div>						
						</div>		
                          <%
        } %>

					  </div>
                   </div>
					<div class="clear "></div>


                    <div id="f1">
					<!--.Net板块-->
					
					<div class="am-container ">
						<div class="shopTitle ">
							<h4>.Net专区</h4>
							<h3>.net 是个舞台  c#是个演员 vs是个工具，c#这个演员利用vs这个工具在.net这个舞台尽情表演</h3>
							
						
						</div>
					</div>
					
					<div class="am-g am-g-fixed floodFour">
						<div class="am-u-sm-5 am-u-md-4 text-one list ">
							 <div class="word" style="grid-row-align:center"><br /><br /><br />
                                   <p class="am-monospace">购你所想 买你所爱 </p>

                                    </div>
							<a href="javascript:; ">
								<div class="outer-con ">
                                   
									<div class="title ">
									一大波最新书籍来啦！
									</div>
																	
								</div>
                                <br />
                                  <img src="/BookCovers/.net.png" />								
							</a>
							<div class="triangle-topright"></div>						
						</div>
						
							<div class="am-u-sm-7 am-u-md-4 text-two sug">
								<div class="outer-con ">
									<div class="title ">
										<%=(book.GetModelList("CategoryId=29")[0]).Title %>
									</div>									
									<div class="sub-title ">
										¥<%=(book.GetModelList("CategoryId=29")[0]).UnitPrice.ToString("f2") %>
									</div>
								</div>
								<a href="/Home/Page/BookDetails_<%=(book.GetModelList("CategoryId=29")[0]).Id %>.aspx"><img src="/BookCovers/<%=(book.GetModelList("CategoryId=29")[0]).ISBN %>.jpg" class="tu" /></a>
							</div>

							<div class="am-u-sm-7 am-u-md-4 text-two">
								<div class="outer-con ">
									<div class="title ">
										<%=(book.GetModelList("CategoryId=29")[1]).Title %>
									</div>
									<div class="sub-title ">
										¥<%=(book.GetModelList("CategoryId=29")[1]).UnitPrice.ToString("f2") %>
									</div>
								</div>
								<a href="/Home/Page/BookDetails_<%=(book.GetModelList("CategoryId=29")[1]).Id %>.aspx "><img src="/BookCovers/<%=(book.GetModelList("CategoryId=29")[1]).ISBN %>.jpg" class="tu" /></a>
							</div>


						<div class="am-u-sm-3 am-u-md-2 text-three big">
							<div class="outer-con ">
								<div class="title ">
								<%=(book.GetModelList("CategoryId=29")[2]).Title %>
								</div>
								<div class="sub-title ">
									¥<%=(book.GetModelList("CategoryId=29")[2]).UnitPrice.ToString("f2") %>
								</div>
							</div>
							<a href="/Home/Page/BookDetails_<%=(book.GetModelList("CategoryId=29")[2]).Id %>.aspx"><img src="/BookCovers/<%=(book.GetModelList("CategoryId=29")[2]).ISBN %>.jpg" style="height:230px"/></a>
						</div>

						<div class="am-u-sm-3 am-u-md-2 text-three sug">
							<div class="outer-con ">
								<div class="title ">
									<%=(book.GetModelList("CategoryId=29")[3]).Title %>
								</div>
								<div class="sub-title ">
										¥<%=(book.GetModelList("CategoryId=29")[3]).UnitPrice.ToString("f2") %>
								</div>
							</div>
							<a href="/Home/Page/BookDetails_<%=(book.GetModelList("CategoryId=29")[3]).Id %>.aspx "><img class="tu" src="/BookCovers/<%=(book.GetModelList("CategoryId=29")[3]).ISBN %>.jpg" /></a>
						</div>

						<div class="am-u-sm-3 am-u-md-2 text-three ">
							<div class="outer-con ">
								<div class="title ">
									<%=(book.GetModelList("CategoryId=29")[4]).Title %>
								</div>
								<div class="sub-title ">
									¥<%=(book.GetModelList("CategoryId=29")[4]).UnitPrice.ToString("f2") %>
								</div>
							</div>
							<a href="/Home/Page/BookDetails_<%=(book.GetModelList("CategoryId=29")[4]).Id %>.aspx"><img src="/BookCovers/<%=(book.GetModelList("CategoryId=29")[4]).ISBN %>.jpg"  class="tu"/></a>
						</div>

						<div class="am-u-sm-3 am-u-md-2 text-three last big ">
							<div class="outer-con ">
								<div class="title ">
									<%=(book.GetModelList("CategoryId=29")[5]).Title %>
								</div>
								<div class="sub-title ">
									¥<%=(book.GetModelList("CategoryId=29")[5]).UnitPrice.ToString("f2") %>
								</div>
							</div>
							<a href="/Home/Page/BookDetails_<%=(book.GetModelList("CategoryId=29")[5]).Id %>.aspx "><img src="/BookCovers/<%=(book.GetModelList("CategoryId=29")[4]).ISBN %>.jpg"  /></a>
						</div>

					</div>
                 <div class="clear "></div>  
                 </div>
                 
  
                    <div id="f2">
					<!--Java专区-->
					<div class="am-container ">
						<div class="shopTitle ">
							<h4>Java专区</h4>
							<h3>一门跨平台语言,快拿上钥匙打开它的奥秘</h3>
						
							
						</div>
					</div>
					<div class="am-g am-g-fixed floodThree ">
						<div class="am-u-sm-4 text-four list">
							<div class="word">
								<a class="outer" href="javascript:;"><span class="inner"><b class="text">最</b></span></a>
								<a class="outer" href="javascript:;"><span class="inner"><b class="text">完整</b></span></a>
								<a class="outer" href="javascript:;"><span class="inner"><b class="text">的</b></span></a>	
								<a class="outer" href="javascript:;"><span class="inner"><b class="text">Java</b></span></a>
								<a class="outer" href="javascript:;"><span class="inner"><b class="text">大全</b></span></a>
								<a class="outer" href="javascript:;"><span class="inner"><b class="text">集</b></span></a>									
							</div>
							<a href="javascript:; ">
								<img src="/BookCovers/java.png " />
								<div class="outer-con ">
									<div class="title ">
										来一场与Java的相遇
									</div>									
								</div>
							</a>
							<div class="triangle-topright"></div>	
						</div>
						<div class="am-u-sm-4 text-four">
							<a href="/Home/Page/BookDetails_<%=(book.GetModelList("CategoryId=31")[0]).Id %>.aspx">
								<img src="/BookCovers/<%=(book.GetModelList("CategoryId=31")[0]).ISBN %>.jpg" class="tu" />
								<div class="outer-con ">
									<div class="title ">
									<%=(book.GetModelList("CategoryId=31")[0]).Title %>
									</div>								
									<div class="sub-title ">
										¥<%=(book.GetModelList("CategoryId=31")[0]).UnitPrice.ToString("f2") %>
									</div>
								</div>
							</a>
						</div>
						<div class="am-u-sm-4 text-four sug">
							<a href="/Home/Page/BookDetails_<%=(book.GetModelList("CategoryId=31")[1]).Id %>.aspx">
								<img src="/BookCovers/<%=(book.GetModelList("CategoryId=31")[1]).ISBN %>.jpg" class="tu" />
								<div class="outer-con ">
									<div class="title ">
										<%=(book.GetModelList("CategoryId=31")[1]).Title %>
									</div>
									<div class="sub-title ">
										¥	<%=(book.GetModelList("CategoryId=31")[1]).UnitPrice.ToString("f2") %>
									</div>
								</div>
							</a>
						</div>
						
						<div class="am-u-sm-6 am-u-md-3 text-five big ">
							<a href="/Home/Page/BookDetails_<%=(book.GetModelList("CategoryId=31")[2]).Id %>.aspx ">
								<img src="/BookCovers/<%=(book.GetModelList("CategoryId=31")[2]).ISBN %>.jpg" />
								<div class="outer-con ">
									<div class="title " style="margin-top:-50px">
										<%=(book.GetModelList("CategoryId=31")[2]).Title %>
									</div>		
									<div class="sub-title ">
										¥<%=(book.GetModelList("CategoryId=31")[2]).UnitPrice.ToString("f2") %>
									</div>
								</div>
							</a>
						</div>						
						<div class="am-u-sm-6 am-u-md-3 text-five ">
							<a href="/Home/Page/BookDetails_<%=(book.GetModelList("CategoryId=31")[3]).Id %>.aspx ">
								<img src="/BookCovers/<%=(book.GetModelList("CategoryId=31")[3]).ISBN %>.jpg" class="tu" />
								<div class="outer-con ">
									<div class="title ">
										<%=(book.GetModelList("CategoryId=31")[3]).Title %>
									</div>	
									<div class="sub-title ">
										¥<%=(book.GetModelList("CategoryId=31")[3]).UnitPrice.ToString("f2") %>
									</div>
								</div>
							</a>
						</div>						
						<div class="am-u-sm-6 am-u-md-3 text-five sug">
							<a href="/Home/Page/BookDetails_<%=(book.GetModelList("CategoryId=31")[4]).Id %>.aspx ">
								<img src="/BookCovers/<%=(book.GetModelList("CategoryId=31")[4]).ISBN %>.jpg" class="tu" />
								<div class="outer-con ">
									<div class="title ">
										<%=(book.GetModelList("CategoryId=31")[4]).Title %>
									</div>
									<div class="sub-title ">
										¥<%=(book.GetModelList("CategoryId=31")[4]).UnitPrice.ToString("f2") %>
									</div>
								</div>
							</a>
						</div>
						<div class="am-u-sm-6 am-u-md-3 text-five big">
							<a href="/Home/Page/BookDetails_<%=(book.GetModelList("CategoryId=31")[5]).Id %>.aspx ">
								<img src="/BookCovers/<%=(book.GetModelList("CategoryId=31")[5]).ISBN %>.jpg" />
								<div class="outer-con ">
									<div class="title " style="margin-top:-50px">
									<%=(book.GetModelList("CategoryId=31")[5]).Title %>
									</div>			
									<div class="sub-title ">
										¥<%=(book.GetModelList("CategoryId=31")[5]).UnitPrice.ToString("f2") %>
									</div>
								</div>
							</a>
						</div>
						
					</div>

					<div class="clear "></div>
					</div>

        
                    <div id="f3">
					<!--甜点-->
					
					<div class="am-container ">
						<div class="shopTitle ">
							<h4>C C++ VC VC++语言专区</h4>
							<h3>见证程序的兴起,代码世界的支柱</h3>
							
						
						</div>
					</div>
					
					<div class="am-g am-g-fixed floodFour">
						<div class="am-u-sm-5 am-u-md-4 text-one list ">
							<div class="word">
                                <br /><br />
								if(Do you Love me?)<br /><br />
                                    return kiss; 	<br /><br />
                                （假如你喜欢我）						
							</div>
							<a href="javascript:; ">
								
                                  <img src="../images/Cyuyan.png " />								
							</a>
							<div class="triangle-topright"></div>						
						</div>
						
							<div class="am-u-sm-7 am-u-md-4 text-two sug">
								<div class="outer-con ">
									<div class="title ">
										<%=(book.GetModelList("CategoryId=15")[0]).Title.Length>20?(book.GetModelList("CategoryId=15")[0]).Title.Substring(0,20)+"...":(book.GetModelList("CategoryId=15")[0]).Title %>
									</div>									
									<div class="sub-title ">
										¥<%=(book.GetModelList("CategoryId=15")[0]).UnitPrice.ToString("f2") %>
									</div>
								</div>
								<a href="/Home/Page/BookDetails_<%=(book.GetModelList("CategoryId=15")[0]).Id %>.aspx "><img class="tu" src="/BookCovers/<%=(book.GetModelList("CategoryId=15")[0]).ISBN %>.jpg" /></a>
							</div>

							<div class="am-u-sm-7 am-u-md-4 text-two">
								<div class="outer-con ">
									<div class="title ">
									<%=(book.GetModelList("CategoryId=15")[1]).Title %>
									</div>
									<div class="sub-title ">
										¥<%=(book.GetModelList("CategoryId=15")[1]).UnitPrice.ToString("f2") %>
									</div>
								</div>
								<a href="/Home/Page/BookDetails_<%=(book.GetModelList("CategoryId=15")[1]).Id %>.aspx "><img src="/BookCovers/<%=(book.GetModelList("CategoryId=15")[1]).ISBN %>.jpg" class="tu" /></a>
							</div>


						<div class="am-u-sm-3 am-u-md-2 text-three big">
							<div class="outer-con ">
								<div class="title " style="margin-top:-50px">
									<%=(book.GetModelList("CategoryId=15")[2]).Title %>
								</div>
								<div class="sub-title ">
									¥<%=(book.GetModelList("CategoryId=15")[2]).UnitPrice.ToString("f2") %>
								</div>
							</div>
							<a href="/Home/Page/BookDetails_<%=(book.GetModelList("CategoryId=15")[2]).Id %>.aspx "><img src="/BookCovers/<%=(book.GetModelList("CategoryId=15")[2]).ISBN %>.jpg"/></a>
						</div>

						<div class="am-u-sm-3 am-u-md-2 text-three sug">
							<div class="outer-con ">
								<div class="title ">
									<%=(book.GetModelList("CategoryId=15")[3]).Title %>
								</div>
								<div class="sub-title ">
									¥<%=(book.GetModelList("CategoryId=15")[3]).UnitPrice.ToString("f2") %>
								</div>
							</div>
							<a href="/Home/Page/BookDetails_<%=(book.GetModelList("CategoryId=15")[3]).Id %>.aspx"><img src="/BookCovers/<%=(book.GetModelList("CategoryId=15")[3]).ISBN %>.jpg" class="tu" /></a>
						</div>

						<div class="am-u-sm-3 am-u-md-2 text-three ">
							<div class="outer-con ">
								<div class="title ">
									<%=(book.GetModelList("CategoryId=15")[4]).Title %>
								</div>
								<div class="sub-title ">
									¥<%=(book.GetModelList("CategoryId=15")[4]).UnitPrice.ToString("f2") %>
								</div>
							</div>
							<a href="/Home/Page/BookDetails_<%=(book.GetModelList("CategoryId=15")[4]).Id %>.aspx"><img src="/BookCovers/<%=(book.GetModelList("CategoryId=15")[4]).ISBN %>.jpg" class="tu" /></a>
						</div>

						<div class="am-u-sm-3 am-u-md-2 text-three last big ">
							<div class="outer-con ">
								<div class="title " style="margin-top:-50px">
									<%=(book.GetModelList("CategoryId=15")[5]).Title %>
								</div>
								<div class="sub-title ">
									¥<%=(book.GetModelList("CategoryId=15")[5]).UnitPrice.ToString("f2") %>
								</div>
							</div>
							<a href="/Home/Page/BookDetails_<%=(book.GetModelList("CategoryId=15")[5]).Id %>.aspx"><img src="/BookCovers/<%=(book.GetModelList("CategoryId=15")[3]).ISBN %>.jpg"  /></a>
						</div>

					</div>
                 <div class="clear "></div>                 
                 </div>
  

                    <div id="f4">
					<!--坚果-->
					<div class="am-container ">
						<div class="shopTitle ">
							<h4>网站开发专区</h4>
							<h3>每一个美轮美奂的界面都来自我们</h3>
							
						</div>
					</div>
					<div class="am-g am-g-fixed floodThree ">
						<div class="am-u-sm-4 text-four list">
							<div class="word">
															
							</div>
							<a href="javascript:; ">
								<img src="/BookCovers/Computer.png " />
								<div class="outer-con ">
									<div class="title ">
										长的还算对的起父老乡亲，只要你不胆小，保证吓不到你
									</div>									
								</div>
							</a>
							<div class="triangle-topright"></div>	
						</div>
						<div class="am-u-sm-4 text-four">
							<a href="/Home/Page/BookDetails_<%=(book.GetModelList("CategoryId=27")[0]).Id %>.aspx">
								<img src="/BookCovers/<%=(book.GetModelList("CategoryId=27")[0]).ISBN %>.jpg" class="tu" />
								<div class="outer-con ">
									<div class="title ">
										<%=(book.GetModelList("CategoryId=27")[0]).Title.Length>20?(book.GetModelList("CategoryId=27")[0]).Title.Substring(0,20)+"...":(book.GetModelList("CategoryId=27")[0]).Title %>
									</div>								
									<div class="sub-title ">
										¥<%=(book.GetModelList("CategoryId=27")[0]).UnitPrice.ToString("f2") %>
									</div>
								</div>
							</a>
						</div>
						<div class="am-u-sm-4 text-four sug">
							<a href="/Home/Page/BookDetails_<%=(book.GetModelList("CategoryId=27")[1]).Id %>.aspx">
								<img src="/BookCovers/<%=(book.GetModelList("CategoryId=27")[1]).ISBN %>.jpg" class="tu" />
								<div class="outer-con ">
									<div class="title ">
										<%=(book.GetModelList("CategoryId=27")[1]).Title %>
									</div>
									<div class="sub-title ">
										¥<%=(book.GetModelList("CategoryId=27")[1]).UnitPrice.ToString("f2") %>
									</div>
								</div>
							</a>
						</div>
						
						<div class="am-u-sm-6 am-u-md-3 text-five big ">
							<a href="/Home/Page/BookDetails_<%=(book.GetModelList("CategoryId=27")[2]).Id %>.aspx">
								<img src="/BookCovers/<%=(book.GetModelList("CategoryId=27")[2]).ISBN %>.jpg"  />
								<div class="outer-con ">
									<div class="title " style="margin-top:-50px">
										<%=(book.GetModelList("CategoryId=27")[2]).Title %>
									</div>		
									<div class="sub-title ">
										¥<%=(book.GetModelList("CategoryId=27")[2]).UnitPrice.ToString("f2") %>
									</div>
								</div>
							</a>
						</div>						
						<div class="am-u-sm-6 am-u-md-3 text-five ">
							<a href="/Home/Page/BookDetails_<%=(book.GetModelList("CategoryId=27")[3]).Id %>.aspx">
								<img src="/BookCovers/<%=(book.GetModelList("CategoryId=27")[3]).ISBN %>.jpg" class="tu" />
								<div class="outer-con ">
									<div class="title ">
										<%=(book.GetModelList("CategoryId=27")[3]).Title.Length>20?(book.GetModelList("CategoryId=27")[3]).Title.Substring(0,20)+"...":(book.GetModelList("CategoryId=27")[3]).Title %>
									</div>	
									<div class="sub-title ">
										¥<%=(book.GetModelList("CategoryId=27")[3]).UnitPrice.ToString("f2") %>
									</div>
								</div>
							</a>
						</div>						
						<div class="am-u-sm-6 am-u-md-3 text-five sug">
							<a href="/Home/Page/BookDetails_<%=(book.GetModelList("CategoryId=27")[4]).Id %>.aspx">
								<img src="/BookCovers/<%=(book.GetModelList("CategoryId=27")[4]).ISBN %>.jpg" class="tu" />
								<div class="outer-con ">
									<div class="title ">
										<%=(book.GetModelList("CategoryId=27")[4]).Title %>
									</div>
									<div class="sub-title ">
										¥<%=(book.GetModelList("CategoryId=27")[4]).UnitPrice.ToString("f2") %>
									</div>
								</div>
							</a>
						</div>
						<div class="am-u-sm-6 am-u-md-3 text-five big">
							<a href="/Home/Page/BookDetails_<%=(book.GetModelList("CategoryId=27")[5]).Id %>.aspx">
								<img src="/BookCovers/<%=(book.GetModelList("CategoryId=27")[5]).ISBN %>.jpg"  />
								<div class="outer-con ">
									<div class="title ">
										<%=(book.GetModelList("CategoryId=27")[5]).Title %>
									</div>			
									<div class="sub-title ">
										¥<%=(book.GetModelList("CategoryId=27")[5]).UnitPrice.ToString("f2") %>
									</div>
								</div>
							</a>
						</div>
						
					</div>

					<div class="clear "></div>
					</div>

                    
   
   
   
					<div class="footer ">
						<div class="footer-hd ">
							<p>
								<a href="javascript:; ">西西弗</a>
								<b>|</b>
								<a href="/Home/Page/Index.aspx  ">商城首页</a>
								<b>|</b>
								<a href="javascript:; ">支付宝</a>
								<b>|</b>
								<a href="javascript:;  ">物流</a>
							</p>
						</div>
						<div class="footer-bd ">
							<p>
								<a href="javascript:; ">关于西西弗</a>
								<a href="javascript:; ">合作伙伴</a>
								<a href="javascript:; ">联系我们</a>
								<a href="/Common/Map.aspx">网站地图</a>
								<em>© 2015-2025 Hengwang.com 版权所有</em>
							</p>
						</div>
					</div>

		</div>
		</div>
		<!--引导 -->
		<div class="navCir">
			<li class="active"><a href="Index.aspx"><i class="am-icon-home "></i>首页</a></li>
			<li><a href="BookList.aspx"><i class="am-icon-list"></i>分类</a></li>
			<li><a href="ShopCart.aspx"><i class="am-icon-shopping-basket"></i>购物车</a></li>	
			<li><a href="../person/index.aspx"><i class="am-icon-user"></i>我的</a></li>					
		</div>


		<!--菜单 -->
		<div class=tip>
			<div id="sidebar">
				<div id="wrap">
					<div id="shopCart" class="item ">
						<a href="ShopCart.aspx">
							<span class="message "></span>
						</a>
						<p>
							购物车
						</p>
						<p class="cart_num "><%=Session["user"]==null?0:cb.GetRecordCount("UserId="+((Maticsoft.Model.Users)Session["user"]).Id) %></p>
					</div>
					
					<div class="quick_toggle ">
						<li class="qtitem ">
							<a href="javascript:; "><span class="kfzx "></span></a>
							<div class="mp_tooltip ">客服中心<i class="icon_arrow_right_black "></i></div>
						</li>
						<!--二维码 -->
						<li class="qtitem ">
							<a href="#none "><span class="mpbtn_qrcode "></span></a>
							<div class="mp_qrcode " style="display:none; "><img src="../images/weixin_code_145.png " /><i class="icon_arrow_white "></i></div>
						</li>
						<li class="qtitem ">
							<a href="#top " class="return_top "><span class="top "></span></a>
						</li>
					</div>

					<!--回到顶部 -->
					<div id="quick_links_pop " class="quick_links_pop hide "></div>

				</div>

			</div>
			<div id="prof-content " class="nav-content ">
				<div class="nav-con-close ">
					<i class="am-icon-angle-right am-icon-fw "></i>
				</div>
				<div>
					我
				</div>
			</div>
			<div id="shopCart-content " class="nav-content ">
				<div class="nav-con-close ">
					<i class="am-icon-angle-right am-icon-fw "></i>
				</div>
				<div>
					购物车
				</div>
			</div>
			<div id="asset-content " class="nav-content ">
				<div class="nav-con-close ">
					<i class="am-icon-angle-right am-icon-fw "></i>
				</div>
				<div>
					资产
				</div>

				<div class="ia-head-list ">
					<a href="javascript:; " target="_blank " class="pl ">
						<div class="num ">0</div>
						<div class="text ">优惠券</div>
					</a>
					<a href="javascript:; " target="_blank " class="pl ">
						<div class="num ">0</div>
						<div class="text ">红包</div>
					</a>
					<a href="javascript:; " target="_blank " class="pl money ">
						<div class="num ">￥0</div>
						<div class="text ">余额</div>
					</a>
				</div>

			</div>
			<div id="foot-content " class="nav-content ">
				<div class="nav-con-close ">
					<i class="am-icon-angle-right am-icon-fw "></i>
				</div>
				<div>
					足迹
				</div>
			</div>
			<div id="brand-content " class="nav-content ">
				<div class="nav-con-close ">
					<i class="am-icon-angle-right am-icon-fw "></i>
				</div>
				<div>
					收藏
				</div>
			</div>
			<div id="broadcast-content " class="nav-content ">
				<div class="nav-con-close ">
					<i class="am-icon-angle-right am-icon-fw "></i>
				</div>
				<div>
					充值
				</div>
			</div>
		</div>
		<script>
		    window.jQuery || document.write('<script src="basic/js/jquery.min.js "><\/script>');
		</script>
		<script type="text/javascript " src="../basic/js/quick_links.js "></script>
	</body>

</html>