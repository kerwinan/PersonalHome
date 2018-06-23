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

namespace Design
{
    public partial class PerHomeMessage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                {
                    Response.Redirect("UserRegister.aspx");
                }
                string userName = Session["username"].ToString();
                string strsql = "select PerHomeGongGao from PerHomeDetail where PerHomeUser='" + userName + "'";
                SqlConnection conn = new SqlConnection(ConfigurationSettings.AppSettings["ConStr"]);
                conn.Open();
                SqlCommand comm = new SqlCommand(strsql, conn);
                SqlDataReader dr = comm.ExecuteReader();
                if (dr.Read())
                {
                    this.TextBox1.Text = dr["PerHomeGongGao"].ToString();
                }
                dr.Close();
                conn.Close();
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            string perhomemessage = this.TextBox1.Text.ToString();
            string userName = Session["username"].ToString();
            string sql = "update PerHomeDetail set PerHomeGongGao='" + perhomemessage + "' where PerHomeUser='" + userName + "'";
            SqlConnection conn = new SqlConnection(ConfigurationSettings.AppSettings["ConStr"]);
            SqlCommand comm = new SqlCommand(sql, conn);
            conn.Open();
            if (Convert.ToInt32(comm.ExecuteNonQuery()) > 0)
            {
                Response.Write("<script>alert('添加成功！')</script>");
                this.TextBox1.Text = "";
            }
            else
            {
                Response.Write("<script>alert('添加失败！')</script>");
            }
            conn.Close();
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            this.TextBox1.Text = "";
        }
    }
}
