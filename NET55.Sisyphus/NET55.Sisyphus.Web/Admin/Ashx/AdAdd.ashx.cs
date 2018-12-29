using Maticsoft.BLL;
using Maticsoft.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Admin.Ashx
{
    /// <summary>
    /// AdAdd 的摘要说明
    /// </summary>
    public class AdAdd : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            //取值
            string title = context.Request["title"];
            //string img = context.Request["img"];
            //接受文件
            HttpPostedFile file=context.Request.Files["img"];
            //重命名文件
            //相对路径
            string img = "../../Home/images/"+Guid.NewGuid().ToString()+".jpg";
            //绝对路径
            string abName = context.Server.MapPath(img);
            file.SaveAs(abName);
            //判断
            if (string.IsNullOrEmpty(title) || string.IsNullOrEmpty(img))
            {
                context.Response.Write("kong");
            }
            else
            {
                    Ad ad = new Ad();
                    ad.Title = title;
                    ad.ImgUrl = img;
                    ad.CreateTime = DateTime.Now;
                    ad.IsDelete = false;
                    AdBll bll = new AdBll();
                    int row = bll.Add(ad);
                    if (row > 0)
                    {
                        context.Response.Write("ok");
                    }
                    else
                    {
                        context.Response.Write("no");
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