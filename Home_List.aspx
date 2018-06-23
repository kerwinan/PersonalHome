<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home_List.aspx.cs" Inherits="Design.Home_List" %>

<%@ Register src="UserControl/User_Login.ascx" tagname="User_Login" tagprefix="uc1" %>

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
 <table style="height:84px;width:1004px" border="0" cellspacing="0">
   <tr><td style="background:url(images/我的个人空间.jpg)" >
              <span style="width:394px; height:39px;  padding-top:45px; padding-left:610px; ">
              <a href="Default.aspx">首页</a> 　　
              <a href="Default.aspx">登录</a>　　　 
              <a href="UserRegister.aspx">注册</a>　　 
              <a href="Default.aspx">会员日志</a>　　　 
              <a href="Home_Display.aspx">随变逛逛</a></span></td>
  </tr>
</table>
<table width="968" border="0" cellspacing="0">
  <tr><td width="223" rowspan="2" align="center" valign="top"><br />
                <table border="0" cellspacing="0" cellpadding="0" style="width: 337%; height: 33px">
                      <tr><td style="background:url(images/所有空间列表.jpg)">&gt;&gt;<asp:Label ID="Label1" Runat="server"></asp:Label></td></tr>
                </table>      
                <table style="height:128px;width:755px" border="0" cellpadding="0" cellspacing="0">
                           <tr><td align="left"><asp:DataList ID="DataList1" runat="server" Width="693px">
                                          <ItemTemplate>
                                          <table class="style2">
                                               <tr style="border-bottom-style: groove; border-bottom-width: medium; border-bottom-color: #FFFFFF">
                                                        <td rowspan="3" align="center" class="style3"><a href='Home_Display.aspx?id=<%#DataBinder.Eval(Container.DataItem,"PerHomeId")%>'>
                                                                  <img border="0" height="80" src='UserHomeLogo.aspx?id=<%#DataBinder.Eval(Container.DataItem,"PerHomeId")%>' width="80"> </img></a>
                                                       </td>
                                                       <td align="left"><asp:Image ID="Image4" runat="server" ImageUrl="~/images/人头.gif" /><a class="bb"><%#Eval("PerHomeName")%></a></td>
                                                       <td align="left">&nbsp;</td>
                                                       <td><a href='Home_Display.aspx?id=<%#DataBinder.Eval(Container.DataItem,"PerHomeId")%>'>
                                                                <asp:Image ID="Image5" runat="server" ImageUrl="~/images/去空间.jpg" /></a>
                                                       </td>
                                               </tr>
                                               <tr><td align="left">空间主人:<a class="bb"><%#Eval("PerHomeUser") %></a></td>
                                                       <td align="left">创建时间：<a class="bb"><%#Eval("PerHomeTime") %></a></td>
                                                       <td>&nbsp;</td>
                                               </tr>
                                               <tr><td align="left" colspan="3">个性签名：<a class="bb"><%#Eval("PerHomeSign").ToString().Length > 10 ? Eval("PerHomeSign").ToString().Substring(0, 10) + "..." : Eval("PerHomeSign")%></a></td></tr>
                                         </table>
                                       </ItemTemplate>
                        </asp:DataList>
				                 </td>
                      </tr>
            </table>
      <br />
		    <table id="page">
				  <tr align="right"><td><asp:label id="lblCurPage" Runat="server"></asp:label>&nbsp;
						                                <asp:Label id="lblEachPage" Runat="server"></asp:Label>
						                                <asp:Label id="lblTnum" Runat="server"></asp:Label>&nbsp;
						                                <asp:hyperlink id="lnkFirst" Runat="server" CssClass="bb">&nbsp;第一页&nbsp;</asp:hyperlink>
						                                <asp:hyperlink id="lnkPrev" Runat="server" CssClass="bb">&nbsp;上一页&nbsp;</asp:hyperlink>
						                                <asp:hyperlink id="lnkNext" Runat="server" CssClass="bb">&nbsp;下一页&nbsp;</asp:hyperlink>
						                                <asp:hyperlink id="lnkLast" Runat="server" CssClass="bb">&nbsp;最后页&nbsp;</asp:hyperlink>
						                           到:<asp:TextBox id="txtPage" Runat="server" Width="32px"></asp:TextBox>
						                            页<asp:Button id="btnPage" Runat="server" Width="32px" Text="Go" onclick="btnPage_Click"></asp:Button></td>
				  </tr>
			   </table>
      <br />    
      </td>
      <td width="723" height="228" align="center" valign="top">
            <table width="239" border="0" cellpadding="0" cellspacing="0" style="background:url(images/会员登录.jpg);height:224px">
                        <tr><td height="55">&nbsp;</td></tr>
                        <tr><td height="65" align="center" valign="top">
                                    <table width="80%" style="height:60px"  border="0" cellpadding="0" cellspacing="0">
                                         <tr><td width="41%" align="right" style="width: 100%"><label>&nbsp;</label><uc1:User_Login ID="User_Login1" runat="server" /></td></tr>
                                    </table>
                               </td>
                       </tr>
             </table>
      </td>
  </tr>
  <tr><td align="center" valign="top">
              <table width="233" style="height:238px"  border="0" cellpadding="0" cellspacing="0">
                    <tr><td height="41" align="center" valign="top"><img src="images/所有分类.jpg" width="233" height="41" /></td></tr>
                    <tr><td height="238" valign="top">
							      <asp:Repeater id="Repeater1" runat="server"><HeaderTemplate>
									     <table width="100%">
										        <tr><td width="10"></td>
											            <td><asp:Image ID="img1" runat="server" ImageUrl="~/images/icon.gif"/>											
												                <a href='Home_List.aspx' class="bb">所有分类</a><br></HeaderTemplate>
								                         <ItemTemplate><asp:Image ID="Image2" runat="server" ImageUrl="~/images/人.gif" />
									                     <a href ='Home_List.aspx?categoryid=<%#DataBinder.Eval(Container.DataItem,"category_ID")%>' class="bb">
										                    <%#DataBinder.Eval(Container.DataItem,"category_name")%>
									                     </a>
									<br />
								 </ItemTemplate>
								<FooterTemplate>
						</td>
					</tr>
			</table>
			</FooterTemplate> </asp:Repeater></td>
      </tr>
    </table></td>
  </tr>
</table> 
    </div>
    </form>
</body>
</html>
