<%@ page language="C#" autoeventwireup="true" inherits="management_AccountsTradeEntry, App_Web_co654op-" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export" Namespace="DevExpress.Web.ASPxGridView.Export"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Untitled Page</title>
   
    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.min.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/loaddata.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>
    
    <script type="text/javascript" src="../JSFUNCTION/GenericJscript.js"></script>
    
    <link type="text/css" href="../CSS/PageStyle.css" rel="Stylesheet" />
    <link type="text/css" href="../CSS/AjaxStyle.css" rel="Stylesheet" />
    <style type="text/css">
  .WaterMark
    { 
       vertical-align: middle;
       color: DarkGray;
    }
  .normal
    {
    }
  .divBlue
{ 
	background-color :#7ba5dc;
    vertical-align  : top; 
	text-align: center;
	height:auto ;
	width:auto;
	float:Left;
	border:1px Solid White;
	font-family :Calibri ;
	font-size :small;
	margin:2px; 
	margin-left: 2px;
	padding:2px;	
}
    .DivRoundedBorder
    {
     width:92%;
     background-color:#cfcfcf;
    }
    .DivRoundedBorderChngd
    {
     width:92%;
     background-color:#b7ceec;
    } 
     
  b.rtop, b.rbottom { display:block;background:#DDECFE;}
  b.rtop b, b.rbottom b { display:block;height: 1px;overflow: hidden;background: #b7ceec;}
  b.r1 { margin: 0 5px;}
  b.r2 { margin: 0 3px;}
  b.r3 { margin: 0 2px;}
  b.rtop b.r4, b.rbottom b.r4 {	margin: 0 1px;	height: 2px;}

  b.rtop1 b, b.rbottom1 b { display:block;height: 1px;overflow: hidden;background: #c2c2c2;}
 
 </style>

<script type="text/javascript" language="javascript">

//ProtoType
    String.prototype.trim = function() {
        return this.replace(/^\s+|\s+$/g,"");
    }
    String.prototype.ltrim = function() {
        return this.replace(/^\s+/,"");
    }
    String.prototype.rtrim = function() {
        return this.replace(/\s+$/,"");
    }
//
//Global Variable
    FieldName = '';
    mainSubmitBtnClick ='';
    EntryType='';
    UnSavedEntryDtl='';
    UnSavedEntryChr='';
    detailbinded='';
    chargesbinded='';
    CancelEdit='';
//End

function PageLoad()
    {
       cTradeDtMain.Focus();
       //alert('pageload');
      // cComboSegment.PerformCallback('BindSegment~NSE');
//       document.getElementById('HiddenEntryType').value = cComboMode.GetValue().trim();
//       alert(document.getElementById('HiddenEntryType').value);
    } 
function SignOff()
    {
        window.parent.SignOff();
    }
    
function height()
    {
        if(document.body.scrollHeight>=500)
             window.frameElement.height = document.body.scrollHeight;
        else
             window.frameElement.height = '650px';
             window.frameElement.Width = document.body.scrollWidth;
   }
   
function CallAjax(obj1,obj2,obj3,Query)
  {
        var CombinedQuery=new String(Query);
        ajax_showOptions(obj1,obj2,obj3,replaceChars(CombinedQuery),'Main');
  }
  
 
  
function replaceChars(entry)
 {
        out = "+"; // replace this
        add = "--"; // with this
        temp = "" + entry; // temporary holder

        while (temp.indexOf(out)>-1)
         {
            pos= temp.indexOf(out);
            temp = "" + (temp.substring(0, pos) + add + 
            temp.substring((pos + out.length), temp.length));
         }
        return temp;
}

function DateChangeMain(DateObj)
 {
        var Lck ='<%=Session["LCKBNK"] %>';
        var FYS ='<%=Session["FinYearStart"]%>';
        var FYE ='<%=Session["FinYearEnd"]%>'; 
        var LFY ='<%=Session["LastFinYear"]%>';
        var GetDate='<%=Session["ServerDate"]%>';
        
        DevE_CheckForLockDate(DateObj,Lck);
        DevE_CheckForFinYear(DateObj,FYS,FYE,LFY);
        cGridTradeRecord.PerformCallback('DateChange'+'~'+cTradeDtMain.GetText());
 }
   
 function DateChange(DateObj)
    { 
        // alert(DateObj.GetText());
        var Lck ='<%=Session["LCKBNK"] %>';
        var FYS ='<%=Session["FinYearStart"]%>';
        var FYE ='<%=Session["FinYearEnd"]%>'; 
        var LFY ='<%=Session["LastFinYear"]%>';
        var GetDate='<%=Session["ServerDate"]%>';
        
        DevE_CheckForLockDate(DateObj,Lck);
        DevE_CheckForFinYear(DateObj,FYS,FYE,LFY);
//        cComboSegment.PerformCallback('BindSegment~NSE');
        document.getElementById('<%=TxtBrokerName.ClientID%>').focus();
        cCbpPayiDt.PerformCallback('PayinDateBind'+'~'+cTradeDt.GetText());
       }
    
 function PayinDateChange(DateObj)
    { 
     // alert(DateObj.GetText());
        var Lck ='<%=Session["LCKBNK"] %>';
        var FYS ='<%=Session["FinYearStart"]%>';
        var FYE ='<%=Session["FinYearEnd"]%>'; 
        var LFY ='<%=Session["LastFinYear"]%>';
        var GetDate='<%=Session["ServerDate"]%>';
        DevE_CheckForLockDate(DateObj,Lck);
        DevE_CheckForFinYear(DateObj,FYS,FYE,LFY);
  
    }   
 function SetTradeDate()
    {
       cTradeDt.SetText(cTradeDtMain.GetText());
       cCbpPayiDt.PerformCallback('PayinDateBind'+'~'+cTradeDtMain.GetText());
    } 
 
function WaterMarkBroker()
{
if(document.getElementById('<%=TxtBrokerName.ClientID%>').value=="")
   {
     var defaultText="Enter Broker";
     document.getElementById('<%=TxtBrokerName.ClientID%>').value = defaultText;
     document.getElementById('<%=TxtBrokerName.ClientID%>').style.color="gray";
   }
}

function NoWaterMarkBroker()
{
 if(document.getElementById('<%=TxtBrokerName.ClientID%>').value == "Enter Broker")
      document.getElementById('<%=TxtBrokerName.ClientID%>').value = "";
    document.getElementById('<%=TxtBrokerName.ClientID%>').style.color="black";
}

function WaterMarkCust()
{
if(document.getElementById('<%=TxtCustomerName.ClientID%>').value=="")
   {
     var defaultText="Enter Customer";
     document.getElementById('<%=TxtCustomerName.ClientID%>').value = defaultText;
     document.getElementById('<%=TxtCustomerName.ClientID%>').style.color="gray";
   }
}

function NoWaterMarkCust()
{
 if(document.getElementById('<%=TxtCustomerName.ClientID%>').value == "Enter Customer")
      document.getElementById('<%=TxtCustomerName.ClientID%>').value = "";
    document.getElementById('<%=TxtCustomerName.ClientID%>').style.color="black";
}

function keyVal(obj)
 {
 //alert(obj);
 }
function refreshMain()
{
        document.getElementById('<%=TxtBrokerName.ClientID%>').value = "Enter Broker";
        document.getElementById('<%=TxtCustomerName.ClientID%>').value = "Enter Customer";
        cComboExchange.SetText("NSE");
        cComboSegment.SetText("CM");
        cTxtSettlemntNo.SetText("0000000");
        cTxtSettlemntType.SetText("");
        cPayinDate.Text = new Date();
        cTxtContractNote.SetText("0000000");
        document.getElementById('<%=TxtBrokerName_hidden.ClientID%>').value = "";
        document.getElementById('<%=TxtBrokerName.ClientID%>').focus();
        document.getElementById('<%=TxtCustomerName_hidden.ClientID%>').value = "";
        document.getElementById('<%=TxtCustomerName.ClientID%>').focus();
}

function refreshDetail()
{
    document.getElementById('<%=TxtScrip.ClientID%>').value="";
    cComboBoughtSold.SetText("Bought");
    cComboType.SetText("Delivery");
    cTradeTime.SetText("12:00:00");
    cTxtQuantity.SetText("0000000.00");
    cTxtMarketPrice.SetText("0000000.00");
    cTxtUnitBrokrg.SetText("0000000.00");
    cComboServiceTax.SetText("Exclusive");
    cTxtOrderNo.SetText("");
    cTxtTradeNo.SetText("");
    document.getElementById('<%=TxtScrip.ClientID%>').focus();
}

function RefreshCharges()
{
    cComboChargesType.SetText("Stamp Duty");
    cTxtNetAmount.SetText("0000000.00");
       
}

function OnTypeChangeExchng()
{
 // cComboSegment.PerformCallback('BindSegment~'+cComboExchange.GetValue().trim());
}

function OnTypeChangeSegmnt()
{
    if(cComboSegment.GetText()=="CM")
    {
        cTxtSettlemntNo.SetText("0000000");
        cTxtSettlemntType.SetText("");
        cTxtSettlemntNo.SetEnabled(true);
        cTxtSettlemntType.SetEnabled(true);
        cTxtSettlemntNo.Focus(); 
    }
    else
    {
        cTxtSettlemntNo.SetText("2012001");
        cTxtSettlemntType.SetText("F");
        cTxtSettlemntNo.SetEnabled(false);
        cTxtSettlemntType.SetEnabled(false);  
        cPayinDate.Focus(); 
    }
    
}

function AddButtonClick()
{
// alert(document.getElementById('<%=TxtScrip.ClientID%>').value.trim());
 
if(document.getElementById('<%=TxtScrip.ClientID%>').value.trim()==""||document.getElementById('<%=TxtScrip_hidden.ClientID%>').value.trim()==""||document.getElementById('<%=TxtScrip.ClientID%>').value.trim()=="No Record Found")
    {
     alert('Please Enter The Scrip');
     document.getElementById('<%=TxtScrip.ClientID%>').focus();
     return;
    } 
 if(cTxtQuantity.GetText()=="0.00")
    {
     alert('Please Enter The Quantity');
     cTxtQuantity.Focus();
     return;
    }
 
// if(cTxtOrderNo.GetText()=="")
//    {
//     alert('Please Enter The OrderNo');
//     cTxtOrderNo.Focus();
//     return;
//    }
// if(cTxtTradeNo.GetText()=="")
//    {
//     alert('Please Enter The TradeNo');
//     cTxtTradeNo.Focus();
//     return;
//    }
   cGvTradeDtl.PerformCallback('Bind~');
   Div_gv.style.display="inline";
    
}

function DiscardButtonClick()
{
 Div_gv.style.display="none";
 cGvTradeDtl.PerformCallback('Discard~');
}

function Update()
{
  cGvTradeDtl.PerformCallback('Update~');
}

function GvTradeDtl_EndCallBack()
{ 
  height();
  if(cGvTradeDtl.cpMainAdded=="T")
     { 
        cCbpScrip.PerformCallback('ScripBind~'+cComboSegment.GetText().trim()+'~'+cComboExchange.GetValue().trim());
        Div_Detail_Total.style.display="inline";
        Div_Main_Total.style.display="none"; 
        document.getElementById("imgarrowup_Main").style.display='none';
        document.getElementById("imgarrowdown_Main").style.display='inline'; 
        document.getElementById("imgarrowup_Detail").style.display='inline';
        document.getElementById("imgarrowdown_Detail").style.display='none'; 
        //document.getElementById('<%=TxtScrip.ClientID%>').focus();
        cGvTradeDtl.cpMainAdded=null;
     }
  if(cGvTradeDtl.cpMainUpdated=="T")
     { 
        alert('Contract Detail Section Data Successfully Updated');
        cBtnEdit.Focus();
        cGvTradeDtl.cpMainUpdated=null;
     }
  if(cGvTradeDtl.cpMainExistUnSaved=="M") 
     {
        //alert('UnSaved Entry Already Exist for This ContractNote Number');
        cPopUp_ExistEntry.Show();
//        UnSavedEntryDtl="M";
//        cCbpMain.PerformCallback('MainExistBind~'); 
//        mainColorChng();
//        detailColorBack();
        cGvTradeDtl.cpMainExistUnSaved=null;
     }  
  if(cGvTradeDtl.cpMainExistUnSaved!=null) 
     {
          alert('UnSaved Entry Already Exist for This ContractNote Number by User: '+cGvTradeDtl.cpMainExistUnSaved);
          Div_SubmitBtnMain.style.display="inline";
          Div_UpdateBtn.style.display="none";
          Div_EditBtn.style.display="none";
          document.getElementById('<%=TxtBrokerName.ClientID%>').disabled=false;
          document.getElementById('<%=TxtCustomerName.ClientID%>').disabled=false;
          cTxtSettlemntNo.SetEnabled(true);
          cTxtSettlemntType.SetEnabled(true);
          cTxtContractNote.SetEnabled(true);
          cTradeDt.SetEnabled(true);
          cComboExchange.SetEnabled(true); 
          cComboSegment.SetEnabled(true); 
          cPayinDate.SetEnabled(true);
          cTxtBillNo.SetEnabled(true);
          cTxtContractNote.Focus();
          cTxtContractNote.SetText("0000000");
          mainColorChng();
          detailColorBack();
          cGvTradeDtl.cpMainExistUnSaved=null;
     }
   if(cGvTradeDtl.cpDetailExistUnSaved=="D") 
     {
        
        UnSavedEntryDtl="T";
     } 
  if(cGvTradeDtl.cpChargesExistUnSaved=="C") 
     {
        
        UnSavedEntryChr="T"; 
        
     }   
  if(cGvTradeDtl.cpMainExist=="T") 
     {
          alert('Entry Already Exist for This ContractNote Number');
          Div_SubmitBtnMain.style.display="inline";
          Div_UpdateBtn.style.display="none";
          Div_EditBtn.style.display="none";
          document.getElementById('<%=TxtBrokerName.ClientID%>').disabled=false;
          document.getElementById('<%=TxtCustomerName.ClientID%>').disabled=false;
          cTxtSettlemntNo.SetEnabled(true);
          cTxtSettlemntType.SetEnabled(true);
          cTxtContractNote.SetEnabled(true);
          cTradeDt.SetEnabled(true);
          cComboExchange.SetEnabled(true); 
          cComboSegment.SetEnabled(true); 
          cPayinDate.SetEnabled(true);
          cTxtBillNo.SetEnabled(true);
          cTxtContractNote.Focus();
          cTxtContractNote.SetText("0000000");
          mainColorChng();
          detailColorBack();
//        EntryType="Edit";
//        UnSavedEntryDtl="ME";
//        mainColorChng();
//        detailColorBack();
//        cCbpMain.PerformCallback('MainEditBind~'); 
          cGvTradeDtl.cpMainExist=null;
     }  
 if(cGvTradeDtl.cpDetailAdd=="T")
    {
        cTradeTime.SetText("12:00:00");
        cTxtQuantity.SetText("0000000.00");
        cTxtMarketPrice.SetText("0000000.00");
        cTxtUnitBrokrg.SetText("0000000.00");
        cComboServiceTax.SetText("Exclusive");
        cTxtOrderNo.SetText("");
        cTxtTradeNo.SetText("");
        cTradeTime.Focus();
        cGvTradeDtl.cpDetailAdd=null;  
    }
    
   if(cGvTradeDtl.cpDetailBinded == "T")
   {
    detailbinded='';     
   }
   if(cGvTradeDtl.cpDetailGVShow == "T")
   {
    Div_gv.style.display = "inline";
   }
//    else if(cGvTradeDtl.cpDetailAdd==null)
//    {
//    
//    }
 if(cGvTradeDtl.cpNoRow == "T")
     {
        alert('Row Successfully Deleted.');
        Div_gv.style.display = "none";
        cGvTradeDtl.cpNoRow=null;
     }
 if(cGvTradeDtl.cpAfterRowDeleted=="D")
     { 
     alert('Row Successfully Deleted.');
     cGvTradeDtl.cpAfterRowDeleted=null;
     }
 if(cGvTradeDtl.cpUpdate=="T")     
    {
     if(cGvTradeDtl.cpGiveMsg=="scrip")
         {
            alert('Please Enter The Scrip');
            cGvTradeDtl.cpGiveMsg=null;
            return;
         }       
     if(cGvTradeDtl.cpGiveMsg=="quantity")
         {
             alert('Please Enter The Quantity');
             cGvTradeDtl.cpGiveMsg=null;
             return;
         }
     if(cGvTradeDtl.cpGiveMsg=="marketPrice")
         {
             alert('Please Enter The Market Price');
             cGvTradeDtl.cpGiveMsg=null;
             return;
         }
     if(cGvTradeDtl.cpGiveMsg=="unitBrkg")
         {
             alert('Please Enter The Unit Brokerage');
             cGvTradeDtl.cpGiveMsg=null;
             return;
         }
     if(cGvTradeDtl.cpGiveMsg=="totalBrkg")
         {
            alert('Please Enter The Total Brokerage');
            cGvTradeDtl.cpGiveMsg=null;
            return;
         }
     if(cGvTradeDtl.cpGiveMsg=="servceTax")
         {
            alert('Please Enter The Service Tax');
            cGvTradeDtl.cpGiveMsg=null;
            return;
         }
     if(cGvTradeDtl.cpGiveMsg=="sTT")
         {
            alert('Please Enter The STT no.');
            cGvTradeDtl.cpGiveMsg=null;
            return;
         }
     if(cGvTradeDtl.cpGiveMsg=="ordrNo")
         {
            alert('Please Enter The Order No.');
            cGvTradeDtl.cpGiveMsg=null;
            return;
         }
     if(cGvTradeDtl.cpGiveMsg=="tradeNo")
         {
            alert('Please Enter The Trade No.');
            cGvTradeDtl.cpGiveMsg=null;
            return;
         }
     //New Work
     if(cGvTradeDtl.cpGiveMsg=="EffecDt")
         {
            alert('Please Enter The Effective Date');
            cGvTradeDtl.cpGiveMsg=null;
            return;
         }
     //End of New Work
     if(cGvTradeDtl.cpUpdateAlrt == "U")
        {
            alert('Data Successfully Updated');
        }
         cGvTradeDtl.cpUpdate=null;
         
      
    }
     
//     if(cGvTradeDtl.cpBindForEdit == "T")
//     {
//     cGvTradeDtl.PerformCallback('BindForEdit~');
//     cGvChargesDtl.PerformCallback('BindForEdit~');
//     }  
}

function GvChargesDtl_EndCallBack()
{
    height();
  if(cGvChargesDtl.cpChargesAdd == "T")
  {
        RefreshCharges();
        cComboChargesType.Focus();
  }   
  
 if(cGvChargesDtl.cpAfterRowDeleted == "D")
     {
        alert('Row Successfully Deleted');
        cGvChargesDtl.cpAfterRowDeleted=null;
     }
 if(cGvChargesDtl.cpShowGVchrges == "T")
    {
        Div_GVChrges.style.display="inline"; 
    }   
 if(cGvChargesDtl.cpUpdate=="T")     
  {
    if(cGvChargesDtl.cpGiveMsg=="NetAmount")
     {
         alert('Please Enter The Net Amount');
         cGvChargesDtl.cpGiveMsg=null;
         return;
     }  
    if(cGvChargesDtl.cpGiveMsg=="totlServceTax")
     {
         alert('Please Enter The Total Service tax');
         cGvChargesDtl.cpGiveMsg=null;
         return;
     }
 
    if(cGvChargesDtl.cpChargesBinded == "T")
     {
         chargesbinded='T';
     }
    if(cGvChargesDtl.cpUpdateAlrt == "U")
     {
        alert('Data Successfully Updated');
     }
     cGvChargesDtl.cpUpdate=null;
   }
   
 if(cGvChargesDtl.cpChargeTypeAlrdySelected == "T")
   {
       alert('This ChargeType Already Given, Please Select Another One..');
       cComboChargesType.Focus();
       cGvChargesDtl.cpChargeTypeAlrdySelected=null;
   }
 if(cGvChargesDtl.cpChargeTypeAlrdySelectedUpdt == "T")
   {
       alert('This ChargeType Already Given, Please Select Another One..');
       cComboChargesTypeE.Focus();
       cGvChargesDtl.cpChargeTypeAlrdySelectedUpdt=null;
   }
     
   
}

function AddButtonClickChrges()
{
    if(cTxtNetAmount.GetText()=="0.00")
    {
        alert('Please Enter The Net Amount');
        cTxtNetAmount.Focus();
        return;
    }
    
              
   Div_GVChrges.style.display="inline";
   cGvChargesDtl.PerformCallback('BindCharges~'+cComboChargesType.GetText());
}

function ReEnterButtonClickChrges()
{
 RefreshCharges();
}

function DiscardButtonClickChrges()
{
 cGvChargesDtl.PerformCallback('DiscardChrges~');
}

function UpdateCharges()
{
 cGvChargesDtl.PerformCallback('UpdateChrges~'+cComboChargesTypeE.GetText());
}

function CancelEditingCharges()
{
 cGvChargesDtl.CancelEdit();
}

function ComboSegment_EndCallBack()
 {

 }
 
function MainSubmitButtonClick()
{
 if(document.getElementById('<%=TxtBrokerName.ClientID%>').value.trim()==""||document.getElementById('<%=TxtBrokerName.ClientID%>').value.trim()=="Enter Broker"||document.getElementById('<%=TxtBrokerName_hidden.ClientID%>').value.trim()==""||document.getElementById('<%=TxtBrokerName.ClientID%>').value.trim()=="No Record Found")
     {
         alert('Please Enter the Broker Name..');
         document.getElementById('<%=TxtBrokerName.ClientID%>').focus();
         return;
     }
 if(document.getElementById('<%=TxtCustomerName.ClientID%>').value.trim()==""||document.getElementById('<%=TxtCustomerName.ClientID%>').value.trim()=="Enter Customer"||document.getElementById('<%=TxtCustomerName_hidden.ClientID%>').value.trim()==""||document.getElementById('<%=TxtCustomerName.ClientID%>').value.trim()=="No Record Found")
     {
         alert('Please Enter the Customer Name..');
         document.getElementById('<%=TxtCustomerName.ClientID%>').focus();
         return;
     }
     
 if(cTxtSettlemntNo.GetText()=="0")
    {
        alert('Please Enter the Settlement No.');
        cTxtSettlemntNo.Focus();
        return;
    }
 if(cTxtSettlemntType.GetText()=="")
    {
        alert('Please Enter the Settlement Type');
        cTxtSettlemntType.Focus();
        return;
    }
// if(cTxtContractNote.GetText()=="0")
//    {
//        alert('Please Enter the ContractNote Number');
//        cTxtContractNote.Focus();
//        return;
//    } 
 if(cTxtBillNo.GetText()=="0")
    {
     cTxtBillNo.SetText(cTxtContractNote.GetText());
    }
  var BrokerNm=document.getElementById('<%=TxtBrokerName_hidden.ClientID%>').value.trim();
  cGvTradeDtl.PerformCallback('MainXMLBind~'+cTxtContractNote.GetText()+'~'+BrokerNm+'~'+cComboSegment.GetText().trim()+'~'+cComboExchange.GetValue().trim());
  var exchange=cComboExchange.GetText();
  var segment=cComboSegment.GetText();
  MainEditClick();
  mainSubmitBtnClick="T";
  mainColorBack();
  detailColorChng();
 
}


function MainEditClick()
{
  Div_SubmitBtnMain.style.display="none";
  Div_UpdateBtn.style.display="none";
  Div_EditBtn.style.display="inline";
  document.getElementById('<%=TxtBrokerName.ClientID%>').disabled=true;
  document.getElementById('<%=TxtCustomerName.ClientID%>').disabled=true;
  cTxtSettlemntNo.SetEnabled(false);
  cTxtSettlemntType.SetEnabled(false);
  cTxtContractNote.SetEnabled(false);
  cTradeDt.SetEnabled(false);
  cComboExchange.SetEnabled(false); 
  cComboSegment.SetEnabled(false); 
  cPayinDate.SetEnabled(false);
  cTxtBillNo.SetEnabled(false);
}

function MainEditButtonClick()
{
  Div_SubmitBtnMain.style.display="none";
  Div_UpdateBtn.style.display="inline";
  Div_EditBtn.style.display="none";
  document.getElementById('<%=TxtBrokerName.ClientID%>').disabled=false;
  document.getElementById('<%=TxtCustomerName.ClientID%>').disabled=false;
  cTxtSettlemntNo.SetEnabled(true);
  cTxtSettlemntType.SetEnabled(true);
  cTxtContractNote.SetEnabled(true);
  cTradeDt.SetEnabled(true);
  cComboExchange.SetEnabled(true); 
  cComboSegment.SetEnabled(true); 
  cPayinDate.SetEnabled(true);
  cTxtBillNo.SetEnabled(true);
}

function MainUpdateButtonClick()
{
if(document.getElementById('<%=TxtBrokerName.ClientID%>').value.trim()==""||document.getElementById('<%=TxtBrokerName.ClientID%>').value.trim()=="Enter Broker"||document.getElementById('<%=TxtBrokerName_hidden.ClientID%>').value.trim()==""||document.getElementById('<%=TxtBrokerName.ClientID%>').value.trim()=="No Record Found")
     {
         alert('Please Enter the Broker Name..');
         document.getElementById('<%=TxtBrokerName.ClientID%>').focus();
         return;
     } 
if(document.getElementById('<%=TxtCustomerName.ClientID%>').value.trim()==""||document.getElementById('<%=TxtCustomerName.ClientID%>').value.trim()=="Enter Customer"||document.getElementById('<%=TxtCustomerName_hidden.ClientID%>').value.trim()==""||document.getElementById('<%=TxtCustomerName.ClientID%>').value.trim()=="No Record Found")
     {
         alert('Please Enter the Customer Name..');
         document.getElementById('<%=TxtCustomerName.ClientID%>').focus();
         return;
     }
 if(cTxtSettlemntNo.GetText()=="0")
    {
        alert('Please Enter the Settlement No.');
        cTxtSettlemntNo.Focus();
        return;
    }
 if(cTxtSettlemntType.GetText()=="")
    {
        alert('Please Enter the Settlement Type');
        cTxtSettlemntType.Focus();
        return;
    }
// if(cTxtContractNote.GetText()=="0")
//    {
//        alert('Please Enter the ContractNote Number');
//        cTxtContractNote.Focus();
//        return;
//    } 
 MainEditClick();
 cGvTradeDtl.PerformCallback('MainXMLUpdate~'+cComboSegment.GetText().trim()+'~'+cComboExchange.GetValue().trim());
}

//function EditLnkClck()
//{
//  cCbpSave.PerformCallback('Edit~');
//}

function ReEnterButtonClick()
{
  refreshDetail();
}

function CancelEditing()
 {
   cGvTradeDtl.CancelEdit();

 }
 
 function SaveButtonClick()
 {
 cCbpScrip.PerformCallback('ScripBind~'+cComboSegment.GetText().trim()+'~'+cComboExchange.GetValue().trim());
 if(document.getElementById('<%=TxtBrokerName.ClientID%>').value.trim()==""||document.getElementById('<%=TxtBrokerName.ClientID%>').value.trim()=="Enter Broker"||document.getElementById('<%=TxtBrokerName_hidden.ClientID%>').value.trim()==""||document.getElementById('<%=TxtBrokerName.ClientID%>').value.trim()=="No Record Found")
            {
                 alert('Please Atfirst Fill Up the Contract Detail Section Properly..');
                 document.getElementById("imgarrowup_Main").style.display='inline';
                 document.getElementById("imgarrowdown_Main").style.display='none';
                 Div_Main_Total.style.display="inline";
                 
                 document.getElementById('<%=TxtBrokerName.ClientID%>').focus();
                 return;
            }
   else if(document.getElementById('<%=TxtCustomerName.ClientID%>').value.trim()==""||document.getElementById('<%=TxtCustomerName.ClientID%>').value.trim()=="Enter Customer"||document.getElementById('<%=TxtCustomerName_hidden.ClientID%>').value.trim()==""||document.getElementById('<%=TxtCustomerName.ClientID%>').value.trim()=="No Record Found")
            {
                 alert('Please Atfirst Fill Up the Contract Detail Section Properly..');
                 document.getElementById("imgarrowup_Main").style.display='inline';
                 document.getElementById("imgarrowdown_Main").style.display='none';
                 Div_Main_Total.style.display="inline";
                 
                 document.getElementById('<%=TxtCustomerName.ClientID%>').focus();
                 return;
            }
         else if(cTxtSettlemntNo.GetText()=="0")
            {
                alert('Please Atfirst Fill Up the Contract Detail Section Properly..');
                document.getElementById("imgarrowup_Main").style.display='inline';
                 document.getElementById("imgarrowdown_Main").style.display='none';
                 Div_Main_Total.style.display="inline";
                 
                cTxtSettlemntNo.Focus();
                return;
            }
         else if(cTxtSettlemntType.GetText()=="")
            {
                alert('Please Atfirst Fill Up the Contract Detail Section Properly..');
                document.getElementById("imgarrowup_Main").style.display='inline';
                document.getElementById("imgarrowdown_Main").style.display='none';
                Div_Main_Total.style.display="inline";
                
                cTxtSettlemntType.Focus();
                return;
            }
//         else if(cTxtContractNote.GetText()=="0")
//            {
//                alert('Please Atfirst Fill Up the Contract Detail Section Properly..');
//                document.getElementById("imgarrowup_Main").style.display='inline';
//                document.getElementById("imgarrowdown_Main").style.display='none';
//                Div_Main_Total.style.display="inline";
//                
//                cTxtContractNote.Focus();
//                return;
//            }
         else if(Div_SubmitBtnMain.style.display == "inline")
            {
               alert('Please Submit The Entered Data of The Contract Detail Section');
               document.getElementById("imgarrowup_Main").style.display='inline';
               document.getElementById("imgarrowdown_Main").style.display='none';
               Div_Main_Total.style.display="inline";
               cSubmitBtnMain.Focus();
               return;
            }
         else if(Div_gv.style.display == "none")
            {
               alert('Please FillUp The Entry Of The  Trade Detail Section');
               document.getElementById("imgarrowup_Detail").style.display='inline';
               document.getElementById("imgarrowdown_Detail").style.display='none';
               Div_Detail_Total.style.display="inline";
               document.getElementById('<%=TxtScrip.ClientID%>').focus();
               return;
            }  
         
         else
            { 
              cCbpSave.PerformCallback('SaveData~');
            }
          
 }
 
function CbpSave_EndCallBack()
   {
        if(cCbpSave.cpDataSaved == "T")
        {
         if(Div_Main_Total.style.display == "inline")
             {
               Div_Main_Total.style.display="none";
               document.getElementById("imgarrowup_Main").style.display='none';
               document.getElementById("imgarrowdown_Main").style.display='inline'; 
             }
          if(Div_Detail_Total.style.display =="inline")
             {
               Div_Detail_Total.style.display="none";
               document.getElementById("imgarrowup_Detail").style.display='none';
               document.getElementById("imgarrowdown_Detail").style.display='inline'; 
             }
          if( Div_Charges_Total.style.display =="inline")
             {
               Div_Charges_Total.style.display="none"; 
               document.getElementById("imgarrowup_Charges").style.display='none';
               document.getElementById("imgarrowdown_Charges").style.display='inline';
             }
              document.getElementById('<%=TxtBrokerName.ClientID%>').value = "Enter Broker";
              document.getElementById('<%=TxtCustomerName.ClientID%>').value = "Enter Customer";
//              cComboExchange.SetText("NSE");
//              cComboSegment.SetText("CM");
              cTxtSettlemntNo.SetText("0000000");
              cTxtSettlemntType.SetText("");
              cPayinDate.Text = new Date();
              cTxtContractNote.SetText("0000000");
              cTxtBillNo.SetText("0000000");
              document.getElementById('<%=TxtBrokerName_hidden.ClientID%>').value = "";
              document.getElementById('<%=TxtCustomerName_hidden.ClientID%>').value = "";
              Div_SubmitBtnMain.style.display="inline";
              Div_EditBtn.style.display="none";
              document.getElementById('<%=TxtBrokerName.ClientID%>').disabled=false;
              document.getElementById('<%=TxtCustomerName.ClientID%>').disabled=false;
              cTxtSettlemntNo.SetEnabled(true);
              cTxtSettlemntType.SetEnabled(true);
              cTxtContractNote.SetEnabled(true);
              cTradeDt.SetEnabled(true);
              cComboExchange.SetEnabled(true); 
              cComboSegment.SetEnabled(true); 
              cPayinDate.SetEnabled(true);
              cTxtBillNo.SetEnabled(true);
              cGvTradeDtl.PerformCallback('DiscardMain~');
              cGvTradeDtl.PerformCallback('Discard~');
              cGvChargesDtl.PerformCallback('DiscardChrges~');
              divlstDeleteBtn.style.display="none";
              mainColorBack();
              detailColorBack();
              chargesColorBack(); 
              alert('Data SuccessFully Saved');
              cCbpSave.cpDataSaved = null;
              window.location="../management/AccountsTradeEntry.aspx";
             //cGridTradeRecord.PerformCallback('DateChange'+'~'+cTradeDtMain.GetText());
        }
        if(cCbpSave.cpDataSaved == "F")
        {
          alert("There is an Error in data saving process");
          divlstDeleteBtn.style.display="none";
        }
        if(cCbpSave.cpDataDeleted == "T")
        {
         if(Div_Main_Total.style.display == "inline")
             {
               Div_Main_Total.style.display="none";
               document.getElementById("imgarrowup_Main").style.display='none';
               document.getElementById("imgarrowdown_Main").style.display='inline'; 
               mainColorBack();
             }
          if(Div_Detail_Total.style.display =="inline")
             {
               Div_Detail_Total.style.display="none";
               document.getElementById("imgarrowup_Detail").style.display='none';
               document.getElementById("imgarrowdown_Detail").style.display='inline'; 
               detailColorBack();
             }
          if( Div_Charges_Total.style.display =="inline")
             {
               Div_Charges_Total.style.display="none"; 
               document.getElementById("imgarrowup_Charges").style.display='none';
               document.getElementById("imgarrowdown_Charges").style.display='inline';
               chargesColorBack();
             }
             cGvTradeDtl.PerformCallback('DiscardMain~');
             cGvTradeDtl.PerformCallback('Discard~');
             cGvChargesDtl.PerformCallback('DiscardChrges~');
             divlstReentrBtn.style.display="inline";
             divlstDeleteBtn.style.display="none";
             alert('The Whole Data SuccessFully Deleted');
             EntryType="Add";
             cCbpSave.cpDataDeleted = null;
             window.location="../management/AccountsTradeEntry.aspx";
        }
        if(cCbpSave.cpReEntered == "T")
        {
            divlstDeleteBtn.style.display =  "none";
        }
        
   }
   

 function OnEntryTypeChange()
 {
//     if(cComboMode.GetValue()=="Edit")
//     {
//         DivTradeDtP.style.display="inline"; 
//         DivBrokrNmP.style.display="inline";   
//     }
//     
//     else if(cComboMode.GetValue()=="Add")
//     {
//         DivTradeDtP.style.display="none"; 
//         DivBrokrNmP.style.display="none";    
//     }
 } 
 

 function OnFocusChargesTextBox()
  {
  
 if(document.getElementById('<%=TxtScrip.ClientID%>').value.trim()==""||document.getElementById('<%=TxtScrip_hidden.ClientID%>').value.trim()==""||document.getElementById('<%=TxtScrip.ClientID%>').value.trim()=="No Record Found")
    {
     alert('Please Enter The Scrip');
     document.getElementById('<%=TxtScrip.ClientID%>').focus();
     return;
    }    
 if(cTxtQuantity.GetText()=="0.00")
    {
     alert('Please Enter The Quantity');
     cTxtQuantity.Focus();
     return;
    }
 if(cTxtMarketPrice.GetText()=="0.00")
    {
     alert('Please Enter The MarketPrice');
     cTxtMarketPrice.Focus();
     return;
    }
 if(cTxtUnitBrokrg.GetText()=="0.00")
    {
     alert('Please Enter The UnitBrokerage');
     cTxtUnitBrokrg.Focus();
     return;
    }
 
// if(cTxtOrderNo.GetText()=="")
//    {
//     alert('Please Enter The OrderNo');
//     cTxtOrderNo.Focus();
//     return;
//    }
// if(cTxtTradeNo.GetText()=="")
//    {
//     alert('Please Enter The TradeNo');
//     cTxtTradeNo.Focus();
//     return;
//    }
   
  }
      

 function mainColorChng()
   {  
     document.getElementById('Div_Main').className = 'DivRoundedBorderChngd';
     document.getElementById('Div_Main_Header').className = 'DivRoundedBorderChngd';
     document.getElementById('MainSpan').style.color = '#000099'; 
     document.getElementById('DetailSpan').style.color = '#3498ff'; 
     document.getElementById('ChargesSpan').style.color = '#3498ff'; 

   }
function detailColorChng()
   {
    document.getElementById('Div_Detail').className = 'DivRoundedBorderChngd';
    document.getElementById('Div_Detail_Header').className = 'DivRoundedBorderChngd';
    document.getElementById('DetailSpan').style.color = '#000099';
    document.getElementById('MainSpan').style.color = '#3498ff';   
    document.getElementById('ChargesSpan').style.color = '#3498ff';  
   }
function chargesColorChng()
   {
     document.getElementById('Div_Charges').className = 'DivRoundedBorderChngd';
     document.getElementById('Div_Charges_Header').className = 'DivRoundedBorderChngd';
     document.getElementById('ChargesSpan').style.color = '#000099';  
     document.getElementById('MainSpan').style.color = '#3498ff';   
     document.getElementById('DetailSpan').style.color = '#3498ff'; 
    
   }
   
   
 function mainColorBack()
   {  
     document.getElementById('Div_Main').className = 'DivRoundedBorder';
     document.getElementById('Div_Main_Header').className = 'DivRoundedBorder';
     document.getElementById('MainSpan').style.color = '#3498ff'; 
   }
function detailColorBack()
   {
    document.getElementById('Div_Detail').className = 'DivRoundedBorder';
    document.getElementById('Div_Detail_Header').className = 'DivRoundedBorder';
    document.getElementById('DetailSpan').style.color = '#3498ff';   
   }
function chargesColorBack()
   {
     document.getElementById('Div_Charges').className = 'DivRoundedBorder';
     document.getElementById('Div_Charges_Header').className = 'DivRoundedBorder';
     document.getElementById('ChargesSpan').style.color = '#3498ff';
    
   }
   
 function ShowHideShowDetail(obj,whichDiv)
 {
   if(obj=='s')
    {
      if(whichDiv=='main')
      {
     
            document.getElementById("imgarrowup_Main").style.display='inline';
            document.getElementById("imgarrowdown_Main").style.display='none';
            mainColorChng(); 
            detailColorBack()
            chargesColorBack()
            Div_Main_Total.style.display="inline";
            Div_Detail_Total.style.display="none"; 
            Div_Charges_Total.style.display="none";
            document.getElementById("imgarrowup_Detail").style.display='none';
            document.getElementById("imgarrowdown_Detail").style.display='inline';
            document.getElementById("imgarrowup_Charges").style.display='none';
            document.getElementById("imgarrowdown_Charges").style.display='inline';
            
            if(EntryType=="Add")
             {
              //Div_SubmitBtnMain.style.display="inline";
              //Div_UpdateBtn.style.display="none";
               if(Div_EditBtn.style.display == "none")
               {
                   cTradeDt.Focus();
               }
               else if(Div_EditBtn.style.display == "inline")
               {
                 cBtnEdit.Focus();
               }
             }
            else if(EntryType=="Edit")
             { 
              //MainEditClick();
              cBtnEdit.Focus();
             }
        }
     if(whichDiv=='detail')
     {
                
        if(document.getElementById('<%=TxtBrokerName.ClientID%>').value.trim()==""||document.getElementById('<%=TxtBrokerName.ClientID%>').value.trim()=="Enter Broker"||document.getElementById('<%=TxtBrokerName_hidden.ClientID%>').value.trim()==""||document.getElementById('<%=TxtBrokerName.ClientID%>').value.trim()=="No Record Found")
            {
                 alert('Please Atfirst Fill Up the Contract Detail Section Properly..');
                 mainColorChng();
                 document.getElementById("imgarrowup_Main").style.display='inline';
                 document.getElementById("imgarrowdown_Main").style.display='none';
                 Div_Main_Total.style.display="inline";
                 
                 document.getElementById('<%=TxtBrokerName.ClientID%>').focus();
                 return;
            }
       else if(document.getElementById('<%=TxtCustomerName.ClientID%>').value.trim()==""||document.getElementById('<%=TxtCustomerName.ClientID%>').value.trim()=="Enter Broker"||document.getElementById('<%=TxtCustomerName_hidden.ClientID%>').value.trim()==""||document.getElementById('<%=TxtCustomerName.ClientID%>').value.trim()=="No Record Found")
            {
                 alert('Please Atfirst Fill Up the Contract Detail Section Properly..');
                 mainColorChng();
                 document.getElementById("imgarrowup_Main").style.display='inline';
                 document.getElementById("imgarrowdown_Main").style.display='none';
                 Div_Main_Total.style.display="inline";
                 
                 document.getElementById('<%=TxtCustomerName.ClientID%>').focus();
                 return;
            }
         else if(cTxtSettlemntNo.GetText()=="0")
            {
                alert('Please Atfirst Fill Up the Contract Detail Section Properly..');
                mainColorChng();
                document.getElementById("imgarrowup_Main").style.display='inline';
                document.getElementById("imgarrowdown_Main").style.display='none';
                Div_Main_Total.style.display="inline";
                 
                cTxtSettlemntNo.Focus();
                return;
            }
         else if(cTxtSettlemntType.GetText()=="")
            {
                alert('Please Atfirst Fill Up the Contract Detail Section Properly..');
                mainColorChng();
                document.getElementById("imgarrowup_Main").style.display='inline';
                document.getElementById("imgarrowdown_Main").style.display='none';
                Div_Main_Total.style.display="inline";
                
                cTxtSettlemntType.Focus();
                return;
            }
//         else if(cTxtContractNote.GetText()=="0")
//            {
//                alert('Please Atfirst Fill Up the Contract Detail Section Properly..');
//                mainColorChng();
//                document.getElementById("imgarrowup_Main").style.display='inline';
//                document.getElementById("imgarrowdown_Main").style.display='none';
//                Div_Main_Total.style.display="inline";
//                
//                cTxtContractNote.Focus();
//                return;
//            }
         else if(Div_SubmitBtnMain.style.display == "inline")
            {
               alert('Please Submit The Entered Data of The Contract Detail Section');
               mainColorChng();
               document.getElementById("imgarrowup_Main").style.display='inline';
               document.getElementById("imgarrowdown_Main").style.display='none';
               Div_Main_Total.style.display="inline";
               cSubmitBtnMain.Focus();
            }
          
         else 
                   
           {    
                document.getElementById("imgarrowup_Detail").style.display='inline';
                document.getElementById("imgarrowdown_Detail").style.display='none';
                detailColorChng(); 
                mainColorBack();
                chargesColorBack()
                Div_Detail_Total.style.display="inline"; 
                Div_Main_Total.style.display="none";
                Div_Charges_Total.style.display="none";
                document.getElementById("imgarrowup_Main").style.display='none';
                document.getElementById("imgarrowdown_Main").style.display='inline'; 
                document.getElementById("imgarrowup_Charges").style.display='none';
                document.getElementById("imgarrowdown_Charges").style.display='inline';
                cCbpScrip.PerformCallback('ScripBind~'+cComboSegment.GetText().trim()+'~'+cComboExchange.GetValue().trim());
                if(EntryType=="Add")
                 {
                  
                   
                 }
                else if(EntryType=="Edit")
                 { 
                  if(detailbinded=='')
                  {
                     Div_gv.style.display="inline";
                     cGvTradeDtl.PerformCallback('DetailBindForEdit~');
                  }
                 }
                 if(UnSavedEntryDtl =="T")
                 {
                     cGvTradeDtl.PerformCallback('BindDetailExist~'); 
                 }
    
            }
        }
      if(whichDiv=='charges')
       {
          
           if(document.getElementById('<%=TxtBrokerName.ClientID%>').value.trim()==""||document.getElementById('<%=TxtBrokerName.ClientID%>').value.trim()=="Enter Broker"||document.getElementById('<%=TxtBrokerName_hidden.ClientID%>').value.trim()==""||document.getElementById('<%=TxtBrokerName.ClientID%>').value.trim()=="No Record Found")
            {
                 alert('Please Atfirst Fill Up the Contract Detail Section Properly..');
                 mainColorChng();
                 document.getElementById("imgarrowup_Main").style.display='inline';
                 document.getElementById("imgarrowdown_Main").style.display='none';
                 Div_Main_Total.style.display="inline";
                 document.getElementById('<%=TxtBrokerName.ClientID%>').focus();
                 return;
            }
          else if(document.getElementById('<%=TxtCustomerName.ClientID%>').value.trim()==""||document.getElementById('<%=TxtCustomerName.ClientID%>').value.trim()=="Enter Broker"||document.getElementById('<%=TxtCustomerName_hidden.ClientID%>').value.trim()==""||document.getElementById('<%=TxtCustomerName.ClientID%>').value.trim()=="No Record Found")
            {
                 alert('Please Atfirst Fill Up the Contract Detail Section Properly..');
                 mainColorChng(); 
                 document.getElementById("imgarrowup_Main").style.display='inline';
                 document.getElementById("imgarrowdown_Main").style.display='none';
                 Div_Main_Total.style.display="inline";
                 
                 document.getElementById('<%=TxtCustomerName.ClientID%>').focus();
                 return;
            }
         else if(cTxtSettlemntNo.GetText()=="0")
            {
                alert('Please Atfirst Fill Up the Contract Detail Section Properly..');
                mainColorChng();
                document.getElementById("imgarrowup_Main").style.display='inline';
                document.getElementById("imgarrowdown_Main").style.display='none';
                Div_Main_Total.style.display="inline";
                cTxtSettlemntNo.Focus();
                return;
            }
         else if(cTxtSettlemntType.GetText()=="")
            {
                alert('Please Atfirst Fill Up the Contract Detail Section Properly..');
                mainColorChng();
                document.getElementById("imgarrowup_Main").style.display='inline';
                document.getElementById("imgarrowdown_Main").style.display='none';
                Div_Main_Total.style.display="inline";
                cTxtSettlemntType.Focus();
                return;
            }
//         else if(cTxtContractNote.GetText()=="0")
//            {
//                alert('Please Atfirst Fill Up the Contract Detail Section Properly..');
//                mainColorChng();
//                document.getElementById("imgarrowup_Main").style.display='inline';
//                document.getElementById("imgarrowdown_Main").style.display='none';
//                Div_Main_Total.style.display="inline";
//                cTxtContractNote.Focus();
//                return;
//            }
         else if(Div_SubmitBtnMain.style.display == "inline")
            {
               alert('Please Submit The Entered Data of The Contract Detail Section');
               mainColorChng();
               document.getElementById("imgarrowup_Main").style.display='inline';
               document.getElementById("imgarrowdown_Main").style.display='none';
               Div_Main_Total.style.display="inline";
               cSubmitBtnMain.Focus();
            }
         else if(Div_gv.style.display == "none")
            {
               alert('Please FillUp The Entry Of The Trade Detail Section');
               detailColorChng();
               document.getElementById("imgarrowup_Detail").style.display='inline';
               document.getElementById("imgarrowdown_Detail").style.display='none';
               Div_Detail_Total.style.display="inline";
               cCbpScrip.PerformCallback('ScripBind~'+cComboSegment.GetText().trim()+'~'+cComboExchange.GetValue().trim());
               
            }  
         else 
                   
           {   
                document.getElementById("imgarrowup_Charges").style.display='inline';
                document.getElementById("imgarrowdown_Charges").style.display='none';
                chargesColorChng();
                mainColorBack();
                detailColorBack()
                Div_Charges_Total.style.display="inline";
                Div_Main_Total.style.display="none";
                Div_Detail_Total.style.display="none"; 
                document.getElementById("imgarrowup_Main").style.display='none';
                document.getElementById("imgarrowdown_Main").style.display='inline';
                document.getElementById("imgarrowup_Detail").style.display='none';
                document.getElementById("imgarrowdown_Detail").style.display='inline';
                
                if(EntryType=="Add")
                 {
                  cComboChargesType.Focus();
                 }
                else if(EntryType=="Edit")
                 { 
                  Div_GVChrges.style.display="inline";
                      if(chargesbinded=='')
                      {
                        cGvChargesDtl.PerformCallback('BindChargesForEdit~');
                      }
                 } 
                
                if( UnSavedEntryChr == "T")
                {
                    cGvChargesDtl.PerformCallback('BindChargesExist~');
                }
            }
            
       }
      
     }
    if(obj=='h')             
     {
         
     if(whichDiv=='main')
          {
            mainColorBack(); 
            document.getElementById("imgarrowup_Main").style.display='none';
            document.getElementById("imgarrowdown_Main").style.display='inline';
            Div_Main_Total.style.display="none";
          } 
     if(whichDiv=='detail')
          {
            detailColorBack();
            document.getElementById("imgarrowup_Detail").style.display='none';
            document.getElementById("imgarrowdown_Detail").style.display='inline';
            Div_Detail_Total.style.display="none";
          } 
     if(whichDiv=='charges')
          {
            chargesColorBack();   
            document.getElementById("imgarrowup_Charges").style.display='none';
            document.getElementById("imgarrowdown_Charges").style.display='inline';
            Div_Charges_Total.style.display="none";
          }           
      
     }
 
 }
 
 function CbpScrip_EndCallBack()
 { 
   
     if(cCbpScrip.cpScripFocus == "T")
     {
     
         if(mainSubmitBtnClick == "T" && UnSavedEntryDtl=='')
         {
              //document.getElementById('<%=TxtScrip.ClientID%>').focus();
              setTimeout('document.getElementById(\'<%=TxtScrip.ClientID%>\').focus()', 50);
              alert('Contract Detail Section Data Successfully Submitted...');
              mainSubmitBtnClick="F";
         }
         else
         {
           setTimeout('document.getElementById(\'<%=TxtScrip.ClientID%>\').focus()', 50);
         }

     }
 }
 
 function CbpMain_EndCallBack()
 {
// Div_SubmitBtnMain.style.display="none";
// Div_UpdateBtn.style.display="none";
// Div_EditBtn.style.display="inline";
    if(cCbpMain.cpMainEditBind == "T")
    {
      MainEditClick();
      cBtnEdit.Focus(); 
    }
    if(cCbpMain.cpPayinDtChng == "T")
    {
        Div_EditBtn.style.display="none";
        if(EntryType == "Add")
        {
            divlstReentrBtn.style.display = "inline";
            divlstDeleteBtn.style.display="none";
            Div_UpdateBtn.style.display = "none";
        }
        if(EntryType == "Edit")
        {
            divlstReentrBtn.style.display="none";
            divlstDeleteBtn.style.display = "inline";
            Div_SubmitBtnMain.style.display="none";
        }
       
        cCbpMain.cpPayinDtChng =null;
    }
 }
 
 function RecordEditButtonClick()
 {
  MainDiv.style.display="inline"; 
  DivGridRecord.style.display="none";
  EntryType = "Edit";
  mainColorChng();
  Div_Main_Total.style.display="inline";
  Div_Detail_Total.style.display="none"; 
  Div_Charges_Total.style.display="none"; 
  document.getElementById("imgarrowup_Main").style.display='inline';
  document.getElementById("imgarrowdown_Main").style.display='none';
  MainEditClick();
  divlstReentrBtn.style.display="none";
  divlstDeleteBtn.style.display="inline";
  //cGvTradeDtl.PerformCallback('RecordMatching~');
  
 }
 
 function RecordAddButtonClick()
 {
  MainDiv.style.display="inline"; 
  DivGridRecord.style.display="none";
  mainColorChng();
  EntryType = "Add";
  Div_Main_Total.style.display="inline"; 
  Div_Detail_Total.style.display="none"; 
  Div_Charges_Total.style.display="none"; 
  document.getElementById("imgarrowup_Main").style.display='inline';
  document.getElementById("imgarrowdown_Main").style.display='none';
  Div_SubmitBtnMain.style.display="inline";
  Div_UpdateBtn.style.display="none";
  Div_EditBtn.style.display="none";
  document.getElementById('<%=TxtBrokerName.ClientID%>').disabled=false;
  document.getElementById('<%=TxtCustomerName.ClientID%>').disabled=false;
  cTxtSettlemntNo.SetEnabled(true);
  cTxtSettlemntType.SetEnabled(true);
  cTxtContractNote.SetEnabled(true);
  cTradeDt.SetEnabled(true);
  cComboExchange.SetEnabled(true); 
  cComboSegment.SetEnabled(true); 
  cPayinDate.SetEnabled(true);
  cTxtBillNo.SetEnabled(true);
  cTradeDt.Focus();
  Div_gv.style.display="none";
  Div_GVChrges.style.display="none";
  divlstDeleteBtn.style.display="none";
  divlstReentrBtn.style.display="inline";
  
 }
 
 function GridTradeRecord_EndCallBack()
 {
   if(cGridTradeRecord.cpNoRecordMatching == "T")
     {
            alert('No Record Found');
            EntryType="Add";
            window.location="../management/AccountsTradeEntry.aspx";
            cGridTradeRecord.cpNoRecordMatching =null;
            cGridTradeRecord.CancelEdit();
           
     }
  if(cGridTradeRecord.cpNoRecordMatching == "F")
     {     
         if(CancelEdit=='')
         {
           RecordEditButtonClick();
           cCbpMain.PerformCallback('MainEditBind~');
           cGridTradeRecord.cpNoRecordMatching =null;
           cGridTradeRecord.CancelEdit();
           CancelEdit='T';
         }
     
     } 
  if(GridTradeRecord.cpAfterDateChange == "T")
     {
       cBtnShow.Focus();
       GridTradeRecord.cpAfterDateChange = null;
     }
  
 }
 
 
 
  function ReEnterButtonClickWhole()
  {
    cConfirmPopUp1.Show();
  }
  function ConfirmPopUpClickYes1()
  {
      document.getElementById('<%=TxtBrokerName.ClientID%>').value = "Enter Broker";
      document.getElementById('<%=TxtCustomerName.ClientID%>').value = "Enter Broker";
      cComboExchange.SetText("NSE");
      cComboSegment.SetText("CM");
      cTxtSettlemntNo.SetText("0000000");
      cTxtSettlemntType.SetText("");
      cPayinDate.Text = new Date();
      cTxtContractNote.SetText("0000000");
      cTxtBillNo.SetText("0000000");
      document.getElementById('<%=TxtCustomerName_hidden.ClientID%>').value = "";
      Div_SubmitBtnMain.style.display="inline";
      Div_EditBtn.style.display="none";
      document.getElementById('<%=TxtBrokerName.ClientID%>').disabled=false;
      document.getElementById('<%=TxtCustomerName.ClientID%>').disabled=false;
      cTxtSettlemntNo.SetEnabled(true);
      cTxtSettlemntType.SetEnabled(true);
      cTxtContractNote.SetEnabled(true);
      cTradeDt.SetEnabled(true);
      cComboExchange.SetEnabled(true); 
      cComboSegment.SetEnabled(true); 
      cPayinDate.SetEnabled(true);
      cTxtBillNo.SetEnabled(true);
      cCbpSave.PerformCallback('ReEnterAll~'); 
      mainSubmitBtnClick = "T"; 
      UnSavedEntryDtl = '';
      refreshDetail(); 
      RefreshCharges();
      
    if(Div_Main_Total.style.display == "inline")
     {
       Div_Main_Total.style.display="none";
       document.getElementById("imgarrowup_Main").style.display='none';
       document.getElementById("imgarrowdown_Main").style.display='inline'; 
       mainColorBack();
     }
    if(Div_Detail_Total.style.display =="inline")
     {
       Div_Detail_Total.style.display="none";
       document.getElementById("imgarrowup_Detail").style.display='none';
       document.getElementById("imgarrowdown_Detail").style.display='inline'; 
       detailColorBack();
     }
    if( Div_Charges_Total.style.display =="inline")
     {
       Div_Charges_Total.style.display="none"; 
       document.getElementById("imgarrowup_Charges").style.display='none';
       document.getElementById("imgarrowdown_Charges").style.display='inline';
       chargesColorBack();
     }
     
     Div_gv.style.display="none";
     Div_GVChrges.style.display="none";
 }
 function DeleteButtonClick()
 { 
    cConfirmPopUp2.Show();
 }
 function ConfirmPopUpClickYes2()
 {
      cCbpScrip.PerformCallback('ScripBind~'+cComboSegment.GetText().trim()+'~'+cComboExchange.GetValue().trim());  
      document.getElementById('<%=TxtBrokerName.ClientID%>').value = "Enter Broker";
      document.getElementById('<%=TxtCustomerName.ClientID%>').value = "Enter Customer";
      cComboExchange.SetText("NSE");
      cComboSegment.SetText("CM");
      cTxtSettlemntNo.SetText("0000000");
      cTxtSettlemntType.SetText("");
      cPayinDate.Text = new Date();
      cTxtContractNote.SetText("0000000");
      cTxtBillNo.SetText("0000000");
      document.getElementById('<%=TxtBrokerName_hidden.ClientID%>').value = "";
      document.getElementById('<%=TxtCustomerName_hidden.ClientID%>').value = "";
      Div_SubmitBtnMain.style.display="inline";
      Div_EditBtn.style.display="none";
      document.getElementById('<%=TxtBrokerName.ClientID%>').disabled=false;
      document.getElementById('<%=TxtCustomerName.ClientID%>').disabled=false;
      cTxtSettlemntNo.SetEnabled(true);
      cTxtSettlemntType.SetEnabled(true);
      cTxtContractNote.SetEnabled(true);
      cTradeDt.SetEnabled(true);
      cComboExchange.SetEnabled(true); 
      cComboSegment.SetEnabled(true); 
      cPayinDate.SetEnabled(true);
      cTxtBillNo.SetEnabled(true);
      cCbpSave.PerformCallback('DeleteData~'); 
 }
 function ProceedChargesClick()
  {
        if(Div_gv.style.display == "none")
        {
              alert('Please Fillup The Detail Section First');
        }
        else
        {
               Div_Detail_Total.style.display="none";
               document.getElementById("imgarrowup_Detail").style.display='none';
               document.getElementById("imgarrowdown_Detail").style.display='inline'; 
               Div_Charges_Total.style.display="inline"; 
               document.getElementById("imgarrowup_Charges").style.display='inline';
               document.getElementById("imgarrowdown_Charges").style.display='none';
               chargesColorChng(); 
               detailColorBack();
               cComboChargesType.Focus();
               if(EntryType=="Edit")
                 { 
                  Div_GVChrges.style.display="inline";
                  cGvChargesDtl.PerformCallback('BindChargesForEdit~');
                 } 
         }
  }
  
 
 function CompareUnitBrkgMrktPrce()
 {
   if(parseFloat(cTxtMarketPrice.GetValue())<parseFloat(cTxtUnitBrokrg.GetValue()))
     {
       alert('Unit Brokerage Cannot Be Greater Than Market Price');
       cTxtMarketPrice.SetText("0000000.00");
       cTxtUnitBrokrg.SetText("0000000.00");
       cTxtMarketPrice.Focus();
     }
                       
 }
 
 function ChargesTypeChange()
 {
//     if(cComboChargesType.GetText()=="Round-Off Adjustments")
//     {
        cCbpNetAmount.PerformCallback('MaskingChange~'+cComboChargesType.GetText());
//     }
 }
 
 function CbpNetAmount_EndCallBack()
 {
    if(cCbpNetAmount.cpNetAmountFocus == "T")
    {
        cTxtNetAmount.Focus();
        cCbpNetAmount.cpNetAmountFocus=null;
    }
 }
 function ChargesTypeChangeE()
 {
//     if(cComboChargesType.GetText()=="Round-Off Adjustments")
//     {
        cCbpNetAmountE.PerformCallback('MaskingChangeE~'+cComboChargesTypeE.GetText());
//     }
 }
 
 function CbpNetAmountE_EndCallBack()
 {
    if(cCbpNetAmountE.cpNetAmountEFocus == "T")
    {
        cTxtNetAmountE.Focus();
        cCbpNetAmountE.cpNetAmountEFocus=null;
    }
 }
 
 function PopUp_Continue_Click()  
 {
    UnSavedEntryDtl="T";
    UnSavedEntryChr ="T"
    cCbpMain.PerformCallback('MainExistBind~'); 
    mainColorChng();
    detailColorBack();
 }
 
 function PopUp_Rfrsh_Click()
 {
      UnSavedEntryDtl='';
      UnSavedEntryChr ='';
      cCbpSave.PerformCallback('ReEnterAll~'); 
      Div_SubmitBtnMain.style.display="inline";
      Div_UpdateBtn.style.display="none";
      Div_EditBtn.style.display="none";
      document.getElementById('<%=TxtBrokerName.ClientID%>').value = "Enter Broker";
      document.getElementById('<%=TxtCustomerName.ClientID%>').value = "Enter Broker";
      cComboExchange.SetText("NSE");
      cComboSegment.SetText("CM");
      cTxtSettlemntNo.SetText("0000000");
      cTxtSettlemntType.SetText("");
      cPayinDate.Text = new Date();
      cTxtContractNote.SetText("0000000");
      cTxtBillNo.SetText("0000000");
      document.getElementById('<%=TxtCustomerName_hidden.ClientID%>').value = "";
      Div_SubmitBtnMain.style.display="inline";
      Div_EditBtn.style.display="none";
      document.getElementById('<%=TxtBrokerName.ClientID%>').disabled=false;
      document.getElementById('<%=TxtCustomerName.ClientID%>').disabled=false;
      cTxtSettlemntNo.SetEnabled(true);
      cTxtSettlemntType.SetEnabled(true);
      cTxtContractNote.SetEnabled(true);
      cTradeDt.SetEnabled(true);
      cComboExchange.SetEnabled(true); 
      cComboSegment.SetEnabled(true); 
      cPayinDate.SetEnabled(true);
      cTxtBillNo.SetEnabled(true);
      if(Div_Main_Total.style.display == "inline")
      {
           document.getElementById("imgarrowup_Main").style.display='inline';
           document.getElementById("imgarrowdown_Main").style.display='none'; 
           mainColorChng();
           detailColorBack();
      }
 }
 function GoBackButtonClick()
 {
    window.location="../management/AccountsTradeEntry.aspx"; 
 }
</script>

</head>
<body onload="HideLoading();">
    <form id="form1" runat="server">
        <div id="Div_header" style="width: 92%">
            <div id="Div_headername" style="width: 87%; text-align: center;float: left;" class="EHEADER">
                <strong><span id="SpanHeader" style="font-size: 12px; color: #000099; font-family: Tahoma,Arial, Helvetica, sans-serif">
                    TRADES ENTRY</span></strong>
            </div>
            <div style="float: left;">
               <dxe:ASPxButton ID="BtnGoBack" runat="server" AutoPostBack="false" TabIndex="0" 
                     ToolTip="Return Back To First Selection" Width="1px" Height="6px" BackColor="Transparent"
                    ClientInstanceName="cBtnGoBack">
                    <Border BorderColor="Transparent"></Border>
                    <BackgroundImage HorizontalPosition="left" ImageUrl="~/images/pFirst.png"
                     VerticalPosition="Top" Repeat="NoRepeat" />
                    <ClientSideEvents Click="function(s, e) {GoBackButtonClick();}"></ClientSideEvents>
                </dxe:ASPxButton>
             </div>
        </div>
        <div id="DivGridRecord" style="float: left; padding-top: 4px; width: 90%" align="center">
        <div id="DivTradedateMain" runat="server" class="tdsecondary" style="margin-left: 4px; width: 22%;
                    height: 24px; margin-top: 4px; margin-bottom: 2px;">
                    
            <dxe:ASPxDateEdit ID="TradeDtMain" runat="server" ClientInstanceName="cTradeDtMain" DateOnError="Today"
                        EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="98%">
                <ButtonStyle Width="3px" >
                </ButtonStyle>
                <DropDownButton Text="TradeDate" >
                </DropDownButton>
                <ClientSideEvents DateChanged="function(s,e){SetTradeDate();}" />
            </dxe:ASPxDateEdit>
         </div>
         <div id="DivShowBtn" style="float: left; width: 10%; margin-top: 4px; margin-left: 1px;">
            <dxe:ASPxButton ID="BtnShow" runat="server" AutoPostBack="false" TabIndex="0"
                 Text="Show" ToolTip="Show The Entry Of This Trade Date" Width="95%" ClientInstanceName="cBtnShow">
                <Paddings PaddingTop="2px" />
                <Border BorderColor="White" />
                <ClientSideEvents Click="function(s, e) {DateChangeMain(cTradeDtMain);}" />
            </dxe:ASPxButton>
        </div>
        <br />
            <dxwgv:ASPxGridView ID="GridTradeRecord" runat="server" Settings-ShowHorizontalScrollBar="true"
                AutoGenerateColumns="False" KeyFieldName="ContractNoteNo" Width="950px" Font-Size="Small" ClientInstanceName="cGridTradeRecord"
                OnCustomCallback="GridTradeRecord_CustomCallback" OnHtmlEditFormCreated="GridTradeRecord_HtmlEditFormCreated">
                <ClientSideEvents EndCallback="function (s, e) {GridTradeRecord_EndCallBack();}" />
                <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="NextColumn" />
                <Styles>
                    <Header CssClass="gridheader" ImageSpacing="5px" SortingImageSpacing="5px">
                    </Header>
                    <FocusedGroupRow CssClass="gridselectrow">
                    </FocusedGroupRow>
                    <FocusedRow CssClass="gridselectrow">
                    </FocusedRow>
                    <Footer CssClass="gridfooter">
                    </Footer>
                    <LoadingPanel ImageSpacing="10px">
                    </LoadingPanel>
                    <Row Wrap="False">
                    </Row>
                    <Cell HorizontalAlign="Left">
                    </Cell>
                </Styles>
                <SettingsEditing Mode="EditForm" PopupEditFormShowHeader="False" />
                <Columns>
                    <dxwgv:GridViewCommandColumn VisibleIndex="0" Width="70px" FixedStyle="Left">
                    <HeaderTemplate>
                        <dxe:ASPxButton ID="BtnAddRecord" runat="server" AutoPostBack="false" TabIndex="0"
                                    Text="Add New" ToolTip="Add New Record" Width="15px" ClientInstanceName="cBtnAddRecord">
                                    <Border BorderColor="White" />
                                    <ClientSideEvents Click="function(s, e) {RecordAddButtonClick();}" />
                        </dxe:ASPxButton>
                    </HeaderTemplate>
                    <EditButton Text="Edit" Visible="True">
                    </EditButton>
                        
                        <CellStyle Font-Underline="False" Font-Size="12px" >
                            <HoverStyle BackColor="#000040">
                            </HoverStyle>
                        </CellStyle>
                    </dxwgv:GridViewCommandColumn>
                    
                    <dxwgv:GridViewDataTextColumn Caption="ContractNote No" FieldName="ContractNoteNo" VisibleIndex="1" 
                        Width="110px" FixedStyle="Left">
                        <CellStyle CssClass="gridcellleft" Font-Size="11px" HorizontalAlign="Right">
                        </CellStyle>
                        
                    </dxwgv:GridViewDataTextColumn>       
                    
                    <dxwgv:GridViewDataTextColumn Caption="Broker Name" FieldName="BrokerName" VisibleIndex="2"
                        Width="250px" FixedStyle="Left">
                        <CellStyle CssClass="gridcellleft" Font-Size="11px">
                        </CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Customer Name" FieldName="CustomerName" VisibleIndex="3"
                        Width="250px" FixedStyle="Left">
                        <CellStyle CssClass="gridcellleft" Font-Size="11px">
                        </CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Trade Date" FieldName="TradeDate" VisibleIndex="4"
                        Width="200px">
                        <CellStyle CssClass="gridcellleft" Font-Size="11px">
                        </CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Exchange" FieldName="Exchange" VisibleIndex="5"
                        Width="125px">
                        <CellStyle CssClass="gridcellleft" Font-Size="11px">
                        </CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Settlement No." FieldName="SettlementNo" VisibleIndex="6"
                        Width="125px">
                        <CellStyle CssClass="gridcellleft" Font-Size="11px">  
                        </CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Settlement Type" FieldName="SettlementType" VisibleIndex="7"
                        Width="100px">
                        <CellStyle CssClass="gridcellleft" Font-Size="11px">
                        </CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Paying Date" FieldName="PayinDate" VisibleIndex="8"
                        Width="200px">
                        <CellStyle CssClass="gridcellleft" Font-Size="11px">
                        </CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Bill No." FieldName="BillNo" VisibleIndex="9"
                        Width="120px">
                        <CellStyle CssClass="gridcellleft" Font-Size="11px" HorizontalAlign="Right">
                        </CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Create DateTime" FieldName="CreateDateTime" VisibleIndex="10">
                        <CellStyle CssClass="gridcellleft" Font-Size="11px">
                        </CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="BrokerID" FieldName="BrokerID" VisibleIndex="11" Visible="False"
                        Width="200px">
                        <CellStyle CssClass="gridcellleft" Font-Size="11px">
                        </CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                </Columns>
                <SettingsText EmptyDataRow="No Data To Display" />
                <Settings ShowHorizontalScrollBar="True" />
                <SettingsLoadingPanel Text="PleaseWait&amp;hellip;" />
            </dxwgv:ASPxGridView>
        </div>
        
        <br />
        <div id="MainDiv" style="float: left; width: 100%; display: none">
            <div id="Div_Main_Header" class="DivRoundedBorder" style="float: left; width: 27%;
                margin-left: 20px">
                <b class="rtop"><b id="a1" class="r1"></b><b id="a2" class="r2"></b><b id="a3" class="r3">
                </b><b class="r4" id="a4"></b></b>
                <div id="Div5" style="width: 98%;">
                    <div id="Div46" style="float: left; width: 78%; text-align: center; font-size: 10pt;
                        color: #3498ff; font-family: Tahoma">
                        <strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<span id="MainSpan">Contract
                            Detail</span></strong></div>
                    <div id="Div_OpnCloseBtn_Main" runat="server" style="float: left; width: 14%; text-align: right">
                        <a tabindex="0" onclick="ShowHideShowDetail('s','main')">
                            <img id="imgarrowdown_Main" alt="Show Main Section" src="../images/arrow_down.gif"
                                style="cursor: pointer" /></a>
                        <img id="imgarrowup_Main" alt="Hide Main Section" onclick="ShowHideShowDetail('h','main')"
                            src="../images/arrow_up.gif" style="display: none; cursor: pointer" />
                    </div>
                    &nbsp;</div>
                <b class="rbottom"><b id="b1" class="r4"></b><b id="b2" class="r3"></b><b id="b3"
                    class="r2"></b><b class="r1" id="b4"></b></b>
            </div>
            <div id="Div_Detail_Header" class="DivRoundedBorder" style="float: left; width: 27%;
                margin-left: 20px">
                <b class="rtop"><b class="r1"></b><b class="r2"></b><b class="r3"></b><b class="r4"
                    id="B2"></b></b>
                <div id="Div27" style="width: 98%">
                    <div id="Div47" style="float: left; width: 78%; text-align: center; font-size: 10pt;
                        color: #3498ff; font-family: Tahoma">
                        <strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span id="DetailSpan"> Trade Detail</span></strong></div>
                    <div id="Div_OpnCloseBtn_Detail" runat="server" style="float: left; width: 14%; text-align: right">
                        <img id="imgarrowdown_Detail" alt="Show Detail Section" onclick="ShowHideShowDetail('s','detail')"
                            src="../images/arrow_down.gif" style="cursor: pointer" />
                        <img id="imgarrowup_Detail" alt="Hide Detail Section" onclick="ShowHideShowDetail('h','detail')"
                            src="../images/arrow_up.gif" style="display: none; cursor: pointer" />
                    </div>
                </div>
                <b class="rbottom"><b class="r4"></b><b class="r3"></b><b class="r2"></b><b class="r1"
                    id="B43"></b></b>
            </div>
            <div id="Div_Charges_Header" class="DivRoundedBorder" style="float: left; width: 27%;
                margin-left: 20px">
                <b class="rtop"><b class="r1"></b><b class="r2"></b><b class="r3"></b><b class="r4"
                    id="B1"></b></b>
                <div id="Div28" style="width: 98%">
                    <div id="Div59" style="float: left; width: 81%; text-align: center; font-size: 10pt;
                        color: #3498ff; font-family: Tahoma">
                        <strong>&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;<span id="ChargesSpan"> Charges</span></strong></div>
                    <div id="Div_OpnCloseBtn_Charges" runat="server" style="float: left; width: 14%;
                        text-align: right">
                        <img id="imgarrowdown_Charges" alt="Show Charges Section" onclick="ShowHideShowDetail('s','charges')"
                            src="../images/arrow_down.gif" style="cursor: pointer" />
                        <img id="imgarrowup_Charges" alt="Hide Charges Section" onclick="ShowHideShowDetail('h','charges')"
                            src="../images/arrow_up.gif" style="display: none; cursor: pointer" />&nbsp;<span
                                id="span2" style="font-weight: bold; color: maroon"></span>
                    </div>
                </div>
                <b class="rbottom"><b class="r4"></b><b class="r3"></b><b class="r2"></b><b class="r1"
                    id="B42"></b></b>
            </div>
            <br />
            <br />
            <div id="Div_Main_Total" runat="server">
                <div id="Div_Main" class="DivRoundedBorder" runat="server" style="width: 90%; margin-left: 6px">
                    <b class="rtop"><b class="r1"></b><b class="r2"></b><b class="r3"></b><b class="r4">
                    </b></b>
                    <div id="Div_MainContent" align="center">
                        <dxcp:ASPxCallbackPanel ID="CbpMain" runat="server" ClientInstanceName="cCbpMain"
                            BackColor="Transparent" OnCallback="CbpMain_Callback" Width="100%">
                            <PanelCollection>
                                <dxp:panelcontent runat="server">
                                    <div id="div_date" runat="server" class="tdsecondary" style="margin-left: 15px; width: 18%;
                                        height: 24px; margin-top: 4px">
                                        <dxe:ASPxDateEdit ID="TradeDt" runat="server" ClientInstanceName="cTradeDt" DateOnError="Today"
                                            EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="98%">
                                            <ButtonStyle Width="3px">
                                            </ButtonStyle>
                                            <DropDownButton Text="TradeDate">
                                            </DropDownButton>
                                            <ClientSideEvents DateChanged="function(s,e){DateChange(cTradeDt);}" />
                                        </dxe:ASPxDateEdit>
                                    </div>
                                    <div id="Div_Broker" align="left" class="tdsecondary" style="margin-left: 2px; width: 26%;
                                        height: 24px; margin-top: 4px;">
                                        <asp:TextBox ID="TxtBrokerName" runat="server" Font-Size="Small" Text="Enter Broker"
                                            ForeColor="gray" Width="98%" onfocus="NoWaterMarkBroker()" OnClick="NoWaterMarkBroker()"
                                            onblur="WaterMarkBroker()">
                                        </asp:TextBox>
                                        <asp:HiddenField ID="TxtBrokerName_hidden" runat="server" />
                                    </div>
                                    <div id="Div_Customer" align="left" class="tdsecondary" style="margin-left: 2px;
                                        width: 26%; height: 24px; margin-top: 4px;">
                                        <asp:TextBox ID="TxtCustomerName" runat="server" Font-Size="Small" ForeColor="Gray"
                                            onblur="WaterMarkCust()" onclick="NoWaterMarkCust()" onfocus="NoWaterMarkCust()"
                                            Text="Enter Customer" Width="98%"></asp:TextBox>
                                        <asp:HiddenField ID="TxtCustomerName_hidden" runat="server" />
                                    </div>
                                    <div id="Div4" runat="server" class="tdsecondary" style="margin-left: 2px; width: 18%;
                                        margin-top: 4px; height: 24px">
                                        
           <dxcp:ASPxCallbackPanel ID="CbpPayiDt" runat="server" ClientInstanceName="cCbpPayiDt"  BackColor="Transparent" OnCallback="CbpPayiDt_Callback" Width="98%">
             <PanelCollection>
               <dxp:panelcontent runat="server">
                 <dxe:ASPxDateEdit ID="PayinDate" runat="server" ClientInstanceName="cPayinDate" DateOnError="Today"
                                            EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="98%">
                                            <ButtonStyle Width="3px">
                                            </ButtonStyle>
                                            <DropDownButton Text="PayinDate">
                                            </DropDownButton>
                                            <ClientSideEvents DateChanged="function(s,e){PayinDateChange(cPayinDate);}" />
                 </dxe:ASPxDateEdit>
              </dxp:panelcontent>
            </PanelCollection>
          <%--<ClientSideEvents  EndCallback="function (s, e) {CbpMain_EndCallBack();}" />--%>
      </dxcp:ASPxCallbackPanel>
                                        
                                        
                                    </div>
                                    <div id="DivSecndMain" style="float: left; width: 99%">
                                        <div id="DivComboExchng" class="tdsecondary" style="float: left; margin-left: 15px;
                                            width: 16%; height: 24px;">
                                            <dxe:ASPxComboBox ID="ComboExchange" runat="server" ClientInstanceName="cComboExchange"
                                                EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                Width="100%">
                                                <%--<Items>
                    <dxe:ListEditItem Text="Select" Value="Slct" />
                    
                </Items>--%>
                                                <ClientSideEvents SelectedIndexChanged="function(s,e){OnTypeChangeExchng()}" TextChanged="function(s,e){OnTypeChangeExchng()}" />
                                                <DropDownButton Text="Exchange">
                                                </DropDownButton>
                                            </dxe:ASPxComboBox>
                                        </div>
                                        <div id="DivComboSegmnt" class="tdsecondary" style="float: left; margin-left: 2px;
                                            width: 16%; height: 24px;">
                                            <dxe:ASPxComboBox ID="ComboSegment" runat="server" ClientInstanceName="cComboSegment"
                                                OnCallback="ComboSegment_OnCallback" EnableIncrementalFiltering="True" Font-Size="Small"
                                                SelectedIndex="0" ValueType="System.String" Width="100%">
                                                <Items>
                                                    <dxe:ListEditItem Text="CM" Value="1" />
                                                </Items>
                                                <ClientSideEvents SelectedIndexChanged="function(s,e){OnTypeChangeSegmnt()}" TextChanged="function(s,e){OnTypeChangeSegmnt()}"
                                                    EndCallback="ComboSegment_EndCallBack" />
                                                <DropDownButton Text="Segment">
                                                </DropDownButton>
                                            </dxe:ASPxComboBox>
                                        </div>
                                        <div id="DivContractNoteMain" class="divBlue" style="margin-left: 2px; width: 12%;
                                            height: 24px;">
                                            <span style="color: black">Contract Note No:</span>
                                        </div>
                                        <div id="Div8" align="left" class="tdsecondary" style="float: left; margin-left: 2px;
                                            width: 16%; height: 24px;">
                                            <dxe:ASPxTextBox ID="TxtContractNote" runat="server" ClientInstanceName="cTxtContractNote"
                                                Width="138px">
                                                <MaskSettings Mask="<0..999999999>" />
                                            </dxe:ASPxTextBox>
                                        </div>
                                        <div id="Div200" class="divBlue" style="margin-left: 2px; float: left; width: 11%;
                                            height: 24px;">
                                            <span style="color: black">Bill No:</span>
                                        </div>
                                        <div id="DivBillNo" align="left" class="tdsecondary" style="float: left; margin-left: 2px;
                                            width: 16%; height: 24px;">
                                            <dxe:ASPxTextBox ID="TxtBillNo" runat="server" ClientInstanceName="cTxtBillNo" Width="138px">
                                                <MaskSettings Mask="<0..999999999>" />
                                            </dxe:ASPxTextBox>
                                        </div>
                                    </div>
                                    <div id="Div11" class="divBlue" style="margin-left: 15px; width: 11%; height: 19.5px">
                                        <span style="margin: 2px; color: black">Settlement No:</span>
                                    </div>
                                    <div id="Div17" align="left" class="tdsecondary" style="float: left; margin-left: 2px;
                                        width: 20.7%; height: 19.5px">
                                        <dxe:ASPxTextBox ID="TxtSettlemntNo" runat="server" ClientInstanceName="cTxtSettlemntNo"
                                            Width="179px" MaxLength="7">
                                            <MaskSettings Mask="<0..9999999>" />
                                            <%--<ClientSideEvents GotFocus="function(s,e){OnTypeChangeSegmnt()}"  />--%>
                                        </dxe:ASPxTextBox>
                                    </div>
                                    <div id="Div2" class="divBlue" style="width: 11.7%; height: 19.5px">
                                        <span style="margin: 2px; color: black">Settlement Type:</span>
                                    </div>
                                    <div id="Div3" align="left" class="tdsecondary" style="float: left; margin-left: 2px;
                                        width: 16%; height: 19.5px">
                                        <dxe:ASPxTextBox ID="TxtSettlemntType" runat="server" ClientInstanceName="cTxtSettlemntType"
                                            Width="99%" MaxLength="1">
                                        </dxe:ASPxTextBox>
                                    </div>
                                    <div id="Div_SubmitBtnMain" style="float: left; width: 23%; padding-top: 2px; margin-left: 2px;">
                                        <dxe:ASPxButton ID="SubmitBtnMain" runat="server" AutoPostBack="false" TabIndex="0"
                                            Text="Proceed To Detail" ToolTip="Submit The Entered Data" Width="95%" ClientInstanceName="cSubmitBtnMain">
                                            <Paddings PaddingTop="2px" />
                                            <Border BorderColor="White" />
                                            <ClientSideEvents Click="function(s, e) {MainSubmitButtonClick();}" />
                                        </dxe:ASPxButton>
                                    </div>
                                    <div id="Div_UpdateBtn" style="float: left; width: 12%; padding-top: 2px">
                                        <dxe:ASPxButton ID="BtnUpdateMain" runat="server" AutoPostBack="false" TabIndex="0"
                                            Text="Update" ToolTip="Update The Entered Data" Width="95%">
                                            <Paddings PaddingTop="2px" />
                                            <Border BorderColor="White" />
                                            <ClientSideEvents Click="function(s, e) {MainUpdateButtonClick();}" />
                                        </dxe:ASPxButton>
                                    </div>
                                    <div id="Div_EditBtn" style="float: left; width: 12%; padding-top: 2px">
                                        <dxe:ASPxButton ID="BtnEdit" runat="server" AutoPostBack="false" TabIndex="0" Text="Edit"
                                            ToolTip="Edit The Entered Data" Width="95%" ClientInstanceName="cBtnEdit">
                                            <Paddings PaddingTop="2px" />
                                            <Border BorderColor="White" />
                                            <ClientSideEvents Click="function(s, e) {MainEditButtonClick();}" />
                                        </dxe:ASPxButton>
                                    </div>
                                </dxp:panelcontent>
                            </PanelCollection>
                            <ClientSideEvents EndCallback="function (s, e) {CbpMain_EndCallBack();}" />
                        </dxcp:ASPxCallbackPanel>
                        <br />
                        <br />
                    </div>
                    <b class="rbottom"><b class="r4"></b><b class="r3"></b><b class="r2"></b><b class="r1">
                    </b></b>
                </div>
                <%--<div id="Div_MainEdit" class="DivRoundedBorder" runat="server" style="width: 89%;margin-left: 6px; margin-bottom: 10px;" >
     <b class="rtop"><b class="r1"></b><b class="r2"></b><b class="r3"></b><b class="r4">
     </b></b>
     <div id="Div_MainEditCon" align="center" >
       <dxcp:ASPxCallbackPanel ID="CbpMain" runat="server" ClientInstanceName="cCbpSave"  BackColor="Transparent" OnCallback="CbpMain_Callback" Width="100%">
             <PanelCollection>
               <dxp:panelcontent runat="server">
                 <div style="width:22%;float:left;height:24px;margin-top:5px"><dxe:ASPxLabel ID="LblTradeDt"  Width="100%" runat="server" ClientInstanceName="cLblTradeDt" ></dxe:ASPxLabel></div>
                            
                 <div style="width:22%;float:left;height:24px;margin-top:5px"><dxe:ASPxLabel ID="LblBrokerNm" Width="100%" runat="server" ClientInstanceName="cLblBrokerNm"></dxe:ASPxLabel></div>
                            
                 <div style="width:22%;float:left;height:24px;margin-top:5px"><dxe:ASPxLabel ID="LblExchngSegmnt" Width="100%" runat="server" ClientInstanceName="cLblExchngSegmnt"></dxe:ASPxLabel></div>
                 
                 <div style="width:24%;float:left; height: 24px;;margin-top:5px" align="right">
                 <asp:LinkButton ID="LnkBtnEditMain" runat="server" Text="Edit" Font-Bold="True" Font-Names="Calibri" Font-Size="12pt" OnClientClick="EditLnkClck()"></asp:LinkButton></div>
              </dxp:panelcontent>
            </PanelCollection>
          <ClientSideEvents  EndCallback="function (s, e) {CbpMain_EndCallBack();}" />
      </dxcp:ASPxCallbackPanel>
         <br />
         <br />
     </div>
     <b class="rbottom"><b class="r4"></b><b class="r3"></b><b class="r2"></b><b class="r1">
     </b></b>
 </div>--%>
            </div>
            <div id="Div_Detail_Total" runat="server">
                <div id="Div_Detail" class="DivRoundedBorder" runat="server" style="width: 89%; margin-left: 6px;
                    float: left">
                    <b class="rtop"><b class="r1"></b><b class="r2"></b><b class="r3"></b><b class="r4">
                    </b></b>
                    <div id="Div_DetailContent" align="center">
                        <div id="Div23" class="divBlue" style="margin-left: 15px; width: 9%; height: 20px;
                            margin-top: 4px;">
                            <span style="color: black">Scrip:</span>
                        </div>
                        <div id="DivScrip" align="left" class="tdsecondary" style="float: left; margin-left: 2px;
                            width: 16%; height: 20px; margin-top: 4px;">
                            <dxcp:ASPxCallbackPanel ID="CbpScrip" runat="server" ClientInstanceName="cCbpScrip"
                                BackColor="Transparent" OnCallback="CbpScrip_Callback" Width="100%">
                                <PanelCollection>
                                    <dxp:panelcontent runat="server">
                                        <asp:TextBox ID="TxtScrip" runat="server" HorizontalAlign="left" Width="98%">
                        <%--<ClientSideEvents GotFocus="OnFocusDetailTextBox" />--%>
                                        </asp:TextBox>
                                        <asp:HiddenField ID="TxtScrip_hidden" runat="server" />
                                    </dxp:panelcontent>
                                </PanelCollection>
                                <ClientSideEvents EndCallback="function (s, e) {CbpScrip_EndCallBack();}" />
                            </dxcp:ASPxCallbackPanel>
                        </div>
                        <div id="Div12" class="divBlue" style="margin-top: 4px; width: 9%; height: 20px">
                            <span style="color: black; margin-left: 2px;">Bought/Sold:</span>
                        </div>
                        <div id="Div13" class="tdsecondary" style="margin-top: 4px; float: left; margin-left: 2px;
                            width: 12%; height: 20px">
                            <dxe:ASPxComboBox ID="ComboBoughtSold" runat="server" ClientInstanceName="cComboBoughtSold"
                                EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                Width="100%">
                                <Items>
                                    <dxe:ListEditItem Text="Bought" Value="Bght" />
                                    <dxe:ListEditItem Text="Sold" Value="Sld" />
                                </Items>
                                <%--<ClientSideEvents SelectedIndexChanged="function(s,e){OnTypeChange('SoldTo')}" GotFocus="OnFocusDetailTextBox" />--%>
                            </dxe:ASPxComboBox>
                        </div>
                        <div id="Div14" class="tdsecondary" style="float: left; margin-left: 2px; width: 13%;
                            height: 20px; margin-top: 4px;">
                            <dxe:ASPxComboBox ID="ComboType" runat="server" ClientInstanceName="cComboType" EnableIncrementalFiltering="True"
                                Font-Size="Small" SelectedIndex="0" ValueType="System.String" Width="100%">
                                <Items>
                                    <dxe:ListEditItem Text="Delivery" Value="D" />
                                    <dxe:ListEditItem Text="SquareOff" Value="S" />
                                </Items>
                                <DropDownButton Text="Type">
                                </DropDownButton>
                                <ClientSideEvents SelectedIndexChanged="function(s,e){OnTypeChange('SoldTo')}" />
                                <%--GotFocus="OnFocusDetailTextBox"--%>
                            </dxe:ASPxComboBox>
                        </div>
                        <div id="Div15" class="divBlue" style="margin-top: 4px; width: 9%; height: 20px">
                            <span style="color: black; margin-left: 2px;">Trade Time:</span>
                        </div>
                        <div id="Div10" runat="server" class="tdsecondary" style="margin-left: 2px; width: 16%;
                            height: 19.5px; margin-top: 4px;">
                            <dxe:ASPxDateEdit ID="TradeTime" runat="server" ClientInstanceName="cTradeTime" DateOnError="Today"
                                EditFormat="Custom" EditFormatString="hh:mm:ss" UseMaskBehavior="True" Width="98%"
                                DropDownButton-Visible="false">
                                <ButtonStyle Width="3px">
                                </ButtonStyle>
                                <%--<ClientSideEvents DateChanged="function(s,e){DateChange(cTradeDt);}" GotFocus="OnFocusDetailTextBox" />--%>
                            </dxe:ASPxDateEdit>
                            <%--<dxe:ASPxTimeEdit ID="timeEdit" runat="server" DateTime="2009/11/01 15:31:34" Width="200">
                         <ValidationSettings ErrorDisplayMode="None" />
                    </dxe:ASPxTimeEdit>--%>
                        </div>
                        <div id="mid" style="width: 92%; float: left; margin-left: 15px">
                            <div id="Div18" class="divBlue" style="width: 18.6%;">
                                Quantity
                            </div>
                            <div id="Div19" class="divBlue" style="width: 18.6%;">
                                <span style="margin: 2px; color: black">Market Price</span></div>
                            <div id="Div20" class="divBlue" style="width: 18.6%;">
                                Unit Brokerage</div>
                            <div id="Div16" class="divBlue" style="margin-left: 2px; width: 18.6%; text-align: center;">
                                Service Tax
                            </div>
                            <div id="Div53" class="divBlue" style="margin-left: 2px; width: 18.6%; text-align: center;">
                                Order No</div>
                        </div>
                        <div style="width: 92%; float: left; margin-left: 15px">
                            <div id="Div9" class="tdsecondary" style="width: 18.6%; height: 24px">
                                <dxe:ASPxTextBox ID="TxtQuantity" runat="server" ClientInstanceName="cTxtQuantity"
                                    Width="146px">
                                    <MaskSettings IncludeLiterals="DecimalSymbol" Mask="&lt;0..9999999999g&gt;.&lt;00..99&gt;" />
                                    <%--<ClientSideEvents GotFocus="OnFocusDetailTextBox" />--%>
                                </dxe:ASPxTextBox>
                            </div>
                            <div id="Div29" class="tdsecondary" style="margin-left: 2px; width: 18.6%; height: 24px">
                                <dxe:ASPxTextBox ID="TxtMarketPrice" runat="server" ClientInstanceName="cTxtMarketPrice"
                                    Width="146px">
                                    <MaskSettings IncludeLiterals="DecimalSymbol" Mask="&lt;0..9999999999g&gt;.&lt;0000..9999&gt;" />
                                    
                                    <%--<ClientSideEvents GotFocus="OnFocusDetailTextBox" />--%>
                                </dxe:ASPxTextBox>
                            </div>
                            <div id="Div43" class="tdsecondary" style="margin-left: 2px; width: 18.6%; height: 24px">
                                <dxe:ASPxTextBox ID="TxtUnitBrokrg" runat="server" ClientInstanceName="cTxtUnitBrokrg"
                                    Width="146px">
                                    <MaskSettings IncludeLiterals="DecimalSymbol" Mask="&lt;0..9999999999g&gt;.&lt;0000..9999&gt;" />
                                    <ClientSideEvents LostFocus="CompareUnitBrkgMrktPrce" />
                                </dxe:ASPxTextBox>
                            </div>
                            <div id="Div51" class="tdsecondary" style="margin-left: 2px; width: 18.6%; height: 24px">
                                <dxe:ASPxComboBox ID="ComboServiceTax" runat="server" ClientInstanceName="cComboServiceTax"
                                    EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                    Width="100%">
                                    <Items>
                                        <dxe:ListEditItem Text="Exclusive" Value="E"></dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Inclusive" Value="I"></dxe:ListEditItem>
                                    </Items>
                                </dxe:ASPxComboBox>
                            </div>
                            <div id="Div56" align="left" class="tdsecondary" style="margin-left: 2px; width: 18.6%;
                                height: 24px">
                                <dxe:ASPxTextBox ID="TxtOrderNo" runat="server" ClientInstanceName="cTxtOrderNo"
                                    Width="98%">
                                    <%--<ClientSideEvents GotFocus="OnFocusDetailTextBox" />--%>
                                </dxe:ASPxTextBox>
                            </div>
                        </div>
                        <div id="Div57" style="width: 55%; float: left; margin-left: 15px">
                            <div id="Div54" class="divBlue" style="width: 31%;">
                                Trade No
                            </div>
                            <%--New Work--%>
                            <div id="Div6" class="divBlue" style="width: 31%;">
                                Effective Date
                            </div>
                            <%--End of New Work--%>
                        </div>
                        <div style="width: 55%; float: left; margin-left: 15px">
                            <div id="Div58" align="left" class="tdsecondary" style="float: left; margin-left: 2px;
                                width: 31%; height: 24px">
                                <dxe:ASPxTextBox ID="TxtTradeNo" runat="server" ClientInstanceName="cTxtTradeNo"
                                    Width="98%">
                                    <%--<ClientSideEvents GotFocus="OnFocusDetailTextBox" />--%>
                                </dxe:ASPxTextBox>
                            </div>
                            <%--New Work--%>
                            <div id="Div32" align="left" class="tdsecondary" style="float: left; margin-left: 2px;
                                width: 31%; height: 24px">
                                <dxe:ASPxDateEdit ID="EffectiveDt" runat="server" ClientInstanceName="cEffectiveDt" DateOnError="Today"
                                    EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="98%">
                                    <ButtonStyle Width="3px">
                                    </ButtonStyle>
                                    <DropDownButton Text="EffectiveDate">
                                    </DropDownButton>
                                    <ClientSideEvents LostFocus="function(s,e){DateChange(cEffectiveDt);}"/>
                                </dxe:ASPxDateEdit>
                            </div>
                            <%--End of New Work--%>
                        </div>
                        <div style="width: 96%; float: left; margin-left: 15px">
                            &nbsp;<div id="Div25" style="float: left; width: 24%">
                                <dxe:ASPxButton ID="btnAdd" runat="server" AccessKey="L" AutoPostBack="false" ClientInstanceName="cbtnAdd"
                                    TabIndex="0" Text="Add To [L]ist" ToolTip="Add Data You Entered into Below Grid (Note. Yet To Be Save)"
                                    Width="90%">
                                    <ClientSideEvents Click="function(s, e) {AddButtonClick();}" />
                                    <Border BorderColor="White" />
                                </dxe:ASPxButton>
                            </div>
                            <div id="Div34" style="float: left; width: 24%">
                                <dxe:ASPxButton ID="btnReEnter" runat="server" AccessKey="R" AutoPostBack="false"
                                    TabIndex="0" Text="[R]enter" ToolTip="Position You On Start Without Adding Data to Grid Below."
                                    Width="90%">
                                    <Border BorderColor="White" />
                                    <ClientSideEvents Click="function(s, e) {ReEnterButtonClick();}" />
                                </dxe:ASPxButton>
                            </div>
                            <div id="Div37" style="float: left; width: 24%">
                                <dxe:ASPxButton ID="btnDiscard" runat="server" AccessKey="D" AutoPostBack="false"
                                    TabIndex="0" Text="[D]iscard Added List" ToolTip="Position You at Very First Position. Remove All Unsave Data."
                                    Width="90%">
                                    <Border BorderColor="White" />
                                    <ClientSideEvents Click="function(s, e) {DiscardButtonClick();}" />
                                </dxe:ASPxButton>
                            </div>
                            <div id="Div1" style="float: left; width: 24%">
                                <dxe:ASPxButton ID="btnPrcdToChrg" runat="server" AccessKey="P" AutoPostBack="false"
                                    TabIndex="0" Text="[P]roceed To Charges" ToolTip="Proceed To Charges Section."
                                    Width="90%">
                                    <Border BorderColor="White" />
                                    <ClientSideEvents Click="function(s, e) {ProceedChargesClick();}" />
                                </dxe:ASPxButton>
                            </div>
                        </div>
                        <br />
                        <br />
                        <br />
                    </div>
                    <b class="rbottom"><b class="r4"></b><b class="r3"></b><b class="r2"></b><b class="r1">
                    </b></b>
                </div>
                <%--<div id="Div46" style="float: left; width: 71%; padding-top: 2px">
            &nbsp;</div>--%>
                <div id="Div_gv" style="float: left; padding-top: 4px; width: 90%" align="center">
                    <dxwgv:ASPxGridView ID="GvTradeDtl" runat="server" Settings-ShowHorizontalScrollBar="true"
                        AutoGenerateColumns="False" KeyFieldName="RowID" ClientInstanceName="cGvTradeDtl"
                        Width="900px" Font-Size="Small" OnCustomCallback="GvTradeDtl_CustomCallback"
                        OnHtmlEditFormCreated="GvTradeDtl_HtmlEditFormCreated" OnRowDeleting="GvTradeDtl_RowDeleting">
                        <ClientSideEvents EndCallback="function (s, e) {GvTradeDtl_EndCallBack();}" />
                        <SettingsBehavior AllowFocusedRow="True" />
                        <Styles>
                            <Header CssClass="gridheader" ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                            <FocusedGroupRow CssClass="gridselectrow">
                            </FocusedGroupRow>
                            <FocusedRow CssClass="gridselectrow">
                            </FocusedRow>
                            <Footer CssClass="gridfooter">
                            </Footer>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                            <Row Wrap="False">
                            </Row>
                            <Cell HorizontalAlign="Left">
                            </Cell>
                        </Styles>
                        <SettingsEditing Mode="EditForm" />
                        <Columns>
                            <dxwgv:GridViewCommandColumn VisibleIndex="0" Width="70px">
                                <EditButton Text="Edit" Visible="True">
                                </EditButton>
                                <DeleteButton Visible="True">
                                </DeleteButton>
                                <CellStyle Font-Underline="False" Font-Size="12px">
                                    <HoverStyle BackColor="#000040">
                                    </HoverStyle>
                                </CellStyle>
                            </dxwgv:GridViewCommandColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Scrip" FieldName="Scrip" VisibleIndex="1"
                                Width="80px">
                                <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Bought/Sold" FieldName="BoughtORSold" VisibleIndex="2"
                                Width="80px">
                                <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Type" FieldName="TypeOf" VisibleIndex="3"
                                Width="80px">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Trade Time" FieldName="TradeTime" VisibleIndex="4"
                                Width="80px">
                                <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Quantity" FieldName="Quantity" VisibleIndex="5"
                                Width="80px">
                                <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Market Price" FieldName="MarketPrice" VisibleIndex="6"
                                Width="80px">
                                <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Unit Brokerage" FieldName="UnitBrokerage"
                                VisibleIndex="7" Width="80px">
                                <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="ServiceTax" FieldName="ServiceTaxType" VisibleIndex="8"
                                Width="82px">
                                <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Order No" FieldName="OrderNo" VisibleIndex="9"
                                Width="80px">
                                <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Trade No" FieldName="TradeNo" VisibleIndex="10"
                                Width="80px">
                                <CellStyle HorizontalAlign="Left" Font-Size="11px">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <%--New Work--%>
                            <dxwgv:GridViewDataDateColumn Caption="Effective Date" FieldName="EffectiveDateGrid" VisibleIndex="11" Width="80px">
                                <%--<PropertiesDateEdit DisplayFormatString="dd-MM-yyyy" />  PropertiesDateEdit-EditFormatString="yyyy-MM-dd" PropertiesDateEdit-DisplayFormatString="yyyy-MM-dd" --%>
                                <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy" EditFormat="Custom">
                                </PropertiesDateEdit>
                                <CellStyle HorizontalAlign="Left" Font-Size="11px">
                                </CellStyle>
                            </dxwgv:GridViewDataDateColumn>
                            <%--End of New Work--%>
                        </Columns>
                        <Templates>
                            <EditForm>
                                <div>
                                    <div id="Div_DetailContentE" align="center">
                                        <div id="Div23" class="divBlue" style="margin-left: 15px; width: 9%; height: 20px;
                                            margin-top: 4px;">
                                            <span style="color: black">Scrip:</span>
                                        </div>
                                        <div id="DivScripE" align="left" class="tdsecondary" style="float: left; margin-left: 2px;
                                            width: 16%; height: 20px; margin-top: 4px;">
                                            <asp:TextBox ID="TxtScripE" runat="server" HorizontalAlign="left" Width="98%" Text='<%# Bind("Scrip") %>'>  
                                            </asp:TextBox>
                                            <asp:HiddenField ID="TxtScripE_hidden" runat="server"  Value='<%# Eval("EquitySeriesID") %>' />
                                        </div>
                                        <div id="Div12" class="divBlue" style="margin-top: 4px; width: 9%; height: 20px">
                                            <span style="color: black; margin-left: 2px;">Bought/Sold:</span>
                                        </div>
                                        <div id="Div13" class="tdsecondary" style="margin-top: 4px; float: left; margin-left: 2px;
                                            width: 12%; height: 20px">
                                            <dxe:ASPxComboBox ID="ComboBoughtSoldE" runat="server" ClientInstanceName="cComboBoughtSoldE"
                                                EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                Width="100%" Text='<%# Bind("BoughtORSold") %>'>
                                                <Items>
                                                    <dxe:ListEditItem Text="Bought" Value="Bght" />
                                                    <dxe:ListEditItem Text="Sold" Value="Sld" />
                                                </Items>
                                                <%-- <ClientSideEvents SelectedIndexChanged="function(s,e){OnTypeChange('SoldTo')}" GotFocus="OnFocusDetailTextBox" />--%>
                                            </dxe:ASPxComboBox>
                                        </div>
                                        <div id="Div14" class="tdsecondary" style="float: left; margin-left: 2px; width: 13%;
                                            height: 20px; margin-top: 4px;">
                                            <dxe:ASPxComboBox ID="ComboTypeE" runat="server" ClientInstanceName="cComboTypeE"
                                                EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                Text='<%# Bind("TypeOf") %>' Width="100%">
                                                <Items>
                                                    <dxe:ListEditItem Text="Delivery" Value="D" />
                                                    <dxe:ListEditItem Text="SquareOff" Value="S" />
                                                </Items>
                                                <DropDownButton Text="Type">
                                                </DropDownButton>
                                                <%--<ClientSideEvents SelectedIndexChanged="function(s,e){OnTypeChange('SoldTo')}" GotFocus="OnFocusDetailTextBox" />--%>
                                            </dxe:ASPxComboBox>
                                        </div>
                                        <div id="Div15" class="divBlue" style="margin-top: 4px; width: 9%; height: 20px">
                                            <span style="color: black; margin-left: 2px;">Trade Time:</span>
                                        </div>
                                        <div id="Div10" runat="server" class="tdsecondary" style="margin-left: 2px; width: 16%;
                                            height: 19.5px; margin-top: 4px;">
                                            <dxe:ASPxDateEdit ID="TradeTimeE" runat="server" ClientInstanceName="cTradeTimeE"
                                                DateOnError="Today" Text='<%# Bind("TradeTime") %>' EditFormat="Custom" EditFormatString="hh:mm:ss"
                                                UseMaskBehavior="True" Width="98%">
                                                <ButtonStyle Width="3px">
                                                </ButtonStyle>
                                                <%--<ClientSideEvents DateChanged="function(s,e){DateChange(cTradeDt);}" GotFocus="OnFocusDetailTextBox" />--%>
                                            </dxe:ASPxDateEdit>
                                            <%--<dxe:ASPxTimeEdit ID="timeEdit" runat="server" DateTime="2009/11/01 15:31:34" Width="200">
                                             <ValidationSettings ErrorDisplayMode="None" />
                                                </dxe:ASPxTimeEdit>--%>
                                        </div>
                                    </div>
                                    <div id="mid" style="width: 92%; float: left; margin-left: 15px">
                                        <div id="Div18" class="divBlue" style="width: 18.6%;">
                                            Quantity
                                        </div>
                                        <div id="Div19" class="divBlue" style="width: 18.6%;">
                                            Market Price</div>
                                        <div id="Div20" class="divBlue" style="width: 18.6%;">
                                            Unit Brokerage&nbsp;(%)
                                        </div>
                                        <div id="Div16" class="divBlue" style="margin-left: 2px; width: 18.6%; text-align: center;">
                                            Service Tax
                                        </div>
                                        <div id="Div53" class="divBlue" style="margin-left: 2px; width: 18.6%; text-align: center;">
                                            Order No
                                        </div>
                                    </div>
                                    <div style="width: 92%; float: left; margin-left: 15px">
                                        <div id="Div9" class="tdsecondary" style="width: 18.6%; height: 24px">
                                            <dxe:ASPxTextBox ID="TxtQuantityE" runat="server" ClientInstanceName="cTxtQuantityE"
                                                Text='<%# Bind("Quantity") %>' Width="146px">
                                                <MaskSettings IncludeLiterals="DecimalSymbol" Mask="&lt;0..9999999999g&gt;.&lt;00..99&gt;" />
                                                <%--<ClientSideEvents GotFocus="OnFocusDetailTextBox" />--%>
                                            </dxe:ASPxTextBox>
                                        </div>
                                        <div id="Div29" class="tdsecondary" style="margin-left: 2px; width: 18.6%; height: 24px">
                                            <dxe:ASPxTextBox ID="TxtMarketPriceE" runat="server" ClientInstanceName="cTxtMarketPriceE"
                                                Text='<%# Bind("MarketPrice") %>' Width="146px">
                                                <MaskSettings IncludeLiterals="DecimalSymbol" Mask="&lt;0..9999999999g&gt;.&lt;00..99&gt;" />
                                                <%--<ClientSideEvents GotFocus="OnFocusDetailTextBox" />--%>
                                            </dxe:ASPxTextBox>
                                        </div>
                                        <div id="Div43" class="tdsecondary" style="margin-left: 2px; width: 18.6%; height: 24px">
                                            <dxe:ASPxTextBox ID="TxtUnitBrokrgE" runat="server" ClientInstanceName="cTxtUnitBrokrgE"
                                                Text='<%# Bind("UnitBrokerage") %>' Width="146px">
                                                <MaskSettings IncludeLiterals="DecimalSymbol" Mask="&lt;0..9999999999g&gt;.&lt;00..99&gt;" />
                                                <%-- <ClientSideEvents GotFocus="OnFocusDetailTextBox" />--%>
                                            </dxe:ASPxTextBox>
                                        </div>
                                        <div id="Div51" class="tdsecondary" style="margin-left: 2px; width: 18.6%; height: 24px">
                                            <dxe:ASPxComboBox ID="ComboServiceTaxE" runat="server" ClientInstanceName="cComboServiceTaxE"
                                                EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                Width="100%" Text='<%# Bind("ServiceTaxType") %>'>
                                                <Items>
                                                    <dxe:ListEditItem Text="Exclusive" Value="E"></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Inclusive" Value="I"></dxe:ListEditItem>
                                                </Items>
                                            </dxe:ASPxComboBox>
                                        </div>
                                        <div id="Divordrnogv" align="left" class="tdsecondary" style="margin-left: 2px; width: 18.6%;
                                            height: 24px">
                                            <dxe:ASPxTextBox ID="TxtOrderNoE" runat="server" ClientInstanceName="cTxtOrderNoE"
                                                Text='<%# Bind("OrderNo") %>' Width="98%">
                                                <%-- <ClientSideEvents GotFocus="OnFocusDetailTextBox" />--%>
                                            </dxe:ASPxTextBox>
                                        </div>
                                    </div>
                                    <div id="Divdetailslowrgv" style="width: 55%; float: left; margin-left: 15px">
                                        <div id="Div54" class="divBlue" style="width: 31%;">
                                            Trade No</div>
                                        <%--New Work--%>
                                        <div id="Div35" class="divBlue" style="width: 31%;">
                                            Effective Date</div>
                                        <%--End of New Work--%>
                                    </div>
                                    <div id="divdtllowrgv" style="width: 55%; float: left; margin-left: 15px">
                                        <div id="Divtradenogv" align="left" class="tdsecondary" style="float: left; margin-left: 2px;
                                            width: 31%; height: 24px">
                                            <dxe:ASPxTextBox ID="TxtTradeNoE" runat="server" ClientInstanceName="cTxtTradeNoE"
                                                Text='<%# Bind("TradeNo") %>' Width="98%">
                                                <%--<ClientSideEvents GotFocus="OnFocusDetailTextBox" />--%>
                                            </dxe:ASPxTextBox>
                                        </div>
                                        <%--New Work--%>
                                        <div id="Diveffectivedtgv" align="left" class="tdsecondary" style="float: left; margin-left: 2px;
                                            width: 31%; height: 24px">
                                            <dxe:ASPxDateEdit ID="EffectiveDtE" runat="server" ClientInstanceName="cEffectiveDtE" DateOnError="Today"
                                                EditFormat="Custom" DisplayFormatString="dd-MM-yyyy" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="98%" 
                                                Text='<%# Bind("EffectiveDate") %>' Value='<%# Bind("EffectiveDate") %>'>
                                                <ButtonStyle Width="3px">
                                                </ButtonStyle>
                                                <DropDownButton Text="EffectiveDate">
                                                </DropDownButton>
                                            </dxe:ASPxDateEdit>
                                        </div>
                                        <%--End of New Work--%>
                                    </div>
                                    
                                    <div id="Divbtnupdtgv" style="float: left; width: 16%">
                                        <dxe:ASPxButton ID="btnUpdate" runat="server" AccessKey="X" AutoPostBack="False"
                                            TabIndex="0" Text="Update Detail" ToolTip="Update the Detail you have inserted now."
                                            Width="90%">
                                            <Border BorderColor="White" />
                                            <ClientSideEvents Click="function(s, e) { Update();}" />
                                        </dxe:ASPxButton>
                                    </div>
                                    <div id="Divbtncnclgv" style="float: left; width: 16%">
                                        <dxe:ASPxButton ID="btnCancel" runat="server" AccessKey="W" AutoPostBack="False"
                                            TabIndex="0" Text="Cancel" ToolTip="Cancel Editing or Updating." Width="90%">
                                            <Border BorderColor="White" />
                                            <ClientSideEvents Click="function(s, e) {CancelEditing();}" />
                                        </dxe:ASPxButton>
                                    </div>
                                    <br />
                                    <br />
                                    <br />
                                </div>
                            </EditForm>
                        </Templates>
                        <SettingsText EmptyDataRow="No Data To Display" />
                        <Settings ShowHorizontalScrollBar="True" />
                        <SettingsLoadingPanel Text="PleaseWait&amp;hellip;" />
                    </dxwgv:ASPxGridView>
                </div>
                <br />
                <br />
                <br />
                <br />
                <br />
            </div>
            <div id="Div_Charges_Total" runat="server">
                <div id="Div_Charges" class="DivRoundedBorder" runat="server" style="width: 89%;
                    float: left; margin-left: 6px">
                    <b class="rtop"><b class="r1"></b><b class="r2"></b><b class="r3"></b><b class="r4">
                    </b></b>
                    <div style="width: 98%">
                        <div id="Div24" class="tdsecondary" style="float: left; margin-left: 15px; width: 33%;
                            height: 19.5px">
                            <dxe:ASPxComboBox ID="ComboChargesType" runat="server" ClientInstanceName="cComboChargesType"
                                EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                Width="100%">
                                <DropDownButton Text="ChargeType">
                                </DropDownButton>
                                <Items>
                                    <dxe:ListEditItem Text="Stamp Duty" Value="STAMPDUTY" />
                                    <dxe:ListEditItem Text="Delivery Charges" Value="DLVRYCHRG" />
                                    <dxe:ListEditItem Text="Transaction Charges" Value="TRANCHRG" />
                                    <dxe:ListEditItem Text="Sebi Fee" Value="SEBIFEE" />
                                    <dxe:ListEditItem Text="Securities Transaction Tax" Value="STT" />
                                    <dxe:ListEditItem Text="Service Tax & Cess" Value="SRVTAXCES" />
                                    <dxe:ListEditItem Text="Central GST" Value="CGST" />
                                    <dxe:ListEditItem Text="State GST" Value="SGST" />
                                    <dxe:ListEditItem Text="Inter-State GST" Value="IGST" />
                                    <dxe:ListEditItem Text="Union Territory Tax" Value="UTT" />
                                    <dxe:ListEditItem Text="Other Charges" Value="OTHCHRG" />
                                    <dxe:ListEditItem Text="Round-Off Adjustments" Value="MISCRND" />
                                </Items>
                                <ClientSideEvents TextChanged="ChargesTypeChange" />
                            </dxe:ASPxComboBox>
                        </div>
                        <div id="Div42" class="divBlue" style="width: 12%; height: 19.5px">
                            <span style="margin: 2px; color: black; height: 19px;">Net Amount:</span>
                        </div>
                        <div id="Div48" class="tdsecondary" style="margin-left: 2px; width: 23%; height: 19.5px;">
                        <dxcp:ASPxCallbackPanel ID="CbpNetAmount" runat="server" ClientInstanceName="cCbpNetAmount"  BackColor="Transparent" OnCallback="CbpNetAmount_Callback" Width="100%">
                             <PanelCollection>
                               <dxp:panelcontent runat="server">
                                 <dxe:ASPxTextBox ID="TxtNetAmount" runat="server" ClientInstanceName="cTxtNetAmount"
                                                Width="195px">
                                                <MaskSettings IncludeLiterals="DecimalSymbol" Mask="&lt;0..9999999999g&gt;.&lt;00..99&gt;" />
                                                <%--<MaskSettings IncludeLiterals="DecimalSymbol" Mask= "<-1000000000000..1000000000000>" />--%>
                                 </dxe:ASPxTextBox>
                              </dxp:panelcontent>
                            </PanelCollection>
                          <ClientSideEvents  EndCallback="function (s, e) {CbpNetAmount_EndCallBack();}" />
                      </dxcp:ASPxCallbackPanel>
                            
                        </div>
                    </div>
                    <div id="Div_ChargesContent" style="margin-top: 4px;">
                        <div id="Div41" style="float: left; width: 96%; padding-top: 2px">
                            <br />
                            <div id="Div35" style="float: left; width: 30%" align="center">
                                <dxe:ASPxButton ID="BtnAddChrges" runat="server" AccessKey="L" AutoPostBack="false"
                                    ClientInstanceName="cbtnAdd" TabIndex="0" Text="Add To [L]ist" ToolTip="Add Data You Entered into Below Grid (Note. Yet To Be Save)"
                                    Width="75%">
                                    <ClientSideEvents Click="function(s, e) {AddButtonClickChrges();}" />
                                    <Border BorderColor="White" />
                                </dxe:ASPxButton>
                            </div>
                            <div id="Div40" style="float: left; width: 30%" align="center">
                                <dxe:ASPxButton ID="BtnReEnterChrges" runat="server" AccessKey="R" AutoPostBack="false"
                                    TabIndex="0" Text="[R]enter" ToolTip="Position You On Start Without Adding Data to Grid Below."
                                    Width="75%">
                                    <Border BorderColor="White" />
                                    <ClientSideEvents Click="function(s, e) {ReEnterButtonClickChrges();}" />
                                </dxe:ASPxButton>
                            </div>
                            <div id="Div44" style="float: left; width: 30%" align="center">
                                <dxe:ASPxButton ID="BtnDiscardChrges" runat="server" AccessKey="D" AllowFocus="False"
                                    AutoPostBack="false" TabIndex="0" Text="[D]iscard Added List" ToolTip="Position You at Very First Position. Remove All Unsave Data."
                                    Width="75%">
                                    <Border BorderColor="White" />
                                    <ClientSideEvents Click="function(s, e) {DiscardButtonClickChrges();}" />
                                </dxe:ASPxButton>
                            </div>
                        </div>
                        <br />
                        <br />
                        <br />
                    </div>
                    <b class="rbottom"><b class="r4"></b><b class="r3"></b><b class="r2"></b><b class="r1">
                    </b></b>
                </div>
                <div id="Div_GVChrges" style="float: left; padding-top: 4px; width: 90%" align="center">
                    <dxwgv:ASPxGridView ID="GvChargesDtl" runat="server" Settings-ShowHorizontalScrollBar="true"
                        AutoGenerateColumns="False" KeyFieldName="RowID" Width="600px" Font-Size="Small"
                        ClientInstanceName="cGvChargesDtl" OnCustomCallback="GvChargesDtl_CustomCallback"
                        OnHtmlEditFormCreated="GvChargesDtl_HtmlEditFormCreated" OnRowDeleting="GvChargesDtl_RowDeleting">
                        <ClientSideEvents EndCallback="function (s, e) {GvChargesDtl_EndCallBack();}" />
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="NextColumn" />
                        <Styles>
                            <Header CssClass="gridheader" ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                            <FocusedGroupRow CssClass="gridselectrow">
                            </FocusedGroupRow>
                            <FocusedRow CssClass="gridselectrow">
                            </FocusedRow>
                            <Footer CssClass="gridfooter">
                            </Footer>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                            <Row Wrap="False">
                            </Row>
                            <Cell HorizontalAlign="Left">
                            </Cell>
                        </Styles>
                        <SettingsEditing Mode="EditForm" />
                        <Columns>
                            <dxwgv:GridViewCommandColumn VisibleIndex="0" Width="80px">
                                <EditButton Text="Edit" Visible="True">
                                </EditButton>
                                <DeleteButton Visible="True">
                                </DeleteButton>
                                <CellStyle Font-Underline="False" Font-Size="12px">
                                    <HoverStyle BackColor="#000040">
                                    </HoverStyle>
                                </CellStyle>
                            </dxwgv:GridViewCommandColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Charge Type" FieldName="ChargeType" VisibleIndex="1"
                                Width="200px">
                                <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Net Amount" FieldName="NetAmount" VisibleIndex="2">
                                <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <Templates>
                            <EditForm>
                                <div id="Div_ChargesContentE" align="center">
                                    <div id="Div31" class="tdsecondary" style="float: left; margin-left: 15px; width: 40%;
                                        height: 19.5px">
                                        <dxe:ASPxComboBox ID="ComboChargesTypeE" runat="server" ClientInstanceName="cComboChargesTypeE"
                                            EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                            Width="100%">
                                            <DropDownButton Text="ChargeType">
                                            </DropDownButton>
                                            <Items>
                                                <dxe:ListEditItem Text="Stamp Duty" Value="STAMPDUTY" />
                                                <dxe:ListEditItem Text="Delivery Charges" Value="DLVRYCHRG" />
                                                <dxe:ListEditItem Text="Transaction Charges" Value="TRANCHRG" />
                                                <dxe:ListEditItem Text="Sebi Fee" Value="SEBIFEE" />
                                                <dxe:ListEditItem Text="Securities Transaction Tax" Value="STT" />
                                                <dxe:ListEditItem Text="Service Tax & Cess" Value="SRVTAXCES" />
                                                <dxe:ListEditItem Text="Other Charges" Value="OTHCHRG" />
                                                <dxe:ListEditItem Text="Round-Off Adjustments" Value="MISCRND" />
                                            </Items>
                                             <ClientSideEvents TextChanged="ChargesTypeChangeE" />
                                        </dxe:ASPxComboBox>
                                    </div>
                                    <div id="Div36" class="divBlue" style="width: 14%; height: 19.5px">
                                        <span style="margin: 2px; color: black; height: 19px;">Net Amount:</span>
                                    </div>
                                    <div id="Div32" class="tdsecondary" style="margin-left: 2px; width: 22%; height: 19.5px;">
                                    
                                    <dxcp:ASPxCallbackPanel ID="CbpNetAmountE" runat="server" ClientInstanceName="cCbpNetAmountE"  BackColor="Transparent" OnCallback="CbpNetAmountE_Callback" Width="100%">
                                         <PanelCollection>
                                           <dxp:panelcontent runat="server">
                                             <dxe:ASPxTextBox ID="TxtNetAmountE" runat="server" ClientInstanceName="cTxtNetAmountE"
                                            Width="160px" Text='<%# Bind("NetAmount") %>'>
                                            <MaskSettings IncludeLiterals="DecimalSymbol" Mask="&lt;0..9999999999g&gt;.&lt;00..99&gt;" />
                                            <%-- <ClientSideEvents GotFocus="OnFocusChargesTextBox" />--%>
                                            </dxe:ASPxTextBox>
                                          </dxp:panelcontent>
                                        </PanelCollection>
                                      <ClientSideEvents  EndCallback="function (s, e) {CbpNetAmountE_EndCallBack();}" />
                                  </dxcp:ASPxCallbackPanel>
                                    
                                        
                                    </div>
                                    <br />
                                </div>
                                <div id="Div_ChargesContentEinner" style="margin-top: 6px;">
                                    <div style="float: right; width: 80%;" align="left">
                                        <div id="Div38" style="float: left; width: 40%; margin-top: 8px;">
                                            <dxe:ASPxButton ID="btnUpdateCharges" runat="server" AccessKey="X" AutoPostBack="False"
                                                TabIndex="0" Text="Update Detail" ToolTip="Update the Detail you have inserted now."
                                                Width="80%">
                                                <Border BorderColor="White" />
                                                <ClientSideEvents Click="function(s, e) { UpdateCharges();}" />
                                            </dxe:ASPxButton>
                                        </div>
                                        <div id="Div45" style="float: left; width: 35%; margin-top: 8px; margin-left: 2px">
                                            <dxe:ASPxButton ID="btnCancelCharges" runat="server" AccessKey="W" AutoPostBack="False"
                                                TabIndex="0" Text="Cancel" ToolTip="Cancel Editing or Updating." Width="80%">
                                                <Border BorderColor="White" />
                                                <ClientSideEvents Click="function(s, e) {CancelEditingCharges();}" />
                                            </dxe:ASPxButton>
                                        </div>
                                    </div>
                                </div>
                            </EditForm>
                        </Templates>
                        <SettingsText EmptyDataRow="No Data To Display" />
                        <Settings ShowHorizontalScrollBar="True" />
                        <SettingsLoadingPanel Text="PleaseWait&amp;hellip;" />
                    </dxwgv:ASPxGridView>
                </div>
            </div>
            <div id="Div_Savebtn" style="float: left; width: 90%; padding-top: 2px; text-align: center;">
                <br />
                <dxcp:ASPxCallbackPanel ID="CbpSave" runat="server" ClientInstanceName="cCbpSave"
                    BackColor="Transparent" OnCallback="CbpSave_Callback" Width="69%" LoadingPanelText="Saving&hellip;">
                    <PanelCollection>
                        <dxp:panelcontent runat="server">
                            <div id="divlstSaveBtn" style="float: left; width: 45%; padding-left: 25px; margin-left: 40px;">
                                <dxe:ASPxButton ID="BtnSave" runat="server" AutoPostBack="False" Text="Save" ToolTip="Save The Whole Entered Data Of This Entry "
                                    ClientInstanceName="cBtnSave" Width="72%">
                                    <ClientSideEvents Click="function(s, e) {SaveButtonClick();}" />
                                    <Paddings PaddingTop="2px" />
                                    <Border BorderColor="White" />
                                </dxe:ASPxButton>
                            </div>
                            <div id="divlstReentrBtn" style="float: left; width: 33%">
                                <dxe:ASPxButton ID="BtnReEnterWhole" runat="server" AutoPostBack="False" Text="[R]eset"
                                    ToolTip="Reset The Whole Entry " ClientInstanceName="cBtnReEnterWhole" Width="93%"
                                    AccessKey="R">
                                    <ClientSideEvents Click="function(s, e) {ReEnterButtonClickWhole();}" />
                                    <Paddings PaddingTop="2px" />
                                    <Border BorderColor="White" />
                                </dxe:ASPxButton>
                            </div>
                            <div id="divlstDeleteBtn" style="float: left; width: 33%">
                                <dxe:ASPxButton ID="BtnDelteWhole" runat="server" AutoPostBack="False" Text="[D]elete"
                                    ToolTip="Delete The Whole Entered Data Of This Entry " ClientInstanceName="cBtnDelteWhole"
                                    Width="93%" AccessKey="D">
                                    <ClientSideEvents Click="function(s, e) {DeleteButtonClick();}" />
                                    <Paddings PaddingTop="2px" />
                                    <Border BorderColor="White" />
                                </dxe:ASPxButton>
                            </div>
                        </dxp:panelcontent>
                    </PanelCollection>
                    <ClientSideEvents EndCallback="function (s, e) {CbpSave_EndCallBack();}" />
                </dxcp:ASPxCallbackPanel>
                <br />
            </div>
            <br />
            <asp:HiddenField ID="HiddenEntryType" runat="server" />
        </div>
        <dxpc:ASPxPopupControl ID="PopUp_ExistEntry" runat="server" ClientInstanceName="cPopUp_ExistEntry"
            CloseAction="None" HeaderText="UnSaved Entry Already Exist for This ContractNote Number" Modal="True" PopupHorizontalAlign="LeftSides"
            PopupVerticalAlign="TopSides" ShowOnPageLoad="False" ShowSizeGrip="False" Width="600px">
            <ClientSideEvents PopUp="function(s, e)
                                                    {
                                                    setTimeout('cBtnContinue.Focus()', 50);
                                                    }" />
            <ContentCollection>
                <dxpc:PopupControlContentControl runat="server">
                    <asp:Panel ID="Panel_Start" runat="server" Width="529px">
                        <div style="text-align: center">
                            <div id="DivPopCont" align="center" style="width:40%;float:left">
                                <dxe:ASPxButton ID="BtnContinue" runat="server" AutoPostBack="False" Text="Continue With The Old Entry" 
                                    ClientInstanceName="cBtnContinue" HorizontalAlign="Center">
                                    <ClientSideEvents Click="function (s, e) {PopUp_Continue_Click();cPopUp_ExistEntry.Hide(); }" />
                                </dxe:ASPxButton> 
                            </div>
                            
                            <div id="DivPopRfsh" runat="server" align="center" style="width: 40%;float:left">
                                <dxe:ASPxButton ID="BtnPopUpRfrsh" runat="server"  ClientInstanceName="cBtnPopUpRfrsh" AutoPostBack="False" Text="Refresh With New Entry" 
                                    HorizontalAlign="Center">
                                    <ClientSideEvents Click="function (s, e) {PopUp_Rfrsh_Click();cPopUp_ExistEntry.Hide(); }" />
                                </dxe:ASPxButton>
                            </div>
                        </div>
                    </asp:Panel>
                </dxpc:PopupControlContentControl>
            </ContentCollection>
            <HeaderStyle BackColor="LightGray" Font-Names="Calibri" ForeColor="Black" />
        </dxpc:ASPxPopupControl>
        <dxpc:ASPxPopupControl ID="ConfirmPopUp1" runat="server" ClientInstanceName="cConfirmPopUp1"
            CloseAction="None" HeaderText="Confirmation Message" Left="200" Modal="True"
            PopupHorizontalAlign="Center" PopupHorizontalOffset="500" PopupVerticalAlign="BottomSides"
            PopupVerticalOffset="2000" RenderIFrameForPopupElements="True" ShowSizeGrip="False"
            Top="100" Width="387px">
            <ContentCollection>
                <dxpc:PopupControlContentControl runat="server">
                    <table class="style1">
                        <tr>
                            <td colspan="5">
                                &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<span style="font-family: Calibri">If You Reset All
                                    Your Entered Data Will Be Lost<br />
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Do
                                    You Still Want To Reset???</span></td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td style="width: 3px">
                                <dxe:ASPxButton ID="btnCnfrmYs1" runat="server" AutoPostBack="False" Height="6px"
                                    meta:resourceKey="btnContinueResource1" Text="Yes" Width="192px">
                                    <clientsideevents click="function (s, e) { ConfirmPopUpClickYes1(); cConfirmPopUp1.Hide(); }"></clientsideevents>
                                </dxe:ASPxButton>
                            </td>
                            <td style="width: 3px">
                                <dxe:ASPxButton ID="btnCnfrmYNo1" runat="server" AutoPostBack="False" Text="No" Width="140px">
                                    <clientsideevents click="function (s, e) { cConfirmPopUp1.Hide(); }"></clientsideevents>
                                </dxe:ASPxButton>
                            </td>
                        </tr>
                    </table>
                </dxpc:PopupControlContentControl>
            </ContentCollection>
        </dxpc:ASPxPopupControl>
        <dxpc:ASPxPopupControl ID="ConfirmPopUp2" runat="server" ClientInstanceName="cConfirmPopUp2"
            CloseAction="None" HeaderText="Confirmation Message" Left="700" Modal="True"
            PopupHorizontalAlign="Center" PopupHorizontalOffset="500" PopupVerticalAlign="BottomSides"
            PopupVerticalOffset="2000" RenderIFrameForPopupElements="True" ShowSizeGrip="False"
            Top="100" Width="387px">
            <ContentCollection>
                <dxpc:PopupControlContentControl runat="server">
                    <table class="style1">
                        <tr>
                            <td colspan="5">
                                &nbsp; &nbsp; &nbsp; &nbsp; A<span style="font-family: Calibri">re you sure you want
                                    to Delete the Entry???</span></td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td style="width: 3px">
                                <dxe:ASPxButton ID="btnCnfrmYs2" runat="server" AutoPostBack="False" Height="6px"
                                    meta:resourceKey="btnContinueResource1" Text="Yes" Width="192px">
                                    <clientsideevents click="function (s, e) { ConfirmPopUpClickYes2(); cConfirmPopUp2.Hide(); }"></clientsideevents>
                                </dxe:ASPxButton>
                            </td>
                            <td style="width: 3px">
                                <dxe:ASPxButton ID="btnCnfrmYNo2" runat="server" AutoPostBack="False" Text="No" Width="140px">
                                    <clientsideevents click="function (s, e) { cConfirmPopUp2.Hide(); }"></clientsideevents>
                                </dxe:ASPxButton>
                            </td>
                        </tr>
                    </table>
                </dxpc:PopupControlContentControl>
            </ContentCollection>
        </dxpc:ASPxPopupControl>
        
        
        <%--<dxpc:ASPxPopupControl ID="PopUp_InfoEdit" runat="server" ClientInstanceName="cPopUp_InfoEdit"
            CloseAction="None" HeaderText="Please Give The Information" Modal="True" PopupHorizontalAlign="LeftSides"
            PopupVerticalAlign="TopSides" ShowSizeGrip="False" Width="600px">
            <ClientSideEvents PopUp="function(s, e)
                                                    {
                                                    setTimeout('cComboMode.Focus()', 50);
                                                    }" />
            <ContentCollection>
                <dxpc:PopupControlContentControl runat="server">
                    <asp:Panel ID="Panel1" runat="server" DefaultButton="EditbtnOk" Width="529px">
                        <div style="text-align: center">
                            <div id="Div26" runat="server" class="tdsecondary" style="margin-left: 4px; width: 18%;
                                height: 15px; margin-top: 5px; padding-top: 4px;">
                                ContractNoteNo:&nbsp;</div>
                            <div id="DivContractNoteP" runat="server" class="tdsecondary" style="margin-left: 2px;
                                width: 25%; height: 24px; margin-top: 4px;">
                                <dxe:ASPxTextBox ID="TxtContractNotePopUp" runat="server" ClientInstanceName="cTxtContractNotePopUp"
                                    Width="132px">
                                   <MaskSettings Mask="<0..999999999>" />
                                </dxe:ASPxTextBox>
                                &nbsp;</div>
                            <div id="Div6" runat="server" class="tdsecondary" style="margin-left: 4px; width: 12%;
                                height: 15px; margin-top: 5px; padding-top: 4px;">
                                BrokerName:&nbsp;</div>
                            <div id="DivBrokrNmP" runat="server" align="left" class="tdsecondary" style="margin-left: 2px;
                                width: 33%; height: 24px; margin-top: 4px;">
                                <asp:TextBox ID="TxtPopUpBrokrNm" runat="server" Font-Size="Small" Width="97%"></asp:TextBox>
                            </div>
                            <asp:HiddenField id="TxtPopUpBrokrNm_hidden" runat="server"></asp:HiddenField>
                            <br />
                            <div id="Div39" runat="server" align="center" style="width: 67%">
                                <dxe:ASPxButton ID="EditbtnOk" runat="server" AutoPostBack="False" Text="Ok" Width="85px"
                                    HorizontalAlign="Center">
                                    <ClientSideEvents Click="function (s, e) {PopUp_InfoEdit_abtnOK_Click();}" />
                                </dxe:ASPxButton>
                            </div>
                        </div>
                    </asp:Panel>
                </dxpc:PopupControlContentControl>
            </ContentCollection>
            <HeaderStyle BackColor="LightGray" Font-Names="Calibri" ForeColor="Black" />
        </dxpc:ASPxPopupControl>--%>
    
 
    </form>
</body>
</html>
