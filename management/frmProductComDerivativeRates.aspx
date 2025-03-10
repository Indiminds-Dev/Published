<%@ page language="C#" autoeventwireup="true" inherits="management_frmProductComDerivativeRates, App_Web_cvaj-tqf" %>
<%@ Register Assembly="DevExpress.Xpo.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Xpo" TagPrefix="dxxpo" %>

<%@ Register Assembly="DevExpress.XtraCharts.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>
<%@ Register Assembly="DevExpress.XtraCharts.v9.1.Web, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table class="TableMain100" id="tblShowDt" runat="server">
                    <tr>
                        <td style="height: 42px">
                            <table width="910">
                                <tr>
                                    <td colspan="5" class="EHEADER" style="text-align: center">
                                        <asp:Label ID="lblCaption" runat="server"  ForeColor="Blue" Font-Size="Small" Width="624px"></asp:Label></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 66px">
                            <table width="910">
                                <tr>
                                    <td class="gridcellleft">Expiry   Date</td>
                                    <td style="height: 46px; width: 100px;">
                                        <asp:DropDownList ID="ddExpDt" runat="server" Width="127px">
                                        </asp:DropDownList>
                                    </td>
                                    <td style="width: 98px; height: 46px;">
                                        From Date
                                    </td>
                                    <td style="width: 232px; height: 46px;">
                                        <dxe:ASPxDateEdit ID="fromdate" runat="server" 
                                             EditFormat="Custom" EditFormatString="dd-MM-yyyy"
                                             UseMaskBehavior="True">
                                            <ButtonStyle Width="13px">
                                            </ButtonStyle>
                                        </dxe:ASPxDateEdit>
                                    </td>
                                    <td style="width: 80px; height: 46px;">
                                        To Date
                                    </td>
                                    <td style="width: 212px; height: 46px;">
                                        <dxe:ASPxDateEdit ID="ToDate" runat="server" 
                                             EditFormat="Custom" EditFormatString="dd-MM-yyyy"
                                             UseMaskBehavior="True">
                                            <ButtonStyle Width="13px">
                                            </ButtonStyle>
                                        </dxe:ASPxDateEdit>
                                    </td>
                                    <td style="height: 46px">
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Button ID="btnShow" runat="server" Text="Show" OnClick="btnShow_Click" />
                                                </td>
                                             </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <table class="TableMain100" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <dxwgv:ASPxGridView ID="grdDailyStatDetails" ClientInstanceName="grid" runat="server"
                                Width="100%" KeyFieldName="Commodity_ProductID" AutoGenerateColumns="False" 
                                 OnHtmlRowCreated="grdDailyStatDetails_HtmlRowCreated">
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
                                <Settings ShowFooter="True" ShowStatusBar="Visible" ShowTitlePanel="True" />
                                <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
                                    <FirstPageButton Visible="True">
                                    </FirstPageButton>
                                    <LastPageButton Visible="True">
                                    </LastPageButton>
                                </SettingsPager>
                                <SettingsBehavior AllowFocusedRow="True" />
                                <Columns>
                                    <dxwgv:GridViewDataDateColumn Caption="Date" FieldName="DailyStat_EffectiveDate"
                                        VisibleIndex="0" Width="3%">
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="False" />
                                        <PropertiesDateEdit DisplayFormatString="dd MMMM yyyy">
                                        </PropertiesDateEdit>
                                        <CellStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="False">
                                        </CellStyle>
                                    </dxwgv:GridViewDataDateColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Open" FieldName="DailyStat_Open" VisibleIndex="1"
                                        Width="10%">
                                        <HeaderStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False" />
                                        <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="High" FieldName="DailyStat_High" VisibleIndex="2"
                                        Width="10%">
                                        <HeaderStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False" />
                                        <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Low" FieldName="DailyStat_Low" VisibleIndex="3"
                                        Width="10%">
                                        <HeaderStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False" />
                                        <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Close" FieldName="DailyStat_Close" VisibleIndex="4"
                                        Width="10%">
                                        <HeaderStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False" />
                                        <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Settlement Price" VisibleIndex="5" Width="10%" FieldName="DailyStat_SettlementPrice">
                                    <HeaderStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False" />
                                        <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Traded Quantity" FieldName="DailyStat_TradedQuantity"
                                        VisibleIndex="6" Width="5%">
                                        <HeaderStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False" />
                                        <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Traded Value" FieldName="DailyStat_TradedValue"
                                        VisibleIndex="7" Width="5%">
                                        <HeaderStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False" />
                                        <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                            </dxwgv:ASPxGridView>
                        </td>
                    </tr>
                </table>
                <asp:SqlDataSource ID="SqlExchangeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                    SelectCommand="SELECT [Exchange_ID], [Exchange_ShortName] FROM [Master_Exchange] ORDER BY [Exchange_ShortName]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceUOM" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                    SelectCommand="SELECT [UOM_ID], [UOM_Name] FROM [Master_UOM] ORDER BY [UOM_Name]">
                </asp:SqlDataSource>
                <asp:HiddenField ID="hdnProductID" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
