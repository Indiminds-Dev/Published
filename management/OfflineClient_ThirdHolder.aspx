<%@ page language="C#" autoeventwireup="true" inherits="management_OfflineClient_ThirdHolder, App_Web_alid8jfz" %>


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

    
  function disp_prompt(name)
    {
         if ( name == "tab0")
        {
        //alert(name);
        document.location.href="OfflineClient_General.aspx"; 
        }
        if ( name == "tab1")
        {
        //alert(name);
        document.location.href="OfflineClient_FirstHolder.aspx"; 
        }
        else if ( name == "tab2")
        {
        //alert(name);
        document.location.href="OfflineClient_SecondHolder.aspx"; 
        }
        /*else if ( name == "tab3")
        {
        //alert(name);
        document.location.href="OfflineClient_ThirdHolder.aspx"; 
        }*/
        else if ( name == "tab4")
        {
        //alert(name);
        document.location.href="OfflineClient_Nominee.aspx"; 
        }
        else if ( name == "tab5")
        {
        //alert(name);
        document.location.href="OfflineClient_BankRelated.aspx"; 
        }
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
        
      function setBPID(val)
        {
      
       if (val == '03')
         {
         document.getElementById('CorrespondingBPID_Row').style.display = "block" ; 
         } 
       else 
         {
         document.getElementById('CorrespondingBPID_Row').style.display = "none" ; 
         }
         
        }
      function CallAjaxGroupID(obj1,obj2,obj3)
                {                     
                    var groupType = GroupType.GetValue();
                    ajax_showOptions(obj1,obj2,obj3,groupType ,'Main');
                }    
      
      function CallAjaxBranchID(obj1,obj2,obj3)
                {                     
                   var branchN = "" ; 
                   ajax_showOptions(obj1,obj2,obj3,branchN ,'Main');
                }   
     
      function CallAjaxBankID(obj1,obj2,obj3)
                {                     
                   var bankN = "" ; 
                   ajax_showOptions(obj1,obj2,obj3,bankN ,'Main');
                }   
                     
        /*function PANValidation( txtVal )
        {
        //if (txtVal.length >= 10 )
        // {
            var regex1=/^[A-Z]{5}\d{4}[A-Z]{1}$/;  //this is the pattern of regular expersion
            if(regex1.test(txtVal)== false)
            {
              alert('Please enter valid PAN number');
              return false;
            }
        //}
        }  */                           
          function keyVal(obj)
               {  
                 //alert(obj) ;  
                 var savedID=new String(obj);
                 var WhichCode=new String(obj);
                 WhichCode=WhichCode.split('!')[2];
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

           function setGroupRef()
           {
          
          // alert(document.getElementById('ASPxPageControl1_SendGroupAsRef2').checked ) ; 
           //ASPxPageControl1_GroupID
           if(document.getElementById('ASPxPageControl1_SendGroupAsRef2').checked == true)
             {
            // alert("Group") ;
             document.getElementById('ASPxPageControl1_SenderReference2').value = 
             document.getElementById('ASPxPageControl1_GroupID').value  ;
             document.getElementById('ASPxPageControl1_SenderReference2').disabled= true ;  
             }
           else if(document.getElementById('ASPxPageControl1_SendGroupAsRef2').checked == false)
             {
             document.getElementById('ASPxPageControl1_SenderReference2').disabled= false ; 
             document.getElementById('ASPxPageControl1_SenderReference2').value =  "" ; 
             }  
           }
           
           function setBranchRef()
           {
           if(document.getElementById('ASPxPageControl1_SendBranchAsRef1').checked == true)
             {
            // alert("Branch") ; 
             document.getElementById('ASPxPageControl1_SenderReference1').value = 
             document.getElementById('ASPxPageControl1_BranchID').value  ;
             document.getElementById('ASPxPageControl1_SenderReference1').disabled = true ;  
             }
           else if(document.getElementById('ASPxPageControl1_SendBranchAsRef1').checked == false)
             {
             document.getElementById('ASPxPageControl1_SenderReference1').disabled = false ;  
             document.getElementById('ASPxPageControl1_SenderReference1').value =  "" ; 
             }   
           }      
              
              
         /* function DateChangeForFrom(s)
           {
                var currentTime = new Date()
                //alert('abc');
                document.getElementById('lbl_sdedate').value=currentTime;
                if(currentTime<s.GetValue())
                {           
               
                }
                else
                {                 
                s.SetDate(currentTime);  
                                    
                }
            
            }      */ 
            
            
          function AddrPref(Val)
             {
           //  alert(Val) ; 
             var selectCtrl = document.getElementById('ASPxPageControl1_FornCorrsAddPresent') ;
             selectCtrl.options.length=0;
             selectCtrl.options[0]=new Option("Yes", "Y", true, false);
             if (Val == "Y")
                {
             // alert("Sudeshna") ; 
               selectCtrl.options[1]=new Option("No", "N", false, false);

                }
                             //FornCorrsAddPresent
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
onload="clearPreloadPage() ; javascript:document.getElementById('ASPxPageControl1_ShortName').focus();">
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
                    
                    <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="3" ClientInstanceName="page" Font-Size="10px" >
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
<dxw:ContentControl runat="server"><!----- Sudeshna Kundu -------><TABLE class="TableMain100"><TBODY><TR><TD style="WIDTH: 961px"><asp:Panel runat="server" BorderWidth="2px" BorderColor="White" Width="100%" ID="Panel4" ><TABLE class="TableMain100"><TBODY><TR><TD style="PADDING-LEFT: 50px"><TABLE><TBODY><TR><TD style="PADDING-RIGHT: 50px; WIDTH: 30%; HEIGHT: 20px; TEXT-ALIGN: left"></TD><TD style="WIDTH: 270px; HEIGHT: 20px; TEXT-ALIGN: left"></TD></TR><TR><TD><dxe:ASPxLabel runat="server" Text="Third Holder Name" Font-Size="10px" ID="ASPxLabel22a" ForeColor="Blue" ></dxe:ASPxLabel>

 </TD><TD><dxe:ASPxTextBox runat="server" Width="250px" TabIndex="37" ID="ThirdHolderName" ></dxe:ASPxTextBox>

 </TD></TR><TR><TD><dxe:ASPxLabel runat="server" Text="Third Holder Father/Husband Name" Font-Size="10px" ID="ASPxLabel11a" ForeColor="Blue" ></dxe:ASPxLabel>

 </TD><TD><dxe:ASPxTextBox runat="server" Width="250px" TabIndex="38" ID="ThirdHolderFatherHusbandName" ></dxe:ASPxTextBox>

 </TD></TR><TR><TD><dxe:ASPxLabel runat="server" Text="Third Holder PAN" Font-Size="10px" ID="ASPxLabel11b" ForeColor="Blue" ></dxe:ASPxLabel>

 </TD><TD><asp:TextBox runat="server" Width="247px" TabIndex="39" ID="ThirdHolderPAN" ></asp:TextBox>

 <asp:RegularExpressionValidator runat="server" ErrorMessage="Please Enter Valid PAN Number" ControlToValidate="ThirdHolderPAN" ID="RegularExpressionValidator2" ValidationExpression="^[A-Z]{5}\d{4}[A-Z]{1}$" ></asp:RegularExpressionValidator>

 </TD></TR><TR><TD><dxe:ASPxLabel runat="server" Text="Third Holder SMS Facility" Font-Size="10px" ID="ASPxLabel11n" ForeColor="Blue" ></dxe:ASPxLabel>

 </TD><TD><asp:DropDownList runat="server" Width="250px" TabIndex="40" ID="ThirdHolderSMSFacility" ><asp:ListItem Value="N">No</asp:ListItem>
<asp:ListItem Value="Y">Yes</asp:ListItem>
</asp:DropDownList>

 </TD></TR><TR><TD><dxe:ASPxLabel runat="server" Text="Third Holder Authorization Flag" Font-Size="10px" ID="ASPxLabel23n" ForeColor="Blue" ></dxe:ASPxLabel>

 </TD><TD><asp:DropDownList runat="server" Width="250px" TabIndex="41" ID="ThirdHolderAuthFlag"><asp:ListItem Value="N">No</asp:ListItem>
<asp:ListItem Value="Y">Yes</asp:ListItem>
</asp:DropDownList>

 </TD></TR><TR><TD><dxe:ASPxLabel runat="server" Text="Third Holder PAN Flag" Font-Size="10px" ID="ASPxLabel28n" ForeColor="Blue" ></dxe:ASPxLabel>

 </TD><TD><asp:DropDownList runat="server" Width="250px" TabIndex="42" ID="ThirdHolderPANFlag" ><asp:ListItem Value="N">No</asp:ListItem>
<asp:ListItem Value="Y">Yes</asp:ListItem>
</asp:DropDownList>

 </TD></TR><TR><TD><dxe:ASPxLabel runat="server" Text="No. of Third Holder POA Mapping" Font-Size="10px" ID="ASPxLabel23m" ForeColor="Blue"></dxe:ASPxLabel>

 </TD><TD style="WIDTH: 166px; TEXT-ALIGN: left"><dxe:ASPxTextBox runat="server" Width="250px" TabIndex="43" ID="ThirdHolderPOAMappingN" onKeyPress="return onlyNumbers();"  ></dxe:ASPxTextBox>

 </TD></TR><TR><TD><dxe:ASPxLabel runat="server" Text="Third Holder Email" Font-Size="10px" ID="ASPxLabel28m" ForeColor="Blue" ></dxe:ASPxLabel>

 </TD><TD><asp:TextBox runat="server" Width="247px" TabIndex="44" ID="ThirdHolderEmail"></asp:TextBox>

 <asp:RegularExpressionValidator runat="server" ErrorMessage="Please Enter Valid Email" ControlToValidate="ThirdHolderEmail" ID="RegularExpressionValidator5" ValidationExpression="^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$" ></asp:RegularExpressionValidator>

 </TD></TR><TR><TD style="WIDTH: 247px"><dxe:ASPxLabel runat="server" Text="Third Holder Mobile" Font-Size="10px" ID="ASPxLabel22n" ForeColor="Blue" ></dxe:ASPxLabel>

 </TD><TD><asp:TextBox runat="server" Width="247px" TabIndex="45" ID="ThirdHolderMobile"  onKeyPress="return onlyNumbers();" ></asp:TextBox>

 <asp:RegularExpressionValidator runat="server" ErrorMessage="Please Enter Valid mobile Number" ControlToValidate="ThirdHolderMobile" ID="RegularExpressionValidator8" ValidationExpression="^(\d{2})?(\d{10}){1}?$" ></asp:RegularExpressionValidator>

 </TD></TR><TR><TD><dxe:ASPxLabel runat="server" Text="No. of Third Holder Authorized Signatories" Font-Size="10px" ID="ASPxLabe3" ForeColor="Blue" ></dxe:ASPxLabel>

 </TD><TD><dxe:ASPxTextBox runat="server" Width="250px" TabIndex="46" ID="ThirdHolderAuthSignatoriesN" onKeyPress="return onlyNumbers();" ></dxe:ASPxTextBox>

 </TD></TR><TR><TD style="PADDING-RIGHT: 50px; WIDTH: 30%; HEIGHT: 20px; TEXT-ALIGN: left"></TD><TD style="HEIGHT: 20px; TEXT-ALIGN: left"></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></asp:Panel>

 </TD></TR></TBODY></TABLE><!----- Sudeshna Kundu -------></dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="Nominee" Text="Nominee"><ContentCollection>
<dxw:ContentControl runat="server">

                                        </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="BankRelated" Text="Bank Related"><ContentCollection>
<dxw:ContentControl runat="server">

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
                                            <td>
                                                <dxe:ASPxButton ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" ValidationGroup="a" TabIndex="62">
                                                </dxe:ASPxButton>
                                            </td>
                         
                                            <td>
                                                <dxe:ASPxButton ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click"
                                                    TabIndex="63">
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
