<%@ page language="C#" autoeventwireup="true" inherits="management_Contact_GroupMember, App_Web_mzqu16me" %>

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
    <title>Group Member</title>
   <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
   <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
<script language="javascript" type="text/javascript">
   function SignOff()
    {
    window.parent.SignOff()
    }
  function AddNewRow()
  {
  
    GroupMasterGrid.PerformCallback();
  }      
        
        
    function disp_prompt(name)
    {
         if ( name == "tab0")
        {
        //alert(name);
        document.location.href="Contact_general.aspx"; 
        }
        if ( name == "tab1")
        {
        //alert(name);
        document.location.href="Contact_Correspondence.aspx"; 
        }
        else if ( name == "tab2")
        {
        //alert(name);
        document.location.href="Contact_BankDetails.aspx"; 
        }
        else if ( name == "tab3")
        {
        //alert(name);
        document.location.href="Contact_DPDetails.aspx"; 
        }
        else if ( name == "tab4")
        {
        //alert(name);
        document.location.href="Contact_Document.aspx"; 
        }
        else if ( name == "tab12")
        {
        //alert(name);
        document.location.href="Contact_FamilyMembers.aspx"; 
        }
        else if ( name == "tab5")
        {
        //alert(name);
        document.location.href="Contact_Registration.aspx"; 
        }
        else if ( name == "tab7")
        {
        //alert(name);
        //document.location.href="Contact_GroupMember.aspx"; 
        }
        else if ( name == "tab8")
        {
        //alert(name);
        document.location.href="Contact_Deposit.aspx"; 
        }
        else if ( name == "tab9")
        {
        //alert(name);
        document.location.href="Contact_Remarks.aspx"; 
        }
         else if ( name == "tab10")
        {
        //alert(name);
        document.location.href="Contact_Education.aspx"; 
        }
        else if ( name == "tab11")
        {
        //alert(name);
        document.location.href="contact_brokerage.aspx"; 
        }
        else if ( name == "tab6")
        {
        //alert(name);
            document.location.href="contact_other.aspx"; 
        }
         else if(name=="tab13")
        {
             document.location.href="contact_Subscription.aspx";
        }
        //New Work 30-12-2021
        else if(name=="tab14")
        {
             document.location.href="Contact_Nominee.aspx";
        }
        //End of New Work 30-12-2021
    }
</script>
    <form id="form1" runat="server">
    <div>
    <table width="100%">
        <tr>
           <td  class="EHEADER" style="text-align:center">
                 <asp:Label ID="lblName" runat="server" Font-Bold="True"></asp:Label>
           </td>
       </tr>
    </table>  
        <table class="TableMain100">
          <tr>
            <td>
                <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="7" ClientInstanceName="page" Font-Size="10px" Width="100%"><TabPages>
                    <dxtc:TabPage Name="General">
                    <TabTemplate ><span style="font-size:x-small">General</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                    <ContentCollection>
                        <dxw:ContentControl runat="server">
                        </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <dxtc:TabPage  Name="CorresPondence">
                    <TabTemplate ><span style="font-size:x-small">CorresPondence</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                    <ContentCollection>
                        <dxw:ContentControl runat="server"></dxw:ContentControl>
                        </ContentCollection>
                        </dxtc:TabPage>
                    <dxtc:TabPage Name="Bank Details">
                    <TabTemplate ><span style="font-size:x-small">Bank</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <dxtc:TabPage Name="DP Details">
                    <TabTemplate ><span style="font-size:x-small">DP</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <dxtc:TabPage Name="Documents">
                    <TabTemplate ><span style="font-size:x-small">Documents</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                     
                    
                    <dxtc:TabPage Name="Registration">
                    <TabTemplate ><span style="font-size:x-small">Registration</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <dxtc:TabPage Name="Other">
                    <TabTemplate ><span style="font-size:x-small">Other</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <dxtc:TabPage Name="Group Member" Text="Group">
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                                <table style="width: 100%">
                                        <tr>
                                            <td  align="center">
                                                <asp:Panel ID="GridPanel" runat="server" Width="100%">
                                                    <dxwgv:ASPxGridView ID="GroupMasterGrid" ClientInstanceName="GroupMasterGrid" runat="server" AutoGenerateColumns="False" Width="100%"
                                                        DataSourceID="GroupMaster" KeyFieldName="ID">
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
                                                                  <HeaderTemplate>
                                                           <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Add New</asp:LinkButton>
                                                        </HeaderTemplate>
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
                                            <td align="center">
                                               <asp:Panel ID="TablePanel" runat="server" Width="100%" Visible="False">
                                                  <table  runat="server" width="40%">
                                                    <tr runat="server">
                                                        <td style="text-align:left; color:Blue" runat="server">
                                                            <asp:Table ID="TableBind" runat="server" Width="100%"></asp:Table>
                                                        </td>
                                                    </tr>
                                                <tr runat="server">
                                                        <td style="text-align: right" runat="server">
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
                     <dxtc:TabPage Name="Deposit" Text="Deposit">
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <dxtc:TabPage Name="Remarks" Text="Remarks">
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <dxtc:TabPage Name="Education" Text="Education">
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <dxtc:TabPage Name="Trad. Prof." Text="Trad.Prof">
                    <%--<TabTemplate ><span style="font-size:x-small">Trad.Prof</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>--%>
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
                     <dxtc:TabPage Name="Subscription" Text="Subscription">
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <%--New Work 17/06/2024--%>
                     <%--<dxtc:TabPage Name="Cont.Person">
                    <TabTemplate ><span style="font-size:x-small">Cont.Person</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>--%>
                    <%--End of New Work 17/06/2024--%>
                    <%--New Work 30-12-2021--%>
                    <dxtc:TabPage Name="Nominee">
                        <TabTemplate>
                            <span style="font-size: x-small;color:Blue;font-weight:bold">Nominee</span>&nbsp;<span style="color: Red;">*</span>
                        </TabTemplate>
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <%--End of New Work 30-12-2021--%>
                    </TabPages>
                    <%--New work Contact_Nominee(Tab14) added 30-12-2021--%>
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
	                                            var Tab9 = page.GetTab(9);
	                                            var Tab10 = page.GetTab(10);
	                                            var Tab11 = page.GetTab(11);
	                                            var Tab12 = page.GetTab(12);
	                                            var Tab13=page.GetTab(13);
	                                            var Tab14=page.GetTab(14);
	                                            
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
                                                 else if(activeTab == Tab13)
	                                            {
	                                               disp_prompt('tab13');
	                                            }
	                                            else if(activeTab == Tab14)
	                                            {
	                                               disp_prompt('tab14');
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
