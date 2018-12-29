using Maticsoft.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Admin.Ashx
{
    /// <summary>
    /// DeleteArticle 的摘要说明
    /// </summary>
    public class DeleteArticle : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            //取值
            string id = context.Request["id"];
            Articel_WordsBll bll = new Articel_WordsBll();
            bool fag = bll.Delete(Convert.ToInt32(id));
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