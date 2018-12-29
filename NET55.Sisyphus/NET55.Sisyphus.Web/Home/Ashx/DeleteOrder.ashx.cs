using Maticsoft.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NET55.Sisyphus.Web.Home.Ashx
{
    /// <summary>
    /// DeleteOrder 的摘要说明
    /// </summary>
    public class DeleteOrder : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string orderId = context.Request["orderId"];

            bool flag2 = new OrdersBll().UpdateToDelete(orderId);
            if (flag2)
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