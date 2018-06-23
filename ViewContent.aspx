<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewContent.aspx.cs" Inherits="Design.ViewContent" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="CSS/css.css" type="text/css" rel="Stylesheet" /> 
    <style type="text/css">
        .auto-style1 {
            height: 360px;
        }
    </style>
</head>
<body>
 <form id="form1" runat="server">
        <table style="height:84px;width:792px"  border="0" cellspacing="0">
             <tr><td width="792" height="83"><img src="images/管理我的空间.jpg" width="792" height="83" /></td></tr>
        </table>
<table width="792" border="0" cellspacing="0">
  <tr><td width="210" align="center" valign="top"><br />
                <table  width="210" border="0" cellspacing="0">
                     <tr><td height="34" align="left" valign="top"><img src="images/我的天地.jpg" width="210" height="36" /></td></tr>
                     <tr><td width="759" valign="top">
                                   <table id="Table2" cellpadding="2" cellspacing="2" align="left">                                              
                                        <tr><td><font color="#cccccc">★</font></td>
                                                <td align="left">所有发布日志</td>
                                         </tr>
                                         <tr align="left"><td><font color="#cccccc">★</font></td>
                                                                    <td align="left">[空间]<a href="Art_Manage.aspx" class="bb">管理日志!</a></td>
                                         </tr>
                                         <tr><td colspan="2">&nbsp;</td></tr>                                                                                         
                                    </table><p>&nbsp;</p>            
                             </td>
                   </tr>
                   <tr><td align="left" valign="top"><img src="images/我的地盘.jpg" width="210" height="36" /></td></tr>
                   <tr><td align="center" valign="top">
                                 <table id="Table3" cellpadding="2" cellspacing="2" align="left">                                                                                            
                                       <tr><td><font color="#cccccc">★</font></td>
                                               <td align="left"></td>
                                       </tr>
                                       <tr><td><font color="#cccccc">★</font></td>
                                               <td align="left">[空间]<a href="AddPerArt.aspx" class="bb">发表日志!</a></td>
                                        </tr>                            
                                        <tr><td><font color="#cccccc">★</font></td>
                                                <td align="left"></td>
                                        </tr>                                                                                        
                                 </table><p>&nbsp;</p>
                          </td>
                     </tr>
                     <tr><td align="center" valign="top"><img src="images/个人信息.jpg" width="210" height="36" /></td></tr>
                     <tr><td align="left" valign="top">
                                   <table id="Table4" cellpadding="2" cellspacing="2">                                               
                                        <tr><td align="right"><font color="#cccccc">★</font></td>
                                                <td>我的星座</td>
                                        </tr>
                                        <tr><td align="right"><font color="#cccccc">★</font></td>
                                                <td>密码修改</td>
                                        </tr>
                                        <tr><td align="right"><font color="#cccccc">★</font></td>
                                                <td>个人百宝箱</td>
                                        </tr>
                                        <tr><td align="right"><font color="#cccccc">★</font></td>
                                                <td>我的音乐</td>
                                        </tr>
                                        <tr><td align="right"><font color="#cccccc">★</font></td>
                                                <td><a href="Home_Manage.aspx" class="bb">返回管理页</a></td>
                                         </tr>
                                         <tr><td colspan="2">&nbsp;</td></tr>
                                      </table>
                            </td>
                     </tr>
              </table>
                </td>
    <td align="center" valign="top"><br /><table width="100%" border="0" cellspacing="0" 
            cellpadding="0" style="height: 309px">
      <tr>
        <td align="left" class="auto-style1">
                                    <table cellspacing="0" class="0" style="width: 478px">
                                        <tr>
                                            <td align="right">
                                                <span style="font-size: 9pt">&nbsp;&nbsp;标题：&nbsp;</span></td>
                                            <td style="width: 368px; text-align: left">
                                                <asp:Label ID="labSubject" runat="server" Font-Size="9pt" Width="316px"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style7" align="right">
                                                <asp:Label ID="Label3" runat="server" Text="内容："></asp:Label>
                                            </td>
                                            <td style="width: 368px; text-align: left">
                                                <asp:TextBox ID="txtContent" runat="server" Font-Size="9pt" Height="257px" 
                                                    TextMode="MultiLine" Width="405px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style10">
                                                &nbsp;</td>
                                            <td style="width: 368px; text-align: left; height: 24px;" align="right">
                                                <asp:Button ID="btnUpdate" runat="server" Font-Size="9pt" 
                                                    OnClick="btnUpdate_Click" Text="修改" Width="55px" />
                                                <asp:Button ID="btnBack" runat="server" Font-Size="9pt" OnClick="btnBack_Click" 
                                                    Text="返回" Width="47px" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" class="style10">
                                                &nbsp;</td>
                                            <td style="width: 368px; height: 14px; text-align: left">
                                                &nbsp;</td>
                                        </tr>
                                        </table>
          <p>&nbsp;</p>
                            </td>
      </tr>
    </table>  </td>
  </tr>
</table>
    </form>
</body>
</html>
