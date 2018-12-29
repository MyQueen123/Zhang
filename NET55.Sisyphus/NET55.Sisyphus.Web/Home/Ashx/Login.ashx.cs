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
    /// Login 的摘要说明
    /// </summary>
    public class Login : IHttpHandler,IRequiresSessionState
    {
        UsersBll ub = new UsersBll();
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string loginID = context.Request["loginID"];
            string pwd = context.Request["pwd"];
            string isremember = context.Request["rem"];

            Users u = ub.GetModel(loginID, pwd);
            if (u != null)
            {
                if (context.Request.Cookies["userpwd"] == null && context.Request.Cookies["username"] == null || u.LoginPwd.Length != 32)
                {
                    u.LoginPwd = Password_Encryption.Md5(Password_Encryption.Md5(u.LoginPwd));
                }
               
                if (isremember=="未选中")
                {
                    //不记住密码
                    context.Response.Cookies["username"].Expires = DateTime.Now.AddDays(-1);
                    context.Response.Cookies["userpwd"].Expires = DateTime.Now.AddDays(-1);

                   
                }
                else if (isremember == "选中")
                {
                    //记住密码
                    context.Response.Cookies["username"].Value = u.LoginId;
                    context.Response.Cookies["userpwd"].Value = u.LoginPwd;
                    //设置过期时间
                    context.Response.Cookies["username"].Expires = DateTime.Now.AddDays(3);
                    context.Response.Cookies["userpwd"].Expires = DateTime.Now.AddDays(3);
                   
                }
                context.Session["user"] = u;
                context.Response.Write("ok");
            }
            else 
            {
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