<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Design._Default" %>

<%@ Register src="UserControl/User_Login.ascx" tagname="User_Login" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>我的空间</title>
    <link href="CSS/css.css" type="text/css" rel="Stylesheet" /> 
</head>
<body>
  <form id="form1" runat="server">
<div>
 <table style="width:1003px;height:84px" border="0">
  <tr>
    <td style="background:url(images/我的个人空间.jpg)"><span style="width:394px; height:44px;  padding-top:40px; padding-left:610px; ">
        <a href="Default.aspx">首页</a> 　　
        <a href="Default.aspx">登录</a>　　　 
        <a href="UserRegister.aspx">注册</a>　　 
        <a href="Default.aspx">会员日志</a>　　　 
        <a href="Home_List.aspx">
        随便逛逛</a></span></td>
  </tr>
</table>

<table width="1004px" border="0">
  <tr>    
    <td width="760"><img src="images/功能菜单.jpg" width="760" height="240" alt=""/></td>
    <td width="245" rowspan="2">
        <table style="height:240px;width:235px;background:url(images/会员登录.jpg)" border="0">  
                <tr><uc1:User_Login ID="User_Login1" runat="server" /></tr>
                <tr>
                   <td style="text-align:center">
                    <asp:Label ID="Label2" runat="server" Text="欢迎光临："></asp:Label>
                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                      </td>
                </tr>
        </table>
    </td>
  </tr>    
</table>   

<table width="760" border="0" cellspacing="0">
  <tr><td height="34" align="left"><span style="width:760px; height:34px; "><img src="images/最新日志.jpg" width="760" height="34" alt=""/></span></td></tr>
  <tr>
     <td width="760" align="center" valign="top">
         <br />
          <table width="710" border="0" style=" border-bottom:dashed 1px #CCCCCC">
          <tr>
             <td align="left">
                    <asp:DataList ID="ArtDetailList" runat="server" RepeatColumns="3" Width="438px" Height="230px">
                        <HeaderTemplate> <! --页眉节-- >
							    <table style="width:670px" cellpadding="5" cellspacing="5">
						            </HeaderTemplate>
						            <ItemTemplate> <! --为DataList提供模板-- >
							            <tr>
							                <td>
									            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/new.gif" />
                                                <a href ='ArticleShow.aspx?id=<%#Eval("ST_n_id")%>' class="bb">
								                    [<%#Eval("ST_n_title").ToString().Length > 10 ? Eval("ST_n_title").ToString().Substring(0, 10) + "..." : Eval("ST_n_title")%>]
							                    </a>
							                </td>
							                <td>
							                    作者：&nbsp;&nbsp;&nbsp;&nbsp;<asp:Image ID="Image3" runat="server" ImageUrl="~/images/icon.gif" />
                                                &nbsp;&nbsp;<%#Eval("ST_n_author")%></td>
							            </tr> 
						            </ItemTemplate>
						            <FooterTemplate>
							    </table>
						        </FooterTemplate>
                    </asp:DataList>
             </td>
         </tr>
        </table>
   </td>
</tr>
</table>

<table width="760" border="0">
  <tr><td height="34" valign="top"><img src="images/新进会员.jpg" width="760" height="34" /></td></tr>
  <tr>
    <td width="760" align="left">
      <table width="409" border="0" cellspacing="0" >
        <tr>
          <td height="30" align="center" valign="top">
              <table width="409" border="0" cellspacing="0" >
                <tr>
                  <td align="center" rowspan="2" style="width: 226px">
                     <asp:DataList ID="PerHomeList" runat="server" RepeatColumns="4" Width="563px" style="text-decoration: underline">
                         <ItemStyle HorizontalAlign="Center" Width="150" />
                         <ItemTemplate>    
                              <table cellpadding="3" cellspacing="5">
                                  <tr align="center">
                                     <td>
                                        <a href='Home_Display.aspx?id=<%#Eval("PerHomeId")%>'>
                                          <img border="0" height="80" src='UserHomeLogo.aspx?id=<%#Eval("PerHomeId")%>' width="80"> </img></a>
                                     </td>
                                  </tr>
                                  <tr align="center"><td><a class="bb"><%#Eval("PerHomeName")%></a></td></tr>
                             </table>
                         </ItemTemplate>
                     </asp:DataList>
                  </td>
               </tr>
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
