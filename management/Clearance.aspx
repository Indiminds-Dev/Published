<%@ page language="C#" autoeventwireup="true" inherits="management_Clearance, App_Web_d1rqvttb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
    <%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
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
	.textlabel{
	    font-family: Tahoma,Arial, Verdana, sans-serif;
	color: Blue;
	font-size: 11px;
	
	}
	
	</style>
    <style type="text/css">
       a:hover {background:#ffffff; text-decoration:none;} /*BG color is a must for IE6*/
       a.tooltip span {display:none; padding:2px 3px; font-size:smaller; margin-left:1px; width:100px;}
       a.tooltip:hover span{display:inline; position:horizontal; background:#ffffff; border:1px solid #cccccc; color:#6c6c6c; width:100px}
    
    </style>

    <script language="javascript" type="text/javascript">
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
    function winclose()
    {
      parent.editwin.close();
    }
    function SignOff()
    {
        window.parent.SignOff();
    }
    <!--
// <!CDATA[
//function is called on changing country
function OnAccountClientChanged(ddltransclientmain)
{
    CallServer('AccRel' + '~' + ddltransclientmain.GetValue().toString(), ""); 
    ddltransclientsub.PerformCallback(ddltransclientmain.GetValue().toString());
   
}
function OnAccountExchangeChanged(ddltransexchangemain)
{
  CallServer('AccUnRel' + '~' + ddltransexchangemain.GetValue().toString(), ""); 
  ddltransexchangesub.PerformCallback(ddltransexchangemain.GetValue().toString());
}

function OnAccountTranChanged(ddltranchargemain)
{
  CallServer('Trancharge' + '~' + ddltranchargemain.GetValue().toString(), ""); 
  ddltranchargesub.PerformCallback(ddltranchargemain.GetValue().toString());
}
function OnSegmentChanged(ddlsegment1)
{
   if(ddlsegment1.match("-FO")||ddlsegment1.match("-CD")||ddlsegment1.match("-COMM"))
   {
       
         document.getElementById("tab1").style.display = "inline";
         document.getElementById("trrate").style.display = "none";
   }
   else
   {
       
        document.getElementById("tab1").style.display = "none";
        document.getElementById("trrate").style.display = "inline";
   }
   
}
function OnChargeChanged(ddlcharge)
{
   var text=ddlcharge.GetText().toString();
   var text1=ddltaxapp.GetText().toString();
   if(text=="None")
   {
   document.getElementById("trtrancharge").style.display = "none";
   document.getElementById("trtranclient").style.display = "none";
   document.getElementById("trtranexchange").style.display = "none";
   document.getElementById("accfor").style.display = "none";
   }
   else if(text!="None" && text1=="No")
   {
   document.getElementById("trtrancharge").style.display = "inline";
   document.getElementById("accfor").style.display = "inline";
   document.getElementById("trtranclient").style.display = "inline";
   document.getElementById("trtranexchange").style.display = "inline";
   document.getElementById("trtrancharge").style.display = "none";
   }
   else if(text!="None" && text1=="Yes")
   {
      document.getElementById("trtrancharge").style.display = "inline";
   document.getElementById("accfor").style.display = "inline";
   document.getElementById("trtranclient").style.display = "inline";
   document.getElementById("trtranexchange").style.display = "inline";
   document.getElementById("trtrancharge").style.display = "inline";
   }
}
function displaynotaccount()
{
   document.getElementById("trtrancharge").style.display = "none";
   document.getElementById("accfor").style.display = "none";
   document.getElementById("trtranclient").style.display = "none";
   document.getElementById("trtranexchange").style.display = "none";

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
   document.getElementById("tdservtax").style.display = "none";
}
function displaynotcharge()
{
   document.getElementById("tdservtax").style.display = "inline";
}
function displayaccount()
{
   document.getElementById("trtrancharge").style.display = "inline";
   document.getElementById("accfor").style.display = "inline";
   document.getElementById("trtranclient").style.display = "inline";
   document.getElementById("trtranexchange").style.display = "inline";

}
function displayaccount1()
{
   document.getElementById("trtrancharge").style.display = "none";
   document.getElementById("accfor").style.display = "inline";
   document.getElementById("trtranclient").style.display = "inline";
   document.getElementById("trtranexchange").style.display = "inline";

}
function displaytax()
{
   document.getElementById("trtrancharge").style.display = "inline";

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
    document.getElementById("trtrancharge").style.display = "inline";
 }
 
// function aa()
//{
// 
//  if(document.getElementById("tdsegment").style.display == "none")
//  {
//    alert("This Company has no Segment,So Operation will not Proceed");
//  }
//    else
//    {
//        
//    }
//      

//}

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
    
    function display()
{
  document.getElementById("tdlevelsegment").style.display = "inline";
  document.getElementById("tdsegment").style.display = "inline";
}
    function displaybasis()
    {
    
     document.getElementById("tab1").style.display = "inline";
       
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
  
     function CallAjax(obj1,obj2,obj3)
    {
        FieldName='ctl00_ContentPlaceHolder1_Headermain1_cmbSegment';
        ajax_showOptions(obj1,obj2,obj3);
    }


//--></script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
    <div>
            <table class="TableMainB">
                <tr>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <%--     <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" ClientInstanceName="page"
                             
                            >
                            <tabpages>
                    <dxtc:TabPage Text="General" Name="General"><ContentCollection>
                        <dxw:ContentControl runat="server">--%>
                        <table width="100%">
                            <tr>
                                <td>
                                    <table style="width: 100px; z-index: 101">
                                        <tr>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxLabel ID="lbl6" runat="server" Width="80px" Text="Group:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; padding: 3px;">
                                                <asp:TextBox ID="txtGroup" runat="server" Font-Size="11px" Width="145px"></asp:TextBox><asp:TextBox
                                                    ID="txtGroup_hidden" runat="server" Width="14px" Style="display: none"></asp:TextBox></td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxLabel ID="ASPxLabel1" runat="server" Text="Company:" Width="100px">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxComboBox runat="server" EnableSynchronization="False" Width="150px" EnableIncrementalFiltering="True"
                                                    ValueType="System.String" DataSourceID="AccessDataSourceCompany" TextField="cmp_Name"
                                                    ValueField="cmp_internalid" ID="ddlcmpname">
                                                </dxe:ASPxComboBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left" id="tdlevelsegment" runat="server">
                                                <dxe:ASPxLabel ID="ASPxLabel5" runat="server" Text="Segment:" Width="120px">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;" id="tdsegment" runat="server">
                                                <dxe:ASPxComboBox runat="server" Width="100px" DropDownStyle="DropDown" EnableSynchronization="False"
                                                    EnableIncrementalFiltering="True" ValueType="System.String" DataSourceID="AccessDataSourceSegment"
                                                    TextField="segment_name" ValueField="exch_internalId" ClientInstanceName="ddlsegment"
                                                    ID="ddlsegment">
                                                </dxe:ASPxComboBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxLabel ID="ASPxLabel2" runat="server" Text="Date:" Width="70px">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxDateEdit runat="server" UseMaskBehavior="True" EditFormat="Custom" Width="120px"
                                                    ID="Dateedit">
                                                    <buttonstyle width="13px">
                                                    </buttonstyle>
                                                </dxe:ASPxDateEdit>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Ecoheadtxt" style="text-align: left; height: 37px;">
                                                <dxe:ASPxLabel ID="ASPxLabel28" runat="server" Text="IPC Rate:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; height: 37px;">
                                                <dxe:ASPxTextBox runat="server" Width="100px" ID="txtipcrate" onkeypress="return noNumbers(event)">
                                                    <masksettings mask="<0..99g>.<00..999999>" />
                                                    <validationsettings errordisplaymode="None">
                                                    </validationsettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; height: 37px;">
                                                <dxe:ASPxLabel ID="ASPxLabel29" runat="server" Text="ServTax/GST Applicable:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; height: 37px;">
                                                <dxe:ASPxComboBox runat="server" Width="100px" ID="ddltaxapp" DropDownStyle="DropDown"
                                                    EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                    <clientsideevents selectedindexchanged="function(s, e) { OnTaxChanged(s); }"></clientsideevents>
                                                    <items>
                                                        <dxe:ListEditItem Text="No" Value="No"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Yes" Value="Yes"></dxe:ListEditItem>
                                                    </items>
                                                </dxe:ASPxComboBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; height: 37px;">
                                                <dxe:ASPxLabel ID="ASPxLabel30" runat="server" Text="Charge To:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; height: 37px;">
                                                <dxe:ASPxComboBox runat="server" Width="100px" ID="ddlcharge" DropDownStyle="DropDown"
                                                    EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                    <clientsideevents selectedindexchanged="function(s, e) { OnChargeChanged(s); }"></clientsideevents>
                                                    <items>
                                                        <dxe:ListEditItem Text="All" Value="All"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="None" Value="None"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Selected" Value="Selected"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="All But Selected" Value="All But Selected"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Not Applicable" Value="NA"></dxe:ListEditItem>
                                                    </items>
                                                </dxe:ASPxComboBox>
                                            </td>
                                            <td style="height: 37px">
                                            </td>
                                            <td style="height: 37px">
                                            </td>
                                        </tr>
                                        <%--for rate--%>
                                        <tr runat="server" id="trrate" style="display: none">
                                            <td class="Ecoheadtxt" style="text-align: left;" colspan="2">
                                                <dxe:ASPxLabel ID="ASPxLabel3" runat="server" Text="Rate(For Active Orders):" >
                                                </dxe:ASPxLabel>
                                                
                                       </td>
                                            <td  style="text-align: left;" >
                                                <dxe:ASPxTextBox runat="server" Width="100px" ID="txtrate1" onkeypress="return noNumbers(event)">
                                                    <masksettings mask="<0..99g>.<00..999999>" />
                                                    <validationsettings errordisplaymode="None">
                                                    </validationsettings>
                                                </dxe:ASPxTextBox></td>
                                              <td class="Ecoheadtxt" style="text-align: left" colspan="2">
                                              <dxe:ASPxLabel ID="ASPxlblratepassive" runat="server" Text="Rate(For Passive Orders):" >
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td>
                                             <dxe:ASPxTextBox runat="server" Width="100px" ID="ASPxtxtratepassive" onkeypress="return noNumbers(event)">
                                                    <masksettings mask="<0..99g>.<00..999999>" />
                                                    <validationsettings errordisplaymode="None">
                                                    </validationsettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            
                                            <td class="Ecoheadtxt" style="text-align: left;display:none;">
                                             <dxe:ASPxLabel ID="ASPxLabel4" runat="server" Text="For Trades Before:">
                                                </dxe:ASPxLabel>
                                                <dxe:ASPxTextBox runat="server" Width="100px" ID="txttime">
                                                    <masksettings mask="<0..99g>.<00..999999>" />
                                                    <validationsettings errordisplaymode="None">
                                                    </validationsettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                           
                                            <td class="Ecoheadtxt" style="text-align: left;display:none;">
                                             <dxe:ASPxLabel ID="ASPxLabel10" runat="server" Text="Else:">
                                                </dxe:ASPxLabel>
                                                <dxe:ASPxTextBox runat="server" Width="100px" ID="txtrate2" onkeypress="return noNumbers(event)">
                                                    <masksettings mask="<0..99g>.<00..999999>" />
                                                    <validationsettings errordisplaymode="None">
                                                    </validationsettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                          
                                        </tr>
                                        <%--  end rate--%>
                                        <%-- basis and final basis--%>
                                        <tr runat="server"  style="display: none">
                                            <td colspan="2" class="Ecoheadtxt" style="text-align: left">
                                               
                                            </td>
                                            <td colspan="6" class="Ecoheadtxt" style="text-align: left">
                                               
                                            </td>
                                        </tr>
                                        
                                       
                                       
                                       
                                        <%-- basis and final basis end --%>
                                        <%-- for account--%>
                                        <tr id="tab1" style="display: none">
                                            <td colspan="8">
                                                <table style="border-top:solid 1px Gray; border-left:solid 1px Gray; border-right:solid 1px Gray; border-bottom:solid 1px Gray" width="100%">
                                                    <tr >
                                                        <td style="width:310px;text-align: left; color:Blue; border-right:solid 1px Gray;border-bottom:solid 1px Gray">
                                                            <dxe:ASPxLabel ID="ASPxLabel89" Font-Size="12px" Font-Bold="true" runat="server" Text="Rate For Futures:">
                                                </dxe:ASPxLabel>
                                                        </td>
                                                        <td  style="text-align: left; color:Blue;width:305px; border-right:solid 1px Gray;border-bottom:solid 1px Gray">
                                                            
 <dxe:ASPxLabel ID="ASPxLabel49" runat="server" Font-Size="12px" Font-Bold="true" Text="Rates For Option:">
                                                </dxe:ASPxLabel>
                                                        </td>
                                                        <td>
                                                        
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border-right:solid 1px Gray">
                                                            <table width="100%">
                                                                <tr>
                                                                                                                                                                                 <td align="center" colspan="4">
                                                                             <dxe:ASPxLabel ID="ASPxLabel38" runat="server" ForeColor="blue" Text="All Futures:">
                                                </dxe:ASPxLabel>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="textlabel">
                                                                        Active
                                                                    </td>
                                                                     <td >
                                                                        <dxe:ASPxTextBox runat="server"  ID="txtfuturerate" Width="67px" onkeypress="return noNumbers(event)">
                                                    <masksettings mask="<0..99g>.<00..999999>" />
                                                    <validationsettings errordisplaymode="None">
                                                    </validationsettings>
                                                </dxe:ASPxTextBox>
                                                                    </td>
                                                                     <td class="textlabel" >
                                                                        Passive
                                                                    </td>
                                                                     <td>
                                                                        <dxe:ASPxTextBox runat="server"  ID="txtfutureratePO" Width="67px" onkeypress="return noNumbers(event)">
                                                    <masksettings mask="<0..99g>.<00..999999>" />
                                                    <validationsettings errordisplaymode="None">
                                                    </validationsettings>
                                                </dxe:ASPxTextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                                                                                                                                 <td style="border-top:solid 1px Gray" align="center" colspan="4">
                                                                         <dxe:ASPxLabel ID="ASPxLabel20" runat="server" ForeColor="blue" Text="Index Future:">
                                                </dxe:ASPxLabel>                          
                                                                                                   
                                                                     </td>
                                                                 </tr>
                                                                 <tr>
                                                                    <td class="textlabel">
                                                                        Active
                                                                    </td>
                                                                     <td>
                                                                        <dxe:ASPxTextBox runat="server" Width="67px" ID="txtindexfuturerate"
                                                    onkeypress="return noNumbers(event)">
                                                    <masksettings mask="<0..99g>.<00..999999>" />
                                                    <validationsettings errordisplaymode="None">
                                                    </validationsettings>
                                                </dxe:ASPxTextBox>
                                                                    </td>
                                                                     <td class="textlabel" >
                                                                        Passive
                                                                    </td>
                                                                     <td>
                                                                        <dxe:ASPxTextBox runat="server" Width="67px" ID="txtindexfutureratePO"
                                                    onkeypress="return noNumbers(event)">
                                                    <masksettings mask="<0..99g>.<00..999999>" />
                                                    <validationsettings errordisplaymode="None">
                                                    </validationsettings>
                                                </dxe:ASPxTextBox>
                                                                    </td>
                                                                </tr>
                                                                 <tr>
                                                                                                                                                                                 <td style="border-top:solid 1px Gray" align="center" colspan="4">
                                                                           <dxe:ASPxLabel ID="ASPxLabel6" runat="server" ForeColor="blue" Text="Stock Future:">
                                                </dxe:ASPxLabel>                         
                                                                                                   
                                                                     </td>
                                                                 </tr>
                                                                 <tr>
                                                                    <td class="textlabel">
                                                                        Active
                                                                    </td>
                                                                     <td>
                                                                         <dxe:ASPxTextBox runat="server" Width="67px" ID="txtstockfuture" onkeypress="return noNumbers(event)">
                                                    <masksettings mask="<0..99g>.<00..999999>" />
                                                    <validationsettings errordisplaymode="None">
                                                    </validationsettings>
                                                </dxe:ASPxTextBox>
                                                                    </td>
                                                                     <td class="textlabel" >
                                                                        Passive
                                                                    </td>
                                                                     <td>
                                                                        <dxe:ASPxTextBox runat="server" Width="67px"  ID="txtstockfuturePO" onkeypress="return noNumbers(event)">
                                                    <masksettings mask="<0..99g>.<00..999999>" />
                                                    <validationsettings errordisplaymode="None">
                                                    </validationsettings>
                                                </dxe:ASPxTextBox>
                                                                    </td>
                                                                </tr>
                                                                 <tr>
                                                                                                                                                                                 <td style="border-top:solid 1px Gray" align="center" colspan="4">
                                                                           <dxe:ASPxLabel ID="ASPxLabel25" runat="server" ForeColor="blue" Text="Future Expiry:">
                                                </dxe:ASPxLabel>                         
                                                                                                   
                                                                     </td>
                                                                 </tr>
                                                                 <tr>
                                                                    <td class="textlabel">
                                                                        Active
                                                                    </td>
                                                                     <td>
                                                                         <dxe:ASPxTextBox runat="server" Width="67px" ID="txtratefutureexpiry"
                                                    onkeypress="return noNumbers(event)">
                                                    <masksettings mask="<0..99g>.<00..999999>" />
                                                    <validationsettings errordisplaymode="None">
                                                    </validationsettings>
                                                </dxe:ASPxTextBox>
                                                                    </td>
                                                                     <td class="textlabel" >
                                                                        Passive
                                                                    </td>
                                                                     <td>
                                                                        <dxe:ASPxTextBox runat="server" Width="67px" ID="txtratefutureexpiryPO"
                                                    onkeypress="return noNumbers(event)">
                                                    <masksettings mask="<0..99g>.<00..999999>" />
                                                    <validationsettings errordisplaymode="None">
                                                    </validationsettings>
                                                </dxe:ASPxTextBox>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td style="border-right:solid 1px Gray" valign="top">
                                                            <table width="100%">
                                                                <tr>
                                                                                                                                                                   <td align="right" style="padding-right:10px" colspan="2">
                                                                            <dxe:ASPxLabel ID="ASPxLabel21" runat="server" ForeColor="blue" Text="Basis:">   
                                                </dxe:ASPxLabel>  
                                                                    </td>
                                                                    <td  colspan="2">
                                                                         <%-- <asp:DropDownList runat="server" Width="100px" ID="ddlbasis">
                                                    <asp:ListItem Value="Premium">Premium</asp:ListItem>
                                                    <asp:ListItem Value="Strike">Strike</asp:ListItem>
                                                    <asp:ListItem Value="Premium And Strike">Premium And Strike</asp:ListItem>
                                                </asp:DropDownList>   --%>
                                                
                                                <dxe:ASPxComboBox ClientInstanceName="ddlbasis" runat="server" ID="ddlbasis"
                                                                        Width="150px" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                                        <Items>
                                                                            <dxe:ListEditItem Text="Premium" Value="Premium"></dxe:ListEditItem>
                                                                            <dxe:ListEditItem Text="Strike" Value="Strike"></dxe:ListEditItem>
                                                                            <dxe:ListEditItem Text="Premium And Strike" Value="Premium And Strike"></dxe:ListEditItem>
                                                                            
                                                                        </Items>
                                                                    </dxe:ASPxComboBox>
                                                                    </td>
                                                                
                                                                </tr>
                                                                <tr>
                                                                                                                                                     <td style="border-top:solid 1px Gray" align="center" colspan="4">
                                                                          
<dxe:ASPxLabel ID="ASPxLabel22" ForeColor="blue" runat="server" Text="All Options:">
                                                </dxe:ASPxLabel>   
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                        <td class="textlabel" >
                                                                        Active
                                                                    </td>
                                                                     <td>
                                                                       
 <dxe:ASPxTextBox runat="server" Width="67px"  ID="txtallrateoption"
                                                    onkeypress="return noNumbers(event)">
                                                    <masksettings mask="<0..99g>.<00..999999>" />
                                                    <validationsettings errordisplaymode="None">
                                                    </validationsettings>
                                                </dxe:ASPxTextBox>
                                                                    </td>
                                                                     <td class="textlabel" >
                                                                        Passive
                                                                    </td>
                                                                     <td>
                                                                         <dxe:ASPxTextBox runat="server" Width="67px" ID="txtallrateoptionPO"
                                                    onkeypress="return noNumbers(event)">
                                                    <masksettings mask="<0..99g>.<00..999999>" />
                                                    <validationsettings errordisplaymode="None">
                                                    </validationsettings>
                                                </dxe:ASPxTextBox>
                                                                    </td>
                                                                </tr>
                                                                
                                                                <tr>
                                                                     <td style="border-top:solid 1px Gray" align="center" colspan="4">
                                                                       
<dxe:ASPxLabel ID="ASPxLabel24" ForeColor="blue" runat="server" Text="Index Option:">
                                                </dxe:ASPxLabel>      
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                     <td class="textlabel" >
                                                                        Active
                                                                    </td>
                                                                     <td>
                                                                       
<dxe:ASPxTextBox runat="server" Width="67px" ID="txtallindexrateoption"
                                                    onkeypress="return noNumbers(event)">
                                                    <masksettings mask="<0..99g>.<00..999999>" />
                                                    <validationsettings errordisplaymode="None">
                                                    </validationsettings>
                                                </dxe:ASPxTextBox>
                                                                    </td>
                                                                     <td class="textlabel" >
                                                                        Passive
                                                                    </td>
                                                                     <td>
                                                                        <dxe:ASPxTextBox runat="server" Width="67px" ID="txtallindexrateoptionPO"
                                                    onkeypress="return noNumbers(event)">
                                                    <masksettings mask="<0..99g>.<00..999999>" />
                                                    <validationsettings errordisplaymode="None">
                                                    </validationsettings>
                                                </dxe:ASPxTextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                     <td style="border-top:solid 1px Gray" align="center" colspan="4">
                                                                       
 <dxe:ASPxLabel ID="ASPxLabel23" ForeColor="blue" runat="server" Text="Stock Option:">
                                                </dxe:ASPxLabel>      
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="textlabel" >
                                                                        Active
                                                                    </td>
                                                                     <td>
                                                                       

 <dxe:ASPxTextBox runat="server" Width="67px" ID="txtratestockoption"
                                                    onkeypress="return noNumbers(event)">
                                                    <masksettings mask="<0..99g>.<00..999999>" />
                                                    <validationsettings errordisplaymode="None">
                                                    </validationsettings>
                                                </dxe:ASPxTextBox>

                                                                    </td>
                                                                     <td class="textlabel" >
                                                                        Passive
                                                                    </td>
                                                                     <td>
                                                                         <dxe:ASPxTextBox runat="server" Width="67px" ID="txtratestockoptionPO"
                                                    onkeypress="return noNumbers(event)">
                                                    <masksettings mask="<0..99g>.<00..999999>" />
                                                    <validationsettings errordisplaymode="None">
                                                    </validationsettings>
                                                </dxe:ASPxTextBox>
                                                                    </td>
                                                                </tr>
                                                                
                                                            </table>
                                                        </td>
                                                        <td valign="top">
                                                           <table width="100%">
                                                                <tr>
                                                                    <td align="right" style="padding-right:5px" colspan="2">
                                                                        <dxe:ASPxLabel ID="ASPxLabel26" runat="server" ForeColor="blue" Text="Final Stt.Basis:">
                                                </dxe:ASPxLabel>     
                                                                    </td>
                                                                    <td colspan="2">
                                                                       <%-- <asp:DropDownList runat="server" Width="100px" ID="ddlfinalbasis">
                                                    <asp:ListItem Value="Strike">Strike</asp:ListItem>
                                                    <asp:ListItem Value="Spot">Spot</asp:ListItem>
                                                    <asp:ListItem Value="Difference">Difference</asp:ListItem>
                                                </asp:DropDownList>   --%>
                                                
                                                 <dxe:ASPxComboBox ClientInstanceName="ddlfinalbasis" runat="server" ID="ddlfinalbasis"
                                                                        Width="100px" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                                        <Items>
                                                                            <dxe:ListEditItem Text="Strike" Value="Strike"></dxe:ListEditItem>
                                                                            <dxe:ListEditItem Text="Spot" Value="Spot"></dxe:ListEditItem>
                                                                            <dxe:ListEditItem Text="Difference" Value="Difference"></dxe:ListEditItem>
                                                                            
                                                                        </Items>
                                                                    </dxe:ASPxComboBox>
                                                                    </td>
                                                            
                                                                </tr>
                                                                <tr>
                                                                    <td style="border-top:solid 1px Gray" align="center" colspan="4">
                                                                         
<dxe:ASPxLabel ID="ASPxLabel96" ForeColor="blue" runat="server" Text="All Option:">
                                                </dxe:ASPxLabel>    
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="textlabel" >
                                                                        Active
                                                                    </td>
                                                                     <td>
                                                                       
<dxe:ASPxTextBox runat="server" Width="67px" ID="txtratefinalallstatement"
                                                    onkeypress="return noNumbers(event)">
                                                    <masksettings mask="<0..99g>.<00..999999>" />
                                                    <validationsettings errordisplaymode="None">
                                                    </validationsettings>
                                                </dxe:ASPxTextBox>
                                                                    </td>
                                                                     <td class="textlabel" >
                                                                        Passive
                                                                    </td>
                                                                     <td>
                                                                        <dxe:ASPxTextBox runat="server" Width="67px" ID="txtratefinalallstatementPO"
                                                    onkeypress="return noNumbers(event)">
                                                    <masksettings mask="<0..99g>.<00..999999>" />
                                                    <validationsettings errordisplaymode="None">
                                                    </validationsettings>
                                                </dxe:ASPxTextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                     <td style="border-top:solid 1px Gray" align="center" colspan="4">
                                                                           
 <dxe:ASPxLabel ID="ASPxLabel92" ForeColor="blue" runat="server" Text="Index Option:">
                                                </dxe:ASPxLabel>  
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="textlabel" >
                                                                        Active
                                                                    </td>
                                                                     <td>
                                                                       

<dxe:ASPxTextBox runat="server" Width="67px" ID="txtratefinalindexstatement"
                                                    onkeypress="return noNumbers(event)">
                                                    <masksettings mask="<0..99g>.<00..999999>" />
                                                    <validationsettings errordisplaymode="None">
                                                    </validationsettings>
                                                </dxe:ASPxTextBox>
                                                                    </td>
                                                                     <td class="textlabel" >
                                                                        Passive
                                                                    </td>
                                                                     <td>
                                                                        <dxe:ASPxTextBox runat="server" Width="67px" ID="txtratefinalindexstatementPO"
                                                    onkeypress="return noNumbers(event)">
                                                    <masksettings mask="<0..99g>.<00..999999>" />
                                                    <validationsettings errordisplaymode="None">
                                                    </validationsettings>
                                                </dxe:ASPxTextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                     <td style="border-top:solid 1px Gray" align="center" colspan="4">
                                                                         <dxe:ASPxLabel ID="ASPxLabel94" runat="server" ForeColor="blue" Text="Stock Option:">
                                                </dxe:ASPxLabel>
                                                                             
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="textlabel">
                                                                        Active
                                                                    </td>
                                                                     <td>
                                                                       
<dxe:ASPxTextBox runat="server" Width="67px" ID="txtratefinalstockstatement"
                                                    onkeypress="return noNumbers(event)">
                                                    <masksettings mask="<0..99g>.<00..999999>" />
                                                    <validationsettings errordisplaymode="None">
                                                    </validationsettings>
                                                </dxe:ASPxTextBox>
                                                                    </td>
                                                                     <td class="textlabel" >
                                                                        Passive
                                                                    </td>
                                                                     <td>
                                                                        <dxe:ASPxTextBox runat="server" Width="67px" ID="txtratefinalstockstatementPO"
                                                    onkeypress="return noNumbers(event)">
                                                    <masksettings mask="<0..99g>.<00..999999>" />
                                                    <validationsettings errordisplaymode="None">
                                                    </validationsettings>
                                                </dxe:ASPxTextBox>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="8" align="left">
                                                <asp:Button ID="btnSave" runat="server" Style="cursor: pointer" Text="Save" OnClick="btnSave_Click"
                                                    CssClass="btnUpdate" />
                                            </td>
                                        </tr>
                                        <%--end account--%>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <%--              </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                   
                    
                    
                    </tabpages>
                            <contentstyle>
                        <Border BorderColor="#002D96" BorderStyle="Solid" BorderWidth="1px" />
                    </contentstyle>
                            <loadingpanelstyle imagespacing="6px">
                    </loadingpanelstyle>
                        </dxtc:ASPxPageControl>--%>
                    </td>
                </tr>
            </table>
        </div>
        <%-- BeginRegion DataSources --%>
        <asp:SqlDataSource ID="AccessDataSourceCompany" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="SELECT cmp_internalid,cmp_Name FROM [tbl_master_company] where cmp_internalid in(select exch_compid from tbl_master_companyExchange)">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="AccessDataSourcesegment" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="select A.EXCH_INTERNALID AS exch_internalId ,isnull((TME.EXH_ShortName + '-' + A.EXCH_SEGMENTID),exch_membershipType) AS segment_name from (SELECT TMCE.* FROM TBL_MASTER_COMPANYEXCHANGE AS TMCE WHERE  TMCE.EXCH_COMPID=@CompId ) AS A LEFT OUTER JOIN   TBL_MASTER_EXCHANGE AS TME ON TME.EXH_CNTID=A.EXCH_EXCHID">
            <SelectParameters>
                <asp:SessionParameter Name="CompId" SessionField="LastCompany" Type="string" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="AccessDataSourceaccount" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="SELECT MainAccount_Name,MainAccount_AccountCode FROM [Master_MainAccount]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="AccessDataSourceSubAcc" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="SELECT SubAccount_Name,SubAccount_Code FROM [Master_SubAccount] WHERE SubAccount_MainAcReferenceID
IN (SELECT MainAccount_AccountCode FROM [Master_MainAccount] WHERE (MainAccount_SubLedgerType ='Custom')
and (MainAccount_AccountCode=@RfId))
 ">
            <SelectParameters>
                <asp:Parameter Name="RfId" Type="string" />
            </SelectParameters>
        </asp:SqlDataSource>
        <%-- EndRegion --%>
    
    </form>
</body>
</html>
