<%@ page language="C#" autoeventwireup="true" inherits="management_OfflineClient, App_Web_sggmuspu" %>

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
                    
                    <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" ClientInstanceName="page" Font-Size="10px" >
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
<dxw:ContentControl runat="server"><TABLE class="TableMain100"><TBODY><TR><TD style="WIDTH: 961px"><asp:Panel runat="server" BorderWidth="2px" BorderColor="White" Width="100%" ID="Panel1"><TABLE class="TableMain100"><TBODY><TR><TD style="PADDING-RIGHT: 20px; PADDING-LEFT: 50px; WIDTH: 27%; HEIGHT: 20px; TEXT-ALIGN: left"><dxe:ASPxLabel runat="server" Text="Short Name" Font-Size="10px" ID="ASPxLabel18" ForeColor="Blue"></dxe:ASPxLabel>
 </TD><TD style="PADDING-RIGHT: 50px; WIDTH: 48%; HEIGHT: 20px; TEXT-ALIGN: left"><asp:TextBox runat="server" Width="247px" TabIndex="1" ID="ShortName"></asp:TextBox>
 </TD></TR><TR><TD style="PADDING-RIGHT: 20px; PADDING-LEFT: 50px; WIDTH: 27%; HEIGHT: 20px; TEXT-ALIGN: left"><dxe:ASPxLabel runat="server" Text="Occupation" Font-Size="10px" ID="ASPxLabel16" ForeColor="Blue"></dxe:ASPxLabel>
 </TD><TD style="WIDTH: 48%; HEIGHT: 20px; TEXT-ALIGN: left"><asp:DropDownList runat="server" Width="250px" TabIndex="2" ID="Occupation"></asp:DropDownList>
 </TD></TR><TR><TD style="PADDING-RIGHT: 20px; PADDING-LEFT: 50px; WIDTH: 27%; HEIGHT: 20px; TEXT-ALIGN: left"><dxe:ASPxLabel runat="server" Text="Address Preference" Font-Size="10px" ID="ASPxLabel23a" ForeColor="Blue"></dxe:ASPxLabel>
 </TD><TD style="HEIGHT: 20px; TEXT-ALIGN: left"><asp:DropDownList runat="server" Width="250px" TabIndex="3" ID="AddressPreference"><asp:ListItem Value="Y">Local Address</asp:ListItem>
<asp:ListItem Value="N">Correspondence Address</asp:ListItem>
<asp:ListItem Value="N">Foreign Address</asp:ListItem>
</asp:DropDownList>
 </TD></TR><TR><TD style="PADDING-RIGHT: 20px; PADDING-LEFT: 50px; WIDTH: 27%; HEIGHT: 20px; TEXT-ALIGN: left"><dxe:ASPxLabel runat="server" Text="Local Address Present?" Font-Size="10px" ID="ASPxLabel22" ForeColor="Blue"></dxe:ASPxLabel>
 </TD><TD style="HEIGHT: 20px; TEXT-ALIGN: left"><asp:DropDownList runat="server" Width="250px" TabIndex="4" ID="LocalAddPresent"><asp:ListItem Value="Y">Yes</asp:ListItem>
