using Maticsoft.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NET55.Sisyphus.Web.Home.Ashx
{
    /// <summary>
    /// UpdateAddress 的摘要说明
    /// </summary>
    public class UpdateAddress : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            int id = Convert.ToInt32(context.Request["Id"]);
            string name = context.Request["name"];
            string phone = context.Request["phone"];
            string dizhi = context.Request["dizhi"];
           bool flag= new UserAddressBll().Update(id,name,phone,dizhi);
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