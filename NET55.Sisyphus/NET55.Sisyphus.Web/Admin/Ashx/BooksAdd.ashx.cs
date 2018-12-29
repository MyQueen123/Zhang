using Maticsoft.BLL;
using Maticsoft.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Book_city.Admin.Ashx
{
    /// <summary>
    /// BooksAdd 的摘要说明
    /// </summary>
    public class BooksAdd : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";

            string Title = context.Request["Title"];
            string Categories = context.Request["Categories"];
            string Author = context.Request["Author"];
            string PublisherId = context.Request["PublisherId"];
            string WordsCount = context.Request["WordsCount"];
            Double UnitPrice = Convert.ToDouble(context.Request["UnitPrice"]);
            string AurhorDescription = context.Request["AurhorDescription"];
            string EditorComment = context.Request["EditorComment"];
            string TOC = context.Request["TOC"];
            string ContentDescription = context.Request["ContentDescription"];
            //接收文件
            HttpPostedFile file = context.Request.Files["file"];
            //重命名
            string img = Guid.NewGuid().ToString();
            string imgname = "/BookCovers/" +img+ ".jpg";
            string adname = context.Server.MapPath(imgname);
            file.SaveAs(adname);

            Books books = new Books();

            books.Title = Title;
            books.Author = Author;
            books.CategoryId = Convert.ToInt32(Categories);
            books.PublishDate = DateTime.Now;
            books.ISBN = img;
            books.WordsCount = Convert.ToInt32(WordsCount);
            books.UnitPrice = Convert.ToDecimal(UnitPrice);
            books.ContentDescription = ContentDescription;
            books.AurhorDescription = AurhorDescription;
            books.EditorComment = EditorComment;
            books.TOC = TOC;
            books.PublisherId = Convert.ToInt32(PublisherId);
            books.Clicks = 0;

            BooksBll Bll = new BooksBll();
            int model= Bll.Add(books);
            if (model>0)
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