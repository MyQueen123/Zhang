using Maticsoft.BLL;
using Maticsoft.Model;
using NET55.Sisyphus.Web.Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Book_City.Admin.Page
{
    public partial class EditBook : BaseCheckAdmin
    {
        public Books model = new Books();
        public List<Categories> list = new List<Categories>();
        public PublishersBll PBll = new PublishersBll();
        public List<Publishers> listPB = new List<Publishers>();

        protected void Page_Load(object sender, EventArgs e)
        {
            int bookId =Convert.ToInt32(Request["bookId"]);
            BooksBll BBll = new BooksBll();
            model=BBll.GetModel(bookId);
            CategoriesBll CBll = new CategoriesBll();
            list=CBll.GetModelList("");
            listPB=PBll.GetModelList("");

        }
    }
}