<%@ page language="C#" autoeventwireup="true" inherits="management_frmNsdlClients_Remarks, App_Web_8qixh_8w" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>

    <script language="javascript" type="text/javascript">
    
    function disp_prompt(name)
    {
        var qrStr=window.location .search ;
        var spQrStr=qrStr.substring(1);
        if ( name == "tab0")
        {
            document.location.href="frmNsdlClients_General.aspx?"+spQrStr; 
        }
        if ( name == "tab1")
        {
            document.location.href="frmNsdlClients_JointHolders.aspx?"+spQrStr; 
        }
        else if ( name == "tab2")
        {
            document.location.href="frmNsdlClients_BankDetail.aspx?"+spQrStr; 
        }
        else if ( name == "tab3")
        {
            document.location.href="frmNsdlClients_NomineePOA.aspx?"+spQrStr; 
        }
        else if ( name == "tab4")
        {
            document.location.href="frmNsdlClients_Documents.aspx?"+spQrStr; 
        }
        else if ( name == "tab5")
        {
            document.location.href="frmNsdlClients_Groups.aspx?"+spQrStr; 
        }
        else if ( name == "tab6")
        {
            document.location.href="frmNsdlClients_Remarks.aspx?"+spQrStr; 
        }
        else if ( name == "tab7")
        {
            document.location.href="frmNsdlClients_OtherDetail.aspx?"+spQrStr; 
        }
        else if ( name == "tab8")
        {
            document.location.href="frmNsdlClients_Corrospondance.aspx?"+spQrStr; 
        }
        else if ( name == "tab9")
        {
            document.location.href="frmNsdlClients_Subscriptions.aspx?"+spQrStr; 
        }
         
        
    }
    FieldName='ASPxPageControl1_ASPxLabel3';
    </script>

    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td>
                        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="6" ClientInstanceName="page"
                            Font-Size="10px">
                            <tabpages>
                                <dxtc:TabPage Name="General" Text="General">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                    <TabStyle Font-Bold="True">
                                    </TabStyle>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="JointHolders" Text="Joint Holders">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                    <TabStyle Font-Bold="True">
                                    </TabStyle>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="BankDetail" Text="Bank Detail">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                    <TabStyle Font-Bold="True">
                                    </TabStyle>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Nominee_POA" Text="Nominee &amp; POA">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                    <TabStyle Font-Bold="True">
                                    </TabStyle>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Documents" Text="Documents">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                    <TabStyle Font-Bold="True">
                                    </TabStyle>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Groups" Text="Groups">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                    <TabStyle Font-Bold="True">
                                    </TabStyle>
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
                                                        Width="40%" VisibleIndex="0" Visible="true">
                                                        <EditFormSettings Visible="False" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataComboBoxColumn FieldName="cat_id" Visible="False" VisibleIndex="1">
                                                        <PropertiesComboBox Width="300px" DataSourceID="sqlCategory" ValueField="id" TextField="cat_description"
                                                            ValueType="System.String">
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
                                                    <dxwgv:GridViewCommandColumn VisibleIndex="1">
                                                        <EditButton Visible="True">
                                                        </EditButton>
                                                        <DeleteButton Visible="True">
                                                        </DeleteButton>
                                                    </dxwgv:GridViewCommandColumn>
                                                </Columns>
                                               
                                                <Styles>
                                                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                    </Header>
                                                    <LoadingPanel ImageSpacing="10px">
                                                    </LoadingPanel>
                                                </Styles>
                                                <Settings ShowFooter="True" ShowGroupedColumns="True" ShowGroupPanel="True" ShowTitlePanel="True" />
                                                <SettingsText PopupEditFormCaption="Add/Modify Remarks" ConfirmDelete="Are you sure to Delete this Record!" />
                                                <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True">
                                                </SettingsPager>
                                                <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
                                                <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="200px" PopupEditFormHorizontalAlign="Center"
                                                    PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="600px"
                                                    EditFormColumnCount="1" />
                                                <Templates>
                                                    <TitlePanel>
                                                        <table style="width: 100%">
                                                            <tr>
                                                                <td align="right">
                                                                    <table width="200">
                                                                        <tr>
                                                                            <td>
                                                                                <dxe:ASPxButton ID="ASPxButton2" runat="server" Text="Search" ToolTip="Search" OnClick="btnSearch"
                                                                                    Height="18px" Width="88px">
                                                                                </dxe:ASPxButton>
                                                                            </td>
                                                                            <td>
                                                                                <dxe:ASPxButton ID="ASPxButton1" runat="server" Text="ADD" ToolTip="Add New Data"
                                                                                    Height="18px" Width="88px" AutoPostBack="False">
                                                                                    <ClientSideEvents Click="function(s, e) {grid.AddNewRow();}" />
                                                                                </dxe:ASPxButton>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </TitlePanel>
                                                </Templates>
                                            </dxwgv:ASPxGridView>
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                    <TabStyle Font-Bold="True">
                                    </TabStyle>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="OtherDetail" Text="Other Detail">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                    <TabStyle Font-Bold="True">
                                    </TabStyle>
                                </dxtc:TabPage>
                                  <dxtc:TabPage Name="Correspondance" Text="Correspondance">
<TabStyle Font-Bold="True"></TabStyle>
<ContentCollection>
<dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="Subscription" Text="Subscription">
<TabStyle Font-Bold="True"></TabStyle>
<ContentCollection>
<dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
                            </tabpages>
                            <clientsideevents activetabchanged="function(s, e) {
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
	                                           
	                                            }"></clientsideevents>
                            <contentstyle>
                                <Border BorderColor="#002D96" BorderStyle="Solid" BorderWidth="1px" />
                            </contentstyle>
                            <loadingpanelstyle imagespacing="6px">
                            </loadingpanelstyle>
                        </dxtc:ASPxPageControl>
                    </td>
                </tr>
                <tr>
                    <td style="height: 8px">
                        <table style="width: 100%;">
                            <tr>
                                <td align="right" style="width: 843px">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="SqlRemarks" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                DeleteCommand="DELETE FROM [tbl_master_contactRemarks] WHERE [id] = @id" InsertCommand="INSERT INTO [tbl_master_contactRemarks] ([rea_internalId],[cat_id], [rea_Remarks], [CreateDate], [CreateUser]) VALUES (@rea_internalId,@cat_id, @rea_Remarks, getdate(), @CreateUser)"
                SelectCommand="SELECT *,isnull((select cat_description from tbl_master_remarksCategory where id=tbl_master_contactRemarks.cat_id),'None') as description FROM [tbl_master_contactRemarks] where rea_internalId=@rea_internalId"
                UpdateCommand="UPDATE [tbl_master_contactRemarks] SET [rea_internalId] = @rea_internalId,cat_id=@cat_id, [rea_Remarks] = @rea_Remarks,  [LastModifyDate] = getdate(), [LastModifyUser] = @LastModifyUser WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
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
                SelectCommand="SELECT * FROM [tbl_master_remarksCategory]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
