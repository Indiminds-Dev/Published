<%@ page language="C#" autoeventwireup="true" inherits="management_OfflineClient_BankRelated, App_Web_snhbal_j" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<html xmlns="http://www.w3.org/1999/xhtml" >

<head id="Head1" runat="server">
    <title>Offline Client Page</title>
     <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
     <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
   
    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>
    <script type="text/javascript">
     FieldName='abc'; 
    function onlyNumbers(evt)
        {
	        var e = event || evt; // for trans-browser compatibility
	        var charCode = e.which || e.keyCode;

	        if (charCode > 31 && (charCode < 48 || charCode > 57))
		        return false;

	        return true;

        }   //numeric keycode is from 45 to 57 --- If not  within that range then return false

  function SaveButtonClick()
  {
  document.getElementById("ROWbtnSaveDB").style.display = "Block" ; 
  }    
  function disp_prompt(name)
    {
         if ( name == "tab0")
        {
        //alert(name);
        document.location.href="OfflineClient_General.aspx"; 
        }
        else if ( name == "tab1")
        {
        //alert(name);
        document.location.href="OfflineClient_FirstHolder.aspx"; 
        }
        else if ( name == "tab2")
        {
        //alert(name);
        document.location.href="OfflineClient_SecondHolder.aspx"; 
        }
        else if ( name == "tab3")
        {
        //alert(name);
        document.location.href="OfflineClient_ThirdHolder.aspx"; 
        }
        else if ( name == "tab4")
        {
        //alert(name);
        document.location.href="OfflineClient_Nominee.aspx"; 
        }
      /*  else if ( name == "tab5")
        {
        //alert(name);
        document.location.href="OfflineClient_BankRelated.aspx"; 
        }*/
        else if ( name == "tab6")
        {
        //alert(name);
        document.location.href="OfflineClient_Address.aspx"; 
        }
        else if ( name == "tab7")
        {
        //alert(name);
        document.location.href="OfflineClient_AuthorisedSignatories.aspx"; 
        }
        else if ( name == "tab8")
        {
        //alert(name);
        document.location.href="OfflineClient_POADetail.aspx"; 
        }
        else if ( name == "tab9")
        {
        //alert(name);
        document.location.href="OfflineClient_Signature.aspx"; 
        }

    }
    
    function keyVal(obj)
               {  
                 //alert("sudeshna");
                 //alert(obj) ;  
                 var savedID=new String(obj);
                 var WhichCode=new String(obj);
                 WhichCode=WhichCode.split('!')[2];
                // alert(savedID) ; 
                 savedID = savedID.split('!')[1];
                 //alert(savedID); 
                 //alert(WhichCode);
                 switch(WhichCode)
                 {
                 case  'gpm_id' : 
                            document.getElementById('ASPxPageControl1_HiddenGroupID').value =  savedID ; 
                            break ; 
                 case 'branch_id' :
                           document.getElementById('ASPxPageControl1_HiddenBranchID').value =  savedID ; 
                            break ; 
                            
                 case 'bnk_id' :
                           document.getElementById('ASPxPageControl1_HiddenBankID').value =  savedID ; 
                            break ;          
                 }
                  // alert(obj);
                  //   document.getElementById('ASPxPageControl1_GroupID').value = new String(obj) ;
                  //   document.getElementById('ASPxPageControl1_BranchID').value = new String(obj) ;
              }
    
       function CallAjaxBankID(obj1,obj2,obj3)
                {                     
                   var bankN = "" ; 
                   ajax_showOptions(obj1,obj2,obj3,bankN ,'Main');
                }   
    
      function max2Digit(val)
        {
        
        alert(val) ; 
//	  	     if(val.length > 2)
//	  	       {
//	  	       alert("Please enter at most 2 digit number") ; 
//	  	       return false  ;
//	  	       } 
//	  	    return true ;    
        } 


    function SignOff()
        {
             window.parent.SignOff();
        }
        function height()

        {
            if(document.body.scrollHeight>=600)
                window.frameElement.height = document.body.scrollHeight;
            else
                window.frameElement.height = '600px';
            window.frameElement.Width = document.body.scrollWidth;
        }
        
    </script>

    <!--___________________________________________________________________________-->
    <style type="text/css">
	
	/* Big box with list of options */
	#ajax_listOfOptions{
		position:absolute;	    /* Never change this one */
		width:50px;	        /* Width of box */
		height:auto;	        /* Height of box */
		overflow:auto;	        /* Scrolling features */
		border:1px solid Blue;	/* Blue border */
		background-color:#FFF;	/* White background color */
		text-align:left;
		font-size:0.9em;
		z-index:32767; /*100;*/
	}
	#ajax_listOfOptions div{	/* General rule for both .optionDiv and .optionDivSelected */
		margin:1px;		
		padding:1px;
		cursor:pointer;
		font-size:0.9em;
	}
	#ajax_listOfOptions .optionDiv{	/* Div for each item in list */
		
	}
	#ajax_listOfOptions .optionDivSelected{ /* Selected item in the list */
		background-color:#DDECFE;
		color:Blue;
		/*z-index:900; */
	}
	#ajax_listOfOptions_iframe{
		background-color:#F00;
		position:absolute;
		z-index:3000;
		/*z-index:5;*/
	}
	
	form{
		display:inline;
	}
	
	</style>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE;height:500px; clear:both;" 
