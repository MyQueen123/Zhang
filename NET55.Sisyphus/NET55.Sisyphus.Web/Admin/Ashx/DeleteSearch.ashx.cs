using Maticsoft.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Admin.Ashx
{
    /// <summary>
    /// DeleteSearch 的摘要说明
    /// </summary>
    public class DeleteSearch : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            int id =Convert.ToInt32(context.Request["id"]);
            SearchDetailsBll sdbll = new SearchDetailsBll();
            bool fag = sdbll.Delete(id);
            if (fag)
            {
                context.Response.Write("ok");
            }
            else
            {
                context.Response.Write("no");
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