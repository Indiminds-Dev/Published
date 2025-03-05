<%@ page language="C#" autoeventwireup="true" inherits="Reports_PortfolioPerformanceFO_New_Beta, App_Web_dwbygqb3" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>Portfolio Performance Report</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>
    <script type="text/javascript" src="../CentralData/JSScript/GenericJScript.js"></script>
    <script language="javascript" type="text/javascript" src="../CentralData/JSScript/timeSolver.min.js"></script>

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
		z-index:32767;
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
		z-index:3000;
	}
	
	form{
		display:inline;
	}
	
  .grid_scroll
    {
        overflow-y: no;  
        overflow-x: scroll; 
        width:80%;
        scrollbar-base-color: #C0C0C0;
    
    }
	</style>
 <script language="javascript" type="text/javascript">

  
    function Page_Load()///Call Into Page Load
    {
         Hide('showFilter');
         Hide('td_filter');
          Hide('td_sendmail');
          Hide('tr_mail');
         //New Work 11/05/2023
         Hide('Tr_Broker');
         Hide('Tr_Custodians');
         Hide('tr_ExcelEmail');
         document.getElementById('ddlGeneration').value=1;
         //End of New Work 11/05/2023
         //New Work 13/09/2023
         Hide('Td_ExpiryDate');
         //End of New Work 13/09/2023
//         New Work 09/08/2024
         Hide('td_Reset');
//         End of New Work 09/08/2024
         document.getElementById('hiddencount').value=0;
         FnDateChange('0');
         FnddlGeneration('1');  
         height();
         
    }
   function height()
        {
            if(document.body.scrollHeight>=450)
            {
                window.frameElement.height = document.body.scrollHeight;
            }
            else
            {
                window.frameElement.height = '450px';
            }
//            window.frameElement.width = document.body.scrollwidth;
        }
    function Hide(obj)
            {
             document.getElementById(obj).style.display='none';
            }
    function Show(obj)
            {
             document.getElementById(obj).style.display='inline';
            }
    
    function FunClientScrip(objID,objListFun,objEvent)
        {
          var cmbVal;
         
            if(document.getElementById('cmbsearchOption').value=="Clients")
            {
                if(document.getElementById('ddlGroup').value=="0" || document.getElementById('ddlGroup').value=="2")//////////////Group By  selected are branch
                {
                    if(document.getElementById('ddlGroup').value=="0")
                    {
                        if(document.getElementById('rdbranchAll').checked==true)
                           {
                               //New Work
                               //cmbVal='ClientsBranch'+'~'+'ALL';
                               //New Work 11/05/2023
//                               cmbVal='ClBrCuBranch'+'~'+'ALL';
                               cmbVal='ClientsBranch'+'~'+'ALL';
                               //End of New Work 11/05/2023
                               //End of New Work
                           }
                       else
                           {
                               //New Work
                               //cmbVal='ClientsBranch'+'~'+'Selected'+'~'+document.getElementById('HiddenField_Branch').value;
                               //New Work 11/05/2023
//                               cmbVal='ClBrCuBranch'+'~'+'Selected'+'~'+document.getElementById('HiddenField_Branch').value;
                               cmbVal='ClientsBranch'+'~'+'Selected'+'~'+document.getElementById('HiddenField_Branch').value;
                               //End of New Work 11/05/2023
                               //End of New Work
                           }
                    }
                    if(document.getElementById('ddlGroup').value=="2")
                    {
                       if(document.getElementById('rdbranchAll').checked==true)
                           {
                               //New Work
                               //cmbVal='ClientsBranchGroup'+'~'+'ALL';
                               //New Work 11/05/2023
//                               cmbVal='ClBrCuBranchGroup'+'~'+'ALL';
                               cmbVal='ClientsBranchGroup'+'~'+'ALL';
                               //End of New Work 11/05/2023
                               //End of New Work
                           }
                       else
                           {
                               //New Work
                               //cmbVal='ClientsBranchGroup'+'~'+'Selected'+'~'+document.getElementById('HiddenField_BranchGroup').value;
                               //New Work 11/05/2023
//                               cmbVal='ClBrCuBranchGroup'+'~'+'Selected'+'~'+document.getElementById('HiddenField_BranchGroup').value;
                               cmbVal='ClientsBranchGroup'+'~'+'Selected'+'~'+document.getElementById('HiddenField_BranchGroup').value;
                               //End of New Work 11/05/2023
                               //End of New Work
                           }
                    }
                }
               else //////////////Group By selected are Group
                {
                   if(document.getElementById('rdddlgrouptypeAll').checked==true)
                       {
                           //New Work
                           //cmbVal='ClientsGroup'+'~'+'ALL'+'~'+document.getElementById('ddlgrouptype').value;
                           //New Work 11/05/2023
//                           cmbVal='ClBrCuGroup'+'~'+'ALL'+'~'+document.getElementById('ddlgrouptype').value;
                           cmbVal='ClientsGroup'+'~'+'ALL'+'~'+document.getElementById('ddlgrouptype').value;
                           //End of New Work 11/05/2023
                           //End of New Work
                       }
                   else
                       {
                           //New Work
                           //cmbVal='ClientsGroup'+'~'+'Selected'+'~'+document.getElementById('HiddenField_Group').value;
                           //New Work 11/05/2023
//                           cmbVal='ClBrCuGroup'+'~'+'Selected'+'~'+document.getElementById('HiddenField_Group').value;
                           cmbVal='ClientsGroup'+'~'+'Selected'+'~'+document.getElementById('HiddenField_Group').value;
                           //End of New Work 11/05/2023
                           //End of New Work
                       }
               }
            }
           
            else 
            {
                cmbVal=document.getElementById('cmbsearchOption').value;
                cmbVal=cmbVal+'~'+document.getElementById('ddlgrouptype').value;
            }
          
          ajax_showOptions(objID,objListFun,objEvent,cmbVal);

        }
       //New Work 11/05/2023
       function  fnddlview(obj)
       {
           if(obj=="1")
           {
           Show('Tr_Clients');
           Hide('Tr_Broker');
           Hide('Tr_Custodians');
           }
           else if(obj=="2")
           {
           Hide('Tr_Clients');
           Show('Tr_Broker');
           Hide('Tr_Custodians');
           }
           else
           {
           Hide('Tr_Clients');
           Hide('Tr_Broker');
           Show('Tr_Custodians');
           }
       }
       //End of New Work 11/05/2023
        
        function fnClients(obj)
        {
             if(obj=="a")
                Hide('showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='Clients';
                  Show('showFilter');
             }
             selecttion();
        }
        //New Work 11/05/2023
        function fnbroker(obj)
        {
             if(obj=="a")
                Hide('showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='Broker';
                  Show('showFilter');
             }
        }
        
        function fncustodians(obj)
        {
             if(obj=="a")
                Hide('showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='Custodians';
                  Show('showFilter');
             }
        }
        //End of New Work 11/05/2023
        function FnAsset(obj)
           {
                    if(obj=="a")
                        Hide('showFilter');
                     else
                     {
                          var cmb=document.getElementById('cmbsearchOption');
                          cmb.value='Product';
                          Show('showFilter');
                     }
                     selecttion();
                     height();
           }
   
      
     
      function fnBranch(obj)
      {
            if(obj=="a")
                Hide('showFilter');
             else
             {
                   if(document.getElementById('ddlGroup').value=="0")
                   {
                    document.getElementById('cmbsearchOption').value='Branch';
                   }
                   if(document.getElementById('ddlGroup').value=="2")
                   {
                    document.getElementById('cmbsearchOption').value='BranchGroup';
                   }

                  Show('showFilter');
             }
         selecttion();
      }
     function fnGroup(obj)
      {
            if(obj=="a")
                Hide('showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='Group';
                  Show('showFilter');
             }
           selecttion();
      }
    function btnAddsubscriptionlist_click()
            {
            
                var cmb=document.getElementById('cmbsearchOption');
                        var userid = document.getElementById('txtSelectionID');
                        if(userid.value != '')
                        {
                            var ids = document.getElementById('txtSelectionID_hidden');
                            var listBox = document.getElementById('lstSlection');
                            var tLength = listBox.length;
                           
                            
                            var no = new Option();
                            no.value = ids.value;
                            no.text = userid.value;
                            listBox[tLength]=no;
                            var recipient = document.getElementById('txtSelectionID');
                            recipient.value='';
                        }
                        else
                            alert('Please search name and then Add!')
                        var s=document.getElementById('txtSelectionID');
                        s.focus();
                        s.select();
                   
            }
        
      function clientselectionfinal()
	        {
	            var listBoxSubs = document.getElementById('lstSlection');
	          
                var cmb=document.getElementById('cmbsearchOption');
                var listIDs='';
                var i;
                if(listBoxSubs.length > 0)
                {  
                           
                    for(i=0;i<listBoxSubs.length;i++)
                    {
                        if(listIDs == '')
                            listIDs = listBoxSubs.options[i].value+';'+listBoxSubs.options[i].text;
                        else
                            listIDs += ',' + listBoxSubs.options[i].value+';'+listBoxSubs.options[i].text;
                    }
                    var sendData = cmb.value + '~' + listIDs;
                    CallServer(sendData,"");
                   
                }
	            var i;
                for(i=listBoxSubs.options.length-1;i>=0;i--)
                {
                    listBoxSubs.remove(i);
                }
            
                Hide('showFilter');
                document.getElementById('btnScreen').disabled=false;
	        }
	     
	        
	   function btnRemovefromsubscriptionlist_click()
            {
                
                var listBox = document.getElementById('lstSlection');
                var tLength = listBox.length;
                
                var arrTbox = new Array();
                var arrLookup = new Array();
                var i;
                var j = 0;
                for (i = 0; i < listBox.options.length; i++) 
                {
                    if (listBox.options[i].selected && listBox.options[i].value != "") 
                    {
                        
                    }
                    else 
                    {
                        arrLookup[listBox.options[i].text] = listBox.options[i].value;
                        arrTbox[j] = listBox.options[i].text;
                        j++;
                    }
                }
                listBox.length = 0;
                for (i = 0; i < j; i++) 
                {
                    var no = new Option();
                    no.value = arrLookup[arrTbox[i]];
                    no.text = arrTbox[i];
                    listBox[i]=no;
                }
            }
    
    function fnExpiry(obj)
   {
//        New Work 13/09/2023
//        if(obj=="a")
//            Hide('showFilter');
//         else
//         {
//              var cmb=document.getElementById('cmbsearchOption');
//              cmb.value='Expiry';
//              Show('showFilter');
//         }
         if(obj=="a")
            {
                Hide('showFilter');
                Hide('Td_ExpiryDate');
             }
         else if(obj=="c")
            {
                Hide('showFilter');
                Show('Td_ExpiryDate');  
            }
         else
         {
              var cmb=document.getElementById('cmbsearchOption');
              cmb.value='Expiry';
              Show('showFilter');
              Hide('Td_ExpiryDate');
         }
//         End of New Work 13/09/2023
         selecttion();
         height();
   
   }
   function  fnddlGroup(obj)
   {
        if(obj=="0" || obj=="2")
        {
            Hide('td_group');
            Show('td_branch');
        }

        else
        {
            Show('td_group');
            Hide('td_branch');
            var btn = document.getElementById('btnhide');
            btn.click();
        }
       selecttion();
   }
   function fngrouptype(obj)
   {
       if(obj=="0")
       {
       Hide('td_allselect');
        alert('Please Select Group Type !');
       }
       else
       {
       Show('td_allselect');
       }
      selecttion();
   }
   
  function FnddlGeneration(obj)
  {
    if(obj=="1")
    {
        Show('td_Screen');
        Hide('td_Export');
        Hide('td_sendmail');
        Hide('tr_mail');
       //New Work 11/05/2023
       Hide('td_exportmultiplefile');
       Hide('td_exportmultiplefilegrp');
       Hide('tr_ExcelEmail');
       Hide('td_sendemail');
       Hide('td_sendemailgrp');
       //End of New Work 11/05/2023
//       New Work 09/08/2024
       Hide('Td_ChargeBrkUp');
       document.getElementById('chkChargeBrkUp').checked=false;
       Hide('td_btnprint');
       Hide('td_ChkDISTRIBUTION');
//       End of New Work 09/08/2024
//       New Work 21/11/2024
       Show('Td_DoNotShowAssetWiseTot');
//       document.getElementById('chkDoNotShowAssetWiseTot').checked=false;
//       End of New Work 21/11/2024
    }
    if(obj=="2")
    {
        Hide('td_Screen');
        Show('td_Export');
        Hide('td_sendmail');
        Hide('tr_mail');
        //New Work 11/05/2023
       Hide('td_exportmultiplefile');
       Hide('td_exportmultiplefilegrp');
       Hide('tr_ExcelEmail');
       Hide('td_sendemail');
       Hide('td_sendemailgrp');
       //End of New Work 11/05/2023
//       New Work 09/08/2024
       Show('Td_ChargeBrkUp');
       Hide('td_btnprint');
       Hide('td_ChkDISTRIBUTION');
       HideShow('td_Reset', 'H');
//       End of New Work 09/08/2024
//       New Work 21/11/2024
       Show('Td_DoNotShowAssetWiseTot');
//       End of New Work 21/11/2024
    }
    //New Work 11/05/2023
//    if(obj=="3")
    if(obj=="3")
    {
        Hide('td_Screen');
        Hide('td_Export');
        Hide('td_sendmail');
        Hide('tr_mail');
        Show('td_exportmultiplefile');
        Hide('td_exportmultiplefilegrp');
        Hide('tr_ExcelEmail');
        Hide('td_sendemail');
        Hide('td_sendemailgrp');
//       New Work 09/08/2024
        Show('Td_ChargeBrkUp');
        Hide('td_btnprint');
        Hide('td_ChkDISTRIBUTION');
        HideShow('td_Reset', 'H');
//       End of New Work 09/08/2024
//       New Work 21/11/2024
       Show('Td_DoNotShowAssetWiseTot');
//       End of New Work 21/11/2024
    }
     if(obj=="4")
    {
        Hide('td_Screen');
        Hide('td_Export');
        Hide('td_sendmail');
        Hide('tr_mail');
        Hide('td_exportmultiplefile');
        Show('td_exportmultiplefilegrp');
        Show('tr_ExcelEmail');
        Hide('td_sendemail');
        Hide('td_sendemailgrp');
//       New Work 09/08/2024
        Show('Td_ChargeBrkUp');
        Hide('td_btnprint');
        Hide('td_ChkDISTRIBUTION');
        HideShow('td_Reset', 'H');
//       End of New Work 09/08/2024  
//       New Work 21/11/2024
       Show('Td_DoNotShowAssetWiseTot');
//       End of New Work 21/11/2024      
    }
    if(obj=="5")
    //End of New Work 11/05/2023
    {
        Hide('td_Screen');
        Hide('td_Export');
        Show('td_sendmail');
        Show('tr_mail');  
        //New Work 11/05/2023
       Hide('td_exportmultiplefile');
       Hide('td_exportmultiplefilegrp');
       Hide('tr_ExcelEmail');
       Hide('td_sendemail');
       Hide('td_sendemailgrp');
       //End of New Work 11/05/2023
//       New Work 09/08/2024
       Show('Td_ChargeBrkUp');
       Hide('td_btnprint');
       Hide('td_ChkDISTRIBUTION');
       HideShow('td_Reset', 'H');
//       End of New Work 09/08/2024
//       New Work 21/11/2024
       Show('Td_DoNotShowAssetWiseTot');
//       End of New Work 21/11/2024     
    }
    //New Work 11/05/2023
    if(obj=="6")
    {
        Hide('td_Screen');
        Hide('td_Export');
        Hide('td_sendmail');
        Hide('tr_mail');  
        Hide('td_exportmultiplefile');
        Hide('td_exportmultiplefilegrp');
        Hide('tr_ExcelEmail');
        Show('td_sendemail');
        Hide('td_sendemailgrp');
//       New Work 09/08/2024
        Show('Td_ChargeBrkUp');
        Hide('td_btnprint');
        Hide('td_ChkDISTRIBUTION');
        HideShow('td_Reset', 'H');
//       End of New Work 09/08/2024
//       New Work 21/11/2024
       Show('Td_DoNotShowAssetWiseTot');
//       End of New Work 21/11/2024
    }
    if(obj=="7")
    {
        Hide('td_Screen');
        Hide('td_Export');
        Hide('td_sendmail');
        Hide('tr_mail');  
        Hide('td_exportmultiplefile');
        Hide('td_exportmultiplefilegrp');
        Show('tr_ExcelEmail');
        Hide('td_sendemail');
        Show('td_sendemailgrp');
//       New Work 09/08/2024
        Show('Td_ChargeBrkUp');
        Hide('td_btnprint');
        Hide('td_ChkDISTRIBUTION');
        HideShow('td_Reset', 'H');
//       End of New Work 09/08/2024
//       New Work 21/11/2024
       Show('Td_DoNotShowAssetWiseTot');
//       End of New Work 21/11/2024
    }
    //End of New Work 11/05/2023
//       New Work 09/08/2024    
    if(obj=="8")
    {
        Hide('td_Screen');
        Hide('td_Export');
        Hide('td_sendmail');
        Hide('tr_mail');  
        Hide('td_exportmultiplefile');
        Hide('td_exportmultiplefilegrp');
        Hide('tr_ExcelEmail');
        Hide('td_sendemail');
        Hide('td_sendemailgrp');
        Show('Td_ChargeBrkUp');
        Show('td_btnprint');
        Show('td_ChkDISTRIBUTION');
        HideShow('td_Reset', 'H');
//       New Work 21/11/2024
       Show('Td_DoNotShowAssetWiseTot');
//       End of New Work 21/11/2024        
    }
//       End of New Work 09/08/2024   
       Hide('showFilter');
       height();
  }
 
  function heightlight(obj)
   {
      
        var colorcode=obj.split('&');
        
         if((document.getElementById('hiddencount').value)==0)
         {
            prevobj='';
            prevcolor='';
            document.getElementById('hiddencount').value=1;
         }
          document.getElementById(obj).style.backgroundColor='#ffe1ac';
         
          if(prevobj!='')
          {
            document.getElementById(prevobj).style.backgroundColor=prevcolor;
          }
          prevobj=obj;
          prevcolor=colorcode[1];

    } 
     function fn_Terminal(obj)
       {
                if(obj=="a")
                    Hide('td_terminaltxt');
                 else
                      Show('td_terminaltxt');
                 selecttion();
                 height();
       }
      function fnexpirtycallajax(objID,objListFun,objEvent)
     {
         var date;
         if(document.getElementById('ddldate').value=='0')
         {
            date=new Date(DtFor.GetDate());
            date=parseInt(date.getMonth()+1)+'-'+date.getDate()+'-'+ date.getFullYear();
         }
         else
         {
            date=new Date(DtFrom.GetDate());
            date=parseInt(date.getMonth()+1)+'-'+date.getDate()+'-'+ date.getFullYear();
         }
         ajax_showOptions(objID,'Searchproductandeffectuntil',objEvent,'Expiry'+'~'+date);
     }
     function fnTerminalcallajax(objID,objListFun,objEvent)
     {
         var datefrom;
         var dateto;
         var date;
         
            datefrom=new Date(DtFrom.GetDate());
            dateto=new Date(DtTo.GetDate());
            
            datefrom=parseInt(datefrom.getMonth()+1)+'-'+datefrom.getDate()+'-'+ datefrom.getFullYear();
            dateto=parseInt(dateto.getMonth()+1)+'-'+dateto.getDate()+'-'+ dateto.getFullYear();
                 
         date= "'"+datefrom +"' and '" + dateto +"'";
         ajax_showOptions(objID,'ShowClientFORMarginStocks',objEvent,'TerminalIdDate'+'~'+date);
     }
    
     function ajaxcall(objID,objListFun,objEvent)
     {
        
        if(document.getElementById('cmbsearchOption').value=="Expiry")
        {
            fnexpirtycallajax(objID,objListFun,objEvent);
        }
        else if(document.getElementById('cmbsearchOption').value=="Product")
        {
        
            ajax_showOptions(objID,'Searchproductandeffectuntil',objEvent,'Product');
        }
        else
        {
            FunClientScrip(objID,objListFun,objEvent);
        }
     }
  function selecttion()
  {
     var combo=document.getElementById('cmbExport');
     combo.value='Ex';
  } 
   function fnddloptionformail(obj)
  {
    if(obj=='2')
    {
         var cmb=document.getElementById('cmbsearchOption');
         cmb.value='MAILEMPLOYEE';
         Show('showFilter');
    }
    else
        Hide('showFilter');
  }
  
  function ChnagePlaces() {
        var country = $("[id*=ddldate] option:selected").val();
        $('[id*=ddlGeneration] option').each(function () {
            if (country != $(this).val() && $(this).val() != 0) {
                $(this).hide();
            }
            else {
                $(this).show();
            }
        });
        return false;
    }
 function FnDateChange(obj)
 {
    if(obj=="0")
    {
        Show('Td_For');
        Hide('Td_From');
        Hide('Td_To');
        Hide('Tr_DatePeriod');
        Hide('Td_IncludeCharge');
        Hide('Td_IncludeInterest');
//        New Work 09/08/2024
        document.getElementById('ChkIncludeCharges').checked=false;
        fn_UncheckChargeBrkUp();
        ChnagePlaces();
//        End of New Work 09/08/2024
    }
    if(obj=="1")
    {
        Hide('Td_For');
        Show('Td_From');
        Show('Td_To');
        Show('Tr_DatePeriod');
        Show('Td_IncludeCharge');
        Show('Td_IncludeInterest');
//        New Work 09/08/2024
        fn_UncheckChargeBrkUp();
        ChnagePlaces();
//        End of New Work 09/08/2024
    }
 }
