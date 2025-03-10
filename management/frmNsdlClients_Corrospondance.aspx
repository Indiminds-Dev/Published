<%@ page language="C#" autoeventwireup="true" inherits="management_frmNsdlClients_Corrospondance, App_Web_d1rqvttb" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>

    <script language="javascript" type="text/javascript">
    function disp_prompt(name)
    {    
        var qrStr=window.location .search ;
        spQrStr=qrStr.substring(1);
         
        if ( name == "tab0")
        {
            document.location.href="frmNsdlClients_General.aspx?"+spQrStr;
        }
        if ( name == "tab1")
        {
            
            document.location.href="frmNsdlClients_JointHolders.aspx?"+spQrStr; 
        }
        else if ( name == "tab2")
        {
            document.location.href="frmNsdlClients_BankDetail.aspx?"+spQrStr; 
        }
        else if ( name == "tab3")
        {
            document.location.href="frmNsdlClients_NomineePOA.aspx?"+spQrStr; 
        }
        else if ( name == "tab4")
        {
            document.location.href="frmNsdlClients_Documents.aspx?"+spQrStr; 
        }
        else if ( name == "tab5")
        {
            document.location.href="frmNsdlClients_Groups.aspx?"+spQrStr; 
        }
        else if ( name == "tab6")
        {
            document.location.href="frmNsdlClients_Remarks.aspx?"+spQrStr; 
        }
        else if ( name == "tab7")
        {
            document.location.href="frmNsdlClients_OtherDetail.aspx?"+spQrStr;
        }
        else if ( name == "tab8")
        {
            
        }
        else if ( name == "tab9")
        {
            document.location.href="frmNsdlClients_Subscriptions.aspx?"+spQrStr;
        }
             
    }
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
    function openAreaPage()
    {
        var left = (screen.width-300)/2;
        var top = (screen.height-250)/2;
        var cityid=gridAddress.GetEditor("City").GetValue();
        var cityname=gridAddress.GetEditor("City").GetText();
        var URL= 'AddArea_PopUp.aspx?id='+cityid+'&name='+cityname+'';
        alert(URL);
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
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">    <form id="form1" runat="server">
        <table>
            <tr>
                <td>
                    <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="8" ClientInstanceName="page"
                        Width="100%">
                        <loadingpanelstyle imagespacing="6px"></loadingpanelstyle>
                        <contentstyle>
<Border BorderWidth="1px" BorderStyle="Solid" BorderColor="#002D96"></Border>
</contentstyle>
                        <clientsideevents activetabchanged="function(s, e) {
                                        var activeTab   = page.GetActiveTab();
                                        var Tab0 = page.GetTab(0);
                                        var Tab1 = page.GetTab(1);
                                        var Tab2 = page.GetTab(2);
                                        var Tab3 = page.GetTab(3);
                                        var Tab4 = page.GetTab(4);
                                        var Tab5 = page.GetTab(5);
                                        var Tab6 = page.GetTab(6);
                                        var Tab7 = page.GetTab(7);
                                        var Tab8 = page.GetTab(8);
                                        var Tab9 = page.GetTab(9);
                                        if(activeTab == Tab0)
                                        {
                                            disp_prompt('tab0');
                                        }
                                        if(activeTab == Tab1)
                                        {
                                            disp_prompt('tab1');
                                        }
                                        else if(activeTab == Tab2)
                                        {
                                            disp_prompt('tab2');
                                        }
                                        else if(activeTab == Tab3)
                                        {
                                            disp_prompt('tab3');
                                        }
                                        else if(activeTab == Tab4)
                                        {
                                            disp_prompt('tab4');
                                        }
                                        else if(activeTab == Tab5)
                                        {
                                            disp_prompt('tab5');
                                        }
                                        else if(activeTab == Tab6)
                                        {
                                            disp_prompt('tab6');
                                        }
                                        else if(activeTab == Tab7)
                                        {
                                            disp_prompt('tab7');
                                        }
                                        else if(activeTab== Tab8)
                                        {
                                             disp_prompt('tab8');
                                        }
                                        else if(activeTab== Tab9)
                                        {
                                             disp_prompt('tab9');
                                        }
                                       
                                        }"></clientsideevents>
                        <tabpages>
