<%@ page language="C#" autoeventwireup="true" inherits="management_icexclosingRats_iframe, App_Web_alid8jfz" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Closing Rates</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script language="javascript" type="text/javascript">

    function height()
    {
         
        if(document.body.scrollHeight>250)
        {
            window.frameElement.height = document.body.scrollHeight;
            window.frameElement.widht = document.body.scrollWidht;
        }
        else
        {
            window.frameElement.height = '250px';
            window.frameElement.widht = document.body.scrollWidht;
        }
        
    }

    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panelmain" runat="server" Visible="true" HorizontalAlign="Center">
                <table id="tbl_main" class="login" cellspacing="0" cellpadding="0" width="410px"  style="border: solid 1px blue">
                    <tbody>
                    <tr>
                            <td class="EHEADER">
                                <span style="color: Blue"><strong>Closing Rates</strong></span></td>
                        </tr>
                        <tr>
                            <td class="lt">
                                <table class="width100per" cellspacing="12" cellpadding="0" style="width: 100%">
                                    <tbody>
                                        <tr>
                                            <td class="gridcellleft">
                                                <span style="color: #000099; text-align: right;">Market Stats</span></td>
                                            <td align="right" style="width: 278px;">
                                                <asp:FileUpload ID="MarketStatsSelectFile" runat="server" Width="272px" Height="21px" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="gridcellleft">
                                                <span style="color: #000099">Open Interest</span></td>
                                            <td align="right" style="width: 278px">
                                                <asp:FileUpload ID="OpenInterestSelectFile" runat="server" Width="272px" Height="21px" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" valign="middle" colspan="2">
                                                <table cellspacing="0" cellpadding="0">
                                                    <tbody>
                                                        <tr>
                                                            <td valign="top" align="left">
                                                                <asp:Button ID="BtnSave" runat="server" Text="Import File" CssClass="btn" OnClick="BtnSave_Click"
                                                                    Width="84px" />
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr id="trYesNo" runat="server">
                                            <td align="left">
                                                <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Width="258px"></asp:Label>
                                            </td>
                                            <td align="left" style="text-align: right">
                                                <asp:Button ID="btnYes" runat="server" CssClass="btn" Text="Yes" OnClick="btnYes_Click" />
                                                <asp:Button ID="btnNo" runat="server" CssClass="btn" Text="No" OnClick="btnNo_Click" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <asp:HiddenField ID="hdfname" runat="server" />
            </asp:Panel>
        </div>
    </form>
</body>
</html>
