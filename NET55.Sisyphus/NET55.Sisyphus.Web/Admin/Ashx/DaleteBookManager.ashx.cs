using Maticsoft.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Book_city.Admin.Ashx
{
    /// <summary>
    /// DaleteBookManager 的摘要说明
    /// </summary>
    public class DaleteBookManager : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            //获取用户要删除的BookID
            int Bookid = Convert.ToInt32(context.Request["Bookid"]);
            BooksBll Bll = new BooksBll();
            bool falg = Bll.Delete(Bookid);
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