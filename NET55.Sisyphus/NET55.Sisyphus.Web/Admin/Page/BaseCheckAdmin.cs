using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NET55.Sisyphus.Web.Admin
{
    public class BaseCheckAdmin:System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            if (Session["admin"] == null) 
            {
                Response.Redirect("/Admin/Page/Login.aspx");
            }
        }
    }
}