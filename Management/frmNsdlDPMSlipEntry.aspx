<%@ page language="C#" autoeventwireup="true" inherits="management_frmNsdlDPMSlipEntry, App_Web_nhjs8cfd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Dp Slip Entry</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet"/>
    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>
   

    <style type="text/css">
	
	/* Big box with list of options */
	#ajax_listOfOptions{
		position:absolute;	/* Never change this one */
		width:50px;	/* Width of box */
		height:auto;	/* Height of box */
		overflow:auto;	/* Scrolling features */
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
	}
	#ajax_listOfOptions_iframe{
		background-color:#F00;
		position:absolute;
		z-index:5;
	}
	
	form{
		display:inline;
	}

	</style>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage();setInterval('blinkIt()',500)">

    <script language="javascript" type="text/javascript">
     var exist=0;
     var slipvalid='';
     var slipdate='';
    
    function SignOff()
    {
        window.parent.SignOff();
    }
    function PageLoad()
    {
        dtexec1.SetDate(new Date()); 
        dttran1.SetDate(new Date()); 
        trTrnsfrRsn.style.display='none';
        tdTrnsfrRsnOthr.style.display='none';
        tdTrnsfrRsnOthrTxt.style.display='none';
        aAddDetail.style.display='none';
        document.getElementById("lbl_sdedate").innerText=dtexec1.GetText();
        TrNoCash1.style.visibility="hidden";
        TrNoCash2.style.visibility="hidden";
        if (!String.prototype.trim) {
          String.prototype.trim = function () {
            return this.replace(/^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g, '');
          };
        }
    } 
    function height()
    {
        if(document.body.scrollHeight>=600)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '600px';
            
    }   
    function showholding_pop()
    {
        var BenID=document.getElementById('hiddenbenid').value;
        BenID=BenID.substr(BenID.indexOf('[')+1,10);   
        //alert(dpid);
        var url='frm_InstrunctionEntryShowHolding_popup.aspx?BenAccNo='+BenID;
        parent.OnMoreInfoClick(url,"Free Holding",'940px','450px',"Y"); 
    }
    function Signature_PopUpCall(obj)
    {
        //parent.OnMoreInfoClick(obj,"Large Image",'940px','450px',"N");     
         //alert(document.getElementById('txtClient').value);         
         //alert('<%= dp %>');
         //alert(obj);
         var BenAccNo=document.getElementById('hiddenbenid').value;
         BenAccNo=BenAccNo.split('[')[1].toString().split(']')[0];
         //alert(BenAccNo);
         if('<%= dp %>'=='CDSL')
           {   
             var url='view_signature.aspx?id=' + BenAccNo+'[CDSL]';
             parent.OnMoreInfoClick(url,"View Signature",'940px','450px',"Y");         
           }
         else
           {
            var url='view_signature.aspx?id=' + BenAccNo+'[NSDL]';
            parent.OnMoreInfoClick(url,"View Signature",'940px','450px',"Y");      
           }    
    }
    function OnAddButtonClick1() 
    {
     var dptype = '<%= dp %>'; 
      if(dptype=='CDSL')
      {
        var url='display_xml.aspx?id=' + "cdsl";
        parent.OnMoreInfoClick(url,"Show Seetlement Details",'940px','450px',"Y"); 
      }
      else
      {
        var url='display_xml.aspx?id=' + "nsdl";
        parent.OnMoreInfoClick(url,"Show Seetlement Details",'940px','450px',"Y"); 
      }
    }
    </script>

    <%-- displaysignature_Cod--%>

    <script language="javascript" type="text/javascript">
