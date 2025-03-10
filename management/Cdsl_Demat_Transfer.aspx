<%@ page language="C#" autoeventwireup="true" inherits="management_Cdsl_Demat_Transfer, App_Web_lyh0nvfl" %>

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
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
     <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

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
      
        dttran1.SetDate(new Date()); 
    } 
    function height()
    {
        if(document.body.scrollHeight>=600)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '600px';
            window.frameElement.Width = document.body.scrollWidth;
    }   
    function showholding_pop()
    {
        var BenID=document.getElementById('hiddenbenid').value;
       
        BenID=BenID.substr(BenID.indexOf('[')+1,10);   
       
        //alert(dpid);
//        var url='frm_InstrunctionEntryShowHolding_popup.aspx?BenAccNo='+BenID;
         var url='frm_AccountTransfer_PopUp.aspx?BenAccNo='+BenID;
       
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
        //enabledisable();
        OnSelectionRefresh();
        OnSelectionMarketType();
        FormInitialView();
        //alert('pageload1');

       } 
       function height()
       {
       if(document.body.scrollHeight>=600)
        window.frameElement.height = document.body.scrollHeight;
       else
        window.frameElement.height = '600px';
        window.frameElement.Width = document.body.scrollWidth;
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
                function keyVal(objval)
                {   
                     
                    document.getElementById('tdIsinDetails').innerHTML='<a href="javascript:void(0);" onclick="ShowIsin(' + objval + ');"><span style="color: #000099;text-decoration: underline">Isin&nbsp;Details</span></a>';
                                           
                }
        function OnSelectedValueChanged(obj)
        {
            var ddlvalue=obj;
            //var ddlslipvalue=SlipType.GetValue();
          
            document.getElementById("hdntrantype").value=ddlvalue;
            tdadd.style.display='inline'
            tdnew.style.display='none'
            ////            alert(ddlslipvalue);
//           
            
//            var ddltopic = document.getElementById("<%=ddltran.ClientID%>");
//            var ddltext = ddltran.options[ddltran.selectedIndex].text; 

            //alert(ddltext);
//            document.getElementById('spnheader').innerText = ddltext;
            if(ddlvalue =='0') //Select
            {
               trIsin.style.display='none';
              trDrfNo.style.display='none';
              trDispatchDoc.style.display='none';
              trDispatchDate.style.display='none';
              trLockinCodRem.style.display='none';
              trLockinExpDt.style.display='none';
               document.getElementById('drpLockinStatus').selectedIndex = 0;
              OnSelectionSelect();
            }
            else if (ddlvalue == '1') //Demat
            {
              OnSelectionRefresh();
              OnSelectionMarketType();
              OnChangeViewClick('h');
              RefreshControl();
              trIsin.style.display='inline';
              trDrfNo.style.display='inline';
              trDispatchDoc.style.display='inline';
              trDispatchDate.style.display='inline';
              trLockinCodRem.style.display='none';
              trLockinExpDt.style.display='none';
              TABLE1.style.display='none';
            }
            
           
            else
            {
                OnSelectionRefresh();
                RefreshControl();
            }
            
        }
        function OnSelectionRefresh()
        {
        
         trIsin.style.display='inline';
       
         //*trinsttype.style.display='inline';

         tdrbtnNrmEarlyPayin.style.display='none';
         
        
        }
        function OnSelectionMarketType()
        {
         
           var Length= document.getElementById("ddltran").options.length;
           //alert(Length)
           
//            trDPidClientID.style.display='none';
            //*trinsttype.style.display='none';

//            if('<%= dp %>'=='CDSL')
//            {
//                //tdrbtnNrmEarlyPayin.style.display='inline';
//                var DivOnMkt = document.getElementById("divOnMkt");
//                DivOnMkt.style.display='inline';
//            }
//            else
//            {
//                var DivOnMkt = document.getElementById("divOnMkt");
//                DivOnMkt.style.display='none';
//            }
           
            
        }
        function OnSelectionOffMarketType()
        {
         var Length= document.getElementById("ddltran").options.length;
           //alert(Length)
           
        }
        function OnSelectionInterDp_Mkt()
        {
         var Length= document.getElementById("ddltran").options.length;
           //alert(Length)
//           if('<%= dp %>'=='NSDL')
//           {
//            tdrbtnNrmEarlyPayin.style.display='inline';
//            var DivOnMkt = document.getElementById("divOnMkt");
//            DivOnMkt.style.display='none';
//           }
           
//            trDPidClientID.style.display='none';
           //* trinsttype.style.display='none';

          
        }
        function OnSelectionInterDp_OffMkt()
        {
          var Length= document.getElementById("ddltran").options.length;
           //alert(Length)
           
          
            //* trinsttype.style.display='none';
             
            
        }
        function OnSelectionInterSet()
        {
//         trDPidClientID.style.display='none';
        //* trinsttype.style.display='none';

         
        }
        function OnSelectionDeliveryOut()
        {
//         trDPidClientID.style.display='none';

        }
        
        function OnSelectionCMPoolToPool()
        {
//         trDPidClientID.style.display='none';
         //*trinsttype.style.display='none';
//         if('<%= dp %>'=='CDSL')
//         {
//            tdrbtnNrmEarlyPayin.style.display='inline';
//            var DivOnMkt = document.getElementById("divOnMkt");
//            DivOnMkt.style.display='none';
//         }
         RefreshControl();
       //  cmbmarketto.PerformCallback(' ~RefreshControl');
         
        }
        function OnSelectionSelect()
        {
            EntryTableInitialView();
        }
        function EntryTableInitialView()
        {
     
        //* trDPidClientID.style.display='none';
       
        //* trinsttype.style.display='none';
            trIsin.style.display='none';
            trDrfNo.style.display='none';
            trDispatchDoc.style.display='none';
            trDispatchDate.style.display='none';
            
        
        }
        function FormInitialView()
        {
           trshowDetail.style.display='none'; 
           tdsignaturepanel.style.display='none';
           tblentry.style.display='none';
           tblDetailsGrid.style.display='none';
           document.getElementById('txtAccountNo').focus();
        }
        function AfterShowClickView_IfSlipExist()
        {
           
           trshowDetail.style.display='inline';
           tdsignaturepanel.style.display='inline';
           trshowDetail.style.display='inline'; 
           tblentry.style.display='inline';
           tblDetailsGrid.style.display='inline';
           trLockinCodRem.style.display='none';
           trLockinExpDt.style.display='none';
           EntryTableInitialView();
           
        }
        function RefreshControl()
        {
       // document.getElementById('TextBox3').value='';
       //* document.getElementById('txtdpid').value='';
       //* document.getElementById('txtclient1').value='';
       //* document.getElementById('txtdpid').value='';


            
            
            
        }
        function SpecificRefreshControl() //When Transaction is Market or InterDP(Mkt)
        {
//         document.getElementById('txtisin').value='';
//         document.getElementById('txtqty').value='';
//         document.getElementById('boldStuff2').innerHTML = '';
//         document.getElementById('bholding').innerHTML = '';   
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
//            else
//            {
//             document.getElementById('txtisin').focus();
//            }
            
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
                trLockinCodRem.style.display='none';
                trLockinExpDt.style.display='none';
                EntryTableInitialView();
                document.getElementById('drpLockinStatus').selectedIndex = 0;
            }
 }
 


