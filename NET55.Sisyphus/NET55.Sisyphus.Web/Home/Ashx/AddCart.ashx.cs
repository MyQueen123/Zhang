using Maticsoft.BLL;
using Maticsoft.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NET55.Sisyphus.Web.Home.Ashx
{
    /// <summary>
    /// AddCart 的摘要说明
    /// </summary>
    public class AddCart : IHttpHandler,System.Web.SessionState.IRequiresSessionState
    {
       CartBll cb= new CartBll();
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            int userId = ((Users)context.Session["user"]).Id;
            int bookid = Convert.ToInt32(context.Request["bookid"]);
            int count=Convert.ToInt32(context.Request["count"]);
            Cart c= cb.GetModel(userId,bookid);
           //购物车中已有该商品了
            if (c != null)
            {
                c.Count += count;
                cb.Update(c);
            }
              //还没有该商品
            else 
            {
                Cart ct = new Cart() {
                    UserId = userId,
                    BookId = bookid,
                    Count = count
                };
               
                cb.Add(ct);
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