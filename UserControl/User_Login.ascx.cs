using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

namespace Design.UserControl
{
    public partial class User_Login : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void imgbtnEnter_Click(object sender, ImageClickEventArgs e)
        {
            if (Session["CheckCode"].ToString().ToLower() != Validator.Text.Trim().ToLower())
            {
                lblMessage.Text = "验证码错误！";
            }
            else
            {
                string username;
                string password;
                string MdPswdStr = FormsAuthentication.HashPasswordForStoringInConfigFile(UserPwd.Text.ToString(), "MD5");
                username = UserName.Text.ToString();
                password = MdPswdStr;
                if (username.Equals("") || password.Equals(""))
                {
                    Response.Write("<script language=javascript>alert('会员名和密码不能为空！');location='javascript:history.go(-1)'</script>");
                }
                SqlConnection myconn = new SqlConnection(ConfigurationSettings.AppSettings["ConStr"].ToString());
                string strsql = "select * from Users where UserName=@name and PassWord=@pass";
                myconn.Open();
                SqlCommand comm = new SqlCommand(strsql, myconn);
                comm.Parameters.Add(new SqlParameter("name", SqlDbType.NVarChar, 50));
                comm.Parameters["name"].Value = username;
                comm.Parameters.Add(new SqlParameter("pass", SqlDbType.NVarChar, 50));
                comm.Parameters["pass"].Value = password;
                SqlDataReader dr = comm.ExecuteReader();
                if (dr.Read())
                {
                    Session["username"] = username;
                    string sql = "select count(*) from PerHomedetail where PerHomeUser='" + username + "'";
                    DBConnection mydb = new DBConnection();
                    if (mydb.ExecScalar(sql) > 0)
                    {
                        Response.Redirect("./Home_Manage.aspx");
                    }
                    else
                    {
                        Response.Redirect("./CreatPerHome.aspx");
                    }
                }
                else
                {
                    Response.Write("<script language=javascript>alert('您输入的会员名或密码有错！请重新输入！');location='javascript:history.go(-1)'</script>");
                }
                dr.Close();
                myconn.Close();
            }
        }
    }
}