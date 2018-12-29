using Maticsoft.BLL;
using Maticsoft.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Admin.Ashx
{
    /// <summary>
    /// AddArticle 的摘要说明
    /// </summary>
    public class AddArticle : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            //取值
            string name = context.Request["name"];
            string ci = context.Request["ci"];
            //判断
            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(ci))
            {
                context.Response.Write("kong");
            }
            else
            {
                if (ci == "禁用词" || ci == "敏感词")
                {
                    Articel_Words aw = new Articel_Words();
                    aw.WordPattern = name;
                    aw.IsForbid = false;
                    aw.IsMod = false;
                    if (ci == "敏感词")
                    {
                        aw.IsMod = true;
                    }
                    else if (ci == "禁用词")
                    {
                        aw.IsForbid = true;
                    }
                    Articel_WordsBll bll = new Articel_WordsBll();
                    int row = bll.Add(aw);
                    if (row > 0)
                    {
                        context.Response.Write("ok");
                    }
                    else
                    {
                        context.Response.Write("no");
                    }
                }
                else
                {
                    context.Response.Write("cuo");
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