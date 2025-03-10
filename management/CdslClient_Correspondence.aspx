<%@ page language="C#" autoeventwireup="true" inherits="management_CdslClient_Correspondence, App_Web_yr9d06qo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>

<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Src="Headermain.ascx" TagName="Headermain" TagPrefix="uc1" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
   <link rel="stylesheet" href="../CSS/style.css" type="text/css" />
</head>
<body onunload="ul()">
<script language="javascript" type="text/javascript">
function ul()
{
    window.opener.document.getElementById('iFrmInformation').setAttribute('src','CallUserInformation.aspx')
}
function OnCountryChanged(cmbCountry) 
{
    gridAddress.GetEditor("State").PerformCallback(cmbCountry.GetValue().toString());
}
function OnStateChanged(cmbState) 
{
    gridAddress.GetEditor("City").PerformCallback(cmbState.GetValue().toString());
}
function OnCityChanged(cmbCity) 
{
    gridAddress.GetEditor("area").PerformCallback(cmbCity.GetValue().toString());
}
function OnChildCall(cmbCity) 
{
   OnCityChanged(gridAddress.GetEditor("City"));
}
function openAreaPage()
    {
        var left = (screen.width-300)/2;
        var top = (screen.height-250)/2;
        var cityid=gridAddress.GetEditor("City").GetValue();
        var cityname=gridAddress.GetEditor("City").GetText();
        var URL= 'AddArea_PopUp.aspx?id='+cityid+'&name='+cityname+'';
        if(cityid != null)
        {
            window.open(URL,'50','resizable=1,height=100px,width=300px,top='+top+',left='+left+'');
        }
        else
        {
            alert('Please select a city first!');
            return false;
        }
    }
function disp_prompt(name)
    {
        //var ID = document.getElementById(txtID);
        if ( name == "tab0")
        {
        //alert(name);
        document.location.href="Contact_general.aspx"; 
        }
        if ( name == "tab1")
        {
        //alert(name);
        //document.location.href="Contact_Correspondence.aspx"; 
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
        else if ( name == "tab5")
        {
        //alert(name);
        document.location.href="Contact_FamilyMembers.aspx"; 
        }
        else if ( name == "tab6")
        {
        //alert(name);
        document.location.href="Contact_Registration.aspx"; 
        }
        else if ( name == "tab7")
        {
        //alert(name);
        document.location.href="Contact_GroupMember.aspx"; 
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
        
    }
</script>
    <form id="form1" runat="server">
   
    <table class="TableMain">
        
        <tr>
            <td>
                <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="1" ClientInstanceName="page" CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" CssPostfix="Office2003_Blue" ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
                
                <TabPages>
                    <dxtc:TabPage Text="General" Name="General"><ContentCollection>
                        <dxw:ContentControl runat="server">
                        </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <dxtc:TabPage Text="CorresPondence" Name="CorresPondence"><ContentCollection>
                        <dxw:ContentControl runat="server">
                        
                        
                      <asp:FormView ID="FormView1" runat="server" Width="100%" DataSourceID="SqlDataSource1" BorderWidth="1px" BorderStyle="Solid" BorderColor="Blue">
                            <ItemTemplate>
                                <table border="1" cellpadding="0" cellspacing="1" width="712">
                                    <tr>
                                        <td class="EcoheadCon_" style="padding-left: 5px; font-size: 11px; height: 20px;"
                                            width="16%">
                                            <b>Address Line 1 :</b>
                                        </td>
                                        <td class="gridcellleft" width="25%">
                                            <%#Eval("CdslClients_FirstHolderName")%>
                                        </td>
                                        <td class="EcoheadCon_" style="padding-left: 5px; font-size: 11px; height: 20px;"
                                            width="17%">
                                            <b>Address Line 2 :</b>
                                        </td>
                                        <td class="gridcellleft" width="10%">
                                            <%#Eval("CdslClients_BOStatus")%>
                                        </td>
                                        <td class="EcoheadCon_" style="padding-left: 5px; font-size: 11px; height: 20px;"
                                            width="17%">
                                            <b>Address Line 3 :</b>
                                        </td>
                                        <td class="gridcellleft" width="20%">
                                            <%#Eval("CdslClients_BOSubStatus")%>
                                        </td>
                                    </tr>
                                    
                                     <tr>
                                        <td class="EcoheadCon_" style="padding-left: 5px; font-size: 11px; height: 20px;"
                                            width="13%">
                                            <b>City :</b>
                                        </td>
                                        <td class="gridcellleft" width="20%">
                                            <%#Eval("CdslClients_BOID")%>
                                        </td>
                                        <td class="EcoheadCon_" style="padding-left: 5px; font-size: 11px; height: 20px;"
                                            width="20%">
                                            <b>State :</b>
                                        </td>
                                        <td class="gridcellleft" width="10%">
                                            <%#Eval("CdslClients_DPIntRefNo")%>
                                        </td>
                                        <td class="EcoheadCon_" style="padding-left: 5px; font-size: 11px; height: 20px;"
                                            width="15%">
                                            <b>Country :</b>
                                        </td>
                                        <td class="gridcellleft" width="20%">
                                            <%#Eval("CdslClients_AccountStatus")%>
                                        </td>
                                    </tr>
                                    
                                     <tr>
                                        <td class="EcoheadCon_" style="padding-left: 5px; font-size: 11px; height: 20px;"
                                            width="13%">
                                            <b>Pin Code :</b>
                                        </td>
                                        <td class="gridcellleft" width="20%">
                                            <%#Eval("CdslClients_POAName")%>
                                        </td>
                                        <td class="EcoheadCon_" style="padding-left: 5px; font-size: 11px; height: 20px;"
                                            width="20%">
                                            <b>Telephone Number :</b>
                                        </td>
                                        <td class="gridcellleft" width="10%">
                                            <%#Eval("CdslClients_POAID")%>
                                        </td>
                                        <td class="EcoheadCon_" style="padding-left: 5px; font-size: 11px; height: 20px;"
                                            width="15%">
                                            <b>A/C Opening :</b>
                                        </td>
                                        <td class="gridcellleft" width="20%">
                                            <%#Eval("CdslClients_AccountOpeningDate")%>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td class="EcoheadCon_" style="padding-left: 5px; font-size: 11px; height: 20px;"
                                            width="13%">
                                            <b>A/C Category :</b>
                                        </td>
                                        <td class="gridcellleft" width="20%">
                                            <%#Eval("CdslClients_AccountCategory")%>
                                        </td>
                                        <td class="EcoheadCon_" style="padding-left: 5px; font-size: 11px; height: 20px;"
                                            width="20%">
                                            <b>A/C Clos./Susp. Date :</b>
                                        </td>
                                        <td class="gridcellleft" width="10%">
                                            <%#Eval("CdslClients_AccountClosSuspDate")%>
                                        </td>
                                        <td class="EcoheadCon_" style="padding-left: 5px; font-size: 11px; height: 20px;"
                                            width="15%">
                                            <b>Purchase Waiver :</b>
                                        </td>
                                        <td class="gridcellleft" width="20%">
                                            <%#Eval("CdslClients_PurchaseWaiver")%>
                                        </td>
                                    </tr>
                                    
                                </table>
                            
                            
                            </ItemTemplate>
                            
                            </asp:FormView>
                        
                        
                        
                        
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
	                                            }">
                    </ClientSideEvents>
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
                    </td>
            </tr>
        </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                    SelectCommand="ShowCdslClientGeneral" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="id" SessionField="CdslClients_BOID" Type="String" />
                       
                    </SelectParameters>
                </asp:SqlDataSource>
       
    </form>
</body>
</html>
