using Maticsoft.BLL;
using Maticsoft.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NET55.Sisyphus.Web.Home.Ashx
{
    /// <summary>
    /// Add_address 的摘要说明
    /// </summary>
    public class Add_address : IHttpHandler,System.Web.SessionState.IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string Name = context.Request["name"];
            string phone = context.Request["phone"];
            string address = context.Request["dizhi"];
            UserAddress uaddress = new UserAddress() {
                UserId=((Users)context.Session["user"]).Id,
                Address=address,
                Phone=phone,
                Name=Name,
                IsDlete=false,
                CreateTime=DateTime.Now
            };
           int r= new UserAddressBll().Add(uaddress);
           if (r >= 1)
           {
               context.Response.Write("ok");
           }
           else 
           {
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