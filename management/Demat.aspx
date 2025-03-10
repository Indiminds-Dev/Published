<%@ page language="C#" autoeventwireup="true" inherits="management_Demat, App_Web_udicbieo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml">
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
     function textValidation()
   {
      
     
       var str = document.getElementById('txtGroup').value;
       var str1 = ddlcmpname.GetValue();
       var str2 = ddlsegment.GetValue()
     if(str=="")
          {
          alert("Please select group.");
          return false;
          }
      if(str1=="--Select Company--")
          {
          alert("Please select Company name.");
          return false;
          }
      if(str2==null)
          {
             alert("Please select Segment.");
             return false;
          }
      
   }
    <!--
// <!CDATA[
//function is called on changing country

function OnAccountDematChanged(ddldematmain)
{
    CallServer('AccRel' + '~' + ddldematmain.GetValue().toString(), ""); 
    ddldematsub.PerformCallback(ddldematmain.GetValue().toString());
   
}

function OnAccountTranChanged(ddlservtaxmain)
{
  CallServer('Trancharge' + '~' + ddlservtaxmain.GetValue().toString(), ""); 
  ddlservtaxsub.PerformCallback(ddlservtaxmain.GetValue().toString());
}

function OnChargeChanged(ddlcharge)
{
   var text=ddlcharge.GetText().toString();
   var text1=ddltaxapp.GetText().toString();
   if(text=="None")
   {
   document.getElementById("trtrancharge").style.display = "none";
   document.getElementById("trtranclient").style.display = "none";
   document.getElementById("accfor").style.display = "none";
   }
   else if(text!="None" && text1=="No")
   {
   document.getElementById("trtrancharge").style.display = "none";
   document.getElementById("accfor").style.display = "none";
   document.getElementById("trtranclient").style.display = "none";
   }
   else if(text!="None" && text1=="Yes")
   {
   document.getElementById("trtrancharge").style.display = "none";
   document.getElementById("accfor").style.display = "none";
   document.getElementById("trtranclient").style.display = "none";
   }
}
function displaynotaccount()
{
   document.getElementById("trtrancharge").style.display = "none";
   document.getElementById("accfor").style.display = "none";
   document.getElementById("trtranclient").style.display = "none";
  

}
function displayclient()
{
    document.getElementById("tdrsubacc").style.display = "inline";
}
function displaynotclient()
{
    document.getElementById("tdrsubacc").style.display = "none";
}
function displayexchange()
{
  document.getElementById("tdunsubacc").style.display = "inline";
}
function displaynotexchange()
{
 document.getElementById("tdunsubacc").style.display = "none";
}
function displaycharge()
{ 
   document.getElementById("tdservtax").style.display = "inline";
}
function displaynotcharge()
{
   document.getElementById("tdservtax").style.display = "none";
}
function displayaccount()
{
   document.getElementById("trtrancharge").style.display = "none";
   document.getElementById("accfor").style.display = "none";
   document.getElementById("trtranclient").style.display = "none";
}
function displayaccount1()
{
   document.getElementById("trtrancharge").style.display = "none";
   document.getElementById("accfor").style.display = "none";
   document.getElementById("trtranclient").style.display = "none";
}
function displaydemat()
{
   document.getElementById("trtrancharge").style.display = "none";
   document.getElementById("accfor").style.display = "none";
   document.getElementById("trtranclient").style.display = "none";

}

function ALERT()
{
  alert('This Date Already Exist for this combination.\n Date Should be Greater than Or Less Than From Previous Date');

}
function displaytax()
{
   document.getElementById("trtrancharge").style.display = "none";
}
function displaynottax()
{
   document.getElementById("trtrancharge").style.display = "none";
}
function OnTaxChanged(ddltaxapp)
{
    var text=ddltaxapp.GetText().toString();
    if(text=="No")
    document.getElementById("trtrancharge").style.display = "none";
    else
    document.getElementById("trtrancharge").style.display = "none";
 }
 


