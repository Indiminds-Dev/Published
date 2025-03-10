<%@ page language="C#" autoeventwireup="true" inherits="management_frm_ImportFSD0n, App_Web_n2fxndvz" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Stamp Duty Payable Statement of F&O [F_SD0n]</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">
    function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
    {
        if(document.body.scrollHeight>=300)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '300px';
        window.frameElement.Width = document.body.scrollWidth;
    }
    </script>
<script type="text/javascript" src="../JSFUNCTION/init.js"></script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div align="center">
            <asp:Panel ID="Panelmain" runat="server" HorizontalAlign="Center" Style="z-index: 100;
            left: 0px;top: 0px" Visible="true">
            <table id="tbl_main" cellpadding="0" cellspacing="0" class="login" style="height: 153px"
                width="410">
                <tbody>
                 <tr>
                    <td class="lt1" style="height: 22px">
                        <h5>
                            Imports NSE-FO's Trading Members' Stamp Duty Files..........**IMPORTANT**.. USER HAS TO FIRST IMPORT THE REGULAR STAMP FILE AND THEN PHYSICAL DELIVERY STAMP FILE
                        </h5>
                    </td>
                </tr>
                
                    <tr>
                        <td class="lt" style="height: 115px">
                            <table cellpadding="0" cellspacing="12" class="width100per" style="width: 100%">
                                <tbody>
                                    <tr>
                                        <td class="gridcellleft">
                                            <span style="color: #000099; text-align: right">Select File:</span></td>
                                        <td align="right" style="width: 278px; height: 22px">
                                            <asp:FileUpload ID="MarketStatsSelectFile" runat="server" Height="21px" Width="372px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" colspan="2" style="height: 20px" valign="middle">
                                            <table cellpadding="0" cellspacing="0">
                                                <tbody>
                                                    <tr>
                                                        <td align="left" style="height: 19px" valign="top">
                                                            <asp:Button ID="BtnSave" runat="server" CssClass="btn" OnClick="BtnSave_Click" Text="Import File"
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
                                            <asp:Button ID="btnYes" runat="server" CssClass="btn" OnClick="btnYes_Click" Text="Yes" />
                                            <asp:Button ID="btnNo" runat="server" CssClass="btn" OnClick="btnNo_Click" Text="No" />
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </tbody>
            </table>
            <%--</td>
                                </tr>
                                
                                   
                            </tbody>--%>
            <%--</table>--%>
            <asp:HiddenField ID="hdfname" runat="server" />
        </asp:Panel>
        </div>
    </form>
</body>
</html>
