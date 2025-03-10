<%@ page language="C#" autoeventwireup="true" inherits="management_frmNsdlClients_BankDetail, App_Web_akbpwr7y" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
<body>
    <form id="form1" runat="server">
        <table class="TableMain100">
            <tr>
                <td>
                    <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="2" ClientInstanceName="page"
                        Width="100%">
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
	                                           
                                                }" />
                        <tabpages>
<dxtc:TabPage Name="General" Text="General">
<TabStyle Font-Bold="True"></TabStyle>
<ContentCollection>
<dxw:ContentControl runat="server">
                            </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="JointHolders" Text="Joint Holders">
<TabStyle Font-Bold="True"></TabStyle>
<ContentCollection>
<dxw:ContentControl runat="server">
                            </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="BankDetail" Text="Bank Detail">
<TabStyle Font-Bold="True"></TabStyle>
<ContentCollection>
<dxw:ContentControl runat="server"><asp:Panel runat="server" BorderWidth="2px" BorderColor="Blue" Width="100%" BackColor="#DDECFE" Height="463px" ID="Panel1"><TABLE class="TableMain100"><TBODY><TR><TD align=center colSpan=2><SPAN class="mylabel1"><B><U>Bank Detail</U></B></SPAN> </TD></TR><TR><TD class="mylabel1"><dxe:ASPxLabel runat="server" Text="Bank A/c No:" Font-Size="X-Small" ID="ASPxLabel1"></dxe:ASPxLabel>
 </TD><TD class="mylabel1"><dxe:ASPxTextBox runat="server" Width="63%" ReadOnly="True" ID="txtBankAcNo"></dxe:ASPxTextBox>
 </TD></TR><TR><TD class="mylabel1" ><dxe:ASPxLabel runat="server" Text="Bank A/c Type" Font-Size="X-Small" ID="ASPxLabel2"></dxe:ASPxLabel>
 </TD><TD  class="mylabel1"><dxe:ASPxTextBox runat="server" Width="63%" ReadOnly="True" ID="txtBankAcType"></dxe:ASPxTextBox>
 </TD></TR><TR><TD class="mylabel1" ><dxe:ASPxLabel runat="server" Text="Bank Name" Font-Size="X-Small" ID="ASPxLabel3"></dxe:ASPxLabel>
 </TD><TD  class="mylabel1"><dxe:ASPxMemo runat="server" Width="63%" ReadOnly="True" ID="memoBankName" Rows="1"></dxe:ASPxMemo>
 </TD></TR><TR><TD class="mylabel1" ><dxe:ASPxLabel runat="server" Text="MICR/IFSC Code" Font-Size="X-Small" ID="ASPxLabel4"></dxe:ASPxLabel>
 </TD><TD class="mylabel1"><dxe:ASPxTextBox runat="server" Width="63%" ReadOnly="True" ID="txtMICR"></dxe:ASPxTextBox>
 </TD></TR><TR><TD class="mylabel1" ><dxe:ASPxLabel runat="server" Text="RBI Reference No:" Font-Size="X-Small" ID="ASPxLabel5"></dxe:ASPxLabel>
 </TD><TD class="mylabel1"><dxe:ASPxMemo runat="server" Width="63%" ReadOnly="True" ID="memoRBIReferenceNo" Rows="1"></dxe:ASPxMemo>
 </TD></TR><TR><TD class="mylabel1" ><dxe:ASPxLabel runat="server" Text="RBI Approval Date:" Font-Size="X-Small" Width="114px" ID="ASPxLabel6"></dxe:ASPxLabel>
 </TD><TD style="WIDTH: 755px" class="mylabel1"><dxe:ASPxTextBox runat="server" Width="63%" ReadOnly="True" ID="txtRBIApprovalDate"></dxe:ASPxTextBox>
 </TD></TR><TR><TD class="mylabel1"><dxe:ASPxLabel runat="server" Text="Bank Address:" Font-Size="X-Small" Width="109px" ID="ASPxLabel7"></dxe:ASPxLabel>
 </TD><TD class="mylabel1"><dxe:ASPxMemo runat="server" Width="63%" ReadOnly="True" ID="memoBankAddress" Rows="1"></dxe:ASPxMemo>
 </TD></TR></TBODY></TABLE></asp:Panel>
 </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="Nominee_POA" Text="Nominee &amp; POA">
<TabStyle Font-Bold="True"></TabStyle>
<ContentCollection>
<dxw:ContentControl runat="server">
                            </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="Documents" Text="Documents">
<TabStyle Font-Bold="True"></TabStyle>
<ContentCollection>
<dxw:ContentControl runat="server">
                            </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="Groups" Text="Groups">
<TabStyle Font-Bold="True"></TabStyle>
<ContentCollection>
<dxw:ContentControl runat="server">
                            </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="Remarks" Text="Remarks">
<TabStyle Font-Bold="True"></TabStyle>
<ContentCollection>
<dxw:ContentControl runat="server">
                            </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="OtherDetail" Text="Other Detail">
<TabStyle Font-Bold="True"></TabStyle>
<ContentCollection>
<dxw:ContentControl runat="server">
                            </dxw:ContentControl>
</ContentCollection>
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
                    </dxtc:ASPxPageControl>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
