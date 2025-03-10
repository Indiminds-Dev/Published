<%@ page language="C#" autoeventwireup="true" inherits="management_CdslClient_jointHolders, App_Web_yf04ozfw" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
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
</script>
    <form id="form1" runat="server">
   
    <table class="TableMain100">
        <tr>
            <td>
                <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="1" 
            ClientInstanceName="page"  Width="100%"  Font-Size="10px" >
                <TabPages>
                    <dxtc:TabPage Name="General" Text="General" >
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            
                            
                            
                            
                            </dxw:ContentControl>
                        </ContentCollection>
                       
                    </dxtc:TabPage>
                    <dxtc:TabPage Name="JointHolders" Text="Joint Holders" >
                        <ContentCollection>
                            <dxw:ContentControl runat="server"  >
                            <asp:FormView ID="FormView1" runat="server"  Width="100%" DataSourceID="SqlDataSource1"
                                BorderWidth="1px" BorderStyle="Solid" BorderColor="Blue" Height="100%">
                                <ItemTemplate>
                                    <table border="0" cellpadding="0" cellspacing="1" class="TableMain100" align="left" style="padding-left:5px">
                                        <tr class="EHEADER">
                                            <td align="left" class="Ecoheadtxt" colspan="2" style="color: black; text-align:center ">
                                              <strong><span style="color: #000099"> Second Holder</span> </strong>  
                                            </td>
                                            <td colspan="2" style="color: black; text-align:center ">
                                                
                                              <strong><span style="color: #000099">Third Holder</span> </strong>   
                                                
                                                </td>
                                        </tr>
                                        <tr>
                                            <td class="gridcellleft" style="width: 20%;">
                                                Name:
                                            </td>
                                            <td class="gridcellleft" style="width: 30%;">
                                                <dxe:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="100%" Text='<%#Eval("CdslClients_SecondHolderName")%>' ReadOnly="True">
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="gridcellleft" style="width: 20%;">
                                                Name :</td>
                                            <td class="gridcellleft" style="width: 30%;">
                                                <dxe:ASPxTextBox ID="ASPxTextBox2" runat="server" Width="100%" Text='<%#Eval("CdslClients_ThirdHolderName")%>' ReadOnly="True">
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td class="gridcellleft" style="width: 20%;" align="left">
                                                PAN:
                                            </td>
                                            <td class="gridcellleft">
                                                <dxe:ASPxTextBox ID="ASPxTextBox12" runat="server" Width="100%" Text='<%#Eval("CdslClients_SecondHolderPAN")%>' ReadOnly="True">
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="gridcellleft">
                                                PAN:
                                            </td>
                                            <td class="gridcellleft">
                                                <dxe:ASPxTextBox ID="ASPxTextBox4" runat="server" Width="100%" Text='<%#Eval("CdslClients_ThirdHolderPAN")%>' ReadOnly="True">
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
                    <dxtc:TabPage Name="AdditionalHolders" Text="Aditional Holders">
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
	                                            var Tab11=page.GetTab(11)
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
                    SelectCommand="cdslClientJointHolders" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="id" SessionField="CdslClients_BOID" Type="String" />
                       
                    </SelectParameters>
                </asp:SqlDataSource>
       
    </form>
</body>
</html>
