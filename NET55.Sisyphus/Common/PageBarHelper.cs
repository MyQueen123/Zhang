using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Common
{
    public class PageBarHelper
    {
        /// <summary>
        /// 查询分页的方法
        /// </summary>
        /// <param name="pageIndex">第一页</param>
        /// <param name="pageCount">总页数</param>
        /// <returns></returns>
        public static string GetPagaBar(int pageIndex, int pageCount,string typeId)
        {
            if (pageCount == 1)
            {
                return string.Empty;
            }
            int start = pageIndex - 5;//计算起始位置.要求页面上显示10个数字页码.
            if (start < 1)
            {
                start = 1;
            }
            int end = start + 9;//计算终止位置.
            if (end > pageCount)
            {
                end = pageCount;
                //重新计算一下Start值.
                start = end - 9 < 1 ? 1 : end - 9;
            }
            StringBuilder sb = new StringBuilder();

            if (pageIndex > 1)
            {
                sb.AppendFormat("<li ><a href='?typeId={0}&index={1}'>«</a></li>",typeId, pageIndex - 1);
            }
            for (int i = start; i <= end; i++)
            {
                if (i == pageIndex)
                {
                    sb.AppendFormat("<li class='am-active'><a href='?typeId={0}&index={1}'>{1}</a></li>", typeId, i);
                }
                else
                {
                    sb.AppendFormat("<li><a href='?typeId={0}&index={1}'>{1}</a></li>", typeId, i);
                }
            }
            if (pageIndex < pageCount)
            {
                sb.AppendFormat(" <li><a href='?typeId={0}&index={1}'>»</a></li>",typeId, pageIndex + 1);
            }

            return sb.ToString();
        }

        /// <summary>
        /// 查询分页的方法
        /// </summary>
        /// <param name="pageIndex">第一页</param>
        /// <param name="pageCount">总页数</param>
        /// <returns></returns>
        public static string GetPagaBar(int pageIndex, int pageCount)
        {
            if (pageCount == 1)
            {
                return string.Empty;
            }
            int start = pageIndex - 5;//计算起始位置.要求页面上显示10个数字页码.
            if (start < 1)
            {
                start = 1;
            }
            int end = start + 9;//计算终止位置.
            if (end > pageCount)
            {
                end = pageCount;
                //重新计算一下Start值.
                start = end - 9 < 1 ? 1 : end - 9;
            }
            StringBuilder sb = new StringBuilder();

            if (pageIndex > 1)
            {
                sb.AppendFormat("<li ><a href='?index={0}'>«</a></li>", pageIndex - 1);
            }
            for (int i = start; i <= end; i++)
            {
                if (i == pageIndex)
                {
                    sb.AppendFormat("<li class='am-active'><a href='?index={0}'>{0}</a></li>", i);
                }
                else
                {
                    sb.AppendFormat("<li><a href='?index={0}'>{0}</a></li>", i);
                }
            }
            if (pageIndex < pageCount)
            {
                sb.AppendFormat(" <li><a href='?index={0}'>»</a></li>", pageIndex + 1);
            }

            return sb.ToString();
        }
    }
}
