<%@ page language="C#" autoeventwireup="true" inherits="management_FundManager, App_Web_yq8u0p-o" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>

         <script language="javascript" type="text/javascript">
    function EndCall(obj)
    {
        height();
    }
    function callback()
    {
      grid.PerformCallback();
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
        function OnMoreInfoClick(keyValue)
        {
            var url='FundManager_general.aspx?id='+keyValue;
            parent.OnMoreInfoClick(url,"Modify FundManager Details",'940px','450px',"Y");
     
        }
        function OnAddButtonClick() 
        {
             var url='FundManager_general.aspx?id=' + 'ADD';
             parent.OnMoreInfoClick(url,"Add FundManager Details",'940px','450px',"Y");
           
        }
        function OnContactInfoClick(keyValue,CompName)
        {
            var url='insurance_contactPerson.aspx?id='+keyValue;
            parent.OnMoreInfoClick(url, "FundManager Name : "+CompName+"",'940px','450px',"Y");
         
        }
        function ShowHideFilter(obj)
        {
            grid.PerformCallback(obj);
        }  
            </script>

            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align:center;">
                        <strong><span style="color: #000099">FundManager Details</span></strong></td>
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
                        <dxwgv:ASPxGridView ID="FundManagerGrid" runat="server" KeyFieldName="FundManager_InternalID"
                            AutoGenerateColumns="False" DataSourceID="SqlFundManager" Width="100%" ClientInstanceName="grid"
                            OnCustomCallback="FundManagerGrid_CustomCallback" OnCustomJSProperties="FundManagerGrid_CustomJSProperties">
                            <ClientSideEvents EndCallback="function(s, e) {
	EndCall(s.cpEND);
}" />
                            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
                            <Styles>
<Header CssClass="gridheader" SortingImageSpacing="5px" ImageSpacing="5px"></Header>

<FocusedRow CssClass="gridselectrow"></FocusedRow>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>

<FocusedGroupRow CssClass="gridselectrow"></FocusedGroupRow>
</Styles>
                            <SettingsPager ShowSeparators="True" AlwaysShowPager="True" NumericButtonCount="20"
                                PageSize="20">
<FirstPageButton Visible="True"></FirstPageButton>

<LastPageButton Visible="True"></LastPageButton>
</SettingsPager>
                            <Columns>
<dxwgv:GridViewDataTextColumn VisibleIndex="0" FieldName="Name" Caption="Name">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="FundManager_Gender" Caption="Gender">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="FundManager_NationalityID" Caption="Nationality">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="FundManager_LegalStatus" Caption="Legal Status">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="4" FieldName="FundManager_DOB" Caption="DOB">
<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="5" Width="10%" Caption="Details">
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
<DataItemTemplate>
                                        <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                                            More Info...</a>
                                    
</DataItemTemplate>

<CellStyle Wrap="False"></CellStyle>
<HeaderTemplate>
                                        <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                                  { %>
                                        <a href="javascript:void(0);" onclick="OnAddButtonClick()"><span style="color: #000099;
                                            text-decoration: underline">Add New</span> </a>
                                        <%} %>
                                    
</HeaderTemplate>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="6" Width="10%" Caption="Cont.Person"><DataItemTemplate>
                                        <a href="javascript:void(0);" onclick="OnContactInfoClick('<%# Container.KeyValue %>','<%#Eval("Name") %>')">
                                    Show</a>
                                    
</DataItemTemplate>

<CellStyle Wrap="False" HorizontalAlign="Left"></CellStyle>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
</Columns>
                            <SettingsEditing Mode="PopupEditForm" PopupEditFormHorizontalAlign="Center" PopupEditFormModal="True"
                                PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="900px" EditFormColumnCount="3" />
                            <SettingsText PopupEditFormCaption="Add/ Modify Employee" ConfirmDelete="Are you sure to delete?" />
                            <Settings ShowGroupPanel="True" ShowStatusBar="Visible" />
                        </dxwgv:ASPxGridView>
                        <asp:SqlDataSource ID="SqlFundManager" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                            SelectCommand="select FundManager_ID,FundManager_InternalID,(select sal_name from tbl_master_salutation where sal_id=Master_FundManagers.FundManager_Salutation)+' '+isnull(ltrim(rtrim(FundManager_FirstName)),'')+' [ '+isnull(ltrim(rtrim(FundManager_LastName)),'')+' ]' as Name,case FundManager_Gender when 0 then 'Male' else 'FeMale' end as FundManager_Gender,(select cou_country from tbl_master_country where cou_id=Master_FundManagers.FundManager_NationalityID) as FundManager_NationalityID,(select lgl_legalStatus from tbl_master_legalstatus where lgl_id=Master_FundManagers.FundManager_LegalStatus) as FundManager_LegalStatus,convert(varchar(11),FundManager_DOB,113) as FundManager_DOB from Master_FundManagers">
                        </asp:SqlDataSource>
                        <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
                        </dxwgv:ASPxGridViewExporter>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