//    function diffpage()
//    {
//     '<%=Session["transactiontype"] %>'='<%=Session["transactiontype"] %>'+'~'+'bind';
//    }
      
       function PageLoad1()
       {   
       
        FieldName='abc';  
        OnSelectionRefresh();
        OnSelectionMarketType();
        FormInitialView();
       } 
       function height()
       {
       if(document.body.scrollHeight>=600)
        window.frameElement.height = document.body.scrollHeight;
       else
        window.frameElement.height = '600px';
        
       }   
        
           FieldName='abc';  
           function CallAjax(obj1,obj2,obj3)
                { 
                    document.getElementById('hiddensettlefrom').value='';
                    var trantype=document.getElementById("hdntrantype").value;
                    var ddlmkt1 = ccmbmktfrom.GetValue();
                    var ddlex1 = '<%=sourceex %>';
                    //alert(ddlmkt1+'~'+ddlex1+'~'+'IN3');                                     
                    ajax_showOptions(obj1,obj2,obj3,ddlmkt1+'~'+ddlex1+'~'+trantype,'Main');
                    //alert(document.getElementById('hiddensettlefrom').value);
                }
                 function CallAjaxisin(obj1,obj2,obj3)
                {    
                   
                    var clientval=document.getElementById('txtClient').innerHTML;
                    clientval=clientval.split('[');
                    var clientname=clientval[1];
                    clientname=clientname.replace("]","");
                    
                    var ddlmkt1 = cmbmarketto.GetValue();
                    var ddlex1 = document.getElementById("hdnbplistcode").value;
                    var trantype=document.getElementById("hdntrantype").value;
                    //alert(ddlmkt1+'~'+ddlex1+'~'+' ');                                     
                    ajax_showOptions(obj1,obj2,obj3,ddlmkt1+'~'+ddlex1+'~'+trantype+'~'+clientname ,'Main');
                   
                }
                  function CallAjaxdpid(obj1,obj2,obj3)
                {                     
                    var ddlmkt1 = cmbmarketto.GetValue();
                    var ddlex1 = document.getElementById("hdnbplistcode").value;
                    var trantype=document.getElementById("hdntrantype").value;
                    var BenAccNo=document.getElementById('hiddenbenid').value;
                    
                    //alert(ddlmkt1+'~'+ddlex1+'~'+document.getElementById("txtdpid3").value);                                     
                    ajax_showOptions(obj1,obj2,obj3,ddlmkt1+'~'+ddlex1+'~'+'IN3'+'~'+trantype+'~'+BenAccNo,'Main');
                    //alert(document.getElementById('hiddensettlefrom').value);
                }
                 function CallAjaxto(obj1,obj2,obj3)
                {
                    var cmbmkttovalue = cmbmarketto.GetValue();
                    var cmbmkttotext=cmbmarketto.GetText();
                    var ddlex2='<%=sourceex %>';
                    var ddlex1 =document.getElementById("hdnbplistcode").value;
                    var trantype=document.getElementById("hdntrantype").value;
                    if(trantype== '5' || trantype== '6')
                    {
                        ajax_showOptions(obj1,obj2,obj3,cmbmkttotext+'~'+ddlex2+'~'+cmbmkttovalue+'~'+trantype,'Main');
                    }
                    else
                    {
                        ajax_showOptions(obj1,obj2,obj3,cmbmkttotext+'~'+ddlex1+'~'+cmbmkttovalue+'~'+trantype,'Main');
                    }
                }
                 function CallAjaxcmbpid(obj1,obj2,obj3)
                  { 
                    var EarlyOrNormal=''; 
                    var radioButtons = document.getElementsByName("rbtnNrmEarlyPayin");
                     if (radioButtons[0].checked==true && tdrbtnNrmEarlyPayin.style.display=='inline') 
                     {                              
                        EarlyOrNormal='N';
                        document.getElementById('hdnrbtnNrmErlyvalue').value='N';
                     }
                     else if(radioButtons[1].checked==true && tdrbtnNrmEarlyPayin.style.display=='inline') 
                     {
                        EarlyOrNormal='E';
                        document.getElementById('hdnrbtnNrmErlyvalue').value='E';
                     }
                     else if(radioButtons[2].checked==true && tdrbtnNrmEarlyPayin.style.display=='inline') 
                     {
                        EarlyOrNormal='ON';
                        document.getElementById('hdnrbtnNrmErlyvalue').value='OnMkt.';
                     }
                     else
                     {
                        EarlyOrNormal='N';
                        document.getElementById('hdnrbtnNrmErlyvalue').value='N';
                     }
                    //alert(EarlyOrNormal);
                    var trantype=document.getElementById("hdntrantype").value;
                    ajax_showOptions(obj1,obj2,obj3,trantype+'~'+EarlyOrNormal,'Main');
                  }
                  function CallAjaxMarkettodata(obj1,obj2)
                  {  
                    // alert('a4');                                                        
                    ajax_showOptions(obj1,obj2);
                  }
                  
                  function CallAjaxclient(obj1,obj2,obj3)
                {
                 
                 var Variable1 = document.getElementById('hiddendpid').value;
                  var trantype=document.getElementById("hdntrantype").value;
                  //alert(Variable1+'~'+document.getElementById('hiddendpid').value+'~'+document.getElementById('hiddenbenid').value);                                
                  ajax_showOptions(obj1,obj2,obj3,'IN3'+'~'+Variable1+'~'+trantype+'~'+document.getElementById('hiddenbenid').value,'Main');
                }
                function keyVal(obj)
                {   
                     //alert(obj);
                     var trantype=document.getElementById("hdntrantype").value;
                     var WhichCode=new String(obj);
                     var status=new String(obj);
                     var bplistcode=new String(obj);
                     var CHID=new String(obj);
                     var CMID=new String(obj);
                     var otherddpid=new String(obj);
                     var selecteddpid=new String(obj);
                     var SettlementToValue=new String(obj);
                     WhichCode=WhichCode.split('+')[3];
                     //alert(WhichCode);
                     if(WhichCode == 'cmbpid')
                     {
                        status=status.split('+')[2];
                        bplistcode=bplistcode.split('+')[0];
                        otherddpid=otherddpid.split('+')[1];
                        CHID=CHID.split('+')[4];
                        CMID=CMID.split('+')[5];
                        //alert(status+bplistcode);
                        document.getElementById('hdnbplistcode').value=bplistcode;
                        document.getElementById('hdnotherddpid').value=otherddpid;
                        document.getElementById('boldStuff2').innerHTML = status;
                        document.getElementById('Hiddendpidm').value = bplistcode;
                        document.getElementById('hdnCHID').value=CHID;
                        document.getElementById('hdnCMID').value=CMID;
                        cmbmarketto.PerformCallback(bplistcode+'~KeyVal');
                        if (bplistcode == "IN001002")
                        {
                            cmbmarketto.SetText('NORMAL');
                        }
                        else if (bplistcode == "IN001019")
                        {
                           cmbmarketto.SetText('Rolling Market Lot');
                        }
                        else if (bplistcode == "IN001027")
                        {
                            cmbmarketto.SetText('ROLLING MKT LOT');
                        }
                        else if (bplistcode == "12" || bplistcode == "11" || bplistcode == "13")
                        {
                            cmbmarketto.SetText('Rolling Normal');
                        }
                        else
                        {
                            cmbmarketto.SetText('Normal');
                        }
                     }
                     if(WhichCode == 'isin')
                     {
                        status=status.split('+')[2];
                         if(status=='Suspended for Debit')
                         {
                           alert(status);
                         }
                         if(status=='To be Closed')
                         {
                           alert(status);
                         }
                         document.getElementById('Hiddenhold').value=obj.split('+')[0];   
                         CIcmbholding.PerformCallback();
                     }
                     if(WhichCode == 'dpid')
                     {
                        //alert(selecteddpid.split('+')[0]);
                        document.getElementById('hiddendpid').value=selecteddpid.split('+')[0];
                        var DpId=document.getElementById('hiddendpid').value;
                        CallServer1(DpId+'~'+trantype,"");
                     }
                     if(WhichCode == 'ClientID')
                     {
                        //alert(Whichcode);
                        //document.getElementById('txtclient1').onkeyup = onlyNumbers;
                     }
                     if(WhichCode == 'settlementfrom')
                     {
                        if(trantype=='5')
                        {
                            cmbmarketto.PerformCallback(' ~InterSettlement');
                        }
                        
                     }
                     if(WhichCode == 'settlementto')
                     {
                           SettlementToValue=SettlementToValue.split('+')[0];
                           //alert(SettlementToValue);
                           document.getElementById('hiddensettleto').value=SettlementToValue;
                     }   
                    
                              
                }
        function OnSelectedValueChanged(obj)
        {
            var ddlvalue=obj;
            var ddlslipvalue=SlipType.GetValue();
            document.getElementById("hdntrantype").value=ddlvalue;
            tdadd.style.display='inline'
            tdnew.style.display='none'
            
            if(ddlvalue =='0') //Select
            {
                OnSelectionSelect();
            }
            else if (ddlvalue == '1') //Markettype
            {
              OnSelectionRefresh();
              OnSelectionMarketType();
              OnChangeViewClick('h');
              RefreshControl();
              trTrnsfrRsn.style.display='none';
              aAddDetail.style.display='none';
              
            }
            else if(ddlvalue == '2')//OffMarkettype
            {
               OnSelectionRefresh();
               OnSelectionOffMarketType();
               OnChangeViewClick('h');
               RefreshControl();
               trTrnsfrRsn.style.display='inline';
               aAddDetail.style.display='inline';
               setTimeout(function(){ document.getElementById("ddltran").focus(); }, 500);
            }
            else if(ddlvalue == '3')//InterDP-Mrk
            {
               OnSelectionRefresh();
               OnSelectionInterDp_Mkt();
               OnChangeViewClick('h');
               RefreshControl();
               trTrnsfrRsn.style.display='inline';
               aAddDetail.style.display='none';
            }
            else if(ddlvalue == '4')//InterDP-OffMrk
            {
                OnSelectionRefresh();
                OnSelectionInterDp_OffMkt();
                OnChangeViewClick('h');
                RefreshControl();
                trTrnsfrRsn.style.display='inline';
                aAddDetail.style.display='inline';
                setTimeout(function(){ document.getElementById("ddltran").focus(); }, 500);
            }
            else if(ddlvalue == '5')//InterSettlement
            {
                //RefreshControl();
                document.getElementById('TextBox3').value='';
                document.getElementById('txtdpid').value='';
                document.getElementById('txtclient1').value='';
                document.getElementById('txtdpid').value='';
                document.getElementById('txtcmb').value='';
                document.getElementById('TextBox4').value='';
                document.getElementById('txtisin').value='';
                document.getElementById('txtqty').value='';
                document.getElementById('boldStuff2').innerHTML = '';
                document.getElementById('bholding').innerHTML = '';
                OnSelectionRefresh();
                OnSelectionInterSet();
                OnChangeViewClick('h');
                aAddDetail.style.display='none';
            }
            else if(ddlvalue == '6')//Delevery Out
            {
                //RefreshControl();
                document.getElementById('TextBox3').value='';
                document.getElementById('txtdpid').value='';
                document.getElementById('txtclient1').value='';
                document.getElementById('txtdpid').value='';
                document.getElementById('txtcmb').value='';
                document.getElementById('TextBox4').value='';
                document.getElementById('txtisin').value='';
                document.getElementById('txtqty').value='';
                document.getElementById('boldStuff2').innerHTML = '';
                document.getElementById('bholding').innerHTML = '';
                OnSelectionRefresh();
                OnSelectionDeliveryOut();
                OnChangeViewClick('h');
                aAddDetail.style.display='none';
            }
             else if(ddlvalue == '7')//Cm Pool To Pool
            {
               //RefreshControl();
               document.getElementById('TextBox3').value='';
               document.getElementById('txtdpid').value='';
               document.getElementById('txtclient1').value='';
               document.getElementById('txtdpid').value='';
               document.getElementById('txtcmb').value='';
               document.getElementById('TextBox4').value='';
               document.getElementById('txtisin').value='';
               document.getElementById('txtqty').value='';
               document.getElementById('boldStuff2').innerHTML = '';
               document.getElementById('bholding').innerHTML = '';
               OnSelectionRefresh();
               OnSelectionCMPoolToPool();
               OnChangeViewClick('h');
               aAddDetail.style.display='none';
            }
            else
            {
                OnSelectionRefresh();
                RefreshControl();
            }
            cComboTrnsfrRsn.PerformCallback();
            
        }
        function onTrnsfrRsnChngd()
        {
           aAddDetail.style.display='none';
           if(cComboTrnsfrRsn.GetText()== "Other")
           {
            tdTrnsfrRsnOthr.style.display='inline';
            tdTrnsfrRsnOthrTxt.style.display='inline';
           }
           else
           {
            tdTrnsfrRsnOthr.style.display='none';
            tdTrnsfrRsnOthrTxt.style.display='none';
           }
           
           if(cComboTrnsfrRsn.GetText()== "For Off-Market Sale / Purchase(2)")
           {
            tdConsideration.style.display='inline';
            tdConsiderationtxt.style.display='inline';
            aAddDetail.style.display='inline';
           }
           else
           {
            tdConsideration.style.display='none';
            tdConsiderationtxt.style.display='none';
           }
        }
        function OnSelectionRefresh()
        {
         trMarketTypeToFrom.style.display='inline';
         tCmAccExch.style.display='inline';
         trISIN.style.display='inline';
         trDPidClientID.style.display='inline';
         tdsettlementto.style.display='inline';
         tdsettlementto1.style.display='inline';
         tdsettlementfrom.style.display='inline';
         tdsettlementfrom1.style.display='inline';
         tdmkttypefrom.style.display='inline';
         tdmkttypefrom1.style.display='inline';
         tdmkttypeto.style.display='inline';
         tdmkttypeto1.style.display='inline';
         trinsttype.style.display='inline';
         tdCmAccNo.style.display='inline';
         tdCmAccNo1.style.display='inline';
         tdExch.style.display='inline';
         tdExch1.style.display='inline';
         tdrbtnNrmEarlyPayin.style.display='none';
         
        }
        function OnSelectionMarketType()
        {
         
           var Length= document.getElementById("ddltran").options.length;
           //alert(Length)
           if(Length == '7') 
           {
            trDPidClientID.style.display='none';
            trinsttype.style.display='none';
            var DivOnMkt = document.getElementById("divOnMkt");
            DivOnMkt.style.display='none';
           }
           else
           {
            trDPidClientID.style.display='none';
            trinsttype.style.display='none';
            tdmkttypefrom.style.display='none';
            tdmkttypefrom1.style.display='none';
            tdsettlementfrom.style.display='none';
            tdsettlementfrom1.style.display='none';
            if('<%= dp %>'=='CDSL')
            {
                tdrbtnNrmEarlyPayin.style.display='inline';
                var DivOnMkt = document.getElementById("divOnMkt");
                DivOnMkt.style.display='inline';
            }
            else
            {
                var DivOnMkt = document.getElementById("divOnMkt");
                DivOnMkt.style.display='none';
            }
           }
            
        }
        function OnSelectionOffMarketType()
        {
         var Length= document.getElementById("ddltran").options.length;
           //alert(Length)
           if(Length == '7') 
           {
             tCmAccExch.style.display='none';
             tdsettlementto.style.display='none';
             tdsettlementto1.style.display='none';
             tdmkttypeto.style.display='none';
             tdmkttypeto1.style.display='none';
             trinsttype.style.display='none';
           }
           else
           {
            tCmAccExch.style.display='none';
            tdsettlementto.style.display='none';
            tdsettlementto1.style.display='none';
            tdmkttypeto.style.display='none';
            tdmkttypeto1.style.display='none';
            trinsttype.style.display='none';
            tdmkttypefrom.style.display='none';
            tdmkttypefrom1.style.display='none';
            tdsettlementfrom.style.display='none';
            tdsettlementfrom1.style.display='none';
            }
        }
        function OnSelectionInterDp_Mkt()
        {
         var Length= document.getElementById("ddltran").options.length;
           //alert(Length)
           if('<%= dp %>'=='NSDL')
           {
            tdrbtnNrmEarlyPayin.style.display='inline';
            var DivOnMkt = document.getElementById("divOnMkt");
            DivOnMkt.style.display='none';
           }
           if(Length == '7') 
           {
            trDPidClientID.style.display='none';
            trinsttype.style.display='none';
           }
           else
           {
            trDPidClientID.style.display='none';
            trinsttype.style.display='none';
            tdmkttypefrom.style.display='none';
            tdmkttypefrom1.style.display='none';
            tdsettlementfrom.style.display='none';
            tdsettlementfrom1.style.display='none';
           }
        }
        function OnSelectionInterDp_OffMkt()
        {
          var Length= document.getElementById("ddltran").options.length;
           //alert(Length)
           if(Length == '7') 
           {
             tCmAccExch.style.display='none';
             tdsettlementto.style.display='none';
             tdsettlementto1.style.display='none';
             tdmkttypeto.style.display='none';
             tdmkttypeto1.style.display='none';
             trinsttype.style.display='none';
           }
           else
           {
            tCmAccExch.style.display='none';
            tdsettlementto.style.display='none';
            tdsettlementto1.style.display='none';
            tdmkttypeto.style.display='none';
            tdmkttypeto1.style.display='none';
            trinsttype.style.display='none';
            tdmkttypefrom.style.display='none';
            tdmkttypefrom1.style.display='none';
            tdsettlementfrom.style.display='none';
            tdsettlementfrom1.style.display='none';
            }
        }
        function OnSelectionInterSet()
        {
         trDPidClientID.style.display='none';
         trinsttype.style.display='none';
         tdCmAccNo.style.display='none';
         tdCmAccNo1.style.display='none';
         tdExch.style.display='none';
         tdExch1.style.display='none';
         //cmbmarketto.PerformCallback(' ~InterSettlement');
         
        }
        function OnSelectionDeliveryOut()
        {
         trDPidClientID.style.display='none';
         tdsettlementfrom.style.display='none';
         tdsettlementfrom1.style.display='none';
         tdmkttypefrom.style.display='none';
         tdmkttypefrom1.style.display='none';
         tdCmAccNo.style.display='none';
         tdCmAccNo1.style.display='none';
         tdExch.style.display='none';
         tdExch1.style.display='none';
         cmbmarketto.PerformCallback(' ~DeliveryOut');
//         setTimeout('alert(\'Surprise!\')', 1000);
         //document.getElementById('ddltran.ClientID').focus();
        }
        
        function OnSelectionCMPoolToPool()
        {
         trDPidClientID.style.display='none';
         trinsttype.style.display='none';
         if('<%= dp %>'=='CDSL')
         {
            tdrbtnNrmEarlyPayin.style.display='inline';
            var DivOnMkt = document.getElementById("divOnMkt");
            DivOnMkt.style.display='none';
         }
         RefreshControl();
         cmbmarketto.PerformCallback(' ~RefreshControl');
         
        }
        function OnSelectionSelect()
        {
            EntryTableInitialView();
        }
        function EntryTableInitialView()
        {
         trMarketTypeToFrom.style.display='inline';
         tCmAccExch.style.display='none';
         trISIN.style.display='none';
         trDPidClientID.style.display='none';
         tdsettlementto.style.display='none';
         tdsettlementto1.style.display='none';
         tdsettlementfrom.style.display='none';
         tdsettlementfrom1.style.display='none';
         tdmkttypefrom.style.display='none';
         tdmkttypefrom1.style.display='none';
         tdmkttypeto.style.display='none';
         tdmkttypeto1.style.display='none';
         trinsttype.style.display='none';
         tdCmAccNo.style.display='none';
         tdCmAccNo1.style.display='none';
         tdExch.style.display='none';
         tdExch1.style.display='none';
        
        }
        function FormInitialView()
        {
           trshowDetail.style.display='none'; 
           tdsignaturepanel.style.display='none';
           tblentry.style.display='none';
           tblDetailsGrid.style.display='none';
           document.getElementById('txtSlip').focus();
        }
        function AfterShowClickView_IfSlipExist()
        {
           trshowDetail.style.display='inline';
           tdsignaturepanel.style.display='inline';
           trshowDetail.style.display='inline'; 
           tblentry.style.display='inline';
           EntryTableInitialView();
        }
        function RefreshControl()
        {
            document.getElementById('TextBox3').value='';
            document.getElementById('txtdpid').value='';
            document.getElementById('txtclient1').value='';
            document.getElementById('txtdpid').value='';
            document.getElementById('txtcmb').value='';
            document.getElementById('TextBox4').value='';
            document.getElementById('txtisin').value='';
            document.getElementById('txtqty').value='';
            document.getElementById('boldStuff2').innerHTML = '';
            document.getElementById('bholding').innerHTML = '';
            cTxtConsideration.SetText(""); 
            cComboPaymentMode.SetText("Cash"); 
            cTxtTransfereeName.SetText(""); 
            cDtIssueDate.SetDate(new Date());
            cTxtBankAcc.SetText(""); 
            cTxtBankName.SetText(""); 
            cTxtBranchName.SetText(""); 
            cTxtChqRefNo.SetText(""); 
            cComboTrnsfrRsn.SetValue("1");
            var control = document.getElementById("ddltran"); 
            var value= control.options[control.selectedIndex].value;
            if(cComboTrnsfrRsn.GetText()== "For Off-Market Sale / Purchase(2)" && (value==2 || value==4))
            {
             tdConsideration.style.display='inline';
             tdConsiderationtxt.style.display='inline';
             aAddDetail.style.display='inline';
             TrNoCash1.style.visibility="hidden";
             TrNoCash2.style.visibility="hidden";
            }
            tdTrnsfrRsnOthr.style.display='none';
            tdTrnsfrRsnOthrTxt.style.display='none';
        }
        function SpecificRefreshControl() //When Transaction is Market or InterDP(Mkt)
        {
         document.getElementById('txtisin').value='';
         document.getElementById('txtqty').value='';
         document.getElementById('boldStuff2').innerHTML = '';
         document.getElementById('bholding').innerHTML = '';   
        }
        function ShowTrTd(obj)
        {
            obj.style.display='inline';
        }
        function HideTrTd(obj)
        {
            obj.style.display='none';
        }
        function getdpid(s)
        {      
            document.getElementById('hiddendpid').value=s;  
        }                     
     function pageclose()
        {
            var x=window.confirm("Do you want to close the window?");
            if(x)
            {
            parent.editwin.close();
            }
            else
            {
             document.getElementById('txtisin').focus();
            }
            
        }
                
