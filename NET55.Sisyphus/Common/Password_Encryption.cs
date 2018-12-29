using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace Common
{
    public class Password_Encryption
    {
        public static string Md5(string str)
        {
            string s = "";
            MD5 md = MD5.Create();
            //将字符串转化为二进制数组
            byte[] bt = Encoding.UTF8.GetBytes(str);
            //加密
            byte[] btnews = md.ComputeHash(bt);
            //将加密后得二进制数组变为字符串
            for (int i = 0; i < btnews.Length; i++)
            {
                s = s + btnews[i].ToString("X2");
            }
            return s;
        }
    }
}
