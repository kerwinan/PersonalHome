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
    public partial class Art_Manage : System.Web.UI.Page
    {
        public SqlConnection mycon = new SqlConnection(ConfigurationManager.AppSettings["ConStr"]);
        private static string MyID;
        protected void Page_Load(object sender, EventArgs e)
        {
            string sqlstr = "select * from Users where UserName='" + Session["username"] + "'";
            SqlDataAdapter myda = new SqlDataAdapter(sqlstr, mycon);
            DataSet myds = new DataSet();
            myda.Fill(myds, "Users");
            DataRowView mydrv = myds.Tables["Users"].DefaultView[0];
            MyID = mydrv["UserID"].ToString();
            Article_Bind();
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            bool delete = ExceSQL("delete from ST_news where ST_n_id='" + GridView1.DataKeys[e.RowIndex].Value + "'");
            if (delete)
            {
                Response.Write("<script language=javascript>alert('删除成功！');location='Art_Manage.aspx'</script>");
                Article_Bind();
            }
            else
            {
                Response.Write("<script language=javascript>alert('删除失败！')</script>");
                return;
            }
        }
        public void Article_Bind()
        {
            /*根据获取的用户MyID查询其所有文章*/
            string sqlstr = "select * from ST_news where UserID='" + MyID + "'";
            SqlDataAdapter myda = new SqlDataAdapter(sqlstr, mycon);
            DataSet myds = new DataSet();
            mycon.Open();
            myda.Fill(myds, "ST_news");
            GridView1.DataSource = myds;
            /*获取GridView控件中的主键字段*/
            GridView1.DataKeyNames = new string[] { "ST_n_id" };
            GridView1.DataBind();
            mycon.Close();
        }
        public bool ExceSQL(string strSqlCom)
        {
            SqlCommand sqlcom = new SqlCommand(strSqlCom, mycon);
            try
            {
                if (mycon.State == System.Data.ConnectionState.Closed){
                    mycon.Open(); 
                }
                sqlcom.ExecuteNonQuery();
                return true;
            }
            catch
            {
                return false;
            }
            finally
            {
                mycon.Close();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string search = this.ddlSearch.SelectedValue;
            switch (search)
            {
                /*根据文章编号进行模糊查询*/
                case "日志编号":
                    BindData(this.GridView1, "select * from ST_news where ST_n_id  Like  '%" + this.txtKey.Text + "%' and UserID='" + MyID + "'");
                    break;
                /*根据文章主题进行模糊查询*/
                case "日志标题":
                    BindData(this.GridView1, "select * from ST_news where ST_n_title  Like  '%" + this.txtKey.Text + "%' and UserID='" + MyID + "'");
                    break;
                default:
                    Response.Write("<script lanuage=javascript>alert('查询失败！');location='javascript:history.go(-1)'</script>");
                    break;
            }
        }
        public bool BindData(GridView dl, string SqlCom)
        {
            mycon.Open();
            SqlCommand sqlcom = new SqlCommand(SqlCom, mycon);
            SqlDataAdapter sqldata = new SqlDataAdapter();
            sqldata.SelectCommand = sqlcom;
            DataSet ds = new DataSet();
            /*填充数据集*/
            sqldata.Fill(ds);
            dl.DataSource = ds;
            try
            {
                dl.DataBind();
                return true;
            }
            catch
            {
                return false;
            }
            finally
            {
                mycon.Close();
            }
        }

        protected void btbReturn_Click(object sender, EventArgs e)
        {
            Article_Bind();
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.Cells[1].Text).Length > 5)
                {
                    e.Row.Cells[1].Text = (e.Row.Cells[1].Text).Substring(0, 5) + "…";
                }
                ((LinkButton)e.Row.Cells[5].Controls[0]).Attributes.Add("onclick", "return confirm('确定要删除吗?')");
            }
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            Article_Bind();
        }

    }
}
