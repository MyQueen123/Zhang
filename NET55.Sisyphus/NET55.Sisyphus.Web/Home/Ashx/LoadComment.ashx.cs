using Common;
using Maticsoft.BLL;
using Maticsoft.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NET55.Sisyphus.Web.Home.Ashx
{
    /// <summary>
    /// LoadComment 的摘要说明
    /// </summary>
    public class LoadComment : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            int bookid = Convert.ToInt32(context.Request["bookid"]);

            List<BookComment> list = new BookCommentBll().GetModelList("BookId=" + bookid);

            //把ubb编码转换为html
            foreach (var item in list)
            {
                item.Msg = ubbCode.UbbToHtml(item.Msg);
            }
            //序列化
            System.Web.Script.Serialization.JavaScriptSerializer jss = new System.Web.Script.Serialization.JavaScriptSerializer();
            context.Response.Write(jss.Serialize(list));
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