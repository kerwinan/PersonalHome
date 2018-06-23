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
using System.IO;
using System.Drawing;
using System.Data.SqlClient;

namespace Design
{
    public partial class UserHomeLogo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String requestID = Request.QueryString["id"].ToString();
            SqlConnection conn = new SqlConnection(ConfigurationSettings.AppSettings["ConStr"]);
            string strsql = "select * from [PerHomeDetail] where PerHomeId=" + requestID;
            SqlCommand mycomm = new SqlCommand(strsql, conn);
            conn.Open();
            SqlDataReader dr = mycomm.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    byte[] imgdata = (byte[])dr["PerHomeLogo"];
                    Response.BinaryWrite(imgdata);
                }
            }
            dr.Close();
            conn.Close();
        }
    }
}
