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
    /// BookDetails 的摘要说明
    /// </summary>
    public class BookDetails : IHttpHandler
    {
        BooksBll bbl = new BooksBll();
        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string zi = context.Request["zi"];
            int count = Convert.ToInt32(context.Request["count"]);
           
            List<Books> list= (List<Books>)CacheHelper.GetCache("books");
            if (list == null )
            {
               list= bbl.GetModelList("");
               CacheHelper.SetCache("books",list);
            }
            PinYin p = new PinYin();
            var books = list.Where(b => p.GetFirstLetter(b.Title).Contains(zi.ToUpper())).Take(count);

            //每次搜索之后都要将搜索的字存到数据库中
            SearchDetails sd = new SearchDetails()
            {
                KeyWords = zi,
                SearchDateTime = DateTime.Now
            };
            new SearchDetailsBll().Add(sd);
            //序列化
            System.Web.Script.Serialization.JavaScriptSerializer jss= new System.Web.Script.Serialization.JavaScriptSerializer();
            string json = jss.Serialize(books);
           //输出
            context.Response.Write(json);
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