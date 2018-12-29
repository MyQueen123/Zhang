using Maticsoft.BLL;
using Maticsoft.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NET55.Sisyphus.Web.Home.Ashx
{
    /// <summary>
    /// 购物车判断用户名和密码是否正确 的摘要说明
    /// </summary>
    public class CartLoginJudgment : IHttpHandler,System.Web.SessionState.IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string uid = context.Request["uid"];
            string pwd = context.Request["password"];
            Users u= new UsersBll().GetModel(uid, pwd);
            if (u != null)
            {
                context.Response.Write("ok");
                context.Session["user"] = u;
            }
            else {
                context.Response.Write("no");
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