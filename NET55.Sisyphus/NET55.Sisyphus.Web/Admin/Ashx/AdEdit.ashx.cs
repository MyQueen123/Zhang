using Maticsoft.BLL;
using Maticsoft.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Admin.Ashx
{
    /// <summary>
    /// AdEdit 的摘要说明
    /// </summary>
    public class AdEdit : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            //取值
            int id = Convert.ToInt32(context.Request["Id"]);
            string title = context.Request["title"];
            //接受文件
            HttpPostedFile file = context.Request.Files["img"];
            //判断
            if (string.IsNullOrEmpty(title))
            {
                context.Response.Write("kong");
            }
            else
            {
                Ad ad = new Ad();
                ad.Id = id;
                ad.Title = title;
                ad.ImgUrl = null;
                ad.CreateTime = DateTime.Now;
                ad.IsDelete = false;
                if (file.ContentLength <= 0)
                {
                    ad.ImgUrl = new AdBll().GetModel(id).ImgUrl;
                }
                else
                {
                    //重命名文件
                    //相对路径
                    string img = "../../Home/images/" + Guid.NewGuid().ToString() + ".jpg";
                    //绝对路径
                    string abName = context.Server.MapPath(img);
                    file.SaveAs(abName);
                    ad.ImgUrl = img;
                }
                AdBll bll = new AdBll();
                bool flag = bll.Update(ad);
                if (flag)
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