onload="clearPreloadPage() ; ">
    <form id="form1" runat="server" >
    <div>
     <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align:center;">
                     <asp:Label ID="lblName" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                    
                    <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="5" ClientInstanceName="page" Font-Size="10px" >
                            <LoadingPanelStyle ImageSpacing="6px"></LoadingPanelStyle>
                            <ContentStyle>
<Border BorderWidth="1px" BorderStyle="Solid" BorderColor="#002D96"></Border>
</ContentStyle>

                        <ClientSideEvents ActiveTabChanged="function(s, e) {
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

	                                            }"></ClientSideEvents>

                            <TabPages>
<dxtc:TabPage Name="General" Text="General"><ContentCollection>
<dxw:ContentControl runat="server"></dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="FirstHolder" Text="First Holder"><ContentCollection>
<dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="SecondHolder" Text="Second Holder"><ContentCollection>
<dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="ThirdHolder" Text="Third Holder"><ContentCollection>
<dxw:ContentControl runat="server"></dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="Nominee" Text="Nominee"><ContentCollection>
<dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="BankRelated" Text="Bank Related"><ContentCollection>
<dxw:ContentControl runat="server">
         <!----- Sudeshna Kundu -------><table class="TableMain100">
                                                <tr>
                                                    <td style="width: 961px">
     <asp:Panel runat="server" BorderWidth="2px" BorderColor="White" Width="100%" ID="Panel6"> 
                                                            <TABLE class="TableMain100">
                                                                <TBODY>
                                                                
                                                              <TR><TD style="PADDING-RIGHT: 20px; PADDING-LEFT: 50px; WIDTH: 27%; HEIGHT: 20px; TEXT-ALIGN: left"><dxe:ASPxLabel runat="server" Text="Bank Name" Font-Size="10px" ID="ASPxLabel11g" ForeColor="Blue"></dxe:ASPxLabel>





 </TD><TD style="WIDTH: 164px; HEIGHT: 20px"><asp:TextBox runat="server" Width="247px" TabIndex="54" ID="BankID"></asp:TextBox>

  <%--<asp:TextBox runat="server" ID="HiddenBankID" ></asp:TextBox>--%>
<asp:HiddenField runat="server" ID="HiddenBankID"></asp:HiddenField>





 </TD></TR><TR><TD style="PADDING-RIGHT: 20px; PADDING-LEFT: 50px; WIDTH: 27%; HEIGHT: 20px; TEXT-ALIGN: left"><dxe:ASPxLabel runat="server" Text="Bank Account Type" Font-Size="10px" ID="ASPxLabel23g" ForeColor="Blue"></dxe:ASPxLabel>





 </TD><TD style="WIDTH: 166px; TEXT-ALIGN: left"><asp:DropDownList runat="server" Width="250px" TabIndex="55" ID="BankAccountType"><asp:ListItem Value="10">Savings</asp:ListItem>
<asp:ListItem Value="11">Current</asp:ListItem>
<asp:ListItem Value="13">Cash Credit/Overdraft</asp:ListItem>
</asp:DropDownList>





 </TD></TR><TR><TD style="PADDING-RIGHT: 20px; PADDING-LEFT: 50px; WIDTH: 27%; HEIGHT: 20px; TEXT-ALIGN: left"><dxe:ASPxLabel runat="server" Text="Beneficiary RBI Reference No." Font-Size="10px" ID="ASPxLabel22i" ForeColor="Blue"></dxe:ASPxLabel>





 </TD><TD style="WIDTH: 163px; TEXT-ALIGN: left"><dxe:ASPxTextBox runat="server" Width="250px" TabIndex="56" ID="RBIReference"></dxe:ASPxTextBox>





 </TD></TR><!-------- Sudeshna Kundu ------><TR><TD style="PADDING-RIGHT: 20px; PADDING-LEFT: 50px; WIDTH: 27%; HEIGHT: 20px; TEXT-ALIGN: left"><dxe:ASPxLabel runat="server" Text="Beneficiary RBI Approval Date" Font-Size="10px" ID="ASPxLabel11i" ForeColor="Blue"></dxe:ASPxLabel>





 </TD><TD style="WIDTH: 164px">
 <dxe:ASPxDateEdit runat="server" EditFormatString="dd-MM-yyyy" Font-Size="11px" Width="250px" EditFormat="Custom" ID="RBIApprovalDate" DateOnError="Today" UseMaskBehavior="True" TabIndex="57">
