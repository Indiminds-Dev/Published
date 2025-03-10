<%@ page language="C#" autoeventwireup="true" inherits="management_slab, App_Web_fbvamflg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %> 
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
 
    <!--___________________These files are for List Items__________________________-->

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

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
		z-index:100;
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
		z-index:900;
	}
	#ajax_listOfOptions_iframe{
		background-color:#F00;
		position:absolute;
		z-index:10;
	}
	
	form{
		display:inline;
	}
	
	</style>
    <style type="text/css">
       a:hover {background:#ffffff; text-decoration:none;} /*BG color is a must for IE6*/
       a.tooltip span {display:none; padding:2px 3px; font-size:smaller; margin-left:1px; width:100px;}
       a.tooltip:hover span{display:inline; position:horizontal; background:#ffffff; border:1px solid #cccccc; color:#6c6c6c; width:100px}
    
    </style>

    <script language="javascript" type="text/javascript">
   function SignOff()
    {
        window.parent.SignOff();
    }
     function disableflat()
     {
        var gh= document.getElementById("txtrate").value;
       if(gh!="")
       document.getElementById("txtflatrate").disabled=true;
        else
           document.getElementById("txtflatrate").disabled=false;
     }
     function diaableflatrate()
     {
      
       var gg= document.getElementById("txtmincharge").value;
       if(gg!="")
       document.getElementById("txtflatrate").disabled=true;
       else
       document.getElementById("txtflatrate").disabled=false;
       
     }

     function disablerate()
     {   
       var dd= document.getElementById("txtflatrate").value;
       if(dd!="")
       {
       document.getElementById("txtrate").disabled=true;
       document.getElementById("txtmincharge").disabled=true;
       }
       else
       
       {
         document.getElementById("txtrate").disabled=false;
       document.getElementById("txtmincharge").disabled=false;
       }
       
     }
  
   function noNumbers(e)
    {
        var keynum
        var keychar
        var numcheck
        
        if(window.event)//IE
        {
            keynum = e.keyCode                        
            if(keynum>=48 && keynum<=57 || keynum==46)
                 {
                  return true;
                 }
            else
                {
                 alert("Please Insert Numeric Only");
                 return false;
                }
         } 
         
        else if(e.which) // Netscape/Firefox/Opera
       {
           keynum = e.which  
           
           if(keynum>=48 && keynum<=57 || keynum==46)
                 {
                  return true;
                 }
           else
                 {
                 alert("Please Insert Numeric Only");
                 return false;
                 }     
        }
    } 
  

</script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
   <table class="TableMain100">
   <tr>
   <td align="center">
   <table  style="Z-INDEX: 101; WIDTH: 100px;border:1px solid white">
<tr>
  <asp:HiddenField id="hd1" runat="server"/>
  <td class="Ecoheadtxt"><dxe:ASPxLabel runat="server" Text="Slab Code:" ID="ASPxLabel1"></dxe:ASPxLabel>
  </td>
  <td style="TEXT-ALIGN: left" class="Ecoheadtxt"><dxe:ASPxTextBox runat="server" Width="150px" MaxLength="4" TabIndex="4" ID="txtslabcode" onkeyup="textcounter(this,4)"></dxe:ASPxTextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtslabcode"
          ErrorMessage="Required!."></asp:RequiredFieldValidator></td>
 <td  class="Ecoheadtxt"><dxe:ASPxLabel runat="server" Text="Slab Type:" ID="ASPxLabel5"></dxe:ASPxLabel>
 </td>
 
 <td style="TEXT-ALIGN: left" class="Ecoheadtxt"><dxe:ASPxComboBox runat="server" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True" ValueType="System.String" Width="160px" ID="ddltype"><Items>
        <dxe:ListEditItem Text="Turnover" Value="Turnover"></dxe:ListEditItem>
        <dxe:ListEditItem Text="Delivery Turnover" Value="Delivery Turnover"></dxe:ListEditItem>
        <dxe:ListEditItem Text="Sqroff Turnover" Value="Sqroff Turnover"></dxe:ListEditItem>
        <dxe:ListEditItem Text="Brokerage" Value="Brokerage"></dxe:ListEditItem>
        <dxe:ListEditItem Text="Delivery Brokerage" Value="Delivery Brokerage"></dxe:ListEditItem>
        <dxe:ListEditItem Text="Sqroff Brokerage" Value="Sqroff Brokerage"></dxe:ListEditItem>
        <dxe:ListEditItem Text="Sqroff Profits" Value="Sqroff Profits"></dxe:ListEditItem>
        <dxe:ListEditItem Text="Sqroff Loss" Value="Sqroff Loss"></dxe:ListEditItem>
        <dxe:ListEditItem Text="Exposure" Value="Exposure"></dxe:ListEditItem>
        <dxe:ListEditItem Text="Daily Margin" Value="Daily Margin"></dxe:ListEditItem>
        <dxe:ListEditItem Text="Margin Shortage" Value="Margin Shortage"></dxe:ListEditItem>
        <dxe:ListEditItem Text="MTM Profits" Value="MTM Profits"></dxe:ListEditItem>
        <dxe:ListEditItem Text="MTM Losses" Value="MTM Losses"></dxe:ListEditItem>
        <dxe:ListEditItem Text="Future Final Settlement" Value="Future Final Settlement"></dxe:ListEditItem>
        <dxe:ListEditItem Text="Options Exercise" Value="Options Exercise"></dxe:ListEditItem>
        <dxe:ListEditItem Text="Options Assignments" Value="Options Assignments"></dxe:ListEditItem>
        <dxe:ListEditItem Text="Options Final Settlement" Value="Options Final Settlement"></dxe:ListEditItem>
        </Items>
        </dxe:ASPxComboBox>
 </td>
 

 
 </tr>
 <tr>
            <td  class="Ecoheadtxt"><dxe:ASPxLabel runat="server" Text="Min:" ID="ASPxLabel28"></dxe:ASPxLabel>
         </td><td style="TEXT-ALIGN: left" class="Ecoheadtxt"><dxe:ASPxTextBox runat="server" Width="150px" MaxLength="19" ID="txtmin" onkeypress="return noNumbers(event)"></dxe:ASPxTextBox>
         </td>
         <td  class="Ecoheadtxt">
         <dxe:ASPxLabel runat="server" Text="Max:" ID="ASPxLabel29"></dxe:ASPxLabel>
         </td><td style=" TEXT-ALIGN: left" class="Ecoheadtxt">
         <dxe:ASPxTextBox runat="server" Width="150px" ID="txtmax" onkeypress="return noNumbers(event)"></dxe:ASPxTextBox>
         </td>
 </tr>
 
 <tr>
 
     <td class="Ecoheadtxt"><dxe:ASPxLabel runat="server" Text="Flat Rate:" Width="93px" ID="ASPxLabel30"></dxe:ASPxLabel>
     </td><td style="TEXT-ALIGN: left" class="Ecoheadtxt">

    <asp:TextBox runat="server" Width="150px" ID="txtflatrate" MaxLength="19"></asp:TextBox>
     </td><td  class="Ecoheadtxt"><dxe:ASPxLabel runat="server" Text="Rate(%):" Width="93px"  ID="ASPxLabel38"></dxe:ASPxLabel>
     </td><td style="TEXT-ALIGN: left" class="Ecoheadtxt">
        <asp:TextBox ID="txtrate" runat="server" MaxLength="19" Width="150px"></asp:TextBox>
     </td>
      
     
 </tr>
 <tr>
   <td  class="Ecoheadtxt"><dxe:ASPxLabel runat="server" Text="Min Charge:" Width="93px" ID="ASPxLabel90"></dxe:ASPxLabel>
     </td>
     <td style="TEXT-ALIGN:left" class="Ecoheadtxt">
    <asp:TextBox runat="server" Width="150px" ID="txtmincharge" MaxLength="19"></asp:TextBox>
     </td>
 </tr>
 
 <tr>
  <td colspan="4"  class="Ecoheadtxt">
       <asp:Button id="btnSave" runat="server"  Text="Save" OnClick="btnSave_Click" CssClass="btnUpdate"/>
   </td>
 
 </tr>
 
 </table>
 </td>
 </tr>
 
 </table>
    </form>
</body>
</html>