function ShowHideShowDetail(obj)
        {
            if(obj=='h')
            {
                trshowDetail.style.display='none';
                tdsignaturepanel.style.display='none';
                document.getElementById("imgarrowdown").style.display='inline';
                document.getElementById("imgarrowup").style.display='none';
            }
            if(obj=='s')
            {
                trshowDetail.style.display='inline';
                tdsignaturepanel.style.display='inline';
                document.getElementById("imgarrowdown").style.display='none';
                document.getElementById("imgarrowup").style.display='inline';
               
            }
        }
 function OnChangeViewClick(obj)
 {
            if(obj=='h')
            {
                TABLE1.style.display='none';
                tblshortdetail.style.display='inline';
            }
            if(obj=='s')
            {
                TABLE1.style.display='inline';
                tblshortdetail.style.display='none';
                document.getElementById('ddltran').selectedIndex = 0;
                EntryTableInitialView();
            }
 }
 


function ShowHolding(s)
{
    if(s!=null)
    {   
        document.getElementById('bholding').innerHTML = s;
        document.getElementById('hiddenbholding').value = s;
        
    }
}
function AddButtonClick()
{
    var Length= document.getElementById("ddltran").options.length;
    var control = document.getElementById("ddltran"); 
    var value= control.options[control.selectedIndex].value; 
    //alert(Length +'~'+ control +'~'+ value);
    
    if( Length == '7')
    {
        if(value == '0')
        {
          ddlcheck('ddltran','transaction')
        }
        if(value == '1')
        {
            if(textboxcheck('TextBox3','SettlementFrom')) 
                if(textboxcheck('txtcmb','Cmbpid'))
                    if(textboxcheck('TextBox4','SettlementTo')) 
                        if(textboxcheck('txtisin','ISIN'))
                           if(textboxcheck('txtqty','Quantity'))
                                AfterAddButtonValidation();
        }
        if(value == '2')
        {
            if(textboxcheck('txtdpid','DPID'))
                if(textboxcheck('txtclient1','Client'))
                    if(CheckLegthTextBox('txtclient1','Client'))
                        if(textboxcheck('txtisin','ISIN'))
                            if(textboxcheck('txtqty','Quantity'))
                               AfterAddButtonValidation();
            
        }
        if(value == '3')
        {
            if(textboxcheck('TextBox3','SettlementFrom')) 
                if(textboxcheck('txtcmb','Cmbpid'))
                    if(textboxcheck('TextBox4','SettlementTo')) 
                        if(textboxcheck('txtisin','ISIN'))
                           if(textboxcheck('txtqty','Quantity'))
                                AfterAddButtonValidation();
        }
        if(value == '4')
        {
            if(textboxcheck('TextBox3','SettlementFrom') )
                if(textboxcheck('txtdpid','DPID'))
                    if(textboxcheck('txtclient1','Client'))
                        if(CheckLegthTextBox('txtclient1','Client'))
                            if(textboxcheck('txtisin','ISIN'))
                                if(textboxcheck('txtqty','Quantity'))
                                       AfterAddButtonValidation();
        }
        if(value == '5')
        {
            if(textboxcheck('TextBox3','SettlementFrom'))
                if(textboxcheck('TextBox4','SettlementTo'))
                    if(textboxcheck('txtisin','ISIN'))
                        if(textboxcheck('txtqty','Quantity')) 
                            if(textboxcomparison('TextBox3','SettlementFrom','TextBox4','SettlementTo'))
                                AfterAddButtonValidation();
        }
        if(value == '6')
        {
            if(textboxcheck('TextBox4','SettlementTo')) 
                    if(textboxcheck('txtisin','ISIN')) 
                        if(textboxcheck('txtqty','Quantity')) 
                            AfterAddButtonValidation();
        }
        if(value == '7')
        {
            if(textboxcheck('TextBox3','SettlementFrom')) 
                if(textboxcheck('txtcmb','Cmbpid'))
                    if(textboxcheck('TextBox4','SettlementTo')) 
                        if(textboxcheck('txtisin','ISIN'))
                           if(textboxcheck('txtqty','Quantity'))
                                AfterAddButtonValidation();
            
        }
         
    }
    else 
    {
        if(value == '0')
        {
          ddlcheck('ddltran','transaction')
        }
        if(value == '1')
        {
            if(textboxcheck('txtcmb','Cmbpid'))
                if(textboxcheck('TextBox4','SettlementTo'))
                    if(textboxcheck('txtisin','ISIN'))
                        if(textboxcheck('txtqty','Quantity'))
                            AfterAddButtonValidation(); 
            
            
        }
        if(value == '2')
        {
            if(textboxcheck('txtdpid','DPID'))
                if(textboxcheck('txtclient1','Client'))
                    if(CheckLegthTextBox('txtclient1','Client'))
                        if(textboxcheck('txtisin','ISIN'))
                            if(textboxcheck('txtqty','Quantity'))
                                if(cComboTrnsfrRsn.GetText()== "For Off-Market Sale / Purchase(2)")
                                {
                                    if(atextboxcheck(cTxtConsideration,'Consideration.'))
                                        if(atextboxcheck(cTxtTransfereeName,'Off Mkt Sale / Transferee Name.'))
                                            if(atextboxcheck(cDtIssueDate,'Issue Date.'))
                                                if(cComboPaymentMode.GetValue()!='C')
                                                {  
                                                    if(atextboxcheck(cTxtBankAcc,'Off Mkt Sale / Bank Account No.'))
                                                        if(atextboxcheck(cTxtBankName,'Off Mkt Sale / Bank Name.'))
                                                            //if(atextboxcheck(cTxtBranchName,'Off Mkt Sale / Branch Name.'))
                                                                if(atextboxcheck(cTxtChqRefNo,'Off Mkt Sale / Chq/Ref No.'))
                                                                    AfterAddButtonValidation();
                                                }
                                                else
                                                    AfterAddButtonValidation();                          
                                }
                                else
                                    AfterAddButtonValidation();                          
                
        }
        if(value == '3')
        {
            if(textboxcheck('txtcmb','Cmbpid'))
                if(textboxcheck('TextBox4','SettlementTo'))
                    if(textboxcheck('txtisin','ISIN'))
                        if(textboxcheck('txtqty','Quantity'))
                            AfterAddButtonValidation(); 
        }
        if(value == '4')
        {
            if(textboxcheck('txtdpid','DPID'))
                if(textboxcheck('txtclient1','Client'))
                    if(textboxcheck('txtisin','ISIN'))
                        if(textboxcheck('txtqty','Quantity'))
                            if(cComboTrnsfrRsn.GetText()== "For Off-Market Sale / Purchase(2)")
                            {
                                    if(atextboxcheck(cTxtConsideration,'Consideration.'))
                                        if(atextboxcheck(cTxtTransfereeName,'Off Mkt Sale / Transferee Name.'))
                                            if(atextboxcheck(cDtIssueDate,'Issue Date.'))
                                                if(cComboPaymentMode.GetValue()!='C')
                                                {  
                                                    if(atextboxcheck(cTxtBankAcc,'Off Mkt Sale / Bank Account No.'))
                                                        if(atextboxcheck(cTxtBankName,'Off Mkt Sale / Bank Name.'))
                                                            //if(atextboxcheck(cTxtBranchName,'Off Mkt Sale / Branch Name.'))
                                                                if(atextboxcheck(cTxtChqRefNo,'Off Mkt Sale / Chq/Ref No.'))
                                                                    AfterAddButtonValidation();
                                                }
                                                else
                                                    AfterAddButtonValidation();                          
                            }
                            else
                                AfterAddButtonValidation();                          
             
        }
    
    }    
    
        
    
}
function AfterAddButtonValidation()
{
    tdadd.style.display='none'
    tdnew.style.display='inline'
    document.getElementById('btnnew').focus();
    //settlegrid.PerformCallback('ConfirmHighTran~');
    //Pass Add Off Market Sale Info
    var offMktSale=cComboPaymentMode.GetValue()+'~'+cTxtTransfereeName.GetText()+'~'+cDtIssueDate.GetText()+'~'+cTxtBankAcc.GetText()+'~'+cTxtBankName.GetText()+'~'+cTxtBranchName.GetText()+'~'+cTxtChqRefNo.GetText()+'~'+cComboTrnsfrRsn.GetValue();
    //alert(offMktSale);
    settlegrid.PerformCallback('Add~'+offMktSale);
}
function combocheck(obj,value,objname)
{
    if(value == 'null')
    {
        var str='Please Choose '+objname;
        alert(str);
        obj.focus();
        return false; 
        
    }
    else 
    {
        return true;
    } 
    
}
function ddlcheck(obj,objname)
{
    var control = document.getElementById(obj); 
    var  value= control.options[control.selectedIndex].value; 
    if(value == '0')
    {
        var str='Please Choose '+objname;
        alert(str);
        document.getElementById(obj).focus(); 
        
    }
    else 
    {
        
    } 
    
}
function atextboxcheck(cObj,cObjname)
{
    var control = cObj.GetText(); 
   //alert(control.value);
   if(control.trim() == '')
   {
        var str='Please Enter '+ cObjname;
        alert(str);
        cObj.Focus(); 
        return false;
    }
    else 
    {
        return true;
    }
}
function textboxcheck(obj,objname)
{
   var control = document.getElementById(obj); 
   //alert(control.value);
   if(control.value=='' || control.value == 'No Record Found')
   {
        var str='Please Enter '+ objname;
        alert(str);
        document.getElementById(obj).focus(); 
        return false;
    }
    else 
    {
        return true;
    } 
}
function CheckLegthTextBox(obj,objname)
{
   var control = document.getElementById(obj); 
   var textvalue = (control.value); 
   //alert(textvalue);
   if((textvalue.length < 8)) 
   {
    var str='Please Enter Eight Digit Account No in '+ objname+' ID';
    alert(str);
    document.getElementById(obj).focus(); 
    return false; 
   }
   else
   {
    return true;
   } 
}
function textboxcomparison(txtobj1,txtobj1name,txtobj2,txtobj2name)
{
    var control1 = document.getElementById(txtobj1); 
    var control2 = document.getElementById(txtobj2); 
    //alert(control1.value+control2.value);
    if(control1.value==control2.value)
    {
        var ComboBoolValue=ComboBoxesValueComparison();
        //alert(ComboBoolValue);
        if(ComboBoolValue)
        {
            var str=txtobj1name +' and '+ txtobj2name+ ' are Same.';
            alert(str);
            document.getElementById(txtobj1).focus(); 
            return false;
        }
        else
        {
            return true;
        }
    }
    else 
    {
        return true;
    } 
}
function ComboBoxesValueComparison()
{
    var Combo1Value=ccmbmktfrom.GetText();
    var Combo2Value=cmbmarketto.GetText();
    //alert(Combo1Value+Combo2Value);
    if(Combo1Value==Combo2Value)
    {
        return true;
    }
    else 
    {
        return false;
    } 
}

