using Maticsoft.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Admin.Ashx
{
    /// <summary>
    /// AdDelete 的摘要说明
    /// </summary>
    public class AdDelete : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            //取值
            string id = context.Request["id"];

            AdBll bll = new AdBll();

            bool fag = bll.Update(Convert.ToInt32(id));

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