using Maticsoft.BLL;
using Maticsoft.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NET55.Sisyphus.Web.Admin.Ashx
{
    /// <summary>
    /// LoginJudgement 的摘要说明
    /// </summary>
    public class LoginJudgement : IHttpHandler,System.Web.SessionState.IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string admin = context.Request["adminName"];
            string pwd = context.Request["pwd"];
            UserInfo ui= new UserInfoBll().GetModel(admin,pwd);
            if (ui != null)
            {
                context.Session["admin"] = ui;
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