<dxtc:TabPage Name="General" Text="General">
<TabStyle Font-Bold="True"></TabStyle>
<ContentCollection>
<dxw:ContentControl runat="server">
    </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="JointHolders" Text="Joint Holders">
<TabStyle Font-Bold="True"></TabStyle>
<ContentCollection>
<dxw:ContentControl runat="server">
    </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="BankDetail" Text="Bank Detail">
<TabStyle Font-Bold="True"></TabStyle>
<ContentCollection>
<dxw:ContentControl runat="server">
    </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="Nominee_POA" Text="Nominee &amp; POA">
<TabStyle Font-Bold="True"></TabStyle>
<ContentCollection>
<dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="Documents" Text="Documents">
<TabStyle Font-Bold="True"></TabStyle>
<ContentCollection>
<dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="Groups" Text="Groups">
<TabStyle Font-Bold="True"></TabStyle>
<ContentCollection>
<dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="Remarks" Text="Remarks">
<TabStyle Font-Bold="True"></TabStyle>
<ContentCollection>
<dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="OtherDetail" Text="Other Detail">
<TabStyle Font-Bold="True"></TabStyle>
<ContentCollection>
<dxw:ContentControl runat="server"></dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="CorresPondence" Text="CorresPondence"><ContentCollection>
<dxw:ContentControl runat="server"><dxtc:ASPxPageControl runat="server" ActiveTabIndex="0" ID="ASPxPageControl2" ClientInstanceName="page" __designer:wfdid="w1"><TabPages>
<dxtc:TabPage Text="Adress"><ContentCollection>
<dxw:ContentControl runat="server"><dxwgv:ASPxGridView runat="server" Font-Size="10px" Width="100%" ID="AddressGrid" DataSourceID="Address" KeyFieldName="Id" AutoGenerateColumns="False" ClientInstanceName="gridAddress" __designer:wfdid="w2" OnCellEditorInitialize="AddressGrid_CellEditorInitialize">
<Templates><EditForm>
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

<SettingsEditing EditFormColumnCount="1" PopupEditFormHeight="350px" PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True" PopupEditFormWidth="700px" PopupEditFormVerticalAlign="WindowCenter" Mode="PopupEditForm"></SettingsEditing>

<SettingsText ConfirmDelete="Are You Want To Delete This Record ???" PopupEditFormCaption="Add/Modify Address"></SettingsText>

<Styles>
<Header SortingImageSpacing="5px" ImageSpacing="5px"></Header>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>
</Styles>

<Settings ShowTitlePanel="True" ShowStatusBar="Visible"></Settings>

<SettingsBehavior ConfirmDelete="True" ColumnResizeMode="NextColumn"></SettingsBehavior>

<SettingsPager PageSize="20" NumericButtonCount="20" ShowSeparators="True">
<FirstPageButton Visible="True"></FirstPageButton>

<LastPageButton Visible="True"></LastPageButton>
</SettingsPager>
<Columns>
<dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="0" FieldName="Id" Caption="Id">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataComboBoxColumn Visible="False" FieldName="Type" Caption="Address Type" VisibleIndex="0">
<PropertiesComboBox ValueType="System.String" EnableIncrementalFiltering="True"><Items>
<dxe:ListEditItem Value="Residence" Text="Residence"></dxe:ListEditItem>
<dxe:ListEditItem Value="Office" Text="Office"></dxe:ListEditItem>
<dxe:ListEditItem Value="Correspondence" Text="Correspondence"></dxe:ListEditItem>
</Items>
</PropertiesComboBox>

<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top"></EditFormCaptionStyle>

<EditFormSettings Visible="True" VisibleIndex="1"></EditFormSettings>
</dxwgv:GridViewDataComboBoxColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="0" FieldName="Type" Caption="Type">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="Address1" Caption="Address1">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top"></EditFormCaptionStyle>

<EditFormSettings Visible="True" VisibleIndex="2"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="Address2" Caption="Address2">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top"></EditFormCaptionStyle>

<EditFormSettings Visible="True" VisibleIndex="3"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="Address3" Caption="Address3">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top"></EditFormCaptionStyle>

<EditFormSettings Visible="True" VisibleIndex="4"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="4" FieldName="LandMark" Caption="LandMark">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top"></EditFormCaptionStyle>

