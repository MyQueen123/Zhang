using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NET55.Sisyphus.Web.Home.Ashx
{
    /// <summary>
    /// 购物车判断用户是否已经登录 的摘要说明
    /// </summary>
    public class CartLogin : IHttpHandler,System.Web.SessionState.IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            if (context.Session["user"] == null)
            {
                context.Response.Write("no");
            }
            else 
            {
                context.Response.Write("ok");
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