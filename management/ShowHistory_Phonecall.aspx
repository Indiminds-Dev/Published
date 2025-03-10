<%@ page language="C#" autoeventwireup="true" inherits="management_ShowHistory_Phonecall, App_Web_akbpwr7y" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">

    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100" width="100%">
                <tr>
                    <td class="Ecoheadtxt" align="Center" style="text-align: center">
                        <asp:Label ID="lblName" runat="Server" ForeColor="red"></asp:Label></td>
                </tr>
                <tr>
                    <td class="Ecoheadtxt">
                        <div class="Ecoheadtxt" runat="Server" id="showContactPanel">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td valign="top" id="showCallHistory" runat="Server">
                        <asp:GridView ID="grdShowHistory" runat="Server" CellPadding="4" ForeColor="#333333"
                            GridLines="None" BorderWidth="1px" BorderColor="#507CD1" AutoGenerateColumns="true"
                            PageSize="15" Width="100%" OnRowDataBound="grdShowHistory_RowDataBound">
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#EFF3FB" BorderWidth="1px" />
                            <EditRowStyle BackColor="#2461BF" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <HeaderStyle Font-Bold="false" ForeColor="black" CssClass="EHEADER" BorderColor="AliceBlue"
                                BorderWidth="1px" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td class="Ecoheadtxt">
                        <div class="Ecoheadtxt" runat="Server" id="showActivityPanl">
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
