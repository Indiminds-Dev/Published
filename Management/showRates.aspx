<%@ page language="C#" autoeventwireup="true" inherits="management_showRates, App_Web_mzqu16me" title="" %>


<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>


<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"

    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

    <html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Show Rates</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
 <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
 <script language="javascript" type="text/javascript">

   </script>
</head>
<body  style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div>
      <table class="TableMain100">
            <tr>
                <td width="100px">
                    
                    Product Name
                </td>
                 <td  colspan ="4">
                     <asp:TextBox ID="txtProduct" runat="server" ReadOnly="true" Width="400px"></asp:TextBox>
                 </td>
            </tr>
            <tr>
                <td>
                    Date From&nbsp;</td>
                <td>
                    <dxe:ASPxDateEdit ID="pnlFromDate" runat="server">
                    </dxe:ASPxDateEdit>
                </td>
                <td>
                    Date To</td>
                <td>
                    <dxe:ASPxDateEdit ID="pnlToDate" runat="server">
                    </dxe:ASPxDateEdit>
                </td>
                <td>
                    <asp:Button ID="btnGo1" Text ="Show Rates" runat ="server" OnClick="btnGo1_Click" />
                </td>
            </tr>
            <tr>
                <td colspan ="5" align ="center" >
                    <asp:Panel ID="pnlReport" runat="server" Width="100%">
                      <dxwgv:ASPxGridView ID="ShowReportGrid" runat="server"   Width="100%">
                          <Styles  >
                              <LoadingPanel ImageSpacing="10px">
                              </LoadingPanel>
                              <Header ImageSpacing="5px" SortingImageSpacing="5px">
                              </Header>
                          </Styles>
                          <Border BorderColor="LightSteelBlue" BorderStyle="None" />
                          <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
                              <FirstPageButton Visible="True">
                              </FirstPageButton>
                              <LastPageButton Visible="True">
                              </LastPageButton>
                          </SettingsPager>
                          <Settings ShowFooter="True" ShowGroupPanel="True" />
                      </dxwgv:ASPxGridView>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td colspan ="5" align ="center" >
                    <dxe:ASPxLabel ID="lblMessage" runat="server" Font-Bold="True" ForeColor="Red">
                    </dxe:ASPxLabel> 
                </td>
            </tr>
        </table>
        </div>
</form>
</body>
</html>
