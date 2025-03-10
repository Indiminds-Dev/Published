<%@ page language="C#" autoeventwireup="true" inherits="management_frm_LeaveApplication, App_Web_d1rqvttb" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Leave Application</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" language="javascript">
    function getday(date2)
    {
    //var date1=convertToDateTime(date2,"MM/DD/YYYY");
       alert(date2); 
    }
    function OnChangeDate(date)
    {
      
    //GridApplicationLeave.GetEditor("la_joinDateTime").PerformCallback(ASPxDateEdit.GetDate().toString(),);
    }
    function ShowHideFilter(obj)
    {
       GridApplicationLeave.PerformCallback(obj);
    }
    function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
    {
        if(document.body.scrollHeight>=500)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '500px';
        window.frameElement.Width = document.body.scrollWidth;
    }
    function LastCall(obj)
    {
        height();
    }
    function OnEmployeeChanged(cmbEmployee) 
    {  alert(cmbEmployee.GetValue().toString());
        var url='frm_LeaveApplication_popup.aspx?ID='+cmbEmployee.GetValue().toString();
        window.open(url,'50','resizable=1,height=250px,width=100px');
    }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" style="text-align: center">
                    <strong><span style="color: #000099">Leave Application</span></strong>
                </td>
            </tr>
            <tr>
                <td style=" vertical-align: top" class="gridcellleft">
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
                            <td class="gridcellright">
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
                <dxwgv:ASPxGridView ID="GridApplicationLeave" ClientInstanceName="GridApplicationLeave"
                    runat="server" AutoGenerateColumns="False"  DataSourceID="DataSourceLeaveApplication" KeyFieldName="la_id"
                    Width="100%" OnRowValidating="GridApplicationLeave_RowValidating" OnCellEditorInitialize="GridApplicationLeave_CellEditorInitialize"
                     OnCustomCallback="GridApplicationLeave_CustomCallback">
                    <SettingsBehavior AllowFocusedRow="True"></SettingsBehavior>
                    <Styles >
                        <Header SortingImageSpacing="5px" ImageSpacing="5px">
                        </Header>
                        <LoadingPanel ImageSpacing="10px">
                        </LoadingPanel>
                    </Styles>
                    <SettingsPager PageSize="20" AlwaysShowPager="True" ShowSeparators="True">
                        <FirstPageButton Visible="True">
                        </FirstPageButton>
                        <LastPageButton Visible="True">
                        </LastPageButton>
                    </SettingsPager>
                    
                    <SettingsEditing Mode="PopupEditForm" PopupEditFormHorizontalAlign="WindowCenter"
                        PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="700px" PopupEditFormModal="True">
                    </SettingsEditing>
                    <Columns>
                        <dxwgv:GridViewDataTextColumn FieldName="la_id" ReadOnly="True" Visible="False" VisibleIndex="0">
                            <EditFormSettings Visible="False" />
                            <EditCellStyle HorizontalAlign="Left" Wrap="False">
                            </EditCellStyle>
                            <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                            </EditFormCaptionStyle>
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataComboBoxColumn FieldName="la_cntId" VisibleIndex="0" Caption="Employee name">
                            <PropertiesComboBox DataSourceID="AllEmployee" TextField="Name" ValueField="ID" ValueType="System.String"
                                EnableIncrementalFiltering="True">
                                <ClientSideEvents SelectedIndexChanged="function(s, e) { OnEmployeeChanged(s); }"></ClientSideEvents>
                            </PropertiesComboBox>
                            <EditFormSettings Visible="True" Caption="Employee name" VisibleIndex="1" />
                            <EditCellStyle HorizontalAlign="Left" Wrap="False">
                            </EditCellStyle>
                            <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                            </EditFormCaptionStyle>
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                            
                        </dxwgv:GridViewDataComboBoxColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Branch" FieldName="branch" ReadOnly="True"
                            VisibleIndex="1">
                            <EditFormSettings Visible="False" />
                            <EditCellStyle HorizontalAlign="Left" Wrap="False">
                            </EditCellStyle>
                            <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                            </EditFormCaptionStyle>
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataComboBoxColumn Caption="Leave Type" FieldName="la_appType" VisibleIndex="2">
                            <PropertiesComboBox EnableIncrementalFiltering="True" ValueType="System.String">
                                <ClientSideEvents SelectedIndexChanged="function(s, e) {
	var value = s.GetValue();
	
    if(value == &quot;HC&quot; || value == &quot;HS&quot;)
    {
        GridApplicationLeave.GetEditor(&quot;la_joinDateTime&quot;).SetClientVisible(false);
        GridApplicationLeave.GetEditor(&quot;la_endDateAppl&quot;).SetClientVisible(false);
    }
    else
    {
        GridApplicationLeave.GetEditor(&quot;la_joinDateTime&quot;).SetClientVisible(true);
        GridApplicationLeave.GetEditor(&quot;la_endDateAppl&quot;).SetClientVisible(true);
    }
    GridApplicationLeave.GetEditor(&quot;la_startDateAppl&quot;).SetDate();
    }" />
                                <Items>
                                    <dxe:ListEditItem Text="PL" Value="PL">
                                    </dxe:ListEditItem>
                                    <dxe:ListEditItem Text="CL" Value="CL">
                                    </dxe:ListEditItem>
                                    <dxe:ListEditItem Text="SL" Value="SL">
                                    </dxe:ListEditItem>
                                    <dxe:ListEditItem Text="ML" Value="ML">
                                    </dxe:ListEditItem>
                                    <dxe:ListEditItem Text="HC" Value="HC">
                                    </dxe:ListEditItem>
                                    <dxe:ListEditItem Text="HS" Value="HS">
                                    </dxe:ListEditItem>
                                </Items>
                            </PropertiesComboBox>
                            <EditFormSettings Visible="True" Caption="Leave Type" VisibleIndex="6" />
                            <EditCellStyle HorizontalAlign="Left" Wrap="False">
                            </EditCellStyle>
                            <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                            </EditFormCaptionStyle>
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                        </dxwgv:GridViewDataComboBoxColumn>
                        <dxwgv:GridViewDataComboBoxColumn FieldName="la_Consideration" Visible="False" VisibleIndex="1">
                            <PropertiesComboBox EnableIncrementalFiltering="True" ValueField="la_Consideration"
                                ValueType="System.Char">
                                <Items>
                                    <dxe:ListEditItem Text="Leave" Value="L">
                                    </dxe:ListEditItem>
                                    <dxe:ListEditItem Text="Cash" Value="C">
                                    </dxe:ListEditItem>
                                </Items>
                            </PropertiesComboBox>
                            <EditFormSettings Visible="True" Caption="Consideration" VisibleIndex="3" />
                            <EditCellStyle HorizontalAlign="Left" Wrap="False">
                            </EditCellStyle>
                            <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                            </EditFormCaptionStyle>
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                        </dxwgv:GridViewDataComboBoxColumn>
                        <dxwgv:GridViewDataCheckColumn FieldName="la_ReceivedPhysical" Visible="False" VisibleIndex="1">
                            <PropertiesCheckEdit ValueChecked="Y" ValueType="System.Char" ValueUnchecked="N"
                                DisplayTextChecked="Yes" DisplayTextUnchecked="No" UseDisplayImages="False">
                            </PropertiesCheckEdit>
                            <EditFormSettings Visible="True" Caption="Application(Physical) Received" VisibleIndex="4" />
                            <EditCellStyle HorizontalAlign="Left" Wrap="False">
                            </EditCellStyle>
                            <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                            </EditFormCaptionStyle>
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                        </dxwgv:GridViewDataCheckColumn>
                        <dxwgv:GridViewDataDateColumn FieldName="la_appDate" Visible="False" VisibleIndex="1">
                            <PropertiesDateEdit DateOnError="Null" EditFormat="Custom" EditFormatString="dd MMMM yyyy"
                                UseMaskBehavior="True">
                            </PropertiesDateEdit>
                            <EditFormSettings Visible="True" Caption="Application Date" VisibleIndex="5" />
                            <EditCellStyle HorizontalAlign="Left" Wrap="False">
                            </EditCellStyle>
                            <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                            </EditFormCaptionStyle>
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                        </dxwgv:GridViewDataDateColumn>
                        <dxwgv:GridViewDataDateColumn FieldName="la_startDateAppl" Visible="False" VisibleIndex="1">
                            <PropertiesDateEdit DateOnError="Null" EditFormat="Custom" EditFormatString="dd MMMM yyyy"
                                UseMaskBehavior="True">
                                <ClientSideEvents DateChanged="function(s, e) {
	        var date = s.GetDate();
	        var status = GridApplicationLeave.GetEditor(&quot;la_appType&quot;).GetValue();
	        if(status==&quot;HC&quot; || status==&quot;HS&quot;)
	        {
	            GridApplicationLeave.GetEditor(&quot;la_endDateAppl&quot;).SetDate(date);
	            var newDate = new Date(date.getYear(), date.getMonth(), date.getDate()+1, 10, 0, 0);
	            GridApplicationLeave.GetEditor(&quot;la_joinDateTime&quot;).SetDate(newDate);
	        } 
        }" />
                            </PropertiesDateEdit>
                            <EditFormSettings Visible="True" Caption="Leave Start Date (applied)" VisibleIndex="9" />
                            <EditCellStyle HorizontalAlign="Left" Wrap="False">
                            </EditCellStyle>
                            <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                            </EditFormCaptionStyle>
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                        </dxwgv:GridViewDataDateColumn>
                        <dxwgv:GridViewDataDateColumn FieldName="la_endDateAppl" Visible="False" VisibleIndex="1">
                            <PropertiesDateEdit DateOnError="Null" EditFormat="Custom" EditFormatString="dd MMMM yyyy"
                                UseMaskBehavior="True">
                                <ClientSideEvents DateChanged="function(s, e) {
	var date = s.GetDate();
	var newDate;
	if(date.getDay()== 6)
	    newDate = new Date(date.getYear(), date.getMonth(), date.getDate()+2, 10, 0, 0);
	else
	    newDate = new Date(date.getYear(), date.getMonth(), date.getDate()+1, 10, 0, 0);
	GridApplicationLeave.GetEditor(&quot;la_joinDateTime&quot;).SetDate(newDate);
	}" />
                            </PropertiesDateEdit>
                            <EditFormSettings Visible="True" Caption="Leave End Date (applied)" VisibleIndex="10" />
                            <EditCellStyle HorizontalAlign="Left" Wrap="False">
                            </EditCellStyle>
                            <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                            </EditFormCaptionStyle>
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                        </dxwgv:GridViewDataDateColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="la_totaldaysAppl" Visible="False" VisibleIndex="1">
                            <EditCellStyle HorizontalAlign="Left" Wrap="False">
                            </EditCellStyle>
                            <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                            </EditFormCaptionStyle>
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                            <EditFormSettings VisibleIndex="6" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataComboBoxColumn Caption="Application Status" FieldName="la_appStatus"
                            VisibleIndex="5">
                            <PropertiesComboBox EnableIncrementalFiltering="True" ValueType="System.String">
                                <ClientSideEvents SelectedIndexChanged="function(s, e) {
	var value = s.GetValue();
	
    if(value == &quot;AM&quot;)
    {
        GridApplicationLeave.GetEditor(&quot;la_startDateApr&quot;).SetClientVisible(true);
        GridApplicationLeave.GetEditor(&quot;la_endDateApr&quot;).SetClientVisible(true);
    }
    else
    {
         GridApplicationLeave.GetEditor(&quot;la_startDateApr&quot;).SetClientVisible(false);
         GridApplicationLeave.GetEditor(&quot;la_endDateApr&quot;).SetClientVisible(false);
    }
    if(value == &quot;DU&quot;)
    {
        GridApplicationLeave.GetEditor(&quot;la_apprRejBy&quot;).SetClientVisible(false);
        GridApplicationLeave.GetEditor(&quot;la_apprRejOn&quot;).SetClientVisible(false);
    }
    else
    {
         GridApplicationLeave.GetEditor(&quot;la_apprRejBy&quot;).SetClientVisible(true);
         GridApplicationLeave.GetEditor(&quot;la_apprRejOn&quot;).SetClientVisible(true);
    }
}" />
                                <Items>
                                    <dxe:ListEditItem Text="Due" Value="DU">
                                    </dxe:ListEditItem>
                                    <dxe:ListEditItem Text="Approved" Value="AP">
                                    </dxe:ListEditItem>
                                    <dxe:ListEditItem Text="Approved with modification" Value="AM">
                                    </dxe:ListEditItem>
                                    <dxe:ListEditItem Text="Rejected " Value="RJ">
                                    </dxe:ListEditItem>
                                </Items>
                            </PropertiesComboBox>
                            <EditFormSettings Visible="True" Caption="Application Status" VisibleIndex="7" />
                            <EditCellStyle HorizontalAlign="Left" Wrap="False">
                            </EditCellStyle>
                            <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                            </EditFormCaptionStyle>
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                        </dxwgv:GridViewDataComboBoxColumn>
                        <dxwgv:GridViewDataComboBoxColumn Caption="Approved/rejected By" FieldName="la_apprRejBy"
                            VisibleIndex="6">
                            <PropertiesComboBox DataSourceID="AllEmployee" EnableIncrementalFiltering="True"
                                TextField="Name" ValueField="ID" ValueType="System.String">
                            </PropertiesComboBox>
                            <EditFormSettings Visible="True" Caption="Approved/rejected By" VisibleIndex="8" />
                            <EditCellStyle HorizontalAlign="Left" Wrap="False">
                            </EditCellStyle>
                            <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                            </EditFormCaptionStyle>
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                        </dxwgv:GridViewDataComboBoxColumn>
                        <dxwgv:GridViewDataDateColumn Caption="Approved/rejected Date" FieldName="la_apprRejOn"
                            Visible="False" VisibleIndex="7">
                            <PropertiesDateEdit EditFormat="Custom" EditFormatString="dd MMMM yyyy" UseMaskBehavior="True">
                            </PropertiesDateEdit>
                            <EditFormSettings Visible="True" Caption="Approved/rejected  On" VisibleIndex="8" />
                            <EditCellStyle HorizontalAlign="Left" Wrap="False">
                            </EditCellStyle>
                            <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                            </EditFormCaptionStyle>
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                        </dxwgv:GridViewDataDateColumn>
                        <dxwgv:GridViewDataDateColumn Caption="From" FieldName="la_startDateApr" VisibleIndex="2"
                            Visible="False">
                            <PropertiesDateEdit EditFormat="Custom" EditFormatString="dd MMMM yyyy" UseMaskBehavior="True">
                            </PropertiesDateEdit>
                            <EditCellStyle HorizontalAlign="Left" Wrap="False">
                            </EditCellStyle>
                            <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                            </EditFormCaptionStyle>
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                            <EditFormSettings Caption="Leave Start date (approved)" VisibleIndex="12" Visible="True" />
                        </dxwgv:GridViewDataDateColumn>
                        <dxwgv:GridViewDataDateColumn Caption="To" FieldName="la_endDateApr" VisibleIndex="3"
                            Visible="False">
                            <PropertiesDateEdit EditFormat="Custom" EditFormatString="dd MMMM yyyy" UseMaskBehavior="True">
                                <ClientSideEvents DateChanged="function(s, e){
         var date = s.GetDate();
	var newDate;
	if(date.getDay()== 6)
	    newDate = new Date(date.getYear(), date.getMonth(), date.getDate()+2, 10, 0, 0);
	else
	    newDate = new Date(date.getYear(), date.getMonth(), date.getDate()+1, 10, 0, 0);
	GridApplicationLeave.GetEditor(&quot;la_joinDateTime&quot;).SetDate(newDate);
	}" />
                            </PropertiesDateEdit>
                            <EditFormSettings Visible="True" Caption="Leave End date (approved)" VisibleIndex="13" />
                            <EditCellStyle HorizontalAlign="Left" Wrap="False">
                            </EditCellStyle>
                            <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                            </EditFormCaptionStyle>
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                        </dxwgv:GridViewDataDateColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="stdate" VisibleIndex="3" Caption="From">
                            <EditCellStyle HorizontalAlign="Left" Wrap="False">
                            </EditCellStyle>
                            <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                            </EditFormCaptionStyle>
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                            <EditFormSettings Visible="False" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="endate" VisibleIndex="4" Caption="To">
                            <EditCellStyle HorizontalAlign="Left" Wrap="False">
                            </EditCellStyle>
                            <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                            </EditFormCaptionStyle>
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                            <EditFormSettings Visible="False" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="la_totaldaysApr" Visible="False" VisibleIndex="5">
                            <EditCellStyle HorizontalAlign="Left" Wrap="False">
                            </EditCellStyle>
                            <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                            </EditFormCaptionStyle>
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataDateColumn Caption="Joining Datetime" FieldName="la_joinDateTime"
                            VisibleIndex="6" Visible="False">
                            <PropertiesDateEdit EditFormat="Custom" EditFormatString="dd MMMM yyyy hh:mm tt"
                                UseMaskBehavior="True">
                            </PropertiesDateEdit>
                            <EditFormSettings Visible="True" Caption="Joining DateTime" VisibleIndex="14" />
                            <EditCellStyle HorizontalAlign="Left" Wrap="False">
                            </EditCellStyle>
                            <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                            </EditFormCaptionStyle>
                            <CellStyle CssClass="gridcellleft">
                            </CellStyle>
                        </dxwgv:GridViewDataDateColumn>
                        <dxwgv:GridViewCommandColumn VisibleIndex="7">
                            <EditButton Visible="True">
                            </EditButton>
                            <ClearFilterButton Visible="True">
                            </ClearFilterButton>
                            <HeaderTemplate>
                                <a href="javascript:void(0);" onclick="GridApplicationLeave.AddNewRow()"><span style="color: #000099;
                                    text-decoration: underline">Add New</span></a>
                            </HeaderTemplate>
                        </dxwgv:GridViewCommandColumn>
                        <dxwgv:GridViewDataMemoColumn Caption="Remarks" Visible="False" VisibleIndex="8" FieldName="la_Remarks">
                            <PropertiesMemoEdit Columns="2" Height="100px" NullText="Enter Remarks Here">
                            </PropertiesMemoEdit>
                            <EditFormSettings Caption="Remarks" ColumnSpan="2" Visible="True" VisibleIndex="15" />
                            <EditCellStyle CssClass="gridcellleft">
                            </EditCellStyle>
                        </dxwgv:GridViewDataMemoColumn>
                    </Columns>
                    <Settings ShowGroupPanel="True"></Settings>
                    <StylesEditors>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                    <Templates>
                        <EditForm>
                            <table style="width: 100%">
                                
                                <tr>
                                    <td>
                                        <controls>
                                            <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormEditors" ColumnID="" ID="Editors">
                                            </dxwgv:ASPxGridViewTemplateReplacement>                                                           
                                        </controls>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                            runat="server">
                                        </dxwgv:ASPxGridViewTemplateReplacement>
                                        <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                            runat="server">
                                        </dxwgv:ASPxGridViewTemplateReplacement>
                                    </td>
                                </tr>
                            </table>
                        </EditForm>
                    </Templates>
                </dxwgv:ASPxGridView>
                <asp:SqlDataSource ID="DataSourceLeaveApplication" runat="server" ConflictDetection="CompareAllValues"
                    ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" DeleteCommand="DELETE FROM [tbl_trans_LeaveApplication] WHERE [la_id] = @la_id "
                    InsertCommand="LeaveApplicationInsert" InsertCommandType="StoredProcedure" SelectCommand=""
                    UpdateCommand="update table1 set temp123='123'">
                    <DeleteParameters>
                        <asp:Parameter Name="la_id" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="la_cntId" Type="String" />
                        <asp:Parameter Name="la_appType" Type="String" />
                        <asp:Parameter Name="la_Consideration" Type="String" />
                        <asp:Parameter Name="la_ReceivedPhysical" Type="String" />
                        <asp:Parameter Name="la_appDate" Type="DateTime" />
                        <asp:Parameter Name="la_startDateAppl" Type="DateTime" />
                        <asp:Parameter Name="la_endDateAppl" Type="DateTime" />
                        <asp:Parameter Name="la_appStatus" Type="String" />
                        <asp:Parameter Name="la_apprRejBy" Type="String" />
                        <asp:Parameter Name="la_apprRejOn" Type="DateTime" />
                        <asp:Parameter Name="la_startDateApr" Type="DateTime" />
                        <asp:Parameter Name="la_endDateApr" Type="DateTime" />
                        <asp:SessionParameter Name="userId" SessionField="userid" Type="int32" />
                        <asp:Parameter Name="la_id" Type="Int32" />
                        <asp:Parameter Name="la_joinDateTime" Type="DateTime" />
                        <asp:Parameter Name="la_Remarks" Type="string" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="la_cntId" Type="String" />
                        <asp:Parameter Name="la_appType" Type="String" />
                        <asp:Parameter Name="la_Consideration" Type="String" />
                        <asp:Parameter Name="la_ReceivedPhysical" Type="String" />
                        <asp:Parameter Name="la_appDate" Type="DateTime" />
                        <asp:Parameter Name="la_startDateAppl" Type="DateTime" />
                        <asp:Parameter Name="la_endDateAppl" Type="DateTime" />
                        <asp:Parameter Name="la_totaldaysAppl" Type="Int32" />
                        <asp:Parameter Name="la_appStatus" Type="String" />
                        <asp:Parameter Name="la_apprRejBy" Type="String" />
                        <asp:Parameter Name="la_apprRejOn" Type="DateTime" />
                        <asp:Parameter Name="la_startDateApr" Type="DateTime" />
                        <asp:Parameter Name="la_endDateApr" Type="DateTime" />
                        <asp:Parameter Name="la_totaldaysApr" Type="Int32" />
                        <asp:SessionParameter Name="userId" SessionField="userid" Type="String" />
                        <asp:Parameter Name="la_joinDateTime" Type="DateTime" />
                        <asp:Parameter Name="la_Remarks" Type="string" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="AllEmployee" runat="server" ConflictDetection="CompareAllValues"
                    ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" SelectCommand="">
                </asp:SqlDataSource>
            </td>
            </tr>
        </table>
        <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
        </dxwgv:ASPxGridViewExporter>
    </form>
</body>
</html>