<asp:ListItem Value="N">No</asp:ListItem>
</asp:DropDownList>
 </TD></TR><TR><TD style="PADDING-RIGHT: 20px; PADDING-LEFT: 50px; WIDTH: 27%; HEIGHT: 20px; TEXT-ALIGN: left"><dxe:ASPxLabel runat="server" Text="Group Type" Font-Size="10px" ID="ASPxLabel3c" ForeColor="Blue"></dxe:ASPxLabel>
 </TD><TD style="HEIGHT: 20px; TEXT-ALIGN: left"><dxe:ASPxComboBox runat="server" Width="250px" ID="GroupType" TabIndex="5" ValueType="System.String" ClientInstanceName="GroupType" Font-Size="10px" Font-Bold="False" EnableIncrementalFiltering="True" OnCallback="GroupType_Callback"></dxe:ASPxComboBox>
 </TD></TR><TR><TD style="PADDING-RIGHT: 20px; PADDING-LEFT: 50px; WIDTH: 27%; HEIGHT: 20px; TEXT-ALIGN: left"><dxe:ASPxLabel runat="server" Text="Group" Font-Size="10px" ID="ASPxLabel3" ForeColor="Blue"></dxe:ASPxLabel>
 </TD><TD style="HEIGHT: 20px; TEXT-ALIGN: left"><asp:TextBox runat="server" Width="247px" TabIndex="6" ID="GroupID" ></asp:TextBox>
 <asp:HiddenField runat="server" ID="HiddenGroupID"></asp:HiddenField>
 </TD></TR><TR><TD style="PADDING-RIGHT: 20px; PADDING-LEFT: 50px; WIDTH: 27%; HEIGHT: 20px; TEXT-ALIGN: left"><dxe:ASPxLabel runat="server" Text="Send Group As Reference" Font-Size="10px" Width="200px" ID="ASPxLabel4" ForeColor="Blue"></dxe:ASPxLabel>
 </TD><TD style="WIDTH: 163px; HEIGHT: 20px; TEXT-ALIGN: left"><asp:CheckBox runat="server" Width="160px" TabIndex="7" ID="SendGroupAsRef2"></asp:CheckBox>
 </TD></TR><TR><TD style="PADDING-RIGHT: 20px; PADDING-LEFT: 50px; WIDTH: 27%; HEIGHT: 20px; TEXT-ALIGN: left"><dxe:ASPxLabel runat="server" Text="Branch" Font-Size="10px" Width="198px" ID="ASPxLabel2b" ForeColor="Blue"></dxe:ASPxLabel>
 </TD><TD style="WIDTH: 166px; HEIGHT: 20px; TEXT-ALIGN: left"><asp:TextBox runat="server" Width="247px" TabIndex="8" ID="BranchID"></asp:TextBox>
 <asp:HiddenField runat="server" ID="HiddenBranchID"></asp:HiddenField>
 </TD></TR><TR><TD style="PADDING-RIGHT: 20px; PADDING-LEFT: 50px; WIDTH: 27%; HEIGHT: 20px; TEXT-ALIGN: left"><dxe:ASPxLabel runat="server" Text="Send Branch As Reference" Font-Size="10px" Width="198px" ID="ASPxLabel2" ForeColor="Blue"></dxe:ASPxLabel>
 </TD><TD style="WIDTH: 166px; HEIGHT: 20px; TEXT-ALIGN: left"><asp:CheckBox runat="server" Width="160px" TabIndex="9" ID="SendBranchAsRef1"></asp:CheckBox>
 </TD></TR><TR><TD style="PADDING-RIGHT: 20px; PADDING-LEFT: 50px; WIDTH: 27%; HEIGHT: 20px; TEXT-ALIGN: left"><dxe:ASPxLabel runat="server" Text="Beneficiary Type / Subtype" Font-Size="10px" ID="ASPxLabel13" ForeColor="Blue"></dxe:ASPxLabel>
 </TD><TD style="WIDTH: 166px; HEIGHT: 20px; TEXT-ALIGN: left"><asp:DropDownList runat="server" Width="250px" TabIndex="10" ID="BeneficiaryTypeSubtype"></asp:DropDownList>
 </TD></TR><TR><TD style="PADDING-RIGHT: 20px; PADDING-LEFT: 50px; WIDTH: 27%; HEIGHT: 20px; TEXT-ALIGN: left"><dxe:ASPxLabel runat="server" Text="Sender Reference(Group)" Font-Size="10px" ID="ASPxLabel22j" ForeColor="Blue"></dxe:ASPxLabel>
 </TD><TD style="WIDTH: 163px; HEIGHT: 20px; TEXT-ALIGN: left"><asp:TextBox runat="server" Width="247px" TabIndex="11" ID="SenderReference2"></asp:TextBox>
 </TD></TR><TR><TD style="PADDING-RIGHT: 20px; PADDING-LEFT: 50px; WIDTH: 27%; HEIGHT: 20px; TEXT-ALIGN: left"><dxe:ASPxLabel runat="server" Text="Sender Reference(Branch)" Font-Size="10px" ID="ASPxLabel11j" ForeColor="Blue"></dxe:ASPxLabel>
 </TD><TD style="WIDTH: 164px; HEIGHT: 20px"><asp:TextBox runat="server" Width="247px" TabIndex="12" ID="SenderReference1"></asp:TextBox>
 </TD></TR><!------ Sudeshna Kundu 1---------><TR><TD style="PADDING-RIGHT: 20px; PADDING-LEFT: 50px; WIDTH: 27%; HEIGHT: 20px; TEXT-ALIGN: left"><dxe:ASPxLabel runat="server" Text="Account Category" Font-Size="10px" ID="ASPxLabel12" ForeColor="Blue"></dxe:ASPxLabel>
 </TD><TD style="WIDTH: 164px; HEIGHT: 20px; TEXT-ALIGN: left"><asp:DropDownList runat="server" Width="250px" TabIndex="13" ID="AccountCategory"><asp:ListItem Value="05">--Select--</asp:ListItem>
<asp:ListItem Value="01">House Account</asp:ListItem>
<asp:ListItem Value="02">Non House Account</asp:ListItem>
<asp:ListItem Value="03">Clearing Member Account</asp:ListItem>
</asp:DropDownList>
 </TD></TR><!-------- Sudeshna Kundu ------><TR><TD style="PADDING-RIGHT: 20px; PADDING-LEFT: 50px; WIDTH: 27%; HEIGHT: 20px; TEXT-ALIGN: left"><dxe:ASPxLabel runat="server" Text="Commodity Flag" Font-Size="10px" ID="ASPxLabel22o" ForeColor="Blue"></dxe:ASPxLabel>
 </TD><TD style="WIDTH: 163px; TEXT-ALIGN: left"><asp:DropDownList runat="server" Width="250px" TabIndex="14" ID="CommodityFlag"><asp:ListItem>--Select--</asp:ListItem>
<asp:ListItem Value="Y">Yes</asp:ListItem>
<asp:ListItem Value="N">No</asp:ListItem>
</asp:DropDownList>
 </TD></TR><TR><TD style="PADDING-RIGHT: 20px; PADDING-LEFT: 50px; WIDTH: 27%; HEIGHT: 20px; TEXT-ALIGN: left"><dxe:ASPxLabel runat="server" Text="Auth Flag" Font-Size="10px" ID="ASPxLabel11o" ForeColor="Blue"></dxe:ASPxLabel>
 </TD><TD style="WIDTH: 164px"><asp:DropDownList runat="server" Width="250px" TabIndex="15" ID="AuthFlag"><asp:ListItem>--Select--</asp:ListItem>
<asp:ListItem Value="Y">Yes</asp:ListItem>
<asp:ListItem Value="N">No</asp:ListItem>
</asp:DropDownList>
 </TD></TR><TR><TD style="PADDING-RIGHT: 20px; PADDING-LEFT: 50px; WIDTH: 27%; HEIGHT: 20px; TEXT-ALIGN: left"><dxe:ASPxLabel runat="server" Text="Standing Instruction" Font-Size="10px" ID="ASPxLabel22g" ForeColor="Blue"></dxe:ASPxLabel>
 </TD><TD style="WIDTH: 163px; TEXT-ALIGN: left"><asp:DropDownList runat="server" Width="250px" TabIndex="16" ID="StandingInstruction"><asp:ListItem>--Select--</asp:ListItem>
