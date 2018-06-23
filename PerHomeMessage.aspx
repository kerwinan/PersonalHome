<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PerHomeMessage.aspx.cs" Inherits="Design.PerHomeMessage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <style type="text/css">
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>    
        <table class="style1">
            <tr><td align="center">
                          <table align="center" cellpadding="0" cellspacing="0" class="style1">
                                <tr><td colspan="2"><asp:TextBox ID="TextBox1" runat="server" Height="180px" TextMode="MultiLine" Width="273px"></asp:TextBox>
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="内容不能为空！"></asp:RequiredFieldValidator>
                                       </td>
                                </tr>
                                <tr><td><asp:ImageButton ID="ImgBtnAdd" runat="server" ImageUrl="~/images/添加按钮.JPG" onclick="ImageButton1_Click" />
                                                <asp:ImageButton ID="ImgBtnReset" runat="server" ImageUrl="~/images/重置按钮_2.bmp" onclick="ImageButton2_Click" /><br /></td>
                                        <td>&nbsp;</td>
                               </tr>
                        </table>
                   </td>
          </tr>
     </table>    
    </div>
    </form>
</body>
</html>
