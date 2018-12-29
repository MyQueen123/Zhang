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
    /// AddOrder 的摘要说明
    /// </summary>
    public class AddOrder : IHttpHandler,System.Web.SessionState.IRequiresSessionState
    {
        CartBll cb = new CartBll();
        BooksBll bbll = new BooksBll();
        OrdersBll ob = new OrdersBll();
        OrderBookBll obbll = new OrderBookBll();
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string cartId = context.Request["cartIds"];
            string[] cartIds=cartId.Split(',');
            int userId = ((Users)context.Session["user"]).Id;

            //创建订单
            Orders o = new Orders();
            o.UserId = userId;
            o.OrderDate = DateTime.Now;
            o.OrderId = UniqueData.Gener("");
            o.PostAddress = "";
            o.state = 0;
            o.TotalPrice = 0;

            //将购物车中用户要购买的商品添加到集合中
            List<Cart> cartList = new List<Cart>();
            for (int i = 1; i < cartIds.Length; i++)
            {
               cartList.Add(cb.GetModel(Convert.ToInt32(cartIds[i])));
            }
            //赋值总价
            foreach (var item in cartList)
            {
                o.TotalPrice += bbll.GetModel(item.BookId).UnitPrice * item.Count;
            }
            ob.Add(o);

            //创建详细订单信息
            foreach (var item in cartList)
            {
                OrderBook obk = new OrderBook() {
                    OrderID=o.OrderId,
                    BookID=item.BookId,
                    Quantity=item.Count,
                    UnitPrice = bbll.GetModel(item.BookId).UnitPrice * item.Count
                };
                obbll.Add(obk);

                //删除购物车中的信息
                cb.Delete(item.Id);
            }
            
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