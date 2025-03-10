<%@ page language="C#" autoeventwireup="true" inherits="management_frmNsdlClients_General, App_Web_udicbieo" %>

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

    <script language="javascript" type="text/javascript">


function disp_prompt(name)
    {    
         var qrStr=window.location .search ;
         var spQrStr=qrStr.substring(1);
         if ( name == "tab0")
         {
            
         }
         else if ( name == "tab1")
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
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">

    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td >
                        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" ClientInstanceName="page"
                            Font-Size="10px" Width="100%">
                            <loadingpanelstyle imagespacing="6px"></loadingpanelstyle>
                            <contentstyle>
<Border BorderWidth="1px" BorderStyle="Solid" BorderColor="#002D96"></Border>
</contentstyle>
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
                            <tabpages>
<dxtc:TabPage Name="General" Text="General">
<TabStyle Font-Bold="True"></TabStyle>
<ContentCollection>
<dxw:ContentControl runat="server"><TABLE width="100%"><TBODY><TR><TD><asp:Panel runat="server" BorderWidth="2px" BorderColor="Blue" Width="100%" Height="100%" ID="Panel1"><TABLE class="TableMain100"><TBODY><TR><TD class="mylabel1" width="15%"><dxe:ASPxLabel runat="server" Text="Beneficiary Account ID" Font-Size="X-Small" Width="119px" ID="ASPxLabel26"></dxe:ASPxLabel>
 </TD><TD class="mylabel1" width="34%"><dxe:ASPxTextBox runat="server" Width="100%" ReadOnly="True" ID="txtID"></dxe:ASPxTextBox>
 </TD><TD class="mylabel1" width="2%"></TD><TD class="mylabel1" width="15%"><dxe:ASPxLabel runat="server" Text="PAN Number" Font-Size="X-Small" ID="ASPxLabel5"></dxe:ASPxLabel>
 </TD><TD class="mylabel1" width="34%"><dxe:ASPxTextBox runat="server" Width="100%" ReadOnly="True" ID="txtPAN"></dxe:ASPxTextBox>
 </TD></TR><TR><TD class="mylabel1" width="15%"><dxe:ASPxLabel runat="server" Text="Activation Date" Font-Size="X-Small" ID="ASPxLabel1"></dxe:ASPxLabel>
 </TD><TD class="mylabel1" width="34%"><dxe:ASPxTextBox runat="server" Width="100%" ReadOnly="True" ID="txtActivationDate"></dxe:ASPxTextBox>
 </TD><TD class="mylabel1" width="2%"></TD><TD class="mylabel1" width="15%"><dxe:ASPxLabel runat="server" Text="MAPIN ID" Font-Size="X-Small" ID="ASPxLabel12"></dxe:ASPxLabel>
 </TD><TD class="mylabel1" width="34%"><dxe:ASPxTextBox runat="server" Width="100%" ReadOnly="True" ID="txtMapinId"></dxe:ASPxTextBox>
 </TD></TR><TR><TD class="mylabel1" width="15%"><dxe:ASPxLabel runat="server" Text="A/c Status" Font-Size="X-Small" ID="ASPxLabel4"></dxe:ASPxLabel>
 </TD><TD class="mylabel1" width="34%"><dxe:ASPxTextBox runat="server" Width="100%" ReadOnly="True" ID="txtAcStatus"></dxe:ASPxTextBox>
 </TD><TD class="mylabel1" width="2%"></TD><TD class="mylabel1" width="15%"><dxe:ASPxLabel runat="server" Text="Standing Instruction" Font-Size="X-Small" ID="ASPxLabel3"></dxe:ASPxLabel>
 </TD><TD class="mylabel1" width="34%"><dxe:ASPxTextBox runat="server" Width="100%" ReadOnly="True" ID="txtStandingInstruction"></dxe:ASPxTextBox>
 </TD></TR><TR><TD class="mylabel1" width="15%"><dxe:ASPxLabel runat="server" Text="Status Change Reason" Font-Size="X-Small" ID="ASPxLabel2"></dxe:ASPxLabel>
 </TD><TD class="mylabel1" width="34%"><dxe:ASPxMemo runat="server" Width="100%" ReadOnly="True" ID="MemoStatusChangeReason" Rows="1"></dxe:ASPxMemo>
 </TD><TD class="mylabel1" width="2%"></TD><TD class="mylabel1" width="15%"><dxe:ASPxLabel runat="server" Text="SEBI Regn. No:" Font-Size="X-Small" ID="ASPxLabel7"></dxe:ASPxLabel>
 </TD><TD class="mylabel1" width="34%"><dxe:ASPxTextBox runat="server" Width="100%" ReadOnly="True" ID="txtSEBIRegn"></dxe:ASPxTextBox>
 </TD></TR><TR><TD class="mylabel1" width="15%"><dxe:ASPxLabel runat="server" Text="A/c Closure Date" Font-Size="X-Small" ID="ASPxLabel6"></dxe:ASPxLabel>
 </TD><TD class="mylabel1" width="34%"><dxe:ASPxTextBox runat="server" Width="100%" ReadOnly="True" ID="txtAcClosureDate"></dxe:ASPxTextBox>
 </TD><TD class="mylabel1" width="2%"></TD><TD class="mylabel1" width="15%"><dxe:ASPxLabel runat="server" Text="Tax Deduction Status" Font-Size="X-Small" Width="130px" ID="ASPxLabel9"></dxe:ASPxLabel>
 </TD><TD class="mylabel1" width="34%"><dxe:ASPxTextBox runat="server" Width="100%" ReadOnly="True" ID="txtTaxDeductionStatus"></dxe:ASPxTextBox>
 </TD></TR><TR><TD class="mylabel1" width="15%"><dxe:ASPxLabel runat="server" Text="A/c Category" Font-Size="X-Small" ID="ASPxLabel8"></dxe:ASPxLabel>
 </TD><TD class="mylabel1" width="34%"><dxe:ASPxTextBox runat="server" Width="100%" ReadOnly="True" ID="txtAcCat"></dxe:ASPxTextBox>
 </TD><TD class="mylabel1" width="2%"></TD><TD class="mylabel1" width="15%"><dxe:ASPxLabel runat="server" Text="Email ID" Font-Size="X-Small" ID="ASPxLabel11"></dxe:ASPxLabel>
 </TD><TD class="mylabel1" width="34%"><dxe:ASPxMemo runat="server" Width="100%" ReadOnly="True" ID="MemoEmailID" Rows="1"></dxe:ASPxMemo>
 </TD></TR><TR><TD class="mylabel1" width="15%"><dxe:ASPxLabel runat="server" Text="A/c Type" Font-Size="X-Small" ID="ASPxLabel10"></dxe:ASPxLabel>
 </TD><TD class="mylabel1" width="34%"><dxe:ASPxTextBox runat="server" Width="100%" ReadOnly="True" ID="txtAcType"></dxe:ASPxTextBox>
 </TD><TD class="mylabel1" width="2%"></TD><TD class="mylabel1" width="15%"><dxe:ASPxLabel runat="server" Text="Mobile No:" Font-Size="X-Small" ID="ASPxLabel14"></dxe:ASPxLabel>
 </TD><TD class="mylabel1" width="34%"><dxe:ASPxMemo runat="server" Width="100%" ReadOnly="True" ID="MemoMobile" Rows="1"></dxe:ASPxMemo>
 </TD></TR><TR><TD class="mylabel1" width="15%"><dxe:ASPxLabel runat="server" Text="Sub Type" Font-Size="X-Small" ID="ASPxLabel13"></dxe:ASPxLabel>
 </TD><TD class="mylabel1" width="34%"><dxe:ASPxTextBox runat="server" Width="100%" ReadOnly="True" ID="txtSubType"></dxe:ASPxTextBox>
 </TD><TD class="mylabel1" width="2%"></TD><TD class="mylabel1" width="15%"><dxe:ASPxLabel runat="server" Text="SMS Facility" Font-Size="X-Small" ID="ASPxLabel16"></dxe:ASPxLabel>
 </TD><TD class="mylabel1" width="34%"><dxe:ASPxTextBox runat="server" Width="100%" ReadOnly="True" ID="txtSMSFacility"></dxe:ASPxTextBox>
 </TD></TR><TR><TD class="mylabel1" width="15%"><dxe:ASPxLabel runat="server" Text="BP ID" Font-Size="X-Small" ID="ASPxLabel15"></dxe:ASPxLabel>
 </TD><TD class="mylabel1" width="34%"><dxe:ASPxTextBox runat="server" Width="100%" ReadOnly="True" ID="txtBPID"></dxe:ASPxTextBox>
 </TD><TD class="mylabel1" width="2%"></TD><TD class="mylabel1" width="15%"><dxe:ASPxLabel runat="server" Text="POA Facility" Font-Size="X-Small" ID="ASPxLabel18"></dxe:ASPxLabel>
 </TD><TD class="mylabel1" width="34%"><dxe:ASPxTextBox runat="server" Width="100%" ReadOnly="True" ID="txtPOAFacility"></dxe:ASPxTextBox>
 </TD></TR><TR><TD class="mylabel1" width="15%"><dxe:ASPxLabel runat="server" Text="Short Name" Font-Size="X-Small" ID="ASPxLabel17"></dxe:ASPxLabel>
 </TD><TD class="mylabel1" width="34%"><dxe:ASPxTextBox runat="server" Width="100%" ReadOnly="True" ID="txtShortName"></dxe:ASPxTextBox>
 </TD><TD class="mylabel1" width="2%"></TD><TD class="mylabel1" width="15%"><dxe:ASPxLabel runat="server" Text="Date Of Birth" Font-Size="X-Small" ID="ASPxLabel20"></dxe:ASPxLabel>
 </TD><TD class="mylabel1" width="34%"><dxe:ASPxTextBox runat="server" Width="100%" ReadOnly="True" ID="txtDOB"></dxe:ASPxTextBox>
 </TD></TR><TR><TD class="mylabel1" width="15%"><dxe:ASPxLabel runat="server" Text="First Holder Name" Font-Size="X-Small" ID="ASPxLabel19"></dxe:ASPxLabel>
 </TD><TD class="mylabel1" width="34%"><dxe:ASPxMemo runat="server" Width="100%" ReadOnly="True" ID="MemoFirstHolderName" Rows="3"></dxe:ASPxMemo>
 </TD><TD class="mylabel1" width="2%"></TD><TD class="mylabel1" width="15%"><dxe:ASPxLabel runat="server" Text="Address" Font-Size="X-Small" ID="ASPxLabel22"></dxe:ASPxLabel>
 </TD><TD class="mylabel1" width="34%"><dxe:ASPxMemo runat="server" Width="100%" ReadOnly="True" ID="MemoAddress" Rows="3"></dxe:ASPxMemo>
 </TD></TR><TR><TD class="mylabel1" width="15%"><dxe:ASPxLabel runat="server" Text="Occupation" Font-Size="X-Small" ID="ASPxLabel23"></dxe:ASPxLabel>
 </TD><TD class="mylabel1" width="34%"><dxe:ASPxTextBox runat="server" Width="100%" ReadOnly="True" ID="txtOccupation"></dxe:ASPxTextBox>
 </TD><TD class="mylabel1" width="2%"></TD><TD class="mylabel1" width="15%"><dxe:ASPxLabel runat="server" Text="Address Preference" Font-Size="X-Small" ID="ASPxLabel28"></dxe:ASPxLabel>
 </TD><TD class="mylabel1" width="34%"><dxe:ASPxTextBox runat="server" Width="100%" ReadOnly="True" ID="txtAddressPreference"></dxe:ASPxTextBox>
 </TD></TR><TR><TD class="mylabel1" width="15%"><dxe:ASPxLabel runat="server" Text="Father/Husband's Name" Font-Size="X-Small" Width="130px" ID="ASPxLabel21"></dxe:ASPxLabel>
 </TD><TD class="mylabel1" width="34%"><dxe:ASPxMemo runat="server" Width="100%" ReadOnly="True" ID="MemoFatherHusbandName" Rows="3"></dxe:ASPxMemo>
 </TD><TD class="mylabel1" width="2%"></TD><TD class="mylabel1" width="15%"><dxe:ASPxLabel runat="server" Text="Phone" Font-Size="X-Small" ID="ASPxLabel25"></dxe:ASPxLabel>
 </TD><TD class="mylabel1" width="34%"><dxe:ASPxMemo runat="server" Width="100%" ReadOnly="True" ID="MemoPhone" Rows="1"></dxe:ASPxMemo>

 </TD></TR><TR><TD class="mylabel1" width="15%"><dxe:ASPxLabel runat="server" Text="Statement Delivery Mode" Font-Size="X-Small" Width="130px" ID="ASPxLabel32"></dxe:ASPxLabel>
 </TD><TD class="mylabel1" width="34%"><dxe:ASPxMemo runat="server" Width="100%" ReadOnly="True" ID="txtEConsent" Rows="1"></dxe:ASPxMemo>

 </TD></TR><TR><TD class="mylabel1" width="15%"></TD><TD class="mylabel1" width="34%"></TD><TD class="mylabel1" width="2%"></TD><TD class="mylabel1" width="15%"><dxe:ASPxLabel runat="server" Text="Fax" Font-Size="X-Small" ID="ASPxLabel27"></dxe:ASPxLabel>
 </TD><TD class="mylabel1" width="34%"><dxe:ASPxTextBox runat="server" Width="100%" ReadOnly="True" ID="txtFax"></dxe:ASPxTextBox>
 </TD></TR></TBODY></TABLE></asp:Panel>
 </TD></TR></TBODY></TABLE></dxw:ContentControl>
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
