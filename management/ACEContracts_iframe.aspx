<%@ page language="C#" autoeventwireup="true" inherits="management_ACEContracts_iframe, App_Web_1jeyysc_" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="head1" runat="server">
    <title>Import ACE Contract</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script language="javascript" type="text/javascript">

        function height()
    {
                    
        if(document.body.scrollHeight>250)
            window.frameElement.height = document.body.scrollHeight;
            window.frameElement.widht = document.body.scrollWidht;
        else
            window.frameElement.height = '250px';
            window.frameElement.widht = document.body.scrollWidht;
        
    }

    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panelmain" runat="server" Visible="true" HorizontalAlign="Center">
                <table id="tbl_main" class="login" cellspacing="0" cellpadding="0" width="410px"
                    style="border: solid 1px blue">
                    <tbody>
                        <tr>
                            <td class="EHEADER">
                                <span style="color: Blue"><strong>ACE Contracts</strong></span></td>
                        </tr>
                        <tr>
                            <td class="lt">
                                <table class="TableMain100" cellspacing="12" cellpadding="0">
                                    <tbody>
                                        <tr>
                                            <td align="right" style="width: 278px">
                                                <asp:FileUpload ID="ACESelectFile" runat="server" Width="272px" Height="21px" />
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
