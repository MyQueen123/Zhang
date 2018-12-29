using Common;
using Maticsoft.BLL;
using Maticsoft.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace NET55.Sisyphus.Web.Home.Ashx
{
    /// <summary>
    /// AddComment 的摘要说明
    /// </summary>
    public class AddComment : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string content = context.Request["content"];
            if (IsForbid(content))
            {
                context.Response.Write("no");
            }
            else
            {
                BookComment bc = new BookComment();
                bc.BookId = Convert.ToInt32(context.Request["bookid"]);
                bc.CreateDateTime = DateTime.Now;
                
                //将敏感词替换为*号
                List<Articel_Words> awList=new Articel_WordsBll().GetModelList("IsForbid=0");
                foreach (var item in awList)
                {
                    if (content.Contains(item.WordPattern)) 
                    {
                        content = content.Replace(item.WordPattern,"***");
                    }
                }

                bc.Msg = content;
                int r = new BookCommentBll().Add(bc);
                if (r >= 1)
                {
                    context.Response.Write("ok");
                }
                else
                {
                    context.Response.Write("error");
                }
            }

        }

        public bool IsForbid(string content)
        {
            //使用lamda表达式，list<Articel_Words>集合
            //List<Articel_Words> list = (List<Articel_Words>)CacheHelper.GetCache("isforbid");
            //if (list == null)
            //{
            //    list = new Articel_WordsBll().GetModelList("IsForbid=1");
            //    CacheHelper.SetCache("isforbid", list);
            //}
            //return list.Count(a => content.Contains(a.WordPattern)) > 0;

            //使用list<string>集合
            List<string> list = (List<string>)CacheHelper.GetCache("isforbid");
            if (list == null) 
            {
                List<Articel_Words> all = new Articel_WordsBll().GetModelList("IsForbid=1");
                list = new List<string>();
                foreach (var item in all)
                {
                    list.Add(item.WordPattern);
                }
                CacheHelper.SetCache("isforbid", list);
            }
            //使用“|”将集合拼接为一个字符串
            string re = string.Join("|", list);
            Regex reg = new Regex(re);
            return reg.IsMatch(content);
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