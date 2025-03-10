<%@ page language="C#" autoeventwireup="true" inherits="Reports_Process_CollAllocation, App_Web_akbpwr7y" enableeventvalidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export" Namespace="DevExpress.Web.ASPxGridView.Export"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dxuc" %>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">--%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>Collateral Allocation Centre</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />
    
    <link type="text/css" href="../CSS/GenericCss.css" rel="Stylesheet" />

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

	</style>
	
	<script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/GenericJScript.js"></script>

    <script language="javascript" type="text/javascript" src="../CentralData/JSScript/timeSolver.min.js"></script>

    <script language="javascript" type="text/javascript">
  
    function Page_Load()///Call Into Page Load
        {
             fn_ReportView('1');
             CtxtCashReq.SetValue('50');
//             New Work 07/08/2022
             Hide('tr_sapn');
             Hide('tr_sapn2');
             Show('td_btnshow');
             Hide('Td_Export');
             Hide('tr_filter');
             Hide('tr_grd');
             if(document.getElementById("rbScreen").checked)
                {
                    Show('td_btnshow');
                    Hide('Td_Export');
                }
             if(document.getElementById("rbExcel").checked)
                {
                    Hide('td_btnshow');
                    Show('Td_Export');
                }
//             End of New Work 07/08/2022
//             New Work 18/08/2022
             Hide('tr_ImpAlloResp');
             Hide('tr_ImpIntradayMargin');
             Hide('tr_ImpNMassMargin');
             Hide('tr_ExportMargin');
             Hide('tr_ExportDetail');
             Hide('tr_ExportSummary');
//             New Work 25/08/2022
//             Hide('tdShow');
             Hide('tr_sapn3');
//             End of New Work 25/08/2022
//             End of New Work 18/08/2022
//            New Work 25/07/2024
              Hide('td_lstfiltercolumn');
//            End of New Work 25/07/2024
             height();
        }

//   New Work 25/07/2024
   function fncolumnsdisplay(obj)
  {
        if(obj.checked==true)
        {
            Show('td_lstfiltercolumn');
        }
        else
        {
            Hide('td_lstfiltercolumn');            
            document.getElementById("chktfilter").checked=false;
        }
         height();
   }
//   End of New Work 25/07/2024
   
   function height()
        {
            if(document.body.scrollHeight>=350)
            {
                window.frameElement.height = document.body.scrollHeight;
            }
            else
            {
                window.frameElement.height = '350px';
            }
            window.frameElement.Width = document.body.scrollWidth;
        }
    function Hide(obj)
            {
             document.getElementById(obj).style.display='none';
            }
    function Show(obj)
            {
             document.getElementById(obj).style.display='inline';
            }

    function RecordDisplay()
    {
        height();        
    }
    
    function fn_ReportView(obj)
    {
//        if (obj=="1" | obj=="3")
          if (obj=="1")
            {
                document.getElementById("rbScreen").checked=true;
                Show('tr_CashRequired');
                CtxtCashReq.SetValue('50');
                Show('tr_RadioScreenExcel');
//                New Work 25/08/2022
//                Hide('tdShow');
                Hide('tr_sapn3');
//                End of New Work 25/08/2022
//                New Work 25/07/2024
                Show('tr_filtercolumns');
//                End of New Work 25/07/2024
                if(document.getElementById("rbScreen").checked)
                {
                    Show('td_btnshow');
                    Hide('Td_Export');
                }
             if(document.getElementById("rbExcel").checked)
                {
                    Hide('td_btnshow');
                    Show('Td_Export');
                }
            }
        else if (obj=="2")
            {
                document.getElementById("rbScreen").checked=true;
                Hide('tr_CashRequired');
                CtxtCashReq.SetValue('0');
                Show('tr_RadioScreenExcel');
//                New Work 25/08/2022
//                Hide('tdShow');
                Hide('tr_sapn3');
//                End of New Work 25/08/2022
//                New Work 25/07/2024
                Hide('tr_filtercolumns');
                document.getElementById("chkfiltercolumns").checked=false;
//                End of New Work 25/07/2024
                if(document.getElementById("rbScreen").checked)
                {
                    Show('td_btnshow');
                    Hide('Td_Export');
                }
                if(document.getElementById("rbExcel").checked)
                 {
                        Hide('td_btnshow');
                        Show('Td_Export');
                  }
            }
         else
            {
                document.getElementById("rbExcel").checked=true;
                Show('tr_CashRequired');
                CtxtCashReq.SetValue('50');
                Hide('td_btnshow');
                Show('Td_Export');
                Hide('tr_RadioScreenExcel');
//                New Work 25/08/2022
//                Hide('tdShow');
                Hide('tr_sapn3');
//                End of New Work 25/08/2022
//                New Work 25/07/2024
                Hide('tr_filtercolumns');
                document.getElementById("chkfiltercolumns").checked=false;
//                End of New Work 25/07/2024
            }
    }
    
    function fnNoRecord(obj)
    {
        //New Work 07/08/2022
        Hide('tr_filter');
        Show('tab1');
//        New Work 25/08/2022
//        Hide('tdShow');
        Hide('tr_sapn3');
//        End of New Work 25/08/2022
        //End of New Work 07/08/2022
        alert('No Record Found!!');
        fn_ReportView(document.getElementById('DLLRptView').value);  
        height();
    }
    
  function selecttion()
  {
     var combo=document.getElementById('cmbExport');
//     combo.value='Ex';
  } 
  
function GnrcCallBackPanel_Methods(WhichCall)
{
    Show("divLoading");
    cBtnExcel.SetEnabled(false);
    //New Work 18/08/2022
    cHBtnExcel.SetEnabled(false);
    cHBtnExcel.SetText('Generating File...Please Wait...');
//    New Work 25/08/2022
//    Hide('tdShow');
    Hide('tr_sapn3');
//    End of New Work 25/08/2022
    //End of New Work 18/08/2022
    cGnrcCallBackPanel.PerformCallback(WhichCall+'~');
}
function GnrcCallBackPanel_EndCallBack()
{
    if(cGnrcCallBackPanel.cpIsSpData!=undefined)
    {
        if(cGnrcCallBackPanel.cpIsSpData=="Export")
            GetObjectID('btnExcelExport').click();
        //New Work 18/08/2022    
        if(cGnrcCallBackPanel.cpIsSpData=="HoldingExport")
            GetObjectID('BtnHoldExport').click();
        //End of New Work 18/08/2022
    }
    Hide("divLoading");
    cBtnExcel.SetEnabled(true);
    //New Work 18/08/2022
    cHBtnExcel.SetEnabled(true);
    cHBtnExcel.SetText('Export Holdings');
    document.getElementById('ddlImportType').value='0';
    Hide('tr_ImpAlloResp');
    Hide('tr_ImpIntradayMargin');
    Hide('tr_ImpNMassMargin');
    Hide('tr_ExportMargin');
    Hide('tr_ExportDetail');
    Hide('tr_ExportSummary');
//    New Work 25/08/2022
//    Hide('tdShow');
    Hide('tr_sapn3');
//    End of New Work 25/08/2022
    //End of New Work 18/08/2022
    Height('350','350'); 
}
//New Work 07/08/2022

