<%@ page language="C#" autoeventwireup="true" inherits="management_Employee_Remarks, App_Web_6yanuau_" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Employee Document</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>

    <script type="text/javascript">

    function Show() {

        var url = "frmAddDocuments.aspx?id=Employee_Document.aspx&id1=Employee";

        popup.SetContentUrl(url);

        popup.Show();

    }
function disp_prompt(name)
    {
        //var ID = document.getElementById(txtID);
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
        //document.location.href="Employee_Remarks.aspx"; 
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
                        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="10" ClientInstanceName="page">
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
                                            <dxwgv:ASPxGridView ID="GridRemarks" ClientInstanceName="grid" runat="server" AutoGenerateColumns="False"
                                                DataSourceID="SqlRemarks" KeyFieldName="id" Width="100%" OnCellEditorInitialize="GridRemarks_CellEditorInitialize">
                                                <Columns>
                                                    <dxwgv:GridViewDataTextColumn FieldName="id" ReadOnly="True" Visible="False" VisibleIndex="0">
                                                        <EditFormSettings Visible="False" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="rea_internalId" VisibleIndex="1" Visible="False">
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="description" Caption="Remarks Category"
                                                        Width="40%" VisibleIndex="0">
                                                        <EditFormSettings Visible="False" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataComboBoxColumn FieldName="cat_id" Visible="False" VisibleIndex="1">
                                                        <PropertiesComboBox Width="300px" DataSourceID="sqlCategory" ValueField="id" TextField="cat_description"
                                                            ValueType="System.Int32">
                                                        </PropertiesComboBox>
                                                        <EditFormSettings Caption="Category" Visible="True" VisibleIndex="0" />
                                                        <EditCellStyle Wrap="False">
                                                        </EditCellStyle>
                                                    </dxwgv:GridViewDataComboBoxColumn>
                                                    <dxwgv:GridViewDataMemoColumn Caption="Remarks" FieldName="rea_Remarks" VisibleIndex="1"
                                                        Width="40%">
                                                        <EditCellStyle HorizontalAlign="Left">
                                                        </EditCellStyle>
                                                        <EditFormCaptionStyle HorizontalAlign="Right">
                                                        </EditFormCaptionStyle>
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                        <PropertiesMemoEdit Height="100px" Width="350px">
                                                        </PropertiesMemoEdit>
                                                        <EditFormSettings Caption="Remarks" VisibleIndex="1" />
                                                    </dxwgv:GridViewDataMemoColumn>
                                                    <dxwgv:GridViewCommandColumn VisibleIndex="2">
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
                                                <Styles>
                                                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                    </Header>
                                                    <LoadingPanel ImageSpacing="10px">
                                                    </LoadingPanel>
                                                </Styles>
                                                <Settings ShowFooter="True" ShowGroupedColumns="True" ShowTitlePanel="True" />
                                                <SettingsText PopupEditFormCaption="Add/Modify Remarks" ConfirmDelete="Are you sure to Delete this Record!" />
                                                <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True">
                                                </SettingsPager>
                                                <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
                                                <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="200px" PopupEditFormHorizontalAlign="Center"
                                                    PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="600px"
                                                    EditFormColumnCount="1" />
                                            </dxwgv:ASPxGridView>
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
                    <td>
                        <asp:TextBox ID="txtID" runat="server" Visible="false"></asp:TextBox></td>
                </tr>
            </table>
            <asp:SqlDataSource ID="SqlRemarks" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                DeleteCommand="INSERT INTO  tbl_master_contactRemarks_Log (id, rea_internalId, cat_id, rea_Remarks, CreateDate, CreateUser, LastModifyDate, LastModifyUser, LogModifyDate, LogModifyUser, LogStatus)SELECT id,rea_internalId,cat_id,rea_Remarks,createDate,createuser, LastModifyDate, LastModifyUser,getdate(),@CreateUser,'D' FROM tbl_master_contactRemarks WHERE [id] = @id DELETE FROM [tbl_master_contactRemarks] WHERE [id] = @id"
                InsertCommand="INSERT INTO [tbl_master_contactRemarks] ([rea_internalId],[cat_id], [rea_Remarks], [CreateDate], [CreateUser]) VALUES (@rea_internalId,@cat_id, @rea_Remarks, getdate(), @CreateUser)"
                SelectCommand="SELECT *,isnull((select cat_description from tbl_master_remarksCategory where id=tbl_master_contactRemarks.cat_id),'None') as description FROM [tbl_master_contactRemarks] where rea_internalId=@rea_internalId"
                UpdateCommand="INSERT INTO  tbl_master_contactRemarks_Log (id, rea_internalId, cat_id, rea_Remarks, CreateDate,CreateUser, LastModifyDate, LastModifyUser, LogModifyDate, LogModifyUser, LogStatus) SELECT id,rea_internalId,cat_id,rea_Remarks,createDate,createuser, LastModifyDate, LastModifyUser,getdate(),@LastModifyUser,'M' FROM tbl_master_contactRemarks WHERE [id] = @id UPDATE [tbl_master_contactRemarks] SET [rea_internalId] = @rea_internalId,cat_id=@cat_id, [rea_Remarks] = @rea_Remarks,  [LastModifyDate] = getdate(), [LastModifyUser] = @LastModifyUser WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                    <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="string" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:SessionParameter Name="rea_internalId" SessionField="KeyVal_InternalID" Type="string" />
                    <asp:Parameter Name="cat_id" Type="int32" />
                    <asp:Parameter Name="rea_Remarks" Type="String" />
                    <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="string" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:SessionParameter Name="rea_internalId" SessionField="KeyVal_InternalID" Type="string" />
                    <asp:Parameter Name="cat_id" Type="int32" />
                    <asp:Parameter Name="rea_Remarks" Type="String" />
                    <asp:SessionParameter Name="LastModifyUser" SessionField="userid" Type="string" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="rea_internalId" SessionField="KeyVal_InternalID" Type="string" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sqlCategory" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                SelectCommand="SELECT id,rtrim(ltrim(cat_description)) as cat_description FROM [tbl_master_remarksCategory] where cat_applicablefor='Em'">
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
