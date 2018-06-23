<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Art_Manage.aspx.cs" Inherits="Design.Art_Manage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="CSS/css.css" type="text/css" rel="Stylesheet" /> 
    <style type="text/css">
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table style="width:792px;height:84px" border="0" cellspacing="0">
      <tr><td width="792" height="83"><img src="images/管理我的空间.jpg" width="792" height="83" alt=""/></td></tr>
    </table>
<table width="792" border="0" cellspacing="0">
  <tr>
     <td width="210" align="center" valign="top"><br />
      <table width="210" border="0" cellspacing="0">
        <tr><td height="34" align="left" valign="top"><img src="images/我的天地.jpg" width="210" height="36" alt=""/></td></tr>
        <tr><td width="759" valign="top">
              <table id="Table1" cellpadding="2" cellspacing="2" align="left">                                              
                 <tr><td><font color="#cccccc">★</font></td><td align="left">所有发布日志</td></tr>
                 <tr align="left"><td><font color="#cccccc">★</font></td><td align="left">[空间]<a href="Art_Manage.aspx" class="bb">管理日志!</a></td></tr>
                 <tr><td colspan="2">&nbsp;</td></tr>                                                                                         
              </table>
             <p>&nbsp;</p>            
            </td>
        </tr>
        <tr><td align="left" valign="top"><img src="images/我的地盘.jpg" width="210" height="36" alt="" /></td></tr>
        <tr><td align="center" valign="top">
             <table id="Table2" cellpadding="2" cellspacing="2" align="left">                                                                                            
                <tr><td><font color="#cccccc">★</font></td><td align="left"></td></tr>
                <tr><td><font color="#cccccc">★</font></td><td align="left">[空间]<a href="AddPerArt.aspx" class="bb">发表日志!</a></td></tr>                            
                <tr><td><font color="#cccccc">★</font></td><td align="left"></td></tr>                                                                                      
             </table>
             <p>&nbsp;</p>
           </td>
        </tr>
        <tr><td align="center" valign="top"><img src="images/个人信息.jpg" width="210" height="36" alt="" /></td></tr>
        <tr><td align="left" valign="top">
             <table id="Table3" cellpadding="2" cellspacing="2">                           
                <tr><td align="right"><font color="#cccccc">★</font></td><td>我的星座</td></tr>
                <tr><td align="right"><font color="#cccccc">★</font></td><td>密码修改</td></tr>
                <tr><td align="right"><font color="#cccccc">★</font></td><td>个人百宝箱</td></tr>
                <tr><td align="right"><font color="#cccccc">★</font></td><td>我的音乐</td></tr>
                <tr><td align="right"><font color="#cccccc">★</font></td><td><a href="Home_Manage.aspx" class="bb">返回管理页</a></td></tr>
                <tr><td colspan="2">&nbsp;</td></tr>
             </table>
           </td>
        </tr>
      </table>
      <p><br /><br /></p>
     </td>
      <td align="center" valign="top"><br /><table width="100%" border="0" cellspacing="0" cellpadding="0" style="height: 309px">
      <tr><td>
          <table style="width: 562px; height: 281px;" align="left">
            <tr><td style="width: 114px; height: 26px"><span style="font-size: 9pt">查询条件</span></td>
                <td style="width: 92px; height: 26px">
                    <asp:DropDownList ID="ddlSearch" runat="server" Font-Size="9pt" Width="114px">
                        <asp:ListItem Selected="True">日志编号</asp:ListItem>
                        <asp:ListItem>日志标题</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td style="width: 83px; height: 26px"><span style="font-size: 9pt">关键字</span></td>
                <td style="width: 142px; height: 26px"><asp:TextBox ID="txtKey" runat="server" Font-Size="9pt" Width="101px"></asp:TextBox></td>
                <td style="width: 54px; height: 26px"><asp:Button ID="btnSearch" runat="server" Font-Size="9pt" OnClick="btnSearch_Click" Text="查找" /></td>
                <td align="left" style="width: 111px; height: 26px"><asp:Button ID="btbReturn" runat="server" onclick="btbReturn_Click" Text="返回" /></td>
            </tr>
            <tr>
                <td colspan="6" style="height: 130px; vertical-align: top; text-align: center;">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="2" Font-Size="9pt" ForeColor="Black" GridLines="None" Height="153px" 
                        OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDataBound="GridView1_RowDataBound" OnRowDeleting="GridView1_RowDeleting" 
                        PageSize="6" Width="500px" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px">
                        <FooterStyle BackColor="Tan" />
                        <Columns>
                            <asp:BoundField DataField="ST_n_id" HeaderText="日志编号" />
                            <asp:BoundField DataField="ST_n_title" HeaderText="日志主题" />
                            <asp:BoundField DataField="ST_n_hit" HeaderText="人气指数" />
                            <asp:BoundField DataField="ST_n_re" HeaderText="评论" />
                            <asp:HyperLinkField DataNavigateUrlFields="ST_n_id" 
                                DataNavigateUrlFormatString="ViewContent.aspx?id={0}" HeaderText="修改" 
                                Text="修改" >
                                <ControlStyle ForeColor="#00CC99" />
                            </asp:HyperLinkField>
                            <asp:CommandField HeaderText="删除" ShowDeleteButton="True" >
                                <ControlStyle ForeColor="Red" />
                            </asp:CommandField>
                        </Columns>
                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                    </asp:GridView>
                </td>
          </tr>
       </table>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>
          <p>&nbsp;</p>          
          </td>
      </tr>
    </table>      
  <br /></td>
  </tr>
</table>
    </form>
</body>
</html>
