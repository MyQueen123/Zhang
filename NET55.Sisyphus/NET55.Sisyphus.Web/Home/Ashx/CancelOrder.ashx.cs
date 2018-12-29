using Maticsoft.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NET55.Sisyphus.Web.Home.Ashx
{
    /// <summary>
    /// CancelOrder 的摘要说明
    /// </summary>
    public class CancelOrder : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string orderId = context.Request["orderId"];
            bool flag= new OrdersBll().Delete(orderId);
            if (flag)
            {
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