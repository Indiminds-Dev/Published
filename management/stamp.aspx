<%@ page language="C#" autoeventwireup="true" inherits="management_stamp, App_Web_cvaj-tqf" %>

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

    <script language="javascript" type="text/javascript"><!--
// <!CDATA[

//function is called on changing country
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
  function SignOff()
  {
        window.parent.SignOff();
  }

 function display()
{
  document.getElementById("tdlevelsegment").style.display = "inline";
  document.getElementById("tdsegment").style.display = "inline";
}
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
   function CallAjax(obj1,obj2,obj3)
    {
        FieldName='ctl00_ContentPlaceHolder1_Headermain1_cmbSegment';
        ajax_showOptions(obj1,obj2,obj3);
    }
function ALERT()
{
  alert('This Date Already Exist for this combination.\n Date Should be Greater than Or Less Than From Previous Date');

}

function OnBasisChanged(ddlcalbasis)
{
     var text=ddlcalbasis.GetText().toString();
   if(text.match("Market Turnover")&& segmentName.match("FO"))
   {
    document.getElementById("tr9").style.display = "none";
    document.getElementById("tr8").style.display = "none";
    document.getElementById("tab2").style.display = "inline";
     document.getElementById("tab1").style.display = "inline";
     document.getElementById("tab3").style.display = "inline";
     document.getElementById("tab4").style.display = "inline";
     document.getElementById("tab5").style.display = "inline";
     document.getElementById("tab6").style.display = "inline";
     document.getElementById("tab7").style.display = "inline";
     document.getElementById("tab8").style.display = "inline";
      document.getElementById("tab9").style.display = "inline";
      document.getElementById("tr_contract").style.display = "none";

    
      
//  
//     document.getElementById("tr1").style.display = "inline";
//     document.getElementById("tr2").style.display = "inline";
//     document.getElementById("tr3").style.display = "inline";
//     document.getElementById("tr4").style.display = "inline";
//     document.getElementById("tr5").style.display = "inline";
//     document.getElementById("tr8").style.display = "none";


  }

     
    else if(text.match("Contract")&& segmentName.match("FO"))
    {
     document.getElementById("tr8").style.display = "inline";
    document.getElementById("tab2").style.display = "none";
     document.getElementById("tab1").style.display = "none";
     document.getElementById("tab3").style.display = "none";
     document.getElementById("tab4").style.display = "none";
     document.getElementById("tab5").style.display = "none";
     document.getElementById("tab6").style.display = "none";
     document.getElementById("tab7").style.display = "none";
     document.getElementById("tab8").style.display = "none";
      document.getElementById("tab9").style.display = "none";
       document.getElementById("tr9").style.display = "inline";
       document.getElementById("tr_contract").style.display = "inline";

      
    }  
    else if(text.match("Market")&& segmentName.match("-CM"))
    {
      document.getElementById("tr1").style.display = "inline";
     document.getElementById("tr2").style.display = "inline";
     document.getElementById("tr3").style.display = "inline";
     document.getElementById("tr4").style.display = "inline";
     document.getElementById("tr5").style.display = "inline";
     document.getElementById("tab1").style.display = "none";
     document.getElementById("tab3").style.display = "none";
     document.getElementById("tab4").style.display = "none";
     document.getElementById("tab5").style.display = "none";
     document.getElementById("tab6").style.display = "none";
     document.getElementById("tab7").style.display = "none";
     document.getElementById("tab8").style.display = "none";
     document.getElementById("tab9").style.display = "none";
     document.getElementById("tab2").style.display = "none";
     document.getElementById("tr8").style.display = "none";
      document.getElementById("tr9").style.display = "none";
      document.getElementById("tr_contract").style.display = "none";

    
    }
    else if(text.match("Market Turnover")&& segmentName.match("CDX"))
    {
    document.getElementById("tr9").style.display = "none";
    document.getElementById("tr8").style.display = "none";
    document.getElementById("tab2").style.display = "inline";
     document.getElementById("tab1").style.display = "inline";
     document.getElementById("tab3").style.display = "inline";
     document.getElementById("tab4").style.display = "inline";
     document.getElementById("tab5").style.display = "inline";
     document.getElementById("tab6").style.display = "inline";
     document.getElementById("tab7").style.display = "inline";
     document.getElementById("tab8").style.display = "inline";
      document.getElementById("tab9").style.display = "inline";
      document.getElementById("tr_contract").style.display = "none";
    }
   else if(text.match("Contract")&& segmentName.match("CDX"))
   {
    document.getElementById("tr8").style.display = "inline";
    document.getElementById("tab2").style.display = "none";
     document.getElementById("tab1").style.display = "none";
     document.getElementById("tab3").style.display = "none";
     document.getElementById("tab4").style.display = "none";
     document.getElementById("tab5").style.display = "none";
     document.getElementById("tab6").style.display = "none";
     document.getElementById("tab7").style.display = "none";
     document.getElementById("tab8").style.display = "none";
      document.getElementById("tab9").style.display = "none";
       document.getElementById("tr9").style.display = "inline";
       document.getElementById("tr_contract").style.display = "inline";
   }
    else if(text.match("Market Turnover")&& segmentName.match("COMM"))
    {
    document.getElementById("tr9").style.display = "none";
    document.getElementById("tr8").style.display = "none";
    document.getElementById("tab2").style.display = "inline";
     document.getElementById("tab1").style.display = "inline";
     document.getElementById("tab3").style.display = "inline";
     document.getElementById("tab4").style.display = "inline";
     document.getElementById("tab5").style.display = "inline";
     document.getElementById("tab6").style.display = "inline";
     document.getElementById("tab7").style.display = "inline";
     document.getElementById("tab8").style.display = "inline";
      document.getElementById("tab9").style.display = "inline";
      document.getElementById("tr_contract").style.display = "none";
    }
   else if(text.match("Contract")&& segmentName.match("COMM"))
   {
    document.getElementById("tr8").style.display = "inline";
    document.getElementById("tab2").style.display = "none";
     document.getElementById("tab1").style.display = "none";
     document.getElementById("tab3").style.display = "none";
     document.getElementById("tab4").style.display = "none";
     document.getElementById("tab5").style.display = "none";
     document.getElementById("tab6").style.display = "none";
     document.getElementById("tab7").style.display = "none";
     document.getElementById("tab8").style.display = "none";
      document.getElementById("tab9").style.display = "none";
       document.getElementById("tr9").style.display = "inline";
       document.getElementById("tr_contract").style.display = "inline";
   }
   

    else   
   {
     document.getElementById("tr1").style.display = "none";
     document.getElementById("tr2").style.display = "none";
     document.getElementById("tr3").style.display = "none";
     document.getElementById("tr4").style.display = "none";
     document.getElementById("tr5").style.display = "none";
     document.getElementById("tr8").style.display = "inline";
     document.getElementById("tr9").style.display = "inline";

// By Subhas
//     document.getElementById("trn1").style.display = "inline";
//     document.getElementById("trn2").style.display = "inline";

 }

 ForCM_SegmentNewChange(text);

}
// By Subhas-----------------------

