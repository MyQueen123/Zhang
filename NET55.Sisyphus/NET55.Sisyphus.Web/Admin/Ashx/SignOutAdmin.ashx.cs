using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sisyphus.Admin.Ashx
{
    /// <summary>
    /// SignOutAdmin 的摘要说明
    /// </summary>
    public class SignOutAdmin : IHttpHandler,System.Web.SessionState.IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Session["admin"]=null;
            context.Response.Redirect("../Page/Login.aspx");

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