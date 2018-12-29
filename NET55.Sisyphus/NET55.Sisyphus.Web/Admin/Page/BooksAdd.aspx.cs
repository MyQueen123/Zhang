using Maticsoft.BLL;
using Maticsoft.Model;
using NET55.Sisyphus.Web.Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Book_city.Admin.Page
{
    public partial class BooksAdd : BaseCheckAdmin
    {
        public List<Categories> CategoriesList = new List<Categories>();
        public List<Publishers> PublishersList = new List<Publishers>();
        protected void Page_Load(object sender, EventArgs e)
        {
            CategoriesList = new CategoriesBll().GetModelList("");
            PublishersList = new PublishersBll().GetModelList("");
        }
    }
}