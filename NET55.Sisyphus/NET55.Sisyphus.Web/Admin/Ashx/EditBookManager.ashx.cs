using Maticsoft.BLL;
using Maticsoft.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Book_city.Admin.Ashx
{
    /// <summary>
    /// EditBookManager 的摘要说明
    /// </summary>
    public class EditBookManager : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            //获取用户要修改的BookID
            int Bookid = Convert.ToInt32(context.Request["Bookid"]);
            string Title = context.Request["Title"];
            string Categories = context.Request["Categories"];
            string Author = context.Request["Author"];
            string PublisherId = context.Request["PublisherId"];
            string WordsCount = context.Request["WordsCount"];
            Double UnitPrice = Convert.ToDouble(context.Request["UnitPrice"]);
            string AurhorDescription = context.Request["AurhorDescription"];
            string EditorComment = context.Request["EditorComment"];
            //string TOC = context.Request["TOC"];
            string ContentDescription = context.Request["ContentDescription"];
           
            //接收文件
            HttpPostedFile file = null;
            string imgname = "";
            string imgname1 = "";
                file = context.Request.Files["file"];
                if (file.FileName == null||file.FileName=="")
                {
                    imgname1 = context.Request["ISNB"];
                }
                else { 
                     //重命名
                    imgname1 = Guid.NewGuid().ToString();
                    imgname1 = imgname1.Replace("-", "");
                    imgname = "/BookCovers/" + imgname1 + ".jpg";
                    string adname = context.Server.MapPath(imgname);
                    file.SaveAs(adname);
                }

            Books books = new BooksBll().GetModel(Bookid);

            books.Title = Title;
            books.Author = Author;
            books.CategoryId = Convert.ToInt32(Categories);
            books.ISBN = imgname1;
            books.WordsCount = Convert.ToInt32(WordsCount);
            books.UnitPrice = Convert.ToDecimal(UnitPrice);
            books.ContentDescription = ContentDescription;
            books.AurhorDescription = AurhorDescription;
            books.EditorComment = EditorComment;
            books.TOC = "";
            books.PublisherId = Convert.ToInt32(PublisherId);

            BooksBll Bll = new BooksBll();
            bool model = Bll.Update(books);
            if (model)
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