<%@ page language="C#" autoeventwireup="true" inherits="management_Employee_EmployeeCTC, App_Web_yq8u0p-o" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>

<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="System.Web.UI" TagPrefix="cc1" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CTC</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata.js"></script>

    <script type="text/javascript">
    function Show() 
              {
              var url = "frmEmployeeCTC.aspx?link=Employee_EmployeeCTC.aspx&id=ADD&ContID=N";
             // var url="frmEmployeeCTC.aspx?id=ADD";
              popup.SetContentUrl(url);
              popup.Show();

                 }
         function EditFormShow(obj) 
              {
              var intid=obj;
             // var url = "frmAddDocuments.aspx?id=Employee_Document.aspx&id1=Employee";
            // alert(intid);
              var url="frmEmployeeCTC.aspx?link=Employee_EmployeeCTC.aspx&id="+intid + "&ContID=N";
              popup.SetContentUrl(url);
              popup.Show();

                 }
                 
        function DeleteRow(keyValue)
          {
             doIt=confirm('Are You Want To Delete This Record ???');
            if(doIt)
                {
                   EmployeeCTC.PerformCallback(keyValue);
                   height();
                }
            else{
                  
                }

   
          }
    </script>

</head>
<body onload="clearPreloadPage()">

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
        //document.location.href="Employee_EmployeeCTC.aspx"; 
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
    
    

    </script>

    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td style="text-align: center">
                        <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="15px" ForeColor="Navy"
                            Width="819px" Height="18px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="9" ClientInstanceName="page">
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
                                            <dxwgv:ASPxGridView ID="EmployeeCTC" runat="server" AutoGenerateColumns="False" DataSourceID="EployeeCTC"
                                                KeyFieldName="Id" Width="100%" ClientInstanceName="EmployeeCTC" Font-Size="10px"
                                                OnHtmlRowCreated="EmployeeCTC_HtmlRowCreated" OnInitNewRow="EmployeeCTC_InitNewRow"
                                                OnCellEditorInitialize="EmployeeCTC_CellEditorInitialize" OnHtmlEditFormCreated="EmployeeCTC_HtmlEditFormCreated" OnCustomCallback="EmployeeCTC_CustomCallback" >
                                                <Styles>
                                                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                    </Header>
                                                    <LoadingPanel ImageSpacing="10px">
                                                    </LoadingPanel>
                                                    <FocusedRow BackColor="#FFC080">
                                                    </FocusedRow>
                                                    <FocusedGroupRow BackColor="#FFC080">
                                                    </FocusedGroupRow>
                                                </Styles>
                                                <Settings ShowFooter="True" ShowTitlePanel="True" />
                                                <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="NextColumn" ConfirmDelete="True" />
                                                <Columns>
                                                    <dxwgv:GridViewDataTextColumn Caption="Applicable From" FieldName="EffectiveDate1"
                                                        VisibleIndex="0">
                                                        <EditFormSettings Visible="False" />
                                                        <EditCellStyle>
                                                            <Border BorderColor="#C0C0FF" BorderStyle="Ridge" BorderWidth="1px" />
                                                        </EditCellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="Applicable To" FieldName="EffectiveUntil1"
                                                        VisibleIndex="1">
                                                        <EditFormSettings Visible="False" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="2" Visible="False">
                                                        <EditFormSettings Visible="False" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="Designation" FieldName="Designation" VisibleIndex="2">
                                                        <EditFormSettings Visible="False" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="Department" VisibleIndex="3">
                                                        <EditFormSettings Visible="False" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="CompanyName" VisibleIndex="4">
                                                        <EditFormSettings Visible="False" />
                                                        <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="BranchName" ReadOnly="True" VisibleIndex="5">
                                                        <EditFormSettings Visible="False" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn VisibleIndex="8" Width="60px" Caption="Details">
                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                        <DataItemTemplate>
                                                            <a href="javascript:void(0);" onclick="EditFormShow('<%# Container.KeyValue %>')">
                                                                Edit</a> &nbsp;&nbsp;<a href="javascript:void(0);" onclick="DeleteRow('<%# Container.KeyValue %>')">
                                                                    Delete</a>
                                                        </DataItemTemplate>
                                                        <CellStyle Wrap="False">
                                                        </CellStyle>
                                                        <HeaderTemplate>
                                                         <%--   <a href="javascript:void(0);" onclick="javascript:OnAddButtonClick();"><span style="color: #000099;
                                                                text-decoration: underline">Add New</span> </a>--%>
                                                                 <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                                                              { %>
                                                            <a href="javascript:void(0);" onclick="Show();"><span style="color: #000099; text-decoration: underline">
                                                                Add New</span> </a>
                                                            <%} %>
                                                        </HeaderTemplate>
                                                        <EditFormSettings Visible="False"></EditFormSettings>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    
                                                                                                     
                                                    <%-- <dxwgv:GridViewCommandColumn Name="command" VisibleIndex="7">
                                                        <EditButton Visible="True">
                                                        </EditButton>
                                                        <DeleteButton Visible="True">
                                                        </DeleteButton>
                                                        <ClearFilterButton Visible="True">
                                                        </ClearFilterButton>
                                                        <HeaderTemplate>
                                                            <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                                                              { %>
                                                            <a href="javascript:void(0);" onclick="EmployeeCTC.AddNewRow();"><span style="color: #000099;
                                                                text-decoration: underline">Add New</span> </a>
                                                            <%} %>
                                                        </HeaderTemplate>
                                                    </dxwgv:GridViewCommandColumn>--%>
                                                    <dxwgv:GridViewDataTextColumn FieldName="emp_id" ReadOnly="True" Visible="False"
                                                        VisibleIndex="5">
                                                        <EditFormSettings Visible="False" />
                                                        <EditFormCaptionStyle Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="emp_cntId" ReadOnly="True" Visible="False"
                                                        VisibleIndex="6">
                                                        <EditFormSettings Visible="False" />
                                                        <EditFormCaptionStyle Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataDateColumn FieldName="emp_dateofJoining" Visible="False" VisibleIndex="6">
                                                        <PropertiesDateEdit DisplayFormatString="" EditFormat="Custom" EditFormatString="dd MMMM yyyy"
                                                            UseMaskBehavior="True">
                                                        </PropertiesDateEdit>
                                                        <EditFormSettings Visible="True" VisibleIndex="1" Caption="Date Of Joining" />
                                                        <EditCellStyle BackColor="#FFF2C8">
                                                        </EditCellStyle>
                                                        <EditFormCaptionStyle BackColor="#FFF2C8" HorizontalAlign="Right" Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataDateColumn>
                                                    <dxwgv:GridViewDataComboBoxColumn FieldName="emp_Organization" Visible="False" VisibleIndex="6">
                                                        <PropertiesComboBox DataSourceID="Organization" EnableIncrementalFiltering="True"
                                                            TextField="cmp_name" ValueField="cmp_id" ValueType="System.Int32">
                                                        </PropertiesComboBox>
                                                        <EditFormSettings Visible="True" VisibleIndex="2" Caption="Organization" />
                                                        <EditCellStyle BackColor="#FFF2C8">
                                                        </EditCellStyle>
                                                        <EditFormCaptionStyle BackColor="#FFF2C8" HorizontalAlign="Right" Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataComboBoxColumn>
                                                    <dxwgv:GridViewDataComboBoxColumn FieldName="emp_JobResponsibility" Visible="False"
                                                        VisibleIndex="6">
                                                        <PropertiesComboBox DataSourceID="Responsibility" EnableIncrementalFiltering="True"
                                                            TextField="job_responsibility" ValueField="job_id" ValueType="System.Int32">
                                                        </PropertiesComboBox>
                                                        <EditFormSettings Visible="True" VisibleIndex="3" Caption="Job Responsibility" />
                                                        <EditCellStyle BackColor="#FFF2C8">
                                                        </EditCellStyle>
                                                        <EditFormCaptionStyle BackColor="#FFF2C8" HorizontalAlign="Right" Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataComboBoxColumn>
                                                    <dxwgv:GridViewDataComboBoxColumn FieldName="emp_Designation" Visible="False" VisibleIndex="6">
                                                        <PropertiesComboBox DataSourceID="Designation" EnableIncrementalFiltering="True"
                                                            TextField="deg_designation" ValueField="deg_id" ValueType="System.Int32">
                                                        </PropertiesComboBox>
                                                        <EditFormSettings Visible="True" VisibleIndex="4" Caption="Designation" />
                                                        <EditCellStyle BackColor="#FFF2C8">
                                                        </EditCellStyle>
                                                        <EditFormCaptionStyle BackColor="#FFF2C8" HorizontalAlign="Right" Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataComboBoxColumn>
                                                    <dxwgv:GridViewDataComboBoxColumn FieldName="emp_type" Visible="False" VisibleIndex="6">
                                                        <PropertiesComboBox DataSourceID="EmployeeType" EnableIncrementalFiltering="True"
                                                            TextField="emptpy_type" ValueField="emptpy_id" ValueType="System.Int32">
                                                        </PropertiesComboBox>
                                                        <EditFormSettings Visible="True" VisibleIndex="5" Caption="Employee Type" />
                                                        <EditCellStyle BackColor="#FFF2C8">
                                                        </EditCellStyle>
                                                        <EditFormCaptionStyle BackColor="#FFF2C8" HorizontalAlign="Right" Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataComboBoxColumn>
                                                    <dxwgv:GridViewDataComboBoxColumn FieldName="emp_Department" Visible="False" VisibleIndex="6">
                                                        <PropertiesComboBox DataSourceID="Department" EnableIncrementalFiltering="True" TextField="cost_description"
                                                            ValueField="cost_id" ValueType="System.Int32">
                                                        </PropertiesComboBox>
                                                        <EditFormSettings Visible="True" VisibleIndex="6" Caption="Department" />
                                                        <EditCellStyle BackColor="#FFF2C8">
                                                        </EditCellStyle>
                                                        <EditFormCaptionStyle BackColor="#FFF2C8" HorizontalAlign="Right" Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataComboBoxColumn>
                                                    <dxwgv:GridViewDataComboBoxColumn FieldName="emp_reportTo" Visible="False" VisibleIndex="6">
                                                        <PropertiesComboBox DataSourceID="ReportTo_Collegue_EmployeeDeputy" EnableIncrementalFiltering="True"
                                                            TextField="Name" ValueField="ID" ValueType="System.Int32">
                                                            <ValidationSettings Display="Dynamic">
                                                                <RequiredField IsRequired="True" />
                                                            </ValidationSettings>
                                                        </PropertiesComboBox>
                                                        <EditFormSettings Visible="True" VisibleIndex="7" Caption="Report To" />
                                                        <EditCellStyle BackColor="#FFF2C8">
                                                        </EditCellStyle>
                                                        <EditFormCaptionStyle BackColor="#FFF2C8" HorizontalAlign="Right" Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataComboBoxColumn>
                                                    <dxwgv:GridViewDataComboBoxColumn FieldName="emp_deputy" Visible="False" VisibleIndex="6">
                                                        <PropertiesComboBox DataSourceID="ReportTo_Collegue_EmployeeDeputy" EnableIncrementalFiltering="True"
                                                            TextField="Name" ValueField="ID" ValueType="System.Int32">
                                                            <ValidationSettings Display="Dynamic">
                                                                <RequiredField IsRequired="True" />
                                                            </ValidationSettings>
                                                        </PropertiesComboBox>
                                                        <EditFormSettings Visible="True" VisibleIndex="8" Caption="Additional Reporting Head" />
                                                        <EditCellStyle BackColor="#FFF2C8">
                                                        </EditCellStyle>
                                                        <EditFormCaptionStyle BackColor="#FFF2C8" HorizontalAlign="Right" Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataComboBoxColumn>
                                                    <dxwgv:GridViewDataComboBoxColumn FieldName="emp_colleague" Visible="False" VisibleIndex="6">
                                                        <PropertiesComboBox DataSourceID="ReportTo_Collegue_EmployeeDeputy" EnableIncrementalFiltering="True"
                                                            TextField="Name" ValueField="ID" ValueType="System.Int32">
                                                            <ValidationSettings Display="Dynamic">
                                                                <RequiredField IsRequired="True" />
                                                            </ValidationSettings>
                                                        </PropertiesComboBox>
                                                        <EditFormSettings Visible="True" VisibleIndex="9" Caption="Colleague" />
                                                        <EditCellStyle BackColor="#FFF2C8">
                                                        </EditCellStyle>
                                                        <EditFormCaptionStyle BackColor="#FFF2C8" HorizontalAlign="Right" Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataComboBoxColumn>
                                                    <dxwgv:GridViewDataComboBoxColumn FieldName="emp_workinghours" Visible="False" VisibleIndex="6">
                                                        <PropertiesComboBox DataSourceID="workingHr" EnableIncrementalFiltering="True" TextField="wor_scheduleName"
                                                            ValueField="wor_id" ValueType="System.String">
                                                        </PropertiesComboBox>
                                                        <EditFormSettings Visible="True" VisibleIndex="23" Caption="Working Hour" />
                                                        <EditCellStyle BackColor="#FFF2C8">
                                                            <BorderBottom BorderColor="Blue" BorderStyle="Ridge" />
                                                        </EditCellStyle>
                                                        <EditFormCaptionStyle BackColor="#FFF2C8" HorizontalAlign="Right" Wrap="False">
                                                            <BorderBottom BorderColor="Blue" />
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataComboBoxColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="emp_currentCTC" Visible="False" VisibleIndex="6">
                                                        <EditFormSettings Visible="True" VisibleIndex="11" Caption="Current CTC" />
                                                        <EditCellStyle BackColor="#DDECFE">
                                                            <BorderTop BorderColor="#8080FF" BorderStyle="Ridge" BorderWidth="1px" />
                                                        </EditCellStyle>
                                                        <EditFormCaptionStyle BackColor="#DDECFE" HorizontalAlign="Right" Wrap="False">
                                                            <BorderTop BorderColor="#8080FF" BorderStyle="Ridge" BorderWidth="1px" />
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="emp_basic" Visible="False" VisibleIndex="6">
                                                        <EditFormSettings Visible="True" VisibleIndex="12" Caption="Basic" />
                                                        <EditCellStyle BackColor="#DDECFE">
                                                            <BorderTop BorderColor="#8080FF" BorderStyle="Ridge" BorderWidth="1px" />
                                                        </EditCellStyle>
                                                        <EditFormCaptionStyle BackColor="#DDECFE" HorizontalAlign="Right" Wrap="False">
                                                            <BorderLeft BorderColor="#8080FF" BorderWidth="1px" />
                                                            <BorderTop BorderColor="#8080FF" BorderStyle="Ridge" BorderWidth="1px" />
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="emp_HRA" Visible="False" VisibleIndex="6">
                                                        <EditFormSettings Visible="True" VisibleIndex="13" Caption="HRA" />
                                                        <EditCellStyle BackColor="#DDECFE">
                                                            <BorderRight BorderColor="Blue" BorderWidth="1px" />
                                                        </EditCellStyle>
                                                        <EditFormCaptionStyle BackColor="#DDECFE" HorizontalAlign="Right" Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="emp_CCA" Visible="False" VisibleIndex="6">
                                                        <EditFormSettings Visible="True" VisibleIndex="14" Caption="CCA" />
                                                        <EditCellStyle BackColor="#DDECFE">
                                                        </EditCellStyle>
                                                        <EditFormCaptionStyle BackColor="#DDECFE" HorizontalAlign="Right" Wrap="False">
                                                            <BorderLeft BorderColor="#8080FF" BorderWidth="1px" />
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="emp_spAllowance" Visible="False" VisibleIndex="6">
                                                        <EditFormSettings Visible="True" VisibleIndex="15" Caption="SP. Allowance" />
                                                        <EditCellStyle BackColor="#DDECFE">
                                                            <BorderRight BorderColor="Blue" BorderWidth="1px" />
                                                        </EditCellStyle>
                                                        <EditFormCaptionStyle BackColor="#DDECFE" HorizontalAlign="Right" Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="emp_childrenAllowance" Visible="False" VisibleIndex="6">
                                                        <EditFormSettings Visible="True" VisibleIndex="16" Caption="Children Allowance" />
                                                        <EditCellStyle BackColor="#DDECFE">
                                                        </EditCellStyle>
                                                        <EditFormCaptionStyle BackColor="#DDECFE" HorizontalAlign="Right" Wrap="False">
                                                            <BorderLeft BorderColor="#8080FF" BorderWidth="1px" />
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataComboBoxColumn FieldName="emp_totalLeavePA" Visible="False" VisibleIndex="6">
                                                        <PropertiesComboBox DataSourceID="LeaveScheme" EnableIncrementalFiltering="True"
                                                            TextField="ls_name" ValueField="ls_id" ValueType="System.String">
                                                            <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithText" SetFocusOnError="True">
                                                                <RequiredField ErrorText="Select leave Scheme!" IsRequired="True" />
                                                            </ValidationSettings>
                                                        </PropertiesComboBox>
                                                        <EditFormSettings Visible="True" VisibleIndex="24" Caption="Leave Policy" />
                                                        <EditCellStyle BackColor="#FFF2C8">
                                                            <BorderBottom BorderColor="Blue" BorderStyle="Ridge" BorderWidth="1px" />
                                                        </EditCellStyle>
                                                        <EditFormCaptionStyle BackColor="#FFF2C8" HorizontalAlign="Right" Wrap="False">
                                                            <BorderBottom BorderColor="Blue" BorderStyle="Ridge" BorderWidth="1px" />
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataComboBoxColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="emp_PF" Visible="False" VisibleIndex="6">
                                                        <EditFormSettings Visible="True" VisibleIndex="18" Caption="PF" />
                                                        <EditCellStyle BackColor="#DDECFE">
                                                            <BorderRight BorderColor="Blue" BorderWidth="1px" />
                                                        </EditCellStyle>
                                                        <EditFormCaptionStyle BackColor="#DDECFE" HorizontalAlign="Right" Wrap="False">
                                                        </EditFormCaptionStyle>
                                                        <CellStyle BackColor="#DDECFE">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="emp_medicalAllowance" Visible="False" VisibleIndex="6">
                                                        <EditFormSettings Visible="True" VisibleIndex="19" Caption="Medical Allowance" />
                                                        <EditCellStyle BackColor="#DDECFE">
                                                        </EditCellStyle>
                                                        <EditFormCaptionStyle BackColor="#DDECFE" HorizontalAlign="Right" Wrap="False">
                                                            <BorderLeft BorderColor="#8080FF" BorderWidth="1px" />
                                                        </EditFormCaptionStyle>
                                                        <CellStyle BackColor="#DDECFE">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="emp_LTA" Visible="False" VisibleIndex="6">
                                                        <EditFormSettings Visible="True" VisibleIndex="20" Caption="LTA" />
                                                        <EditCellStyle BackColor="#DDECFE">
                                                            <BorderRight BorderColor="Blue" BorderWidth="1px" />
                                                        </EditCellStyle>
                                                        <EditFormCaptionStyle BackColor="#DDECFE" HorizontalAlign="Right" Wrap="False">
                                                        </EditFormCaptionStyle>
                                                        <CellStyle BackColor="#DDECFE">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="emp_convence" Visible="False" VisibleIndex="6">
                                                        <EditFormSettings Visible="True" VisibleIndex="21" Caption="Convence" />
                                                        <EditCellStyle BackColor="#DDECFE">
                                                            <BorderBottom BorderColor="Blue" BorderStyle="Ridge" BorderWidth="1px" />
                                                        </EditCellStyle>
                                                        <EditFormCaptionStyle BackColor="#DDECFE" HorizontalAlign="Right" Wrap="False">
                                                            <BorderLeft BorderColor="#8080FF" BorderWidth="1px" />
                                                            <BorderBottom BorderColor="Blue" BorderStyle="Ridge" BorderWidth="1px" />
                                                        </EditFormCaptionStyle>
                                                        <CellStyle BackColor="#DDECFE">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="emp_mobilePhoneExp" Visible="False" VisibleIndex="6">
                                                        <EditFormSettings Visible="True" VisibleIndex="22" Caption="Mbile Phone Exp." />
                                                        <EditCellStyle BackColor="#DDECFE">
                                                            <BorderBottom BorderColor="Blue" BorderStyle="Ridge" BorderWidth="1px" />
                                                            <BorderRight BorderColor="Blue" BorderStyle="Ridge" BorderWidth="1px" />
                                                        </EditCellStyle>
                                                        <EditFormCaptionStyle BackColor="#DDECFE" HorizontalAlign="Right" Wrap="False">
                                                            <BorderBottom BorderColor="Blue" BorderStyle="Ridge" BorderWidth="1px" />
                                                        </EditFormCaptionStyle>
                                                        <CellStyle BackColor="#DDECFE">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="emp_totalMedicalLeavePA" Visible="False"
                                                        VisibleIndex="6">
                                                        <EditFormSettings Visible="False" VisibleIndex="23" Caption="Total Medical Leave PA" />
                                                        <EditCellStyle BackColor="#DDECFE">
                                                        </EditCellStyle>
                                                        <EditFormCaptionStyle BackColor="#DDECFE" HorizontalAlign="Right" Wrap="False">
                                                        </EditFormCaptionStyle>
                                                        <CellStyle BackColor="#DDECFE">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataDateColumn Caption="Leave Effect From" Visible="False" VisibleIndex="8"
                                                        FieldName="emp_LeaveSchemeAppliedFrom">
                                                        <PropertiesDateEdit DisplayFormatString="" EditFormat="Custom" EditFormatString="dd MMMM yyyy"
                                                            UseMaskBehavior="True">
                                                        </PropertiesDateEdit>
                                                        <EditFormSettings Caption="Leave Effective from" Visible="True" VisibleIndex="25" />
                                                        <EditCellStyle BackColor="#FFF2C8" HorizontalAlign="Left">
                                                            <BorderBottom BorderColor="Blue" BorderStyle="Ridge" BorderWidth="1px" />
                                                        </EditCellStyle>
                                                        <EditFormCaptionStyle BackColor="#FFF2C8" HorizontalAlign="Right" Wrap="False">
                                                            <BorderBottom BorderColor="Blue" BorderStyle="Ridge" BorderWidth="1px" />
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataDateColumn>
                                                    <dxwgv:GridViewDataComboBoxColumn Caption="Branch" Visible="False" FieldName="emp_branch">
                                                        <PropertiesComboBox DataSourceID="Branch" EnableIncrementalFiltering="True" TextField="branch_description"
                                                            ValueField="branch_id" ValueType="System.Int32">
                                                        </PropertiesComboBox>
                                                        <EditFormSettings Caption="Branch" Visible="True" VisibleIndex="3" />
                                                        <EditCellStyle BackColor="#FFF2C8" HorizontalAlign="Left">
                                                        </EditCellStyle>
                                                        <EditFormCaptionStyle BackColor="#FFF2C8" HorizontalAlign="Right">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataComboBoxColumn>
                                                    <dxwgv:GridViewDataMemoColumn Caption="Remarks" VisibleIndex="6" FieldName="emp_Remarks">
                                                        <PropertiesMemoEdit Height="50px">
                                                        </PropertiesMemoEdit>
                                                        <EditFormSettings Caption="Remarks" ColumnSpan="2" Visible="True" VisibleIndex="26" />
                                                    </dxwgv:GridViewDataMemoColumn>
                                                </Columns>
                                            </dxwgv:ASPxGridView>
                                            <dxpc:ASPxPopupControl ID="ASPXPopupControl" runat="server" ContentUrl="frmAddDocuments.aspx"
                                                CloseAction="CloseButton" Top="100" Left="400" ClientInstanceName="popup" Height="530px"
                                                Width="930px" HeaderText="Employee CTC">
                                                <ContentCollection>
                                                    <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                                                    </dxpc:PopupControlContentControl>
                                                </ContentCollection>
                                            </dxpc:ASPxPopupControl>
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
                            <TabStyle Font-Size="10px">
                            </TabStyle>
                        </dxtc:ASPxPageControl>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtID" runat="server" Visible="false"></asp:TextBox></td>
                </tr>
            </table>
            <asp:SqlDataSource ID="EployeeCTC" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                UpdateCommand="employeeCTCupdate" UpdateCommandType="StoredProcedure" DeleteCommand="employeeCTCdelete"
                DeleteCommandType="StoredProcedure" InsertCommand="EmployeeCTCInsert" InsertCommandType="StoredProcedure"
                SelectCommand="EmplyeeCTCSelect" SelectCommandType="StoredProcedure">
                <InsertParameters>
                    <asp:SessionParameter Name="emp_cntId" SessionField="KeyVal_InternalID" Type="String" />
                    <asp:Parameter Name="emp_dateofJoining" Type="DateTime" />
                    <asp:Parameter Name="emp_organization" Type="Int32" />
                    <asp:Parameter Name="emp_JobResponsibility" Type="Int32" />
                    <asp:Parameter Name="emp_Designation" Type="Int32" />
                    <asp:Parameter Name="emp_type" Type="Int32" />
                    <asp:Parameter Name="emp_Department" Type="Int32" />
                    <asp:Parameter Name="emp_reportTo" Type="Int32" />
                    <asp:Parameter Name="emp_deputy" Type="Int32" />
                    <asp:Parameter Name="emp_colleague" Type="Int32" />
                    <asp:Parameter Name="emp_workinghours" Type="Int32" />
                    <asp:Parameter Name="emp_currentCTC" Type="String" />
                    <asp:Parameter Name="emp_basic" Type="String" />
                    <asp:Parameter Name="emp_HRA" Type="String" />
                    <asp:Parameter Name="emp_CCA" Type="String" />
                    <asp:Parameter Name="emp_spAllowance" Type="String" />
                    <asp:Parameter Name="emp_childrenAllowance" Type="String" />
                    <asp:Parameter Name="emp_totalLeavePA" Type="String" />
                    <asp:Parameter Name="emp_PF" Type="String" />
                    <asp:Parameter Name="emp_medicalAllowance" Type="String" />
                    <asp:Parameter Name="emp_LTA" Type="String" />
                    <asp:Parameter Name="emp_convence" Type="String" />
                    <asp:Parameter Name="emp_mobilePhoneExp" Type="String" />
                    <asp:Parameter Name="emp_totalMedicalLeavePA" Type="String" />
                    <asp:SessionParameter Name="userid" SessionField="userid" Type="Int32" />
                    <asp:Parameter Name="emp_LeaveSchemeAppliedFrom" Type="DateTime" />
                    <asp:Parameter Name="emp_branch" Type="int32" />
                    <asp:Parameter Name="emp_Remarks" Type="string" />
                </InsertParameters>
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                    <asp:SessionParameter Name="userid" SessionField="userid" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="emp_dateofJoining" Type="DateTime" />
                    <asp:Parameter Name="emp_organization" Type="String" />
                    <asp:Parameter Name="emp_JobResponsibility" Type="Int32" />
                    <asp:Parameter Name="emp_Designation" Type="Int32" />
                    <asp:Parameter Name="emp_type" Type="Int32" />
                    <asp:Parameter Name="emp_Department" Type="Int32" />
                    <asp:Parameter Name="emp_reportTo" Type="Int32" />
                    <asp:Parameter Name="emp_deputy" Type="Int32" />
                    <asp:Parameter Name="emp_colleague" Type="Int32" />
                    <asp:Parameter Name="emp_workinghours" Type="Int32" />
                    <asp:Parameter Name="emp_currentCTC" Type="String" />
                    <asp:Parameter Name="emp_basic" Type="String" />
                    <asp:Parameter Name="emp_HRA" Type="String" />
                    <asp:Parameter Name="emp_CCA" Type="String" />
                    <asp:Parameter Name="emp_spAllowance" Type="String" />
                    <asp:Parameter Name="emp_childrenAllowance" Type="String" />
                    <asp:Parameter Name="emp_totalLeavePA" Type="String" />
                    <asp:Parameter Name="emp_PF" Type="String" />
                    <asp:Parameter Name="emp_medicalAllowance" Type="String" />
                    <asp:Parameter Name="emp_LTA" Type="String" />
                    <asp:Parameter Name="emp_convence" Type="String" />
                    <asp:Parameter Name="emp_mobilePhoneExp" Type="String" />
                    <asp:Parameter Name="emp_totalMedicalLeavePA" Type="String" />
                    <asp:SessionParameter Name="userid" SessionField="userid" Type="Int32" />
                    <asp:Parameter Name="Id" Type="Int32" />
                    <asp:Parameter Name="emp_LeaveSchemeAppliedFrom" Type="datetime" />
                    <asp:Parameter Name="emp_branch" Type="int32" />
                    <asp:Parameter Name="emp_cntId" Type="string" />
                    <asp:Parameter Name="emp_Remarks" Type="string" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="cnt_internalId" SessionField="KeyVal_InternalID" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="Organization" runat="server" ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" SelectCommand="Select cmp_id, cmp_name from tbl_master_Company order by cmp_name">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="Responsibility" runat="server" ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" SelectCommand="Select job_id, job_responsibility from tbl_master_jobresponsibility order by job_responsibility">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="Designation" runat="server" ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" SelectCommand="Select deg_id, deg_designation from tbl_master_Designation order by deg_designation">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="EmployeeType" runat="server" ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" SelectCommand="Select emptpy_id, emptpy_type from tbl_master_employeeType order by emptpy_type">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="Department" runat="server" ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" SelectCommand="Select cost_id, cost_description from tbl_master_costCenter where cost_costCenterType = 'department' order by cost_description">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="LeaveScheme" runat="server" ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" SelectCommand="Select ls_id, ls_name from tbl_master_LeaveScheme">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="ReportTo_Collegue_EmployeeDeputy" runat="server" ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:crmConnectionString %>">
                <SelectParameters>
                    <asp:SessionParameter Name="ID" Type="string" SessionField="KeyVal_InternalID" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="workingHr" runat="server" ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" SelectCommand="Select wor_scheduleName,wor_id from tbl_master_workingHours">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="Branch" runat="server" ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" SelectCommand="Select [branch_id], [branch_description] from tbl_master_branch">
            </asp:SqlDataSource>
        </div>
    </form>
            <SettingsDetail AllowOnlyOneMasterRowExpanded="True" />
            <%--<SettingsEditing Mode="PopupEditForm" PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True"
                PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="600px" />--%>
            <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="250px" PopupEditFormHorizontalAlign="Center"
                PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="500px"
                EditFormColumnCount="1" />
            <SettingsText ConfirmDelete="Are you sure want to Delete this Record?" />
            <Templates>
                <EditForm>
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormEditors"
                                    ColumnID="" ID="Editors">
                                </dxwgv:ASPxGridViewTemplateReplacement>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                    runat="server" ColumnID="">
                                </dxwgv:ASPxGridViewTemplateReplacement>
                                <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                    runat="server" ColumnID="">
                                </dxwgv:ASPxGridViewTemplateReplacement>
                            </td>
                        </tr>
                    </table>
                </EditForm>
            </Templates>
</body>
</html>
