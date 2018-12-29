using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NET55.Sisyphus.Web.Home.Ashx
{
    /// <summary>
    /// exits 的摘要说明
    /// </summary>
    public class exits : IHttpHandler,System.Web.SessionState.IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Session["user"] = null;


            context.Response.Cookies["userpwd"].Expires = DateTime.Now.AddDays(-1);
            

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