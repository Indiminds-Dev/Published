<%@ page language="C#" autoeventwireup="true" inherits="management_frm_LeaveApplication_popup, App_Web_bfdn6hbr" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Leave Balance</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
</head>
<body onload="window.focus()" style="background-color: #DDECFE">
    <form id="form1" runat="server">
        <table>
            <tr>
                <td class="gridcellleft">
                    <span class="Ecoheadtxt" style="color: Blue"><strong>PL</strong></span>
                </td>
                <td class="gridcellleft">
                    <asp:Label ID="lblPL" runat="server" Text="0.0"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="gridcellleft">
                    <span class="Ecoheadtxt" style="color: Blue"><strong>CL</strong></span>
                </td>
                <td class="gridcellleft">
                    <asp:Label ID="lblCL" runat="server" Text="0.0"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="gridcellleft">
                    <span class="Ecoheadtxt" style="color: Blue"><strong>SL</strong></span>
                </td>
                <td class="gridcellleft">
                    <asp:Label ID="lblSL" runat="server" Text="0.0"></asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
