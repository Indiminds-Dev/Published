<%@ page language="C#" autoeventwireup="true" inherits="management_exchange, App_Web__yen2upk" %>

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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript">
    //function is called on changing country
    function OnCountryChanged(cmbCountry) 
    {
        Address.GetEditor("State").PerformCallback(cmbCountry.GetValue().toString());
    }
    function OnStateChanged(cmbState) 
    {
        Address.GetEditor("City").PerformCallback(cmbState.GetValue().toString());
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
     function disp_prompt(name)
    {
    alert (name);
    if ( name == "tab2")
        {
        
        document.location.href="Contact_Document.aspx";         
        }
    }
     function OnPhoneClick()
    {
        if(phonefax.GetEditor('phf_phoneNumber').GetValue()==null)
        {
            alert('Phone Number Required');
        }
        else
        {
            phonefax.UpdateEdit();                
        }
    }
    function OnEmailClick()
    {
        if(Email_.GetEditor('eml_type').GetValue()=='Web Site')
        {
            if(Email_.GetEditor('eml_website').GetValue()==null)
                alert('Url Required');
            else
              Email_.UpdateEdit();     
        }
        else
        {
            if(Email_.GetEditor('eml_email').GetValue()==null)
                alert('Email Required');
            else
                Email_.UpdateEdit();                
        }
    }


    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain100" style="text-align: center">
            <tr>
                <td class="EHEADER">
                    <strong><span style="color: #000099">Exchange List</span></strong>
                </td>
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
                                    <items>
                                        <dxe:ListEditItem Text="Select" Value="0" />
                                        <dxe:ListEditItem Text="PDF" Value="1" />
                                        <dxe:ListEditItem Text="XLS" Value="2" />
                                        <dxe:ListEditItem Text="RTF" Value="3" />
                                        <dxe:ListEditItem Text="CSV" Value="4" />
                                    </items>
                                    <buttonstyle backcolor="#C0C0FF" forecolor="Black">
                                    </buttonstyle>
                                    <itemstyle backcolor="Navy" forecolor="White">
                                        <HoverStyle BackColor="#8080FF" ForeColor="White">
                                        </HoverStyle>
                                    </itemstyle>
                                    <border bordercolor="White" />
                                    <dropdownbutton text="Export">
                                    </dropdownbutton>
                                </dxe:ASPxComboBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <dxwgv:ASPxGridView ID="ExchangeGrid" ClientInstanceName="grid" runat="server" AutoGenerateColumns="False"
                        DataSourceID="ExchangeDatasource" KeyFieldName="exh_cntId" Width="100%" OnHtmlRowCreated="ExchangeGrid_HtmlRowCreated"
                        OnCustomCallback="ExchangeGrid_CustomCallback">
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="exh_id" ReadOnly="True" Visible="False"
                                VisibleIndex="0">
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="exh_cntId" Visible="False" VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Exchange" FieldName="exh_name" VisibleIndex="0"
                                Width="40%">
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                    <Paddings PaddingTop="15px" />
                                </EditCellStyle>
                                <PropertiesTextEdit Width="300px">
                                    <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                        <RequiredField ErrorText="Please Enter Exchange Name" IsRequired="True" />
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Short Name" FieldName="exh_shortName" VisibleIndex="1"
                                Width="40%">
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                </EditCellStyle>
                                <PropertiesTextEdit Width="300px">
                                </PropertiesTextEdit>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="CreateDate" Visible="False" VisibleIndex="2">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="CreateUser" Visible="False" VisibleIndex="2">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="LastModifyDate" Visible="False" VisibleIndex="2">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="LastModifyUser" Visible="False" VisibleIndex="2">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewCommandColumn VisibleIndex="2">
                                <HeaderStyle HorizontalAlign="Center" />
                                <DeleteButton Visible="True">
                                </DeleteButton>
                                <EditButton Visible="True">
                                </EditButton>
                                <HeaderTemplate>
                                    <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                                      { %>
                                    <span style="color: #000099;">Details</span> </a>
                                    <%} %>
                                </HeaderTemplate>
                            </dxwgv:GridViewCommandColumn>
                        </Columns>
                        <Styles>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                            <Header SortingImageSpacing="5px" ImageSpacing="5px">
                            </Header>
                            <Cell CssClass="gridcellleft">
                            </Cell>
                        </Styles>
                        <Settings ShowStatusBar="Visible" ShowGroupPanel="True"></Settings>
                        <SettingsText PopupEditFormCaption="Add/Modify Exchange"></SettingsText>
                        <SettingsPager PageSize="20" NumericButtonCount="20" AlwaysShowPager="True" ShowSeparators="True">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                        <SettingsBehavior ConfirmDelete="True" ColumnResizeMode="NextColumn"></SettingsBehavior>
                        <SettingsEditing EditFormColumnCount="1" PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True"
                            PopupEditFormVerticalAlign="BottomSides" PopupEditFormWidth="920px" Mode="PopupEditForm">
                        </SettingsEditing>
                        <Templates>
                            <EditForm>
                                <div style="padding: 4px 4px 3px 4px">
                                    <table style="width: 100%">
                                        <tr>
                                            <td style="width: 10%">
                                            </td>
                                            <td style="width: 80%">
                                                <dxtc:ASPxPageControl runat="server" ID="pageControl" Width="100%" ActiveTabIndex="0" ClientInstanceName="page">
                                                    <TabPages>
                                                        <dxtc:TabPage Text="General">
                                                            <ContentCollection>
                                                                <dxw:ContentControl runat="server">
                                                                    <table width="100%">
                                                                        <tr>
                                                                            <td style="width: 10%">
                                                                                &nbsp;</td>
                                                                            <td style="width: 80%" align="center">
                                                                                <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormEditors"
                                                                                    ColumnID="" ID="Editors">
                                                                                </dxwgv:ASPxGridViewTemplateReplacement>
                                                                            </td>
                                                                            <td style="width: 10%">
                                                                                &nbsp;</td>
                                                                        </tr>
                                                                    </table>
                                                                    <div style="text-align: right; padding: 2px 2px 2px 2px">
                                                                        <% if (Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "Modify" || Session["PageAccess"].ToString().Trim() == "All")
                                                                           {%>
                                                                        <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                                                            runat="server" ColumnID="">
                                                                        </dxwgv:ASPxGridViewTemplateReplacement>
                                                                        <%} %>
                                                                        <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                                                            runat="server" ColumnID="">
                                                                        </dxwgv:ASPxGridViewTemplateReplacement>
                                                                    </div>
                                                                </dxw:ContentControl>
                                                            </ContentCollection>
                                                        </dxtc:TabPage>
                                                        <dxtc:TabPage Text="Correspondance">
                                                            <ContentCollection>
                                                                <dxw:ContentControl runat="server">
                                                                    <dxtc:ASPxPageControl ID="ASPxPageControl2" runat="server" ActiveTabIndex="0" ClientInstanceName="page">
                                                                        <tabpages>
							                     <dxtc:TabPage Text="Adress">
                                                    <ContentCollection>
                                                    <dxw:ContentControl runat="server">  
                                                                <dxwgv:ASPxGridView runat="server" ID="AddressGrid" ClientInstanceName="Address"
                                                                        DataSourceID="ExchangeAddress" KeyFieldName="add_id" AutoGenerateColumns="False"
                                                                        Width="100%" OnCellEditorInitialize="AddressGrid_CellEditorInitialize" OnBeforePerformDataSelect="AddressGrid_BeforePerformDataSelect"
                                                                        OnHtmlEditFormCreated="AddressGrid_HtmlEditFormCreated" OnHtmlRowCreated="AddressGrid_HtmlRowCreated">
                                                                        <Templates>
                                                                            <EditForm>
                                                                                <table style="width: 100%">
                                                                                    <tr>
                                                                                        <td style="width: 30%">
                                                                                        </td>
                                                                                        <td style="width: 40%">
                                                                                            <controls>
                                    <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormEditors" ID="AddressForm"></dxwgv:ASPxGridViewTemplateReplacement>
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
                                                                                        <td style="width: 30%">
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </EditForm>
                                                                            <TitlePanel>
                                                                                <table style="width: 100%">
                                                                                    <tr>
                                                                                        <td align="right">
                                                                                            <table width="100%">
                                                                                                <tr>
                                                                                                    <td align="right" style="width: 50%">
                                                                                                        <span class="Ecoheadtxt" style="color: White">Add/Modify Address.</span>
                                                                                                    </td>
                                                                                                    <%--  <td style="text-align: right">
                                                                                                        <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                                           { %>
                                                                                                        <dxe:ASPxButton ID="ASPxButton1" runat="server" Text="ADD" ToolTip="Add New Data"
                                                                                                            Height="18px" Width="88px" AutoPostBack="False">
                                                                                                            <ClientSideEvents Click="function(s, e) {Address.AddNewRow();}" />
                                                                                                        </dxe:ASPxButton>
                                                                                                        <%} %>
                                                                                                    </td>--%>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </TitlePanel>
                                                                        </Templates>
                                                                        <SettingsEditing EditFormColumnCount="1" PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True"
                                                                            PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="600px" Mode="PopupEditForm">
                                                                        </SettingsEditing>
                                                                        <SettingsText PopupEditFormCaption="Add/Modify Address"></SettingsText>
                                                                        <Styles>
                                                                            <LoadingPanel ImageSpacing="10px">
                                                                            </LoadingPanel>
                                                                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                            </Header>
                                                                        </Styles>
                                                                        <Settings ShowStatusBar="Visible" ShowTitlePanel="True"></Settings>
                                                                        <SettingsBehavior ConfirmDelete="True" ColumnResizeMode="NextColumn"></SettingsBehavior>
                                                                        <SettingsPager PageSize="20" NumericButtonCount="20">
                                                                        </SettingsPager>
                                                                        <Columns>
                                                                            <dxwgv:GridViewDataTextColumn Visible="False" ReadOnly="True" VisibleIndex="0" FieldName="add_id">
                                                                                <EditFormSettings Visible="False"></EditFormSettings>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="0" FieldName="add_cntId">
                                                                                <EditFormSettings Visible="False"></EditFormSettings>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="0" FieldName="add_entity">
                                                                                <EditFormSettings Visible="False"></EditFormSettings>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataComboBoxColumn FieldName="add_addressType" Caption="Type" VisibleIndex="0"
                                                                                Width="10%">
                                                                                <EditCellStyle Wrap="False" HorizontalAlign="Left">
                                                                                </EditCellStyle>
                                                                                <PropertiesComboBox Width="300px" ValueType="System.String" EnableSynchronization="False"
                                                                                    EnableIncrementalFiltering="True">
                                                                                    <Items>
                                                                                        <dxe:ListEditItem Value="N/A" Text="N/A">
                                                                                        </dxe:ListEditItem>
                                                                                        <dxe:ListEditItem Value="Residence" Text="Residence">
                                                                                        </dxe:ListEditItem>
                                                                                        <dxe:ListEditItem Value="Office" Text="Office">
                                                                                        </dxe:ListEditItem>
                                                                                        <dxe:ListEditItem Value="Emergence" Text="Emergence">
                                                                                        </dxe:ListEditItem>
                                                                                        <dxe:ListEditItem Value="Correspondance" Text="Correspondance">
                                                                                        </dxe:ListEditItem>
                                                                                        <dxe:ListEditItem Value="Permanent" Text="Permanent">
                                                                                        </dxe:ListEditItem>
                                                                                        <dxe:ListEditItem Value="Contact Person" Text="Contact Person">
                                                                                        </dxe:ListEditItem>
                                                                                    </Items>
                                                                                </PropertiesComboBox>
                                                                                <CellStyle Wrap="False">
                                                                                </CellStyle>
                                                                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right">
                                                                                </EditFormCaptionStyle>
                                                                                <EditFormSettings Caption="Address Type" Visible="True"></EditFormSettings>
                                                                            </dxwgv:GridViewDataComboBoxColumn>
                                                                            <dxwgv:GridViewDataMemoColumn Caption="Address1" FieldName="add_address1" VisibleIndex="1"
                                                                                Width="10%">
                                                                                <PropertiesMemoEdit Width="300px">
                                                                                    <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                                        <RequiredField ErrorText="Please Enter Address" IsRequired="True" />
                                                                                    </ValidationSettings>
                                                                                </PropertiesMemoEdit>
                                                                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                                                                </EditCellStyle>
                                                                                <CellStyle Wrap="False">
                                                                                </CellStyle>
                                                                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right">
                                                                                </EditFormCaptionStyle>
                                                                                <EditFormSettings Visible="True" />
                                                                            </dxwgv:GridViewDataMemoColumn>
                                                                            <dxwgv:GridViewDataMemoColumn Caption="Address2" FieldName="add_address2" VisibleIndex="2"
                                                                                Width="10%">
                                                                                <PropertiesMemoEdit Width="300px">
                                                                                </PropertiesMemoEdit>
                                                                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                                                                </EditCellStyle>
                                                                                <CellStyle Wrap="False">
                                                                                </CellStyle>
                                                                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right">
                                                                                </EditFormCaptionStyle>
                                                                                <EditFormSettings Visible="True" />
                                                                            </dxwgv:GridViewDataMemoColumn>
                                                                            <dxwgv:GridViewDataMemoColumn Caption="Address3" FieldName="add_address3" VisibleIndex="3"
                                                                                Width="10%">
                                                                                <PropertiesMemoEdit Width="300px">
                                                                                </PropertiesMemoEdit>
                                                                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                                                                </EditCellStyle>
                                                                                <CellStyle Wrap="False">
                                                                                </CellStyle>
                                                                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right">
                                                                                </EditFormCaptionStyle>
                                                                                <EditFormSettings Visible="True" />
                                                                            </dxwgv:GridViewDataMemoColumn>
                                                                            <dxwgv:GridViewDataComboBoxColumn Caption="Country" FieldName="Country" VisibleIndex="4"
                                                                                Visible="False">
                                                                                <PropertiesComboBox DataSourceID="CountrySelect" TextField="Country" ValueField="cou_id"
                                                                                    EnableSynchronization="False" EnableIncrementalFiltering="True" ValueType="System.String"
                                                                                    Width="300px">
                                                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCountryChanged(s); }"></ClientSideEvents>
                                                                                </PropertiesComboBox>
                                                                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                                                                </CellStyle>
                                                                                <EditFormSettings Visible="True" />
                                                                                <EditFormCaptionStyle VerticalAlign="Top" Wrap="False" HorizontalAlign="Right">
                                                                                </EditFormCaptionStyle>
                                                                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                                                                </EditCellStyle>
                                                                            </dxwgv:GridViewDataComboBoxColumn>
                                                                            <dxwgv:GridViewDataComboBoxColumn Caption="State" FieldName="State" VisibleIndex="5"
                                                                                Visible="False">
                                                                                <PropertiesComboBox DataSourceID="StateSelect" TextField="State" ValueField="ID"
                                                                                    EnableSynchronization="False" EnableIncrementalFiltering="True" ValueType="System.String"
                                                                                    Width="300px">
                                                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) { OnStateChanged(s); }"></ClientSideEvents>
                                                                                </PropertiesComboBox>
                                                                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                                                                </CellStyle>
                                                                                <EditFormSettings Visible="True" />
                                                                                <EditFormCaptionStyle VerticalAlign="Top" Wrap="False" HorizontalAlign="Right">
                                                                                </EditFormCaptionStyle>
                                                                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                                                                </EditCellStyle>
                                                                            </dxwgv:GridViewDataComboBoxColumn>
                                                                            <dxwgv:GridViewDataComboBoxColumn Caption="City" FieldName="City" VisibleIndex="6"
                                                                                Visible="False">
                                                                                <PropertiesComboBox DataSourceID="SelectCity" TextField="City" ValueField="CityId"
                                                                                    EnableSynchronization="False" EnableIncrementalFiltering="True" ValueType="System.String">
                                                                                    <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                                        <RequiredField ErrorText="City Can Not Be Blank" IsRequired="True" />
                                                                                    </ValidationSettings>
                                                                                </PropertiesComboBox>
                                                                                <CellStyle CssClass="gridcellleft">
                                                                                </CellStyle>
                                                                                <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                                                </EditFormCaptionStyle>
                                                                                <EditFormSettings Visible="True" />
                                                                            </dxwgv:GridViewDataComboBoxColumn>
                                                                            <dxwgv:GridViewDataTextColumn FieldName="Country1" VisibleIndex="4" Caption="Country">
                                                                                <EditFormSettings Visible="False" />
                                                                                <CellStyle CssClass="gridcellleft">
                                                                                </CellStyle>
                                                                                <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                                                </EditFormCaptionStyle>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn FieldName="State1" VisibleIndex="5" Caption="State">
                                                                                <EditFormSettings Visible="False" />
                                                                                <CellStyle CssClass="gridcellleft">
                                                                                </CellStyle>
                                                                                <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                                                </EditFormCaptionStyle>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn FieldName="City1" VisibleIndex="6" Caption="City">
                                                                                <EditFormSettings Visible="False" />
                                                                                <CellStyle CssClass="gridcellleft">
                                                                                </CellStyle>
                                                                                <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                                                </EditFormCaptionStyle>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn VisibleIndex="7" FieldName="add_pin" Width="10%" Caption="PinCode">
                                                                                <EditCellStyle Wrap="False" HorizontalAlign="Left">
                                                                                </EditCellStyle>
                                                                                <CellStyle Wrap="False">
                                                                                </CellStyle>
                                                                                <PropertiesTextEdit Width="300px">
                                                                                    <ValidationSettings SetFocusOnError="True" ErrorTextPosition="Bottom" ErrorDisplayMode="ImageWithText">
                                                                                        <RequiredField IsRequired="True" ErrorText="Please Enter Pin Code"></RequiredField>
                                                                                        <RegularExpression ErrorText="Please Enter Number" ValidationExpression="[0-9]{6}" />
                                                                                    </ValidationSettings>
                                                                                </PropertiesTextEdit>
                                                                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top">
                                                                                </EditFormCaptionStyle>
                                                                                <EditFormSettings Caption="Pin/Zip" Visible="True"></EditFormSettings>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn VisibleIndex="8" FieldName="add_landMark" Caption="Land Mark"
                                                                                Width="10%">
                                                                                <EditCellStyle Wrap="False" HorizontalAlign="Left">
                                                                                </EditCellStyle>
                                                                                <CellStyle Wrap="False">
                                                                                </CellStyle>
                                                                                <PropertiesTextEdit Height="10px" Width="300px">
                                                                                </PropertiesTextEdit>
                                                                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right">
                                                                                </EditFormCaptionStyle>
                                                                                <EditFormSettings Caption="LandMark/Direction" Visible="True"></EditFormSettings>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="6" FieldName="add_activityId">
                                                                                <EditFormSettings Visible="False"></EditFormSettings>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="6" FieldName="CreateDate">
                                                                                <EditFormSettings Visible="False"></EditFormSettings>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="6" FieldName="CreateUser">
                                                                                <EditFormSettings Visible="False"></EditFormSettings>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="7" FieldName="LastModifyDate">
                                                                                <EditFormSettings Visible="False"></EditFormSettings>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="7" FieldName="LastModifyUser">
                                                                                <EditFormSettings Visible="False"></EditFormSettings>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewCommandColumn VisibleIndex="9">
                                                                                <DeleteButton Visible="True">
                                                                                </DeleteButton>
                                                                                <EditButton Visible="True">
                                                                                </EditButton>
                                                                                <HeaderTemplate>
                                                                                    <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                                                                                      { %>
                                                                                      <a href="javascript:void(0);" onclick="Address.AddNewRow();"><span style="color: #000099;
                                                                                        text-decoration: underline">Add New</span> </a>
                                                                                        <%} %>
                                                                                 
                                                                                </HeaderTemplate>
                                                                            </dxwgv:GridViewCommandColumn>
                                                                        </Columns>
                                                                    </dxwgv:ASPxGridView>
                                                                   </dxw:ContentControl>
                                                                </ContentCollection>
                                                            </dxtc:TabPage>
                                                            <dxtc:TabPage Text="Phone">
                                                                <ContentCollection>
                                                                    <dxw:ContentControl runat="server">

                                                                <dxwgv:ASPxGridView ID="PhoneFaxGrid" ClientInstanceName="phonefax" runat="server"
                                                                        AutoGenerateColumns="False" DataSourceID="ExchangePhone" KeyFieldName="phf_id"
                                                                        Width="100%" OnBeforePerformDataSelect="AddressGrid_BeforePerformDataSelect"
                                                                        OnHtmlEditFormCreated="PhoneFaxGrid_HtmlEditFormCreated" OnHtmlRowCreated="PhoneFaxGrid_HtmlRowCreated" OnRowValidating="PhoneGrid_RowValidating">
                                                                        <Templates>
                                                                            <EditForm>
                                                                                <table style="width: 100%">
                                                                                    <tr>
                                                                                        <td style="width: 30%">
                                                                                        </td>
                                                                                        <td style="width: 40%">
                                                                                            <controls>
                                    <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormEditors" ID="PhoneForm"></dxwgv:ASPxGridViewTemplateReplacement>
                                </controls>
                                                                                            <div style="text-align: right; padding: 2px 2px 2px 2px">
                                                                                             <%--   <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                                                                                    runat="server">
                                                                                                </dxwgv:ASPxGridViewTemplateReplacement>--%>
                                                                                                 <a id="update" href="#"onclick="OnPhoneClick()" >Update</a>
                                                                                                <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                                                                                    runat="server">
                                                                                                </dxwgv:ASPxGridViewTemplateReplacement>
                                                                                            </div>
                                                                                        </td>
                                                                                        <td style="width: 30%">
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </EditForm>
                                                                            <TitlePanel>
                                                                                <table style="width: 100%">
                                                                                    <tr>
                                                                                        <td align="right">
                                                                                            <table width="100%">
                                                                                                <tr>
                                                                                                    <td align="center" style="width: 50%">
                                                                                                        <span class="Ecoheadtxt" style="color: White">Add/Modify Phone.</span>
                                                                                                    </td>
                                                                                                    <%--    <td style="text-align: right">
                                                                                                        <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                                           { %>
                                                                                                        <dxe:ASPxButton ID="ASPxButton1" runat="server" Text="ADD" ToolTip="Add New Data"
                                                                                                            Height="18px" Width="88px" AutoPostBack="False">
                                                                                                            <ClientSideEvents Click="function(s, e) {phonefax.AddNewRow();}" />
                                                                                                        </dxe:ASPxButton>
                                                                                                        <%} %>
                                                                                                    </td>--%>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </TitlePanel>
                                                                        </Templates>
                                                                        <SettingsEditing EditFormColumnCount="1" PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True"
                                                                            PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="600px" Mode="PopupEditForm">
                                                                        </SettingsEditing>
                                                                        <SettingsText PopupEditFormCaption="Add/Modify Phone Fax"></SettingsText>
                                                                        <Styles>
                                                                            <LoadingPanel ImageSpacing="10px">
                                                                            </LoadingPanel>
                                                                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                            </Header>
                                                                        </Styles>
                                                                        <Settings ShowStatusBar="Visible" ShowTitlePanel="True"></Settings>
                                                                        <SettingsBehavior ConfirmDelete="True" ColumnResizeMode="NextColumn"></SettingsBehavior>
                                                                        <SettingsPager PageSize="20" NumericButtonCount="20">
                                                                        </SettingsPager>
                                                                        <Columns>
                                                                            <dxwgv:GridViewDataTextColumn Visible="False" ReadOnly="True" VisibleIndex="0" FieldName="phf_id">
                                                                                <EditFormSettings Visible="False"></EditFormSettings>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="0" FieldName="phf_cntId">
                                                                                <EditFormSettings Visible="False"></EditFormSettings>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="0" FieldName="phf_entity">
                                                                                <EditFormSettings Visible="False"></EditFormSettings>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataComboBoxColumn FieldName="phf_type" Caption="Type" VisibleIndex="0">
                                                                                <PropertiesComboBox ValueType="System.String" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                                                    Width="300px">
                                                                                          <ClientSideEvents SelectedIndexChanged="function(s, e) {
	var value = s.GetValue();
    if(value == &quot;Mobile&quot;)
    {
         phonefax.GetEditor(&quot;phf_countryCode&quot;).SetVisible(false);
         phonefax.GetEditor(&quot;phf_areaCode&quot;).SetVisible(false);
         phonefax.GetEditor(&quot;phf_extension&quot;).SetVisible(false);
    }
    else
    {
         phonefax.GetEditor(&quot;phf_countryCode&quot;).SetVisible(true);
         phonefax.GetEditor(&quot;phf_areaCode&quot;).SetVisible(true);
         phonefax.GetEditor(&quot;phf_extension&quot;).SetVisible(true);
    }
}" Init="function(s, e) {
	var value = s.GetValue();
    if(value == &quot;Mobile&quot;)
    {
         phonefax.GetEditor(&quot;phf_countryCode&quot;).SetVisible(false);
         phonefax.GetEditor(&quot;phf_areaCode&quot;).SetVisible(false);
         phonefax.GetEditor(&quot;phf_extension&quot;).SetVisible(false);
    }
    else
    {
                  phonefax.GetEditor(&quot;phf_countryCode&quot;).SetVisible(true);
         phonefax.GetEditor(&quot;phf_areaCode&quot;).SetVisible(true);
         phonefax.GetEditor(&quot;phf_extension&quot;).SetVisible(true);
    }
}"></ClientSideEvents>
                                                                                    
                                                                                    <Items>
                                                                                        <dxe:ListEditItem Text="N/A" Value="N/A">
                                                                                        </dxe:ListEditItem>
                                                                                        <dxe:ListEditItem Text="Residence" Value="Residence">
                                                                                        </dxe:ListEditItem>
                                                                                        <dxe:ListEditItem Text="Work" Value="Work">
                                                                                        </dxe:ListEditItem>
                                                                                        <dxe:ListEditItem Text="Mobile" Value="Mobile">
                                                                                        </dxe:ListEditItem>
                                                                                        <dxe:ListEditItem Text="Fax" Value="Fax">
                                                                                        </dxe:ListEditItem>
                                                                                    </Items>
                                                                                    <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                <RequiredField ErrorText="Select Phone Type" IsRequired="True" />
                                                            </ValidationSettings>
                                                                                </PropertiesComboBox>
                                                                                <EditFormSettings Visible="True" Caption="Phone Type"></EditFormSettings>
                                                                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                                                                </EditCellStyle>
                                                                                <CellStyle Wrap="False">
                                                                                </CellStyle>
                                                                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right">
                                                                                </EditFormCaptionStyle>
                                                                            </dxwgv:GridViewDataComboBoxColumn>
                                                                                                     <dxwgv:GridViewDataTextColumn FieldName="phf_countryCode" VisibleIndex="1" Visible="False">
                                                        <EditFormSettings Caption="Country Code" Visible="True" />
                                                        <PropertiesTextEdit>
                                                            <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                <RegularExpression ErrorText="Enter Valid CountryCode" ValidationExpression="[0-9]+" />
                                                            </ValidationSettings>
                                                        </PropertiesTextEdit>
                                                        <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="phf_areaCode" VisibleIndex="1" Visible="False">
                                                        <EditFormSettings Caption="Area Code" Visible="True" />
                                                        <PropertiesTextEdit>
                                                            <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                <RegularExpression ErrorText="Enter Valid AreaCode" ValidationExpression="[0-9]+" />
                                                            </ValidationSettings>
                                                        </PropertiesTextEdit>
                                                        <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="phf_phoneNumber" Width="20%"
                                                                                Caption="Number">
                                                                                <EditCellStyle Wrap="False" HorizontalAlign="Left">
                                                                                </EditCellStyle>
                                                                                <CellStyle Wrap="False">
                                                                                </CellStyle>
                                                                                <PropertiesTextEdit Width="300px">
                                                                                    <ValidationSettings SetFocusOnError="True" ErrorTextPosition="Bottom" ErrorDisplayMode="ImageWithText">
                                                                                        <RequiredField IsRequired="True" ErrorText="Please Enter Phone Number"></RequiredField>
                                                                                        <RegularExpression ErrorText="Please Enter Number" ValidationExpression="[0-9]+" />
                                                                                    </ValidationSettings>
                                                                                </PropertiesTextEdit>
                                                                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top">
                                                                                </EditFormCaptionStyle>
                                                                                <EditFormSettings Caption="Number" Visible="True"></EditFormSettings>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="2" FieldName="phf_faxNumber">
                                                                                <EditFormSettings Visible="False"></EditFormSettings>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="phf_extension" Width="20%"
                                                                                Caption="Extn">
                                                                                <EditCellStyle Wrap="False" HorizontalAlign="Left">
                                                                                </EditCellStyle>
                                                                                <CellStyle Wrap="False">
                                                                                </CellStyle>
                                                                                <PropertiesTextEdit Width="300px">
                                                                                    <ValidationSettings SetFocusOnError="True" ErrorTextPosition="Bottom" ErrorDisplayMode="ImageWithText">
                                                                                   <RegularExpression ErrorText="Please Enter Number" ValidationExpression="[0-9]+" />
                                                                                    </ValidationSettings>
                                                                                </PropertiesTextEdit>
                                                                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top">
                                                                                </EditFormCaptionStyle>
                                                                                <EditFormSettings Caption="Extension" Visible="True"></EditFormSettings>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="3" FieldName="phf_Availablefrom">
                                                                                <EditFormSettings Visible="False"></EditFormSettings>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="3" FieldName="phf_AvailableTo">
                                                                                <EditFormSettings Visible="False"></EditFormSettings>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="3" FieldName="phf_SMSFacility">
                                                                                <EditFormSettings Visible="False"></EditFormSettings>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="3" FieldName="phf_IsDefault">
                                                                                <EditFormSettings Visible="False"></EditFormSettings>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="3" FieldName="CreateDate">
                                                                                <EditFormSettings Visible="False"></EditFormSettings>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="3" FieldName="CreateUser">
                                                                                <EditFormSettings Visible="False"></EditFormSettings>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="3" FieldName="LastModifyDate">
                                                                                <EditFormSettings Visible="False"></EditFormSettings>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="3" FieldName="LastModifyUser">
                                                                                <EditFormSettings Visible="False"></EditFormSettings>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewCommandColumn VisibleIndex="3">
                                                                                <DeleteButton Visible="True">
                                                                                </DeleteButton>
                                                                                <EditButton Visible="True">
                                                                                </EditButton>
                                                                                <HeaderTemplate>
                                                                                     <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                                                                                       { %>
                                                                                    <a href="javascript:void(0);" onclick="phonefax.AddNewRow();"><span style="color: #000099;
                                                                                        text-decoration: underline">Add New</span> </a>
                                                                                        <%} %>
                                                                                </HeaderTemplate>
                                                                            </dxwgv:GridViewCommandColumn>
                                                                        </Columns>
                                                                    </dxwgv:ASPxGridView>
                                                                         </dxw:ContentControl>
                                                                </ContentCollection>
                                                            </dxtc:TabPage> 
                                                              <dxtc:TabPage Text="Email">
                                                                <ContentCollection>
                                                                    <dxw:ContentControl runat="server">
                                                                <dxwgv:ASPxGridView ID="EmailGrid" ClientInstanceName="Email_" runat="server" AutoGenerateColumns="False"
                                                                        DataSourceID="ExchangeEmail" KeyFieldName="eml_id" Width="100%" OnBeforePerformDataSelect="AddressGrid_BeforePerformDataSelect"
                                                                        OnHtmlEditFormCreated="EmailGrid_HtmlEditFormCreated" OnHtmlRowCreated="EmailGrid_HtmlRowCreated">
                                                                        <Templates>
                                                                            <EditForm>
                                                                                <table style="width: 100%">
                                                                                    <tr>
                                                                                        <td style="width: 30%">
                                                                                        </td>
                                                                                        <td style="width: 40%">
                                                                                            <controls>
                                    <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormEditors" ID="EmailForm"></dxwgv:ASPxGridViewTemplateReplacement>
                                </controls>
                                                                                            <div style="text-align: right; padding: 2px 2px 2px 2px">
                                                                                               <%-- <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                                                                                    runat="server">
                                                                                                </dxwgv:ASPxGridViewTemplateReplacement>--%>
                                                                                                
                                                                                                 <a id="update1" href="#"onclick="OnEmailClick()" >Update</a>
                                                                                                <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                                                                                    runat="server">
                                                                                                </dxwgv:ASPxGridViewTemplateReplacement>
                                                                                            </div>
                                                                                        </td>
                                                                                        <td style="width: 30%">
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </EditForm>
                                                                            <TitlePanel>
                                                                                <table style="width: 100%">
                                                                                    <tr>
                                                                                        <td align="right">
                                                                                            <table width="100%">
                                                                                                <tr>
                                                                                                    <td align="center" style="width: 50%">
                                                                                                        <span class="Ecoheadtxt" style="color: White">Add/Modify Email.</span>
                                                                                                    </td>
                                                                                                    <%--   <td style="text-align: right">
                                                                                                        <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                                           { %>
                                                                                                        <dxe:ASPxButton ID="ASPxButton1" runat="server" Text="ADD" ToolTip="Add New Data"
                                                                                                            Height="18px" Width="88px" AutoPostBack="False">
                                                                                                            <ClientSideEvents Click="function(s, e) {Email_.AddNewRow();}" />
                                                                                                        </dxe:ASPxButton>
                                                                                                        <%} %>
                                                                                                    </td>--%>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </TitlePanel>
                                                                        </Templates>
                                                                        <SettingsEditing EditFormColumnCount="1" Mode="PopupEditForm" PopupEditFormHorizontalAlign="Center"
                                                                            PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="600px" />
                                                                        <SettingsText PopupEditFormCaption="Add/Modify Email" />
                                                                        <Styles>
                                                                            <LoadingPanel ImageSpacing="10px">
                                                                            </LoadingPanel>
                                                                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                            </Header>
                                                                        </Styles>
                                                                        <Settings ShowStatusBar="Visible" ShowTitlePanel="True" />
                                                                        <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
                                                                        <SettingsPager NumericButtonCount="20" PageSize="20">
                                                                        </SettingsPager>
                                                                        <Columns>
                                                                            <dxwgv:GridViewDataTextColumn Visible="False" ReadOnly="True" VisibleIndex="0" FieldName="eml_id">
                                                                                <EditFormSettings Visible="False"></EditFormSettings>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="0" FieldName="eml_internalId">
                                                                                <EditFormSettings Visible="False"></EditFormSettings>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="0" FieldName="eml_entity">
                                                                                <EditFormSettings Visible="False"></EditFormSettings>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="0" FieldName="eml_cntId">
                                                                                <EditFormSettings Visible="False"></EditFormSettings>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataComboBoxColumn FieldName="eml_type" Caption="Type" VisibleIndex="0"
                                                                                Visible="False">
                                                                                <PropertiesComboBox ValueType="System.String" Width="300px">
                                                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) {
	var value = s.GetValue();
    if(value == &quot;Web Site&quot;)
    {
         Email_.GetEditor(&quot;eml_email&quot;).SetVisible(false);
         Email_.GetEditor(&quot;eml_ccEmail&quot;).SetVisible(false);
         Email_.GetEditor(&quot;eml_website&quot;).SetVisible(true);
    }
    else
    {
         Email_.GetEditor(&quot;eml_email&quot;).SetVisible(true);
         Email_.GetEditor(&quot;eml_ccEmail&quot;).SetVisible(true);
         Email_.GetEditor(&quot;eml_website&quot;).SetVisible(false);
    }
}" Init="function(s, e) {
	var value = s.GetValue();
    if(value == &quot;Web Site&quot;)
    {
         Email_.GetEditor(&quot;eml_email&quot;).SetVisible(false);
         Email_.GetEditor(&quot;eml_ccEmail&quot;).SetVisible(false);
         Email_.GetEditor(&quot;eml_website&quot;).SetVisible(true);
    }
    else
    {
         Email_.GetEditor(&quot;eml_email&quot;).SetVisible(true);
         Email_.GetEditor(&quot;eml_ccEmail&quot;).SetVisible(true);
         Email_.GetEditor(&quot;eml_website&quot;).SetVisible(false);
    }
}"></ClientSideEvents>
                                                                                    <Items>
                                                                                        <dxe:ListEditItem Text="N/A" Value="N/A">
                                                                                        </dxe:ListEditItem>
                                                                                        <dxe:ListEditItem Text="Personal" Value="Personal">
                                                                                        </dxe:ListEditItem>
                                                                                        <dxe:ListEditItem Text="Official" Value="Official">
                                                                                        </dxe:ListEditItem>
                                                                                        <dxe:ListEditItem Text="Web Site" Value="Web Site">
                                                                                        </dxe:ListEditItem>
                                                                                    </Items>
                                                                                    <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                <RequiredField ErrorText="Select Type" IsRequired="True" />
                                                            </ValidationSettings>
                                                                                </PropertiesComboBox>
                                                                                <EditFormSettings Visible="True" Caption="Email Type"></EditFormSettings>
                                                                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                                                                </EditCellStyle>
                                                                                <CellStyle Wrap="False">
                                                                                </CellStyle>
                                                                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top">
                                                                                </EditFormCaptionStyle>
                                                                            </dxwgv:GridViewDataComboBoxColumn>
                                                                            <dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="eml_email" Width="40%"
                                                                                Caption="Email">
                                                                                <PropertiesTextEdit Width="300px">
                                                                                    <ValidationSettings SetFocusOnError="True" ErrorTextPosition="Bottom" ErrorDisplayMode="ImageWithText">
                                                                                      <RegularExpression ErrorText="Please Enter Currect Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                                                                        </RegularExpression>
                                                                                    </ValidationSettings>
                                                                                </PropertiesTextEdit>
                                                                                <EditFormSettings Caption="Email ID" Visible="True"></EditFormSettings>
                                                                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                                                                </EditCellStyle>
                                                                                <CellStyle Wrap="False">
                                                                                </CellStyle>
                                                                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top">
                                                                                </EditFormCaptionStyle>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn Visible="True" VisibleIndex="2" FieldName="eml_ccEmail">
                                                                                <PropertiesTextEdit Width="300px">
                                                                                    <ValidationSettings SetFocusOnError="True" ErrorTextPosition="Bottom" ErrorDisplayMode="ImageWithText">
                                                                                        <RegularExpression ErrorText="Please Enter Currect CC EmailId" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                                                                        </RegularExpression>
                                                                                    </ValidationSettings>
                                                                                </PropertiesTextEdit>
                                                                                <EditFormSettings Caption="CC Email" Visible="True"></EditFormSettings>
                                                                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                                                                </EditCellStyle>
                                                                                <CellStyle Wrap="False">
                                                                                </CellStyle>
                                                                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top">
                                                                                </EditFormCaptionStyle>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn Visible="True" VisibleIndex="2" FieldName="eml_website">
                                                                                <EditFormSettings Visible="True" Caption="WebURL"></EditFormSettings>
                                                                                <PropertiesTextEdit Width="300px">
                                                                                </PropertiesTextEdit>
                                                                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                                                                </EditFormCaptionStyle>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="2" FieldName="CreateDate">
                                                                                <EditFormSettings Visible="False"></EditFormSettings>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="2" FieldName="CreateUser">
                                                                                <EditFormSettings Visible="False"></EditFormSettings>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="2" FieldName="LastModifyDate">
                                                                                <EditFormSettings Visible="False"></EditFormSettings>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="2" FieldName="LastModifyUser">
                                                                                <EditFormSettings Visible="False"></EditFormSettings>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewCommandColumn VisibleIndex="2">
                                                                                <DeleteButton Visible="True">
                                                                                </DeleteButton>
                                                                                <EditButton Visible="True">
                                                                                </EditButton>
                                                                                <HeaderTemplate>
                                                                                 <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                                                                                   { %>
                                                                                    <a href="javascript:void(0);" onclick="Email_.AddNewRow();"><span style="color: #000099;
                                                                                        text-decoration: underline">Add New</span> </a>
                                                                                             <%} %>
                                                                                </HeaderTemplate>
                                                                            </dxwgv:GridViewCommandColumn>
                                                                        </Columns>
                                                                    </dxwgv:ASPxGridView>
                                               </dxw:ContentControl>
                                                            </ContentCollection>
                                                        </dxtc:TabPage>
                                                        
                                                    </tabpages>
                                                                    </dxtc:ASPxPageControl>
                                                                </dxw:ContentControl>
                                                            </ContentCollection>
                                                        </dxtc:TabPage>
                                                        
                                                        <dxtc:TabPage Name="Documents" Text="Documents">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                                    </TabPages>
                                                    <ClientSideEvents ActiveTabChanged="function(s, e) {
	                                            var activeTab   = page.GetActiveTab();
	                                            
	                                            var Tab2 = page.GetTab(2);
	                                           
	                                           
	                                            
	                                            if(activeTab == Tab2)
	                                            {
	                                                disp_prompt('tab2');
	                                            }
	                                           
	                                            
	                                            }"></ClientSideEvents>
                                                </dxtc:ASPxPageControl>
                                               
                                               
                                               
                                               
                                               
                                               
                                            </td>
                                            <td style="width: 10%">
                                            </td>
                                        </tr>
                                    </table>
                                    &nbsp;
                                </div>
                            </EditForm>
                        </Templates>
                    </dxwgv:ASPxGridView>
                </td>
            </tr>
        </table>
        <%--============================================================= Master Grid ============================================================--%>
        <%--============================================================= End Of Master Grid ===================================================--%>
        <%-- =============================================================== Data Source Of Master Grid ============================================--%>
        <asp:SqlDataSource ID="ExchangeDatasource" runat="server" ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>"
            InsertCommand="ExchangeInsert" InsertCommandType="StoredProcedure" SelectCommand="ExchangeSelect"
            SelectCommandType="StoredProcedure" DeleteCommand="ExchangeDelete" DeleteCommandType="StoredProcedure"
            UpdateCommand="ExchangeUpdate" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="exh_cntId" Type="string" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="exh_cntId" Type="String" />
                <asp:Parameter Name="exh_name" Type="String" />
                <asp:Parameter Name="exh_shortName" Type="String" />
                <asp:SessionParameter Name="CreateUser" Type="Decimal" SessionField="userid" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="exh_name" Type="String" />
                <asp:Parameter Name="exh_shortName" Type="String" />
                <asp:SessionParameter Name="CreateUser" Type="Decimal" SessionField="userid" />
            </InsertParameters>
        </asp:SqlDataSource>
        <%--========================================================= End of Master Grid Datasource=================================================--%>
        <%--========================================================== Address Data Source ========================================--%>
        <asp:SqlDataSource runat="server" ID="ExchangeAddress" SelectCommand="select DISTINCT  tbl_master_address.add_id AS add_id,tbl_master_address.add_entity As add_entity,tbl_master_address.add_cntId As add_cntId, tbl_master_address.add_addressType AS add_addressType,
                        tbl_master_address.add_address1 AS add_address1,  tbl_master_address.add_address2 AS add_address2, 
                        tbl_master_address.add_address3 AS add_address3,tbl_master_address.add_landMark AS add_landMark, 
                        tbl_master_address.add_country AS Country, 
                        tbl_master_address.add_state AS State,tbl_master_address.add_pin AS add_pin, 
                        CASE isnull(add_country, '')WHEN '' THEN '0' ELSE(SELECT cou_country FROM tbl_master_country WHERE cou_id = add_country) END AS Country1, 
                        CASE isnull(add_state, '') WHEN '' THEN '0' ELSE(SELECT state FROM tbl_master_state WHERE id = add_state) END AS State1,
                        CASE isnull(add_city, '') WHEN '' THEN '0' ELSE(SELECT city_name FROM tbl_master_city WHERE city_id = add_city) END AS City1, 
                        tbl_master_address.add_city AS City, tbl_master_address.add_pin AS PinCode, tbl_master_address.add_landMark AS LankMark,tbl_master_address.add_activityId AS add_activityId,tbl_master_address.CreateDate AS CreateDate,tbl_master_address.CreateUser AS CreateUser,tbl_master_address.LastModifyDate AS LastModifyDate,tbl_master_address.LastModifyUser AS LastModifyUser 
                        from tbl_master_address where add_cntId=@exh_cntId" OldValuesParameterFormatString="original_{0}"
            ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [tbl_master_address] WHERE [add_id] = @original_add_id"
            InsertCommand="INSERT INTO [tbl_master_address] ([add_cntId],[add_entity],[add_addressType], [add_address1], [add_address2], [add_address3], [add_landMark], [add_country], [add_state], [add_city], [add_pin],[CreateDate],[CreateUser]) VALUES ( @exh_cntId,'EXC',@add_addressType, @add_address1, @add_address2, @add_address3, @add_landMark, @Country, @State, @City, @add_pin,getdate(),@CreateUserAddress)"
            ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>" UpdateCommand="UPDATE [tbl_master_address] SET  [add_addressType] = @add_addressType, [add_address1] = @add_address1, [add_address2] = @add_address2, [add_address3] = @add_address3, [add_landMark] = @add_landMark, [add_country] = @Country, [add_state] = @State, [add_city] = @City, [add_pin] = @add_pin,[LastModifyDate]=getdate(),[LastModifyUser]=@CreateUserAddress  WHERE [add_id] = @original_add_id">
            <InsertParameters>
                <asp:SessionParameter SessionField="KeyVal_InternalID" Type="String" Name="exh_cntId">
                </asp:SessionParameter>
                <asp:SessionParameter Name="CreateUserAddress" Type="Decimal" SessionField="userid" />
                <asp:Parameter Name="add_entity" Type="String" />
                <asp:Parameter Type="String" Name="add_addressType"></asp:Parameter>
                <asp:Parameter Type="String" Name="add_address1"></asp:Parameter>
                <asp:Parameter Type="String" Name="add_address2"></asp:Parameter>
                <asp:Parameter Type="String" Name="add_address3"></asp:Parameter>
                <asp:Parameter Type="String" Name="add_landMark"></asp:Parameter>
                <asp:Parameter Name="Country" Type="int32" />
                <asp:Parameter Name="State" Type="int32" />
                <asp:Parameter Name="City" Type="string" />
                <asp:Parameter Type="String" Name="add_pin"></asp:Parameter>
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter SessionField="KeyVal_InternalID" Type="String" Name="exh_cntId">
                </asp:SessionParameter>
            </SelectParameters>
            <UpdateParameters>
                <asp:SessionParameter Name="CreateUserAddress" Type="Decimal" SessionField="userid" />
                <asp:Parameter Type="String" Name="add_addressType"></asp:Parameter>
                <asp:Parameter Type="String" Name="add_address1"></asp:Parameter>
                <asp:Parameter Type="String" Name="add_address2"></asp:Parameter>
                <asp:Parameter Type="String" Name="add_address3"></asp:Parameter>
                <asp:Parameter Type="String" Name="add_landMark"></asp:Parameter>
                <asp:Parameter Name="Country" Type="int32" />
                <asp:Parameter Name="State" Type="int32" />
                <asp:Parameter Name="City" Type="string" />
                <asp:Parameter Type="String" Name="add_pin"></asp:Parameter>
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Type="Decimal" Name="original_add_id"></asp:Parameter>
            </DeleteParameters>
        </asp:SqlDataSource>
        <%--============================================================== End of Address DataSource ====================================--%>
        <%--============================================================ Phone Fax DataSource ===========================================--%>
        <asp:SqlDataSource ID="ExchangePhone" runat="server" ConflictDetection="CompareAllValues"
            ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>" DeleteCommand="DELETE FROM [tbl_master_phonefax] WHERE [phf_id] = @original_phf_id"
            InsertCommand="INSERT INTO [tbl_master_phonefax] ([phf_cntId],[phf_entity],[phf_type], [phf_countryCode], [phf_areaCode], [phf_phoneNumber], [phf_extension],[CreateDate],[CreateUser]) VALUES (@exh_cntId,'EXC',@phf_type, @phf_countryCode, @phf_areaCode, @phf_phoneNumber, @phf_extension,getdate(),@CreateUserPhone)"
            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [tbl_master_phonefax] where [phf_cntId]=@exh_cntId"
            UpdateCommand="UPDATE [tbl_master_phonefax] SET  [phf_type] = @phf_type, [phf_countryCode] = @phf_countryCode, [phf_areaCode] = @phf_areaCode, [phf_phoneNumber] = @phf_phoneNumber, [phf_extension] = @phf_extension, [LastModifyDate]=getdate(),[LastModifyUser]=@CreateUserPhone WHERE [phf_id] = @original_phf_id">
            <DeleteParameters>
                <asp:Parameter Name="original_phf_id" Type="Decimal" />
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter SessionField="KeyVal_InternalID" Type="String" Name="exh_cntId">
                </asp:SessionParameter>
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="phf_type" Type="String" />
                <asp:Parameter Name="phf_countryCode" Type="String" />
                <asp:Parameter Name="phf_areaCode" Type="String" />
                <asp:Parameter Name="phf_phoneNumber" Type="String" />
                <asp:Parameter Name="phf_extension" Type="String" />
                <asp:SessionParameter Name="CreateUserPhone" Type="Decimal" SessionField="userid" />
            </UpdateParameters>
            <InsertParameters>
                <asp:SessionParameter SessionField="KeyVal_InternalID" Type="String" Name="exh_cntId">
                </asp:SessionParameter>
                <asp:SessionParameter Name="CreateUserPhone" Type="Decimal" SessionField="userid" />
                <asp:Parameter Name="phf_entity" Type="String" />
                <asp:Parameter Name="phf_type" Type="String" />
                <asp:Parameter Name="phf_countryCode" Type="String" />
                <asp:Parameter Name="phf_areaCode" Type="String" />
                <asp:Parameter Name="phf_phoneNumber" Type="String" />
                <asp:Parameter Name="phf_extension" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <%--================================================================ End of Phone Fax Data Source ========================================--%>
        <%--=================================================================== Email Data Source =============================================--%>
        <asp:SqlDataSource ID="ExchangeEmail" runat="server" ConflictDetection="CompareAllValues"
            ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>" DeleteCommand="DELETE FROM [tbl_master_email] WHERE [eml_id] = @original_eml_id"
            InsertCommand="INSERT INTO [tbl_master_email] ([eml_cntId],[eml_entity],[eml_type], [eml_email], [eml_website],[CreateDate],[CreateUser]) VALUES (@exh_cntId,'EXC',@eml_type, @eml_email, @eml_website,getdate(),@CreateUserEmail)"
            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [tbl_master_email] where [eml_cntId]=@exh_cntId "
            UpdateCommand="UPDATE [tbl_master_email] SET [eml_type] = @eml_type, [eml_email] = @eml_email, [eml_website] = @eml_website, [LastModifyDate]=getdate(),[LastModifyUser]=@CreateUserEmail WHERE [eml_id] = @original_eml_id">
            <DeleteParameters>
                <asp:Parameter Name="original_eml_id" Type="Decimal" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="eml_type" Type="String" />
                <asp:Parameter Name="eml_email" Type="String" />
                <asp:Parameter Name="eml_website" Type="String" />
                <asp:SessionParameter Name="CreateUserEmail" Type="Decimal" SessionField="userid" />
            </UpdateParameters>
            <SelectParameters>
                <asp:SessionParameter SessionField="KeyVal_InternalID" Type="String" Name="exh_cntId">
                </asp:SessionParameter>
            </SelectParameters>
            <InsertParameters>
                <asp:SessionParameter SessionField="KeyVal_InternalID" Type="String" Name="exh_cntId">
                </asp:SessionParameter>
                <asp:SessionParameter Name="CreateUserEmail" Type="Decimal" SessionField="userid" />
                <asp:Parameter Name="eml_internalId" Type="String" />
                <asp:Parameter Name="eml_entity" Type="String" />
                <asp:Parameter Name="eml_cntId" Type="String" />
                <asp:Parameter Name="eml_type" Type="String" />
                <asp:Parameter Name="eml_email" Type="String" />
                <asp:Parameter Name="eml_website" Type="String" />
                <asp:Parameter Name="CreateDate" Type="String" />
                <asp:Parameter Name="CreateUser" Type="Decimal" />
                <asp:Parameter Name="LastModifyDate" Type="String" />
                <asp:Parameter Name="LastModifyUser" Type="Decimal" />
            </InsertParameters>
        </asp:SqlDataSource>
        <%--================================================================  End Of Email Data source  ======================================--%>
        <%--=================================== Country datasource ===================================================--%>
        <asp:SqlDataSource ID="CountrySelect" runat="server" ConnectionString="<%$ ConnectionStrings:CRMConnectionString%>"
            SelectCommand="SELECT cou_id, cou_country as Country FROM tbl_master_country order by cou_country">
        </asp:SqlDataSource>
        <%--=================================== State datasource ===================================================--%>
        <asp:SqlDataSource ID="StateSelect" runat="server" ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>"
            SelectCommand="SELECT s.id as ID,s.state as State from tbl_master_state s,tbl_master_country cr where (s.countryId = cr.cou_id) and (cr.cou_id = @State) ORDER BY s.state">
            <SelectParameters>
                <asp:Parameter Name="State" Type="string" />
            </SelectParameters>
        </asp:SqlDataSource>
        <%--=================================== City Datasource ===================================================--%>
        <asp:SqlDataSource ID="SelectCity" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="SELECT c.city_id AS CityId, c.city_name AS City FROM tbl_master_city c where c.state_id=@City order by c.city_name">
            <SelectParameters>
                <asp:Parameter Name="City" Type="string" />
            </SelectParameters>
        </asp:SqlDataSource>
        <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
        </dxwgv:ASPxGridViewExporter>
    </form>
</body>
</html>
