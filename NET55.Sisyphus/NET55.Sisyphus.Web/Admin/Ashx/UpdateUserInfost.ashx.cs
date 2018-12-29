using Maticsoft.BLL;
using Maticsoft.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sisyphus.Admin.Ashx
{
    /// <summary>
    /// UpdateUserInfost 的摘要说明
    /// </summary>
    public class UpdateUserInfost : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            int useerid = Convert.ToInt32(context.Request["id"]);
            int updateid = Convert.ToInt32(context.Request["dele"]);
            Users u = new Users();
            UsersBll ub = new UsersBll();
            u = ub.GetModel(useerid);
            u.UserStateId = updateid;
            ub.Update(u);

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