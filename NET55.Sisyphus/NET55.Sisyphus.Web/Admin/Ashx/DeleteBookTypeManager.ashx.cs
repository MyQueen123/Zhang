using Maticsoft.BLL;
using Maticsoft.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Book_city.Admin.Ashx
{
    /// <summary>
    /// DeleteBookTypeManager 的摘要说明
    /// </summary>
    public class DeleteBookTypeManager : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            //获取用户要删除的BookID
            int typeid = Convert.ToInt32(context.Request["typeid"]);
            BooksBll Bll = new BooksBll();
            List<Books> books = Bll.GetModelList("CategoryId=" + typeid);
            if (books.Count>0)
            {
                context.Response.Write("no");
            }
            else {
                CategoriesBll cBll = new CategoriesBll();
                bool falg = cBll.Delete(typeid);
                if (falg)
                {
                    context.Response.Write("ok");
                }
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