function NewButtonClick()
{
    var ddlvalue=document.getElementById("hdntrantype").value;
    if(ddlvalue =='1' || ddlvalue=='3') //Market or InterDepository(Mkt)
    {
        SpecificRefreshControl();
        document.getElementById('txtisin').focus();
    }
    else
    {
        RefreshControl();
        document.getElementById('ddltran').focus();
    }
    tdadd.style.display='inline'
    tdnew.style.display='none'
    
}
function SaveButtonClick()
{
    //alert(settlegrid.GetVisibleRowsOnPage());
    if(settlegrid.GetVisibleRowsOnPage() != '0' )
    {
        settlegrid.PerformCallback('ConfirmHighTran~');
       
    }
    else
    {
        alert('Please Add Atleast Single Record First');
        document.getElementById('ddltran').focus();
    }
}
function AfterRecordSaveMsg(s)
{
    //alert(s);
    if(s!=null)
    {   
        s0=s.split('~')[0];
        s1=s.split('~')[1];
        //alert(s0+'~'+s1)
        var data='High Value Transaction!!!.Proceed?\nTotalSlipValue = '+s1;
        if(s0=='High Value Transaction')
        {
           var answer = confirm(data)
	       if (answer)
	       {
		    RefreshControl();
            TABLE1.style.display='inline';
            tblshortdetail.style.display='none';
            trshowDetail.style.display='none'; 
            tdsignaturepanel.style.display='none';
            tblentry.style.display='none';
            tblDetailsGrid.style.display='none';
            document.getElementById('txtSlip').focus();
            document.getElementById('txtSlip').value='';
            settlegrid.PerformCallback('Save~');
		   }
		}
		else if(s0=='Normal Transaction')
		{
		    RefreshControl();
            TABLE1.style.display='inline';
            tblshortdetail.style.display='none';
            trshowDetail.style.display='none'; 
            tdsignaturepanel.style.display='none';
            tblentry.style.display='none';
            tblDetailsGrid.style.display='none';
            document.getElementById('txtSlip').focus();
            document.getElementById('txtSlip').value='';
		    settlegrid.PerformCallback('Save~');
		}
	    else if(s0=='Record Successfully Inserted')
        {
            alert(s0);
        }
        else
        {
        }
    }
   
    
}

