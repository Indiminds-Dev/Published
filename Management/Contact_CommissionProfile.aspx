<%@ page language="C#" autoeventwireup="true" inherits="management_Contact_CommissionProfile, App_Web_gflohp-r" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
     <link href="../CSS/style.css" rel="stylesheet" type="text/css" />
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div>
    <table class="TableMain100">
    <tr>
    <td>
    Company:
    </td>
    <td>
     <asp:DropDownList ID="cmbOrganization" runat="server" Width="205px" Font-Size="11px"
                                        TabIndex="24">
                                    </asp:DropDownList>
    </td>
    
    </tr>
    <tr>
    <td>
    Profile Type:
    </td>
    <td>
      <asp:DropDownList ID="drpType" Width="203px" Font-Size="11px" runat="server" TabIndex="7" Enabled="false">
                                       <asp:ListItem Text="Group" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Specific" Value="1"></asp:ListItem>
                                    </asp:DropDownList>
    </td>
    
    </tr>
    <tr>
    <td>
    Group Code:
    </td>
    <td>
     <asp:DropDownList ID="drpGroupCode" runat="server" Width="205px" Font-Size="11px"
                                        TabIndex="24">
                                    </asp:DropDownList>
    </td>
    
    </tr>
        <tr>
    <td>
   From Date:
    </td>
    <td>
      <dxe:ASPxDateEdit ID="txtFromDate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                        TabIndex="9" Width="202px">
                                        <buttonstyle width="13px">
                                            </buttonstyle>
                                    </dxe:ASPxDateEdit>
    </td>
    
    </tr>
    <tr>
    <td>
    
    </td>
    <td>
       <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btnUpdate" OnClick="btnSave_Click"
                                        TabIndex="31" ValidationGroup="a" />
                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btnUpdate" OnClientClick="Close()"
                                        TabIndex="32" />
    </td>
    </tr>
    </table>
    </div>
    </form>
</body>
</html>
