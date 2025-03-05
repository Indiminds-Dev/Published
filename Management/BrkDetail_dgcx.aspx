<%@ page language="C#" autoeventwireup="true" inherits="management_BrkDetail_dgcx, App_Web_lgnajdkn" %>

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
<head id="Head1">
    <title></title>
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
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
    FieldName='btnSavet';
    GAjaxQuery=''
      function CallGenericAjax(obj1,obj2,obj3,Query)
      {
        var CombinedQuery=new String(Query);
        ajax_showOptions(obj1,obj2,obj3,replaceChars(CombinedQuery),'Main');
      }
       function replaceChars(entry) {
            out = "+"; // replace this
            add = "--"; // with this
            temp = "" + entry; // temporary holder

            while (temp.indexOf(out)>-1) {
            pos= temp.indexOf(out);
            temp = "" + (temp.substring(0, pos) + add + 
            temp.substring((pos + out.length), temp.length));
            }
            return temp;
            
        }
     void PageLoad()
     {
        
        TD_Exchange.style.display="none";
        TD_ExchangeValue.style.display="none";
        alert('<%= Session["ExchangeSegmentID"] %>');
        if('<%= Session["ExchangeSegmentID"] %>'==18 || '<%= Session["ExchangeSegmentID"] %>'==22 || '<%= Session["ExchangeSegmentID"] %>'==23 || '<%= Session["ExchangeSegmentID"] %>'==25 || '<%= Session["ExchangeSegmentID"] %>'==26 || '<%= Session["ExchangeSegmentID"] %>'==27 || '<%= Session["ExchangeSegmentID"] %>'==29 || '<%= Session["ExchangeSegmentID"] %>'==30 || '<%= Session["ExchangeSegmentID"] %>'==31 || '<%= Session["ExchangeSegmentID"] %>'==32 || '<%= Session["ExchangeSegmentID"] %>'==33 || '<%= Session["ExchangeSegmentID"] %>'==34 || '<%= Session["ExchangeSegmentID"] %>'==35 || '<%= Session["ExchangeSegmentID"] %>'==36 || '<%= Session["ExchangeSegmentID"] %>'==37 || '<%= Session["ExchangeSegmentID"] %>'==38 || '<%= Session["ExchangeSegmentID"] %>'==39 || '<%= Session["ExchangeSegmentID"] %>'==40 || '<%= Session["ExchangeSegmentID"] %>'==41 || '<%= Session["ExchangeSegmentID"] %>'==42 || '<%= Session["ExchangeSegmentID"] %>'==43 || '<%= Session["ExchangeSegmentID"] %>'==44 || '<%= Session["ExchangeSegmentID"] %>'==45 || '<%= Session["ExchangeSegmentID"] %>'==46 || '<%= Session["ExchangeSegmentID"] %>'==47 || '<%= Session["ExchangeSegmentID"] %>'==48 || '<%= Session["ExchangeSegmentID"] %>'==49 || '<%= Session["ExchangeSegmentID"] %>'==52 || '<%= Session["ExchangeSegmentID"] %>'==53 || '<%= Session["ExchangeSegmentID"] %>'==54 || '<%= Session["ExchangeSegmentID"] %>'==55 || '<%= Session["ExchangeSegmentID"] %>'==56)
        {
            TD_Exchange.style.display="inline";
            TD_ExchangeValue.style.display="inline";    
        }
        document.getElementById("Td_Temp").style.display="inline";
     }
     function CallAjax(obj1,obj2,obj3)
    {
       var seg=document.getElementById('hddnSeg').value
       var brokg;
       var seg_brokg;
       if(seg=='NSE-CM')
       {
            seg_brokg='NSE-CMALL'+'-'+'2';
       }
       else
       {
            brokg=ddlbrokeragefor.GetValue();
            seg_brokg=seg+'-'+brokg;
       }
       
       ajax_showOptions(obj1,obj2,obj3,seg_brokg);
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

function OncalculateonChange(ddlcalculateon)
{
    var text=ddlcalculateon.GetText().toString();
    var bb="Market+Strike";
    if(text==bb)
    {
        document.getElementById('ddlpremium').style.visibility = "visible"; 
        ddlpremium.SetValue('3');
        document.getElementById('ddlmaxper').style.visibility = "hidden";
        ddlpremium.SetEnabled(false);
        
    }
    else 
    {
         document.getElementById('ddlpremium').style.visibility = "hidden"; 
         document.getElementById('ddlmaxper').style.visibility = "visible";
    }
   
}
function Page_Load(obj)      
 {      
    //For Multi Exchange Segment (INMX)
        //Exchange Will Be Display Only in Case When Exchange Is (INMX)
        TD_Exchange.style.display="none";
        TD_ExchangeValue.style.display="none";
        if('<%= Session["ExchangeSegmentID"] %>'==18 || '<%= Session["ExchangeSegmentID"] %>'==22 || '<%= Session["ExchangeSegmentID"] %>'==23 || '<%= Session["ExchangeSegmentID"] %>'==25 || '<%= Session["ExchangeSegmentID"] %>'==26 || '<%= Session["ExchangeSegmentID"] %>'==27 || '<%= Session["ExchangeSegmentID"] %>'==29 || '<%= Session["ExchangeSegmentID"] %>'==30 || '<%= Session["ExchangeSegmentID"] %>'==31 || '<%= Session["ExchangeSegmentID"] %>'==32 || '<%= Session["ExchangeSegmentID"] %>'==33 || '<%= Session["ExchangeSegmentID"] %>'==34 || '<%= Session["ExchangeSegmentID"] %>'==35 || '<%= Session["ExchangeSegmentID"] %>'==36 || '<%= Session["ExchangeSegmentID"] %>'==37 || '<%= Session["ExchangeSegmentID"] %>'==38 || '<%= Session["ExchangeSegmentID"] %>'==39 || '<%= Session["ExchangeSegmentID"] %>'==40 || '<%= Session["ExchangeSegmentID"] %>'==41 || '<%= Session["ExchangeSegmentID"] %>'==42 || '<%= Session["ExchangeSegmentID"] %>'==43 || '<%= Session["ExchangeSegmentID"] %>'==44 || '<%= Session["ExchangeSegmentID"] %>'==45 || '<%= Session["ExchangeSegmentID"] %>'==46 || '<%= Session["ExchangeSegmentID"] %>'==47 || '<%= Session["ExchangeSegmentID"] %>'==48 || '<%= Session["ExchangeSegmentID"] %>'==49 || '<%= Session["ExchangeSegmentID"] %>'==52 || '<%= Session["ExchangeSegmentID"] %>'==53 || '<%= Session["ExchangeSegmentID"] %>'==54 || '<%= Session["ExchangeSegmentID"] %>'==55 || '<%= Session["ExchangeSegmentID"] %>'==56)
        {
            TD_Exchange.style.display="inline";
            TD_ExchangeValue.style.display="inline";    
        }
    ///////////////
    if(obj=='1')
    {    
         document.getElementById('ddlpremium').style.visibility = "hidden";  
         document.getElementById('ddlmaxper').style.visibility = "visible";  
    }
    else
    {
         document.getElementById('ddlpremium').style.visibility = "visible";  
         document.getElementById('ddlmaxper').style.visibility = "hidden"; 
         ddlpremium.SetEnabled(false); 
    }
    ddlpremium.SetValue('3');
 }
function disableflatrate()
{

  var e1= document.getElementById("ddlflatper").value;
  if(e1 >0)
  {
    document.getElementById("ddlbrokerageslab").disabled=true;
    document.getElementById("txtrate").disabled=true;
    document.getElementById("txtminamt").disabled=true;
    document.getElementById("txtmaxamt").disabled=true;
    document.getElementById("ddlminper").disabled=true;
    document.getElementById("ddlmaxper").disabled=true;
  }
  else
  
  {
    
    document.getElementById("ddlbrokerageslab").disabled=false;
    document.getElementById("txtrate").disabled=false;
    document.getElementById("txtminamt").disabled=false;
    document.getElementById("txtmaxamt").disabled=false;
    document.getElementById("ddlminper").disabled=false;
    document.getElementById("ddlmaxper").disabled=false;
  
  }
}
function disablefield()
{
   var r=document.getElementById("txtflatamt_I").value;
   //alert(r);
//    if(r!="0.00")
//  {
//   alert("lw");
//    document.getElementById("ddlbrokerageslab").disabled=true;
//    document.getElementById("txtrate").disabled=true;
//    document.getElementById("txtminamt").disabled=true;
//    document.getElementById("txtmaxamt").disabled=true;
//    document.getElementById("ddlminper").disabled=true;
//    document.getElementById("ddlmaxper").disabled=true;
//  }
//  else
//  
//  {
//    alert("l");
//    document.getElementById("ddlbrokerageslab").disabled=false;
//    document.getElementById("txtrate").disabled=false;
//    document.getElementById("txtminamt").disabled=false;
//    document.getElementById("txtmaxamt").disabled=false;
//    document.getElementById("ddlminper").disabled=false;
//    document.getElementById("ddlmaxper").disabled=false;
//  }
  //   || r!="0.00" || r!="0.000" || r!="0.0000" || r!="0.00000" || r!="0.000000"
  
  if(r=="0.0" || r=="0.00" || r=="0.000" || r=="0.0000" || r=="0.00000" || r=="0.000000")
  {
//  alert("lw");
    document.getElementById("ddlbrokerageslab").disabled=false;
    document.getElementById("txtrate").disabled=false;
    document.getElementById("txtminamt").disabled=false;
    document.getElementById("txtmaxamt").disabled=false;
    document.getElementById("ddlminper").disabled=false;
    document.getElementById("ddlmaxper").disabled=false;
  }
  
  else
  
  {
      //alert("l");
    document.getElementById("ddlbrokerageslab").disabled=true;
    document.getElementById("txtrate").disabled=true;
    document.getElementById("txtminamt").disabled=true;
    document.getElementById("txtmaxamt").disabled=true;
    document.getElementById("ddlminper").disabled=true;
    document.getElementById("ddlmaxper").disabled=true;
  }
}
function disablerate()
{
    var gh= document.getElementById("txtrate_I").value;
  
    if(gh=="0.0" || gh=="0.00" ||gh=="0.000" ||gh=="0.0000" || gh=="0.00000" || gh=="0.000000")
   {
     document.getElementById("ddlbrokerageslab").disabled=false;
     document.getElementById("ddlflatper").disabled=false;
   }
 
   else
   
   {
    document.getElementById("ddlbrokerageslab").disabled=true;
    document.getElementById("ddlflatper").disabled=true;
    
   }
}

function ValidateInput()
{
    
    //Validation Check
    document.getElementById("hdn_ValidateIndicator").value="Failed";
    if(cddlinstrumenttype.GetValue() == "--Select--")
    {
        alert('Please Select Instrument Type');
        cddlinstrumenttype.Focus();
        return;
    }
     if(ddlbrokeragefor.GetValue() == "--Select--")
    {
        alert('Please Select Brokerage For');
        ddlbrokeragefor.Focus();
        return;
    }
     if(cddlbrokeragetype.GetValue() == "--Select--")
    {
        alert('Please Select Brokerage Type');
        cddlbrokeragetype.Focus();
        return
    }
     if(cddltransttype.GetValue() == "--Select--")
    {
        alert('Please Select Transaction Type');
        cddltransttype.Focus();
        return
    }
    if(cddlcalculateon.GetValue() == "--Select--")
    {
        alert('Please Select Calculate On');
        cddlcalculateon.Focus();
        return
    }
    
    if (ddlbrokeragefor.GetValue() != 1)
    {
        if (document.getElementById('txtproductid').value=="" || document.getElementById('txtproductid_hidden').value == "")
        {
           alert('Please Select Product');
           document.getElementById('txtproductid').focus();                   
           return;
        }
    }
    document.getElementById("hdn_ValidateIndicator").value="Successful";
}

function Combo_CallBack(Param)
{
  
  var InstrumentType=cddlinstrumenttype.GetText();
  var InstrumentTypeValue=cddlinstrumenttype.GetValue();
  var SpecificExchange=cCmbExchange.GetValue();
  var BrokerageFor=ddlbrokeragefor.GetValue();
  
  if(Param=="InstType" || Param=="Exch")
  {
    ddlbrokeragefor.SetSelectedIndex(0);
    document.getElementById("tdlblpro").style.display = "none";
    document.getElementById("tdpro").style.display = "none";
  }
  if(Param=="BrkgFor")
    ddlbrokeragefor.PerformCallback(InstrumentType+'~'+SpecificExchange+'~'+BrokerageFor);
 
    document.getElementById("Td_Temp").style.display="none";
    
    
}
function Combo_EndCallBack()
{
    var AjaxQuery=''
    GAjaxQuery=''//Global Varible To Contain AjaxQuery For Other Method
    if(cddlinstrumenttype.cpInstrumentType!=null)
    {
        var InstrumentType=cddlinstrumenttype.cpInstrumentType.split('~')[0];
        AjaxQuery=cddlinstrumenttype.cpInstrumentType.split('~')[1];
        cddlinstrumenttype.SetValue(InstrumentType);
        cddlinstrumenttype.cpInstrumentType=null;
        
    }
    if(cCmbExchange.cpSpecificExchange!=null)
    {
        var Exchange=cCmbExchange.cpSpecificExchange.split('~')[0];
        AjaxQuery=cCmbExchange.cpSpecificExchange.split('~')[1];
        cCmbExchange.SetValue(Exchange);
        cCmbExchange.cpSpecificExchange=null;
    }
    if(ddlbrokeragefor.cpBrokerageFor!=null)
    {
       var BrkgFor=ddlbrokeragefor.cpBrokerageFor.split('|')[0];
       AjaxQuery=ddlbrokeragefor.cpBrokerageFor.split('|')[1];
       ddlbrokeragefor.SetValue(BrkgFor);
      
       if(BrkgFor!="1")
       {
         document.getElementById("tdlblpro").style.display = "inline";
         document.getElementById("tdpro").style.display = "inline";
       }
       else
       {
        document.getElementById("tdlblpro").style.display = "none";
        document.getElementById("tdpro").style.display = "none";
       }
       ddlbrokeragefor.cpBrokerageFor=null;
    }
    GAjaxQuery=AjaxQuery;
    
    var TextBox=document.getElementById('txtproductid');
    var TextBoxHidden=document.getElementById('txtproductid_hidden');
    TextBox.value='';
    TextBoxHidden.value='';
    TextBox.detachEvent('onkeyup',CallGenericAjaxJS);
    TextBox.attachEvent('onkeyup',CallGenericAjaxJS);
     
    document.getElementById("Td_Temp").style.display="inline";
    
}
function CallGenericAjaxJS(e)
{
    var TextBox=document.getElementById('txtproductid');
    TextBox.focus();
    GAjaxQuery=GAjaxQuery.replace("\'","'");
    ajax_showOptions(TextBox,'GenericAjaxList',e,replaceChars(GAjaxQuery),'Main');
}


    </script>

</head>
<body>
    <form id="form1" runat="server" autocomplete="off">
    <div>
    <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600">
            </asp:ScriptManager>
        <table class="TableMainB">
                <tr>
                    <td >
                    </td>
                </tr>
                <tr>
                
                    <td>
            
                            <table width="100%">
                                <tr>
                                    <td>
                                        <table style="width:90%; z-index:101" border="1">
                                            <tr runat="server">
                                                <td runat="server"  style="width: 20%; background-color: #b7ceec;">
                                            Brokerage Detail OF</td>
                                                <td colspan="2">
                                          <dxe:ASPxLabel ID="lblname" runat="server" width="95%"  ForeColor="Brown"></dxe:ASPxLabel>
                                                </td>
                                                <td id="TD_Exchange"  style="width: 20%; background-color: #b7ceec;">
                                                    Exchange</td>
                                                <td id="TD_ExchangeValue" style="width: 15%">
                                                <dxe:ASPxComboBox runat="server" ID="cmbExchange" ClientInstanceName="cCmbExchange" width="125px"    EnableSynchronization="False" EnableIncrementalFiltering="True" OnCallback="cmbExchange_Callback">
                                                <ClientSideEvents SelectedIndexChanged="function(s, e) { Combo_CallBack('Exch'); }" EndCallback="Combo_EndCallBack" />
                                                </dxe:ASPxComboBox>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                                            <tr id="tr1" runat="server" >
                                              
                                           <td  id="tdm" runat="server" style="width: 20%; background-color: #b7ceec;" >
                                               Asset Type</td>
                                          <td  style="width: 30%;" id="tddllm" runat="server">
                                             <dxe:ASPxComboBox runat="server" ID="ddlmarketseg" width="190px"    EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                <Items>
                                                  <dxe:ListEditItem Text="ANY" Value="1">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="BASE METALS" Value="2">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="CURRENCIES" Value="3">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="ENERGY" Value="4">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="EQUITIES [STOCKS]" Value="5">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="PRECIOUS METALS" Value="6">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="PRECIOUS METALS [SHARIAH]" Value="7">
                                                  </dxe:ListEditItem>
                                                 
                                                </Items>
                                             </dxe:ASPxComboBox>
                                          </td>
                                                                       
                                          <td  style="width: 15%; background-color: #b7ceec">
                                              Instrument Type</td>
                                          <td  style="width: 20%;">
                                             <dxe:ASPxComboBox runat="server" Width="125px" ID="ddlinstrumenttype" ClientInstanceName="cddlinstrumenttype"    EnableSynchronization="False" EnableIncrementalFiltering="True" OnCallback="ddlinstrumenttype_Callback">
                                             <ClientSideEvents SelectedIndexChanged="function(s, e) { Combo_CallBack('InstType'); }"
                                              EndCallback="Combo_EndCallBack"></ClientSideEvents>
                                              <Items>
                                              
                                                  <dxe:ListEditItem Text="All" Value="1">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Equity" Value="2">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Bonds" Value="3">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Debt" Value="4">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="ETFs" Value="5">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="Equity Futures" Value="6">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="Equity Options" Value="7">
                                                  </dxe:ListEditItem>
                                                   <dxe:ListEditItem Text="Index Futures" Value="8">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="Index Options" Value="9">
                                                  </dxe:ListEditItem>
                                                   <dxe:ListEditItem Text="All Futures" Value="10">
                                                  </dxe:ListEditItem>
                                                   <dxe:ListEditItem Text="All Options" Value="11">
                                                  </dxe:ListEditItem>
                                                </Items>
                                             </dxe:ASPxComboBox>
                                          </td>
                                           <td  style="width: 15%; background-color: #b7ceec">
                                               Brokerage For 
                                           </td>
                                          <td>
                                            <dxe:ASPxComboBox runat="server" Width="125px" ID="ddlbrokeragefor" ClientInstanceName="ddlbrokeragefor"    EnableSynchronization="False" EnableIncrementalFiltering="True" OnCallback="ddlbrokeragefor_Callback">
                                            <ClientSideEvents  EndCallback="Combo_EndCallBack" SelectedIndexChanged="function(s, e) {Combo_CallBack('BrkgFor'); }"></ClientSideEvents>
                                               <Items>
                                                  <dxe:ListEditItem Text="All" Value="1">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Specific Instrument" Value="2">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Specific Underlying Asset" Value="3">
                                                  </dxe:ListEditItem>
                                                 
                                                </Items>
                                                                    
                                             </dxe:ASPxComboBox>
                                             
                                          </td>
                                           
                                           </tr>
                                             <tr id="tr2" runat="server" >
                                           <td  style="width: 20%; background-color: #b7ceec;display:none" id="tdlblpro" runat="server">
                                               Product ID</td>
                                          <td  style="width: 30%;display:none" id="tdpro" runat="server">
                                            <%-- <dxe:ASPxTextBox runat="server" width="126px" ID="txtproductid" ></dxe:ASPxTextBox>--%>
                                            <asp:TextBox runat="server" width="160px" Font-Size="10px" ID="txtproductid" ></asp:TextBox>
                                            <asp:TextBox  ID="txtproductid_hidden" runat="server" Width="14px" style="display:none;"> </asp:TextBox>
                                          </td>
                                     
                                                 <td  style="width: 15%; background-color: #b7ceec">
                                                     Brokerage Type</td>
                                          <td  style="width: 20%;">
                                             <dxe:ASPxComboBox runat="server" ID="ddlbrokeragetype" ClientInstanceName="cddlbrokeragetype" width="125px"    EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                <Items>
                                                  <dxe:ListEditItem Text="Delivery" Value="1">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Square-Off" Value="2">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Exercise" Value="3">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Assignment" Value="4">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="Final Settlement" Value="5">
                                                  </dxe:ListEditItem>
                                                   <dxe:ListEditItem Text="Delivery CloseValue" Value="6">
                                                  </dxe:ListEditItem>
                                                 
                                                </Items>
                                             </dxe:ASPxComboBox>
                                          </td>
                                     
      
                                          <td  style="width: 15%; background-color: #b7ceec">
                                              Transaction Type</td>
                                          <td>
                                             <dxe:ASPxComboBox runat="server" Width="125px" ID="ddltransttype" ClientInstanceName="cddltransttype"    EnableSynchronization="False" EnableIncrementalFiltering="True">
                                               <Items>
                                              
                                                  <dxe:ListEditItem Text="Purchase" Value="1">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Sale" Value="2">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Both" Value="3">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="FirstLeg" Value="4">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="SecondLeg" Value="5">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="HigherLeg" Value="6">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="LowerLeg" Value="7">
                                                  </dxe:ListEditItem>
                                                   <dxe:ListEditItem Text="Daily" Value="8">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="DailySecond" Value="9">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="Carry-Buy" Value="10">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="Carry-Sell" Value="11">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="Open" Value="12">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="Close" Value="13">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="Close-Today" Value="14">
                                                  </dxe:ListEditItem>
                                                  
                                                </Items>
                                             </dxe:ASPxComboBox>
                                          </td>
                                    
                                          </tr>
                                           
                                           <tr id="tr3" runat="server" >
                                             
                                               <td  style="width: 20%; background-color: #b7ceec;" >
                                                   Calculate On</td>
                                          <td  style="width: 30%;">
                                                  <dxe:ASPxComboBox runat="server" ID="ddlcalculateon" ClientInstanceName="cddlcalculateon" width="125px"    EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                  <ClientSideEvents SelectedIndexChanged="function(s, e) { OncalculateonChange(s); }"></ClientSideEvents>
                                                <Items>
                                                  <dxe:ListEditItem Text="Market Price" Value="1">
                                                  </dxe:ListEditItem>
                                                  
                                                    <dxe:ListEditItem Text="Market+Strike" Value="2">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Strike" Value="3">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Trade Value" Value="4">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="Spot" Value="5">
                                                  </dxe:ListEditItem>
                                                  <dxe:ListEditItem Text="Difference" Value="6">
                                                  </dxe:ListEditItem>
                                                </Items>
                                             </dxe:ASPxComboBox>  
                                             
                                          </td>
                                                  <td  style="width: 15%; background-color: #b7ceec">
                                                      Flat Amount</td>
                                          <td   style="width: 20%;" >
                                             <dxe:ASPxTextBox runat="server"   ID="txtflatamt" onkeypress="return noNumbers(event)">
                                             <%-- <MaskSettings Mask="<0..999999999999g>.<00..99>"  />--%>
                                               <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                             </dxe:ASPxTextBox>
                                          </td>
                                           <td  style="width: 15%; background-color: #b7ceec">
                                               Flat Per</td>
                                          <td style="text-align:left;">
                 
                                             
                                             
                                              <dxe:ASPxComboBox runat="server" Width="125px" ID="ddlflatper" ClientInstanceName="ddlflatper"    EnableSynchronization="False" EnableIncrementalFiltering="True">
                                               <ClientSideEvents ></ClientSideEvents>
                                               <Items>
                                                  <dxe:ListEditItem Text="Unit" Value="1">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Lot" Value="2">
                                                  </dxe:ListEditItem>
                                                    
                                                 
                                                </Items>
                                                                    
                                             </dxe:ASPxComboBox>
                                          </td>
                                 
                                           
                                           </tr>
                                           
                                           <tr id="tr4" runat="server" >
                                       
                                             <td  style="width: 20%; background-color: #b7ceec;">
                                                 Rate ( % )</td>
                                          <td   style="width: 30%;" >
                                          <dxe:ASPxTextBox runat="server" width="125px" ID="txtrate" onkeypress="return noNumbers(event)">
                                           <MaskSettings Mask="<0..99g>.<00..999999>"  />
                                               <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                          </dxe:ASPxTextBox>
                                         <%-- <asp:TextBox runat="server" width="120px"  ID="txtrate" onkeypress="return noNumbers(event)"></asp:TextBox>--%>
                                          </td>
                                          
                                              <td  style="width: 15%; background-color: #b7ceec">
                                                  Min Amount</td>
                                          <td   style="width: 20%;" >
                                          <dxe:ASPxTextBox runat="server" id="txtminamt" onkeypress="return noNumbers(event)" Width="125px">
                                          <%-- <MaskSettings Mask="<0..999999999999g>.<00..99>"  />--%>
                                           <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                          </dxe:ASPxTextBox>
                                           <%--  <asp:TextBox runat="server"  ID="txtminamt" onkeypress="return noNumbers(event)" Width="120px"></asp:TextBox>--%>
                                          </td>
                                          <td  style="width: 15%; background-color: #b7ceec">
                                              Min Per</td>
                                          <td style="text-align:left;">

                                            
                                               <dxe:ASPxComboBox runat="server" Width="125px" ID="ddlminper" ClientInstanceName="ddlminper"    EnableSynchronization="False" EnableIncrementalFiltering="True">
                                               <ClientSideEvents ></ClientSideEvents>
                                               <Items>
                                                  <dxe:ListEditItem Text="Unit" Value="1">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Lot" Value="2">
                                                  </dxe:ListEditItem>
                                                    
                                                 
                                                </Items>
                                                                    
                                             </dxe:ASPxComboBox>
                                          </td>
                                         
                                          </tr>
                                          
                                           <tr id="tr5" runat="server">

                                            <td  style="width: 20%; background-color: #b7ceec;">
                                                Max Amount</td>
                                          <td   style="width: 30%;" >
                                          <%-- <asp:TextBox  runat="server"  ID="txtmaxamt"  Width="120px" onkeypress="return noNumbers(event)"></asp:TextBox>--%>
                                             <dxe:ASPxTextBox runat="server" id="txtmaxamt" onkeypress="return noNumbers(event)" Width="125px">
                                       <%--    <MaskSettings Mask="<0..999999999999g>.<00..99>"  />--%>
                                           <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                                          </dxe:ASPxTextBox>
                                          </td>
                                    
                                           <td  style="width: 15%; background-color: #b7ceec">
                                               Max Per</td>
                                          <td  style="width: 20%;">
                 
                                            
                                              <dxe:ASPxComboBox runat="server" Width="125px" ID="ddlmaxper" ClientInstanceName="ddlmaxper"    EnableSynchronization="False" EnableIncrementalFiltering="True">
                                               <ClientSideEvents ></ClientSideEvents>
                                               <Items>
                                                  <dxe:ListEditItem Text="Unit" Value="1">
                                                  </dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Lot" Value="2">
                                                  </dxe:ListEditItem>
                                                </Items>
                                             </dxe:ASPxComboBox>
                                               <dxe:ASPxComboBox runat="server" Width="125px" ID="ddlpremium" ClientInstanceName="ddlpremium"    EnableSynchronization="False" EnableIncrementalFiltering="True" >
                                               <ClientSideEvents ></ClientSideEvents>
                                               <Items>
                                                  <dxe:ListEditItem Text="Premium" Value="3">
                                                  </dxe:ListEditItem>
                                                </Items>
                                             </dxe:ASPxComboBox>
                                          </td>
                                          <td  style="width: 15%; background-color: #b7ceec">
                                              Brkg Slab</td>
                                          <td  style="text-align:left;" >
                                            <asp:DropDownList runat="server" ID="ddlbrokerageslab" Width="125px"></asp:DropDownList>
                                          </td>                                 
                                      
                                           
                                           </tr>
                                        <tr  runat="server" id="tr_FinMinPerLot" valign="top">
                                            <td   style="width: 20%; background-color: #b7ceec;">
                                                Provided Brkg Is Not Less Than</td>
                                                <td style="width: 30%"  >
                                                <dxe:ASPxTextBox runat="server" id="txtFinMinPerLott" onkeypress="return noNumbers(event)" Width="125px">
                                           <MaskSettings Mask="<0..999999999999g>.<00..99>"  />
                                           <ValidationSettings ErrorDisplayMode="None"></ValidationSettings> 
                                          </dxe:ASPxTextBox></td><td  style="width: 15%; background-color: #b7ceec"> &nbsp;Per Lot</td>
                                            <td  style="width: 20%;">
                                            </td>
                                            <td class="Ecoheadtxt" style="width: 15%; background-color: #b7ceec;">
                                            </td>
                                            <td style="text-align: left">
                                            </td>
                                        </tr>
                                            <tr>
                                                <td style="width: 20%;">
                                                    &nbsp;<asp:HiddenField ID="hddnSeg" runat="server" />
                                                </td>
                                                <td style="width: 30%;" >
                                                </td>
                                                <td class="Ecoheadtxt" style="width: 15%;">
                                                </td>
                                                <td style="width: 20%;">
                                                </td>
                                                <td class="Ecoheadtxt" style="width: 15%;">
                                                </td>
                                                <td>
                                                    
                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                        <ContentTemplate>
                                                            <asp:Button ID="btnSave" runat="server" Style="cursor: pointer" Text="Save" CssClass="btnUpdate"
                                                                OnClick="btnSave_Click" OnClientClick="return ValidateInput();" Height="20px"
                                                                Width="80%" />
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                                    <ProgressTemplate>
                                                    <div id='Div1' style='position: absolute; font-family: arial; font-size: 30; left: 50%;
                                    top: 50%; background-color: white; layer-background-color: white; height: 80;
                                    width: 150;'>
                                    <table width='100' height='35' border='1' cellpadding='0' cellspacing='0' bordercolor='#C0D6E4'>
                                        <tr>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td height='25' align='center' bgcolor='#FFFFFF'>
                                                            <img src='../images/progress.gif' width='18' height='18'></td>
                                                        <td height='10' width='100%' align='center' bgcolor='#FFFFFF'>
                                                            <font size='2' face='Tahoma'><strong align='center'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Saving..</strong></font></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                                    </ProgressTemplate>
                                                    </asp:UpdateProgress>
                                                </td>
                                            </tr>
                                            <tr>
                                            <td id="Td_Temp"></td>
                                               
                                            </tr>
                                        
                                        </table>
                                        
                                        
                                            </td>
                                </tr>
                   <%--            
                                        <tr>
                    <td style="height: 8px">
                        <table style="width: 100%;">--%>
                      <%--      <tr>
                                <td align="right" style="width: 843px">
                                    <asp:HiddenField ID="hdReferenceBy" runat="server" />
                                    <table>
                                       
                                    </table>
                                </td>
                            </tr>--%>
                      <%--  </table>
                    </td>
                </tr>--%>
                            </table>
                            <table>
                            
                            </table>
                      <%--  </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                   
                    
                    
                    </tabpages>--%>
                          <%--  <contentstyle>
                        <Border BorderColor="#002D96" BorderStyle="Solid" BorderWidth="1px" />
                    </contentstyle>
                            <loadingpanelstyle imagespacing="6px">
                    </loadingpanelstyle>
                        </dxtc:ASPxPageControl>--%>
                    </td>
                </tr>
       
            </table>
            
    </div>
    <asp:HiddenField ID="hdn_ValidateIndicator" runat="server" />
    </form>
</body>
</html>
