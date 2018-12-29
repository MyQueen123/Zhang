using GeetestSDK;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace NET55.Sisyphus.Web.Home.Ashx
{
    /// <summary>
    /// JiYan 的摘要说明
    /// </summary>
    public class JiYan : IHttpHandler,IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/json";
            context.Response.Write(getCaptcha(context));
            context.Response.End();
        }
        private String getCaptcha(HttpContext context)
        {
            GeetestLib geetest = new GeetestLib("48a6ebac4ebc6642d68c217fca33eb4d", "4f1c085290bec5afdc54df73535fc361");
            String userID = "test";
            Byte gtServerStatus = geetest.preProcess(userID, "web", "127.0.0.1");
            context.Session[GeetestLib.gtServerStatusSessionKey] = gtServerStatus;
            context.Session["userID"] = userID;
            return geetest.getResponseStr();
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