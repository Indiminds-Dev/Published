<%@ page language="C#" autoeventwireup="true" inherits="management_Lead_GroupMember, App_Web_n2fxndvz" %>

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

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
 <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
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
        document.location.href="Lead_DPDetails.aspx"; 
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
        //document.location.href="Lead_GroupMember.aspx"; 
        }
        else if ( name == "tab8")
        {
        //alert(name);
        document.location.href="Lead_Remarks.aspx"; 
        }
    }
</script>
    <title>Untitled Page</title>
  
</head>
<body  style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">

    <form id="form1" runat="server">
       <table class="TableMain100">
       <%-- <tr>
            <td class="EHEADER" ></td>
            
        </tr>--%>
        <tr>
            <td>
                <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="7" ClientInstanceName="page"  width="100%" Font-Size="10px"><TabPages>
                    <dxtc:TabPage Text="General" Name="General"><ContentCollection>
                        <dxw:ContentControl runat="server">
                        </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <dxtc:TabPage Text="CorresPondence" Name="CorresPondence"><ContentCollection>
                        <dxw:ContentControl runat="server"></dxw:ContentControl>
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
                                <table width="100%">
                                        <tr>
                                            <td  align="center">
                                                <asp:Panel ID="GridPanel" runat="server" Width="100%">
                                                    <dxwgv:ASPxGridView ID="GroupMasterGrid" runat="server" AutoGenerateColumns="False" Width="100%"
                                                        DataSourceID="GroupMaster" KeyFieldName="ID" >
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
                                                        <SettingsPager ShowSeparators="True">
                                                            <FirstPageButton Visible="True">
                                                            </FirstPageButton>
                                                            <LastPageButton Visible="True">
                                                            </LastPageButton>
                                                        </SettingsPager>
                                                    </dxwgv:ASPxGridView>
                                                    
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100%; text-align: right" align="right">
                                                <asp:Button ID="BtnAdd" runat="server" Text="Add" OnClick="BtnAdd_Click"/></td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100%" align="center">
                                                <asp:Panel ID="TablePanel" runat="server" Width="100%" Visible="False">
                                                 <table width="40%" style="">
                                                    <tr>
                                                        <td style="text-align:left; color:Blue">
                                                            <asp:Table ID="TableBind" runat="server" Width="100%"> </asp:Table>
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
                    </dxtc:TabPage>
                    <dxtc:TabPage Name="Remarks" Text="Remarks">
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    
                    </TabPages>
                    <ClientSideEvents  ActiveTabChanged="function(s, e) {
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
	                                            
	                                            }">
                    </ClientSideEvents>
                    <ContentStyle>
                        <Border BorderColor="#002D96" BorderStyle="Solid" BorderWidth="1px" />
                    </ContentStyle>
                    <LoadingPanelStyle ImageSpacing="6px">
                    </LoadingPanelStyle>
                </dxtc:ASPxPageControl>
            </td>
        </tr>
       
       
    </table>
        <asp:SqlDataSource ID="GroupMaster" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
              SelectCommand="select tbl_trans_group.grp_id as ID,tbl_master_groupMaster.gpm_Description as GroupName, tbl_master_groupMaster.gpm_Type as GroupType from tbl_trans_group INNER JOIN tbl_master_groupMaster ON tbl_trans_group.grp_groupMaster = tbl_master_groupMaster.gpm_id where tbl_trans_group.grp_contactId = @ContactId"
              DeleteCommand="delete from tbl_trans_group where grp_id=@ID">
              <SelectParameters>
                <asp:SessionParameter Name="ContactId" SessionField="KeyVal_InternalID" Type="string" />
              </SelectParameters>
              <DeleteParameters>
                    <asp:Parameter Type="string" Name="ID" />
              </DeleteParameters>
        </asp:SqlDataSource>
        <asp:TextBox ID="Counter" runat="server" Visible="False"></asp:TextBox>
      </form>
</body>
</html>