//New Work 24/08/2022
//function SelectAllCheckboxes(chk) 
//{
//    $('#<%=grdcollallocation.ClientID %>').find("input:checkbox").each(function() 
//    {        
//        if (this != chk) {
//            this.checked = chk.checked;
//        }
//    });
//    Hide('tdShow');
//}
//End of New Work 24/08/2022

//New Work 25/08/2022
//function fn_ExcsFundsCCAmnt(textid,ExcsFundsCCamnt,MandatoryAllocamt,txtAmnt,obj)
//{   
////    if(parseInt(txtAmnt)!=0 && parseInt(MandatoryAllocamt)!=0)
//    if((txtAmnt)!=0 && (MandatoryAllocamt)!=0)
//    {
//        alert('You Cannot assign the value for both ExcsFundsCC & MandatoryAlloc at the same time To This Client');
//        textid.value=ExcsFundsCCamnt;
//        textid.focus();
//        textid.select();
//        //New Work 24/08/2022
//        document.getElementById('spanshow2').innerText=obj;
//        Show('tr_sapn');
//        Hide('tr_sapn2');
//        Show('tr_filter');
//        Hide('tab1');
//        Show('tr_grd');
//        Hide('tr_ImpAlloResp');
//        Hide('tr_ImpIntradayMargin');
//        Hide('tr_ImpNMassMargin');
//        Hide('tr_ExportMargin');
//        Hide('tr_ExportDetail');
//        Hide('tr_ExportSummary');
////        New Work 25/08/2022
////        Hide('tdShow');
////        End of New Work 25/08/2022
//        height();
//        //End of New Work 24/08/2022
//    }
//}

//function fn_MandatoryAllocAmnt(textid,ExcsFundsCCamnt,MandatoryAllocamt,txtAmnt,obj)
//{
////    if(parseInt(txtAmnt)!=0 && parseInt(ExcsFundsCCamnt)!=0)
//    if((txtAmnt)!=0 && (ExcsFundsCCamnt)!=0)
//    {
//        alert('You Cannot assign the value for both MandatoryAlloc & ExcsFundsCC at the same time To This Client');
//        textid.value=MandatoryAllocamt;
//        textid.focus();
//        textid.select();
//        //New Work 24/08/2022
//        document.getElementById('spanshow2').innerText=obj;
//        Show('tr_sapn');
//        Hide('tr_sapn2');
//        Show('tr_filter');
//        Hide('tab1');
//        Show('tr_grd');
//        Hide('tr_ImpAlloResp');
//        Hide('tr_ImpIntradayMargin');
//        Hide('tr_ImpNMassMargin');
//        Hide('tr_ExportMargin');
//        Hide('tr_ExportDetail');
//        Hide('tr_ExportSummary');
////        New Work 25/08/2022
////        Hide('tdShow');
////        End of New Work 25/08/2022
//        height();
//        //End of New Work 24/08/2022
//    }
//}
//End of New Work 25/08/2022

function fnNoRecordGenerate(obj)
{
//    Show('tr_filter');
//    Hide('tab1');
//    Hide('tr_sapn2');
//    Hide('Td_Export');
//    //New Work 18/08/2022
//    Hide('tr_ImpAlloResp');
//    Hide('tr_ImpIntradayMargin');
//    Hide('tr_ImpNMassMargin');
//    Hide('tr_ExportMargin');
//    Hide('tr_ExportDetail');
//    Hide('tr_ExportSummary');
////    New Work 25/08/2022
////    Hide('tdShow');
//    Hide('tr_sapn3');
////    End of New Work 25/08/2022
//    //End of New Work 18/08/2022    
//    alert('No Record Found for Create Batch!!');
//    fn_ReportView(document.getElementById('DLLRptView').value);  
//    height();
    document.getElementById('spanshow2').innerText=obj;
    Show('tr_sapn');
    Hide('tr_sapn2');
    Show('tr_filter');
    Hide('tab1');
    Show('tr_grd');
    Hide('tr_ImpAlloResp');
    Hide('tr_ImpIntradayMargin');
    Hide('tr_ImpNMassMargin');
    Hide('tr_ExportMargin');
    Hide('tr_ExportDetail');
    Hide('tr_ExportSummary');
    Hide('tr_sapn3');
    document.getElementById('ddlImportType').value='0';
    alert('No Record Found for Create Batch!!');
    height();
}
    
function isNumberKey(e)      
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
        
function RBShowHide(obj)
{
     if(obj=='rbScreen')
         {
             Show('td_btnshow');
             Hide('Td_Export');
//             New Work 25/08/2022
//             Hide('tdShow');
             Hide('tr_sapn3');
//             End of New Work 25/08/2022
//             New Work 25/07/2024
             if(document.getElementById('DLLRptView').value=="2")
                {
                    Hide('tr_filtercolumns');
                    document.getElementById("chkfiltercolumns").checked=false;
                }
             else
                {
                    Show('tr_filtercolumns');
                }
//             End of New Work 25/07/2024
         }
     else
         {
             Hide('td_btnshow');
             Show('Td_Export');
//             New Work 25/08/2022
//             Hide('tdShow');
             Hide('tr_sapn3');
//             End of New Work 25/08/2022
//             New Work 25/07/2024
             Hide('tr_filtercolumns');
             document.getElementById("chkfiltercolumns").checked=false;
//             End of New Work 25/07/2024
         }
         height();
         selecttion();
} 

function fnCheckSameAmount(obj,obj1,obj2)
{
    document.getElementById('spanshow2').innerText=obj2;
    Show('tr_sapn');
    Hide('tr_sapn2');
    Show('tr_filter');
    Hide('tab1');
    Show('tr_grd');
//    New Work 25/08/2022
//    Hide('tdShow');
    Hide('tr_sapn3');
//    End of New Work 25/08/2022
    alert('You Cannot assign the value MandatoryAlloc & ExcsFundsCC at the same time to the Client '+obj+' ['+obj1+'].');
    height();
}
function display(obj)
{
    document.getElementById('spanshow2').innerText=obj;
    Show('tr_sapn');
    Hide('tr_sapn2');
    Show('tr_filter');
    Hide('tab1');
    Show('tr_grd');
//New Work 18/08/2022
    Hide('tr_ImpAlloResp');
    Hide('tr_ImpIntradayMargin');
    Hide('tr_ImpNMassMargin');
    Hide('tr_ExportMargin');
    Hide('tr_ExportDetail');
    Hide('tr_ExportSummary');
//    New Work 25/08/2022
//    Hide('tdShow');
    Hide('tr_sapn3');
//    End of New Work 25/08/2022;
//End of New Work 18/08/2022    
    height();
}

