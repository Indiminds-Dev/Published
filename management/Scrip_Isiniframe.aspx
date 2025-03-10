<%@ page language="C#" autoeventwireup="true" inherits="management_Scrip_Isiniframe, App_Web_xu-hjjp9" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<link href="../CSS/style.css" rel="stylesheet" type="text/css" />
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
        if(document.body.scrollHeight>=300)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '300px';
        window.frameElement.Width = document.body.scrollWidth;
    }
</script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div align="center">
     <asp:Panel ID="Panelmain" runat="server" Visible="true" Height="336px">
           <table id="tbl_main" class="login" cellspacing="0" cellpadding="0" width="410">
        <tbody>
            <tr>
                <td class="lt1">
                    <h5>
                        Imports Scrips & ISIN CSV File
                    </h5>
                </td>
            </tr>
        
            <tr>
                <td class="lt brdr" >
                    <table cellspacing="0" cellpadding="0" align="center">
                        <tbody>
                            <tr>
                                <td class="lt" style="height: 275px">
                                    <table class="width100per" cellspacing="12" cellpadding="0">
                                        <tbody>
                                            <tr>
                                                <td colspan="2" style="width: auto; ">
                                                    <asp:Label ID="importstatus" runat="server" Font-Size="XX-Small" Font-Names="Arial"
                                                        Font-Bold="True" ForeColor="Red" />
                                                </td>
                                            </tr>
                                                       
                                                  <tr>
                                                   <td class="lt" colspan="2">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <asp:RadioButton ID="rdBtncsv" runat="server" GroupName="imp" Width="28px" /> EQUITY_L.csv[www.nseindia.com / Corporates / Securities Information]</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                   <td class="lt" colspan="2">
                                                        <asp:RadioButton ID="rdBtntxt" runat="server" GroupName="imp" />
                                                        security.txt [FTP - CM Common / NTNEAT / security.gz]
                                                    </td>
                                                </tr>
                                            <tr>
                                                <td class="lt" colspan="2">
                                                    <asp:FileUpload ID="OFDSelectFile" runat="server" Width="366px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="middle" colspan="2" style="height: 34px">
                                                    <table cellspacing="0" cellpadding="0">
                                                        <tbody>
                                                            <tr>
                                                                <td valign="top" align="right" style="height: 19px">
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
