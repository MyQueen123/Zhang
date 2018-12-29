using Maticsoft.BLL;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NET55.Sisyphus.Web.Home
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string filepath = Server.MapPath("/BookCovers");
                BooksBll bbl = new BooksBll();
                var list = bbl.GetModelList("");
                int i = 0;
                foreach (var item in list)
                {
                    bool flag = File.Exists(filepath + "/" + item.ISBN + ".jpg");
                    if (!flag)
                    {
                        bbl.Delete(item.Id);
                        i++;
                    }
                }
                Response.Write("一共删除了" + i);
            }
        }
    }
}