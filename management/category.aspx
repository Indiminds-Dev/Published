<%@ page language="C#" autoeventwireup="true" inherits="management_category, App_Web__y0k_erv" %>

<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Category</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript">
        function SignOff()
        {
            window.parent.SignOff()
        }
        function ShowHideFilter(obj)
        {
            grid.PerformCallback(obj);
        }
        
        function height()
        {
            if(document.body.scrollHeight<=500)
                window.frameElement.height = '500px';
            else
                window.frameElement.height = document.body.scrollHeight;
                window.frameElement.widht = document.body.scrollWidht;
        }
        function LastCall(obj)
        {
            height();
            if(Action=='')
                 MakeRowInVisible();
        }
        
        function MakeRowVisible()
        {
            Action='add';
            document.getElementById("SaveRow").style.display ='inline';
            Status='SAVE_NEW';
            document.getElementById("ASPxCallbackPanel1_txtcat_desc").value='';
            
        }
        function MakeRowInVisible()
        {
            document.getElementById("SaveRow").style.display ='none';
        }
        function Call_save()
        {
             AddPanel.PerformCallback(Status);
        }
        function Call_edit()
        {
             AddPanel.PerformCallback('edit');
        }
        function PEndCallBack(obj)
        {
            if(obj=='Y')
            {
                 Action='';
                 ShowHideFilter('All');
            }
        }
        function OnEdit(obj)
        {
           Action='edit';
           document.getElementById("SaveRow").style.display ='inline';
           Status=obj;
           AddPanel.PerformCallback('BEFORE_'+obj);
        }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" style="text-align: center" colspan="4">
                    <strong><span style="color: #000099">Categories</span></strong>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <table class="TableMain100">
                        <tr>
                            <td colspan="4" style="text-align: left; vertical-align: top">
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
                            <td class="gridcellright">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr runat="server" id="SaveRow">
                <td>
                    <dxcp:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" ClientInstanceName="AddPanel"
                        OnCallback="ASPxCallbackPanel1_Callback" OnCustomJSProperties="ASPxCallbackPanel1_CustomJSProperties">
                        <PanelCollection>
                            <dxp:PanelContent runat="server">
                                <table>
                                    <tr>
                                        <td>
                                            Category Description:</td>
                                        <td>
                                            <asp:TextBox ID="txtcat_desc" runat="server"></asp:TextBox></td>
                                        <td>
                                            Applicable For</td>
                                        <td valign="middle">
                                            <dxe:ASPxComboBox ID="CboApplicableFor" runat="server" ClientInstanceName="combo"
                                                ValueType="System.String">
                                            </dxe:ASPxComboBox>
                                        </td>
                                        <td>
                                            <input id="btnSave" onclick="Call_save(status)" type="button" value="Save" />
                                          </td>
                                             <td>
                                            <input id="btnCancel"  onclick="MakeRowInVisible()" type="button" value="Cancel" />
                                        </td>
                                    </tr>
                                </table>
                            </dxp:PanelContent>
                        </PanelCollection>
                        <ClientSideEvents EndCallback="function(s, e) {
	                                                    PEndCallBack(s.cpPanel);
                                                    }" />
                    </dxcp:ASPxCallbackPanel>
                </td>
            </tr>
            <tr>
                <td>
                    <dxwgv:ASPxGridView ID="gridCategory" runat="server" ClientInstanceName="grid" AutoGenerateColumns="False"
                        DataSourceID="SqlDataSource1" KeyFieldName="id" Width="100%" OnHtmlEditFormCreated="gridCategory_HtmlEditFormCreated"
                        OnHtmlRowCreated="gridCategory_HtmlRowCreated" OnCustomCallback="gridCategory_CustomCallback"
                        OnCustomJSProperties="gridCategory_CustomJSProperties">
                        <Styles>
                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                        </Styles>
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="id" ReadOnly="True" Visible="False" VisibleIndex="0">
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="cat_description" Caption="Category Description"
                                VisibleIndex="0">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataComboBoxColumn FieldName="cat_applicablefor" Caption="Applicable For"
                                VisibleIndex="1" Width="20%">
                                <PropertiesComboBox ValueType="System.String" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                    Width="300px">
                                </PropertiesComboBox>
                                <EditFormSettings Visible="True" Caption="Applicable For"></EditFormSettings>
                                <EditCellStyle HorizontalAlign="Left" Wrap="False">
                                    <Paddings PaddingTop="15px" />
                                </EditCellStyle>
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right">
                                </EditFormCaptionStyle>
                            </dxwgv:GridViewDataComboBoxColumn>
                            
                            <dxwgv:GridViewDataTextColumn Caption="" VisibleIndex="3">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <HeaderTemplate>
                                    <asp:HyperLink ID="HyperLink2" runat="server" Font-Underline="True" ForeColor="#8080FF"
                                        NavigateUrl="javascript:void(0)" CssClass="myhypertext" onclick="javascript:MakeRowVisible()">Add New</asp:HyperLink>
                                </HeaderTemplate>
                                <DataItemTemplate>
                                    <a href="javascript:void(0);" onclick="OnEdit('EDIT~'+'<%# Container.KeyValue %>')">
                                        <u>Edit</u> </a>
                                </DataItemTemplate>
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <StylesEditors>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                        <Settings ShowStatusBar="Visible" />
                        <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="200px" PopupEditFormHorizontalAlign="Center"
                            PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="600px"
                            EditFormColumnCount="1" />
                        <SettingsText PopupEditFormCaption="Add/Modify Category" ConfirmDelete="Are You Want To Delete This Record ???" />
                        <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                        <SettingsBehavior ConfirmDelete="True" />
                       
                        <ClientSideEvents EndCallback="function(s, e) {
	LastCall(s.cpHeight);
}" />
                    </dxwgv:ASPxGridView>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            DeleteCommand="DELETE FROM [tbl_master_remarksCategory] WHERE [id] = @id" InsertCommand="INSERT INTO [tbl_master_remarksCategory] ([cat_description],[cat_applicablefor]) VALUES (@cat_description,@cat_applicablefor)"
            SelectCommand="SELECT id,cat_description,case cat_applicablefor when 'Em' then 'Employee' when 'Ld' then 'Lead' when 'Sb' then 'Sub Broker' when 'fr' then 'Franchisses' when 'DV' then 'Data Vendors' when 'Cus' then 'Customer' when 'RP' then 'Relationship Partner' when 'BP' then 'Business Partner' when 'BP' then 'Business Partner' else 'Recruitment Agents' end as cat_applicablefor FROM [tbl_master_remarksCategory]"
            UpdateCommand="UPDATE [tbl_master_remarksCategory] SET [cat_description] = @cat_description,cat_applicablefor=@cat_applicablefor WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="cat_description" Type="String" />
                <asp:Parameter Name="cat_applicablefor" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="cat_description" Type="String" />
                <asp:Parameter Name="cat_applicablefor" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <br />
    </form>
</body>
</html>
