<%@ page language="C#" autoeventwireup="true" inherits="management_cdslClientRemarks, App_Web_6_wayyot" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
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
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">

    <script language="javascript" type="text/javascript">
function SignOff()
    {
          window.parent.SignOff();
    }
function disp_prompt(name)
    {
         //var ID = document.getElementById(txtID);
        if ( name == "tab0")
        {
        //alert(name);
        document.location.href="CdslClient_general.aspx"; 
        }
        if ( name == "tab1")
        {
        //alert(name);
        document.location.href="CdslClient_jointHolders.aspx"; 
        }
        else if ( name == "tab2")
        {
        //alert(name);
        document.location.href="CdslClient_aditionalHolder.aspx"; 
        }
        else if ( name == "tab3")
        {
        //alert(name);
        document.location.href="CdslClient_bankDetails.aspx"; 
        }
        else if ( name == "tab4")
        {
        //alert(name);
        document.location.href="CdslClient_nominee.aspx"; 
        }
        
        else if ( name == "tab5")
        {
        //alert(name);
        document.location.href="cdslClientDocuments.aspx"; 
        }
        else if ( name == "tab6")
        {
        //alert(name);
        document.location.href="cdslClientGroup.aspx"; 
        }
        else if ( name == "tab7")
        {
        //alert(name);
        document.location.href="cdslClientRemarks.aspx"; 
        }
        else if ( name == "tab8")
        {
        //alert(name);
        document.location.href="CdslClient_otherDetails.aspx"; 
        }
         else if ( name == "tab9")
        {
        //alert(name);
          document.location.href="CdslClient_OthDetails.aspx"; 
        }
        else if ( name == "tab10")
        {
         document.location.href="cdslClient_Correspondance.aspx"; 
        }
        else if ( name == "tab11")
        {
            document.location.href="cdslClient_Subcriptions.aspx"; 
        }
    }
   function ShowHideFilter(obj)
    {
        grid.PerformCallback(obj);
    } 
    function callback()
    { 
     grid.PerformCallback();
    } 
    </script>

    <form id="form1" runat="server">
        <table class="TableMain100">
            <tr>
                <td>
                    <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="7" ClientInstanceName="page"
                        Width="100%" Font-Size="10px">
                        <tabpages>
                            <dxtc:TabPage Name="General" Text="General">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="JointHolders" Text="Joint Holders">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="AdditionalHolders" Text="Additional Holders">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="BankDetail" Text="Bank Detail">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Nominee_POA" Text="Nominee &amp; POA">
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
                            <dxtc:TabPage Name="Groups" Text="Groups">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Remarks" Text="Remarks">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                        <dxwgv:ASPxGridView ID="GridRemarks" ClientInstanceName="grid" runat="server" AutoGenerateColumns="False"
                                            DataSourceID="SqlRemarks" KeyFieldName="id" Width="100%" OnCellEditorInitialize="GridRemarks_CellEditorInitialize"
                                            OnCustomCallback="GridRemarks_CustomCallback">
                                            <columns>
                                                            <dxwgv:GridViewDataTextColumn FieldName="id" ReadOnly="True" Visible="False" VisibleIndex="0">
                                                            <EditFormSettings Visible="False"></EditFormSettings>
                                                            </dxwgv:GridViewDataTextColumn>
                                                            <dxwgv:GridViewDataTextColumn FieldName="rea_internalId" Visible="False" VisibleIndex="1"></dxwgv:GridViewDataTextColumn>
                                                            <dxwgv:GridViewDataTextColumn FieldName="description" Width="40%" Caption="Remarks Category" VisibleIndex="0">
                                                            <EditFormSettings Visible="False"></EditFormSettings>
                                                            </dxwgv:GridViewDataTextColumn>
                                                            <dxwgv:GridViewDataComboBoxColumn FieldName="cat_id" Visible="False" VisibleIndex="1">
                                                            <PropertiesComboBox DataSourceID="sqlCategory" TextField="cat_description" ValueField="id" ValueType="System.String" Width="300px"></PropertiesComboBox>

                                                            <EditFormSettings Visible="True" VisibleIndex="0" Caption="Category"></EditFormSettings>

                                                            <EditCellStyle Wrap="False"></EditCellStyle>
                                                            </dxwgv:GridViewDataComboBoxColumn>
                                                            <dxwgv:GridViewDataMemoColumn FieldName="rea_Remarks" Width="40%" Caption="Remarks" VisibleIndex="1">
                                                            <PropertiesMemoEdit Width="350px" Height="100px"></PropertiesMemoEdit>

                                                            <EditFormSettings VisibleIndex="1" Caption="Remarks"></EditFormSettings>

                                                            <EditCellStyle HorizontalAlign="Left"></EditCellStyle>

                                                            <EditFormCaptionStyle HorizontalAlign="Right"></EditFormCaptionStyle>

                                                            <CellStyle CssClass="gridcellleft"></CellStyle>
                                                            </dxwgv:GridViewDataMemoColumn>
                                                            <dxwgv:GridViewCommandColumn VisibleIndex="2">
                                                            <EditButton Visible="True"></EditButton>

                                                            <DeleteButton Visible="True"></DeleteButton>
                                                            <HeaderTemplate>
                                                            <a href="javascript:void(0);" onclick="grid.AddNewRow();"><span style="color: #000099;
                                                                text-decoration: underline">Add New</span> </a>
                                        
                                            </HeaderTemplate>
                                            </dxwgv:GridViewCommandColumn>
                                            </columns>
                                            <settingsbehavior columnresizemode="NextColumn" confirmdelete="True" />
                                            <settingspager numericbuttoncount="20" pagesize="20" showseparators="True">
                                            <FirstPageButton Visible="True"></FirstPageButton>

                                            <LastPageButton Visible="True"></LastPageButton>
                                            </settingspager>
                                            <settingsediting mode="PopupEditForm" popupeditformheight="200px" popupeditformhorizontalalign="Center"
                                                popupeditformmodal="True" popupeditformverticalalign="WindowCenter" popupeditformwidth="600px"
                                                editformcolumncount="1" />
                                            <settings showtitlepanel="True" />
                                            <settingstext popupeditformcaption="Add/Modify Remarks" confirmdelete="Are you sure to Delete this Record!" />
                                            <styles>
                                            <Header SortingImageSpacing="5px" ImageSpacing="5px" CssClass="gridheader"></Header>

                                            <FocusedGroupRow CssClass="gridselectrow"></FocusedGroupRow>

                                            <FocusedRow CssClass="gridselectrow"></FocusedRow>

                                            <LoadingPanel ImageSpacing="10px"></LoadingPanel>

                                            <TitlePanel BackColor="#DDECFE"></TitlePanel>
                                            </styles>
                                            <templates><TitlePanel>
                                          <table class="TableMain100">
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
                                                                                
