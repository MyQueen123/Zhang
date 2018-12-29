using Maticsoft.BLL;
using Maticsoft.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NET55.Sisyphus.Web.Home.Page
{
    public partial class BookDetails : System.Web.UI.Page
    {
        public Books books = new Books();
        public List<Books> booksList = new List<Books>();
        public CategoriesBll cbll = new CategoriesBll();
        public PublishersBll pbll = new PublishersBll();
        public CartBll cb = new CartBll();

        public List<Books> guestLike = new List<Books>();

        public int count = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request["bookid"]);
            //图书详情
            BooksBll bbl = new BooksBll();
            books = bbl.GetModel(id);

            //随机显示图书
           DataSet ds= bbl.GetBooksByRandom(4);
           booksList = bbl.DataTableToList(ds.Tables[0]);
              
            //猜你喜欢
           DataSet ds1= bbl.GetBooksByRandom(12);
           guestLike = bbl.DataTableToList(ds1.Tables[0]);

           count = new BookCommentBll().GetRecordCount("BookId="+id);
        }
    }
}