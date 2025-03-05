<%@ page language="C#" autoeventwireup="true" inherits="management_Reco_PhillipLedger, App_Web_0payuukt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head id="Head1" runat="server">
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
        if(document.body.scrollHeight>=200)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '200px';
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
                            Import PHILLIP_Financial_Summary CSV Files To Reconcile Broker Account Balances In The BO System
                        </h5>
                    </td>
                </tr>
                <tr>
                    <td class="lt brdr">
                        <table cellspacing="0" cellpadding="0" align="center">
                            <tbody>
                                <tr>
                                    <td class="lt">
                                        <table class="width100per" cellspacing="12" cellpadding="0">
                                            <tbody>
                                                <tr>
                                                    <td class="lt">
                                                    </td>
                                                    <td class="lt" >
                                                        <asp:Label ID="importstatus" runat="server" Font-Size="XX-Small" Font-Names="Arial"
                                                            Font-Bold="True" ForeColor="Green" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lt">
                                                    </td>
                                                    <td align="right">
                                                        <asp:FileUpload ID="OFDSelectFile" runat="server" Width="490px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" valign="middle" colspan="2">
                                                        <table cellspacing="0" cellpadding="0">
                                                            <tbody>
                                                                <tr>
                                                                    <td valign="top" align="left" style="height: 19px">
                                                                        <asp:Button ID="BtnSave" runat="server" Text="Generate Reco Report" CssClass="btn" OnClick="BtnGenerate_Click"
                                                                            Width="200px" />
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <asp:HiddenField ID="hdnPath" runat="server" />
                                        <asp:HiddenField ID="hdnFileName" runat="server" />
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
