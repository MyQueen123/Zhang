using Maticsoft.BLL;
using Maticsoft.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NET55.Sisyphus.Web.Admin.Page
{
    public partial class UpdateOrders : System.Web.UI.Page
    {
        public Orders order = new Orders();
        public UsersBll ub = new UsersBll();
        public UserAddressBll uab = new UserAddressBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            string orderId=Request["orderId"];
            order = new OrdersBll().GetModel(orderId);
        }
    }
}