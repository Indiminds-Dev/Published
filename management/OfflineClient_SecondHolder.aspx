<%@ page language="C#" autoeventwireup="true" inherits="management_OfflineClient_SecondHolder, App_Web_v5pngf_u" %>

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
        else if ( name == "tab1")
        {
        //alert(name);
        document.location.href="OfflineClient_FirstHolder.aspx"; 
        }
       /* else if ( name == "tab2")
        {
        //alert(name);
        document.location.href="OfflineClient_SecondHolder.aspx"; 
        }*/
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
                    
                    <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="2" ClientInstanceName="page" Font-Size="10px" >
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
