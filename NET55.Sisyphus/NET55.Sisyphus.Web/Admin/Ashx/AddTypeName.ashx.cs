using Maticsoft.BLL;
using Maticsoft.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Book_city.Admin.Ashx
{
    /// <summary>
    /// AddTypeName 的摘要说明
    /// </summary>
    public class AddTypeName : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string typeName = context.Request["typeName"];
            CategoriesBll Bll = new CategoriesBll();
            Categories ca=new Categories ();
            ca.Name=typeName;
            int caa=Bll.Add(ca);
            if (caa>0)
            {
                context.Response.Write("ok");
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