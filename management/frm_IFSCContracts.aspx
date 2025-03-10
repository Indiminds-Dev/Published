<%@ page language="C#" autoeventwireup="true" inherits="management_frm_IFSCContracts, App_Web_udicbieo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Import NSE IFSC Contracts</title>
     <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
 <script language="javascript" type="text/javascript">
        function SignOff()
        {
            window.parent.SignOff();
        }
        </script>
    

</head>
<body style="margin: 0px 0px 0px 0px; background-color:#DDECFE">
    <form id="form1" runat="server">
    <div>
     <asp:Panel ID="Panelmain" runat="server" Visible="true" HorizontalAlign="Center">
                <table id="tbl_main" class="login" cellspacing="0" cellpadding="0" width="410"
                    style="border: solid 1px blue">
                    <tbody>
                        <tr>
                            <td class="EHEADER">
                                <span style="color: blue"><strong>IFSC Contracts [G_CN01_DDMMYYYY.CSV]</strong></span></td>
                        </tr>
                        <tr>
                            <td class="lt">
                                <table class="TableMain100" cellspacing="12" cellpadding="0">
                                    <tbody>
                                        <tr>
                                            <td align="right" style="width: 278px">
                                                <asp:FileUpload ID="IFSCSelectFile" runat="server" Width="272px" Height="21px" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" valign="middle" colspan="2">
                                                <table cellspacing="0" cellpadding="0">
                                                    <tbody>
                                                        <tr>
                                                            <td valign="top" align="left" style="height: 19px">
                                                                <asp:Button ID="BtnSave" runat="server" Text="Import File" CssClass="btn" 
                                                                    Width="84px" OnClick="BtnSave_Click" />
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
