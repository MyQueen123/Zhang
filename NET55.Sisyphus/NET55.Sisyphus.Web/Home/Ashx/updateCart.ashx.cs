using Maticsoft.BLL;
using Maticsoft.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NET55.Sisyphus.Web.Home.Ashx
{
    /// <summary>
    /// updateCart 的摘要说明
    /// </summary>
    public class updateCart : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            int count = Convert.ToInt32(context.Request["count"]);
            int id = Convert.ToInt32(context.Request["cartid"]);
           
           bool flag= new CartBll().Update(id,count);
           context.Response.Write(flag);
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