function CancelButtonClick()
{
   RefreshControl();
   tdadd.style.display='inline'
   tdnew.style.display='none'
   document.getElementById('ddltran').focus();
}
function CancelAllButtonClick()
{
    //alert(settlegrid.GetVisibleRowsOnPage());
    if(settlegrid.GetVisibleRowsOnPage() != '0' )
    {
        RefreshControl();
        tdadd.style.display='inline'
        tdnew.style.display='none'
        document.getElementById('ddltran').focus();
        settlegrid.PerformCallback('CancelAll~');
    }
    else
    {
        alert('There is No Record to Discard');
        document.getElementById('ddltran').focus();
    }
}
function onlyNumbers(evt)
{
	var e = event || evt; // for trans-browser compatibility
	var charCode = e.which || e.keyCode;

	if (charCode > 31 && (charCode < 48 || charCode > 57))
		return false;

	return true;

}
function checkIfNumeric(s){
     //This will alert if the value being passed in is numeric
     var value=document.getElementById(s).value;
     if(isNaN(value)){
         alert("Invalid Input. Only Numeric Value Required!!!");
         document.getElementById(s).value='';
         document.getElementById(s).focus();
     }
}
function letternumber(e)
{
var key;
var keychar;

if (window.event)
   key = window.event.keyCode;
else if (e)
   key = e.which;
else
   return true;
keychar = String.fromCharCode(key);
keychar = keychar.toLowerCase();

// control keys
if ((key==null) || (key==0) || (key==8) || 
    (key==9) || (key==13) || (key==27) )
   return true;

// alphas and numbers
else if ((("abcdefghijklmnopqrstuvwxyz0123456789").indexOf(keychar) > -1))
   return true;
else
   return false;
}


function blinkIt() 
{
    if (!document.all) return;
    else 
    {
      for(i=0;i<document.all.tags('blink').length;i++)
      {
        s=document.all.tags('blink')[i];
        s.style.visibility=(s.style.visibility=='visible') ?'hidden':'visible';
      }
    }
}
function OnExecDateValueChanged()
{
  var currentTime = new Date();
  var date = dtexec1.GetDate();
  if(currentTime<date)
  {           
  }
  else
  {                 
    dtexec1.SetDate(currentTime);  
  }
  document.getElementById("lbl_sdedate").innerText=dtexec1.GetText();
}
function ReceiveSvrData(rValue)
{
    var Data=rValue.split('~');
    var fld =  document.getElementById("txtclient1")
    if(Data[0]=='NoClients')
    {
       fld.detachEvent('onkeypress',letternumber);
       fld.attachEvent('onkeypress',onlyNumbers); 
       
    }
    else
    {
        fld.detachEvent('onkeypress', onlyNumbers);
        fld.attachEvent('onkeypress',letternumber); 
        
    }
}
function ShowAddDetal()
{
    cPopUp_AddDetail.Show();
    cComboPaymentMode.Focus();
    //'PopUp_AddDetail_ComboPaymentMode'
}
function btnOffMktOk_Click()
{
    cPopUp_AddDetail.Hide();
    cTxtConsideration.Focus();
}
function OnChange()
{
    if(cComboPaymentMode.GetValue()=="C")
    {
        TrNoCash1.style.visibility="hidden";
        TrNoCash2.style.visibility="hidden";
    }
    else
    {
        TrNoCash1.style.visibility="visible";
        TrNoCash2.style.visibility="visible";
    }
}


