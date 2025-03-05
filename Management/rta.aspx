<%@ page language="C#" autoeventwireup="true" inherits="management_rta, App_Web_n3rnr3dz" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
<%--=========================================== FOR SHOWING TAB ============================================================--%>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%--========================================================================================================================--%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript">
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
        <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">RTA</span></strong></td>
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
                                <td class="gridcellright" align="right">
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
                        <dxwgv:ASPxGridView ID="rtaGrid" ClientInstanceName="grid" runat="server" AutoGenerateColumns="False"
                            DataSourceID="rtaSource" KeyFieldName="rta_rtaCode" Width="100%" OnHtmlRowCreated="rtaGrid_HtmlRowCreated"
                            OnHtmlEditFormCreated="rtaGrid_HtmlEditFormCreated" OnCustomCallback="rtaGrid_CustomCallback">
                            <Templates><EditForm>
                                    <div style="padding: 4px 4px 3px 4px">
                                        <table style="width: 100%">
                                            <tr>
                                                <td style="width: 10%">
                                                </td>
                                                <td style="width: 80%">
                                                    <dxtc:ASPxPageControl runat="server" ID="pageControl" Width="100%" ActiveTabIndex="0">
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
                                                                            <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                                                                runat="server" ColumnID="">
                                                                            </dxwgv:ASPxGridViewTemplateReplacement>
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
                                                                            DataSourceID="rtaAddress" KeyFieldName="add_id" AutoGenerateColumns="False" OnBeforePerformDataSelect="ASPxGridView1_BeforePerformDataSelect"
                                                                            Width="100%" OnCellEditorInitialize="AddressGrid_CellEditorInitialize">
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
                                                                                                        <td align="center" style="width: 50%">
                                                                                                            <span class="Ecoheadtxt" style="color: White">Add/Modify Address.</span>
                                                                                                        </td>
                                                                                                       <%--<td style="text-align: right">
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
                                                                        <dxwgv:ASPxGridView ID="PhoneGrid" ClientInstanceName="phonefax" runat="server"
                                                                            AutoGenerateColumns="False" DataSourceID="rtaPhone" KeyFieldName="phf_id" Width="100%"
                                                                            OnBeforePerformDataSelect="ASPxGridView1_BeforePerformDataSelect" 
OnRowValidating="PhoneGrid_RowValidating">
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
                                                                                                    <%--<dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
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
                                                                                                       <%-- <td style="text-align: right">
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
         phonefax.GetEditor(&quot;phf_extension&quot;).SetVisible(false);
    }
    else
    {
         phonefax.GetEditor(&quot;phf_countryCode&quot;).SetVisible(true);
         phonefax.GetEditor(&quot;phf_areaCode&quot;).SetVisible(true);
         phonefax.GetEditor(&quot;phf_extension&quot;).SetVisible(true);
         phonefax.GetEditor(&quot;phf_extension&quot;).SetVisible(true);
    }
}" />
                                                            <ClientSideEvents Init="function(s, e) {
	var value = s.GetValue();
    if(value == &quot;Mobile&quot;)
    {
         phonefax.GetEditor(&quot;phf_countryCode&quot;).SetVisible(false);
         phonefax.GetEditor(&quot;phf_areaCode&quot;).SetVisible(false);
         phonefax.GetEditor(&quot;phf_extension&quot;).SetVisible(false);
         phonefax.GetEditor(&quot;phf_extension&quot;).SetVisible(false);
    }
    else
    {
         phonefax.GetEditor(&quot;phf_countryCode&quot;).SetVisible(true);
         phonefax.GetEditor(&quot;phf_areaCode&quot;).SetVisible(true);
         phonefax.GetEditor(&quot;phf_extension&quot;).SetVisible(true);
         phonefax.GetEditor(&quot;phf_extension&quot;).SetVisible(true);
    }
}" />
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
                                                                <RequiredField IsRequired="True" ErrorText="Select Phone Type"></RequiredField>
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
                                                                                            <RequiredField ErrorText=""></RequiredField>
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
                                                                            DataSourceID="rtaEmail" KeyFieldName="eml_id" Width="100%" OnBeforePerformDataSelect="ASPxGridView1_BeforePerformDataSelect" OnRowValidating="EmailGrid_RowValidating">
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
                                                                                <dxwgv:GridViewDataComboBoxColumn FieldName="eml_type" Caption="Type" VisibleIndex="0">
                                                                                    <PropertiesComboBox ValueType="System.String" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                                                        Width="300px">
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
                                                                <RequiredField IsRequired="True" ErrorText="Select Type"></RequiredField>
                                                            </ValidationSettings>
                                                                                    </PropertiesComboBox>
                                                                                    <EditFormSettings Visible="True" Caption="Email Type"></EditFormSettings>
                                                                                    <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                                                                    </EditCellStyle>
                                                                                    <CellStyle Wrap="False">
                                                                                    </CellStyle>
                                                                                    <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right">
                                                                                    </EditFormCaptionStyle>
                                                                                </dxwgv:GridViewDataComboBoxColumn>
                                                                               <dxwgv:GridViewDataTextColumn FieldName="eml_email" Width="40%" Caption="Email" VisibleIndex="1">
