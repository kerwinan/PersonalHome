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
    public partial class _Default : System.Web.UI.Page
    {
        public SqlConnection sqlcon = new SqlConnection(ConfigurationSettings.AppSettings["ConStr"]);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                /*检索日志中的前10条，降序*/
                string sqlstr1 = "select top 10 * from ST_news order by ST_n_id desc";
                DataSet myds1 = GetDataSet(sqlstr1, "ST_news");
                ArtDetailList.DataSource = myds1;
                ArtDetailList.DataBind();
                /*检索空间信息中的前5条，降序*/
                string sqlstr2 = "select top 5 * from PerHomeDetail order by PerHomeId desc";
                DataSet myds2 = GetDataSet(sqlstr2, "PerHomeDetail");
                PerHomeList.DataSource = myds2;
                PerHomeList.DataBind();
            }
            Label3.Text = "您是该网站的第[" + Application["count"].ToString() + "]访问者!";
        }
        public DataSet GetDataSet(string SqlCom, string tablename)
        {
            try /*保护*/
            {
                sqlcon.Open();
                SqlCommand sqlcom = new SqlCommand(SqlCom, sqlcon);
                SqlDataAdapter sqldata = new SqlDataAdapter();
                sqldata.SelectCommand = sqlcom;
                DataSet ds = new DataSet();
                sqldata.Fill(ds, tablename);
                return ds;
            }
            finally/*完善*/
            {
                sqlcon.Close();
            }
        }
    }
}
