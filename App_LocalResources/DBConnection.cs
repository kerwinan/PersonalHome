using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Collections;

public class DBConnection
{
    SqlConnection sqlcon;
    SqlCommand sqlcom;
    SqlDataReader sqlrd;
    public string strSqlConn = "";
    public DBConnection()
    {
        sqlcon = new SqlConnection(ConfigurationSettings.AppSettings["ConStr"]);
        sqlcon.Open();
    }
    public DBConnection(string constr)
    {
        sqlcon = new SqlConnection(constr);
        sqlcon.Open();
    }
    public SqlDataReader ExecuteReader(string sql)
    {
        sqlcom = new SqlCommand(sql, sqlcon);
        sqlrd = sqlcom.ExecuteReader();
        return sqlrd;
    }
    public bool ExecuteNonQuery(string sql)
    {
        sqlcom = new SqlCommand(sql, sqlcon);
        try  /*保护*/
        {
            if (sqlcon.State == System.Data.ConnectionState.Closed){
                sqlcon.Open();
            }
            sqlcom.ExecuteNonQuery();
            return true;
        }
        catch (Exception ex)/*异常*/
        {
            string s = ex.ToString();
            return false;
        }
        finally /*完善*/
        {
            sqlcon.Close();
        }
    }
    public int ExecScalar(string sql)
    {
        sqlcom = new SqlCommand(sql, sqlcon);
        return Convert.ToInt32(sqlcom.ExecuteScalar());
    }
}
