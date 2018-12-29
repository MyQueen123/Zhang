using Common;
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
    public partial class ShopCart : BaseCheck
    {
        public List<Cart> cartList = new List<Cart>();
        public BooksBll bbll = new BooksBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            Users u = (Users)Session["user"];
            cartList = new CartBll().GetModelList("UserId="+u.Id);
        }
    }
}