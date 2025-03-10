<%@ page language="C#" autoeventwireup="true" inherits="management_NSEIllscrips, App_Web__yen2upk" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server"> 
<link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
 <title>Untitled Page</title>
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
                            <td class="lt1">
                                <h5>
                                    Imports Illiquid Scrips Files for NSE-CM
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
                                                        <tr id="trYesNo" runat="server">
                                                            <td>
                                                                <table width="100%">
                                                                   
                                                                </table>
                                                                <asp:Label ID="importstatus" runat="server" Font-Size="XX-Small" Font-Names="Arial"
                                                                    Font-Bold="True" ForeColor="Red" /></td>
                                                        </tr>
                                                        <tr cellspacing="2">
                                                            <td class="lt">
                                                                <table>
                                                                    <tr valign="top">
                                                                        <td>
                                                                            <b>Year</b></td>
                                                                        <td>
                                                                            <asp:DropDownList ID="ddlYear" runat="server">
                                                                            
                                                                                <asp:ListItem Value="2011">2011</asp:ListItem>
                                                                                <asp:ListItem Value="2012">2012</asp:ListItem>
                                                                                <asp:ListItem Value="2013">2013</asp:ListItem>
                                                                                <asp:ListItem Value="2014">2014</asp:ListItem>
                                                                                <asp:ListItem Value="2015">2015</asp:ListItem>
                                                                                 <asp:ListItem Value="2016">2016</asp:ListItem>
                                                                                <asp:ListItem Value="2017">2017</asp:ListItem>
                                                                                <asp:ListItem Value="2018">2018</asp:ListItem>
                                                                                <asp:ListItem Value="2019">2019</asp:ListItem>
                                                                                <asp:ListItem Value="2020">2020</asp:ListItem>
                                                                                <asp:ListItem Value="2021">2021</asp:ListItem>
                                                                                <asp:ListItem Value="2022">2022</asp:ListItem>
                                                                                <asp:ListItem Value="2023">2023</asp:ListItem>
                                                                                <asp:ListItem Value="2024">2024</asp:ListItem>
                                                                                <asp:ListItem Value="2025">2025</asp:ListItem>
                                                                                <asp:ListItem Value="2026">2026</asp:ListItem>
                                                                                <asp:ListItem Value="2027">2027</asp:ListItem>
                                                                                <asp:ListItem Value="2028">2028</asp:ListItem>
                                                                                <asp:ListItem Value="2029">2029</asp:ListItem>
                                                                                <asp:ListItem Value="2030">2030</asp:ListItem>
                                                                                <asp:ListItem Value="2031">2031</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                    </tr>
                                                                     <tr valign="top">
                                                                        <td>
                                                                            <b>Month</b></td>
                                                                        <td style="width: 81px">
                                                                            <asp:DropDownList ID="ddlMonth" runat="server">
                
                                                                                <asp:ListItem Value="1">January</asp:ListItem>
                                                                                <asp:ListItem Value="2">February</asp:ListItem>
                                                                                <asp:ListItem Value="3">March</asp:ListItem>
                                                                                <asp:ListItem Value="4">April</asp:ListItem>
                                                                                <asp:ListItem Value="5">May</asp:ListItem>
                                                                                <asp:ListItem Value="6">June</asp:ListItem>
                                                                                <asp:ListItem Value="7">July</asp:ListItem>
                                                                                <asp:ListItem Value="8">Augest</asp:ListItem>
                                                                                <asp:ListItem Value="9">September</asp:ListItem>
                                                                                <asp:ListItem Value="10">October</asp:ListItem>
                                                                                <asp:ListItem Value="11">November</asp:ListItem>
                                                                                <asp:ListItem Value="12">December</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <strong>EG: Annexure.xls (Avialable under Circuller)</strong></td>
                                                        </tr>
                                                        <tr>
                                                           
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:FileUpload ID="FileUpload" runat="server" Width="272px" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td  valign="middle" colspan="2">
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
