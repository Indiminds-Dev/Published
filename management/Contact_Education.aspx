<%@ page language="C#" autoeventwireup="true" inherits="management_Contact_Education, App_Web_d1rqvttb" %>
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

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
     <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
    <script language="javascript" type="text/javascript">
    function SignOff()
    {
    window.parent.SignOff()
    }
    function disp_prompt(name)
    {
        //var ID = document.getElementById(txtID);
        if ( name == "tab0")
        {
        //alert(name);
        document.location.href="Contact_general.aspx"; 
        }
        if ( name == "tab1")
        {
        //alert(name);
        document.location.href="Contact_Correspondence.aspx"; 
        }
        else if ( name == "tab2")
        {
        //alert(name);
        document.location.href="Employee_BankDetails.aspx"; 
        }
        else if ( name == "tab3")
        {
        //alert(name);
        document.location.href="Contact_DPDetails.aspx"; 
        }
        else if ( name == "tab4")
        {
        //alert(name);
        document.location.href="Contact_Document.aspx"; 
        }
        else if ( name == "tab12")
        {
        //alert(name);
        document.location.href="Contact_FamilyMembers.aspx"; 
        }
        else if ( name == "tab5")
        {
        //alert(name);
        document.location.href="Contact_Registration.aspx"; 
        }
        else if ( name == "tab7")
        {
        //alert(name);
        document.location.href="Contact_GroupMember.aspx"; 
        }
        else if ( name == "tab8")
        {
        //alert(name);
        document.location.href="Contact_Deposit.aspx"; 
        }
        else if ( name == "tab9")
        {
        //alert(name);
        document.location.href="Contact_Remarks.aspx"; 
        }
        else if ( name == "tab10")
        {
        //alert(name);
        //document.location.href="Contact_Education.aspx"; 
        }
        else if ( name == "tab11")
        {
        //alert(name);
        document.location.href="contact_brokerage.aspx"; 
        }
        else if ( name == "tab6")
        {
        //alert(name);
            document.location.href="contact_other.aspx"; 
        }
         else if(name=="tab13")
        {
             document.location.href="contact_Subscription.aspx";
        }
       //New Work 30-12-2021
        else if(name=="tab14")
        {
             document.location.href="Contact_Nominee.aspx";
        }
        //End of New Work 30-12-2021
    } 
    function OnCountryChanged(cmbCountry) 
    {
        grid.GetEditor("edu_state").PerformCallback(cmbCountry.GetValue().toString());
    }
    function OnStateChanged(cmbState) 
    {
        grid.GetEditor("edu_city").PerformCallback(cmbState.GetValue().toString());
    }
