<%@ page language="C#" autoeventwireup="true" inherits="management_ItemHistroy, App_Web_g1t3n0jz" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Item History</title>
       <link href="../css/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
    <script language="javascript" type="text/javascript">
    function ShowHideFilter(obj)
        {
          
           grid.PerformCallback(obj);
          
        }
        </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table class="TableMain100" style="width: 938px">
                <tr>
                    <td>
                        <table width="100%">
                            <tr>
                                <td style="text-align: left; vertical-align: top">
                                    <table>
                                        <tr>
                                            <td id="ShowFilter">
                                                <a href="javascript:ShowHideFilter('s');"><span style="color: #000099; text-decoration: underline">
                                                    Show Filter</span></a>
                                            </td>
                                            <td id="Td1">
                                                <a href="javascript:ShowHideFilter('All');"><span style="color: #000099; text-decoration: underline">
                                                    All Records</span></a>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                </td>
                                <td class="gridcellright" style="text-align: right">
                                    <dxe:ASPxComboBox ID="cmbExport" runat="server" AutoPostBack="true" BackColor="Navy"
                                        Font-Bold="False" ForeColor="White" ValueType="System.Int32" Width="130px" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged">
                                        <%--OnSelectedIndexChanged="cmbExport_SelectedIndexChanged"--%>
                                        <Items>
                                            <dxe:ListEditItem Text="Select" Value="0" />
                                            <dxe:ListEditItem Text="PDF" Value="1" />
                                            <dxe:ListEditItem Text="XLS" Value="2" />
                                            <dxe:ListEditItem Text="RTF" Value="3" />
                                            <dxe:ListEditItem Text="CSV" Value="4" />
                                        </Items>
                                        <ButtonStyle BackColor="#C0C0FF" ForeColor="Black">
                                        </ButtonStyle>
                                        <ItemStyle BackColor="Navy" ForeColor="White">
                                            <HoverStyle BackColor="#8080FF" ForeColor="White">
                                            </HoverStyle>
                                        </ItemStyle>
                                        <Border BorderColor="White" />
                                        <DropDownButton Text="Export">
                                        </DropDownButton>
                                    </dxe:ASPxComboBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dxwgv:ASPxGridView ID="gridHistory" runat="server" ClientInstanceName="grid"
                            Width="100%" KeyFieldName="AssetDetail_ID" AutoGenerateColumns="False" CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css"
                            CssPostfix="Office2003_Blue" DataSourceID="sqlItemHistory" OnCustomCallback="gridHistory_CustomCallback" OnHtmlDataCellPrepared="gridHistory_HtmlDataCellPrepared" OnHtmlRowCreated="gridHistory_HtmlRowCreated">
                            
                            <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" CssPostfix="Office2003_Blue">
                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                </Header>
                                <LoadingPanel ImageSpacing="10px">
                                </LoadingPanel>
                            </Styles>
                            <Images ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
                                <CollapsedButton Height="12px" Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png"
                                    Width="11px" />
                                <ExpandedButton Height="12px" Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png"
                                    Width="11px" />
                                <DetailCollapsedButton Height="12px" Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png"
                                    Width="11px" />
                                <DetailExpandedButton Height="12px" Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png"
                                    Width="11px" />
                                <FilterRowButton Height="13px" Width="13px" />
                            </Images>
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="Brought Forward" FieldName="AssetDetail_BroughtForward"
                                    VisibleIndex="0">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="ID" FieldName="AssetDetail_ID" VisibleIndex="0" Visible="False">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="CompanyID" FieldName="AssetDetail_CompanyID"
                                    VisibleIndex="1" Visible="False">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Fin Year" FieldName="AssetDetail_FinYear"
                                    VisibleIndex="1">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="MainAccount Code" FieldName="AssetDetail_MainAccountCode" VisibleIndex="2" Visible="False">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Sub Account Code" FieldName="AssetDetail_SubAccountCode"
                                    VisibleIndex="4" Visible="False">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Category" FieldName="AssetDetail_Category"
                                    ReadOnly="True" VisibleIndex="4" Visible="False">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Purchase Date" FieldName="AssetDetail_PurchaseDate"
                                    ReadOnly="True" VisibleIndex="2">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                    <PropertiesTextEdit DisplayFormatString="dd MMM yyyy">
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Vendor" FieldName="AssetDetail_Vendor" VisibleIndex="3" Visible="False">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="CostPrice" VisibleIndex="3" FieldName="AssetDetail_CostPrice">
                                    <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Addition" FieldName="AssetDetail_Additions"
                                    VisibleIndex="4">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Disposals" FieldName="AssetDetail_Disposals"
                                    VisibleIndex="5">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Depreciation" FieldName="AssetDetail_Depreciation"
                                    VisibleIndex="6">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Depreciation IT" FieldName="Assetdetail_DepreciationIT"
                                    VisibleIndex="7">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Location" FieldName="AssetDetail_Location"
                                    VisibleIndex="9" Visible="False">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="User" FieldName="AssetDetail_User" VisibleIndex="9" Visible="False">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Insurer" FieldName="AssetDetail_Insurer" VisibleIndex="9" Visible="False">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Net Value" FieldName="NetValue" VisibleIndex="8">
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <StylesEditors>
                                <ProgressBar Height="25px">
                                </ProgressBar>
                            </StylesEditors>
                            <Settings ShowGroupPanel="True" ShowFooter="True" ShowStatusBar="Visible" ShowTitlePanel="True" />
                            <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
                                <FirstPageButton Visible="True">
                                </FirstPageButton>
                                <LastPageButton Visible="True">
                                </LastPageButton>
                            </SettingsPager>
                            <SettingsBehavior AllowFocusedRow="True" />
                        </dxwgv:ASPxGridView>
                        <asp:SqlDataSource ID="sqlItemHistory" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>">
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
             <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
            </dxwgv:ASPxGridViewExporter>

    </div>
    </form>
</body>
</html>
