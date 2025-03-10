<%@ page language="C#" autoeventwireup="true" inherits="management_MarginCmiframe, App_Web_5uqmplyf" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">
    function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
    {
        if(document.body.scrollHeight>=250)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '250px';
        window.frameElement.Width = document.body.scrollWidth;
    }
    </script>
</head>
<body  style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div align="center">
        <asp:Panel ID="Panelmain" runat="server" Visible="true">
        <table id="tbl_main" class="login" cellspacing="0" cellpadding="0" width="410">
            <tbody>
                <tr>
                    <td class="lt1">
                        <h5>
                            Imports Margin Files
                        </h5>
                    </td>
                </tr>
                
                 
                <tr>
                    <td class="lt brdr" >
                        <table cellspacing="0" cellpadding="0" align="center">
                            <tbody>
                                <tr>
                                    <td class="lt">
                                        <table class="width100per" cellspacing="12" cellpadding="0">
                                            <tbody>
                                            
                                            <tr id="trYesNo" runat="server">
                                                    <td>
                                                    </td>
                                                    <td  >
                                                        <table width="100%">
                                                            <tr>
                                                                <td align="center" >
                                                                    <table width="100%">
                                                                        <tr>
                                                                            <td  >
                                                                                <asp:Label ID="lblYesNo"  runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td >
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
                                                    </td>
                                                    <td class="lt">
                                                        <asp:Label ID="importstatus" runat="server" Font-Size="XX-Small" Font-Names="Arial"
                                                            Font-Bold="True" ForeColor="Red" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lt">
                                                    </td>
                                                </tr>
                                                 
                                                  <tr>
                                                    <td>
                                                    </td>
                                                    <td class="lt">
                                                        <table>
                                                            <tr>
                                                                <td style="font-weight: bold">
                                                                    CLR Member:
                                                                </td>
                                                                <td>
                                                                    C_MG02_mencode_DDMMYYYY.csv
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="font-weight: bold">
                                                                    TRD Member:
                                                                </td>
                                                                <td>
                                                                    C_MG02_mencode_T_DDMMYYYY.csv
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                         
                                            
                                                <tr>
                                                    <td class="lt">
                                                        Clearing Member :
                                                    </td>
                                                    <td align="right">
                                                        <asp:FileUpload ID="OFDSelectFile" runat="server" Width="272px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lt">
                                                        Trading Member :
                                                    </td>
                                                    <td align="right">
                                                        <asp:FileUpload ID="OFDSelectFile_T" runat="server" Width="272px" />
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
                    </td>
                </tr>
            </tbody>
        </table>
    </asp:Panel>
    </div>
    </form>
</body>
</html>
