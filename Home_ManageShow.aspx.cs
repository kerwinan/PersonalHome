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
    public partial class Home_ManageShow : System.Web.UI.Page
    {
        public string strWelName = "";
        public string strMyPerHome = "";
        public string strperhomeID = "";
        public string strperhome = "";
        public SqlConnection conn = new SqlConnection(ConfigurationSettings.AppSettings["ConStr"]);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Write("对不起，您还没登陆！<br>");
                Response.End();
            }
            if (!IsPostBack)
            {
                strWelName = "欢迎您, " + Session["username"].ToString();
                String mysql = "select * from PerHomeDetail where PerHomeUser='" + Session["username"].ToString() + "'";
                SqlCommand comm = new SqlCommand(mysql, conn);
                conn.Open();
                SqlDataReader dr = comm.ExecuteReader();
                if (dr.Read())
                {
                    strperhomeID = dr["PerHomeId"].ToString();
                    strMyPerHome = "<a href='Home_Display.aspx?id=" + strperhomeID + "' target=_blank>http://localhost/PerHomeWeb/" + "Home_Display.aspx?id=" + strperhomeID + "</a>";
                    strperhome = "<a href='Home_Display.aspx?id=" + strperhomeID + "' target=_blank>查看我的空间</a>";
                }
                dr.Close();
                conn.Close();
            }
        }
    }
}
