<%@ page language="C#" autoeventwireup="true" inherits="Reports_CustomerEmailDetails, App_Web_rjq8jf2h" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
   
</head>
<body style="font-family:Verdana;font-size:8pt;background-color:#DDECFE;">
    <form id="form1" runat="server">
    <div>
    <table  style="border: solid 1px white;" cellpadding="2" cellspacing="3">
                <tr>
                    <td align="center">
                        <table width="100%" style="border: solid 1px white;">
                            <tr>
                                <td style="font-size: 12px; font-weight: bold;" width="20px">
                                    <asp:Label ID="lblType" runat="server"></asp:Label>:</td>
                                <td align="left">
                                <div style="width:800px;" >
                                    <asp:Label ID="lblName" runat="server"></asp:Label><asp:Label ID="lblEmail" runat="server"></asp:Label><br />
                                </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <table width="100%" style="border: solid 1px white;">
                            <tr>
                                <td style="font-size: 12px; font-weight: bold;" width="20px">
                                    Subject:</td>
                                <td align="left" >
                                    <asp:Label ID="lblSub" runat="server"></asp:Label><br />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                <td style="font-size: 12px; font-weight: bold;" valign="top">
                Content:
                </td>
                </tr>
                <tr>
                    <td align="center">
                   
            <%--<asp:Label ID="lblContent" runat="server"></asp:Label>--%>
                  <table width="100%"  style="border: solid 1px white;">
                            <tr>
                          
                                <td align="left" style="background-color:White;">
                                    <asp:Label ID="lblContent" runat="server"></asp:Label>
                                    
                                    </td>
                            </tr>
                        </table>
                        
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12px; font-weight: bold;" valign="top">
                        Attachments:
                    </td>
                </tr>
             
                    <tr>
                        <td align="left">
                         
                            <asp:Label ID="lblAtt" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-size: 12px; font-weight: bold;" valign="top">
                            Email Delivery Log:
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                       
                            <asp:Label ID="lblLog" runat="server"></asp:Label>
                        </td>
                    </tr>
            </table>
    </div>
    </form>
</body>
</html>
