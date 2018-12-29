using Maticsoft.BLL;
using Maticsoft.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Admin.Ashx
{
    /// <summary>
    /// AdUpdate 的摘要说明
    /// </summary>
    public class AdUpdate : IHttpHandler
    {
        public Ad ad =null;
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            int id = Convert.ToInt32(context.Request["Id"]);
            ad = new AdBll().GetModel(id); 
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