<asp:ListItem Value="Y">Yes</asp:ListItem>
<asp:ListItem Value="N">No</asp:ListItem>
</asp:DropDownList>
 </TD></TR><TR id="CorrespondingBPID_Row"><TD style="PADDING-RIGHT: 20px; PADDING-LEFT: 50px; WIDTH: 27%; HEIGHT: 20px; TEXT-ALIGN: left"><dxe:ASPxLabel runat="server" Text="Corresponding BPID" Font-Size="10px" ID="ASPxLabel21" ForeColor="Blue"></dxe:ASPxLabel>
 </TD><TD style="HEIGHT: 20px; TEXT-ALIGN: left"><asp:TextBox runat="server" Width="246px" TabIndex="17" ID="CorrespondingBPID"></asp:TextBox>
 </TD></TR><TR><TD style="PADDING-RIGHT: 20px; PADDING-LEFT: 50px; WIDTH: 27%; HEIGHT: 20px; TEXT-ALIGN: left"><dxe:ASPxLabel runat="server" Text="Foreign/Correspondence address present?" Font-Size="10px" ID="ASPxLabel231" ForeColor="Blue"></dxe:ASPxLabel>
 </TD><TD style="HEIGHT: 20px; TEXT-ALIGN: left"><%--<asp:TextBox runat="server" Width="246px" TabIndex="18" ID="FornCorrsAddPresent"></asp:TextBox>--%>
 <asp:DropDownList runat="server" Width="250px" TabIndex="18" ID="FornCorrsAddPresent">
<asp:ListItem Value="Y">Yes</asp:ListItem>
<asp:ListItem Value="N">No</asp:ListItem>
</asp:DropDownList>
 </TD></TR><!-------- Sudeshna Kundu ------></TBODY></TABLE></asp:Panel>
 </TD></TR><TR><TD style="WIDTH: 961px"></TD></TR></TBODY></TABLE></dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="FirstHolder" Text="First Holder"><ContentCollection>
<dxw:ContentControl runat="server">
                                      
                                           <table class="TableMain100">
                                                <tr>
                                                    <td style="width: 961px; ">
                                                        <asp:Panel runat="server" BorderWidth="2px" BorderColor="White" Width="100%" ID="Panel2"> 
                                                            <table class="TableMain100">
                                                            <tr><td style="padding-left:50px;"><table>
<tr><td style="padding-right: 50px; WIDTH: 30%; HEIGHT: 20px; TEXT-ALIGN: left;"></td>

 <td style="HEIGHT: 20px; TEXT-ALIGN: left; width:270px;"></td>
 
 </tr>                                                            
               <tr>                   <!----- Sudeshna Kundu ------->                                         <td>
                                                                        <dxe:ASPxLabel runat="server" Text="First Holder Name" Font-Size="10px" ID="ASPxLabel6" ForeColor="Blue"></dxe:ASPxLabel>





                                                                    </td>
                                            <td >
       <asp:TextBox runat="server" Width="247px" TabIndex="18" ID="FirstHolderName"></asp:TextBox>



                                                                    </td></tr><tr>
<td >
                                                                        <dxe:ASPxLabel runat="server" Text="First Holder Father/Husband Name" Font-Size="10px" ID="ASPxLabel9" ForeColor="Blue"></dxe:ASPxLabel>





                                                                    </td>
                                                       <td >
 <asp:TextBox runat="server" Width="247px" TabIndex="19" ID="FirstHolderFatherHusbandName"></asp:TextBox>




                                                                    </td></tr><tr>
<td >
                                                                        <dxe:ASPxLabel runat="server" Text="First Holder PAN" Font-Size="10px" ID="ASPxLabel28a" ForeColor="Blue"></dxe:ASPxLabel>




                                                                    </td>
                                                                    <td>
<asp:TextBox runat="server" Width="247px" TabIndex="20" ID="FirstHolderPAN"></asp:TextBox>





 <asp:RegularExpressionValidator runat="server" ErrorMessage="Please Enter Valid PAN Number" ControlToValidate="FirstHolderPAN" ID="reg" ValidationExpression="^[A-Z]{5}\d{4}[A-Z]{1}$"></asp:RegularExpressionValidator>




                                                        
                                                                    </td></tr><tr>
<td >
                                                                        <dxe:ASPxLabel runat="server" Text=" No. of First Holder POA Mapping" Font-Size="10px" ID="ASPxLabel23j" ForeColor="Blue"></dxe:ASPxLabel>





                                                                    </td>
                 <td >
  <dxe:ASPxTextBox runat="server" Width="250px" TabIndex="21" ID="FirstHolderPOAMappingN" onKeyPress="return onlyNumbers();" ></dxe:ASPxTextBox>




                                                                    </td>
                                                                    </tr><tr>
                                                                    <td >
                                                                        <dxe:ASPxLabel runat="server" Text="First Holder Email" Font-Size="10px" ID="ASPxLabel28j" ForeColor="Blue"></dxe:ASPxLabel>




                                                                    </td>
                                                                    <td>
   <asp:TextBox runat="server" Width="247px" TabIndex="22" ID="FirstHolderEmail"></asp:TextBox>





   <asp:RegularExpressionValidator runat="server" ErrorMessage="Please Enter Valid Email" ControlToValidate="FirstHolderEmail" ID="RegularExpressionValidator3" ValidationExpression="^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$"></asp:RegularExpressionValidator>




                                                                    </td></tr><tr>
                                                               
                                                                    <td >
                                                                        <dxe:ASPxLabel runat="server" Text="First Holder Mobile" Font-Size="10px" ID="ASPxLabel22k" ForeColor="Blue"></dxe:ASPxLabel>



                                                                    </td>
                                                              <td >
<asp:TextBox runat="server" Width="247px" TabIndex="23" ID="FirstHolderMobile" onKeyPress="return onlyNumbers();" ></asp:TextBox>






<asp:RegularExpressionValidator runat="server" ErrorMessage="Please Enter Valid mobile Number" ControlToValidate="FirstHolderMobile" ID="RegularExpressionValidator6" ValidationExpression="^(\d{2})?(\d{10}){1}?$"></asp:RegularExpressionValidator>






                                                                    </td></tr><tr>

                                                                    <td >
                                                                        <dxe:ASPxLabel runat="server" Text="First Holder SMS Facility" Font-Size="10px" ID="ASPxLabel11k" ForeColor="Blue"></dxe:ASPxLabel>








                                                                    </td>
                                                                    <td >