//    New Work 09/08/2024
    function fn_UncheckChargeBrkUp()
    {
        if(document.getElementById('ChkIncludeCharges').checked==true)
        {
            if(document.getElementById('ddlGeneration').value=='1')
            {
                document.getElementById('chkChargeBrkUp').checked=false;
                Hide('Td_ChargeBrkUp');
            }
            else
            {
                Show('Td_ChargeBrkUp');
            }
        }
        else
        {
            Hide('Td_ChargeBrkUp');
            document.getElementById('chkChargeBrkUp').checked=false;
        }
        selecttion();
        height();
    }

    function fn_CheckCharge()
    {
        if(document.getElementById('chkChargeBrkUp').checked==true)
        {
            document.getElementById('ChkIncludeCharges').checked=true;
        }
        selecttion();
        height();
    }
//    End of New Work 09/08/2024
 function FnIgnoreBfPostion()
 {
    if(document.getElementById('ChkBfPosition').checked==true)
    {
        Show('tr_Terminalid');
        Hide('Td_ValuebfPostionAtPrevClose');
      
    }
    else
    {
        Hide('tr_Terminalid');
        Show('Td_ValuebfPostionAtPrevClose');
    }
 }
  function checkall()
   {
      Show('td_spotconsolidated');
   }
  function uncheckall()
   {
     Hide('td_spotconsolidated');    
   }
 function FnRptView(obj)
 {
    if(obj=="1")
    {
        Show('Td_IncludeCharge');
        Show('Td_IncludeInterest');
//        New Work 11/05/2023
        document.getElementById('tr_ExcelEmail').disabled=false;
//        End of New Work 11/05/2023
         document.getElementById('tr_mail').disabled=false;
        document.getElementById('btnmail').disabled=false;
//        New Work 09/08/2024
         Show('Td_ChargeBrkUp');
//         End of New Work 09/08/2024        
    }
    if(obj=="2")
    {
        Hide('Td_IncludeCharge');
        Hide('Td_IncludeInterest');
//        New Work 11/05/2023
        document.getElementById('tr_ExcelEmail').disabled=true;
//        End of New Work 11/05/2023
        document.getElementById('tr_mail').disabled=true;
        document.getElementById('btnmail').disabled=true;
//        New Work 09/08/2024
         Hide('Td_ChargeBrkUp');
         document.getElementById('chkChargeBrkUp').checked=false;
//         End of New Work 09/08/2024        
         //Hide('btnmail');
    }
 }
 function FnRptType(obj)
 {
    if(obj=="1")
    {
        Show('Td_Sign');
        Show('Td_OpenPosition');
//         Show('tr_mail');
//         Show('btnmail');  
//        New Work 11/05/2023
//        document.getElementById('tr_ExcelEmail').disabled=false;
//        End of New Work 11/05/2023
         document.getElementById('tr_mail').disabled=false;
        document.getElementById('btnmail').disabled=false;
//        New Work 09/08/2024
        if(document.getElementById('ddlGeneration').value=="1")
        {
            Hide('Td_ChargeBrkUp');
            document.getElementById('chkChargeBrkUp').checked=false;
        }
        else
        {
            Show('Td_ChargeBrkUp');
        }
//         End of New Work 09/08/2024        
    }
    if(obj=="2")
    {
        Hide('Td_Sign');
        Hide('Td_OpenPosition');
//        New Work 11/05/2023
//        document.getElementById('tr_ExcelEmail').disabled=true;
//        End of New Work 11/05/2023        
          document.getElementById('tr_mail').disabled=true;
        document.getElementById('btnmail').disabled=true;
//         New Work 09/01/2024
         Hide('Td_ChargeBrkUp');
         document.getElementById('chkChargeBrkUp').checked=false;
//         End of New Work 09/01/2024        
    }
 }
  function fnRecord(obj)
  {
      if(obj=="1")////////For No Record
      {
        Hide('td_filter');
        Show('tab1');
        Hide('displayAll');
        alert('No Record Found!!');
      }
      if(obj=="3")////////For Filter
      {
        Hide('td_filter');
        Show('tab1');
        Hide('displayAll');
      }
      if(obj=="4")////////For Instrument Type Selection
      {
        Hide('td_filter');
        Show('tab1');
        Hide('displayAll');
        alert('Please Select Atleast One Instrument Type!!');
      }
      if(obj=="5")////////For RptType:Detail
      {
        Show('td_filter');
        Hide('tab1');
        Show('displayAll');
        Show('Tr_PrevNext');
         document.getElementById('Divdisplay').className="grid_scroll"; 
       
      }
      if(obj=="6")////////For RptType:Summary
      {
        Show('td_filter');
        Hide('tab1');
        Show('displayAll');
        Hide('Tr_PrevNext');
       
      }   
      document.getElementById('hiddencount').value=0;
      Hide('showFilter');
      height();
  }
  //New Work 11/05/2023
  function GnrcCallBackPanel_Methods(WhichCall)
    {
        Show("divLoading");
//        cbtnExportSF.SetEnabled(false);
        cbtnExportMF.SetEnabled(false);
        cbtnExportMFGRP.SetEnabled(false);
        cbtnSendEmail.SetEnabled(false);
        cbtnSendEmailGRP.SetEnabled(false);
        cGnrcCallBackPanel.PerformCallback(WhichCall+'~');
        height();
    }
    function GnrcCallBackPanel_EndCallBack()
    {
        Hide("divLoading");
//        cbtnExportSF.SetEnabled(true);
        cbtnExportMF.SetEnabled(true);
        cbtnExportMFGRP.SetEnabled(true);
        cbtnSendEmail.SetEnabled(true);
        cbtnSendEmailGRP.SetEnabled(true);
        if(cGnrcCallBackPanel.cpIsSpData!=undefined)
        {
//            if(cGnrcCallBackPanel.cpIsSpData=="ExportSF")
//                GetObjectID('AbtnExportSF').click();
//            else 
            if(cGnrcCallBackPanel.cpIsSpData=="ExportMF")
                GetObjectID('BbtnExportMF').click();
            else if(cGnrcCallBackPanel.cpIsSpData=="ExportMFGRP")
                GetObjectID('BbtnExportMFGRP').click();
            else if(cGnrcCallBackPanel.cpIsSpData=="SendEmail")
                GetObjectID('EbtnSendEmail').click();
            else if(cGnrcCallBackPanel.cpIsSpData=="SendEmailGRP")
                GetObjectID('EbtnSendEmailGRP').click();
            else 
                alert(cGnrcCallBackPanel.cpIsSpData);
        }
//        if(cGnrcCallBackPanel.cpDateSat!=undefined)
//        {
//            DtFor.SetDate(new Date(cGnrcCallBackPanel.cpDateSat));
//        }
        height();
    }
  //End of New Work 11/05/2023
