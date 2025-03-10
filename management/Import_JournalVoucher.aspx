<%@ page language="C#" autoeventwireup="true" inherits="management_Closingrateiframe, App_Web_ptes6n28" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <title>Import JournalVoucher</title>

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
        <div align="center">
            <asp:Panel ID="Panelmain" runat="server" Visible="true">
                <table id="tbl_main" class="login" cellspacing="0" cellpadding="0" width="410">
                    <tbody>
                        <tr>
                            <td class="lt1" style="width: 437px">
                                <h5>
                                    Import Journal-Voucher
                                </h5>
                            </td>
                        </tr>
                        <tr>
                            <td class="lt brdr" style="height: 280px; width: 437px;">
                                <table cellspacing="0" cellpadding="0" align="center">
                                    <tbody>
                                        <tr>
                                            <td class="lt">
                                                <table class="width100per" cellspacing="12" cellpadding="0">
                                                    <tbody>
                                                        <tr>
                                                            <td class="lt">
                                                                <asp:Label ID="importstatus" runat="server" Font-Size="XX-Small" Font-Names="Arial"
                                                                    Font-Bold="True" ForeColor="Red" />
                                                            </td>
                                                        </tr>
                                                         <tr>
                                                            <td class="lt">
                                                            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="Blue" Width="266px" NavigateUrl="~/Documents/JVDDMMYYYY.xls" Target="_blank">View File Format</asp:HyperLink></td>
                                                        </tr>
                                                       
                                                        <tr>
                                                            <td align="left">
                                                                Select File(JVDDMMYYYY.csv):<asp:FileUpload ID="BK01File" runat="server" Width="238px" />
                                                            </td>
                                                        </tr>
                                                      
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
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </asp:Panel>
            &nbsp;
        </div>
    </form>
</body>
</html>
