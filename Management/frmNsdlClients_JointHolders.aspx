<%@ page language="C#" autoeventwireup="true" inherits="management_frmNsdlClients_JointHolders, App_Web_dw8rtpla" %>

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
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">

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

    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td>
                        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="1" ClientInstanceName="page"
                            Font-Size="10px" Width="100%">
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
<dxw:ContentControl runat="server"><asp:Panel runat="server" BorderWidth="2px" BorderColor="Blue" Width="100%" BackColor="#DDECFE" Height="463px" ID="Panel1"><TABLE class="TableMain100"><TBODY><TR><TD align=center colSpan=2><SPAN class="mylabel1"><B><U>Second Holder</U></B></SPAN> </TD><TD align=center colSpan=2><SPAN class="mylabel1"><B><U>Third Holder</U></B></SPAN> </TD></TR><TR><TD style="WIDTH: 15%" class="mylabel1"><dxe:ASPxLabel runat="server" Text="Name" Font-Size="X-Small" ID="ASPxLabel1"></dxe:ASPxLabel>
 </TD><TD style="WIDTH: 34%" class="mylabel1"><dxe:ASPxMemo runat="server" Width="100%" ReadOnly="True" ID="memoSecondName" Rows="1"></dxe:ASPxMemo>
 </TD><TD style="WIDTH: 15%" class="mylabel1"><dxe:ASPxLabel runat="server" Text="Name" Font-Size="X-Small" ID="ASPxLabel2"></dxe:ASPxLabel>
 </TD><TD style="WIDTH: 34%" class="mylabel1"><dxe:ASPxMemo runat="server" Width="88%" ReadOnly="True" ID="memoThirdName" Rows="1"></dxe:ASPxMemo>
 </TD></TR><TR><TD style="WIDTH: 15%" class="mylabel1"><dxe:ASPxLabel runat="server" Text="Father/Husband's Name" Font-Size="X-Small" ID="ASPxLabel3"></dxe:ASPxLabel>
 </TD><TD style="WIDTH: 34%" class="mylabel1"><dxe:ASPxMemo runat="server" Width="100%" ReadOnly="True" ID="memoSecondFatherHusbandName" Rows="1"></dxe:ASPxMemo>
 </TD><TD style="WIDTH: 15%" class="mylabel1"><dxe:ASPxLabel runat="server" Text="Father/Husband's Name" Font-Size="X-Small" ID="ASPxLabel4"></dxe:ASPxLabel>
 </TD><TD style="WIDTH: 34%" class="mylabel1"><dxe:ASPxMemo runat="server" Width="88%" ReadOnly="True" ID="memoThirdFatherHusbandName" Rows="1"></dxe:ASPxMemo>
 </TD></TR><TR><TD style="WIDTH: 15%" class="mylabel1"><dxe:ASPxLabel runat="server" Text="PAN Number" Font-Size="X-Small" ID="ASPxLabel5"></dxe:ASPxLabel>
 </TD><TD style="WIDTH: 34%" class="mylabel1"><dxe:ASPxTextBox runat="server" Width="100%" ReadOnly="True" ID="txtSecondPAN"></dxe:ASPxTextBox>
 </TD><TD style="WIDTH: 15%" class="mylabel1"><dxe:ASPxLabel runat="server" Text="PAN Number" Font-Size="X-Small" ID="ASPxLabel6"></dxe:ASPxLabel>
 </TD><TD style="WIDTH: 34%" class="mylabel1"><dxe:ASPxTextBox runat="server" Width="88%" ReadOnly="True" ID="txtThirdPAN"></dxe:ASPxTextBox>
 </TD></TR><TR><TD style="WIDTH: 15%" class="mylabel1"><dxe:ASPxLabel runat="server" Text="MAPIN ID" Font-Size="X-Small" ID="ASPxLabel7"></dxe:ASPxLabel>
 </TD><TD style="WIDTH: 34%" class="mylabel1"><dxe:ASPxTextBox runat="server" Width="100%" ReadOnly="True" ID="txtSecondMAPIN"></dxe:ASPxTextBox>
 </TD><TD style="WIDTH: 15%" class="mylabel1"><dxe:ASPxLabel runat="server" Text="MAPIN ID" Font-Size="X-Small" ID="ASPxLabel8"></dxe:ASPxLabel>
 </TD><TD style="WIDTH: 34%" class="mylabel1"><dxe:ASPxTextBox runat="server" Width="88%" ReadOnly="True" ID="txtThirdMAPIN"></dxe:ASPxTextBox>
 </TD></TR><TR><TD style="WIDTH: 15%" class="mylabel1"><dxe:ASPxLabel runat="server" Text="Email Id" Font-Size="X-Small" ID="ASPxLabel9"></dxe:ASPxLabel>
 </TD><TD style="WIDTH: 34%" class="mylabel1"><dxe:ASPxMemo runat="server" Width="100%" ReadOnly="True" ID="memoSecondEmail" Rows="1"></dxe:ASPxMemo>
 </TD><TD style="WIDTH: 15%" class="mylabel1"><dxe:ASPxLabel runat="server" Text="Email Id" Font-Size="X-Small" ID="ASPxLabel10"></dxe:ASPxLabel>
 </TD><TD style="WIDTH: 34%" class="mylabel1"><dxe:ASPxMemo runat="server" Width="88%" ReadOnly="True" ID="memoThirdEmail" Rows="1"></dxe:ASPxMemo>
 </TD></TR><TR><TD style="WIDTH: 15%" class="mylabel1"><dxe:ASPxLabel runat="server" Text="Mobile No:" Font-Size="X-Small" ID="ASPxLabel11"></dxe:ASPxLabel>
 </TD><TD style="WIDTH: 34%" class="mylabel1"><dxe:ASPxMemo runat="server" Width="100%" ReadOnly="True" ID="memoSecondMobile" Rows="1"></dxe:ASPxMemo>
 </TD><TD style="WIDTH: 15%" class="mylabel1"><dxe:ASPxLabel runat="server" Text="Mobile No:" Font-Size="X-Small" ID="ASPxLabel12"></dxe:ASPxLabel>
 </TD><TD style="WIDTH: 34%" class="mylabel1"><dxe:ASPxMemo runat="server" Width="88%" ReadOnly="True" ID="memoThirdMobile" Rows="1"></dxe:ASPxMemo>
 </TD></TR><TR><TD style="WIDTH: 15%" class="mylabel1"><dxe:ASPxLabel runat="server" Text="SMS Facility" Font-Size="X-Small" ID="ASPxLabel13"></dxe:ASPxLabel>
 </TD><TD style="WIDTH: 34%" class="mylabel1"><dxe:ASPxTextBox runat="server" Width="100%" ReadOnly="True" ID="txtSecondSMS"></dxe:ASPxTextBox>
 </TD><TD style="WIDTH: 15%" class="mylabel1"><dxe:ASPxLabel runat="server" Text="SMS Facility" Font-Size="X-Small" ID="ASPxLabel14"></dxe:ASPxLabel>
 </TD><TD style="WIDTH: 34%" class="mylabel1"><dxe:ASPxTextBox runat="server" Width="88%" ReadOnly="True" ID="txtThirdSMS"></dxe:ASPxTextBox>
 </TD></TR><TR><TD style="WIDTH: 15%" class="mylabel1"><dxe:ASPxLabel runat="server" Text="Address" Font-Size="X-Small" ID="ASPxLabel15"></dxe:ASPxLabel>
 </TD><TD style="WIDTH: 34%" class="mylabel1"><dxe:ASPxMemo runat="server" Width="100%" ReadOnly="True" ID="memoSecondAddress" Rows="1"></dxe:ASPxMemo>
 </TD><TD style="WIDTH: 15%" class="mylabel1"><dxe:ASPxLabel runat="server" Text="Address" Font-Size="X-Small" ID="ASPxLabel16"></dxe:ASPxLabel>
 </TD><TD style="WIDTH: 34%" class="mylabel1"><dxe:ASPxMemo runat="server" Width="88%" ReadOnly="True" ID="memoThirdAddress" Rows="1"></dxe:ASPxMemo>
 </TD></TR><TR><TD style="WIDTH: 15%" class="mylabel1"><dxe:ASPxLabel runat="server" Text="Phone" Font-Size="X-Small" ID="ASPxLabel17"></dxe:ASPxLabel>
 </TD><TD style="WIDTH: 34%" class="mylabel1"><dxe:ASPxMemo runat="server" Width="100%" ReadOnly="True" ID="memoSecondPhone" Rows="1"></dxe:ASPxMemo>
 </TD><TD style="WIDTH: 15%" class="mylabel1"><dxe:ASPxLabel runat="server" Text="Phone" Font-Size="X-Small" ID="ASPxLabel18"></dxe:ASPxLabel>
 </TD><TD style="WIDTH: 34%" class="mylabel1"><dxe:ASPxMemo runat="server" Width="88%" ReadOnly="True" ID="memoThirdPhone" Rows="1"></dxe:ASPxMemo>
 </TD></TR><TR><TD style="WIDTH: 15%" class="mylabel1"><dxe:ASPxLabel runat="server" Text="Fax" Font-Size="X-Small" ID="ASPxLabel19"></dxe:ASPxLabel>
 </TD><TD style="WIDTH: 34%" class="mylabel1"><dxe:ASPxMemo runat="server" Width="100%" ReadOnly="True" ID="memoSecondFax" Rows="1"></dxe:ASPxMemo>
 </TD><TD style="WIDTH: 15%" class="mylabel1"><dxe:ASPxLabel runat="server" Text="Fax" Font-Size="X-Small" ID="ASPxLabel20"></dxe:ASPxLabel>
 </TD><TD style="WIDTH: 34%" class="mylabel1"><dxe:ASPxMemo runat="server" Width="88%" ReadOnly="True" ID="memoThirdFax" Rows="1"></dxe:ASPxMemo>
 </TD></TR></TBODY></TABLE></asp:Panel>
 </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="BankDetail" Text="Bank Detail">
<TabStyle Font-Bold="True"></TabStyle>
<ContentCollection>
<dxw:ContentControl runat="server">
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
        </div>
    </form>
</body>
</html>
