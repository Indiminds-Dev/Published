<%@ page language="C#" autoeventwireup="true" inherits="management_insurance, App_Web_n2fxndvz" %>

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
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript">
 
     function Show() {
        var url = "frmAddDocuments.aspx?id=insurance.aspx&id1=Insurance Companies";
        popup.SetContentUrl(url);

        popup.Show();

    }
    function Getvalue()
    {
        gridDocument.PerformCallback();
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
 function SignOff()
 {
   window.parent.SignOff()
 }
    function height()
    {
        if(document.body.scrollHeight>=700)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '700px';
        window.frameElement.Width = document.body.scrollWidth;
    }

    function EndCall(obj)
    {
        height();
    }
    function OnContactInfoClick(keyValue,CompName)
    {
        var url='insurance_contactPerson.aspx?id='+keyValue +'&comp='+CompName;
        parent.OnMoreInfoClick(url,"Company Name : "+CompName+"",'940px','450px',"Y");
    }  
    function OnBrokingInfoClick(keyValue,CompName)
    {
        var url='insurance_brokingCode.aspx?id='+keyValue +'&comp='+CompName;
        parent.OnMoreInfoClick(url,"Company Name : "+CompName+"",'940px','450px',"Y");
    } 
    
    function test123()
    {
//      height();
        grid.AddNewRow();
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
        if(gridEmail.GetEditor('eml_type').GetValue()=='Web Site')
        {
            if(gridEmail.GetEditor('eml_website').GetValue()==null)
                alert('Url Required');
            else
              gridEmail.UpdateEdit();     
        }
        else
        {
            if(gridEmail.GetEditor('eml_email').GetValue()==null)
                alert('Email Required');
            else
                gridEmail.UpdateEdit();                
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
                        <strong><span style="color: #000099">Insurance</span></strong></td>
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
                        <dxwgv:ASPxGridView ID="InsuranceCompanyGrid" ClientInstanceName="grid" runat="server"
                            AutoGenerateColumns="False" DataSourceID="InsurancedataSource" KeyFieldName="insu_internalId"
                            Width="100%" OnHtmlRowCreated="InsuranceCompanyGrid_HtmlRowCreated" OnHtmlEditFormCreated="InsuranceCompanyGrid_HtmlEditFormCreated"
                            OnCustomCallback="InsuranceCompanyGrid_CustomCallback" OnCustomJSProperties="InsuranceCompanyGrid_CustomJSProperties">
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Visible="False" ReadOnly="True" VisibleIndex="0" FieldName="insu_id">
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="0" FieldName="insu_internalId">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="0" FieldName="insu_nameOfCompany" Width="50%"
                                    Caption="Insurance Company">
                                    <PropertiesTextEdit Width="300px">
                                        <ValidationSettings ErrorTextPosition="Bottom" ErrorDisplayMode="ImageWithText">
                                            <RequiredField IsRequired="True" ErrorText="Please Enter Insurance Name"></RequiredField>
                                        </ValidationSettings>
                                    </PropertiesTextEdit>
                                    <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Caption="Name:" Visible="True"></EditFormSettings>
                                    <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                        <Paddings PaddingTop="15px" />
                                    </EditCellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataComboBoxColumn FieldName="insu_InsuranceCompType" Caption="Type"
                                    VisibleIndex="1" Width="30%">
                                    <PropertiesComboBox ValueType="System.String" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                        Width="300px">
                                        <Items>
                                            <dxe:ListEditItem Text="Life Insurers" Value="Life Insurers">
                                            </dxe:ListEditItem>
                                            <dxe:ListEditItem Text="Non-Life Insurers" Value="Non-Life Insurers">
                                            </dxe:ListEditItem>
                                            <dxe:ListEditItem Text="Re-Insurers" Value="Re-Insurers">
                                            </dxe:ListEditItem>
                                        </Items>
                                    </PropertiesComboBox>
                                    <EditFormSettings Visible="True" Caption="Company Type:"></EditFormSettings>
                                    <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                    </EditCellStyle>
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                    <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right">
                                    </EditFormCaptionStyle>
                                </dxwgv:GridViewDataComboBoxColumn>
                                <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="1" FieldName="insu_nameOfPrincipalOfficer">
                                    <PropertiesTextEdit Width="300px">
                                    </PropertiesTextEdit>
                                    <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Caption="Name(s) Of Principal Officers:" Visible="True"></EditFormSettings>
                                    <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                    </EditCellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="1" FieldName="insu_nameOfAppointedActuary">
                                    <PropertiesTextEdit Width="300px">
                                    </PropertiesTextEdit>
                                    <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Caption="Name Of Appoinment Actuary:" Visible="True"></EditFormSettings>
                                    <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                    </EditCellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="1" FieldName="CreateDate">
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="1" FieldName="CreateUser">
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="1" FieldName="LastModifyDate">
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="1" FieldName="LastModifyUser">
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewCommandColumn VisibleIndex="2">
                                    <DeleteButton Visible="True">
                                    </DeleteButton>
                                    <EditButton Visible="True">
                                    </EditButton>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <HeaderTemplate>
                                        <a href="javascript:void(0);" onclick="test123();"><span style="color: #000099; text-decoration: underline">
                                            Add New</span> </a>
                                    </HeaderTemplate>
                                </dxwgv:GridViewCommandColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Cont.Person" VisibleIndex="3">
                                    <DataItemTemplate>
                                        <a href="javascript:void(0);" onclick="OnContactInfoClick('<%# Container.KeyValue %>','<%#Eval("insu_nameOfCompany") %>')">
                                            Show</a>
                                    </DataItemTemplate>
                                    <CellStyle HorizontalAlign="Left" Wrap="False">
                                    </CellStyle>
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Broking Code" VisibleIndex="4">
                                    <DataItemTemplate>
                                        <a href="javascript:void(0);" onclick="OnBrokingInfoClick('<%# Container.KeyValue %>','<%#Eval("insu_nameOfCompany") %>')">
                                            Show</a>
                                    </DataItemTemplate>
                                    <CellStyle HorizontalAlign="Left" Wrap="False">
                                    </CellStyle>
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
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
                            <SettingsText PopupEditFormCaption="Add/Modify Insurance Company"></SettingsText>
                            <SettingsPager PageSize="20" NumericButtonCount="20" ShowSeparators="True">
                                <FirstPageButton Visible="True">
                                </FirstPageButton>
                                <LastPageButton Visible="True">
                                </LastPageButton>
                            </SettingsPager>
                            <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True"></SettingsBehavior>
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
                                                                            <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton1" ReplacementType="EditFormUpdateButton"
                                                                                runat="server" ColumnID="">
                                                                            </dxwgv:ASPxGridViewTemplateReplacement>
                                                                            <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton1" ReplacementType="EditFormCancelButton"
                                                                                runat="server" ColumnID="">
                                                                            </dxwgv:ASPxGridViewTemplateReplacement>
                                                                        </div>
                                                                    </dxw:ContentControl>
                                                                </ContentCollection>
                                                            </dxtc:TabPage>
                                                            <dxtc:TabPage Text="Correspondence">
                                                                <ContentCollection>
                                                                    <dxw:ContentControl runat="server">
                                                                        <dxtc:ASPxPageControl runat="server" ID="pageControl1" Width="100%" ActiveTabIndex="0">
                                                                            <tabpages>
<dxtc:TabPage Text="Adress">
<ContentCollection>
<dxw:ContentControl runat="server"><dxwgv:ASPxGridView runat="server" ClientInstanceName="Address" KeyFieldName="add_id" AutoGenerateColumns="False" DataSourceID="InsuranceAddress" Width="100%" ID="AddressGrid" __designer:wfdid="w21" OnBeforePerformDataSelect="AddressGrid_BeforePerformDataSelect" OnCellEditorInitialize="AddressGrid_CellEditorInitialize"><Columns>
<dxwgv:GridViewDataTextColumn FieldName="add_id" ReadOnly="True" Visible="False" VisibleIndex="0">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="add_cntId" Visible="False" VisibleIndex="0">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="add_entity" Visible="False" VisibleIndex="0">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataComboBoxColumn FieldName="add_addressType" Width="10%" Caption="Type" VisibleIndex="0">
<PropertiesComboBox EnableIncrementalFiltering="True" EnableSynchronization="False" ValueType="System.String" Width="300px"><Items>
<dxe:ListEditItem Text="N/A" Value="N/A"></dxe:ListEditItem>
<dxe:ListEditItem Text="Residence" Value="Residence"></dxe:ListEditItem>
<dxe:ListEditItem Text="Office" Value="Office"></dxe:ListEditItem>
<dxe:ListEditItem Text="Emergence" Value="Emergence"></dxe:ListEditItem>
<dxe:ListEditItem Text="Correspondance" Value="Correspondance"></dxe:ListEditItem>
<dxe:ListEditItem Text="Permanent" Value="Permanent"></dxe:ListEditItem>
<dxe:ListEditItem Text="Contact Person" Value="Contact Person"></dxe:ListEditItem>
</Items>
</PropertiesComboBox>

<EditFormSettings Visible="True" Caption="Address Type"></EditFormSettings>

<EditCellStyle HorizontalAlign="Left" Wrap="False"></EditCellStyle>

<EditFormCaptionStyle HorizontalAlign="Right" Wrap="False"></EditFormCaptionStyle>

<CellStyle Wrap="False"></CellStyle>
</dxwgv:GridViewDataComboBoxColumn>
<dxwgv:GridViewDataMemoColumn FieldName="add_address1" Width="10%" Caption="Address1" VisibleIndex="1">
<PropertiesMemoEdit Width="300px">
<ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
<RequiredField IsRequired="True" ErrorText="Please Enter Address"></RequiredField>
</ValidationSettings>
</PropertiesMemoEdit>

<EditFormSettings Visible="True"></EditFormSettings>

<EditCellStyle HorizontalAlign="Left" Wrap="False"></EditCellStyle>

<EditFormCaptionStyle HorizontalAlign="Right" Wrap="False"></EditFormCaptionStyle>

<CellStyle Wrap="False"></CellStyle>
</dxwgv:GridViewDataMemoColumn>
<dxwgv:GridViewDataMemoColumn FieldName="add_address2" Width="10%" Caption="Address2" VisibleIndex="2">
<PropertiesMemoEdit Width="300px"></PropertiesMemoEdit>

<EditFormSettings Visible="True"></EditFormSettings>

<EditCellStyle HorizontalAlign="Left" Wrap="False"></EditCellStyle>

<EditFormCaptionStyle HorizontalAlign="Right" Wrap="False"></EditFormCaptionStyle>

<CellStyle Wrap="False"></CellStyle>
</dxwgv:GridViewDataMemoColumn>
<dxwgv:GridViewDataMemoColumn FieldName="add_address3" Width="10%" Caption="Address3" VisibleIndex="3">
<PropertiesMemoEdit Width="300px"></PropertiesMemoEdit>

<EditFormSettings Visible="True"></EditFormSettings>

<EditCellStyle HorizontalAlign="Left" Wrap="False"></EditCellStyle>

<EditFormCaptionStyle HorizontalAlign="Right" Wrap="False"></EditFormCaptionStyle>

<CellStyle Wrap="False"></CellStyle>
</dxwgv:GridViewDataMemoColumn>
<dxwgv:GridViewDataComboBoxColumn FieldName="Country" Caption="Country" Visible="False" VisibleIndex="4">
<PropertiesComboBox EnableIncrementalFiltering="True" EnableSynchronization="False" DataSourceID="CountrySelect" TextField="Country" ValueField="cou_id" ValueType="System.String" Width="300px">
<ClientSideEvents SelectedIndexChanged="function(s, e) { OnCountryChanged(s); }"></ClientSideEvents>
</PropertiesComboBox>

<EditFormSettings Visible="True"></EditFormSettings>

<EditCellStyle HorizontalAlign="Left" Wrap="False"></EditCellStyle>

<EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False"></EditFormCaptionStyle>

<CellStyle Wrap="False" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataComboBoxColumn>
<dxwgv:GridViewDataComboBoxColumn FieldName="State" Caption="State" Visible="False" VisibleIndex="5">
<PropertiesComboBox EnableIncrementalFiltering="True" EnableSynchronization="False" DataSourceID="StateSelect" TextField="State" ValueField="ID" ValueType="System.String" Width="300px">
<ClientSideEvents SelectedIndexChanged="function(s, e) { OnStateChanged(s); }"></ClientSideEvents>
</PropertiesComboBox>

<EditFormSettings Visible="True"></EditFormSettings>

<EditCellStyle HorizontalAlign="Left" Wrap="False"></EditCellStyle>

<EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False"></EditFormCaptionStyle>

<CellStyle Wrap="False" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataComboBoxColumn>
<dxwgv:GridViewDataComboBoxColumn FieldName="City" Caption="City" Visible="False" VisibleIndex="6">
<PropertiesComboBox EnableIncrementalFiltering="True" EnableSynchronization="False" DataSourceID="SelectCity" TextField="City" ValueField="CityId" ValueType="System.String">
<ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
<RequiredField IsRequired="True" ErrorText="City Can Not Be Blank"></RequiredField>
</ValidationSettings>
</PropertiesComboBox>

<EditFormSettings Visible="True"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataComboBoxColumn>
<dxwgv:GridViewDataTextColumn FieldName="Country1" Caption="Country" VisibleIndex="4">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="State1" Caption="State" VisibleIndex="5">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="City1" Caption="City" VisibleIndex="6">
<EditFormSettings Visible="False"></EditFormSettings>

<EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False"></EditFormCaptionStyle>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="add_pin" Width="10%" Caption="PinCode" VisibleIndex="7">
<PropertiesTextEdit Width="300px">
<ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
<RegularExpression ErrorText="Please Enter number" ValidationExpression="[0-9]{6}"></RegularExpression>

<RequiredField IsRequired="True" ErrorText="Please Enter Pin Code"></RequiredField>
</ValidationSettings>
</PropertiesTextEdit>

<EditFormSettings Visible="True" Caption="Pin/Zip"></EditFormSettings>

<EditCellStyle HorizontalAlign="Left" Wrap="False"></EditCellStyle>

<EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False"></EditFormCaptionStyle>

<CellStyle Wrap="False"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="add_landMark" Width="10%" Caption="Land Mark" VisibleIndex="8">
<PropertiesTextEdit Width="300px" Height="10px"></PropertiesTextEdit>

<EditFormSettings Visible="True" Caption="LandMark/Direction"></EditFormSettings>

<EditCellStyle HorizontalAlign="Left" Wrap="False"></EditCellStyle>

<EditFormCaptionStyle HorizontalAlign="Right" Wrap="False"></EditFormCaptionStyle>

<CellStyle Wrap="False"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="add_activityId" Visible="False" VisibleIndex="6">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="CreateDate" Visible="False" VisibleIndex="6">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="CreateUser" Visible="False" VisibleIndex="6">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="LastModifyDate" Visible="False" VisibleIndex="7">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="LastModifyUser" Visible="False" VisibleIndex="7">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewCommandColumn VisibleIndex="9">
<EditButton Visible="True"></EditButton>

<DeleteButton Visible="True"></DeleteButton>
<HeaderTemplate>
                                                                                        <a href="javascript:void(0);" onclick="Address.AddNewRow();"><span style="color: #000099;
                                                                                            text-decoration: underline">Add New</span> </a>
                                                                                    
</HeaderTemplate>
</dxwgv:GridViewCommandColumn>
</Columns>

<SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True"></SettingsBehavior>

<SettingsPager PageSize="20" NumericButtonCount="20"></SettingsPager>

<SettingsEditing Mode="PopupEditForm" PopupEditFormWidth="600px" PopupEditFormHorizontalAlign="Center"  PopupEditFormVerticalAlign="BottomSides" PopupEditFormModal="True" EditFormColumnCount="1"></SettingsEditing>

<Settings ShowTitlePanel="True" ShowStatusBar="Visible"></Settings>

<SettingsText PopupEditFormCaption="Add/Modify Address"></SettingsText>

<Styles>
<Header SortingImageSpacing="5px" ImageSpacing="5px"></Header>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>
</Styles>

<Templates>
<TitlePanel>
                                                                                    <table style="width: 100%">
                                                                                        <tr>
                                                                                            <td align="right">
                                                                                                <table width="100%">
                                                                                                    <tr>
                                                                                                        <td align="center" style="width: 50%">
                                                                                                            <span class="Ecoheadtxt" style="color: White">Add/Modify Address.</span>
                                                                                                        </td>
                                                                                                        
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                
</TitlePanel>
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
</Templates>
</dxwgv:ASPxGridView>

 </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Text="Phone"><ContentCollection>
<dxw:ContentControl runat="server">
                    <dxwgv:ASPxGridView runat="server" ClientInstanceName="phonefax" KeyFieldName="phf_id" AutoGenerateColumns="False" DataSourceID="InsurancePhone" Width="100%" ID="PhoneGrid" __designer:wfdid="w22" OnBeforePerformDataSelect="AddressGrid_BeforePerformDataSelect" 
                    OnRowValidating="PhoneGrid_RowValidating"><Columns>
                    <dxwgv:GridViewDataTextColumn FieldName="phf_id" ReadOnly="True" Visible="False" VisibleIndex="0">
                    <EditFormSettings Visible="False"></EditFormSettings>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="phf_cntId" Visible="False" VisibleIndex="0">
                    <EditFormSettings Visible="False"></EditFormSettings>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="phf_entity" Visible="False" VisibleIndex="0">
                    <EditFormSettings Visible="False"></EditFormSettings>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataComboBoxColumn FieldName="phf_type" Caption="Type" VisibleIndex="0">
                    <PropertiesComboBox EnableIncrementalFiltering="True" EnableSynchronization="False" ValueType="System.String" Width="300px">
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
                    }" Init="function(s, e) {
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
                    }"></ClientSideEvents>
                    <Items>
                    <dxe:ListEditItem Text="N/A" Value="N/A"></dxe:ListEditItem>
                    <dxe:ListEditItem Text="Residence" Value="Residence"></dxe:ListEditItem>
                    <dxe:ListEditItem Text="Work" Value="Work"></dxe:ListEditItem>
                    <dxe:ListEditItem Text="Mobile" Value="Mobile"></dxe:ListEditItem>
                    <dxe:ListEditItem Text="Fax" Value="Fax"></dxe:ListEditItem>
                    </Items>
                    
                                                            <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                <RequiredField IsRequired="True" ErrorText="Select Phone Type"></RequiredField>
                                                            </ValidationSettings>
                    </PropertiesComboBox>

                    <EditFormSettings Visible="True" Caption="Phone Type"></EditFormSettings>

                    <EditCellStyle HorizontalAlign="Left" Wrap="False"></EditCellStyle>

                    <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False"></EditFormCaptionStyle>

                    <CellStyle Wrap="False"></CellStyle>
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
                    <dxwgv:GridViewDataTextColumn FieldName="phf_phoneNumber" Width="20%" Caption="Number" VisibleIndex="1">
                    <PropertiesTextEdit Width="300px">
                    <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                    <RegularExpression ErrorText="Please Enter Number" ValidationExpression="[0-9]+"></RegularExpression>

                    <RequiredField IsRequired="True" ErrorText="Please Enter Phone Number"></RequiredField>
                    </ValidationSettings>
                    </PropertiesTextEdit>

                    <EditFormSettings Visible="True" Caption="Number"></EditFormSettings>

                    <EditCellStyle HorizontalAlign="Left" Wrap="False"></EditCellStyle>

                    <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False"></EditFormCaptionStyle>

                    <CellStyle Wrap="False"></CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="phf_faxNumber" Visible="False" VisibleIndex="2">
                    <EditFormSettings Visible="False"></EditFormSettings>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="phf_extension" Width="20%" Caption="Extn" VisibleIndex="2">
                    <PropertiesTextEdit Width="300px">
                    <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                    <RegularExpression ErrorText="Please Enter Number" ValidationExpression="[0-9]+"></RegularExpression>
                    </ValidationSettings>
                    </PropertiesTextEdit>

                    <EditFormSettings Visible="True" Caption="Extension"></EditFormSettings>

                    <EditCellStyle HorizontalAlign="Left" Wrap="False"></EditCellStyle>

                    <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False"></EditFormCaptionStyle>

                    <CellStyle Wrap="False"></CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="phf_Availablefrom" Visible="False" VisibleIndex="3">
                    <EditFormSettings Visible="False"></EditFormSettings>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="phf_AvailableTo" Visible="False" VisibleIndex="3">
                    <EditFormSettings Visible="False"></EditFormSettings>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="phf_SMSFacility" Visible="False" VisibleIndex="3">
                    <EditFormSettings Visible="False"></EditFormSettings>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="phf_IsDefault" Visible="False" VisibleIndex="3">
                    <EditFormSettings Visible="False"></EditFormSettings>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewCommandColumn VisibleIndex="3">
                    <EditButton Visible="True"></EditButton>

                    <DeleteButton Visible="True"></DeleteButton>
                    <HeaderTemplate>
                                                                                                            <a href="javascript:void(0);" onclick="phonefax.AddNewRow();"><span style="color: #000099;
                                                                                                                text-decoration: underline">Add New</span> </a>
                                                                                                        
                    </HeaderTemplate>
                    </dxwgv:GridViewCommandColumn>
                    </Columns>
                            
                    <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True"></SettingsBehavior>

                    <SettingsPager PageSize="20" NumericButtonCount="20"></SettingsPager>

                    <SettingsEditing Mode="PopupEditForm" PopupEditFormWidth="600px" PopupEditFormHorizontalAlign="Center"  PopupEditFormVerticalAlign="BottomSides" PopupEditFormModal="True" EditFormColumnCount="1"></SettingsEditing>

                    <Settings ShowTitlePanel="True" ShowStatusBar="Visible"></Settings>

                    <SettingsText PopupEditFormCaption="Add/Modify Phone Fax"></SettingsText>

                    <Styles>
                    <Header SortingImageSpacing="5px" ImageSpacing="5px"></Header>

                    <LoadingPanel ImageSpacing="10px"></LoadingPanel>
                    </Styles>

                    <Templates><TitlePanel>
                                                                                    <table style="width: 100%">
                                                                                        <tr>
                                                                                            <td align="right">
                                                                                                <table width="100%">
                                                                                                    <tr>
                                                                                                        <td align="center" style="width: 50%">
                                                                                                            <span class="Ecoheadtxt" style="color: White">Add/Modify Phone.</span>
                                                                                                        </td>
                                                                                                        
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                
</TitlePanel>
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
</Templates>
</dxwgv:ASPxGridView>

 </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Text="Email"><ContentCollection>
<dxw:ContentControl runat="server">
                                                                    <dxwgv:ASPxGridView runat="server" ClientInstanceName="gridEmail" KeyFieldName="eml_id" AutoGenerateColumns="False" DataSourceID="InsuranceEmail" Width="100%" ID="EmailGrid" OnBeforePerformDataSelect="AddressGrid_BeforePerformDataSelect" OnRowValidating="EmailGrid_RowValidating"><Columns>
<dxwgv:GridViewDataTextColumn FieldName="eml_id" ReadOnly="True" Visible="False" VisibleIndex="0">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="eml_internalId" Visible="False" VisibleIndex="0">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="eml_entity" Visible="False" VisibleIndex="0">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="eml_cntId" Visible="False" VisibleIndex="0">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataComboBoxColumn FieldName="eml_type" Caption="Type" VisibleIndex="0">
<PropertiesComboBox EnableIncrementalFiltering="True" EnableSynchronization="False" ValueType="System.String" Width="300px">
<ClientSideEvents SelectedIndexChanged="function(s, e) {
	var value = s.GetValue();
    if(value == &quot;Web Site&quot;)
    {
         gridEmail.GetEditor(&quot;eml_email&quot;).SetVisible(false);
         gridEmail.GetEditor(&quot;eml_ccEmail&quot;).SetVisible(false);
         gridEmail.GetEditor(&quot;eml_website&quot;).SetVisible(true);
    }
    else
    {
  
         gridEmail.GetEditor(&quot;eml_email&quot;).SetVisible(true);
         gridEmail.GetEditor(&quot;eml_ccEmail&quot;).SetVisible(true);
         gridEmail.GetEditor(&quot;eml_website&quot;).SetVisible(false);
    }
}" Init="function(s, e) {
	var value = s.GetValue();
	 if(value == &quot;Web Site&quot;)
    {
         gridEmail.GetEditor(&quot;eml_email&quot;).SetVisible(false);
         gridEmail.GetEditor(&quot;eml_ccEmail&quot;).SetVisible(false);
         gridEmail.GetEditor(&quot;eml_website&quot;).SetVisible(true);
    }
    else
    {
         gridEmail.GetEditor(&quot;eml_email&quot;).SetVisible(true);
         gridEmail.GetEditor(&quot;eml_ccEmail&quot;).SetVisible(true);
         gridEmail.GetEditor(&quot;eml_website&quot;).SetVisible(false);
    }
}"></ClientSideEvents>
<Items>
<dxe:ListEditItem Text="Personal" Value="Personal"></dxe:ListEditItem>
<dxe:ListEditItem Text="Official" Value="Official"></dxe:ListEditItem>
<dxe:ListEditItem Text="Web Site" Value="Web Site"></dxe:ListEditItem>
</Items>
                 <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                <RequiredField IsRequired="True" ErrorText="Select Type"></RequiredField>
                                                            </ValidationSettings>

</PropertiesComboBox>

<EditFormSettings Visible="True" Caption="Email Type"></EditFormSettings>

<EditCellStyle HorizontalAlign="Left" Wrap="False"></EditCellStyle>

<EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False"></EditFormCaptionStyle>

<CellStyle Wrap="False"></CellStyle>
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

<RequiredField ErrorText=""></RequiredField>
</ValidationSettings>
</PropertiesTextEdit>

<EditFormSettings Visible="True" Caption="CC Email"></EditFormSettings>

<EditCellStyle HorizontalAlign="Left" Wrap="False"></EditCellStyle>

<EditFormCaptionStyle HorizontalAlign="Right" Wrap="False"></EditFormCaptionStyle>

<CellStyle Wrap="False"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn FieldName="eml_website" Caption="WebURL" VisibleIndex="1"
                                                        Visible="true">
                                                        <EditFormSettings Caption="WebURL" Visible="True" />
                                                        <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewCommandColumn VisibleIndex="2">
<EditButton Visible="True"></EditButton>

<DeleteButton Visible="True"></DeleteButton>
<HeaderTemplate>
                                                                                        <a href="javascript:void(0);" onclick="gridEmail.AddNewRow();"><span style="color: #000099;
                                                                                            text-decoration: underline">Add New</span> </a>
                                                                                    
</HeaderTemplate>
</dxwgv:GridViewCommandColumn>
</Columns>

<SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True"></SettingsBehavior>

<SettingsPager PageSize="20" NumericButtonCount="20"></SettingsPager>

<SettingsEditing Mode="PopupEditForm" PopupEditFormWidth="600px" PopupEditFormHorizontalAlign="Center"  PopupEditFormVerticalAlign="BottomSides" PopupEditFormModal="True" EditFormColumnCount="1"></SettingsEditing>

<Settings ShowTitlePanel="True" ShowStatusBar="Visible"></Settings>

<SettingsText PopupEditFormCaption="Add/Modify Email"></SettingsText>

<Styles>
<Header SortingImageSpacing="5px" ImageSpacing="5px"></Header>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>
</Styles>

<Templates><TitlePanel>
                                                                                    <table style="width: 100%">
                                                                                        <tr>
                                                                                            <td align="right">
                                                                                                <table width="100%">
                                                                                                    <tr>
                                                                                                        <td align="center" style="width: 50%">
                                                                                                            <span class="Ecoheadtxt" style="color: White">Add/Modify Email.</span>
                                                                                                        </td>
                                         
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                
</TitlePanel>
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
</Templates>
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
                                                                        <dxwgv:ASPxGridView ID="EmployeeDocumentGrid" runat="server" AutoGenerateColumns="False"
                                                                            ClientInstanceName="gridDocument" KeyFieldName="Id" Width="100%" Font-Size="10px"
                                                                            OnRowDeleting="EmployeeDocumentGrid_RowDeleting" OnBeforePerformDataSelect="EmployeeDocumentGrid_BeforePerformDataSelect"
                                                                            OnCustomCallback="EmployeeDocumentGrid_CustomCallback">
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
                                                                                <dxwgv:GridViewDataTextColumn FieldName="Src" VisibleIndex="3" Visible="False">
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
                                                                                        <a href="javascript:void(0);" onclick="Show();"><span style="color: #000099; text-decoration: underline">
                                                                                            Add New</span> </a>
                                                                                    </HeaderTemplate>
                                                                                </dxwgv:GridViewCommandColumn>
                                                                            </Columns>
                                                                            <Settings ShowGroupPanel="True" ShowStatusBar="Visible" />
                                                                            <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="250px" PopupEditFormHorizontalAlign="Center"
                                                                                PopupEditFormModal="True" PopupEditFormVerticalAlign="BottomSides" PopupEditFormWidth="500px"
                                                                                EditFormColumnCount="1" />
                                                                            <Styles>
                                                                                <LoadingPanel ImageSpacing="10px">
                                                                                </LoadingPanel>
                                                                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                                </Header>
                                                                            </Styles>
                                                                            <SettingsText PopupEditFormCaption="Add/Modify Documents" ConfirmDelete="Are You Want To Delete This Record ???" />
                                                                            <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True">
                                                                                <FirstPageButton Visible="True">
                                                                                </FirstPageButton>
                                                                                <LastPageButton Visible="True">
                                                                                </LastPageButton>
                                                                            </SettingsPager>
                                                                            <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
                                                                        </dxwgv:ASPxGridView>
                                                                        <dxpc:ASPxPopupControl ID="ASPXPopupControl" runat="server" ContentUrl="frmAddDocuments.aspx"
                                                                            CloseAction="CloseButton" Top="100" Left="400" ClientInstanceName="popup" Height="500px"
                                                                            Width="430px" HeaderText="Add Document">
                                                                            <ContentCollection>
                                                                                <dxpc:PopupControlContentControl runat="server">
                                                                                </dxpc:PopupControlContentControl>
                                                                            </ContentCollection>
                                                                            <HeaderStyle BackColor="Blue" Font-Bold="True" ForeColor="White" />
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
                                                <td style="width: 10%">
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </EditForm>
                            </Templates>
                            <ClientSideEvents EndCallback="function(s, e) {
	                                EndCall(s.cpEND);
                                }" />
                        </dxwgv:ASPxGridView>
                    </td>
                </tr>
            </table>
            <%--=============================================================== Master Grid ==========================================================--%>
            <%--=========================================================  End Of Master Grid ==================================================--%>
            <%--===============================================================  Datasource Of Master Grid =========================================--%>
            <asp:SqlDataSource ID="InsurancedataSource" runat="server" ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>"
                InsertCommand="InsuranceCompanyInsert" InsertCommandType="StoredProcedure" SelectCommand="InsuranceCompanySelect"
                SelectCommandType="StoredProcedure" DeleteCommand="InsuranceCompanyDelete" DeleteCommandType="StoredProcedure"
                UpdateCommand="InsuranceCompanyUpdate" UpdateCommandType="StoredProcedure">
                <DeleteParameters>
                    <asp:Parameter Name="insu_internalId" Type="string" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="insu_internalId" Type="String" />
                    <asp:SessionParameter Name="CreateUser" Type="Decimal" SessionField="userid" />
                    <asp:Parameter Name="insu_nameOfCompany" Type="String" />
                    <asp:Parameter Name="insu_InsuranceCompType" Type="String" />
                    <asp:Parameter Name="insu_nameOfPrincipalOfficer" Type="String" />
                    <asp:Parameter Name="insu_nameOfAppointedActuary" Type="String" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:SessionParameter Name="CreateUser" Type="Decimal" SessionField="userid" />
                    <asp:Parameter Name="insu_nameOfCompany" Type="String" />
                    <asp:Parameter Name="insu_InsuranceCompType" Type="String" />
                    <asp:Parameter Name="insu_nameOfPrincipalOfficer" Type="String" />
                    <asp:Parameter Name="insu_nameOfAppointedActuary" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
            <%--========================================================= End of Master Grid Datasource=================================================--%>
            <%--========================================================== Address Data Source ========================================--%>
            <asp:SqlDataSource runat="server" ID="InsuranceAddress" SelectCommand="select DISTINCT  tbl_master_address.add_id AS add_id,tbl_master_address.add_entity As add_entity,tbl_master_address.add_cntId As add_cntId, tbl_master_address.add_addressType AS add_addressType,
                        tbl_master_address.add_address1 AS add_address1,  tbl_master_address.add_address2 AS add_address2, 
                        tbl_master_address.add_address3 AS add_address3,tbl_master_address.add_landMark AS add_landMark, 
                        tbl_master_address.add_country AS Country, 
                        tbl_master_address.add_state AS State,tbl_master_address.add_pin AS add_pin, 
                        CASE isnull(add_country, '')WHEN '' THEN '0' ELSE(SELECT cou_country FROM tbl_master_country WHERE cou_id = add_country) END AS Country1, 
                        CASE isnull(add_state, '') WHEN '' THEN '0' ELSE(SELECT state FROM tbl_master_state WHERE id = add_state) END AS State1,
                        CASE isnull(add_city, '') WHEN '' THEN '0' ELSE(SELECT city_name FROM tbl_master_city WHERE city_id = add_city) END AS City1, 
                        tbl_master_address.add_city AS City, tbl_master_address.add_pin AS PinCode, tbl_master_address.add_landMark AS LankMark,tbl_master_address.add_activityId AS add_activityId,tbl_master_address.CreateDate AS CreateDate,tbl_master_address.CreateUser AS CreateUser,tbl_master_address.LastModifyDate AS LastModifyDate,tbl_master_address.LastModifyUser AS LastModifyUser 
                        from tbl_master_address where add_cntId=@insu_internalId" OldValuesParameterFormatString="original_{0}"
                ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [tbl_master_address] WHERE [add_id] = @original_add_id"
                InsertCommand="INSERT INTO [tbl_master_address] ([add_cntId],[add_entity],[add_addressType], [add_address1], [add_address2], [add_address3], [add_landMark], [add_country], [add_state], [add_city], [add_pin],[CreateDate],[CreateUser]) VALUES ( @insu_internalId,'Insurance',@add_addressType, @add_address1, @add_address2, @add_address3, @add_landMark, @Country, @State, @City, @add_pin,getdate(),@CreateUserAddress)"
                ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>" UpdateCommand="UPDATE [tbl_master_address] SET  [add_addressType] = @add_addressType, [add_address1] = @add_address1, [add_address2] = @add_address2, [add_address3] = @add_address3, [add_landMark] = @add_landMark, [add_country] = @Country, [add_state] = @State, [add_city] = @City, [add_pin] = @add_pin,[LastModifyDate]=getdate(),[LastModifyUser]=@CreateUserAddress  WHERE [add_id] = @original_add_id">
                <InsertParameters>
                    <asp:SessionParameter SessionField="KeyVal_InternalID" Type="String" Name="insu_internalId">
                    </asp:SessionParameter>
                    <asp:SessionParameter Name="CreateUserAddress" Type="Decimal" SessionField="userid" />
                    <asp:Parameter Type="String" Name="add_entity" />
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
                    <asp:SessionParameter SessionField="KeyVal_InternalID" Type="String" Name="insu_internalId">
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
            <asp:SqlDataSource ID="InsurancePhone" runat="server" ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>" DeleteCommand="DELETE FROM [tbl_master_phonefax] WHERE [phf_id] = @original_phf_id"
                InsertCommand="INSERT INTO [tbl_master_phonefax] ([phf_cntId],[phf_entity],[phf_type], [phf_countryCode], [phf_areaCode], [phf_phoneNumber], [phf_extension],[CreateDate],[CreateUser]) VALUES (@insu_internalId,'Insurance',@phf_type, @phf_countryCode, @phf_areaCode, @phf_phoneNumber, @phf_extension,getdate(),@CreateUserPhone)"
                OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [tbl_master_phonefax] where [phf_cntId]=@insu_internalId"
                UpdateCommand="UPDATE [tbl_master_phonefax] SET  [phf_type] = @phf_type, [phf_countryCode] = @phf_countryCode, [phf_areaCode] = @phf_areaCode, [phf_phoneNumber] = @phf_phoneNumber, [phf_extension] = @phf_extension, [LastModifyDate]=getdate(),[LastModifyUser]=@CreateUserPhone WHERE [phf_id] = @original_phf_id">
                <DeleteParameters>
                    <asp:Parameter Name="original_phf_id" Type="Decimal" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:SessionParameter SessionField="KeyVal_InternalID" Type="String" Name="insu_internalId">
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
                    <asp:SessionParameter SessionField="KeyVal_InternalID" Type="String" Name="insu_internalId">
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
            <asp:SqlDataSource ID="InsuranceEmail" runat="server" ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>" DeleteCommand="DELETE FROM [tbl_master_email] WHERE [eml_id] = @original_eml_id"
                InsertCommand="INSERT INTO [tbl_master_email] ([eml_cntId],[eml_entity],[eml_type], [eml_email], [eml_website],[CreateDate],[CreateUser]) VALUES (@insu_internalId,'Insurance',@eml_type, @eml_email, @eml_website,getdate(),@CreateUserEmail)"
                OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [tbl_master_email] where [eml_cntId]=@insu_internalId "
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
                    <asp:SessionParameter SessionField="KeyVal_InternalID" Type="String" Name="insu_internalId">
                    </asp:SessionParameter>
                </SelectParameters>
                <InsertParameters>
                    <asp:SessionParameter SessionField="KeyVal_InternalID" Type="String" Name="insu_internalId">
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
        </div>
    </form>
</body>
</html>
