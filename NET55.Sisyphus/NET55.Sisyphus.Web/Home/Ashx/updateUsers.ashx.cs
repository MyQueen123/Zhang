using Maticsoft.BLL;
using Maticsoft.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NET55.Sisyphus.Web.Home.Ashx
{
    /// <summary>
    /// updateUsers 的摘要说明
    /// </summary>
    public class updateUsers : IHttpHandler,System.Web.SessionState.IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string name = context.Request["name"];
            string email = context.Request["email"];
            string address = context.Request["address"];
            int userId=((Users)context.Session["user"]).Id;
            bool flag= new UsersBll().Update(userId,name,email,address);
            if (flag)
            {
                context.Session["user"] = new UsersBll().GetModel(userId);
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