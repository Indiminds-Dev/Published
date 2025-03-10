<%@ page language="C#" autoeventwireup="true" inherits="management_MutualFund, App_Web_0jwcfgzk" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxDataView" TagPrefix="dxdv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Mutual Fund</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript">
    function Show() 
    {
        var url = "frmAddDocuments.aspx";
        popup.SetContentUrl(url);
        popup.Show();
    }
     function ShowRate() {
        
        var url = "showRates.aspx";
        popup1.SetContentUrl(url);
        popup1.Show();
        
        

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
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" style="text-align: center;">
                    <strong><span style="color: #000099">Mutual Funds</span></strong></td>
            </tr>
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
                            <td class="gridcellright">
                                <dxe:ASPxComboBox ID="cmbExport" runat="server" AutoPostBack="true" BackColor="Navy"
                                    Font-Bold="False" ForeColor="White" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged"
                                    ValueType="System.Int32" Width="130px">
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
                    <dxwgv:ASPxGridView ID="MutualFundGrid" ClientInstanceName="grid" runat="server"
                        AutoGenerateColumns="False" DataSourceID="MutualFund" KeyFieldName="prds_internalId"
                        Width="100%" OnCustomCallback="MutualFundGrid_CustomCallback">
                        <Columns>
                            <dxwgv:GridViewDataTextColumn Caption="Product Name" FieldName="prds_description"
                                VisibleIndex="0" Width="80%">
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                </EditCellStyle>
                                <PropertiesTextEdit Width="300px">
                                    <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                        <RequiredField ErrorText="Please Enter Product name" IsRequired="True" />
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False" VerticalAlign="Top">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True" Caption="Product Name" VisibleIndex="0" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataComboBoxColumn Caption="Benchmark Index" FieldName="prd_benchmarkIndex"
                                Visible="False" VisibleIndex="3">
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                </EditCellStyle>
                                <PropertiesComboBox DataSourceID="BentchSelect" EnableIncrementalFiltering="True"
                                    EnableSynchronization="False" TextField="bench_Index" ValueField="bench_Id" ValueType="System.String"
                                    Width="300px">
                                </PropertiesComboBox>
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True" Caption="Benchmark Index" VisibleIndex="6" />
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataComboBoxColumn Caption="AMC" FieldName="prd_amc" Visible="False"
                                VisibleIndex="4">
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                </EditCellStyle>
                                <PropertiesComboBox DataSourceID="AMCSelect" EnableIncrementalFiltering="True" EnableSynchronization="False"
                                    TextField="amc_nameOfAMC" ValueField="amc_amcCode" ValueType="System.String"
                                    Width="300px">
                                </PropertiesComboBox>
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True" Caption="AMC:" VisibleIndex="8" />
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataComboBoxColumn Caption="RTA" FieldName="prd_rta" Visible="False"
                                VisibleIndex="5">
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                </EditCellStyle>
                                <PropertiesComboBox DataSourceID="RTASelect" EnableIncrementalFiltering="True" EnableSynchronization="False"
                                    TextField="rta_name" ValueField="rta_id" ValueType="System.String" Width="300px">
                                </PropertiesComboBox>
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True" Caption="RTA:" VisibleIndex="10" />
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="prd_rtaCode" Visible="False" VisibleIndex="6"
                                Caption="RTA Prod. Code">
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                </EditCellStyle>
                                <PropertiesTextEdit Width="300px">
                                </PropertiesTextEdit>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True" Caption="RTA Prod. Code" VisibleIndex="12" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataComboBoxColumn Caption="Scheme Type" FieldName="prd_mfSchemeType"
                                Visible="False" VisibleIndex="7">
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                </EditCellStyle>
                                <PropertiesComboBox EnableIncrementalFiltering="True" EnableSynchronization="False"
                                    ValueType="System.String" Width="300px">
                                    <Items>
                                        <dxe:ListEditItem Text="Open Ended" Value="Open Ended">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Close Ended" Value="Close Ended">
                                        </dxe:ListEditItem>
                                    </Items>
                                </PropertiesComboBox>
                                <CellStyle Wrap="False">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True" Caption="Scheme Type" VisibleIndex="14" />
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataComboBoxColumn Caption="Scheme Category" FieldName="prd_mfschemeCategory"
                                Visible="False" VisibleIndex="8">
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                </EditCellStyle>
                                <PropertiesComboBox DataSourceID="SchemeCategorySelect" EnableIncrementalFiltering="True"
                                    EnableSynchronization="False" TextField="mfcat_Category" ValueField="mfcat_id"
                                    ValueType="System.String" Width="300px">
                                </PropertiesComboBox>
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True" Caption="Scheme Category" VisibleIndex="16" />
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="prd_sebiRegnNo" Visible="False" VisibleIndex="1"
                                Caption="Sebi Regn No">
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                </EditCellStyle>
                                <PropertiesTextEdit Width="300px">
                                </PropertiesTextEdit>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True" Caption="Sebi Regn No:" VisibleIndex="2" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataComboBoxColumn Caption="STP Available" FieldName="prd_isStpFacilityAvailable"
                                Visible="False" VisibleIndex="15" Name="STP Available">
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                </EditCellStyle>
                                <PropertiesComboBox EnableIncrementalFiltering="True" EnableSynchronization="False"
                                    ValueType="System.String" Width="300px">
                                    <Items>
                                        <dxe:ListEditItem Text="Yes" Value="Yes">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="No" Value="No">
                                        </dxe:ListEditItem>
                                    </Items>
                                </PropertiesComboBox>
                                <CellStyle Wrap="False">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True" Caption="STP Available ?" VisibleIndex="13" />
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataComboBoxColumn Caption="SIP Available" FieldName="prd_isSipFacilityAvailable"
                                Visible="False" VisibleIndex="16" Name="SIP Available">
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                </EditCellStyle>
                                <PropertiesComboBox EnableIncrementalFiltering="True" EnableSynchronization="False"
                                    ValueType="System.String" Width="300px">
                                    <Items>
                                        <dxe:ListEditItem Text="Yes" Value="Yes">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="No" Value="No">
                                        </dxe:ListEditItem>
                                    </Items>
                                </PropertiesComboBox>
                                <CellStyle Wrap="False">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True" Caption="SIP Available" VisibleIndex="15" />
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataComboBoxColumn Caption="SWP Available" FieldName="prd_isSwpFacilityAvailable"
                                Visible="False" VisibleIndex="17">
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                </EditCellStyle>
                                <PropertiesComboBox EnableIncrementalFiltering="True" EnableSynchronization="False"
                                    ValueType="System.String" Width="300px">
                                    <Items>
                                        <dxe:ListEditItem Text="Yes" Value="Yes">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="No" Value="No">
                                        </dxe:ListEditItem>
                                    </Items>
                                </PropertiesComboBox>
                                <CellStyle Wrap="False">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True" Caption="SWP Available" VisibleIndex="17" />
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataComboBoxColumn Caption="Switching Available" FieldName="prd_isSwitchingFacilityAvailable"
                                Visible="False" VisibleIndex="14">
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                </EditCellStyle>
                                <PropertiesComboBox EnableIncrementalFiltering="True" EnableSynchronization="False"
                                    ValueType="System.String" Width="300px">
                                    <Items>
                                        <dxe:ListEditItem Text="Yes" Value="Yes">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="No" Value="No">
                                        </dxe:ListEditItem>
                                    </Items>
                                </PropertiesComboBox>
                                <CellStyle Wrap="False">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True" Caption="Switching Available?" VisibleIndex="11" />
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="prd_fundManagers" Visible="False" VisibleIndex="10"
                                Caption="Fund Managers">
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                </EditCellStyle>
                                <PropertiesTextEdit Width="300px">
                                </PropertiesTextEdit>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True" Caption="Fund Managers:" VisibleIndex="20" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataDateColumn FieldName="prd_closingDate" Visible="False" VisibleIndex="10">
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                </EditCellStyle>
                                <PropertiesDateEdit DisplayFormatString="" Width="300px" EditFormat="Custom" EditFormatString="dd MM yyyy"
                                    UseMaskBehavior="True">
                                </PropertiesDateEdit>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True" Caption="NFO Close Date" VisibleIndex="3" />
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewDataDateColumn FieldName="prd_launchDate" Visible="False" VisibleIndex="1">
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                </EditCellStyle>
                                <PropertiesDateEdit DisplayFormatString="" Width="300px" EditFormat="Custom" EditFormatString="dd MM yyyy"
                                    UseMaskBehavior="True">
                                </PropertiesDateEdit>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True" Caption="Launch|NFO Start Date:  " VisibleIndex="1" />
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewDataDateColumn FieldName="prd_inOperationTillDate" Visible="False"
                                VisibleIndex="11">
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                </EditCellStyle>
                                <PropertiesDateEdit DisplayFormatString="" Width="300px" EditFormat="Custom" EditFormatString="dd MM yyyy"
                                    UseMaskBehavior="True">
                                </PropertiesDateEdit>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True" Caption="Operation Close Date  " VisibleIndex="5" />
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="prd_amfiSchemeCode" Visible="False" VisibleIndex="2">
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                </EditCellStyle>
                                <PropertiesTextEdit Width="300px">
                                </PropertiesTextEdit>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True" Caption="AMFI Scheme Code" VisibleIndex="4" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="prd_investmentObjective" Visible="False"
                                VisibleIndex="18">
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                </EditCellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True" Caption="Investment Objective" VisibleIndex="19" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="prd_investmentOption" Visible="False" VisibleIndex="9">
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                </EditCellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True" Caption="Investment Option" VisibleIndex="18" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataComboBoxColumn Caption="Dividend Reinvestment Available" FieldName="prd_isDividentReinvestment"
                                Visible="False" VisibleIndex="13">
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                </EditCellStyle>
                                <PropertiesComboBox EnableIncrementalFiltering="True" EnableSynchronization="False"
                                    ValueType="System.String" Width="300px">
                                    <Items>
                                        <dxe:ListEditItem Text="Yes" Value="Yes">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="No" Value="No">
                                        </dxe:ListEditItem>
                                    </Items>
                                </PropertiesComboBox>
                                <CellStyle Wrap="False">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True" Caption="Dividend Reinvestment Available" VisibleIndex="9" />
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="prd_minimumApplicationAmount" Visible="False"
                                VisibleIndex="12">
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                </EditCellStyle>
                                <PropertiesTextEdit Width="300px">
                                </PropertiesTextEdit>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True" Caption="Min. Subcription Amount" VisibleIndex="7" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewCommandColumn VisibleIndex="1">
                                <DeleteButton Visible="True">
                                </DeleteButton>
                                <EditButton Visible="True">
                                </EditButton>
                                <HeaderStyle HorizontalAlign="Center" />
                                <HeaderTemplate>
                                    <a href="javascript:void(0);" onclick="grid.AddNewRow()"><span style="color: #000099;
                                        text-decoration: underline">Add New</span> </a>
                                </HeaderTemplate>
                            </dxwgv:GridViewCommandColumn>
                        </Columns>
                        <Styles>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                            <Cell CssClass="gridcellleft">
                            </Cell>
                        </Styles>
                        <Settings ShowStatusBar="Visible" ShowGroupPanel="True" />
                        <SettingsText PopupEditFormCaption="Add/Modify Mutual Fund" />
                        <SettingsPager NumericButtonCount="20" PageSize="20" AlwaysShowPager="True" ShowSeparators="True">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                        <SettingsBehavior ColumnResizeMode="NextColumn" AllowFocusedRow="True" ConfirmDelete="True" />
                        <SettingsEditing Mode="PopupEditForm" PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True"
                            PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="800px" />
                        <Templates>
                            <EditForm>
                                <div style="padding: 4px 4px 3px 4px">
                                    <table style="width: 100%">
                                        <tr>
                                            <td style="width: 100%">
                                                <dxtc:ASPxPageControl runat="server" ID="pageControl" Width="100%" ActiveTabIndex="0"
                                                    >
                                                    <TabPages>
                                                        <dxtc:TabPage Text="ProductDetails">
                                                            <ContentCollection>
                                                                <dxw:ContentControl runat="server">
                                                                    <table width="100%">
                                                                        <tr>
                                                                            <td style="width: 90%" align="center">
                                                                                <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormEditors"
                                                                                    ColumnID="" ID="Editors">
                                                                                </dxwgv:ASPxGridViewTemplateReplacement>
                                                                                <div style="text-align: right; padding: 2px 20px 2px 2px">
                                                                                    <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                                                                        runat="server" ColumnID="">
                                                                                    </dxwgv:ASPxGridViewTemplateReplacement>
                                                                                    <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                                                                        runat="server" ColumnID="">
                                                                                    </dxwgv:ASPxGridViewTemplateReplacement>
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </dxw:ContentControl>
                                                            </ContentCollection>
                                                        </dxtc:TabPage>
                                                        <dxtc:TabPage Text="PropAssetAlloc">
                                                            <ContentCollection>
                                                                <dxw:ContentControl runat="server">
                                                                    <dxwgv:ASPxGridView ID="AssetGrid" ClientInstanceName="Asset" runat="server" AutoGenerateColumns="False"
                                                                         DataSourceID="AssetClass" KeyFieldName="prd_id" Width="90%" OnBeforePerformDataSelect="AssetGrid_BeforePerformDataSelect">
                                                                        <Columns>
                                                                            <dxwgv:GridViewDataTextColumn FieldName="prd_productId" Visible="False" VisibleIndex="0">
                                                                                <EditCellStyle HorizontalAlign="Left">
                                                                                </EditCellStyle>
                                                                                <EditFormSettings Visible="False" />
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn FieldName="prd_productCode" Visible="False" VisibleIndex="0">
                                                                                <EditCellStyle HorizontalAlign="Left">
                                                                                </EditCellStyle>
                                                                                <EditFormSettings Visible="False" />
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataComboBoxColumn Caption="AssestsClass" FieldName="prd_assetsClass"
                                                                                VisibleIndex="0">
                                                                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                                                                </EditCellStyle>
                                                                                <PropertiesComboBox DataSourceID="AssetClassSelect" EnableIncrementalFiltering="True"
                                                                                    EnableSynchronization="False" TextField="invt_AssetsClass" ValueField="invt_id"
                                                                                    ValueType="System.String" Width="300px">
                                                                                </PropertiesComboBox>
                                                                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                                                                </CellStyle>
                                                                                <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                                                </EditFormCaptionStyle>
                                                                                <EditFormSettings Visible="True" />
                                                                            </dxwgv:GridViewDataComboBoxColumn>
                                                                            <dxwgv:GridViewDataTextColumn Caption="Max" FieldName="prd_max" VisibleIndex="1"
                                                                                Width="30%">
                                                                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                                                                </EditCellStyle>
                                                                                <CellStyle HorizontalAlign="Left">
                                                                                </CellStyle>
                                                                                <PropertiesTextEdit Width="300px">
                                                                                    <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                                        <RegularExpression ErrorText="Please Enter Digit" ValidationExpression="^\d+(\.\d\d)?$" />
                                                                                    </ValidationSettings>
                                                                                </PropertiesTextEdit>
                                                                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False" VerticalAlign="Top">
                                                                                </EditFormCaptionStyle>
                                                                                <EditFormSettings Visible="True" />
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn Caption="Min" FieldName="prd_min" VisibleIndex="2"
                                                                                Width="30%">
                                                                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                                                                </EditCellStyle>
                                                                                <CellStyle HorizontalAlign="Left">
                                                                                </CellStyle>
                                                                                <PropertiesTextEdit Width="300px">
                                                                                    <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                                        <RegularExpression ErrorText="Please Enter Digit" ValidationExpression="^\d+(\.\d\d)?$" />
                                                                                    </ValidationSettings>
                                                                                </PropertiesTextEdit>
                                                                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False" VerticalAlign="Top">
                                                                                </EditFormCaptionStyle>
                                                                                <EditFormSettings Visible="True" />
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn FieldName="CreateDate" Visible="False" VisibleIndex="3">
                                                                                <EditCellStyle HorizontalAlign="Left">
                                                                                </EditCellStyle>
                                                                                <EditFormSettings Visible="False" />
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn FieldName="CreateUser" Visible="False" VisibleIndex="3">
                                                                                <EditCellStyle HorizontalAlign="Left">
                                                                                </EditCellStyle>
                                                                                <EditFormSettings Visible="False" />
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn FieldName="LastModifyDate" Visible="False" VisibleIndex="3">
                                                                                <EditCellStyle HorizontalAlign="Left">
                                                                                </EditCellStyle>
                                                                                <EditFormSettings Visible="False" />
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn FieldName="LastModifyUser" Visible="False" VisibleIndex="3">
                                                                                <EditCellStyle HorizontalAlign="Left">
                                                                                </EditCellStyle>
                                                                                <EditFormSettings Visible="False" />
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewCommandColumn VisibleIndex="3">
                                                                                <DeleteButton Visible="True">
                                                                                </DeleteButton>
                                                                                <EditButton Visible="True">
                                                                                </EditButton>
                                                                                 <HeaderTemplate>
                                    <a href="javascript:void(0);" onclick="Asset.AddNewRow()"><span style="color: #000099;
                                        text-decoration: underline">Add New</span> </a>
                                </HeaderTemplate>
                                                                            </dxwgv:GridViewCommandColumn>
                                                                        </Columns>
                                                                        <Styles>
                                                                            <LoadingPanel ImageSpacing="10px">
                                                                            </LoadingPanel>
                                                                            <Header SortingImageSpacing="5px" ImageSpacing="5px">
                                                                            </Header>
                                                                            <Cell CssClass=" gridcellleft">
                                                                            </Cell>
                                                                        </Styles>
                                                                        <Settings ShowStatusBar="Visible" ShowTitlePanel="True"></Settings>
                                                                        <SettingsText PopupEditFormCaption="Add/Modify Assets"></SettingsText>
                                                                        <SettingsPager PageSize="20" NumericButtonCount="20">
                                                                        </SettingsPager>
                                                                        <SettingsBehavior ConfirmDelete="True" ColumnResizeMode="NextColumn"></SettingsBehavior>
                                                                        <SettingsEditing EditFormColumnCount="1" PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True"
                                                                            PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="600px" Mode="PopupEditForm">
                                                                        </SettingsEditing>
                                                                        <Templates>
                                                                            <%--<TitlePanel>
                                                                                <table style="width: 100%">
                                                                                    <tr>
                                                                                        <td align="right">
                                                                                            <table width="200">
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        <dxe:ASPxButton ID="ASPxButton1" runat="server" Text="ADD" ToolTip="Add New Data"
                                                                                                            Height="18px" Width="88px" AutoPostBack="False">
                                                                                                            <ClientSideEvents Click="function(s, e) {Asset.AddNewRow();}" />
                                                                                                        </dxe:ASPxButton>
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </TitlePanel>--%>
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
                                                                    <br />
                                                                </dxw:ContentControl>
                                                            </ContentCollection>
                                                        </dxtc:TabPage>
                                                        <dxtc:TabPage Text="SchmLoadStruct">
                                                            <ContentCollection>
                                                                <dxw:ContentControl runat="server">
                                                                    <table style="width: 100%" border="2">
                                                                        <tr>
                                                                            <td align="center">
                                                                                <dxe:ASPxLabel ID="ASPxLabel1" runat="server" Text="During NFO" Width="125px" Font-Bold="True"
                                                                                    ForeColor="Black">
                                                                                </dxe:ASPxLabel>
                                                                            </td>
                                                                            <td align="center">
                                                                                <dxe:ASPxLabel ID="ASPxLabel2" runat="server" Text="Ongoing Basis" Width="113px"
                                                                                    Font-Bold="True" ForeColor="Black">
                                                                                </dxe:ASPxLabel>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="center">
                                                                                <table style="width: 100%">
                                                                                    <tr>
                                                                                        <td align="center">
                                                                                            <dxe:ASPxLabel ID="ASPxLabel3" runat="server" Text="Entry " Width="104px" Font-Bold="True"
                                                                                                ForeColor="Black">
                                                                                            </dxe:ASPxLabel>
                                                                                        </td>
                                                                                        <td align="center">
                                                                                            &nbsp;<dxe:ASPxLabel ID="ASPxLabel4" runat="server" Text="Exit " Width="77px" Font-Bold="True"
                                                                                                ForeColor="Black">
                                                                                            </dxe:ASPxLabel>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td align="center">
                                                                                <table style="width: 100%">
                                                                                    <tr>
                                                                                        <td align="center">
                                                                                            <dxe:ASPxLabel ID="ASPxLabel5" runat="server" Text="Entry" Width="82px" Font-Bold="True"
                                                                                                ForeColor="Black">
                                                                                            </dxe:ASPxLabel>
                                                                                        </td>
                                                                                        <td align="center">
                                                                                            <dxe:ASPxLabel ID="ASPxLabel6" runat="server" Text="Exit" Width="74px" Font-Bold="True"
                                                                                                ForeColor="Black">
                                                                                            </dxe:ASPxLabel>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="2">
                                                                                <dxwgv:ASPxGridView ID="ShowRateGrid" runat="server" AutoGenerateColumns="False"
                                                                                    DataSourceID="SchemeLoad" ClientInstanceName="Rates" KeyFieldName="nfo_id" Width="100%"
                                                                                    OnBeforePerformDataSelect="AssetGrid_BeforePerformDataSelect">
                                                                                    <Columns>
                                                                                        <dxwgv:GridViewDataTextColumn FieldName="nfo_id" ReadOnly="True" Visible="False"
                                                                                            VisibleIndex="1">
                                                                                            <EditFormSettings Visible="False" />
                                                                                        </dxwgv:GridViewDataTextColumn>
                                                                                        <dxwgv:GridViewDataTextColumn FieldName="nfo_prdsId" Visible="False" VisibleIndex="0">
                                                                                            <EditFormSettings Visible="False" />
                                                                                        </dxwgv:GridViewDataTextColumn>
                                                                                        <dxwgv:GridViewDataTextColumn FieldName="nfo_productCode" Visible="False" VisibleIndex="0">
                                                                                            <EditFormSettings Visible="False" />
                                                                                        </dxwgv:GridViewDataTextColumn>
                                                                                        <dxwgv:GridViewDataTextColumn Caption="%" FieldName="nfo_nfoEntryHigherPercentage"
                                                                                            VisibleIndex="0" Width="8%">
                                                                                            <EditFormSettings Caption="On During Entry Higher Percentage" Visible="True" />
                                                                                            <PropertiesTextEdit Width="300px">
                                                                                            </PropertiesTextEdit>
                                                                                            <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                                                                            </EditFormCaptionStyle>
                                                                                        </dxwgv:GridViewDataTextColumn>
                                                                                        <dxwgv:GridViewDataTextColumn Caption="Amount" FieldName="nfo_nfoEntryAmount" VisibleIndex="1"
                                                                                            Width="16%">
                                                                                            <EditFormSettings Caption="On During Entry Amount" Visible="True" />
                                                                                            <PropertiesTextEdit Width="300px">
                                                                                            </PropertiesTextEdit>
                                                                                            <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                                                                            </EditFormCaptionStyle>
                                                                                        </dxwgv:GridViewDataTextColumn>
                                                                                        <dxwgv:GridViewDataTextColumn FieldName="nfo_nfoEntryLowerPercentage" Visible="False"
                                                                                            VisibleIndex="2">
                                                                                        </dxwgv:GridViewDataTextColumn>
                                                                                        <dxwgv:GridViewDataTextColumn Caption="%" FieldName="nfo_nfoOnEntryGoingHighPercentage"
                                                                                            VisibleIndex="4" Width="8%">
                                                                                            <EditFormSettings Caption="On  Going Entry High Percentage" Visible="True" />
                                                                                            <PropertiesTextEdit Width="300px">
                                                                                            </PropertiesTextEdit>
                                                                                            <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                                                                            </EditFormCaptionStyle>
                                                                                        </dxwgv:GridViewDataTextColumn>
                                                                                        <dxwgv:GridViewDataTextColumn Caption="Amount" FieldName="nfo_onGoingEntryAmount"
                                                                                            VisibleIndex="5" Width="8%">
                                                                                            <EditFormSettings Caption="On Going Entry Amount" Visible="True" />
                                                                                            <PropertiesTextEdit Width="300px">
                                                                                            </PropertiesTextEdit>
                                                                                            <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                                                                            </EditFormCaptionStyle>
                                                                                        </dxwgv:GridViewDataTextColumn>
                                                                                        <dxwgv:GridViewDataTextColumn FieldName="nfo_onGoingEntryLowPercentage" Visible="False"
                                                                                            VisibleIndex="4">
                                                                                        </dxwgv:GridViewDataTextColumn>
                                                                                        <dxwgv:GridViewDataTextColumn Caption="%" FieldName="nfo_onGoingExitPercentage" VisibleIndex="6"
                                                                                            Width="8%">
                                                                                            <EditFormSettings Caption="On Going Exit Percentage" Visible="True" />
                                                                                            <PropertiesTextEdit Width="300px">
                                                                                            </PropertiesTextEdit>
                                                                                            <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                                                                            </EditFormCaptionStyle>
                                                                                        </dxwgv:GridViewDataTextColumn>
                                                                                        <dxwgv:GridViewDataTextColumn Caption="Month" FieldName="nfo_onGoingExitUnit" VisibleIndex="7"
                                                                                            Width="8%">
                                                                                            <EditFormSettings Caption="On Going Month" Visible="True" />
                                                                                            <PropertiesTextEdit Width="300px">
                                                                                            </PropertiesTextEdit>
                                                                                            <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                                                                            </EditFormCaptionStyle>
                                                                                        </dxwgv:GridViewDataTextColumn>
                                                                                        <dxwgv:GridViewDataTextColumn Caption="%" FieldName="nfo_duringExitPercentage" VisibleIndex="2"
                                                                                            Width="8%">
                                                                                            <EditFormSettings Caption="On During Exit Percentage" Visible="True" />
                                                                                            <PropertiesTextEdit Width="300px">
                                                                                            </PropertiesTextEdit>
                                                                                            <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                                                                            </EditFormCaptionStyle>
                                                                                        </dxwgv:GridViewDataTextColumn>
                                                                                        <dxwgv:GridViewDataTextColumn Caption="Month" FieldName="nfo_duringExitUnit" VisibleIndex="3"
                                                                                            Width="22%">
                                                                                            <EditFormSettings Caption="On During Month" Visible="True" />
                                                                                            <PropertiesTextEdit Width="300px">
                                                                                            </PropertiesTextEdit>
                                                                                            <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                                                                            </EditFormCaptionStyle>
                                                                                        </dxwgv:GridViewDataTextColumn>
                                                                                        <dxwgv:GridViewDataDateColumn FieldName="CreateDate" Visible="False" VisibleIndex="8">
                                                                                        </dxwgv:GridViewDataDateColumn>
                                                                                        <dxwgv:GridViewDataTextColumn FieldName="CreateUser" Visible="False" VisibleIndex="8">
                                                                                        </dxwgv:GridViewDataTextColumn>
                                                                                        <dxwgv:GridViewDataDateColumn FieldName="LastModifyDate" Visible="False" VisibleIndex="8">
                                                                                        </dxwgv:GridViewDataDateColumn>
                                                                                        <dxwgv:GridViewDataTextColumn FieldName="LastModifyUser" Visible="False" VisibleIndex="8">
                                                                                        </dxwgv:GridViewDataTextColumn>
                                                                                        <dxwgv:GridViewCommandColumn VisibleIndex="8">
                                                                                            <DeleteButton Visible="True">
                                                                                            </DeleteButton>
                                                                                            <EditButton Visible="True">
                                                                                            </EditButton>
                                                                                              <NewButton Visible="True">
                                                                                            </NewButton>
                                                                                        </dxwgv:GridViewCommandColumn>
                                                                                    </Columns>
                                                                                    <Styles>
                                                                                        <LoadingPanel ImageSpacing="10px">
                                                                                        </LoadingPanel>
                                                                                        <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                                        </Header>
                                                                                        <Cell CssClass="gridcellleft">
                                                                                        </Cell>
                                                                                    </Styles>
                                                                                    <SettingsText PopupEditFormCaption="Add/Modify MutualFund Rates" />
                                                                                    <Border BorderColor="LightSteelBlue" BorderStyle="Double" BorderWidth="5px" />
                                                                                    <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True">
                                                                                    </SettingsPager>
                                                                                    <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
                                                                                    <SettingsEditing Mode="PopupEditForm" PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True"
                                                                                        PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="600px" />
                                                                                </dxwgv:ASPxGridView>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    <br />
                                                                </dxw:ContentControl>
                                                            </ContentCollection>
                                                        </dxtc:TabPage>
                                                        <dxtc:TabPage Text="Documents">
                                                            <ContentCollection>
                                                                <dxw:ContentControl runat="server">
                                                                    <dxwgv:ASPxGridView ID="MutualFundDocumentGrid" runat="server" AutoGenerateColumns="False"
                                                                        ClientInstanceName="gridDocument" KeyFieldName="Id" DataSourceID="MutualFundDocumentData"
                                                                        Width="90%" Font-Size="10px" OnBeforePerformDataSelect="AssetGrid_BeforePerformDataSelect">
                                                                        <Columns>
                                                                            <dxwgv:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="0" Visible="False">
                                                                                <EditFormSettings Visible="False" />
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn FieldName="Type" VisibleIndex="0" Caption="DocumentType"
                                                                                Width="25%">
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn FieldName="FileName" VisibleIndex="1" Caption="DocumentName"
                                                                                Width="25%">
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn FieldName="Src" VisibleIndex="2" Visible="False">
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn FieldName="FilePath" ReadOnly="True" VisibleIndex="2"
                                                                                Caption="Document Physical Location" Width="25%">
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataHyperLinkColumn Caption="View" FieldName="Src" VisibleIndex="3"
                                                                                Width="15%">
                                                                                <DataItemTemplate>
                                                                                    <a href='viewImage.aspx?id=<%#Eval("Src") %>' target="_blank">View</a>
                                                                                </DataItemTemplate>
                                                                            </dxwgv:GridViewDataHyperLinkColumn>
                                                                            <dxwgv:GridViewCommandColumn VisibleIndex="4">
                                                                                <DeleteButton Visible="True">
                                                                                </DeleteButton>
                                                                                 <HeaderTemplate>
                                    <a href="javascript:void(0);" onclick="Show();"><span style="color: #000099;
                                        text-decoration: underline">Add New</span> </a>
                                </HeaderTemplate>
                                                                            </dxwgv:GridViewCommandColumn>
                                                                        </Columns>
                                                                        <Settings  ShowStatusBar="Visible" ShowTitlePanel="True" />
                                                                        <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="250px" PopupEditFormHorizontalAlign="Center"
                                                                            PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="500px"
                                                                            EditFormColumnCount="1" />
                                                                        <Styles>
                                                                            <LoadingPanel ImageSpacing="10px">
                                                                            </LoadingPanel>
                                                                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                            </Header>
                                                                            <Cell CssClass="gridcellleft">
                                                                            </Cell>
                                                                        </Styles>
                                                                        <SettingsText PopupEditFormCaption="Add/Modify MutualFund Document" ConfirmDelete="Are You Want To Delete This Record ???" />
                                                                        <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True">
                                                                        </SettingsPager>
                                                                        <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
                                                                        <Templates>
                                                                            <%--<TitlePanel>
                                                                                <table style="width: 100%">
                                                                                    <tr>
                                                                                        <td align="right">
                                                                                            <table width="200">
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        <dxe:ASPxButton ID="ASPxButton1" runat="server" Text="ADD" ToolTip="Add New Data"
                                                                                                            Height="18px" Width="88px" Font-Size="10px" AutoPostBack="False">
                                                                                                              <ClientSideEvents Click="function(s,e){Show();}" />
                                                                                                        </dxe:ASPxButton>
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </TitlePanel>--%>
                                                                        </Templates>
                                                                        <Border BorderColor="LightSteelBlue" BorderStyle="Double" BorderWidth="5px" />
                                                                    </dxwgv:ASPxGridView>
                                                                    <dxpc:ASPxPopupControl ID="ASPXPopupControl" runat="server" ContentUrl="frmAddDocuments.aspx"
                                                                        CloseAction="CloseButton" Top="100" Left="400" ClientInstanceName="popup" Height="500px"
                                                                        Width="430px" HeaderText="Add Document">
                                                                        <ContentCollection>
                                                                            <dxpc:PopupControlContentControl runat="server">
                                                                            </dxpc:PopupControlContentControl>
                                                                        </ContentCollection>
                                                                    </dxpc:ASPxPopupControl>
                                                                </dxw:ContentControl>
                                                            </ContentCollection>
                                                        </dxtc:TabPage>
                                                        <dxtc:TabPage Text="Show Rates">
                                                            <ContentCollection>
                                                                <dxw:ContentControl runat="server">
                                                                    <dxe:ASPxButton ID="ASPxButton2" runat="server" Text="Show Rates" ToolTip="Show Rates"
                                                                        Height="18px" Width="88px" Font-Size="10px" AutoPostBack="False">
                                                                        <ClientSideEvents Click="function(s,e){ShowRate();}" />
                                                                    </dxe:ASPxButton>
                                                                    <dxpc:ASPxPopupControl ID="ASPXPopupControl2" runat="server" ContentUrl="showRates.aspx"
                                                                        CloseAction="CloseButton" Top="100" Left="400" ClientInstanceName="popup1" Height="500px"
                                                                        Width="700px" HeaderText="Show Rates">
                                                                        <ContentCollection>
                                                                            <dxpc:PopupControlContentControl runat="server">
                                                                            </dxpc:PopupControlContentControl>
                                                                        </ContentCollection>
                                                                    </dxpc:ASPxPopupControl>
                                                                </dxw:ContentControl>
                                                            </ContentCollection>
                                                        </dxtc:TabPage>
                                                    </TabPages>
                                                    <ContentStyle>
                                                        <Border BorderColor="#002D96" BorderStyle="Solid" BorderWidth="1px" />
                                                    </ContentStyle>
                                                    <LoadingPanelStyle ImageSpacing="6px">
                                                    </LoadingPanelStyle>
                                                </dxtc:ASPxPageControl>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </EditForm>
                        </Templates>
                        <Images >
                            <ExpandedButton Height="12px" Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png"
                                Width="11px" />
                            <CollapsedButton Height="12px" Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png"
                                Width="11px" />
                            <DetailCollapsedButton Height="12px" Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png"
                                Width="11px" />
                            <DetailExpandedButton Height="12px" Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png"
                                Width="11px" />
                            <FilterRowButton Height="13px" Width="13px" />
                        </Images>
                    </dxwgv:ASPxGridView>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="MutualFund" runat="server" ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>"
            SelectCommand="MutualFundSelect" SelectCommandType="StoredProcedure" InsertCommand="MutualFundInsert"
            InsertCommandType="StoredProcedure" DeleteCommand="MutualFundDelete" DeleteCommandType="StoredProcedure"
            UpdateCommand="MutualFundUpdate" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="prds_internalId" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="prds_description" Type="String" />
                <asp:Parameter Name="prds_internalId" Type="String" />
                <asp:Parameter Name="prd_benchmarkIndex" Type="Int32" />
                <asp:Parameter Name="prd_amc" Type="String" />
                <asp:Parameter Name="prd_rta" Type="Int32" />
                <asp:Parameter Name="prd_rtaCode" Type="String" />
                <asp:Parameter Name="prd_mfSchemeType" Type="String" />
                <asp:Parameter Name="prd_mfschemeCategory" Type="Int32" />
                <asp:Parameter Name="prd_amfiSchemeCode" Type="String" />
                <asp:Parameter Name="prd_launchDate" Type="datetime" />
                <asp:Parameter Name="prd_closingDate" Type="datetime" />
                <asp:Parameter Name="prd_isStpFacilityAvailable" Type="String" />
                <asp:Parameter Name="prd_isSipFacilityAvailable" Type="String" />
                <asp:Parameter Name="prd_isSwpFacilityAvailable" Type="String" />
                <asp:Parameter Name="prd_isSwitchingFacilityAvailable" Type="String" />
                <asp:Parameter Name="prd_fundManagers" Type="String" />
                <asp:Parameter Name="prd_investmentObjective" Type="String" />
                <asp:Parameter Name="prd_minimumApplicationAmount" Type="String" />
                <asp:Parameter Name="prd_sebiRegnNo" Type="String" />
                <asp:Parameter Name="prd_isDividentReinvestment" Type="String" />
                <asp:Parameter Name="prd_investmentOption" Type="String" />
                <asp:Parameter Name="prd_inOperationTillDate" Type="datetime" />
                <asp:SessionParameter Name="CreateUser" Type="Decimal" SessionField="userid" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="prds_description" Type="String" />
                <asp:Parameter Name="prd_benchmarkIndex" Type="Int32" />
                <asp:Parameter Name="prd_amc" Type="String" />
                <asp:Parameter Name="prd_rta" Type="Int32" />
                <asp:Parameter Name="prd_rtaCode" Type="String" />
                <asp:Parameter Name="prd_mfSchemeType" Type="String" />
                <asp:Parameter Name="prd_mfschemeCategory" Type="Int32" />
                <asp:Parameter Name="prd_amfiSchemeCode" Type="String" />
                <asp:Parameter Name="prd_launchDate" Type="datetime" />
                <asp:Parameter Name="prd_closingDate" Type="datetime" />
                <asp:Parameter Name="prd_isStpFacilityAvailable" Type="String" />
                <asp:Parameter Name="prd_isSipFacilityAvailable" Type="String" />
                <asp:Parameter Name="prd_isSwpFacilityAvailable" Type="String" />
                <asp:Parameter Name="prd_isSwitchingFacilityAvailable" Type="String" />
                <asp:Parameter Name="prd_fundManagers" Type="String" />
                <asp:Parameter Name="prd_investmentObjective" Type="String" />
                <asp:Parameter Name="prd_minimumApplicationAmount" Type="String" />
                <asp:Parameter Name="prd_sebiRegnNo" Type="String" />
                <asp:Parameter Name="prd_isDividentReinvestment" Type="String" />
                <asp:Parameter Name="prd_investmentOption" Type="String" />
                <asp:Parameter Name="prd_inOperationTillDate" Type="datetime" />
                <asp:SessionParameter Name="CreateUser" Type="Decimal" SessionField="userid" />
            </InsertParameters>
        </asp:SqlDataSource>
        <%--====================================================== AMC SELECT =======================================================--%>
        <asp:SqlDataSource ID="AMCSelect" runat="server" ConnectionString="<%$ ConnectionStrings:CRMConnectionString%>"
            SelectCommand="SELECT [amc_amcCode], [amc_nameOfAMC]  FROM  [tbl_master_AssetsManagementCompanies] order by [amc_nameOfAMC]">
        </asp:SqlDataSource>
        <%--==========================================================================================================================--%>
        <%--====================================================== RTA SELECT =======================================================--%>
        <asp:SqlDataSource ID="RTASelect" runat="server" ConnectionString="<%$ ConnectionStrings:CRMConnectionString%>"
            SelectCommand="SELECT [rta_id], [rta_name]  FROM  [tbl_registrarTransferAgent] order by [rta_name]">
        </asp:SqlDataSource>
        <%--==========================================================================================================================--%>
        <%--====================================================== BENTCH SELECT =======================================================--%>
        <asp:SqlDataSource ID="BentchSelect" runat="server" ConnectionString="<%$ ConnectionStrings:CRMConnectionString%>"
            SelectCommand="SELECT [bench_Id], [bench_Index]  FROM  [tbl_master_indices] order by [bench_Index]">
        </asp:SqlDataSource>
        <%--==========================================================================================================================--%>
        <%--====================================================== Scheme Category SELECT ============================================--%>
        <asp:SqlDataSource ID="SchemeCategorySelect" runat="server" ConnectionString="<%$ ConnectionStrings:CRMConnectionString%>"
            SelectCommand="SELECT [mfcat_id], [mfcat_Category]  FROM  [tbl_master_mfSchemeCategory] order by [mfcat_Category]">
        </asp:SqlDataSource>
        <%--==========================================================================================================================--%>
        <%-- ================================================================ Data Source Of Asset Class grid ================================--%>
        <asp:SqlDataSource ID="AssetClass" runat="server" ConflictDetection="CompareAllValues"
            ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>" DeleteCommand="DELETE FROM [tbl_master_assetAllocationParameter] WHERE [prd_id] = @original_prd_id"
            InsertCommand="INSERT INTO [tbl_master_assetAllocationParameter] ([prd_productId], [prd_productCode], [prd_assetsClass], [prd_min], [prd_max], [CreateDate], [CreateUser]) VALUES (@prds_internalId, 'MF', @prd_assetsClass, @prd_min, @prd_max, getdate(), @CreateUserAsset)"
            OldValuesParameterFormatString="original_{0}" SelectCommand="select * from [tbl_master_assetAllocationParameter]  Where prd_productId=@prds_internalId"
            UpdateCommand="UPDATE [tbl_master_assetAllocationParameter] SET [prd_assetsClass] = @prd_assetsClass, [prd_min] = @prd_min, [prd_max] = @prd_max,[LastModifyDate] = getdate(), [LastModifyUser] = @CreateUserAsset WHERE [prd_id] = @original_prd_id">
            <DeleteParameters>
                <asp:Parameter Name="original_prd_id" Type="Decimal" />
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter SessionField="KeyVal_InternalID" Type="String" Name="prds_internalId">
                </asp:SessionParameter>
            </SelectParameters>
            <UpdateParameters>
                <asp:SessionParameter SessionField="KeyVal_InternalID" Type="String" Name="prds_internalId">
                </asp:SessionParameter>
                <asp:Parameter Name="prd_assetsClass" Type="String" />
                <asp:Parameter Name="prd_min" Type="Decimal" />
                <asp:Parameter Name="prd_max" Type="Decimal" />
                <asp:SessionParameter Name="CreateUserAsset" Type="Decimal" SessionField="userid" />
            </UpdateParameters>
            <InsertParameters>
                <asp:SessionParameter SessionField="KeyVal_InternalID" Type="String" Name="prds_internalId">
                </asp:SessionParameter>
                <asp:Parameter Name="prd_assetsClass" Type="String" />
                <asp:Parameter Name="prd_min" Type="Decimal" />
                <asp:Parameter Name="prd_max" Type="Decimal" />
                <asp:SessionParameter Name="CreateUserAsset" Type="Decimal" SessionField="userid" />
            </InsertParameters>
        </asp:SqlDataSource>
        <%--====================================================== ASSET CLASS SELECT =======================================================--%>
        <asp:SqlDataSource ID="AssetClassSelect" runat="server" ConnectionString="<%$ ConnectionStrings:CRMConnectionString%>"
            SelectCommand="SELECT [invt_id], [invt_AssetsClass]  FROM  [tbl_master_investmentAssetsClass] order by [invt_AssetsClass]">
        </asp:SqlDataSource>
        <%--==========================================================================================================================--%>
        <%--======================================================= Document Data Source ============================================--%>
        <asp:SqlDataSource ID="MutualFundDocumentData" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="select tbl_master_document.doc_id AS Id, tbl_master_documentType.dty_documentType AS Type,tbl_master_document.doc_documentName AS FileName, tbl_master_document.doc_source AS Src,COALESCE ('Building- ' + tbl_master_building.bui_Name + CHAR(13) + CHAR(10), '') +COALESCE ('/ Floor No : ' + tbl_master_document.doc_Floor + CHAR(13) + CHAR(10), '')  + '/ Room No-' + tbl_master_document.doc_RoomNo + '/ Cabinet No-' + tbl_master_document.doc_CellNo + '/ File No-' + tbl_master_document.doc_FileNo AS FilePath from tbl_master_document INNER JOIN tbl_master_documentType ON tbl_master_document.doc_documentTypeId = tbl_master_documentType.dty_id INNER JOIN tbl_master_building ON tbl_master_document.doc_buildingId = tbl_master_building.bui_id where doc_contactId=@prds_internalId"
            DeleteCommand="delete from tbl_master_document where doc_id=@Id">
            <SelectParameters>
                <asp:SessionParameter SessionField="KeyVal_InternalID" Type="String" Name="prds_internalId">
                </asp:SessionParameter>
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="decimal" />
            </DeleteParameters>
        </asp:SqlDataSource>
        <%--=======================================================  End Of Document Data source ====================================--%>
        <%--============================================================ Scheme Load structure Data source =============================--%>
        <asp:SqlDataSource ID="SchemeLoad" runat="server" ConflictDetection="CompareAllValues"
            ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>" DeleteCommand="DELETE FROM [tbl_master_mfSchemeLoadStructure] WHERE [nfo_id] = @original_nfo_id"
            InsertCommand="INSERT INTO [tbl_master_mfSchemeLoadStructure] ([nfo_prdsId], [nfo_productCode], [nfo_nfoEntryHigherPercentage], [nfo_nfoEntryAmount], [nfo_nfoOnEntryGoingHighPercentage], [nfo_onGoingEntryAmount], [nfo_onGoingExitPercentage], [nfo_onGoingExitUnit], [nfo_duringExitPercentage], [nfo_duringExitUnit], [CreateDate], [CreateUser]) VALUES (@prds_internalId, 'MF', @nfo_nfoEntryHigherPercentage, @nfo_nfoEntryAmount, @nfo_nfoOnEntryGoingHighPercentage, @nfo_onGoingEntryAmount,  @nfo_onGoingExitPercentage, @nfo_onGoingExitUnit, @nfo_duringExitPercentage, @nfo_duringExitUnit, getdate(), @CreateUserRates)"
            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [tbl_master_mfSchemeLoadStructure] where [nfo_prdsId]=@prds_internalId"
            UpdateCommand="UPDATE [tbl_master_mfSchemeLoadStructure] SET  [nfo_nfoEntryHigherPercentage] = @nfo_nfoEntryHigherPercentage, [nfo_nfoEntryAmount] = @nfo_nfoEntryAmount, [nfo_nfoOnEntryGoingHighPercentage] = @nfo_nfoOnEntryGoingHighPercentage, [nfo_onGoingEntryAmount] = @nfo_onGoingEntryAmount,[nfo_onGoingExitPercentage] = @nfo_onGoingExitPercentage, [nfo_onGoingExitUnit] = @nfo_onGoingExitUnit, [nfo_duringExitPercentage] = @nfo_duringExitPercentage, [nfo_duringExitUnit] = @nfo_duringExitUnit, [LastModifyDate] = getdate(), [LastModifyUser] = @CreateUserRates WHERE [nfo_id] = @original_nfo_id">
            <DeleteParameters>
                <asp:Parameter Name="original_nfo_id" Type="Decimal" />
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter SessionField="KeyVal_InternalID" Type="String" Name="prds_internalId">
                </asp:SessionParameter>
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="nfo_nfoEntryHigherPercentage" Type="String" />
                <asp:Parameter Name="nfo_nfoEntryAmount" Type="String" />
                <asp:Parameter Name="nfo_nfoOnEntryGoingHighPercentage" Type="String" />
                <asp:Parameter Name="nfo_onGoingEntryAmount" Type="String" />
                <asp:Parameter Name="nfo_onGoingExitPercentage" Type="String" />
                <asp:Parameter Name="nfo_onGoingExitUnit" Type="String" />
                <asp:Parameter Name="nfo_duringExitPercentage" Type="String" />
                <asp:Parameter Name="nfo_duringExitUnit" Type="String" />
                <asp:SessionParameter Name="CreateUserRates" Type="Decimal" SessionField="userid" />
                <asp:SessionParameter SessionField="KeyVal_InternalID" Type="String" Name="prds_internalId">
                </asp:SessionParameter>
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="nfo_nfoEntryHigherPercentage" Type="String" />
                <asp:Parameter Name="nfo_nfoEntryAmount" Type="String" />
                <asp:Parameter Name="nfo_nfoOnEntryGoingHighPercentage" Type="String" />
                <asp:Parameter Name="nfo_onGoingEntryAmount" Type="String" />
                <asp:Parameter Name="nfo_onGoingExitPercentage" Type="String" />
                <asp:Parameter Name="nfo_onGoingExitUnit" Type="String" />
                <asp:Parameter Name="nfo_duringExitPercentage" Type="String" />
                <asp:Parameter Name="nfo_duringExitUnit" Type="String" />
                <asp:SessionParameter Name="CreateUserRates" Type="Decimal" SessionField="userid" />
                <asp:SessionParameter SessionField="KeyVal_InternalID" Type="String" Name="prds_internalId">
                </asp:SessionParameter>
            </InsertParameters>
        </asp:SqlDataSource>
        <%--================================================================  End Of Scheme Load structure Data source =================--%>
        <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
        </dxwgv:ASPxGridViewExporter>
    </form>
</body>
</html>
