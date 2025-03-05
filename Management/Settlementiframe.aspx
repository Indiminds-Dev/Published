<%@ page language="C#" autoeventwireup="true" inherits="management_Settlementiframe, App_Web_nhjs8cfd" %>

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
      function Page_Load()///Call Into Page Load
            {
               FieldName='btnshow';
               height();
            }
   function height()
        {
            
            if(document.body.scrollHeight>=350)
            {
                window.frameElement.height = document.body.scrollHeight;
            }
            else
            {
                window.frameElement.height = '350px';
            }
            window.frameElement.width = document.body.scrollwidth;
        }
 
    </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div align="center">
      <asp:Panel ID="Panelmain" runat="server" Visible="true">
        <table id="tbl_main" class="login" cellspacing="0" cellpadding="0" width="410">
                <tr>
                    <td class="lt1">
                        <h5>
                            Imports Settlements CSV Files
                        </h5>
                    </td>
                </tr>
                <tr>
                    <td class="lt brdr">
                        <table cellspacing="0" cellpadding="0" align="center">
                                <tr>
                                    <td class="lt" style="height: 240px">
                                        <table class="width100per" cellspacing="12" cellpadding="0">
                                             <tr>
                                                       <td class="lt" >
                                                        <asp:Label ID="importstatus" runat="server" Font-Size="XX-Small" Font-Names="Arial"
                                                            Font-Bold="True" ForeColor="Red" />
                                                    </td>
                                                </tr>
                                                <tr><td>
                                                <table width=100%>
                                                <tr><td colspan=2><b>Select Settlement Type</b></td></tr>
                                                <tr>
                                                <td >
                                                    Normal Rolling [N]</td><td ><asp:CheckBox ID="chkN" runat="server" /></td>
                                                <td>
                                                    TFT Auction [X]</td><td style="width: 64px"><asp:CheckBox ID="chkX" runat="server" /></td>
                                                </tr>
                                                 <tr>
                                                <td >
                                                    Trade For Trade Rolling [W]</td>
                                                <td ><asp:CheckBox ID="chkW" runat="server" Width="1px" /></td>
                                                 <td >
                                                     Retail Debt Market &nbsp;[D]</td>
                                                <td style="width: 64px" ><asp:CheckBox ID="chkD" runat="server" Width="1px" /></td>
                                                </tr>
                                                   <tr>
                                                <td >
                                                    Normal Auction [A]</td>
                                                <td  ><asp:CheckBox ID="chkA" runat="server" Width="1px" /></td>
                                                <td >
                                                    Limited Physical [O]</td>
                                                <td style="width: 64px" ><asp:CheckBox ID="chkO" runat="server" Width="1px" /></td>
                                                </tr>
                                               
                                                 <tr>
                                                <td>
                                                    SLBS - Auction [Q]</td>
                                                <td ><asp:CheckBox ID="chkQ" runat="server" Width="1px" /></td>
                                                 <td>
                                                     Trade For Trade [Z]</td>
                                                <td ><asp:CheckBox ID="chkZ" runat="server" Width="1px" /></td>
                                                </tr>
                                                    <tr>
                                                <td>
                                                    Company Objection [B]</td>
                                                <td ><asp:CheckBox ID="chkB" runat="server" Width="1px" /></td>
                                                 <td>
                                                     Mutual Fund Services [U]</td>
                                                <td ><asp:CheckBox ID="chkU" runat="server" Width="1px" /></td>
                                                </tr>
                                                    <tr>
                                                <td>
                                                    SLBS - First Leg [L]</td>
                                                <td ><asp:CheckBox ID="chkL" runat="server" Width="1px" /></td>
                                                 <td>
                                                     SLBS - Reverse Leg [P]</td>
                                                <td ><asp:CheckBox ID="chkP" runat="server" Width="1px" /></td>
                                                </tr>
                                               
                                                </table></td></tr>
                                                    <%--  <tr id="tr_setp" runat="server">
                                                  
                                                    <td >
                                                        <asp:RadioButton ID="rdBtnsetu" runat="server" GroupName="imp" />
                                                        setp.csv [NSE Clearing software]
                                                    </td>
                                                </tr>--%>
                                                <tr><td>
                                                Eg: C_STC_MONYYYY_DDMMYYYY.csv
                                                    [FTP - CM Common / Clearing]
                                                </td></tr>
                                                <tr>
                                                   
                                                    <td align="left" >
                                                        <asp:FileUpload ID="OFDSelectFile" runat="server" Width="370px" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" valign="middle" colspan="2">
                                                        <table cellspacing="0" cellpadding="0">
                                                            <tbody>
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
                                        </table>
                                    </td>
                                </tr>
                          
                        </table>
                  
    </asp:Panel>
    </div>
    </form>
</body>
</html>
