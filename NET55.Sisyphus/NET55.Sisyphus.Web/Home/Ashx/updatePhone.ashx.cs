using Maticsoft.BLL;
using Maticsoft.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NET55.Sisyphus.Web.Home.Ashx
{
    /// <summary>
    /// updatePhone 的摘要说明
    /// </summary>
    public class updatePhone : IHttpHandler,System.Web.SessionState.IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            int userId = ((Users)context.Session["user"]).Id;
            string telphone = context.Request["phone"];
            string yan = context.Request["yan"];
            string code = context.Session["code"].ToString();
            if (yan != code)
            {
                context.Response.Write("验证码不正确，请重试");
            }
            else
            {
               bool flag= new UsersBll().Update(userId, telphone);
               if (flag)
               {
                   context.Session["user"] = new UsersBll().GetModel(userId);
                   context.Response.Write("ok");
               }
               else {
                   context.Response.Write("服务器繁忙，请稍后重试");
               }
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