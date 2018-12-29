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
    public partial class BookList : System.Web.UI.Page
    {
        public int pageIndex ;
        public int pageSize = 12;
        public int pageCount;
        public int total;
        public List<Categories> typelist = new List<Categories>();
        public List<Books> bookslist = new List<Books>();
        public List<Books> ramdomBooks = new List<Books>();
        public CartBll cb = new CartBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            BooksBll bbl = new BooksBll();
            typelist = new CategoriesBll().GetModelList("");
            string index = Request["index"];
            if (string.IsNullOrEmpty(index))
            {
                pageIndex = 1;
            }
            else 
            {
                pageIndex = Convert.ToInt32(index);
            }
            
            

            //获得类型id 
            string typeId = Request["typeId"];
            DataSet ds;
            if (string.IsNullOrEmpty(typeId))
            {
                ds = bbl.GetListByPage("", "Id", (pageIndex - 1) * pageSize + 1, pageIndex * pageSize);
                //总条数
                total = bbl.GetRecordCount("");
            }
            else 
            {
                ds = bbl.GetListByPage("CategoryId=" + typeId, "Id", (pageIndex - 1) * pageSize + 1, pageIndex * pageSize);
                //总条数
                total = bbl.GetRecordCount("CategoryId=" +typeId);
            }
            //总页码数
            pageCount = Convert.ToInt32(Math.Ceiling((double)total / pageSize));
           
            //每页显示的数据集
            bookslist = bbl.DataTableToList(ds.Tables[0]);
            //随机显示3条数据
            DataSet ds1 = bbl.GetBooksByRandom(3);
            ramdomBooks = bbl.DataTableToList(ds1.Tables[0]);
        }
    }
}