using Common;
using Maticsoft.BLL;
using Maticsoft.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NET55.Sisyphus.Web.Home.Ashx
{
    /// <summary>
    /// BuyNow 的摘要说明
    /// </summary>
    public class BuyNow : IHttpHandler, System.Web.SessionState.IRequiresSessionState
    {
        CartBll cb = new CartBll();
        BooksBll bbll = new BooksBll();
        OrdersBll ob = new OrdersBll();
        OrderBookBll obbll = new OrderBookBll();
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            int bookId = Convert.ToInt32(context.Request["bookId"]);
            int userId = ((Users)context.Session["user"]).Id;
            int count = Convert.ToInt32(context.Request["count"]);
            //创建订单
            Orders o = new Orders();
            o.UserId = userId;
            o.OrderDate = DateTime.Now;
            o.OrderId = UniqueData.Gener("");
            o.PostAddress = "";
            o.state = 0;
            //赋值总价
            o.TotalPrice = bbll.GetModel(bookId).UnitPrice * count;

            ob.Add(o);

            //创建详细订单信息
            OrderBook obk = new OrderBook()
            {
                OrderID = o.OrderId,
                BookID = bookId,
                Quantity = count,
                UnitPrice = bbll.GetModel(bookId).UnitPrice * count
            };
            obbll.Add(obk);
            
            context.Response.Write(o.OrderId);

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