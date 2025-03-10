<%@ page language="C#" autoeventwireup="true" inherits="management_frmNsdlClients_Subscriptions, App_Web_ko_nrypx" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>

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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

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
            document.location.href="frmNsdlClients_Corrospondance.aspx?"+spQrStr;
        }
        else if ( name == "tab9")
        {
            
        }
             
    }
    function BindCombo()
    {
       dpModeClient.PerformCallback();
       dpFrequencyClient.PerformCallback();
       dpNotificationClient.PerformCallback();
       dpPhoneNoClient.PerformCallback();
       dpEmailClient.PerformCallback();
    }

 function BindComboForPhoneEmail(obj)
 {
        dpPhoneNoClient.PerformCallback();
        dpEmailClient.PerformCallback();
        ModeSms=obj;
        VisibleMailPhone(ModeSms)
 }
 function VisibleMailPhone(obj)
 {
    if(obj=='E')
    {    
        document.getElementById("TdPhone").style.display='none';
        document.getElementById("TdPhoneLabel").style.display='none';
        document.getElementById("TdEmail").style.display='inline';
        document.getElementById("TdEmailLabel").style.display='inline';
        
    }
    else if(obj=='S')
    {
        document.getElementById("TdEmail").style.display='none';
        document.getElementById("TdEmailLabel").style.display='none';
        document.getElementById("Tdphone").style.display='inline';
        document.getElementById("TdPhoneLabel").style.display='inline';
    }
    else
    {
        document.getElementById("TdEmail").style.display='inline';
        document.getElementById("TdEmailLabel").style.display='inline';
        document.getElementById("Tdphone").style.display='inline';
        document.getElementById("TdPhoneLabel").style.display='inline';
    }
        
}
function DisableDescription(obj)
{
    
    if(obj!="")
    {
       var a=obj.split('~');
       if(a[0,0]=='UPDATE')
       {       
             dpDescription.SetEnabled(false);
             
             if(a[0,1]=='S')
             {
                document.getElementById("TdEmail").style.display='none';
                document.getElementById("TdEmailLabel").style.display='none';
                document.getElementById("Tdphone").style.display='inline';
                document.getElementById("TdPhoneLabel").style.display='inline';
             }
             else if(a[0,1]=='E')
             {
                document.getElementById("TdPhone").style.display='none';
                document.getElementById("TdPhoneLabel").style.display='none';
                document.getElementById("TdEmail").style.display='inline';
                document.getElementById("TdEmailLabel").style.display='inline';
             }
            
              VisibilyOfFreeMessage(a[0,2]);
       }
    } 
    if(obj=='visible')
    {
        VisibilyOfFreeMessage('N');
    }
 }
 function VisibilyOfFreeMessage(obj)
 {
   
    if(obj=='N')
    {
        document.getElementById("tdFreeMessage").style.display='none';
        document.getElementById("tdFreeMessageLabel").style.display='none';
        
    }
    else if(obj=='Y')
    {
       document.getElementById("tdFreeMessage").style.display='inline';
       document.getElementById("tdFreeMessageLabel").style.display='inline';
    }
 }
  function BindTextBoxWithId(obj)
 {
//    alert(obj);
   AccIDClient.SetValue(obj);

 }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table>
            <tr>
                <td>
                    <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="9" ClientInstanceName="page"
                        Width="100%">
                        <LoadingPanelStyle ImageSpacing="6px">
                        </LoadingPanelStyle>
                        <ContentStyle>
                            <Border BorderWidth="1px" BorderStyle="Solid" BorderColor="#002D96"></Border>
                        </ContentStyle>
                        <ClientSideEvents ActiveTabChanged="function(s, e) {
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
	                                           
	                                            }"></ClientSideEvents>
                        <TabPages>
                            <dxtc:TabPage Name="General" Text="General">
                                <TabStyle Font-Bold="True">
                                </TabStyle>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="JointHolders" Text="Joint Holders">
                                <TabStyle Font-Bold="True">
                                </TabStyle>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="BankDetail" Text="Bank Detail">
                                <TabStyle Font-Bold="True">
                                </TabStyle>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Nominee_POA" Text="Nominee &amp; POA">
                                <TabStyle Font-Bold="True">
                                </TabStyle>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Documents" Text="Documents">
                                <TabStyle Font-Bold="True">
                                </TabStyle>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Groups" Text="Groups">
                                <TabStyle Font-Bold="True">
                                </TabStyle>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Remarks" Text="Remarks">
                                <TabStyle Font-Bold="True">
                                </TabStyle>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="OtherDetail" Text="Other Detail">
                                <TabStyle Font-Bold="True">
                                </TabStyle>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Correpondance" Text="Correpondance">
                                <TabStyle Font-Bold="True">
                                </TabStyle>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Subcriptions" Text="Subcriptions">
                                <TabStyle Font-Bold="True">
                                </TabStyle>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                        <dxwgv:ASPxGridView ID="gridSubscription" runat="server" AutoGenerateColumns="False"
                                            Width="100%" ClientInstanceName="gridSubscription" DataSourceID="SqlSubscriptions"
                                            KeyFieldName="topicsubscriptions_id" OnRowInserting="gridSubscription_RowInserting"
                                            OnRowUpdating="gridSubscription_RowUpdating" OnStartRowEditing="gridSubscription_StartRowEditing"
                                            OnCustomJSProperties="gridSubscription_CustomJSProperties1" OnRowDeleting="gridSubscription_RowDeleting"
                                            OnHtmlEditFormCreated="gridSubscription_HtmlEditFormCreated" OnRowValidating="gridSubscription_RowValidating" OnCancelRowEditing="gridSubscription_CancelRowEditing">
                                            <Styles>
                                                <LoadingPanel ImageSpacing="10px">
                                                </LoadingPanel>
                                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                </Header>
                                            </Styles>
                                            <Settings ShowTitlePanel="True" ShowFooter="True" ShowStatusBar="Visible" ShowGroupPanel="True" />
                                            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
                                            <SettingsPager ShowSeparators="True" AlwaysShowPager="True" NumericButtonCount="20"
                                                PageSize="20">
                                                <FirstPageButton Visible="True">
                                                </FirstPageButton>
                                                <LastPageButton Visible="True">
                                                </LastPageButton>
                                            </SettingsPager>
                                            <Columns>
                                                <dxwgv:GridViewDataTextColumn FieldName="topicsubscriptions_id" Visible="False" ReadOnly="True"
                                                    VisibleIndex="0">
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="Topic Code" FieldName="TopicSubscriptions_TopicCode"
                                                    Visible="False" ReadOnly="True" VisibleIndex="0">
                                                    <EditFormCaptionStyle Wrap="False" HorizontalAlign="Left">
                                                    </EditFormCaptionStyle>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataComboBoxColumn Caption="Description" FieldName="topics_description"
                                                    VisibleIndex="0">
                                                    <EditFormSettings Visible="True" />
                                                    <CellStyle CssClass="gridcellleft">
                                                    </CellStyle>
                                                    <EditFormCaptionStyle Wrap="False" HorizontalAlign="Left">
                                                    </EditFormCaptionStyle>
                                                    <PropertiesComboBox ValueType="System.String">
                                                    </PropertiesComboBox>
                                                </dxwgv:GridViewDataComboBoxColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="Notification Method" FieldName="TopicSubscriptions_NotificationMethod"
                                                    VisibleIndex="1">
                                                    <EditFormSettings Visible="True" />
                                                    <CellStyle CssClass="gridcellleft">
                                                    </CellStyle>
                                                    <EditFormCaptionStyle Wrap="False" HorizontalAlign="Left">
                                                    </EditFormCaptionStyle>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="Delivery Mode" FieldName="TopicSubscriptions_DeliveryMode"
                                                    VisibleIndex="2">
                                                    <EditFormSettings Visible="True" />
                                                    <CellStyle CssClass="gridcellleft">
                                                    </CellStyle>
                                                    <EditFormCaptionStyle Wrap="False" HorizontalAlign="Left">
                                                    </EditFormCaptionStyle>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="Delivery Frequency" FieldName="TopicSubscriptions_DeliveryFrequency"
                                                    VisibleIndex="3">
                                                    <EditFormSettings Visible="True" />
                                                    <CellStyle CssClass="gridcellleft">
                                                    </CellStyle>
                                                    <EditFormCaptionStyle Wrap="False" HorizontalAlign="Left">
                                                    </EditFormCaptionStyle>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="Start Date" FieldName="TopicSubscriptions_StartDate"
                                                    VisibleIndex="4">
                                                    <EditFormSettings Visible="True" />
                                                    <EditFormCaptionStyle Wrap="False" HorizontalAlign="Left">
                                                    </EditFormCaptionStyle>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="End Date" FieldName="TopicSubscriptions_EndDate"
                                                    VisibleIndex="5">
                                                    <EditFormSettings Visible="True" />
                                                    <EditFormCaptionStyle Wrap="False" HorizontalAlign="Left">
                                                    </EditFormCaptionStyle>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewCommandColumn VisibleIndex="6">
                                                    <HeaderTemplate>
                                                        <a href="javascript:void(0);" onclick="gridSubscription.AddNewRow();"><span style="color: #000099;
                                                            text-decoration: underline">Add New</span> </a>
                                                    </HeaderTemplate>
                                                    <EditButton Visible="True">
                                                    </EditButton>
                                                    <DeleteButton Visible="True">
                                                    </DeleteButton>
                                                </dxwgv:GridViewCommandColumn>
                                            </Columns>
                                            <Templates>
                                                <EditForm>
                                                    <table class="TableMain100">
                                                        <tr>
                                                            <td style="border: solid 1px blue; width: 80%">
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="Label1" runat="server" Text="Topic:"></asp:Label>
                                                                        </td>
                                                                        <td colspan="3" width="700px">
                                                                            <dxe:ASPxComboBox ID="dpDescription" runat="server" DataSourceID="sqlDescription"
                                                                                ValueField="topics_code" TextField="topics_description" ClientInstanceName="dpDescription"
                                                                                Width="100%">
                                                                                <ClientSideEvents SelectedIndexChanged="function(s,e){BindCombo()}" />
                                                                            </dxe:ASPxComboBox>
                                                                        </td>
                                                                    </tr>
                                                                         <tr>
                                                                        <td>
                                                                            <asp:Label ID="Label11" runat="server" Text="Access Code:"></asp:Label></td>
                                                                        <td colspan="3" width="700px">
                                                                            <dxe:ASPxTextBox ID="txtAccID" runat="server" ReadOnly="true" ClientInstanceName="AccIDClient"
                                                                                Width="100%">
                                                                            </dxe:ASPxTextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="Label4" runat="server" Text="Notification Method:"></asp:Label>
                                                                        </td>
                                                                        <td colspan="3" width="700px">
                                                                            <dxe:ASPxComboBox ID="dpNotification" runat="server" DataSourceID="sqlNotification"
                                                                                ValueField="col" TextField="Notification" ClientInstanceName="dpNotificationClient"
                                                                                Width="100%" OnCallback="dpNotification_Callback">
                                                                            </dxe:ASPxComboBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="Label2" runat="server" Text="Mode:"></asp:Label>
                                                                        </td>
                                                                        <td width="300px">
                                                                            <dxe:ASPxComboBox ID="dpMode" runat="server" DataSourceID="sqlMode" ValueField="col"
                                                                                TextField="Descriptions" OnCallback="dpMode_Callback" ClientInstanceName="dpModeClient"
                                                                                Width="100%">
                                                                                <ClientSideEvents SelectedIndexChanged="function(s,e){BindComboForPhoneEmail(s.GetValue())}"
                                                                                    EndCallback="function(s,e){BindComboForPhoneEmail(s.GetValue())}" />
                                                                            </dxe:ASPxComboBox>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="Label3" runat="server" Text="Frequency:"></asp:Label>
                                                                        </td>
                                                                      <td width="300px">
                                                                            <dxe:ASPxComboBox ID="dpFrequency" runat="server" DataSourceID="sqlFrequency" ValueField="col"
                                                                                TextField="Frequency" ClientInstanceName="dpFrequencyClient" OnCallback="dpFrequency_Callback"
                                                                                OnCustomJSProperties="dpFrequency_CustomJSProperties" Width="100%">
                                                                                <ClientSideEvents EndCallback="function(s,e){BindTextBoxWithId(s.cpValueCombo1)}" />
                                                                            </dxe:ASPxComboBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td id="TdPhoneLabel">
                                                                            <asp:Label ID="Label7" runat="server" Text="Phone Number:"></asp:Label>
                                                                        </td>
                                                                        <td id="TdPhone" width="300px">
                                                                            <dxe:ASPxComboBox ID="dpPhoneNo" runat="server" DataSourceID="sqlPhone" ValueField="col"
                                                                                Width="100%" TextField="Phone" ClientInstanceName="dpPhoneNoClient" OnCallback="dpPhoneNo_Callback">
                                                                            </dxe:ASPxComboBox>
                                                                        </td>
                                                                        <td id="TdEmailLabel">
                                                                            <asp:Label ID="Label8" runat="server" Text="Email Id:"></asp:Label>
                                                                        </td>
                                                                        <td id="TdEmail" width="300px">
                                                                            <dxe:ASPxComboBox ID="dpEmail" runat="server" DataSourceID="sqlEmail" ValueField="col"
                                                                                Width="100%" TextField="email" ClientInstanceName="dpEmailClient" OnCallback="dpEmail_Callback">
                                                                            </dxe:ASPxComboBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="Label9" runat="server" Text="Chargeable:"></asp:Label>
                                                                        </td>
                                                                        <td width="300px">
                                                                            <dxe:ASPxComboBox ID="dpchargeable" runat="server" ValueField="col" TextField="Charge"
                                                                                SelectedIndex="1" Width="100%" ClientInstanceName="dpChargeClient" OnCustomJSProperties="dpchargeable_CustomJSProperties">
                                                                                <Items>
                                                                                    <dxe:ListEditItem Text="Yes" Value="Y" />
                                                                                    <dxe:ListEditItem Text="No" Value="N" />
                                                                                </Items>
                                                                                <ClientSideEvents SelectedIndexChanged="function(s,e){VisibilyOfFreeMessage(s.GetValue());}"
                                                                                    EndCallback="function(s,e){VisibilyOfFreeMessage(s.cpa);}" />
                                                                            </dxe:ASPxComboBox>
                                                                        </td>
                                                                        <td id="tdFreeMessageLabel">
                                                                            <asp:Label ID="Label10" runat="server" Text="Free Messages:"></asp:Label>
                                                                        </td>
                                                                        <td id="tdFreeMessage" width="300px">
                                                                            <dxe:ASPxTextBox ID="txtFreeMessage" runat="server" ClientInstanceName="txtFreeMessageClient"
                                                                                Width="100%">
                                                                            </dxe:ASPxTextBox>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="Label5" runat="server" Text="Start Date:"></asp:Label>
                                                                        </td>
                                                                        <td width="300px">
                                                                            <dxe:ASPxDateEdit ID="ASPxStartDate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                                                Width="100%" EditFormatString="dd-MM-yyyy">
                                                                                <ButtonStyle Width="13px">
                                                                                </ButtonStyle>
                                                                            </dxe:ASPxDateEdit>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="Label6" runat="server" Text="End Date:"></asp:Label>
                                                                        </td>
                                                                        <td width="300px">
                                                                            <dxe:ASPxDateEdit ID="ASPxDateTo" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                                                EditFormatString="dd-MM-yyyy" Width="100%">
                                                                                <ButtonStyle Width="13px">
                                                                                </ButtonStyle>
                                                                            </dxe:ASPxDateEdit>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <div style="text-align: right; padding: 2px 2px 2px 2px">
                                                                    <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                                                        runat="server">
                                                                    </dxwgv:ASPxGridViewTemplateReplacement>
                                                                    <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                                                        runat="server">
                                                                    </dxwgv:ASPxGridViewTemplateReplacement>
                                                                </div>
                                                                <asp:SqlDataSource ID="sqlDescription" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                                                                    SelectCommand="select topics_code,topics_description from [Master_Topics] where (topics_applicableentity='D' or topics_applicableentity='X') and topics_subscriptionrequired='Y' and topics_status='E' order by topics_description">
                                                                </asp:SqlDataSource>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </EditForm>
                                            </Templates>
                                            <ClientSideEvents EndCallback="function(s,e){DisableDescription(s.cpValue);}" />
                                        </dxwgv:ASPxGridView>
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                        </TabPages>
                    </dxtc:ASPxPageControl>
                    <asp:SqlDataSource ID="SqlSubscriptions" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                        SelectCommand="select a.topicsubscriptions_id,a.TopicSubscriptions_TopicCode,b.topics_description,case a.TopicSubscriptions_DeliveryMode when 'E' then 'Email' when 'M' then 'Message' when 'B' then 'Email & SMS' when 'S' then 'SMS' else 'Reminder' end as TopicSubscriptions_DeliveryMode,case a.TopicSubscriptions_NotificationMethod when 'A' then 'Auto' when 'B' then 'Both' else 'On Request' end as TopicSubscriptions_NotificationMethod,case a.TopicSubscriptions_DeliveryFrequency when 'E' then 'Upon Event' when 'D' then 'Daily' when 'F' then 'Fort Nightly' when 'M' then 'Monthly'  when 'Q' then 'Quaterly' when 'W' then 'Weekly' else 'Yearly' end as TopicSubscriptions_DeliveryFrequency,a.TopicSubscriptions_PhoneID,a.TopicSubscriptions_EmailID,convert(varchar(2),a.TopicSubscriptions_StartDate,103)+'/'+convert(varchar(3),TopicSubscriptions_StartDate,107) +'/'+ convert(varchar(4),a.TopicSubscriptions_StartDate,120) as TopicSubscriptions_StartDate,case TopicSubscriptions_EndDate when '1900-01-01 00:00:00.000' then '' else convert(varchar(2),a.TopicSubscriptions_EndDate,103)+'/'+convert(varchar(3),a.TopicSubscriptions_EndDate,107) +'/'+ convert(varchar(4),a.TopicSubscriptions_EndDate,120)  end as TopicSubscriptions_EndDate from Trans_TopicSubscriptions as a inner join Master_Topics as b on b.topics_code=a.TopicSubscriptions_TopicCode where a.TopicSubscriptions_ContactID= @internalID "
                        InsertCommand="insert into table1 values(1)" UpdateCommand="update table1 set temp123=1">
                        <SelectParameters>
                            <asp:SessionParameter Name="internalID" SessionField="KeyVal_InternalID" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="sqlMode" runat="server" ConflictDetection="CompareAllValues"
                        ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" SelectCommand="">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="sqlFrequency" runat="server" ConflictDetection="CompareAllValues"
                        ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" SelectCommand="">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="sqlNotification" runat="server" ConflictDetection="CompareAllValues"
                        ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" SelectCommand="">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="sqlPhone" runat="server" ConflictDetection="CompareAllValues"
                        ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" SelectCommand="">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="sqlEmail" runat="server" ConflictDetection="CompareAllValues"
                        ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" SelectCommand="">
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
