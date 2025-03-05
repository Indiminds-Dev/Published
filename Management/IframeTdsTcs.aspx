<%@ page language="C#" autoeventwireup="true" inherits="management_IframeTdsTcs, App_Web_fxnvzv_8" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tds Tcs</title>
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
        function OnMoreInfoClick(keyValue) {
         var url='frm_TdsTcsPopUp.aspx?id='+keyValue;
	     parent.OnMoreInfoClick(url,"Modify TDS/TCS Details",'940px','500px','Y');
        }
        function OnAddButtonClick() 
        {
             var url='frm_TdsTcsPopUp.aspx?id=' + 'ADD';
            parent.OnMoreInfoClick(url,"Modify TDS/TCS Details",'940px','500px','Y');
        }
        function callback()
        {
            gridTdsTcs.PerformCallback();
        }
        function height()
        {
            if(document.body.scrollHeight>=350)
            {
                window.frameElement.height = document.body.scrollHeight;
            }
            else
            {
                window.frameElement.height = '350px';
            }
            window.frameElement.widht = document.body.scrollWidht;
        }
           function EndCall(obj)
    {
        height();
    }
    </script> 
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain100">            
             <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">TDS/TCS</span></strong>
                    </td>
                </tr>
            <tr>
                <td>
                    <dxwgv:ASPxGridView ID="gridTdsTcs" runat="server" AutoGenerateColumns="False" Width="100%"
                        ClientInstanceName="gridTdsTcs" DataSourceID="SqlTdsCts" KeyFieldName="TDSTCS_ID"
                        OnCustomCallback="gridTdsTcs_CustomCallback" OnCustomJSProperties="gridTdsTcs_CustomJSProperties">
                        <Styles>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                            <FocusedGroupRow CssClass="gridselectrow">
                            </FocusedGroupRow>
                            <FocusedRow CssClass="gridselectrow">
                            </FocusedRow>
                        </Styles>
                        <Settings ShowStatusBar="Visible" ShowGroupPanel="True" />
                        <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
                        <SettingsPager ShowSeparators="True" AlwaysShowPager="True" NumericButtonCount="20"
                            PageSize="20">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="TDSTCS_ID" Visible="False" ReadOnly="True"
                                VisibleIndex="0">
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="TDSTCS_Type" Caption="Type" VisibleIndex="0">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="TDSTCS_Code" Caption="Code" ReadOnly="True"
                                VisibleIndex="1">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="TDSTCS_Description" Caption="Description"
                                VisibleIndex="2">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="TDSTCS_MainAccountCode" Caption="Main Account"
                                VisibleIndex="3">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="TDSTCS_SubAccountCode" Caption="Sub Account"
                                VisibleIndex="4">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Details" VisibleIndex="5">
                                <DataItemTemplate>
                                    <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                                   { %>
                                    <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">
                                        Edit</a>
                                    <%} %>
                                </DataItemTemplate>
                                <EditFormSettings Visible="False" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                                <HeaderStyle HorizontalAlign="Center" />
                                <HeaderTemplate>
                                    <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                                  { %>
                                    <a href="javascript:void(0);" onclick="OnAddButtonClick( )"><span style="color: #000099;
                                        text-decoration: underline">Add New</span> </a>
                                    <%} %>
                                </HeaderTemplate>
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <ClientSideEvents EndCallback="function(s, e) {
	EndCall(s.cpEND);
}" />
                    </dxwgv:ASPxGridView>
                    <asp:SqlDataSource ID="SqlTdsCts" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                        DeleteCommand="DELETE FROM [Master_TDSTCS] WHERE [TDSTCS_ID] = @TDSTCS_ID AND [TDSTCS_Code] = @TDSTCS_Code"
                        InsertCommand="INSERT INTO [Master_TDSTCS] ([TDSTCS_Type], [TDSTCS_Code], [TDSTCS_Description], [TDSTCS_MainAccountCode], [TDSTCS_SubAccountCode], [TDSTCS_CreateUser], [TDSTCS_CreateDateTime], [TDSTCS_ModifyUser], [TDSTCS_ModifyDateTime]) VALUES (@TDSTCS_Type, @TDSTCS_Code, @TDSTCS_Description, @TDSTCS_MainAccountCode, @TDSTCS_SubAccountCode, @TDSTCS_CreateUser, @TDSTCS_CreateDateTime, @TDSTCS_ModifyUser, @TDSTCS_ModifyDateTime)"
                        SelectCommand="select TDSTCS_ID,TDSTCS_Type,TDSTCS_Code,TDSTCS_Description,(select mainaccount_name from master_mainaccount where mainaccount_accountcode=Master_TDSTCS.TDSTCS_MainAccountCode) as TDSTCS_MainAccountCode,(isnull((select isnull(ltrim(rtrim(cnt_firstname)),'')+' '+isnull(ltrim(rtrim(cnt_middlename)),'')+' '+isnull(ltrim(rtrim(cnt_lastname)),'') from tbl_master_contact where cnt_internalid=Master_TDSTCS.TDSTCS_SubAccountCode),isnull((select top 1 subaccount_name from master_subaccount where cast(subaccount_code as varchar)=Master_TDSTCS.TDSTCS_SubAccountCode),isnull((select subaccount_name from master_subaccount where cast(subaccount_referenceid as varchar)=Master_TDSTCS.TDSTCS_SubAccountCode),isnull((select top 1 cdslclients_firstholdername from master_cdslclients where cast(cdslclients_benaccountnumber as varchar)=Master_TDSTCS.TDSTCS_SubAccountCode),(select nsdlclients_benfirstholdername from master_nsdlclients where cast(nsdlclients_benaccountid as varchar)=Master_TDSTCS.TDSTCS_SubAccountCode)))))) as TDSTCS_SubAccountCode from Master_TDSTCS order by TDSTCS_CreateDateTime desc"
                        UpdateCommand="UPDATE [Master_TDSTCS] SET [TDSTCS_Type] = @TDSTCS_Type, [TDSTCS_Description] = @TDSTCS_Description, [TDSTCS_MainAccountCode] = @TDSTCS_MainAccountCode, [TDSTCS_SubAccountCode] = @TDSTCS_SubAccountCode, [TDSTCS_CreateUser] = @TDSTCS_CreateUser, [TDSTCS_CreateDateTime] = @TDSTCS_CreateDateTime, [TDSTCS_ModifyUser] = @TDSTCS_ModifyUser, [TDSTCS_ModifyDateTime] = @TDSTCS_ModifyDateTime WHERE [TDSTCS_ID] = @TDSTCS_ID AND [TDSTCS_Code] = @TDSTCS_Code">
                        <DeleteParameters>
                            <asp:Parameter Name="TDSTCS_ID" Type="Int32" />
                            <asp:Parameter Name="TDSTCS_Code" Type="String" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="TDSTCS_Type" Type="String" />
                            <asp:Parameter Name="TDSTCS_Description" Type="String" />
                            <asp:Parameter Name="TDSTCS_MainAccountCode" Type="String" />
                            <asp:Parameter Name="TDSTCS_SubAccountCode" Type="String" />
                            <asp:Parameter Name="TDSTCS_ModifyUser" Type="Int32" />
                            <asp:Parameter Name="TDSTCS_ModifyDateTime" Type="DateTime" />
                            <asp:Parameter Name="TDSTCS_ID" Type="Int32" />
                            <asp:Parameter Name="TDSTCS_Code" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="TDSTCS_Type" Type="String" />
                            <asp:Parameter Name="TDSTCS_Code" Type="String" />
                            <asp:Parameter Name="TDSTCS_Description" Type="String" />
                            <asp:Parameter Name="TDSTCS_MainAccountCode" Type="String" />
                            <asp:Parameter Name="TDSTCS_SubAccountCode" Type="String" />
                            <asp:Parameter Name="TDSTCS_CreateUser" Type="Int32" />
                            <asp:Parameter Name="TDSTCS_CreateDateTime" Type="DateTime" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