<asp:DropDownList runat="server" Width="250px" TabIndex="24" ID="FirstHolderSMSFacility"><asp:ListItem Value="N">No</asp:ListItem>
<asp:ListItem Value="Y">Yes</asp:ListItem>
</asp:DropDownList>




                                                                   


                                                                    </td></tr><tr>
                                                                    <td >
                                                                        <dxe:ASPxLabel runat="server" Text="First Holder Authorization Flag" Font-Size="10px" ID="ASPxLabel23k" ForeColor="Blue"></dxe:ASPxLabel>







                                                                    </td>
                 <td >
  
<asp:DropDownList runat="server" Width="250px" TabIndex="25" ID="FirstHolderAuthFlag"><asp:ListItem Value="N">No</asp:ListItem>
<asp:ListItem Value="Y">Yes</asp:ListItem>
</asp:DropDownList>



                                                                    </td>
                                                                    </tr><tr>
                                                                    <td >
                                                                        <dxe:ASPxLabel runat="server" Text="First Holder PAN Flag" Font-Size="10px" ID="ASPxLabel28k" ForeColor="Blue"></dxe:ASPxLabel>







                                                                    </td>
                                                                    <td>
<asp:DropDownList runat="server" Width="250px" TabIndex="26" ID="FirstHolderPANFlag"><asp:ListItem Value="N">No</asp:ListItem>
<asp:ListItem Value="Y">Yes</asp:ListItem>
</asp:DropDownList>




                                                                    </td></tr><tr>
          <td >
                                                                        <dxe:ASPxLabel runat="server" Text="No Nomination Flag For first holder" Font-Size="10px" ID="ASPxLabel23o" ForeColor="Blue"></dxe:ASPxLabel>



                                                                    </td>
                 <td >


<asp:DropDownList runat="server" Width="250px" TabIndex="27" ID="FirstHolderNoNominationFlag"><asp:ListItem Value="Y">Yes</asp:ListItem>
<asp:ListItem Value="N">No</asp:ListItem>
</asp:DropDownList>

                                                                    </td>  </tr><tr>
                                                                    <td>
                                                                        <dxe:ASPxLabel runat="server" Text="No. of First Holder authorized Signatories" Font-Size="10px" ID="ASPxLabe" ForeColor="Blue"></dxe:ASPxLabel>

                                                                    </td>
          <td>
  <dxe:ASPxTextBox runat="server" Width="250px" TabIndex="28" ID="FirstHolderAuthSignatoriesN" onKeyPress="return onlyNumbers();"></dxe:ASPxTextBox>




                                                                    </td>                                                   
                                                          <!----- Sudeshna Kundu -------> 
  </tr><tr><td style="PADDING-RIGHT: 50px; WIDTH: 30%; HEIGHT: 20px; TEXT-ALIGN: left;"></td>

 <td style="HEIGHT: 20px; TEXT-ALIGN: left;"></td>
 
   
                                                      </tr></table></td></tr></table></asp:Panel>





</td></tr></table>
                                        </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="SecondHolder" Text="Second Holder"><ContentCollection>
<dxw:ContentControl runat="server">
            <!----- Sudeshna Kundu ------->   
            <table class="TableMain100">
                                                <tr>
                                                    <td style="width: 961px;">
                                                        <asp:Panel runat="server" BorderWidth="2px" BorderColor="White" Width="100%" ID="Panel3"> 
                                             <table class="TableMain100">
                                                            
<tr><td style="padding-left:50px;"><table>
<tr><td style="padding-right: 50px; WIDTH: 30%; HEIGHT: 20px; TEXT-ALIGN: left;"></td>

 <td style="HEIGHT: 20px; TEXT-ALIGN: left; width:270px;"></td>
 
 </tr>                                                                                                                       
                                                               <tr>
                                                                    <td >
                                                                        <dxe:ASPxLabel runat="server" Text="Second Holder Name" Font-Size="10px" ID="ASPxLabel8" ForeColor="Blue"></dxe:ASPxLabel>




                                                                    </td>
                                       <td>
   <asp:TextBox runat="server" Width="247px" TabIndex="28" ID="SecondHolderName"></asp:TextBox>





                                                                    </td></tr><tr>
                                                                    <td >
     <dxe:ASPxLabel runat="server" Text="Second Holder Father/Husband Name" Font-Size="10px" ID="ASPxLabel7" ForeColor="Blue"></dxe:ASPxLabel>








                                                                    </td>
<td >
                                                                        <dxe:ASPxTextBox runat="server" Width="250px" TabIndex="29" ID="SecondHolderFatherHusbandName"></dxe:ASPxTextBox>



                                                                    </td></tr><tr>

<td >
                                                                        <dxe:ASPxLabel runat="server" Text="Second Holder PAN" Font-Size="10px" ID="ASPxLabel22b" ForeColor="Blue"></dxe:ASPxLabel>





                                                                    </td>
                                                                    <td >
  <asp:TextBox runat="server" Width="247px" TabIndex="30" ID="SecondHolderPAN"></asp:TextBox>



<asp:RegularExpressionValidator runat="server" ErrorMessage="Please Enter Valid PAN Number" ControlToValidate="SecondHolderPAN" ID="RegularExpressionValidator1" ValidationExpression="^[A-Z]{5}\d{4}[A-Z]{1}$"></asp:RegularExpressionValidator>


                                                                    </td></tr><tr>

   <td>
                                                                        <dxe:ASPxLabel runat="server" Text="No. Of Second Holder POA Mapping" Font-Size="10px" ID="ASPxLabel22lx" ForeColor="Blue"></dxe:ASPxLabel>



                                                                    </td>
                                                                    <td>
        <dxe:ASPxTextBox runat="server" Width="250px" TabIndex="31" ID="SecondHolderPOAMappingN" onKeyPress="return onlyNumbers();" ></dxe:ASPxTextBox>

                                                                    </td>  
                                                                    </tr><tr>                                             <td>
                                                                        <dxe:ASPxLabel runat="server" Text="Second Holder Email" Font-Size="10px" ID="ASPxLabel11l" ForeColor="Blue"></dxe:ASPxLabel>


                                                                    </td>
                                                                    <td>
  <asp:TextBox runat="server" Width="247px" TabIndex="32" ID="SecondHolderEmail"></asp:TextBox>






