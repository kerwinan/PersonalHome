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
    public partial class Home_List : System.Web.UI.Page
    {
        public static int ZhongPage;
        public int DangQianPage;
        public int MRNum;
        public int MeiYiPage;
        public SqlConnection conn = new SqlConnection(ConfigurationSettings.AppSettings["ConStr"]);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String sql = "select * from PType where parentId=0";
                SqlCommand comm = new SqlCommand(sql, conn);
                conn.Open();
                SqlDataReader dr = comm.ExecuteReader();
                Repeater1.DataSource = dr;
                Repeater1.DataBind();
                dr.Close();
                conn.Close();
                string mysql = "";
                string strID = "0";
                if (Request.QueryString["categoryid"] != null)
                {

                    strID = Request.QueryString["categoryid"].ToString();
                    if (strID.Equals("0"))
                    {
                        mysql = "SELECT * FROM PerHomeDetail";
                    }
                    else
                    {
                        mysql = "SELECT * FROM PerHomeDetail where PerHomeClass=" + strID;
                    }
                }
                else
                {
                    mysql = "SELECT * FROM PerHomeDetail";
                }
                SqlDataAdapter da = new SqlDataAdapter(mysql, conn);
                DataSet ds = new DataSet();
                da.Fill(ds, "Table");
                /*创建分页类*/
                PagedDataSource ObjectPage = new PagedDataSource();
                ObjectPage.DataSource = ds.Tables["Table"].DefaultView;
                /*设置分页*/
                ObjectPage.AllowPaging = true;
                ObjectPage.PageSize = 10;
                if (Request.QueryString["Page"] != null)
                {
                    DangQianPage = Convert.ToInt32(Request.QueryString["Page"]);
                    DangQianPage = Math.Min(DangQianPage, ObjectPage.PageCount);
                    DangQianPage = Math.Max(DangQianPage, 1);
                }
                else
                {
                    DangQianPage = 1;
                }
                /*取得当前页码*/
                ObjectPage.CurrentPageIndex = DangQianPage - 1;
                ZhongPage = ObjectPage.PageCount;
                MRNum = ObjectPage.DataSourceCount;
                MeiYiPage = ObjectPage.Count;
                lblCurPage.Text = "第" + DangQianPage.ToString() + "/" + ZhongPage.ToString() + "页";
                lblTnum.Text = "共：" + MRNum.ToString() + "条记录";
                lblEachPage.Text = "每页有: " + MeiYiPage.ToString() + " 条记录";
                if (ObjectPage.CurrentPageIndex != 0)
                    lnkFirst.NavigateUrl = Request.CurrentExecutionFilePath + "?categoryid=" + strID + "&Page=" + Convert.ToString(1);
                if (ObjectPage.CurrentPageIndex != ZhongPage - 1)
                    lnkLast.NavigateUrl = Request.CurrentExecutionFilePath + "?categoryid=" + strID + "&Page=" + Convert.ToString(ZhongPage);
                if (!ObjectPage.IsFirstPage)
                    lnkPrev.NavigateUrl = Request.CurrentExecutionFilePath + "?categoryid=" + strID + "&Page=" + Convert.ToString(DangQianPage - 1);
                if (!ObjectPage.IsLastPage)
                    lnkNext.NavigateUrl = Request.CurrentExecutionFilePath + "?categoryid=" + strID + "&Page=" + Convert.ToString(DangQianPage + 1);
                DataList1.DataSource = ObjectPage;
                DataList1.DataBind();
                conn.Close();
                String strsql2 = "select * from PType where category_ID=" + strID;
                SqlCommand comm2 = new SqlCommand(strsql2, conn);
                conn.Open();
                SqlDataReader mydr2 = comm2.ExecuteReader();

                if (mydr2.Read())
                {
                    Label1.Text = mydr2["category_name"].ToString();
                }
                else
                {
                    Label1.Text = "所有分类";
                }
                conn.Close();
            }
        }

        protected void btnPage_Click(object sender, EventArgs e)
        {
            int MyPageNum = 0;
            string strID = "0";
            if (!txtPage.Text.Equals(""))
                MyPageNum = Convert.ToInt32(Request.Form["txtPage"]);
            if (MyPageNum <= 0 || MyPageNum > ZhongPage)
                Response.Redirect(Request.CurrentExecutionFilePath + "?categoryid=" + strID + "&Page=" + Convert.ToString(1));
            else
                Response.Redirect(Request.CurrentExecutionFilePath + "?categoryid=" + strID + "&Page=" + Convert.ToString(MyPageNum));
        }
    }
}
