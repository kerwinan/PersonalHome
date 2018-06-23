<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="User_Login.ascx.cs" Inherits="Design.UserControl.User_Login" %>

<tr>
  <td style="text-align:left">
    <div style="text-align:center"> 
        <table style="width: 211px;text-align:left">
            <tr>
                <td style="text-align:right;font-size:small">
                    帐号：</td>
                <td style="text-align:left">
                    <asp:TextBox ID="UserName" runat="server" Width="113px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="font-size: small;text-align:right">
                    密码：</td>
                <td style="text-align:left">
                    <asp:TextBox ID="UserPwd" runat="server" Width="114px" TextMode="Password" 
                        Height="16px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="font-size: small;text-align:right">验证：</td>
                <td style="font-size: x-small;text-align:left">
                    <asp:TextBox ID="Validator" runat="server" Width="40px" Height="16px" ></asp:TextBox>  
                    <img src="CreatePic.aspx" id="valiCode" alt="验证码" />
                    <a title="刷新验证码" onclick="javascript:document.getElementById('valiCode').src='CreatePic.aspx?id='+Math.random();return false;">换图</a>
                </td>
            </tr>
            <tr>
                <td style="text-align:center" colspan="2">
                    <asp:ImageButton ID="imgbtnEnter" runat="server" ImageUrl="~/images/登录按钮.gif" 
                        onclick="imgbtnEnter_Click" CausesValidation="False" />
                    <asp:Label ID="lblMessage" runat="server" Font-Size="Small"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align:center" colspan="2">
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
            </td>
   </tr>