</TitlePanel>
</templates>
                                        </dxwgv:ASPxGridView>
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="AdditionalDetail" Text="Additional Detail">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="OtherDetail" Text="Other Detail">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                        
                         <dxtc:TabPage Name="Correspondance" Text="Correspondance">
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                        
                    </dxtc:TabPage>
                    <dxtc:TabPage Name="Subscription" Text="Subscription">
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                        
                    </dxtc:TabPage>
                    </tabpages>
                        <clientsideevents activetabchanged="function(s, e) {
	                                            var activeTab = page.GetActiveTab();
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
	                                            var Tab11=page.GetTab(11);
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
	                                             
                                                }" />
                    </dxtc:ASPxPageControl>
                </td>
                <td>
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
                <asp:SessionParameter Name="rea_internalId" SessionField="CdslClients_BOID" Type="string" />
                <asp:Parameter Name="cat_id" Type="int32" />
                <asp:Parameter Name="rea_Remarks" Type="String" />
                <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="string" />
            </InsertParameters>
            <UpdateParameters>
                <asp:SessionParameter Name="rea_internalId" SessionField="CdslClients_BOID" Type="string" />
                <asp:Parameter Name="cat_id" Type="int32" />
                <asp:Parameter Name="rea_Remarks" Type="String" />
                <asp:SessionParameter Name="LastModifyUser" SessionField="userid" Type="string" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:SessionParameter Name="rea_internalId" SessionField="CdslClients_BOID" Type="string" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sqlCategory" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="SELECT * FROM [tbl_master_remarksCategory]"></asp:SqlDataSource>
    </form>
</body>
</html>
