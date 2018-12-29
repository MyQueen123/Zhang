using Maticsoft.BLL;
using Maticsoft.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NET55.Sisyphus.Web.Home.Ashx
{
    /// <summary>
    /// UpdateEmail 的摘要说明
    /// </summary>
    public class UpdateEmail : IHttpHandler,System.Web.SessionState.IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string email = context.Request["email"];
             string yan = context.Request["yan"];
             int userId = ((Users)context.Session["user"]).Id;
            string code = context.Session["code"].ToString();
            if (yan != code)
            {
                context.Response.Write("验证码不正确，请重试");
            }
            else
            {
                bool flag = new UsersBll().UpdateEmail(userId,email);
                if (flag)
                {
                    context.Session["user"] = new UsersBll().GetModel(userId);
                    context.Response.Write("ok");
                }
                else {
                    context.Response.Write("服务器繁忙，请稍后重试！！！");
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