<EditFormSettings Visible="True" VisibleIndex="5"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataComboBoxColumn Visible="False" FieldName="Country" Caption="Country" VisibleIndex="0">
<PropertiesComboBox ValueType="System.String" TextField="Country" ValueField="cou_id" EnableIncrementalFiltering="True" EnableSynchronization="False" DataSourceID="CountrySelect">
<ClientSideEvents SelectedIndexChanged="function(s, e) { OnCountryChanged(s); }"></ClientSideEvents>
</PropertiesComboBox>

<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top"></EditFormCaptionStyle>

<EditFormSettings Visible="True" VisibleIndex="6"></EditFormSettings>
</dxwgv:GridViewDataComboBoxColumn>
<dxwgv:GridViewDataComboBoxColumn Visible="False" FieldName="State" Caption="State" VisibleIndex="0">
<PropertiesComboBox ValueType="System.String" TextField="State" ValueField="ID" EnableIncrementalFiltering="True" EnableSynchronization="False" DataSourceID="StateSelect">
<ClientSideEvents SelectedIndexChanged="function(s, e) { OnStateChanged(s); }"></ClientSideEvents>
</PropertiesComboBox>

<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top"></EditFormCaptionStyle>

<EditFormSettings Visible="True" VisibleIndex="7"></EditFormSettings>
</dxwgv:GridViewDataComboBoxColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="5" FieldName="Country1" Caption="Country">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top"></EditFormCaptionStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="6" FieldName="State1" Caption="State">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top"></EditFormCaptionStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="7" FieldName="City1" Caption="City">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top"></EditFormCaptionStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataComboBoxColumn Visible="False" FieldName="City" Caption="City" VisibleIndex="0">
<PropertiesComboBox ValueType="System.String" TextField="City" ValueField="CityId" EnableIncrementalFiltering="True" EnableSynchronization="False" DataSourceID="SelectCity">
<ClientSideEvents SelectedIndexChanged="function(s, e) { OnCityChanged(s); }"></ClientSideEvents>
</PropertiesComboBox>

<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top"></EditFormCaptionStyle>

<EditFormSettings Visible="True" VisibleIndex="8"></EditFormSettings>
</dxwgv:GridViewDataComboBoxColumn>
<dxwgv:GridViewDataComboBoxColumn FieldName="area" Caption="Area" VisibleIndex="8">
<PropertiesComboBox ValueType="System.Int32" TextField="area_name" ValueField="area_id" EnableIncrementalFiltering="True" EnableSynchronization="False" DataSourceID="SelectArea"></PropertiesComboBox>

<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top"></EditFormCaptionStyle>

<EditFormSettings Caption="Area" Visible="True" VisibleIndex="9"></EditFormSettings>
</dxwgv:GridViewDataComboBoxColumn>
<dxwgv:GridViewDataHyperLinkColumn Visible="False" VisibleIndex="10"><EditItemTemplate>
                                                            <a href="#" onclick="javascript:openAreaPage();"><span class="Ecoheadtxt" style="color: Blue">
                                                                <strong>Add New Area</strong></span></a>
                                                        
</EditItemTemplate>

<EditFormSettings Visible="True" VisibleIndex="10"></EditFormSettings>
</dxwgv:GridViewDataHyperLinkColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="9" FieldName="PinCode" Caption="PinCode">
<CellStyle CssClass="gridcellleft"></CellStyle>

<PropertiesTextEdit>
<ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
<RequiredField IsRequired="True" ErrorText="PinCode Can Not Be Blank"></RequiredField>

<RegularExpression ErrorText="Enter Valid PinCode" ValidationExpression="[0-9]{6}"></RegularExpression>
</ValidationSettings>
</PropertiesTextEdit>

<EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top"></EditFormCaptionStyle>

<EditFormSettings Visible="True" VisibleIndex="11"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewCommandColumn VisibleIndex="10">
<DeleteButton Visible="True"></DeleteButton>
<HeaderTemplate>
                                                            <a href="javascript:void(0);" onclick="gridAddress.AddNewRow();"><span style="color: #000099;
                                                                text-decoration: underline">Add New</span> </a>
                                                        
