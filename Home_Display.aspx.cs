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
using System.IO;

namespace Design
{
    public partial class Home_Display : System.Web.UI.Page
    {
        public string PerHomeID = "0";
        public string PerHomeName;
        public string PerHomeUser;
        public string PerHomeTime;
        public string PerHomeGongGao;
        public string loopId;
        public string str;
        public SqlConnection conn = new SqlConnection(ConfigurationSettings.AppSettings["ConStr"]);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] == null || Request.QueryString["id"] == string.Empty)
            {
                Response.Write("<srcipt language='javasrictp'>alert('对不起！没有这个空间！！')</script>");
                return;
            }
            if (!IsPostBack)
            {
                PerHomeID = Request.QueryString["id"].ToString();
                imgLogo.ImageUrl = "UserHomeLogo.aspx?id=" + PerHomeID;
                string strsql = "select * from PerHomeDetail where PerHomeId=" + PerHomeID;
                conn.Open();
                SqlCommand comm = new SqlCommand(strsql, conn);
                SqlDataReader mydr = comm.ExecuteReader();
                if (mydr.Read())
                {
                    PerHomeName = mydr["PerHomeName"].ToString();
                    PerHomeUser = mydr["PerHomeUser"].ToString();
                    PerHomeGongGao = mydr["PerHomeGongGao"].ToString();
                    PerHomeTime = mydr["PerHomeTime"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('没有这个空间！')</script>");
                    return;
                }
                mydr.Close();
                conn.Close();
                /*绑定日志类别*/
                string myTitleClass = "select ST_c_id, ST_c_name from ST_class order by ST_date desc";
                TitleClass(myTitleClass);
                /*绑定新日志*/
                string sqlstr = "select top 10* from ST_news where ST_n_author='" + PerHomeUser + "' order by ST_n_id desc";
                SqlDataAdapter adapter = new SqlDataAdapter(sqlstr, conn);
                DataSet ds = new DataSet();
                conn.Open();
                adapter.Fill(ds, "ST_news");
                NewsList.DataSource = ds;
                NewsList.DataKeyNames = new string[] { "ST_n_id" };
                NewsList.DataBind();
            }
        }
        public void TitleClass(string sqlstr)
        {
            SqlConnection myconn = new SqlConnection(ConfigurationSettings.AppSettings["ConStr"].ToString());
            myconn.Open();
            SqlDataAdapter myda = new SqlDataAdapter(sqlstr, myconn);
            DataSet myds = new DataSet();
            myda.Fill(myds);
            ClassList.DataSource = new DataView(myds.Tables[0]);
            ClassList.DataBind();
        }
        protected void NewsList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            NewsList.PageIndex = e.NewPageIndex;
            NewsList.DataBind();
        }
    }
}
