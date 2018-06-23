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
    public partial class ArticleShow : System.Web.UI.Page
    {
        public SqlConnection conn = new SqlConnection(ConfigurationSettings.AppSettings["ConStr"]);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string ST_sql = "select * from ST_news where ST_n_id=" + Request.QueryString["id"] + "";
                conn.Open();
                SqlDataAdapter da = new SqlDataAdapter(ST_sql, conn);
                DataSet ds = new DataSet();
                da.Fill(ds);
                NewsShow.DataSource = ds.Tables[0];
                NewsShow.DataBind();
                ST_UpdateHit();
            }
        }

        protected void btnIdea_Click(object sender, EventArgs e)
        {
            if (r_nick.Text.Trim() == "" || r_title.Text.Trim() == "" || txtContent.Text.Trim() == "")
            {
                Response.Write("<div align=center><li>昵称,标题,内容不能为空!</li><li><a href=javascript:history.back()>点此返回</a>");
                Response.End();
            }
            else
            {
                string ST_sql = "insert into ST_replay (ST_r_nick,ST_r_title,ST_r_content,ST_r_date,ST_n_id) values ('" + r_nick.Text + "','留言标题【" + r_title.Text + "】','留言内容：" + txtContent.Text + "','" + System.DateTime.Now + "'," + Request.QueryString["id"] + ")";
                conn.Open();
                SqlCommand com = new SqlCommand(ST_sql, conn);
                if (Convert.ToInt32(com.ExecuteNonQuery()) > 0)
                {
                    Response.Write("<script language=javascript>alert('评论成功！');location='ArticleShow.aspx'</script>");
                    this.r_title.Text = r_title.Text = txtContent.Text = "";
                    /*更新回复数*/
                    ST_add_Re();
                    Response.Redirect("ArticleShow.aspx?id=" + Request.QueryString["id"] + "");
                }
                else
                {
                    Response.Write("<script language=javascript>alert('评论失败！')</script>");
                }
            }
            conn.Close();
        }     
        public void ST_UpdateHit()
        {
            string ST_up_sql = "update ST_news set ST_n_hit=ST_n_hit+1 where ST_n_id=" + Request.QueryString["id"] + "";
            ExceSQL(ST_up_sql);
        }
        public void ST_add_Re()
        {
            string ST_up_sql = "update ST_news set ST_n_re=ST_n_re+1 where ST_n_id=" + Request.QueryString["id"] + "";
            ExceSQL(ST_up_sql);
        }
        public void ST_get_Replay()
        {
            string sqlstr = "select * from ST_replay where ST_n_id=" + Request.QueryString["id"] + "";
            conn.Open();
            SqlCommand com = new SqlCommand(sqlstr, conn);
            SqlDataReader mydr = com.ExecuteReader();
            while (mydr.Read())
            {
                Response.Write("<tr height=25><td bgcolor=eeeeee><div align=center><font style='FONT-SIZE: 12px' color=red>" + mydr[2].ToString() + "</font></div></td></tr><tr height=30><td><font style='FONT-SIZE: 12px'>" + mydr[3].ToString() + "</font></td></tr><tr><td bgcolor=f8f8f8><div align=right><font style='FONT-SIZE: 12px'>" + mydr[1].ToString() + "评论于" + mydr[4].ToString() + "</font></div></td></tr>");
            }
            Response.Write("</table>");
            mydr.Close();
            conn.Close();
        }
        public bool ExceSQL(string strSqlCom)
        {
            SqlCommand sqlcom = new SqlCommand(strSqlCom, conn);
            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                { conn.Open(); }
                sqlcom.ExecuteNonQuery();
                return true;
            }
            catch
            {
                return false;
            }
            finally
            {
                conn.Close();
            }
        }

    }
}