//  New Work 20/12/2024
    function DateChange(positionDate)
       {
          var FYS='<%=Session["FinYearStart"]%>';
          var FYE='<%=Session["FinYearEnd"]%>';
          var LFY='<%=Session["LastFinYear"]%>';
          DevE_CheckForFinYear(positionDate,FYS,FYE,LFY);
       }

    function DateCompare(DateobjFrm,DateobjTo)
    {
        var Msg="To Date Can Not Be Less Than From Date!!!";
        DevE_CompareDateForMin(DateobjFrm,DateobjTo,Msg);
    }
    function DevE_CompareDateForMin(DateObjectFrm,DateObjectTo,Msg)    
    {
        var SelectedDate = new Date(DateObjectFrm.GetDate());
        var monthnumber = SelectedDate.getMonth();
        var monthday    = SelectedDate.getDate();
        var year        = SelectedDate.getYear();
        var SelectedDateValueFrm=new Date(year, monthnumber, monthday);
        
        var SelectedDate = new Date(DateObjectTo.GetDate());
        monthnumber = SelectedDate.getMonth();
        monthday    = SelectedDate.getDate();
        year        = SelectedDate.getYear();
        var SelectedDateValueTo=new Date(year, monthnumber, monthday);
        var SelectedDateNumericValueFrm=SelectedDateValueFrm.getTime();
        var SelectedDateNumericValueTo=SelectedDateValueTo.getTime();
        if(SelectedDateNumericValueFrm>SelectedDateNumericValueTo)
        {
            alert(Msg);
            DateObjectTo.SetDate(new Date(DateObjectFrm.GetDate()));
        }
    }
    function DateChangeForFrom()
    {    
        var dateFrom ='<%=Session["FinYearStart"]%>';    
        var dateTo ='<%=Session["FinYearEnd"]%>';
        
        var MonthDate=DtFrom.GetDate().getMonth()+1;
        var DayDate=DtFrom.GetDate().getDate();
        var YearDate=DtFrom.GetDate().getYear();
        var objdateFrom;
        var objdateTo;
        
        var objDateFromMonth;
        var objDateFromYear;
        var objDateToMonth;
        var objDateToYear;
        
        var n = dateFrom.indexOf("/");
        if(n>0)
        {
              objdateFrom=dateFrom.split('/');
              objdateTo=dateTo.split('/');
              
              objDateFromMonth=objdateFrom[0] ;
              objDateFromYear=objdateFrom[2].split(' ')[0];
              
              objDateToMonth=objdateTo[0] ;
              objDateToYear=objdateTo[2].split(' ')[0];
             
        }
        else
        {
             objdateFrom=dateFrom.split('-');
             objdateTo=dateTo.split('-');
             objDateFromMonth=objdateFrom[0] ;
             objDateFromYear=objdateFrom[2].split(' ')[0];
              
             objDateToMonth=objdateTo[0] ;
             objDateToYear=objdateTo[2].split(' ')[0];
        }
        if(!((MonthDate>=objDateFromMonth && YearDate==objDateFromYear)|| (MonthDate<=objDateToMonth && YearDate==objDateToYear)))
        {
             alert('Enter Date Is Outside Of Financial Year !!');
             if(new Date()<new Date(dateTo))
                DtFrom.SetDate(new Date());
             else if(new Date()>new Date(dateFrom))
                DtFrom.SetDate(new Date(dateFrom));
             else
                 DtFrom.SetDate(new Date(dateTo));
             return false;
        }    
        else
        {
            return true;
        }
    }

    function DateChangeForTo()
    {    
        var dateFrom ='<%=Session["FinYearStart"]%>';    
        var dateTo ='<%=Session["FinYearEnd"]%>';
        var MonthDate=DtTo.GetDate().getMonth()+1;
        var DayDate=DtTo.GetDate().getDate();
        var YearDate=DtTo.GetDate().getYear();
        var objdateFrom;
        var objdateTo;
        
        var objDateFromMonth;
        var objDateFromYear;
        var objDateToMonth;
        var objDateToYear;
        
        var n = dateFrom.indexOf("/");
        if(n>0)
        {
              objdateFrom=dateFrom.split('/');
              objdateTo=dateTo.split('/');
              
              objDateFromMonth=objdateFrom[0] ;
              objDateFromYear=objdateFrom[2].split(' ')[0];
              
              objDateToMonth=objdateTo[0] ;
              objDateToYear=objdateTo[2].split(' ')[0];             
        }
        else
        {
             objdateFrom=dateFrom.split('-');
             objdateTo=dateTo.split('-');
             
             objDateFromMonth=objdateFrom[0] ;
             objDateFromYear=objdateFrom[2].split(' ')[0];
              
             objDateToMonth=objdateTo[0] ;
             objDateToYear=objdateTo[2].split(' ')[0];
        }
        if(!((MonthDate>=objDateFromMonth && YearDate==objDateFromYear)|| (MonthDate<=objDateToMonth && YearDate==objDateToYear)))
        {
             alert('Enter Date Is Outside Of Financial Year !!');
              if(new Date()<new Date(dateTo))
                DtTo.SetDate(new Date());
             else if(new Date()>new Date(dateFrom))
                DtTo.SetDate(new Date(dateFrom));
             else
                 DtTo.SetDate(new Date(dateTo));
             return false;
        }    
        else
        {
            return true;
        }
    }