</script>

    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="s1" runat="server" EnablePageMethods="true">
            </asp:ScriptManager>
            <br />
           <div class="EHEADER" style="text-align:center">
           <strong><span id="SpanHeader" style="color: #000099">Delivery Instruction</span></strong>
                </div>
            <table style="width: 96%" id="TABLE1" border="1">
                <tr>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td colspan="2" style="font-weight: bold; text-transform: uppercase">
                    </td>
                    <td >
                    </td>
                    <td rowspan="1" valign="top">
                        <img id="imgarrowdown" src="../images/arrow_down.gif" alt="Show Detail" onclick="ShowHideShowDetail('s')"
                            style="cursor: pointer; display: none" />
                        <img id="imgarrowup" src="../images/arrow_up.gif" alt="Hide Detail" onclick="ShowHideShowDetail('h')"
                            style="cursor: pointer" />
                    </td>
                </tr>
                <tr>
                    <td valign="top" style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left;">
                        Slip Type :</td>
                    <td valign="top">
                        <dxe:ASPxComboBox ID="ddlSlipType" runat="server" ClientInstanceName="SlipType" EnableIncrementalFiltering="True"
                            EnableSynchronization="False" SelectedIndex="0" TabIndex="0" ValueType="System.String"
                            Width="182px" Font-Size="X-Small">
                            <Items>
                                <dxe:ListEditItem Text="Combined Instruction Slips" Value="1"></dxe:ListEditItem>
                                <dxe:ListEditItem Text="Combined Instruction Slips (CM)" Value="2"></dxe:ListEditItem>
                                <dxe:ListEditItem Text="Inter-Settlement" Value="3"></dxe:ListEditItem>
                                <dxe:ListEditItem Text="Delivery out [CM-Payin]" Value="4"></dxe:ListEditItem>
                                <dxe:ListEditItem Text="Delivery Out [CM Payout]" Value="5"></dxe:ListEditItem>
                                <dxe:ListEditItem Text="Pool-To-Pool Transfers" Value="6"></dxe:ListEditItem>
                                <dxe:ListEditItem Text="On Market" Value="7"></dxe:ListEditItem>
                                <dxe:ListEditItem Text="Off Market" Value="8"></dxe:ListEditItem>
                                <dxe:ListEditItem Text="Inter-Depository" Value="9"></dxe:ListEditItem>
                                <dxe:ListEditItem Text="Pledge&amp;Hypothecation" Value="10"></dxe:ListEditItem>
                                <dxe:ListEditItem Text="SLB Instructions" Value="11"></dxe:ListEditItem>
                                <dxe:ListEditItem Text="Demat Request Forms" Value="12"></dxe:ListEditItem>
                                <dxe:ListEditItem Text="Remat Request Forms" Value="13"></dxe:ListEditItem>
                                <dxe:ListEditItem Text="Delivery Instruction (On-Off Market)" Value="100" />
                                
                            </Items>
                        </dxe:ASPxComboBox>
                    </td>
                    <td valign="top" style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left;">
                        Slip Number :</td>
                    <td valign="top">
                        <asp:TextBox ID="txtSlip" runat="server"></asp:TextBox></td>
                    <td valign="top">
                        <dxe:ASPxButton ID="btnSave" runat="server" AutoPostBack="false" Text="Show" ValidationGroup="a"
                            OnClick="btnSave_Click">
                        </dxe:ASPxButton>
                    </td>
                    <td id="tdsignaturepanel" style="display: none" rowspan="6" valign="top">
                        <asp:Panel ID="Panel1" runat="server" Height="179px" ScrollBars="Auto" Width="423px">
                            <dxwgv:ASPxGridView ID="gridSign" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid"
                                KeyFieldName="doc_source" Width="100%">
                                <SettingsPager Visible="False">
                                </SettingsPager>
                                <Border BorderColor="#DDECFE"></Border>
                                <Columns>
                                    <dxwgv:GridViewDataTextColumn Caption="Signature" VisibleIndex="0">
                                        <DataItemTemplate>
                                            <a href="javascript:void(0);" onclick="Signature_PopUpCall('<%# Container.KeyValue %>')"
                                                tabindex="-1">
                                                <asp:Image ID="Image1" runat="server" TabIndex="-1" ImageUrl='<%# Eval("doc_source") %>' />
                                            </a>
                                        </DataItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                            </dxwgv:ASPxGridView>
                        </asp:Panel>
                    </td>
                </tr>
                <tr id="trshowDetail">
                    <td colspan="5" rowspan="5" valign="top">
                        <table style="height: 120px" border="1">
                            <tr>
                                <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left;">
                                    Client ID</td>
                                <td colspan="2">
                                    <asp:Label ID="txtClient" runat="server" Text="Label" Width="142%"></asp:Label></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                             <tr>
                                <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left;">
                                    Second Holder Name</td>
                                <td colspan="2">
                                    <asp:Label ID="lblSecondHolderName" runat="server" Text="None" Width="142%" ForeColor="Blue"></asp:Label></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                             <tr>
                                <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left;">
                                    Third Holder Name</td>
                                <td colspan="2">
                                    <asp:Label ID="lblThirdHolderName" runat="server" Text="None" Width="142%" ForeColor="Red"></asp:Label></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 11px; vertical-align: top; background-color: #b7ceec; text-align: left;">
                                    Last Trans Date</td>
                                <td colspan="3" style="height: 16px">
                                    <asp:Label ID="txtTransDate" runat="server" Text="Label" Width="20%"></asp:Label>
                                    <blink><b id="lbldormantStatus" runat="server" style="width:78%;font-weight:bold;color:Red;"></b></blink>
                                    <%--<asp:Label ID="lbldormantStatus" runat="server" ForeColor="Red" Font-Bold="True" Font-Size="Larger" Visible="False" Font-Underline="True" Width="78%"></asp:Label>--%>
                                </td>
                            </tr>
                            <tr>
                                <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left;">
                                    Ledger Balance</td>
                                <td colspan="3">
                                    <asp:Label ID="txtBal" runat="server" Text="Label" Width="100%"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="width: 100px; height: 14px;">
                                    <dxe:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="false" Text="Show Free Holding"
                                        ValidationGroup="a" Width="121px" Height="3px" ToolTip="Click to See Holding Detail">
                                        <ClientSideEvents Click="function(s, e) {showholding_pop();}"></ClientSideEvents>
                                    </dxe:ASPxButton>
                                </td>
                                <td style="width: 100px; height: 14px;" valign="top">
                                    Total No of ISIN :
                                </td>
                                <td style="width: 100px; height: 14px;" valign="top">
                                    <asp:Label ID="lbltotalIsin" runat="server" Text="0" Width="35%"></asp:Label></td>
                                <td style="width: 100px; height: 14px;">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <dxe:ASPxDateEdit ID="dttran" runat="server" ClientInstanceName="dttran1" DateOnError="Today"
                                        EditFormat="Custom" EditFormatString="dd-MM-yyyy" ReadOnly="True" TabIndex="-1"
                                        Width="140px">
                                        <DropDownButton Text="Trans.Date">
                                        </DropDownButton>
                                    </dxe:ASPxDateEdit>
                                </td>
                                <td style="width: 100px">
                                    <dxe:ASPxDateEdit ID="dtexec" runat="server" ClientInstanceName="dtexec1" DateOnError="Today"
                                        EditFormat="Custom" EditFormatString="dd-MM-yyyy" OnDateChanged="dtexec_DateChanged"
                                        TabIndex="0" UseMaskBehavior="True" Width="140px">
                                        <DropDownButton Text="Exec.Date">
                                        </DropDownButton>
                                        <ClientSideEvents DateChanged="OnExecDateValueChanged" />
                                    </dxe:ASPxDateEdit>
                                </td>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                        </table>
                        <a href="javascript:void(0);" onclick="OnAddButtonClick1( )"><span style="color: #000099;
                            text-decoration: underline">Show unsavedrecords</span> </a>
                    </td>
                </tr>
                <tr>
                </tr>
                <tr>
                </tr>
                <tr>
                </tr>
                <tr>
                </tr>
            </table>
            <table id="tblshortdetail" border="1" style="width: 912px; display: none">
                <tr>
                    <td style="width: 157px; height: 11px; vertical-align: top; background-color: #b7ceec; text-align: left;">
                        Client ID</td>
                    <td style="width: 186px; height: 18px">
                        <asp:Label ID="lbl_sdclientid" runat="server" Text="Label" Font-Bold="True" Width="250px"></asp:Label></td>
                    <td style="width: 189px; height: 11px; vertical-align: top; background-color: #b7ceec; text-align: left;">
                        Slip Type</td>
                    <td style="width: 412px; height: 18px;">
                        <asp:Label ID="lbl_sdsliptype" runat="server" Text="Label" Font-Bold="True" Width="210px"></asp:Label></td>
                    <td style="height: 11px; vertical-align: top; background-color: #b7ceec; text-align: left;">
                        SlipNumber</td>
                    <td style="width: 100px; height: 18px;">
                        <asp:Label ID="lbl_sdslipno" runat="server" Text="Label" Font-Bold="True" Width="43px"></asp:Label></td>
                    <td style="width: 112px; height: 18px">
                        <a href="javascript:void(0);" onclick="OnChangeViewClick('s')"><span style="color: #000099;
                            text-decoration: underline">ChangeView</span> </a>
                    </td>
                </tr>
                <tr>
                    <td style="width: 157px; height: 11px; vertical-align: top; background-color: #b7ceec; text-align: left;">
                        Trans. Date</td>
                    <td style="width: 186px; height: 16px">
                        <asp:Label ID="lbl_sdtdate" runat="server" Text="Label" Font-Bold="True"></asp:Label></td>
                    <td style="width: 189px; height: 11px; vertical-align: top; background-color: #b7ceec; text-align: left;">
                        Exec. Date</td>
                    <td style="width: 412px; height: 16px">
                        <div ID="lbl_sdedate" runat="server" style="font-weight:bold"></div></td>
                    <td style="width: 221px; height: 16px">
                    </td>
                    <td style="width: 100px; height: 16px">
                    </td>
                    <td style="width: 112px; height: 16px">
                    </td>
                </tr>
            </table>
        </div>
        <table id="tblentry" border="1" style="width: 838px">
            <tr>
                <td style="width: 309px; height: 18px;" valign="top">
                </td>
                <td style="width: 309px; height: 18px;" valign="top">
                </td>
                <td style="width: 309px; height: 18px;" valign="top">
                </td>
                <td style="width: 309px; height: 18px;" valign="top">
                </td>
            </tr>
            <tr>
                <td style="width: 150px; height: 11px; vertical-align: top; background-color: #b7ceec; text-align: left;" valign="top">
                    Trans. Type</td>
                <td style="width: 250px;" valign="top">
                    <asp:DropDownList ID="ddltran" runat="server" Width="166px" onchange="OnSelectedValueChanged(this.value);">
                    </asp:DropDownList>
                </td>
               
                <td id="tdrbtnNrmEarlyPayin" colspan="2" style="height: 1px; display: none" valign="top">
                    <div style="float: left">
                        <input type="radio" name="rbtnNrmEarlyPayin" value="1" checked="checked" />Normal
                        <input type="radio" name="rbtnNrmEarlyPayin" value="2" />Early-Payin
                    </div>
                    <div id="divOnMkt">
                        <input type="radio" name="rbtnNrmEarlyPayin" value="3" />On-Market</div>
                </td>
            </tr>
            <tr>
                <td style="width: 186px" valign="top">
                </td>
                <td style="width: 309px" valign="top">
                </td>
                <td style="width: 151px" valign="top">
                </td>
                <td valign="top">
                </td>
            </tr>
            <tr id="trMarketTypeToFrom">
                <td id="tdmkttypefrom" style="width: 157px; vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left;" valign="top">
                    Mkt Type From:</td>
                <td id="tdmkttypefrom1" style="width: 309px" valign="top">
                    <dxe:ASPxComboBox ID="cmbmktfrom" runat="server" EnableIncrementalFiltering="True"
                        Font-Bold="False" Font-Size="10px" ValueType="System.String" ClientInstanceName="ccmbmktfrom"
                        Width="166px" OnCallback="cmbmktfrom_Callback">
                    </dxe:ASPxComboBox>
                </td>
                <td id="tdsettlementfrom" style="width: 157px; vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left;" valign="top">
                    Settle. No From</td>
                <td id="tdsettlementfrom1" style="width: 309px" valign="top">
                    <asp:TextBox ID="TextBox3" runat="server" Width="300px" onkeypress="return onlyNumbers();"></asp:TextBox></td>
            </tr>
            <tr id="trDPidClientID">
                <td style="width: 157px; vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left;" valign="top">
                    Dp ID
                </td>
                <td style="width: 309px" valign="top">
                    <asp:TextBox ID="txtdpid" runat="server" onblur="showdrop('txtdpid');" onkeydown="hidedrop('txtdpid');"
                        Width="300px"></asp:TextBox></td>
                <td style="width: 157px; vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left;" valign="top">
                    Client ID</td>
                <td style="width: 309px" valign="top">
                    <asp:TextBox ID="txtclient1" runat="server" Width="300px" MaxLength="8"></asp:TextBox></td>
            </tr>
            <tr id="tCmAccExch">
                <td id="tdCmAccNo" style="width: 157px; height: 11px; vertical-align: top; background-color: #b7ceec; text-align: left;" valign="top">
                    CM Account</td>
                <td id="tdCmAccNo1" style="width: 309px;" valign="top">
                    <asp:TextBox ID="txtcmb" runat="server" Width="300px" Wrap="False"></asp:TextBox></td>
                <td id="tdExch" style="width: 157px; height: 11px; vertical-align: top; background-color: #b7ceec; text-align: left;" valign="top">
                    Exchange</td>
                <td id="tdExch1" valign="top">
                    <div id="P1" style="width: 100%">
                        <b id='boldStuff2'></b>
                    </div>
                </td>
            </tr>
            <tr>
                <td id="tdmkttypeto" style="width: 157px; vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left;" valign="top">
                    Mkt Type To</td>
                <td id="tdmkttypeto1" style="width: 309px" valign="top">
                    <dxe:ASPxComboBox ID="Cmbmarketto" runat="server" EnableIncrementalFiltering="True"
                        Font-Bold="False" Font-Size="10px" ValueType="System.String" ClientInstanceName="cmbmarketto"
                        OnCallback="Cmbmarketto_Callback" Width="166px">
                        <ClientSideEvents GotFocus="function(s, e) { s.GetInputElement().style.backgroundColor='#3564B0'
                                               s.GetInputElement().style.color ='#ffffff'  }" LostFocus="function(s, e) { s.GetInputElement().style.backgroundColor='#ffffff'
                                                s.GetInputElement().style.color ='#000000'  }"></ClientSideEvents>
                    </dxe:ASPxComboBox>
                </td>
                <td id="tdsettlementto" style="width: 157px; vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left;" valign="top">
                    Settle. No To</td>
                <td id="tdsettlementto1" valign="top">
                    <asp:TextBox ID="TextBox4" runat="server" Width="300px" onkeypress="return onlyNumbers();"></asp:TextBox></td>
            </tr>
            <tr id="trISIN">
                <td valign="top" style="width: 157px; height: 11px; vertical-align: top; background-color: #b7ceec; text-align: left;">
                    ISIN</td>
                <td style="width: 309px; height: 24px;" valign="top">
                    <asp:TextBox ID="txtisin" runat="server" onblur="showdrop('txtisin');" onkeydown="hidedrop('txtisin');"
                        Width="300px"></asp:TextBox>
                </td>
                <td valign="top" style="height: 24px" colspan="2">
                    <table border="1" width="100%">
                        <tr>
                            <td valign="top" style="height: 11px; width: 157px; vertical-align: top; background-color: #b7ceec; text-align: left;">
                                Free Holding</td>
                            <td valign="top" style="height: 24px; width: 112px;">
                                <div id="P2" style="float: left; width: 114px">
                                    <b id="bholding" runat="server"></b>
                                </div>
                            </td>
                            <td valign="top" style="width: 157px; height: 11px; vertical-align: top; background-color: #b7ceec; text-align: left;">
                                Quantity</td>
                            <td valign="top" style="height: 24px">
                                <asp:TextBox ID="txtqty" runat="server" Width="100px" onblur="return checkIfNumeric('txtqty');"></asp:TextBox></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr id="trinsttype">
                <td valign="top" style="vertical-align: top; width: 157px; height: 11px; background-color: #b7ceec; text-align: left">
                    Instruction type</td>
                <td valign="top">
                    <asp:RadioButtonList ID="rdbtninsttype" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="906" Selected="True">Reversible</asp:ListItem>
                        <asp:ListItem Value="912">Irreversible</asp:ListItem>
                    </asp:RadioButtonList></td>
                <td valign="top">
                </td>
                <td valign="top">
                </td>
            </tr>
            <tr>
                <td style=" height: 11px; vertical-align: top; background-color: #b7ceec; text-align: left;" valign="top">
                    DIS Type</td>
                <td valign="top">
                   <dxe:ASPxComboBox ID="ComboDISType" runat="server" ClientInstanceName="cComboDISType" EnableIncrementalFiltering="True"
                    EnableSynchronization="False" SelectedIndex="0" TabIndex="0" ValueType="System.String"
                    Width="150px" Font-Size="11px">
                         <Items>
                            <dxe:ListEditItem Text="Physical" Value="1"></dxe:ListEditItem>
                            <dxe:ListEditItem Text="FAX" Value="2"></dxe:ListEditItem>
                            <dxe:ListEditItem Text="E-SPEED" Value="3"></dxe:ListEditItem>
                            <dxe:ListEditItem Text="E-SPICE" Value="4"></dxe:ListEditItem>
                            <dxe:ListEditItem Text="E-DSC" Value="5"></dxe:ListEditItem>
                            <dxe:ListEditItem Text="E-OTHER" Value="6"></dxe:ListEditItem>
                         </Items>
                    </dxe:ASPxComboBox>
                </td>
            </tr>
            <tr id="trTrnsfrRsn">
                <td style=" height: 11px; vertical-align: top; background-color: #b7ceec; text-align: left;" valign="top">
                    Trans. Reason</td>
                <td valign="top">
                    <table>
                        <tr>
                            <td>
                                <dxe:ASPxComboBox ID="ComboTrnsfrRsn" runat="server" EnableIncrementalFiltering="True"
                                    Font-Bold="False" Font-Size="10px" ValueType="System.String" ClientInstanceName="cComboTrnsfrRsn"
                                    Width="150px" OnCallback="ComboTrnsfrRsn_Callback">
                                    <ClientSideEvents SelectedIndexChanged="onTrnsfrRsnChngd" />
                                </dxe:ASPxComboBox>
                            </td>
                            <td>
                                <a id="aAddDetail" runat="server" href="javascript:void(0);" onclick="ShowAddDetal()"
                                    style="text-decoration: underline; color: Blue; font-weight: bold">Add Detail</a>
                            </td>
                        </tr>
                    </table>
                </td>
                <td id="tdConsideration" style="width: 300px; height: 11px; vertical-align: top; background-color: #b7ceec; text-align: left;" valign="top">
                   Consideration</td>
                <td id="tdConsiderationtxt" style="width: 250px;" valign="top">
                     <dxe:ASPxTextBox ID="TxtConsideration" runat="server" ClientInstanceName="cTxtConsideration"
                            HorizontalAlign="left" Width="150px" MaxLength="15">
                     </dxe:ASPxTextBox>
                </td>
                <td id="tdTrnsfrRsnOthr" style="width: 300px; height: 11px; vertical-align: top; background-color: #b7ceec; text-align: left;" valign="top">
                    Reason(if Other)</td>
                <td id="tdTrnsfrRsnOthrTxt" style="width: 250px;" valign="top">
                     <dxe:ASPxTextBox ID="TxtReason" runat="server" ClientInstanceName="cTxtReason"
                            HorizontalAlign="left" Width="150px">
                     </dxe:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td valign="top" colspan="4">
                    <br />
                    <table style="width: 819px" border="1">
                        <tr>
                            <td id="tdadd" style="width: 100px; height: 16px">
                                <dxe:ASPxButton ID="btnadd" runat="server" AutoPostBack="false" TabIndex="0" Text="Add Entry To [L]ist"
                                    AccessKey="L" Width="150px">
                                    <ClientSideEvents Click="function(s, e) {AddButtonClick();}" />
                                </dxe:ASPxButton>
                            </td>
                            <td id="tdnew" style="width: 100px; height: 16px; display: none">
                                <dxe:ASPxButton ID="btnnew" runat="server" AutoPostBack="false" TabIndex="0" Text="[N]ew Entry"
                                    Width="150px" AccessKey="N" Font-Bold="False" Font-Underline="False" BackColor="Tan">
                                    <ClientSideEvents Click="function(s, e) {NewButtonClick();}" />
                                </dxe:ASPxButton>
                            </td>
                            <td style="width: 100px; height: 16px">
                                <dxe:ASPxButton ID="btncancel" runat="server" AutoPostBack="false" TabIndex="0" Text="[C]ancel Entry"
                                    AccessKey="C" Width="150px">
                                    <ClientSideEvents Click="function(s, e) {CancelButtonClick();}" />
                                </dxe:ASPxButton>
                            </td>
                            <td style="width: 100px; height: 16px">
                                <dxe:ASPxButton ID="btnSaveRecords" runat="server" AutoPostBack="false" TabIndex="0"
                                    Text="[S]ave Entered Records" AccessKey="S" Width="150px">
                                    <ClientSideEvents Click="function(s, e) {SaveButtonClick();}" />
                                </dxe:ASPxButton>
                            </td>
                            <td style="width: 100px; height: 16px">
                                <dxe:ASPxButton ID="btncancelall" runat="server" AutoPostBack="false" TabIndex="0"
                                    Text="[D]iscard Entered Records" AccessKey="D" AllowFocus="False" Width="150px">
                                    <ClientSideEvents Click="function(s, e) {CancelAllButtonClick();}" />
                                </dxe:ASPxButton>
                            </td>
                        </tr>
                    </table>
                    &nbsp; &nbsp;&nbsp;
                </td>
                <td valign="top">
                </td>
            </tr>
            <tr>
            </tr>
        </table>
        <table id="tblDetailsGrid" width="90%">
            <tr>
                <td colspan="6">
                    <dxwgv:ASPxGridView ID="DetailsGrid" runat="server" AutoGenerateColumns="False" ClientInstanceName="settlegrid"
                        KeyFieldName="ID" OnCustomCallback="DetailsGrid_CustomCallback" OnRowDeleting="DetailsGrid_RowDeleting"
                        Width="100%" OnCustomJSProperties="DetailsGrid_CustomJSProperties1">
                        <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" AllowGroup="False"
                            AllowSort="False"></SettingsBehavior>
                        <Styles>
                            <Header SortingImageSpacing="5px" ImageSpacing="5px">
                            </Header>
                            <FocusedGroupRow CssClass="gridselectrow">
                            </FocusedGroupRow>
                            <FocusedRow HorizontalAlign="Left" VerticalAlign="Top" CssClass="gridselectrow">
                            </FocusedRow>
                            <Footer CssClass="gridfooter">
                            </Footer>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                        </Styles>
                        <SettingsPager AlwaysShowPager="True" NumericButtonCount="20" PageSize="20" ShowSeparators="True">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                        <ClientSideEvents EndCallback="function(s, e) {AfterRecordSaveMsg(s.cpretValue);}"></ClientSideEvents>
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="ID" Caption="Sr.No" Visible="False" VisibleIndex="0">
                                <CellStyle Wrap="False" CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="TransactionTextValue" Caption="TransType"
                                VisibleIndex="1">
                                <CellStyle Wrap="False" CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="mkt" Caption="MktFrom" VisibleIndex="2">
                                <CellStyle Wrap="False" CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="settlefrom" Caption="Settle.From" VisibleIndex="3">
                                <CellStyle Wrap="False" CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="MarketToTextValue" Caption="MktTo" VisibleIndex="4">
                                <CellStyle Wrap="False" CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="SettlementToTextValue" Caption="Settle.To"
                                VisibleIndex="5">
                                <CellStyle Wrap="False" CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="DPIDClientIDWithSpace" Caption="CounterID"
                                VisibleIndex="6">
                                <CellStyle Wrap="False" CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="ISINTextValue" Caption="ISIN" VisibleIndex="7">
                                <CellStyle Wrap="False" CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="quantity" Caption="Qty" VisibleIndex="8">
                                <CellStyle Wrap="False" CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewCommandColumn VisibleIndex="9">
                                <DeleteButton Visible="True">
                                </DeleteButton>
                                <CellStyle ForeColor="White">
                                    <HoverStyle BackColor="#000040">      
                                    </HoverStyle>
                                </CellStyle>
                            </dxwgv:GridViewCommandColumn>
                        </Columns>
                    </dxwgv:ASPxGridView>
                </td>
            </tr>
            <tr>
                <td style="display: none" colspan="6">
                    <dxe:ASPxComboBox ID="cmbholding" runat="server" EnableIncrementalFiltering="True"
                        Font-Bold="False" Font-Size="10px" ValueType="System.String" ClientInstanceName="CIcmbholding"
                        Width="5px" OnCallback="cmbholding_Callback" OnCustomJSProperties="cmbholding_CustomJSProperties">
                        <ClientSideEvents EndCallback="function(s, e) {ShowHolding(s.cpretValue);}"></ClientSideEvents>
                    </dxe:ASPxComboBox>
                </td>
            </tr>
        </table>
        <dxpc:ASPxPopupControl ID="PopUp_AddDetail"  runat="server"  ClientInstanceName="cPopUp_AddDetail"
            HeaderText="Off Market Sale Detail" ShowSizeGrip="False" Width="692px" CloseAction="None" Font-Bold="True"  PopupHorizontalAlign="LeftSides" PopupVerticalAlign="TopSides" Modal="True">
            <ContentCollection>
                <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                    <table>
                        <tr>
                            <td>
                                Payment Mode</td>
                            <td>
                                <dxe:ASPxComboBox ID="ComboPaymentMode" runat="server" ClientInstanceName="cComboPaymentMode"
                                    EnableIncrementalFiltering="True" EnableSynchronization="False" SelectedIndex="0"
                                    TabIndex="0" ValueType="System.String" Width="205px" Font-Size="11px">
                                    <Items>
                                        <dxe:ListEditItem Text="Cash" Value="C"></dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Instrument" Value="I"></dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Eelctronic Payment" Value="E"></dxe:ListEditItem>
                                    </Items>
                                    <ClientSideEvents SelectedIndexChanged="function(s, e) {OnChange();}"></ClientSideEvents>
                                </dxe:ASPxComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Transferee Name</td>
                            <td>
                                <dxe:ASPxTextBox ID="TxtTransfereeName" runat="server" ClientInstanceName="cTxtTransfereeName"
                                    HorizontalAlign="left" Width="200px" MaxLength="135">
                                </dxe:ASPxTextBox>
                            </td>
                            <td>
                                Date Of Payment/Transfer</td>
                            <td>
                                <dxe:ASPxDateEdit ID="DtIssueDate" runat="server" ClientInstanceName="cDtIssueDate"
                                    DateOnError="Today" EditFormat="Custom" EditFormatString="dd-MM-yyyy" TabIndex="0"
                                    UseMaskBehavior="True" Width="205px">
                                </dxe:ASPxDateEdit>
                            </td>
                            
                        </tr>
                        <tr id="TrNoCash1">
                            <td>
                                Bank Account No</td>
                            <td>
                                <dxe:ASPxTextBox ID="TxtBankAcc" runat="server" ClientInstanceName="cTxtBankAcc"
                                    HorizontalAlign="left" Width="200px" MaxLength="30">
                                </dxe:ASPxTextBox>
                            </td>
                            <td>
                                Bank Name</td>
                            <td>
                                <dxe:ASPxTextBox ID="TxtBankName" runat="server" ClientInstanceName="cTxtBankName"
                                    HorizontalAlign="left" Width="200px" MaxLength="20">
                                </dxe:ASPxTextBox>
                            </td>
                        </tr>
                        <tr id="TrNoCash2">
                            <td>
                                Branch Name</td>
                            <td>
                                <dxe:ASPxTextBox ID="TxtBranchName" runat="server" ClientInstanceName="cTxtBranchName"
                                    HorizontalAlign="left" Width="200px" MaxLength="15">
                                </dxe:ASPxTextBox>
                            </td>
                            <td>
                                Cheque/Reference Number</td>
                            <td>
                                <dxe:ASPxTextBox ID="TxtChqRefNo" runat="server" ClientInstanceName="cTxtChqRefNo"
                                    HorizontalAlign="left" Width="200px" MaxLength="25">
                                </dxe:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px"></td>
                            <td id="TdCancel" style="width: 100px;"></td>
                            <td id="TdOk" style="width: 250px">
                                <dxe:ASPxButton ID="btnOffMktOk" runat="server" AutoPostBack="False" Text="Ok"
                                    Width="85px">
                                    <ClientSideEvents Click="function (s, e) {btnOffMktOk_Click();}" />
                                </dxe:ASPxButton>
                            </td>
                        </tr>
                    </table>
                </dxpc:PopupControlContentControl>
            </ContentCollection>
            <HeaderStyle BackColor="LightGray" ForeColor="Black" />
        </dxpc:ASPxPopupControl>
        
        <asp:HiddenField ID="hdnbplistcode" runat="server" />
        <asp:HiddenField ID="hdnotherddpid" runat="server" />
        <asp:HiddenField ID="hdntrantype" runat="server" />
        <asp:HiddenField ID="hiddensettleto" runat="server" />
        <asp:HiddenField ID="Hiddenhold" runat="server" />
        <asp:HiddenField ID="Hiddendpidm" runat="server" />
        <asp:HiddenField ID="hiddendpid" runat="server" />
        <asp:HiddenField ID="hiddensettlefrom" runat="server" />
        <asp:HiddenField ID="hiddenbenid" runat="server" />
        <asp:HiddenField ID="hiddenbholding" runat="server" />
        <asp:HiddenField ID="hdnrbtnNrmErlyvalue" runat="server" />
        <asp:HiddenField ID="hdnCHID" runat="server" />
        <asp:HiddenField ID="hdnCMID" runat="server" />
    </form>
    
           
       
</body>
</html>
