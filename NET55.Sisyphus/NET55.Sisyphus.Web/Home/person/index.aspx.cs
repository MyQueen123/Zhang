using Common;
using Maticsoft.BLL;
using Maticsoft.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NET55.Sisyphus.Web.Home.person
{
    public partial class index : BaseCheck
    {
        public Books bk = new Books();
        public Books hotbk = new Books();
        public List<Books> youbkList = new List<Books>();
        //待发货的订单数量
        public int allcount = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            //新品推荐
            bk = new BooksBll().GetNewModel();
            //热卖推荐
            hotbk = new BooksBll().GetHotModel();
            //优品推荐
            DataSet ds = new BooksBll().GetBooksByRandom(6);
            youbkList = new BooksBll().DataTableToList(ds.Tables[0]);
            //待发货的订单数量
            allcount = new OrdersBll().GetRecordCount("state=1");
        }
    }
}