function display2(obj)
{
    document.getElementById('spanshow4').innerText=obj;
    Hide('tr_sapn');
    Show('tr_sapn2');
    Show('tr_filter');
    Hide('tab1');
    Show('tr_grd');
//New Work 18/08/2022
    Hide('tr_ImpAlloResp');
    Hide('tr_ImpIntradayMargin');
    Hide('tr_ImpNMassMargin');
    Hide('tr_ExportMargin');
    Hide('tr_ExportDetail');
    Hide('tr_ExportSummary');
//    New Work 25/08/2022
//    Hide('tdShow');
    Hide('tr_sapn3');
//    End of New Work 25/08/2022
//End of New Work 18/08/2022      
    height();
}

function Filter()
{
    Hide('tr_filter');
    Show('tab1');
    Hide('tr_sapn');
    Hide('tr_sapn2');
    Hide('tr_grd');
//New Work 18/08/2022
    Hide('tr_ImpAlloResp');
    Hide('tr_ImpIntradayMargin');
    Hide('tr_ImpNMassMargin');
    Hide('tr_ExportMargin');
    Hide('tr_ExportDetail');
    Hide('tr_ExportSummary');
//    New Work 25/08/2022
//    Hide('tdShow');
    Hide('tr_sapn3');
//    End of New Work 25/08/2022
//End of New Work 18/08/2022
    fn_ReportView(document.getElementById('DLLRptView').value);  
    height();
}
//End of New Work 07/08/2022
//New Work 18/08/2022
function fn_ImportType(obj)
{
  if (obj=="0")
    {
        Hide("tr_ImpAlloResp");
        Hide('tr_ImpIntradayMargin');
        Hide('tr_ImpNMassMargin');
        Hide('tr_ExportMargin');
        Hide('tr_ExportDetail');
        Hide('tr_ExportSummary');
//    New Work 25/08/2022
//    Hide('tdShow');
        Hide('tr_sapn3');
//    End of New Work 25/08/2022
    }
else if (obj=="1")
    {
        Show('tr_ImpAlloResp');
        Hide('tr_ImpIntradayMargin');
        Hide('tr_ImpNMassMargin');
        Hide('tr_ExportMargin');
        Hide('tr_ExportDetail');
        Hide('tr_ExportSummary');
//    New Work 25/08/2022
//    Hide('tdShow');
        Hide('tr_sapn3');
//    End of New Work 25/08/2022
    }
 else if (obj=="2")
    {
        Hide("tr_ImpAlloResp");
        Show('tr_ImpIntradayMargin');
        Hide('tr_ImpNMassMargin');
        Hide('tr_ExportMargin');
        Hide('tr_ExportDetail');
        Hide('tr_ExportSummary');
//    New Work 25/08/2022
//    Hide('tdShow');
        Hide('tr_sapn3');
//    End of New Work 25/08/2022
    }
 else if (obj=="3")
    {
        Hide("tr_ImpAlloResp");
        Hide('tr_ImpIntradayMargin');
        Show('tr_ImpNMassMargin');
        Hide('tr_ExportMargin');
        Hide('tr_ExportDetail');
        Hide('tr_ExportSummary');
//    New Work 25/08/2022
//    Hide('tdShow');
        Hide('tr_sapn3');
//    End of New Work 25/08/2022
    }
 else if (obj=="4")
    {
        Hide("tr_ImpAlloResp");
        Hide('tr_ImpIntradayMargin');
        Hide('tr_ImpNMassMargin');
        Show('tr_ExportMargin');
        Hide('tr_ExportDetail');
        Hide('tr_ExportSummary');
//    New Work 25/08/2022
//    Hide('tdShow');
        Hide('tr_sapn3');
//    End of New Work 25/08/2022
    }
 else if (obj=="5")
    {
        Hide("tr_ImpAlloResp");
        Hide('tr_ImpIntradayMargin');
        Hide('tr_ImpNMassMargin');
        Hide('tr_ExportMargin');
        Show('tr_ExportDetail');
        Hide('tr_ExportSummary');
//    New Work 25/08/2022
//    Hide('tdShow');
        Hide('tr_sapn3');
//    End of New Work 25/08/2022
    }
 else if (obj=="6")
    {
        Hide("tr_ImpAlloResp");
        Hide('tr_ImpIntradayMargin');
        Hide('tr_ImpNMassMargin');
        Hide('tr_ExportMargin');
        Hide('tr_ExportDetail');
        Show('tr_ExportSummary');
//    New Work 25/08/2022
//    Hide('tdShow');
        Hide('tr_sapn3');
//    End of New Work 25/08/2022
    }
}

function AlloRespdisplay(obj)
{
    document.getElementById('spanshow2').innerText=obj;
    Show('tr_sapn');
    Hide('tr_sapn2');
    Show('tr_filter');
    Hide('tab1');
    Show('tr_grd');
    Hide('tr_ImpAlloResp');
    Hide('tr_ImpIntradayMargin');
    Hide('tr_ImpNMassMargin');
    Hide('tr_ExportMargin');
    Hide('tr_ExportDetail');
    Hide('tr_ExportSummary');
//    New Work 25/08/2022
//    Hide('tdShow');
    Hide('tr_sapn3');
//    End of New Work 25/08/2022
//    fn_ImportType('0');
    document.getElementById('ddlImportType').value='0';
    alert('Import Allocation Response Successfully Done.');
    height();
}

function IntraDayMarginpdisplay(obj)
{
    document.getElementById('spanshow2').innerText=obj;
    Show('tr_sapn');
    Hide('tr_sapn2');
    Show('tr_filter');
    Hide('tab1');
    Show('tr_grd');
    Hide('tr_ImpAlloResp');
    Hide('tr_ImpIntradayMargin');
    Hide('tr_ImpNMassMargin');
    Hide('tr_ExportMargin');
    Hide('tr_ExportDetail');
    Hide('tr_ExportSummary');
//    New Work 25/08/2022
//    Hide('tdShow');
    Hide('tr_sapn3');
//    End of New Work 25/08/2022
//    fn_ImportType('0');
    document.getElementById('ddlImportType').value='0';
    alert('Import IntraDay Margins Successfully Done.');
    height();
}