<asp:RegularExpressionValidator runat="server" ErrorMessage="Please Enter Valid Email" ControlToValidate="SecondHolderEmail" ID="RegularExpressionValidator4" ValidationExpression="^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$"></asp:RegularExpressionValidator>



                                                           </td></tr><tr>
                                                                    <td >
                                                                        <dxe:ASPxLabel runat="server" Text="Second Holder Mobile" Font-Size="10px" ID="ASPxLabel23l" ForeColor="Blue"></dxe:ASPxLabel>



                                                                    </td>
                 <td >
  <asp:TextBox runat="server" Width="247px" TabIndex="33" ID="SecondHolderMobile" onKeyPress="return onlyNumbers();" ></asp:TextBox>




<asp:RegularExpressionValidator runat="server" ErrorMessage="Please Enter Valid mobile Number" ControlToValidate="SecondHolderMobile" ID="RegularExpressionValidator7" ValidationExpression="^(\d{2})?(\d{10}){1}?$"></asp:RegularExpressionValidator>




                                                                    </td></tr><tr>
                                                                    <td >
                                                                        <dxe:ASPxLabel runat="server" Text="Second Holder SMS Facility" Font-Size="10px" ID="ASPxLabel28l" ForeColor="Blue"></dxe:ASPxLabel>




                                                                    </td>
                                                                    <td>
<asp:DropDownList runat="server" Width="250px" TabIndex="34" ID="SecondHolderSMSFacility"><asp:ListItem Value="N">No</asp:ListItem>
<asp:ListItem Value="Y">Yes</asp:ListItem>
</asp:DropDownList>


   

                                                                    </td>
                                                               </tr><tr>
                                                                    <td >
                                                                        <dxe:ASPxLabel runat="server" Text="Second Holder Authorization Flag" Font-Size="10px" ID="ASPxLabel22m" ForeColor="Blue"></dxe:ASPxLabel>







                                                                    </td>
                                                                    <td>

<asp:DropDownList runat="server" Width="250px" TabIndex="35" ID="SecondHolderAuthFlag"><asp:ListItem Value="N">No</asp:ListItem>
<asp:ListItem Value="Y">Yes</asp:ListItem>
</asp:DropDownList>






                                                                    </td>
                           </tr><tr>                                           
 <td>
                                                                        <dxe:ASPxLabel runat="server" Text="Second Holder PAN Flag" Font-Size="10px" ID="ASPxLabel11m" ForeColor="Blue"></dxe:ASPxLabel>






                                                                    </td>
                                                                    <td>

<asp:DropDownList runat="server" Width="250px" TabIndex="36" ID="SecondHolderPANFlag"><asp:ListItem Value="N">No</asp:ListItem>
<asp:ListItem Value="Y">Yes</asp:ListItem>
</asp:DropDownList>





                                                                    </td>  </tr><tr>
                                                                    <td>
                                                                        <dxe:ASPxLabel runat="server" Text="No. of Second Holder Authorized Signatories" Font-Size="10px" ID="ASPxLabe2" ForeColor="Blue"></dxe:ASPxLabel>




                                                                    </td>
          <td>
  <dxe:ASPxTextBox runat="server" Width="250px" TabIndex="37" ID="SecondHolderAuthSignatoriesN" onKeyPress="return onlyNumbers();" ></dxe:ASPxTextBox>




                                                                    </td>                                                                                      
                                                                     </tr>
                                                 <!-------- Sudeshna Kundu ------>  
     <tr><td style="PADDING-RIGHT: 50px; WIDTH: 30%; HEIGHT: 20px; TEXT-ALIGN: left;"></td>

 <td style="HEIGHT: 20px; TEXT-ALIGN: left;"></td></tr>
                                                                </table></td></tr></table></asp:Panel>







</td></tr></table> <!----- Sudeshna Kundu -------> 
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
    <!----- Sudeshna Kundu ------->   <table class="TableMain100">
                                                <tr>
                                                    <td style="width: 961px">
                                                        <asp:Panel runat="server" BorderWidth="2px" BorderColor="White" Width="100%" ID="Panel5"> 
  <table class="TableMain100">
<tr><td style="padding-left:50px;"><table>
<tr><td style="padding-right: 50px; WIDTH: 30%; HEIGHT: 20px; TEXT-ALIGN: left;"></td>

 <td style="HEIGHT: 20px; TEXT-ALIGN: left; width:270px;"></td>
 
 </tr>                                                                              
                   <tr>

<td>
                                                                        <dxe:ASPxLabel runat="server" Text="Nominee Gaurdian Indicator" Font-Size="10px" ID="ASPxLabel23b" ForeColor="Blue"></dxe:ASPxLabel>



                                                                    </td>
                            <td>
 
<asp:DropDownList runat="server" Width="250px" TabIndex="46" ID="NomineeGaurdianIndicator"><asp:ListItem Value="N">Nominee</asp:ListItem>
<asp:ListItem Value="G">Guardian</asp:ListItem>
</asp:DropDownList>


                                                                    </td></tr><tr>
                                                                    <td valign="top" >
                                                                        <dxe:ASPxLabel runat="server" Text="Nominee Gaurdian Name" Font-Size="10px" ID="ASPxLabel28b" ForeColor="Blue"></dxe:ASPxLabel>



                                                                    </td>
                                                                    <td>
                                                                      <dxe:ASPxTextBox runat="server" Width="250px" TabIndex="47" ID="NomineeGaurdianName"></dxe:ASPxTextBox>




                                                          </td></tr><tr>
                                                               
                                                                    <td >
                                                                        <dxe:ASPxLabel runat="server" Text="Nominee Minor Indicator" Font-Size="10px" ID="ASPxLabel22c" ForeColor="Blue"></dxe:ASPxLabel>




                                                                    </td>
                                                    <td >
                                                    
