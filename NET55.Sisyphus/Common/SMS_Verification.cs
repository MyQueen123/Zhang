using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace Common
{
    public class SMS_Verification
    {
        public string VerCode(string ret,string yan)
        {
            String userName = "offender";
            String key = "67A8FB15F4EF02736171EA7576B5733A";
            String mobileNos = ret;


            String content = "您的验证码是：" + yan + "  请不要把验证码泄露给其他人，该验证号码有效时间为1分钟";
            string url = "https://api.smschn.cn/";
            string post = string.Format("user={0}&key={1}&mobile={2}&content={3}", userName, key, mobileNos, content);
            PostData(url, post);
            return yan;
        }

        public static string PostData(string posturl, string postData)
        {
            //ServicePointManager.ServerCertificateValidationCallback = (sender, certificate, chain, sslPolicyErrors) => true;
            Stream outstream = null;
            Stream instream = null;
            StreamReader sr = null;
            HttpWebResponse response = null;
            HttpWebRequest request = null;
            Encoding encoding = Encoding.GetEncoding("utf-8");
            byte[] data = encoding.GetBytes(postData);
            // 准备请求...
            try
            {
                //ServicePointManager.SecurityProtocol = SecurityProtocolType.Ssl3;
                //ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;
                // 设置参数

                //ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
                request = WebRequest.Create(posturl) as HttpWebRequest;
                CookieContainer cookieContainer = new CookieContainer();
                request.CookieContainer = cookieContainer;
                request.AllowAutoRedirect = true;
                request.Method = "POST";

                request.ContentType = "application/x-www-form-urlencoded";
                request.ContentLength = data.Length;
                outstream = request.GetRequestStream();
                outstream.Write(data, 0, data.Length);
                outstream.Close();
                //发送请求并获取相应回应数据
                response = request.GetResponse() as HttpWebResponse;
                //直到request.GetResponse()程序才开始向目标网页发送Post请求
                instream = response.GetResponseStream();
                sr = new StreamReader(instream, encoding);
                //返回结果网页（html）代码
                string content = sr.ReadToEnd();
                string err = string.Empty;
                return content;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
    }
}
