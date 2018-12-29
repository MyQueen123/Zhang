using Maticsoft.BLL;
using Maticsoft.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NET55.Sisyphus.Web.Home.Page
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["userpwd"] != null && Request["username"] != null )
            {
                string phone = Request.Cookies["username"].Value;
            }
            if (Session["user"] != null) 
            {
                Response.Redirect("Index.aspx");
            }
        }
    }
}