</script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div>
    <table width="100%">
        <tr>
           <td class="EHEADER" style="text-align:center">
                 <asp:Label ID="lblName" runat="server" Font-Bold="True"></asp:Label>
           </td>
       </tr>
    </table>  
    <table class="TableMain100">
          <tr>
            <td>
                <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="10" ClientInstanceName="page">
                
                <TabPages>
                    <dxtc:TabPage  Name="General">
                    <TabTemplate ><span style="font-size:x-small">General</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                    <ContentCollection>
                        <dxw:ContentControl runat="server">
                        </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <dxtc:TabPage  Name="CorresPondence">
                    <TabTemplate ><span style="font-size:x-small">CorresPondence</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                    <ContentCollection>
                        <dxw:ContentControl runat="server">
                        </dxw:ContentControl>
                        </ContentCollection>
                        </dxtc:TabPage>
                    <dxtc:TabPage Name="Bank Details">
                    <TabTemplate ><span style="font-size:x-small">Bank</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <dxtc:TabPage Name="DP Details">
                    <TabTemplate ><span style="font-size:x-small">DP</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <dxtc:TabPage Name="Documents" >
                    <TabTemplate ><span style="font-size:x-small">Documents</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    
                    
                    
                    <dxtc:TabPage Name="Registration">
                    <TabTemplate ><span style="font-size:x-small">Registration</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    
                    <dxtc:TabPage Name="Other">
                    <TabTemplate ><span style="font-size:x-small">Other</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
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
                    <dxtc:TabPage Name="Deposit" Text="Deposit">
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
                                <dxwgv:ASPxGridView ID="gridEducation" runat="server" ClientInstanceName="grid" AutoGenerateColumns="False" DataSourceID="sqleducation" KeyFieldName="edu_id" Width="100%" OnCellEditorInitialize="gridEducation_CellEditorInitialize1" OnInitNewRow="gridEducation_InitNewRow">
                                    <Columns>
                                        <dxwgv:GridViewDataTextColumn FieldName="edu_id" ReadOnly="True" VisibleIndex="0" Visible="False">
                                            <EditFormSettings Visible="False" />
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn FieldName="edu_internalId" VisibleIndex="0" Visible="False">
                                            <EditFormSettings Visible="False" />
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataComboBoxColumn Caption="Degree" FieldName="edu_degree" VisibleIndex="0">
                                            <PropertiesComboBox DataSourceID="sqlDegree" ValueField="edu_id" TextField="edu_education" EnableIncrementalFiltering="True" ValueType="System.String">
                                            </PropertiesComboBox>
                                            <EditFormSettings Visible="True" VisibleIndex="1" />
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                            <EditFormCaptionStyle Wrap="False">
                                            </EditFormCaptionStyle>
                                        </dxwgv:GridViewDataComboBoxColumn>
                                        <dxwgv:GridViewDataTextColumn FieldName="edu_instName" VisibleIndex="1" Caption="Institute Name">
                                            <EditFormSettings Visible="True" Caption="Institute Name" VisibleIndex="2" />
                                             <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                            <EditFormCaptionStyle Wrap="False">
                                            </EditFormCaptionStyle>
                                            <PropertiesTextEdit>
                                                <ValidationSettings Display="Dynamic" ErrorDisplayMode="Text" SetFocusOnError="True">
                                                    <RequiredField ErrorText="Required" IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesTextEdit>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataComboBoxColumn Caption="Country" FieldName="edu_country" VisibleIndex="2" Visible="false">
                                            <PropertiesComboBox DataSourceID="SqlCountry" ValueField="cou_id" TextField="cou_country" ValueType="System.String" EnableIncrementalFiltering="True" EnableSynchronization="False">
                                                <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCountryChanged(s); }"></ClientSideEvents>
                                            </PropertiesComboBox>
                                            <EditFormSettings Visible="True" VisibleIndex="3" />
                                            <EditFormCaptionStyle Wrap="False">
                                            </EditFormCaptionStyle>
                                        </dxwgv:GridViewDataComboBoxColumn>
                                        <dxwgv:GridViewDataComboBoxColumn Caption="State" FieldName="edu_state" VisibleIndex="3" Visible="false">
                                            <PropertiesComboBox DataSourceID="StateSelect" ValueField="ID" TextField="State" ValueType="System.String" EnableIncrementalFiltering="True" EnableSynchronization="False">
                                                <ClientSideEvents SelectedIndexChanged="function(s, e) { OnStateChanged(s); }"></ClientSideEvents>
                                            </PropertiesComboBox>
                                            <EditFormSettings Visible="True" VisibleIndex="4" />
                                            <EditFormCaptionStyle Wrap="False">
                                            </EditFormCaptionStyle>
                                        </dxwgv:GridViewDataComboBoxColumn>
                                        <dxwgv:GridViewDataComboBoxColumn Caption="City" FieldName="edu_city" VisibleIndex="4">
                                            <PropertiesComboBox DataSourceID="SelectCity" ValueField="CityId" TextField="City" ValueType="System.String" EnableIncrementalFiltering="True" EnableSynchronization="False">
                                            </PropertiesComboBox>
                                            <EditFormSettings Visible="True" VisibleIndex="5" />
                                            <EditFormCaptionStyle Wrap="False">
                                            </EditFormCaptionStyle>
                                        </dxwgv:GridViewDataComboBoxColumn>
                                        <dxwgv:GridViewDataDateColumn Caption="From" FieldName="edu_courseFrom" Visible="false" VisibleIndex="5">
                                            <PropertiesDateEdit EditFormat="Custom" EditFormatString="dd MM yyyy" UseMaskBehavior="true">
                                                <ValidationSettings Display="Dynamic" ErrorDisplayMode="Text" SetFocusOnError="True">
                                                    <RequiredField ErrorText="Required" IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesDateEdit>
                                            <EditFormSettings Visible="True" VisibleIndex="6" />
                                            <EditFormCaptionStyle Wrap="False">
                                            </EditFormCaptionStyle>
                                        </dxwgv:GridViewDataDateColumn>
                                        <dxwgv:GridViewDataDateColumn Caption="To" FieldName="edu_courseuntil"  Visible="false" VisibleIndex="6">
                                            <PropertiesDateEdit EditFormat="Custom" EditFormatString="dd MM yyyy" UseMaskBehavior="true">
                                                <ValidationSettings Display="Dynamic" ErrorDisplayMode="Text" SetFocusOnError="True">
                                                    <RequiredField ErrorText="Required" IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesDateEdit>
                                            <EditFormSettings Visible="True" VisibleIndex="7" />
                                            <EditFormCaptionStyle Wrap="False">
                                            </EditFormCaptionStyle>
                                        </dxwgv:GridViewDataDateColumn>
                                        <dxwgv:GridViewDataComboBoxColumn Caption="Result" FieldName="edu_courseResult" VisibleIndex="7">
                                            <PropertiesComboBox ValueType="System.String" EnableIncrementalFiltering="True">
                                                <Items>
                                                    <dxe:ListEditItem Text="Passed" Value="Passed">
                                                    </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Failed" Value="Failed">
                                                    </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Discontinued" Value="Discontinued">
                                                    </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Passed with distinction" Value="Passed with distinction">
                                                    </dxe:ListEditItem>
                                                 </Items>
                                            </PropertiesComboBox>
                                            <EditFormSettings Visible="True" VisibleIndex="8" />
                                             <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                            <EditFormCaptionStyle Wrap="False">
                                            </EditFormCaptionStyle>
                                        </dxwgv:GridViewDataComboBoxColumn>
                                        <dxwgv:GridViewDataTextColumn FieldName="edu_percentage" VisibleIndex="8" Caption="Percentage">
                                            <EditFormSettings Visible="true" Caption="Percentage" VisibleIndex="9" />
                                             <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                            <EditFormCaptionStyle Wrap="False">
                                            </EditFormCaptionStyle>
                                            <PropertiesTextEdit>
                                                <ValidationSettings Display="Dynamic" ErrorDisplayMode="Text" SetFocusOnError="True">
                                                    <RegularExpression ErrorText="Valid Percentage" ValidationExpression="^(\d{0,13}\.\d{0,5}|\d{0,13})$" />
                                                    <RequiredField ErrorText="Required" IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesTextEdit>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn FieldName="edu_grade" VisibleIndex="9" Caption="Grade">
                                            <EditFormSettings Visible="True" Caption="Grade" VisibleIndex="10" />
                                             <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                            <EditFormCaptionStyle Wrap="False">
                                            </EditFormCaptionStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataDateColumn Caption="Passing Month & Year" Visible="false" FieldName="edu_month_year"
                                            VisibleIndex="10">
                                            <PropertiesDateEdit DisplayFormatString="" EditFormat="Custom" EditFormatString="MM yyyy" UseMaskBehavior="true">
                                            </PropertiesDateEdit>
                                            <EditFormSettings Visible="True" VisibleIndex="10" />
                                            <EditFormCaptionStyle Wrap="False">
                                            </EditFormCaptionStyle>
                                        </dxwgv:GridViewDataDateColumn>
                                        <dxwgv:GridViewDataTextColumn FieldName="createuser" VisibleIndex="11" Visible="False">
                                            <EditFormSettings Visible="False" />
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataDateColumn FieldName="createdate" VisibleIndex="11" Visible="False">
                                            <EditFormSettings Visible="False" />
                                        </dxwgv:GridViewDataDateColumn>
                                        <dxwgv:GridViewDataTextColumn FieldName="lastmodifyuser" VisibleIndex="11" Visible="False">
                                            <EditFormSettings Visible="False" />
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataDateColumn FieldName="lastmodifydate" VisibleIndex="11" Visible="False">
                                            <EditFormSettings Visible="False" />
                                        </dxwgv:GridViewDataDateColumn>
                                         <dxwgv:GridViewDataTextColumn FieldName="edu_courseFrom1" VisibleIndex="5" Caption="From">
                                            <EditFormSettings Visible="false" />
                                             <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                         <dxwgv:GridViewDataTextColumn FieldName="edu_courseuntil1" VisibleIndex="6" Caption="To">
                                            <EditFormSettings Visible="false" />
                                             <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                         <dxwgv:GridViewDataTextColumn FieldName="edu_country1" VisibleIndex="2"  Caption="Country">
                                            <EditFormSettings Visible="false" />
                                             <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                         <dxwgv:GridViewDataTextColumn FieldName="edu_state1"  VisibleIndex="3" Caption="State">
                                            <EditFormSettings Visible="false" />
                                             <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn FieldName="edu_month_year1"  VisibleIndex="10" Caption="Passing Month & Year">
                                            <EditFormSettings Visible="false" />
                                             <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewCommandColumn VisibleIndex="11">
                                            <EditButton Visible="True">
                                            </EditButton>
                                            <DeleteButton Visible="True">
                                            </DeleteButton>
                                             <HeaderTemplate>
                                                            <a href="javascript:void(0);" onclick="grid.AddNewRow();"><span style="color: #000099;
                                                                text-decoration: underline">Add New</span> </a>
                                                        </HeaderTemplate>
                                        </dxwgv:GridViewCommandColumn>
                                    </Columns>
                                      <Styles>
                                        <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                        </Header>
                                        <LoadingPanel ImageSpacing="10px">
                                        </LoadingPanel>
                                    </Styles>
                                    <StylesEditors>
                                        <ProgressBar Height="25px">
                                        </ProgressBar>
                                    </StylesEditors>
                                    <Settings ShowFooter="True" ShowStatusBar="Visible" ShowTitlePanel="True" ShowGroupButtons="False" />
                                    <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="400px" PopupEditFormHorizontalAlign="Center"
                                        PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="700px" EditFormColumnCount="1" />
                                    <Styles>
                                     <LoadingPanel ImageSpacing="10px">
                                     </LoadingPanel>
                                     <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                    </Header>
                                     </Styles>
                                        <SettingsText PopupEditFormCaption="Add/Modify Education" ConfirmDelete="Are You Want To Delete This Record ???" Title="Add Address" />
                                        <SettingsPager NumericButtonCount="20" PageSize="20">
                                        </SettingsPager>
                                        <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
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
                                        <TitlePanel>
                                            <table style="width:100%">
                                              <tr>
                                                <td align="center" style="width:50%">
                                                    <span style="color:White; font-weight:bold; font-size:12px; text-align:center" >Add/Modify Education.</span>
                                                </td>
                                               <%-- <td align="right">
                                                  <table >
                                                    <tr>                                                 
                                                      <td>
                                                        <dxe:ASPxButton ID="ASPxButton1" runat="server" Text="ADD" ToolTip="Add New Data"   Height="18px" Width="88px" AutoPostBack="False" Font-Size="10px">
                                                           <clientsideevents click="function(s, e) {grid.AddNewRow();}" />
                                                        </dxe:ASPxButton>
                                                      </td>                                                                                
                                                    </tr>
                                                 </table>
                                              </td>   --%>
                                            </tr>
                                          </table>
                                      </TitlePanel>
                                   </Templates>
                                </dxwgv:ASPxGridView>                                
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <dxtc:TabPage Name="Trad. Prof." Text="Trad.Prof">
                    <%--<TabTemplate ><span style="font-size:x-small">Trad.Prof</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>--%>
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
                    <dxtc:TabPage Name="Subscription" Text="Subscription">
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <%--New Work 30-12-2021--%>
                    <dxtc:TabPage Name="Nominee">
                        <TabTemplate>
                            <span style="font-size: x-small;color:Blue;font-weight:bold">Nominee</span>&nbsp;<span style="color: Red;">*</span>
                        </TabTemplate>
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <%--End of New Work 30-12-2021--%>
                    </TabPages>
                    <%--New work Contact_Nominee(Tab14) added 30-12-2021--%>
                    <ClientSideEvents  ActiveTabChanged="function(s, e) {
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
	                                            var Tab13=page.GetTab(13);
	                                            var Tab14=page.GetTab(14);
	                                            
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
	                                            else if(activeTab == Tab13)
	                                            {
	                                               disp_prompt('tab13');
	                                            }
	                                            else if(activeTab == Tab14)
	                                            {
	                                               disp_prompt('tab14');
	                                            }
	                                           
	                                            }">
                    </ClientSideEvents>
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
            <tr>
            <td>
            </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="sqleducation" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                                    DeleteCommand="DELETE FROM [tbl_master_educationProfessional] WHERE [edu_id] = @edu_id"
                                    InsertCommand="EmployeeEducationInsert" InsertCommandType="StoredProcedure"
                                    SelectCommand="select ep.edu_id as edu_id,ep.edu_internalId as edu_internalId,ep.edu_instName as edu_instName,ep.edu_courseFrom as edu_courseFrom,case edu_degree when '' then 'N/A' else(select edu_education from tbl_master_education where ep.edu_degree=edu_id) end as edu_degree,ep.edu_courseuntil as edu_courseuntil,ep.edu_courseResult as edu_courseResult,ep.edu_percentage as edu_percentage,ep.edu_grade as edu_grade,ep.edu_month_year as edu_month_year,ep.createuser as createuser,ep.createdate as createdate,ep.lastmodifyuser as lastmodifyuser,ep.lastmodifydate as lastmodifydate,case edu_state when  '0' then 'N/A' else (select state from tbl_master_state where ep.edu_state=id) end as edu_state1,case edu_city when null then '0' else(select city_name from tbl_master_city where ep.edu_city=city_id) end as edu_city,case edu_country when '0' then 'N/A' else(select cou_country from tbl_master_country where ep.edu_country=cou_id) end as edu_country1,convert(varchar(11),ep.edu_courseFrom,113) as edu_courseFrom1,convert(varchar(11),ep.edu_courseuntil,113) as edu_courseuntil1,ep.edu_country as edu_country,ep.edu_state as edu_state,Right(Convert(VARCHAR(11),ep.edu_month_year,113),8) as  edu_month_year1 from tbl_master_educationProfessional ep where ep.edu_internalId=@edu_internalId" 
                                    UpdateCommand="UPDATE [tbl_master_educationProfessional] SET [edu_degree] = @edu_degree, [edu_instName] = @edu_instName, [edu_country] = @edu_country, [edu_state] = @edu_state, [edu_city] = @edu_city, [edu_courseFrom] = @edu_courseFrom, [edu_courseuntil] = @edu_courseuntil, [edu_courseResult] = @edu_courseResult, [edu_percentage] = @edu_percentage, [edu_grade] = @edu_grade, [edu_month_year] = @edu_month_year,  [lastmodifyuser] = @lastmodifyuser, [lastmodifydate] = getdate() WHERE [edu_id] = @edu_id">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="edu_internalId" SessionField="KeyVal_InternalID" Type="String" />
                                    </SelectParameters>
                                    <DeleteParameters>
                                        <asp:Parameter Name="edu_id" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:SessionParameter Name="edu_internalId" SessionField="KeyVal_InternalID" Type="String" />
                                        <asp:Parameter Name="edu_degree" Type="String" />
                                        <asp:Parameter Name="edu_instName" Type="String" />
                                        <asp:Parameter Name="edu_country" Type="Int32" />
                                        <asp:Parameter Name="edu_state" Type="Int32" />
                                        <asp:Parameter Name="edu_city" Type="Int32" />
                                        <asp:Parameter Type="datetime" Name="edu_courseFrom" />
                                        <asp:Parameter Type="datetime" Name="edu_courseuntil" />
                                        <asp:Parameter Name="edu_courseResult" Type="String" />
                                        <asp:Parameter Name="edu_percentage" Type="string" />
                                        <asp:Parameter Name="edu_grade" Type="String" />
                                        <asp:Parameter Name="edu_month_year" Type="String" />
                                        <asp:SessionParameter Name="createuser" SessionField="userid" Type="Int32" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="edu_degree" Type="String" />
                                        <asp:Parameter Name="edu_instName" Type="String" />
                                        <asp:Parameter Name="edu_country" Type="Int32" />
                                        <asp:Parameter Name="edu_state" Type="Int32" />
                                        <asp:Parameter Name="edu_city" Type="Int32" />
                                        <asp:Parameter Type="datetime" Name="edu_courseFrom" />
                                        <asp:Parameter Type="datetime" Name="edu_courseuntil" />
                                        <asp:Parameter Name="edu_courseResult" Type="String" />
                                        <asp:Parameter Name="edu_percentage" Type="string" />
                                        <asp:Parameter Name="edu_grade" Type="String" />
                                        <asp:Parameter Name="edu_month_year" Type="String" />
                                        <asp:SessionParameter Name="lastmodifyuser" SessionField="userid" Type="Decimal" />
                                        <asp:Parameter Type="datetime" Name="lastmodifydate" />
                                        <asp:Parameter Name="edu_id" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
        <asp:SqlDataSource ID="sqlDegree" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" SelectCommand="SELECT [edu_id], [edu_education] FROM [tbl_master_education] order by edu_education"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlCountry" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" SelectCommand="SELECT [cou_id], [cou_country] FROM [tbl_master_country] order by cou_country"></asp:SqlDataSource>
        <asp:SqlDataSource ID="StateSelect" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="SELECT s.id as ID,s.state as State from tbl_master_state s where (s.countryId = @State) ORDER BY s.state">
            <SelectParameters>
                <asp:Parameter Name="State" Type="string"/>
            </SelectParameters>
        </asp:SqlDataSource>
         <asp:SqlDataSource ID="SelectCity" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="SELECT c.city_id AS CityId, c.city_name AS City FROM tbl_master_city c where c.state_id=@City order by c.city_name">
             <SelectParameters>
                <asp:Parameter Name="City" Type="string"/>
            </SelectParameters>
        </asp:SqlDataSource>
    </div>   
    
   
    </form>
    
</body>
</html>
