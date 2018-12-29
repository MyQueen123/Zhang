using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// config 的摘要说明
/// </summary>
public class config
{
    public config()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }
    // 应用ID,您的APPID
    public static string app_id = "2016091700530988";

    // 支付宝网关
    public static string gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // 商户私钥，您的原始格式RSA私钥
    public static string private_key = "MIIEowIBAAKCAQEAnI7tzjpgbND6ThYj8x0LHWrUgDgLyfLI43vjX0u+YaunQhowK2uQ6PftXQryGLt7fM8IdEQg6IASrX5RaKr3OIPtPpIQj85cltMUSgW69oA906EuR+G8aNCyMvl+4X7vUveJqnrc4uI4pW+T2YkLMKA3fpiATeplT6VUX3/VC6IpKZyiMndmOTn8k8ncttFLoNa5/55JuIVQpjMY7C4RrsuYi4DvmGpMY/aUa2/dwbbBs7SOUuWJpSNMuaV45uFBG2nb6br6yLqQsKkk/+r7T3uRyiWdU7BZc4O0JzLg+NqpCnRJ9U21vtC+OqfQnOyeV+9oy+nuYSz4kQaS6KaLrQIDAQABAoIBAQCEuE41FBwGY6quY+qaALcZeyUmhVzJGL7gynfYo5eDqUcjrJvFU20HcpaQ1+Sgvt9S0RgzqEXVlC1BUuKkvrrR+FU5RA4yOxkW61452l3C9rhzHiLj4SQeHz3SJNxBQaCVTzAvi/SRioHHDa3jLmCEGm6xLYsnglvchyXdx7rOHpkNLvCxbAzzp1TCK5sDJeRYIixAufrtwJ2/zMy0PjImysjvDQyQljLkmn+QUq42XRw4VyT8YQ1e0epzsiI/21hdJXVSukqLWRepCaZV/KYGGESvXze5EixEcLdoDuhYg+KkGz2NjZNOIReS2/VAZcX6LwCzTG5X1gHv5HW0EpepAoGBAMzNfneZ2HpCNJB4rk0qJKvDlJAE2U2OIrMyHxjuqJtAo8hPG7FEF+2QBtif+cxwx7M5167EmzzSH5HqeDKeErlaKSW67dtrP+ZnYVvJLJbZQ3JZaO2eXySt/BBTvEJ/l1xSmuUsUORHqzFvYaNbBHrfDz8PazqUkHAeRajS9ITjAoGBAMOx/3z9uxnvBU9POFz9Qc8RAsb//ANPExiSZRhJezjnBd+nhIOFkP4nEF1/POadkInph/Rk/FsSefgan0pGWRqq6j1UIqo+7l8dMjlxajU6e36TGjqTpNc4pYImD7At87Ve2HSMoSM1h6IG6Q/ZThkh6athQV1wTnNHzpxSNCIvAoGAIb2VIUUiSfoQSODo7mOMCRQ+rH9wAXvyMY2HXActle5PTVfjGxA51PSOfC/W6pyF+fwEkZFoddu0QcjcJpKuSQUWlFW4jBaeP2o2uvVouC1xFCywwbz+tb9IMLRq5pW4rQga5rinVwSLqqhL8Kq1ET0geOYkZ1FEfoQuO8MNb7sCgYAtpDUXPMJHgSS2454cqgCQP8JrEUcAqo+kmngzmue/VLpc+GACoMM5U3kQpV1Z2APe9nV7/ZWR1BRYVjUyiIe9nYE2Poo7NKQ50MBm/1mrAnHNCpgCc27tt0t6uE/OYllFwtIvFKF8ab6xfnUa+i6p0+wAyZUKKuhRIL1CXjXEhwKBgGYmH0ju2Dzpoot9A0ABTMO2naLrClRPwFI21F1c/U20uDllgsRGKj3cREtRp14tSJnVeOfaGuYpGb6bDUIrMfDEj6ib/cr9MDtKnXEZI6zjebsGHeAxdfwtMaXLksdTn44LuEsK1FDRKRYqTvRkhbViS+mC8at79faYMz39gWPM";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static string alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAnI7tzjpgbND6ThYj8x0LHWrUgDgLyfLI43vjX0u+YaunQhowK2uQ6PftXQryGLt7fM8IdEQg6IASrX5RaKr3OIPtPpIQj85cltMUSgW69oA906EuR+G8aNCyMvl+4X7vUveJqnrc4uI4pW+T2YkLMKA3fpiATeplT6VUX3/VC6IpKZyiMndmOTn8k8ncttFLoNa5/55JuIVQpjMY7C4RrsuYi4DvmGpMY/aUa2/dwbbBs7SOUuWJpSNMuaV45uFBG2nb6br6yLqQsKkk/+r7T3uRyiWdU7BZc4O0JzLg+NqpCnRJ9U21vtC+OqfQnOyeV+9oy+nuYSz4kQaS6KaLrQIDAQAB";

    // 签名方式
    public static string sign_type = "RSA2";

    // 编码格式
    public static string charset = "UTF-8";
}