<ButtonStyle Width="13px"></ButtonStyle>
</dxe:ASPxDateEdit>


 </TD></TR><TR><TD style="PADDING-RIGHT: 20px; PADDING-LEFT: 50px; WIDTH: 27%; HEIGHT: 20px; TEXT-ALIGN: left"><dxe:ASPxLabel runat="server" Text="Beneficiary SEBI Registration No." Font-Size="10px" ID="ASPxLabel23i" ForeColor="Blue"></dxe:ASPxLabel>





 </TD><TD style="WIDTH: 166px; TEXT-ALIGN: left"><dxe:ASPxTextBox runat="server" Width="250px" TabIndex="58" ID="SEBIRegn"></dxe:ASPxTextBox>





 </TD></TR><TR><TD style="PADDING-RIGHT: 20px; PADDING-LEFT: 50px; WIDTH: 27%; HEIGHT: 20px; TEXT-ALIGN: left"><dxe:ASPxLabel runat="server" Text="Beneficiary Tax Deduction Status" Font-Size="10px" ID="ASPxLabel28i" ForeColor="Blue"></dxe:ASPxLabel>





 </TD><TD><dxe:ASPxTextBox runat="server" Width="250px" TabIndex="59" ID="TaxDeductionStatus"></dxe:ASPxTextBox>





 </TD></TR><TR><TD style="PADDING-RIGHT: 20px; PADDING-LEFT: 50px; WIDTH: 27%; HEIGHT: 20px; TEXT-ALIGN: left"><dxe:ASPxLabel runat="server" Text="Beneficiary Bank Account Number" Font-Size="10px" ID="ASPxLabel28g" ForeColor="Blue"></dxe:ASPxLabel>





 </TD><TD><dxe:ASPxTextBox runat="server" Width="250px" TabIndex="60" ID="BenBankAccountNumber"></dxe:ASPxTextBox>





 </TD></TR><!-------- Sudeshna Kundu ------><TR><TD style="PADDING-RIGHT: 20px; PADDING-LEFT: 50px; WIDTH: 27%; HEIGHT: 20px; TEXT-ALIGN: left"><dxe:ASPxLabel runat="server" Text="Bank Address Present?" Font-Size="10px" ID="ASPxLabel11" ForeColor="Blue"></dxe:ASPxLabel>





 </TD><TD style="WIDTH: 164px">
 <asp:DropDownList runat="server" Width="250px" TabIndex="61" ID="BankAddPresent"><asp:ListItem Value="Y">Yes</asp:ListItem>
<asp:ListItem Value="N">No</asp:ListItem>
</asp:DropDownList>
 
 </TD></TR>
                                                              </TBODY>  </TABLE></asp:Panel>



</td></tr></table> <!----- Sudeshna Kundu ------->
                                        </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="Address" Text="Address"><ContentCollection>
<dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="AuthorizedSignatories" Text="Authorized Signatories"><ContentCollection>
<dxw:ContentControl runat="server">

                                        </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="POADetail" Text="POA Detail"><ContentCollection>
<dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="Signature" Text="Signature"><ContentCollection>
<dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
</TabPages>
                        </dxtc:ASPxPageControl>
                    </td></tr>
                    <tr>
                    <td>
                    
                    <table style="width: 100%;">
                            <tr>
                                <td align="right">
                                    <table>
                                        <tr>
                                            <td id="ROWbtnSave">
                                                <dxe:ASPxButton ID="btnSave" runat="server" Text="Save"        OnClick="btnSave_Click" ValidationGroup="a" TabIndex="62" >  <%--<ClientSideEvents Click="function(s, e) {SaveButtonClick();}" />--%>
                                                </dxe:ASPxButton>
                                            </td>
                                            <td id="ROWbtnSaveDB" >
                                                <dxe:ASPxButton ID="btnSaveDB" runat="server" Text="Save Data To DataBase" OnClick="btnSaveDB_Click" ValidationGroup="a" TabIndex="63" Enabled="false">         
                                                </dxe:ASPxButton>
                                            </td>
                                            <td>
                                                <dxe:ASPxButton ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click"
                                                    TabIndex="64">
                                                </dxe:ASPxButton>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                    </tr>              
            </table>
 <%-- <asp:TextBox ID="sessKey"  Width="900px"  TextMode="MultiLine" runat="server" ></asp:TextBox>--%>
    </div>
    </form>
</body>
</html>
