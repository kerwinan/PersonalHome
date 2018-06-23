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
using System.Text.RegularExpressions;

namespace Design
{
    public partial class UserRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                /*屏蔽掉用户输入的非法字符，只能输入数字、字母、下划线*/
                tbUserName.Attributes["onkeyup"] = "value=value.replace(/[^\\w+$]/g,'')";
            }
        }


        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (isName(tbUserName.Text))
            {
                labIsName.Text = "用户名已存在！";
                labIsName.ForeColor = System.Drawing.Color.Red;
                ClientScript.RegisterStartupScript(this.GetType(), "", "<Script>alert('请正确填写信息！')</Script>");
                
            }
            else
            {
                string username;
                /*MD5对密码加密*/
                string MdPswdStr = FormsAuthentication.HashPasswordForStoringInConfigFile(tbPassword.Text.ToString(), "MD5");
                username = tbUserName.Text.ToString();
                string password = MdPswdStr;
                string useremail = tbEmail.Text.ToString();
                string sex = "";
                if (radlistSex.SelectedValue.Trim() == "男")
                {
                    sex = "男";
                }
                else
                {
                    sex = "女";
                }
                string PassQuestion = txtPassQuestion.Text;
                string PassAnswer = txtPassAnswer.Text;
                if (!isName(tbUserName.Text))
                {
                    SqlConnection conn = new SqlConnection(ConfigurationSettings.AppSettings["ConStr"].ToString());
                    conn.Open();
                    string strsql = "insert into Users(UserName,UserSex,Password,Email,PassQuestion,PassAnswer) values( '" + username + "','" + sex + "','" + password + "','" + useremail + "','" + PassQuestion + "','" + PassAnswer + "')";
                    SqlCommand cmd = new SqlCommand(strsql, conn);
                    if (Convert.ToInt32(cmd.ExecuteNonQuery()) > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "", "<Script>alert('恭喜您，注册成功……')</Script>");
                        tbUserName.Text = tbPassword.Text = tbEmail.Text = tbPasswordStr.Text = "";
                        labIsName.Text = "";
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "", "<Script>alert('请正确填写信息！')</Script>");

                    }
                    conn.Close();
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<Script>alert('用户名不能为空！')</Script>");
                }
            }
        }

        protected void imgbtnCheck_Click(object sender, ImageClickEventArgs e)
        {
            if (tbUserName.Text == "")
            {
                labIsName.Text = "用户名不能为空";
                labIsName.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                if (isName(tbUserName.Text))
                {
                    labIsName.Text = "用户名已存在！";
                    labIsName.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    labIsName.Text = "可以注册！";
                    labIsName.ForeColor = System.Drawing.Color.Blue;
                }
            }
        }
        protected bool isName(string username)
        {
            string sqlstr = "select count(*) from Users where UserName = '" + username + "'";
            SqlConnection conn = new SqlConnection(ConfigurationSettings.AppSettings["ConStr"].ToString());
            conn.Open();
            SqlCommand cmd = new SqlCommand(sqlstr, conn);
            if (Convert.ToInt32(cmd.ExecuteScalar()) > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

    }
}
