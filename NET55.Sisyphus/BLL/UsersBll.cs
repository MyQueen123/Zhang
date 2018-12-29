using System;
using System.Data;
using System.Collections.Generic;
using Maticsoft.Common;
using Maticsoft.Model;
namespace Maticsoft.BLL
{
	/// <summary>
	/// UsersBll
	/// </summary>
	public partial class UsersBll
	{
		private readonly Maticsoft.DAL.UsersDal dal=new Maticsoft.DAL.UsersDal();
		public UsersBll()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
			return dal.GetMaxId();
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(string LoginId,string Mail,int Id)
		{
			return dal.Exists(LoginId,Mail,Id);
		}

		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int  Add(Maticsoft.Model.Users model)
		{
			return dal.Add(model);
		}

		/// <summary>
		/// 更新一条数据
		/// </summary>
		public bool Update(Maticsoft.Model.Users model)
		{
			return dal.Update(model);
		}

		/// <summary>
		/// 删除一条数据
		/// </summary>
		public bool Delete(int Id)
		{
			
			return dal.Delete(Id);
		}
		/// <summary>
		/// 删除一条数据
		/// </summary>
		public bool Delete(string LoginId,string Mail,int Id)
		{
			
			return dal.Delete(LoginId,Mail,Id);
		}
		/// <summary>
		/// 删除一条数据
		/// </summary>
		public bool DeleteList(string Idlist )
		{
			return dal.DeleteList(Idlist );
		}

		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public Maticsoft.Model.Users GetModel(int Id)
		{
			
			return dal.GetModel(Id);
		}

		/// <summary>
		/// 得到一个对象实体，从缓存中
		/// </summary>
		public Maticsoft.Model.Users GetModelByCache(int Id)
		{
			
			string CacheKey = "UsersModel-" + Id;
			object objModel = Maticsoft.Common.DataCache.GetCache(CacheKey);
			if (objModel == null)
			{
				try
				{
					objModel = dal.GetModel(Id);
					if (objModel != null)
					{
						int ModelCache = Maticsoft.Common.ConfigHelper.GetConfigInt("ModelCache");
						Maticsoft.Common.DataCache.SetCache(CacheKey, objModel, DateTime.Now.AddMinutes(ModelCache), TimeSpan.Zero);
					}
				}
				catch{}
			}
			return (Maticsoft.Model.Users)objModel;
		}

		/// <summary>
		/// 获得数据列表
		/// </summary>
		public DataSet GetList(string strWhere)
		{
			return dal.GetList(strWhere);
		}
		/// <summary>
		/// 获得前几行数据
		/// </summary>
		public DataSet GetList(int Top,string strWhere,string filedOrder)
		{
			return dal.GetList(Top,strWhere,filedOrder);
		}
		/// <summary>
		/// 获得数据列表
		/// </summary>
		public List<Maticsoft.Model.Users> GetModelList(string strWhere)
		{
			DataSet ds = dal.GetList(strWhere);
			return DataTableToList(ds.Tables[0]);
		}
		/// <summary>
		/// 获得数据列表
		/// </summary>
		public List<Maticsoft.Model.Users> DataTableToList(DataTable dt)
		{
			List<Maticsoft.Model.Users> modelList = new List<Maticsoft.Model.Users>();
			int rowsCount = dt.Rows.Count;
			if (rowsCount > 0)
			{
				Maticsoft.Model.Users model;
				for (int n = 0; n < rowsCount; n++)
				{
					model = dal.DataRowToModel(dt.Rows[n]);
					if (model != null)
					{
						modelList.Add(model);
					}
				}
			}
			return modelList;
		}

		/// <summary>
		/// 获得数据列表
		/// </summary>
		public DataSet GetAllList()
		{
			return GetList("");
		}

		/// <summary>
		/// 分页获取数据列表
		/// </summary>
		public int GetRecordCount(string strWhere)
		{
			return dal.GetRecordCount(strWhere);
		}
		/// <summary>
		/// 分页获取数据列表
		/// </summary>
		public DataSet GetListByPage(string strWhere, string orderby, int startIndex, int endIndex)
		{
			return dal.GetListByPage( strWhere,  orderby,  startIndex,  endIndex);
		}

        /// <summary>
        /// 查询表中是否有该用户
        /// </summary>
        /// <param name="LoginId"></param>
        /// <returns></returns>
        public int ExistsByLoginId(string LoginId)
        {
            return dal.ExistsByLoginId(LoginId);
        }

		/// <summary>
		/// 分页获取数据列表
		/// </summary>
		//public DataSet GetList(int PageSize,int PageIndex,string strWhere)
		//{
			//return dal.GetList(PageSize,PageIndex,strWhere);
		//}

		#endregion  BasicMethod
		#region  ExtensionMethod

		#endregion  ExtensionMethod

        
        /// 登录查询
        /// </summary>
        /// <param name="loginID">登录id</param>
        /// <param name="pwd">密码</param>
        /// <returns></returns>
        public Maticsoft.Model.Users GetModel(string loginID, string pwd)
        {
            return dal.GetModel(loginID, pwd);
        }

        /// <summary>
        /// 找回密码
        /// </summary>
        /// <param name="telphone">手机号</param>
        /// <param name="pwd">新密码</param>
        /// <returns></returns>
        public bool Update(string telphone, string pwd)
        {
            return dal.Update(telphone, pwd);
        }

        /// <summary>
        /// 修改用户信息
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <param name="name">昵称</param>
        /// <param name="email">邮箱</param>
        /// <returns></returns>
        public bool Update(int userId, string name, string email,string address)
        {
            return dal.Update(userId,name,email,address);
        }
        /// <summary>
        /// 修改用户手机号
        /// </summary>
        /// <param name="userId">用户编号</param>
        /// <param name="telphone">手机号</param>
        /// <returns></returns>
        public bool Update(int userId, string telphone)
        {
            return dal.Update(userId, telphone);
        }
        /// <summary>
        /// 修改用户密码
        /// </summary>
        public bool UpdatePwd(int userId, string pwd)
        {
            return dal.UpdatePwd(userId, pwd);
        }

        /// <summary>
        /// 修改邮箱
        /// </summary>
        /// <param name="p">用户编号</param>
        /// <param name="email">邮箱</param>
        /// <returns></returns>
        public bool UpdateEmail(int p, string email)
        {
            return dal.UpdateEmail(p,email);
        }

        /// <summary>
        /// 根据用户名查用户的密码
        /// </summary>
        /// <param name="loginID"></param>
        /// <returns></returns>
        public string GetModel(string loginID)
        {
            return dal.GetModel(loginID);
        }
    }
}

