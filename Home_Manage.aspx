<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home_Manage.aspx.cs" Inherits="Design.Home_Manage" %>

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
    <div>  
    <table width="792" height="84" border="0" cellspacing="0">
        <tr><td width="792" height="83"><img src="images/管理我的空间.jpg" width="792" height="83" /></td></tr>
    </table>
    <table width="792" border="0" cellspacing="0">
        <tr><td width="210" rowspan="2" align="center" valign="top"><br />
                      <table width="210" border="0" cellspacing="0">
                           <tr><td height="34" align="left" valign="top"><img src="images/我的天地.jpg" width="210" height="36" /></td></tr>
                           <tr><td width="759" valign="top">
                                         <table id="Table1" cellpadding="2" cellspacing="2" align="left">       
                                                  <tr><td><font color="#cccccc">★</font></td>
                                                          <td align="left">所有发布日志</td>
                                                   </tr>
                                                   <tr align="left"><td><font color="#cccccc">★</font></td>
                                                                              <td align="left">[空间]<a href="Art_Manage.aspx" class="bb">管理日志!</a></td>
                                                   </tr>
                                                   <tr><td colspan="2">&nbsp;</td></tr>                                                                                         
                                          </table>
                                    </td>
                         </tr>
                         <tr><td align="left" valign="top"><img src="images/我的地盘.jpg" width="210" height="36" /></td></tr>
                          <tr><td align="center" valign="top">
                                        <table id="Table2" cellpadding="2" cellspacing="2" align="left">                                                                                            
                                                <tr><td><font color="#cccccc">★</font></td>
                                                       <td align="left"><%=CreatePerHome%></td>
                                                </tr>
                                                <tr><td><font color="#cccccc">★</font></td>
                                                        <td align="left">[空间]<a href="AddPerArt.aspx" class="bb">发表日志!</a></td>
                                                </tr>         
                                                      <%=PerHomeInfo%>
                                                <tr><td><font color="#cccccc">★</font></td>
                                                        <td align="left"><%=myperhome%></td>
                                                </tr>                                                                                        
                                        </table>
                              </td>
                         </tr>
                         <tr><td align="center" valign="top"><img src="images/个人信息.jpg" width="210" height="36" /></td></tr>
                         <tr><td align="left" valign="top">
                                       <table id="Table3" cellpadding="2" cellspacing="2">                                               
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
                                                        <td><a href="LoginOut.aspx" class="bb">退出登录</a></td>
                                                 </tr>
                                                 <tr><td colspan="2">&nbsp;</td>
                                                 </tr>
                                        </table>
                              </td>
                      </tr>
                 </table>
      <p><br /><br /></p>
            </td>
            <td width="342" rowspan="2" align="center" valign="top">
                  <table width="100%" border="0">
                       <tr><td><p><iframe id="I1" frameborder="0" name="I1" scrolling="auto" src="Home_ManageShow.aspx" align="left"></iframe>
                                                                                                           </p><p>&nbsp;</p>
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
