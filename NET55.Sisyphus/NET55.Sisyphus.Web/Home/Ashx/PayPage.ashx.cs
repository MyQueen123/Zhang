using Aop.Api;
using Aop.Api.Domain;
using Aop.Api.Request;
using Aop.Api.Response;
using Common;
using Maticsoft.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NET55.Sisyphus.Web.Home.Ashx
{
    /// <summary>
    /// PayPage 的摘要说明
    /// </summary>
    public class PayPage : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/html";
            string orderId = context.Request["orderId"];
            DefaultAopClient client = new DefaultAopClient(config.gatewayUrl, config.app_id, config.private_key, "json", "1.0", config.sign_type, config.alipay_public_key, config.charset, false);

            // 外部订单号，商户网站订单系统中唯一的订单号
            string out_trade_no =UniqueData.Gener("");

            // 订单名称
            string subject = "西西弗斯书店";

            // 付款金额
            string total_amout = new OrdersBll().GetModel(orderId).TotalPrice.ToString();

            // 商品描述
            string body = "书籍";

            // 组装业务参数model
            AlipayTradePagePayModel model = new AlipayTradePagePayModel();
            model.Body = body;
            model.Subject = subject;
            model.TotalAmount = total_amout;
            model.OutTradeNo = out_trade_no;
            model.ProductCode = "FAST_INSTANT_TRADE_PAY";

            AlipayTradePagePayRequest request = new AlipayTradePagePayRequest();

            string addresssId = context.Request["dizhiId"];
            //修改状态订单状态
            new OrdersBll().Update(orderId,addresssId);
            
            // 设置同步回调地址
            request.SetReturnUrl("http://localhost:40249/Home/Page/Success.aspx?orderId=" + orderId);
            // 设置异步通知接收地址
            request.SetNotifyUrl("http://localhost:40249/Home/Page/Success.aspx?orderId=" + orderId);
            // 将业务model载入到request
            request.SetBizModel(model);
            
            AlipayTradePagePayResponse response = null;
            try
            {
                response = client.pageExecute(request, null, "post");
                context.Response.Write(response.Body);
            }
            catch (Exception exp)
            {
                throw exp;
            }
       
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}