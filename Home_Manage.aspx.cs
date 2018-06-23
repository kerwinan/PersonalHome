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
    public partial class Home_Manage : System.Web.UI.Page
    {
        public string PerHomeInfo = "";
        public string perhomeID = "";
        public string myperhome;
        public string CreatePerHome;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("UserRegister.aspx");
            }
            if (!IsPostBack)
            {
                /*根据登录名查找个人空间*/
                String mysql = "select * from PerHomeDetail where PerHomeUser='" + Session["username"].ToString() + "'";
                SqlConnection conn = new SqlConnection(ConfigurationSettings.AppSettings["ConStr"]);
                conn.Open();
                SqlCommand comm = new SqlCommand(mysql, conn);
                SqlDataReader dr = comm.ExecuteReader();
                /*动态地生成后台管理首页中的链接*/
                if (dr.Read())
                {
                    perhomeID = dr["PerHomeId"].ToString();
                    myperhome = "<a href='Home_Display.aspx?id=" + perhomeID + "' target=_blank class=bb>[空间]查看我的空间</a>";
                    CreatePerHome = "免费升级";
                    PerHomeInfo = "<TR><TD><FONT color=#cccccc>@</FONT></TD>\n";
                    PerHomeInfo += "<TD align=left><A class=bb>个人档案</A></TD></TR>\n";
                    PerHomeInfo += "<TR><TD><FONT color=#cccccc>@</FONT></TD>\n";
                    PerHomeInfo += "<TD align=left><a href=\"PerHomeMessage.aspx\" target=myhome_list class=bb>[空间]写心情！</a></TD>\n";
                    PerHomeInfo += "</TR>\n";
                }
                else
                {
                    myperhome = "[空间]查看我的空间";
                    CreatePerHome = "<A href='' target=myhome_list >免费开通会员！</A>";
                }
                dr.Close();
                conn.Close();
            }
        }
    }
}