function ForCM_SegmentNewChange(text1) {


   

    
    if (text1.match("Contract") && segmentName.match("-CM")) {
        document.getElementById("trn1").style.display = "inline";
        document.getElementById("trn2").style.display = "inline";
       

        document.getElementById("asplb19").innerHTML = "Delivery Slab";
        document.getElementById("asplb20").innerHTML = "Amt.Per Delivery Slab";
        document.getElementById("asplb21").innerHTML = "Min Delivery Duty";
        document.getElementById("asplb22").innerHTML = "Max Delivery Duty";
        
    }
    else {

        document.getElementById("trn1").style.display = "none";
        document.getElementById("trn2").style.display = "none";

        document.getElementById("asplb19").innerHTML = "Multiple Slab";
        document.getElementById("asplb20").innerHTML = "Amt.Per Slab";
        document.getElementById("asplb21").innerHTML = "Min Amount";
        document.getElementById("asplb22").innerHTML = "Max Amount";

        
    
    }

}


function ForCM_SegmentDisplayOrNo(text1,vsegment) {

//    alert(text1);
//    alert(vsegment);

    if (text1.match("Contract") && vsegment.match("-CM")) {
        document.getElementById("trn1").style.display = "inline";
        document.getElementById("trn2").style.display = "inline";


        document.getElementById("asplb19").innerHTML = "Delivery Slab";
        document.getElementById("asplb20").innerHTML = "Amt.Per Delivery Slab";
        document.getElementById("asplb21").innerHTML = "Min Delivery Duty";
        document.getElementById("asplb22").innerHTML = "Max Delivery Duty";

    }
    else {

        document.getElementById("trn1").style.display = "none";
        document.getElementById("trn2").style.display = "none";

        document.getElementById("asplb19").innerHTML = "Multiple Slab";
        document.getElementById("asplb20").innerHTML = "Amt.Per Slab";
        document.getElementById("asplb21").innerHTML = "Min Amount";
        document.getElementById("asplb22").innerHTML = "Max Amount";



    }

}



//---------------------------------------------------

