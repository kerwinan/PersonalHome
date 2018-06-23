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
    public partial class AddPerArt : System.Web.UI.Page
    {
        string strUserName;
        public SqlConnection mycon = new SqlConnection(ConfigurationManager.AppSettings["ConStr"]);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("UserRegister.aspx");
            }
            else
            {
                strUserName = Session["username"].ToString();
            }
            this.txtArtictor.Text = strUserName;
            string sqlstr = "select * from ST_Class";
            SqlCommand mycom = new SqlCommand(sqlstr, mycon);
            mycon.Open();
            SqlDataReader dr = mycom.ExecuteReader();
            while (dr.Read())
            {
                DropDownList1.Items.Add(new ListItem(dr["ST_c_name"].ToString(), dr["ST_c_id"].ToString()));
            }
            dr.Close();
            mycon.Close();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string ID;
            string sqlstr = "select * from Users where UserName='" + Session["username"] + "'";
            SqlDataAdapter myda = new SqlDataAdapter(sqlstr, mycon);
            DataSet myds = new DataSet();
            myda.Fill(myds, "Users");
            DataRowView mydrv = myds.Tables["Users"].DefaultView[0];
            /*将用户ID存储到ST_news表中,区分各注册会员发表的日志*/
            ID = mydrv["UserID"].ToString();
            /*插入新日志信息*/
            string instertsql = "insert into ST_news(ST_n_title,ST_n_author,ST_n_key,ST_n_content,ST_c_id,UserID) values('" + this.txtSubject.Text + "','" + this.Session["UserName"].ToString() + "','" + this.txtSummary.Text + "','" + this.article_context.Text.ToString() + "','" + this.DropDownList1.SelectedValue + "','" + ID + "')";
            mycon.Open();
            SqlCommand com = new SqlCommand(instertsql, mycon);
            if (Convert.ToInt32(com.ExecuteNonQuery()) > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<Script>alert('添加日志成功！')</Script>");
                this.txtSubject.Text = txtArtictor.Text = txtSummary.Text = article_context.Text = "";
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<Script>alert('请正确填写日志信息！')</Script>");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            this.txtSubject.Text = txtArtictor.Text = txtSummary.Text = article_context.Text = "";
        }

        protected void btnCancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home_Manage.aspx");
        }
    }
}