</HeaderTemplate>

<EditButton Visible="True"></EditButton>
</dxwgv:GridViewCommandColumn>
</Columns>
</dxwgv:ASPxGridView>

 </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Text="Phone"><ContentCollection>
<dxw:ContentControl runat="server">                                                                                                      
                                            <dxwgv:ASPxGridView runat="server" Font-Size="10px" Width="100%" ID="PhoneGrid" DataSourceID="Phone" KeyFieldName="phf_id" AutoGenerateColumns="False" ClientInstanceName="gridPhone" OnRowValidating="PhoneGrid_RowValidating">
<Templates><EditForm>
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
                                                                        <%--<dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                                                            runat="server">
                                                                        </dxwgv:ASPxGridViewTemplateReplacement>--%>
                                                                         <a id="update" href="#"onclick="OnPhoneClick()" >Update</a>
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

<SettingsEditing EditFormColumnCount="1" PopupEditFormHeight="350px" PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True" PopupEditFormWidth="700px" PopupEditFormVerticalAlign="WindowCenter" Mode="PopupEditForm"></SettingsEditing>

<SettingsText ConfirmDelete="Are You Want To Delete This Record ???" PopupEditFormCaption="Add/Modify Address"></SettingsText>

<Styles>
<Header SortingImageSpacing="5px" ImageSpacing="5px"></Header>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>
</Styles>

<Settings ShowTitlePanel="True" ShowStatusBar="Visible"></Settings>

<SettingsBehavior ConfirmDelete="True" ColumnResizeMode="NextColumn"></SettingsBehavior>

<SettingsPager PageSize="20" NumericButtonCount="20" ShowSeparators="True">
<FirstPageButton Visible="True"></FirstPageButton>

<LastPageButton Visible="True"></LastPageButton>
</SettingsPager>
<Columns>
<dxwgv:GridViewDataTextColumn Visible="False" ReadOnly="True" VisibleIndex="0" FieldName="phf_id">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn Visible="False" ReadOnly="True" VisibleIndex="0" FieldName="phf_cntId">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn Visible="False" ReadOnly="True" VisibleIndex="0" FieldName="phf_entity">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataComboBoxColumn Visible="False" FieldName="phf_type" Caption="Phone Type" VisibleIndex="0">
<PropertiesComboBox ValueType="System.String" EnableIncrementalFiltering="True">
<ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
<RequiredField IsRequired="True" ErrorText="Select Phone Type"></RequiredField>
</ValidationSettings>

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
}" SelectedIndexChanged="function(s, e) {
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
}"></ClientSideEvents>
<Items>
<dxe:ListEditItem Value="Residence" Text="Residence"></dxe:ListEditItem>
<dxe:ListEditItem Value="Office" Text="Office"></dxe:ListEditItem>
<dxe:ListEditItem Value="Correspondence" Text="Correspondence"></dxe:ListEditItem>
<dxe:ListEditItem Value="Mobile" Text="Mobile"></dxe:ListEditItem>
<dxe:ListEditItem Value="Fax" Text="Fax"></dxe:ListEditItem>
</Items>
</PropertiesComboBox>

<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top"></EditFormCaptionStyle>

<EditFormSettings Visible="True"></EditFormSettings>
</dxwgv:GridViewDataComboBoxColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="0" FieldName="phf_type" Width="40%" Caption="Type">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormSettings Caption="Phone Type" Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="1" FieldName="phf_countryCode">
<PropertiesTextEdit>
<ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
<RegularExpression ErrorText="Enter Valid CountryCode" ValidationExpression="[0-9]+"></RegularExpression>
</ValidationSettings>
</PropertiesTextEdit>

<EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top"></EditFormCaptionStyle>

<EditFormSettings Caption="Country Code" Visible="True"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="1" FieldName="phf_areaCode">
<PropertiesTextEdit>
<ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
<RegularExpression ErrorText="Enter Valid AreaCode" ValidationExpression="[0-9]+"></RegularExpression>
</ValidationSettings>
</PropertiesTextEdit>

<EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top"></EditFormCaptionStyle>

<EditFormSettings Caption="Area Code" Visible="True"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="1" FieldName="phf_phoneNumber" Caption="Number">
<CellStyle CssClass="gridcellleft"></CellStyle>

