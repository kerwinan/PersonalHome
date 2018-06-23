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
    public partial class ViewContent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    string str2 = Page.Request["id"].ToString();
                    /*将数据绑定到前台*/
                    SqlConnection mycon = new SqlConnection(ConfigurationSettings.AppSettings["ConStr"].ToString());
                    mycon.Open();
                    SqlDataAdapter myada = new SqlDataAdapter("select * from ST_news where ST_n_id='" + str2 + "'", mycon);
                    DataSet ds = new DataSet();
                    myada.Fill(ds, "ST_news");
                    DataRowView rowview = ds.Tables["ST_news"].DefaultView[0];
                    this.labSubject.Text = rowview["ST_n_title"].ToString();
                    this.txtContent.Text = rowview["ST_n_content"].ToString();
                    mycon.Close();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string id = Request["id"].ToString();
            string sqlCom = "update ST_news set ST_n_content='" + this.txtContent.Text + "' where ST_n_id='" + id + "'";
            SqlConnection sqlcon = new SqlConnection(ConfigurationSettings.AppSettings["ConStr"].ToString());
            sqlcon.Open();
            SqlCommand mycom = new SqlCommand(sqlCom, sqlcon);
            if (Convert.ToInt32(mycom.ExecuteNonQuery()) > 0)
            {
                Response.Write("<script language=javascript>alert('修改成功！');location='Art_Manage.aspx'</script>");
            }
            else
            {
                Response.Write("<script language=javascript>alert('修改失败！');</script>");
                return;
            }
            sqlcon.Close();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Art_Manage.aspx");
        }
    }
}
