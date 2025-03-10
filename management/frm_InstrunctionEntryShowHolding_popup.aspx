<%@ page language="C#" autoeventwireup="true" inherits="management_FrmNsdl_ShowClientHolding_popup, App_Web_e158i_8t" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Welcome to CRM</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;<dxwgv:ASPxGridView ID="gridHolding" runat="server" AutoGenerateColumns="False"
            ClientInstanceName="grid" KeyFieldName="NsdlHolding_ISIN" OnCustomCallback="gridHolding_CustomCallback"
            Width="100%">
            <SettingsBehavior AllowFocusedRow="True" />
            <Styles>
                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                </Header>
                <LoadingPanel ImageSpacing="10px">
                </LoadingPanel>
            </Styles>
            <SettingsPager PageSize="20">
            </SettingsPager>
            <Columns>
                <dxwgv:GridViewDataTextColumn Caption="ISIN No." FieldName="NsdlHolding_ISIN" VisibleIndex="0">
                    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                    <FooterTemplate>
                        Total Holding Value
                    </FooterTemplate>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="ISIN Name" FieldName="CmpName" VisibleIndex="1">
                    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="SettlementID" FieldName="NsdlHolding_SettlementNumber"
                    VisibleIndex="2">
                    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Type" FieldName="Type" VisibleIndex="3">
                    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Current Balance" FieldName="Total" UnboundType="Integer"
                    VisibleIndex="4">
                    <Settings AllowAutoFilter="False" />
                    <CellStyle CssClass="gridcellleft" HorizontalAlign="Right">
                    </CellStyle>
                    <PropertiesTextEdit DisplayFormatString="#.###">
                    </PropertiesTextEdit>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Free" FieldName="Free" UnboundType="Integer"
                    VisibleIndex="5">
                    <Settings AllowAutoFilter="False" />
                    <CellStyle CssClass="gridcellleft" HorizontalAlign="Right">
                    </CellStyle>
                    <PropertiesTextEdit DisplayFormatString="#.###">
                    </PropertiesTextEdit>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Pledged" FieldName="Pledged" UnboundType="Integer"
                    VisibleIndex="6">
                    <PropertiesTextEdit DisplayFormatString="#.###">
                    </PropertiesTextEdit>
                    <Settings AllowAutoFilter="False" />
                    <CellStyle CssClass="gridcellleft" HorizontalAlign="Right">
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Pending Remat" FieldName="Remat" UnboundType="Integer"
                    VisibleIndex="7">
                    <Settings AllowAutoFilter="False" />
                    <CellStyle CssClass="gridcellleft" HorizontalAlign="Right">
                    </CellStyle>
                    <PropertiesTextEdit DisplayFormatString="#.###">
                    </PropertiesTextEdit>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Pending Demat" FieldName="Demat" UnboundType="Integer"
                    VisibleIndex="8">
                    <Settings AllowAutoFilter="False" />
                    <CellStyle CssClass="gridcellleft" HorizontalAlign="Right">
                    </CellStyle>
                    <PropertiesTextEdit DisplayFormatString="#.###">
                    </PropertiesTextEdit>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Rate" FieldName="Rate" VisibleIndex="9">
                    <Settings AllowAutoFilter="False" />
                    <CellStyle CssClass="gridcellleft" HorizontalAlign="Right">
                    </CellStyle>
                    <PropertiesTextEdit DisplayFormatString="0.0000">
                    </PropertiesTextEdit>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Value" FieldName="ISINValue" VisibleIndex="10">
                    <Settings AllowAutoFilter="False" />
                    <CellStyle CssClass="gridcellleft" HorizontalAlign="Right">
                    </CellStyle>
                    <PropertiesTextEdit DisplayFormatString="0.00">
                    </PropertiesTextEdit>
                </dxwgv:GridViewDataTextColumn>
            </Columns>
            <Settings ShowFooter="True" ShowStatusBar="Visible" ShowTitlePanel="True" />
            <StylesEditors>
                <ProgressBar Height="25px">
                </ProgressBar>
            </StylesEditors>
            <TotalSummary>
                <dxwgv:ASPxSummaryItem DisplayFormat="#,##,###.00" FieldName="ISINValue" ShowInColumn="Value"
                    ShowInGroupFooterColumn="Value" SummaryType="Sum" Tag="Total Holding Value" />
            </TotalSummary>
        </dxwgv:ASPxGridView>


  </div>
    </form>
</body>
</html>
