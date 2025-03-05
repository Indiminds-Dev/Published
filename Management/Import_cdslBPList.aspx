<%@ page language="C#" autoeventwireup="true" inherits="management_Import_cdslBPList, App_Web_zsukfi_p" %>

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
     <asp:Panel ID="Panelmain" runat="server" Visible="true">
        <table id="tbl_main" class="login" cellspacing="0" cellpadding="0" width="410">
            <tbody>
                <tr>
                    <td class="lt1">
                        <h5>
                            Import Busniess Partner                        </h5>
                    </td>
                </tr>
                <tr>
                    <td class="lt brdr" style="height: 280px">
                        <table cellspacing="0" cellpadding="0" align="center" width="100%">
                            <tbody>
                                <tr>
                                    <td class="lt" style="width: 369px">
                                        <table class="width100per" cellspacing="5" cellpadding="0">
                                            <tbody>
                                                <tr>
                                                    <td class="lt" style="width: 400px; height: 22px">
                                                        Partner&nbsp; Type:</td>
                                                    <td class="lt" style="width: 200px; height: 22px">
                                                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="lt" Width="190px">
                                                            <asp:ListItem Value="BPList">CD01-DP Report</asp:ListItem>
                                                            <asp:ListItem Value="Rt">CD02-RTA</asp:ListItem>
                                                            <asp:ListItem Value="Ex">CD04-Exchange</asp:ListItem>
                                                            <asp:ListItem Value="Is">CD05-Issuer</asp:ListItem>
                                                            <asp:ListItem Value="cdslcm">CD011-CM Master Report</asp:ListItem>
                                                        </asp:DropDownList></td>
                                                </tr>
                                                <tr>
                                                    <td class="lt">
                                                    </td>
                                                    <td class="lt" style="width: 278px; height: 22px;">
                                                        <asp:Label ID="importstatus" runat="server" Font-Size="XX-Small" Font-Names="Arial"
                                                            Font-Bold="True" ForeColor="Red" />
                                                    </td>
                                                </tr>
                                               
                                               
                                                <tr>
                                                    <td class="lt">
                                                    File Path :
                                                    </td>
                                                    <td align="right" style="width: 278px; height: 22px;">
                                                        <asp:FileUpload ID="OFDSelectFile" runat="server" Width="272px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="middle" colspan="2">
                                                        <table cellspacing="0" cellpadding="0">
                                                            <tbody>
                                                                <tr>
                                                                    <td valign="top" align="left" style="height: 19px">
                                                                        <asp:Button ID="BtnSave" runat="server" Text="Import File" CssClass="btn" OnClick="BtnSave_Click"
                                                                            Width="84px" />
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr style="display: none">
                                                    <td>
                                                        </td>
                                                    <td>
                                                        </td>
                                                    <td>
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
    </asp:Panel>
    </div>
    </form>
</body>
</html>