<asp:DropDownList runat="server" Width="250px" TabIndex="48" ID="NomineeMinorIndicator"><asp:ListItem Value="N">No</asp:ListItem>
<asp:ListItem Value="Y">Yes</asp:ListItem>
</asp:DropDownList>
                                      
                                                   
                                                                    </td></tr><tr>

  <td >
  <dxe:ASPxLabel runat="server" Text="Minor Nominee Gaurdian Name" Font-Size="10px" ID="ASPxLabel11c" ForeColor="Blue"></dxe:ASPxLabel>







                                                                    </td>
                                                                    <td >
  <dxe:ASPxTextBox runat="server" Width="250px" TabIndex="49" ID="MinorNomineeGaurdianName"></dxe:ASPxTextBox>




                                                                    </td>
                                                                    </tr><tr>
                                                                    <td >
                                                                        <dxe:ASPxLabel runat="server" Text="DOB Minor" Font-Size="10px" ID="ASPxLabel23c" ForeColor="Blue"></dxe:ASPxLabel>




                                                                    </td>
                                                     <td >
  
        <dxe:ASPxDateEdit runat="server" EditFormatString="dd-MM-yyyy" Font-Size="11px" Width="250px" EditFormat="Custom" ID="DOBMinor" DateOnError="Today" UseMaskBehavior="True" TabIndex="50">
<ButtonStyle Width="13px"></ButtonStyle>
</dxe:ASPxDateEdit>


                                                                    </td></tr><tr>
                                                                    <td >
                                                                        <dxe:ASPxLabel runat="server" Text="DOB Minor Nominee" Font-Size="10px" ID="ASPxLabel28c" ForeColor="Blue"></dxe:ASPxLabel>



                                                                    </td>
                                                                    <td>
                                                                     
<dxe:ASPxDateEdit runat="server" EditFormatString="dd-MM-yyyy" Font-Size="11px" Width="250px" EditFormat="Custom" ID="DOBMinorNominee" DateOnError="Today" UseMaskBehavior="True" TabIndex="51">
<ButtonStyle Width="13px"></ButtonStyle>
</dxe:ASPxDateEdit>



                                                                    </td></tr>
                      
 <TR><TD><dxe:ASPxLabel runat="server" Text="Nominee/Guardian address present?" Font-Size="10px" ID="ASPxLabel23" ForeColor="Blue"></dxe:ASPxLabel>





 </TD><TD >
 
<asp:DropDownList runat="server" Width="250px" TabIndex="52" ID="NomGaurdAddPresent"><asp:ListItem Value="N">No</asp:ListItem>
<asp:ListItem Value="Y">Yes</asp:ListItem>
</asp:DropDownList>




   
 </TD></TR><TR><TD><dxe:ASPxLabel runat="server" Text="Minor Nominee’s Guardian Address present?" Font-Size="10px" ID="ASPxLabel28" ForeColor="Blue"></dxe:ASPxLabel>





 </TD><TD>
 <asp:DropDownList runat="server" Width="250px" TabIndex="53" ID="MinorNomGaurdAddPresent"><asp:ListItem Value="N">No</asp:ListItem>
<asp:ListItem Value="Y">Yes</asp:ListItem>
</asp:DropDownList>




  
 </TD></TR>
 
                      </table></td></tr></table></asp:Panel>






</td></tr></table> <!----- Sudeshna Kundu ------->
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
      <!----- Sudeshna Kundu ------->   <table class="TableMain100">
                                                <tr>
                                                    <td style="width: 961px">
                                                        <asp:Panel runat="server" BorderWidth="2px" BorderColor="White" Width="100%" ID="Panel7"> 
                                                             <table class="TableMain100">
                                                            <tr><td style="padding-left:50px;"><table>
<tr><td style="padding-right: 50px; WIDTH: 30%; HEIGHT: 20px; TEXT-ALIGN: left;"></td>

 <td style="HEIGHT: 20px; TEXT-ALIGN: left; width:270px;"></td>
 
 </tr>                                                            
           <tr>   <!----- Su ------->
                   <td><dxe:ASPxLabel runat="server" Text="Address Type" Font-Size="10px" ID="ASPxLabe90" ForeColor="Blue"></dxe:ASPxLabel></td>    
                   <td><asp:TextBox runat="server" Width="247px" TabIndex="1" ID="AddressType"></asp:TextBox></td>            </tr>  <!----- Su ------->   
           <tr>   <!----- Su ------->
                   <td><dxe:ASPxLabel runat="server" Text="Address 1" Font-Size="10px" ID="ASPxLabe91" ForeColor="Blue"></dxe:ASPxLabel></td>    
                   <td><asp:TextBox runat="server" Width="247px" TabIndex="2" ID="Address1"></asp:TextBox></td>            </tr>  <!----- Su -------> 
           <tr>   <!----- Su ------->
                   <td><dxe:ASPxLabel runat="server" Text="Address 2" Font-Size="10px" ID="ASPxLabe92" ForeColor="Blue"></dxe:ASPxLabel></td>    
                   <td><asp:TextBox runat="server" Width="247px" TabIndex="3" ID="Address2"></asp:TextBox></td>            </tr>  <!----- Su ------->    
           <tr>   <!----- Su ------->
                   <td><dxe:ASPxLabel runat="server" Text="Address 3" Font-Size="10px" ID="ASPxLabe93" ForeColor="Blue"></dxe:ASPxLabel></td>    
                   <td><asp:TextBox runat="server" Width="247px" TabIndex="4" ID="Address3"></asp:TextBox></td>            </tr>  <!----- Su ------->                               
           <tr>   <!----- Su ------->
                   <td><dxe:ASPxLabel runat="server" Text="Country" Font-Size="10px" ID="ASPxLabe94" ForeColor="Blue"></dxe:ASPxLabel></td>    
                   <td><asp:TextBox runat="server" Width="247px" TabIndex="5" ID="Country"></asp:TextBox></td>            </tr>  <!----- Su ------->                               
           <tr>   <!----- Su ------->
                   <td><dxe:ASPxLabel runat="server" Text="State" Font-Size="10px" ID="ASPxLabe95" ForeColor="Blue"></dxe:ASPxLabel></td>    
                   <td><asp:TextBox runat="server" Width="247px" TabIndex="6" ID="State"></asp:TextBox></td>            </tr>  <!----- Su ------->                               
           <tr>   <!----- Su ------->
                   <td><dxe:ASPxLabel runat="server" Text="City" Font-Size="10px" ID="ASPxLabe96" ForeColor="Blue"></dxe:ASPxLabel></td>    
                   <td><asp:TextBox runat="server" Width="247px" TabIndex="7" ID="City"></asp:TextBox></td>            </tr>  <!----- Su ------->                               
          <tr>   <!----- Su ------->
                   <td><dxe:ASPxLabel runat="server" Text="PinCode" Font-Size="10px" ID="ASPxLabe941" ForeColor="Blue"></dxe:ASPxLabel></td>    
                   <td><asp:TextBox runat="server" Width="247px" TabIndex="8" ID="PinCode"></asp:TextBox></td>            </tr>  <!----- Su ------->                               
           <tr>   <!----- Su ------->
                   <td><dxe:ASPxLabel runat="server" Text="Phone" Font-Size="10px" ID="ASPxLabe952" ForeColor="Blue"></dxe:ASPxLabel></td>    
                   <td><asp:TextBox runat="server" Width="247px" TabIndex="9" ID="Phone"></asp:TextBox></td>            </tr>  <!----- Su ------->                               
           <tr>   <!----- Su ------->
                   <td><dxe:ASPxLabel runat="server" Text="Fax" Font-Size="10px" ID="ASPxLabe963" ForeColor="Blue"></dxe:ASPxLabel></td>    
                   <td><asp:TextBox runat="server" Width="247px" TabIndex="10" ID="Fax"></asp:TextBox></td>            </tr>  <!----- Su ------->                                              
                                                          
 <tr><td style="PADDING-RIGHT: 50px; WIDTH: 30%; HEIGHT: 20px; TEXT-ALIGN: left;"></td>

 <td style="HEIGHT: 20px; TEXT-ALIGN: left;"></td>
 
   
                                                      </tr></table></td></tr></table></asp:Panel>