<PropertiesTextEdit>
<ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
<RequiredField IsRequired="True" ErrorText="Please Enter Phone Number"></RequiredField>

<RegularExpression ErrorText="Enter Valid PhoneNumber" ValidationExpression="[0-9]+"></RegularExpression>
</ValidationSettings>
</PropertiesTextEdit>

<EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top"></EditFormCaptionStyle>

<EditFormSettings Visible="True"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="Number" Width="40%" Caption="Phone Number">
<CellStyle CssClass="gridcellleft"></CellStyle>

<PropertiesTextEdit>
<ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
<RequiredField IsRequired="True" ErrorText="Please Enter Phone Number"></RequiredField>

<RegularExpression ErrorText="Enter Valid PhoneNumber" ValidationExpression="[0-9]+"></RegularExpression>
</ValidationSettings>
</PropertiesTextEdit>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="2" FieldName="phf_extension" Caption="Extension">
<CellStyle CssClass="gridcellleft"></CellStyle>

<PropertiesTextEdit>
<ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
<RegularExpression ErrorText="Enter Valid Extension" ValidationExpression="[0-9]+"></RegularExpression>
</ValidationSettings>
</PropertiesTextEdit>

<EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top"></EditFormCaptionStyle>

<EditFormSettings Visible="True"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewCommandColumn VisibleIndex="2">
<DeleteButton Visible="True"></DeleteButton>
<HeaderTemplate>
                                                            <a href="javascript:void(0);" onclick="gridPhone.AddNewRow();"><span style="color: #000099;
                                                                text-decoration: underline">Add New</span> </a>
                                                        
</HeaderTemplate>

<EditButton Visible="True"></EditButton>
</dxwgv:GridViewCommandColumn>
</Columns>
</dxwgv:ASPxGridView>



                                                                    </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Text="Email"><ContentCollection>
<dxw:ContentControl runat="server"> 
                                            <dxwgv:ASPxGridView runat="server" Font-Size="10px" Width="100%" ID="EmailGrid" DataSourceID="Email" KeyFieldName="eml_id" AutoGenerateColumns="False" ClientInstanceName="gridEmail" OnRowValidating="EmailGrid_RowValidating">
<Templates><EditForm>
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
                                                                       <%-- <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                                                            runat="server">
                                                                        </dxwgv:ASPxGridViewTemplateReplacement>--%>
                                                                         <a id="update1" href="#"onclick="OnEmailClick()" >Update</a>
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

<SettingsEditing EditFormColumnCount="1" PopupEditFormHeight="350px" PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True" PopupEditFormWidth="700px" PopupEditFormVerticalAlign="WindowCenter" Mode="PopupEditForm"></SettingsEditing>

<SettingsText ConfirmDelete="Are You Want To Delete This Record ???" PopupEditFormCaption="Add/Modify Address"></SettingsText>

<Styles>
<Header SortingImageSpacing="5px" ImageSpacing="5px"></Header>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>
</Styles>

<Settings ShowTitlePanel="True" ShowStatusBar="Visible"></Settings>

<SettingsBehavior ConfirmDelete="True" ColumnResizeMode="NextColumn"></SettingsBehavior>

<SettingsPager PageSize="20" NumericButtonCount="20" ShowSeparators="True">
<FirstPageButton Visible="True"></FirstPageButton>

