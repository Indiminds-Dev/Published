<%@ page language="C#" autoeventwireup="true" inherits="management_bslab, App_Web_rilo-itm" %>

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
  
   function disableminrate()
 {  
   var gg= document.getElementById("txtfixedamt").value;
   if(gg!="")
   {
   document.getElementById("txtrate").disabled=true;
   document.getElementById("txtminamt").disabled=true;
   }
   
   else
   
   {
    document.getElementById("txtrate").disabled=false;
   document.getElementById("txtminamt").disabled=false;
   }
 }
 
 function disablefixedamt()
 {
   var gf= document.getElementById("txtminamt").value;
   if(gf!="")
   document.getElementById("txtfixedamt").disabled=true;
   else
   document.getElementById("txtfixedamt").disabled=false;
  
 }
 
 function disablefixedamt1()
 {
   var rr= document.getElementById("txtrate").value;
   if(rr!="")
   document.getElementById("txtfixedamt").disabled=true;
   else
    document.getElementById("txtfixedamt").disabled=false;
  
 }
</script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
     <div>
            <table  class="TableMain100">
                <tr>
                    <td >
                    </td>
                </tr>
                <tr>
                    <td>
                   
                            <table width="100%">
                                <tr>
                                    <td align="center">
                                        <table style="width:100px; z-index:101;border:solid 1px white">
                                            <tr>
                                            <asp:HiddenField id="hd1" runat="server"/>
                                                <td class="Ecoheadtxt" >
                                                    <dxe:ASPxLabel ID="ASPxLabel1" runat="server" Text="Slab Code:"></dxe:ASPxLabel>
                                                </td>
                                                <td class="Ecoheadtxt" style="text-align: left;padding:3px;">
                                                   <dxe:ASPxTextBox runat="server" Width="150px" MaxLength="4"  ID="txtslabcode"></dxe:ASPxTextBox>
                                                                                                     
                                                </td>
                                                <td class="Ecoheadtxt"  >
                                                    <dxe:ASPxLabel ID="ASPxLabel5" runat="server" Text="Slab Type:"></dxe:ASPxLabel>
                                                </td>
                                                <td class="Ecoheadtxt" style="text-align: left;padding:3px;">
                                                                   
                                                   <dxe:ASPxComboBox runat="server" Width="160px" ID="ddltype" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                                                                            
                                                                   <Items>
                                                                        <dxe:ListEditItem Text="Unit Price" Value="Unit Price">
                                                                         </dxe:ListEditItem>
                                                                         <dxe:ListEditItem Text="Volume" Value="Volume">
                                                                         </dxe:ListEditItem>
                                                                       <dxe:ListEditItem Text="Delivery Volume" Value="Delivery Volume">
                                                                         </dxe:ListEditItem>
                                                                            <dxe:ListEditItem Text="Square-Off Volume" Value="Square-Off Volume">
                                                                         </dxe:ListEditItem>
                                                                                         
                                                                   </Items>
                   
                                                     </dxe:ASPxComboBox>
                                                
                                                </td>
                                                
                    
                                            </tr>

                                           <tr>
                                                   <td class="Ecoheadtxt"  >
                                                        <dxe:ASPxLabel ID="ASPxLabel28" runat="server" Text="Min:" ></dxe:ASPxLabel>
                                                    </td>
                                                    <td class="Ecoheadtxt" style="text-align: left;">
                                                      <asp:TextBox  runat="server" Width="150px"  ID="txtmin" onkeypress="return noNumbers(event)" MaxLength="19"></asp:TextBox>
                                                       <%--<dxe:ASPxTextBox runat="server" Width="150px"  ID="txtmin" onkeypress="return noNumbers(event)">--%>
                                                     <%--  <MaskSettings Mask="<0..999999999999g>.<00..99>"  />
                                                       <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>--%>
                                          <%--             </dxe:ASPxTextBox>--%>
                                                        
                                                    </td>
                                                    
                                                          <td class="Ecoheadtxt" >
                                                      <dxe:ASPxLabel ID="ASPxLabel29" runat="server" Text="Max:"></dxe:ASPxLabel>
                                                    </td>
                                                    <td class="Ecoheadtxt" style="text-align:left;">
                                                    <asp:TextBox runat="server" Width="150px"   MaxLength="19" ID="txtmax" onkeypress="return noNumbers(event)"></asp:TextBox>
                                                  <%--   <dxe:ASPxTextBox runat="server" Width="150px"  ID="txtmax" onkeypress="return noNumbers(event)">
                                                 
                                                     </dxe:ASPxTextBox>--%>
                                                    </td>
                                           </tr>
                                              <tr>
                                                                                              
                                          
                                                
                                                 <td class="Ecoheadtxt" >
                                                    <dxe:ASPxLabel ID="ASPxLabel30" runat="server" Text="Fixed Amt:" Width="93px"></dxe:ASPxLabel>
                                                </td>
                                                <td class="Ecoheadtxt" style="text-align: left">
                                               <%--  <dxe:ASPxTextBox runat="server" Width="150px"  ID="txtfixedamt" onkeypress="return noNumbers(event)">
                                                </dxe:ASPxTextBox>--%>
                                                <asp:TextBox runat="server" Width="150px"  ID="txtfixedamt" onkeypress="return noNumbers(event)" MaxLength="19"></asp:TextBox>
                                                </td>
                                                <td class="Ecoheadtxt" >
                                                    <dxe:ASPxLabel ID="ASPxLabel38" runat="server" Text="Rate(%):" Width="93px"></dxe:ASPxLabel>
                                                </td>
                                                <td class="Ecoheadtxt" style="text-align: left">
                                               <%--     <dxe:ASPxTextBox runat="server" Width="150px"  ID="txtrate" onkeypress="return noNumbers(event)">
                                                        </dxe:ASPxTextBox>--%>
                                                  <asp:TextBox runat="server" Width="150px"  ID="txtrate" onkeypress="return noNumbers(event)" MaxLength="19"></asp:TextBox>
                                                </td>
                                              </tr>
                                              <tr>
                                                  
                                                  <td class="Ecoheadtxt" >
                                                    <dxe:ASPxLabel ID="ASPxLabel90" runat="server" Text="Min Amt:" Width="93px"></dxe:ASPxLabel>
                                                </td>
                                                <td class="Ecoheadtxt" style="text-align: left">
                                           <%--       <dxe:ASPxTextBox runat="server" Width="150px"  ID="txtminamt" onkeypress="return noNumbers(event)">
                                                    </dxe:ASPxTextBox>--%>
                                                    
                                                    <asp:TextBox  runat="server" Width="150px"  ID="txtminamt" onkeypress="return noNumbers(event)" MaxLength="19"></asp:TextBox>
                                                  </td>
                                                 
                                              </tr>
                                              <tr>
                                                    <td colspan="4" class="Ecoheadtxt">
                                                    <asp:Button id="btnSave" runat="server" style="cursor:pointer" CssClass="btnupdate" Text="Save" OnClick="btnSave_Click" OnClientClick="return aa();"/>
                                                    </td>
                                             </tr>        
                                            
                                        </table>
                                    </td>
                                </tr>
                               
                              
                            </table>
          
                    </td>
                </tr>
<%--                <tr>
                    <td style="height: 8px">
                        <table style="width: 100%;">
                            <tr>
                                <td align="right" style="width: 843px">
                                    <asp:HiddenField ID="hdReferenceBy" runat="server" />
                                    <table>
                                        <tr>
                                            <td style="height: 43px">
                                             <asp:Button id="btnSave" runat="server" style="cursor:pointer" Text="Save" OnClick="btnSave_Click" OnClientClick="return aa();"/>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>--%>
            </table>
        </div>
    </form>
</body>
</html>
