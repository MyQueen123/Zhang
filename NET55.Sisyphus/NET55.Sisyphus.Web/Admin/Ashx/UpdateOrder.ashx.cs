using Maticsoft.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NET55.Sisyphus.Web.Admin.Ashx
{
    /// <summary>
    /// UpdateOrder 的摘要说明
    /// </summary>
    public class UpdateOrder : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string orderId = context.Request["orderId"];
            string address = context.Request["address"];
            bool flag = new OrdersBll().Update(orderId, address);
           if (flag)
           {
               context.Response.Write("ok");
           }
           else {
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