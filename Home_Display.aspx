<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home_Display.aspx.cs" Inherits="Design.Home_Display" %>

<%@ Register src="UserControl/User_Login.ascx" tagname="User_Login" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <style type="text/css">
<!--
body {
background-color:#eca600;
}
-->
</style>
    <link href="CSS/css.css" type="text/css" rel="Stylesheet" /> 
</head>
<body>
   <form id="form1" runat="server">
    <div>   
    <table width="968" border="0" cellspacing="0" cellpadding="0" style="height: 195px">
      <tr><td style="background:url(images/空间背景.jpg)">
              <table id="Table1" cellpadding="1" cellspacing="0">
                  <tr><td align="center" class="style1">
                        <b><%=PerHomeName%><br />
                         <asp:Image ID="imgLogo" runat="server" BackColor="#FFFFCC" />
                         <br />
                        </b>&nbsp;
                      </td>
                      <td width="175">
                        <pre><b>主    人：</b> <%=PerHomeUser%></pre>
                        <pre><b>访 问 量：</b> <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></pre>
                        <pre><b>创建时间：</b> <%=PerHomeTime%></pre>
                        <pre><b>所 在 地：</b> 保密</pre>
                      </td>
                   </tr>
              </table>
          </td>
      </tr>
</table>
<table border="0" cellspacing="0" style="width: 926px">
  <tr>
    <td width="223" align="center"><br />
        <table style="height:195px;width:223px;background:url(images/会员登录.jpg)" border="0" cellpadding="0" cellspacing="0">          
          <tr><td height="60">&nbsp;</td></tr>
          <tr><td height="65" align="center" valign="top">
                <table width="80%" border="0" cellpadding="0" cellspacing="0" style="height: 136px">
                   <tr><td width="47%" align="right" style="width: 100%"><label><uc1:User_Login ID="User_Login1" runat="server" />&nbsp;</label></td></tr>
                </table>        
               </td>
          </tr>
        </table>
      <br />      
        <table width="223" border="0" cellpadding="0" cellspacing="0" style="height: 165px">
            <tr><td style="background:url(images/日志分类.jpg)" align="left">
                    <asp:DataList ID="ClassList" runat="server" Font-Size="11pt" style="font-size: small" Width="119px" Height="72px" >
                            <HeaderTemplate></HeaderTemplate><ItemTemplate>
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/images/右三角.GIF" /><a class="bb">&nbsp;<%# Eval("ST_c_name") %></a>
                                                            </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
        </table>
                <br />
    </td>
    <td width="723" valign="top"><br />
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
           <tr><td align="right" style="background-image: url('images/最新日志.jpg')"><br />
                  <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#CC6600" NavigateUrl="~/Default.aspx">&lt;&lt;返回网站首页</asp:HyperLink><br />
               </td>
           </tr>
           <tr><td>
                   <table >
                        <tr><td>
                             <table >
                                 <tr><td >
                                      <table cellpadding="0" cellspacing="0" class="style2">
                                          <tr><td>
                                                <asp:GridView ID="NewsList" runat="server" AllowPaging="True" AutoGenerateColumns="False" BorderColor="White" 
                                                             PageSize="5" Width="712px" onpageindexchanging="NewsList_PageIndexChanging">
                                                <Columns>
                                                   <asp:TemplateField><ItemTemplate>
                                                     <table align="center" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                        <tr><td height="25">
                                                              <div align="left"><font face="宋体"></font><font face="宋体"></font>
                                                                   <a href ='ArticleShow.aspx?id=<%#DataBinder.Eval(Container.DataItem,"ST_n_id")%>' class="bb">
                                                                   <font style="font-size: 14px"><b><%# DataBinder.Eval(Container.DataItem, "ST_n_title") %></b></font></a>
                                                              </div>
                                                             </td>
                                                        </tr>
                                                        <tr><td ><span style="color: #646060; font-weight: bold"><font size="-1">摘要</font></span>: 
                                                                   &nbsp;: &nbsp;<font style="font-size: 12px;"><%# DataBinder.Eval(Container.DataItem, "ST_n_key") %><br /><br /></font>
                                                            </td>
                                                        </tr>
                                                        <tr><td>[<a href='ArticleShow.aspx?id=<%#DataBinder.Eval(Container.DataItem,"ST_n_id")%>'><span style="color: #8EAEC2; font-weight: bold">查看全文</span></a>&gt;&gt;]</td></tr>
                                                        <tr ><td align="right" width="69%">[<a><span style="color: #8EAEC2; font-weight: bold">复制本文地址</span></a>]
                                                                                           <font style="font-size: 12px"><font color="#7c7c7c">阅读</font>:[<%# DataBinder.Eval(Container.DataItem, "ST_n_hit") %>]
                                                                                           <font color="#7c7c7c">评论</font>:[<%# DataBinder.Eval(Container.DataItem, "ST_n_re") %>]
                                                                                           <font color="#7c7c7c">时间</font>:[<%# DataBinder.Eval(Container.DataItem, "ST_n_date") %>]</font>
                                                             </td>
                                                        </tr>
                                                    </table>
                                                            </ItemTemplate>
                                                            <ItemStyle />
                                                            <HeaderStyle />
                                                            <FooterStyle  />
                                                  </asp:TemplateField>
                                                </Columns>
                                                </asp:GridView>
                                                 </td>
                                              </tr>
                                           </table>
                                        </td>
                                    </tr>
                            </table>
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
          <p>&nbsp;</p></td>
      </tr>
     </table>
    </td>
  </tr>
</table>
    </div>
    </form>
</body>
</html>