function ReceiveServerData(rValue)
    {   
      
        var DATA=rValue.split('~');  
        if(DATA[0]=="AccRel")
        {
          
         if(DATA[1]!="N")
            { 
            
             document.getElementById("tdrsubacc").style.display = "inline";
            }
            
            else
            {
            document.getElementById("tdrsubacc").style.display = "none";
            }
        }
        
         if(DATA[0]=="AccUnRel")
        {
         if(DATA[1]!="N")
            { 
             document.getElementById("tdunsubacc").style.display = "inline";
            }
            
            else
            {
            document.getElementById("tdunsubacc").style.display = "none";
            }
            
        }
        
        
                
         if(DATA[0]=="Trancharge")
        {
         if(DATA[1]!="N")
            { 
             document.getElementById("tdservtax").style.display = "inline";
            }
            
            else
            {
            document.getElementById("tdservtax").style.display = "none";
            }
            
        }
          if(DATA[0]=="Segment")
        {
      
         if(DATA[1]!="N")
            { 
            
             document.getElementById("tdlevelsegment").style.display = "inline";
             document.getElementById("tdsegment").style.display = "inline";
            }
            
            else
            {
          
            document.getElementById("tdlevelsegment").style.display = "none";
            document.getElementById("tdsegment").style.display = "none";
            }
            
        }
    }
    
    
     function CallAjax(obj1,obj2,obj3)
    {
        FieldName='ctl00_ContentPlaceHolder1_Headermain1_cmbSegment';
        ajax_showOptions(obj1,obj2,obj3);
    }
    function display()
{
  document.getElementById("tdlevelsegment").style.display = "inline";
  document.getElementById("tdsegment").style.display = "inline";
}
    function displaybasis()
    {
     document.getElementById("tab2").style.display = "inline";
     document.getElementById("tab1").style.display = "inline";
     document.getElementById("tab3").style.display = "inline";
     document.getElementById("tab4").style.display = "inline";
     document.getElementById("tab5").style.display = "inline";
    
    }
    function displayrate()
    {
      document.getElementById("trrate").style.display = "inline";
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

//--></script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
      <form id="form1" runat="server" autocomplete="off">
   <div>
        <table class="TableMain100">
                <tr>
                    <td >
                    </td>
                </tr>
                <tr>
                    <td>
                            <table width="100%">
                                <tr>
                                    <td>
                                        <table style="width:100px; z-index:101">
                                            <tr>
                                            
                                                 <td class="Ecoheadtxt" style="text-align:left"><dxe:ASPxLabel ID="lbl6" runat="server" width="140px"  Text="Group:" ></dxe:ASPxLabel></td>
                                                 <td class="Ecoheadtxt" style="text-align:left;"> <asp:TextBox ID="txtGroup" runat="server"  Font-Size="11px" Width="160px"></asp:TextBox><asp:TextBox  ID="txtGroup_hidden" runat="server" Width="14px" style="display:none"></asp:TextBox></td>
                                                <td class="Ecoheadtxt"  style="text-align:left">
                                                    <dxe:ASPxLabel ID="ASPxLabel1" runat="server" Text="Company:" ></dxe:ASPxLabel>
                                                </td>
                                                <td class="Ecoheadtxt" style="text-align: left;">
                                             
                                                    <dxe:ASPxComboBox runat="server" EnableSynchronization="False" EnableIncrementalFiltering="True" ValueType="System.String" DataSourceID="AccessDataSourceCompany" TextField="cmp_Name" ValueField="cmp_internalid"  ID="ddlcmpname">
                                                        
                                                        </dxe:ASPxComboBox>
                                                    
                                                </td>
                                                <td class="Ecoheadtxt" style="text-align:left" id="tdlevelsegment" runat="server">
                                                    <dxe:ASPxLabel ID="ASPxLabel5" runat="server" Text="Segment:"></dxe:ASPxLabel>
                                                </td>
                                                <td class="Ecoheadtxt" style="text-align: left;" id="tdsegment" runat="server">
                                                     <dxe:ASPxComboBox runat="server" DropDownStyle="DropDown" width="120px" EnableSynchronization="False" EnableIncrementalFiltering="True" ValueType="System.String" DataSourceID="AccessDataSourceSegment" TextField="segment_name" ValueField="exch_internalId"  ClientInstanceName="ddlsegment" ID="ddlsegment">
                                                   </dxe:ASPxComboBox>
                                                
                                                </td>
                                               
                                            </tr>
                                            
                                           
                                              <tr>
                                                 
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                    <dxe:ASPxLabel ID="ASPxLabel28" runat="server" Text="Basis:" ></dxe:ASPxLabel>
                                                </td>
                                                <td class="Ecoheadtxt" style="text-align: left;">
                                                    <dxe:ASPxComboBox runat="server" Width="90px" ID="ddlbasis" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                                                                                         
                                                                   <Items>
                                                                        <dxe:ListEditItem Text="Transfers" Value="Transfers">
                                                                         </dxe:ListEditItem>
                                                                         <dxe:ListEditItem Text="Trade" Value="Trade">
                                                                         </dxe:ListEditItem>
                                                                                      
                                                                   </Items>
                   
                                                     </dxe:ASPxComboBox>
                                                  
                                                    
                                                </td>
                                                
                                                    <td class="Ecoheadtxt" style="text-align:left">
                                                    <dxe:ASPxLabel ID="ASPxLabel29" runat="server" Text="Frequency:"></dxe:ASPxLabel>
                                                </td>
                                                <td class="Ecoheadtxt" style="text-align: left;">
                                                     <dxe:ASPxComboBox runat="server" Width="90px" ID="ddlfrequency" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                                                                                            
                                                                   <Items>
                                                                        <dxe:ListEditItem Text="Daily" Value="Daily">
                                                                         </dxe:ListEditItem>
                                                                         <dxe:ListEditItem Text="Monthly" Value="Monthly">
                                                                         </dxe:ListEditItem>
                                                                                      
                                                                   </Items>
                   
                                                     </dxe:ASPxComboBox>
                                                
                                                </td>
                                                 <td class="Ecoheadtxt" style="text-align:left">
                                                    <dxe:ASPxLabel ID="ASPxLabel2" runat="server" Text="Date:" Width="93px"></dxe:ASPxLabel>
                                                </td>
                                                <td class="Ecoheadtxt" style="text-align: left">
                                                 <dxe:ASPxDateEdit runat="server" UseMaskBehavior ="True" DateOnError="Today" EditFormat="Custom"   Width="150px"  ID="Dateedit">
                                                    <ButtonStyle Width="13px"></ButtonStyle>
                                                    </dxe:ASPxDateEdit>
                                                
                                                </td>
                                                                                     
                                               
                                              </tr>
                                                                                       
                                               <tr>
                                                 <td class="Ecoheadtxt" style="text-align:left">
                                                    <dxe:ASPxLabel ID="ASPxLabel30" runat="server" Text="Calculate On:" Width="93px"></dxe:ASPxLabel>
                                                </td>
                                                <td class="Ecoheadtxt" style="text-align: left">
                                                     <dxe:ASPxComboBox runat="server" width="93px" ID="ddlcalon" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                               <Items>
                                                                           <dxe:ListEditItem Text="Trade Value" Value="Trade Value">
                                                                           </dxe:ListEditItem>
                                                                           <dxe:ListEditItem Text="Market Value" Value="Market Value">
                                                                           </dxe:ListEditItem>
                                                                       
                                                                        </Items>
                                                                       
                                                     </dxe:ASPxComboBox>
                                                
                                                </td>
                                                           <td class="Ecoheadtxt" style="text-align:left">
                                                    <dxe:ASPxLabel ID="ASPxLabel59" runat="server" Text="ServTax/GST Applicable:" ></dxe:ASPxLabel>
                                                </td>
                                                <td class="Ecoheadtxt" style="text-align: left;">
                                                     <dxe:ASPxComboBox runat="server" Width="90px" ID="ddltaxapp" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                           <ClientSideEvents SelectedIndexChanged="function(s, e) { OnTaxChanged(s); }"></ClientSideEvents>
                                                                 
                                                                   <Items>
                                                                        <dxe:ListEditItem Text="No" Value="No">
                                                                         </dxe:ListEditItem>
                                                                         <dxe:ListEditItem Text="Yes" Value="Yes">
                                                                         </dxe:ListEditItem>
                                                                                      
                                                                   </Items>
                   
                                                     </dxe:ASPxComboBox>
                                                
                                                </td>
                                                
                                                 <td class="Ecoheadtxt" style="text-align:left">
                                                    <dxe:ASPxLabel ID="ASPxLabel50" runat="server" Text="Chargeable To:" ></dxe:ASPxLabel>
                                                </td>
                                                <td class="Ecoheadtxt" style="text-align: left">
                                                     <dxe:ASPxComboBox runat="server" width="93px" ID="ddlcharge" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                     <ClientSideEvents SelectedIndexChanged="function(s, e) { OnChargeChanged(s); }"></ClientSideEvents>
                                                     
                                                                         <Items>
                                                                           <dxe:ListEditItem Text="All" Value="All">
                                                                           </dxe:ListEditItem>
                                                                           <dxe:ListEditItem Text="None" Value="None">
                                                                           </dxe:ListEditItem>
                                                                           <dxe:ListEditItem Text="Selected" Value="Selected">
                                                                           </dxe:ListEditItem>
                                                                           <dxe:ListEditItem Text="All But Selected" Value="All But Selected">
                                                                           </dxe:ListEditItem>
                                                                           <dxe:ListEditItem Text="Not Applicable" Value="NA">
                                                                           </dxe:ListEditItem>
                                                                        </Items>
                                                                       
                                                     </dxe:ASPxComboBox>
                                                
                                                </td>
                                             <%--   <td colspan="2"></td>--%>
                                                
                                                </tr>
                                               
                                                <%-- Various Payins Start--%>
                                               
                                                                 
                                                  <tr style="background-color:#FFF3DF;">
                                                  <td class="Ecoheadtxt" colspan="1">
                                                   </td>
                                                    <td class="Ecoheadtxt" style="text-align:center;" >
                                                      <dxe:ASPxLabel ID="ASPxLabel31" runat="server" Text="Rate" ></dxe:ASPxLabel> 
                                                      </td>
                                                       <td class="Ecoheadtxt" style="text-align:center;" >
                                                      <dxe:ASPxLabel ID="ASPxLabel32" runat="server" Text="Min" ></dxe:ASPxLabel> 
                                                      </td>
                                                         <td class="Ecoheadtxt" style="text-align:center;" >
                                                      <dxe:ASPxLabel ID="ASPxLabel33" runat="server" Text="Max" ></dxe:ASPxLabel> 
                                                      </td>
                                                        <td class="Ecoheadtxt" style="text-align:center;" >
                                                      <dxe:ASPxLabel ID="ASPxLabel34" runat="server" Text="Flat" ></dxe:ASPxLabel> 
                                                      </td>
                                                        <td class="Ecoheadtxt" style="text-align:center;" >
                                                      <dxe:ASPxLabel ID="ASPxLabel35" runat="server" Text="Additive" ></dxe:ASPxLabel> 
                                                      </td>
                                                     
                                                  </tr>
                                                  
                                                       <tr style="background-color:#FFFBF4;">
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                      <dxe:ASPxLabel ID="ASPxLabel3" runat="server" Text="Normal Payins(PI):"  ></dxe:ASPxLabel>
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                  <dxe:ASPxTextBox runat="server" Width="90px"  ID="txtpirate" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                   <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                                  
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                  <dxe:ASPxTextBox runat="server" Width="90px"  ID="txtpimin" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                                 
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left ;">
                                                  <dxe:ASPxTextBox runat="server" Width="90px"  ID="txtpimax" onkeypress="return noNumbers(event)">
                                                   <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                   <ValidationSettings ErrorDisplayMode="None"></ValidationSettings></dxe:ASPxTextBox>
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                  <dxe:ASPxTextBox runat="server" Width="90px"  ID="txtpiflat" onkeypress="return noNumbers(event)">
                                                      <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                   <ValidationSettings ErrorDisplayMode="None"></ValidationSettings></dxe:ASPxTextBox>
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                   <dxe:ASPxComboBox runat="server" width="93px" ID="ddlpiadd" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                               <Items>
                                                                           <dxe:ListEditItem Text="Yes" Value="Yes">
                                                                           </dxe:ListEditItem>
                                                                           <dxe:ListEditItem Text="No" Value="No">
                                                                           </dxe:ListEditItem>
                                                                       
                                                                        </Items>
                                                                       
                                                     </dxe:ASPxComboBox>
                                                  </td>
                                       
                                                  </tr>
                               
                                                  
                                                   <tr style="background-color:#FFFBF4;">
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                      <dxe:ASPxLabel ID="ASPxLabel36" runat="server" Text="PI From Own DP:"  ></dxe:ASPxLabel>
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                  <dxe:ASPxTextBox runat="server" Width="90px"  ID="txtpiorate" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                   <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                                  
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                  <dxe:ASPxTextBox runat="server" Width="90px" ID="txtpiomin" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                   <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                                  
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                  <dxe:ASPxTextBox runat="server" Width="90px"  ID="txtpiomax" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                               
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                  <dxe:ASPxTextBox runat="server" Width="90px"  ID="txtpioflat" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                        <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                               
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                   <dxe:ASPxComboBox runat="server" width="93px" ID="ddlpioadd" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                               <Items>
                                                                           <dxe:ListEditItem Text="Yes" Value="Yes">
                                                                           </dxe:ListEditItem>
                                                                           <dxe:ListEditItem Text="No" Value="No">
                                                                           </dxe:ListEditItem>
                                                                       
                                                                        </Items>
                                                                       
                                                     </dxe:ASPxComboBox>
                                                  </td>
                                       
                                                  </tr>
                                                    
                                                    <tr style="background-color:#FFFBF4;">
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                      <dxe:ASPxLabel ID="ASPxLabel37" runat="server" Text="PI from Margin:"  ></dxe:ASPxLabel>
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                  <dxe:ASPxTextBox runat="server" Width="90px"  ID="txtmpirate" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                              
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                  <dxe:ASPxTextBox runat="server" Width="90px"  ID="txtmpimin" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                               
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                  <dxe:ASPxTextBox runat="server" Width="90px"  ID="txtmpimax" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                                 
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                  <dxe:ASPxTextBox runat="server" Width="90px" TabIndex="10" ID="txtmpiflat" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                               
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                   <dxe:ASPxComboBox runat="server" width="93px" ID="ddlmpiadd" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                               <Items>
                                                                           <dxe:ListEditItem Text="Yes" Value="Yes">
                                                                           </dxe:ListEditItem>
                                                                           <dxe:ListEditItem Text="No" Value="No">
                                                                           </dxe:ListEditItem>
                                                                       
                                                                        </Items>
                                                                       
                                                     </dxe:ASPxComboBox>
                                                  </td>
                                       
                                                  </tr>
                                                  
                                                    <tr style="background-color:#FFFBF4;">
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                      <dxe:ASPxLabel ID="ASPxLabel38" runat="server" Text="PI from Holdback:"  ></dxe:ASPxLabel>
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                  <dxe:ASPxTextBox runat="server" Width="90px"  ID="txthpirate" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                   <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                               
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                  <dxe:ASPxTextBox runat="server" Width="90px" ID="txthpimin" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                               
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                  <dxe:ASPxTextBox runat="server" Width="90px"  ID="txthpimax" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                                 
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                  <dxe:ASPxTextBox runat="server" Width="90px"  ID="txthpiflat" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                                  
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                   <dxe:ASPxComboBox runat="server" width="93px" ID="ddlhpiadd" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                               <Items>
                                                                           <dxe:ListEditItem Text="Yes" Value="Yes">
                                                                           </dxe:ListEditItem>
                                                                           <dxe:ListEditItem Text="No" Value="No">
                                                                           </dxe:ListEditItem>
                                                                       
                                                                        </Items>
                                                                       
                                                     </dxe:ASPxComboBox>
                                                  </td>
                                       
                                                  </tr>
                                                  
                                                  <tr style="background-color:#FFFBF4;">
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                      <dxe:ASPxLabel ID="ASPxLabel39" runat="server" Text="Normal Payouts(PO):"  ></dxe:ASPxLabel>
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                  <dxe:ASPxTextBox runat="server" Width="90px"  ID="txtporate" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                      <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                                  
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                  <dxe:ASPxTextBox runat="server" Width="90px" ID="txtpomin" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                                 
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                  <dxe:ASPxTextBox runat="server" Width="90px"  ID="txtpomax" onkeypress="return noNumbers(event)">
                                                  <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                       
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                  <dxe:ASPxTextBox runat="server" Width="90px"  ID="txtpoflat" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                               
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                   <dxe:ASPxComboBox runat="server" width="93px" ID="ddlpoadd" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                               <Items>
                                                                           <dxe:ListEditItem Text="Yes" Value="Yes">
                                                                           </dxe:ListEditItem>
                                                                           <dxe:ListEditItem Text="No" Value="No">
                                                                           </dxe:ListEditItem>
                                                                       
                                                                        </Items>
                                                                       
                                                     </dxe:ASPxComboBox>
                                                  </td>
                                       
                                                  </tr>
                                                  
                                                   <tr style="background-color:#FFFBF4;">
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                      <dxe:ASPxLabel ID="ASPxLabel40" runat="server" Text="PO To Own DP:" ></dxe:ASPxLabel>
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                  <dxe:ASPxTextBox runat="server" Width="90px"  ID="txtpoorate" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                               
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                  <dxe:ASPxTextBox runat="server" Width="90px"  ID="txtpoomin" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                     <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                           
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                  <dxe:ASPxTextBox runat="server" Width="90px"  ID="txtpoomax" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                     <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                               
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                  <dxe:ASPxTextBox runat="server" Width="90px" ID="txtpooflat" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                     
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                   <dxe:ASPxComboBox runat="server" width="93px" ID="ddlpooadd" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                               <Items>
                                                                           <dxe:ListEditItem Text="Yes" Value="Yes">
                                                                           </dxe:ListEditItem>
                                                                           <dxe:ListEditItem Text="No" Value="No">
                                                                           </dxe:ListEditItem>
                                                                       
                                                                        </Items>
                                                                       
                                                     </dxe:ASPxComboBox>
                                                  </td>
                                       
                                                  </tr>
                                                  
                                                   <tr style="background-color:#FFFBF4;">
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                      <dxe:ASPxLabel ID="ASPxLabel41" runat="server" Text="PO To Margin :"  ></dxe:ASPxLabel>
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                  <dxe:ASPxTextBox runat="server" Width="90px"  ID="txtmporate" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                              
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                  <dxe:ASPxTextBox runat="server" Width="90px"  ID="txtmpomin" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                            
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                  <dxe:ASPxTextBox runat="server" Width="90px"  ID="txtmpomax" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                     <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                                 
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                  <dxe:ASPxTextBox runat="server" Width="90px"  ID="txtmpoflat" onkeypress="return noNumbers(event)">
                                                  
                                                    <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>

                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                   <dxe:ASPxComboBox runat="server" width="93px" ID="ddlmpoadd" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                               <Items>
                                                                           <dxe:ListEditItem Text="Yes" Value="Yes">
                                                                           </dxe:ListEditItem>
                                                                           <dxe:ListEditItem Text="No" Value="No">
                                                                           </dxe:ListEditItem>
                                                                       
                                                                        </Items>
                                                                       
                                                     </dxe:ASPxComboBox>
                                                  </td>
                                       
                                                  </tr>
                                                  
                                                    <tr style="background-color:#FFFBF4;">
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                      <dxe:ASPxLabel ID="ASPxLabel42" runat="server" Text="PO To Holdback :" ></dxe:ASPxLabel>
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                  <dxe:ASPxTextBox runat="server" Width="90px"  ID="txthporate" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                                 
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                  <dxe:ASPxTextBox runat="server" Width="90px"  ID="txthpomin" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                   <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                               
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                  <dxe:ASPxTextBox runat="server" Width="90px"  ID="txthpomax" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                                
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                  <dxe:ASPxTextBox runat="server" Width="90px"  ID="txthpoflat" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                          
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                   <dxe:ASPxComboBox runat="server" width="93px" ID="ddlhpoadd" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                               <Items>
                                                                           <dxe:ListEditItem Text="Yes" Value="Yes">
                                                                           </dxe:ListEditItem>
                                                                           <dxe:ListEditItem Text="No" Value="No">
                                                                           </dxe:ListEditItem>
                                                                       
                                                                        </Items>
                                                                       
                                                     </dxe:ASPxComboBox>
                                                  </td>
                                       
                                                  </tr>
                                                  
                                                   <tr style="background-color:#FFFBF4;">
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                      <dxe:ASPxLabel ID="ASPxLabel43" runat="server" Text="Margin Inwards:" ></dxe:ASPxLabel>
                                                  </td>
                                                  <td class="Ecoheadtxt" style=";text-align:left;">
                                                  <dxe:ASPxTextBox runat="server" Width="90px"  ID="txtmirate" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                   <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                                 
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                  <dxe:ASPxTextBox runat="server" Width="90px"  ID="txtmimin" onkeypress="return noNumbers(event)">
                                                     <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings></dxe:ASPxTextBox>
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                  <dxe:ASPxTextBox runat="server" Width="90px" ID="txtmimax" onkeypress="return noNumbers(event)">
                                                 <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                              
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                  <dxe:ASPxTextBox runat="server" Width="90px" ID="txtmiflat" onkeypress="return noNumbers(event)">
                                                  
                                                  <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>

                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                   <dxe:ASPxComboBox runat="server" width="93px" ID="ddlmiadd" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                               <Items>
                                                                           <dxe:ListEditItem Text="Yes" Value="Yes">
                                                                           </dxe:ListEditItem>
                                                                           <dxe:ListEditItem Text="No" Value="No">
                                                                           </dxe:ListEditItem>
                                                                       
                                                                        </Items>
                                                                       
                                                     </dxe:ASPxComboBox>
                                                  </td>
                                       
                                                  </tr>
                                                  
                                                    <tr style="background-color:#FFFBF4;">
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                      <dxe:ASPxLabel ID="ASPxLabel44" runat="server" Text="Margin Outwards:" ></dxe:ASPxLabel>
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                  <dxe:ASPxTextBox runat="server" Width="90px"  ID="txtmorate" onkeypress="return noNumbers(event)">
                                                  <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                                 
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                  <dxe:ASPxTextBox runat="server" Width="90px"  ID="txtmomin" onkeypress="return noNumbers(event)">
                                                  <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                 
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                  <dxe:ASPxTextBox runat="server" Width="90px"  ID="txtmomax" onkeypress="return noNumbers(event)">
                                                  <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                              
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                  <dxe:ASPxTextBox runat="server" Width="90px"  ID="txtmoflat" onkeypress="return noNumbers(event)">
                                                  <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                   <dxe:ASPxComboBox runat="server" width="93px" ID="ddlmoadd" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                               <Items>
                                                                           <dxe:ListEditItem Text="Yes" Value="Yes">
                                                                           </dxe:ListEditItem>
                                                                           <dxe:ListEditItem Text="No" Value="No">
                                                                           </dxe:ListEditItem>
                                                                       
                                                                        </Items>
                                                                       
                                                     </dxe:ASPxComboBox>
                                                  </td>
                                       
                                                  </tr>
                                                  
                                                   <tr style="background-color:#FFFBF4;">
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                      <dxe:ASPxLabel ID="ASPxLabel45" runat="server" Text="Holdback Outwards:" ></dxe:ASPxLabel>
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                  <dxe:ASPxTextBox runat="server" Width="90px" ID="txthorate" onkeypress="return noNumbers(event)">
                                                  <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                             
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                  <dxe:ASPxTextBox runat="server" Width="90px"  ID="txthomin" onkeypress="return noNumbers(event)">
                                                  <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                                        </td>
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                  <dxe:ASPxTextBox runat="server" Width="90px"  ID="txthomax" onkeypress="return noNumbers(event)">
                                                  <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                                 
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                  <dxe:ASPxTextBox runat="server" Width="90px" ID="txthoflat" onkeypress="return noNumbers(event)">
                                                  <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                                 
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                   <dxe:ASPxComboBox runat="server" width="93px" ID="ddlhoadd" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                               <Items>
                                                                           <dxe:ListEditItem Text="Yes" Value="Yes">
                                                                           </dxe:ListEditItem>
                                                                           <dxe:ListEditItem Text="No" Value="No">
                                                                           </dxe:ListEditItem>
                                                                       
                                                                        </Items>
                                                                       
                                                     </dxe:ASPxComboBox>
                                                  </td>
                                       
                                                  </tr>
                                                      
                                                  <tr style="background-color:#FFFBF4;">
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                      <dxe:ASPxLabel ID="ASPxLabel4" runat="server" Text="Inter Settlement Transfers:" ></dxe:ASPxLabel>
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                  <dxe:ASPxTextBox runat="server" Width="90px" ID="txtISrate" onkeypress="return noNumbers(event)">
                                                  <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                             
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                  <dxe:ASPxTextBox runat="server" Width="90px"  ID="txtISmin" onkeypress="return noNumbers(event)">
                                                  <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                                        </td>
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                  <dxe:ASPxTextBox runat="server" Width="90px"  ID="txtISmax" onkeypress="return noNumbers(event)">
                                                  <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                                 
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                  <dxe:ASPxTextBox runat="server" Width="90px" ID="txtISflat" onkeypress="return noNumbers(event)">
                                                  <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                    <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                  </dxe:ASPxTextBox>
                                                 
                                                  </td>
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                   <dxe:ASPxComboBox runat="server" width="93px" ID="ddlISadd" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                               <Items>
                                                                           <dxe:ListEditItem Text="Yes" Value="Yes">
                                                                           </dxe:ListEditItem>
                                                                           <dxe:ListEditItem Text="No" Value="No">
                                                                           </dxe:ListEditItem>
                                                                       
                                                                        </Items>
                                                                       
                                                     </dxe:ASPxComboBox>
                                                  </td>
                                       
                                                  </tr>   
                                                      
                        <%--New work for MarginPledge Charges --%>                                                      
                                                      
                                                   <tr style="background-color:#FFFBF4;">
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                     <dxe:ASPxLabel ID="ASPxLabe201" runat="server" Text="MarginPledge To TM:" ></dxe:ASPxLabel>
                                                  </td>
                                                  
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                      <dxe:ASPxTextBox runat="server" Width="90px" ID="txtPLTMrate" onkeypress="return noNumbers(event)">
                                                      <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                      <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                      </dxe:ASPxTextBox>
                                                  </td>
                                             
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                      <dxe:ASPxTextBox runat="server" Width="90px"  ID="txtPLTMmin" onkeypress="return noNumbers(event)">
                                                      <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                       <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                      </dxe:ASPxTextBox>
                                                  </td>
                                                  
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                      <dxe:ASPxTextBox runat="server" Width="90px"  ID="txtPLTMmax" onkeypress="return noNumbers(event)">
                                                      <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                      <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                      </dxe:ASPxTextBox>
                                                   </td>

                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                      <dxe:ASPxTextBox runat="server" Width="90px" ID="txtPLTMflat" onkeypress="return noNumbers(event)">
                                                      <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                      <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                      </dxe:ASPxTextBox>
                                                  </td>
 
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                   <dxe:ASPxComboBox runat="server" width="93px" ID="ddlPLTMadd" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                               <Items>
                                                                   <dxe:ListEditItem Text="Yes" Value="Yes">
                                                                   </dxe:ListEditItem>
                                                                   <dxe:ListEditItem Text="No" Value="No">
                                                                   </dxe:ListEditItem>
                                                                </Items>
                                                                       
                                                     </dxe:ASPxComboBox>
                                                  </td>
                                                  </tr>

                                                   <tr style="background-color:#FFFBF4;">
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                     <dxe:ASPxLabel ID="ASPxLabe202" runat="server" Text="RePledge To CM:" ></dxe:ASPxLabel>
                                                  </td>
                                                  
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                      <dxe:ASPxTextBox runat="server" Width="90px" ID="txtRPCMrate" onkeypress="return noNumbers(event)">
                                                      <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                      <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                      </dxe:ASPxTextBox>
                                                  </td>
                                             
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                      <dxe:ASPxTextBox runat="server" Width="90px"  ID="txtRPCMmin" onkeypress="return noNumbers(event)">
                                                      <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                       <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                      </dxe:ASPxTextBox>
                                                  </td>
                                                  
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                      <dxe:ASPxTextBox runat="server" Width="90px"  ID="txtRPCMmax" onkeypress="return noNumbers(event)">
                                                      <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                      <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                      </dxe:ASPxTextBox>
                                                   </td>

                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                      <dxe:ASPxTextBox runat="server" Width="90px" ID="txtRPCMflat" onkeypress="return noNumbers(event)">
                                                      <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                      <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                      </dxe:ASPxTextBox>
                                                  </td>
 
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                   <dxe:ASPxComboBox runat="server" width="93px" ID="ddlRPCMadd" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                               <Items>
                                                                   <dxe:ListEditItem Text="Yes" Value="Yes">
                                                                   </dxe:ListEditItem>
                                                                   <dxe:ListEditItem Text="No" Value="No">
                                                                   </dxe:ListEditItem>
                                                                </Items>
                                                                       
                                                     </dxe:ASPxComboBox>
                                                  </td>
                                                  </tr>

                                                   <tr style="background-color:#FFFBF4;">
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                     <dxe:ASPxLabel ID="ASPxLabe203" runat="server" Text="RePledge To CC:" ></dxe:ASPxLabel>
                                                  </td>
                                                  
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                      <dxe:ASPxTextBox runat="server" Width="90px" ID="txtRPCCrate" onkeypress="return noNumbers(event)">
                                                      <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                      <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                      </dxe:ASPxTextBox>
                                                  </td>
                                             
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                      <dxe:ASPxTextBox runat="server" Width="90px"  ID="txtRPCCmin" onkeypress="return noNumbers(event)">
                                                      <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                       <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                      </dxe:ASPxTextBox>
                                                  </td>
                                                  
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                      <dxe:ASPxTextBox runat="server" Width="90px"  ID="txtRPCCmax" onkeypress="return noNumbers(event)">
                                                      <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                      <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                      </dxe:ASPxTextBox>
                                                   </td>

                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                      <dxe:ASPxTextBox runat="server" Width="90px" ID="txtRPCCflat" onkeypress="return noNumbers(event)">
                                                      <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                      <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                      </dxe:ASPxTextBox>
                                                  </td>
 
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                   <dxe:ASPxComboBox runat="server" width="93px" ID="ddlRPCCadd" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                               <Items>
                                                                   <dxe:ListEditItem Text="Yes" Value="Yes">
                                                                   </dxe:ListEditItem>
                                                                   <dxe:ListEditItem Text="No" Value="No">
                                                                   </dxe:ListEditItem>
                                                                </Items>
                                                                       
                                                     </dxe:ASPxComboBox>
                                                  </td>
                                                  </tr>
                                                   <tr style="background-color:#FFFBF4;">
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                     <dxe:ASPxLabel ID="ASPxLabe204" runat="server" Text="MarginPledge Invocation:" ></dxe:ASPxLabel>
                                                  </td>
                                                  
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                      <dxe:ASPxTextBox runat="server" Width="90px" ID="txtPLINVrate" onkeypress="return noNumbers(event)">
                                                      <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                      <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                      </dxe:ASPxTextBox>
                                                  </td>
                                             
                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                      <dxe:ASPxTextBox runat="server" Width="90px"  ID="txtPLINVmin" onkeypress="return noNumbers(event)">
                                                      <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                       <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                      </dxe:ASPxTextBox>
                                                  </td>
                                                  
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                      <dxe:ASPxTextBox runat="server" Width="90px"  ID="txtPLINVmax" onkeypress="return noNumbers(event)">
                                                      <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                      <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                      </dxe:ASPxTextBox>
                                                   </td>

                                                  <td class="Ecoheadtxt" style="text-align:left">
                                                      <dxe:ASPxTextBox runat="server" Width="90px" ID="txtPLINVflat" onkeypress="return noNumbers(event)">
                                                      <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                                      <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                                      </dxe:ASPxTextBox>
                                                  </td>
 
                                                  <td class="Ecoheadtxt" style="text-align:left;">
                                                   <dxe:ASPxComboBox runat="server" width="93px" ID="ddlPLINVadd" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                               <Items>
                                                                   <dxe:ListEditItem Text="Yes" Value="Yes">
                                                                   </dxe:ListEditItem>
                                                                   <dxe:ListEditItem Text="No" Value="No">
                                                                   </dxe:ListEditItem>
                                                                </Items>
                                                                       
                                                     </dxe:ASPxComboBox>
                                                  </td>
                                                  </tr>

                <%--New work for MarginPledge Ends --%>                                              
                                    
                                                    
                                                <%-- Payins End --%>
                                                
                                               
                                                
                                                           <%-- for account--%>
                                            <tr id="accfor" runat="server" style="display:none">
                                              <td  class="Ecoheadtxt" style="text-align:left">
                                              <dxe:ASPxLabel ID="ASPxLabel78" runat="server" Text="Account For:" Width="93px"></dxe:ASPxLabel>
                                              </td>
                                            <td colspan="5"></td>
                                            </tr>
                                            
                                            <tr id="trtranclient" runat="server" style="display:none">
                                               <td class="Ecoheadtxt"  style="text-align:left">
                                                    <dxe:ASPxLabel ID="ASPxLabel19" runat="server" Text="Demat Charges:" ></dxe:ASPxLabel>
                                                </td>
                                                <td class="Ecoheadtxt" style="text-align:left;">
                                             
                                                     <dxe:ASPxComboBox runat="server" EnableSynchronization="False"  EnableIncrementalFiltering="True" ValueType="System.String" DataSourceID="AccessDataSourceaccount" TextField="MainAccount_Name" ValueField="MainAccount_AccountCode" ID="ddldematmain">
                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) { OnAccountDematChanged(s); }"></ClientSideEvents>
                                                    </dxe:ASPxComboBox>
                                                </td>
                                                <td colspan="4" class="Ecoheadtxt" style="text-align:left;display:none" id="tdrsubacc" runat="server">
                                                   <dxe:ASPxComboBox runat="server" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True" ValueType="System.String" DataSourceID="AccessDataSourceSubAcc" TextField="SubAccount_Name" ValueField="SubAccount_Code" ClientInstanceName="ddldematsub" ID="ddldematsub" OnCallback="ddldematsub_Callback"></dxe:ASPxComboBox>
                                                </td>
                                            
                                            </tr>
                                            
                                                                                    
                                             <tr id="trtrancharge" runat="server" style="display:none">
                                               <td class="Ecoheadtxt" style="text-align:left">
                                                    <dxe:ASPxLabel ID="ASPxLabel422" runat="server" Text="ServTax:" ></dxe:ASPxLabel>
                                                </td>
                                                <td class="Ecoheadtxt" style="text-align:left;">
                                             
                                                    <dxe:ASPxComboBox runat="server" EnableSynchronization="False" EnableIncrementalFiltering="True" ValueType="System.String" DataSourceID="AccessDataSourceaccount" TextField="MainAccount_Name" ValueField="MainAccount_AccountCode" ID="ddlservtaxmain">
                                                        <ClientSideEvents SelectedIndexChanged="function(s, e) { OnAccountTranChanged(s); }"></ClientSideEvents>
                                                        </dxe:ASPxComboBox>
                                                </td>
                                                <td colspan="4" class="Ecoheadtxt" style="text-align:left;display:none" id="tdservtax" runat="server">
                                                <dxe:ASPxComboBox runat="server" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True" ValueType="System.String" DataSourceID="AccessDataSourceSubAcc" TextField="SubAccount_Name" ValueField="SubAccount_Code" ClientInstanceName="ddlservtaxsub" ID="ddlservtaxsub" OnCallback="ddlservtaxsub_Callback"></dxe:ASPxComboBox>
                                                </td>
                                            
                                            </tr>
                                            
                                               <%--end account--%>
                                               
                                               <tr>
                                                <td colspan="6" class="Ecoheadtxt">
                                                     <asp:Button id="btnSave" runat="server" CssClass="btnUpdate" Text="Save" OnClick="btnSave_Click"/>
                                                    </td>
                                               </tr>
                                            
                                        </table>
                                    </td>
                                </tr>
                               
                              
                            </table>
          
                    </td>
                </tr>
     
            </table>
    
    </div>
    
        
         <%-- BeginRegion DataSources --%> 
           <asp:SqlDataSource ID="AccessDataSourceCompany" runat="server"  ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
    
        SelectCommand="SELECT cmp_internalid,cmp_Name FROM [tbl_master_company] where cmp_internalId in(select distinct exch_compid from tbl_master_CompanyExchange)"></asp:SqlDataSource> 
         <asp:SqlDataSource ID="AccessDataSourcesegment" runat="server"  ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"  
          SelectCommand="select A.EXCH_INTERNALID AS exch_internalId ,isnull((TME.EXH_ShortName + '-' + A.EXCH_SEGMENTID),exch_membershipType) AS segment_name from (SELECT TMCE.* FROM TBL_MASTER_COMPANYEXCHANGE AS TMCE WHERE  TMCE.EXCH_COMPID=@CompId ) AS A LEFT OUTER JOIN   TBL_MASTER_EXCHANGE AS TME ON TME.EXH_CNTID=A.EXCH_EXCHID">
        <SelectParameters>
            <asp:SessionParameter Name="CompId" SessionField="LastCompany" Type="string" />
        </SelectParameters></asp:SqlDataSource>
        
         <asp:SqlDataSource ID="AccessDataSourceaccount" runat="server"  ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
    
        SelectCommand="SELECT MainAccount_Name,MainAccount_AccountCode FROM [Master_MainAccount]"></asp:SqlDataSource> 
        
        <asp:SqlDataSource ID="AccessDataSourceSubAcc" runat="server"  ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"  
          SelectCommand="SELECT SubAccount_Name,SubAccount_Code FROM [Master_SubAccount] WHERE SubAccount_MainAcReferenceID
IN (SELECT MainAccount_AccountCode FROM [Master_MainAccount] WHERE (MainAccount_SubLedgerType='Custom')
and (MainAccount_AccountCode=@RfId))
 ">
        <SelectParameters>
            <asp:Parameter Name="RfId"  Type="String"/>
        </SelectParameters></asp:SqlDataSource>
    </form>
</body>
</html>
