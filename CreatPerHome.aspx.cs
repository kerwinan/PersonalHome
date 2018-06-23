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
    public partial class CreatPerHome : System.Web.UI.Page
    {
        public SqlConnection conn = new SqlConnection(ConfigurationSettings.AppSettings["ConStr"]);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                /*查询空间类型信息*/
                string strsql = "select * from PType where parentId = 0";
                SqlCommand mycmd = new SqlCommand(strsql, conn);
                conn.Open();
                SqlDataReader mydr = mycmd.ExecuteReader();
                Select1.DataSource = mydr;
                Select1.DataTextField = "category_name";
                Select1.DataValueField = "category_ID";
                Select1.DataBind();
                mydr.Close();
                conn.Close();
            }
        }

        protected void imgbtnCreate_Click(object sender, ImageClickEventArgs e)
        {
            string PerHomeName = tbPerHomeName.Text;
            string PerHomeClass = Select1.SelectedValue;
            string PerHomeSign = txtPerSign.Text;
            string imgPath = uploadFile.PostedFile.FileName;
            if (!isName(tbPerHomeName.Text))
            {
                if (uploadFile.PostedFile.FileName != "" && (Path.GetExtension(uploadFile.PostedFile.FileName).ToLower() != ".gif" && Path.GetExtension(uploadFile.PostedFile.FileName).ToLower() != ".jpg"))
                {
                    Response.Write("<Script>alert('上传的图片格式必须为gif或jpg!!');location='CreatPerHome.aspx'</Script>");
                    return;
                }
                /*获取登录用户名*/
                string userName = Session["username"].ToString();
                /*插入*/
                string sqlstr = "insert into PerHomeDetail(PerHomeName,PerHomeUser,PerHomeClass,PerHomeSign) values ('" + PerHomeName + "','" + userName + "','" + PerHomeClass + "','" + PerHomeSign + "')";
                SqlCommand mycom = new SqlCommand(sqlstr, conn);
                conn.Open();
                mycom.ExecuteNonQuery();
                /*将上传的图片以二进制形式存储到数据库中*/
                if (uploadFile.PostedFile.FileName != "")
                {
                    if (uploadFile.PostedFile.ContentLength > 40960)
                    {
                        Response.Write("<script language='javaScript'>alert('你上传的图片超过了40KB！')</script>");
                        return;
                    }
                    else
                    {
                        /*创建数据流对象*/
                        Stream imagestream;
                        /*获取上传图片的长度*/
                        int imagelength = this.uploadFile.PostedFile.ContentLength;
                        /*定义Byte数组*/
                        Byte[] image = new Byte[imagelength];
                        /*创建访问客户端上传文件的对象*/
                        HttpPostedFile hp = uploadFile.PostedFile;
                        imagestream = hp.InputStream;
                        /*将图片数据放到image数据对象实例中，其中0代表数组指针的起始位置，imagelength表示要读取流的
                         * 长度（指针的结束位置）*/
                        imagestream.Read(image, 0, imagelength);
                        /*定义更新数据库中存储的二进制图片*/
                        String sqlstr0 = "update [PerHomeDetail] set [PerHomeLogo]=@imgdata where PerHomeId=" +
                               "(select top 1 PerHomeId from [PerHomeDetail] where PerHomeUser='" + userName + "' order by PerHomeId desc)";
                        //*将图片存储到数据库指定字段中*/
                        SqlCommand cmd = new SqlCommand(sqlstr0, conn);
                        cmd.Parameters.Add("@imgdata", SqlDbType.Image);
                        cmd.Parameters["@imgdata"].Value = image;
                        cmd.ExecuteReader();
                        conn.Close();
                        Response.Write("<Script>alert('空间定制作成功！快去登录吧！');location='CreatPerHome.aspx'</Script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('上传图片不能为空！');location='javascript:history.go(-1)'</script>");
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<Script>alert('请正确填写信息！')</Script>");
            }
        }

        protected void imgbtnCheck_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void imgbtnRet_Click(object sender, ImageClickEventArgs e)
        {
            this.tbPerHomeName.Text = txtPerSign.Text = "";
        }

        protected void tbPerHomeName_TextChanged(object sender, EventArgs e)
        {
            if (tbPerHomeName.Text == "")
            {
                labIsName.Text = "空间名不能为空";
                labIsName.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                if (isName(tbPerHomeName.Text))
                {
                    labIsName.Text = "空间名已存在！";
                    labIsName.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    labIsName.Text = "可以注册！";
                    labIsName.ForeColor = System.Drawing.Color.Blue;
                }
            }
        }
        protected bool isName(string name)
        {
            bool blIsName = false;
            /*判断用空间名是否存在*/
            string sqlSel = "select count(*) from PerHomeDetail where PerHomeName='" + name + "' ";
            SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings["ConStr"].ToString());
            con.Open();
            SqlCommand com = new SqlCommand(sqlSel, con);
            if (Convert.ToInt32(com.ExecuteScalar()) > 0)
            {
                blIsName = true;
            }
            else
            {
                blIsName = false;
            }
            return blIsName;
        }

    }
}
