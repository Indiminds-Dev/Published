<%@ page language="C#" autoeventwireup="true" inherits="management_frmImportNsdlHoldings, App_Web_8qixh_8w" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">
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
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div align="center">
    <table id="tbl_main" class="login" cellspacing="0" cellpadding="0" width="410">
        <tbody>
            <tr>
                <td class="lt1" style="height: 40px">
                    <h5>
                        Imports NSDL Holdings
                    </h5>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="width: auto; height: auto;">
                    <strong>This Routine Imports "NSDL Holdings" file available from NSDL DPM System </strong>
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
                                            <td style="text-align:right">Select Version : </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlVersion" runat="server">
                                                        <asp:ListItem Text="E-DPM" Value="E-DPM"></asp:ListItem>
                                                        <asp:ListItem Text="DPM(Old)" Value="DPM(Old)"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lt" width="25%"  style="height: 22px;text-align:right ">
                                                Select file :
                                                </td>
                                                <td class="lt" style="width: 75%; height: 22px;">
                                                    <asp:FileUpload ID="FileUpload1" runat="server" Width="276px" />
                                                </td>
                                            </tr>
                                            <%--<tr>
                                                <td class="lt" width="25%" style="height: 22px">
                                                </td>
                                                <td class="lt" style="width: 75%; height: 22px;">
                                                    
                                                </td>
                                            </tr> --%>
                                            <tr>
                                                <td align="right" valign="middle" colspan="2">
                                                    <table cellspacing="0" cellpadding="0">
                                                        <tbody>
                                                            <tr>
                                                                <td valign="top" align="right" style="height: 19px">
                                                                    <asp:Button ID="btnImport" runat="server" Text="Import File" CssClass="btn" OnClick="btnImport_Click"
                                                                        Width="84px" />
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr style="display: none">
                                                <td>
                                                    <asp:TextBox ID="TextBox1" runat="server" Width="272px">TempTable</asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TextBox2" runat="server" Width="272px">Import/Table</asp:TextBox>
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
