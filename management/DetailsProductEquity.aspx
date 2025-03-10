<%@ page language="C#" autoeventwireup="true" inherits="management_DetailsProductEquity, App_Web_co654op-" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Equity Details</title>
    <script language="javascript" type="text/javascript">
             function SignOff()
            {
            window.parent.SignOff()
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
     <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
</head>
<body  style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div>
        <table class="TableMain100">
            <tr>
                <td colspan="5" class="EHEADER" ></td>
            </tr>
            <tr>
                <td style="width: 98px">
                    From Date
                </td>
                <td style="width: 232px">
                    <dxe:ASPxDateEdit ID="fromdate" runat="server"   EditFormat="Custom" EditFormatString="dd MMMM yyyy" ImageFolder="~/App_Themes/Office2003 Blue/{0}/" UseMaskBehavior="True">
                        <ButtonStyle Width="13px">
                        </ButtonStyle>
                    </dxe:ASPxDateEdit>
                </td>
                <td style="width: 98px">
                    To Date
                </td>
                <td style="width: 212px">
                    <dxe:ASPxDateEdit ID="ToDate" runat="server"   EditFormat="Custom" EditFormatString="dd MMMM yyyy" ImageFolder="~/App_Themes/Office2003 Blue/{0}/" UseMaskBehavior="True">
                        <ButtonStyle Width="13px">
                        </ButtonStyle>
                    </dxe:ASPxDateEdit>
                </td>
                <td>
                    <asp:Button ID="btnShow" runat="server" Text="Show" OnClick="btnShow_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="5">
                    <dxwgv:ASPxGridView ID="gridDate" runat="server"   Width="100%">
                        <Styles  >
                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                        </Styles>
                         <StylesEditors>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                    </dxwgv:ASPxGridView>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDate" runat="server"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
