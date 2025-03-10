<%@ page language="C#" autoeventwireup="true" inherits="management_frmImportClosingRateNCDEX, App_Web_kqhq1k1d" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Import NCDEX Closing Rates</title>
     <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
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
<body style="margin: 0px 0px 0px 0px; background-color:#DDECFE">
    <form id="form1" runat="server">
    <div>
       <asp:Panel ID="Panelmain" runat="server" Visible="true" HorizontalAlign="Center">
                <table id="tbl_main" class="login" cellspacing="0" cellpadding="0" width="410"
                    style="border: solid 1px blue">
                    <tbody>
                        <tr>
                            <td class="EHEADER">
                                <span style="color: blue"><strong>NCDEX Closing Rates</strong></span></td>
                        </tr>
                        <tr>
                            <td class="lt">
                                <table class="TableMain100" cellspacing="12" cellpadding="0">
                                    <tbody>
                                     <tr>
                                                                        <td style="width: 6px">
                                                                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                                                                            </asp:ScriptManager>
                                                                            
                                                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                                                <ContentTemplate>
                                                                                
                                                                                    <asp:DropDownList ID="ddlFileList" runat="server" Width="192px" AutoPostBack="True"
                                                                                        Height="19px">
                                                                                        <asp:ListItem Value="0">SELECT TYPE OF FILE</asp:ListItem>
                                                                                        <asp:ListItem Value="1">CSV</asp:ListItem>
                                                                                         <asp:ListItem Value="2">XLS</asp:ListItem>
                                                                                       
                                                                                    </asp:DropDownList><br />
                                                                                    <asp:Label ID="lblMessage" runat="server" Width="270px"></asp:Label>
                                                                                </ContentTemplate>
                                                                            </asp:UpdatePanel>
                                                                        </td>
                                                                    </tr>
                                        <tr>
                                            <td align="right" style="width: 278px">
                                                <asp:FileUpload ID="NCDEXSelectFile" runat="server" Width="272px" Height="21px" />
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
