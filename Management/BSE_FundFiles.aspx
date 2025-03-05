<%@ page language="C#" autoeventwireup="true" inherits="management_Closingrateiframe, App_Web_fmcnshmw" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <title>BSE-CM Fund Files</title>

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
                                    Imports Fund Files
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
                                                            <td class="lt" style="width: 278px; height: 22px;">
                                                                <asp:Label ID="importstatus" runat="server" Font-Size="XX-Small" Font-Names="Arial"
                                                                    Font-Bold="True" ForeColor="Red" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lt">
                                                                <table width="100%">
                                                                    <tr>
                                                                        <td colspan="4">
                                                                            Select Date Range
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            From Date:
                                                                        </td>
                                                                        <td style="height: 36px; width: 103px;">
                                                                            <dxe:ASPxDateEdit ID="dtfrom" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                                                Font-Size="10px" Width="100px" ClientInstanceName="dtfrom" EditFormatString="dd-MM-yyyy">
                                                                            </dxe:ASPxDateEdit>
                                                                        </td>
                                                                        <td >
                                                                            To Date:</td>
                                                                        <td>
                                                                            <dxe:ASPxDateEdit ID="dtTo" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                                                Font-Size="10px" Width="100px" ClientInstanceName="dtfrom" EditFormatString="dd-MM-yyyy">
                                                                            </dxe:ASPxDateEdit>
                                                                        </td>
                                                                    </tr>
                                                                  
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                VADDMM.TM Code:<asp:FileUpload ID="BK01File" runat="server" Width="238px" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                Bank Name: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:DropDownList ID="ddlBank" runat="server" Width="188px">
                                                                </asp:DropDownList></td>
                                                        
                                                        </tr>
                                                        <tr>
                                                            <td align="center" valign="middle" colspan="2">
                                                                <asp:TextBox ID="txtBank_hidden" runat="server" Width="46px" Visible="False"></asp:TextBox>
                                                                <asp:HiddenField ID="hdnChk" runat="server" Value="0" />
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