function OnSegmentChanged(ddlsegment,text1)
{
   segmentName=ddlsegment;
  if(ddlsegment.match("-FO")&& text1.match("Market Turnover"))
   {
     document.getElementById("tab2").style.display = "inline";
     document.getElementById("tab1").style.display = "inline";
     document.getElementById("tab3").style.display = "inline";
     document.getElementById("tab4").style.display = "inline";
     document.getElementById("tab5").style.display = "inline";
     document.getElementById("tab6").style.display = "inline";
     document.getElementById("tab7").style.display = "inline";
     document.getElementById("tab8").style.display = "inline";
     document.getElementById("tab9").style.display = "inline";
     document.getElementById("tr1").style.display = "none";
     document.getElementById("tr2").style.display = "none";
     document.getElementById("tr3").style.display = "none";
     document.getElementById("tr4").style.display = "none";
     document.getElementById("tr5").style.display = "none";
     document.getElementById("tr8").style.display = "none";
      document.getElementById("tr9").style.display = "none";
      document.getElementById("tr_contract").style.display = "none";
     }
    else if(text1.match("Market")&& ddlsegment.match("-CM"))
    {
      document.getElementById("tr1").style.display = "inline";
     document.getElementById("tr2").style.display = "inline";
     document.getElementById("tr3").style.display = "inline";
     document.getElementById("tr4").style.display = "inline";
     document.getElementById("tr5").style.display = "inline";
     document.getElementById("tab1").style.display = "none";
     document.getElementById("tab3").style.display = "none";
     document.getElementById("tab4").style.display = "none";
     document.getElementById("tab5").style.display = "none";
     document.getElementById("tab6").style.display = "none";
     document.getElementById("tab7").style.display = "none";
     document.getElementById("tab8").style.display = "none";
     document.getElementById("tab9").style.display = "none";
     document.getElementById("tab2").style.display = "none";
     document.getElementById("tr8").style.display = "none";
     document.getElementById("tr9").style.display = "none";

     none
    }
    else if(ddlsegment.match("-CDX")&& text1.match("Market Turnover"))
   {
     document.getElementById("tab2").style.display = "inline";
     document.getElementById("tab1").style.display = "inline";
     document.getElementById("tab3").style.display = "inline";
     document.getElementById("tab4").style.display = "inline";
     document.getElementById("tab5").style.display = "inline";
     document.getElementById("tab6").style.display = "inline";
     document.getElementById("tab7").style.display = "inline";
     document.getElementById("tab8").style.display = "inline";
     document.getElementById("tab9").style.display = "inline";
     document.getElementById("tr1").style.display = "none";
     document.getElementById("tr2").style.display = "none";
     document.getElementById("tr3").style.display = "none";
     document.getElementById("tr4").style.display = "none";
     document.getElementById("tr5").style.display = "none";
     document.getElementById("tr8").style.display = "none";
      document.getElementById("tr9").style.display = "none";
      document.getElementById("tr_contract").style.display = "none";
     }
    else if(ddlsegment.match("-COMM")&& text1.match("Market Turnover"))
   {
     document.getElementById("tab2").style.display = "inline";
     document.getElementById("tab1").style.display = "inline";
     document.getElementById("tab3").style.display = "inline";
     document.getElementById("tab4").style.display = "inline";
     document.getElementById("tab5").style.display = "inline";
     document.getElementById("tab6").style.display = "inline";
     document.getElementById("tab7").style.display = "inline";
     document.getElementById("tab8").style.display = "inline";
     document.getElementById("tab9").style.display = "inline";
     document.getElementById("tr1").style.display = "none";
     document.getElementById("tr2").style.display = "none";
     document.getElementById("tr3").style.display = "none";
     document.getElementById("tr4").style.display = "none";
     document.getElementById("tr5").style.display = "none";
     document.getElementById("tr8").style.display = "none";
      document.getElementById("tr9").style.display = "none";
      document.getElementById("tr_contract").style.display = "none";
     }
   else 
    {
    if(ddlsegment.match("-CDX") || ddlsegment.match("-FO") || ddlsegment.match("-COMM"))
    {
     document.getElementById("tab2").style.display = "none";
     document.getElementById("tab1").style.display = "none";
     document.getElementById("tab3").style.display = "none";
     document.getElementById("tab4").style.display = "none";
     document.getElementById("tab5").style.display = "none";
     document.getElementById("tab6").style.display = "none";
     document.getElementById("tab7").style.display = "none";
     document.getElementById("tab8").style.display = "none";
     document.getElementById("tab9").style.display = "none";
     document.getElementById("tr_contract").style.display = "inline";
     }
     else
     {
      document.getElementById("tab2").style.display = "none";
     document.getElementById("tab1").style.display = "none";
     document.getElementById("tab3").style.display = "none";
     document.getElementById("tab4").style.display = "none";
     document.getElementById("tab5").style.display = "none";
     document.getElementById("tab6").style.display = "none";
     document.getElementById("tab7").style.display = "none";
     document.getElementById("tab8").style.display = "none";
     document.getElementById("tab9").style.display = "none";
     
     }
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
   document.getElementById("accfor").style.display = "none";
   }
   else if(text!="None" && text1=="No")
   {
   document.getElementById("trtrancharge").style.display = "none";
   document.getElementById("accfor").style.display = "inline";
   document.getElementById("trtranclient").style.display = "inline";
 
   }
   else if(text!="None" && text1=="Yes")
   {
   document.getElementById("trtrancharge").style.display = "inline";
   document.getElementById("accfor").style.display = "inline";
   document.getElementById("trtranclient").style.display = "inline";
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
     document.getElementById("tab2").style.display = "inline";
     document.getElementById("tab1").style.display = "inline";
     document.getElementById("tab3").style.display = "inline";
     document.getElementById("tab4").style.display = "inline";
     document.getElementById("tab5").style.display = "inline";
     document.getElementById("tab6").style.display = "inline";
     document.getElementById("tab7").style.display = "inline";
     document.getElementById("tab8").style.display = "inline";
     document.getElementById("tab9").style.display = "inline";
      document.getElementById("tr1").style.display = "none";
     document.getElementById("tr2").style.display = "none";
     document.getElementById("tr3").style.display = "none";
     document.getElementById("tr4").style.display = "none";
     document.getElementById("tr5").style.display = "none";
     
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
  
  function displaycallbasis()
  {
     document.getElementById("tr1").style.display = "inline";
     document.getElementById("tr2").style.display = "inline";
     document.getElementById("tr3").style.display = "inline";
     document.getElementById("tr4").style.display = "inline";
     document.getElementById("tr5").style.display = "inline";
   //  document.getElementById("tr6").style.display = "inline";
   //  document.getElementById("tr7").style.display = "inline";
     document.getElementById("tr8").style.display = "none";
     document.getElementById("tr9").style.display = "none";


    
  }
  
  function displaynotcallbasis()
  {
    document.getElementById("tr1").style.display = "none";
     document.getElementById("tr2").style.display = "none";
     document.getElementById("tr3").style.display = "none";
     document.getElementById("tr4").style.display = "none";
     document.getElementById("tr5").style.display = "none";
    // document.getElementById("tr6").style.display = "none";
    // document.getElementById("tr7").style.display = "none";
     document.getElementById("tr8").style.display = "inline";
     document.getElementById("tr9").style.display = "inline";


  
  }
    function CallAjax(obj1,obj2,obj3)
    {
     ajax_showOptions(obj1,obj2,obj3);
    }
 FieldName='btnSave';
//--></script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
        <div>
            <table class="TableMain100">
                <tr>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%">
                            <tr>
                                <td>
                                    <table class="TableMain100">
                                        <tr>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="lbl6" runat="server" Width="70px" Text="Group:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <asp:TextBox ID="txtGroup" runat="server" Width="160px" Font-Size="11px"></asp:TextBox><asp:TextBox
                                                    ID="txtGroup_hidden" runat="server" Width="14px" Style="display: none"></asp:TextBox></td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="ASPxLabel1" Width="80px" runat="server" Text="Company:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxComboBox runat="server" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                    ValueType="System.String" DataSourceID="AccessDataSourceCompany" TextField="cmp_Name"
                                                    ValueField="cmp_internalid" ID="ddlcmpname">
                                                </dxe:ASPxComboBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left" id="tdlevelsegment" runat="server">
                                                <dxe:ASPxLabel ID="ASPxLabel5" runat="server" Text="Segment:" Width="100px">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 100%;" id="tdsegment" runat="server">
                                                <dxe:ASPxComboBox runat="server" DropDownStyle="DropDown" Width="100px" EnableSynchronization="False"
                                                    EnableIncrementalFiltering="True" ValueType="System.String" DataSourceID="AccessDataSourceSegment"
                                                    TextField="segment_name" ValueField="exch_internalId" ClientInstanceName="ddlsegment"
                                                    ID="ddlsegment">
                                                </dxe:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="ASPxLabel28" runat="server" Text="Applicable State:" Width="100px">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxComboBox runat="server" Width="100px" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                    ValueType="System.String" DataSourceID="AccessDataSourceState" TextField="State_Name"
                                                    ValueField="State_ID" ID="ddlstate" OnDataBound="ddlstate_DataBound">
                                                </dxe:ASPxComboBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="ASPxLabel29" runat="server" Text="Cal Basis:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxComboBox runat="server" Width="100px" ID="ddlcalbasis" DropDownStyle="DropDown"
                                                    EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) { OnBasisChanged(s); }"></ClientSideEvents>
                                                    <Items>
                                                        <dxe:ListEditItem Text="Market Turnover" Value="Market Turnover"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Contract Value" Value="Contract Value"></dxe:ListEditItem>
                                                    </Items>
                                                </dxe:ASPxComboBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="ASPxLabel2" runat="server" Text="Date:" Width="100px">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 100%;">
                                                <dxe:ASPxDateEdit runat="server" UseMaskBehavior="True" DateOnError="Today" Width="120px"
                                                    EditFormat="Custom" ID="Dateedit">
                                                    <ButtonStyle Width="13px">
                                                    </ButtonStyle>
                                                </dxe:ASPxDateEdit>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="ASPxLabel47" runat="server" Text="ServTax/GST Applicable:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxComboBox runat="server" Width="100px" ID="ddltaxapp" DropDownStyle="DropDown"
                                                    EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) { OnTaxChanged(s); }"></ClientSideEvents>
                                                    <Items>
                                                        <dxe:ListEditItem Text="No" Value="No"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Yes" Value="Yes"></dxe:ListEditItem>
                                                    </Items>
                                                </dxe:ASPxComboBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="ASPxLabel48" runat="server" Text="Charge To:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxComboBox runat="server" Width="100px" ID="ddlcharge" DropDownStyle="DropDown"
                                                    EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) { OnChargeChanged(s); }"></ClientSideEvents>
                                                    <Items>
                                                        <dxe:ListEditItem Text="All" Value="All"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="None" Value="None"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Selected" Value="Selected"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="All But Selected" Value="All But Selected"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Not Applicable" Value="NA"></dxe:ListEditItem>
                                                    </Items>
                                                </dxe:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr id="tr_contract" runat="server" style="display: none"><td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="lblmod1" runat="server" Text="Opt Trades Basis:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxComboBox runat="server" Width="90px" ID="ddlbasismod1" DropDownStyle="DropDown"
                                                    EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                    <Items>
                                                        <dxe:ListEditItem Text="Premium" Value="Premium"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Strike" Value="Strike"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Premium And Strike" Value="Premium And Strike"></dxe:ListEditItem>
                                                    </Items>
                                                </dxe:ASPxComboBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="lblmod2" runat="server" Text="Final Sett: Basis:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 100%;">
                                                <dxe:ASPxComboBox runat="server" Width="90px" ID="ddlfinalbasismod1" DropDownStyle="DropDown"
                                                    EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                    <Items>
                                                        <dxe:ListEditItem Text="Strike" Value="Strike"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Spot" Value="Spot"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Difference" Value="Difference"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Not Applicable" Value="Not Applicable"></dxe:ListEditItem>
                                                    </Items>
                                                </dxe:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <%--cal bais section--%>
                                        <tr id="tr1" runat="server" style="background-color: #FFE7C1;">
                                            <td colspan="3" class="Ecoheadtxt" style="text-align: center;">
                                                <dxe:ASPxLabel ID="asplbl60" runat="server" Text="Rate For Delivery:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td colspan="3" class="Ecoheadtxt" style="text-align: center;">
                                                <dxe:ASPxLabel ID="asplbl61" runat="server" Width="50%" Text="Rate For Square-Off:">
                                                </dxe:ASPxLabel>
                                            </td>
                                        </tr>
                                        <tr id="tr5" runat="server" style="background-color: #FFF3DF;">
                                            <td colspan="2" class="Ecoheadtxt" style="text-align: center;">
                                                <dxe:ASPxLabel ID="lblc" runat="server" Text="Client:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: center;">
                                                <dxe:ASPxLabel ID="lblp" runat="server" Text="Pro:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: center;">
                                                <dxe:ASPxLabel ID="lblc1" runat="server" Text="Client:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: center;" colspan="2">
                                                <dxe:ASPxLabel ID="lblp1" runat="server" Text="Pro:">
                                                </dxe:ASPxLabel>
                                            </td>
                                        </tr>
                                        <tr id="tr2" runat="server" style="background-color: #FFFBF4;">
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="ASPxLabel30" runat="server" Text="Rate:" Width="93px">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxTextBox runat="server" Width="90px" ID="txtceldel">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxTextBox runat="server" Width="90px" ID="txtprodel" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: center">
                                                <dxe:ASPxTextBox runat="server" Width="90px" ID="txtrateclsqr" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: center" colspan="2">
                                                <dxe:ASPxTextBox runat="server" Width="90px" ID="txtprosqr" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr id="tr3" runat="server" style="background-color: #FFFBF4;">
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="ASPxLabel3" runat="server" Text="Min:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxTextBox runat="server" Width="90px" ID="txtmincldel" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99999g>.<00..99>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxTextBox runat="server" Width="90px" ID="txtminprodel" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99999g>.<00..99>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: center;">
                                                <dxe:ASPxTextBox runat="server" Width="90px" ID="txtminclsqr" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99999g>.<00..99>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: center" colspan="2">
                                                <dxe:ASPxTextBox runat="server" Width="90px" ID="txtminprosqr" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99999g>.<00..99>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr id="tr4" runat="server" style="background-color: #FFFBF4;">
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="ASPxLabel4" runat="server" Text="Max:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxTextBox runat="server" Width="90px" ID="txtmaxcldel">
                                                    <MaskSettings Mask="<0..99999g>.<00..99>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxTextBox runat="server" Width="90px" ID="txtmaxprodel" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99999g>.<00..99>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: center;">
                                                <dxe:ASPxTextBox runat="server" Width="90px" ID="txtmaxclsqr">
                                                    <MaskSettings Mask="<0..99999g>.<00..99>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: center;" colspan="2">
                                                <dxe:ASPxTextBox runat="server" Width="90px" ID="txtmaxprosqr" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99999g>.<00..99>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        
                                        <tr id="tr8" runat="server" style="display: none">
                                            <td class="Ecoheadtxt" style="width: 222px; text-align: left;">
                                                <dxe:ASPxLabel ID="asplb19" runat="server" Text="Multiple Slab:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxTextBox runat="server" Width="95px" ID="txtmslab" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..999999999g>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="asplbl20" runat="server" Text="Amt.Per Slab:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxTextBox runat="server" Width="95px" ID="txtamtslab" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..9999g>.<00..99>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr id="tr9" runat="server" style="display: none">
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="asplbl21" runat="server" Text="Min Amount:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxTextBox runat="server" Width="95px" ID="txtmincntr" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..9999g>.<00..99>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="asplbl22" runat="server" Text="Max Amount:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxTextBox runat="server" Width="95px" ID="txtmaxcntr" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99999g>.<00..99>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        
                                      <%--  //-------------------------- For New CM Requirement Start -----------------------------------------%>
                                        
                                          <tr id="trn1" runat="server" style="display: none">
                                            <td class="Ecoheadtxt" style="width: 222px; text-align: left;">
                                                <dxe:ASPxLabel ID="LblSqrOffSlab" runat="server" Text="Square-Off Slab:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxTextBox runat="server" Width="95px" ID="TxtSqrOffSlab" onkeypress="return noNumbers(event)">
                                                   <%-- <MaskSettings Mask="<0..999999999g>" />--%>
                                                   <MaskSettings Mask="<0..9999g>.<00..99>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="LblAmtPerSqrOffSlab" runat="server" Text="Amt.Per SqrOff Slab:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxTextBox runat="server" Width="95px" ID="TxtAmtPerSqrOffSlab" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..9999g>.<00..99>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr id="trn2" runat="server" style="display: none">
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="LblMinSqrOffDuty" runat="server" Text="Min SqrOff Duty:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxTextBox runat="server" Width="95px" ID="TxtMinSqrOffDuty" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..9999g>.<00..99>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="LblMaxSqrOffDuty" runat="server" Text="Max SqrOff Duty:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxTextBox runat="server" Width="95px" ID="TxtMaxSqrOffDuty" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99999g>.<00..99>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        
                                        
                                        
                                       <%-- //------------------------------ For New CM Requirement End ---------------------------------------------------%>
                                        
                                        
                                        <%-- cal basis end --%>
                                        <%-- For FO--%>
                                        <tr id="tab1" style="display: none; background-color: #FFE7C1;" runat="server">
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="asplbl23" runat="server" Text="For Client:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="asplbl90" runat="server" Text="Future Trades:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <%--      <td class="Ecoheadtxt"></td>--%>
                                            <td class="Ecoheadtxt" style="text-align: center;" colspan="2">
                                                <dxe:ASPxLabel ID="asplbl31" runat="server" Text="Option Trades:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <%--    <td class="Ecoheadtxt"></td>--%>
                                            <td class="Ecoheadtxt" style="text-align: center;" colspan="2">
                                                <dxe:ASPxLabel ID="asplbl39" runat="server" Text="F&O Final Sett:">
                                                </dxe:ASPxLabel>
                                            </td>
                                        </tr>
                                        <tr id="tab9" style="display: none; background-color: #FFFBF4;" runat="server">
                                            <td class="Ecoheadtxt">
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="asplbl53" runat="server" Text="Basis:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <%-- <asp:DropDownList runat="server" Width="90px" ID="ddlbasis" ><asp:ListItem Value="Premium">Premium</asp:ListItem>
                                                                        <asp:ListItem Value="Strike">Strike</asp:ListItem>
                                                                        <asp:ListItem Value="Premium And Strike">Premium And Strike</asp:ListItem>
                                                      </asp:DropDownList>--%>
                                                <dxe:ASPxComboBox runat="server" Width="90px" ID="ddlbasis" DropDownStyle="DropDown"
                                                    EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                    <Items>
                                                        <dxe:ListEditItem Text="Premium" Value="Premium"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Strike" Value="Strike"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Premium And Strike" Value="Premium And Strike"></dxe:ListEditItem>
                                                    </Items>
                                                </dxe:ASPxComboBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="asplbl54" runat="server" Text="Basis:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 100%;">
                                                <%--    <asp:DropDownList runat="server" Width="90px" ID="ddlfinalbasis"><asp:ListItem Value="Strike">Strike</asp:ListItem>
                                                        <asp:ListItem Value="Spot">Spot</asp:ListItem>
                                                        <asp:ListItem Value="Difference">Difference</asp:ListItem>
                                                        </asp:DropDownList>--%>
                                                <dxe:ASPxComboBox runat="server" Width="90px" ID="ddlfinalbasis" DropDownStyle="DropDown"
                                                    EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                    <Items>
                                                        <dxe:ListEditItem Text="Strike" Value="Strike"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Spot" Value="Spot"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Difference" Value="Difference"></dxe:ListEditItem>
                                                    </Items>
                                                </dxe:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr id="tab2" style="display: none; background-color: #FFFBF4;" runat="server">
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="asplbl25" runat="server" Text="Rate:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxTextBox runat="server" Width="90px" ID="txtratecfuture" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="asplbl37" runat="server" Text="Rate:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxTextBox runat="server" Width="90px" ID="txtratecoption" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="asplbl41" runat="server" Text="Rate:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 100%;">
                                                <dxe:ASPxTextBox runat="server" Width="90px" ID="txtratecfo" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr id="tab3" style="display: none; background-color: #FFFBF4" runat="server">
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="asplbl27" runat="server" Text="Min.Duty:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxTextBox runat="server" Width="90px" ID="txtmincfuture" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99999g>.<00..99>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="asplbl33" runat="server" Text="Min.Duty:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxTextBox runat="server" Width="90px" ID="txtmincoption" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99999g>.<00..99>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="asplbl43" runat="server" Text="Min.Duty:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 100%;">
                                                <dxe:ASPxTextBox runat="server" Width="90px" ID="txtmincfo" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99999g>.<00..99>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr id="tab4" style="display: none; background-color: #FFFBF4;" runat="server">
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="asplbl29" runat="server" Text="Max.Duty:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxTextBox runat="server" Width="90px" ID="txtmaxcfuture" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99999g>.<00..99>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="asplbl35" runat="server" Text="Max.Duty:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxTextBox runat="server" Width="90px" ID="txtmaxcoption" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99999g>.<00..99>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="asplbl45" runat="server" Text="Max.Duty:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 100%;">
                                                <dxe:ASPxTextBox runat="server" Width="90px" ID="txtmaxcfo" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99999g>.<00..99>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr id="tab5" style="display: none; background-color: #FFE7C1;" runat="server">
                                            <td colspan="6" class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="asplbl24" runat="server" Text="For Pro :">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <%--   <td colspan="2" class="Ecoheadtxt" style="text-align:left;">
                                                           <dxe:ASPxLabel ID="asplbl32" runat="server" Text="For Pro Option Trades:" ></dxe:ASPxLabel>
                                                     </td>
                                              
                                                     
                                                       <td colspan="2" class="Ecoheadtxt" style="text-align:left;">
                                                           <dxe:ASPxLabel ID="asplbl40" runat="server" Text="For Pro F&O Final Sett:" ></dxe:ASPxLabel>
                                                     </td>--%>
                                        </tr>
                                        <tr id="tab6" style="display: none; background-color: #FFFBF4;" runat="server">
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="asplbl26" runat="server" Text="Rate:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxTextBox runat="server" Width="90px" ID="txtratepfuture" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="asplbl38" runat="server" Text="Rate:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxTextBox runat="server" Width="90px" ID="txtratepoption" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="asplbl42" runat="server" Text="Rate:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 100%;">
                                                <dxe:ASPxTextBox runat="server" Width="90px" ID="txtratepfo" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99g>.<00..999999>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr id="tab7" style="display: none; background-color: #FFFBF4;" runat="server">
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="asplbl28" runat="server" Text="Min.Duty:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxTextBox runat="server" Width="90px" ID="txtminpfuture" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99999g>.<00..99>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="asplbl34" runat="server" Text="Min.Duty:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxTextBox runat="server" Width="90px" ID="txtminpoption" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99999g>.<00..99>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="asplbl44" runat="server" Text="Min.Duty:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 100%;">
                                                <dxe:ASPxTextBox runat="server" Width="90px" ID="txtminpfo" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99999g>.<00..99>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr id="tab8" style="display: none; background-color: #FFFBF4;" runat="server">
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="asplbl30" runat="server" Text="Max.Duty:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxTextBox runat="server" Width="90px" ID="txtmaxpfuture" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99999g>.<00..99>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="asplbl36" runat="server" Text="Max.Duty:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxTextBox runat="server" Width="90px" ID="txtmaxpoption" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99999g>.<00..99>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="asplbl46" runat="server" Text="Max.Duty:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 100%;">
                                                <dxe:ASPxTextBox runat="server" Width="90px" ID="txtmaxpfo" onkeypress="return noNumbers(event)">
                                                    <MaskSettings Mask="<0..99999g>.<00..99>" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <%-- End FO--%>
                                        <%-- for account--%>
                                        <tr id="accfor" runat="server" style="display:none">
                                            <td colspan="6" class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="ASPxLabel78" runat="server" Text="Account For:" Width="93px">
                                                </dxe:ASPxLabel>
                                            </td>
                                        </tr>
                                        <tr id="trtranclient" runat="server" style="display:none">
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="ASPxLabel19" runat="server" Text="Client:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;" colspan="2">
                                                <dxe:ASPxComboBox runat="server" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                    ValueType="System.String" DataSourceID="AccessDataSourceaccount" TextField="MainAccount_Name"
                                                    ValueField="MainAccount_AccountCode" ID="ddltransclientmain">
                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) { OnAccountClientChanged(s); }">
                                                    </ClientSideEvents>
                                                </dxe:ASPxComboBox>
                                            </td>
                                            <td colspan="4" class="Ecoheadtxt" style="text-align: left; display: none" id="tdrsubacc"
                                                runat="server">
                                                <dxe:ASPxComboBox runat="server" DropDownStyle="DropDown" EnableSynchronization="False"
                                                    EnableIncrementalFiltering="True" ValueType="System.String" DataSourceID="AccessDataSourceSubAcc"
                                                    TextField="SubAccount_Name" ValueField="SubAccount_Code" ClientInstanceName="ddltransclientsub"
                                                    ID="ddltransclientsub" OnCallback="ddltransclientsub_Callback">
                                                </dxe:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr id="trtrancharge" runat="server" style="display:none">
                                            <td class="Ecoheadtxt" style="text-align: left;">
                                                <dxe:ASPxLabel ID="ASPxLabel422" runat="server" Text="ServTax:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left;" colspan="2">
                                                <dxe:ASPxComboBox runat="server" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                    ValueType="System.String" DataSourceID="AccessDataSourceaccount" TextField="MainAccount_Name"
                                                    ValueField="MainAccount_AccountCode" ID="ddltranchargemain">
                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) { OnAccountTranChanged(s); }">
                                                    </ClientSideEvents>
                                                </dxe:ASPxComboBox>
                                            </td>
                                            <td colspan="4" class="Ecoheadtxt" style="text-align: left; display: none" id="tdservtax"
                                                runat="server">
                                                <dxe:ASPxComboBox runat="server" DropDownStyle="DropDown" EnableSynchronization="False"
                                                    EnableIncrementalFiltering="True" ValueType="System.String" DataSourceID="AccessDataSourceSubAcc"
                                                    TextField="SubAccount_Name" ValueField="SubAccount_Code" ClientInstanceName="ddltranchargesub"
                                                    ID="ddltranchargesub" OnCallback="ddltranchargesub_Callback">
                                                </dxe:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Ecoheadtxt" colspan="8">
                                                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="btnUpdate" />
                                            </td>
                                        </tr>
                                        <tr>
                                        </tr>
                                        <%--end account--%>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <%-- BeginRegion DataSources --%>
        <asp:SqlDataSource ID="AccessDataSourceCompany" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="SELECT cmp_internalid,cmp_Name FROM [tbl_master_company] where cmp_internalId in(select distinct exch_compid from tbl_master_CompanyExchange)">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="AccessDataSourceState" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="SELECT id as State_ID,state as State_Name FROM [tbl_master_state]">
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
IN (SELECT MainAccount_AccountCode FROM [Master_MainAccount] WHERE (MainAccount_SubLedgerType='Custom')
and (MainAccount_AccountCode=@RfId))
 ">
            <SelectParameters>
                <asp:Parameter Name="RfId" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <%-- EndRegion --%>
    </form>
</body>
</html>