<PropertiesTextEdit Width="300px">
<ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
<RegularExpression ErrorText="Please Enter Currect Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></RegularExpression>
</ValidationSettings>
</PropertiesTextEdit>

<EditFormSettings Visible="True" Caption="Email ID"></EditFormSettings>

<EditCellStyle HorizontalAlign="Left" Wrap="False"></EditCellStyle>

<EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False"></EditFormCaptionStyle>

<CellStyle Wrap="False"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="eml_ccEmail" Visible="False" VisibleIndex="2">
<PropertiesTextEdit Width="300px">
<ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
<RegularExpression ErrorText="Please Enter Currect CC EmailId" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></RegularExpression>

</ValidationSettings>
</PropertiesTextEdit>

<EditFormSettings Visible="True" Caption="CC Email"></EditFormSettings>

<EditCellStyle HorizontalAlign="Left" Wrap="False"></EditCellStyle>

<EditFormCaptionStyle HorizontalAlign="Right" Wrap="False"></EditFormCaptionStyle>

<CellStyle Wrap="False"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="eml_website" Visible="False" VisibleIndex="2">
<PropertiesTextEdit Width="300px"></PropertiesTextEdit>

<EditFormSettings Visible="True" Caption="WebURL"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False"></EditFormCaptionStyle>
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
                                                        </TabPages>
                                                        <ContentStyle>
                                                            <Border BorderColor="#002D96" BorderStyle="Solid" BorderWidth="1px" />
                                                        </ContentStyle>
                                                        <LoadingPanelStyle ImageSpacing="6px">
                                                        </LoadingPanelStyle>
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
                            <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" allowfocusedrow="True" />
                            <Styles>
<Header CssClass="gridheader" SortingImageSpacing="5px" ImageSpacing="5px"></Header>

<Cell CssClass="gridcellleft"></Cell>

<FocusedRow CssClass="gridselectrow"></FocusedRow>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>

<FocusedGroupRow CssClass="gridselectrow"></FocusedGroupRow>
</Styles>
                            <SettingsPager NumericButtonCount="20" PageSize="20" AlwaysShowPager="True" ShowSeparators="True">
<FirstPageButton Visible="True"></FirstPageButton>

<LastPageButton Visible="True"></LastPageButton>
</SettingsPager>
                            <Columns>
<dxwgv:GridViewDataTextColumn Visible="False" ReadOnly="True" VisibleIndex="0" FieldName="rta_id">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="0" FieldName="rta_rtaCode">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="0" FieldName="rta_name" Width="40%" Caption="RTA Name">
<EditCellStyle Wrap="False" HorizontalAlign="Left"></EditCellStyle>

<CellStyle Wrap="False"></CellStyle>

