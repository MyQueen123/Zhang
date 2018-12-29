using Maticsoft.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NET55.Sisyphus.Web.Home.Ashx
{
    /// <summary>
    /// DeleteAddress 的摘要说明
    /// </summary>
    public class DeleteAddress : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            int addId = Convert.ToInt32(context.Request["Id"]);
            bool flag= new UserAddressBll().Update(addId);
            if (flag)
            {
                context.Response.Write("ok");
            }
            else {
                context.Response.Write("error");
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