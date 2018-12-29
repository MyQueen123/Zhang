using Maticsoft.BLL;
using Maticsoft.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Book_city.Admin.Ashx
{
    /// <summary>
    /// updateTypeName 的摘要说明
    /// </summary>
    public class updateTypeName : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string typeName = context.Request["typeName"];
            int typeid = Convert.ToInt32(context.Request["typeid"]);
            CategoriesBll Bll = new CategoriesBll();
            Categories ca = new Categories();
            ca.Id = typeid;
            ca.Name = typeName;
            bool falg = Bll.Update(typeName, typeid);
            if (falg)
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