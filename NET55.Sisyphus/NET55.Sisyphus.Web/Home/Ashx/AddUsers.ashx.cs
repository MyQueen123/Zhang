using Common;
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
    /// AddUsers 的摘要说明
    /// </summary>
    public class AddUsers : IHttpHandler, IRequiresSessionState
    {
        UsersBll ub = new UsersBll();
        UserInfoBll uib = new UserInfoBll();
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
                   int isexists= ub.ExistsByLoginId(telphone);
                   if (isexists >= 1)
                   {
                       context.Response.Write("该用户名已被注册，请输入其他用户名");
                   }
                   else
                   {
                       Users u = new Users()
                       {
                           LoginId = telphone,
                           LoginPwd = pwd,
                           Name = telphone,
                           Address = "",
                           Phone = telphone,
                           Mail = "",
                           UserStateId = 1
                       };

                       int r = ub.Add(u);
                       if (r >= 1)
                       {
                           context.Session["user"] = u;
                           //没加密之前的密码
                           context.Session["userpwd"] = pwd;
                           context.Response.Write("ok");
                       }
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