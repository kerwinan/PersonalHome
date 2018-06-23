<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPerArt.aspx.cs" Inherits="Design.AddPerArt" %>

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
    <table class="style1">
        <tr>
            <td align="left">&nbsp;</td>
        </tr>
    </table>
    <table style="width:792px;height:84px" border="0" cellspacing="0">
        <tr>
            <td width="792" height="83"><img src="images/管理我的空间.jpg" width="792" height="83" /></td>
        </tr>
    </table>
<table width="792" border="0" cellspacing="0">
  <tr>
    <td width="210" align="center" valign="top"><br />
      <table width="210" border="0" cellspacing="0">
        <tr><td height="34" align="left" valign="top"><img src="images/我的天地.jpg" width="210" height="36" /></td></tr>
        <tr><td width="759" valign="top">
               <table id="Table2" cellpadding="2" cellspacing="2" align="left">                                              
                   <tr><td><font color="#cccccc">★</font></td><td align="left">所有发布日志</td></tr>
                   <tr align="left"><td><font color="#cccccc">★</font></td><td align="left">[空间]<a href="Art_Manage.aspx" class="bb">管理日志!</a></td></tr>
                   <tr align="left"><td><font color="#cccccc">★</font></td><td align="left"></td></tr>                                                                                         
               </table>
               <p>&nbsp;</p>            
            </td>
        </tr>
        <tr><td align="left" valign="top"><img src="images/我的地盘.jpg" width="210" height="36" /></td></tr>
        <tr><td align="center" valign="top">
              <table id="Table3" cellpadding="2" cellspacing="2" align="left">                                                                                            
                  <tr><td><font color="#cccccc">★</font></td><td align="left"></td></tr>
                  <tr><td><font color="#cccccc">★</font></td><td align="left">[空间]<a href="AddPerArt.aspx" class="bb">发表日志!</a></td></tr>                            
                  <tr><td><font color="#cccccc">★</font></td><td align="left"></td></tr>                                                                                        
             </table>
             <p>&nbsp;</p>
            </td>
        </tr>
        <tr><td align="center" valign="top"><img src="images/个人信息.jpg" width="210" height="36" /></td></tr>
        <tr><td align="left" valign="top">
             <table id="Table4" cellpadding="2" cellspacing="2">                                               
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
          <table cellspacing="0" class="0" style="width: 529px" align="left">
                <tr><td align="right"><table ><tr><td>标题：</td></tr></table></td>
                    <td style="width: 368px; text-align: left">
                        <asp:TextBox ID="txtSubject" runat="server" Font-Size="9pt" Width="290px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSubject" ErrorMessage="标题不能为空">*</asp:RequiredFieldValidator></td>
                </tr>
                <tr><td align="right" class="style3" ><asp:Label ID="Label3" runat="server" Text="作者："></asp:Label></td>
                    <td style="width: 368px; text-align: left"><asp:TextBox ID="txtArtictor" runat="server" Font-Size="9pt" ReadOnly="True" Width="287px" Enabled="False"></asp:TextBox></td>
                </tr>
                <tr><td style="text-align: right; " class="style3"><asp:Label ID="Label4" runat="server" Text="类别："></asp:Label></td>
                    <td style="width: 368px; text-align: left; height: 24px;"><asp:DropDownList ID="DropDownList1" runat="server" Font-Names="9pt"></asp:DropDownList></td>
                </tr>
                <tr><td align="left"  style="text-align: right" ><asp:Label ID="Label5" runat="server" Text="摘要："></asp:Label></td>
                    <td style="width: 368px; height: 14px; text-align: left"><asp:TextBox ID="txtSummary" runat="server" Height="71px" TextMode="MultiLine" Width="462px"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td  style="text-align: right" align="right" class="style3">
                                                <asp:Label ID="Label6" runat="server" Text="内容："></asp:Label>
                                            </td>
                                            <td align="left" style="width: 368px; height: 26px">
                                                <asp:TextBox ID="article_context" runat="server" Height="178px" TextMode="MultiLine" 
                                                    Width="461px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr><td class="style3">&nbsp;</td>
                                            <td style="width: 368px; height: 24px;">&nbsp;<asp:Button ID="btnAdd" runat="server" CssClass="ButtonCss" Font-Size="9pt" OnClick="btnAdd_Click" Text="添加" Width="44px" />
                                                <asp:Button ID="Button1" runat="server" CssClass="ButtonCss" Font-Size="9pt" OnClick="Button1_Click" Text="重置" Width="41px" />
                                                <asp:Button ID="btnCancle" runat="server" CausesValidation="False" CssClass="ButtonCss" Font-Size="9pt" OnClick="btnCancle_Click" Text="返回" Width="47px" />
                                            </td>
                                        </tr>
         </table>
          <p>&nbsp;</p>
      </td>
   </tr>
    </table>      
    </td>
 </tr>
</table>
</form>
</body>
</html>