<PropertiesTextEdit Width="300px">
<ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
<RequiredField IsRequired="True" ErrorText="Please Enter RTA Name"></RequiredField>
</ValidationSettings>
</PropertiesTextEdit>

<EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top"></EditFormCaptionStyle>

<EditFormSettings Visible="True"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="rta_SebiRegnNumber" Width="40%" Caption="SebiRegnNo">
<EditCellStyle Wrap="False" HorizontalAlign="Left"></EditCellStyle>

<CellStyle Wrap="False"></CellStyle>

<PropertiesTextEdit Width="300px">
<ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
<RequiredField IsRequired="True" ErrorText="Please Enter SebiRegnNo"></RequiredField>
</ValidationSettings>
</PropertiesTextEdit>

<EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top"></EditFormCaptionStyle>

<EditFormSettings Visible="True"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataDateColumn Visible="False" VisibleIndex="4" FieldName="rta_RegistrationDate">
<EditCellStyle Wrap="False" HorizontalAlign="Left"></EditCellStyle>

<PropertiesDateEdit DisplayFormatString="" Width="300px"></PropertiesDateEdit>

<CellStyle Wrap="False"></CellStyle>

<EditFormCaptionStyle Wrap="False" HorizontalAlign="Right"></EditFormCaptionStyle>

<EditFormSettings Visible="True"></EditFormSettings>
</dxwgv:GridViewDataDateColumn>
<dxwgv:GridViewDataDateColumn Visible="False" VisibleIndex="5" FieldName="rta_RegistrationExpiryDate">
<EditCellStyle Wrap="False" HorizontalAlign="Left"></EditCellStyle>

<PropertiesDateEdit DisplayFormatString="" Width="300px"></PropertiesDateEdit>

<CellStyle Wrap="False"></CellStyle>

<EditFormCaptionStyle Wrap="False" HorizontalAlign="Right"></EditFormCaptionStyle>

<EditFormSettings Visible="True"></EditFormSettings>
</dxwgv:GridViewDataDateColumn>
<dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="2" FieldName="rta_ContactPersonName">
<EditCellStyle Wrap="False" HorizontalAlign="Left"></EditCellStyle>

<CellStyle Wrap="False"></CellStyle>

<PropertiesTextEdit Width="300px"></PropertiesTextEdit>

<EditFormCaptionStyle Wrap="False" HorizontalAlign="Right"></EditFormCaptionStyle>

<EditFormSettings Visible="True"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewCommandColumn VisibleIndex="2">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<DeleteButton Visible="True"></DeleteButton>
<HeaderTemplate>
                                        <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                                          { %>
                                        <a href="javascript:void(0);" onclick="grid.AddNewRow()"><span style="color: #000099;
                                            text-decoration: underline">Add New</span> </a>
                                        <%} %>
                                    
</HeaderTemplate>

<EditButton Visible="True"></EditButton>
</dxwgv:GridViewCommandColumn>
</Columns>
                            <SettingsEditing EditFormColumnCount="1" Mode="PopupEditForm" PopupEditFormHorizontalAlign="Center"
                                PopupEditFormModal="True" PopupEditFormVerticalAlign="BottomSides" PopupEditFormWidth="920px" />
                            <SettingsText PopupEditFormCaption="Add/Modify RTA" />
                            <StylesPager>