function NMassMarginpdisplay(obj)
{
    document.getElementById('spanshow2').innerText=obj;
    Show('tr_sapn');
    Hide('tr_sapn2');
    Show('tr_filter');
    Hide('tab1');
    Show('tr_grd');
    Hide('tr_ImpAlloResp');
    Hide('tr_ImpIntradayMargin');
    Hide('tr_ImpNMassMargin');
    Hide('tr_ExportMargin');
    Hide('tr_ExportDetail');
    Hide('tr_ExportSummary');
//    New Work 25/08/2022
//    Hide('tdShow');
    Hide('tr_sapn3');
//    End of New Work 25/08/2022
//    fn_ImportType('0');
    document.getElementById('ddlImportType').value='0';
    alert('Import NMASS Margins Successfully Done.');
    height();
}

function NoImportFiledisplay(obj)
{
    document.getElementById('spanshow2').innerText=obj;
    Show('tr_sapn');
    Hide('tr_sapn2');
    Show('tr_filter');
    Hide('tab1');
    Show('tr_grd');
    Hide('tr_ImpAlloResp');
    Hide('tr_ImpIntradayMargin');
    Hide('tr_ImpNMassMargin');
    Hide('tr_ExportMargin');
    Hide('tr_ExportDetail');
    Hide('tr_ExportSummary');
//    New Work 25/08/2022
//    Hide('tdShow');
    Hide('tr_sapn3');
//    End of New Work 25/08/2022
    document.getElementById('ddlImportType').value='0';
    alert('Selected File Cannot Be Blank!');
    height();
}

function GnrcDetCallBackPanel_Methods(WhichCall)
{
    Show("divLoadingDet");
    cDBtnExcel.SetEnabled(false);
    cDBtnExcel.SetText('Generating File...Please Wait...');
//    New Work 25/08/2022
//    Hide('tdShow');
    Hide('tr_sapn3');
//    End of New Work 25/08/2022
    cGnrcDetCallBackPanel.PerformCallback(WhichCall+'~');
}
function GnrcDetCallBackPanel_EndCallBack()
{
    if(cGnrcDetCallBackPanel.cpIsSpData!=undefined)
    {
        if(cGnrcDetCallBackPanel.cpIsSpData=="DetailExport")
            GetObjectID('BtnDetailExport').click();
    }
    Hide("divLoadingDet");
    cDBtnExcel.SetEnabled(true);
    cDBtnExcel.SetText('Export Detail');
    document.getElementById('ddlImportType').value='0';
    Hide('tr_ImpAlloResp');
    Hide('tr_ImpIntradayMargin');
    Hide('tr_ImpNMassMargin');
    Hide('tr_ExportMargin');
    Hide('tr_ExportDetail');
    Hide('tr_ExportSummary');
//    New Work 25/08/2022
//    Hide('tdShow');
    Hide('tr_sapn3');
//    End of New Work 25/08/2022
    Height('350','350'); 
}

function GnrcSumCallBackPanel_Methods(WhichCall)
{
    Show("divLoadingSum");
    cSBtnExcel.SetEnabled(false);
    cSBtnExcel.SetText('Generating File...Please Wait...');
//    New Work 25/08/2022
//    Hide('tdShow');
    Hide('tr_sapn3');
//    End of New Work 25/08/2022
    cGnrcSumCallBackPanel.PerformCallback(WhichCall+'~');
}

function GnrcSumCallBackPanel_EndCallBack()
{
    if(cGnrcSumCallBackPanel.cpIsSpData!=undefined)
    {
        if(cGnrcSumCallBackPanel.cpIsSpData=="SummaryExport")
            GetObjectID('BtnSummaryExport').click();
    }
    Hide("divLoadingSum");
    cSBtnExcel.SetEnabled(true);
    cSBtnExcel.SetText('Export Summary');
    document.getElementById('ddlImportType').value='0';
    Hide('tr_ImpAlloResp');
    Hide('tr_ImpIntradayMargin');
    Hide('tr_ImpNMassMargin');
    Hide('tr_ExportMargin');
    Hide('tr_ExportDetail');
    Hide('tr_ExportSummary');
//    New Work 25/08/2022
//    Hide('tdShow');
    Hide('tr_sapn3');
//    End of New Work 25/08/2022
    Height('350','350'); 
}
//End of New Work 18/08/2022

//New Work 24/08/2022
//New Work 25/08/2022
//function OnAllCheckedChanged() 
//{
//    Show('tdShow');
//    cCbpComon.PerformCallback('Summary');
//}

//function CbpComon_EndCallBack() 
//{
//    //alert(cCbpComon.cpSummary); 
//    if (cCbpComon.cpSummary != null) {
//        document.getElementById("DivSummary").innerHTML = cCbpComon.cpSummary;
//    }
//}
function fnShowCollateralSummaryAmount(obj,obj1,obj2,obj3)
{    
    Show('tr_sapn3');
    document.getElementById('spanshow2').innerText=obj3;
    document.getElementById('spanshow7').innerText=obj;
    document.getElementById('spanshow9').innerText=obj1;
    document.getElementById('spanshow11').innerText=obj2;
    Show('tr_sapn');
    Hide('tr_sapn2');
    Show('tr_filter');
    Hide('tab1');
    Show('tr_grd');
    document.getElementById('ddlImportType').value='0';
    Hide('tr_ImpAlloResp');
    Hide('tr_ImpIntradayMargin');
    Hide('tr_ImpNMassMargin');
    Hide('tr_ExportMargin');
    Hide('tr_ExportDetail');
    Hide('tr_ExportSummary');
    //alert('                             Allocation Batch Summary:                                Allocations:- '+obj+' | De-Allocations: '+obj1+' | Net Allocations: '+obj2+'');
//    alert('Allocation Batch Summary:                                        \nAllocations:- '+obj+' \nDe-Allocations:- '+obj1+' \nNet Allocations:- '+obj2+'');
    height();
}
//End of New Work 25/08/2022
//End of New Work 24/08/2022
    FieldName='lstSlection';
    </script>  
    
<%--New Work 25/07/2024--%>
<script type="text/javascript">
 function SelectAllCheckboxes(chk) 
  {
    $('#<%=chktfilter.ClientID %>').find("input:checkbox").each(function() 
    {
        if (this != chk) {
            this.checked = chk.checked;
        }
    });
  }
