<%@ page language="C#" autoeventwireup="true" inherits="management_FOExch_Product_Details, App_Web_cvaj-tqf" %>

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
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="../windowfiles/dhtmlwindow.css" type="text/css" />

    <script type="text/javascript" src="../windowfiles/dhtmlwindow.js"></script>

    <link rel="stylesheet" href="../modalfiles/modal.css" type="text/css" />

    <script type="text/javascript" src="../modalfiles/modal.js"></script>

    <script language="javascript" type="text/javascript">
        function OnMoreInfoClick(keyValue,FrmDt,ToDt)
         {
         //alert("Test");
         var url='DStatChart.aspx?Flag=SR&id='+keyValue+'&FrmDt='+FrmDt+'&ToDt='+ToDt;
         editwin=dhtmlmodal.open("Editbox", "iframe", url, "", "width=940px,height=450px,center=1,resize=1,scrolling=2,top=500", "recal")
         document.getElementById('ctl00_ContentPlaceHolder1_Headermain1_cmbSegment').style.visibility='hidden';
        editwin.onclose=function()
         {
        document.getElementById('ctl00_ContentPlaceHolder1_Headermain1_cmbSegment').style.visibility='visible';
        }
         
        }
        function ShowHideFilter(obj)
        {
           grid.PerformCallback(obj);
        }
        function openpopuppage(obj)
        {
            
        }
    </script>

