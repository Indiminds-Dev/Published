<%@ page language="C#" autoeventwireup="true" inherits="management_frmNsdlClients_Groups, App_Web_0jwcfgzk" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
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
<head>
    <title>Untitled Page</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css" />

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
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td style="width: 100">
                        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="5" ClientInstanceName="page" Width="100%">
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
                                            <table Class="TableMain99">
                                                <tr>
                                                    <td align="center">
                                                        <asp:Panel ID="GridPanel" runat="server" Width="100%">
                                                            <dxwgv:ASPxGridView ID="GroupMasterGrid" runat="server" AutoGenerateColumns="False"
                                                                Width="100%" DataSourceID="GroupMaster" KeyFieldName="ID">
                                                                <Columns>
                                                                    <dxwgv:GridViewDataTextColumn FieldName="ID" VisibleIndex="0" Visible="False">
                                                                        <CellStyle CssClass="gridcellleft" HorizontalAlign="Left">
                                                                        </CellStyle>
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataTextColumn FieldName="GroupName" VisibleIndex="0">
                                                                        <CellStyle CssClass="gridcellleft" HorizontalAlign="Left">
                                                                        </CellStyle>
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataTextColumn FieldName="GroupType" VisibleIndex="1">
                                                                        <CellStyle CssClass="gridcellleft" HorizontalAlign="Left">
                                                                        </CellStyle>
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewCommandColumn VisibleIndex="2">
                                                                        <DeleteButton Visible="True">
                                                                        </DeleteButton>
                                                                        
                                                                    </dxwgv:GridViewCommandColumn>
                                                                </Columns>
                                                                <Styles>
                                                                    <LoadingPanel ImageSpacing="10px">
                                                                    </LoadingPanel>
                                                                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                    </Header>
                                                                </Styles>
                                                                <SettingsBehavior ConfirmDelete="True" />
                                                                <SettingsText ConfirmDelete="Are You Want To Delete This Record ?" />
                                                            </dxwgv:ASPxGridView>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 90%; text-align: right" align="right">
                                                        <asp:Button ID="BtnAdd" runat="server" Text="Add" OnClick="BtnAdd_Click" /></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100%" align="center">
                                                        <asp:Panel ID="TablePanel" runat="server" Height="200px" Width="90%" Visible="False">
                                                            <table width="40%" style="">
                                                                <tr>
                                                                    <td style="text-align: left; color: Blue">
                                                                        <asp:Table ID="TableBind" runat="server" Width="100%">
                                                                        </asp:Table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: right">
                                                                        <asp:Button ID="BtnSave" runat="server" OnClick="BtnSave_Click" Text="Save" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                            </table>
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                    <TabStyle Font-Bold="True">
                                    </TabStyle>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Remarks" Text="Remarks">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
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
            </table>
            <asp:SqlDataSource ID="GroupMaster" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                SelectCommand="select tbl_trans_group.grp_id as ID,tbl_master_groupMaster.gpm_Description as GroupName, tbl_master_groupMaster.gpm_Type as GroupType from tbl_trans_group INNER JOIN tbl_master_groupMaster ON tbl_trans_group.grp_groupMaster = tbl_master_groupMaster.gpm_id where tbl_trans_group.grp_contactId = @ContactId"
                DeleteCommand="delete from tbl_trans_group where grp_id=@ID">
                <SelectParameters>
                    <asp:SessionParameter Name="ContactId" SessionField="KeyVal_InternalID_New" Type="string" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Type="string" Name="ID" />
                </DeleteParameters>
            </asp:SqlDataSource>
            <asp:TextBox ID="Counter" runat="server" Visible="False"></asp:TextBox>
        </div>
    </form>
</body>
</html>