</script> 
<%--End of New Work 25/07/2024--%>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server" autocomplete="off">
        
        <asp:ScriptManager ID="ScriptManager1" runat="server">  
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
                        <strong><span id="SpanHeader" style="color: #000099">Collateral Allocation Centre</span></strong></td>
                    <%--New Work 07/08/2022--%>
                    <td class="EHEADER" width="15%" id="tr_filter" style="height: 20px">
                        <a href="javascript:void(0);" onclick="Filter();"><span style="color: Blue; text-decoration: underline;
                            font-size: 8pt; font-weight: bold">Filter</span></a>
                    </td>
                    <%--End of New Work 07/08/2022--%>
                </tr>
            </table>
            <table id="tab1" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td>
                        <table>
                            <tr>
                                <td class="gridcellleft">
                                    <table border="10" cellpadding="1" cellspacing="1">
                                        <tr>
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                Date
                                            </td>
                                            <td class="gridcellleft">
                                                <dxe:ASPxDateEdit ID="DtTo" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                    Font-Size="10px" Width="108px" ClientInstanceName="DtTo">
                                                    <dropdownbutton text="To">
                                                </dropdownbutton>
                                                </dxe:ASPxDateEdit>
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
                                                Report View :</td>
                                            <td>
                                                <asp:DropDownList ID="DLLRptView" runat="server" Width="250px" Font-Size="10px" onchange="fn_ReportView(this.value)">
                                                    <asp:ListItem Value="1">Collateral Summary</asp:ListItem>
                                                    <asp:ListItem Value="2">Holdings</asp:ListItem>
                                                    <asp:ListItem Value="3">Detail Working</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            
                            <tr id="tr_CashRequired">
                                <td class="gridcellleft">
                                    <table border="10" cellpadding="1" cellspacing="1">
                                        <tr>
                                            <td bgcolor="#B7CEEC">
                                                Cash Collateral (%)
                                            </td>
                                            <td bgcolor="#B7CEEC">
                                                <dxe:ASPxTextBox ID="txtCashReq" runat="server" HorizontalAlign="Right" Width="100px" ClientInstanceName="CtxtCashReq">
                                                    <masksettings mask="&lt;0..9999999999g&gt;" includeliterals="DecimalSymbol" />
                                                    <validationsettings errordisplaymode="None"></validationsettings>
                                                </dxe:ASPxTextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <%--New Work 25/07/2024--%>
                            <tr id="tr_filtercolumns">
                                <td class="gridcellleft">
                                    <table border="10" cellpadding="1" cellspacing="1">
                                        <tr valign="top">
                                            <td id="td_btnfiltercolumn" class="gridcellleft" bgcolor="#B7CEEC">
                                                <asp:CheckBox ID="chkfiltercolumns" runat="server" onclick="fncolumnsdisplay(this)" />
                                                Hide Columns
                                            </td>
                                            <td id="td_lstfiltercolumn">
                                                <table>
                                                    <tr style="display:none;">
                                                        <td class="gridcellleft">
                                                            <asp:CheckBox ID="chkAll" runat="server" onclick="javascript:SelectAllCheckboxes(this);"
                                                                Checked="false" /><span style="font-family: Verdana; color: Teal; font-size: x-small;"><b>Check/UnCheck
                                                                    ALL</b></span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div style="overflow: auto; border: 1px black solid; scrollbar-base-color: #C0C0C0">
                                                                <asp:CheckBoxList ID="chktfilter" runat="server" RepeatDirection="Horizontal" Width="600px"
                                                                    RepeatColumns="10">
                                                                    <asp:ListItem Value="T1Payin" Selected="False">T1Payin</asp:ListItem>
                                                                    <asp:ListItem Value="FundsCC" Selected="False">FundsCC</asp:ListItem>
                                                                    <asp:ListItem Value="CashCollatCC" Selected="False">CashCollatCC</asp:ListItem>
                                                                    <asp:ListItem Value="NetCashCC" Selected="False">NetCashCC</asp:ListItem>
                                                                    <asp:ListItem Value="NonCashCC" Selected="False">NonCashCC</asp:ListItem>
                                                                    <asp:ListItem Value="ReqdCash" Selected="False">ReqdCash</asp:ListItem>
                                                                    <asp:ListItem Value="AvlblMargn" Selected="False">AvlblMargn</asp:ListItem>
                                                                </asp:CheckBoxList>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <%--End of New Work 25/07/2024--%>
                            <%--New Work 07/08/2022--%>
                            <tr id="tr_RadioScreenExcel">
                                <td class="gridcellleft">
                                    <table>
                                        <tr>
                                            <td id="Td_RadioBtnScreen" class="gridcellleft">
                                                <asp:RadioButton ID="rbScreen" runat="server" GroupName="f" Checked="True" onclick="RBShowHide(this.value)" />Screen
                                            </td>
                                             <td id="Td_RadioBtnExcel" class="gridcellleft">
                                                <asp:RadioButton ID="rbExcel" runat="server" GroupName="f"  onclick="RBShowHide(this.value)" />Excel
                                            </td>
                                        </tr>
                                    </table>
                                 </td>
                            </tr>
                            <%--End of New Work 07/08/2022--%>
                            <tr>
                                <td class="gridcellleft">
                                    <table>
                                        <tr>
                                            <%--New Work 07/08/2022--%>
                                            <td id="td_btnshow" class="gridcellleft">
                                                <asp:Button ID="btnshow" runat="server" CssClass="btnUpdate" Height="20px" Text="Show" AccessKey="S"
                                                    ToolTip="Press Alt+S to Generate the Report." Width="101px" OnClientClick="selecttion()" OnClick="btnshow_Click" />
                                            </td>
                                            <%--End of New Work 07/08/2022--%>
                                            <td id="Td_Export" class="gridcellleft">                                                
                                                <dxe:ASPxButton ID="aBtnExcel" runat="server" AutoPostBack="False" ClientInstanceName="cBtnExcel" AccessKey="E"
                                                    Text="Export To Excel" ToolTip="Press Alt+E to Generate the Excel." >
                                                    <ClientSideEvents Click="function(s,e){GnrcCallBackPanel_Methods('Export');}" />
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
            <%--New Work 07/08/2022--%>
            <table>
                <tr>
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
            <table border="1">
                <tr id="tr_sapn">
                    <td colspan="2">
                        <span id="spanshow1" style="color: Blue; font-weight: bold">As On :</span>&nbsp;&nbsp;&nbsp;<span
                            id="spanshow2" style="color: Blue; font-weight: bold">&nbsp;&nbsp;&nbsp;</span> 
                        &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btngenerate" runat="server" CssClass="btnUpdate" Height="20px" Text="Generate Allocation Batch"
                            Width="200px" OnClick="btngenerate_Click" AccessKey="G" ToolTip="Press Alt+G to Generate Allocation Batch." />
                        <%--New Work 25/08/2022--%>
                        &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="BtnAllocSum" runat="server" CssClass="btnUpdate" Height="20px" Text="Show Allocation Summary"
                            Width="224px" OnClick="BtnAllocSum_Click" AccessKey="A" ToolTip="Press Alt+A to Show Allocation Summary." />
                        <%--End of New Work 25/08/2022--%>
                        <%--New Work 18/08/2022--%>
                        &nbsp;&nbsp;&nbsp;<asp:Label ID="lblImprtType" Text="Action :" runat="server" ForeColor="blue" Font-Bold="true"></asp:Label>                                
                        &nbsp;&nbsp;&nbsp;<asp:DropDownList ID="ddlImportType" runat="server" Width="250px" Font-Size="10px" onchange="fn_ImportType(this.value)">
                            <asp:ListItem Value="0">--Select Type--</asp:ListItem>
                            <asp:ListItem Value="1">Import Allocation Response</asp:ListItem>
                            <asp:ListItem Value="2">Import IntraDay Margins</asp:ListItem>
                            <asp:ListItem Value="3">Import NMASS Margins</asp:ListItem>
                            <asp:ListItem Value="4">Export Holdings</asp:ListItem>
                            <asp:ListItem Value="5">Export Detail Report</asp:ListItem>
                            <asp:ListItem Value="6">Export Summary Report</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="BtnRefresh" runat="server" CssClass="btnUpdate" Height="20px" Text="Refresh" 
                            Width="205px" OnClick="BtnRefresh_Click" AccessKey="R" ToolTip="Press Alt+R to Refresh the Page." />
                        <%--&nbsp;&nbsp;&nbsp;<asp:ImageButton ID="BtnRefresh" OnClick="BtnRefresh_Click" ImageUrl="../images/refresh1.jpg" ForeColor="Blue"
                                         runat="server" Width="40px" Height="20px" ToolTip="Refresh" />--%>
                        <%--&nbsp;&nbsp;&nbsp;<asp:Button ID="BtnHoldExport" runat="server" CssClass="btnUpdate" Height="20px" Text="Export Holdings" 
                            Width="200px" OnClick="BtnHoldExport_Click" />--%>
                        <%--End of New Work 18/08/2022--%>
                    </td>
                </tr>
                <tr id="tr_sapn2">
                    <td colspan="2">
                        <span id="spanshow3" style="color: Blue; font-weight: bold">Holdings For :</span>&nbsp;&nbsp;&nbsp;<span
                            id="spanshow4" style="color: Blue; font-weight: bold">&nbsp;&nbsp;&nbsp;</span>
                    </td>
                </tr>
                <%--New Work 18/08/2022--%>
                <tr id="tr_ImpAlloResp">
                    <td class="lt1" style="height: 22px">
                        <h5>
                            Imports NSE Clearings' "MemCode_ALLOC_DDMMYYYY.Snn" files to update Error/Success Codes for exported batches.
                        </h5>
                        <asp:Label ID="lblSelectAlloRespFile" runat="server" Text="Select File:" ForeColor="blue"></asp:Label>
                        <asp:FileUpload ID="OFDSelectFile" runat="server" Width="362px" />
                         &nbsp;<asp:Button ID="BtnImpAlloResp" runat="server" Text="Import File" OnClick="BtnImpAlloResp_Click" CssClass="btn" Width="220px" />
                    </td>
                </tr>
                <tr id="tr_ImpIntradayMargin">
                    <td class="lt1" style="height: 22px">
                        <h5>
                            Imports NSE's  C_MG13/F_MG13/X_MG13 Intra-Day & EOD Files.
                        </h5>
                        <asp:Label ID="lblSelectIntradayMarginFile" runat="server" Text="Select File:" ForeColor="blue"></asp:Label>
                        <asp:FileUpload ID="MarketStatsSelectFile" runat="server" Width="362px" />
                         &nbsp;<asp:Button ID="BtnImpIntradayMargin" runat="server" Text="Import File" OnClick="BtnImpIntradayMargin_Click" CssClass="btn" Width="220px" />
                    </td>
                </tr>
                <tr id="tr_ImpNMassMargin">
                    <td class="lt1" style="height: 22px">
                        <h5>
                            Imports NSE Trading Members' Intra-Day Margin Files From NMass Application
                        </h5>
                        <asp:Label ID="lblSelectNMassMarginFile" runat="server" Text="Select File:" ForeColor="blue"></asp:Label>
                        <asp:FileUpload ID="OFDNMassMarginSelectFile" runat="server" Width="362px" />
                         &nbsp;<asp:Button ID="BtnImpNMassMargin" runat="server" Text="Import File" OnClick="BtnImpNMassMargin_Click" CssClass="btn" Width="220px" />
                    </td>
                </tr>
                <tr id="tr_ExportMargin">
                    <td class="lt1" style="height: 22px">
                        <dxe:ASPxButton ID="HBtnExcel" runat="server" AutoPostBack="False" ClientInstanceName="cHBtnExcel"
                            Text="Export Holdings" Width="220px" AccessKey="H" ToolTip="Press Alt+H to Export Holdings.">
                            <ClientSideEvents Click="function(s,e){GnrcCallBackPanel_Methods('HoldingExport');}" />
                        </dxe:ASPxButton>
                    </td>
                </tr>
                <tr id="tr_ExportDetail">
                    <td class="lt1" style="height: 22px">
                        <dxe:ASPxButton ID="DBtnExcel" runat="server" AutoPostBack="False" ClientInstanceName="cDBtnExcel"
                            Text="Export Detail" Width="220px" AccessKey="D" ToolTip="Press Alt+D to Export Detail.">
                            <ClientSideEvents Click="function(s,e){GnrcDetCallBackPanel_Methods('DetailExport');}" />
                        </dxe:ASPxButton>
                    </td>
                </tr>
                <tr id="tr_ExportSummary">
                    <td class="lt1" style="height: 22px">
                        <dxe:ASPxButton ID="SBtnExcel" runat="server" AutoPostBack="False" ClientInstanceName="cSBtnExcel"
                            Text="Export Summary" Width="220px" AccessKey="Y" ToolTip="Press Alt+Y to Export Summary.">
                            <ClientSideEvents Click="function(s,e){GnrcSumCallBackPanel_Methods('SummaryExport');}" />
                        </dxe:ASPxButton>
                    </td>
                </tr>
                <%--End of New Work 18/08/2022--%>
                <%--New Work 25/08/2022--%>
                <tr id="tr_sapn3">
                    <td colspan="2">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <span id="spanshow5" style="color: Red; font-weight: bold">Allocation Batch Summary:</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <span id="spanshow6" style="color: Red; font-weight: bold">Allocations:-</span>&nbsp;&nbsp;&nbsp;
                        <span id="spanshow7" style="color: Blue; font-weight: bold">&nbsp;&nbsp;</span>
                        &nbsp;&nbsp;&nbsp;<span id="spanshow8" style="color: Red; font-weight: bold">De-Allocations:-</span>&nbsp;&nbsp;&nbsp;
                        <span id="spanshow9" style="color: Blue; font-weight: bold">&nbsp;&nbsp;&nbsp;</span>
                        &nbsp;&nbsp;&nbsp;<span id="spanshow10" style="color: Red; font-weight: bold">Net Allocations:-</span>&nbsp;&nbsp;&nbsp;
                        <span id="spanshow11" style="color: Blue; font-weight: bold">&nbsp;&nbsp;&nbsp;</span>
                    </td>
                </tr>
                <%--End of New Work 25/08/2022--%>
                <tr id="tr_grd">
                    <td colspan="2">
                        <table style="width: 100%">
                            <tr>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <%--<div style="overflow: auto; height: 550px; width: 1600px;">--%>
                                                <asp:GridView ID="grdcollallocation" runat="server" Width="100%" BorderColor="CornflowerBlue" DataKeyNames="ClientCode"
                                                ShowFooter="True" AutoGenerateColumns="false" AllowPaging="true" BorderStyle="Solid" EmptyDataText="No Data Available !"
                                                AllowSorting="true" BorderWidth="2px" CellPadding="4" ForeColor="#0000C0" PageSize="20000" OnRowDataBound="grdcollallocation_RowDataBound">
                                                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True"></FooterStyle>
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Client Name" HeaderStyle-Font-Bold="true">
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="true"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblClientName" runat="server" Text='<%# Eval("ClientName")%>' CssClass="gridstyleheight1"></asp:Label>
                                                            <asp:Label ID="lblClientId" runat="server" Text='<%# Eval("ClientID")%>' Visible="false"></asp:Label>
                                                            <asp:Label ID="lblSegment" runat="server" Text='<%# Eval("SegName")%>' Visible="false"></asp:Label>
                                                            <asp:Label ID="lblFundsCCAmt" runat="server" Text='<%# Eval("FundsCC")%>' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Code" HeaderStyle-Font-Bold="true">
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="true"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblClientCode" runat="server" Text='<%# Eval("ClientCode")%>'
                                                                CssClass="gridstyleheight1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Margin" HeaderStyle-Font-Bold="true">
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="true"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTotalMargin" runat="server" Text='<%# Eval("TotalMargin")%>' CssClass="gridstyleheight1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="FundsTM" HeaderStyle-Font-Bold="true">
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="true"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblNetFundsTM" runat="server" Text='<%# Eval("NetFundsTM")%>' CssClass="gridstyleheight1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="T1Payin" HeaderStyle-Font-Bold="true">
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="true"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblT1Payin" runat="server" Text='<%# Eval("T1Payin")%>' CssClass="gridstyleheight1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="FundsCC" HeaderStyle-Font-Bold="true">
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="true"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblFundsCC" runat="server" Text='<%# Eval("FundsCC")%>' CssClass="gridstyleheight1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="CashCollatCC" HeaderStyle-Font-Bold="true">
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="true"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCashCollatCC" runat="server" Text='<%# Eval("CashCollatCC")%>' CssClass="gridstyleheight1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="NetCashCC" HeaderStyle-Font-Bold="true">
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="true"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblNetCash" runat="server" Text='<%# Eval("NetCash")%>'
                                                                CssClass="gridstyleheight1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="NonCashCC" HeaderStyle-Font-Bold="true">
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="true"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblNetNonCash" runat="server" Text='<%# Eval("NetNonCash")%>'
                                                                CssClass="gridstyleheight1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="ReqdCash" HeaderStyle-Font-Bold="true">
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="true"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblReqCashMargin" runat="server" Text='<%# Eval("ReqdCashForMrgn")%>' CssClass="gridstyleheight1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="AvlblMargn" HeaderStyle-Font-Bold="true">
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="true"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAvlMargin" runat="server" Text='<%# Eval("AvlblForMargn")%>' CssClass="gridstyleheight1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Shortage" HeaderStyle-Font-Bold="true">
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="true"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblShortage" runat="server" Text='<%# Eval("Shortage")%>' CssClass="gridstyleheight1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <%--New Work 28/08/2022--%>
                                                    <asp:TemplateField HeaderText="OverAlloc" HeaderStyle-Font-Bold="true">
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="true"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblOverAlloc" runat="server" Text='<%# Eval("OverAlloc")%>' CssClass="gridstyleheight1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <%--End of New Work 28/08/2022--%>
                                                    <asp:TemplateField HeaderText="De-Allocate" HeaderStyle-Font-Bold="true">
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Right"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="true"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtExcsFundsCC" Font-Size="Medium" Width="100px" Style="text-align: right;" Onkeypress="return isNumberKey(event)"
                                                                runat="server" CssClass="gridstyleheight1" Text='<%# Eval("ExcsFundsCC")%>'></asp:TextBox>
                                                            <asp:Label ID="lblExcsFundsCC" Font-Size="Medium" Width="100px" runat="server" Text='<%# Eval("ExcsFundsCC")%>' 
                                                            CssClass="gridstyleheight1" Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="ReviseUP" HeaderStyle-Font-Bold="true">
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="true"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblReviseUP" runat="server" Text='<%# Eval("ReviseUP")%>' CssClass="gridstyleheight1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="ReviseDown" HeaderStyle-Font-Bold="true">
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="true"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblReviseDown" runat="server" Text='<%# Eval("ReviseDown")%>' CssClass="gridstyleheight1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Allocate" HeaderStyle-Font-Bold="true">
                                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txtMandatoryAlloc" Font-Size="Medium" Width="100px" Style="text-align: right;" Onkeypress="return isNumberKey(event)"
                                                                runat="server" CssClass="gridstyleheight1" Text='<%# Eval("MandatoryAlloc")%>'></asp:TextBox>
                                                            <asp:Label ID="lblMandatoryAlloc" Font-Size="Medium" Width="100px" runat="server" Text='<%# Eval("MandatoryAlloc")%>'
                                                                CssClass="gridstyleheight1" Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Scrip" HeaderStyle-Font-Bold="true">
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="true"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblScrip" runat="server" Text='<%# Eval("Scrip")%>' CssClass="gridstyleheight1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="ISIN" HeaderStyle-Font-Bold="true">
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="true"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblISIN" runat="server" Text='<%# Eval("ISIN")%>' CssClass="gridstyleheight1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Liquid?" HeaderStyle-Font-Bold="true">
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="true"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblIsLiquid" runat="server" Text='<%# Eval("IsLiquid")%>' CssClass="gridstyleheight1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Holding" HeaderStyle-Font-Bold="true">
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="true"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblHolding" runat="server" Text='<%# Eval("Holding")%>' CssClass="gridstyleheight1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Price" HeaderStyle-Font-Bold="true">
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="true"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price")%>' CssClass="gridstyleheight1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="HairCut" HeaderStyle-Font-Bold="true">
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="true"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblHairCut" runat="server" Text='<%# Eval("HairCut")%>' CssClass="gridstyleheight1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="CollatValue" HeaderStyle-Font-Bold="true">
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="true"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCollatValue" runat="server" Text='<%# Eval("CollatValue")%>' CssClass="gridstyleheight1"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <%--New Work 24/08/2022--%>
                                                    <%--<asp:TemplateField>
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkSelected" runat="server" />
                                                        </ItemTemplate>
                                                        <HeaderTemplate>
                                                            <asp:CheckBox ID="chkAll" runat="server" onclick="javascript:SelectAllCheckboxes(this);" />
                                                        </HeaderTemplate>
                                                    </asp:TemplateField>--%>                                                    
                                                    <asp:TemplateField HeaderText="Select">
                                                        <HeaderTemplate>
                                                            <asp:CheckBox ID="checkAll" runat="server" AutoPostBack="true" OnCheckedChanged="CheckUnCheckAll" />
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <dxe:ASPxCheckBox ID="chkSelected" runat="server" BackColor="White" ClientInstanceName="cchkSelected"
                                                                ToolTip="Select one">
                                                                <%--New Work 24/08/2022--%>
                                                                <%--<ClientSideEvents CheckedChanged="OnAllCheckedChanged"></ClientSideEvents>--%>
                                                                <%--End of New Work 24/08/2022--%>
                                                            </dxe:ASPxCheckBox>
                                                            <asp:Label ID="lblClientName1" runat="server" Visible="false" Text='<%# Eval("ClientName")%>'></asp:Label>
                                                            <asp:Label ID="lblClientId1" runat="server" Text='<%# Eval("ClientID")%>' Visible="false"></asp:Label>
                                                            <asp:Label ID="lblSegName" runat="server" Text='<%# Eval("SegName")%>' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <%--End of New Work 24/08/2022--%>
                                                </Columns>
                                                <RowStyle BackColor="#FFFFFF" ForeColor="#330099" BorderColor="#BFD3EE" BorderStyle="Double"
                                                    BorderWidth="1px"></RowStyle>
                                                <EditRowStyle BackColor="#E59930"></EditRowStyle>
                                                <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" Font-Bold="True"></SelectedRowStyle>
                                                <PagerStyle ForeColor="White" HorizontalAlign="Center"></PagerStyle>
                                                <HeaderStyle ForeColor="Black" BorderWidth="1px" CssClass="EHEADER" BorderColor="AliceBlue"
                                                    Font-Bold="False"></HeaderStyle>
                                            </asp:GridView>
                                            <%--</div>--%>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnshow" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                                
                                <%--New Work 24/08/2022--%>
                                <%--New Work 24/08/2022--%>
                                <%--<td id="tdShow" valign="top">
                                    <dxcp:ASPxCallbackPanel ID="CbpComon" runat="server" ClientInstanceName="cCbpComon"
                                            OnCallback="CbpComon_Callback" BackColor="Transparent" Width="100%">
                                            <PanelCollection>
                                                <dxp:panelcontent runat="server">
                                                <div id="DivSummary" style="width:230px;margin-left:40px;"></div>
                                                 <br />
                                                </dxp:panelcontent>
                                            </PanelCollection>
                                            <ClientSideEvents EndCallback="function (s, e) {CbpComon_EndCallBack();}" />
                                      </dxcp:ASPxCallbackPanel>
                                </td>--%>
                                <%--End of New Work 24/08/2022--%>
                                <%--End of New Work 24/08/2022--%>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <%--End of New Work 07/08/2022--%>
            <div id="divLoading">
                <dxcp:ASPxCallbackPanel ID="GnrcCallBackPanel" runat="server" ClientInstanceName="cGnrcCallBackPanel"
                    BackColor="White" OnCallback="GnrcCallBackPanel_Callback" LoadingPanelText="Generating File...Please Wait..." LoadingPanelStyle-Font-Size="Medium">
                    <PanelCollection>
                        <dxp:panelcontent>
                        </dxp:panelcontent>
                    </PanelCollection>
                    <ClientSideEvents EndCallback="function(s, e) {
	                                                            GnrcCallBackPanel_EndCallBack(); }" />
                </dxcp:ASPxCallbackPanel>
            </div>
            <%--New Work 18/08/2022--%>  
            <div id="divLoadingDet">
                <dxcp:ASPxCallbackPanel ID="GnrcDetCallBackPanel" runat="server" ClientInstanceName="cGnrcDetCallBackPanel"
                    BackColor="White" OnCallback="GnrcDetCallBackPanel_Callback" LoadingPanelText="Generating File...Please Wait..." LoadingPanelStyle-Font-Size="Medium">
                    <PanelCollection>
                        <dxp:panelcontent>
                        </dxp:panelcontent>
                    </PanelCollection>
                    <ClientSideEvents EndCallback="function(s, e) {
	                                                            GnrcDetCallBackPanel_EndCallBack(); }" />
                </dxcp:ASPxCallbackPanel>
            </div>
            <div id="divLoadingSum">
                <dxcp:ASPxCallbackPanel ID="GnrcSumCallBackPanel" runat="server" ClientInstanceName="cGnrcSumCallBackPanel"
                    BackColor="White" OnCallback="GnrcSumCallBackPanel_Callback" LoadingPanelText="Generating File...Please Wait..." LoadingPanelStyle-Font-Size="Medium">
                    <PanelCollection>
                        <dxp:panelcontent>
                        </dxp:panelcontent>
                    </PanelCollection>
                    <ClientSideEvents EndCallback="function(s, e) {
	                                                            GnrcSumCallBackPanel_EndCallBack(); }" />
                </dxcp:ASPxCallbackPanel>
            </div>
            <%--End of New Work 18/08/2022--%>  
            <div style="display: none">
                <asp:Button ID="btnExcelExport" runat="server" BackColor="#DDECFE" BorderStyle="None"
                    OnClick="btnExcelExport_Click" />
                 <%--New Work 18/08/2022--%>
                 <asp:Button ID="BtnHoldExport" runat="server" BackColor="#DDECFE" BorderStyle="None" 
                    OnClick="BtnHoldExport_Click" />
                 <asp:Button ID="BtnDetailExport" runat="server" BackColor="#DDECFE" BorderStyle="None" 
                    OnClick="BtnDetailExport_Click" />
                 <asp:Button ID="BtnSummaryExport" runat="server" BackColor="#DDECFE" BorderStyle="None" 
                    OnClick="BtnSummaryExport_Click" />
                 <%--End of New Work 18/08/2022--%>
            </div>
            <%--New Work 18/08/2022--%>
            <asp:HiddenField ID="hdfname" runat="server" />
            <%--End of New Work 18/08/2022--%>
        </div>
    </form>
</body>
</html>
