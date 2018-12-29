using Maticsoft.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NET55.Sisyphus.Web.Home.Ashx
{
    /// <summary>
    /// DeleteCart 的摘要说明
    /// </summary>
    public class DeleteCart : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            int cartId = Convert.ToInt32(context.Request["cartId"]);
            bool flag= new CartBll().Delete(cartId);
            if (flag)
            {
                context.Response.Write("ok");
            }
            else {
                context.Response.Write("error");
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