<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreatPerHome.aspx.cs" Inherits="Design.CreatPerHome" %>

<%@ Register src="UserControl/User_Login.ascx" tagname="User_Login" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <style type="text/css"></style>
    <link href="CSS/css.css" rel="Stylesheet" type="text/css" />
</head>
<body>
   <form id="form1" runat="server">
<table style="width:1004px;height:84px" border="0" cellspacing="0">
  <tr>
    <td style="background:url(images/我的个人空间.jpg)"><span style="width:394px; height:39px;  padding-top:45px; padding-left:610px; ">
        <a href="Default.aspx">首页</a> 　　
        <a href="Default.aspx">登录</a>　　　 
        <a href="UserRegister.aspx">注册</a>　　 
        <a href="#">会员日志</a>　　　 
        <a href="Home_List.aspx">随变逛逛</a></span>
    </td>
  </tr>
</table>
<table width="968" border="0" cellspacing="0">
  <tr><td width="223" rowspan="2" align="center" valign="top"><br />
      <table width="759" border="0" cellspacing="0">
        <tr><td height="34" align="left" valign="top"><asp:Image ID="Image1" runat="server" ImageUrl="~/images/快速制定我的空间.gif" /></td></tr>
        <tr><td width="759" align="center" valign="top" ><br />
               <table border="1" cellpadding="2" cellspacing="0" class="style3" align="center">
                   <tr><td colspan="2">简单快速定制个性空间<asp:Label ID="LblStr" runat="server" Text="Label" Width="202px" ForeColor="white"></asp:Label></td></tr>
                   <tr style="color: #000000; font-size: 9pt;">
                        <td align="right" class="LeftTD" height="30" valign="middle" width="150">个性空间名:</td>
                        <td valign="middle" class="style1" align="left" colspan="2">
                            <asp:TextBox ID="tbPerHomeName" runat="server" CssClass="TextBox" 
                                MaxLength="50" SkinID="tbSkin"
                                Width="150px" AutoPostBack="True" 
                                ontextchanged="tbPerHomeName_TextChanged"></asp:TextBox><asp:RequiredFieldValidator ID="rfUN" runat="server"
                                    ControlToValidate="tbPerHomeName" Display="Dynamic" 
                                ErrorMessage="不能为空。"></asp:RequiredFieldValidator>
                            <asp:ImageButton ID="imgbtnCheck" runat="server" 
                                ImageUrl="~/images/检测结果.jpg" onclick="imgbtnCheck_Click" 
                                CausesValidation="False" />
                            <asp:Label ID="labIsName" runat="server" Font-Size="12px"></asp:Label>
                            <br />
                       </td>                       
                   </tr>
                   <tr style="font-size: 9pt">
                        <td align="right" class="LeftTD" height="30" valign="middle" width="150">空间类型:</td>
                        <td valign="middle" class="style1" align="left" colspan="2">
                             <asp:DropDownList ID="Select1" runat="server" AutoPostBack="True" Height="90px" Width="109px"></asp:DropDownList>
                        </td>
                   </tr>
                   <tr style="font-size: 9pt"><td align="right" class="LeftTD" height="30" valign="middle" width="150">个性头像：</td>
                                              <td valign="middle" class="style1" align="left" colspan="2">
                                                 <div align="left">
                                                    <asp:FileUpload ID="uploadFile" onpropertychange="document.all.img1.src=this.value" runat="server" Width="199px" />
                                                 </div>
                                                 <asp:Image ID="img1" src="images\暂无图片.gif" width="100" runat="server" /> 
                                                 <asp:Label ID="Label3" runat="server" Text="温馨提示：图片大小不超过40KB且仅支持JPG和GIF格式!" style="color: #FF66CC"></asp:Label>
                                              </td>
                  </tr>
                  <tr style="font-size: 9pt"><td align="right" class="LeftTD" height="30" valign="middle" width="150">个性签名：</td>
                                             <td valign="middle" class="style1" align="left">
                                                 <asp:TextBox ID="txtPerSign" runat="server" Height="100px" TextMode="MultiLine" Width="283px">这家伙很懒,什么也没有留下~</asp:TextBox>
                                             </td>
                                             <td valign="middle" class="style4">&nbsp;</td>
                  </tr>
                  <tr style="font-size: 9pt">
                                             <td align="right" class="LeftTD" style="height: 30px" valign="middle" width="150">
                                                 <asp:Label ID="Label1" runat="server" Width="150px"></asp:Label></td>
                                             <td valign="middle" class="style2" align="left">
                                                 <asp:ImageButton ID="imgbtnCreate" runat="server" ImageUrl="~/images/立即定制.jpg" onclick="imgbtnCreate_Click" />
                                                 <asp:ImageButton ID="imgbtnRet" runat="server" ImageUrl="~/images/重置.jpg" onclick="imgbtnRet_Click" CausesValidation="False" />
                                             </td>
                                             <td valign="middle" class="style5">&nbsp;</td>
                  </tr>
                  <tr style="font-size: 9pt"><td align="center" class="LeftTD" style="height: 30px" valign="middle" colspan="2">&nbsp;</td>
                                             <td align="center" class="style5" valign="middle" width="150">&nbsp;</td>
                  </tr>
        </table>
            </td>
        </tr>
      </table>  
      </td>
  </tr>
</table>
    </form>
</body>
</html>
