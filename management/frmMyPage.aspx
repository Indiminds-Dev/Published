<%@ page language="C#" autoeventwireup="true" inherits="Reports_frmMyPage, App_Web_npkqnqtr" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script language="Javascript" type="text/javascript">
      function frmOpenNewWindow1(url,title,v_height,v_weight)
    {
        parent.OnMoreInfoClick(url,title,v_height,v_weight,"Y");
    }
    function height()
 {
  
    if(document.body.scrollHeight>=350)
    {
        window.frameElement.height = document.body.scrollHeight;
    }
    else
    {
        
        window.frameElement.height = '350px';
    }
    window.frameElement.width = document.body.scrollWidth;
 }
 
    </script>

</head>
<body style="background-color: #DDECFE">
    <form id="form1" runat="server">
        <table class="TableMain100">
            <tr>
                <td colspan="3" class="EHEADER" align="center" style="font-weight: bold; color: Maroon">
                    USER DETAILS</td>
            </tr>
            <tr>
                <td valign="top">
                    <table class="TableMain100">
                        <tr>
                            <td>
                                <asp:HyperLink ID="HpMarkAttendance" runat="server" NavigateUrl="javascript:void(0)"
                                    Font-Underline="True" ForeColor="#8080FF">Mark Attendance </asp:HyperLink></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:HyperLink ID="HpAttendance" runat="server" NavigateUrl="javascript:void(0)"
                                    Font-Underline="True" ForeColor="#8080FF">Attendance Register</asp:HyperLink></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:HyperLink ID="HpLeaveRegister" runat="server" NavigateUrl="javascript:void(0)"
                                    Font-Underline="True" ForeColor="#8080FF">Leave Register</asp:HyperLink></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:HyperLink ID="HpPaySlipe" runat="server" NavigateUrl="javascript:void(0)" Font-Underline="True"
                                    ForeColor="#8080FF">PaySlip</asp:HyperLink></td>
                        </tr>
                    </table>
                </td>
                <td valign="top">
                    <table class="TableMain100">
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Name:" CssClass="mylabel1"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblName" runat="server" Text="" ForeColor="rosybrown" Width="500px" Font-Bold="true" ></asp:Label>
                            </td>
                            
                        </tr>
                        <tr>
                        <td> <asp:Label ID="Label7" runat="server" Text="Code:" CssClass="mylabel1"></asp:Label></td>
                        <td><asp:Label ID="lblCode" runat="server" Text="" ForeColor="rosybrown" Width="500px" Font-Bold="true" ></asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="Address:" CssClass="mylabel1"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblAdd" runat="server" Text="" ForeColor="rosybrown" Width="500px" Font-Bold="true"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text="Phone No:" CssClass="mylabel1"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblPhone" runat="server" Text="" ForeColor="rosybrown" Width="500px" Font-Bold="true"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label4" runat="server" Text="Email:" CssClass="mylabel1"></asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="lblEmail" runat="server" Text="" ForeColor="rosybrown" Width="500px" Font-Bold="true"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label5" runat="server" CssClass="mylabel1" Text="Company:"></asp:Label></td>
                            <td><asp:Label id="lblCompany" runat="server" ForeColor="rosybrown" Text="" Width="500px" Font-Bold="true"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label6" runat="server" CssClass="mylabel1" Text="Branch:"></asp:Label></td>
                            <td><asp:Label id="lblBranch" runat="server" ForeColor="rosybrown" Text="" Width="500px" Font-Bold="true"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
                <td valign="top">
                    <table>
                        <tr>
                            <td style="width: 31px">
                                <asp:Image ID="iPhoto" runat="server" Width="100px" Height="100px" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
