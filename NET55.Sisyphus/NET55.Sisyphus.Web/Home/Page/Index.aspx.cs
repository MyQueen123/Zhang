using Maticsoft.BLL;
using Maticsoft.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sisyphus.Home.Page
{
    public partial class Index : System.Web.UI.Page
    {
        public List<Categories> typeList;
        public List<Books> tuijianlist = new List<Books>();
        public List<Books> hotList = new List<Books>();
        public BooksBll book = new BooksBll();
        CategoriesBll c = new CategoriesBll();
        public CartBll cb = new CartBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            typeList = c.GetModelList("");
            
            DataSet ds = book.TodayTuiJian();
            //今日推荐
            tuijianlist = book.DataTableToList(ds.Tables[0]);

            //热门活动
            DataSet ds1 = book.GetBooksByRandom(4);
            hotList = book.DataTableToList(ds1.Tables[0]);
        }
    }
}