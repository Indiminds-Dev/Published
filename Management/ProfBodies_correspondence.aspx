<%@ page language="C#" autoeventwireup="true" inherits="management_ProfBodies_correspondence, App_Web_g1t3n0jz" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
    <script language="javascript" type="text/javascript">
    function OnCountryChanged(cmbCountry) 
    {
        gridAddress.GetEditor("State").PerformCallback(cmbCountry.GetValue().toString());
    }
    function OnStateChanged(cmbState) 
    {
        gridAddress.GetEditor("City").PerformCallback(cmbState.GetValue().toString());
    }
    function OnCityChanged(cmbCity) 
    {
        gridAddress.GetEditor("area").PerformCallback(cmbCity.GetValue().toString());
    }
    function OnChildCall(cmbCity) 
    {
       OnCityChanged(gridAddress.GetEditor("City"));
    }
    function openAreaPage()
        {
            var left = (screen.width-300)/2;
            var top = (screen.height-250)/2;
            var cityid=gridAddress.GetEditor("City").GetValue();
            var cityname=gridAddress.GetEditor("City").GetText();
            var URL= 'AddArea_PopUp.aspx?id='+cityid+'&name='+cityname+'';
            if(cityid != null)
            {
                window.open(URL,'50','resizable=1,height=100px,width=300px,top='+top+',left='+left+'');
            }
            else
            {
                alert('Please select a city first!');
                return false;
            }
        }
    function disp_prompt(name)
        {
            if ( name == "tab0")
            {
            //alert(name);
            document.location.href="ProfBodies_general.aspx"; 
            }
            if ( name == "tab1")
            {
            //alert(name);
            //document.location.href="ProfBodies_correspondence.aspx";         
            }
        }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td>
                        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="1" ClientInstanceName="page"
                            Font-Size="10px">
                            <TabPages>
                                <dxtc:TabPage Text="General" Name="General">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Text="CorresPondence" Name="CorresPondence">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                            <table class="TableMain100">
                                                <tr>
                                                    <td class="gridcellcenter">
                                                        <dxwgv:ASPxGridView ID="AddressGrid" runat="server" DataSourceID="Address" ClientInstanceName="gridAddress"
                                                            KeyFieldName="Id" AutoGenerateColumns="False" OnCellEditorInitialize="AddressGrid_CellEditorInitialize"
                                                            Width="100%" Font-Size="10px">
                                                            <Columns>
                                                                <dxwgv:GridViewDataTextColumn FieldName="Id" Visible="False" VisibleIndex="0" Caption="Id">
                                                                    <EditFormSettings Visible="False" />
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataComboBoxColumn Caption="Address Type" FieldName="Type" Visible="False"
                                                                    VisibleIndex="0">
                                                                    <PropertiesComboBox ValueType="System.String">
                                                                        <Items>
                                                                            <dxe:ListEditItem Text="Residence" Value="Residence">
                                                                            </dxe:ListEditItem>
                                                                            <dxe:ListEditItem Text="Office" Value="Office">
                                                                            </dxe:ListEditItem>
                                                                            <dxe:ListEditItem Text="Correspondence" Value="Correspondence">
                                                                            </dxe:ListEditItem>
                                                                        </Items>
                                                                    </PropertiesComboBox>
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <EditFormSettings Visible="True" VisibleIndex="1" />
                                                                    <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                </dxwgv:GridViewDataComboBoxColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="Type" VisibleIndex="0" Caption="Type">
                                                                    <EditFormSettings Visible="False" />
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="Address1" VisibleIndex="1" Caption="Address1">
                                                                    <EditFormSettings Visible="True" VisibleIndex="2" />
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="Address2" VisibleIndex="2" Caption="Address2">
                                                                    <EditFormSettings Visible="True" VisibleIndex="3" />
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="Address3" VisibleIndex="3" Caption="Address3">
                                                                    <EditFormSettings Visible="True" VisibleIndex="4" />
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="LandMark" VisibleIndex="4" Caption="LandMark">
                                                                    <EditFormSettings Visible="True" VisibleIndex="5" />
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataComboBoxColumn Caption="Country" FieldName="Country" Visible="False"
                                                                    VisibleIndex="0">
                                                                    <PropertiesComboBox DataSourceID="CountrySelect" TextField="Country" ValueField="cou_id"
                                                                        EnableSynchronization="False" EnableIncrementalFiltering="True" ValueType="System.String">
                                                                        <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCountryChanged(s); }"></ClientSideEvents>
                                                                    </PropertiesComboBox>
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <EditFormSettings Visible="True" VisibleIndex="6" />
                                                                    <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                </dxwgv:GridViewDataComboBoxColumn>
                                                                <dxwgv:GridViewDataComboBoxColumn Caption="State" FieldName="State" Visible="False"
                                                                    VisibleIndex="0">
                                                                    <PropertiesComboBox DataSourceID="StateSelect" TextField="State" ValueField="ID"
                                                                        EnableSynchronization="False" EnableIncrementalFiltering="True" ValueType="System.String">
                                                                        <ClientSideEvents SelectedIndexChanged="function(s, e) { OnStateChanged(s); }"></ClientSideEvents>
                                                                    </PropertiesComboBox>
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <EditFormSettings Visible="True" VisibleIndex="7" />
                                                                    <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                </dxwgv:GridViewDataComboBoxColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="Country1" VisibleIndex="5" Caption="Country">
                                                                    <EditFormSettings Visible="False" />
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="State1" VisibleIndex="6" Caption="State">
                                                                    <EditFormSettings Visible="False" />
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="City1" VisibleIndex="8" Caption="City">
                                                                    <EditFormSettings Visible="False" />
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataComboBoxColumn Caption="City" FieldName="City" VisibleIndex="7"
                                                                    Visible="False">
                                                                    <PropertiesComboBox DataSourceID="SelectCity" TextField="City" ValueField="CityId"
                                                                        EnableSynchronization="False" EnableIncrementalFiltering="True" ValueType="System.String">
                                                                        <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCityChanged(s); }"></ClientSideEvents>
                                                                    </PropertiesComboBox>
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                    <EditFormSettings Visible="True" VisibleIndex="8" />
                                                                </dxwgv:GridViewDataComboBoxColumn>
                                                                <dxwgv:GridViewDataComboBoxColumn Caption="Area" FieldName="area" VisibleIndex="7">
                                                                    <PropertiesComboBox ValueType="System.Int32" DataSourceID="SelectArea" EnableSynchronization="False"
                                                                        EnableIncrementalFiltering="True" ValueField="area_id" TextField="area_name">
                                                                    </PropertiesComboBox>
                                                                    <EditFormSettings Caption="Area" Visible="True" VisibleIndex="9" />
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                </dxwgv:GridViewDataComboBoxColumn>
                                                                <dxwgv:GridViewDataHyperLinkColumn Caption="" Visible="false" VisibleIndex="10">
                                                                    <EditFormSettings Visible="true" VisibleIndex="10" />
                                                                    <EditItemTemplate>
                                                                        <a href="#" onclick="javascript:openAreaPage();"><span class="Ecoheadtxt" style="color: Blue">
                                                                            <strong>Add New Area</strong></span></a>
                                                                    </EditItemTemplate>
                                                                </dxwgv:GridViewDataHyperLinkColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="PinCode" VisibleIndex="9" Caption="PinCode">
                                                                    <EditFormSettings Visible="True" VisibleIndex="11" />
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <PropertiesTextEdit MaxLength="6">
                                                                        <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                            <RequiredField ErrorText="PinCode Can Not Be Blank" IsRequired="True" />
                                                                            <RegularExpression ErrorText="Enter Valid PinCode" ValidationExpression="[0-9]{6}" />
                                                                        </ValidationSettings>
                                                                    </PropertiesTextEdit>
                                                                    <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewCommandColumn VisibleIndex="10">
                                                                    <DeleteButton Visible="True">
                                                                    </DeleteButton>
                                                                    <EditButton Visible="True">
                                                                    </EditButton>
                                                                    <HeaderTemplate>
                                                                        <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                                                              { %>
                                                                        <a href="javascript:void(0);" onclick="gridAddress.AddNewRow();"><span style="color: #000099;
                                                                            text-decoration: underline">Add New</span> </a>
                                                                        <%} %>
                                                                    </HeaderTemplate>
                                                                </dxwgv:GridViewCommandColumn>
                                                                <dxwgv:GridViewCommandColumn VisibleIndex="12" Visible="False">
                                                                </dxwgv:GridViewCommandColumn>
                                                            </Columns>
                                                            <Settings ShowStatusBar="Visible" ShowTitlePanel="True" />
                                                            <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="350px" PopupEditFormHorizontalAlign="Center"
                                                                PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="700px"
                                                                EditFormColumnCount="1" />
                                                            <Styles>
                                                                <LoadingPanel ImageSpacing="10px">
                                                                </LoadingPanel>
                                                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                </Header>
                                                            </Styles>
                                                            <SettingsText PopupEditFormCaption="Add/Modify Address" ConfirmDelete="Are You Want To Delete This Record ???" />
                                                            <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True">
                                                            </SettingsPager>
                                                            <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
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
                                                                <TitlePanel>
                                                                    <table style="width: 100%">
                                                                        <tr>
                                                                            <td align="center">
                                                                                <span class="Ecoheadtxt">Add/Modify Address.</span>
                                                                            </td>
                                                                            
                                                                        </tr>
                                                                    </table>
                                                                </TitlePanel>
                                                            </Templates>
                                                        </dxwgv:ASPxGridView>
                                                        <dxwgv:ASPxGridView ID="PhoneGrid" ClientInstanceName="gridPhone" DataSourceID="Phone"
                                                            KeyFieldName="phf_id" runat="server" AutoGenerateColumns="False" Width="100%"
                                                            Font-Size="10px">
                                                            <Columns>
                                                                <dxwgv:GridViewDataTextColumn FieldName="phf_id" ReadOnly="True" VisibleIndex="0"
                                                                    Visible="False">
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="phf_cntId" ReadOnly="True" VisibleIndex="0"
                                                                    Visible="False">
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="phf_entity" ReadOnly="True" VisibleIndex="0"
                                                                    Visible="False">
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataComboBoxColumn Caption="Phone Type" FieldName="phf_type" VisibleIndex="0">
                                                                    <PropertiesComboBox ValueType="System.String">
                                                                        <ClientSideEvents SelectedIndexChanged="function(s, e) {
	var value = s.GetValue();
    if(value == &quot;Mobile&quot;)
    {
         gridPhone.GetEditor(&quot;phf_countryCode&quot;).SetVisible(false);
         gridPhone.GetEditor(&quot;phf_areaCode&quot;).SetVisible(false);
         gridPhone.GetEditor(&quot;phf_extension&quot;).SetVisible(false);
    }
    else
    {
         gridPhone.GetEditor(&quot;phf_countryCode&quot;).SetVisible(true);
         gridPhone.GetEditor(&quot;phf_areaCode&quot;).SetVisible(true);
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
    }
    else
    {
         gridPhone.GetEditor(&quot;phf_countryCode&quot;).SetVisible(true);
         gridPhone.GetEditor(&quot;phf_areaCode&quot;).SetVisible(true);
         gridPhone.GetEditor(&quot;phf_extension&quot;).SetVisible(true);
    }
}" />
                                                                        <Items>
                                                                            <dxe:ListEditItem Text="Residence" Value="Residence">
                                                                            </dxe:ListEditItem>
                                                                            <dxe:ListEditItem Text="Office" Value="Office">
                                                                            </dxe:ListEditItem>
                                                                            <dxe:ListEditItem Text="Correspondence" Value="Correspondence">
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
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <EditFormSettings Visible="True" />
                                                                    <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
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
                                                                <dxwgv:GridViewDataTextColumn FieldName="phf_phoneNumber" VisibleIndex="1" Caption="Number"
                                                                    Visible="False">
                                                                    <EditFormSettings Visible="True" />
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <PropertiesTextEdit>
                                                                        <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                            <RegularExpression ErrorText="Enter Valid PhoneNumber" ValidationExpression="[0-9]+" />
                                                                        </ValidationSettings>
                                                                    </PropertiesTextEdit>
                                                                    <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="Number" VisibleIndex="1" Caption="Phone Number"
                                                                    Width="40%">
                                                                    <EditFormSettings Visible="False" />
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="phf_extension" VisibleIndex="2" Caption="Extension"
                                                                    Visible="False">
                                                                    <EditFormSettings Visible="True" />
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <PropertiesTextEdit>
                                                                        <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                            <RegularExpression ErrorText="Enter Valid Extension" ValidationExpression="[0-9]+" />
                                                                        </ValidationSettings>
                                                                    </PropertiesTextEdit>
                                                                    <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewCommandColumn VisibleIndex="2">
                                                                    <DeleteButton Visible="True">
                                                                    </DeleteButton>
                                                                    <EditButton Visible="True">
                                                                    </EditButton>
                                                                    <HeaderTemplate>
                                                                        <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                                                              { %>
                                                                        <a href="javascript:void(0);" onclick="gridPhone.AddNewRow();"><span style="color: #000099;
                                                                            text-decoration: underline">Add New</span> </a>
                                                                        <%} %>
                                                                    </HeaderTemplate>
                                                                </dxwgv:GridViewCommandColumn>
                                                            </Columns>
                                                            <Settings ShowStatusBar="Visible" ShowTitlePanel="True" />
                                                            <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="350px" PopupEditFormHorizontalAlign="Center"
                                                                PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="700px"
                                                                EditFormColumnCount="1" />
                                                            <Styles>
                                                                <LoadingPanel ImageSpacing="10px">
                                                                </LoadingPanel>
                                                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                </Header>
                                                            </Styles>
                                                            <SettingsText PopupEditFormCaption="Add/Modify Address" ConfirmDelete="Are You Want To Delete This Record ???" />
                                                            <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True">
                                                            </SettingsPager>
                                                            <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
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
                                                                <TitlePanel>
                                                                    <table style="width: 100%">
                                                                        <tr>
                                                                            <td align="center">
                                                                                <span class="Ecoheadtxt">Add/Modify Phone.</span>
                                                                            </td>
                                                                            
                                                                        </tr>
                                                                    </table>
                                                                </TitlePanel>
                                                            </Templates>
                                                        </dxwgv:ASPxGridView>
                                                        <dxwgv:ASPxGridView ID="EmailGrid" runat="server" ClientInstanceName="gridEmail"
                                                            DataSourceID="Email" KeyFieldName="eml_id" AutoGenerateColumns="False" Font-Size="10px">
                                                            <Columns>
                                                                <dxwgv:GridViewDataTextColumn FieldName="eml_id" VisibleIndex="1" Visible="False">
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataComboBoxColumn Caption="Email Type" FieldName="eml_type" Visible="False"
                                                                    VisibleIndex="0">
                                                                    <PropertiesComboBox ValueType="System.String">
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
                                                                            <dxe:ListEditItem Text="Personal" Value="Personal">
                                                                            </dxe:ListEditItem>
                                                                            <dxe:ListEditItem Text="Official" Value="Official">
                                                                            </dxe:ListEditItem>
                                                                            <dxe:ListEditItem Text="Web Site" Value="Web Site">
                                                                            </dxe:ListEditItem>
                                                                        </Items>
                                                                    </PropertiesComboBox>
                                                                    <EditFormSettings Visible="True" />
                                                                    <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                </dxwgv:GridViewDataComboBoxColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="eml_type" VisibleIndex="0" Caption="Type"
                                                                    Width="27%">
                                                                    <EditFormSettings Caption="Email Type" Visible="False" />
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
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
                                                                <dxwgv:GridViewDataTextColumn FieldName="eml_website" Caption="WebURL" VisibleIndex="1"
                                                                    Visible="true">
                                                                    <EditFormSettings Caption="WebURL" Visible="True" />
                                                                    <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewCommandColumn VisibleIndex="2">
                                                                    <DeleteButton Visible="True">
                                                                    </DeleteButton>
                                                                    <EditButton Visible="True">
                                                                    </EditButton>
                                                                    <HeaderTemplate>
                                                                        <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                                                              { %>
                                                                        <a href="javascript:void(0);" onclick="gridEmail.AddNewRow();"><span style="color: #000099;
                                                                            text-decoration: underline">Add New</span> </a>
                                                                        <%} %>
                                                                    </HeaderTemplate>
                                                                </dxwgv:GridViewCommandColumn>
                                                            </Columns>
                                                            <Settings ShowStatusBar="Visible" ShowTitlePanel="True" />
                                                            <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="350px" PopupEditFormHorizontalAlign="Center"
                                                                PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="700px"
                                                                EditFormColumnCount="1" />
                                                            <Styles>
                                                                <LoadingPanel ImageSpacing="10px">
                                                                </LoadingPanel>
                                                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                </Header>
                                                            </Styles>
                                                            <SettingsText PopupEditFormCaption="Add/Modify Address" ConfirmDelete="Are You Want To Delete This Record ???" />
                                                            <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True">
                                                            </SettingsPager>
                                                            <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
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
                                                                <TitlePanel>
                                                                    <table style="width: 100%">
                                                                        <tr>
                                                                            <td align="center">
                                                                                <span class="Ecoheadtxt">Add/Modify Email.</span>
                                                                            </td>
                                                                            
                                                                        </tr>
                                                                    </table>
                                                                </TitlePanel>
                                                            </Templates>
                                                        </dxwgv:ASPxGridView>
                                                    </td>
                                                </tr>
                                            </table>
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                            </TabPages>
                            <ClientSideEvents ActiveTabChanged="function(s, e) {
	                                            var activeTab   = page.GetActiveTab();
	                                            var Tab0 = page.GetTab(0);
	                                            var Tab1 = page.GetTab(1);
	                                            
	                                            if(activeTab == Tab0)
	                                            {
	                                                disp_prompt('tab0');
	                                            }
	                                            if(activeTab == Tab1)
	                                            {
	                                                disp_prompt('tab1');
	                                            }
	                                            }"></ClientSideEvents>
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
        <asp:SqlDataSource ID="Address" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="select DISTINCT  tbl_master_address.add_id AS Id, tbl_master_address.add_addressType AS Type,
                        tbl_master_address.add_address1 AS Address1,  tbl_master_address.add_address2 AS Address2, 
                        tbl_master_address.add_address3 AS Address3,tbl_master_address.add_landMark AS LandMark, 
                        tbl_master_address.add_country AS Country, 
                        tbl_master_address.add_state AS State,tbl_master_address.add_city AS City,
                        CASE add_country WHEN '' THEN '0' ELSE(SELECT cou_country FROM tbl_master_country WHERE cou_id = add_country) END AS Country1, 
                        CASE add_state WHEN '' THEN '0' ELSE(SELECT state FROM tbl_master_state WHERE id = add_state) END AS State1,
                        CASE add_city WHEN '' THEN '0' ELSE(SELECT city_name FROM tbl_master_city WHERE city_id = add_city) END AS City1,
                        CASE add_area WHEN '' THEN '0' Else(select area_name From tbl_master_area Where area_id = add_area) End AS area,                      
                        tbl_master_address.add_pin AS PinCode, tbl_master_address.add_landMark AS LankMark 
                        from tbl_master_address where add_cntId=@insuId" DeleteCommand="contactDelete"
            DeleteCommandType="StoredProcedure" InsertCommand="insert_correspondence" UpdateCommand="update tbl_master_address set add_addressType=@Type,add_address1=@Address1,add_address2=@Address2,add_address3=@Address3,add_city=@City,add_landMark=@LandMark,add_country=@Country,add_state=@State,add_area=@area,add_pin=@PinCode,LastModifyDate=getdate(),LastModifyUser=@CreateUser where add_id=@Id"
            InsertCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="insuId" SessionField="KeyVal_InternalID" Type="String" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="decimal" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Type" Type="string" />
                <asp:Parameter Name="Address1" Type="string" />
                <asp:Parameter Name="Address2" Type="string" />
                <asp:Parameter Name="Address3" Type="string" />
                <asp:Parameter Name="City" Type="int32" />
                <asp:Parameter Name="area" Type="int32" />
                <asp:Parameter Name="LandMark" Type="string" />
                <asp:Parameter Name="Country" Type="int32" />
                <asp:Parameter Name="State" Type="int32" />
                <asp:Parameter Name="PinCode" Type="string" />
                <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="Decimal" />
                <asp:Parameter Name="Id" Type="decimal" />
            </UpdateParameters>
            <InsertParameters>
                <asp:SessionParameter Name="insuId" SessionField="KeyVal_InternalID" Type="String" />
                <asp:Parameter Name="Type" Type="string" />
                <asp:SessionParameter Name="contacttype" SessionField="ContactType" Type="string" />
                <asp:Parameter Name="Address1" Type="string" />
                <asp:Parameter Name="Address2" Type="string" />
                <asp:Parameter Name="Address3" Type="string" />
                <asp:Parameter Name="City" Type="int32" />
                <asp:Parameter Name="area" Type="int32" />
                <asp:Parameter Name="LandMark" Type="string" />
                <asp:Parameter Name="Country" Type="int32" />
                <asp:Parameter Name="State" Type="int32" />
                <asp:Parameter Name="PinCode" Type="string" />
                <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="Decimal" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="CountrySelect" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="SELECT cou_id, cou_country as Country FROM tbl_master_country order by cou_country">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="StateSelect" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="SELECT s.id as ID,s.state as State from tbl_master_state s where (s.countryId = @State) ORDER BY s.state">
            <SelectParameters>
                <asp:Parameter Name="State" Type="string" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SelectCity" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="SELECT c.city_id AS CityId, c.city_name AS City FROM tbl_master_city c where c.state_id=@City order by c.city_name">
            <SelectParameters>
                <asp:Parameter Name="City" Type="string" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SelectArea" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="SELECT area_id, area_name from tbl_master_area where (city_id = @Area) ORDER BY area_name">
            <SelectParameters>
                <asp:Parameter Name="Area" Type="string" />
            </SelectParameters>
        </asp:SqlDataSource>
        &nbsp;
        <asp:SqlDataSource ID="Phone" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            DeleteCommand="delete from tbl_master_phonefax where phf_id=@phf_id" InsertCommand="insert_correspondence_phone"
            SelectCommand="select DISTINCT phf_id,phf_cntId,phf_entity,phf_type,phf_countryCode,phf_areaCode,phf_phoneNumber,phf_extension, ISNULL(phf_countryCode, '') + ' ' + ISNULL(phf_areaCode, '') + ' ' + ISNULL(phf_phoneNumber, '') +' '+ ISNULL(phf_extension, '') + ISNULL(phf_faxNumber, '') AS Number 
                      from tbl_master_phonefax where phf_cntId=@PhfId" UpdateCommand="update tbl_master_phonefax set phf_type=@phf_type,phf_countryCode=@phf_countryCode,phf_areaCode=@phf_areaCode,phf_phoneNumber=@phf_phoneNumber,
                       phf_extension=@phf_extension,LastModifyDate=getdate(),LastModifyUser=@CreateUser where phf_id=@phf_id"
            InsertCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="PhfId" SessionField="KeyVal_InternalID" Type="String" />
            </SelectParameters>
            <InsertParameters>
                <asp:SessionParameter Name="PhfId" SessionField="KeyVal_InternalID" Type="String" />
                <asp:Parameter Name="phf_type" Type="string" />
                <asp:SessionParameter Name="contacttype" SessionField="ContactType" Type="string" />
                <asp:Parameter Name="phf_countryCode" Type="string" />
                <asp:Parameter Name="phf_areaCode" Type="string" />
                <asp:Parameter Name="phf_phoneNumber" Type="string" />
                <asp:Parameter Name="phf_extension" Type="string" />
                <asp:Parameter Name="phf_Availablefrom" Type="string" />
                <asp:Parameter Name="phf_AvailableTo" Type="string" />
                <asp:Parameter Name="phf_SMSFacility" Type="string" />
                <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="phf_type" Type="string" />
                <asp:Parameter Name="phf_countryCode" Type="string" />
                <asp:Parameter Name="phf_areaCode" Type="string" />
                <asp:Parameter Name="phf_phoneNumber" Type="string" />
                <asp:Parameter Name="phf_extension" Type="string" />
                <asp:Parameter Name="phf_Availablefrom" Type="string" />
                <asp:Parameter Name="phf_AvailableTo" Type="string" />
                <asp:Parameter Name="phf_SMSFacility" Type="string" />
                <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="Decimal" />
                <asp:Parameter Name="phf_id" Type="decimal" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="phf_id" Type="decimal" />
            </DeleteParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="Email" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            DeleteCommand="delete from tbl_master_email where eml_id=@eml_id" InsertCommand="insert_correspondence_email"
            InsertCommandType="StoredProcedure" SelectCommand="select eml_id,eml_cntId,eml_entity,eml_type,eml_email,eml_ccEmail,eml_website,CreateDate,CreateUser from tbl_master_email where eml_cntId=@EmlId"
            UpdateCommand="update tbl_master_email set eml_type=@eml_type,eml_email=@eml_email,eml_ccEmail=@eml_ccEmail,eml_website=@eml_website,LastModifyDate=getdate(),LastModifyUser=@CreateUser where eml_id=@eml_id">
            <DeleteParameters>
                <asp:Parameter Name="eml_id" Type="decimal" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="eml_type" Type="string" />
                <asp:Parameter Name="eml_email" Type="string" />
                <asp:Parameter Name="eml_ccEmail" Type="string" />
                <asp:Parameter Name="eml_website" Type="string" />
                <asp:Parameter Name="eml_id" Type="decimal" />
                <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="Decimal" />
            </UpdateParameters>
            <SelectParameters>
                <asp:SessionParameter Name="EmlId" SessionField="KeyVal_InternalID" Type="string" />
            </SelectParameters>
            <InsertParameters>
                <asp:SessionParameter Name="EmlId" SessionField="KeyVal_InternalID" Type="string" />
                <asp:Parameter Name="eml_type" Type="string" />
                <asp:SessionParameter Name="contacttype" SessionField="ContactType" Type="string" />
                <asp:Parameter Name="eml_email" Type="string" />
                <asp:Parameter Name="eml_ccEmail" Type="string" />
                <asp:Parameter Name="eml_website" Type="string" />
                <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="Decimal" />
            </InsertParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
