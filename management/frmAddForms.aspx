<%@ page language="C#" autoeventwireup="true" inherits="management_frmAddForms, App_Web_d1rqvttb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
    <script type="text/javascript" language="javascript">
    function dhtmlclose()
    {
   
    parent.editwin.close();
    }
    
    </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
    <div align="center">
    <table class="TableMain100">
      <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Forms & Notices <asp:Label ID="lblP" runat="server"
                            Text="Label"></asp:Label></span></strong>
                    </td>
                </tr>
    <tr><td>
    <table  width="500px" style="border:solid 1px white;">
        <tr>
            <td class="gridcellright" >
                File Name</td>
            <td style="height: 24px">
                :</td>
            <td class="gridcellleft">
                <asp:TextBox ID="txtName" runat="server"  Width="350px"></asp:TextBox></td>
        </tr>
            <tr>
                <td class="gridcellright">Form Description</td><td>:</td>
                <td class="gridcellleft"><asp:textbox ID="txtFile" runat="Server" Width="350px" Height="75px"></asp:textbox></td>
            </tr>
            <tr>
                <td class="gridcellright">
                    Upload File: </td><td>:</td>
                <td class="gridcellleft"><input type="file" runat="Server" id="txtfilename" name="txtfilename" /></td>
            </tr>
          <%--  <tr>
                <td valign="top">
                    Keep Personal</td><td valign="top">:</td>
                
                <td class="gridcellleft">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                        <asp:ListItem Selected="True" Value="0" Text="No"></asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>--%>
           <tr>
                <td colspan="3" align="Center">
                    <asp:Button ID="btnAddForm" runat="Server" Text="Add" Width="100px" CssClass="btnUpdate" OnClick="btnAddForm_Click" />
                    <asp:Button ID="btnDocumentDiscard" runat="Server" Text="Discard" Width="100px"  CssClass="btnUpdate" OnClick="btnDocumentDiscard_Click"  />
                </td>
            </tr>
        </table></td></tr></table>
    </div>
    </form>
</body>
</html>
