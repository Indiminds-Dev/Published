<%@ page language="C#" autoeventwireup="true" inherits="management_MCXMargin, App_Web_8qixh_8w" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>MCX Margin</title>
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
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="Panelmain" runat="server" HorizontalAlign="Center" Style="z-index: 100;
            left: 301px; position: absolute; top: 3px" Visible="true">
            <table id="tbl_main" cellpadding="0" cellspacing="0" class="login" width="410" style="border: solid 1px blue">
                <tbody>
                    <tr>
                        <td class="EHEADER">
                            <span style="color: blue"><strong>MCX Margin</strong></span></td>
                    </tr>
                    <tr>
                        <td class="lt">
                            <table cellpadding="0" cellspacing="12" class="TableMain100">
                                <tbody>
                                    <tr>
                                        <td align="right" style="width: 278px">
                                            <asp:FileUpload ID="MCXMarginSelectFile" runat="server" Height="21px" Width="272px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" colspan="2" valign="middle">
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
