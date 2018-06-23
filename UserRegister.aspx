<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegister.aspx.cs" Inherits="Design.UserRegister" %>

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
        <table style="width:1004px;height:84px" border="0" cellspacing="0">
              <tr><td style="background:url(images/我的个人空间.jpg)"><span style="width:394px; height:39px;  padding-top:45px; padding-left:610px; ">
                  <a href="Default.aspx">首页</a> 　　
                  <a href="Default.aspx">登录</a>　　　 
                  <a href="UserRegister.aspx">注册</a>　　 
                  <a href="Default.aspx">会员日志</a>　　　 
                  <a href="Home_List.aspx">随变逛逛</a></span></td>
              </tr>
        </table>
<table width="968" border="0" cellspacing="0">
  <tr><td width="223" rowspan="2" align="center" valign="top"><br />
                <table width="759" border="0" cellspacing="0">
                     <tr><td height="34" align="left" valign="top"><img src="images/会员注册.jpg" width="760" height="34" /></td></tr>
                     <tr><td width="759" align="center" valign="top"><br />
                                   <table border="1" cellpadding="2" cellspacing="0" class="Table" style="width: 88%; height: 351px;" align="center">
                                         <tr><td colspan="2">&nbsp;</td></tr>
                                         <tr><td colspan="2">以下内容是必填内容：<asp:Label ID="LblStr" runat="server" Text="Label" Width="202px" ForeColor="white"></asp:Label></td></tr>
                                         <tr style="color: #000000; font-size: 9pt;"><td align="right" class="LeftTD" height="30" valign="middle" width="150">用户名称:</td>
                                                                                                              <td valign="middle" align="left"><asp:TextBox ID="tbUserName" runat="server" Width="149px" AutoPostBack="True"></asp:TextBox>
                                                                                                                                                                     <asp:RequiredFieldValidator ID="rfUN" runat="server" ControlToValidate="tbUserName" Display="Dynamic" ErrorMessage="不能为空。"></asp:RequiredFieldValidator>
                                                                                                                                                                     <asp:ImageButton ID="imgbtnCheck" runat="server" ImageUrl="~/images/检查用户名.jpg" onclick="imgbtnCheck_Click" CausesValidation="False" />
                                                                                                                                                                     <asp:Label ID="labIsName" runat="server" Font-Size="12px"></asp:Label><br />
                                                                                                                                                                      用户名称即为登录名称，整个网站唯一；一旦注册之后，不能更改。<br />用户名称 
                                                                                                                                                                     <asp:Label ID="labUser" runat="server" Font-Size="12px" Text="只能输入数字、字母、下划线" Width="159px" ForeColor="#FF3300"></asp:Label>！<br /><br />
                                                                                                             </td>
                                       </tr>
                                       <tr style="font-size: 9pt"><td align="right" class="LeftTD" height="30" valign="middle" width="150">&nbsp;用户密码:</td>
                                                                                  <td valign="middle" class="style1" align="left"><asp:TextBox ID="tbPassword" runat="server" CssClass="TextBox" MaxLength="255" SkinID="tbSkin" TextMode="Password" Width="150px"></asp:TextBox><asp:RequiredFieldValidator ID="rfPwd" runat="server" ControlToValidate="tbPassword" Display="Dynamic" ErrorMessage="不能为空。"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="rePwd" runat="server" ControlToValidate="tbPassword" Display="Dynamic" ErrorMessage="密码最小长度为6。" ValidationExpression="\S{6,}"></asp:RegularExpressionValidator>
                                                                                        <br />密码长度至少为6，且至少包含一个非字母字符。
                                                                                  </td>
                                       </tr>
                                       <tr style="font-size: 9pt"><td align="right" class="LeftTD" height="30" valign="middle" width="150">确认密码:</td>
                                                                                  <td valign="middle" class="style1" align="left"><asp:TextBox ID="tbPasswordStr" runat="server" CssClass="TextBox" MaxLength="255" SkinID="tbSkin" TextMode="Password" Width="150px"></asp:TextBox>
                                                                                                                                                                <asp:CompareValidator ID="cvPwd" runat="server" ControlToCompare="tbPassword" ControlToValidate="tbPasswordStr" Display="Dynamic" ErrorMessage="两次输入的密码不相同！"></asp:CompareValidator></td>
                                       </tr>
                                       <tr style="font-size: 9pt"><td align="right" class="LeftTD" height="30" valign="middle" width="150">用户性别:</td>
                                                                                  <td valign="middle" class="style1" align="left"><asp:RadioButtonList ID="radlistSex" runat="server" RepeatDirection="Horizontal" Width="95px" Font-Size="12px">
                                                                                                                                                                <asp:ListItem Selected="True"> 男</asp:ListItem>
                                                                                                                                                                <asp:ListItem>女</asp:ListItem></asp:RadioButtonList>
                                                                                  </td>
                                       </tr>
                                       <tr style="font-size: 9pt"><td align="right" class="LeftTD" height="30" valign="middle" width="150">电子邮件:</td>
                                                                                  <td valign="middle" class="style1" align="left"><asp:TextBox ID="tbEmail" runat="server" CssClass="TextBox" MaxLength="255" SkinID="tbSkin" Width="294px"></asp:TextBox><asp:RequiredFieldValidator ID="rfEmail" runat="server" ControlToValidate="tbEmail" Display="Dynamic" ErrorMessage="不能为空。"></asp:RequiredFieldValidator>
                                                                                                                                                                <asp:RegularExpressionValidator ID="reEmail" runat="server" ControlToValidate="tbEmail" Display="Dynamic" ErrorMessage="电子邮件格式不正确。" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
                                       </tr>
                                       <tr style="font-size: 9pt"><td align="right" class="LeftTD" height="30" valign="middle" width="150">密码提示问题：</td>
                                                                                  <td valign="middle" class="style1" align="left"><asp:TextBox ID="txtPassQuestion" runat="server" Width="294px"></asp:TextBox></td>
                                       </tr>
                                       <tr style="font-size: 9pt"><td align="right" class="LeftTD" height="30" valign="middle" width="150">密码提示答案：</td>
                                                                                 <td valign="middle" class="style1" align="left"><asp:TextBox ID="txtPassAnswer" runat="server" Width="294px"></asp:TextBox></td>
                                       </tr>
                                       <tr style="font-size: 9pt"><td align="right" class="LeftTD" style="height: 30px" valign="middle" width="150"><asp:Label ID="Label1" runat="server" Width="150px"></asp:Label></td>
                                                                                 <td valign="middle" class="style2" align="left"><asp:Label ID="Label2" runat="server" Text="温馨提示：注册成本站会员后就可以定制个性空间！" ForeColor="#CC3399"></asp:Label></td>
                                       </tr>
                                       <tr style="font-size: 9pt"><td align="center" class="LeftTD" style="height: 30px" valign="middle" colspan="2">
                                                                                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/立即注册.jpg" onclick="ImageButton1_Click" />
                                                                                 </td>
                                       </tr>
                                </table>                  
                        </td>
                  </tr>
             </table>
            <br /><br />    
      </td>
      <td width="723" height="228" align="center" valign="top">
              <table style="width:239px;height:229px;background:url(images/会员登录.jpg)" border="0" cellpadding="0" cellspacing="0">
                      <tr><td height="55">&nbsp;</td></tr>
                      <tr><td height="65" align="center" valign="top">
                                     <table style="height:60px" width="80%" border="0" cellpadding="0" cellspacing="0">
                                          <tr><td width="41%" align="right" style="width: 100%">
                                                             <uc1:User_Login ID="User_Login1" runat="server" /></td></tr>
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