<Summary Width="100%"></Summary>
</StylesPager>
                            <Settings ShowStatusBar="Visible" ShowGroupPanel="True" />
                        </dxwgv:ASPxGridView>
                    </td>
                </tr>
            </table>
            <%--===================================================== Master Grid =====================================================--%>
            <%--==================================================== Master Grid Datasource ==================================================--%>
            <asp:SqlDataSource ID="rtaSource" runat="server" ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>"
                InsertCommand="InsertRTA" SelectCommand="RtaSelect" InsertCommandType="StoredProcedure"
                SelectCommandType="StoredProcedure" DeleteCommand="DeleteRTA" DeleteCommandType="StoredProcedure"
                UpdateCommand="UpdateRTA" UpdateCommandType="StoredProcedure">
                <DeleteParameters>
                    <asp:Parameter Name="rta_rtaCode" Type="String" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="rta_name" Type="String" />
                    <asp:Parameter Name="rta_SebiRegnNumber" Type="String" />
                    <asp:Parameter Name="rta_ContactPersonName" Type="String" />
                    <asp:Parameter Name="rta_RegistrationDate" Type="String" />
                    <asp:Parameter Name="rta_RegistrationExpiryDate" Type="String" />
                    <asp:SessionParameter Name="CreateUser" Type="Decimal" SessionField="userid" />
                    <asp:Parameter Name="rta_rtaCode" Type="String" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="rta_name" Type="String" />
                    <asp:Parameter Name="rta_SebiRegnNumber" Type="String" />
                    <asp:Parameter Name="rta_ContactPersonName" Type="String" />
                    <asp:Parameter Name="rta_RegistrationDate" Type="String" />
                    <asp:Parameter Name="rta_RegistrationExpiryDate" Type="String" />
                    <asp:SessionParameter Name="CreateUser" Type="Decimal" SessionField="userid" />
                </InsertParameters>
            </asp:SqlDataSource>
            <%--==================================================== End Of Master Grid Datasource ====================================--%>
            <%--========================================================== Address Data Source ========================================--%>
            <asp:SqlDataSource runat="server" ID="rtaAddress" SelectCommand="select DISTINCT  tbl_master_address.add_id AS add_id,tbl_master_address.add_entity As add_entity,tbl_master_address.add_cntId As add_cntId, tbl_master_address.add_addressType AS add_addressType,
                        tbl_master_address.add_address1 AS add_address1,  tbl_master_address.add_address2 AS add_address2, 
                        tbl_master_address.add_address3 AS add_address3,tbl_master_address.add_landMark AS add_landMark, 
                        tbl_master_address.add_country AS Country, 
                        tbl_master_address.add_state AS State,tbl_master_address.add_pin AS add_pin, 
                        CASE isnull(add_country, '')WHEN '' THEN '0' ELSE(SELECT cou_country FROM tbl_master_country WHERE cou_id = add_country) END AS Country1, 
                        CASE isnull(add_state, '') WHEN '' THEN '0' ELSE(SELECT state FROM tbl_master_state WHERE id = add_state) END AS State1,
                        CASE isnull(add_city, '') WHEN '' THEN '0' ELSE(SELECT city_name FROM tbl_master_city WHERE city_id = add_city) END AS City1, 
                        tbl_master_address.add_city AS City, tbl_master_address.add_pin AS PinCode, tbl_master_address.add_landMark AS LankMark,tbl_master_address.add_activityId AS add_activityId 
                        from tbl_master_address where add_cntId=@rta_rtaCode" OldValuesParameterFormatString="original_{0}"
                ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [tbl_master_address] WHERE [add_id] = @original_add_id"
                InsertCommand="INSERT INTO [tbl_master_address] ([add_cntId],[add_entity],[add_addressType], [add_address1], [add_address2], [add_address3], [add_landMark], [add_country], [add_state], [add_city], [add_pin],[CreateDate],[CreateUser]) VALUES ( @rta_rtaCode,'RTA',@add_addressType, @add_address1, @add_address2, @add_address3, @add_landMark, @Country, @State, @City, @add_pin,getdate(),@CreateUserAddress)"
                ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>" UpdateCommand="UPDATE [tbl_master_address] SET  [add_addressType] = @add_addressType, [add_address1] = @add_address1, [add_address2] = @add_address2, [add_address3] = @add_address3, [add_landMark] = @add_landMark, [add_country] = @Country, [add_state] = @State, [add_city] = @City, [add_pin] = @add_pin,[LastModifyDate]=getdate(),[LastModifyUser]=@CreateUserAddress  WHERE [add_id] = @original_add_id">
                <InsertParameters>
                    <asp:SessionParameter SessionField="KeyVal_InternalID" Type="String" Name="rta_rtaCode">
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
                    <asp:SessionParameter SessionField="KeyVal_InternalID" Type="String" Name="rta_rtaCode">
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
            <asp:SqlDataSource ID="rtaPhone" runat="server" ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>" DeleteCommand="DELETE FROM [tbl_master_phonefax] WHERE [phf_id] = @original_phf_id"
                InsertCommand="INSERT INTO [tbl_master_phonefax] ([phf_cntId],[phf_entity],[phf_type], [phf_countryCode], [phf_areaCode], [phf_phoneNumber], [phf_extension],[CreateDate],[CreateUser]) VALUES (@rta_rtaCode,'RTA',@phf_type, @phf_countryCode, @phf_areaCode, @phf_phoneNumber, @phf_extension,getdate(),@CreateUserPhone)"
                OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [tbl_master_phonefax] where [phf_cntId]=@rta_rtaCode"
                UpdateCommand="UPDATE [tbl_master_phonefax] SET  [phf_type] = @phf_type, [phf_countryCode] = @phf_countryCode, [phf_areaCode] = @phf_areaCode, [phf_phoneNumber] = @phf_phoneNumber, [phf_extension] = @phf_extension, [LastModifyDate]=getdate(),[LastModifyUser]=@CreateUserPhone WHERE [phf_id] = @original_phf_id">
                <DeleteParameters>
                    <asp:Parameter Name="original_phf_id" Type="Decimal" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:SessionParameter SessionField="KeyVal_InternalID" Type="String" Name="rta_rtaCode">
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
                    <asp:SessionParameter SessionField="KeyVal_InternalID" Type="String" Name="rta_rtaCode">
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
            <asp:SqlDataSource ID="rtaEmail" runat="server" ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>" DeleteCommand="DELETE FROM [tbl_master_email] WHERE [eml_id] = @original_eml_id"
                InsertCommand="INSERT INTO [tbl_master_email] ([eml_cntId],[eml_entity],[eml_type], [eml_email], [eml_ccEmail],[CreateDate],[CreateUser]) VALUES (@rta_rtaCode,'RTA',@eml_type, @eml_email, @eml_ccEmail,getdate(),@CreateUserEmail)"
                OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [tbl_master_email] where [eml_cntId]=@rta_rtaCode "
                UpdateCommand="UPDATE [tbl_master_email] SET [eml_type] = @eml_type, [eml_email] = @eml_email, [eml_ccEmail] = @eml_ccEmail, [LastModifyDate]=getdate(),[LastModifyUser]=@CreateUserEmail WHERE [eml_id] = @original_eml_id">
                <DeleteParameters>
                    <asp:Parameter Name="original_eml_id" Type="Decimal" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="eml_entity" Type="String" />
                    <asp:Parameter Name="eml_type" Type="String" />
                    <asp:Parameter Name="eml_email" Type="String" />
                    <asp:Parameter Name="eml_ccEmail" Type="String" />
                    <asp:SessionParameter Name="CreateUserEmail" Type="Decimal" SessionField="userid" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:SessionParameter SessionField="KeyVal_InternalID" Type="String" Name="rta_rtaCode">
                    </asp:SessionParameter>
                </SelectParameters>
                <InsertParameters>
                    <asp:SessionParameter SessionField="KeyVal_InternalID" Type="String" Name="rta_rtaCode">
                    </asp:SessionParameter>
                    <asp:SessionParameter Name="CreateUserEmail" Type="Decimal" SessionField="userid" />
                    <asp:Parameter Name="eml_internalId" Type="String" />
                    <asp:Parameter Name="eml_entity" Type="String" />
                    <asp:Parameter Name="eml_cntId" Type="String" />
                    <asp:Parameter Name="eml_type" Type="String" />
                    <asp:Parameter Name="eml_email" Type="String" />
                    <asp:Parameter Name="eml_ccEmail" Type="String" />
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
        </div>
    </form>
</body>
</html>
