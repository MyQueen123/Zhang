using Maticsoft.BLL;
using Maticsoft.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NET55.Sisyphus.Web.Admin.Page
{
    public partial class CommentManager : BaseCheckAdmin
    {
        /// <summary>
        /// 查询BookComment中的所有的评论
        /// </summary>
        public List<BookComment> BookCommentList = new List<BookComment>();
        public int pageIndex;
        public int pageSize = 1;
        public int pageCount;
        public BooksBll uBll = new BooksBll();
        protected void Page_Load(object sender, EventArgs e)
        {
            BookCommentBll Bll = new BookCommentBll();
            string index = Request["index"];
            if (string.IsNullOrEmpty(index))
            {
                pageIndex = 1;
            }
            else
            {
                pageIndex = Convert.ToInt32(index);
            }
            //总页数
            int total = Bll.GetRecordCount("");
            pageCount = Convert.ToInt32(Math.Ceiling((double)total / pageSize));

            //集合
            DataSet ds = Bll.GetListByPage("", "", (pageIndex - 1) * pageSize + 1, pageIndex * pageSize);
            BookCommentList = Bll.DataTableToList(ds.Tables[0]);
        }
    }
}