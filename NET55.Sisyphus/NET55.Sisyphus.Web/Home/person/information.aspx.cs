using Maticsoft.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NET55.Sisyphus.Web.Home.person
{
    public partial class information : System.Web.UI.Page
    {
        public Users u = new Users();
        protected void Page_Load(object sender, EventArgs e)
        {
             u = (Users)Session["user"];
        }
    }
}