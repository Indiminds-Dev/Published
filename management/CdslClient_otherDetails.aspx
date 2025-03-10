<%@ page language="C#" autoeventwireup="true" inherits="management_CdslClient_otherDetails, App_Web_ko_nrypx" %>

<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">

    <script language="javascript" type="text/javascript">
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
                    <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="8" ClientInstanceName="page"
                        Width="100%" Font-Size="10px">
                        <tabpages>
                    <dxtc:TabPage Name="General" Text="General" >
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                       
                    </dxtc:TabPage>
                    <dxtc:TabPage Name="JointHolders" Text="Joint Holders" >
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                       
                    </dxtc:TabPage>
                     <dxtc:TabPage Name="AdditionalHolders" Text="Additional Holders" >
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
                            </dxw:ContentControl>
                        </ContentCollection>
                       
                    </dxtc:TabPage>
                    <dxtc:TabPage Name="AdditionalDetail" Text="Additional Detail">
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                              <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1"
                                BorderWidth="1px" BorderStyle="Solid" BorderColor="Blue" Height="100%" Width="98%">
                                <ItemTemplate>
                                    <table border="0" cellpadding="0" cellspacing="1" class="TableMain100"  style="padding-left:5px">
                                        <tr>
                                            <td class="EHEADER" colspan="4" style="text-align:center ">
                                             <strong><span style="color: #000099"> Additional Details </span> </strong> </td>
                                        </tr>
                                        <tr>
                                            <td class="gridcellleft" style="width: 20%;">
                                                DP Int Ref  No.:
                                            </td>
                                            <td style="width: 30%;">
                                                <dxe:ASPxTextBox ID="ASPxTextBox12" runat="server" Width="100%" Text='<%#Eval("CdslClients_DPIntRefNo")%>' ReadOnly="True">
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td style="width: 20%;">
                                                Group Code :</td>
                                            <td style="width: 30%;"><dxe:ASPxTextBox ID="ASPxTextBox2" runat="server" Width="100%" Text='<%#Eval("CdslClients_GroupCode")%>' ReadOnly="True">
                                            </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="gridcellleft" style="width: 20%;" >
                                                Clearning Member Id:
                                            </td>
                                            <td>
                                                <dxe:ASPxTextBox ID="ASPxTextBox9" runat="server" Width="100%" Text='<%#Eval("CdslClients_ClearingMemberID")%>' ReadOnly="True">
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td>
                                                Stock Exchange Id:</td>
                                            <td><dxe:ASPxTextBox ID="ASPxTextBox3" runat="server" Width="100%" Text='<%#Eval("CdslClients_ExchangeID")%>' ReadOnly="True">
                                            </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td  class="gridcellleft" style="width: 20%;">
                                                Clearning Corporation Id:</td>
                                            <td>
                                                <dxe:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="100%" Text='<%#Eval("CdslClients_ClearingCorpID")%>' ReadOnly="True">
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td>
                                                Customer Product No.:</td>
                                            <td><dxe:ASPxTextBox ID="ASPxTextBox4" runat="server" Width="100%" Text='<%#Eval("CdslClients_CustomerProductNo")%>' ReadOnly="True">
                                            </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td  class="gridcellleft" style="width: 20%;">
                                                Trading Id:
                                            </td>
                                            <td>
                                                <dxe:ASPxTextBox ID="ASPxTextBox13" runat="server" Width="100%" Text='<%#Eval("CdslClients_TradingID")%>' ReadOnly="True">
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td>
                                                Stmt Cycle Code :</td>
                                            <td><dxe:ASPxTextBox ID="ASPxTextBox5" runat="server" Width="100%" Text='<%#Eval("CdslClients_BOStmtCycleCode")%>' ReadOnly="True">
                                            </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        
                                         <tr>
                                            <td class="gridcellleft" style="width: 20%;">
                                                Education Code:
                                            </td>
                                            <td>
                                                <dxe:ASPxTextBox ID="txtBankAcNo" runat="server" Width="100%" Text='<%#Eval("CdslClients_EducationCode")%>' ReadOnly="True">
                                                </dxe:ASPxTextBox>
                                            </td>
                                             <td>
                                                 Closure Reason Code :</td>
                                             <td><dxe:ASPxTextBox ID="ASPxTextBox6" runat="server" Width="100%" Text='<%#Eval("CdslClients_ClosureReasonCode")%>' ReadOnly="True">
                                             </dxe:ASPxTextBox>
                                             </td>
                                        </tr>
                                        <tr>
                                            <td class="gridcellleft" style="width: 20%;">
                                                Income Code :</td>
                                            <td>
                                                <dxe:ASPxTextBox ID="ASPxTextBox8" runat="server" Width="100%" Text='<%#Eval("CdslClients_IncomeCode")%>' ReadOnly="True">
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td>
                                                Closure Initiated By :</td>
                                            <td><dxe:ASPxTextBox ID="ASPxTextBox7" runat="server" Width="100%" Text='<%#Eval("CdslClients_ClosureInitiatedBy")%>' ReadOnly="True">
                                            </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="gridcellleft" style="width: 20%;">
                                                Staff / Relative Of DP</td>
                                            <td>
                                                <dxe:ASPxTextBox ID="ASPxTextBox10" runat="server" Width="100%" Text='<%#Eval("CdslClients_StaffRelativeOfDp")%>' ReadOnly="True">
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td>
                                                Requested Closure Date :</td>
                                            <td><dxe:ASPxTextBox ID="ASPxTextBox11" runat="server" Width="100%" Text='<%#Eval("CdslClients_RequestClosureDate")%>' ReadOnly="True">
                                            </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="gridcellleft" style="width: 20%;" >
                                                Staff Code</td>
                                            <td>
                                               <dxe:ASPxTextBox ID="ASPxTextBox21" runat="server" Width="100%" Text='<%#Eval("CdslClients_StaffCode")%>' ReadOnly="True">
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td>
                                                Closure Approval Date :</td>
                                            <td><dxe:ASPxTextBox ID="ASPxTextBox14" runat="server" Width="100%" Text='<%#Eval("CdslClients_ClosureApprovalDate")%>' ReadOnly="True">
                                            </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td  class="gridcellleft" style="width: 20%;">
                                                Suspension Reason Code</td>
                                            <td><dxe:ASPxTextBox ID="ASPxTextBox20" runat="server" Width="100%" Text='<%#Eval("CdslClients_SuspReasonCode")%>' ReadOnly="True">
                                            </dxe:ASPxTextBox>
                                            </td>
                                            <td>
                                                A/C Suspension Flag</td>
                                            <td><dxe:ASPxTextBox ID="ASPxTextBox15" runat="server" Width="100%" Text='<%#Eval("CdslClients_AccountSuspensionFlag")%>' ReadOnly="True">
                                            </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td  class="gridcellleft" style="width: 20%;">
                                                Suspension Initiated By</td>
                                            <td><dxe:ASPxTextBox ID="ASPxTextBox19" runat="server" Width="100%" Text='<%#Eval("CdslClients_SuspInitiatedBy")%>' ReadOnly="True">
                                            </dxe:ASPxTextBox>
                                            </td>
                                            <td>
                                                Profession Code</td>
                                            <td><dxe:ASPxTextBox ID="ASPxTextBox16" runat="server" Width="100%" Text='<%#Eval("CdslClients_ProfessionCode")%>' ReadOnly="True">
                                            </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td  class="gridcellleft" style="width: 20%;">
                                                Life Style Code</td>
                                            <td>
                                                <dxe:ASPxTextBox ID="ASPxTextBox18" runat="server" Width="100%" Text='<%#Eval("CdslClients_LifeStyleCode")%>' ReadOnly="True">
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td>
                                                Geographical Area code
                                            </td>
                                            <td>
                                                <dxe:ASPxTextBox ID="ASPxTextBox17" runat="server" Width="100%" Text='<%#Eval("CdslClients_GeoAreaCode")%>' ReadOnly="True">
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                       
                                    </table>
                                </ItemTemplate>
                                <RowStyle HorizontalAlign="Left" VerticalAlign="Top" />
                            </asp:FormView>
                            
                            
                            
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
	                                            var Tab11 = page.GetTab(11);
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="cdlsClientOtherDetails" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="id" SessionField="CdslClients_BOID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
