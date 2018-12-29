using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Maticsoft.DBUtility;//Please add references
namespace Maticsoft.DAL
{
    /// <summary>
    /// 数据访问类:UsersDal
    /// </summary>
    public partial class UsersDal
    {
        public UsersDal()
        { }
        #region  BasicMethod

        /// <summary>
        /// 得到最大ID
        /// </summary>
        public int GetMaxId()
        {
            return DbHelperSQL.GetMaxID("Id", "Users");
        }

        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool Exists(string LoginId, string Mail, int Id)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select count(1) from Users");
            strSql.Append(" where LoginId=@LoginId and Mail=@Mail and Id=@Id ");
            SqlParameter[] parameters = {
					new SqlParameter("@LoginId", SqlDbType.NVarChar,50),
					new SqlParameter("@Mail", SqlDbType.NVarChar,100),
					new SqlParameter("@Id", SqlDbType.Int,4)			};
            parameters[0].Value = LoginId;
            parameters[1].Value = Mail;
            parameters[2].Value = Id;

            return DbHelperSQL.Exists(strSql.ToString(), parameters);
        }


        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(Maticsoft.Model.Users model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("insert into Users(");
            strSql.Append("LoginId,LoginPwd,Name,Address,Phone,Mail,UserStateId)");
            strSql.Append(" values (");
            strSql.Append("@LoginId,@LoginPwd,@Name,@Address,@Phone,@Mail,@UserStateId)");
            strSql.Append(";select @@IDENTITY");
            SqlParameter[] parameters = {
					new SqlParameter("@LoginId", SqlDbType.NVarChar,50),
					new SqlParameter("@LoginPwd", SqlDbType.NVarChar,50),
					new SqlParameter("@Name", SqlDbType.NVarChar,50),
					new SqlParameter("@Address", SqlDbType.NVarChar,200),
					new SqlParameter("@Phone", SqlDbType.NVarChar,100),
					new SqlParameter("@Mail", SqlDbType.NVarChar,100),
					new SqlParameter("@UserStateId", SqlDbType.Int,4)};
            parameters[0].Value = model.LoginId;
            parameters[1].Value = model.LoginPwd;
            parameters[2].Value = model.Name;
            parameters[3].Value = model.Address;
            parameters[4].Value = model.Phone;
            parameters[5].Value = model.Mail;
            parameters[6].Value = model.UserStateId;

            object obj = DbHelperSQL.GetSingle(strSql.ToString(), parameters);
            if (obj == null)
            {
                return 0;
            }
            else
            {
                return Convert.ToInt32(obj);
            }
        }
        /// <summary>
        /// 更新一条数据
        /// </summary>
        public bool Update(Maticsoft.Model.Users model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update Users set ");
            strSql.Append("LoginPwd=@LoginPwd,");
            strSql.Append("Name=@Name,");
            strSql.Append("Address=@Address,");
            strSql.Append("Phone=@Phone,");
            strSql.Append("UserStateId=@UserStateId");
            strSql.Append(" where Id=@Id");
            SqlParameter[] parameters = {
					new SqlParameter("@LoginPwd", SqlDbType.NVarChar,50),
					new SqlParameter("@Name", SqlDbType.NVarChar,50),
					new SqlParameter("@Address", SqlDbType.NVarChar,200),
					new SqlParameter("@Phone", SqlDbType.NVarChar,100),
					new SqlParameter("@UserStateId", SqlDbType.Int,4),
					new SqlParameter("@Id", SqlDbType.Int,4),
					new SqlParameter("@LoginId", SqlDbType.NVarChar,50),
					new SqlParameter("@Mail", SqlDbType.NVarChar,100)};
            parameters[0].Value = model.LoginPwd;
            parameters[1].Value = model.Name;
            parameters[2].Value = model.Address;
            parameters[3].Value = model.Phone;
            parameters[4].Value = model.UserStateId;
            parameters[5].Value = model.Id;
            parameters[6].Value = model.LoginId;
            parameters[7].Value = model.Mail;

            int rows = DbHelperSQL.ExecuteSql(strSql.ToString(), parameters);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 删除一条数据
        /// </summary>
        public bool Delete(int Id)
        {

            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from Users ");
            strSql.Append(" where Id=@Id");
            SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
            parameters[0].Value = Id;

            int rows = DbHelperSQL.ExecuteSql(strSql.ToString(), parameters);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        /// <summary>
        /// 删除一条数据
        /// </summary>
        public bool Delete(string LoginId, string Mail, int Id)
        {

            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from Users ");
            strSql.Append(" where LoginId=@LoginId and Mail=@Mail and Id=@Id ");
            SqlParameter[] parameters = {
					new SqlParameter("@LoginId", SqlDbType.NVarChar,50),
					new SqlParameter("@Mail", SqlDbType.NVarChar,100),
					new SqlParameter("@Id", SqlDbType.Int,4)			};
            parameters[0].Value = LoginId;
            parameters[1].Value = Mail;
            parameters[2].Value = Id;

            int rows = DbHelperSQL.ExecuteSql(strSql.ToString(), parameters);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        /// <summary>
        /// 批量删除数据
        /// </summary>
        public bool DeleteList(string Idlist)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from Users ");
            strSql.Append(" where Id in (" + Idlist + ")  ");
            int rows = DbHelperSQL.ExecuteSql(strSql.ToString());
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }


        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public Maticsoft.Model.Users GetModel(int Id)
        {

            StringBuilder strSql = new StringBuilder();
            strSql.Append("select  top 1 Id,LoginId,LoginPwd,Name,Address,Phone,Mail,UserStateId from Users ");
            strSql.Append(" where Id=@Id");
            SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
            parameters[0].Value = Id;

            Maticsoft.Model.Users model = new Maticsoft.Model.Users();
            DataSet ds = DbHelperSQL.Query(strSql.ToString(), parameters);
            if (ds.Tables[0].Rows.Count > 0)
            {
                return DataRowToModel(ds.Tables[0].Rows[0]);
            }
            else
            {
                return null;
            }
        }


        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public Maticsoft.Model.Users DataRowToModel(DataRow row)
        {
            Maticsoft.Model.Users model = new Maticsoft.Model.Users();
            if (row != null)
            {
                if (row["Id"] != null && row["Id"].ToString() != "")
                {
                    model.Id = int.Parse(row["Id"].ToString());
                }
                if (row["LoginId"] != null)
                {
                    model.LoginId = row["LoginId"].ToString();
                }
                if (row["LoginPwd"] != null)
                {
                    model.LoginPwd = row["LoginPwd"].ToString();
                }
                if (row["Name"] != null)
                {
                    model.Name = row["Name"].ToString();
                }
                if (row["Address"] != null)
                {
                    model.Address = row["Address"].ToString();
                }
                if (row["Phone"] != null)
                {
                    model.Phone = row["Phone"].ToString();
                }
                if (row["Mail"] != null)
                {
                    model.Mail = row["Mail"].ToString();
                }
                if (row["UserStateId"] != null && row["UserStateId"].ToString() != "")
                {
                    model.UserStateId = int.Parse(row["UserStateId"].ToString());
                }
            }
            return model;
        }

        /// <summary>
        /// 获得数据列表
        /// </summary>
        public DataSet GetList(string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select Id,LoginId,LoginPwd,Name,Address,Phone,Mail,UserStateId ");
            strSql.Append(" FROM Users ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            return DbHelperSQL.Query(strSql.ToString());
        }

        /// <summary>
        /// 获得前几行数据
        /// </summary>
        public DataSet GetList(int Top, string strWhere, string filedOrder)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select ");
            if (Top > 0)
            {
                strSql.Append(" top " + Top.ToString());
            }
            strSql.Append(" Id,LoginId,LoginPwd,Name,Address,Phone,Mail,UserStateId ");
            strSql.Append(" FROM Users ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            strSql.Append(" order by " + filedOrder);
            return DbHelperSQL.Query(strSql.ToString());
        }

        /// <summary>
        /// 获取记录总数
        /// </summary>
        public int GetRecordCount(string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select count(1) FROM Users ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            object obj = DbHelperSQL.GetSingle(strSql.ToString());
            if (obj == null)
            {
                return 0;
            }
            else
            {
                return Convert.ToInt32(obj);
            }
        }
        /// <summary>
        /// 分页获取数据列表
        /// </summary>
        public DataSet GetListByPage(string strWhere, string orderby, int startIndex, int endIndex)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT * FROM ( ");
            strSql.Append(" SELECT ROW_NUMBER() OVER (");
            if (!string.IsNullOrEmpty(orderby.Trim()))
            {
                strSql.Append("order by T." + orderby);
            }
            else
            {
                strSql.Append("order by T.Id desc");
            }
            strSql.Append(")AS Row, T.*  from Users T ");
            if (!string.IsNullOrEmpty(strWhere.Trim()))
            {
                strSql.Append(" WHERE " + strWhere);
            }
            strSql.Append(" ) TT");
            strSql.AppendFormat(" WHERE TT.Row between {0} and {1}", startIndex, endIndex);
            return DbHelperSQL.Query(strSql.ToString());
        }
        /// <summary>
        /// 查询表中是否有该用户
        /// </summary>
        /// <param name="LoginId"></param>
        /// <returns></returns>
        public int ExistsByLoginId(string LoginId)
        {
            string sql = "select count(*) from Users where LoginId=" + LoginId;
            return Convert.ToInt32(DbHelperSQL.GetSingle(sql));
        }
        /*
        /// <summary>
        /// 分页获取数据列表
        /// </summary>
        public DataSet GetList(int PageSize,int PageIndex,string strWhere)
        {
            SqlParameter[] parameters = {
                    new SqlParameter("@tblName", SqlDbType.VarChar, 255),
                    new SqlParameter("@fldName", SqlDbType.VarChar, 255),
                    new SqlParameter("@PageSize", SqlDbType.Int),
                    new SqlParameter("@PageIndex", SqlDbType.Int),
                    new SqlParameter("@IsReCount", SqlDbType.Bit),
                    new SqlParameter("@OrderType", SqlDbType.Bit),
                    new SqlParameter("@strWhere", SqlDbType.VarChar,1000),
                    };
            parameters[0].Value = "Users";
            parameters[1].Value = "Id";
            parameters[2].Value = PageSize;
            parameters[3].Value = PageIndex;
            parameters[4].Value = 0;
            parameters[5].Value = 0;
            parameters[6].Value = strWhere;	
            return DbHelperSQL.RunProcedure("UP_GetRecordByPage",parameters,"ds");
        }*/

        #endregion  BasicMethod
        #region  ExtensionMethod

        #endregion  ExtensionMethod

        /// <summary>
        /// 登录查询
        /// </summary>
        /// <param name="loginID">登录id</param>
        /// <param name="pwd">密码</param>
        /// <returns></returns>
        public Maticsoft.Model.Users GetModel(string loginID, string pwd)
        {

            StringBuilder strSql = new StringBuilder();
            strSql.Append("select  Id,LoginId,LoginPwd,Name,Address,Phone,Mail,UserStateId from Users ");
            strSql.Append(" where LoginId=@loginId and LoginPwd=@pwd");
            SqlParameter[] parameters = {
					new SqlParameter("@loginId", loginID),
                    new SqlParameter("@pwd",pwd)
			};

            Maticsoft.Model.Users model = new Maticsoft.Model.Users();
            DataSet ds = DbHelperSQL.Query(strSql.ToString(), parameters);
            if (ds.Tables[0].Rows.Count > 0)
            {
                return DataRowToModel(ds.Tables[0].Rows[0]);
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// 找回密码
        /// </summary>
        /// <param name="telphone">手机号</param>
        /// <param name="pwd">新密码</param>
        /// <returns></returns>
        public bool Update(string telphone, string pwd)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update Users set ");
            strSql.Append("LoginPwd=@LoginPwd");
            strSql.Append(" where LoginId=@loginId");
            SqlParameter[] parameters = {
					new SqlParameter("@LoginPwd", pwd),
					
					new SqlParameter("@LoginId", telphone)
                                        };

            int rows = DbHelperSQL.ExecuteSql(strSql.ToString(), parameters);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
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
            string sql = "update Users set Name=@name,Address=@address,Mail=@mail where Id=@userId";
            SqlParameter[] sp = { 
                                    new SqlParameter("@name",name),
                                    new SqlParameter("@address",address),
                                    new SqlParameter("@mail",email),
                                    new SqlParameter("@userId",userId)
                                };
            int rows = DbHelperSQL.ExecuteSql(sql, sp);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 修改用户电话
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="telphone"></param>
        /// <returns></returns>
        public bool Update(int userId, string telphone)
        {
            string sql = "update Users set phone=@phone where Id=@userId";
            SqlParameter[] sp = { 
                                    new SqlParameter("@phone",telphone),
                                    new SqlParameter("@userId",userId)
                                };
            int rows = DbHelperSQL.ExecuteSql(sql, sp);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        /// <summary>
        /// 修改用户密码
        /// </summary>
        public bool UpdatePwd(int userId, string pwd) 
        {
            string sql = "update Users set LoginPwd=@pwd where Id=@userId";
            SqlParameter[] sp = { 
                                    new SqlParameter("@pwd",pwd),
                                    new SqlParameter("@userId",userId)
                                };
            int rows = DbHelperSQL.ExecuteSql(sql, sp);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        /// <summary>
        /// 修改邮箱
        /// </summary>
        /// <param name="p">用户编号</param>
        /// <param name="email">邮箱</param>
        /// <returns></returns>
        public bool UpdateEmail(int p, string email)
        {
            string sql = "update Users set Mail=@mail where Id=@userId";
            SqlParameter[] sp = { 
                                    new SqlParameter("@mail",email),
                                    new SqlParameter("@userId",p)
                                };
            int rows = DbHelperSQL.ExecuteSql(sql, sp);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 根据用户名查用户的密码
        /// </summary>
        /// <param name="loginID"></param>
        /// <returns></returns>
        public string GetModel(string loginID)
        {
            string sql = "select LoginPwd from Users where LoginID=@loginID";
            SqlParameter[] sp = { 
                                    new SqlParameter("@loginID",loginID)
                                };
            return DbHelperSQL.GetSingle(sql, sp).ToString();
        }
    }
}

