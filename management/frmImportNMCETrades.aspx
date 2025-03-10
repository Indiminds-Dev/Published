<%@ page language="C#" autoeventwireup="true" inherits="management_frmImportNMCETrades, App_Web_e158i_8t" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Import NMCE Trades</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script language="javascript" type="text/javascript">
        function SignOff()
        {
            window.parent.SignOff();
        }
   function height()
    {
        if(document.body.scrollHeight>=500)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '500px';
        window.frameElement.Width = document.body.scrollWidth;
    }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panelmain" runat="server" Visible="true" HorizontalAlign="Center">
                <table id="tbl_main" class="login" cellspacing="0" cellpadding="0" runat="server"
                    width="510">
                    <tr>
                        <td class="lt1">
                            <h5>
                                Imports NMCE Trades
                            </h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="lt1">
                            <table class="width100per" cellspacing="0" cellpadding="0" style="height: 150px">
                                <tr>
                                    <td align="left" colspan="2">
                                        <b>Upload Pipe delimited File Only.</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                                        </asp:ScriptManager>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
                                        <ContentTemplate>
                                        <table  class="width100per" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td align="left" style="width:126px;">
                                                    Select File Type:
                                                </td>
                                                <td align="left">
                                                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                        <asp:ListItem Value="1">TMCL</asp:ListItem>
                                                        <asp:ListItem Value="2">ODIN</asp:ListItem>
                                                        <asp:ListItem Value="3">TCL</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                            <td colspan="2" align="center">
                                                <asp:Label ID="LblFile" runat="server" Text=""></asp:Label>
                                            </td>
                                            </tr>
                                        </table>
                                        </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        Upload Trades File:
                                    </td>
                                    <td align="left">
                                        <asp:FileUpload ID="ProductFile" runat="server" Width="272px" Height="21px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" valign="middle" colspan="2" style="height: 50px;">
                                        <table cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td valign="top" align="left" style="height: 19px">
                                                    <asp:Button ID="BtnSave" runat="server" Text="Import File" CssClass="btn" Width="84px"
                                                        OnClick="BtnSave_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