function ShowHolding(s)
{
    if(s!=null)
    {   
//        document.getElementById('bholding').innerHTML = s;
        document.getElementById('hiddenbholding').value = s;
        
    }
}
function AddButtonClick()
{
     
        var Length= document.getElementById("ddltran").options.length;
        var control = document.getElementById("ddltran"); 
        var value= control.options[control.selectedIndex].value; 
        //alert(Length + control + value);
                    
            if(value == '0')
            {
              ddlcheck('ddltran','transaction')
            }
            if(value == '1')
            {
                if(textboxcheck('txtIsin','Isin'))
                    if(textboxcheck('txtDRFNumber','DRF Number'))
                        if(textboxcheck('txtNoOfCertificate','No of Certificate'))
                            {
                              var drplockin=document.getElementById('drpLockinStatus');
                              var lockinval=control.options[drplockin.selectedIndex].value;
                              
                              if(lockinval==1)
                                {
                                if(textboxcheck('txtLockinCode','Lockin code'))
                                    if(textboxcheck('txtLockinRemark','Lockin Remark'))
                                        AfterAddButtonValidation(); 
                                 }
                                 else
                                    AfterAddButtonValidation(); 
                            }
                
                            
            }
            if(value == '2')
            {
                AfterAddButtonValidation(); 
                    
            }
                
             
    
}
function AfterAddButtonValidation()
{
   // btnadd.SetEnabled(false);
    tdadd.style.display='none'
    tdnew.style.display='inline'
    document.getElementById('btnnew').focus();
    //settlegrid.PerformCallback('ConfirmHighTran');
    settlegrid.PerformCallback('Add');
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



function NewButtonClick()
{
   
    var ddlvalue=document.getElementById("hdntrantype").value;
    if(ddlvalue =='1') 
    {
        SpecificRefreshControl();
        document.getElementById('txtIsin').value='';
        document.getElementById('txtDRFNumber').value='';
        document.getElementById('txtNoOfCertificate').value='';
        document.getElementById('txtDispatchDocId').value='';
        document.getElementById('txtDispatchName').value='';
        document.getElementById('txtLockinCode').value='';
        document.getElementById('txtLockinRemark').value='';
        aspxQuantity.SetText('0000000000000000');
        document.getElementById('drpLockinStatus').selectedIndex = 0;
        trLockinCodRem.style.display='none';
        trLockinExpDt.style.display='none';
        document.getElementById('txtIsin').focus();

    }
    else if(ddlvalue =='3' || ddlvalue=='4') 
    {
        if('<%= dp %>'=='NSDL')
        {
            RefreshControl();
            document.getElementById('ddltran').focus();
        }
        else
        {
            SpecificRefreshControl();
//            document.getElementById('txtisin').focus();
        }
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

     var Length= document.getElementById("ddltran").options.length;
        var control = document.getElementById("ddltran"); 
        var value= control.options[control.selectedIndex].value; 
        //alert(Length + control + value);
        
            if(value == '0')
            {
              ddlcheck('ddltran','transaction')
            }
            
            if(value == '1')
            {
                
                if(textboxcheck('txtIsin','Isin'))
                    if(textboxcheck('txtDRFNumber','DRF Number'))
                        if(textboxcheck('txtNoOfCertificate','No of Certificate'))
                            {
                              var drplockin=document.getElementById('drpLockinStatus');
                              var lockinval=control.options[drplockin.selectedIndex].value;
                              
                              if(lockinval==1)
                                {
                                if(textboxcheck('txtLockinCode','Lockin code'))
                                    if(textboxcheck('txtLockinRemark','Lockin Remark'))
                                        settlegrid.PerformCallback('Save'); 
                                 }
                                 else
                                    settlegrid.PerformCallback('Save'); 
                            }
               
                    
            }
                       
    

}
function AfterRecordSaveMsg(s)
{
//    alert(s);
    if(s!=null)
    {   
      alert(s);
      if(s=='Successfully saved')
        {
            
           trIsin.style.display='inline';
           tdrbtnNrmEarlyPayin.style.display='none';
           trshowDetail.style.display='none'; 
           tdsignaturepanel.style.display='none';
           tblentry.style.display='none';
           tblDetailsGrid.style.display='none';
           TABLE1.style.display='inline';
           tblshortdetail.style.display='none';
           dttran1.SetDate(new Date()); 
           dtDispatchDate1.SetDate(new Date());
           dtLockinExp.SetDate(new Date());
           
            document.getElementById('txtIsin').value='';
            document.getElementById('txtDRFNumber').value='';
            document.getElementById('txtNoOfCertificate').value='';
            document.getElementById('txtDispatchDocId').value='';
            document.getElementById('txtDispatchName').value='';
            document.getElementById('txtLockinCode').value='';
            document.getElementById('txtLockinRemark').value='';
            document.getElementById('txtAccountNo').value='';
            aspxQuantity.SetText('0000000000000000');
            document.getElementById('drpLockinStatus').selectedIndex = 0;
             document.getElementById('txtAccountNo').focus();
//            trLockinCodRem.style.display='none';
//            trLockinExpDt.style.display='none';
        }
    }
   
    
}

function CancelButtonClick()
{
   RefreshControl();
   tdadd.style.display='inline'
   tdnew.style.display='none'
   document.getElementById('ddltran').focus();
   settlegrid.PerformCallback('Cancel');
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
        settlegrid.PerformCallback('CancelAll');
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

function ShowDebitExist()
{
    trDebitExist.style.display='inline';

}
function HidDebitExist()
{
    trDebitExist.style.display='none';


}


  
  function ShowMsg(msg)
  {
  
    alert(msg);
  
  }
  
  function CallAjaxdpid(obj1,obj2,obj3)
                {                     
                    
                    var ddlex1 = document.getElementById("hdnbplistcode").value;
                    var trantype=document.getElementById("hdntrantype").value;
                    var BenAccNo=document.getElementById('hiddenbenid').value;
                    
                    //alert(ddlmkt1+'~'+ddlex1+'~'+document.getElementById("txtdpid3").value);                                     
                    ajax_showOptions(obj1,obj2,obj3,'0~'+ddlex1+'~'+'IN3'+'~'+trantype+'~'+BenAccNo,'Main');
                    //alert(document.getElementById('hiddensettlefrom').value);
                }
                
      function CallAjaxclient(obj1,obj2,obj3)
                {
                 
                 //var Variable1 = document.getElementById('hiddendpid').value;
                 var Variable1 = '<%=Session["usersegid"] %>';
                 var trantype=1;
//                  var trantype=document.getElementById("hdntrantype").value;
                  //alert(Variable1+'~'+document.getElementById('hiddendpid').value+'~'+document.getElementById('hiddenbenid').value);                                
                  ajax_showOptions(obj1,obj2,obj3,'IN3'+'~'+Variable1+'~'+trantype+'~[ 00000000 ]','Main');
                }
    </script>
    
    
    <script language="javascript" type="text/javascript">
	     
    function FetchAccountNo(obj1,obj2,obj3)
        {
           var Variable1 = '<%=Session["usersegid"] %>';
          var strQuery_Table = "Master_CdslClients";
           var strQuery_FieldName = " top 10 (substring(CdslClients_boid,len(CdslClients_boid)-7,8)+' ['+CdslClients_firstholdername+']') as clientname,CdslClients_boid+CdslClients_ExchangeID as clientid";
           var strQuery_WhereClause = " (substring(CdslClients_boid,len(CdslClients_boid)-7,8)like (\'%RequestLetter%\') or CdslClients_firstholdername  like (\'%RequestLetter%\')) and (substring(CdslClients_boid,1,8)= '" + Variable1 + "' and substring(CdslClients_boid,len(CdslClients_boid)-7,8)<>'00000000' and CdslClients_bostatus not like '%Clearing Member%' and CdslClients_accountstatus='Active') ";
           var strQuery_OrderBy='';
           var strQuery_GroupBy='';
           var CombinedQuery=new String(strQuery_Table+"$"+strQuery_FieldName+"$"+strQuery_WhereClause+"$"+strQuery_OrderBy+"$"+strQuery_GroupBy);
           ajax_showOptions(obj1,obj2,obj3,replaceChars(CombinedQuery));   
        
        
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
        
        function FetchLockinCode(obj1,obj2,obj3)
        {
          
          var strQuery_Table = "master_cdslStaticDataCode";
           var strQuery_FieldName = " top 10 CdslStaticData_Description+' ['+rtrim(ltrim(CdslStaticData_TypeCode))+']' as LockinDesc,CdslStaticData_TypeCode as LockinCode";
           var strQuery_WhereClause = " cdslstaticData_FieldName like 'Lockin%' and ( (CdslStaticData_Description like (\'%RequestLetter%\') or CdslStaticData_TypeCode like (\'%RequestLetter%\'))) ";;
           var strQuery_OrderBy='';
           var strQuery_GroupBy='';
           var CombinedQuery=new String(strQuery_Table+"$"+strQuery_FieldName+"$"+strQuery_WhereClause+"$"+strQuery_OrderBy+"$"+strQuery_GroupBy);
           ajax_showOptions(obj1,obj2,obj3,replaceChars(CombinedQuery));   
        
        
        }
        
        function FetchIsin(obj1,obj2,obj3)
        {
          
          var strQuery_Table = "master_cdslisin";
           var strQuery_FieldName = " distinct top 10 (cdslisin_number+' [ '+cdslisin_shortname+' ]') as isinnumber,cdslisin_id ";
           var strQuery_WhereClause = " cdslisin_isinstatusdescription in ('Active','Inactive')  and ( (cdslisin_number like (\'%RequestLetter%\') or cdslisin_shortname like (\'%RequestLetter%\'))) ";;
           var strQuery_OrderBy='';
           var strQuery_GroupBy='';
           var CombinedQuery=new String(strQuery_Table+"$"+strQuery_FieldName+"$"+strQuery_WhereClause+"$"+strQuery_OrderBy+"$"+strQuery_GroupBy);
           ajax_showOptions(obj1,obj2,obj3,replaceChars(CombinedQuery),'Main');   
           
        }
        function ChangeLockinStat(val)
            {
               
                if(val=='Y')
                    {
                        document.getElementById('trLockinCodRem').style.display='inline';
                        document.getElementById('trLockinExpDt').style.display='inline';
                    
                    }
                 else
                    {
                        document.getElementById('trLockinCodRem').style.display='none';
                        document.getElementById('trLockinExpDt').style.display='none';
                    
                    }
            
            
            }
            
       function FilterInput (event) {
            var chCode = ('charCode' in event) ? event.charCode : event.keyCode;

               
            return (chCode >= 48  && chCode <= 57);
        }
       function ShowIsin(id)
        {
//        var url='cdslISINShowDetails.aspx?&Id=21461';
           var url='cdslISINShowDetails.aspx?&Id='+ id;
         parent.OnMoreInfoClick(url,"Details Isin",'940px','450px',"Y"); 
        
        }
        
       
	</script>
    <form id="form1" runat="server">
        <div>
        
         <div style="width: 100%; font-weight: bold; text-align: center">
                Demat Transfer</div>
            <table border="1" style="width: 96%" id="TABLE1">
                <tr>
                    <td style="width: 51px">
                    </td>
                    <td style="width: 32px">
                    </td>
                    <td colspan="2" style="font-weight: bold; text-transform: uppercase">
                    </td>
                    <td style="width: 7px">
                    </td>
                    <td rowspan="1" style="width: 129px" valign="top">
                        <img id="imgarrowdown" src="../images/arrow_down.gif" alt="Show Detail" onclick="ShowHideShowDetail('s')"
                            style="cursor: pointer; display: none" />
                        <img id="imgarrowup" src="../images/arrow_up.gif" alt="Hide Detail" onclick="ShowHideShowDetail('h')"
                            style="cursor: pointer" />
                    </td>
                </tr>
                <tr>
                    <td valign="top" style="width: 66px; height:30px">
                        Account No :</td>
                    <td valign="top" style="width: 190px">
                        <asp:TextBox ID="txtAccountNo" Width="210px" runat="Server"></asp:TextBox>
                      <br /> <asp:RequiredFieldValidator ID="reqAccountNo" runat="server" ControlToValidate="txtAccountNo" ErrorMessage="Enter account no" Display="dynamic" SetFocusOnError="true" ValidationGroup="a"></asp:RequiredFieldValidator>
                    </td>
                    <td valign="top" style="width: 76px">
                        <dxe:ASPxButton ID="btnSave" runat="server" AutoPostBack="false" Text="Show" ValidationGroup="a"
                            OnClick="btnSave_Click">
                            
                        </dxe:ASPxButton>
                        </td>
                    <td valign="top" style="width: 148px">
                       
                      
                      </td>
                    <td valign="top">
                       
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td valign="top">
                         
                    </td>
                    <td valign="top">
                        
                    </td>
                    <td valign="top">
                         
                    </td>
                    <td>
                        
                    </td>
                    <td>
                    
                    </td>
                    <td id="tdsignaturepanel" style="display:none"  rowspan="6" valign="top">
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
                                <td style="width: 100px">
                                    Client ID</td>
                                <td colspan="2">
                                    <asp:Label ID="txtClient" runat="server" Text="Label" Width="142%"></asp:Label></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                             <tr>
                                <td style="width: 100px">
                                    Second Holder Name</td>
                                <td colspan="2">
                                    <asp:Label ID="lblSecondHolderName" runat="server" Text="None" Width="142%" ForeColor="Blue"></asp:Label></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                             <tr>
                                <td style="width: 100px">
                                    Third Holder Name</td>
                                <td colspan="2">
                                    <asp:Label ID="lblThirdHolderName" runat="server" Text="None" Width="142%" ForeColor="Red"></asp:Label></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px; height: 16px;">
                                    Last Trans Date</td>
                                <td colspan="3" style="height: 16px">
                                    <asp:Label ID="txtTransDate" runat="server" Text="Label" Width="20%"></asp:Label>
                                    <blink><b id="lbldormantStatus" runat="server" style="width:78%;font-weight:bold;color:Red;"></b></blink>
                                    <%--<asp:Label ID="lbldormantStatus" runat="server" ForeColor="Red" Font-Bold="True" Font-Size="Larger" Visible="False" Font-Underline="True" Width="78%"></asp:Label>--%>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
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
                                    
                                </td>
                                <td style="width: 100px; height: 14px;" valign="top">
                                    </td>
                                <td style="width: 100px; height: 14px;">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <dxe:ASPxDateEdit ID="dttran" runat="server" ClientInstanceName="dttran1" DateOnError="Today"
                                        EditFormat="Custom" EditFormatString="dd-MM-yyyy"  TabIndex="-1"
                                        Width="140px">
                                        <DropDownButton Text="Setup.Date">
                                        </DropDownButton>
                                    </dxe:ASPxDateEdit>
                                </td>
                                <td style="width: 100px">
                                    
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
                    <td style="width: 168px; height: 18px;">
                        Client ID</td>
                    <td style="width: 186px; height: 18px">
                        <asp:Label ID="lbl_sdclientid" runat="server" Text="Label" Font-Bold="True" Width="250px"></asp:Label></td>
                    <td style="width: 129px; height: 18px;">
                        </td>
                    <td style="width: 412px; height: 18px;">
                        </td>
                    <td style="width: 221px; height: 18px;">
                        </td>
                    <td style="width: 100px; height: 18px;">
                        </td>
                    <td style="width: 112px; height: 18px">
                        <a href="javascript:void(0);" onclick="OnChangeViewClick('s')"><span style="color: #000099;
                            text-decoration: underline">ChangeView</span> </a>
                    </td>
                </tr>
                <tr>
                    <td style="width: 168px; height: 16px">
                        Trans. Date</td>
                    <td style="width: 186px; height: 16px">
                        <asp:Label ID="lbl_sdtdate" runat="server" Text="Label" Font-Bold="True"></asp:Label></td>
                    <td style="width: 129px; height: 16px">
                        </td>
                    <td style="width: 412px; height: 16px">
                        
                     </td>   
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
                <td style="width: 186px; height: 18px;" valign="top">
                </td>
                <td style="width: 309px; height: 18px;" valign="top">
                </td>
                <td style="width: 151px; height: 18px;" valign="top">
                </td>
                <td style="width: 309px; height: 18px;" valign="top">
                </td>
                <td style="width:150px"></td>
            </tr>
            <tr>
                <td style="width: 186px; height: 1px;" valign="top">
                    Trans. Type</td>
                <td style="width: 309px;" valign="top">
                    <asp:DropDownList ID="ddltran" runat="server" Width="166px" onchange="OnSelectedValueChanged(this.value);">
                    </asp:DropDownList></td>
                <td id="tdrbtnNrmEarlyPayin"  style="width: 151px;height: 1px; display: none" valign="top">
                    
                </td>
                <td style="width: 309px"></td>
                <td style="width:150px"></td>
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
                <td></td>
            </tr>
           
            <tr id="trIsin">
                <td style="width: 186px" valign="top">
                   Isin
                </td>
                <td style="width: 309px" valign="top">
                    <asp:TextBox ID="txtIsin" runat="server" Width="300px"></asp:TextBox></td>
                <td style="width: 151px" valign="top">
                    Quantity
                    </td>
                <td style="width: 309px" valign="top">
                    <dxe:ASPxTextBox ID="aspxQuantity" runat="server" Width="300px">
                            <MaskSettings Mask="<0..9999999999999g>.<000..999>" IncludeLiterals="DecimalSymbol" />
                        </dxe:ASPxTextBox>
                    </td>
                    <td style="width:150px" id="tdIsinDetails">
                        
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
                <td></td>
            </tr>
             <tr id="trDrfNo" >
                <td style="width: 186px" valign="top">
                    DRF Number
                </td>
                <td style="width: 309px" valign="top">
                    <asp:TextBox ID="txtDRFNumber" runat="server" Width="300px" MaxLength="10"></asp:TextBox>
                        
                 </td>
                <td style="width: 151px" valign="top">
                     Number of Certificates
                 </td>
                <td style="width: 309px" valign="top">
                     <asp:TextBox ID="txtNoOfCertificate" runat="server" 
                        Width="300px" onkeypress="return FilterInput(event)" MaxLength="5"></asp:TextBox>
                 </td>
                 <td></td>
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
                <td></td>
            </tr>
            
             <tr id="trDispatchDoc" >
                <td style="width: 186px" valign="top">
                   Dispatch Document ID
                </td>
                <td style="width: 309px" valign="top">
                    <asp:TextBox ID="txtDispatchDocId" runat="server" Width="300px" MaxLength="16"></asp:TextBox>
                   </td>
                <td style="width: 151px" valign="top">
                 Dispatch Name
                   </td>
                <td style="width: 309px" valign="top">
                     <asp:TextBox ID="txtDispatchName" runat="server" 
                        Width="300px" MaxLength="30"></asp:TextBox>
                    </td>
                    <td></td>
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
                <td></td>
            </tr>
            
              <tr id="trDispatchDate" >
                <td style="width: 186px" valign="top">
                   Dispatch Date
                </td>
                <td style="width: 309px" valign="top">
                    <dxe:ASPxDateEdit ID="dtDispatchDate" runat="server" ClientInstanceName="dtDispatchDate1" DateOnError="Today"
                                        EditFormat="Custom" EditFormatString="dd-MM-yyyy"  TabIndex="-1"
                                        Width="140px">
                                        <DropDownButton Text="Date">
                                        </DropDownButton>
                                    </dxe:ASPxDateEdit>
                   </td>
                <td style="width: 151px" valign="top">
                     Lock-in Status
                   </td>
                <td style="width: 309px" valign="top">
                     <asp:DropDownList ID="drpLockinStatus" runat="server" onchange="ChangeLockinStat(this.value);">
                        <asp:ListItem Value="N" Text="Free"></asp:ListItem>
                        <asp:ListItem Value="Y" Text="Lock-in"></asp:ListItem>
                    </asp:DropDownList>
                    </td>
                    <td></td>
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
                <td></td>
            </tr>
            
             <tr id="trLockinCodRem" >
                <td  style="width: 186px" valign="top">
                     Lock-in Code
                </td>
                <td  style="width: 309px" valign="top">
                    <asp:TextBox ID="txtLockinCode" onkeyup="FetchLockinCode(this,'GenericAjaxList',event)" runat="server" 
                        Width="300px" MaxLength="2" ></asp:TextBox>
                    </td>
                <td  style="width: 151px" valign="top">
                     Lock-in Remark 
                  </td>
                <td  style="width: 309px" valign="top">
                    <asp:TextBox ID="txtLockinRemark" runat="server" 
                        Width="300px" MaxLength="50"></asp:TextBox>
                    </td>
                    <td></td>
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
                <td></td>
            </tr>
            
            <tr id="trLockinExpDt" >
                <td style="width: 186px" valign="top">
                   Lock-in Expiry Date
                </td>
                <td style="width: 309px" valign="top">
                    <dxe:ASPxDateEdit ID="dtLockinExp" runat="server" ClientInstanceName="dtLockinExp" DateOnError="Today"
                                        EditFormat="Custom" EditFormatString="dd-MM-yyyy"  TabIndex="-1"
                                        Width="140px">
                                        <DropDownButton Text="Date">
                                        </DropDownButton>
                                    </dxe:ASPxDateEdit>
                    </td>
                <td style="width: 151px" valign="top">
                 
                 </td>
                <td style="width: 309px" valign="top">
                
                    </td>
                    <td></td>
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
                <td></td>
            </tr>
            
                        
            <tr>
                <td valign="top" colspan="5">
                    <br />
                    <table style="width: 819px">
                        <tr>
                            <td id="tdadd" style="width: 100px; height: 16px">
                                <dxe:ASPxButton ID="btnadd" runat="server" ClientInstanceName="btnadd" AutoPostBack="false" TabIndex="0" Text="Add Entry To [L]ist"
                                    AccessKey="L" Width="165px" ToolTip="Add Current Entry( Above in  Form) into List Below.[Alt+L]">
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
                                    AccessKey="C" Width="165px" ToolTip="Cancel & Reset Current Entry in Above Form.  [Alt+C]">
                                    <ClientSideEvents Click="function(s, e) {CancelButtonClick();}" />
                                </dxe:ASPxButton>
                            </td>
                            <td style="width: 100px; height: 16px">
                                <dxe:ASPxButton ID="btnSaveRecords" runat="server" AutoPostBack="false" TabIndex="0"
                                    Text="[S]ave Entered Records" AccessKey="S" Width="165px" ToolTip="Save All Records(if Exists) in List Below. [Alt+S]">
                                    <ClientSideEvents Click="function(s, e) {SaveButtonClick();}" />
                                </dxe:ASPxButton>
                            </td>
                            <td style="width: 100px; height: 16px">
                                
                            </td>
                        </tr>
                    </table>
                    &nbsp; &nbsp;&nbsp;
                </td>
              
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
                        <SettingsPager AlwaysShowPager="True" NumericButtonCount="20" PageSize="10" ShowSeparators="True">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                        <ClientSideEvents EndCallback="function(s, e) {AfterRecordSaveMsg(s.cpsavemsg);}"></ClientSideEvents>
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="ID" Caption="Sr.No" Visible="False" VisibleIndex="0">
                                <CellStyle Wrap="False" CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="TransactionType" Caption="TransType"
                                VisibleIndex="1">
                                <CellStyle Wrap="False" CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            
                           
                            <dxwgv:GridViewDataTextColumn FieldName="Isin" Caption="ISIN" VisibleIndex="2">
                                <CellStyle Wrap="False" CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Quantity" Caption="Quantity" VisibleIndex="3">
                                <CellStyle Wrap="False" CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                             <dxwgv:GridViewDataTextColumn FieldName="SlipNo" Caption="Slip No" VisibleIndex="4">
                                <CellStyle Wrap="False" CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                             <dxwgv:GridViewDataTextColumn FieldName="NoOfCertificate" Caption="No Of Certificate" VisibleIndex="5">
                                <CellStyle Wrap="False" CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                              <dxwgv:GridViewDataTextColumn FieldName="DispatchDocId" Caption="DispatchDoc Id" VisibleIndex="6">
                                <CellStyle Wrap="False" CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="DispatchName" Caption="Dispatch Name" VisibleIndex="7">
                                <CellStyle Wrap="False" CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                              <dxwgv:GridViewDataTextColumn FieldName="LockinStatus" Caption="Lockin Status" VisibleIndex="8">
                                <CellStyle Wrap="False" CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                                   <dxwgv:GridViewDataTextColumn FieldName="LockinCode" Caption="Lockin Code" VisibleIndex="9">
                                <CellStyle Wrap="False" CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="LockinRemark" Caption="Lockin Remark" VisibleIndex="10">
                                <CellStyle Wrap="False" CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                           <dxwgv:GridViewCommandColumn VisibleIndex="11">
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
        <asp:HiddenField ID="txtLockinCode_hidden" runat="server" />
        <asp:HiddenField ID="txtisin_hidden" runat="Server" />
    </form>
</body>
</html>
