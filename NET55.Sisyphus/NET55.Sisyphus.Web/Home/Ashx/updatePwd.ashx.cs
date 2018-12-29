using Common;
using Maticsoft.BLL;
using Maticsoft.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NET55.Sisyphus.Web.Home.Ashx
{
    /// <summary>
    /// updatePwd 的摘要说明
    /// </summary>
    public class updatePwd : IHttpHandler,System.Web.SessionState.IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string oldpwd = context.Request["oldpwd"];
            string userPwd = ((Users)context.Session["user"]).LoginPwd;
            int userId= ((Users)context.Session["user"]).Id;
            string newpwd = context.Request["newpwd"];
            if (Password_Encryption.Md5(Password_Encryption.Md5(oldpwd)) != userPwd)
            {
                context.Response.Write("原密码输入错误，请重试");
            }
            else 
            {
                bool flag = new UsersBll().UpdatePwd(userId, newpwd);
               if (flag)
               {
                   context.Session["user"]=null;
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