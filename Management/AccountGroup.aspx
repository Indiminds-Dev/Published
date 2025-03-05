<%@ page language="C#" autoeventwireup="true" inherits="management_AccountGroup, App_Web_6yanuau_" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">
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
     function ShowHideFilter(obj)
    {
        grid.PerformCallback(obj);
    } 
    function EndCall(obj)
    {
        height();
        if(grid.cpDelmsg!=null)
            alert(grid.cpDelmsg);
         
         
    }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" style="text-align: center;">
                    <strong><span style="color: #000099">Account Group</span></strong>
                </td>
            </tr>
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
            </tr>
        </table>
        <dxwgv:ASPxGridView ID="AccountGroup" runat="server" ClientInstanceName="grid" AutoGenerateColumns="False"
            DataSourceID="SqlDsAccountGroup" Width="100%" KeyFieldName="AccountGroupID" OnHtmlEditFormCreated="AccountGroup_HtmlEditFormCreated"
            OnCellEditorInitialize="AccountGroup_CellEditorInitialize" OnRowValidating="AccountGroup_OnRowValidating"
            OnRowUpdating="AccountGroup_OnRowUpdating" OnCustomCallback="AccountGroup_CustomCallback"
            OnCustomJSProperties="AccountGroup_CustomJSProperties" OnRowDeleting="AccountGroup_RowDeleting">
            <ClientSideEvents EndCallback="function(s, e) {
	  EndCall(s.cpEND);
}" />
            <Templates><EditForm>
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 25%">
                            </td>
                            <td style="width: 50%">
                                <controls>
                                <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormEditors"  ID="Editors">
                                </dxwgv:ASPxGridViewTemplateReplacement>                                                           
                            </controls>
                                <div style="text-align: right; padding: 2px 2px 2px 2px; font-weight: bold;">
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
            <SettingsBehavior ConfirmDelete="True" allowfocusedrow="True" />
            <Styles>
<Header CssClass="gridheader" SortingImageSpacing="5px" ImageSpacing="5px"></Header>

<FocusedRow CssClass="gridselectrow"></FocusedRow>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>

<FocusedGroupRow CssClass="gridselectrow"></FocusedGroupRow>
</Styles>
            <SettingsPager NumericButtonCount="20" PageSize="20" AlwaysShowPager="True" ShowSeparators="True">
<FirstPageButton Visible="True"></FirstPageButton>

<LastPageButton Visible="True"></LastPageButton>
</SettingsPager>
            <Columns>
<dxwgv:GridViewDataComboBoxColumn Visible="False" FieldName="AccountGroupType" Caption="Account Type" VisibleIndex="1" Width="50px">
<PropertiesComboBox ValueType="System.String"><Items>
<dxe:ListEditItem Value="Asset" Text="Asset"></dxe:ListEditItem>
<dxe:ListEditItem Value="Liability" Text="Liability"></dxe:ListEditItem>
<dxe:ListEditItem Value="Income" Text="Income"></dxe:ListEditItem>
<dxe:ListEditItem Value="Expences" Text="Expences"></dxe:ListEditItem>
</Items>
</PropertiesComboBox>

<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormSettings Visible="True" VisibleIndex="1"></EditFormSettings>
</dxwgv:GridViewDataComboBoxColumn>
<dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="2" FieldName="AccountGroupCode" Caption="Code">
<CellStyle CssClass="gridcellleft"></CellStyle>

<PropertiesTextEdit>
<ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
<RequiredField IsRequired="True" ErrorText="Code Required!."></RequiredField>
</ValidationSettings>
</PropertiesTextEdit>

<EditFormSettings Visible="True" VisibleIndex="2"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="0" FieldName="AccountGroupName" Caption="Name">

<CellStyle CssClass="gridcellleft"></CellStyle>

<PropertiesTextEdit>
<ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
<RequiredField IsRequired="True" ErrorText="Name Required!."></RequiredField>
</ValidationSettings>
</PropertiesTextEdit>

<EditFormCaptionStyle Wrap="False" HorizontalAlign="Right"></EditFormCaptionStyle>

<EditFormSettings Visible="True" VisibleIndex="3"></EditFormSettings>
  
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataComboBoxColumn FieldName="AccountGroupParentID" Caption="Parent ID" VisibleIndex="1">
<PropertiesComboBox ValueType="System.String" TextField="ParentIDWithName" ValueField="ParentID" DataSourceID="SqlDs1AccountGroupParentID"></PropertiesComboBox>

<Settings FilterMode="DisplayText"></Settings>

<CellStyle CssClass="gridcellleft"></CellStyle>

<EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top"></EditFormCaptionStyle>

<EditFormSettings Visible="True" VisibleIndex="4"></EditFormSettings>
</dxwgv:GridViewDataComboBoxColumn>
<dxwgv:GridViewCommandColumn VisibleIndex="2">
<DeleteButton Visible="True"></DeleteButton>
<HeaderTemplate>
                        <a href="javascript:void(0);" onclick="grid.AddNewRow()"><span style="color: #000099;
                            text-decoration: underline">Add New</span> </a>
                    
</HeaderTemplate>

<EditButton Visible="True"></EditButton>
</dxwgv:GridViewCommandColumn>
</Columns>
            <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="250px" PopupEditFormHorizontalAlign="Center"
                PopupEditFormModal="True" PopupEditFormVerticalAlign="BottomSides" PopupEditFormWidth="600px"
                EditFormColumnCount="1" />
            <SettingsText PopupEditFormCaption="Add/Modify Account Group" ConfirmDelete="Are You Sure To Delete This Record ???" />
            <Settings ShowGroupPanel="True" ShowStatusBar="Visible" />
        </dxwgv:ASPxGridView>
        <asp:SqlDataSource ID="SqlDsAccountGroup" runat="server" ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>"
            DeleteCommand="DELETE FROM [Master_AccountGroup] WHERE [AccountGroup_ReferenceID] = @AccountGroupID"
            InsertCommand="InsertInAccountGroup" InsertCommandType="StoredProcedure" SelectCommand="SELECT a.[AccountGroup_ReferenceID] as AccountGroupID,a.[AccountGroup_Type] as AccountGroupType ,a.[AccountGroup_Code] as AccountGroupCode ,a.[AccountGroup_Name] as AccountGroupName,a.[AccountGroup_ParentGroupID]as AccountGroupParentID1,b.AccountGroup_Name as AccountGroupParentID FROM [Master_AccountGroup] AS a LEFT OUTER JOIN [Master_AccountGroup] AS B on a.AccountGroup_ParentGroupID=b.AccountGroup_ReferenceID order by AccountGroupID Desc"
            UpdateCommand="update table1 set temp123='123'">
            <DeleteParameters>
                <asp:Parameter Name="AccountGroupID" Type="int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="AccountGroupID" Type="int32" />
                <asp:Parameter Name="AccountGroupType" Type="String" />
                <asp:Parameter Name="AccountGroupCode" Type="String" />
                <asp:Parameter Name="AccountGroupName" Type="String" />
                <asp:Parameter Name="AccountGroupParentID" Type="Int32" />
                <asp:Parameter Name="CreateUser" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="AccountGroupType" Type="String" />
                <asp:Parameter Name="AccountGroupCode" Type="String" />
                <asp:Parameter Name="AccountGroupName" Type="String" />
                <asp:Parameter Name="AccountGroupParentID" Type="Int32" />
                <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="int32" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDs1AccountGroupParentID" runat="server" ConflictDetection="CompareAllValues"
            ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" SelectCommand="">
        </asp:SqlDataSource>
    </form>
</body>
</html>
