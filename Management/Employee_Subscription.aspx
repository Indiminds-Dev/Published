<%@ page language="C#" autoeventwireup="true" inherits="management_Employee_Subscription, App_Web_yxggcryg" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <script language="javascript" type="text/javascript">
    function disp_prompt(name)
    {
//        alert(name);
        if ( name == "tab0")
        {
        //alert(name);
        document.location.href="Employee_general.aspx"; 
        }
        if ( name == "tab1")
        {
        //alert(name);
        document.location.href="Employee_Correspondence.aspx"; 
        }
        else if ( name == "tab2")
        {
        //alert(name);
        document.location.href="Employee_BankDetails.aspx"; 
        }
        else if ( name == "tab3")
        {
        //alert(name);
        document.location.href="Employee_DPDetails.aspx"; 
        }
        else if ( name == "tab4")
        {
        //alert(name);
        document.location.href="Employee_Document.aspx"; 
        }
        else if ( name == "tab5")
        {
        //alert(name);
        document.location.href="Employee_FamilyMembers.aspx"; 
        }
        else if ( name == "tab6")
        {
        //alert(name);
        document.location.href="Employee_Registration.aspx"; 
        }
        else if ( name == "tab7")
        {
        //alert(name);
        document.location.href="Employee_GroupMember.aspx"; 
        }
        else if ( name == "tab8")
        {
        //alert(name);
        document.location.href="Employee_Employee.aspx"; 
        }
        else if ( name == "tab9")
        {
        //alert(name);
        document.location.href="Employee_EmployeeCTC.aspx"; 
        }
        else if ( name == "tab10")
        {
        //alert(name);
        document.location.href="Employee_Remarks.aspx"; 
        }
        else if ( name == "tab11")
        {
        //alert(name);
        document.location.href="Employee_Education.aspx";
        }
          else if ( name == "tab12")
        {
        //alert(name);
        document.location.href="Employee_Subscription.aspx";
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
        <table class="TableMain100">
            <tr>
                <td style="text-align: center">
                    <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="15px" ForeColor="Navy"
                        Width="819px" Height="18px"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="12" ClientInstanceName="page">
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
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Bank Details" Text="Bank">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="DP Details" Text="DP">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Documents" Text="Documents">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Family Members" Text="Family">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Registration" Text="Registration">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Group Member" Text="Group">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Employee" Text="Employee">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Employee CTC" Text="CTC">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Remarks" Text="Remarks">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Education" Text="Education">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Subscription" Text="Subscription">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                        <dxwgv:ASPxGridView runat="server" Width="100%" ID="gridSubscription" DataSourceID="SqlSubscriptions"
                                            KeyFieldName="topicsubscriptions_id" AutoGenerateColumns="False" ClientInstanceName="gridSubscription"
                                            OnRowValidating="gridSubscription_RowValidating" OnRowDeleting="gridSubscription_RowDeleting"
                                            OnCustomJSProperties="gridSubscription_CustomJSProperties1" OnStartRowEditing="gridSubscription_StartRowEditing"
                                            OnRowUpdating="gridSubscription_RowUpdating" OnRowInserting="gridSubscription_RowInserting"
                                            OnInit="gridSubscription_Init" OnInitNewRow="gridSubscription_InitNewRow" OnHtmlEditFormCreated="gridSubscription_HtmlEditFormCreated" OnCancelRowEditing="gridSubscription_CancelRowEditing">
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
                                                                        <td colspan="3">
                                                                            <dxe:ASPxComboBox ID="dpDescription" runat="server" DataSourceID="sqlDescription"
                                                                                EnableIncrementalFiltering="true" ValueField="topics_code" TextField="topics_description"
                                                                                ClientInstanceName="dpDescription" Width="100%">
                                                                                <ClientSideEvents SelectedIndexChanged="function(s,e){BindCombo()}" />
                                                                            </dxe:ASPxComboBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="Label11" runat="server" Text="Access Code:"></asp:Label></td>
                                                                        <td colspan="3" >
                                                                            <dxe:ASPxTextBox ID="txtAccID" runat="server" ReadOnly="true" ClientInstanceName="AccIDClient"
                                                                                Width="100%">
                                                                            </dxe:ASPxTextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="Label4" runat="server" Text="Notification Method:"></asp:Label>
                                                                        </td>
                                                                        <td colspan="3">
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
                                                                        <td>
                                                                            <dxe:ASPxComboBox ID="dpMode" runat="server" DataSourceID="sqlMode" ValueField="col"
                                                                                TextField="Descriptions" OnCallback="dpMode_Callback" ClientInstanceName="dpModeClient">
                                                                                <ClientSideEvents SelectedIndexChanged="function(s,e){BindComboForPhoneEmail(s.GetValue())}"
                                                                                    EndCallback="function(s,e){BindComboForPhoneEmail(s.GetValue())}" />
                                                                            </dxe:ASPxComboBox>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="Label3" runat="server" Text="Frequency:"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <dxe:ASPxComboBox ID="dpFrequency" runat="server" DataSourceID="sqlFrequency" ValueField="col"
                                                                                TextField="Frequency" ClientInstanceName="dpFrequencyClient" OnCallback="dpFrequency_Callback" OnCustomJSProperties="dpFrequency_CustomJSProperties">
                                                                                 <ClientSideEvents EndCallback="function(s,e){BindTextBoxWithId(s.cpValueCombo1)}" />
                                                                                 
                                                                            </dxe:ASPxComboBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td id="TdPhoneLabel">
                                                                            <asp:Label ID="Label7" runat="server" Text="Phone Number:"></asp:Label>
                                                                        </td>
                                                                        <td id="TdPhone">
                                                                            <dxe:ASPxComboBox ID="dpPhoneNo" runat="server" DataSourceID="sqlPhone" ValueField="col"
                                                                                TextField="Phone" ClientInstanceName="dpPhoneNoClient" OnCallback="dpPhoneNo_Callback">
                                                                            </dxe:ASPxComboBox>
                                                                        </td>
                                                                        <td id="TdEmailLabel">
                                                                            <asp:Label ID="Label8" runat="server" Text="Email Id:"></asp:Label>
                                                                        </td>
                                                                        <td id="TdEmail">
                                                                            <dxe:ASPxComboBox ID="dpEmail" runat="server" DataSourceID="sqlEmail" ValueField="col"
                                                                                TextField="email" ClientInstanceName="dpEmailClient" OnCallback="dpEmail_Callback">
                                                                            </dxe:ASPxComboBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="Label9" runat="server" Text="Chargeable:"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <dxe:ASPxComboBox ID="dpchargeable" runat="server" ValueField="col" TextField="Charge"
                                                                                SelectedIndex="1" ClientInstanceName="dpChargeClient" OnCustomJSProperties="dpchargeable_CustomJSProperties">
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
                                                                        <td id="tdFreeMessage">
                                                                            <dxe:ASPxTextBox ID="txtFreeMessage" runat="server" ClientInstanceName="txtFreeMessageClient">
                                                                            </dxe:ASPxTextBox>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="Label5" runat="server" Text="Start Date:"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <dxe:ASPxDateEdit ID="ASPxStartDate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                                                Width="171px" EditFormatString="dd-MM-yyyy">
                                                                                <ButtonStyle Width="13px">
                                                                                </ButtonStyle>
                                                                            </dxe:ASPxDateEdit>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="Label6" runat="server" Text="End Date:"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <dxe:ASPxDateEdit ID="ASPxDateTo" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                                                EditFormatString="dd-MM-yyyy" Width="171px">
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
                                                                    SelectCommand="select topics_code,topics_description from [Master_Topics] where (topics_applicableentity='M' or topics_applicableentity='X') and topics_subscriptionrequired='Y' and topics_status='E' order by topics_description">
                                                                </asp:SqlDataSource>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </EditForm>
                                            </Templates>
                                            <ClientSideEvents EndCallback="function(s,e){DisableDescription(s.cpValue);}"></ClientSideEvents>
                                            <Styles>
                                                <Header SortingImageSpacing="5px" ImageSpacing="5px">
                                                </Header>
                                                <LoadingPanel ImageSpacing="10px">
                                                </LoadingPanel>
                                            </Styles>
                                            <Settings ShowGroupPanel="True" ShowTitlePanel="True" ShowFooter="True" ShowStatusBar="Visible">
                                            </Settings>
                                            <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True"></SettingsBehavior>
                                            <SettingsPager AlwaysShowPager="True" PageSize="20" NumericButtonCount="20" ShowSeparators="True">
                                                <FirstPageButton Visible="True">
                                                </FirstPageButton>
                                                <LastPageButton Visible="True">
                                                </LastPageButton>
                                            </SettingsPager>
                                            <Columns>
                                                <dxwgv:GridViewDataTextColumn Visible="False" ReadOnly="True" VisibleIndex="0" FieldName="topicsubscriptions_id">
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Visible="False" ReadOnly="True" VisibleIndex="0" FieldName="TopicSubscriptions_TopicCode"
                                                    Caption="Topic Code">
                                                    <EditFormCaptionStyle Wrap="False" HorizontalAlign="Left">
                                                    </EditFormCaptionStyle>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataComboBoxColumn FieldName="topics_description" Caption="Description"
                                                    VisibleIndex="0">
                                                    <PropertiesComboBox ValueType="System.String">
                                                    </PropertiesComboBox>
                                                    <CellStyle CssClass="gridcellleft">
                                                    </CellStyle>
                                                    <EditFormCaptionStyle Wrap="False" HorizontalAlign="Left">
                                                    </EditFormCaptionStyle>
                                                    <EditFormSettings Visible="True"></EditFormSettings>
                                                </dxwgv:GridViewDataComboBoxColumn>
                                                <dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="TopicSubscriptions_NotificationMethod"
                                                    Caption="Notification Method">
                                                    <CellStyle CssClass="gridcellleft">
                                                    </CellStyle>
                                                    <EditFormCaptionStyle Wrap="False" HorizontalAlign="Left">
                                                    </EditFormCaptionStyle>
                                                    <EditFormSettings Visible="True"></EditFormSettings>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="TopicSubscriptions_DeliveryMode"
                                                    Caption="Delivery Mode">
                                                    <CellStyle CssClass="gridcellleft">
                                                    </CellStyle>
                                                    <EditFormCaptionStyle Wrap="False" HorizontalAlign="Left">
                                                    </EditFormCaptionStyle>
                                                    <EditFormSettings Visible="True"></EditFormSettings>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="TopicSubscriptions_DeliveryFrequency"
                                                    Caption="Delivery Frequency">
                                                    <CellStyle CssClass="gridcellleft">
                                                    </CellStyle>
                                                    <EditFormCaptionStyle Wrap="False" HorizontalAlign="Left">
                                                    </EditFormCaptionStyle>
                                                    <EditFormSettings Visible="True"></EditFormSettings>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn VisibleIndex="4" FieldName="TopicSubscriptions_StartDate"
                                                    Caption="Start Date">
                                                    <EditFormCaptionStyle Wrap="False" HorizontalAlign="Left">
                                                    </EditFormCaptionStyle>
                                                    <EditFormSettings Visible="True"></EditFormSettings>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn VisibleIndex="5" FieldName="TopicSubscriptions_EndDate"
                                                    Caption="End Date">
                                                    <EditFormCaptionStyle Wrap="False" HorizontalAlign="Left">
                                                    </EditFormCaptionStyle>
                                                    <EditFormSettings Visible="True"></EditFormSettings>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewCommandColumn VisibleIndex="6">
                                                    <DeleteButton Visible="True">
                                                    </DeleteButton>
                                                    <HeaderTemplate>
                                                        <a href="javascript:void(0);" onclick="gridSubscription.AddNewRow();"><span style="color: #000099;
                                                            text-decoration: underline">Add New</span> </a>
                                                    </HeaderTemplate>
                                                    <EditButton Visible="True">
                                                    </EditButton>
                                                </dxwgv:GridViewCommandColumn>
                                            </Columns>
                                        </dxwgv:ASPxGridView>
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                        </TabPages>
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
	                                            var Tab10 = page.GetTab(10);
	                                            var Tab11 = page.GetTab(11);
	                                            var Tab12 = page.GetTab(12);
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
	                                            else if(activeTab == Tab8)
	                                            {
	                                                disp_prompt('tab8');
	                                            }
	                                            else if(activeTab == Tab9)
	                                            {
	                                                disp_prompt('tab9');
	                                            }
	                                            else if(activeTab == Tab10)
	                                            {
	                                                disp_prompt('tab10');
	                                            }
	                                            else if(activeTab == Tab11)
	                                            {
	                                                disp_prompt('tab11');
	                                            }
	                                             else if(activeTab == Tab12)
	                                            {
	                                                disp_prompt('tab12');
	                                            }
	                                            }"></ClientSideEvents>
                        <ContentStyle>
                            <Border BorderColor="#002D96" BorderStyle="Solid" BorderWidth="1px" />
                        </ContentStyle>
                        <LoadingPanelStyle ImageSpacing="6px">
                        </LoadingPanelStyle>
                        <TabStyle Font-Size="10px">
                        </TabStyle>
                    </dxtc:ASPxPageControl>
                </td>
            </tr>
        </table>
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
    </form>
</body>
</html>