<LastPageButton Visible="True"></LastPageButton>
</SettingsPager>
<Columns>
<dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="1" FieldName="eml_id">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataComboBoxColumn Visible="False" FieldName="eml_type" Caption="Email Type" VisibleIndex="0">
<PropertiesComboBox ValueType="System.String" EnableIncrementalFiltering="True">
<ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
<RequiredField IsRequired="True" ErrorText="Select Type"></RequiredField>
</ValidationSettings>

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
}" SelectedIndexChanged="function(s, e) {
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
<dxe:ListEditItem Value="Personal" Text="Personal"></dxe:ListEditItem>
<dxe:ListEditItem Value="Official" Text="Official"></dxe:ListEditItem>
<dxe:ListEditItem Value="Web Site" Text="Web Site"></dxe:ListEditItem>
</Items>
</PropertiesComboBox>

<EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top"></EditFormCaptionStyle>

<EditFormSettings Visible="True"></EditFormSettings>
</dxwgv:GridViewDataComboBoxColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="0" FieldName="eml_type" Width="27%" Caption="Type">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormSettings Caption="Email Type" Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="eml_email" Caption="Email">
<CellStyle CssClass="gridcellleft"></CellStyle>

<PropertiesTextEdit>
<ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
<RegularExpression ErrorText="Enetr Valid E-Mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></RegularExpression>
</ValidationSettings>
</PropertiesTextEdit>

<EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top"></EditFormCaptionStyle>

<EditFormSettings Caption="EmailId" Visible="True"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="1" FieldName="eml_ccEmail">
<PropertiesTextEdit>
<ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
<RegularExpression ErrorText="Enetr Valid CC EMail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></RegularExpression>
</ValidationSettings>
</PropertiesTextEdit>

<EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top"></EditFormCaptionStyle>

<EditFormSettings Caption="CC Email" Visible="True"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="eml_website" Caption="WebURL">
<EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top"></EditFormCaptionStyle>

<EditFormSettings Caption="WebURL" Visible="True"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewCommandColumn VisibleIndex="3">
<DeleteButton Visible="True"></DeleteButton>
<HeaderTemplate>
                                                            <a href="javascript:void(0);" onclick="gridEmail.AddNewRow();"><span style="color: #000099;
                                                                text-decoration: underline">Add New</span> </a>
                                                        
</HeaderTemplate>

<EditButton Visible="True"></EditButton>
</dxwgv:GridViewCommandColumn>
</Columns>
</dxwgv:ASPxGridView>



                                                                                           </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
</TabPages>
</dxtc:ASPxPageControl>
 </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="Subcriptions" Text="Subcriptions">
<TabStyle Font-Bold="True"></TabStyle>
<ContentCollection>
<dxw:ContentControl runat="server"></dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
</tabpages>
                    </dxtc:ASPxPageControl>
                    <asp:SqlDataSource ID="Address" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                        SelectCommand="insert_correspondence_IfBlank" SelectCommandType="StoredProcedure"
                        InsertCommand="insert_correspondence" InsertCommandType="StoredProcedure" UpdateCommand="update tbl_master_address set add_addressType=@Type,add_address1=@Address1,add_address2=@Address2,add_address3=@Address3,add_city=@City,add_landMark=@LandMark,add_country=@Country,add_state=@State,add_area=@area,add_pin=@PinCode,LastModifyDate=getdate(),LastModifyUser=@CreateUser where add_id=@Id">
                        <SelectParameters>
                            <asp:SessionParameter Name="insuId" SessionField="KeyVal_InternalID" Type="String" />
                         </SelectParameters>
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="decimal" />
                            <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="Decimal" />
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
                        DeleteCommand="delete from tbl_master_phonefax where phf_id=@phf_id and phf_id not in(select TopicSubscriptions_PhoneID from Trans_TopicSubscriptions where TopicSubscriptions_PhoneID=@phf_id)" InsertCommand="insert_correspondence_phone"
                        InsertCommandType="StoredProcedure" SelectCommand="select DISTINCT phf_id,phf_cntId,phf_entity,phf_type,phf_countryCode,phf_areaCode,phf_phoneNumber,phf_extension, ISNULL(phf_countryCode, '') + ' ' + ISNULL(phf_areaCode, '') + ' ' + ISNULL(phf_phoneNumber, '') +' '+ ISNULL(phf_extension, '') + ISNULL(phf_faxNumber, '') AS Number 
                      from tbl_master_phonefax where phf_cntId=@PhfId" UpdateCommand="update tbl_master_phonefax set phf_type=@phf_type,phf_countryCode=@phf_countryCode,phf_areaCode=@phf_areaCode,phf_phoneNumber=@phf_phoneNumber,
                       phf_extension=@phf_extension,LastModifyDate=getdate(),LastModifyUser=@CreateUser where phf_id=@phf_id">
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
                        DeleteCommand="delete from tbl_master_email where eml_id=@eml_id and eml_id not in(select TopicSubscriptions_EmailID from Trans_TopicSubscriptions where TopicSubscriptions_EmailID=@eml_id)" InsertCommand="insert_correspondence_email"
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
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
