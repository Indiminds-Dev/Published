<%@ page language="C#" autoeventwireup="true" inherits="management_bank, App_Web_0payuukt" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
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
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript">
          function SignOff()
            {
            window.parent.SignOff()
            }
           function height()
            {
                if(document.body.scrollHeight<=500)
                    window.frameElement.height = '500px';
                else
                    window.frameElement.height = document.body.scrollHeight;
                window.frameElement.widht = document.body.scrollWidht;
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
        if(gridPhone.GetEditor('phf_phoneNumber').GetValue()==null)
        {
            alert('Phone Number Required');
        }
        else
        {
            gridPhone.UpdateEdit();                
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
    function NonDeletionMsg()
    {
      alert ("Transactiopn exists for this bank. You cannot this record");
    }
    
    function DeleteRow(keyValue)
    {
      // alert (keyValue);
         doIt=confirm('Are You Want To Delete This Record ???');
            if(doIt)
                {
                   grid.PerformCallback('Delete~'+keyValue);
                   height();
                }
            else{
                  
                }

   
    }
    function Emailcheck(obj)
     {
        if(obj =='N')
        {
            if(obj !='B')
             {  
            alert("Transactions exists for this Bank... Deletion disallowed!!");   
            obj='B';     
            }
        }
        height();
        ctxtBankName.SetText(" ");
     }
    function PopUp_StartPage_abtnOK_Click()
    {
        if(ctxtBankName.GetText()!="")
            document.getElementById("hdnBankNameLike").value=ctxtBankName.GetText();
        else
            document.getElementById("hdnBankNameLike").value="NoVal";
        grid.PerformCallback("BindBank~");
    }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" align="center">
                        <strong><span style="color: #000099">Bank Details</span></strong></td>
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
                                            <td>
                                                <dxe:ASPxButton ID="btnChangeBank" runat="server" AutoPostBack="False" Text="Change Bank"
                                                    Width="85px">
                                                    <ClientSideEvents Click="function (s, e) {cPopUp_StartPage.Show(); }" />
                                                </dxe:ASPxButton>
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
                        <dxwgv:ASPxGridView ID="BankGrid" ClientInstanceName="grid" runat="server" AutoGenerateColumns="False"
                            DataSourceID="BankDataSource" KeyFieldName="bnk_internalId" OnHtmlRowCreated="BankGrid_HtmlRowCreated"
                            OnHtmlEditFormCreated="BankGrid_HtmlEditFormCreated" OnCustomCallback="BankGrid_CustomCallback"
                            Width="100%" OnRowValidating="BankGrid_RowValidating" OnCustomJSProperties="BankGrid_CustomJSProperties"
                            OnRowCommand="BankGrid_RowCommand" OnRowUpdated="BankGrid_RowUpdated" OnRowUpdating="BankGrid_RowUpdating"
                            OnCommandButtonInitialize="BankGrid_CommandButtonInitialize" OnBeforePerformDataSelect="BankGrid_BeforePerformDataSelect">
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
                                                                        <div style="text-align: right; font-size: 16px; padding: 2px 2px 2px 2px">
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
                                                                            DataSourceID="BankAddress" KeyFieldName="add_id" AutoGenerateColumns="False"
                                                                            Width="100%" OnCellEditorInitialize="AddressGrid_CellEditorInitialize" OnBeforePerformDataSelect="AddressGrid_BeforePerformDataSelect">
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
                                                                            </Templates>
                                                                            <SettingsEditing EditFormColumnCount="1" PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True"
                                                                                PopupEditFormVerticalAlign="BottomSides" PopupEditFormWidth="600px" Mode="PopupEditForm">
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
                                                                                            <RegularExpression ErrorText="Please Enter number" ValidationExpression="[0-9]{6}" />
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
                                                                                        <a href="javascript:void(0);" onclick="Address.AddNewRow();"><span style="color: #000099;
                                                                                            text-decoration: underline">Add New</span> </a>
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
                                                                        <dxwgv:ASPxGridView ID="PhoneFaxGrid" ClientInstanceName="gridPhone" runat="server"
                                                                            AutoGenerateColumns="False" DataSourceID="BankPhone" KeyFieldName="phf_id" Width="100%"
                                                                            OnBeforePerformDataSelect="AddressGrid_BeforePerformDataSelect" 
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
                                                                                <%-- <TitlePanel>
                                                                                    <table style="width: 100%">
                                                                                        <tr>
                                                                                            <td align="right">
                                                                                                <table width="200">
                                                                                                    <tr>
                                                                                                        <td>
                                                                                                            <dxe:ASPxButton ID="ASPxButton1" runat="server" Text="ADD" ToolTip="Add New Data"
                                                                                                                Height="18px" Width="88px" AutoPostBack="False">
                                                                                                                <ClientSideEvents Click="function(s, e) {gridPhone.AddNewRow();}" />
                                                                                                            </dxe:ASPxButton>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </TitlePanel>--%>
                                                                            </Templates>
                                                                            <SettingsEditing EditFormColumnCount="1" PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True"
                                                                                 PopupEditFormVerticalAlign="BottomSides" PopupEditFormWidth="600px" Mode="PopupEditForm">
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
         gridPhone.GetEditor(&quot;phf_countryCode&quot;).SetVisible(false);
         gridPhone.GetEditor(&quot;phf_areaCode&quot;).SetVisible(false);
         gridPhone.GetEditor(&quot;phf_extension&quot;).SetVisible(false);
         gridPhone.GetEditor(&quot;phf_extension&quot;).SetVisible(false);
    }
    else
    {
         gridPhone.GetEditor(&quot;phf_countryCode&quot;).SetVisible(true);
         gridPhone.GetEditor(&quot;phf_areaCode&quot;).SetVisible(true);
         gridPhone.GetEditor(&quot;phf_extension&quot;).SetVisible(true);
         gridPhone.GetEditor(&quot;phf_extension&quot;).SetVisible(true);
    }
}" />
                                                          <ClientSideEvents Init="function(s, e) {
	var value = s.GetValue();
    if(value == &quot;Mobile&quot;)
    {
         gridPhone.GetEditor(&quot;phf_countryCode&quot;).SetVisible(false);
         gridPhone.GetEditor(&quot;phf_areaCode&quot;).SetVisible(false);
         gridPhone.GetEditor(&quot;phf_extension&quot;).SetVisible(false);
         gridPhone.GetEditor(&quot;phf_extension&quot;).SetVisible(false);
    }
    else
    {
         gridPhone.GetEditor(&quot;phf_countryCode&quot;).SetVisible(true);
         gridPhone.GetEditor(&quot;phf_areaCode&quot;).SetVisible(true);
         gridPhone.GetEditor(&quot;phf_extension&quot;).SetVisible(true);
         gridPhone.GetEditor(&quot;phf_extension&quot;).SetVisible(true);
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
                                                                                <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="1" FieldName="phf_countryCode"
                                                                                    Width="20%">
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
                                                                                    <EditFormSettings Caption="Country Code" Visible="True"></EditFormSettings>
                                                                                </dxwgv:GridViewDataTextColumn>
                                                                                <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="1" FieldName="phf_areaCode">
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
                                                                                    <EditFormSettings Caption="Area Code" Visible="True"></EditFormSettings>
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
                                                                                            <RegularExpression ErrorText="Please Enter Number " ValidationExpression="[0-9]+" />
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
                                                                                           
                                                                                            <RegularExpression ErrorText="Please Enter number" ValidationExpression="[0-9]+" />
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
                                                                                        <a href="javascript:void(0);" onclick="gridPhone.AddNewRow();"><span style="color: #000099;
                                                                                            text-decoration: underline">Add New</span> </a>
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
                                                                        <dxwgv:ASPxGridView ID="EmailGrid" ClientInstanceName="gridEmail" runat="server" AutoGenerateColumns="False"
                                                                            DataSourceID="BankEmail" KeyFieldName="eml_id" Width="100%" OnBeforePerformDataSelect="AddressGrid_BeforePerformDataSelect" OnRowValidating="EmailGrid_RowValidating">
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
                                                                                                    <%--<dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
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
                                                                                <%-- <TitlePanel>
                                                                                    <table style="width: 100%">
                                                                                        <tr>
                                                                                            <td align="right">
                                                                                                <table width="200">
                                                                                                    <tr>
                                                                                                        <td>
                                                                                                            <dxe:ASPxButton ID="ASPxButton1" runat="server" Text="ADD" ToolTip="Add New Data"
                                                                                                                Height="18px" Width="88px" AutoPostBack="False">
                                                                                                                <ClientSideEvents Click="function(s, e) {gridEmail.AddNewRow();}" />
                                                                                                            </dxe:ASPxButton>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </TitlePanel>--%>
                                                                            </Templates>
                                                                            <SettingsEditing EditFormColumnCount="1" Mode="PopupEditForm" PopupEditFormHorizontalAlign="Center"
                                                                                PopupEditFormModal="True"  PopupEditFormVerticalAlign="BottomSides" PopupEditFormWidth="600px" />
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
}" />
                                                            <ClientSideEvents Init="function(s, e) {
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
}" />
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
                                                                                                       <dxwgv:GridViewDataTextColumn FieldName="eml_email" VisibleIndex="1" Caption="Email">
                                                                                <EditFormSettings Caption="EmailId" Visible="True" />
                                                                                <CellStyle CssClass="gridcellleft">
                                                                                </CellStyle>
                                                                                <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                                                </EditFormCaptionStyle>
                                                                                <PropertiesTextEdit>
                                                                                    <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                                    
                                                                                        <RegularExpression ErrorText="Enetr Valid E-Mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                                                    </ValidationSettings>
                                                                                </PropertiesTextEdit>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                            <dxwgv:GridViewDataTextColumn FieldName="eml_ccEmail" VisibleIndex="1" Visible="False">
                                                                                <EditFormSettings Caption="CC Email" Visible="True" />
                                                                                <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                                                </EditFormCaptionStyle>
                                                                                <PropertiesTextEdit>
                                                                                    <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                                        <RegularExpression ErrorText="Enetr Valid CC EMail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                                                    </ValidationSettings>
                                                                                </PropertiesTextEdit>
                                                                            </dxwgv:GridViewDataTextColumn>
                                                                                <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="2" FieldName="eml_website">
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
                                                                                        <a href="javascript:void(0);" onclick="gridEmail.AddNewRow();"><span style="color: #000099;
                                                                                            text-decoration: underline">Add New</span> </a>
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
                            <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" AllowFocusedRow="True" />
                            <Styles>
                                <Header SortingImageSpacing="5px" BackColor="#95C9FD" ImageSpacing="5px">
                                </Header>
                                <Cell CssClass="gridcellleft">
                                </Cell>
                                <FocusedRow CssClass="gridselectrow">
                                </FocusedRow>
                                <LoadingPanel ImageSpacing="10px">
                                </LoadingPanel>
                                <FocusedGroupRow CssClass="gridselectrow">
                                </FocusedGroupRow>
                                <GroupRow BackColor="#95C9FD">
                                </GroupRow>
                            </Styles>
                            <SettingsPager NumericButtonCount="15" PageSize="20" ShowSeparators="True">
                                <FirstPageButton Visible="True">
                                </FirstPageButton>
                                <LastPageButton Visible="True">
                                </LastPageButton>
                            </SettingsPager>
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Visible="False" ReadOnly="True" VisibleIndex="0" FieldName="bnk_id">
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="0" FieldName="bnk_internalId">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="0" FieldName="bnk_bankName" Caption="Bank Name" Width="300px">
                                    <EditCellStyle Wrap="False" HorizontalAlign="Left">
                                    </EditCellStyle>
                                    <PropertiesTextEdit Width="300px">
                                        <ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
                                            <RequiredField IsRequired="True" ErrorText="Please enter bank Name"></RequiredField>
                                        </ValidationSettings>
                                    </PropertiesTextEdit>
                                    <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Visible="True"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="bnk_branchName" Caption="Branch" Width="350px">
                                    <EditCellStyle Wrap="False" HorizontalAlign="Left">
                                    </EditCellStyle>
                                    <PropertiesTextEdit Width="300px">
                                    </PropertiesTextEdit>
                                    <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Visible="True"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="bnk_micrno" Caption="MICR code" Width="100px">
                                    <EditCellStyle HorizontalAlign="Left">
                                    </EditCellStyle>
                                    <PropertiesTextEdit Width="300px" MaxLength="9">
                                    </PropertiesTextEdit>
                                    <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Visible="True"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="bnk_IFSCCode" Caption="IFSC Code" Width="100px">
                                    <EditCellStyle HorizontalAlign="Left">
                                    </EditCellStyle>
                                    <PropertiesTextEdit Width="300px" MaxLength="11">
                                    </PropertiesTextEdit>
                                    <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Visible="True"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="bnk_NEFTCode" Caption="NEFT code" Width="100px">
                                    <EditCellStyle HorizontalAlign="Left">
                                    </EditCellStyle>
                                    <PropertiesTextEdit Width="300px" MaxLength="11">
                                    </PropertiesTextEdit>
                                    <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Visible="True"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="4" FieldName="bnk_RTGSCode" Caption="RTGS code" Width="100px">
                                    <EditCellStyle HorizontalAlign="Left">
                                    </EditCellStyle>
                                    <PropertiesTextEdit Width="300px" MaxLength="11">
                                    </PropertiesTextEdit>
                                    <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top">
                                    </EditFormCaptionStyle>
                                    <EditFormSettings Visible="True"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewCommandColumn VisibleIndex="5">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <%--<DeleteButton Visible="True"></DeleteButton>--%>
                                    <HeaderTemplate>
                                        <a href="javascript:void(0);" onclick="grid.AddNewRow()"><span style="color: #000099;
                                            text-decoration: underline">Add New</span> </a>
                                    </HeaderTemplate>
                                    <EditButton Visible="True">
                                    </EditButton>
                                </dxwgv:GridViewCommandColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="6" Width="60px" Caption="Details">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <DataItemTemplate>
                                        <%-- <a href="javascript:void(0);" runat="server" id="aDelete"  visible='<%#IsDeletable("bnk_internalId") %>'   >Deletes</a>--%>
                                        <asp:Panel ID="pnlDelete" runat="server" Visible='<%#IsDeletable(Eval("bnk_internalId")) %>'>
                                            <a href="javascript:void(0);" onclick="DeleteRow('<%# Container.KeyValue %>')">Deletes</a>
                                        </asp:Panel>
                                        <%-- <asp:LinkButton ID="lbtnDelete" runat="server" Visible='<%#IsDeletable("bnk_internalId") %>' Text="Delete" ></asp:LinkButton>                                                   --%>
                                    </DataItemTemplate>
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                    <HeaderTemplate>
                                        <span style="color: #000099; text-decoration: underline">Delete</span>
                                    </HeaderTemplate>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <SettingsEditing EditFormColumnCount="1" Mode="PopupEditForm" PopupEditFormHorizontalAlign="Center"
                                PopupEditFormModal="True" PopupEditFormVerticalAlign="BottomSides" PopupEditFormWidth="920px" />
                            <SettingsText PopupEditFormCaption="Add/Modify Bank Details" />
                            <Settings ShowStatusBar="Visible" ShowGroupPanel="True" />
                            <ClientSideEvents EndCallback="function(s, e) {
	Emailcheck(s.cpHeight);
}"></ClientSideEvents>
                        </dxwgv:ASPxGridView>
                    </td>
                </tr>
            </table>
            <%--===================================================== Master Grid =====================================================================--%>
            <%--========================================================== End Of Master Grid =====================================================--%>
            <%--======================================================== Master Grid DataSource ======================================================--%>
            <asp:SqlDataSource ID="BankDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>"
                InsertCommand="BankInsert" InsertCommandType="StoredProcedure" SelectCommand="BankSelect"
                SelectCommandType="StoredProcedure" UpdateCommand="BankUpdate" UpdateCommandType="StoredProcedure"
                OnUpdated="BankDataSource_Updated" OnUpdating="BankDataSource_Updating">
                <SelectParameters>
                    <asp:SessionParameter Name="bnk_bankName" Type="string" SessionField="SelectbankName" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="bnk_bankName" Type="String" />
                    <asp:Parameter Name="bnk_micrno" Type="String" />
                    <asp:Parameter Name="bnk_IFSCCode" Type="String" />
                    <asp:Parameter Name="bnk_branchName" Type="String" />
                    <asp:SessionParameter Name="CreateUser" Type="Decimal" SessionField="userid" />
                    <asp:Parameter Name="bnk_internalId" Type="string" />
                    <asp:Parameter Name="bnk_NEFTCode" Type="String" />
                    <asp:Parameter Name="bnk_RTGSCode" Type="String" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="bnk_bankName" Type="String" />
                    <asp:Parameter Name="bnk_micrno" Type="String" />
                    <asp:Parameter Name="bnk_IFSCCode" Type="String" />
                    <asp:Parameter Name="bnk_branchName" Type="String" />
                    <asp:SessionParameter Name="CreateUser" Type="Decimal" SessionField="userid" />
                    <asp:Parameter Name="bnk_NEFTCode" Type="String" />
                    <asp:Parameter Name="bnk_RTGSCode" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
            <%--========================================================= End of Master Grid Datasource=================================================--%>
            <%--========================================================== Address Data Source ========================================--%>
            <asp:SqlDataSource runat="server" ID="BankAddress" SelectCommand="select DISTINCT  tbl_master_address.add_id AS add_id,tbl_master_address.add_entity As add_entity,tbl_master_address.add_cntId As add_cntId, tbl_master_address.add_addressType AS add_addressType,
                        tbl_master_address.add_address1 AS add_address1,  tbl_master_address.add_address2 AS add_address2, 
                        tbl_master_address.add_address3 AS add_address3,tbl_master_address.add_landMark AS add_landMark, 
                        tbl_master_address.add_country AS Country, 
                        tbl_master_address.add_state AS State,tbl_master_address.add_pin AS add_pin, 
                        CASE isnull(add_country, '')WHEN '' THEN '0' ELSE(SELECT cou_country FROM tbl_master_country WHERE cou_id = add_country) END AS Country1, 
                        CASE isnull(add_state, '') WHEN '' THEN '0' ELSE(SELECT state FROM tbl_master_state WHERE id = add_state) END AS State1,
                        CASE isnull(add_city, '') WHEN '' THEN '0' ELSE(SELECT city_name FROM tbl_master_city WHERE city_id = add_city) END AS City1, 
                        tbl_master_address.add_city AS City, tbl_master_address.add_pin AS PinCode, tbl_master_address.add_landMark AS LankMark,tbl_master_address.add_activityId AS add_activityId,tbl_master_address.CreateDate AS CreateDate,tbl_master_address.CreateUser AS CreateUser,tbl_master_address.LastModifyDate AS LastModifyDate,tbl_master_address.LastModifyUser AS LastModifyUser 
                        from tbl_master_address where add_cntId=@bnk_internalId" OldValuesParameterFormatString="original_{0}"
                ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [tbl_master_address] WHERE [add_id] = @original_add_id"
                InsertCommand="INSERT INTO [tbl_master_address] ([add_cntId],[add_entity],[add_addressType], [add_address1], [add_address2], [add_address3], [add_landMark], [add_country], [add_state], [add_city], [add_pin],[CreateDate],[CreateUser]) VALUES ( @bnk_internalId,'Bank',@add_addressType, @add_address1, @add_address2, @add_address3, @add_landMark, @Country, @State, @City, @add_pin,getdate(),@CreateUserAddress)"
                ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>" UpdateCommand="UPDATE [tbl_master_address] SET  [add_addressType] = @add_addressType, [add_address1] = @add_address1, [add_address2] = @add_address2, [add_address3] = @add_address3, [add_landMark] = @add_landMark, [add_country] = @Country, [add_state] = @State, [add_city] = @City, [add_pin] = @add_pin,[LastModifyDate]=getdate(),[LastModifyUser]=@CreateUserAddress  WHERE [add_id] = @original_add_id">
                <InsertParameters>
                    <asp:SessionParameter SessionField="KeyVal_InternalID" Type="String" Name="bnk_internalId">
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
                    <asp:SessionParameter SessionField="KeyVal_InternalID" Type="String" Name="bnk_internalId">
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
            <asp:SqlDataSource ID="BankPhone" runat="server" ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>" DeleteCommand="DELETE FROM [tbl_master_phonefax] WHERE [phf_id] = @original_phf_id"
                InsertCommand="INSERT INTO [tbl_master_phonefax] ([phf_cntId],[phf_entity],[phf_type], [phf_countryCode], [phf_areaCode], [phf_phoneNumber], [phf_extension],[CreateDate],[CreateUser]) VALUES (@bnk_internalId,'Bank',@phf_type, @phf_countryCode, @phf_areaCode, @phf_phoneNumber, @phf_extension,getdate(),@CreateUserPhone)"
                OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [tbl_master_phonefax] where [phf_cntId]=@bnk_internalId"
                UpdateCommand="UPDATE [tbl_master_phonefax] SET  [phf_type] = @phf_type, [phf_countryCode] = @phf_countryCode, [phf_areaCode] = @phf_areaCode, [phf_phoneNumber] = @phf_phoneNumber, [phf_extension] = @phf_extension, [LastModifyDate]=getdate(),[LastModifyUser]=@CreateUserPhone WHERE [phf_id] = @original_phf_id"
                OnDeleted="BankPhone_Deleted">
                <DeleteParameters>
                    <asp:Parameter Name="original_phf_id" Type="Decimal" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:SessionParameter SessionField="KeyVal_InternalID" Type="String" Name="bnk_internalId">
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
                    <asp:SessionParameter SessionField="KeyVal_InternalID" Type="String" Name="bnk_internalId">
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
            <asp:SqlDataSource ID="BankEmail" runat="server" ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>" DeleteCommand="DELETE FROM [tbl_master_email] WHERE [eml_id] = @original_eml_id"
                InsertCommand="INSERT INTO [tbl_master_email] ([eml_cntId],[eml_entity],[eml_type], [eml_email], [eml_website],[CreateDate],[CreateUser]) VALUES (@bnk_internalId,'Bank',@eml_type, @eml_email, @eml_website,getdate(),@CreateUserEmail)"
                OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [tbl_master_email] where [eml_cntId]=@bnk_internalId "
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
                    <asp:SessionParameter SessionField="KeyVal_InternalID" Type="String" Name="bnk_internalId">
                    </asp:SessionParameter>
                </SelectParameters>
                <InsertParameters>
                    <asp:SessionParameter SessionField="KeyVal_InternalID" Type="String" Name="bnk_internalId">
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
        <dxpc:ASPxPopupControl ID="PopUp_StartPage" runat="server" ClientInstanceName="cPopUp_StartPage"
            CloseAction="None" HeaderText="Select Bank" Modal="True" PopupHorizontalAlign="WindowCenter"
            PopupVerticalAlign="WindowCenter" ShowOnPageLoad="True" ShowSizeGrip="False"
            Width="387px">
            <ClientSideEvents PopUp="function(s, e)
                                                    {
                                                    setTimeout('ctxtBankName.Focus()', 50);
                                                    }" />
            <ContentCollection>
                <dxpc:PopupControlContentControl runat="server">
                    <asp:Panel ID="Panel_Start" runat="server" DefaultButton="abtnOk">
                        <div style="text-align: center">
                            <span style="color:Red" >
                                Advance Search By (Bank Name, Branch, MICR, IFSC, NEFT, RTGS)<br />
                                Example : You can enter a word to meet desire result.<br />
                                Like For Bank Name ( state , National, panjab etc )<br />
                                Like For MICR No (1904, 1100 etc)<br />
                                and so on..<br />
                            </span>
                            <br />
                            Search by Word(s)/Number(s) : <dxe:ASPxTextBox ID="txtBankName" runat="server" ClientInstanceName="ctxtBankName" ></dxe:ASPxTextBox>
                            <br />
                            <dxe:ASPxButton ID="abtnOk" runat="server" AutoPostBack="False" Text="Ok" Width="85px">
                                <ClientSideEvents Click="function (s, e) {PopUp_StartPage_abtnOK_Click();cPopUp_StartPage.Hide(); }" />
                            </dxe:ASPxButton>
                        </div>
                    </asp:Panel>
                </dxpc:PopupControlContentControl>
            </ContentCollection>
            <HeaderStyle BackColor="LightGray" ForeColor="Black" Font-Names="Calibri" />
        </dxpc:ASPxPopupControl>
        <asp:HiddenField ID="hdnBankNameLike" runat="server" />
    </form>
</body>
</html>
