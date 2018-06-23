<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home_ManageShow.aspx.cs" Inherits="Design.Home_ManageShow" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <link href="CSS/style.css" type="text/css" rel="Stylesheet" /> 
    <style type="text/css">
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table class="style1">
         <tr><td align="center">
                       <table align="center">
                            <tr><td align="left" valign="top" width="450">
                                          <table bgcolor="#eeeeee" cellpadding="5" cellspacing="5" width="99%">
                                                 <tr><td height="35" class="style1"><font color="#ff6600" size="3"><b><%=strWelName%></b></font></td></tr>
                                                 <tr><td><font color="#003300">你已设置基本资料。</font><a href="CreatPerHome.aspx" target="_blank">点此更新</a></td></tr>
                                                 <tr><td><font color="#003300">你的空间地址: </font><%=strMyPerHome %></td></tr>
                                                 <tr><td><%=strperhome%></td></tr>
                                         </table>
                                         <iframe id="I1" frameborder="0" height="300%" name="I1" scrolling="no" width="99%"></iframe>
                                  </td>
                           </tr>
                     </table>
               </td>
      </tr>
    </table>
    <div>
    
    </div>
    </form>
</body>
</html>
