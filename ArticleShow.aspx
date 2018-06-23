<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ArticleShow.aspx.cs" Inherits="Design.ArticleShow" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <style type="text/css">
    </style>
     <link href="CSS/css.css" rel="Stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>    
       <table class="style1">
         <tr><td align="center">
                <asp:GridView ID="NewsShow" runat="server" AutoGenerateColumns="False" Width="708px">
                   <Columns><asp:TemplateField><ItemTemplate>
                     <table border="0" style="width: 98%">
                        <tr><td><a href="Default.aspx" class="bb">首页</a>-&gt;<a href="#" class="bb">全文查看</a></td></tr>
                        <tr style="height:25px" align="center"><td><font color="#ff6633" size="-1"><b><a class="bb">日志摘要：<%#DataBinder.Eval(Container.DataItem, "ST_n_title")%></a></b></font></td></tr>
                        <tr style="height:25px" align="right"><td class="content">
                                                <font size="-1">[作者：<%#DataBinder.Eval(Container.DataItem, "ST_n_author")%>] 
                                                [人气：<%#DataBinder.Eval(Container.DataItem, "ST_n_hit")%>] [回复：<%#DataBinder.Eval(Container.DataItem, "ST_n_re")%>] 
                                                [发布时间:<%#DataBinder.Eval(Container.DataItem, "ST_n_date")%>] </font>
                                                              </td>
                       </tr>
                       <tr><td class="content"><font size="-1"><a class="bb">日志全文：<%#DataBinder.Eval(Container.DataItem, "ST_n_content")%></a></font></td></tr>
                     </table>
                                             </ItemTemplate>
                            </asp:TemplateField>
                   </Columns>
               </asp:GridView>
               <br />
		            <table border="0" align="center" style="width: 53%">
				        <tr><td bgcolor="#ffffff" height="30"><%ST_get_Replay();%><strong>网友回应</strong></td></tr>
				    </table>
            </td>
        </tr>
        <tr><td align="center">
              <table style="border-color:#FFFFFF;height:88px" bgcolor="#9BD0EA" border="1" cellpadding="1" cellspacing="1" width="537">
                 <tr><td bgcolor="#FFFFFF" class="shenlancu" valign="middle" width="529">
                       <table border="0" cellpadding="0" cellspacing="0" style="width: 518px">
                          <tr><td align="right">您的大名：</td><td align="left"><asp:TextBox ID="r_nick" runat="server" ForeColor="LightSteelBlue" Width="174px"></asp:TextBox></td><td>&nbsp;</td></tr>
                          <tr><td align="right">留言标题：</td><td align="left"><asp:TextBox ID="r_title" runat="server" Width="174px"></asp:TextBox></td><td>&nbsp;</td></tr>
                          <tr><td><img height="31" src="images/发表评论.gif" width="119" /></td><td></td><td>&nbsp; 您还可以输入<asp:Label ID="labCount" runat="server" Text="500"></asp:Label>字符</td></tr>
                       </table>
                     </td>
                 </tr>
                 <tr><td align="center" bgcolor="#FFFFFF" class="huise1" valign="top"><asp:TextBox ID="txtContent" runat="server" Height="141px" onKeyUp="change()" TextMode="MultiLine" Width="500px"></asp:TextBox></td></tr>
                 <tr><td align="center" bgcolor="#FFFFFF" class="huise1" valign="top">
                       <table cellpadding="0" cellspacing="0" style="height: 56px" width="353">
                          <tr><td class="huise1" width="240"><asp:Label ID="Label1" runat="server" Text="温馨提示：留言内容请注意文明用语！"></asp:Label></td><td width="111"><asp:Button ID="btnIdea" runat="server" OnClick="btnIdea_Click" Text="发表评论" /></td></tr>
                       </table>
                     </td>
                 </tr>
             </table>
           </td>
        </tr>
      </table>
    </div>
    </form>
</body>
</html>
