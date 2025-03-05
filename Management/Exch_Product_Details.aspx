<%@ page language="C#" autoeventwireup="true" inherits="management_Exch_Product_Details, App_Web_psdiigfa" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>

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
    <title>Product Details</title>
     <link rel="stylesheet" href="../windowfiles/dhtmlwindow.css" type="text/css" />

    <script type="text/javascript" src="../windowfiles/dhtmlwindow.js"></script>

    <link rel="stylesheet" href="../modalfiles/modal.css" type="text/css" />

    <script type="text/javascript" src="../modalfiles/modal.js"></script>
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">
        function OnMoreInfoClick(keyValue,FrmDt,ToDt)
         {
         var url='DStatChart.aspx?Flag=SR&id='+keyValue+'&FrmDt='+FrmDt+'&ToDt='+ToDt;
        }
        function ShowHideFilter(obj)
        {
           grid.PerformCallback(obj);
        }
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
     function infoclick(productid,seriesid)
         {
           var url='isin_productdetails.aspx?productid='+productid+'&seriesid='+seriesid;
           editwin=dhtmlmodal.open("Editbox", "iframe", url, "ISIN Details", "width=910px,height=400px,center=1,resize=1,top=500", "recal")                 
   
        }
        function Page_Load()
        {
            height();
            Hide('tr_PN');
        }
        function ChkPN()
        {
          Show('tr_PN');
        }
    
      function Show(obj)
        {
            document.getElementById(obj).style.display='inline';
        }
        function Hide(obj)
        {
            document.getElementById(obj).style.display='none';
        }
    </script>
    
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain100">
            <tr>
                <td id="tdPN" runat="server" align="center">
                </td>
                <td>
                <asp:Button ID="btnChangePN" runat="server" Text="Change Product Name" CssClass="btnUpdate" OnClientClick="ChkPN()"/>
                </td>
            </tr>
            <tr id="tr_PN" runat="server">
                <td id="tdPName" runat="server">
                </td>
                <td>
                    <asp:TextBox ID="txtProductName" Width="200px" runat="server"></asp:TextBox>
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btnUpdate" Width="50px" OnClick="btnSave_Click"/>
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btnUpdate" Width="50px" OnClick="btnCancel_Click"/>
                </td>
         
            </tr>
        </table>
        <table  id="tblShowDt" runat="server" width="100%">
            <tr>
                <td colspan="5" class="EHEADER">
                </td>
            </tr>
            <tr>
                <td style="width: 98px">
                    From Date
                </td>
                <td>
                    <dxe:ASPxDateEdit ID="fromdate" runat="server" 
                         EditFormat="Custom" EditFormatString="dd MM yyyy"
                         UseMaskBehavior="True">
                        <ButtonStyle Width="13px">
                        </ButtonStyle>
                    </dxe:ASPxDateEdit>
                </td>
                <td>
                    To Date
                </td>
                <td>
                    <dxe:ASPxDateEdit ID="ToDate" runat="server" 
                         EditFormat="Custom" EditFormatString="dd MM yyyy"
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
                    <asp:ImageButton ID="imgBtnCharts" ImageUrl="../images/chart_display.gif" runat="server"  />
                </td>
                </tr>
                </table>
                   
                </td>
                
            </tr>
        </table>
        <table id="tblT1" runat="server" width="100%">
            <tr>
                <td>
                    <dxwgv:ASPxGridView ID="grdExchDetails"  ClientInstanceName="grdExchDetails" KeyFieldName="Equity_SeriesID" runat="server"
                        Width="100%" AutoGenerateColumns="False" 
                          OnRowInserting="grdExchDetails_RowInserting" OnRowUpdating="grdExchDetails_RowUpdating">
                        <Styles  >
                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                        </Styles>
                        
                        <Settings ShowStatusBar="Visible" />
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
                                <PropertiesComboBox ValueType="System.String" TextField="Exchange_ShortName" DataSourceID="SqlExchangeDataSource" ValueField="Exchange_ID"  Width="120px">
                                </PropertiesComboBox>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings CaptionLocation="Near" />
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Ticker Code" FieldName="Equity_TickerCode" VisibleIndex="1">
                                <EditCellStyle Wrap="False">
                                </EditCellStyle>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <PropertiesTextEdit MaxLength="10" Width="120px">
                                </PropertiesTextEdit>
                                <EditFormCaptionStyle Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings CaptionLocation="Near" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Ticker Symbol" FieldName="Equity_TickerSymbol"
                                VisibleIndex="2">
                                <EditCellStyle Wrap="False">
                                </EditCellStyle>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <PropertiesTextEdit Width="120px">
                                </PropertiesTextEdit>
                                <EditFormCaptionStyle Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings CaptionLocation="Near" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Series" FieldName="Equity_Series" VisibleIndex="3">
                                <EditCellStyle Wrap="False">
                                </EditCellStyle>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <PropertiesTextEdit Width="120px">
                                </PropertiesTextEdit>
                                <EditFormCaptionStyle Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings CaptionLocation="Near" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Group" FieldName="Equity_Group" VisibleIndex="4">
                                <EditCellStyle Wrap="False">
                                </EditCellStyle>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <PropertiesTextEdit Width="120px">
                                </PropertiesTextEdit>
                                <EditFormCaptionStyle Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings CaptionLocation="Near" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Trading Lot" FieldName="Equity_TradingLot"
                                VisibleIndex="5">
                                <EditCellStyle Wrap="False">
                                </EditCellStyle>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <PropertiesTextEdit Width="120px">
                                </PropertiesTextEdit>
                                <EditFormCaptionStyle Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings CaptionLocation="Near" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataComboBoxColumn Caption="Trading UOM" FieldName="Equity_TradingUOM"
                                Visible="False" VisibleIndex="6">
                                <EditCellStyle Wrap="False">
                                </EditCellStyle>
                                <PropertiesComboBox ValueType="System.String" DataSourceID="SqlDataSourceUOM" TextField="UOM_Name" ValueField="UOM_Name" Width="120px">
                                </PropertiesComboBox>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings CaptionLocation="Near" Visible="True" />
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Delivery Lot" FieldName="Equity_DeliveryLot"
                                VisibleIndex="6">
                                <EditCellStyle Wrap="False">
                                </EditCellStyle>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <PropertiesTextEdit Width="120px">
                                </PropertiesTextEdit>
                                <EditFormCaptionStyle Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings CaptionLocation="Near" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataComboBoxColumn Caption="Delivary UOM" FieldName="Equity_DeliveryUOM"
                                Visible="False" VisibleIndex="7">
                                <EditCellStyle Wrap="False">
                                </EditCellStyle>
                                <PropertiesComboBox ValueType="System.String" DataSourceID="SqlDataSourceUOM" TextField="UOM_Name" ValueField="UOM_Name" Width="120px">
                                </PropertiesComboBox>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings CaptionLocation="Near" Visible="True" />
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataDateColumn Caption="Listing Date" FieldName="Equity_ListingDate"
                                VisibleIndex="7">
                                <HeaderStyle HorizontalAlign="Center" />
                                <EditCellStyle Wrap="False">
                                </EditCellStyle>
                                <PropertiesDateEdit DateOnError="Today" DisplayFormatString="dd MM yyyy" EditFormat="Custom"
                                    EditFormatString="dd MM yyyy" Width="120px" UseMaskBehavior="True">
                                </PropertiesDateEdit>
                                <Settings AllowAutoFilter="True" FilterMode="DisplayText" ShowFilterRowMenu="False"
                                    ShowInFilterControl="False" />
                                <CellStyle HorizontalAlign="Center" Wrap="False">
                                </CellStyle>
                                <EditFormCaptionStyle Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings CaptionLocation="Near" />
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewDataDateColumn Caption="Delisting Date" FieldName="Equity_DelistingDate" Visible="False" VisibleIndex="8">
                                 <HeaderStyle HorizontalAlign="Center" />
                                <EditCellStyle Wrap="False">
                                </EditCellStyle>
                                <PropertiesDateEdit DateOnError="Today" DisplayFormatString="dd MM yyyy" EditFormat="Custom"
                                    EditFormatString="dd MM yyyy" Width="120px" UseMaskBehavior="True">
                                </PropertiesDateEdit>
                                <Settings AllowAutoFilter="True" FilterMode="DisplayText" ShowFilterRowMenu="False"
                                    ShowInFilterControl="False" />
                                <CellStyle HorizontalAlign="Center" Wrap="False">
                                </CellStyle>
                                <EditFormCaptionStyle Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings CaptionLocation="Near" Visible="True" />
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Face Value" FieldName="ISIN_FaceValue" VisibleIndex="8">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                              <dxwgv:GridViewDataComboBoxColumn Caption="Stt. Appl"  FieldName="active" VisibleIndex="9">
                                <EditCellStyle Wrap="False">
                                </EditCellStyle>
                                <PropertiesComboBox ValueType="System.String" Width="120px">
                                    <Items>
                                        <dxe:ListEditItem Text="Yes" Value="Y" />
                                        <dxe:ListEditItem Text="No" Value="N" />
                                        <dxe:ListEditItem Text="ETF" Value="T" />
                                    </Items>
                                   
                                </PropertiesComboBox>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings CaptionLocation="Near" Visible="True" VisibleIndex="0" />
                            </dxwgv:GridViewDataComboBoxColumn>
                            <%--New Work 04/06/2022--%>
                            <%--<dxwgv:GridViewDataTextColumn Caption="ISIN" VisibleIndex="10">--%>
                            <dxwgv:GridViewDataComboBoxColumn Caption="Stamp Appl."  FieldName="Equity_Stamp" VisibleIndex="10">
                                <EditCellStyle Wrap="False"></EditCellStyle>
                                <PropertiesComboBox ValueType="System.String" Width="120px">
                                    <Items>
                                        <dxe:ListEditItem Text="Yes" Value="Y" />
                                        <dxe:ListEditItem Text="No" Value="N" />
                                    </Items>                                   
                                </PropertiesComboBox>
                                <CellStyle CssClass="gridcellleft"></CellStyle>
                                <EditFormCaptionStyle Wrap="False"></EditFormCaptionStyle>
                                <EditFormSettings CaptionLocation="Near" Visible="True" VisibleIndex="0" />
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataTextColumn Caption="ISIN" VisibleIndex="11">
                            <%--End of New Work 04/06/2022--%>
                                <DataItemTemplate>
                                    <a href="javascript:void(0);" onclick="infoclick('<%# Eval("Equity_ProductID") %>','<%#Eval("Equity_SeriesID") %>')">Show</a>
                                    
                                </DataItemTemplate>
                                <EditFormSettings Visible="False" />
                                <CellStyle Wrap="False" HorizontalAlign="Left">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <%--New Work 04/06/2022--%>
                            <%--<dxwgv:GridViewCommandColumn VisibleIndex="11">--%>
                            <dxwgv:GridViewCommandColumn VisibleIndex="12">
                            <%--End of New Work 04/06/2022--%>
                                <ClearFilterButton Visible="True">
                                </ClearFilterButton>
                                <HeaderStyle HorizontalAlign="Center" />
                                <HeaderTemplate>
                                    <a href="javascript:void(0);" onclick="grdExchDetails.AddNewRow()">
                                      <span style="color: #000099; text-decoration: underline">Add New</span>
                                    </a>
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
                    <table style="width:100%">
                      <tr><td style="width:25%"></td>
                          <td style="width:50%">
                            <controls>
                                <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormEditors" ColumnID="" ID="Editors">
                                </dxwgv:ASPxGridViewTemplateReplacement>                                                           
                            </controls>
                            <div style="text-align:right; padding:2px 2px 2px 2px">
                                <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton" runat="server"></dxwgv:ASPxGridViewTemplateReplacement>
                                <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton" runat="server"></dxwgv:ASPxGridViewTemplateReplacement>
                            </div>
                         </td>
                         <td style="width:25%"></td>
                     </tr>
                   </table>
                </EditForm>
            </Templates>
                    </dxwgv:ASPxGridView>
                </td>
            </tr>
            <tr>
            
            
            
                <td>
                    <dxwgv:ASPxGridView ID="grdCropActionDetails" ClientInstanceName="grdCropActionDetails" runat="server" Width="100%" KeyFieldName="CorpAction_ID"
                        AutoGenerateColumns="False" 
                         OnRowInserting="grdCropActionDetails_RowInserting" OnRowUpdating="grdCropActionDetails_RowUpdating">
                        <Styles  >
                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                        </Styles>
                        <Settings ShowStatusBar="Visible" />
                        <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                        <SettingsBehavior AllowFocusedRow="True" />
                        <Columns>
                            <dxwgv:GridViewDataComboBoxColumn Caption="CA Type"  FieldName="CorpAction_Type" VisibleIndex="0">
                                <EditCellStyle Wrap="False">
                                </EditCellStyle>
                                <PropertiesComboBox EnableIncrementalFiltering="True" ValueType="System.String" Width="120px">
                                    <Items>
                                        <dxe:ListEditItem Text="Dividend" Value="Dividend" />
                                        <dxe:ListEditItem Text="Interest Payment" Value="Interest Payment" />
                                        <dxe:ListEditItem Text="Redmption" Value="Redmption" />
                                        <dxe:ListEditItem Text="Bonus" Value="Bonus" />
                                        <dxe:ListEditItem Text="Rights" Value="Rights" />
                                        <dxe:ListEditItem Text="Split" Value="Split" />
                                        <dxe:ListEditItem Text="Merger" Value="Merger" />
                                        <dxe:ListEditItem Text="De-Merger" Value="De-Merger" />
                                        <dxe:ListEditItem Text="Amalgamation" Value="Amalgamation" />
                                        <dxe:ListEditItem Text="Scheme of" Value="Scheme of" />
                                        <dxe:ListEditItem Text="Arrangement" Value="Arrangement" />
                                        <dxe:ListEditItem Text="Other" Value="Other" />
                                    </Items>
                                    <ValidationSettings SetFocusOnError="True">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </PropertiesComboBox>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings CaptionLocation="Near" Visible="True" VisibleIndex="0" />
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataDateColumn Caption="Record Date" FieldName="CorpAction_RecordDate"
                                VisibleIndex="1">
                                <EditCellStyle Wrap="False">
                                </EditCellStyle>
                                <PropertiesDateEdit DateOnError="Today" DisplayFormatString="dd MM yyyy" EditFormat="Custom"
                                    EditFormatString="dd MM yyyy" Width="120px" UseMaskBehavior="True" >
                                </PropertiesDateEdit>
                                <Settings AllowAutoFilter="True" FilterMode="DisplayText" ShowFilterRowMenu="False"
                                    ShowInFilterControl="False" />
                                <CellStyle HorizontalAlign="Center" Wrap="False">
                                </CellStyle>
                                <EditFormCaptionStyle Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings CaptionLocation="Near" Visible="True" VisibleIndex="1" />
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewDataDateColumn Caption="BC Start" FieldName="CorpAction_BCStart" VisibleIndex="2">
                                <EditCellStyle Wrap="False">
                                </EditCellStyle>
                               <PropertiesDateEdit DateOnError="Today" DisplayFormatString="dd MM yyyy" EditFormat="Custom"
                                    EditFormatString="dd MM yyyy" Width="120px" UseMaskBehavior="True">
                                </PropertiesDateEdit>
                                <Settings AllowAutoFilter="True" FilterMode="DisplayText" ShowFilterRowMenu="False"
                                    ShowInFilterControl="False" />
                                <CellStyle HorizontalAlign="Center" Wrap="False">
                                </CellStyle>
                                <EditFormCaptionStyle Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings CaptionLocation="Near" Visible="True" VisibleIndex="2" />
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewDataDateColumn Caption="BC End" FieldName="CorpAction_BCEnd" VisibleIndex="3">
                                <EditCellStyle Wrap="False">
                                </EditCellStyle>
                                <PropertiesDateEdit DateOnError="Today" DisplayFormatString="dd MM yyyy" EditFormat="Custom"
                                    EditFormatString="dd MM yyyy" Width="120px" UseMaskBehavior="True">
                                </PropertiesDateEdit>
                                <Settings AllowAutoFilter="True" FilterMode="DisplayText" ShowFilterRowMenu="False"
                                    ShowInFilterControl="False" />
                                <CellStyle HorizontalAlign="Center" Wrap="False">
                                </CellStyle>
                                <EditFormCaptionStyle Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings CaptionLocation="Near" Visible="True" VisibleIndex="3" />
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewDataDateColumn Caption="ND Start" FieldName="CorpAction_NDStart" Visible="False" VisibleIndex="4">
                                <EditCellStyle Wrap="False">
                                </EditCellStyle>
                                <PropertiesDateEdit DateOnError="Today" DisplayFormatString="dd MM yyyy" EditFormat="Custom"
                                    EditFormatString="dd MM yyyy" Width="120px" UseMaskBehavior="True">
                                </PropertiesDateEdit>
                                <Settings AllowAutoFilter="True" FilterMode="DisplayText" ShowFilterRowMenu="False"
                                    ShowInFilterControl="False" />
                                <CellStyle HorizontalAlign="Center" Wrap="False">
                                </CellStyle>
                                <EditFormCaptionStyle Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings CaptionLocation="Near" Visible="True" VisibleIndex="4" />
                            </dxwgv:GridViewDataDateColumn> 
                            <dxwgv:GridViewDataDateColumn Caption="ND End" FieldName="CorpAction_NDEnd" Visible="False" VisibleIndex="5">
                                <EditCellStyle Wrap="False">
                                </EditCellStyle>
                                <PropertiesDateEdit  DateOnError="Today" DisplayFormatString="dd MM yyyy" EditFormat="Custom"
                                    EditFormatString="dd MM yyyy" Width="120px" UseMaskBehavior="True">
                                </PropertiesDateEdit>
                                <Settings AllowAutoFilter="True" FilterMode="DisplayText"  ShowFilterRowMenu="False"
                                    ShowInFilterControl="False" />
                                <CellStyle HorizontalAlign="Center" Wrap="False">
                                </CellStyle>
                                <EditFormCaptionStyle Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings CaptionLocation="Near"  Visible="True" VisibleIndex="5"/>
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewDataDateColumn Caption="Ex Date" FieldName="CorpAction_ExDate" VisibleIndex="4">
                                <EditCellStyle Wrap="False">
                                </EditCellStyle>
                                <PropertiesDateEdit DateOnError="Today" DisplayFormatString="dd MM yyyy" EditFormat="Custom"
                                    EditFormatString="dd MM yyyy" Width="120px" UseMaskBehavior="True">
                                </PropertiesDateEdit>
                                <Settings AllowAutoFilter="True" FilterMode="DisplayText" ShowFilterRowMenu="False"
                                    ShowInFilterControl="False" />
                                <CellStyle HorizontalAlign="Center" Wrap="False">
                                </CellStyle>
                                <EditFormCaptionStyle Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings CaptionLocation="Near" Visible="True" VisibleIndex="6"/>
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Dividend Rate" Visible="False" FieldName="CorpAction_DividendRate"
                                VisibleIndex="7">
                                <EditCellStyle Wrap="False">
                                </EditCellStyle>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <PropertiesTextEdit Width="120px">
                                    <ValidationSettings SetFocusOnError="True">
                                       <%-- <RequiredField IsRequired="True" />--%>
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                                <EditFormCaptionStyle Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings CaptionLocation="Near" Visible="True" VisibleIndex="7" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Dividend Amount" FieldName="CorpAction_DividendAmount"
                                VisibleIndex="5">
                                <EditCellStyle Wrap="False">
                                </EditCellStyle>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <PropertiesTextEdit Width="120px">
                                </PropertiesTextEdit>
                                <EditFormCaptionStyle Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings CaptionLocation="Near" Visible="True" VisibleIndex="8" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Ratio" FieldName="CorpAction_Ratio" VisibleIndex="6">
                                <EditCellStyle Wrap="False">
                                </EditCellStyle>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <PropertiesTextEdit Width="120px">
                                </PropertiesTextEdit>
                                <EditFormCaptionStyle Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings CaptionLocation="Near" Visible="True" ColumnSpan="2" VisibleIndex="9" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataMemoColumn Caption="Remarks" FieldName="CorpAction_Remarks" VisibleIndex="7">
                                <PropertiesMemoEdit Height="30px" Width="100%">
                                </PropertiesMemoEdit>
                                <EditCellStyle Wrap="False">
                                </EditCellStyle>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings CaptionLocation="Near" Visible="True" ColumnSpan="2" VisibleIndex="10" />
                            </dxwgv:GridViewDataMemoColumn>
                            <dxwgv:GridViewCommandColumn VisibleIndex="8">
                                <ClearFilterButton Visible="True">
                                </ClearFilterButton>
                                <HeaderStyle HorizontalAlign="Center" />
                               <%-- <HeaderTemplate>
                                    <a href="javascript:void(0);" onclick="grdCropActionDetails.AddNewRow()">
                                      <span style="color: #000099; text-decoration: underline">Add New</span>
                                    </a>
                                </HeaderTemplate>--%>
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
                            <table style="width:100%">
                              <tr><td style="width:25%"></td>
                                  <td style="width:50%">
                                    <controls>
                                        <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormEditors" ColumnID="" ID="Editors">
                                        </dxwgv:ASPxGridViewTemplateReplacement>                                                           
                                    </controls>
                                    <div style="text-align:right; padding:2px 2px 2px 2px">
                                        <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton" runat="server"></dxwgv:ASPxGridViewTemplateReplacement>
                                        <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton" runat="server"></dxwgv:ASPxGridViewTemplateReplacement>
                                    </div>
                                 </td>
                                 <td style="width:25%"></td>
                             </tr>
                           </table>
                        </EditForm>
                    </Templates>
                    </dxwgv:ASPxGridView>
                </td>
                
                
                
                
            </tr>
            <tr>
                <td align="center">
                    <dxwgv:ASPxGridView ID="grdIssueCapitalDetails" runat="server" 
                         Width="100%" AutoGenerateColumns="False">
                        <Styles  >
                            <Header ImageSpacing="5px" HorizontalAlign="Left" SortingImageSpacing="5px">
                            </Header>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                            <Cell HorizontalAlign="Left"></Cell>
                        </Styles>
                         <StylesEditors>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                        <Columns>
                            <dxwgv:GridViewDataTextColumn Caption='Capital' FieldName="fieldR" VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataDateColumn Caption="From Date" FieldName="fromDate" VisibleIndex="1">
                                <PropertiesDateEdit DisplayFormatString="dd MM yyyy" UseMaskBehavior="True">
                                </PropertiesDateEdit>
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewDataDateColumn Caption="Until Date" FieldName="toDate" VisibleIndex="2">
                                <PropertiesDateEdit DisplayFormatString="dd MM yyyy" UseMaskBehavior="True">
                                </PropertiesDateEdit>
                            </dxwgv:GridViewDataDateColumn>
                        </Columns>
                        <SettingsPager ShowSeparators="True">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                    </dxwgv:ASPxGridView>
                    <dxwgv:ASPxGridView ID="grdIndexMember" runat="server" 
                         Width="100%" AutoGenerateColumns="False">
                        <Styles  >
                            <Header ImageSpacing="5px" HorizontalAlign="Left" SortingImageSpacing="5px">
                            </Header>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                            <Cell HorizontalAlign="Left"></Cell>
                        </Styles>
                        <StylesEditors>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                        <Columns>
                            <dxwgv:GridViewDataTextColumn Caption='Index' FieldName="fieldR" VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataDateColumn Caption="From Date" FieldName="fromDate" VisibleIndex="1">
                                <PropertiesDateEdit DisplayFormatString="dd MM yyyy" UseMaskBehavior="True">
                                </PropertiesDateEdit>
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewDataDateColumn Caption="Until Date" FieldName="toDate" VisibleIndex="2">
                                <PropertiesDateEdit DisplayFormatString="dd MM yyyy" UseMaskBehavior="True">
                                </PropertiesDateEdit>
                            </dxwgv:GridViewDataDateColumn>
                        </Columns>
                        <SettingsPager ShowSeparators="True">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                    </dxwgv:ASPxGridView>
                </td>
            </tr>
        </table>
        <table width="100%" id="tblT2" runat="server">
            <tr>
                <td style="width: 100%;">
                    <dxwgv:ASPxGridView ID="grdDailyStatDetails" ClientInstanceName="grid" runat="server" Width="100%" KeyFieldName="Equity_ProductID"
                        AutoGenerateColumns="False" 
                        >
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
                        <Settings ShowStatusBar="Visible" />
                        <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                        <SettingsBehavior AllowFocusedRow="True" />
                        <Columns>
                            <dxwgv:GridViewDataTextColumn Caption="Date" FieldName="DailyStat_DateTimeCON" VisibleIndex="0" Width="3%">
                            
                                <CellStyle  HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                </CellStyle>
                                <HeaderStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Open" FieldName="DailyStat_Open" VisibleIndex="1" Width="10%">
                             
                                <CellStyle  HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                </CellStyle>
                                <HeaderStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="High" FieldName="DailyStat_High" VisibleIndex="2" Width="10%">
                           
                                <CellStyle  HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                </CellStyle>
                                <HeaderStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Low" FieldName="DailyStat_Low" VisibleIndex="3" Width="10%">
                             
                                <CellStyle  HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                </CellStyle>
                                <HeaderStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Close" FieldName="DailyStat_Close" VisibleIndex="4" Width="10%">
                          
                                <CellStyle  HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                </CellStyle>
                                <HeaderStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Traded Quantity"  FieldName="DailyStat_TradedQuantity" VisibleIndex="5" Width="5%">
                             
                                <CellStyle  HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                </CellStyle>
                                <HeaderStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False" />
                            </dxwgv:GridViewDataTextColumn>
                             <dxwgv:GridViewDataTextColumn Caption="Traded Value" FieldName="DailyStat_TradedValue" VisibleIndex="6" Width="5%">
                             
                                <CellStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                </CellStyle>
                                 <HeaderStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False" />
                            </dxwgv:GridViewDataTextColumn>
                             
                        </Columns>
                        <Templates>
                             <EditForm>
                                <table style="width:100%">
                                  <tr><td style="width:25%"></td>
                                      <td style="width:50%">
                                        <controls>
                                            <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormEditors" ColumnID="" ID="Editors">
                                            </dxwgv:ASPxGridViewTemplateReplacement>                                                           
                                        </controls>
                                        <div style="text-align:right; padding:2px 2px 2px 2px">
                                            <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton" runat="server"></dxwgv:ASPxGridViewTemplateReplacement>
                                            <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton" runat="server"></dxwgv:ASPxGridViewTemplateReplacement>
                                        </div>
                                     </td>
                                     <td style="width:25%"></td>
                                 </tr>
                               </table>
                            </EditForm>
                        </Templates>
                    </dxwgv:ASPxGridView>
                </td>
          
            </tr>
        </table>
             <asp:SqlDataSource ID="SqlExchangeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="SELECT (SELECT TOP 1 EXCHANGESEGMENT_ID  FROM Master_ExchangeSEGMENTS  WHERE EXCHANGESEGMENT_EXCHANGEID=[Exchange_ID]) AS [Exchange_ID] , [Exchange_ShortName]  FROM [Master_Exchange] ORDER BY [Exchange_ShortName] ">
        </asp:SqlDataSource>
        <asp:SqlDataSource id="SqlDataSourceUOM" runat="server" SelectCommand="SELECT [UOM_ID], [UOM_Name] FROM [Master_UOM] ORDER BY [UOM_Name]" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>">
        </asp:SqlDataSource>
    </form>
</body>
</html>