</head>
<body style="font-size: 12pt; font-family: Times New Roman">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table class="TableMain100">
                    <tr>
                        <td id="tdPN" runat="server" align="center">
                        </td>
                    </tr>
                    <tr>
                        <td id="tdPName" runat="server">
                        </td>
                    </tr>
                </table>
                <table class="TableMain100" id="tblShowDt" runat="server">
                    <tr>
                        <td>
                            <table class="TableMain100">
                                <tr>
                                    <td colspan="5" class="EHEADER">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table class="TableMain100">
                                <tr>
                                    <td>
                                        <asp:DropDownList ID="ddListExpDt" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddListExpDt_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddListStrickPrice" runat="server">
                                            <asp:ListItem>--Select Strike Price--</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        From Date
                                    </td>
                                    <td>
                                        <dxe:ASPxDateEdit ID="fromdate" runat="server"  EditFormat="Custom"
                                            EditFormatString="dd MMMM yyyy" UseMaskBehavior="True">
                                            <ButtonStyle Width="13px">
                                            </ButtonStyle>
                                        </dxe:ASPxDateEdit>
                                    </td>
                                    <td>
                                        To Date
                                    </td>
                                    <td>
                                        <dxe:ASPxDateEdit ID="ToDate" runat="server" EditFormat="Custom" EditFormatString="dd MMMM yyyy"
                                            UseMaskBehavior="True">
                                            <ButtonStyle Width="13px">
                                            </ButtonStyle>
                                        </dxe:ASPxDateEdit>
                                    </td>
                                    <td>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Button ID="btnShow" runat="server" Text="Show" OnClick="btnShow_Click" />
                                                </td>
                                                <td>
                                                    <asp:ImageButton ID="imgBtnCharts" Visible="false" ImageUrl="../images/chart_display.gif"
                                                        runat="server" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <table width="910" id="tblT1" runat="server">
                    <tr>
                        <td>
                            <dxwgv:ASPxGridView ID="grdExchDetails" ClientInstanceName="grdExchDetails" KeyFieldName="Equity_SeriesID"
                                runat="server" Width="100%" AutoGenerateColumns="False" OnRowInserting="grdExchDetails_RowInserting"
                                OnRowUpdating="grdExchDetails_RowUpdating" OnCustomCallback="grdExchDetails_CustomCallback"
                                OnCellEditorInitialize="grdExchDetails_CellEditorInitialize">
                                <Styles>
                                    <Header Font-Bold="true" ForeColor="black" CssClass="EHEADER" Border-BorderColor="AliceBlue">
                                    </Header>
                                    <AlternatingRow BackColor="White">
                                    </AlternatingRow>
                                    <LoadingPanel ImageSpacing="10px">
                                    </LoadingPanel>
                                </Styles>
                                <Settings ShowFooter="True" ShowStatusBar="Visible" ShowTitlePanel="True" />
                                <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
                                    <FirstPageButton Visible="True">
                                    </FirstPageButton>
                                    <LastPageButton Visible="True">
                                    </LastPageButton>
                                </SettingsPager>
                                <SettingsBehavior AllowFocusedRow="True" />
                                <Columns>
                                    <dxwgv:GridViewDataComboBoxColumn Caption="Exch Name" FieldName="Exchange_ShortName"
                                        VisibleIndex="0">
                                        <EditCellStyle Wrap="False">
                                        </EditCellStyle>
                                        <PropertiesComboBox DataSourceID="SqlExchangeDataSource" TextField="Exchange_ShortName"
                                            ValueField="Exchange_ID" ValueType="System.String" Width="120px">
                                        </PropertiesComboBox>
                                        <CellStyle CssClass="gridcellleft">
                                        </CellStyle>
                                        <EditFormCaptionStyle Wrap="False">
                                        </EditFormCaptionStyle>
                                        <EditFormSettings CaptionLocation="Near" VisibleIndex="0" />
                                    </dxwgv:GridViewDataComboBoxColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Ticker Symbol" FieldName="Equity_TickerSymbol"
                                        VisibleIndex="1">
                                        <EditCellStyle Wrap="False">
                                        </EditCellStyle>
                                        <CellStyle CssClass="gridcellleft">
                                        </CellStyle>
                                        <PropertiesTextEdit Width="120px">
                                        </PropertiesTextEdit>
                                        <EditFormCaptionStyle Wrap="False">
                                        </EditFormCaptionStyle>
                                        <EditFormSettings CaptionLocation="Near" VisibleIndex="1" />
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataComboBoxColumn Caption="Series" FieldName="Equity_Series" Visible="False"
                                        VisibleIndex="2">
                                        <EditCellStyle Wrap="False">
                                        </EditCellStyle>
                                        <PropertiesComboBox ValueType="System.String" Width="120px">
                                        </PropertiesComboBox>
                                        <CellStyle CssClass="gridcellleft">
                                        </CellStyle>
                                        <EditFormCaptionStyle Wrap="False">
                                        </EditFormCaptionStyle>
                                        <EditFormSettings CaptionLocation="Near" Visible="True" VisibleIndex="2" />
                                    </dxwgv:GridViewDataComboBoxColumn>
                                    <dxwgv:GridViewDataComboBoxColumn Caption="FOIdentifier" FieldName="Equity_FOIdentifier"
                                        Visible="False" VisibleIndex="3">
                                        <PropertiesComboBox ValueType="System.String" Width="120px">
                                        </PropertiesComboBox>
                                        <CellStyle CssClass="gridcellleft">
                                        </CellStyle>
                                        <EditFormCaptionStyle Wrap="False">
                                        </EditFormCaptionStyle>
                                        <EditFormSettings CaptionLocation="Near" Visible="True" VisibleIndex="3" />
                                    </dxwgv:GridViewDataComboBoxColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Strike Price" FieldName="Equity_StrikePrice"
                                        VisibleIndex="2">
                                        <EditCellStyle Wrap="False">
                                        </EditCellStyle>
                                        <CellStyle CssClass="gridcellleft">
                                        </CellStyle>
                                        <PropertiesTextEdit Width="120px">
                                        </PropertiesTextEdit>
                                        <EditFormCaptionStyle Wrap="False">
                                        </EditFormCaptionStyle>
                                        <EditFormSettings CaptionLocation="Near" VisibleIndex="4" />
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataDateColumn Caption="Exp. Date" FieldName="Equity_EffectUntil"
                                        VisibleIndex="3">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <EditCellStyle Wrap="False">
                                        </EditCellStyle>
                                        <PropertiesDateEdit DateOnError="Today" DisplayFormatString="dd MMMM yyyy" EditFormat="Custom"
                                            EditFormatString="dd MMMM yyyy" UseMaskBehavior="True" Width="120px">
                                        </PropertiesDateEdit>
                                        <Settings AllowAutoFilter="True" FilterMode="DisplayText" ShowFilterRowMenu="False"
                                            ShowInFilterControl="False" />
                                        <CellStyle HorizontalAlign="Center" Wrap="False">
                                        </CellStyle>
                                        <EditFormCaptionStyle Wrap="False">
                                        </EditFormCaptionStyle>
                                        <EditFormSettings CaptionLocation="Near" Visible="True" VisibleIndex="5" />
                                    </dxwgv:GridViewDataDateColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Trading Lot" FieldName="Equity_TradingLot"
                                        VisibleIndex="4">
                                        <CellStyle CssClass="gridcellleft">
                                        </CellStyle>
                                        <PropertiesTextEdit Width="120px">
                                        </PropertiesTextEdit>
                                        <EditFormCaptionStyle Wrap="False">
                                        </EditFormCaptionStyle>
                                        <EditFormSettings CaptionLocation="Near" VisibleIndex="6" />
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataComboBoxColumn Caption="Trading UOM" FieldName="Equity_TradingUOM"
                                        VisibleIndex="7" Visible="False">
                                        <PropertiesComboBox ValueType="System.String" DataSourceID="SqlDataSourceUOM" TextField="UOM_Name"
                                            ValueField="UOM_Name" Width="120px">
                                        </PropertiesComboBox>
                                        <CellStyle CssClass="gridcellleft">
                                        </CellStyle>
                                        <EditFormCaptionStyle Wrap="False">
                                        </EditFormCaptionStyle>
                                        <EditFormSettings CaptionLocation="Near" Visible="True" VisibleIndex="7" />
                                    </dxwgv:GridViewDataComboBoxColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Delivery Lot" FieldName="Equity_DeliveryLot"
                                        VisibleIndex="5">
                                        <CellStyle CssClass="gridcellleft">
                                        </CellStyle>
                                        <PropertiesTextEdit Width="120px">
                                        </PropertiesTextEdit>
                                        <EditFormCaptionStyle Wrap="False">
                                        </EditFormCaptionStyle>
                                        <EditFormSettings CaptionLocation="Near" VisibleIndex="8" />
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataComboBoxColumn Caption="Delivary UOM" FieldName="Equity_DeliveryUOM"
                                        VisibleIndex="9" Visible="False">
                                        <PropertiesComboBox ValueType="System.String" DataSourceID="SqlDataSourceUOM" TextField="UOM_Name"
                                            ValueField="UOM_Name" Width="120px">
                                        </PropertiesComboBox>
                                        <CellStyle CssClass="gridcellleft">
                                        </CellStyle>
                                        <EditFormCaptionStyle Wrap="False">
                                        </EditFormCaptionStyle>
                                        <EditFormSettings CaptionLocation="Near" Visible="True" VisibleIndex="9" />
                                    </dxwgv:GridViewDataComboBoxColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Price Units" FieldName="Equity_PriceUnits"
                                        VisibleIndex="6">
                                        <EditFormSettings CaptionLocation="Near" VisibleIndex="10" />
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataComboBoxColumn Caption="Price UOM" FieldName="Equity_PriceUOM"
                                        VisibleIndex="11" Visible="False">
                                        <EditCellStyle Wrap="False">
                                        </EditCellStyle>
                                        <PropertiesComboBox ValueType="System.String" DataSourceID="SqlDataSourceUOM" TextField="UOM_Name"
                                            ValueField="UOM_Name" Width="120px">
                                        </PropertiesComboBox>
                                        <CellStyle CssClass="gridcellleft">
                                        </CellStyle>
                                        <EditFormCaptionStyle Wrap="False">
                                        </EditFormCaptionStyle>
                                        <EditFormSettings CaptionLocation="Near" Visible="True" VisibleIndex="11" />
                                    </dxwgv:GridViewDataComboBoxColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Face Value" FieldName="ISIN_FaceValue" Visible="False"
                                        VisibleIndex="12">
                                        <CellStyle CssClass="gridcellleft">
                                        </CellStyle>
                                        <EditFormSettings Visible="False" />
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewCommandColumn VisibleIndex="7">
                                        <ClearFilterButton Visible="True">
                                        </ClearFilterButton>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <HeaderTemplate>
                                            <a href="javascript:void(0);" onclick="grdExchDetails.AddNewRow()"><span style="color: #000099;
                                                text-decoration: underline">Add New</span> </a>
                                        </HeaderTemplate>
                                        <EditButton Visible="True">
                                        </EditButton>
                                    </dxwgv:GridViewCommandColumn>
                                </Columns>
                                <SettingsEditing Mode="PopupEditForm" PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True"
                                    PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="900px" EditFormColumnCount="4" />
                                <StylesEditors>
                                    <ProgressBar Height="25px">
                                    </ProgressBar>
                                </StylesEditors>
                                <Templates>
                                    <EditForm>
                                        <table style="width: 100%">
                                            <tr>
                                                <td style="width: 25%">
                                                </td>
                                                <td style="width: 50%">
                                                    <controls>
                                                        <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormEditors" ColumnID="" ID="Editors">
                                                        </dxwgv:ASPxGridViewTemplateReplacement>                                                           
                                                    </controls>
                                                    <div style="text-align: right; padding: 2px 2px 2px 2px">
                                                        <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                                            runat="server">
                                                        </dxwgv:ASPxGridViewTemplateReplacement>
                                                        <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                                            runat="server">
                                                        </dxwgv:ASPxGridViewTemplateReplacement>
                                                    </div>
                                                </td>
                                                <td style="width: 25%">
                                                </td>
                                            </tr>
                                        </table>
                                    </EditForm>
                                </Templates>
                            </dxwgv:ASPxGridView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dxwgv:ASPxGridView ID="grdCropActionDetails" runat="server" Width="100%" KeyFieldName="Equity_SeriesID"
                                AutoGenerateColumns="False" >
                                <Styles>
                                    <Header Font-Bold="true" ForeColor="black" CssClass="EHEADER" Border-BorderColor="AliceBlue">
                                    </Header>
                                    <AlternatingRow BackColor="White">
                                    </AlternatingRow>
                                    <LoadingPanel ImageSpacing="10px">
                                    </LoadingPanel>
                                </Styles>
                                <StylesEditors>
                                    <ProgressBar Height="25px">
                                    </ProgressBar>
                                </StylesEditors>
                                <Settings ShowGroupPanel="false" ShowFooter="True" ShowStatusBar="Visible" ShowTitlePanel="True" />
                                <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
                                    <FirstPageButton Visible="True">
                                    </FirstPageButton>
                                    <LastPageButton Visible="True">
                                    </LastPageButton>
                                </SettingsPager>
                                <SettingsBehavior AllowFocusedRow="True" />
                                <Columns>
                                    <dxwgv:GridViewDataTextColumn Caption="Action Type" FieldName="CorpAction_Type" VisibleIndex="0">
                                        <CellStyle CssClass="gridcellleft">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Record Date" FieldName="CorpAction_RecordDate"
                                        VisibleIndex="1">
                                        <CellStyle CssClass="gridcellleft">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="BC Start" FieldName="CorpAction_BCStart" VisibleIndex="2">
                                        <CellStyle CssClass="gridcellleft">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="BC End" FieldName="CorpAction_BCEnd" VisibleIndex="3">
                                        <CellStyle CssClass="gridcellleft">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Ex Date" FieldName="CorpAction_ExDate" VisibleIndex="4">
                                        <CellStyle CssClass="gridcellleft">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Dividend Amount" FieldName="CorpAction_DividendAmount"
                                        VisibleIndex="5">
                                        <CellStyle CssClass="gridcellleft">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Ratio" FieldName="CorpAction_Ratio" VisibleIndex="6">
                                        <CellStyle CssClass="gridcellleft">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Remarks" FieldName="CorpAction_Remarks" VisibleIndex="7">
                                        <CellStyle CssClass="gridcellleft">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                            </dxwgv:ASPxGridView>
                        </td>
                    </tr>
                </table>
                <table width="910" id="tblT2" runat="server">
                    <tr>
                        <td>
                            <dxwgv:ASPxGridView ID="grdDailyStatDetails" ClientInstanceName="grid" runat="server"
                                Width="100%" KeyFieldName="Equity_ProductID" AutoGenerateColumns="False" >
                                <Styles>
                                    <Header Font-Bold="true" ForeColor="black" CssClass="EHEADER" Border-BorderColor="AliceBlue">
                                    </Header>
                                    <AlternatingRow BackColor="White">
                                    </AlternatingRow>
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
                                    <dxwgv:GridViewDataTextColumn Caption="Date" FieldName="DailyStat_DateTimeCON" VisibleIndex="0"
                                        Width="3%">
                                        <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                        </CellStyle>
                                        <HeaderStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False" />
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Open" FieldName="DailyStat_Open" VisibleIndex="1"
                                        Width="10%">
                                        <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                        </CellStyle>
                                        <HeaderStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False" />
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="High" FieldName="DailyStat_High" VisibleIndex="2"
                                        Width="10%">
                                        <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                        </CellStyle>
                                        <HeaderStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False" />
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Low" FieldName="DailyStat_Low" VisibleIndex="3"
                                        Width="10%">
                                        <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                        </CellStyle>
                                        <HeaderStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False" />
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Close" FieldName="DailyStat_Close" VisibleIndex="4"
                                        Width="10%">
                                        <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                        </CellStyle>
                                        <HeaderStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False" />
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Traded Quantity" FieldName="DailyStat_TradedQuantity"
                                        VisibleIndex="5" Width="5%">
                                        <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                        </CellStyle>
                                        <HeaderStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False" />
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Traded Value" FieldName="DailyStat_TradedValue"
                                        VisibleIndex="6" Width="5%">
                                        <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                        </CellStyle>
                                        <HeaderStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False" />
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
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
