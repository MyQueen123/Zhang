using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Common;
using System.Web.SessionState;
using Maticsoft.BLL;

namespace NET55.Sisyphus.Web.Home.Ashx
{
    /// <summary>
    /// sendPhoneVali 的摘要说明
    /// </summary>
    public class sendPhoneVali : IHttpHandler,IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string phone = context.Request["phone"];
            //测试用的验证码
            string code= Verification_Code.GetRandomint(4);

            context.Session["code"] = new SMS_Verification().VerCode(phone,code);//真实验证码
            string op = context.Request["op"];
            //找回密码
            if (op == "find")
            {
                int r = new UsersBll().ExistsByLoginId(phone);
                if (r < 1)
                {
                    context.Response.Write("nofind");
                }
                else
                {
                    context.Response.Write(code);
                }
            }
            else if (op == "reg")
            {
                context.Response.Write(code);
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