<%@ page language="C#" autoeventwireup="true" inherits="management_Employee_Employee, App_Web_akbpwr7y" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>

<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee</title>
    
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" /> 
     <!--Ajax List Section-->
    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
    <link href="../CSS/AjaxStyle.css" rel="stylesheet" type="text/css" />
    <!--End Ajax List Section-->
    
    <!--dhtml PopUp Section-->
    <link rel="stylesheet" href="../windowfiles/dhtmlwindow.css" type="text/css" />
    <script type="text/javascript" src="../windowfiles/dhtmlwindow.js"></script>
    <link rel="stylesheet" href="../modalfiles/modal.css" type="text/css" />
    <script type="text/javascript" src="../modalfiles/modal.js"></script>
    <!--End dhtml PopUp Section-->
   
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
        //document.location.href="Employee_Employee.aspx"; 
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
    function btnShowTemplate_click(obj)
    {
        if(obj=='1')
        {
            document.getElementById("trFirstEmpr").style.display = 'inline';
            document.getElementById("btnHideEmp1").style.display = 'inline';
            document.getElementById("btnShowEmp1").style.display = 'none';
        }
        if(obj=='2')
        {
            document.getElementById("trSecondEmpr").style.display = 'inline';
            document.getElementById("btnHideEmp2").style.display = 'inline';
            document.getElementById("btnShowEmp2").style.display = 'none';
        }
    }
    function btnHideTemplate_click(obj)
    {
        if(obj=='1')
        {
            
            document.getElementById("trFirstEmpr").style.display = 'none';
            document.getElementById("btnHideEmp1").style.display = 'none';
            document.getElementById("btnShowEmp1").style.display = 'inline';
        }
        if(obj=='2')
        {
            document.getElementById("trSecondEmpr").style.display = 'none';
            document.getElementById("btnHideEmp2").style.display = 'none';
            document.getElementById("btnShowEmp2").style.display = 'inline';
        }
    }
    function ShowReplacement(obj)
    {
        var url='frm_EmployeeReplacement.aspx?id='+obj;
        editwin=dhtmlmodal.open("Editbox", "iframe", url, "Employee Replacement", "width=940px,height=450px,center=1,resize=1,top=500", "recal");                 
    }
    function ShowReplacementNew(obj)
    {
        if(obj==true)
        {
            document.getElementById("tdReplacement").style.display='inline';
        }
        if(obj==false)
        {
            document.getElementById("tdReplacement").style.display='none';
        }
    }
    function ClearDate()
    {
        var newDate = null;
	    date.SetDate(newDate);
    }
    
    //---Ajax Section---
    FieldName="";
    function CallAjax(obj1,obj2,obj3,Query)
    {
        var CombinedQuery=new String(Query);
        ajax_showOptions(obj1,obj2,obj3,replaceChars(CombinedQuery),'Main');
    }
    function replaceChars(entry) {
            out = "+"; // replace this
            add = "--"; // with this
            temp = "" + entry; // temporary holder

            while (temp.indexOf(out)>-1) {
            pos= temp.indexOf(out);
            temp = "" + (temp.substring(0, pos) + add + 
            temp.substring((pos + out.length), temp.length));
            }
            return temp;
        }
    //---End Ajax Section---
    </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onunload="ClearPageSession();">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td style="text-align: center">
                        <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="15px" ForeColor="Navy"
                            Width="825px" Height="18px"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="8" ClientInstanceName="page"
                            Font-Size="10px" Width="100%" BackColor="#DDECFE">
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
                                            <table width="95%" style="background-color: #ddecfe" border="1">
                                                <tr>
                                                    <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left;">
                                                        Date Of Joining
                                                    </td>
                                                    <td style="vertical-align: top;">
                                                        <dxe:ASPxDateEdit Width="150px" ID="cmbDOJ" runat="server" EditFormat="Custom" UseMaskBehavior="True" EditFormatString="dd-MM-yyyy">
                                                        </dxe:ASPxDateEdit>
                                                    </td>
                                                    <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left;">
                                                        Date of leaving
                                                    </td>
                                                    <td style="vertical-align: top;">
                                                        <dxe:ASPxDateEdit Width="150px" ID="cmbDOL" ClientInstanceName="date" runat="server"
                                                            EditFormat="Custom" UseMaskBehavior="True" EditFormatString="dd-MM-yyyy">
                                                            <ClientSideEvents DateChanged="function(s, e) {
                                                                        var date=s.GetDate();
	                                                                    ShowReplacement(date.getMonth()+1 + '/'+date.getDate()+'/'+date.getYear());
                                                                    }" />
                                                        </dxe:ASPxDateEdit>
                                                    </td>
                                                    <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left;">
                                                        Reason of 
                                                        Leaving
                                                    </td>
                                                    <td style="vertical-align: top;">
                                                        <asp:TextBox Width="258px" ID="txtROLeaving" runat="server" Height="52px" TextMode="MultiLine"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class=" " style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left;">
                                                        Next Employer Name
                                                    </td>
                                                    <td class=" " style="vertical-align: top;">
                                                        <asp:TextBox Width="170px" ID="txtNextEmployeerName" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td class=" " style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left;">
                                                        Next Employer Addres /Phone
                                                    </td>
                                                    <td class=" " style="vertical-align: top;">
                                                        <asp:TextBox ID="txtNextEmployeerAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                                                    </td>
                                                    <td class=" " style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left;">
                                                        DIN
                                                    </td>
                                                    <td class=" " style="vertical-align: top;">
                                                        <asp:TextBox ID="txtDIN" runat="server" Width="170px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class=" " style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left;">
                                                        Replacement<asp:CheckBox ID="chkReplacement" runat="server" />
                                                    </td>
                                                    <td class=" " style="vertical-align: top;display:none" id="tdReplacement">
                                                        <asp:TextBox ID="txtReplacement" runat="server" Width="236px"></asp:TextBox>
                                                        <asp:HiddenField ID="txtReplacement_hidden" runat="server" />
                                                    </td>
                                                    <td class=" " style="vertical-align: top">
                                                    </td>
                                                    <td class=" " style="vertical-align: top">
                                                <dxe:ASPxButton ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" Height="32px" Width="86px">
                                                </dxe:ASPxButton>
                                                    </td>
                                                    <td class=" " style="vertical-align: top; width: 120px;">
                                                <asp:TextBox ID="emp_id" runat="server" Visible="False"></asp:TextBox>
                                                    </td>
                                                    <td class=" " style="vertical-align: top">
                                                    </td>
                                                </tr>
                                            </table>
                                            <table width="100%" style="background-color: #ddecfe">
                                                <tr>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <dxwgv:ASPxGridView ID="gridHistory" runat="server" Width="100%" ClientInstanceName="grid"
                                                            DataSourceID="sqlHistory" AutoGenerateColumns="False" KeyFieldName="emp_id" Font-Size="10px">
                                                            <Columns>
                                                                <dxwgv:GridViewDataTextColumn FieldName="emp_id" ReadOnly="True" VisibleIndex="0"
                                                                    Visible="False">
                                                                    <EditFormSettings Visible="False"></EditFormSettings>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="emp_InternalId" VisibleIndex="0" Visible="False">
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="emp_employerName" VisibleIndex="2" Caption="Name">
                                                                    <EditFormSettings Caption="Employer Name" Visible="True" VisibleIndex="0" />
                                                                    <EditFormCaptionStyle Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="emp_employerAddress" VisibleIndex="3" Caption="Address"
                                                                    Visible="False">
                                                                    <EditFormSettings Caption="Employer Address" Visible="True" VisibleIndex="1" />
                                                                    <EditFormCaptionStyle Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="emp_employerPhone" VisibleIndex="3" Caption="Phone"
                                                                    Visible="False">
                                                                    <EditFormSettings Caption="Employer Phone" Visible="True" VisibleIndex="2" />
                                                                    <EditFormCaptionStyle Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="emp_employerFax" VisibleIndex="3" Caption="Fax"
                                                                    Visible="False">
                                                                    <EditFormSettings Caption="Employer Fax" Visible="True" VisibleIndex="3" />
                                                                    <EditFormCaptionStyle Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="emp_employerEmail" VisibleIndex="3" Caption="Email"
                                                                    Visible="False">
                                                                    <EditFormSettings Caption="Employer Email" Visible="True" VisibleIndex="4" />
                                                                    <EditFormCaptionStyle Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                    <PropertiesTextEdit>
                                                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="Text" SetFocusOnError="True">
                                                                            <RegularExpression ErrorText="Valid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                                        </ValidationSettings>
                                                                    </PropertiesTextEdit>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="emp_employerPan" VisibleIndex="3" Caption="Pan No"
                                                                    Visible="False">
                                                                    <EditFormSettings Caption="Pan No" Visible="True" VisibleIndex="5" />
                                                                    <EditFormCaptionStyle Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataDateColumn Caption="From" FieldName="emp_employerFrm" Visible="False"
                                                                    VisibleIndex="6">
                                                                    <PropertiesDateEdit EditFormat="Custom" EditFormatString="dd MMMM yyyy">
                                                                    </PropertiesDateEdit>
                                                                    <EditFormSettings Visible="True" VisibleIndex="6" />
                                                                    <EditFormCaptionStyle Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                </dxwgv:GridViewDataDateColumn>
                                                                <dxwgv:GridViewDataDateColumn Caption="To" FieldName="emp_employerTo" Visible="False"
                                                                    VisibleIndex="7">
                                                                    <PropertiesDateEdit EditFormat="Custom" EditFormatString="dd MMMM yyyy">
                                                                    </PropertiesDateEdit>
                                                                    <EditFormSettings Visible="True" VisibleIndex="7" />
                                                                    <EditFormCaptionStyle Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                </dxwgv:GridViewDataDateColumn>
                                                                <dxwgv:GridViewDataComboBoxColumn Caption="JobResponsibility" FieldName="emp_jobResponsibility"
                                                                    VisibleIndex="3">
                                                                    <PropertiesComboBox DataSourceID="Sqljobresponsibility" TextField="job_responsibility"
                                                                        ValueField="job_id" ValueType="System.String" EnableIncrementalFiltering="True"
                                                                        EnableSynchronization="False">
                                                                    </PropertiesComboBox>
                                                                    <EditFormSettings Visible="True" VisibleIndex="8" />
                                                                    <EditFormCaptionStyle Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                </dxwgv:GridViewDataComboBoxColumn>
                                                                <dxwgv:GridViewDataComboBoxColumn Caption="Designation" FieldName="emp_designation"
                                                                    VisibleIndex="4" Visible="False">
                                                                    <PropertiesComboBox DataSourceID="Sqldesignation" ValueField="deg_id" TextField="deg_designation"
                                                                        ValueType="System.String" EnableIncrementalFiltering="True" EnableSynchronization="False">
                                                                    </PropertiesComboBox>
                                                                    <EditFormSettings Visible="True" VisibleIndex="9" />
                                                                    <EditFormCaptionStyle Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                </dxwgv:GridViewDataComboBoxColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="emp_department" VisibleIndex="4" Caption="Department"
                                                                    Visible="False">
                                                                    <EditFormSettings Caption="Department" Visible="True" VisibleIndex="10" />
                                                                    <EditFormCaptionStyle Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="emp_ctc" VisibleIndex="4" Caption="CTC">
                                                                    <EditFormSettings Caption="Current CTC" Visible="True" VisibleIndex="11" />
                                                                    <EditFormCaptionStyle Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                    <PropertiesTextEdit>
                                                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="Text" SetFocusOnError="True">
                                                                            <RegularExpression ErrorText="Valid CTC" ValidationExpression="^(\d{0,13}\.\d{0,5}|\d{0,13})$" />
                                                                        </ValidationSettings>
                                                                    </PropertiesTextEdit>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="emp_taxIncome" VisibleIndex="12" Caption="TaxIncome"
                                                                    Visible="False">
                                                                    <EditFormSettings Caption="Taxable Income" Visible="True" VisibleIndex="12" />
                                                                    <EditFormCaptionStyle Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="emp_tds" VisibleIndex="13" Caption="TDS"
                                                                    Visible="False">
                                                                    <EditFormSettings Caption="TDS" Visible="True" VisibleIndex="13" />
                                                                    <EditFormCaptionStyle Wrap="False">
                                                                    </EditFormCaptionStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="emp_employerFrm1" VisibleIndex="0" Caption="From">
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="emp_employerTo1" VisibleIndex="1" Caption="To">
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="CreateUser" VisibleIndex="14" Visible="False">
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataDateColumn FieldName="CreateDate" VisibleIndex="14" Visible="False">
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataDateColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="LastModifyDate" VisibleIndex="14" Visible="False">
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataDateColumn FieldName="LastModifyUser" VisibleIndex="14" Visible="False">
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataDateColumn>
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
                                                            <Settings ShowFooter="True" ShowStatusBar="Visible" ShowTitlePanel="True" ShowGroupButtons="False" />
                                                            <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="250px" PopupEditFormHorizontalAlign="Center"
                                                                PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="750px" />
                                                            <Styles>
                                                                <LoadingPanel ImageSpacing="10px">
                                                                </LoadingPanel>
                                                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                </Header>
                                                            </Styles>
                                                            <SettingsText PopupEditFormCaption="Add/Modify EmployeeHistory" ConfirmDelete="Are You Want To Delete This Record ???"
                                                                Title="Add Address" />
                                                            <SettingsPager NumericButtonCount="20" PageSize="20">
                                                            </SettingsPager>
                                                            <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
                                                            <Templates>
                                                                <EditForm>
                                                                    <table style="width: 100%">
                                                                        <tr>
                                                                            <td style="width: 100%">
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
                                                                        </tr>
                                                                    </table>
                                                                </EditForm>
                                                                <TitlePanel>
                                                                    <table style="width: 100%">
                                                                        <tr>
                                                                            <td align="center">
                                                                                <strong><span class="Ecoheadtxt" style="color: White">Add/Modify EmployeeHistory.</span></strong>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </TitlePanel>
                                                            </Templates>
                                                        </dxwgv:ASPxGridView>
                                                        <asp:SqlDataSource ID="Sqljobresponsibility" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                                                            SelectCommand="SELECT [job_id], [job_responsibility] FROM [tbl_master_jobResponsibility]">
                                                        </asp:SqlDataSource>
                                                        <asp:SqlDataSource ID="Sqldesignation" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                                                            SelectCommand="SELECT [deg_id], [deg_designation] FROM [tbl_master_designation]">
                                                        </asp:SqlDataSource>
                                                        <asp:SqlDataSource ID="sqlHistory" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                                                            DeleteCommand="INSERT INTO tbl_master_EmploymentHistory_Log(emp_id, emp_InternalId, emp_employerName, emp_employerAddress, emp_employerPhone, emp_employerFax, emp_employerEmail, emp_employerPan, emp_employerFrm, emp_employerTo, emp_jobResponsibility, emp_designation, emp_department, emp_ctc, emp_taxIncome, emp_tds, CreateUser, CreateDate, LastModifyDate, LastModifyUser, LogModifyDate, LogModifyUser, LogStatus) SELECT *,getdate(),@User,'D' FROM tbl_master_EmploymentHistory WHERE [emp_id] = @emp_id DELETE FROM [tbl_master_EmploymentHistory] WHERE [emp_id] = @emp_id"
                                                            InsertCommand="INSERT INTO [tbl_master_EmploymentHistory] ([emp_InternalId], [emp_employerName], [emp_employerAddress], [emp_employerPhone], [emp_employerFax], [emp_employerEmail], [emp_employerPan], [emp_employerFrm], [emp_employerTo], [emp_jobResponsibility], [emp_designation], [emp_department], [emp_ctc], [emp_taxIncome], [emp_tds], [CreateUser], [CreateDate]) VALUES (@emp_InternalId, @emp_employerName, @emp_employerAddress, @emp_employerPhone, @emp_employerFax, @emp_employerEmail, @emp_employerPan, @emp_employerFrm, @emp_employerTo, @emp_jobResponsibility, @emp_designation, @emp_department, @emp_ctc, @emp_taxIncome, @emp_tds, @CreateUser, getdate())"
                                                            SelectCommand="SELECT *,convert(varchar(11),emp_employerFrm,113) as emp_employerFrm1,convert(varchar(11),emp_employerTo,113) as emp_employerTo1 FROM [tbl_master_EmploymentHistory] where emp_InternalId=@emp_InternalId"
                                                            UpdateCommand="UPDATE [tbl_master_EmploymentHistory] SET  [emp_employerName] = @emp_employerName, [emp_employerAddress] = @emp_employerAddress, [emp_employerPhone] = @emp_employerPhone, [emp_employerFax] = @emp_employerFax, [emp_employerEmail] = @emp_employerEmail, [emp_employerPan] = @emp_employerPan, [emp_employerFrm] = @emp_employerFrm, [emp_employerTo] = @emp_employerTo, [emp_jobResponsibility] = @emp_jobResponsibility, [emp_designation] = @emp_designation, [emp_department] = @emp_department, [emp_ctc] = @emp_ctc, [emp_taxIncome] = @emp_taxIncome, [emp_tds] = @emp_tds,  [LastModifyDate] = getdate(), [LastModifyUser] = @LastModifyUser WHERE [emp_id] = @emp_id">
                                                            <DeleteParameters>
                                                                <asp:Parameter Name="emp_id" Type="Int32" />
                                                                <asp:SessionParameter Name="User" SessionField="userid" Type="Int32" />
                                                            </DeleteParameters>
                                                            <SelectParameters>
                                                                <asp:SessionParameter Name="emp_InternalId" SessionField="KeyVal_InternalID" Type="String" />
                                                            </SelectParameters>
                                                            <InsertParameters>
                                                                <asp:SessionParameter Name="emp_InternalId" SessionField="KeyVal_InternalID" Type="String" />
                                                                <asp:Parameter Name="emp_employerName" Type="String" />
                                                                <asp:Parameter Name="emp_employerAddress" Type="String" />
                                                                <asp:Parameter Name="emp_employerPhone" Type="String" />
                                                                <asp:Parameter Name="emp_employerFax" Type="String" />
                                                                <asp:Parameter Name="emp_employerEmail" Type="String" />
                                                                <asp:Parameter Name="emp_employerPan" Type="String" />
                                                                <asp:Parameter Type="DateTime" Name="emp_employerFrm" />
                                                                <asp:Parameter Type="DateTime" Name="emp_employerTo" />
                                                                <asp:Parameter Name="emp_jobResponsibility" Type="String" />
                                                                <asp:Parameter Name="emp_designation" Type="String" />
                                                                <asp:Parameter Name="emp_department" Type="String" />
                                                                <asp:Parameter Name="emp_ctc" Type="String" />
                                                                <asp:Parameter Name="emp_taxIncome" Type="String" />
                                                                <asp:Parameter Name="emp_tds" Type="String" />
                                                                <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="Int32" />
                                                            </InsertParameters>
                                                            <UpdateParameters>
                                                                <asp:Parameter Name="emp_employerName" Type="String" />
                                                                <asp:Parameter Name="emp_employerAddress" Type="String" />
                                                                <asp:Parameter Name="emp_employerPhone" Type="String" />
                                                                <asp:Parameter Name="emp_employerFax" Type="String" />
                                                                <asp:Parameter Name="emp_employerEmail" Type="String" />
                                                                <asp:Parameter Name="emp_employerPan" Type="String" />
                                                                <asp:Parameter Type="DateTime" Name="emp_employerFrm" />
                                                                <asp:Parameter Type="DateTime" Name="emp_employerTo" />
                                                                <asp:Parameter Name="emp_jobResponsibility" Type="String" />
                                                                <asp:Parameter Name="emp_designation" Type="String" />
                                                                <asp:Parameter Name="emp_department" Type="String" />
                                                                <asp:Parameter Name="emp_ctc" Type="String" />
                                                                <asp:Parameter Name="emp_taxIncome" Type="String" />
                                                                <asp:Parameter Name="emp_tds" Type="String" />
                                                                <asp:SessionParameter Name="LastModifyUser" SessionField="userid" Type="Int32" />
                                                                <asp:Parameter Name="emp_id" Type="Int32" />
                                                            </UpdateParameters>
                                                        </asp:SqlDataSource>
                                                        <asp:SqlDataSource ID="Replacement" runat="server" ConflictDetection="CompareAllValues"
                                                            ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" >
                                                            <SelectParameters>
                                                                <asp:SessionParameter Name="ID" Type="String" SessionField="KeyVal_InternalID" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:TextBox Width="170px" ID="txtEmployeeID" runat="server" Visible="False"></asp:TextBox>
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
        </div>
    </form>
</body>
</html>
