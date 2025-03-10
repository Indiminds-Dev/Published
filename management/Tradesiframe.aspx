<%@ page language="C#" autoeventwireup="true" inherits="management_Tradesiframe, App_Web_snhbal_j" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script language="javascript" type="text/javascript">
    function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
    {
        if(document.body.scrollHeight>=350)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '350px';
        window.frameElement.Width = document.body.scrollWidth;
    }
    </script>
    </head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center">
            <asp:Panel ID="Panelmain" runat="server" Visible="true">
                <table id="tbl_main" class="login" cellspacing="0" cellpadding="0" width="410">
                    <tbody>
                        <tr>
                            <td class="lt1" style="height: 22px">
                                <h5>
                                    Import Various Trade Files of NSE's CM Segment
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
                                                            <tr>
                                                                <td>
                                                                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                                                                    </asp:ScriptManager>
                                                                </td>
                                                            </tr>
                                                            <td class="lt" colspan="2">
                                                                <div id="divStatus" runat="server">
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lt" colspan="2">
                                                                <div id="divCust" runat="server">
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lt" colspan="2">
                                                                <div id="divProd" runat="server">
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr id="trYesNo" runat="server">
                                                            <td>
                                                                <table width="100%">
                                                                    <tr>
                                                                        <td align="center">
                                                                            <table width="100%">
                                                                                <tr>
                                                                                    <td>
                                                                                        <asp:Label ID="lblYesNo" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <table width="100%">
                                                                                            <tr>
                                                                                                <td align="right">
                                                                                                    <asp:Button ID="btnYes" runat="server" CssClass="btn" Text="Yes" OnClick="btnYes_Click" />
                                                                                                </td>
                                                                                                <td align="left">
                                                                                                    <asp:Button ID="btnNo" runat="server" CssClass="btn" Text="No" OnClick="btnNo_Click" />
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lt">
                                                                <asp:Label ID="importstatus" runat="server" Font-Size="XX-Small" Font-Names="Arial"
                                                                    Font-Bold="True" ForeColor="Red" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lt">
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                                                <ContentTemplate>
                                                                                    <asp:DropDownList ID="ddlFileList" runat="server" Width="192px" AutoPostBack="True"
                                                                                        Height="19px" OnSelectedIndexChanged="ddlFileList_SelectedIndexChanged">
                                                                                        <asp:ListItem Value="0">Select</asp:ListItem>
                                                                                        <asp:ListItem Value="1">Final CSV</asp:ListItem>
                                                                                        <asp:ListItem Value="4">Neat/Notice/Prov/Final/UDiFF files</asp:ListItem>
                                                                                        <asp:ListItem Value="5">Odin Txt</asp:ListItem>
                                                                                        <asp:ListItem Value="6">Now/BEST Txt</asp:ListItem>
                                                                                        <asp:ListItem Value="7">Greek Txt</asp:ListItem>
                                                                                        <asp:ListItem Value="8">Now_OLD Txt</asp:ListItem>
                                                                                        <asp:ListItem Value="9">Omne txt</asp:ListItem>
                                                                                        <asp:ListItem Value="10">Flex txt</asp:ListItem>
                                                                                        <asp:ListItem Value="11">OdinDEF txt/XTS Csv Files</asp:ListItem>
											                                            <asp:ListItem Value="12">Final txt [Old]</asp:ListItem>
                                                                                        <asp:ListItem Value="13">UpdateTradeModification</asp:ListItem>
                                                                                        <asp:ListItem Value="14">RTS Csv</asp:ListItem>
                                                                                        <asp:ListItem Value="15">OFS_TRD txt Files</asp:ListItem>
                                                                                        <asp:ListItem Value="16">FT-PT txt Files</asp:ListItem>
                                                                                        <asp:ListItem Value="17">SharePro txt Files</asp:ListItem>
                                                                                        <asp:ListItem Value="18">MOSL csv Files</asp:ListItem>
                                                                                        <asp:ListItem Value="19">JM Txt Files</asp:ListItem>
                                                                                        <asp:ListItem Value="20">BuyBack_TRD txt Files</asp:ListItem>
                                                                                        <asp:ListItem Value="21">Influx Txt/Manual Auction CSV</asp:ListItem>
                                                                                        <asp:ListItem Value="22">ATIN CSV</asp:ListItem>
                                                                                        <asp:ListItem Value="23">BLITZ CSV</asp:ListItem>
                                                                                        <asp:ListItem Value="24">WinTrade Txt Files</asp:ListItem>
                                                                                        <asp:ListItem Value="25">Other Formats</asp:ListItem>
                                                                                    </asp:DropDownList><br />
                                                                                    <asp:Label ID="lblMessage" runat="server" Width="270px"></asp:Label>
                                                                                </ContentTemplate>
                                                                            </asp:UpdatePanel>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:FileUpload ID="OFDSelectFile" runat="server" Width="272px" Height="23px" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Button ID="BtnSave" runat="server" Text="Import File" CssClass="btn" OnClick="BtnSave_Click"
                                                                                Width="84px" />
                                                                        </td>
                                                                    </tr>
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
            </asp:Panel>
               <table>
    <tr>
    <td style="display:none;">
            <asp:HiddenField ID="hdfname" runat="server" />
            <asp:HiddenField ID="hdnDate" runat="server" />
            <asp:HiddenField ID="hdnTerminalID" runat="server" />
            <asp:TextBox ID="txtClient_hidden" runat="server" Width="5px"></asp:TextBox>
    </td>
    </tr>
    </table>
        </div>
    </form>
</body>
</html>
