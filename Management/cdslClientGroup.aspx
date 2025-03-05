<%@ page language="C#" autoeventwireup="true" inherits="management_cdslClientGroup, App_Web_8qixh_8w" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
        
        if ( name == "tab0")
        {
             document.location.href="CdslClient_general.aspx"; 
        }
        if ( name == "tab1")
        {
            document.location.href="CdslClient_jointHolders.aspx"; 
        }
        else if ( name == "tab2")
        {
            document.location.href="CdslClient_aditionalHolder.aspx"; 
        }
        else if ( name == "tab3")
        {
            document.location.href="CdslClient_bankDetails.aspx"; 
        }
        else if ( name == "tab4")
        {
            document.location.href="CdslClient_nominee.aspx"; 
        }
        
        else if ( name == "tab5")
        {
        
        document.location.href="cdslClientDocuments.aspx"; 
        }
        else if ( name == "tab6")
        {
            document.location.href="cdslClientGroup.aspx"; 
        }
        else if ( name == "tab7")
        {
        
            document.location.href="cdslClientRemarks.aspx"; 
        }
        else if ( name == "tab8")
        {
             document.location.href="CdslClient_otherDetails.aspx"; 
        }
         else if ( name == "tab9")
        {
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
    </script>

    <form id="form1" runat="server">
        <table class="TableMain100">
            <tr>
                <td>
                    <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="6" ClientInstanceName="page"
                        Width="100%" Font-Size="10px">
                        <TabPages>
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
                                        <table class="TableMain100"">
                                            <tr>
                                                <td align="center">
                                                    <asp:Panel ID="GridPanel" runat="server" Width="100%">
                                                        <dxwgv:ASPxGridView ID="GroupMasterGrid" runat="server" AutoGenerateColumns="False"
                                                            Width="100%" DataSourceID="GroupMaster" KeyFieldName="ID">
                                                            <columns>
                                                        <dxwgv:GridViewDataTextColumn FieldName="ID" Visible="False" VisibleIndex="0">
                                                        <CellStyle HorizontalAlign="Left" CssClass="gridcellleft"></CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn FieldName="GroupName" VisibleIndex="0">
                                                        <CellStyle HorizontalAlign="Left" CssClass="gridcellleft"></CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn FieldName="GroupType" VisibleIndex="1">
                                                        <CellStyle HorizontalAlign="Left" CssClass="gridcellleft"></CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewCommandColumn VisibleIndex="2">
                                                        <DeleteButton Visible="True"></DeleteButton>
                                                        </dxwgv:GridViewCommandColumn>
                                                        </columns>
                                                            <settingsbehavior confirmdelete="True" />
                                                            <settingspager showseparators="True">
                                                        <FirstPageButton Visible="True"></FirstPageButton>

                                                        <LastPageButton Visible="True"></LastPageButton>
                                                        </settingspager>
                                                            <settings showgroupedcolumns="True"></settings>
                                                            <settingstext confirmdelete="Are You Want To Delete This Record ?" />
                                                            <styles>
                                                        <Header SortingImageSpacing="5px" ImageSpacing="5px" ></Header>

                                                        <FocusedGroupRow CssClass="gridselectrow"></FocusedGroupRow>

                                                        <FocusedRow CssClass="gridselectrow"></FocusedRow>

                                                        <LoadingPanel ImageSpacing="10px"></LoadingPanel>
                                                        </styles>
                                                        </dxwgv:ASPxGridView>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 90%; text-align: right" align="right">
                                                    <asp:Button ID="BtnAdd" runat="server" CssClass="btnUpdate" Text="Add" OnClick="BtnAdd_Click" /></td>
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
                                                                    <asp:Button ID="BtnSave" CssClass="btnUpdate" runat="server" OnClick="BtnSave_Click"
                                                                        Text="Save" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                        </table>
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <dxtc:TabPage Name="Remarks" Text="Remarks">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
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
                        </TabPages>
                        <ClientSideEvents ActiveTabChanged="function(s, e) {
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
        <asp:SqlDataSource ID="GroupMaster" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="select T.grp_id as ID,(select gpm_Description from  tbl_master_groupMaster where  gpm_id=T.grp_groupmaster) as GroupName ,T.grp_groupType as GroupType from tbl_trans_group as T where grp_contactId = @ContactId"
            DeleteCommand="delete from tbl_trans_group where grp_id=@ID">
          <%--  SelectCommand="select tbl_trans_group.grp_id as ID,tbl_master_groupMaster.gpm_Description as GroupName, tbl_master_groupMaster.gpm_Type as GroupType from tbl_trans_group INNER JOIN tbl_master_groupMaster ON tbl_trans_group.grp_groupMaster = tbl_master_groupMaster.gpm_id where tbl_trans_group.grp_contactId = @ContactId"--%>
            <SelectParameters>
                <asp:SessionParameter Name="ContactId" SessionField="KeyVal_InternalID_New" Type="string" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Type="string" Name="ID" />
            </DeleteParameters>
        </asp:SqlDataSource>
        <asp:TextBox ID="Counter" runat="server" Visible="False"></asp:TextBox>
    </form>
</body>
</html>
