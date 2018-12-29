using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace Common
{
    public class BaseCheck:System.Web.UI.Page,System.Web.SessionState.IRequiresSessionState
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("/Home/Page/Login.aspx");
            }
        }
    }
}