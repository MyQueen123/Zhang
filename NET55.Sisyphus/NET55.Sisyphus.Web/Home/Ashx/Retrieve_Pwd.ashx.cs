using Maticsoft.BLL;
using Maticsoft.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace NET55.Sisyphus.Web.Home.Ashx
{
    /// <summary>
    /// Retrieve_Pwd 的摘要说明
    /// </summary>
    public class Retrieve_Pwd : IHttpHandler,IRequiresSessionState
    {
        UsersBll ub = new UsersBll();
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string telphone = context.Request["telphone"];
            string pwd = context.Request["pwd"];
            string repwd = context.Request["repwd"];
            string yan = context.Request["yan"];
            string code = context.Session["code"].ToString();
           
            if (yan != code)
            {
                context.Response.Write("验证码不正确，请重试");
            }
            else
            {
                if (pwd != repwd)
                {
                    context.Response.Write("两次密码不一致，请重试");
                }
                else
                {
                       bool flag=ub.Update(telphone,pwd);
                       if (flag)
                       {
                           Users u = ub.GetModel(telphone, pwd);
                           context.Session["user"] = u;
                           context.Response.Write("ok");
                       }
                       else 
                       {
                           context.Response.Write("系统繁忙，请稍后重试");
                       }
                    
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