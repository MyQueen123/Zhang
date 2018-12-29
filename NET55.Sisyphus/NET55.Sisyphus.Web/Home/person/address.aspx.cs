using Maticsoft.BLL;
using Maticsoft.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NET55.Sisyphus.Web.Home.person
{
    public partial class address : System.Web.UI.Page
    {
        public List<UserAddress> UserAddressList = new List<UserAddress>();
        protected void Page_Load(object sender, EventArgs e)
        {
            Users u = (Users)Session["user"];
            UserAddressList = new UserAddressBll().GetModelList("UserID="+u.Id+" and IsDlete=0");
        }
    }
}