<%@ page language="C#" autoeventwireup="true" inherits="management_Lead_Remarks, App_Web_psdiigfa" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">

    <script language="javascript" type="text/javascript">
          function SignOff()
            {
            window.parent.SignOff()
            }
          function height()
            {
                window.frameElement.height = document.body.scrollHeight;
                window.frameElement.widht = document.body.scrollWidht;
            }
        function ShowHideFilter(obj)
    {
        grid.PerformCallback(obj);
    } 
    function callback()
        {
        
            grid.PerformCallback();
        } 
        
        function disp_prompt(name)
    {
        if ( name == "tab0")
        {
        //alert(name);
        document.location.href="Lead_general.aspx"; 
        }
        if ( name == "tab1")
        {
        //alert(name);
        document.location.href="Lead_Correspondence.aspx"; 
        }
        else if ( name == "tab2")
        {
        //alert(name);
        document.location.href="Lead_BankDetails.aspx"; 
        }
        else if ( name == "tab3")
        {
        //alert(name);
        //document.location.href="Lead_DPDetails.aspx"; 
        }
        else if ( name == "tab4")
        {
        //alert(name);
        document.location.href="Lead_Document.aspx"; 
        }
        else if ( name == "tab5")
        {
        //alert(name);
        document.location.href="Lead_FamilyMembers.aspx"; 
        }
        else if ( name == "tab6")
        {
        //alert(name);
        document.location.href="Lead_Registration.aspx"; 
        }
        else if ( name == "tab7")
        {
        //alert(name);
        document.location.href="Lead_GroupMember.aspx"; 
        }
        else if ( name == "tab8")
        {
        //alert(name);
        //document.location.href="Lead_Remarks.aspx"; 
        }
    }
    </script>

    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
               <%--<tr>
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
                </tr>--%>
                <tr>
                    <td>
                        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="8" ClientInstanceName="page">
                            <ContentStyle>
                                <Border BorderColor="#002D96" BorderStyle="Solid" BorderWidth="1px"></Border>
                            </ContentStyle>
                            <TabPages>
                                <dxtc:TabPage Name="General" Text="General">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="CorresPondence" Text="CorresPondence">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Bank Details" Text="Bank Details">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="DP Details" Text="DP Details">
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
                                <dxtc:TabPage Name="Family Members" Text="Family Members">
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
                                <dxtc:TabPage Name="Group Member" Text="Group Member">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Remarks" Text="Remarks">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                            <dxwgv:ASPxGridView runat="server" ClientInstanceName="grid" KeyFieldName="id" AutoGenerateColumns="False"
                                                DataSourceID="SqlRemarks" Width="100%" ID="GridRemarks" __designer:wfdid="w1"
                                                OnCellEditorInitialize="GridRemarks_CellEditorInitialize" OnCustomCallback="GridRemarks_CustomCallback">
                                                <Columns>
                                                    <dxwgv:GridViewDataTextColumn FieldName="id" ReadOnly="True" Visible="False" VisibleIndex="0">
                                                        <EditFormSettings Visible="False"></EditFormSettings>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="rea_internalId" Visible="False" VisibleIndex="1">
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="description" Width="40%" Caption="Remarks Category"
                                                        VisibleIndex="0">
                                                        <EditFormSettings Visible="False"></EditFormSettings>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataComboBoxColumn FieldName="cat_id" Visible="False" VisibleIndex="1">
                                                        <PropertiesComboBox DataSourceID="sqlCategory" TextField="cat_description" ValueField="id"
                                                            ValueType="System.String" Width="300px">
                                                        </PropertiesComboBox>
                                                        <EditFormSettings Visible="True" VisibleIndex="0" Caption="Category"></EditFormSettings>
                                                        <EditCellStyle Wrap="False">
                                                        </EditCellStyle>
                                                    </dxwgv:GridViewDataComboBoxColumn>
                                                    <dxwgv:GridViewDataMemoColumn FieldName="rea_Remarks" Width="40%" Caption="Remarks"
                                                        VisibleIndex="1">
                                                        <PropertiesMemoEdit Width="350px" Height="100px">
                                                        </PropertiesMemoEdit>
                                                        <EditFormSettings Caption="Remarks"></EditFormSettings>
                                                        <EditCellStyle HorizontalAlign="Left">
                                                        </EditCellStyle>
                                                        <EditFormCaptionStyle HorizontalAlign="Right">
                                                        </EditFormCaptionStyle>
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataMemoColumn>
                                                    <dxwgv:GridViewCommandColumn VisibleIndex="2">
                                                        <EditButton Visible="True">
                                                        </EditButton>
                                                        <DeleteButton Visible="True">
                                                        </DeleteButton>
                                                        <HeaderTemplate>
                                                            <a href="javascript:void(0);" onclick="grid.AddNewRow();"><span style="color: #000099;
                                                                text-decoration: underline">Add New</span> </a>
                                                        </HeaderTemplate>
                                                    </dxwgv:GridViewCommandColumn>
                                                </Columns>
                                                <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True"></SettingsBehavior>
                                                <SettingsPager PageSize="20" NumericButtonCount="20" ShowSeparators="True">
                                                    <FirstPageButton Visible="True">
                                                    </FirstPageButton>
                                                    <LastPageButton Visible="True">
                                                    </LastPageButton>
                                                </SettingsPager>
                                                <SettingsEditing Mode="PopupEditForm" PopupEditFormWidth="600px" PopupEditFormHeight="200px"
                                                    PopupEditFormHorizontalAlign="Center" PopupEditFormVerticalAlign="WindowCenter"
                                                    PopupEditFormModal="True" EditFormColumnCount="1"></SettingsEditing>
                                                <Settings ShowTitlePanel="True"></Settings>
                                                <SettingsText ConfirmDelete="Are you sure to Delete this Record!" PopupEditFormCaption="Add/Modify Remarks">
                                                </SettingsText>
                                                <Styles>
                                                    <Header SortingImageSpacing="5px" ImageSpacing="5px">
                                                    </Header>
                                                    <LoadingPanel ImageSpacing="10px">
                                                    </LoadingPanel>
                                                </Styles>
                                                <Templates>
                                                    <TitlePanel>
                                                        <table style="width: 100%">
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
                                                        <%--      <table style="width:100%">
                                                <tr>
                                                     <td align="right">
                                                        <table width="200">
                                                            <tr>
                                                                
                                                                <td>
                                                                    <dxe:ASPxButton ID="ASPxButton2" runat="server" Text="Search" ToolTip="Search" OnClick="btnSearch"  Height="18px" Width="88px">
                                                                    </dxe:ASPxButton>
                                                                </td>
                                                                <td>
                                                                    <dxe:ASPxButton ID="ASPxButton1" runat="server" Text="ADD" ToolTip="Add New Data"   Height="18px" Width="88px" AutoPostBack="False">
                                                                        <clientsideevents click="function(s, e) {grid.AddNewRow();}" />
                                                                    </dxe:ASPxButton>
                                                                </td>
                                                                                                    
                                                                 
                                                              </tr>
                                                          </table>
                                                      </td>   
                                                 </tr>
                                            </table>--%>
                                                    </TitlePanel>
                                                </Templates>
                                            </dxwgv:ASPxGridView>
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                            </TabPages>
                            <TabStyle Font-Size="10px">
                            </TabStyle>
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
	                                            
	                                            
	                                            }"></ClientSideEvents>
                            <LoadingPanelStyle ImageSpacing="6px">
                            </LoadingPanelStyle>
                        </dxtc:ASPxPageControl>
                    </td>
                    <td>
                        <asp:TextBox ID="txtID" runat="server" Visible="false"></asp:TextBox></td>
                </tr>
            </table>
            <asp:SqlDataSource ID="SqlRemarks" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                DeleteCommand="DELETE FROM [tbl_master_LeadRemarks] WHERE [id] = @id" InsertCommand="INSERT INTO [tbl_master_LeadRemarks] ([rea_internalId],[cat_id], [rea_Remarks], [CreateDate], [CreateUser]) VALUES (@rea_internalId,@cat_id, @rea_Remarks, getdate(), @CreateUser)"
                SelectCommand="SELECT *,isnull((select cat_description from tbl_master_remarksCategory where id=tbl_master_LeadRemarks.cat_id),'None') as description FROM [tbl_master_LeadRemarks] where rea_internalId=@rea_internalId"
                UpdateCommand="UPDATE [tbl_master_LeadRemarks] SET [rea_internalId] = @rea_internalId,cat_id=@cat_id, [rea_Remarks] = @rea_Remarks,  [LastModifyDate] = getdate(), [LastModifyUser] = @LastModifyUser WHERE [id] = @id">
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
                SelectCommand="SELECT * FROM [tbl_master_remarksCategory] where cat_applicablefor='Ld'"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