</td></tr></table> <!----- Sudeshna Kundu ------->
                                        </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="AuthorizedSignatories" Text="Authorized Signatories"><ContentCollection>
<dxw:ContentControl runat="server">
                                        <!----- Sudeshna Kundu ------->   <table class="TableMain100">
                                                <tr>
                                                    <td style="width: 961px">
                                                        <asp:Panel runat="server" BorderWidth="2px" BorderColor="White" Width="100%" ID="Panel8"> 
                                                             <table class="TableMain100">
                                                            <tr><td style="padding-left:50px;"><table>
<tr><td style="padding-right: 50px; WIDTH: 30%; HEIGHT: 20px; TEXT-ALIGN: left;"></td>

 <td style="HEIGHT: 20px; TEXT-ALIGN: left; width:270px;"></td>
 
 </tr>                                                            
           <tr>   <!----- Su ------->
                   <td><dxe:ASPxLabel runat="server" Text="Holder Indicator" Font-Size="10px" ID="ASPxLabe901" ForeColor="Blue"></dxe:ASPxLabel></td>    
                   <td><asp:TextBox runat="server" Width="247px" TabIndex="1" ID="HolderIndicator"></asp:TextBox></td>            </tr>  <!----- Su ------->   
           <tr>   <!----- Su ------->
                   <td><dxe:ASPxLabel runat="server" Text="SignatoryID" Font-Size="10px" ID="ASPxLabe912" ForeColor="Blue"></dxe:ASPxLabel></td>    
                   <td><asp:TextBox runat="server" Width="247px" TabIndex="2" ID="SignatoryID"></asp:TextBox>
                   </td>   </tr>  <!----- Su -------> 
                 
   <tr><td style="PADDING-RIGHT: 50px; WIDTH: 30%; HEIGHT: 20px; TEXT-ALIGN: left;"></td>

 <td style="HEIGHT: 20px; TEXT-ALIGN: left;"></td>
 
   
                                                      </tr></table></td></tr></table></asp:Panel>


</td></tr></table> <!----- Sudeshna Kundu ------->
                                        </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="POADetail" Text="POA Detail"><ContentCollection>
<dxw:ContentControl runat="server">
                                        
                                        <!----- Sudeshna Kundu ------->   <table class="TableMain100">
                                                <tr>
                                                    <td style="width: 961px">
                                                        <asp:Panel runat="server" BorderWidth="2px" BorderColor="White" Width="100%" ID="Panel9"> 
                                                             <table class="TableMain100">
                                                            <tr><td style="padding-left:50px;"><table>
