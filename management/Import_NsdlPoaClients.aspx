<%@ page language="C#" autoeventwireup="true" inherits="management_frmImportNsdlClients, App_Web_n2fxndvz" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
     <script language="javascript" type="text/javascript">
       function Page_Load()///Call Into Page Load
            {
              
              height();
 
            }
    function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
    {
        if(document.body.scrollHeight>=400)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '400px';
        window.frameElement.Width = document.body.scrollWidth;
    }
    </script>
</head>
<body  style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div align="center">
    <table id="tbl_main" class="login" cellspacing="0" cellpadding="0" width="410">
        <tbody>
            <tr>
                <td class="lt1" >
                    <h5>
                        Imports NSDL POA Clients
                    </h5>
                </td>
            </tr>
          
            <tr>
                <td class="lt brdr" style="height: 280px">
                    <table cellspacing="0" cellpadding="0" align="center">
                        <tbody>
                            <tr>
                                <td class="lt">
                                    <table class="width100per" cellspacing="12" cellpadding="0">
                                        <tbody>
                                            <tr>
                                                <td colspan="2" style="width: auto; height: 14px;">
                                                    <asp:Label ID="lblImportStatus" runat="server" Font-Size="X-Small" Font-Names="Arial"
                                                        Font-Bold="True" ForeColor="Red" />
                                                </td>
                                            </tr>
                                            <tr>
                                            <td ><b>Select Version : </b></td>
                                                <td>
                                                    <asp:DropDownList ID="ddlVersion" runat="server" Width="268px" OnSelectedIndexChanged="ddlVersion_SelectedIndexChanged" AutoPostBack="True">
                                                        <asp:ListItem Text="POA HOLDER DOWNLOAD" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="CORPORATE POA DOWNLOAD" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="CLIENT POA MAPPING DOWNLOAD" Value="3"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><b>
                                                Select File :</b>
                                                </td>
                                                <td class="lt" style="height: 20px">
                                                    <asp:FileUpload ID="FileUpload1" runat="server" Width="276px" />
                                                </td>
                                            </tr>
                                            <tr><td colspan=2 align="left">
                                                Eg:
                                                <asp:Label ID="lblMsg" runat="server" Width="2px">10000000000775_POA_Hldr_Auth_DWLD_20110215123718_F_DONE.txt</asp:Label></td></tr>
                                            <tr>
                                                
                                                <td class="lt" colspan=2 id="tdSignature" runat="server">
                                                    <asp:CheckBox ID="CheckBox1" runat="server" />Update Signature
                                                </td>
                                            </tr> 
                                            <tr>
                                                <td>
                                                    <table cellspacing="0" cellpadding="0">
                                                        <tbody>
                                                            <tr>
                                                                <td>
                                                                    <asp:Button ID="btnImport" runat="server" Text="Import File" CssClass="btn" OnClick="btnImport_Click"
                                                                        Width="84px" />
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                         
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
    </div>
    </form>
</body>
</html>
