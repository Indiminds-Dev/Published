<%@ page language="C#" autoeventwireup="true" inherits="management_Employee_Registration, App_Web_bfdn6hbr" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Employee Registration</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>

    <script language="javascript" type="text/javascript">
    function disp_prompt(name)
    {
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
        //document.location.href="Employee_Registration.aspx"; 
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
    function OnCompanyChanged(cmbCountry) 
    {
        exchange.GetEditor("crg_exchange1").PerformCallback(cmbCountry.GetValue().toString());
    }

    </script>

    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td style="text-align: center">
                        <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="15px" ForeColor="Navy"
                            Width="819px" Height="18px"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="6" ClientInstanceName="page"
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
                                            <table border="1" width="100%">
                                                <tr>
                                                    <td>
                                                        <dxwgv:ASPxGridView ID="gridRegisStatutory" DataSourceID="Sqlstatutory" KeyFieldName="crg_id"
                                                            ClientInstanceName="grid" runat="server" Width="100%" AutoGenerateColumns="False"
                                                            OnInitNewRow="gridRegisStatutory_InitNewRow" OnRowValidating="gridRegisStatutory_RowValidating">
                                                            <Columns>
                                                                <dxwgv:GridViewDataTextColumn FieldName="crg_id" ReadOnly="True" VisibleIndex="0"
                                                                    Visible="False">
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="crg_cntId" VisibleIndex="0" Visible="False">
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataComboBoxColumn Caption="Type" FieldName="crg_type" VisibleIndex="0">
                                                                    <PropertiesComboBox EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                                        ValueType="System.String">
                                                                        <ClientSideEvents SelectedIndexChanged="function(s, e) {
	                                                                var value = s.GetValue();
                                                                    if(value == &quot;Pancard&quot;)
                                                                    {
                                                                        grid.GetEditor(&quot;crg_registrationAuthority&quot;).SetClientVisible(false);
                                                                        grid.GetEditor(&quot;crg_place&quot;).SetClientVisible(false);
                                                                        grid.GetEditor(&quot;crg_Date&quot;).SetClientVisible(false);
                                                                        grid.GetEditor(&quot;crg_validDate&quot;).SetClientVisible(false);
                                                                        grid.GetEditor(&quot;crg_verify&quot;).SetClientVisible(true);
                                                                    }
                                                                    else
                                                                    {
                                                                        if(value == &quot;Other&quot;)
                                                                        {
                                                                            grid.GetEditor(&quot;crg_registrationAuthority&quot;).SetClientVisible(true);
                                                                            grid.GetEditor(&quot;crg_place&quot;).SetClientVisible(true);
                                                                            grid.GetEditor(&quot;crg_Date&quot;).SetClientVisible(true);
                                                                            grid.GetEditor(&quot;crg_validDate&quot;).SetClientVisible(true);
                                                                            grid.GetEditor(&quot;crg_verify&quot;).SetClientVisible(false);
                                                                        }
                                                                        else
                                                                        {
                                                                            grid.GetEditor(&quot;crg_registrationAuthority&quot;).SetClientVisible(false);
                                                                            grid.GetEditor(&quot;crg_place&quot;).SetClientVisible(true);
                                                                            grid.GetEditor(&quot;crg_Date&quot;).SetClientVisible(true);
                                                                            grid.GetEditor(&quot;crg_validDate&quot;).SetClientVisible(true);
                                                                            grid.GetEditor(&quot;crg_verify&quot;).SetClientVisible(false);
                                                                        }
                                                                    }
                                                                }" />
                                                                        <Items>
                                                                            <dxe:ListEditItem Text="Pan Card" Value="Pancard">
                                                                            </dxe:ListEditItem>
                                                                            <dxe:ListEditItem Text="Passport" Value="Passport">
                                                                            </dxe:ListEditItem>
                                                                            <dxe:ListEditItem Text="Ration Card" Value="RationCard">
                                                                            </dxe:ListEditItem>
                                                                            <dxe:ListEditItem Text="Driving License" Value="DrivingLicense">
                                                                            </dxe:ListEditItem>
                                                                            <dxe:ListEditItem Text="Voter Id" Value="VoterId">
                                                                            </dxe:ListEditItem>
                                                                            <dxe:ListEditItem Text="Social Security Number" Value="SSNumber">
                                                                            </dxe:ListEditItem>
                                                                            <dxe:ListEditItem Text="Other" Value="Other">
                                                                            </dxe:ListEditItem>
                                                                        </Items>
                                                                    </PropertiesComboBox>
                                                                    <EditFormSettings Caption="Type" Visible="True" VisibleIndex="0" />
                                                                    <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataComboBoxColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="crg_Number" VisibleIndex="1" Caption="Number">
                                                                    <EditFormSettings Caption="Number" Visible="True" VisibleIndex="1" />
                                                                    <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="crg_registrationAuthority" VisibleIndex="6"
                                                                    Caption="Registration Authority Name" Visible="False">
                                                                    <EditFormSettings Caption="Registration Authority Name" Visible="True" VisibleIndex="6" />
                                                                    <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="crg_place" VisibleIndex="2" Caption="Place of Issue">
                                                                    <EditFormSettings Caption="Place of Issue" Visible="True" VisibleIndex="3" />
                                                                    <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataDateColumn Caption="Date of Issue" FieldName="crg_Date" VisibleIndex="3">
                                                                    <PropertiesDateEdit EditFormat="Custom" EditFormatString="dd-MM-yyyy" DisplayFormatString="{0:dd MMM yyyy}" UseMaskBehavior="True">
                                                                    </PropertiesDateEdit>
                                                                    <EditFormSettings Caption="Date of Issue" Visible="True" VisibleIndex="4" />
                                                                    <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataDateColumn>
                                                                <dxwgv:GridViewDataDateColumn Caption="Valid Untill" FieldName="crg_validDate" VisibleIndex="4">
                                                                    <PropertiesDateEdit EditFormat="Custom" EditFormatString="dd-MM-yyyy" DisplayFormatString="{0:dd MMM yyyy}" UseMaskBehavior="True">
                                                                    </PropertiesDateEdit>
                                                                    <EditFormSettings Caption="Valid Untill" Visible="True" VisibleIndex="5" />
                                                                    <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataDateColumn>
                                                                <dxwgv:GridViewDataComboBoxColumn Caption="Verify" FieldName="crg_verify" Visible="false">
                                                                    <PropertiesComboBox EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                                        ValueType="System.String">
                                                                        <Items>
                                                                            <dxe:ListEditItem Text="Verified" Value="Verified">
                                                                            </dxe:ListEditItem>
                                                                            <dxe:ListEditItem Text="Not Verified" Value="Not Verified">
                                                                            </dxe:ListEditItem>
                                                                        </Items>
                                                                    </PropertiesComboBox>
                                                                    <EditFormSettings Caption="Verify" Visible="True" VisibleIndex="7" />
                                                                    <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataComboBoxColumn>
                                                                <dxwgv:GridViewCommandColumn VisibleIndex="5">
                                                                    <EditButton Visible="True">
                                                                    </EditButton>
                                                                    <DeleteButton Visible="True">
                                                                    </DeleteButton>
                                                                    <HeaderTemplate>
                                                                        <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                                                                        { %>
                                                                        <a href="javascript:void(0);" onclick="grid.AddNewRow();"><span style="color: #000099;
                                                                            text-decoration: underline">Add New</span> </a>
                                                                        <%} %>
                                                                    </HeaderTemplate>
                                                                </dxwgv:GridViewCommandColumn>
                                                            </Columns>
                                                            <StylesEditors>
                                                                <ProgressBar Height="25px">
                                                                </ProgressBar>
                                                            </StylesEditors>
                                                            <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="300px" PopupEditFormHorizontalAlign="Center"
                                                                PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="700px"
                                                                EditFormColumnCount="1" />
                                                            <Styles>
                                                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                </Header>
                                                                <LoadingPanel ImageSpacing="10px">
                                                                </LoadingPanel>
                                                            </Styles>
                                                            <Settings ShowFooter="True" ShowStatusBar="Visible" ShowTitlePanel="True" />
                                                            <SettingsText PopupEditFormCaption="Add/Modify Registration" ConfirmDelete="Are You Want To Delete This Record ???" />
                                                            <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
                                                                <FirstPageButton Visible="True">
                                                                </FirstPageButton>
                                                                <LastPageButton Visible="True">
                                                                </LastPageButton>
                                                            </SettingsPager>
                                                            <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
                                                            <Templates>
                                                                <TitlePanel>
                                                                    <table style="width: 100%">
                                                                        <tr>
                                                                            <td align="center" >
                                                                                <span class="Ecoheadtxt">Statutory Registrations.</span>
                                                                            </td>
                                                                           
                                                                        </tr>
                                                                    </table>
                                                                </TitlePanel>
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
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <dxwgv:ASPxGridView ID="gridExchange" ClientInstanceName="exchange" Width="100%"
                                                            runat="server" AutoGenerateColumns="False" KeyFieldName="crg_internalId" DataSourceID="SqlExchange"
                                                            OnCellEditorInitialize="gridExchange_CellEditorInitialize" OnRowValidating="gridExchange_RowValidating"
                                                            OnInitNewRow="gridExchange_InitNewRow">
                                                            <Columns>
                                                                <dxwgv:GridViewDataTextColumn FieldName="crg_internalId" Visible="false">
                                                                    <EditFormSettings Visible="false" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="crg_cntID" Visible="false">
                                                                    <EditFormSettings Visible="false" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataComboBoxColumn Caption="Company" FieldName="crg_company1" VisibleIndex="0">
                                                                    <PropertiesComboBox DataSourceID="SqlComp" ValueField="cmp_internalid" TextField="cmp_Name"
                                                                        ValueType="System.String" EnableIncrementalFiltering="true" EnableSynchronization="False">
                                                                        <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCompanyChanged(s); }"></ClientSideEvents>
                                                                    </PropertiesComboBox>
                                                                    <EditFormSettings Visible="True" VisibleIndex="0" />
                                                                    <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataComboBoxColumn>
                                                                <dxwgv:GridViewDataComboBoxColumn FieldName="crg_exchange1" Visible="false">
                                                                    <PropertiesComboBox DataSourceID="SqlExchangeSegment" ValueField="exch_internalId"
                                                                        TextField="name" ValueType="System.String" EnableIncrementalFiltering="true"
                                                                        EnableSynchronization="False">
                                                                    </PropertiesComboBox>
                                                                    <EditFormSettings Visible="True" VisibleIndex="1" Caption="Exchange Segment" />
                                                                    <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataComboBoxColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="crg_exchange" Caption="Exchange Segment"
                                                                    Visible="true" VisibleIndex="1">
                                                                    <EditFormSettings Visible="false" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="crg_company" Visible="false">
                                                                    <EditFormSettings Visible="false" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="crg_tcode" VisibleIndex="2" Caption="UCC">
                                                                    <EditFormSettings Caption="Client Id(UCC)" Visible="True" VisibleIndex="2" />
                                                                    <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataDateColumn FieldName="crg_regisDate" VisibleIndex="3">
                                                                    <PropertiesDateEdit EditFormat="Custom" EditFormatString="dd-MM-yyyy" DisplayFormatString="{0:dd MMM yyyy}" UseMaskBehavior="True">
                                                                    </PropertiesDateEdit>
                                                                    <EditFormSettings Caption="Registration Date" Visible="True" VisibleIndex="3" />
                                                                    <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataDateColumn>
                                                                <dxwgv:GridViewDataDateColumn FieldName="crg_businessCmmDate" Visible="False" VisibleIndex="4">
                                                                    <PropertiesDateEdit EditFormat="Custom" EditFormatString="dd-MM-yyyy" DisplayFormatString="{0:dd MMM yyyy}" UseMaskBehavior="True">
                                                                    </PropertiesDateEdit>
                                                                    <EditFormSettings Caption="Business Comm. Date" Visible="True" VisibleIndex="4" />
                                                                    <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataDateColumn>
                                                                <dxwgv:GridViewDataDateColumn FieldName="crg_suspensionDate" VisibleIndex="5">
                                                                    <PropertiesDateEdit EditFormat="Custom" EditFormatString="dd-MM-yyyy" DisplayFormatString="{0:dd MMM yyyy}" UseMaskBehavior="True">
                                                                    </PropertiesDateEdit>
                                                                    <EditFormSettings Caption="Suspension Date" Visible="True" VisibleIndex="5" />
                                                                    <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataDateColumn>
                                                                <dxwgv:GridViewDataMemoColumn FieldName="crg_reasonforSuspension" Visible="False"
                                                                    VisibleIndex="5">
                                                                    <EditFormSettings Caption="Reason For Suspension" Visible="True" VisibleIndex="6" />
                                                                    <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataMemoColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="CreateUser" Visible="false">
                                                                    <EditFormSettings Visible="false" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewCommandColumn VisibleIndex="6">
                                                                    <EditButton Visible="True">
                                                                    </EditButton>
                                                                    <DeleteButton Visible="True">
                                                                    </DeleteButton>
                                                                    <HeaderTemplate>
                                                                        <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                                                                        { %>
                                                                        <a href="javascript:void(0);" onclick="exchange.AddNewRow();"><span style="color: #000099;
                                                                            text-decoration: underline">Add New</span> </a>
                                                                        <%} %>
                                                                    </HeaderTemplate>
                                                                </dxwgv:GridViewCommandColumn>
                                                            </Columns>
                                                            <StylesEditors>
                                                                <ProgressBar Height="25px">
                                                                </ProgressBar>
                                                            </StylesEditors>
                                                            <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="300px" PopupEditFormHorizontalAlign="Center"
                                                                PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="700px"
                                                                EditFormColumnCount="1" />
                                                            <Styles>
                                                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                </Header>
                                                                <LoadingPanel ImageSpacing="10px">
                                                                </LoadingPanel>
                                                            </Styles>
                                                            <Settings ShowFooter="True" ShowStatusBar="Visible" ShowTitlePanel="True" />
                                                            <SettingsText PopupEditFormCaption="Add/Modify Exchange" ConfirmDelete="Are You Sure Want To Delete This Record?" />
                                                            <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
                                                                <FirstPageButton Visible="True">
                                                                </FirstPageButton>
                                                                <LastPageButton Visible="True">
                                                                </LastPageButton>
                                                            </SettingsPager>
                                                            <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
                                                            <Templates>
                                                                <TitlePanel>
                                                                    <table style="width: 100%">
                                                                        <tr>
                                                                            <td align="center">
                                                                                <span class="Ecoheadtxt">Exchange/DP Segment Registrations</span>
                                                                            </td>
                                                                            
                                                                        </tr>
                                                                    </table>
                                                                </TitlePanel>
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
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <dxwgv:ASPxGridView ID="gridMembership" ClientInstanceName="membership" runat="server"
                                                            Width="100%" AutoGenerateColumns="False" DataSourceID="Sqlmembership" KeyFieldName="crg_internalid">
                                                            <StylesEditors>
                                                                <ProgressBar Height="25px">
                                                                </ProgressBar>
                                                            </StylesEditors>
                                                            <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="300px" PopupEditFormHorizontalAlign="Center"
                                                                PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="700px"
                                                                EditFormColumnCount="1" />
                                                            <Styles>
                                                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                </Header>
                                                                <LoadingPanel ImageSpacing="10px">
                                                                </LoadingPanel>
                                                            </Styles>
                                                            <Settings ShowFooter="True" ShowStatusBar="Visible" ShowTitlePanel="True" />
                                                            <SettingsText PopupEditFormCaption="Add/Modify Membership" ConfirmDelete="Are You Want To Delete This Record ???" />
                                                            <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
                                                                <FirstPageButton Visible="True">
                                                                </FirstPageButton>
                                                                <LastPageButton Visible="True">
                                                                </LastPageButton>
                                                            </SettingsPager>
                                                            <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
                                                            <Templates>
                                                                <TitlePanel>
                                                                    <table style="width: 100%">
                                                                        <tr>
                                                                            <td align="center">
                                                                                <span class="Ecoheadtxt">Other Memberships</span>
                                                                            </td>
                                                                            
                                                                        </tr>
                                                                    </table>
                                                                </TitlePanel>
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
                                                            <Columns>
                                                                <dxwgv:GridViewDataTextColumn FieldName="crg_internalid" ReadOnly="True" Visible="False"
                                                                    VisibleIndex="0">
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="crg_cntId" Visible="False" VisibleIndex="0">
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Membership Number" FieldName="crg_memNumber"
                                                                    VisibleIndex="1">
                                                                    <EditFormSettings Visible="True" VisibleIndex="1" />
                                                                    <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Membership Type" FieldName="crg_memtype" VisibleIndex="2">
                                                                    <EditFormSettings Visible="True" VisibleIndex="2" />
                                                                    <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataComboBoxColumn Caption="Professional Association" FieldName="crg_idprof"
                                                                    VisibleIndex="0">
                                                                    <PropertiesComboBox DataSourceID="SqlProfessional" ValueField="prof_id" TextField="prof_name"
                                                                        ValueType="System.String" EnableSynchronization="False" EnableIncrementalFiltering="true">
                                                                    </PropertiesComboBox>
                                                                    <EditFormSettings Caption="Professional Association" Visible="True" VisibleIndex="0" />
                                                                    <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataComboBoxColumn>
                                                                <dxwgv:GridViewDataComboBoxColumn Caption="Validity Type" FieldName="crg_validityType"
                                                                    VisibleIndex="2">
                                                                    <PropertiesComboBox ValueType="System.String" EnableSynchronization="False" EnableIncrementalFiltering="true">
                                                                        <ClientSideEvents SelectedIndexChanged="function(s, e) {
	                                                                var value = s.GetValue();
                                                                    if(value == &quot;Limited&quot;)
                                                                    {
                                                                        membership.GetEditor(&quot;crg_memExpDate&quot;).SetClientVisible(true);
                                                                    }
                                                                    else
                                                                    {
                                                                        membership.GetEditor(&quot;crg_memExpDate&quot;).SetClientVisible(false);
                                                                    }
                                                                }" />
                                                                        <Items>
                                                                            <dxe:ListEditItem Text="Limited" Value="Limited">
                                                                            </dxe:ListEditItem>
                                                                            <dxe:ListEditItem Text="Lifetime" Value="Lifetime">
                                                                            </dxe:ListEditItem>
                                                                        </Items>
                                                                    </PropertiesComboBox>
                                                                    <EditFormSettings Caption="Validity Type" Visible="True" VisibleIndex="3" />
                                                                    <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataComboBoxColumn>
                                                                <dxwgv:GridViewDataDateColumn Caption="Membership Expiry Date" FieldName="crg_memExpDate"
                                                                    VisibleIndex="3">
                                                                    <PropertiesDateEdit EditFormat="Custom" EditFormatString="dd-MM-yyyy" DisplayFormatString="{0:dd MMM yyyy}" UseMaskBehavior="True">
                                                                    </PropertiesDateEdit>
                                                                    <EditFormSettings Caption="Membership Expiry Date" Visible="True" VisibleIndex="4" />
                                                                    <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataDateColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Notes" FieldName="crg_notes" VisibleIndex="5">
                                                                    <EditFormSettings Caption="Notes" Visible="True" VisibleIndex="5" />
                                                                    <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="CreateUser" Visible="False" VisibleIndex="5">
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataDateColumn FieldName="CreateDate" Visible="False" VisibleIndex="5">
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataDateColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="LastModifyUser" Visible="False" VisibleIndex="5">
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataDateColumn FieldName="LastModifyDate" Visible="False" VisibleIndex="5">
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataDateColumn>
                                                                <dxwgv:GridViewCommandColumn VisibleIndex="6">
                                                                    <EditButton Visible="True">
                                                                    </EditButton>
                                                                    <DeleteButton Visible="True">
                                                                    </DeleteButton>
                                                                    <HeaderTemplate>
                                                                        <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                                                                        { %>
                                                                        <a href="javascript:void(0);" onclick="membership.AddNewRow();"><span style="color: #000099;
                                                                            text-decoration: underline">Add New</span> </a>
                                                                        <%} %>
                                                                    </HeaderTemplate>
                                                                </dxwgv:GridViewCommandColumn>
                                                            </Columns>
                                                        </dxwgv:ASPxGridView>
                                                        <asp:SqlDataSource ID="Sqlmembership" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                                                            DeleteCommand="INSERT INTO tbl_master_contactMembership_Log(crg_internalid, crg_cntId, crg_idprof, crg_memNumber, crg_memtype, crg_validityType, crg_memExpDate, crg_notes, CreateUser, CreateDate, LastModifyUser, LastModifyDate, LogModifyDate, LogModifyUser, LogStatus) SELECT *,getdate(),@CreateUser,'D' FROM tbl_master_contactMembership WHERE [crg_internalid] = @crg_internalid DELETE FROM [tbl_master_contactMembership] WHERE [crg_internalid] = @crg_internalid"
                                                            InsertCommand="INSERT INTO [tbl_master_contactMembership] ([crg_cntId],[crg_idprof], [crg_memNumber], [crg_memtype], [crg_validityType], [crg_memExpDate], [crg_notes], [CreateUser], [CreateDate]) VALUES (@crg_cntId,@crg_idprof, @crg_memNumber, @crg_memtype, @crg_validityType, @crg_memExpDate, @crg_notes, @CreateUser, getdate())"
                                                            SelectCommand="SELECT *,convert(varchar(11),crg_memExpDate,113) as crg_memExpDate1 FROM [tbl_master_contactMembership] where crg_cntId=@crg_cntId"
                                                            UpdateCommand="INSERT INTO tbl_master_contactMembership_Log(crg_internalid, crg_cntId, crg_idprof, crg_memNumber, crg_memtype, crg_validityType, crg_memExpDate, crg_notes, CreateUser, CreateDate, LastModifyUser, LastModifyDate, LogModifyDate, LogModifyUser, LogStatus) SELECT *,getdate(),@userId,'M' FROM tbl_master_contactMembership WHERE [crg_internalid] = @crg_internalid UPDATE [tbl_master_contactMembership] SET  [crg_idprof] = @crg_idprof, [crg_memNumber] = @crg_memNumber, [crg_memtype] = @crg_memtype, [crg_validityType] = @crg_validityType, [crg_memExpDate] = @crg_memExpDate, [crg_notes] = @crg_notes,  [LastModifyUser] = @LastModifyUser, [LastModifyDate] = getdate() WHERE [crg_internalid] = @crg_internalid">
                                                            <DeleteParameters>
                                                                <asp:Parameter Name="crg_internalid" Type="Int32" />
                                                                <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="int32" />
                                                            </DeleteParameters>
                                                            <SelectParameters>
                                                                <asp:SessionParameter Name="crg_cntId" SessionField="KeyVal_InternalID" Type="string" />
                                                            </SelectParameters>
                                                            <InsertParameters>
                                                                <asp:SessionParameter Name="crg_cntId" SessionField="KeyVal_InternalID" Type="string" />
                                                                <asp:Parameter Name="crg_idprof" Type="String" />
                                                                <asp:Parameter Name="crg_memNumber" Type="String" />
                                                                <asp:Parameter Name="crg_memtype" Type="String" />
                                                                <asp:Parameter Name="crg_validityType" Type="String" />
                                                                <asp:Parameter Type="datetime" Name="crg_memExpDate" />
                                                                <asp:Parameter Name="crg_notes" Type="String" />
                                                                <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="int32" />
                                                            </InsertParameters>
                                                            <UpdateParameters>
                                                                <asp:Parameter Name="crg_idprof" Type="String" />
                                                                <asp:Parameter Name="crg_memNumber" Type="String" />
                                                                <asp:Parameter Name="crg_memtype" Type="String" />
                                                                <asp:Parameter Name="crg_validityType" Type="String" />
                                                                <asp:Parameter Type="datetime" Name="crg_memExpDate" />
                                                                <asp:Parameter Name="crg_notes" Type="String" />
                                                                <asp:SessionParameter Name="LastModifyUser" SessionField="userid" Type="int32" />
                                                                <asp:Parameter Name="crg_internalid" Type="Int32" />
                                                            </UpdateParameters>
                                                        </asp:SqlDataSource>
                                                    </td>
                                                </tr>
                                            </table>
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
                                     <dxtc:TabPage Name="Subscription" Text="Subscriptions">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
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
                        </dxtc:ASPxPageControl>
                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="Sqlstatutory" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                DeleteCommand="DELETE FROM [tbl_master_contactRegistration] WHERE [crg_id] = @crg_id"
                InsertCommand="INSERT INTO [tbl_master_contactRegistration] ([crg_cntId], [crg_type], [crg_Number], [crg_registrationAuthority], [crg_place], [crg_Date], [crg_validDate], [CreateDate], [CreateUser],[crg_contactType]) VALUES (@crg_cntId, @crg_type, @crg_Number, @crg_registrationAuthority, @crg_place, @crg_Date, @crg_validDate, getdate(), @CreateUser,'contact')"
                SelectCommand="SELECT [crg_id], [crg_cntId], [crg_type], [crg_Number], [crg_registrationAuthority], [crg_place], cast([crg_Date] as datetime) as crg_Date,convert(varchar(11),crg_Date,113) as crg_Date1, cast([crg_validDate] as datetime) as crg_validDate,convert(varchar(11),crg_validDate,113) as crg_validDate1,[crg_verify] FROM [tbl_master_contactRegistration] where crg_cntId=@crg_cntId"
                UpdateCommand="insert into tbl_master_contactRegistration_Log(crg_id, crg_cntId, crg_contactType, crg_type, crg_Number, crg_registrationAuthority, crg_place, crg_Date, crg_validDate, crg_verify, CreateDate, CreateUser, LastModifyDate, LastModifyUser, LastModifyDate_DLMAST, LogModifyDate, LogModifyUser, LogStatus) select *,getdate(),@CreateUser,'M' FROM tbl_master_contactRegistration WHERE [crg_id] = @crg_id UPDATE [tbl_master_contactRegistration] SET  [crg_type] = @crg_type, [crg_Number] = @crg_Number, [crg_registrationAuthority] = @crg_registrationAuthority, [crg_place] = @crg_place,[crg_contactType]='contact', [crg_Date] = @crg_Date, [crg_validDate] = @crg_validDate, [LastModifyDate] = getdate(), [LastModifyUser] = @LastModifyUser WHERE [crg_id] = @crg_id">
                <DeleteParameters>
                    <asp:Parameter Name="crg_id" Type="Decimal" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="crg_cntId" SessionField="KeyVal_InternalID" Type="string" />
                </SelectParameters>
                <InsertParameters>
                    <asp:SessionParameter Name="crg_cntId" SessionField="KeyVal_InternalID" Type="string" />
                    <asp:Parameter Name="crg_type" Type="String" />
                    <asp:Parameter Name="crg_Number" Type="String" />
                    <asp:Parameter Name="crg_registrationAuthority" Type="String" />
                    <asp:Parameter Name="crg_place" Type="String" />
                    <asp:Parameter Type="datetime" Name="crg_Date" />
                    <asp:Parameter Type="datetime" Name="crg_validDate" />
                    <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="crg_type" Type="String" />
                    <asp:Parameter Name="crg_Number" Type="String" />
                    <asp:Parameter Name="crg_registrationAuthority" Type="String" />
                    <asp:Parameter Name="crg_place" Type="String" />
                    <asp:Parameter Type="datetime" Name="crg_Date" />
                    <asp:Parameter Type="datetime" Name="crg_validDate" />
                    <asp:SessionParameter Name="LastModifyUser" SessionField="userid" Type="Decimal" />
                    <asp:Parameter Name="crg_id" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlExchange" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                SelectCommand="select ce.crg_internalId as crg_internalId,ce.crg_cntID as crg_cntID,ce.crg_exchange as crg_exchange1,ce.crg_company as crg_company1,case crg_company when '0' then 'N/A' else (select cmp_name from tbl_master_company where cmp_internalId=ce.crg_company) end as crg_company,ce.crg_exchange as crg_exchange,ce.crg_tcode as crg_tcode,convert(varchar(11),ce.crg_regisDate,113) as crg_regisDate1,cast(ce.crg_regisDate as datetime) as crg_regisDate,convert(varchar(11),ce.crg_businessCmmDate,113) as crg_businessCmmDate1,cast(ce.crg_businessCmmDate as datetime) as crg_businessCmmDate,convert(varchar(11),ce.crg_suspensionDate,113) as crg_suspensionDate1,cast(ce.crg_suspensionDate as datetime) as crg_suspensionDate,ce.crg_reasonforSuspension as crg_reasonforSuspension,ce.CreateUser as CreateUser from tbl_master_contactExchange ce where crg_cntID=@crg_cntID"
                InsertCommand="insertContactExchange" InsertCommandType="StoredProcedure" UpdateCommand="updateContactExchange"
                UpdateCommandType="StoredProcedure" DeleteCommand="delete from tbl_master_contactExchange where crg_internalId=@crg_internalId">
                <SelectParameters>
                    <asp:SessionParameter Name="crg_cntID" SessionField="KeyVal_InternalID" Type="string" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="crg_internalId" Type="string" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:SessionParameter Name="crg_cntID" SessionField="KeyVal_InternalID" Type="string" />
                    <asp:Parameter Name="crg_company1" Type="string" />
                    <asp:Parameter Name="crg_exchange1" Type="string" />
                    <asp:Parameter Name="crg_regisDate" Type="datetime" />
                    <asp:Parameter Name="crg_businessCmmDate" Type="datetime" />
                    <asp:Parameter Name="crg_suspensionDate" Type="datetime" />
                    <asp:Parameter Name="crg_reasonforSuspension" Type="string" />
                    <asp:Parameter Name="crg_tcode" Type="string" />
                    <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="crg_internalId" Type="string" />
                    <asp:SessionParameter Name="crg_cntID" SessionField="KeyVal_InternalID" Type="string" />
                    <asp:Parameter Name="crg_company1" Type="string" />
                    <asp:Parameter Name="crg_exchange1" Type="string" />
                    <asp:Parameter Name="crg_regisDate" Type="datetime" />
                    <asp:Parameter Name="crg_businessCmmDate" Type="datetime" />
                    <asp:Parameter Name="crg_suspensionDate" Type="datetime" />
                    <asp:Parameter Name="crg_reasonforSuspension" Type="string" />
                    <asp:Parameter Name="crg_tcode" Type="string" />
                    <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlComp" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                SelectCommand="SELECT [cmp_internalid], [cmp_Name] FROM [tbl_master_company]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlExchangeSegment" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                SelectCommand="select ((select exh_shortName from tbl_master_exchange where tbl_master_companyExchange.exch_exchId=exh_cntId)+' - ' + exch_segmentId) as exch_internalId ,((select exh_shortName from tbl_master_exchange where tbl_master_companyExchange.exch_exchId=exh_cntId)+' - ' +exch_segmentId) as name from tbl_master_companyExchange where exch_compId=@crg_exchange1 union all select (dp_depository+ ' - '+dp_dpid) as exch_internalId ,(dp_depository+ ' - '+dp_dpid) as name from tbl_master_companyDp where dp_companyId=@crg_exchange1">
                <SelectParameters>
                    <asp:Parameter Name="crg_exchange1" Type="string" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlProfessional" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                SelectCommand="SELECT [prof_id], [prof_name] FROM [tbl_master_profTechBodies]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