<tr><td style="padding-right: 50px; WIDTH: 30%; HEIGHT: 20px; TEXT-ALIGN: left;"></td>

 <td style="HEIGHT: 20px; TEXT-ALIGN: left; width:270px;"></td>
 
 </tr>                                                            
  <tr>   <!----- Su ------->
             <td><dxe:ASPxLabel runat="server" Text="Address Type" Font-Size="10px" ID="ASPxLabe900" ForeColor="Blue"></dxe:ASPxLabel></td>    
                <td><asp:TextBox runat="server" Width="247px" TabIndex="1" ID="TextBox15"></asp:TextBox></td>            </tr>  <!----- Su ------->   
           <tr>   <!----- Su ------->
                   <td><dxe:ASPxLabel runat="server" Text="Address Type" Font-Size="10px" ID="ASPxLabe911" ForeColor="Blue"></dxe:ASPxLabel></td>    
                   <td><asp:TextBox runat="server" Width="247px" TabIndex="1" ID="TextBox16"></asp:TextBox></td>            </tr>  <!----- Su -------> 
           <tr>   <!----- Su ------->
                   <td><dxe:ASPxLabel runat="server" Text="Address Type" Font-Size="10px" ID="ASPxLabe922" ForeColor="Blue"></dxe:ASPxLabel></td>    
                   <td><asp:TextBox runat="server" Width="247px" TabIndex="1" ID="TextBox17"></asp:TextBox></td>            </tr>  <!----- Su ------->    
           <tr>   <!----- Su ------->
                   <td><dxe:ASPxLabel runat="server" Text="Address Type" Font-Size="10px" ID="ASPxLabe933" ForeColor="Blue"></dxe:ASPxLabel></td>    
                   <td><asp:TextBox runat="server" Width="247px" TabIndex="1" ID="TextBox18"></asp:TextBox></td>            </tr>  <!----- Su ------->                               
           <tr>   <!----- Su ------->
                   <td><dxe:ASPxLabel runat="server" Text="Address Type" Font-Size="10px" ID="ASPxLabe944" ForeColor="Blue"></dxe:ASPxLabel></td>    
                   <td><asp:TextBox runat="server" Width="247px" TabIndex="1" ID="TextBox19"></asp:TextBox></td>            </tr>  <!----- Su ------->                               
           <tr>   <!----- Su ------->
                   <td><dxe:ASPxLabel runat="server" Text="Address Type" Font-Size="10px" ID="ASPxLabe955" ForeColor="Blue"></dxe:ASPxLabel></td>    
                   <td><asp:TextBox runat="server" Width="247px" TabIndex="1" ID="TextBox20"></asp:TextBox></td>            </tr>  <!----- Su ------->                               
           <tr>   <!----- Su ------->
                   <td><dxe:ASPxLabel runat="server" Text="Address Type" Font-Size="10px" ID="ASPxLabe966" ForeColor="Blue"></dxe:ASPxLabel></td>    
                   <td><asp:TextBox runat="server" Width="247px" TabIndex="1" ID="TextBox21"></asp:TextBox></td>            </tr>  <!----- Su ------->          
     <tr><td style="PADDING-RIGHT: 50px; WIDTH: 30%; HEIGHT: 20px; TEXT-ALIGN: left;"></td>

 <td style="HEIGHT: 20px; TEXT-ALIGN: left;"></td>
 
   
                                                      </tr></table></td></tr></table></asp:Panel>

</td></tr></table> <!----- Sudeshna Kundu ------->
                                        </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="Signature" Text="Signature"><ContentCollection>
<dxw:ContentControl runat="server">
                                        <!----- Sudeshna Kundu ------->   <table class="TableMain100">
                                                <tr>
                                                    <td style="width: 961px">
                                                        <asp:Panel runat="server" BorderWidth="2px" BorderColor="White" Width="100%" ID="Panel10"> 
                                                             <table class="TableMain100">
                                                            <tr><td style="padding-left:50px;"><table>
<tr><td style="padding-right: 50px; WIDTH: 30%; HEIGHT: 20px; TEXT-ALIGN: left;"></td>

 <td style="HEIGHT: 20px; TEXT-ALIGN: left; width:270px;"></td>
 
 </tr>                                                            
 <tr>   <!----- Su ------->
                   <td><dxe:ASPxLabel runat="server" Text="Address Type" Font-Size="10px" ID="ASPxLabe902" ForeColor="Blue"></dxe:ASPxLabel></td>    
                   <td><asp:TextBox runat="server" Width="247px" TabIndex="1" ID="TextBox22"></asp:TextBox></td>            </tr>  <!----- Su ------->   
           <tr>   <!----- Su ------->
                   <td><dxe:ASPxLabel runat="server" Text="Address Type" Font-Size="10px" ID="ASPxLabe913" ForeColor="Blue"></dxe:ASPxLabel></td>    
                   <td><asp:TextBox runat="server" Width="247px" TabIndex="1" ID="TextBox23"></asp:TextBox></td>            </tr>  <!----- Su -------> 
           <tr>   <!----- Su ------->
                   <td><dxe:ASPxLabel runat="server" Text="Address Type" Font-Size="10px" ID="ASPxLabe924" ForeColor="Blue"></dxe:ASPxLabel></td>    
                   <td><asp:TextBox runat="server" Width="247px" TabIndex="1" ID="TextBox24"></asp:TextBox></td>            </tr>  <!----- Su ------->    
           <tr>   <!----- Su ------->
                   <td><dxe:ASPxLabel runat="server" Text="Address Type" Font-Size="10px" ID="ASPxLabe935" ForeColor="Blue"></dxe:ASPxLabel></td>    
                   <td><asp:TextBox runat="server" Width="247px" TabIndex="1" ID="TextBox25"></asp:TextBox></td>            </tr>  <!----- Su ------->                               
           <tr>   <!----- Su ------->
                   <td><dxe:ASPxLabel runat="server" Text="Address Type" Font-Size="10px" ID="ASPxLabe946" ForeColor="Blue"></dxe:ASPxLabel></td>    
                   <td><asp:TextBox runat="server" Width="247px" TabIndex="1" ID="TextBox26"></asp:TextBox></td>            </tr>  <!----- Su ------->                               
           <tr>   <!----- Su ------->
                   <td><dxe:ASPxLabel runat="server" Text="Address Type" Font-Size="10px" ID="ASPxLabe957" ForeColor="Blue"></dxe:ASPxLabel></td>    
                   <td><asp:TextBox runat="server" Width="247px" TabIndex="1" ID="TextBox27"></asp:TextBox></td>            </tr>  <!----- Su ------->                               
           <tr>   <!----- Su ------->
                   <td><dxe:ASPxLabel runat="server" Text="Address Type" Font-Size="10px" ID="ASPxLabe968" ForeColor="Blue"></dxe:ASPxLabel></td>    
                   <td><asp:TextBox runat="server" Width="247px" TabIndex="1" ID="TextBox28"></asp:TextBox></td>            </tr>  <!----- Su ------->          
      <tr><td style="PADDING-RIGHT: 50px; WIDTH: 30%; HEIGHT: 20px; TEXT-ALIGN: left;"></td>

 <td style="HEIGHT: 20px; TEXT-ALIGN: left;"></td>
 
   
                                                      </tr></table></td></tr></table></asp:Panel>

</td></tr></table> <!----- Sudeshna Kundu ------->
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
                                                <dxe:ASPxButton ID="btnSaveDB" runat="server" Text="Save Data To DataBase" OnClick="btnSaveDB_Click" ValidationGroup="a"
                                                    TabIndex="63">
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