//  End of New Work 20/12/2024
    FieldName='lstSlection';
     </script>
    
 
  <script type="text/ecmascript">   
       function ReceiveServerData(rValue)
        {
                var j=rValue.split('~');
                if(j[0]=='Branch')
                {
                    document.getElementById('HiddenField_Branch').value = j[1];
                }
                if(j[0]=='Group')
                {
                    document.getElementById('HiddenField_Group').value = j[1];
                }  
                if(j[0]=='Clients')
                {
                    document.getElementById('HiddenField_Client').value = j[1];
                } 
                //New Work 11/05/2023
                if(j[0]=='Broker')
                {
                    document.getElementById('HiddenField_Broker').value = j[1];
                } 
                if(j[0]=='Custodians')
                {
                    document.getElementById('HiddenField_Custodians').value = j[1];
                } 
                //End of New Work 11/05/2023
                if(j[0]=='BranchGroup')
                {
                    document.getElementById('HiddenField_BranchGroup').value = j[1];
                }
                if(j[0]=='Product')
                {
                    document.getElementById('HiddenField_Product').value = j[1];
                }
                if(j[0]=='Expiry')
                {
                    document.getElementById('HiddenField_Expiry').value = j[1];
                }
                 if(j[0]=='MAILEMPLOYEE')
                {
                    document.getElementById('HiddenField_emmail').value = j[1];
                }
               
        }
        </script>
 
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">

    <form id="form1" runat="server" autocomplete="off">
    <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600">
            </asp:ScriptManager>

            <script language="javascript" type="text/javascript"> 
   var prm = Sys.WebForms.PageRequestManager.getInstance(); 
   prm.add_initializeRequest(InitializeRequest); 
   prm.add_endRequest(EndRequest); 
   var postBackElement; 
   function InitializeRequest(sender, args) 
   { 
      if (prm.get_isInAsyncPostBack()) 
         args.set_cancel(true); 
            postBackElement = args.get_postBackElement(); 
         $get('UpdateProgress1').style.display = 'block'; 
   } 
   function EndRequest(sender, args) 
   { 
          $get('UpdateProgress1').style.display = 'none'; 
 
   } 
            </script>
    <div>
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" colspan="0" style="text-align: center; height: 20px;">
                    <strong><span id="SpanHeader" style="color: #000099">Portfolio Performance Report</span></strong></td>
                <td class="EHEADER" width="15%" id="td_filter" style="height: 22px">
                    <a href="javascript:void(0);" onclick="fnRecord(3);"><span style="color: Blue;
                        text-decoration: underline; font-size: 8pt; font-weight: bold">Filter</span></a>
                  <asp:DropDownList ID="cmbExport" runat="server" AutoPostBack="True" Font-Size="10px" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged">
                        <asp:ListItem Selected="True" Value="Ex">Export</asp:ListItem>
                        <asp:ListItem Value="E">Excel</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <table id="tab1" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="gridcellleft">
                    <table border="10" cellpadding="1" cellspacing="1">
                        <tr>
                            <td class="gridcellleft">
                                <asp:DropDownList ID="ddldate" runat="server" Width="100px" Font-Size="10px" onchange="FnDateChange(this.value)">
                                    <asp:ListItem Value="0">As on Date</asp:ListItem>
                                    <asp:ListItem Value="1">For a Period</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td id="Td_For" class="gridcellleft">
                                <dxe:ASPxDateEdit ID="DtFor" runat="server" EditFormat="Custom" UseMaskBehavior="True" EditFormatString="dd-MM-yyyy" 
                                    Font-Size="10px" Width="108px" ClientInstanceName="DtFor">
                                    <dropdownbutton text="For">
                                    </dropdownbutton>
                                    <clientsideevents datechanged="function(s,e){DateChange(DtFor);}"></clientsideevents>
                                </dxe:ASPxDateEdit>
                            </td>
                            <td id="Td_From" class="gridcellleft">
                                <dxe:ASPxDateEdit ID="DtFrom" runat="server" EditFormat="Custom" UseMaskBehavior="True" EditFormatString="dd-MM-yyyy" 
                                    Font-Size="10px" Width="108px" ClientInstanceName="DtFrom">
                                    <dropdownbutton text="From">
                                    </dropdownbutton>
                                    <clientsideevents datechanged="function(s,e){DateChangeForFrom();DateCompare(DtFrom,DtTo);}" />
                                </dxe:ASPxDateEdit>
                            </td>
                            <td id="Td_To" class="gridcellleft">
                                <dxe:ASPxDateEdit ID="DtTo" runat="server" EditFormat="Custom" UseMaskBehavior="True" EditFormatString="dd-MM-yyyy" 
                                    Font-Size="10px" Width="108px" ClientInstanceName="DtTo">
                                    <dropdownbutton text="To">
                                    </dropdownbutton>
                                    <clientsideevents datechanged="function(s,e){DateChangeForTo();DateCompare(DtFrom,DtTo);}" />
                                </dxe:ASPxDateEdit>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr id="Tr_DatePeriod">
                <td class="gridcellleft">
                    <table border="10" cellpadding="1" cellspacing="1">
                        <tr>
                            <td>
                                <asp:CheckBox ID="ChkBfPosition" runat="server" onclick="FnIgnoreBfPostion(this.value)" />
                                Ignore Brought Forward Position</td>
                            <td id="Td_ValuebfPostionAtPrevClose">
                                <asp:CheckBox ID="ChkBfPositionValue" runat="server" />
                                Value B/F Position at Prev. Close</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="gridcellleft">
                    <table>
                        <tr>
                            <td>
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td bgcolor="#B7CEEC">
                                            Report View :</td>
                                        <td>
                                            <asp:DropDownList ID="DdlRptView" runat="server" Font-Size="11px" Width="200px" Enabled="true"
                                                onchange="FnRptView(this.value)">
                                                <asp:ListItem Value="1">Branch/Group - Client Wise</asp:ListItem>
                                                <asp:ListItem Value="2">Asset - Instrument Wise</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Report Type :</td>
                                        <td>
                                            <asp:DropDownList ID="DdlRptType" runat="server" Font-Size="11px" Width="200px" Enabled="true"
                                                onchange="FnRptType(this.value)">
                                                <asp:ListItem Value="1">Detail</asp:ListItem>
                                                <asp:ListItem Value="2">Summary</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td> <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft"  bgcolor="#B7CEEC">
                                            Mtm Calculation Basis :
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DdlMtmCalBasis" runat="server" Font-Size="11px" Width="200px">
                                                <asp:ListItem Value="1">Instrument Close</asp:ListItem>
                                                <%--New Work 21/11/2024--%>
                                                <%--<asp:ListItem Value="0">Asset & Instr Close</asp:ListItem>
                                                <asp:ListItem Value="2">Asset Close</asp:ListItem>--%>
								                <asp:ListItem Value="0" Enabled="false">Asset & Instr Close</asp:ListItem>
                                                <asp:ListItem Value="2" Enabled="false">Asset Close</asp:ListItem>
                                                <%--End of New Work 21/11/2024--%>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr valign="top">
                <td valign="top">
                    <table>
                        <tr>
                            <td valign="top">
                                <table>
                                    <tr>
                                        <td class="gridcellleft" valign="top">
                                            <table border="10" cellpadding="1" cellspacing="1">
                                                <tr id="Tr_GroupBy">
                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                        Group By</td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlGroup" runat="server" Width="100px" Font-Size="10px" onchange="fnddlGroup(this.value)">
                                                            <asp:ListItem Value="0">Branch</asp:ListItem>
                                                            <asp:ListItem Value="1">Group</asp:ListItem>
                                                            <asp:ListItem Value="2">Branch Group</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td colspan="2" id="td_branch">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <asp:RadioButton ID="rdbranchAll" runat="server" Checked="True" GroupName="a" onclick="fnBranch('a')" />
                                                                    All
                                                                </td>
                                                                <td>
                                                                    <asp:RadioButton ID="rdbranchSelected" runat="server" GroupName="a" onclick="fnBranch('b')" />Selected
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td id="td_group" style="display: none;" colspan="2">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                                        <ContentTemplate>
                                                                            <asp:DropDownList ID="ddlgrouptype" runat="server" Font-Size="10px" onchange="fngrouptype(this.value)">
                                                                            </asp:DropDownList>
                                                                        </ContentTemplate>
                                                                        <Triggers>
                                                                            <asp:AsyncPostBackTrigger ControlID="btnhide" EventName="Click"></asp:AsyncPostBackTrigger>
                                                                        </Triggers>
                                                                    </asp:UpdatePanel>
                                                                </td>
                                                                <td id="td_allselect" style="display: none;">
                                                                    <asp:RadioButton ID="rdddlgrouptypeAll" runat="server" Checked="True" GroupName="b"
                                                                        onclick="fnGroup('a')" />
                                                                    All
                                                                    <asp:RadioButton ID="rdddlgrouptypeSelected" runat="server" GroupName="b" onclick="fnGroup('b')" />Selected
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <%--New Work 11/05/2023--%>
                                                <tr id="Tr_viewby">
                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                        View By :</td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlviewby" runat="server" Width="100px" Font-Size="10px" onchange="fnddlview(this.value)">
                                                            <asp:ListItem Value="1">Client</asp:ListItem>
                                                            <asp:ListItem Value="2">Broker</asp:ListItem>
                                                            <asp:ListItem Value="3">Custodians</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <%--End of New Work 11/05/2023--%>
                                                <tr id="Tr_Clients">
                                                    <td colspan="4">
                                                        <table border="10" cellpadding="1" cellspacing="1">
                                                            <tr>
                                                                <td class="gridcellleft" bgcolor="#B7CEEC">
                                                                    Clients :</td>
                                                                <td>
                                                                    <asp:RadioButton ID="rdbClientALL" runat="server" Checked="True" GroupName="c" onclick="fnClients('a')" />
                                                                    All
                                                                </td>
                                                                <td>
                                                                    <asp:RadioButton ID="rdPOAClient" runat="server" GroupName="c" onclick="fnClients('a')" />POA
                                                                </td>
                                                                <td>
                                                                    <asp:RadioButton ID="rdbClientSelected" runat="server" GroupName="c" onclick="fnClients('b')" />
                                                                    Selected
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <%--New Work 11/05/2023--%>
                                                <tr id="Tr_Broker">
                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                        Broker :</td>
                                                    <td>
                                                        <asp:RadioButton ID="rdbbrokerall" runat="server" Checked="True" GroupName="M" onclick="fnbroker('a')" />
                                                        All
                                                    </td>
                                                    <td>
                                                        <asp:RadioButton ID="rdbbrokerselected" runat="server" GroupName="M" onclick="fnbroker('b')" />
                                                        Selected  
                                                    </td>
                                                </tr>
                                                <tr id="Tr_Custodians">
                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                        Custodians :</td>
                                                    <td>
                                                        <asp:RadioButton ID="rdbcustodiansall" runat="server" Checked="True" GroupName="cu" onclick="fncustodians('a')" />
                                                        All
                                                    </td>
                                                    <td>
                                                        <asp:RadioButton ID="rdbcustodiansselected" runat="server" GroupName="cu" onclick="fncustodians('b')" />
                                                        Selected  
                                                    </td>
                                                </tr>
                                                <%--End of New Work 11/05/2023--%>
                                                <tr id="tr_Terminalid" style="display: none;">
                                                    <td colspan="4">
                                                        <table border="10" cellpadding="1" cellspacing="1">
                                                            <tr>
                                                                <td class="gridcellleft" bgcolor="#B7CEEC">
                                                                    Terminal Id:</td>
                                                                <td>
                                                                    <asp:RadioButton ID="rdbTerminalAll" runat="server" Checked="True" GroupName="ter"
                                                                        onclick="fn_Terminal('a')" />
                                                                    All
                                                                </td>
                                                                <td>
                                                                    <asp:RadioButton ID="rdbTerminalSpecific" runat="server" GroupName="ter" onclick="fn_Terminal('b')" />Specific
                                                                </td>
                                                                <td style="display: none;" id="td_terminaltxt">
                                                                    <asp:TextBox runat="server" Width="250px" Font-Size="10px" ID="txtTerminal" onkeyup="fnTerminalcallajax(this,'chkfn',event)"></asp:TextBox>
                                                                    <asp:TextBox ID="txtTerminal_hidden" runat="server" Width="14px" Style="display: none;"> </asp:TextBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4">
                                                        <table border="10" cellpadding="1" cellspacing="1">
                                                            <tr>
                                                                <td class="gridcellleft" style="width: 100px;" bgcolor="#B7CEEC">
                                                                    Asset:</td>
                                                                <td>
                                                                    <asp:RadioButton ID="rdbunderlyingall" runat="server" Checked="True" GroupName="d"
                                                                        onclick="FnAsset('a')" />
                                                                    All
                                                                </td>
                                                                <td>
                                                                    <asp:RadioButton ID="rdbunderlyingselected" runat="server" GroupName="d" onclick="FnAsset('b')" />Selected
                                                                    Asset
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4">
                                                        <table border="10" cellpadding="1" cellspacing="1">
                                                            <tr>
                                                                <td class="gridcellleft" style="width: 100px;" bgcolor="#B7CEEC">
                                                                    Expiry :</td>
                                                                <td>
                                                                    <asp:RadioButton ID="rdbExpiryAll" runat="server" Checked="True" GroupName="e" onclick="fnExpiry('a')" />
                                                                    All
                                                                </td>
                                                                <td>
                                                                    <asp:RadioButton ID="rdbExpirySelected" runat="server" GroupName="e" onclick="fnExpiry('b')" />Selected
                                                                    Expiry
                                                                </td>
                                                                <%--New Work 13/09/2023--%>
                                                                <td>
                                                                    <asp:RadioButton ID="rdbExpiryDateSelected" runat="server" GroupName="e" onclick="fnExpiry('c')" />Select
                                                                    All Expiry Greater Than
                                                                </td>
                                                                <td id="Td_ExpiryDate" class="gridcellleft">
                                                                    <dxe:ASPxDateEdit ID="DtExpiry" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                                        EditFormatString="dd-MM-yyyy" Font-Size="10px" Width="108px" ClientInstanceName="DtExpiry">
                                                                        <dropdownbutton text="Expiry">
                                                                        </dropdownbutton>
                                                                    </dxe:ASPxDateEdit>
                                                                </td>
                                                                <%--End of New Work 13/09/2023--%>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td valign="top">
                                <table border="10" cellpadding="1" cellspacing="1" id="showFilter">
                                    <tr>
                                        <td class="gridcellleft" style="vertical-align: top; text-align: right; height: 21px;"
                                            id="TdFilter">
                                            <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="150px" onkeyup="ajaxcall(this,'ShowClientFORMarginStocks',event)"></asp:TextBox><asp:DropDownList
                                                ID="cmbsearchOption" runat="server" Font-Size="11px" Width="70px" Enabled="false">
                                                <asp:ListItem>Clients</asp:ListItem>
                                                <asp:ListItem>Branch</asp:ListItem>
                                                <%--New Work 11/05/2023--%>
                                                <asp:ListItem>Broker</asp:ListItem>
                                                <asp:ListItem>Custodians</asp:ListItem>
                                                <%--End of New Work 11/05/2023--%>
                                                <asp:ListItem>Group</asp:ListItem>
                                                <asp:ListItem>Expiry</asp:ListItem>
                                                <asp:ListItem>Product</asp:ListItem>
                                                <asp:ListItem>MAILEMPLOYEE</asp:ListItem>
                                            </asp:DropDownList>
                                            <a id="A4" href="javascript:void(0);" onclick="btnAddsubscriptionlist_click()"><span
                                                style="color: #009900; text-decoration: underline; font-size: 8pt;">Add to List</span></a><span
                                                    style="color: #009900; font-size: 8pt;"> </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:ListBox ID="lstSlection" runat="server" Font-Size="10px" Height="90px" Width="290px">
                                            </asp:ListBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <a id="A2" href="javascript:void(0);" onclick="clientselectionfinal()"><span style="color: #000099;
                                                            text-decoration: underline; font-size: 10pt;">Done</span></a>&nbsp;&nbsp;
                                                    </td>
                                                    <td>
                                                        <a id="A1" href="javascript:void(0);" onclick="btnRemovefromsubscriptionlist_click()">
                                                            <span style="color: #cc3300; text-decoration: underline; font-size: 8pt;">Remove</span></a>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="gridcellleft">
                    <table border="10" cellpadding="1" cellspacing="1">
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Instrument Type :</td>
                            <td>
                                <asp:CheckBoxList ID="chkinstrutype" runat="server" RepeatDirection="Horizontal"
                                    Width="150px">
                                    <asp:ListItem Value="FUT" Selected="True">Future</asp:ListItem>
                                    <asp:ListItem Value="C" Selected="True">Call</asp:ListItem>
                                    <asp:ListItem Value="P" Selected="True">Put</asp:ListItem>
                                    <asp:ListItem Value="Spot" Selected="True" onclick="if(this.checked){checkall()}else{uncheckall()}">Spot</asp:ListItem>
                                </asp:CheckBoxList>
                            </td>
                            <td>
                                <table>
                                    <tr valign="top">
                                        <td class="gridcellleft" bgcolor="#B7CEEC" id="td_spotconsolidated">
                                            <asp:CheckBox ID="ChkConsolidatedSpot" runat="server" onclick="selecttion()" />
                                            Consolidated Spot Position Across Exchange</td>
                                    </tr>
                                </table>
                            </td>
                            <%--New Work 09/08/2024--%>
                            <td>
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                           Calculate On:
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DdlCalculateOn" runat="server" Font-Size="11px" Width="100px">
                                                <asp:ListItem Value="CustomerTrades_NetValue">Net Rate</asp:ListItem>
                                                <asp:ListItem Value="CustomerTrades_MarketValue">Market Rate</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <%--End of New Work 09/08/2024--%>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr id="Tr_ShowClients" style="display: none;">
                <td class="gridcellleft">
                    <table border="10" cellpadding="1" cellspacing="1">
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Show Clients :</td>
                            <td>
                                <asp:RadioButton ID="rdbnetclientboth" runat="server" Checked="True" GroupName="cc" />
                                Both
                            </td>
                            <td>
                                <asp:RadioButton ID="rdbnetclientrecivabel" runat="server" GroupName="cc" />
                                Only Receivable
                            </td>
                            <td>
                                <asp:RadioButton ID="rdbnetclientpayabel" runat="server" GroupName="cc" />
                                Only Payable
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr >
                            <td class="gridcellleft" id="Td_OpenPosition">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            <asp:CheckBox ID="chkopen" runat="server" onclick="selecttion()" />
                                            Show Only Open Position</td>
                                    </tr>
                                </table>
                            </td>
                             <td class="gridcellleft" id="Td_ClosingPrice">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            <asp:CheckBox ID="chkclosepricezero" runat="server" onclick="selecttion()" />
                                            Do Not Consider Closing Prices</td>
                                    </tr>
                                </table>
                            </td>
                            <%--New Work 09/08/2024--%>
                            <%--<td class="gridcellleft" id="Td_IncludeCharge">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            <asp:CheckBox ID="ChkIncludeCharges" runat="server" onclick="selecttion()" />
                                            Include Charges</td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                           Calculate On:
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DdlCalculateOn" runat="server" Font-Size="11px" Width="100px">
                                                <asp:ListItem Value="CustomerTrades_NetValue">Net Rate</asp:ListItem>
                                                <asp:ListItem Value="CustomerTrades_MarketValue">Market Rate</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </td>--%>
                            <td class="gridcellleft" id="Td_IncludeCharge">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            <asp:CheckBox ID="ChkIncludeCharges" runat="server" onclick="fn_UncheckChargeBrkUp()" />
                                            Include Charges</td>
                                    </tr>
                                </table>
                            </td>
                            <td id="Td_ChargeBrkUp" bgcolor="#b7ceec" class="gridcellleft">
                                <asp:CheckBox ID="chkChargeBrkUp" runat="server" onclick="fn_CheckCharge()" />
                                Show Charges Breakup
                            </td>
                            <%--End of New Work 09/08/2024--%>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td class="gridcellleft" id="Td_Sign">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            <asp:CheckBox ID="chkopenbfpositive" Checked="true" runat="server" onclick="selecttion()" />
                                            Show Open Buy Position in +ve Sign
                                        </td>
                                    </tr>
                                </table>
                            </td>
                             <td class="gridcellleft" id="Td_Premium">
                                 <table border="10" cellpadding="1" cellspacing="1">
                                     <tr>
                                         <td class="gridcellleft" bgcolor="#B7CEEC">
                                             <asp:CheckBox ID="chknetpremium" runat="server" onclick="selecttion()" />
                                             Show Net Premium
                                         </td>
                                         <td class="gridcellleft" id="Td_IncludeInterest">
                                             <table border="10" cellpadding="1" cellspacing="1">
                                                 <tr>
                                                     <td class="gridcellleft" bgcolor="#B7CEEC">
                                                         <asp:CheckBox ID="ChkIncludeInterest" runat="server" onclick="selecttion()" />
                                                         Include Interest</td>
                                                 </tr>
                                             </table>
                                         </td>
                                     </tr>
                                 </table>
                            </td>
                            <%--New Work 13/09/2023--%>
                            <td class="gridcellleft" id="Td_DoNotCalcMTMOpts">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            <asp:CheckBox ID="chkDoNotCalcMTMOpts" Checked="false" runat="server" onclick="selecttion()" />
                                            Do not Calculate MTM for Options
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <%--End of New Work 13/09/2023--%>
                            <%--New Work 21/11/2024--%>
                            <td class="gridcellleft" id="Td_DoNotShowAssetWiseTot">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            <asp:CheckBox ID="chkDoNotShowAssetWiseTot" Checked="false" runat="server" onclick="selecttion()" />
                                            Do not Show Asset Wise Total
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <%--End of New Work 21/11/2024--%>
                        </tr>
                    </table>
                </td>
            </tr>
            
             <tr>
                            <td class="gridcellleft">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Generate Type :</td>
                                        <td>
                                            <asp:DropDownList ID="ddlGeneration" runat="server" Width="150px" Font-Size="10px"
                                                onchange="FnddlGeneration(this.value)">
                                                <asp:ListItem Value="1">Screen</asp:ListItem>
                                                <asp:ListItem Value="2">Export</asp:ListItem>
                                                <%--New Work 11/05/2023--%>
                                                <%--<asp:ListItem Value="3">Send Email</asp:ListItem>--%>
                                                <asp:ListItem Value="3">Excel-Multiple</asp:ListItem>
                                                <asp:ListItem Value="4">Excel-Multiple-Group</asp:ListItem>
                                                <asp:ListItem Value="5">Send Email</asp:ListItem>
                                                <asp:ListItem Value="6">Send Email as Excel Attachment</asp:ListItem>
                                                <asp:ListItem Value="7">Send Email as Excel Attachment-Group</asp:ListItem>
                                                <%--End of New Work 11/05/2023--%>
                                                <%--New Work 09/08/2024--%>
                                                <asp:ListItem Value="8">Print</asp:ListItem>
                                                <%--End of New Work 09/08/2024--%>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <%--New Work 09/08/2024--%>
                            </tr>
                            <tr>
                            <td style="display: none;" id="td_ChkDISTRIBUTION">
                                <table>
                                    <tr>
                                        <td id="tr_printlogo">
                                            <asp:CheckBox ID="CHKLOGOPRINT" runat="server" Checked="true" />
                                            Do Not Print Logo</td>
                                        <td style="display:none;">
                                            <asp:CheckBox ID="ChkDISTRIBUTION" runat="server" />
                                            Distribution Copy</td>
                                        <%--<td id="td_chkOpenPosition">
                                            <asp:CheckBox ID="chkOpenPosition" runat="server" />
                                            Only Open Position</td>--%>
                                    </tr>
                                </table>
                            </td>
                            <%--End of New Work 09/08/2024--%>
                        </tr>
                        <tr id="tr_mail">
                        <td class="gridcellleft">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                         <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Respective :</td>
                                        <td>
                                            <asp:DropDownList ID="ddloptionformail" runat="server" Width="100px" Font-Size="10px"
                                                onchange="fnddloptionformail(this.value)">
                                                <asp:ListItem Value="0">Client</asp:ListItem>
                                                <asp:ListItem Value="1">Group/Branch</asp:ListItem>
                                                <asp:ListItem Value="2">User</asp:ListItem>
                                           </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <%--New Work 11/05/2023--%>
                        <tr id="tr_ExcelEmail">
                            <td class="gridcellleft">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Respective :</td>
                                        <td>
                                            <asp:DropDownList ID="ddlExcelEmail" runat="server" Width="100px" Font-Size="10px"
                                                onchange="fnddlExcelEmail(this.value)">
                                                <asp:ListItem Value="0">Client</asp:ListItem>
                                                <asp:ListItem Value="1">Group/Branch</asp:ListItem>
                                           </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <%--End of New Work 11/05/2023--%>
            <tr>
                <td class="gridcellleft">
                    <table>
                        <tr>
                            <td id="td_Screen">
                                <asp:Button ID="btnScreen" runat="server" CssClass="btnUpdate" Height="20px" Text="Screen"
                                    Width="101px" OnClientClick="selecttion()" OnClick="btnScreen_Click" />
                            </td>
                            <%--New Work 09/08/2024--%>
                            <td  id="td_btnprint">
                                <asp:Button ID="btnprint" runat="server" CssClass="btnUpdate" Height="20px" Text="Print"
                                    OnClientClick="selecttion()" Width="101px" OnClick="btnprint_Click" />
                            </td>
                            <%--End of New Work 09/08/2024--%>
                            <td id="td_Export">
                                <asp:Button ID="btnExcel" runat="server" CssClass="btnUpdate" Height="20px" Text="Export To Excel"
                                    Width="101px" OnClientClick="selecttion()" OnClick="btnExcel_Click" /></td>
                            <td  id="td_sendmail" >
                                    <asp:Button ID="btnmail" runat="server" CssClass="btnUpdate" Height="20px" Text="Send Email"
                                        Width="101px" OnClick="btnmail_Click" />
                            </td>
                            <%--New Work 11/05/2023--%>
                            <td id="td_exportmultiplefile" class="gridcellleft" style="width: 267px">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                         <td>
                                            <dxe:ASPxButton ID="btnexportmf" runat="server" AutoPostBack="False" ClientInstanceName="cbtnExportMF"
                                                Text="Export To Multiple Excel">
                                                <ClientSideEvents Click="function(s,e){GnrcCallBackPanel_Methods('ExportMF');}" />
                                            </dxe:ASPxButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td id="td_exportmultiplefilegrp" class="gridcellleft" style="width: 267px">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                         <td>
                                            <dxe:ASPxButton ID="btnexportmfgrp" runat="server" AutoPostBack="False" ClientInstanceName="cbtnExportMFGRP"
                                                Text="Export To Multiple Excel">
                                                <ClientSideEvents Click="function(s,e){GnrcCallBackPanel_Methods('ExportMFGRP');}" />
                                            </dxe:ASPxButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td id="td_sendemail" class="gridcellleft" style="width: 267px">                                       
                                    <table border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                <dxe:ASPxButton ID="btnsendemail" runat="server" AutoPostBack="False" ClientInstanceName="cbtnSendEmail"
                                                    Text="Send Email as Excel Attachment">
                                                    <ClientSideEvents Click="function(s,e){GnrcCallBackPanel_Methods('SendEmail');}" />
                                                </dxe:ASPxButton>
                                            </td>
                                        </tr>
                                    </table>   
                                </td>
                                <td id="td_sendemailgrp" class="gridcellleft" style="width: 267px">                                       
                                    <table border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                <dxe:ASPxButton ID="btnsendemailgrp" runat="server" AutoPostBack="False" ClientInstanceName="cbtnSendEmailGRP"
                                                    Text="Send Email as Excel Attachment">
                                                    <ClientSideEvents Click="function(s,e){GnrcCallBackPanel_Methods('SendEmailGRP');}" />
                                                </dxe:ASPxButton>
                                            </td>
                                        </tr>
                                    </table>   
                                </td>
                                <%--New Work 09/08/2024--%>
                                <td id="td_Reset">
                                    <input id="btnReset" style="width:101px;height:20px" type="button" class="btnUpdate" value="Reset" onclick="ResetButton()" />
                                </td>
                               <%--End of New Work 09/08/2024--%>
                            <%--End of New Work 11/05/2023--%>
                        </tr>
                    </table>
                </td>
            </tr>
           
        </table>
        <%--New Work 11/05/2023--%>
        <div id="divLoading">
            <dxcp:ASPxCallbackPanel ID="GnrcCallBackPanel" runat="server" ClientInstanceName="cGnrcCallBackPanel"
                BackColor="White" OnCallback="GnrcCallBackPanel_Callback" LoadingPanelText="Generating File...Please Wait..."
                LoadingPanelStyle-Font-Size="Medium">
                <PanelCollection>
                    <dxp:panelcontent>
                    </dxp:panelcontent>
                </PanelCollection>
                <ClientSideEvents EndCallback="function(s, e) {
                                                        GnrcCallBackPanel_EndCallBack(); }" />
            </dxcp:ASPxCallbackPanel>
        </div>
        <div style="display: none">
            <%--<asp:Button ID="AbtnExportSF" runat="server" BackColor="#DDECFE" BorderStyle="None"
                OnClick="btnExportSF_Click" />--%>
            <asp:Button ID="BbtnExportMF" runat="server" BackColor="#DDECFE" BorderStyle="None"
                OnClick="btnExportMF_Click" />
            <asp:Button ID="BbtnExportMFGRP" runat="server" BackColor="#DDECFE" BorderStyle="None"
                OnClick="btnExportMF_Click" />
            <asp:Button ID="EbtnSendEmail" runat="server" BackColor="#DDECFE" BorderStyle="None"
                    OnClick="btnemail_Click" />
            <asp:Button ID="EbtnSendEmailGRP" runat="server" BackColor="#DDECFE" BorderStyle="None"
                    OnClick="btnemail_Click" />
        </div>
        <%--End of New Work 11/05/2023--%>
        <table>
            <tr>
                <td style="display: none;">
                    <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="150px"></asp:TextBox>
                    <asp:Button ID="btnhide" runat="server" Text="btnhide" OnClick="btnhide_Click" />
                    <asp:HiddenField ID="HiddenField_Group" runat="server" />
                    <asp:HiddenField ID="HiddenField_Branch" runat="server" />
                    <asp:HiddenField ID="HiddenField_Client" runat="server" />
                    <asp:HiddenField ID="HiddenField_BranchGroup" runat="server" />
                    <asp:HiddenField ID="HiddenField_Segment" runat="server" />
                    <asp:HiddenField ID="hiddencount" runat="server" />
                    <asp:HiddenField ID="HiddenField_Product" runat="server" />
                    <asp:HiddenField ID="HiddenField_Expiry" runat="server" />
                    <asp:HiddenField ID="HiddenField_emmail" runat="server" />
                    <%--New Work 11/05/2023--%>
                    <asp:HiddenField ID="HiddenField_Broker" runat="server" />
                    <asp:HiddenField ID="HiddenField_Custodians" runat="server" />
                    <%--End of New Work 11/05/2023--%>
                </td>
                <td>
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
                                                        <font size='1' face='Tahoma'><strong align='center'>Please Wait..</strong></font></td>
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
        </table>
        <div id="displayAll" style="display: none;" width="100%">
            <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                <ContentTemplate>
                    <table width="100%" border="1">
                        <tr style="display:none;">
                            <td>
                                <asp:DropDownList ID="cmbclient" runat="server" Font-Size="10px" Width="300px"
                                    AutoPostBack="True" onchange="selecttion()">
                                </asp:DropDownList></td>
                        </tr>
                           
                        <tr>
                            <td>
                                <div id="DivHeader" runat="server">
                                </div>
                            </td>
                        </tr>
                         <tr>
                            <td>
                                <asp:UpdatePanel ID="updatepanel_trprevnext" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <table runat="server">
                                            <tr valign="top">
                                                <td style="height: 44px">
                                                    <asp:LinkButton ID="lnkPrev" runat="server" CommandName="Prev" Text="[Prev]" OnCommand="NavigationLinkC_Click"
                                                        OnClientClick="javascript:selecttion();"> </asp:LinkButton>
                                                </td>
                                                <td style="height: 44px">
                                                    <asp:DropDownList ID="cmbgroup" runat="server" Font-Size="10px" Width="300px" AutoPostBack="True"
                                                         onchange="selecttion()" OnSelectedIndexChanged="cmbgroup_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="height: 44px">
                                                    <asp:LinkButton ID="lnkNext" runat="server" CommandName="Next" Text="[Next]" OnCommand="NavigationLinkC_Click"
                                                        OnClientClick="javascript:selecttion();"> </asp:LinkButton>&nbsp;&nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnScreen" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr style="border-color: Blue;" id="Tr_PrevNext">
                            <td align="left">
                                <table id="tblpage" cellspacing="0" cellpadding="0" runat="server" width="10%">
                                    <tr>
                                        <td width="20" style="padding: 5px">
                                            <asp:LinkButton ID="ASPxFirst" runat="server" Font-Bold="True" ForeColor="maroon"
                                                OnClientClick="javascript:selecttion();;" OnClick="ASPxFirst_Click">First</asp:LinkButton></td>
                                        <td width="25">
                                            <asp:LinkButton ID="ASPxPrevious" runat="server" Font-Bold="True" ForeColor="Blue"
                                                OnClientClick="javascript:selecttion();" OnClick="ASPxPrevious_Click">Previous</asp:LinkButton></td>
                                        <td width="20" style="padding: 5px">
                                            <asp:LinkButton ID="ASPxNext" runat="server" Font-Bold="True" ForeColor="maroon"
                                                OnClientClick="javascript:selecttion();" OnClick="ASPxNext_Click">Next</asp:LinkButton></td>
                                        <td width="20">
                                            <asp:LinkButton ID="ASPxLast" runat="server" Font-Bold="True" ForeColor="Blue" OnClientClick="javascript:selecttion();"
                                                OnClick="ASPxLast_Click">Last</asp:LinkButton></td>
                                        <td align="right" style="display: none;">
                                        
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div id="Divdisplay" runat="server">
                                </div>
                            </td>
                        </tr>
                         <asp:HiddenField ID="TotalRecord" runat="server" />
                    </table>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnScreen" EventName="Click"></asp:AsyncPostBackTrigger>
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </div>
    </form>
</body>
</html>

