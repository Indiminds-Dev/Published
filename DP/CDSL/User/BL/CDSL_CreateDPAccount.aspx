<%@ page language="C#" autoeventwireup="true" inherits="BL_CDSL_CreateDPAccount, App_Web_f9t-z9uf" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export" Namespace="DevExpress.Web.ASPxGridView.Export"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Untitled Page</title>
    <script type="text/javascript" src= "../../../../CentralData/JSScript/jquery-1.3.2.js"></script>
    <script type="text/javascript" src="../../../../CentralData/JSScript/init.js"></script>
    <script type="text/javascript" src="../../../../CentralData/JSScript/GenericJScript.js"></script>
    <script type="text/javascript" src="../../../../CentralData/JSScript/GenericAjaxList.js"></script>
    
    
    <link type="text/css" href="../../../../CentralData/CSS/GenericAjaxStyle.css" rel="Stylesheet" />
    <link type="text/css" href="../../../../CentralData/CSS/GenericCss.css" rel="Stylesheet" />

    <style type="text/css">
        
        
        .Leftdiv{width:190px;height:25px;font-size:12px;}
        .DivHeader{background-color:#B8B8B8 ;width:99%; font-family:Calibri; font-weight:bold; padding-left:10px; margin-bottom:5px;}
        .Spanclass{color:Red;font-size:14px;}
        .DivName{height:25px;text-align:center;margin-left: 10px;}
        .frmleftContent{float:left; margin:2px; padding:2px; height:26px; border: solid 1px  #D1E0F3; font-size:14px;}
        .BtmMargin{margin-bottom:10px}
        .LeftMargin{margin-left:10px}
        .RightMargin{margin-right:25px}
        .TopMargin{margin-top:10px}
        .heightDiv{Height:30px}
        .FontChange{font-family:Arial;font-size:9pt}
        .SetBorder{border: solid 1px  #D1E0F3;}
        .PopUpLable{background-color: #DDD;border: solid .1pt #aaa;}
        .BindDiv{font-weight:bold;font-size:13px;font-family:Calibri;padding-left:4px}
        .Box_TotalRecord { margin-left: 5px;z-index: 50; position: absolute; overflow-x: hidden; overflow-y: hidden; 
                           width: 1080px; height: 35px; padding: 2px 20px 2px 2px; 
                           background-color: #aaa; opacity: 0.9; filter: alpha(opacity=90);}
        .Box_closeTotal { margin-left:20px;z-index: 55; position: fixed; width:16px; height:20px;
                          text-align:center; color: #000;  font-weight:bold; background: #F4A460; border:solid 2px #ccc; 
                          border-bottom:none; }
        .cellTotHeader { padding:2px; height: 22px; border: solid .1pt #F4A460;font-size: 11px; background-color: #DDD;
                         font-weight:bold; text-align:center;} 
    </style>
    <script type="text/javascript" language="javascript">
     //Global Variable
        FieldName = '';
        var AplicatnNo = '';
        var PrdctBind = '';
        var NameAdrs = '';
        var ContactPan = '';
        var UserDefined = '';
        var SecndAcntHldr = '';
        var ThrdAcntHldr = '';
        var ProductDtls = '';
        var POADtls = '';
        var Nominee = '';
        var Gurdian = '';
        var NomineeGurdian = '';
        var EntryType = 'Add';
        var currentDateToset=new Date('<%=Session["ServerDate"] %>');
        
    //End



////////////////////////New DevExpress validation///////////////////////////////////
function DevE_Control_Empty(obj,ErrMsg)
{

  if(obj.GetText().trim()== "")
    {
        alert(ErrMsg);
        obj.Focus(); 
        return false;
    }
    else 
    {
        return true;
    } 
}
function DevE_MaskedControl_Empty(obj,ErrMsg)
{
    if(obj.GetValue()=='0')
    {
        alert(ErrMsg);
        obj.Focus(); 
        return false;
    }
    else 
    {
        return true;
    } 
}
function  DevE_Control_CompareText(obj,CompareText,ErrMsg)
{
   var TextToCompare='';
   var WhatReturn='true';
   for(var i=0;i<CompareText.split(',').length;i++)
   {
       TextToCompare=CompareText.split(',')[i];
       if(obj.GetValue().trim() == TextToCompare)
       {
            alert(ErrMsg);
            obj.Focus(); 
            WhatReturn='false';
        }
    }
    if(WhatReturn=='false')
        return false;
    else
        return true; 
}
//These Method When Compare Any Control and Focus On Other
function  DevE_Control_Empty_FocusOtherCntrl(obj,FcsObj,ErrMsg)
{
   if(obj.GetValue()== null)
   {
        alert(ErrMsg);
        FcsObj.Focus(); 
        return false;
    }
    else 
    {
        return true;
    } 
}
function  DevE_Control_CompareText_FocusOtherCntrl(obj,CompareText,FcsObj,ErrMsg)
{
   var TextToCompare='';
   var WhatReturn='true';
   for(var i=0;i<CompareText.split(',').length;i++)
   {
       TextToCompare=CompareText.split(',')[i];
       if(obj.GetValue().trim() == TextToCompare)
       {
            alert(ErrMsg);
            FcsObj.Focus();
            WhatReturn='false';
        }
    }
    if(WhatReturn=='false')
        return false;
    else
        return true; 
}
function SetValidDate(obj)
{   
    if(obj.GetText()<'01-01-1900')
    {
        obj.SetText('01-01-1900');
    }
}
///////////////////////////////////End Of DevExpressValidation///////////////////////////////////

function SetinnerHTML(obj,Value)
{
    document.getElementById(obj).innerHTML=Value;
}
function OnCheckedShowHide(rdBtn,objShowHide)
{
    if (rdBtn == true)
    {
       HideShow(objShowHide,'S');
    }
    else
    {
       HideShow(objShowHide,'H'); 
    }
 
}

function ColourChangeLostFocus(obj1,obj2)
{
   if(obj2.GetText()=="")
   {
    obj1.style.color = '#CCCCCC';
   }
}
function verifyPanCrdNo(Obj)
{
    var status = false;     
    var PanCrdChk=/^([A-Z]){5}([0-9]){4}([A-Z]){1}?$/;
    if(PanCrdChk.test(Obj.GetValue())==false)
    {
        alert("Please enter a valid PanCard No");
        Obj.Focus();
    }
    else
    {
        status = true;
    }    
    return status;
}

function btnCloseTotal_click()
{
   HideShow('btnClose','H');
   HideShow('divForOverView','H');
   HideShow('btnOpen','S');
}
 
function btnOpenTotal_click()
{
   HideShow('btnOpen','H');
   HideShow('btnClose','S');
   HideShow('divForOverView','S');
   if(Div_NameAddress.style.display != 'none')
   {
      NameAdrsColourChange();
              
   }
   if(GetObjectID('Div_Contact_Pan').style.display == 'inline')
   {
      ContactPanColourChange();
           
   }
   if(GetObjectID('Div_UserDef').style.display == 'inline')
   {
      UserDefinedColourChange();
              
   }
   if(GetObjectID('Div_SecondAccountHlder').style.display == 'inline')
   {
      SecondAccHldrColourChange();
              
   }
   if(GetObjectID('Div_ThirdAccountHlder').style.display == 'inline')
   {
      ThrdAccHldrColourChange();
         
   }
   if(GetObjectID('Div_ProductDetails').style.display == 'inline')
   {
      ProductDtlsColourChange();
               
   }
   if(GetObjectID('Div_POADetails').style.display == 'inline')
   {
      POADtlsColourChange();
                
   }
   if(GetObjectID('Div_NomineeNameAdrs').style.display == 'inline')
   {
      NomineeNameAdrsColourChange();
                         
   } 
   if(GetObjectID('Div_GurdianNameAdrs').style.display == 'inline')
   {
      GurdianNameAdrsColourChange();
              
   }
   if(GetObjectID('Div_NomGurdianNameAdrs').style.display == 'inline')
   {
      NomGurdianNameAdrsColourChange();
           
   }
}

function NameAdrsColourChange()
{
      SetStyle("Div_FNameAddress","BGColor","#F4A460");
      SetStyle("Div_FContactPan","BGColor","#DDD");
      SetStyle("Div_FUserDefined","BGColor","#DDD");
      SetStyle("Div_SecondAccount","BGColor","#DDD");
      SetStyle("Div_ThirdAccount","BGColor","#DDD");
      SetStyle("Div_Product","BGColor","#DDD");
      SetStyle("Div_POA","BGColor","#DDD");
      SetStyle("Div_Nominee","BGColor","#DDD");
      SetStyle("Div_Gurdian","BGColor","#DDD");
      SetStyle("Div_NomGurdian","BGColor","#DDD");          
}

function ContactPanColourChange()
{
      SetStyle("Div_FNameAddress","BGColor","#DDD");
      SetStyle("Div_FContactPan","BGColor","#F4A460");
      SetStyle("Div_FUserDefined","BGColor","#DDD");
      SetStyle("Div_SecondAccount","BGColor","#DDD");
      SetStyle("Div_ThirdAccount","BGColor","#DDD");
      SetStyle("Div_Product","BGColor","#DDD");
      SetStyle("Div_POA","BGColor","#DDD");
      SetStyle("Div_Nominee","BGColor","#DDD");
      SetStyle("Div_Gurdian","BGColor","#DDD");
      SetStyle("Div_NomGurdian","BGColor","#DDD");          
}

function UserDefinedColourChange()
{
      SetStyle("Div_FNameAddress","BGColor","#DDD");
      SetStyle("Div_FContactPan","BGColor","#DDD");
      SetStyle("Div_FUserDefined","BGColor","#F4A460");
      SetStyle("Div_SecondAccount","BGColor","#DDD");
      SetStyle("Div_ThirdAccount","BGColor","#DDD");
      SetStyle("Div_Product","BGColor","#DDD");
      SetStyle("Div_POA","BGColor","#DDD");
      SetStyle("Div_Nominee","BGColor","#DDD");
      SetStyle("Div_Gurdian","BGColor","#DDD");
      SetStyle("Div_NomGurdian","BGColor","#DDD");          
}
function SecondAccHldrColourChange()
{
      SetStyle("Div_FNameAddress","BGColor","#DDD");
      SetStyle("Div_FContactPan","BGColor","#DDD");
      SetStyle("Div_FUserDefined","BGColor","#DDD");
      SetStyle("Div_SecondAccount","BGColor","#F4A460");
      SetStyle("Div_ThirdAccount","BGColor","#DDD");
      SetStyle("Div_Product","BGColor","#DDD");
      SetStyle("Div_POA","BGColor","#DDD");
      SetStyle("Div_Nominee","BGColor","#DDD");
      SetStyle("Div_Gurdian","BGColor","#DDD");
      SetStyle("Div_NomGurdian","BGColor","#DDD");          
}

function ThrdAccHldrColourChange()
{
      SetStyle("Div_FNameAddress","BGColor","#DDD");
      SetStyle("Div_FContactPan","BGColor","#DDD");
      SetStyle("Div_FUserDefined","BGColor","#DDD");
      SetStyle("Div_SecondAccount","BGColor","#DDD");
      SetStyle("Div_ThirdAccount","BGColor","#F4A460");
      SetStyle("Div_Product","BGColor","#DDD");
      SetStyle("Div_POA","BGColor","#DDD");
      SetStyle("Div_Nominee","BGColor","#DDD");
      SetStyle("Div_Gurdian","BGColor","#DDD");
      SetStyle("Div_NomGurdian","BGColor","#DDD");          
}

function ProductDtlsColourChange()
{
      SetStyle("Div_FNameAddress","BGColor","#DDD");
      SetStyle("Div_FContactPan","BGColor","#DDD");
      SetStyle("Div_FUserDefined","BGColor","#DDD");
      SetStyle("Div_SecondAccount","BGColor","#DDD");
      SetStyle("Div_ThirdAccount","BGColor","#DDD");
      SetStyle("Div_Product","BGColor","#F4A460");
      SetStyle("Div_POA","BGColor","#DDD");
      SetStyle("Div_Nominee","BGColor","#DDD");
      SetStyle("Div_Gurdian","BGColor","#DDD");
      SetStyle("Div_NomGurdian","BGColor","#DDD");          
}

function POADtlsColourChange()
{
      SetStyle("Div_FNameAddress","BGColor","#DDD");
      SetStyle("Div_FContactPan","BGColor","#DDD");
      SetStyle("Div_FUserDefined","BGColor","#DDD");
      SetStyle("Div_SecondAccount","BGColor","#DDD");
      SetStyle("Div_ThirdAccount","BGColor","#DDD");
      SetStyle("Div_Product","BGColor","#DDD");
      SetStyle("Div_POA","BGColor","#F4A460");
      SetStyle("Div_Nominee","BGColor","#DDD");
      SetStyle("Div_Gurdian","BGColor","#DDD");
      SetStyle("Div_NomGurdian","BGColor","#DDD");          
      
}
function NomineeNameAdrsColourChange()
{
      SetStyle("Div_FNameAddress","BGColor","#DDD");
      SetStyle("Div_FContactPan","BGColor","#DDD");
      SetStyle("Div_FUserDefined","BGColor","#DDD");
      SetStyle("Div_SecondAccount","BGColor","#DDD");
      SetStyle("Div_ThirdAccount","BGColor","#DDD");
      SetStyle("Div_Product","BGColor","#DDD");
      SetStyle("Div_POA","BGColor","#DDD");
      SetStyle("Div_Nominee","BGColor","#F4A460");
      SetStyle("Div_Gurdian","BGColor","#DDD");
      SetStyle("Div_NomGurdian","BGColor","#DDD");                    
} 
function GurdianNameAdrsColourChange()
{
      SetStyle("Div_FNameAddress","BGColor","#DDD");
      SetStyle("Div_FContactPan","BGColor","#DDD");
      SetStyle("Div_FUserDefined","BGColor","#DDD");
      SetStyle("Div_SecondAccount","BGColor","#DDD");
      SetStyle("Div_ThirdAccount","BGColor","#DDD");
      SetStyle("Div_Product","BGColor","#DDD");
      SetStyle("Div_POA","BGColor","#DDD");
      SetStyle("Div_Nominee","BGColor","#DDD");
      SetStyle("Div_Gurdian","BGColor","#F4A460");
      SetStyle("Div_NomGurdian","BGColor","#DDD");          
}
function NomGurdianNameAdrsColourChange()
{
      SetStyle("Div_FNameAddress","BGColor","#DDD");
      SetStyle("Div_FContactPan","BGColor","#DDD");
      SetStyle("Div_FUserDefined","BGColor","#DDD");
      SetStyle("Div_SecondAccount","BGColor","#DDD");
      SetStyle("Div_ThirdAccount","BGColor","#DDD");
      SetStyle("Div_Product","BGColor","#DDD");
      SetStyle("Div_POA","BGColor","#DDD");
      SetStyle("Div_Nominee","BGColor","#DDD");
      SetStyle("Div_Gurdian","BGColor","#DDD");
      SetStyle("Div_NomGurdian","BGColor","#F4A460");  
}
    
function PageLoad()
{   
  HideShow('DivBtnSaveNameAdrs','H');
  HideShow('DivBtnEditNameAdrs','H');
  HideShow('DivBtnEditUserDefined','H');
  HideShow('DivBtnEditScndAcntHlder','H');
  HideShow('DivBtnEditThrdAcntHlder','H');
  HideShow('DivBtnEditPOADtls','H');
  HideShow('Row21','H');
  HideShow('Row30','H');
  HideShow('Row11','H'); 
  HideShow('DivEntryForm','H'); 
  HideShow('Div_FirstAccountHlder','H');  
  HideShow('Div_SecondAccountHlder','H');  
  HideShow('Div_ThirdAccountHlder','H');  
  HideShow('Div_ProductDetails','H');  
  HideShow('Div_POADetails','H');
  HideShow('Div_NomineeNameAdrs','H');
  HideShow('Div_GurdianNameAdrs','H');
  HideShow('Div_NomGurdianNameAdrs','H'); 
  HideShow('Row65','H'); 
  HideShow('DivBtnSave','H');
  HideShow('DivSaved','H'); 
  HideShow('DivXMLUnsaved','H'); 
  HideShow('Row18_Col2','H');
  HideShow('Row27_Col2','H');
  HideShow('rowGV0','H'); 
  HideShow('btnOpen','H');
  HideShow('btnClose','H'); 
  HideShow('divForOverView','H');
  HideShow('DivSubmitAlert','H'); 
  
  VisibleInVisible('DivNameAdrsAlrt','H');
  VisibleInVisible('DivPanContctAlrt','H');
  VisibleInVisible('DivUsrDefindAlrt','H');
  VisibleInVisible('DivScndHlderAlrt','H');
  VisibleInVisible('DivThrdHldrAlrt','H');
  VisibleInVisible('DivPrdctDtlAlrt','H');
  VisibleInVisible('DivPOAAlrt','H');
  VisibleInVisible('DivNomineeNameAdrsAlrt','H');
  VisibleInVisible('DivGurdianNameAdrsAlrt','H');
  VisibleInVisible('DivNomGurdianAlrt','H');
  
  HideShow('DivBtnNextPOADtls','H');
  HideShow('DivBtnEditNomineeNameAdrs','H');
  HideShow('DivBtnNextNomineeNameAdrs','H');
  HideShow('DivBtnEditGurdianNameAdrs','H');
  HideShow('DivBtnNextGurdianNameAdrs','H');
  HideShow('DivBtnNextGurdianNameAdrs','H');
  HideShow('DivBtnEditNomGurdianNameAdrs','H');
   
  HideShow('Row6_0','H');
  PpRow0.style.visibility = 'hidden';
  PpRow1.style.visibility = 'hidden';
  PpRow2.style.visibility = 'hidden';
  HideShow('DivBtnOk','H');
  cTxtFName.Focus();
}

function CallAjax(obj1,obj2,obj3,Query)
{
    var CombinedQuery=new String(Query);
    var GenericAjaxListAspxPath = '../../../../CentralData/Pages/GenericAjaxList.aspx';
    ajax_showOptions(obj1,obj2,obj3,replaceChars(CombinedQuery),'Main',GenericAjaxListAspxPath);
} 
//------------------------------------Start GridView Fields------------------------------------------------
  
function OnLeftNav_Click()
{
    SetValue("hdn_GridBindOrNotBind","False"); 
    var i=GetObjectID("A1").innerText;
    GetObjectID('A1').className="number_box_selected";
   
    if(parseInt(i)>1)
    {
        cGridEntryRecord.PerformCallback("SearchByNavigation~"+GetObjectID("A1").innerText+"~LeftNav");
    }
    else 
    {
        alert('No More Pages.');   
    }     
}
 
function OnRightNav_Click()
{
    SetValue("hdn_GridBindOrNotBind","False"); 
    var TestEnd=GetObjectID("A10").innerText;       
    var TotalPage=GetObjectID("B_TotalPage").innerText;
    if(TestEnd=="" || TestEnd==TotalPage)
    {
         alert('No More Records.');
         return;
    }
    var i=GetObjectID("A1").innerText;
   
    if(parseInt(i)<TotalPage)
    {
        cGridEntryRecord.PerformCallback("SearchByNavigation~"+GetObjectID("A1").innerText+"~RightNav");
    }
    else
    {
        alert('You are at the End');
    }
}
 
function OnPageNo_Click(obj)
{
    SetValue("hdn_GridBindOrNotBind","False"); 
    var i=GetObjectID(obj).innerText;
    CurrentPg = i;
    cGridEntryRecord.PerformCallback("SearchByNavigation~"+i+"~PageNav");        
}
    
 
 function GridEntryRecord_EndCallBack()
 {
        if(cGridEntryRecord.cpRefreshNavPanel!=undefined)
        {
            GetObjectID("B_PageNo").innerText='';
            GetObjectID("B_TotalPage").innerText='';
            GetObjectID("B_TotalRows").innerText='';
            
            var NavDirection=cGridEntryRecord.cpRefreshNavPanel.split('~')[0];
            var PageNum=cGridEntryRecord.cpRefreshNavPanel.split('~')[1];
            var TotalPage=cGridEntryRecord.cpRefreshNavPanel.split('~')[2];
            var TotalRows=cGridEntryRecord.cpRefreshNavPanel.split('~')[3];
            
            if(NavDirection=="RightNav")
            {
                PageNum=parseInt(PageNum)+10;
                GetObjectID("B_PageNo").innerText=PageNum;
                GetObjectID("B_TotalPage").innerText=TotalPage;
                GetObjectID("B_TotalRows").innerText=TotalRows;
                var n=parseInt(TotalPage)-parseInt(PageNum)>10?parseInt(11):parseInt(TotalPage)-parseInt(PageNum)+2;
                for(r=1;r<n;r++)
                {
                    var obj = "A"+r;
                    GetObjectID(obj).innerText=" "+PageNum+++" ";
                }
                for(r=n;r<11;r++)
                {
                    var obj="A"+r;
                    GetObjectID(obj).innerText="";
                }
            }
            if(NavDirection=="LeftNav")
            {
                if(parseInt(PageNum)>1)
                {   
                    PageNum=parseInt(PageNum)-10;
                    GetObjectID("B_PageNo").innerText=PageNum;
                    GetObjectID("B_TotalPage").innerText=TotalPage;
                    GetObjectID("B_TotalRows").innerText=TotalRows;
                    for(l=1;l<11;l++)
                    {
                        var obj="A"+l;
                        GetObjectID(obj).innerText=" "+PageNum+++" ";                        
                    }
                }
                else
                {
                    alert('No More Pages.');
                }
            }
            if(NavDirection=="PageNav")
            {
                GetObjectID("B_PageNo").innerText=PageNum;
                GetObjectID("B_TotalPage").innerText=TotalPage;
                GetObjectID("B_TotalRows").innerText=TotalRows;
            }
            if(NavDirection=="ShowBtnClick")
            {
                GetObjectID("B_PageNo").innerText=PageNum;
                GetObjectID("B_TotalPage").innerText=TotalPage;
                GetObjectID("B_TotalRows").innerText=TotalRows;
                var n=parseInt(TotalPage)-parseInt(PageNum)>=10?parseInt(11):parseInt(TotalPage)-parseInt(PageNum)+2;
                for(r=1;r<n;r++)
                {
                    var obj="A"+r;
                    GetObjectID(obj).innerText=" "+PageNum+++" ";
                }                
                for(r=n;r<11;r++)
                {
                    var obj="A"+r;
                    GetObjectID(obj).innerText="";                    
                }      
                         
            }
        }
        if(cGridEntryRecord.cpSetGlobalFields!=undefined)
        { 
             SetValue("Hdn_PageSize",cGridEntryRecord.cpSetGlobalFields.split('~')[0]);
             SetValue("Hdn_PageNumber",cGridEntryRecord.cpSetGlobalFields.split('~')[1]);
                        
        }
        SetValue("hdn_GridBindOrNotBind","True"); 
        if(cGridEntryRecord.cpNoFileFound == "T")
        {
            alert("No UnSaved Entries To Display");
            cGridEntryRecord.cpNoFileFound = null;
        }
        if(cGridEntryRecord.cpAnotherUser == "T")
        {
            alert('Sorry it is Created by another User..You dont have the Permission to Delete this Record!!');
            cGridEntryRecord.cpAnotherUser = null;
        }  
        if(cGridEntryRecord.cpBindUnSaved == "T")
        {    
             cGridEntryRecord.PerformCallback('BindForEditUnSaved~');
             cGridEntryRecord.cpBindUnsaved = null;
        }      
        Height('350','350');
        
 }
  
 function BackToSearch()
 {
     window.location="../BL/CDSL_CreateDPAccount.aspx";  
 }
 
 function ForOpen(obj)
 {
    if(EntryType == 'Add')
    {
     HideShow('Row65','S'); 
     AplicatnNo = obj;
     cCbpNameAddress.PerformCallback('BindFrstHolder~'+obj+'~ ');    
    }
    else if(EntryType == 'AddEdit')
    {
      HideShow('Row65','S'); 
      AplicatnNo = obj;
      cCbpNameAddress.PerformCallback('BindFrstHolderUnSaved~'+obj);   
    }
    else if(EntryType == 'Edit')
    {
      HideShow('Row65','S'); 
      HideShow('DivBtnSave','S'); 
      HideShow('DivBtnReset','H');
      AplicatnNo = obj;
      NameAdrs = 'T';
      ContactPan = 'T';
      UserDefined = 'T';
      SecndAcntHldr = 'T';
      ThrdAcntHldr = 'T';
      ProductDtls = 'T';
      POADtls = 'T';
      Nominee = 'T';
      Gurdian = 'T';
      NomineeGurdian = 'T';
      cCbpNameAddress.PerformCallback('EditNameAddress~'+obj);     
    }
    HideShow('btnOpen','S'); 
 }
 function ForDelete(obj)
 {
    cGridEntryRecord.PerformCallback('DeleteRecord~'+obj);     
 } 
//------------------------------------End GridView Fields--------------------------------------------------
    
   function DisableAll(CallbackPanelID)
   { 
        var controls = document.getElementById(CallbackPanelID).getElementsByTagName("input");

        for (var i = 0; i < controls.length; i++)
        controls[i].disabled = true;
   }
   function EnableAll(CallbackPanelID)
   { 
        var controls = document.getElementById(CallbackPanelID).getElementsByTagName("input");

        for (var i = 0; i < controls.length; i++)
        controls[i].disabled = false;
   }
 
//------------------------------------Start FrstHlder Details-----------------------------------------------
//---------------------------------Start Name Address Section------------------------------------//
function CbpNameAddress_EndCallBack() 
{
 if(cCbpNameAddress.cpBindFrstHlder != null)   
 {
    HideShow('DivGridRecord','H'); 
    HideShow('DivEntryForm','S'); 
    HideShow('Div_FirstAccountHlder','S');
    HideShow('Div_Contact_Pan','H'); 
    HideShow('Div_UserDef','H');  
    var Data = cCbpNameAddress.cpBindFrstHlder.split('~'); 
    SetinnerHTML("Row1_Col1",Data[0]);
    SetinnerHTML("Row1_Col2",Data[1]);
    SetinnerHTML("Row1_Col3",Data[2]);
    SetinnerHTML("Row3_Col1",Data[3]);
    SetinnerHTML("Row4_Col1_row0",Data[4]);
    SetinnerHTML("Row4_Col1_row1",Data[5]);
    SetinnerHTML("Row4_Col1_row2",Data[6]);
    SetinnerHTML("Row4_Col1_row3_col1",Data[7]);
    SetinnerHTML("Row4_Col1_row3_col3",Data[8]);
    SetinnerHTML("Row4_Col1_row5",Data[9]);
    SetinnerHTML("Row4_Col1_row7",Data[10]);
    if(Data[11]== 'Y')
    {
     cCbSame.SetChecked(true);
    }
    else if(Data[11]== 'N')
    {
     cCbSame.SetChecked(false);
    }
    cCbSame.SetEnabled(false); 
    SetinnerHTML("Row5_Col1_row0",Data[12]);
    SetinnerHTML("Row5_Col1_row1",Data[13]);
    SetinnerHTML("Row5_Col1_row2",Data[14]);
    SetinnerHTML("Row5_Col1_row3_col1",Data[15]);
    SetinnerHTML("Row5_Col1_row3_col3",Data[16]);
    SetinnerHTML("Row5_Col1_row5",Data[17]);
    SetinnerHTML("Row5_Col1_row7",Data[18]);
//    SetinnerHTML("Row7_Col1_row0_col1",Data[19]);
//    SetinnerHTML("Row7_Col1_row0_col3",Data[20]);
//    SetinnerHTML("Row7_Col1_row1_col1",Data[21]);
//    SetinnerHTML("Row7_Col1_row1_col3",Data[22]);
//    SetinnerHTML("Row7_Col1_row3",Data[23]);
//    if(Data[24]== 'Y')
//    { 
//      SetinnerHTML("Row8_Col1","Yes");
//      HideShow('Row8_Col2','S'); 
//    }
//    else if(Data[24]== 'N')
//    {
//      SetinnerHTML("Row8_Col1","No"); 
//      HideShow('Row8_Col2','H'); 
//    }
//    SetinnerHTML("Row9_Col1",Data[25]);
    
    HideShow('Row6_0','H'); 
    HideShow('Row010','H');
    HideShow('DivBtnEditNameAdrs','H'); 
    if(Data[1] == "")
    {           
       HideShow('Row1_Col2','H');
    }
    OnCheckedShowHide(cCbNameAdrs.GetChecked(),'DivBtnSaveNameAdrs');
    cCbpNameAddress.cpBindFrstHlder = null;
 }
 if(cCbpNameAddress.cpSaveNameAddress != null)   
 {
    DisableAll('<%=CbpNameAddress.ClientID%>');
    HideShow('Row6_0','S'); 
    HideShow('DivBtnEditNameAdrs','S'); 
    HideShow('DivBtnSaveNameAdrs','H');
    VisibleInVisible('DivNameAdrsAlrt','S');
    cCbNameAdrs.SetChecked(true);
    NameAdrs = 'T';
    cCbpNameAddress.cpSaveNameAddress = null;
 }
 if(cCbpNameAddress.cpNameAddressUnSaved != null)
 {
    NameAdrsEdit();  
    cCbpNameAddress.cpNameAddressUnSaved = null; 
 }
 if(cCbpNameAddress.cpBindByXML != null)
 {
    cCbpNameAddress.PerformCallback('BindFrstHolderUnSaved~'+AplicatnNo);
    cCbpNameAddress.cpBindByXML = null;
 }
 if(cCbpNameAddress.cpCallForFreshEdit != null)
 {
    cPopUp_ExistEntry.Show();
    HideShow('DivPopSaved','H'); 
    HideShow('DivPopUnSaved','S'); 
    HideShow('<%=DivPopRfsh.ClientID%>','S'); 
    cCbpNameAddress.cpCallForFreshEdit = null;
 }
 if(cCbpNameAddress.cpCallForAlreadySaved != null)
 {
    cPopUp_ExistEntry.Show();
    HideShow('DivPopSaved','S'); 
    HideShow('DivPopUnSaved','H'); 
    HideShow('<%=DivPopRfsh.ClientID%>','H'); 
    cCbpNameAddress.cpCallForAlreadySaved = null;
 }
 if(cCbpNameAddress.cpUnSavedSections != null)
 {
   var Data = cCbpNameAddress.cpUnSavedSections.split('~');
   NameAdrs = Data[0];
   ContactPan = Data[1];
   UserDefined = Data[2];
   SecndAcntHldr = Data[3];
   ThrdAcntHldr = Data[4];
   ProductDtls = Data[5];
   POADtls = Data[6];
   Nominee = Data[7];
   Gurdian = Data[8];
   NomineeGurdian = Data[9];
   cCbpNameAddress.cpUnSavedSections = null;
 }
 if(GetObjectID('divForOverView').style.display == 'inline') 
    NameAdrsColourChange(); 
 Height('350','350');
}

function OnInfoChecked()
{
  OnCheckedShowHide(cCbChecked.GetChecked(),'DivBtnSaveContactPan');
// if(cCbChecked.GetChecked()== true)
//   HideShow('Row010','S');
// else
//   HideShow('Row010','H'); 
 OnCheckedShowHide(cCbNameAdrs.GetChecked(),'DivBtnSaveNameAdrs');
// if(cCbNameAdrs.GetChecked()== true)
//   HideShow('Row6_0','S');
// else
//   HideShow('Row6_0','H');  
 
}

function NameAdrsSave()
{
    if(Requiredfield('<%=TxtProductType.ClientID%>',"Please Enter The Product Type") && Requiredfield('<%=TxtProductType_hidden.ClientID%>',"Please Enter The Product Type"))
    {   
        DisableAll('<%=CbpNameAddress.ClientID%>');
        cCbpNameAddress.PerformCallback('SaveNameAddress~');
        
    }  
}

function NameAdrsNext()
{
//    if(Requiredfield('<%=TxtProductType.ClientID%>',"Please Enter The Product Type"))
//    {
//        cCbpNameAddress.PerformCallback('SaveNameAddress~');  
    if(EntryType == 'AddEdit'|| EntryType == 'Edit')
    {
        cCbpContactPan.PerformCallback('BindContactPanUnsaved~');  
    }
    else
    {
        cCbpContactPan.PerformCallback('NameAdrsNext~');  
    }
    Height('350','350'); 
//    }
}
function NameAdrsEdit()
{
   NameAdrs = '';
   EnableAll('<%=CbpNameAddress.ClientID%>'); 
   HideShow('DivBtnEditNameAdrs','H'); 
   HideShow('DivBtnSaveNameAdrs','S');
   HideShow('Row6_0','H');
   VisibleInVisible('DivNameAdrsAlrt','H'); 
   cCbSame.SetEnabled(false);  
}
function PopUp_Rfrsh_Click()
{
  cCbpNameAddress.PerformCallback('BindFrstHolder~'+AplicatnNo+"~T");
  EntryType = "Add";      
} 
function PopUp_Continue_Click()
{
  cCbpNameAddress.PerformCallback('BindFrstHolderUnSaved~'+AplicatnNo); 
  EntryType = "AddEdit";
}
function PopUp_Cancel_Click()
{
  window.location="../BL/CDSL_CreateDPAccount.aspx";   
}

function NameAddress()
{
   HideShow('Div_FirstAccountHlder','S');  
   ConatactPrevious(); 
   cCbpNameAddress.PerformCallback('BindFrstHolderUnSaved~'+AplicatnNo); 
   HideShow('Div_SecondAccountHlder','H');  
   HideShow('Div_ThirdAccountHlder','H');  
   HideShow('Div_ProductDetails','H');  
   HideShow('Div_POADetails','H'); 
   HideShow('Div_NomineeNameAdrs','H');
   HideShow('Div_GurdianNameAdrs','H');
   HideShow('Div_NomGurdianNameAdrs','H'); 
   NameAdrsColourChange();
}

//-------------------------------End Name Address Section-------------------------------------//

//-------------------------------Start Contact Section----------------------------------------//
function ContactSave()
{
   if(DevE_Control_CompareText(cComboPanVerificatn1,"S","Please Select The Pan Verification Type"))
//      if(GetinnerHTML('Row8_Col1')== 'Yes')
//      {
//        alert('Please Select The Pan Exemption Type');
//        cComboPanExempt1.Focus();
//        return false;
//      }
//      else
//      { 
        cCbpContactPan.PerformCallback('SaveContactPan~');
//      }
}
function ContactEdit()
{
   EnableAll('<%=CbpContactPan.ClientID%>');
   HideShow('DivBtnEditContactPan','H');
   HideShow('DivBtnSaveContactPan','S');
   VisibleInVisible('DivPanContctAlrt','H');  
   cComboPanExempt1.SetEnabled(true); 
   cComboPanVerificatn1.SetEnabled(true);
   ContactPan = '';
} 
function ContactNext() 
{
    if(EntryType == "AddEdit" || EntryType == 'Edit')
    {
        cCbpUserDefined.PerformCallback('BindUserFldUnSaved~');    
    }
    HideShow('Div_Contact_Pan','H'); 
    HideShow('Div_NameAddress','H');  
    HideShow('Div_UserDef','S'); 
    HideShow('Div_FirstAccountHlder','S');  
    HideShow('Div_SecondAccountHlder','H');  
    HideShow('Div_ThirdAccountHlder','H');  
    HideShow('Div_ProductDetails','H');  
    HideShow('Div_POADetails','H');
    HideShow('Div_NomineeNameAdrs','H');
    HideShow('Div_GurdianNameAdrs','H');
    HideShow('Div_NomGurdianNameAdrs','H'); 
    HideShow('Div_Contact_Pan','H'); 
    HideShow('Div_NameAddress','H');  
   
    Height('350','350');

}
function ConatactPrevious()
{
   HideShow('Div_Contact_Pan','H'); 
   HideShow('Div_NameAddress','S'); 
   HideShow('Div_UserDef','H');
   if(GetObjectID('divForOverView').style.display == 'inline') 
     NameAdrsColourChange(); 
   Height('350','350');  
}
function CbpContactPan_EndCallBack()
{
 if(cCbpContactPan.cpBindFrstHlder != null)   
 {
    var Data = cCbpContactPan.cpBindFrstHlder.split('~'); 
    SetinnerHTML("Row7_Col1_row0_col1",Data[0]);
    SetinnerHTML("Row7_Col1_row0_col3",Data[1]);
    SetinnerHTML("Row7_Col1_row1_col1",Data[2]);
    SetinnerHTML("Row7_Col1_row1_col3",Data[3]);
    SetinnerHTML("Row7_Col1_row3",Data[4]);
    if(Data[5]== 'Y')
    { 
      SetinnerHTML("Row8_Col1","Yes");
      HideShow('Row8_Col2','S'); 
    }
    else if(Data[5]== 'N')
    {
      SetinnerHTML("Row8_Col1","No"); 
      HideShow('Row8_Col2','H'); 
    }
    SetinnerHTML("Row9_Col1",Data[6]); 
    HideShow('Div_Contact_Pan','S'); 
    HideShow('Div_NameAddress','H');
    HideShow('Div_UserDef','H');
    HideShow('Row010','H');
    HideShow('DivBtnEditContactPan','H');
    HideShow('DivBtnSaveContactPan','H');
    HideShow('Row6_0','S'); 
    OnCheckedShowHide(cCbChecked.GetChecked(),'DivBtnSaveContactPan');
    if(ContactPan == 'T')
    { 
      HideShow('DivBtnSaveContactPan','H');
      HideShow('DivBtnEditContactPan','S'); 
      HideShow('Row010','S');
      cComboPanExempt1.SetEnabled(false); 
      cComboPanVerificatn1.SetEnabled(false);  
      DisableAll('<%=CbpContactPan.ClientID%>'); 
    }
    else
    {
        VisibleInVisible('DivPanContctAlrt','H');  
    }
    cCbpContactPan.cpBindFrstHlder = null;
 } 
 if(cCbpContactPan.cpSaveContactPan != null)   
 {
//    HideShow('Div_Contact_Pan','H'); 
//    HideShow('Div_NameAddress','H');  
//    HideShow('Div_UserDef','S');
    HideShow('DivBtnEditContactPan','S');
    HideShow('DivBtnSaveContactPan','H');
    HideShow('Row010','S'); 
    if(GetinnerHTML("Row8_Col1")== "No")
        HideShow('Row8_Col2','H');
    DisableAll('<%=CbpContactPan.ClientID%>');
    VisibleInVisible('DivPanContctAlrt','S');
    cComboPanExempt1.SetEnabled(false); 
    cComboPanVerificatn1.SetEnabled(false); 
    cCbChecked.SetChecked(true); 
    ContactPan = 'T';
    cCbpContactPan.cpSaveContactPan = null;
 }
 if(cCbpContactPan.cpContactPanUnSaved != null)   
 {
    ContactEdit();
    cCbpContactPan.cpContactPanUnSaved = null;
 }
 if(GetObjectID('divForOverView').style.display == 'inline') 
    ContactPanColourChange();
 Height('350','350');  
}

function ContactPanDtls()
{
  if(NameAdrs == 'T')
  {
      ContactPanColourChange();
      HideShow('Div_FirstAccountHlder','S');  
      NameAdrsNext();
      HideShow('Div_SecondAccountHlder','H');  
      HideShow('Div_ThirdAccountHlder','H');  
      HideShow('Div_ProductDetails','H');  
      HideShow('Div_POADetails','H'); 
      HideShow('Div_NomineeNameAdrs','H');
      HideShow('Div_GurdianNameAdrs','H');
      HideShow('Div_NomGurdianNameAdrs','H'); 
  }
  else
  {
    alert("Please Fill Up The Name Address Details First..");
    NameAddress();
  }
}
//-------------------------------End Contact Section-----------------------------------------//

function CbpUserDefined_EndCallBack()
{
 if(cCbpUserDefined.cpSaveUserFld != null)   
 {
    HideShow('Div_FirstAccountHlder','S');  
    HideShow('Div_SecondAccountHlder','H');  
    HideShow('Div_ThirdAccountHlder','H');  
    HideShow('Div_ProductDetails','H');  
    HideShow('Div_POADetails','H');
    HideShow('Div_NomineeNameAdrs','H');
    HideShow('Div_GurdianNameAdrs','H');
    HideShow('Div_NomGurdianNameAdrs','H'); 
    HideShow('DivBtnEditUserDefined','S');
    HideShow('DivBtnSaveUserDefined','H');
    HideShow('Row11','S');  
    DisableAll('<%=CbpUserDefined.ClientID%>');
    VisibleInVisible('DivUsrDefindAlrt','S');
    UserDefined = 'T';
    HideShow('Div_Contact_Pan','H'); 
    HideShow('Div_NameAddress','H');  
    HideShow('Div_UserDef','S'); 
    cCbpUserDefined.cpSaveUserFld = null;
 }
 if(cCbpUserDefined.cpUserFldUnSaved != null)   
 {
    HideShow('DivBtnEditUserDefined','H');
    HideShow('DivBtnSaveUserDefined','H');
    HideShow('Div_FirstAccountHlder','S');  
    HideShow('Div_SecondAccountHlder','H');  
    HideShow('Div_ThirdAccountHlder','H');  
    HideShow('Div_ProductDetails','H');  
    HideShow('Div_POADetails','H');
    HideShow('Div_NomineeNameAdrs','H');
    HideShow('Div_GurdianNameAdrs','H');
    HideShow('Div_NomGurdianNameAdrs','H'); 
    HideShow('Div_Contact_Pan','H'); 
    HideShow('Div_NameAddress','H');  
    HideShow('Div_UserDef','S'); 
    cCbSkip0.SetChecked(true);
    VisibleInVisible('DivUsrDefindAlrt','H');
    cCbpUserDefined.cpUserFldUnSaved = null;
 }
 if(GetObjectID('divForOverView').style.display == 'inline') 
   UserDefinedColourChange(); 
 Height('350','350');  
}

function FirstHolderReset()
{
   SetValue('<%=TxtProductType.ClientID%>',"");
   cTxtTitl1.SetText(""); 
   cTxtSufx1.SetText(""); 
   cCbSame.SetChecked(false); 
   cCbNameAdrs.SetChecked(false); 
   cCbChecked.SetChecked(false); 
   cComboPanExempt1.SetSelectedIndex(0);  
   cComboPanVerificatn1.SetValue('S');
   cTxtDistrict1.SetText(""); 
   cTxtUsrTxt1.SetText("");  
   cTxtUsrTxt2.SetText("");   
   cTxtUsrTxt3.SetText(""); 
   NameAdrsEdit();
   ContactEdit();
   UserDefinedEdit();
}
function FirstHolderPrevious()
{
//   HideShow('Div_Contact_Pan','S'); 
//   HideShow('Div_NameAddress','H');  
//   HideShow('Div_UserDef','H'); 
   NameAdrsNext();
   Height('350','350');
}

function UserDefinedSave()
{
   cCbpUserDefined.PerformCallback('SaveUserField~');    
}
function UserDefinedEdit()
{
  UserDefined = '';
  HideShow('DivBtnEditUserDefined','H');
  HideShow('DivBtnSaveUserDefined','S');
  EnableAll('<%=CbpUserDefined.ClientID%>');  
  VisibleInVisible('DivUsrDefindAlrt','H');
}

function Skip0CheckedChanged()
{
  if(cCbSkip0.GetChecked() == true)
  {
    HideShow('DivBtnSaveUserDefined','H');
    HideShow('Row11','S');   
  }
  else
  {
    HideShow('DivBtnSaveUserDefined','S');
    HideShow('Row11','H');   
  } 
}
function FirstHolderNext()
{
    HideShow('Div_FirstAccountHlder','H');  
    HideShow('Div_SecondAccountHlder','S');  
    HideShow('Div_ThirdAccountHlder','H');  
    HideShow('Div_ProductDetails','H');  
    HideShow('Div_POADetails','H');
    if(EntryType == "AddEdit" || EntryType == 'Edit')
    {
      cCbpSecondAccountHlder.PerformCallback('BindScndAcntHlderUnSaved~');     
    }
    Height('350','350'); 

}
function UserDefinedDtls()
{
  if(NameAdrs == '')
  {
    alert("Please Fill Up The Name & Address Details First..");
    NameAddress();
  }
  else if(ContactPan == '')
  {
    alert("Please Fill Up The Contact & Pan Details First..");
    ContactPanColourChange();
    NameAdrsNext();
  }
  else
  {
    UserDefinedColourChange();
    ContactNext(); 
  }
}
 
//------------------------------------End FrstHlder Details-----------------------------------------------


//------------------------------------Start ScndHlder Details----------------------------------------------

function OnCheckedChanged()
{
    
}
function SkipSecondHolder()
{
  if(cCbSkip1.GetChecked() == true)
  {
    cCbSkip1.SetChecked(false);
  }  
}
function CbpSecondAccountHlder_EndCallBack()
{
 if(cCbpSecondAccountHlder.cpSaveScndAcntHlder != null)   
 {
    OnCheckedShowHide(crdPanxmptY1.GetChecked(),'Row18_Col2');
    HideShow('DivBtnEditScndAcntHlder','S');
    HideShow('DivBtnSaveScndAcntHlder','H');
    HideShow('Row21','S'); 
    DisableAll('<%=CbpSecondAccountHlder.ClientID%>');
    VisibleInVisible('DivScndHlderAlrt','S');
    cComboPanExempt2.SetEnabled(false);
    cComboPanVerificatn2.SetEnabled(false);
    SecndAcntHldr = 'T';
    cCbpSecondAccountHlder.cpSaveScndAcntHlder = null;
 }
 if(cCbpSecondAccountHlder.cpScndAcntHlderUnSaved != null)
 {
    HideShow('DivBtnEditScndAcntHlder','H');
    VisibleInVisible('DivScndHlderAlrt','H');
    if(cCbSkip1.GetChecked() == true)
    {
        HideShow('DivBtnSaveScndAcntHlder','H');
    }
    else
    {
        HideShow('DivBtnSaveScndAcntHlder','S');
    }
    cCbpSecondAccountHlder.cpScndAcntHlderUnSaved = null;
 }
 OnCheckedShowHide(crdPanxmptY1.GetChecked(),'Row18_Col2');
 if(GetObjectID('divForOverView').style.display == 'inline') 
    SecondAccHldrColourChange(); 
 Height('350','350');  
}

function SecondHolderReset() 
{
  cTxtTitl2.SetText(""); 
  cCbSkip1.SetChecked(false); 
  cTxtFName1.SetText("");  
  cTxtMName1.SetText("");  
  cTxtLName1.SetText("");  
  cTxtSufx2.SetText("");  
  cTxtFthrName1.SetText("");  
  crdPanxmptY1.SetChecked(false); 
  crdPanxmptN1.SetChecked(true); 
  cComboPanExempt2.SetSelectedIndex(0); 
  cTxtPan1.SetText("");  
  cComboPanVerificatn2.SetValue('S');
  cTxtDistrict2.SetText("");  
  SecondHolderEdit(); 
}
function Skip1CheckedChanged()
{
  if(cCbSkip1.GetChecked() == true)
  {
    HideShow('DivBtnSaveScndAcntHlder','H');
    HideShow('Row21','S');   
  }
  else
  {
    HideShow('DivBtnSaveScndAcntHlder','S');
    HideShow('Row21','H');   
  }
}
function SecondHolderSave()
{
    if(cCbSkip1.GetChecked() == false)
    {
         if(DevE_Control_Empty(cTxtFName1,"Please Enter The First Name of The Second Holder")) 
          if(DevE_Control_Empty(cTxtLName1,"Please Enter The Last Name of The Second Holder")) 
           if(DevE_Control_CompareText(cComboPanVerificatn2,"S","Please Select The Pan Verification Type"))
            if(verifyPanCrdNo(cTxtPan1))
             if(cTxtPan1.GetText()=="" && crdPanxmptN1.GetChecked()== true)
             {
                alert('Please Enter Your Pan Card Number');
                cTxtPan1.Focus();
             }
             else
             {
                  
                  DisableAll('<%=CbpSecondAccountHlder.ClientID%>'); 
                  cCbpSecondAccountHlder.PerformCallback('SaveScndAcntHlder~');
//                  HideShow('Div_FirstAccountHlder','H');  
//                  HideShow('Div_SecondAccountHlder','H');  
//                  HideShow('Div_ThirdAccountHlder','S');  
//                  HideShow('Div_ProductDetails','H');  
//                  HideShow('Div_POADetails','H');  
             }                                                                                             
             
     }  
     
}
function SecondHolderEdit() 
{
   SecndAcntHldr = '';
   EnableAll('<%=CbpSecondAccountHlder.ClientID%>');  
   HideShow('DivBtnEditScndAcntHlder','H');
   HideShow('DivBtnSaveScndAcntHlder','S');
   HideShow('Row21','H'); 
   VisibleInVisible('DivScndHlderAlrt','H');
   cComboPanExempt2.SetEnabled(true);
   cComboPanVerificatn2.SetEnabled(true);
}
function SecondHolderNext() 
{
//   if(cCbSkip1.GetChecked() == false)
//    {
//         if(DevE_Control_Empty(cTxtFName1,"Please Enter The First Name of The Second Holder")) 
//          if(DevE_Control_Empty(cTxtLName1,"Please Enter The Last Name of The Second Holder")) 
//          if(DevE_Control_CompareText(cComboPanVerificatn2,"S","Please Select The Pan Verification Type"))
//           if(cTxtPan1.GetText()=="" && crdPanxmptN1.GetChecked()== true)
//             {
//                alert('Please Enter Your Pan Card Number');
//                cTxtPan1.Focus();
//             }
//             else
//             {
//                  cCbpSecondAccountHlder.PerformCallback('SaveScndAcntHlder~');
//                  HideShow('Div_FirstAccountHlder','H');  
//                  HideShow('Div_SecondAccountHlder','H');  
//                  HideShow('Div_ThirdAccountHlder','S');  
//                  HideShow('Div_ProductDetails','H');  
//                  HideShow('Div_POADetails','H');  
//             }
//             Height('350','350'); 
//     }
//     else
//     {
       if(cCbSkip1.GetChecked() == true)
       {
            ThirdHolderNext();
       }
       else
       {
            if(EntryType == "AddEdit" || EntryType == 'Edit')
            {
              cCbpThirdAccountHlder.PerformCallback('BindThirdAcntHlderUnSaved~');     
            }
            
            HideShow('Div_FirstAccountHlder','H');  
            HideShow('Div_SecondAccountHlder','H');  
            HideShow('Div_ThirdAccountHlder','S');  
            HideShow('Div_ProductDetails','H');  
            HideShow('Div_POADetails','H'); 
       }
//     }
       Height('350','350');  
}

function SecondHolderPrevious()  
{
//  HideShow('Div_FirstAccountHlder','S'); 
//  HideShow('Div_Contact_Pan','H'); 
//  HideShow('Div_NameAddress','H');  
//  HideShow('Div_UserDef','S'); 
//  HideShow('Div_SecondAccountHlder','H');  
//  HideShow('Div_ThirdAccountHlder','H');  
//  HideShow('Div_ProductDetails','H');  
//  HideShow('Div_POADetails','H');
//  HideShow('Div_NomineeNameAdrs','H');
//  HideShow('Div_GurdianNameAdrs','H');
//  HideShow('Div_NomGurdianNameAdrs','H');  
  ContactNext();
  Height('350','350'); 
}

function SecndAcntHolder()
{
  if(NameAdrs == '')
  {
    alert("Please Fill Up The Name & Address Details First..");
    NameAddress();
  }
  else if(ContactPan == '')
  {
    alert("Please Fill Up The Contact & Pan Details First..");
    ContactPanColourChange();
    NameAdrsNext();
  }
  else if(UserDefined == '' && cCbSkip0.GetChecked() == false)
  {
    alert("Please Fill Up The User Defined Field First..");
    UserDefinedColourChange();
    ContactNext(); 
  }
  else
  {
    SecondAccHldrColourChange();  
    FirstHolderNext();
  }
}
//------------------------------------End ScndHlder Details------------------------------------------------

    
//-----------------------------------Start ThrdHlder Details-------------------------------------------------

function SkipThirdHolder()
{
  if(cCbSkip2.GetChecked() == true)
  {
    cCbSkip2.SetChecked(false);
  }   
}

function CbpThirdAccountHlder_EndCallBack()
{
  if(cCbpThirdAccountHlder.cpSaveThirdAcntHlder != null)   
  {
    OnCheckedShowHide(crdPanxmptY2.GetChecked(),'Row27_Col2');
    HideShow('DivBtnSaveThrdAcntHlder','H');
    HideShow('DivBtnEditThrdAcntHlder','S');
    HideShow('Row30','S');
    cComboPanExempt3.SetEnabled(false);
    cComboPanVerificatn3.SetEnabled(false);
    DisableAll('<%=CbpThirdAccountHlder.ClientID%>');
    VisibleInVisible('DivThrdHldrAlrt','S');
    ThrdAcntHldr = 'T';
    cCbpThirdAccountHlder.cpSaveThirdAcntHlder = null;
  }
  if(cCbpThirdAccountHlder.cpThirdAcntHlderUnSaved != null)   
  {
    HideShow('DivBtnEditThrdAcntHlder','H');
    if(cCbSkip2.GetChecked() == true)
        HideShow('DivBtnSaveThrdAcntHlder','H');
    else
        HideShow('DivBtnSaveThrdAcntHlder','S');
    VisibleInVisible('DivThrdHldrAlrt','H');
    cCbpThirdAccountHlder.cpThirdAcntHlderUnSaved = null;
  }
  OnCheckedShowHide(crdPanxmptY2.GetChecked(),'Row27_Col2');
  if(GetObjectID('divForOverView').style.display == 'inline') 
     ThrdAccHldrColourChange(); 
  Height('350','350');   
}
 
function ThirdHolderReset()
{
  cTxtTitl3.SetText(""); 
  cCbSkip2.SetChecked(false); 
  cTxtFName2.SetText("");  
  cTxtMName2.SetText("");  
  cTxtLName2.SetText("");  
  cTxtSufx3.SetText("");  
  cTxtFthrName2.SetText("");  
  crdPanxmptY2.SetChecked(false); 
  crdPanxmptN2.SetChecked(true); 
  cComboPanExempt3.SetSelectedIndex(0); 
  cTxtPan2.SetText("");  
  cComboPanVerificatn3.SetValue('S');
  cTxtDistrict3.SetText("");    
  ThirdHolderEdit();
}

function Skip2CheckedChanged()
{
  if(cCbSkip2.GetChecked() == true)
  {
    HideShow('DivBtnSaveThrdAcntHlder','H');
    HideShow('Row30','S');   
  }
  else
  {
    HideShow('DivBtnSaveThrdAcntHlder','S');
    HideShow('Row30','H');   
  }
}

function ThirdHolderSave()
{
  if(cCbSkip2.GetChecked() == false)
  {
    if(DevE_Control_Empty(cTxtFName2,"Please Enter The First Name of The Third Holder")) 
      if(DevE_Control_Empty(cTxtLName2,"Please Enter The Last Name of The Third Holder")) 
       if(DevE_Control_CompareText(cComboPanVerificatn3,"S","Please Select The Pan Verification Type"))
        if(verifyPanCrdNo(cTxtPan2))
         if(cTxtPan2.GetText()=="" && crdPanxmptN2.GetChecked()== true)
         {
            alert('Please Enter Your Pan Card Number');
            cTxtPan2.Focus();
         }
         else
         {
              cCbpThirdAccountHlder.PerformCallback('SaveThirdAcntHlder~');
         }
    }   
}
function ThirdHolderEdit()
{
  ThrdAcntHldr = '';
  HideShow('DivBtnSaveThrdAcntHlder','S');
  HideShow('DivBtnEditThrdAcntHlder','H');
  HideShow('Row30','H');
  cComboPanExempt3.SetEnabled(true);
  cComboPanVerificatn3.SetEnabled(true);  
  EnableAll('<%=CbpThirdAccountHlder.ClientID%>');  
  VisibleInVisible('DivThrdHldrAlrt','H');
}
function ThirdHolderNext()
{
//  if(cCbSkip2.GetChecked() == false)
//  {
//   if(DevE_Control_Empty(cTxtFName2,"Please Enter The First Name of The Third Holder")) 
//      if(DevE_Control_Empty(cTxtLName2,"Please Enter The Last Name of The Third Holder")) 
//       if(DevE_Control_CompareText(cComboPanVerificatn3,"S","Please Select The Pan Verification Type"))
//         if(cTxtPan2.GetText()=="" && crdPanxmptN2.GetChecked()== true)
//         {
//            alert('Please Enter Your Pan Card Number');
//            cTxtPan2.Focus();
//         }
//         else
//         {
//              cCbpThirdAccountHlder.PerformCallback('SaveThirdAcntHlder~');
//              HideShow('Div_FirstAccountHlder','H');  
//              HideShow('Div_SecondAccountHlder','H');  
//              HideShow('Div_ThirdAccountHlder','H');  
//              HideShow('Div_ProductDetails','S');  
//              HideShow('Div_POADetails','H');  
//              Height('350','350');  
//              if(PrdctBind != "T")
//              {
//                cCbpProductDtls.PerformCallback('BindProductDtls~'+AplicatnNo); 
//                PrdctBind = "T";
//              }
//         }
//      Height('350','350');   
//  }
//  else
//  {
      
      HideShow('Div_FirstAccountHlder','H');  
      HideShow('Div_SecondAccountHlder','H');  
      HideShow('Div_ThirdAccountHlder','H');  
      HideShow('Div_ProductDetails','S');  
      HideShow('Div_POADetails','H');  
      if(EntryType == "AddEdit" || EntryType == 'Edit')
      {
        cCbpProductDtls.PerformCallback('BindProductDtlsUnSaved~'); 
      }
      else
      {
          if(PrdctBind != "T")
          {
            cCbpProductDtls.PerformCallback('BindProductDtls~'+AplicatnNo); 
            PrdctBind = "T";
          }
      }
      Height('350','350');  
//   }
} 

function ThirdHolderPrevious()
{
//  HideShow('Div_FirstAccountHlder','H');  
//  HideShow('Div_SecondAccountHlder','S');  
//  HideShow('Div_ThirdAccountHlder','H');  
//  HideShow('Div_ProductDetails','H');  
//  HideShow('Div_POADetails','H');
//  HideShow('Div_NomineeNameAdrs','H');
//  HideShow('Div_GurdianNameAdrs','H');
//  HideShow('Div_NomGurdianNameAdrs','H'); 
  FirstHolderNext();
  Height('350','350');  
}

function ThrdAcntHolder()
{
  if(NameAdrs == '')
  {
    alert("Please Fill Up The Name & Address Details First..");
    NameAddress();
  }
  else if(ContactPan == '')
  {
    alert("Please Fill Up The Contact & Pan Details First..");
    ContactPanColourChange();
    NameAdrsNext();
  }
  else if(UserDefined == '' && cCbSkip0.GetChecked() == false)
  {
    alert("Please Fill Up The User Defined Field First..");
    UserDefinedColourChange();
    ContactNext(); 
  }
  else if(SecndAcntHldr == '' && cCbSkip1.GetChecked() == false)
  {
    alert("Please Fill Up The Second Account Holder First..");
    SecondAccHldrColourChange();  
    FirstHolderNext();
  }
  else
  {
     SecondHolderNext();  
     ThrdAccHldrColourChange();
  }
  Height('350','350');   
}
//------------------------------------End ThrdHlder Details--------------------------------------------------

//-----------------------------------Start Product Details-------------------------------------------------

function CbpProductDtls_EndCallBack()
{
 if(cCbpProductDtls.cpBindProductDtls != null)   
 {
    var Data = cCbpProductDtls.cpBindProductDtls.split('~');     
    SetinnerHTML("Row33_Col3",Data[0]);
    SetinnerHTML("Row34_Col1",Data[1]);
    SetinnerHTML("Row34_Col3",Data[2]);
    SetinnerHTML("Row36_Col3",Data[3]);
    SetinnerHTML("Row37_Col1",Data[4]);
    SetinnerHTML("Row37_Col3",Data[5]);
    if(ProductDtls == 'T')
    {   
        HideShow('DivBtnEditProductDtls','S');
        HideShow('Row580','S');
        HideShow('DivBtnSaveProductDtls','H'); 
        cComboRGESS.SetEnabled(false);
        cComboAnualReprt.SetEnabled(false);
        cComboPledge.SetEnabled(false);
        cComboRTA.SetEnabled(false);
        cComboBSDA.SetEnabled(false);
        cComboBOsett.SetEnabled(false);
        cComboSmartCrd.SetEnabled(false);
        cComboEcsMandate.SetEnabled(false);
        cComboConfrmatnWavd.SetEnabled(false);
    }
    else
    {  
       HideShow('DivBtnEditProductDtls','H');
       HideShow('Row580','H');
       HideShow('DivBtnSaveProductDtls','S');
    }
    cCbpProductDtls.cpBindProductDtls = null;
 }
 if(cCbpProductDtls.cpSaveProductDtls != null)   
 {
    DisableAll('<%=CbpProductDtls.ClientID%>'); 
    HideShow('DivBtnEditProductDtls','S');
    HideShow('Row580','S'); 
    HideShow('DivBtnSaveProductDtls','H');
    cComboRGESS.SetEnabled(false);
    cComboAnualReprt.SetEnabled(false);
    cComboPledge.SetEnabled(false);
    cComboRTA.SetEnabled(false);
    cComboBSDA.SetEnabled(false);
    cComboBOsett.SetEnabled(false);
    cComboSmartCrd.SetEnabled(false);
    cComboEcsMandate.SetEnabled(false);
    cComboConfrmatnWavd.SetEnabled(false);
    VisibleInVisible('DivPrdctDtlAlrt','S');
    ProductDtls = 'T';
    cCbpProductDtls.cpSaveProductDtls = null;
 }
 if(cCbpProductDtls.cpProductDtlsUnSaved != null)   
 {
    VisibleInVisible('DivPrdctDtlAlrt','H');
    HideShow('DivBtnEditProductDtls','H');
    HideShow('Row580','H'); 
    HideShow('DivBtnSaveProductDtls','S'); 
 }
 if(GetObjectID('divForOverView').style.display == 'inline') 
    ProductDtlsColourChange(); 
 Height('350','350');  
}

function ProductDtlsReset() 
{
   //cTxtIntrnlRef.SetText(""); 
   cMaturityDt.SetDate(currentDateToset);  
   cTxtLifeStyle.SetText(""); 
   SetValue('<%=TxtGeoCode.ClientID%>',""); 
   SetValue('<%=TxtEduDegree.ClientID%>',""); 
   cTxtBoFee.SetText(""); 
   SetValue('<%=TxtLang.ClientID%>',""); 
   cTxtCatg4.SetText(""); 
   cTxtBnkOptn5.SetText(""); 
   SetValue('<%=TxtStaffRel.ClientID%>',""); 
   cTxtStafCode.SetText(""); 
   cComboRGESS.SetValue('N'); 
   cComboAnualReprt.SetValue('1');  
   cComboPledge.SetValue('Y'); 
   cComboRTA.SetValue('Y'); 
   cComboBSDA.SetValue('N'); 
   SetValue('<%=TxtSecAccess.ClientID%>',""); 
   SetValue('<%=TxtBoCatg.ClientID%>',""); 
   cComboBOsett.SetValue('Y'); 
   cTxtIFSC.SetText(""); 
   cTxtRBIRef.SetText(""); 
   cRBIaprvDt.SetDate(currentDateToset);  
   cTxtSebiReg.SetText(""); 
   SetValue('<%=TxtBenTaxStatus.ClientID%>',""); 
   cComboSmartCrd.SetValue('Y'); 
   cTxtSmartCrd.SetText("0000000000"); 
   cTxtSmrtCrdPin.SetText(""); 
   cComboEcsMandate.SetValue('Y'); 
   cTxtElectronicConfrmatn.SetText("");
   SetValue('<%=TxtDividndCurncy.ClientID%>',""); 
   cTxtGrpCode.SetText("");
   SetValue('<%=TxtClrngCorpID.ClientID%>',""); 
   cTxtClrngMmbrID.SetText(""); 
   cTxtStckExchng.SetText(""); 
   cComboConfrmatnWavd.SetValue('Y'); 
   cTxtTtradngID.SetText(""); 
   SetValue('<%=TxtBOStatemntCycle.ClientID%>',"");
   cTxtBENFBnkCode.SetText(""); 
   SetValue('<%=TxtBENFBnkAcType.ClientID%>',""); 
   cTxtBENFBnkAcNo.SetText("");
   SetValue('<%=TxtBENFBnkCCY.ClientID%>',""); 
   SetValue('<%=TxtDIVNDBnkAcType.ClientID%>',""); 
   cTxtDIVNDBnkCode.SetText(""); 
   cTxtDIVNDBnkAcNo.SetText(""); 
   SetValue('<%=TxtDIVNDBnkCCY.ClientID%>',""); 
   ProductDtlsEdit(); 
}
function ProductDtlsEdit()
{
  ProductDtls = '';
  HideShow('DivBtnEditProductDtls','H');
  HideShow('Row580','H'); 
  HideShow('DivBtnSaveProductDtls','S');
  EnableAll('<%=CbpProductDtls.ClientID%>');
  VisibleInVisible('DivPrdctDtlAlrt','H');
  cComboRGESS.SetEnabled(true);
  cComboAnualReprt.SetEnabled(true);
  cComboPledge.SetEnabled(true);
  cComboRTA.SetEnabled(true);
  cComboBSDA.SetEnabled(true);
  cComboBOsett.SetEnabled(true);
  cComboSmartCrd.SetEnabled(true);
  cComboEcsMandate.SetEnabled(true);
  cComboConfrmatnWavd.SetEnabled(true);    
}
function ProductDtlsSave()
{
   if(Requiredfield('<%=TxtBoCatg.ClientID %>','Please Enter The BO Category') && Requiredfield('<%=TxtBoCatg_hidden.ClientID %>','Please Enter The BO Category'))
    if(Requiredfield('<%=TxtBoSubstatus.ClientID %>','Please Enter The BO SubSatus') && Requiredfield('<%=TxtBoSubstatus_hidden.ClientID %>','Please Enter The BO SubSatus'))
      if(Requiredfield('<%=TxtBOStatemntCycle.ClientID %>','Please Enter The BO Statement Cycle') && Requiredfield('<%=TxtBOStatemntCycle_hidden.ClientID %>','Please Enter The BO Statement Cycle')) 
       if(cComboSmartCrd.GetValue()=='Y' && cTxtSmartCrd.GetText()=="" && cTxtSmrtCrdPin.GetText()=="0")
       {
        alert("Please Fill up the SmartCard Number and SmartCard Pin");
        cTxtSmartCrd.Focus();
       }
       else
       {
         Empty_HiddenFields();
         cCbpProductDtls.PerformCallback('SaveProductDtls~');
       } 
}
function  ProductDtlsNext() 
{
//  if(Control_Empty('<%=TxtBoCatg.ClientID %>','Please Enter The BO Category'))
//   if(Control_Empty('<%=TxtBoSubstatus.ClientID %>','Please Enter The BO SubSatus'))
//       if(Control_Empty('<%=TxtBOStatemntCycle.ClientID %>','Please Enter The BO Statement Cycle')) 
//       {
          HideShow('Div_FirstAccountHlder','H');  
          HideShow('Div_SecondAccountHlder','H');  
          HideShow('Div_ThirdAccountHlder','H');  
          HideShow('Div_ProductDetails','H');  
          HideShow('Div_POADetails','S'); 
          HideShow('Div_NameAddress','H');
          HideShow('Div_Contact_Pan','H'); 
          HideShow('Div_UserDef','H'); 
          HideShow('Div_NomineeNameAdrs','H');
          HideShow('Div_GurdianNameAdrs','H');
          HideShow('Div_NomGurdianNameAdrs','H'); 
          if(EntryType == "AddEdit" || EntryType == 'Edit')
          {
            cCbpPOADtls.PerformCallback('BindPoaDtlsUnSaved~'); 
          }
          Height('350','350'); 
//       }
  
}

function ProductDtlsPrevious() 
{
  if(cCbSkip1.GetChecked() == true)
  {
    ThirdHolderPrevious();
  }
  else
  {
////      HideShow('Div_FirstAccountHlder','H');  
////      HideShow('Div_SecondAccountHlder','H');  
////      HideShow('Div_ThirdAccountHlder','S');  
////      HideShow('Div_ProductDetails','H');  
////      HideShow('Div_POADetails','H'); 
////      HideShow('DivBtnSave','H');
      SecondHolderNext();
      Height('350','350'); 
  }
}

function Empty_HiddenFields()
{
    if(GetObjectID('<%=TxtGeoCode.ClientID %>').value == "") 
      GetObjectID('<%=TxtGeoCode.ClientID %>').value = "";
    if(GetObjectID('<%=TxtEduDegree.ClientID %>').value == "")
      GetObjectID('<%=TxtEduDegree_hidden.ClientID %>').value = "";
    if(GetObjectID('<%=TxtLang.ClientID %>').value == "")
      GetObjectID('<%=TxtLang_hidden.ClientID %>').value = "";
    if(GetObjectID('<%=TxtStaffRel.ClientID %>').value == "")
      GetObjectID('<%=TxtStaffRel_hidden.ClientID %>').value = "";
    if(GetObjectID('<%=TxtSecAccess.ClientID %>').value == "") 
      GetObjectID('<%=TxtSecAccess_hidden.ClientID %>').value = "";
    if(GetObjectID('<%=TxtBenTaxStatus.ClientID %>').value == "")
      GetObjectID('<%=TxtBenTaxStatus_hidden.ClientID %>').value = "";
    if(GetObjectID('<%=TxtDividndCurncy.ClientID %>').value == "") 
      GetObjectID('<%=TxtDividndCurncy_hidden.ClientID %>').value = "";
    if(GetObjectID('<%=TxtClrngCorpID.ClientID %>').value == "") 
      GetObjectID('<%=TxtClrngCorpID_hidden.ClientID %>').value = "";
    if(GetObjectID('<%=TxtBENFBnkAcType.ClientID %>').value == "") 
      GetObjectID('<%=TxtBENFBnkAcType_hidden.ClientID %>').value = "";
    if(GetObjectID('<%=TxtBENFBnkCCY.ClientID %>').value == "") 
      GetObjectID('<%=TxtBENFBnkCCY_hidden.ClientID %>').value = "";
    if(GetObjectID('<%=TxtDIVNDBnkAcType.ClientID %>').value == "") 
      GetObjectID('<%=TxtDIVNDBnkAcType_hidden.ClientID %>').value = "";
    if(GetObjectID('<%=TxtDIVNDBnkCCY.ClientID %>').value == "")
      GetObjectID('<%=TxtDIVNDBnkCCY_hidden.ClientID %>').value = "";
}

function PrdctDtls()
{ 
  if(NameAdrs == '')
  {
    alert("Please Fill Up The Name & Address Details First..");
    NameAddress();
  }
  else if(ContactPan == '')
  {
    alert("Please Fill Up The Contact & Pan Details First..");
    ContactPanColourChange();
    NameAdrsNext();
  }
  else if(UserDefined == '' && cCbSkip0.GetChecked() == false)
  {
    alert("Please Fill Up The User Defined Field First..");
    UserDefinedColourChange();
    ContactNext(); 
  }
  else if(SecndAcntHldr == '' && cCbSkip1.GetChecked() == false)
  {
    alert("Please Fill Up The Second Account Holder First..");
    SecondAccHldrColourChange();  
    FirstHolderNext();
  }
  else if(ThrdAcntHldr == '' && cCbSkip2.GetChecked() == false)
  {
    alert("Please Fill Up The Third Account Holder First..");
    ThrdAccHldrColourChange();
    SecondHolderNext();  
  }
  else
  {
    ProductDtlsColourChange();
    ThirdHolderNext();
  }
}

//------------------------------------End Product Details--------------------------------------------------

//-----------------------------------Start POA Details-------------------------------------------------
function CbpPOADtls_EndCallBack() 
{
  if(cCbpPOADtls.cpSaveAll != null)  
  {
    alert('Data Successfully Saved!!');
    window.location="../BL/CDSL_CreateDPAccount.aspx"; 
    cCbpPOADtls.cpSaveAll = null;
  }
  if(cCbpPOADtls.cpSavePOADtls != null)  
  {
    HideShow('DivBtnEditPOADtls','S');  
    HideShow('DivBtnSavePOADtls','H');  
    DisableAll('<%=CbpPOADtls.ClientID%>'); 
    VisibleInVisible('DivPOAAlrt','S');
    POADtls = 'T';
    cCbpPOADtls.cpSavePOADtls = null;
  }
  if(cCbpPOADtls.cpPOADtlsUnSaved != null)  
  {
    HideShow('DivBtnEditPOADtls','H');
    VisibleInVisible('DivPOAAlrt',''); 
    if(cCbSkip3.GetChecked() == true)
    { 
        HideShow('DivBtnSavePOADtls','H');
    }
    else
    {
        HideShow('DivBtnSavePOADtls','S');
    }  
    cCbpPOADtls.cpPOADtlsUnSaved = null;
  }
  if(cCbpPOADtls.cpReset != null)  
  {
    FirstHolderReset();
    SecondHolderReset();
    ThirdHolderReset();
    ProductDtlsReset();
    POADtlsReset();
    NomineeReset();
    GurdianReset();
    NomGurdianReset();
    HideShow('Div_FirstAccountHlder','S');  
    HideShow('Div_SecondAccountHlder','H');  
    HideShow('Div_ThirdAccountHlder','H');  
    HideShow('Div_ProductDetails','H');  
    HideShow('Div_POADetails','H'); 
    HideShow('Div_NameAddress','S');
    HideShow('Div_Contact_Pan','H'); 
    HideShow('Div_UserDef','H'); 
    HideShow('Div_NomineeNameAdrs','H');
    HideShow('Div_GurdianNameAdrs','H');
    HideShow('Div_NomGurdianNameAdrs','H'); 
    //PageLoad();
    
    cCbpNameAddress.PerformCallback('BindFrstHolder~'+AplicatnNo+'~ '); 
  }
  if(GetObjectID('divForOverView').style.display == 'inline') 
    POADtlsColourChange(); 
  Height('350','350');  
}
function POADtlsReset()
{
  SetValue('<%=TxtPoaId.ClientID%>',"");
  cTxtPoaRegNo.SetText(""); 
  cCbSkip3.SetChecked(false);
  cComboPurposeCode.SetValue('0'); 
  cComboGpaBpa.SetValue("G"); 
  cFormDt.SetDate(currentDateToset); 
  cToDt.SetDate(currentDateToset); 
  cTxtUsrFld1.SetText(""); 
  cTxtUsrFld2.SetText(""); 
  cTxtRemarks.SetText("");
  POAEdit();
}
function POAPrevious()
{
////  HideShow('Div_FirstAccountHlder','H');  
////  HideShow('Div_SecondAccountHlder','H');  
////  HideShow('Div_ThirdAccountHlder','H');  
////  HideShow('Div_ProductDetails','S');  
////  HideShow('Div_POADetails','H');
////  HideShow('Div_NomineeNameAdrs','H');
////  HideShow('Div_GurdianNameAdrs','H');
////  HideShow('Div_NomGurdianNameAdrs','H');
  ThirdHolderNext();
  Height('350','350');     
}
function POAEdit()
{
  POADtls = '';
  HideShow('DivBtnEditPOADtls','H');  
  HideShow('DivBtnSavePOADtls','S'); 
  EnableAll('<%=CbpPOADtls.ClientID%>'); 
  VisibleInVisible('DivPOAAlrt','H');
}

function POASave()
{ 
  if(cCbSkip3.GetChecked() == false)
  {
   if(Requiredfield('<%=TxtPoaId.ClientID%>','Please Enter The POA Id') && Requiredfield('<%=TxtPoaId_hidden.ClientID%>','Please Enter The POA Id'))
     if(DevE_Control_Empty(cTxtPoaRegNo,"Please Enter The POA Registration Number")) 
        if(cComboGpaBpa.GetValue()=='B'&& cTxtRemarks.GetText()=="" )
         {
            alert('Please Enter the Remarks');
            return false;
         }
         else
         {
            var TodayDate = new Date();
            TodayDate.setDate(TodayDate.getDate());
            var FDate=cFormDt.GetValue();
            if(CompareDate_TrueFalse(TodayDate,FDate,"LE"))
            {
                alert("Please Enter a Valid From Date!!!");
                cFormDt.Focus();
                return false;
            }
            else
            {  
                cCbpPOADtls.PerformCallback('SavePOADtls~');  
            }
         }
    }
    else
    {
        alert("Please Uncheck To Enter Data In POA Details");
    }
}

function POANext()
{
  HideShow('Div_FirstAccountHlder','H');  
  HideShow('Div_SecondAccountHlder','H');  
  HideShow('Div_ThirdAccountHlder','H');  
  HideShow('Div_ProductDetails','H');  
  HideShow('Div_POADetails','H');
  HideShow('Div_NomineeNameAdrs','S');
  HideShow('Div_GurdianNameAdrs','H');
  HideShow('Div_NomGurdianNameAdrs','H');
  if(EntryType == "AddEdit" || EntryType == 'Edit')
  {
    cCbpNomineeNameAdrs.PerformCallback('NomineeNameAdrsUnSaved~'); 
  }
  Height('350','350');
}

function OnSkipPOA() 
{
    if(cCbSkip3.GetChecked() == true)
    {
      HideShow('DivBtnSavePOADtls','H'); 
      HideShow('DivBtnNextPOADtls','S'); 
    }
    else
    {
      HideShow('DivBtnSavePOADtls','S'); 
      HideShow('DivBtnNextPOADtls','H'); 
    }
}

function POADetails()
{
  if(NameAdrs == '')
  {
    alert("Please Fill Up The Name & Address Details First..");
    NameAddress();
  }
  else if(ContactPan == '')
  {
    alert("Please Fill Up The Contact & Pan Details First..");
    ContactPanColourChange();
    NameAdrsNext();
  }
  else if(UserDefined == '' && cCbSkip0.GetChecked() == false)
  {
    alert("Please Fill Up The User Defined Field First..");
    UserDefinedColourChange();
    ContactNext(); 
  }
  else if(SecndAcntHldr == '' && cCbSkip1.GetChecked() == false)
  {
    alert("Please Fill Up The Second Account Holder First..");
    SecondAccHldrColourChange();  
    FirstHolderNext();
  }
  else if(ThrdAcntHldr == '' && cCbSkip2.GetChecked() == false)
  {
    alert("Please Fill Up The Third Account Holder First..");
    ThrdAccHldrColourChange();
    SecondHolderNext();  
  }
  else if(ProductDtls == '')
  {
    alert("Please Fill Up The Product Details First..");
    ProductDtlsColourChange();
    ThirdHolderNext(); 
  }
  else
  {
    POADtlsColourChange();
    ProductDtlsNext();  
  }
}
//------------------------------------End POA Details--------------------------------------------------


//------------------------------------Start NomineeNameAddress-----------------------------------------
    function NomineeNext()
    {
      HideShow('Div_FirstAccountHlder','H');  
      HideShow('Div_SecondAccountHlder','H');  
      HideShow('Div_ThirdAccountHlder','H');  
      HideShow('Div_ProductDetails','H');  
      HideShow('Div_POADetails','H');
      HideShow('Div_NomineeNameAdrs','H');
      HideShow('Div_GurdianNameAdrs','S');
      HideShow('Div_NomGurdianNameAdrs','H');
      if(EntryType == "AddEdit" || EntryType == 'Edit')
      {
        cCbpGurdianNameAdrs.PerformCallback('GurdianNameAdrsUnSaved~'); 
      }
      Height('350','350');
    }
    
    function NomineePrevious()
    {
//      HideShow('Div_FirstAccountHlder','H');  
//      HideShow('Div_SecondAccountHlder','H');  
//      HideShow('Div_ThirdAccountHlder','H');  
//      HideShow('Div_ProductDetails','H');  
//      HideShow('Div_POADetails','S');
//      HideShow('Div_NomineeNameAdrs','H');
//      HideShow('Div_GurdianNameAdrs','H');
//      HideShow('Div_NomGurdianNameAdrs','H');
      ProductDtlsNext(); 
      Height('350','350');
    }
    
    function NomineeSave() 
    {
      if(cCbSkip4.GetChecked() == false)
      {
        if(DevE_Control_Empty(cTxtFName3,"Please Enter The First Name of The Nominee")) 
          if(DevE_Control_Empty(cTxtLName3,"Please Enter The Last Name of The Nominee")) 
            if(DevE_Control_Empty(cTxtNomineeAdrs1 ,"Please Enter The Address of The Nominee"))
               if(DevE_Control_CompareText(cTxtNomineePin,"0","Please Enter The Address Pin of The Nominee"))
                    if(DevE_Control_Empty(cTxtPan3,"Please Enter The Pan No of The Nominee")) 
                     {
                         cCbpNomineeNameAdrs.PerformCallback('SaveNomineeNameAdrs~'); 
                     }
       }   
        
    }
    
    function NomineeEdit()
    {
      Nominee = '';
      HideShow('DivBtnNextNomineeNameAdrs' ,'H'); 
      HideShow('DivBtnSaveNomineeNameAdrs','S'); 
      HideShow('DivBtnEditNomineeNameAdrs','H');
      EnableAll('<%=CbpNomineeNameAdrs.ClientID%>');  
      VisibleInVisible('DivNomineeNameAdrsAlrt','H'); 
      cComboNomineeCity.SetEnabled(true); 
      cComboNomineeState.SetEnabled(true); 
      cComboNomineeCountry.SetEnabled(true);
    }
    
    function CbpNomineeNameAdrs_EndCallBack()
    {
        if(cCbpNomineeNameAdrs.cpSaveNomineeNameAdrs != null)
        {
            HideShow('DivBtnNextNomineeNameAdrs' ,'S'); 
            HideShow('DivBtnSaveNomineeNameAdrs','H'); 
            HideShow('DivBtnEditNomineeNameAdrs','S');
            cComboNomineeCity.SetEnabled(false); 
            cComboNomineeState.SetEnabled(false); 
            cComboNomineeCountry.SetEnabled(false);
            DisableAll('<%=CbpNomineeNameAdrs.ClientID%>'); 
            VisibleInVisible('DivNomineeNameAdrsAlrt','S');
            Nominee = 'T';
            cCbpNomineeNameAdrs.cpSaveNomineeNameAdrs = null;  
        }
        if(cCbpNomineeNameAdrs.cpNomineeNameAdrsUnSaved != null)
        {
           NomineeEdit(); 
           HideShow('DivBtnNextNomineeNameAdrs' ,'S'); 
           if(cCbSkip4.GetChecked() == true)  
           {
            HideShow('DivBtnSaveNomineeNameAdrs','H');
           }
           else
           {
            HideShow('DivBtnSaveNomineeNameAdrs','S');
           }
           cCbpNomineeNameAdrs.cpNomineeNameAdrsUnSaved = null;
        }
        
        if(GetObjectID('divForOverView').style.display == 'inline') 
           NomineeNameAdrsColourChange(); 
        Height('350','350');
    }
    
    function NomineeReset()
    {
      NomineeEdit();
      cTxtTitl4.SetText(""); 
      cTxtFName3.SetText(""); 
      cTxtMName3.SetText(""); 
      cTxtLName3.SetText(""); 
      cTxtSufx4.SetText(""); 
      cTxtFthrName3.SetText("");  
      cdobDt1.SetDate(currentDateToset);
      cTxtNomineeAdrs1.SetText("");  
      cTxtNomineeAdrs2.SetText("");  
      cTxtNomineeAdrs3.SetText("");  
      cComboNomineeCity.SetValue('1'); 
      cTxtNomineePin.SetText("0000000000"); 
      cComboNomineeState.SetValue('10');  
      cComboNomineeCountry.SetValue('1'); 
      cTxtTelOfc1.SetText("0000000000");  
      cTxtTelRes1.SetText("0000000000");  
      cTxtFaxNo1.SetText("0000000000");  
      cTxtMobileNo1.SetText(""); 
      cTxtEmailID1.SetText("");  
      cTxtPan3.SetText("");  
      cTxtUIN4.SetText("");  
      cTxtDistrict4.SetText("");  
      cCbSkip4.SetChecked(false);   
    }
    
    function SkipNominee()
    {
       cCbSkip4.SetChecked(false); 
    }
    
    function Skip4CheckedChanged()
    {
      if(cCbSkip4.GetChecked() == true)  
      {
        HideShow('DivBtnNextNomineeNameAdrs' ,'S'); 
        HideShow('DivBtnSaveNomineeNameAdrs','H'); 
      }
      else
      {
        HideShow('DivBtnNextNomineeNameAdrs' ,'H'); 
        HideShow('DivBtnSaveNomineeNameAdrs','S'); 
      }
    }
    
    function NomineeDetails()
    {
      if(NameAdrs == '')
      {
        alert("Please Fill Up The Name & Address Details First..");
        NameAddress();
      }
      else if(ContactPan == '')
      {
        alert("Please Fill Up The Contact & Pan Details First..");
        ContactPanColourChange();
        NameAdrsNext();
      }
      else if(UserDefined == '' && cCbSkip0.GetChecked() == false)
      {
        alert("Please Fill Up The User Defined Field First..");
        UserDefinedColourChange();
        ContactNext();
      }
      else if(SecndAcntHldr == '' && cCbSkip1.GetChecked() == false)
      {
        alert("Please Fill Up The Second Account Holder First..");
        SecondAccHldrColourChange();
        FirstHolderNext();
      }
      else if(ThrdAcntHldr == '' && cCbSkip2.GetChecked() == false)
      {
        alert("Please Fill Up The Third Account Holder First..");
        ThrdAccHldrColourChange();
        SecondHolderNext();  
      }
      else if(ProductDtls == '')
      {
        alert("Please Fill Up The Product Details First..");
        ProductDtlsColourChange();
        ThirdHolderNext(); 
      }
      else if(POADtls == '' && cCbSkip3.GetChecked() == false)
      {
        alert("Please Fill Up The POA Details First..");
        POADtlsColourChange();
        ProductDtlsNext(); 
      }
      else
      {
        NomineeNameAdrsColourChange();
        POANext();
      }  
    }
//------------------------------------End NomineeNameAddress-------------------------------------------



//------------------------------------Start GurdianNameAddress-----------------------------------------
    function GurdianNext() 
    {
      HideShow('Div_FirstAccountHlder','H');  
      HideShow('Div_SecondAccountHlder','H');  
      HideShow('Div_ThirdAccountHlder','H');  
      HideShow('Div_ProductDetails','H');  
      HideShow('Div_POADetails','H');
      HideShow('Div_NomineeNameAdrs','H');
      HideShow('Div_GurdianNameAdrs','H');
      HideShow('Div_NomGurdianNameAdrs','S');
      HideShow('DivBtnSave','S');
      if(EntryType == "AddEdit" || EntryType == 'Edit')
      {
        cCbpNomGurdianNameAdrs.PerformCallback('NomGurdianNameAdrsUnSaved~'); 
      }
      Height('350','350');
    }
    
    function GurdianPrevious() 
    {
//////      HideShow('Div_FirstAccountHlder','H');  
//////      HideShow('Div_SecondAccountHlder','H');  
//////      HideShow('Div_ThirdAccountHlder','H');  
//////      HideShow('Div_ProductDetails','H');  
//////      HideShow('Div_POADetails','H');
//////      HideShow('Div_NomineeNameAdrs','S');
//////      HideShow('Div_GurdianNameAdrs','H');
//////      HideShow('Div_NomGurdianNameAdrs','H'); 
      POANext(); 
      Height('350','350');
    }
    
    function GurdianSave() 
    {
      if(cCbSkip5.GetChecked() == false)
      {
         if(DevE_Control_Empty(cTxtFName4,"Please Enter The First Name of The Gurdian")) 
          if(DevE_Control_Empty(cTxtLName4,"Please Enter The Last Name of The Gurdian")) 
            if(DevE_Control_Empty(cTxtGurdianAdrs1 ,"Please Enter The Address of The Gurdian")) 
               if(DevE_Control_CompareText(cTxtGurdianPin,"0","Please Enter The Address Pin of The Gurdian"))
                     if(DevE_Control_Empty(cTxtPan4,"Please Enter The Pan No of The Gurdian")) 
                      {
                        cCbpGurdianNameAdrs.PerformCallback('SaveGurdianNameAdrs~');
                      } 
      } 
    }
    function GurdianEdit() 
    {
      Gurdian = '';
      HideShow('DivBtnNextGurdianNameAdrs','H'); 
      HideShow('DivBtnSaveGurdianNameAdrs','S'); 
      HideShow('DivBtnEditGurdianNameAdrs','H');
      EnableAll('<%=CbpGurdianNameAdrs.ClientID%>'); 
      cComboGurdianCity.SetEnabled(true); 
      cComboGurdianState.SetEnabled(true); 
      cComboGurdianCountry.SetEnabled(true); 
      VisibleInVisible('DivGurdianNameAdrsAlrt','H');   
    }
    
    function CbpGurdianNameAdrs_EndCallBack()
    {
        if(cCbpGurdianNameAdrs.cpSaveGurdianNameAdrs != null)
        {
          HideShow('DivBtnNextGurdianNameAdrs','S'); 
          HideShow('DivBtnSaveGurdianNameAdrs','H'); 
          HideShow('DivBtnEditGurdianNameAdrs','S');
          cComboGurdianCity.SetEnabled(false); 
          cComboGurdianState.SetEnabled(false); 
          cComboGurdianCountry.SetEnabled(false);
          DisableAll('<%=CbpGurdianNameAdrs.ClientID%>'); 
          VisibleInVisible('DivGurdianNameAdrsAlrt','S');
          Gurdian = 'T';
          cCbpGurdianNameAdrs.cpSaveGurdianNameAdrs = null;      
        }
        if(cCbpGurdianNameAdrs.cpGurdianNameAdrsUnSaved != null)
        {
           GurdianEdit();
           HideShow('DivBtnNextGurdianNameAdrs','S'); 
           if(cCbSkip5.GetChecked() == true)
           {
            HideShow('DivBtnSaveGurdianNameAdrs','H'); 
           }
           else
           {
            HideShow('DivBtnSaveGurdianNameAdrs','S'); 
           }
           cCbpGurdianNameAdrs.cpGurdianNameAdrsUnSaved = null;  
        }
       
        if(GetObjectID('divForOverView').style.display == 'inline') 
          GurdianNameAdrsColourChange(); 
        Height('350','350');
    }
    
    function GurdianReset()
    {
      GurdianEdit();
      cTxtTitl5.SetText(""); 
      cTxtFName4.SetText(""); 
      cTxtMName4.SetText(""); 
      cTxtLName4.SetText(""); 
      cTxtSufx5.SetText(""); 
      cTxtFthrName4.SetText("");  
      cdobDt2.SetDate(currentDateToset);
      cTxtGurdianAdrs1.SetText("");  
      cTxtGurdianAdrs2.SetText("");  
      cTxtGurdianAdrs3.SetText("");  
      cComboGurdianCity.SetValue('1'); 
      cTxtGurdianPin.SetText("0000000000"); 
      cComboGurdianState.SetValue('10');  
      cComboGurdianCountry.SetValue('1'); 
      cTxtTelOfc2.SetText("0000000000");  
      cTxtTelRes2.SetText("0000000000");  
      cTxtFaxNo2.SetText("0000000000");  
      cTxtMobileNo2.SetText(""); 
      cTxtEmailID2.SetText("");  
      cTxtPan4.SetText("");  
      cTxtUIN5.SetText("");  
      cTxtDistrict5.SetText("");  
      cCbSkip5.SetChecked(false);     
    }
    
    function SkipGurdian()
    {
      cCbSkip5.SetChecked(false);  
    }
    
    function Skip5CheckedChanged()
    { 
         if(cCbSkip5.GetChecked() == true)
         {
           HideShow('DivBtnNextGurdianNameAdrs','S'); 
           HideShow('DivBtnSaveGurdianNameAdrs','H');   
         }
         else
         {
           HideShow('DivBtnNextGurdianNameAdrs','H'); 
           HideShow('DivBtnSaveGurdianNameAdrs','S');  
         }
    }
    
    function GurdianDetails()
    {
      if(NameAdrs == '')
      {
        alert("Please Fill Up The Name & Address Details First..");
        NameAddress();
      }
      else if(ContactPan == '')
      {
        alert("Please Fill Up The Contact & Pan Details First..");
        ContactPanColourChange();
        NameAdrsNext();
      }
      else if(UserDefined == '' && cCbSkip0.GetChecked() == false)
      {
        alert("Please Fill Up The User Defined Field First..");
        UserDefinedColourChange();
        ContactNext(); 
      }
      else if(SecndAcntHldr == '' && cCbSkip1.GetChecked() == false)
      {
        alert("Please Fill Up The Second Account Holder First..");
        SecondAccHldrColourChange(); 
        FirstHolderNext();
      }
      else if(ThrdAcntHldr == '' && cCbSkip2.GetChecked() == false)
      {
        alert("Please Fill Up The Third Account Holder First..");
        ThrdAccHldrColourChange();
        SecondHolderNext();  
      }
      else if(ProductDtls == '')
      {
        alert("Please Fill Up The Product Details First..");
        ProductDtlsColourChange();
        ThirdHolderNext(); 
      }
      else if(POADtls == '' && cCbSkip3.GetChecked() == false)
      {
        alert("Please Fill Up The POA Details First..");
        POADtlsColourChange();
        ProductDtlsNext();
      }
      else if(Nominee == '' && cCbSkip4.GetChecked() == false)
      {
        alert("Please Fill Up The Nominee Details First..");
        NomineeNameAdrsColourChange();
        POANext();
      }
      else
      {
       GurdianNameAdrsColourChange();
       NomineeNext();
      }
    }
//------------------------------------End GurdianNameAddress-------------------------------------------



//------------------------------------Start NomineeGurdianAddress--------------------------------------
    
    function NomGurdianPrevious()
    {
////      HideShow('Div_FirstAccountHlder','H');  
////      HideShow('Div_SecondAccountHlder','H');  
////      HideShow('Div_ThirdAccountHlder','H');  
////      HideShow('Div_ProductDetails','H');  
////      HideShow('Div_POADetails','H');
////      HideShow('Div_NomineeNameAdrs','H');
////      HideShow('Div_GurdianNameAdrs','S');
////      HideShow('Div_NomGurdianNameAdrs','H'); 
////      if(cCbSkip6.GetChecked() == false && cTxtFName5.GetText() == "")
////         HideShow('DivBtnSave','H');
      NomineeNext()
      Height('350','350');
    }
    function NomGurdianSave() 
    {
      if(cCbSkip6.GetChecked() == false)
      {
         if(DevE_Control_Empty(cTxtFName5,"Please Enter The First Name of The Nominee Gurdian")) 
          if(DevE_Control_Empty(cTxtLName5,"Please Enter The Last Name of The Nominee Gurdian")) 
            if(DevE_Control_Empty(cTxtNomGurdianAdrs1 ,"Please Enter The Address of The Nominee Gurdian")) 
                if(DevE_Control_CompareText(cTxtNomGurdianPin,"0","Please Enter The Address Pin of The Nominee Gurdian"))
                     if(DevE_Control_Empty(cTxtPan5,"Please Enter The Pan No of The Nominee Gurdian")) 
                      {
                        cCbpNomGurdianNameAdrs.PerformCallback('SaveNomGurdianNameAdrs~'); 
                      } 
      }  
    }
    function NomGurdianEdit() 
    {
      NomineeGurdian = '';
      HideShow('DivBtnSaveNomGurdianNameAdrs','S'); 
      HideShow('DivBtnEditNomGurdianNameAdrs','H'); 
      EnableAll('<%=CbpNomGurdianNameAdrs.ClientID%>'); 
      VisibleInVisible('DivNomGurdianAlrt','H'); 
      cComboNomGurdianCity.SetEnabled(true);
      cComboNomGurdianState.SetEnabled(true); 
      cComboNomGurdianCountry.SetEnabled(true);
    }
    function CbpNomGurdianNameAdrs_EndCallBack()
    {
      if(cCbpNomGurdianNameAdrs.cpSaveNomGurdianNameAdrs !=null) 
      {
        HideShow('DivBtnSaveNomGurdianNameAdrs','H'); 
        HideShow('DivBtnEditNomGurdianNameAdrs','S'); 
        DisableAll('<%=CbpNomGurdianNameAdrs.ClientID%>'); 
        cComboNomGurdianCity.SetEnabled(false);
        cComboNomGurdianState.SetEnabled(false); 
        cComboNomGurdianCountry.SetEnabled(false); 
        VisibleInVisible('DivNomGurdianAlrt','S');
        if(cCbSkip6.GetChecked() == true)
        {
           HideShow('DivSubmitAlert','S'); 
        }
        else
        {
           HideShow('DivSubmitAlert','H');  
        }
        NomineeGurdian = 'T';
        cCbpNomGurdianNameAdrs.cpSaveNomGurdianNameAdrs =null;
      } 
      if(cCbpNomGurdianNameAdrs.cpNomGurdianNameAdrsUnSaved !=null) 
      {
        NomGurdianEdit();
        Skip6CheckedChanged();
        cCbpNomGurdianNameAdrs.cpNomGurdianNameAdrsUnSaved = null;
      } 
      if(GetObjectID('divForOverView').style.display == 'inline') 
        NomGurdianNameAdrsColourChange(); 
      Height('350','350');
    }
    
    function NomGurdianReset() 
    {
      NomGurdianEdit();
      cTxtTitl6.SetText(""); 
      cTxtFName5.SetText(""); 
      cTxtMName5.SetText(""); 
      cTxtLName5.SetText(""); 
      cTxtSufx6.SetText(""); 
      cTxtFthrName5.SetText("");  
      cdobDt3.SetDate(currentDateToset);
      cTxtNomGurdianAdrs1.SetText("");  
      cTxtNomGurdianAdrs2.SetText("");  
      cTxtNomGurdianAdrs3.SetText("");  
      cComboNomGurdianCity.SetValue('1'); 
      cTxtNomGurdianPin.SetText("0000000000"); 
      cComboNomGurdianState.SetValue('10');  
      cComboNomGurdianCountry.SetValue('1'); 
      cTxtTelOfc3.SetText("0000000000");  
      cTxtTelRes3.SetText("0000000000");  
      cTxtFaxNo3.SetText("0000000000");  
      cTxtMobileNo3.SetText(""); 
      cTxtEmailID3.SetText("");  
      cTxtPan5.SetText("");  
      cTxtUIN6.SetText("");  
      cTxtDistrict6.SetText("");  
      cCbSkip6.SetChecked(false);   
    }
    
    function SkipNomGurdian()
    {
      cCbSkip6.SetChecked(false);  
    }
    
    function Skip6CheckedChanged()
    {
        if(cCbSkip6.GetChecked() == true)
        {
           HideShow('DivBtnSaveNomGurdianNameAdrs','H'); 
           HideShow('DivSubmitAlert','S'); 
        }
        else
        {
           HideShow('DivBtnSaveNomGurdianNameAdrs','S');
           HideShow('DivSubmitAlert','H');  
           
        }
    }
    
    function NomineeGurdianDetails()
    {
      if(NameAdrs == '')
      {
        alert("Please Fill Up The Name & Address Details First..");
        NameAddress();
      }
      else if(ContactPan == '')
      {
        alert("Please Fill Up The Contact & Pan Details First..");
        ContactPanColourChange();
        NameAdrsNext();
      }
      else if(UserDefined == '' && cCbSkip0.GetChecked() == false)
      {
        alert("Please Fill Up The User Defined Field First..");
        UserDefinedColourChange();
        ContactNext();
      }
      else if(SecndAcntHldr == '' && cCbSkip1.GetChecked() == false)
      {
        alert("Please Fill Up The Second Account Holder First..");
        SecondAccHldrColourChange();
        FirstHolderNext();
      }
      else if(ThrdAcntHldr == '' && cCbSkip2.GetChecked() == false)
      {
        alert("Please Fill Up The Third Account Holder First..");
        ThrdAccHldrColourChange();
        SecondHolderNext(); 
      }
      else if(ProductDtls == '')
      {
        alert("Please Fill Up The Product Details First..");
        ProductDtlsColourChange();
        ThirdHolderNext(); 
      }
      else if(POADtls == '' && cCbSkip3.GetChecked() == false)
      {
        alert("Please Fill Up The POA Details First..");
        POADtlsColourChange();
        ProductDtlsNext();
      }
      else if(Nominee == '' && cCbSkip4.GetChecked() == false)
      {
        alert("Please Fill Up The Nominee Details First..");
        NomineeNameAdrsColourChange();
        POANext();
      }
      else if(Gurdian == '' && cCbSkip5.GetChecked() == false)
      {
        alert("Please Fill Up The Gurdian Details First..");
        GurdianNameAdrsColourChange();
        NomineeNext();
      }
      else
      {
        NomGurdianNameAdrsColourChange();
        GurdianNext();
      }
    }
//------------------------------------End NomineeGurdianAddress----------------------------------------

//---------------------------------------Start Pop-Up-----------------------------------------------------

function PopUp_StartPage_btnSearch_Click()
{    
    var ClType = cComboClType.GetValue();
    var ApliNo = document.getElementById('<%=TxtApliNo_Hidden.ClientID%>').value;
    var ApliDate = cApliDt.GetValue();
    var Pan = document.getElementById('<%=TxtPanCrdNo.ClientID%>').value;
    var DOBDate = cDOBDt.GetValue();
    var EmlID = document.getElementById('<%=TxtEmlID.ClientID%>').value;
    
    if((cTxtFName.GetText() =="") && (cTxtMName.GetText() =="") && (cTxtLName.GetText() =="") && (cComboClType.GetText() == 'Select') && (document.getElementById('<%=TxtApliNo.ClientID%>').value == '') && (cApliDt.GetText() == '01-01-0100' ) && (document.getElementById('<%=TxtPanCrdNo.ClientID%>').value == '') && (cDOBDt.GetText() == '01-01-0100') && (document.getElementById('<%=TxtEmlID.ClientID%>').value == ''))
    {
       alert("Please Enter Atleast The First Name Of Client To Search The Corresponding Record ");
       cTxtFName.Focus();
    }
    else if((cTxtFName.GetText() !="") || (cTxtMName.GetText() !="") || (cTxtLName.GetText() !="") || (cComboClType.GetText() != 'Select') || (document.getElementById('<%=TxtApliNo.ClientID%>').value != '') ||  (cApliDt.GetText() != '01-01-0100') || (document.getElementById('<%=TxtPanCrdNo.ClientID%>').value != '') || (cDOBDt.GetText() != '01-01-0100') || (document.getElementById('<%=TxtEmlID.ClientID%>').value != ''))
    {
      cGridEntryRecord.PerformCallback('BindSearch~'+cTxtFName.GetText()+'~'+cTxtMName.GetText()+'~'+cTxtLName.GetText()+'~'+ClType+'~'+ApliNo+'~'+ApliDate+'~'+Pan+'~'+DOBDate+'~'+EmlID);    
      cPopUp_StartPage.Hide();
    } 
    
}
function PopUp_StartPage_btnAdvSearch_Click()
{
  PpRow0.style.visibility = 'inherit';
  PpRow1.style.visibility = 'inherit';
  PpRow2.style.visibility = 'inherit';
  HideShow('DivAdvSrch','H'); 
}
function CheckedChangedHidden(TrueFalse,obj)
{
    if(TrueFalse == true)
    {
        obj.style.visibility = 'hidden';
        HideShow('DivBtnOk','S');
    }
    else if(TrueFalse == false)
    {
        obj.style.visibility = 'inherit'; 
        HideShow('DivBtnOk','H');
    }
}
function PopUp_StartPage_btnOK_Click()
{
   if(crdEdit.GetChecked()== true)
   { HideShow('DivSaved','S');
     HideShow('DivUnsaved','H');
     HideShow('DivXMLUnsaved','H'); 
     HideShow('rowGV0','S'); 
     cGridEntryRecord.PerformCallback('BindForEdit~');
     EntryType = 'Edit';
   }
   else if(crdUnSaved.GetChecked()== true)  
   {
     cGridEntryRecord.PerformCallback('BindForEditUnSaved~');
     HideShow('Container2','H');
     HideShow('DivSaved','H');
     HideShow('DivUnsaved','H');
     HideShow('DivXMLUnsaved','S');  
     EntryType = 'AddEdit';
   }
}
function NewChecked()
{
    if(crdNew.GetChecked()== true)
        HideShow('DivBtnOk','H'); 
    else if(crdNew.GetChecked()== false)
        HideShow('DivBtnOk','S'); 
}
//-----------------------------------------------End Pop-Up---------------------------------------------------- 

function SaveButtonClick()
{
//  if(cCbSkip3.GetChecked() == false)
//  {
//   if(Control_Empty('<%=TxtPoaId.ClientID%>','Please Enter The POA Id'))
//     if(DevE_Control_Empty(cTxtPoaRegNo,"Please Enter The POA Registration Number")) 
//        if(DevE_Control_Empty(cTxtGpaBpa,"Please Enter The GPA/BPA"))
//        {
//            var TodayDate = new Date();
//            TodayDate.setDate(TodayDate.getDate());
//            var FDate=cFormDt.GetValue();
//            if(CompareDate_TrueFalse(FDate,TodayDate,"LT"))
//            {
//                alert("Please Enter a Valid From Date!!!");
//                return false;
//            }
//            else
//            {   
//                cCbpPOADtls.PerformCallback('SavePOADtls~'); 
//                
//            }
//        }
//    }
//    else
//    {
//      window.location="../BL/CDSL_CreateDPAccount.aspx";    
//    }
  cCbpPOADtls.PerformCallback('SaveAll~');            
}
function ResetButtonClick()
{
  cConfirmPopUp1.Show();
}
function ConfirmPopUpClickYes1()
{
  cConfirmPopUp2.Show(); 
}
function ConfirmPopUpClickYes2()
{
  cCbpPOADtls.PerformCallback('ResetAll~');   
}
function ShowRecordButtonClick()
{
  cGridEntryRecord.PerformCallback('BindForEdit~');   
}


</script>
<script type="text/javascript">  
floatingMenu.add('divForOverView',  
    {  
        // Represents distance from left or right browser window  
        // border depending upon property used. Only one should be  
        // specified.  
         targetLeft: 6,  
        //targetRight: 10,  

        // Represents distance from top or bottom browser window  
        // border depending upon property used. Only one should be  
        // specified.  
        //targetTop: 30,  
         targetBottom: 123,  

        // Uncomment one of those if you need centering on  
        // X- or Y- axis.  
        // centerX: true,  
        // centerY: true,  

        // Remove this one if you don't want snap effect  
         snap: true  
    }); 
 floatingMenu.add('btnClose',targetLeft: 20, targetBottom: 190,snap: true});      
 floatingMenu.add('btnOpen',targetLeft: 20, targetBottom: 190,snap: true});   


</script>
</head>
<body>
    <form  id="form1" runat="server">
    <div>
        
       <div id="btnOpen" class="Box_closeTotal">
                <a href="javascript:void(0);" onclick="btnOpenTotal_click()" title="Click To have A OverView Of All Records">
                    +</a></div>
            <div id="btnClose" class="Box_closeTotal">
                <a href="javascript:void(0);" onclick="btnCloseTotal_click()" title="Minimize The Section">
                    -</a></div>
            <div id="divForOverView" class="Box_TotalRecord">
                <div style="width: 1000px;">
                    <div style="width: 100%">
                        <div class="left cellTotHeader"  runat="server" style="width: 34px;">
                        </div>
                        <div  id="Div_FNameAddress" class="left cellTotHeader" title="Go To First Account Holder Name & Address Section" runat="server" style="width: 94px;
                            cursor: pointer" onclick="return NameAddress()">
                           <b>Name & Address</b>
                        </div>
                        <div id="Div_FContactPan" runat="server" class="left cellTotHeader" title="Go To First Account Holder Contact & Pan Section" style="width: 80px;
                            cursor: pointer" onclick="return ContactPanDtls()">
                            <b>Contact & Pan</b>
                        </div>
                        <div id="Div_FUserDefined" runat="server" class="left cellTotHeader" title="Go To First Account Holder User Defined Section" style="width: 80px;
                            cursor: pointer" onclick="return UserDefinedDtls()">
                            <b>User Defined</b>
                        </div>
                        <div id="Div_SecondAccount" runat="server" class="left cellTotHeader" title="Go To Second Account Holder Section" style="width: 130px;
                            cursor: pointer" onclick="return SecndAcntHolder()">
                            <b>Second Account Holder </b>
                        </div>
                        <div id="Div_ThirdAccount" runat="server" class="left cellTotHeader" title="Go To Third Account Holder Section" style="width: 120px;
                            cursor: pointer" onclick="return ThrdAcntHolder()">
                            <b>Third Account Holder</b>
                        </div>
                        <div id="Div_Product" runat="server" class="left cellTotHeader" title="Go To Product Details Section" style="width: 75px;
                            cursor: pointer" onclick="return PrdctDtls()">
                            <b>Product Dtls</b>
                        </div>
                        <div id="Div_POA" runat="server" class="left cellTotHeader" title="Go To POA Details Section" style="width: 65px;
                            cursor: pointer" onclick="return POADetails()">
                            <b>POA Dtls</b>
                        </div>
                        <div id="Div_Nominee" runat="server" class="left cellTotHeader" title="Go To Nominee Details Section" style="width: 65px;
                            cursor: pointer" onclick="return NomineeDetails()">
                            <b>Nominee</b>
                        </div>
                        <div id="Div_Gurdian" runat="server" class="left cellTotHeader" title="Go To Gurdian Details Section" style="width: 62px;
                            cursor: pointer" onclick="return GurdianDetails()">
                            <b>Gurdian</b>
                        </div>
                        <div id="Div_NomGurdian" runat="server" class="left cellTotHeader" title="Go To Nominee Gurdian Details Section" style="width: 97px;
                            cursor: pointer" onclick="return NomineeGurdianDetails()">
                            <b>Nominee Gurdian</b>
                        </div>
                        <span class="clear"></span>
                    </div>
                </div>
            </div>
        <div id="header" class="Header" style="height:26px">
            <div class="left" style="width:87%">
                  CDSL Registration [BO SetUp] 
            </div>
            <div class="left" style="width:13%;">
                <dxe:ASPxButton ID="BtnGoBack" runat="server" AutoPostBack="false" TabIndex="0" 
                     ToolTip="Return Back To First Selection" Width="26px" Height="25px" BackColor="Transparent"
                    ClientInstanceName="cBtnGoBack">
                    <Border BorderColor="Transparent"></Border>
                    <BackgroundImage HorizontalPosition="left" ImageUrl="../../../../images/back.png"
                     VerticalPosition="Top" />
                    <ClientSideEvents Click="function(s, e) {BackToSearch();}"></ClientSideEvents>
                </dxe:ASPxButton>
            </div>
        </div>
        <div id="DivGridRecord" style="width: 99%; padding-top: 4px" align="center">
                    
            <div id="DivEditGrdVw">
                <div id="rowGV0" class="container">
                    <div id="rowGV0_Col0" class="LFloat_Lable Leftdiv BtmMargin" style="width: 246px; height: 25px;">
                        CDSL Registration Created Date Range:
                    </div>
                    <div id="rowGV0_Col1" class="LFloat_Row" style="height: 25px; text-align: center">
                        <dxe:ASPxDateEdit ID="RecordFrmDt" runat="server" ClientInstanceName="cRecordFrmDt"
                            DateOnError="Today" EditFormat="Custom" EditFormatString="dd-MM-yyyy" Font-Size="11px"
                            TabIndex="0" UseMaskBehavior="True" Width="150px">
                            <DropDownButton Text="From">
                            </DropDownButton>
                        </dxe:ASPxDateEdit>
                    </div>
                    <div id="rowGV0_Col2" class="LFloat_Row DivName BtmMargin" style="height: 25px; text-align: center">
                        <dxe:ASPxDateEdit ID="RecordToDt" runat="server" ClientInstanceName="cRecordToDt"
                            DateOnError="Today" EditFormat="Custom" EditFormatString="dd-MM-yyyy" Font-Size="11px"
                            TabIndex="0" UseMaskBehavior="True" Width="150px">
                            <DropDownButton Text="To">
                            </DropDownButton>
                        </dxe:ASPxDateEdit>
                    </div>
                    <div class="left" style="font-size: 12pt; margin-left: 10px; margin-right: 10px;">
                        <dxe:ASPxButton ID="BtnShow" runat="server" AutoPostBack="false" ClientInstanceName="cBtnShow"
                            TabIndex="0" Text="Show" ToolTip="Add New Record" Width="100px" Height="25px">
                            <Border BorderColor="White" />
                            <ClientSideEvents Click="function(s, e) {ShowRecordButtonClick();}" />
                        </dxe:ASPxButton>
                    </div>
                </div> 
                <div id="lblGridHeader" class="paging textLeft left" style="font-size: 12pt; width: 745px;
                    margin-top: 10px; height: 30px; margin-left: 17px;" >
                    <span id="DivUnsaved" class="pagingContent">Search Result: </span>
                    <span id="DivSaved" class="pagingContent">Saved Records Of The Given Date Range:</span>
                     <span id="DivXMLUnsaved" class="pagingContent">UnSaved Records:</span>
                </div>
                <div class="left" style="margin-right: 5px; padding-top: 10px;">
                    <dxe:ASPxButton ID="BtnBacktoSrch" runat="server" AutoPostBack="False" ClientInstanceName="cBtnBacktoSrch"
                        Text=" Back To Search" ToolTip="Back To Search Option" Width="205px" Font-Bold="True"
                        Height="35px" ImagePosition="Top">
                        <Border BorderColor="ActiveBorder" />
                        <ClientSideEvents Click="function(s, e) {BackToSearch();}" />
                        <Image Height="100%" Width="100%" />
                        <BackgroundImage HorizontalPosition="left" ImageUrl="~/images/prev.gif" Repeat="NoRepeat"
                            VerticalPosition="bottom" />
                    </dxe:ASPxButton>
                </div>
                <div id="Container2" class="paging textLeft" style="width: 950px">
                    <div class="left pagingContent" style="vertical-align: bottom;">
                        Page <b id="B_PageNo" runat="server"></b>&nbsp;Of &nbsp;<b id="B_TotalPage" runat="server"></b>( <b id="B_TotalRows" runat="server"></b>items ) <span class="textLeft"><a id="A_LeftNav"
                            runat="server" href="javascript:void(0);" onclick="OnLeftNav_Click()">
                            <img align="middle" alt="" class="paging_nav" src="../../../../images/LeftNav.gif" width="16" />
                        </a></span><a id="A1" runat="server" class="number_box" href="javascript:void(0);"
                            onclick="OnPageNo_Click('A1')">1 </a><a id="A2" runat="server" class="number_box"
                                href="javascript:void(0);" onclick="OnPageNo_Click('A2')">2 </a><a id="A3" runat="server"
                                    class="number_box" href="javascript:void(0);" onclick="OnPageNo_Click('A3')">3 </a>
                        <a id="A4" runat="server" class="number_box" href="javascript:void(0);" onclick="OnPageNo_Click('A4')">
                            4 </a><a id="A5" runat="server" class="number_box" href="javascript:void(0);" onclick="OnPageNo_Click('A5')">
                                5 </a><a id="A6" runat="server" class="number_box" href="javascript:void(0);" onclick="OnPageNo_Click('A6')">
                                    6 </a><a id="A7" runat="server" class="number_box" href="javascript:void(0);" onclick="OnPageNo_Click('A7')">
                                        7 </a><a id="A8" runat="server" class="number_box" href="javascript:void(0);" onclick="OnPageNo_Click('A8')">
                                            8 </a><a id="A9" runat="server" class="number_box" href="javascript:void(0);" onclick="OnPageNo_Click('A9')">
                                                9 </a><a id="A10" runat="server" class="number_box" href="javascript:void(0);" onclick="OnPageNo_Click('A10')">
                                                    10 </a><span class="textRight"><a id="A_RightNav" runat="server" href="javascript:void(0);"
                                                        onclick="OnRightNav_Click()">
                                                        <img align="middle" alt="" class="paging_nav" src="../../../../images/RightNav.gif"
                                                            width="16" />
                                                    </a></span><span class="clear"></span>
                    </div>
                </div>
                <%-- OnHtmlEditFormCreated="GridEntryRecord_HtmlEditFormCreated"--%>
                <dxwgv:ASPxGridView ID="GridEntryRecord" runat="server" Width="950px" ClientInstanceName="cGridEntryRecord"
                    Font-Size="Small" KeyFieldName="RowID" AutoGenerateColumns="False" Settings-ShowHorizontalScrollBar="true"
                    OnCustomCallback="GridEntryRecord_CustomCallback">
                    <ClientSideEvents CustomButtonClick="function (s, e) {OnGridEditClick();}" EndCallback="function (s, e) {GridEntryRecord_EndCallBack();}" />
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
                    <%--   <a href="javascript:void(0);" onclick="Method('<%# Eval("ApplicationNumber") %>','<%# Eval("ApplicationDate") %>','<%# Eval("ClientID") %>' )"--%>
                    <SettingsEditing Mode="EditForm" PopupEditFormShowHeader="False" />
                    <Columns>
                        <dxwgv:GridViewDataTextColumn Caption="View" VisibleIndex="0" Width="80px" FixedStyle="Left">
                            <CellStyle CssClass="gridcellleft" Font-Size="11px" HorizontalAlign="center">
                            </CellStyle>
                            <DataItemTemplate>
                                <a href="javascript:void(0);" onclick="ForOpen('<%# Eval("KRAAplicatnNo") %>')" tabindex="-1">
                                    Open </a>&nbsp;&nbsp;
                                <a href="javascript:void(0);" onclick="ForDelete('<%# Eval("KRAAplicatnNo") %>')" tabindex="-1">
                                    Delete </a>    
                            </DataItemTemplate>
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="ClientType" FieldName="ClientTypeText" VisibleIndex="1"
                            Width="80px" FixedStyle="Left">
                            <CellStyle CssClass="gridcellleft" Font-Size="11px" HorizontalAlign="Right">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Client Name" FieldName="Name" VisibleIndex="2"
                            Width="180px" FixedStyle="Left">
                            <CellStyle CssClass="gridcellleft" Font-Size="11px">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Status" FieldName="StatusText" VisibleIndex="3"
                            Width="170px">
                            <CellStyle CssClass="gridcellleft" Font-Size="11px">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="DOB" FieldName="DOB" VisibleIndex="4" Width="170px">
                            <CellStyle CssClass="gridcellleft" Font-Size="11px">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Registered Address" FieldName="RegisteredAddress"
                            VisibleIndex="5" Width="250px">
                            <CellStyle CssClass="gridcellleft" Font-Size="11px">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Correspondence Address" FieldName="CorrespondenceAddress"
                            VisibleIndex="6" Width="250px">
                            <CellStyle CssClass="gridcellleft" Font-Size="11px">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="ApplicatnNo" FieldName="KRAAplicatnNo" Visible="false"
                            VisibleIndex="7">
                            <CellStyle CssClass="gridcellleft" Font-Size="11px">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="RowID" FieldName="RowID" Visible="false" VisibleIndex="8">
                            <CellStyle CssClass="gridcellleft" Font-Size="11px">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <SettingsText EmptyDataRow="No Data To Display" />
                    <Settings ShowHorizontalScrollBar="True" />
                    <SettingsLoadingPanel Text="PleaseWait&amp;hellip;" />
                    <SettingsPager Mode="ShowAllRecords">
                    </SettingsPager>
                </dxwgv:ASPxGridView>
            </div> 
        </div>
        
     <div id="DivEntryForm" >  
     <div id="Div_Container" class="container" style="width: 99%">
        <div id="Div_FirstAccountHlder"  style="width:99%">
            <div id="Div_NameAddress">
            <dxcp:ASPxCallbackPanel ID="CbpNameAddress" runat="server" BackColor="Transparent"
                ClientInstanceName="cCbpNameAddress" OnCallback="CbpNameAddress_Callback" Width="100%">
                <PanelCollection>
                    <dxp:PanelContent runat="server">
                        <div class="DivHeader" style="width: 100%" >
                            NAME &amp; ADDRESS DETAILS
                        </div>
                        <div id="Row00" class="Row">
                            <div id="Row00_Col0" class="LFloat_Lable Leftdiv ">
                                <span style="font-size: 10pt; color: #ff0000"></span>Product Type: <span style="font-size: 10pt;
                                    color: #ff0000">** <span style="color:blue">**</span></span></div>
                            <div id="Row00_Col1" class="LFloat_Row" style="height: 25px">
                                <asp:TextBox  ID="TxtProductType" runat="server" Width="150px"></asp:TextBox>
                            </div>
                            <div class="right" style="margin-right: 10px;">
                                <span style="font-size: 10pt; color: #ff0000">**</span> <strong><span style="font-size: 8pt;color: #ff0000">
                                    Mandatory Fields To Be Filled</span> </strong>
                            </div>
                        </div>
                        <div id="Row0" class="Row">
                            <div id="Row0_Col1" class="LFloat_Lable Leftdiv ">
                                Title:
                            </div>
                            <div id="Row0_Col2" class="LFloat_Row" style="height: 25px">
                                <dxe:ASPxTextBox ID="TxtTitl1" runat="server" ClientInstanceName="cTxtTitl1" Width="100px">
                                </dxe:ASPxTextBox>
                            </div><div class="right" style="margin-right: 10px;">
                                <span style="font-size: 10pt; color: blue">**</span> <strong><span style="font-size: 8pt; color: blue">
                                    Must Select From The List &nbsp; </span>&nbsp;</strong></div>
                        </div>
                        <div id="Row1" class="Row">
                            <div id="Row1_Col0" class="LFloat_Lable Leftdiv ">
                                <span class="Spanclass"></span> Name Of The Applicant:
                            </div>
                            <div id="Row1_Col1" class="LFloat_Row BindDiv" style="height: 25px">
                            </div>
                            <div id="Row1_Col2" class="LFloat_Row DivName BindDiv">
                            </div>
                            <div id="Row1_Col3" class="LFloat_Row DivName BindDiv">
                            </div>
                        </div>
                        <div id="Row2" class="Row">
                            <div id="Row2_Col0" class="LFloat_Lable Leftdiv ">
                                Suffix:
                            </div>
                            <div id="Row2_Col1" class="LFloat_Row" style="height: 25px">
                                <dxe:ASPxTextBox ID="TxtSufx1" runat="server" ClientInstanceName="cTxtSufx1" Width="100px">
                                </dxe:ASPxTextBox>
                            </div>
                        </div>
                        <div id="Row3" class="Row">
                            <div id="Row3_Col0" class="LFloat_Lable Leftdiv">
                                Father's / Spouse Name:
                            </div>
                            <div id="Row3_Col1" class="LFloat_Row BindDiv" style="height: 25px">
                            </div>
                        </div>
                        <div id="Row4" class="Row">
                           <div class="left" style="width:20%; margin-right: 10px;">
                                <div id="Row4_Col0" class="LFloat_Lable Leftdiv">
                                    Correspondence Address:
                                </div>
                                <div id="Row6" class="left" style="font-size: 12px; margin-top: 4px;">
                                    <strong>Same As The Correspondence Address</strong> 
                                    <dxe:ASPxCheckBox ID="CbSame" runat="server" ClientInstanceName="cCbSame"
                                        ToolTip="Same As The Corresponding Address">
                                        <ClientSideEvents CheckedChanged="OnCheckedChanged" />
                                    </dxe:ASPxCheckBox>
                                    
                                </div>
                            </div>
                            <div id="Row4_Col1" class="LFloat_Row FontChange" style="width: 57%">
                                <div id="Row4_Col1_row0" class="LFloat_Row LeftMargin BindDiv" style="margin-bottom: 2px;
                                    width: 400px">
                                </div>
                                <div id="Row4_Col1_row1" class="LFloat_Row LeftMargin BindDiv" style="margin-bottom: 2px;
                                    width: 400px">
                                </div>
                                <div id="Row4_Col1_row2" class="LFloat_Row LeftMargin BindDiv" style="margin-bottom: 2px;
                                    width: 400px">
                                </div>
                  
                                <div id="Row4_Col1_row3" class="left BtmMargin TopMargin" style="width: 99%">
                                    <div id="Row4_Col1_row3_col0" class="left" style="height: 25px">
                                        City/Town/Village :
                                    </div>
                                    <div id="Row4_Col1_row3_col1" class="left  LeftMargin SetBorder BindDiv" style="height: 25px;
                                        width: 100px;">
                                    </div>
                                    <div id="Row4_Col1_row3_col2" class="left" style="height: 25px; padding-left: 4px;">
                                        PinCode :
                                    </div>
                                    <div id="Row4_Col1_row3_col3" class="left  LeftMargin SetBorder BindDiv" style="height: 25px;
                                        width: 100px;">
                                    </div>
                                </div>
                                <div id="Row4_Col1_row4" class="left" style="height: 25px">
                                    State:</div>
                                <div id="Row4_Col1_row5" class="left SetBorder BindDiv" style="height: 25px; margin-left: 4px;
                                    width: 100px;">
                                </div>
                                <div id="Row4_Col1_row6" class="left LeftMargin" style="height: 25px">
                                    Country:</div>
                                <div id="Row4_Col1_row7" class="left SetBorder BindDiv" style="height: 25px; margin-left: 4px;
                                    width: 100px;">
                                </div>
                            </div>
                        </div>
   
                        <div id="Row5" class="Row">
                            <div id="Row5_Col0" class="LFloat_Lable Leftdiv">
                                Permanent Address:
                            </div>
                            <div id="Row5_Col1" class="LFloat_Row FontChange" style="width: 57%">
                                <div id="Row5_Col1_row0" class="LFloat_Row LeftMargin BindDiv" style="margin-bottom: 2px;
                                    width: 400px">
                                </div>
                                <div id="Row5_Col1_row1" class="LFloat_Row LeftMargin BindDiv" style="margin-bottom: 2px;
                                    width: 400px">
                                </div>
                                <div id="Row5_Col1_row2" class="LFloat_Row LeftMargin BindDiv" style="margin-bottom: 2px;
                                    width: 400px">
                                </div>
                                <div id="Row5_Col1_row3" class="left BtmMargin TopMargin" style="width: 99%">
                                    <div id="Row5_Col1_row3_col0" class="left" style="height: 25px">
                                        City/Town/Village :
                                    </div>
                                    <div id="Row5_Col1_row3_col1" class="left LeftMargin SetBorder BindDiv" style="height: 25px; width: 100px;">
                                    </div>
                                    <div id="Row5_Col1_row3_col2" class="left" style="height: 25px; padding-left: 4px;">
                                        PinCode :
                                    </div>
                                    <div id="Row5_Col1_row3_col3" class="left LeftMargin SetBorder BindDiv" style="height: 25px; width: 100px;">
                                    </div>
                                </div>
                                <div id="Row5_Col1_row4" class="left" style="height: 25px">
                                    State:</div>
                                <div id="Row5_Col1_row5" class="left SetBorder BindDiv" style="height: 25px; margin-left: 4px;
                                    width: 100px;">
                                </div>
                                <div id="Row5_Col1_row6" class="left LeftMargin" style="height: 25px">
                                    Country:</div>
                                <div id="Row5_Col1_row7" class="left SetBorder BindDiv" style="height: 25px; margin-left: 4px;
                                    width: 100px;">
                                </div>
                            </div>
                            <br class="clear"/>
                            
                       </div>

                       <asp:HiddenField ID="TxtProductType_hidden" runat="server" /> 
                         <div id="Row6_0" class="right RightMargin">
                            <dxe:ASPxButton ID="BtnNext00" runat="server" AccessKey="i" AutoPostBack="False"
                                ClientInstanceName="cBtnNext00" ToolTip="Go to Next Page"
                                Width="70px" BackColor="Transparent" Height="60px">
                                <ClientSideEvents Click="function(s, e) {NameAdrsNext();}" />
                                <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_foward.png"
                                 Repeat="NoRepeat" />
                                <Border BorderColor="Transparent" BorderStyle="None" />
                            </dxe:ASPxButton>
                        </div>
                        <div id="DivBtnSaveNameAdrs" class="right" style="font-size: 12pt; margin-left: 10px">
                              <dxe:ASPxButton ID="BtnSaveNameAddress" runat="server" AutoPostBack="False" BackColor="Transparent"
                                  ClientInstanceName="cBtnSaveNameAddress" Height="60px" ToolTip="Save Entered Data"
                                  Width="70px">
                                  <ClientSideEvents Click="function(s, e) {NameAdrsSave();}" />
                                  <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_save.png"
                                      Repeat="NoRepeat" />
                                  <Border BorderColor="Black" BorderStyle="None" />
                              </dxe:ASPxButton>
                          </div>
                          <div id="DivBtnEditNameAdrs" class="right">
                              <dxe:ASPxButton ID="BtnEditNameAdrs" runat="server" AutoPostBack="False" BackColor="Transparent"
                                  ClientInstanceName="cBtnEditNameAdrs" Height="60px" ToolTip="Edit Entered Data" Width="70px">
                                  <ClientSideEvents Click="function(s, e) {NameAdrsEdit();}" />
                                  <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/Edit.jpg"
                                      Repeat="NoRepeat" />
                                  <Border BorderStyle="None" />
                              </dxe:ASPxButton>
                          </div>
                       
                        <div id="Row6_1" class="right" style="font-size: 12pt; margin-left: 10px;
                            width: 143px;">
                            <dxe:ASPxCheckBox ID="CbNameAdrs" runat="server" ClientInstanceName="cCbNameAdrs"
                                ToolTip="Click If All The Informations Has Been Checked" Text="Information Checked" ForeColor="Black">
                                <ClientSideEvents CheckedChanged="function(s, e) {OnCheckedShowHide(cCbNameAdrs.GetChecked(),'DivBtnSaveNameAdrs');Height('350','350');}" />
                                <Border BorderColor="Transparent" />
                            </dxe:ASPxCheckBox>
                        </div>
                      
                        </dxp:PanelContent>
                       </PanelCollection>
                      <ClientSideEvents EndCallback="function (s, e) {CbpNameAddress_EndCallBack();}" />
                     <BackgroundImage HorizontalPosition="left" />
                    </dxcp:ASPxCallbackPanel>
                    
                    <div id="DivNameAdrsAlrt" class="Success BtmMargin" style="margin-top: 10px; width: 800px;
                        font-size: 9pt;">
                        <span style="color: #3366ff">Name And Address Details</span> Submitted Successfully !!!!
                        <br />
                        <div class="left" style="margin-right: 2px">Click&nbsp;</div> <div class="left" style="width:23px; background-position: center center; background-image: url(../../../../CentralData/Images/Small_Edit.jpg);height: 23px; background-color: transparent;"></div> <div class="left" style="margin-left: 2px; margin-right: 2px; width: 164px;" >
                                To Edit The Section <span style="color: #0066cc">Or</span> Click</div> <div class="left" style="width:22px; background-position: center center; background-image: url(../../../../CentralData/Images/Small_blue_foward.png); height: 22px; background-color: transparent;" ></div> <div class="left" style="margin-left: 2px; width: 280px;"> To Go To the <span style="color: #0066ff">Contact &amp; Pan Details</span>..</div>
                    </div>
                    
                    </div> 
                    
                    <dxcp:ASPxCallbackPanel ID="CbpContactPan" runat="server" BackColor="Transparent"
                      ClientInstanceName="cCbpContactPan" OnCallback="CbpContactPan_Callback" Width="100%">
                      <PanelCollection>
                        <dxp:PanelContent runat="server">
                         <div id="Div_Contact_Pan" class="left">
                            <div class="DivHeader" style="width: 1000px" >
                                CONTACT &amp; PAN DETAILS
                            </div>
                            
                            <div id="Row7" class="Row">
                                <div id="Row7_Col0" class="LFloat_Lable Leftdiv">
                                    Contact Details:</div>
                                <div id="Row7_Col1" class="LFloat_Row FontChange" style="width: 560px">
                                    <div id="Row7_Col1_row0" class="left TopMargin" style="width: 550px">
                                        <div id="Row7_Col1_row0_col0" class="left" style="height: 25px; width: 60px; padding-left: 4px;">
                                            Tel(Off) :
                                        </div>
                                        <div id="Row7_Col1_row0_col1" class="left SetBorder BindDiv" style="height: 25px; width: 100px;">
                                        </div>
                                        <div id="Row7_Col1_row0_col2" class="left" style="height: 25px; width: 65px; padding-left: 4px;">
                                            Tel(Res) :
                                        </div>
                                        <div id="Row7_Col1_row0_col3" class="left SetBorder BindDiv" style="height: 25px; width: 100px;">
                                        </div>
                                    </div>
                                    <div id="Row7_Col1_row1" class="left BtmMargin TopMargin" style="width: 550px">
                                        <div id="Row7_Col1_row1_col0" class="left" style="height: 25px; width: 60px; padding-left: 4px;">
                                            Fax No. :
                                        </div>
                                        <div id="Row7_Col1_row1_col1" class="left SetBorder BindDiv" style="height: 25px; width: 100px;">
                                        </div>
                                        <div id="Row7_Col1_row1_col2" class="left" style="height: 25px; width: 65px; padding-left: 4px;">
                                            Mobile No. :
                                        </div>
                                        <div id="Row7_Col1_row1_col3" class="left SetBorder BindDiv" style="height: 25px; width: 100px;">
                                        </div>
                                    </div>
                                    <div id="Row7_Col1_row2" class="left BtmMargin" style="height: 25px; width: 60px; padding-left: 4px;">
                                        Email ID:
                                    </div>
                                    <div id="Row7_Col1_row3" class="left SetBorder BtmMargin BindDiv" style="height: 25px; width: 250px;">
                                    </div>
                                </div>
                            </div>
                            <div id="Row8" class="Row">
                                <div id="Row8_Col0" class="LFloat_Lable Leftdiv" style="height: 30px">
                                    Is Pan Exempt:
                                </div>
                                <div id="Row8_Col1" class="LFloat_Row FontChange BindDiv" style="height: 30px">
                                </div>
                                <div id="Row8_Col2" class="LFloat_Row" style="margin-left: 10px; height: 30px">
                                    <dxe:ASPxComboBox ID="ComboPanExempt1" runat="server" ClientInstanceName="cComboPanExempt1"
                                        EnableIncrementalFiltering="True" Font-Size="12px" Height="25px"
                                        ValueType="System.String" Width="250px">
                                        <DropDownButton Text="PanExemptionType">
                                        </DropDownButton>
                                    </dxe:ASPxComboBox>
                                </div>
                            </div>
                            <div id="Row9" class="Row">
                                <div id="Row9_Col0" class="LFloat_Lable Leftdiv" style="height: 35px">
                                    <span class="Spanclass"></span> PAN / GIR: <span style="font-size: 10pt; color: #ff0000">
                                        **</span></div>
                                <div id="Row9_Col1" class="LFloat_Row FontChange BindDiv" style="height: 35px">
                                </div>
                                <div id="Row9_Col2" class="LFloat_Row" style="margin-left: 10px; height: 35px">
                                    <dxe:ASPxComboBox ID="ComboPanVerificatn1" runat="server" ClientInstanceName="cComboPanVerificatn1"
                                        EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" SelectedIndex="0"
                                        ValueType="System.String" Width="200px">
                                        <Items>
                                            <dxe:ListEditItem Text="Select" Value="S" />
                                            <dxe:ListEditItem Text="PAN not verified" Value="0" />
                                            <dxe:ListEditItem Text="PAN verified" Value="1" />
                                            <dxe:ListEditItem Text="PAN verification reversed" Value="2" />
                                        </Items>
                                        <DropDownButton Text="PanVerification">
                                        </DropDownButton>
                                    </dxe:ASPxComboBox>
                                </div>
                            </div>
                            <div id="Row90" class="Row">
                                <div id="Row90_Col0" class="LFloat_Lable Leftdiv" style="height: 37px">
                                    Unique Identification Number(UID) / Adhaar (If Any):</div>
                                <div id="Row90_Col1" class="LFloat_Row" style="height: 37px">
                                    <dxe:ASPxTextBox ID="TxtUIN1" runat="server" ClientInstanceName="cTxtUIN1" MaxLength="12"
                                        Width="170px">
                                    </dxe:ASPxTextBox>
                                </div>
                            </div>
                            <div id="Row10" class="Row">
                                <div id="Row10_Col0" class="LFloat_Lable Leftdiv" style="height: 37px">
                                    IT Circle/Ward/District:</div>
                                <div id="Row10_Col1" class="LFloat_Row" style="height: 37px">
                                    <dxe:ASPxTextBox ID="TxtDistrict1" runat="server" ClientInstanceName="cTxtDistrict1"
                                        Width="170px">
                                    </dxe:ASPxTextBox>
                                </div>
                            </div>
                            <br />
                            <div id="Row010" class="right RightMargin">
                                <dxe:ASPxButton ID="BtnNext0" runat="server" AccessKey="i" AutoPostBack="False"
                                ClientInstanceName="cBtnNext0" ToolTip="Go to Next Page"
                                Width="70px" BackColor="Transparent" Height="60px">
                                    <ClientSideEvents Click="function(s, e) {ContactNext();}" />
                                    <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_foward.png"
                                    Repeat="NoRepeat" />
                                    <Border BorderColor="Transparent" BorderStyle="None" />
                                </dxe:ASPxButton>
                            </div>
                            <div id="DivBtnSaveContactPan" class="right" style="font-size: 12pt; margin-left: 10px">
                                <dxe:ASPxButton ID="BtnSaveContactPan" runat="server" AutoPostBack="False" BackColor="Transparent"
                                    ClientInstanceName="cBtnSaveCmn" Height="60px" ToolTip="Save Entered Data" Width="70px">
                                    <ClientSideEvents Click="function(s, e) {ContactSave();}" />
                                    <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_save.png"
                                        Repeat="NoRepeat" />
                                    <Border BorderColor="Black" BorderStyle="None" />
                                </dxe:ASPxButton>
                            </div>
                            <div class="right" id="DivBtnEditContactPan">
                                <dxe:ASPxButton ID="BtnEditContactPan" runat="server" AutoPostBack="False" BackColor="Transparent"
                              ClientInstanceName="cBtnEditContactPan" Height="60px" ToolTip="Edit Entered Data" Width="70px">
                                    <ClientSideEvents Click="function(s, e) {ContactEdit();}" />
                                    <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/Edit.jpg"
                                  Repeat="NoRepeat" />
                                    <Border BorderStyle="None" />
                                </dxe:ASPxButton>
                            </div>
                            <div id="Row120" class="right">
                            <dxe:ASPxButton ID="BtnPrvs00" runat="server" AutoPostBack="False" ClientInstanceName="cBtnPrvs00" ToolTip="Bck To Previous" Width="70px" BackColor="Transparent" Height="60px">
                                <ClientSideEvents Click="function(s, e) {ConatactPrevious();}" />
                                <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_rewind.png"
                                 Repeat="NoRepeat" />
                                <Border BorderColor="Transparent" BorderStyle="None" />
                            </dxe:ASPxButton>
                            </div>
                            <div id="Row12" class="right" style="font-size: 12pt;
                                width: 143px;">
                                <dxe:ASPxCheckBox ID="CbChecked" runat="server" ClientInstanceName="cCbChecked"
                                    ToolTip="Click If All The Informations Has Been Checked" Text="Information Checked">
                                    <ClientSideEvents CheckedChanged="function(s, e) {OnCheckedShowHide(cCbChecked.GetChecked(),'DivBtnSaveContactPan')}" />
                                </dxe:ASPxCheckBox>
                            </div> 
                            <br />
                           <div style="MARGIN-TOP: 10px; FONT-SIZE: 9pt; MARGIN-BOTTOM: 30px; WIDTH: 863px" 
                           id="DivPanContctAlrt" class="Success BtmMargin">
                            <span style="color: #0066ff">Pan And Contact Details</span> Submitted Successfully !!!!
                           <br />
                            <div class="left" style="margin-right: 2px">Click</div> <div class="left" style="width:23px; background-position: center center; background-image: url(../../../../CentralData/Images/Small_Edit.jpg);height: 23px; background-color: transparent;"></div> <div class="left" style="margin-left: 2px; margin-right: 2px">
                                To Edit The Section<span style="color: #0066ff"> Or </span>Click</div> <div class="left" style="width:22px; background-position: center center; background-image: url(../../../../CentralData/Images/Small_blue_foward.png); height: 22px; background-color: transparent;"></div> <div class="left" style="margin-left: 2px">
                                To Go To the <span style="color: #0066ff">User Defined Fields</span> <span style="color: #0066ff">Or</span> Click&nbsp;</div>
                            <div class="left" style="width:22px; background-position: center center; background-image: url(../../../../CentralData/Images/Small_blue_rewind.png); height: 22px; background-color: transparent;">
                            </div>
                            <div class="left" style="margin-left: 2px; width: 317px;">
                                To Go Back To the <span style="color: #0066ff">Name &amp; Address Details</span>..</div>
                        </div>
                        </div>
                        </dxp:PanelContent>
                        </PanelCollection>
                        <ClientSideEvents EndCallback="function (s, e) {CbpContactPan_EndCallBack();}" />
                        <BackgroundImage HorizontalPosition="left" />
                    </dxcp:ASPxCallbackPanel>
                    
                    <dxcp:ASPxCallbackPanel ID="CbpUserDefined" runat="server" BackColor="Transparent"
                      ClientInstanceName="cCbpUserDefined" OnCallback="CbpUserDefined_Callback" Width="100%">
                      <PanelCollection>
                        <dxp:PanelContent runat="server">
                        <div id="Div_UserDef" class="left">
                            <div class="DivHeader" style="width: 1000px" >
                                USER DEFINED FIELDS
                            </div>
                            <div id="Row100" class="Row">
                                <div id="Row100_Col0" class="LFloat_Lable Leftdiv" style="height: 37px">
                                    User Field1:</div>
                                <div id="Row100_Col1" class="LFloat_Row" style="height: 37px">
                                    <dxe:ASPxTextBox ID="TxtUsrTxt1" runat="server" ClientInstanceName="cTxtUsrTxt1"
                                        Width="270px">
                                    </dxe:ASPxTextBox>
                                </div>
                            </div>
                            <div id="Row101" class="Row">
                                <div id="Row101_Col0" class="LFloat_Lable Leftdiv" style="height: 37px">
                                    User Field2:</div>
                                <div id="Row101_Col1" class="LFloat_Row" style="height: 37px">
                                    <dxe:ASPxTextBox ID="TxtUsrTxt2" runat="server" ClientInstanceName="cTxtUsrTxt2"
                                        Width="270px">
                                    </dxe:ASPxTextBox>
                                </div>
                            </div>
                            <div id="Row102" class="Row">
                                <div id="Row102_Col0" class="LFloat_Lable Leftdiv" style="height: 37px">
                                    User Field3:</div>
                                <div id="Row102_Col1" class="LFloat_Row" style="height: 37px">
                                    <dxe:ASPxTextBox ID="TxtUsrTxt3" runat="server" ClientInstanceName="cTxtUsrTxt3"
                                        Width="120px">
                                    </dxe:ASPxTextBox>
                                </div>
                            </div>
                            <br /> <br />
                            <div id="Row11" class="right RightMargin">
                                <dxe:ASPxButton ID="BtnNext1" runat="server" AccessKey="i" AutoPostBack="False"
                                    ClientInstanceName="cBtnNext1" ToolTip="Go to Next Page"
                                    Width="70px" BackColor="Transparent" Height="60px">
                                    <ClientSideEvents Click="function(s, e) {FirstHolderNext();}" />
                                    <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_foward.png"
                                        Repeat="NoRepeat" />
                                    <Border BorderColor="Transparent" BorderStyle="None" />
                                </dxe:ASPxButton>
                            </div>
                            <div id="DivBtnSaveUserDefined" class="right" style="font-size: 12pt; margin-left: 10px">
                                <dxe:ASPxButton ID="BtnSaveUserDefined" runat="server" AutoPostBack="False" BackColor="Transparent"
                                    ClientInstanceName="cBtnSaveUserDefined" Height="60px" ToolTip="Save Entered Data"
                                    Width="70px">
                                    <ClientSideEvents Click="function(s, e) {UserDefinedSave();}" />
                                    <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_save.png"
                                        Repeat="NoRepeat" />
                                    <Border BorderColor="Black" BorderStyle="None" />
                                </dxe:ASPxButton>
                            </div>
                            <div class="right" id="DivBtnEditUserDefined">
                                <dxe:ASPxButton ID="BtnEditUserDefined" runat="server" AutoPostBack="False" BackColor="Transparent"
                                  ClientInstanceName="cBtnEditUserDefined" Height="60px" ToolTip="Edit Entered Data" Width="70px">
                                    <ClientSideEvents Click="function(s, e) {UserDefinedEdit();}" />
                                    <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/Edit.jpg"
                                      Repeat="NoRepeat" />
                                    <Border BorderStyle="None" />
                                </dxe:ASPxButton>
                            </div>
                            <div id="Row12_0" class="right">
                                <dxe:ASPxButton ID="BtnPrvs0" runat="server" AutoPostBack="False" ClientInstanceName="cBtnPrvs0" ToolTip="Bck To Previous" Width="70px" BackColor="Transparent" Height="60px">
                                    <ClientSideEvents Click="function(s, e) {FirstHolderPrevious();}" />
                                    <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_rewind.png"
                                     Repeat="NoRepeat" />
                                    <Border BorderColor="Transparent" BorderStyle="None" />
                                </dxe:ASPxButton>
                            </div>
                            <div class="right" style="margin-right: 4px;">
                                <dxe:ASPxCheckBox ID="CbSkip0" runat="server" ClientInstanceName="cCbSkip0"
                                    ToolTip="Skip Second Account Holder Details" Checked="False" Text="Skip This Section">
                                    <ClientSideEvents CheckedChanged="Skip0CheckedChanged"  />
                                </dxe:ASPxCheckBox>
                            </div>
                            <br />
                            <br />
                            <div style="MARGIN-TOP: 10px; FONT-SIZE: 9pt; MARGIN-BOTTOM: 30px; WIDTH: 836px" 
                               id="DivUsrDefindAlrt" class="Success BtmMargin">
                                <span style="color: #0066ff">User Defined Fields</span> Submitted Successfully !!!!
                               <br />
                                <div class="left" style="margin-right: 2px">Click</div> <div class="left" style="width:23px; background-position: center center; background-image: url(../../../../CentralData/Images/Small_Edit.jpg);height: 23px; background-color: transparent;"></div> <div class="left" style="margin-left: 2px; margin-right: 2px">
                                    To Edit The Section<span style="color: #0066ff"> Or </span>Click</div> <div class="left" style="width:22px; background-position: center center; background-image: url(../../../../CentralData/Images/Small_blue_foward.png); height: 22px; background-color: transparent;"></div> <div class="left" style="margin-left: 2px">
                                    To Go To the <span style="color: #0066ff">Second Account Holder Details</span> &nbsp;<span style="color: #0066ff">Or</span> Click&nbsp;</div>
                                <div class="left" style="width:22px; background-position: center center; background-image: url(../../../../CentralData/Images/Small_blue_rewind.png); height: 22px; background-color: transparent;">
                                </div>
                                <div class="left" style="margin-left: 2px; width: 242px;">
                                    To Go Back To the <span style="color: #0066ff">Contact &amp; Pan Details</span>..</div>
                            </div>
                        </div>
                     </dxp:PanelContent>
                </PanelCollection>
                <ClientSideEvents EndCallback="function (s, e) {CbpUserDefined_EndCallBack();}" />
                <BackgroundImage HorizontalPosition="left" />
            </dxcp:ASPxCallbackPanel>
         
        </div>
          
          <div id="Div_SecondAccountHlder"  style="width:99%">
           <dxcp:ASPxCallbackPanel ID="CbpSecondAccountHlder" runat="server" BackColor="Transparent"
                     ClientInstanceName="cCbpSecondAccountHlder" OnCallback="CbpSecondAccountHlder_Callback" Width="100%">
                     <PanelCollection>
                         <dxp:PanelContent runat="server">
                             <div class="DivHeader" style="width: 100%"  >
                                 &nbsp; SECOND ACCOUNT HOLDER DETAILS
                             </div>
                             <div id="Row13" class="Row">
                                 <div id="Row13_Col0" class="LFloat_Lable Leftdiv ">
                                     Title:
                                 </div>
                                 <div id="Row13_Col1" class="LFloat_Row" style="height: 25px">
                                     <dxe:ASPxTextBox ID="TxtTitl2" runat="server" ClientInstanceName="cTxtTitl2"
                                         Width="100px">
                                         <ClientSideEvents TextChanged="SkipSecondHolder"/>
                                     </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row14" class="right" style="margin-right: 10px;">
                                <span style="font-size: 10pt; color: #ff0000">**</span> <strong><span style="font-size: 8pt; color: #ff0000">
                                     Mandatory Fields To Be Filled</span> </strong>
                             </div>
                             <div id="Row15" class="Row">
                                 <div id="Row15_Col0" class="LFloat_Lable Leftdiv " style="height: 38px">
                                     <span class="Spanclass"></span> Name Of The Applicant: <span style="font-size: 10pt;
                                         color: #ff0000">**</span>
                                 </div>
                                 <div id="Row15_Col1" class="LFloat_Row " style="height: 38px; text-align: center">
                                     <dxe:ASPxTextBox ID="TxtFName1" runat="server" ClientInstanceName="cTxtFName1"
                                          HorizontalAlign="Left" Width="155px">
                                         <ClientSideEvents TextChanged="SkipSecondHolder"/>
                                     </dxe:ASPxTextBox>
                                     <span style="font-size: 8pt">[First Name]</span>&nbsp;</div>
                                 <div id="Row15_Col2" class="LFloat_Row DivName" style="height: 38px">
                                     <dxe:ASPxTextBox ID="TxtMName1" runat="server" ClientInstanceName="cTxtMName1"
                                          HorizontalAlign="Left" Width="155px">
                                          <ClientSideEvents TextChanged="SkipSecondHolder"/>
                                     </dxe:ASPxTextBox>
                                     <span style="font-size: 8pt">[Middle Name]</span>&nbsp;</div>
                                 <div id="Row15_Col3" class="LFloat_Row DivName" style="height: 38px">
                                     <dxe:ASPxTextBox ID="TxtLName1" runat="server" ClientInstanceName="cTxtLName1"
                                           HorizontalAlign="Left" Width="155px">
                                          <ClientSideEvents TextChanged="SkipSecondHolder"/>
                                     </dxe:ASPxTextBox>
                                     <span style="font-size: 8pt">[Last Name]</span>&nbsp;</div>
                             </div>
                             <div id="Row16" class="Row">
                                 <div id="Row16_Col0" class="LFloat_Lable Leftdiv ">
                                     Suffix:
                                 </div>
                                 <div id="Row16_Col1" class="LFloat_Row" style="height: 25px">
                                     <dxe:ASPxTextBox ID="TxtSufx2" runat="server" ClientInstanceName="cTxtSufx2"
                                         Width="100px">
                                          <ClientSideEvents TextChanged="SkipSecondHolder"/>
                                     </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row17" class="Row">
                                 <div id="Row17_Col0" class="LFloat_Lable Leftdiv">
                                     Father's / Spouse Name:
                                 </div>
                                 <div id="Row17_Col1" class="LFloat_Row" style="height: 25px">
                                     <dxe:ASPxTextBox ID="TxtFthrName1" runat="server" ClientInstanceName="cTxtFthrName1"
                                         Width="500px">
                                          <ClientSideEvents TextChanged="SkipSecondHolder"/>
                                     </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row18" class="Row">
                                 <div id="Row18_Col0" class="LFloat_Lable Leftdiv" style="height: 35px">
                                     Is Pan Exempt:
                                 </div>
                                 <div id="Row18_Col1" class="LFloat_Row FontChange" style="height: 35px">
                                     <dxe:ASPxRadioButton ID="rdPanxmptY1" runat="server" ClientInstanceName="crdPanxmptY1"
                                         GroupName="z">
                                         <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdPanxmptY1.GetChecked(),'Row18_Col2');SkipSecondHolder();}"/>
                                              
                                     </dxe:ASPxRadioButton>
                                     YES
                                     <dxe:ASPxRadioButton ID="rdPanxmptN1" runat="server" Checked="True" ClientInstanceName="crdPanxmptN1"
                                         GroupName="z">
                                         <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdPanxmptY1.GetChecked(),'Row18_Col2');SkipSecondHolder();}"/>
                                            
                                     </dxe:ASPxRadioButton>
                                     NO
                                 </div>
                                 <div id="Row18_Col2" class="LFloat_Row" style="margin-left: 10px; height: 35px">
                                     <dxe:ASPxComboBox ID="ComboPanExempt2" runat="server" ClientInstanceName="cComboPanExempt2"
                                         EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" SelectedIndex="0"
                                         ValueType="System.String" Width="250px">
                                         <ClientSideEvents SelectedIndexChanged="SkipSecondHolder" />
                                         <DropDownButton Text="PanExemptionType">
                                         </DropDownButton>
                                     </dxe:ASPxComboBox>
                                 </div>
                             </div>
              
                             <div id="Row19" class="Row">
                                 <div id="Row19_Col0" class="LFloat_Lable Leftdiv" style="height: 35px">
                                     <span class="Spanclass"></span> PAN / GIR: <span style="font-size: 10pt; color: #ff0000">
                                         **</span>
                                 </div>
                                 <div id="Row19_Col1" class="LFloat_Row FontChange" style="height: 35px">
                                     <dxe:ASPxTextBox ID="TxtPan1" runat="server" ClientInstanceName="cTxtPan1" MaxLength="10"
                                         Width="150px">
                                          <ClientSideEvents TextChanged="SkipSecondHolder" KeyUp="function(s,e){s.SetText(s.GetValue().toUpperCase());}"/>
                                     </dxe:ASPxTextBox>
                                      <%--LostFocus="function(s, e) {verifyPanCrdNo(cTxtPan1);}"--%>
                                 </div>
                                 <div id="Row19_Col2" class="LFloat_Row" style="margin-left: 10px; height: 35px">
                                     <dxe:ASPxComboBox ID="ComboPanVerificatn2" runat="server" ClientInstanceName="cComboPanVerificatn2"
                                         EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" SelectedIndex="0"
                                         ValueType="System.String" Width="200px">
                                         <ClientSideEvents SelectedIndexChanged="SkipSecondHolder" />
                                         <Items>
                                             <dxe:ListEditItem  Text="Select" Value="S"/>
                                             <dxe:ListEditItem  Text="PAN not verified" Value="0"/>
                                             <dxe:ListEditItem  Text="PAN verified" Value="1"/>
                                             <dxe:ListEditItem  Text="PAN verification reversed" Value="2"/>
                                         </Items>
                                         <DropDownButton Text="PanVerification">
                                         </DropDownButton>
                                     </dxe:ASPxComboBox>
                                 </div>
                             </div>
                             <div id="Row190" class="Row">
                                <div id="Row190_Col1" class="LFloat_Lable Leftdiv" style="height: 37px">
                                    Unique Identification Number(UID) / Adhaar (If Any):</div>
                                <div id="Row190_Col2" class="LFloat_Row" style="height: 37px">
                                    <dxe:ASPxTextBox ID="TxtUIN2" runat="server" ClientInstanceName="cTxtUIN2" MaxLength="12"
                                        Width="170px">
                                    </dxe:ASPxTextBox>
                                </div>
                             </div>
                             <div id="Row20" class="Row">
                                 <div id="Row20_Col0" class="LFloat_Lable Leftdiv" style="height: 37px">
                                     IT Circle/Ward/District:</div>
                                 <div id="Row20_Col1" class="LFloat_Row" style="height: 37px">
                                     <dxe:ASPxTextBox ID="TxtDistrict2" runat="server" ClientInstanceName="cTxtDistrict2" 
                                         MaxLength="12" Width="170px">
                                          <ClientSideEvents TextChanged="SkipSecondHolder"/>
                                     </dxe:ASPxTextBox>
                                 </div>
                             </div>
                         
                             <div id="Row21" class="right RightMargin">
                                 <dxe:ASPxButton ID="BtnNext2" runat="server" AccessKey="i" AutoPostBack="False"
                                     ClientInstanceName="cBtnNext2" ToolTip="Proceed To Next"
                                     Width="70px" BackColor="Transparent" Height="60px">
                                     <ClientSideEvents Click="function(s, e) {SecondHolderNext();}" />
                                     <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_foward.png"
                                         Repeat="NoRepeat" />
                                     <Border BorderColor="Transparent" BorderStyle="None" />
                                 </dxe:ASPxButton>
                             </div>
                             <div id="DivBtnSaveScndAcntHlder" class="right" style="font-size: 12pt; margin-left: 10px">
                                 <dxe:ASPxButton ID="BtnSaveScndAcntHlder" runat="server" AutoPostBack="False" BackColor="Transparent"
                                     ClientInstanceName="cBtnSaveScndAcntHlder" Height="60px" ToolTip="Save Entered Data"
                                     Width="70px">
                                     <ClientSideEvents Click="function(s, e) {SecondHolderSave();}" />
                                     <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_save.png"
                                         Repeat="NoRepeat" />
                                     <Border BorderColor="Black" BorderStyle="None" />
                                 </dxe:ASPxButton>
                             </div>
                             <div class="right" id="DivBtnEditScndAcntHlder">
                                 <dxe:ASPxButton ID="BtnEditScndAcntHlder" runat="server" AutoPostBack="False" BackColor="Transparent"
                                  ClientInstanceName="cBtnEditScndAcntHlder" Height="60px" ToolTip="Edit Entered Data" Width="70px">
                                     <ClientSideEvents Click="function(s, e) {SecondHolderEdit();}" />
                                     <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/Edit.jpg"
                                      Repeat="NoRepeat" />
                                     <Border BorderStyle="None" />
                                 </dxe:ASPxButton>
                             </div>
                             <div id="Row22" class="right" style="margin-left: 4px">
                                 <dxe:ASPxButton ID="BtnPrvs1" runat="server" AutoPostBack="False" ClientInstanceName="cBtnPrvs1" ToolTip="Back To Previous" Width="70px" BackColor="Transparent" Height="60px">
                                     <ClientSideEvents Click="function(s, e) {SecondHolderPrevious();}" />
                                     <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_rewind.png"
                                         Repeat="NoRepeat" />
                                     <Border BorderColor="Transparent" BorderStyle="None" />
                                 </dxe:ASPxButton>
                             </div>
                             <div class="right" style="margin-right: 4px;">
                                <dxe:ASPxCheckBox ID="CbSkip1" runat="server" ClientInstanceName="cCbSkip1"
                                    ToolTip="Skip Second Account Holder Details" Checked="False" Text="Skip This Section">
                                    <ClientSideEvents CheckedChanged="Skip1CheckedChanged"  />
                                </dxe:ASPxCheckBox>
                             </div>
                             
                             <div style="MARGIN-TOP: 10px; FONT-SIZE: 9pt; MARGIN-BOTTOM: 30px; WIDTH: 860px" 
                                   id="DivScndHlderAlrt" class="Success BtmMargin">
                                     <span style="color: #0066ff">Second Account Holder Details</span> Submitted Successfully !!!!
                                   <br />
                                <div class="left" style="margin-right: 2px">Click</div> <div class="left" style="width:23px; background-position: center center; background-image: url(../../../../CentralData/Images/Small_Edit.jpg);height: 23px; background-color: transparent;"></div> <div class="left" style="margin-left: 2px; margin-right: 2px">
                                    To Edit The Section<span style="color: #0066ff"> Or </span>Click</div> <div class="left" style="width:22px; background-position: center center; background-image: url(../../../../CentralData/Images/Small_blue_foward.png); height: 22px; background-color: transparent;"></div> <div class="left" style="margin-left: 2px">
                                    To Go To the <span style="color: #0066cc">Third Account Holder Details</span> <span style="color: #0066ff">Or</span> Click&nbsp;</div>
                                <div class="left" style="width:22px; background-position: center center; background-image: url(../../../../CentralData/Images/Small_blue_rewind.png); height: 22px; background-color: transparent;">
                                </div>
                                <div class="left" style="margin-left: 2px; width: 280px;">
                                    To Go Back To the <span style="color: #0066ff">User Defined Details</span>..</div>
                             </div>
                         </dxp:PanelContent>
                     </PanelCollection>
                     <ClientSideEvents EndCallback="function (s, e) {CbpSecondAccountHlder_EndCallBack();}" />
                 </dxcp:ASPxCallbackPanel>
          </div> 
          <div id="Div_ThirdAccountHlder"  style="width:99%">
           <dxcp:ASPxCallbackPanel ID="CbpThirdAccountHlder" runat="server" BackColor="Transparent"
                     ClientInstanceName="cCbpThirdAccountHlder" OnCallback="CbpThirdAccountHlder_Callback" Width="100%">
                     <PanelCollection>
                         <dxp:PanelContent runat="server">
                             <div class="DivHeader" style="width: 100%">
                                 &nbsp; THIRD ACCOUNT HOLDER DETAILS
                             </div>
                             <div id="Row23" class="Row">
                                 <div id="Row23_Col0" class="LFloat_Lable Leftdiv ">
                                     Title:
                                 </div>
                                 <div id="Row23_Col1" class="LFloat_Row" style="height: 25px">
                                     <dxe:ASPxTextBox ID="TxtTitl3" runat="server" ClientInstanceName="cTxtTitl3"
                                         Width="100px">
                                         <ClientSideEvents TextChanged="SkipThirdHolder"/>
                                     </dxe:ASPxTextBox>
                                 </div>
                                 <div class="right" style="margin-right: 10px;">
                                     <span style="font-size: 10pt; color: #ff0000">**</span> <strong><span style="font-size: 8pt; color: #ff0000">
                                         Mandatory Fields To Be Filled</span> </strong>
                                 </div>
                             </div>
                             <div id="Row24" class="Row">
                                 <div id="Row24_Col0" class="LFloat_Lable Leftdiv " style="height: 38px">
                                     <span class="Spanclass"></span> Name Of The Applicant: <span style="font-size: 10pt;
                                         color: #ff0000">**</span>
                                 </div>
                                 <div id="Row24_Col1" class="LFloat_Row " style="height: 38px; text-align: center">
                                     <dxe:ASPxTextBox ID="TxtFName2" runat="server" ClientInstanceName="cTxtFName2"
                                         HorizontalAlign="Left" Width="155px">
                                         <ClientSideEvents TextChanged="SkipThirdHolder"/>
                                     </dxe:ASPxTextBox>
                                     <span style="font-size: 8pt">[First Name]</span>
                                 </div>
                                 <div id="Row24_Col2" class="LFloat_Row DivName" style="height: 38px">
                                     <dxe:ASPxTextBox ID="TxtMName2" runat="server" ClientInstanceName="cTxtMName2"
                                         HorizontalAlign="Left" Width="155px">
                                         <ClientSideEvents TextChanged="SkipThirdHolder"/>
                                     </dxe:ASPxTextBox>
                                     <span style="font-size: 8pt">[Middle Name]</span>
                                     
                                 </div>
                                 <div id="Row24_Col3" class="LFloat_Row DivName" style="height: 38px">
                                     <dxe:ASPxTextBox ID="TxtLName2" runat="server" ClientInstanceName="cTxtLName2"
                                         HorizontalAlign="Left" Width="155px">
                                         <ClientSideEvents TextChanged="SkipThirdHolder"/>
                                     </dxe:ASPxTextBox>
                                     <span style="font-size: 8pt">[Last Name]</span>
                                 </div>
                             </div>
                             <div id="Row25" class="Row">
                                 <div id="Row25_Col0" class="LFloat_Lable Leftdiv ">
                                     Suffix:
                                 </div>
                                 <div id="Row25_Col1" class="LFloat_Row" style="height: 25px">
                                     <dxe:ASPxTextBox ID="TxtSufx3" runat="server" ClientInstanceName="cTxtSufx3"
                                         Width="100px">
                                          <ClientSideEvents TextChanged="SkipThirdHolder"/>
                                     </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row26" class="Row">
                                 <div id="Row26_Col0" class="LFloat_Lable Leftdiv">
                                     <span class="Spanclass"></span>Father's / Spouse Name:
                                 </div>
                                 <div id="Row26_Col1" class="LFloat_Row" style="height: 25px">
                                     <dxe:ASPxTextBox ID="TxtFthrName2" runat="server" ClientInstanceName="cTxtFthrName2"
                                         Width="500px">
                                          <ClientSideEvents TextChanged="SkipThirdHolder"/>
                                     </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row27" class="Row">
                                 <div id="Row27_Col0" class="LFloat_Lable Leftdiv" style="height: 35px">
                                     Is Pan Exempt:
                                 </div>
                                 <div id="Row27_Col1" class="LFloat_Row FontChange" style="height: 35px">
                                     <dxe:ASPxRadioButton ID="rdPanxmptY2" runat="server" ClientInstanceName="crdPanxmptY2"
                                         GroupName="z">
                                         <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdPanxmptY2.GetChecked(),'Row27_Col2');SkipThirdHolder();}"/>
                                              
                                     </dxe:ASPxRadioButton>
                                     YES
                                     <dxe:ASPxRadioButton ID="rdPanxmptN2" runat="server" Checked="True" ClientInstanceName="crdPanxmptN2"
                                         GroupName="z">
                                         <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdPanxmptY2.GetChecked(),'Row27_Col2');SkipThirdHolder();}"/>
                                     
                                     </dxe:ASPxRadioButton>
                                     NO
                                 </div>
                                 <div id="Row27_Col2" class="LFloat_Row" style="margin-left: 10px; height: 35px">
                                     <dxe:ASPxComboBox ID="ComboPanExempt3" runat="server" ClientInstanceName="cComboPanExempt3"
                                         EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" SelectedIndex="0"
                                         ValueType="System.String" Width="250px">
                                         <ClientSideEvents SelectedIndexChanged="SkipThirdHolder"/>
                                         <DropDownButton Text="PanExemptionType">
                                         </DropDownButton>
                                     </dxe:ASPxComboBox>
                                 </div>
                             </div>
                             <div id="Row28" class="Row">
                                 <div id="Row28_Col0" class="LFloat_Lable Leftdiv" style="height: 35px">
                                     <span class="Spanclass"></span> PAN / GIR: <span style="font-size: 10pt; color: #ff0000">
                                         **</span>
                                 </div>
                                 <div id="Row28_Col1" class="LFloat_Row FontChange" style="height: 35px">
                                     <dxe:ASPxTextBox ID="TxtPan2" runat="server" ClientInstanceName="cTxtPan2" MaxLength="10"
                                         Width="150px">
                                         <ClientSideEvents TextChanged="SkipThirdHolder" KeyUp="function(s,e){s.SetText(s.GetValue().toUpperCase());}" />
                                     </dxe:ASPxTextBox>
                                     <%--LostFocus="function(s, e) {verifyPanCrdNo(cTxtPan2);}"--%>
                                 </div>
                                 <div id="Row28_Col2" class="LFloat_Row" style="margin-left: 10px; height: 35px">
                                     <dxe:ASPxComboBox ID="ComboPanVerificatn3" runat="server" ClientInstanceName="cComboPanVerificatn3"
                                         EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" SelectedIndex="0"
                                         ValueType="System.String" Width="200px">
                                         <ClientSideEvents SelectedIndexChanged="SkipThirdHolder"/>
                                         <Items>
                                             <dxe:ListEditItem  Text="Select" Value="S"/>
                                             <dxe:ListEditItem  Text="PAN not verified" Value="0"/>
                                             <dxe:ListEditItem  Text="PAN verified" Value="1"/>
                                             <dxe:ListEditItem  Text="PAN verification reversed" Value="2"/>
                                         </Items>
                                         <DropDownButton Text="PanVerification">
                                         </DropDownButton>
                                     </dxe:ASPxComboBox>
                                 </div>
                                 
                             </div>
                             <div id="Row280" class="Row">
                                <div id="Row280_Col0" class="LFloat_Lable Leftdiv" style="height: 37px">
                                    Unique Identification Number(UID) / Adhaar (If Any):</div>
                                <div id="Row280_Col1" class="LFloat_Row" style="height: 37px">
                                    <dxe:ASPxTextBox ID="TxtUIN3" runat="server" ClientInstanceName="cTxtUIN3" MaxLength="12"
                                        Width="170px">
                                    </dxe:ASPxTextBox>
                                </div>
                             </div>
                             <div id="Row29" class="Row">
                                 <div id="Row29_Col0" class="LFloat_Lable Leftdiv" style="height: 37px">
                                     IT Circle/Ward/District:</div>
                                 <div id="Row29_Col1" class="LFloat_Row" style="height: 37px">
                                     <dxe:ASPxTextBox ID="TxtDistrict3" runat="server" ClientInstanceName="cTxtDistrict3" 
                                         MaxLength="12" Width="170px">
                                          <ClientSideEvents TextChanged="SkipThirdHolder"/>
                                     </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             
                             <div id="Row30" class="right RightMargin">
                                 <dxe:ASPxButton ID="BtnNext3" runat="server" AccessKey="i" AutoPostBack="False"
                                     ClientInstanceName="cBtnNext3" ToolTip="Proceed To Next"
                                     Width="70px" BackColor="Transparent" Height="60px">
                                     <ClientSideEvents Click="function(s, e) {ThirdHolderNext();}" />
                                     <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_foward.png"
                                         Repeat="NoRepeat" />
                                     <Border BorderColor="Transparent" BorderStyle="None" />
                                 </dxe:ASPxButton>
                             </div>
                             <div id="DivBtnSaveThrdAcntHlder" class="right" style="font-size: 12pt; margin-left: 10px">
                                 <dxe:ASPxButton ID="BtnSaveThrdAcntHlder" runat="server" AutoPostBack="False" BackColor="Transparent"
                                     ClientInstanceName="cBtnSaveThrdAcntHlder" Height="60px" ToolTip="Save Entered Data"
                                     Width="70px">
                                     <ClientSideEvents Click="function(s, e) {ThirdHolderSave();}" />
                                     <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_save.png"
                                         Repeat="NoRepeat" />
                                     <Border BorderColor="Black" BorderStyle="None" />
                                 </dxe:ASPxButton>
                             </div>
                             <div class="right" id="DivBtnEditThrdAcntHlder">
                                 <dxe:ASPxButton ID="BtnEditThrdAcntHlder" runat="server" AutoPostBack="False" BackColor="Transparent"
                                  ClientInstanceName="cBtnEditThrdAcntHlder" Height="60px" ToolTip="Edit Entered Data" Width="70px">
                                     <ClientSideEvents Click="function(s, e) {ThirdHolderEdit();}" />
                                     <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/Edit.jpg"
                                      Repeat="NoRepeat" />
                                     <Border BorderStyle="None" />
                                 </dxe:ASPxButton>
                             </div>
                             <div id="Row31" class="right">
                                 <dxe:ASPxButton ID="BtnPrvs2" runat="server" AutoPostBack="False" ClientInstanceName="cBtnPrvs2" ToolTip="Bck To Previous" Width="70px" BackColor="Transparent" Height="60px">
                                     <ClientSideEvents Click="function(s, e) {ThirdHolderPrevious();}" />
                                     <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_rewind.png"
                                         Repeat="NoRepeat" />
                                     <Border BorderColor="Transparent" BorderStyle="None" />
                                 </dxe:ASPxButton>
                             </div>
                                 <div id="Row23_Col2" class="right" style="margin-right: 4px">
                                     <dxe:ASPxCheckBox ID="CbSkip2" runat="server" ClientInstanceName="cCbSkip2"
                                    ToolTip="Skip Third Account Holder Details" Checked="False" Text="Skip This Section">
                                         <ClientSideEvents CheckedChanged="Skip2CheckedChanged" />
                                     </dxe:ASPxCheckBox>
                                 </div>
                             <br class="clear"/>
                             <br class="clear"/>
                             <div style="MARGIN-TOP: 10px; FONT-SIZE: 9pt; MARGIN-BOTTOM: 30px; WIDTH: 800px" 
                               id="DivThrdHldrAlrt" class="Success BtmMargin">
                                 <span style="color: #0066ff">Third Account Holder Details</span> Submitted Successfully !!!!
                               <br />
                                <div class="left" style="margin-right: 2px">Click</div> <div class="left" style="width:23px; background-position: center center; background-image: url(../../../../CentralData/Images/Small_Edit.jpg);height: 23px; background-color: transparent;"></div> <div class="left" style="margin-left: 2px; margin-right: 2px">
                                To Edit The Section<span style="color: #0066ff"> Or </span>Click</div> <div class="left" style="width:22px; background-position: center center; background-image: url(../../../../CentralData/Images/Small_blue_foward.png); height: 22px; background-color: transparent;"></div> <div class="left" style="margin-left: 2px">
                                To Go To the <span style="color: #0066cc">Product Details</span> <span style="color: #0066ff">Or</span> Click&nbsp;</div>
                                <div class="left" style="width:22px; background-position: center center; background-image: url(../../../../CentralData/Images/Small_blue_rewind.png); height: 22px; background-color: transparent;">
                                </div>
                                <div class="left" style="margin-left: 2px; width: 285px;">
                                To Go Back To the <span style="color: #0066ff">Second Account Holder Details</span>..</div>
                             </div>
                         </dxp:PanelContent>
                     </PanelCollection>
                     <ClientSideEvents EndCallback="function (s, e) {CbpThirdAccountHlder_EndCallBack();}" />
                 </dxcp:ASPxCallbackPanel>
          </div>
          <div id="Div_ProductDetails">
              <dxcp:ASPxCallbackPanel ID="CbpProductDtls" runat="server" ClientInstanceName="cCbpProductDtls"
                    OnCallback="CbpProductDtls_Callback" BackColor="Transparent" Width="100%">
                   <PanelCollection>
                       <dxp:panelcontent runat="server"> 
                             <div class="DivHeader" style="width: 100%" >&nbsp; PRODUCT DETAILS 
                             </div>
                             <%--<div id="Row32" class="Row">
                                 <div id="Row32_Col0" class="LFloat_Lable Leftdiv">
                                    DP Internal Ref No:
                                 </div>
                                 <div id="Row32_Col1" class="LFloat_Row BtmMargin" style="height: 25px; ">
                                   <dxe:ASPxTextBox ID="TxtIntrnlRef" runat="server" ClientInstanceName="cTxtIntrnlRef"
                                        Width="150px">
                                    </dxe:ASPxTextBox>
                                 </div>
                                 
                             </div>--%>
                             <div id="Row33" class="Row">
                                 <div id="Row33_Col0" class="LFloat_Lable Leftdiv ">
                                     Date Of Maturity:
                                 </div>
                                 <div id="Row33_Col1" class="LFloat_Row" style="height: 25px;">
                                   <dxe:ASPxDateEdit ID="MaturityDt" runat="server" ClientInstanceName="cMaturityDt" DateOnError="Today"
                                          EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="150px"
                                          Font-Size="11px" TabIndex="0">
                                          <ClientSideEvents  LostFocus="function(s,e){SetValidDate(cMaturityDt);}"/>
                                   </dxe:ASPxDateEdit>
                                 </div>
                                 <div id="Row33_Col2" class="LFloat_Lable Leftdiv LeftMargin">
                                    Date Of Birth:
                                 </div>
                                 <div id="Row33_Col3" class="LFloat_Row BtmMargin BindDiv" style="height: 25px;">
                                  
                                 </div>
                                 <div class="right" style="margin-right: 10px;">
                                     <span style="font-size: 10pt; color: #ff0000">**</span> <strong><span style="font-size: 8pt; color: #ff0000">
                                         Mandatory Fields To Be Filled</span> </strong>
                                 </div>
                                 
                             </div>
                             <div id="Row34" class="Row">
                                 <div id="Row34_Col0" class="LFloat_Lable Leftdiv">
                                     Gender:
                                 </div>
                                 <div id="Row34_Col1" class="LFloat_Row FontChange BindDiv" style="height: 25px; width: 80px;">
                                     
                                 </div>
                                 <div id="Row34_Col2" class="LFloat_Lable Leftdiv LeftMargin" style="margin-left: 80px">
                                     Occupation:
                                 </div>
                                 <div id="Row34_Col3" class="LFloat_Row FontChange BindDiv" style="height: 25px">
                                    
                                 </div>
                                 <div class="right" style="margin-right: 10px;">
                                     <span style="font-size: 10pt; color: blue">**</span> <strong><span style="font-size: 8pt; color: blue">
                                         Must Select From The List &nbsp; </span>&nbsp;</strong></div>
                             </div>
                             
                             <div id="Row35" class="Row">
                                 <div id="Row35_Col0" class="LFloat_Lable Leftdiv">
                                     Life Style:
                                 </div>
                                 <div id="Row35_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                    <dxe:ASPxTextBox ID="TxtLifeStyle" runat="server" ClientInstanceName="cTxtLifeStyle"
                                        Width="150px">
                                    </dxe:ASPxTextBox>
                                 </div>
                                 <div id="Row35_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     Geographical Code: <span style="font-size: 10pt; color: blue">**</span></div>
                                 <div id="Row35_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                     <asp:TextBox ID="TxtGeoCode" runat="server" Width="144px" >
                                     </asp:TextBox>
                                 </div>
                             </div> 
                             <div id="Row36" class="Row">
                                 <div id="Row36_Col0" class="LFloat_Lable Leftdiv">
                                     Education /Degree: <span style="font-size: 10pt; color: blue">**</span></div>
                                 <div id="Row36_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                     <asp:TextBox ID="TxtEduDegree" runat="server" Width="144px"></asp:TextBox>
                                 </div>
                                 <div id="Row36_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     Annual Income :
                                 </div>
                                 <div id="Row36_Col3" class="LFloat_Row FontChange BindDiv" style="height: 25px">
                                   
                                 </div>
                             </div>
                             <div id="Row37" class="Row">
                                 <div id="Row37_Col0" class="LFloat_Lable Leftdiv">
                                    Nationality:
                                 </div>
                                 <div id="Row37_Col1" class="LFloat_Row FontChange BindDiv" style="height: 25px; width: 80px;">
                                     
                                 </div>
                                 <div id="Row37_Col2" class="LFloat_Lable Leftdiv  LeftMargin" style="margin-left: 80px">
                                     Status:
                                 </div>
                                 <div id="Row37_Col3" class="LFloat_Row FontChange BindDiv" style="height: 25px">
                                    
                                 </div>
                             </div>
                             <div id="Row38" class="Row">
                                 <div id="Row38_Col0" class="LFloat_Lable Leftdiv">
                                    BO Fee Type:
                                 </div>
                                 <div id="Row38_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                     <dxe:ASPxTextBox ID="TxtBoFee" runat="server" ClientInstanceName="cTxtBoFee"
                                        Width="150px">
                                    </dxe:ASPxTextBox>
                                 </div>
                                 <div id="Row38_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     Language : <span style="font-size: 10pt; color: blue">**</span></div>
                                 <div id="Row38_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                     <asp:TextBox ID="TxtLang" runat="server" Width="144px"></asp:TextBox>
                                 </div>
                             </div>
                             <div id="Row39" class="Row">
                                 <div id="Row39_Col0" class="LFloat_Lable Leftdiv">
                                    Catagory 4 Code:
                                 </div>
                                 <div id="Row39_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                     <dxe:ASPxTextBox ID="TxtCatg4" runat="server" ClientInstanceName="cTxtCatg4"
                                        Width="150px">
                                    </dxe:ASPxTextBox>
                                 </div>
                                 <div id="Row39_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     Bank Option 5:
                                 </div>
                                 <div id="Row39_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                    <dxe:ASPxTextBox ID="TxtBnkOptn5" runat="server"  ClientEnabled="false" ClientInstanceName="cTxtBnkOptn5"
                                        Width="150px">
                                    </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row40" class="Row">
                                 <div id="Row40_Col0" class="LFloat_Lable Leftdiv">
                                   Staff/Relative: <span style="font-size: 10pt; color: blue">**</span></div>
                                 <div id="Row40_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                     <asp:TextBox ID="TxtStaffRel" runat="server" Width="144px"></asp:TextBox>
                                 </div>
                                 <div id="Row40_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     Staff Code:
                                 </div>
                                 <div id="Row40_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                    <dxe:ASPxTextBox ID="TxtStafCode" runat="server" ClientInstanceName="cTxtStafCode"
                                        Width="150px">
                                    </dxe:ASPxTextBox>
                                 </div>
                             </div>
                     
                             <div id="Row41" class="Row">
                                 <div id="Row41_Col0" class="LFloat_Lable Leftdiv">
                                   RGESS Flag:
                                 </div>
                                 <div id="Row41_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                     <dxe:ASPxComboBox ID="ComboRGESS" runat="server" ClientInstanceName="cComboRGESS"
                                         EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" SelectedIndex="0"
                                         ValueType="System.String" Width="150px">
                                         <Items>
                                             <dxe:ListEditItem  Text="No" Value="N"/>
                                             <dxe:ListEditItem  Text="Yes" Value="Y"/>
                                         </Items>
                                    </dxe:ASPxComboBox>
                                 </div>
                                 <div id="Row41_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     Annual Report Flag:
                                 </div>
                                 <div id="Row41_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                    <dxe:ASPxComboBox ID="ComboAnualReprt" runat="server" ClientInstanceName="cComboAnualReprt"
                                         EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" SelectedIndex="0"
                                         ValueType="System.String" Width="150px">
                                         <Items>
                                             <dxe:ListEditItem  Text="Physical Annual Report" Value="1"/>
                                             <dxe:ListEditItem  Text="Electronic Annual Report" Value="2"/>
                                             <dxe:ListEditItem  Text="Both Physical and Electronic Annual Report" Value="3"/>
                                         </Items>
                                    </dxe:ASPxComboBox>
                                 </div>
                             </div> 
                             <div id="Row42" class="Row">
                                 <div id="Row42_Col0" class="LFloat_Lable Leftdiv">
                                   Pledge Standing Instruction Flag:
                                 </div>
                                 <div id="Row42_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                     <dxe:ASPxComboBox ID="ComboPledge" runat="server" ClientInstanceName="cComboPledge"
                                         EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" SelectedIndex="0"
                                         ValueType="System.String" Width="150px">
                                         <Items>
                                             <dxe:ListEditItem  Text="Yes" Value="Y"/>
                                             <dxe:ListEditItem  Text="No" Value="N"/>
                                         </Items>
                                    </dxe:ASPxComboBox>
                                 </div>
                                 <div id="Row42_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     Email RTA Download Flag:
                                 </div>
                                 <div id="Row42_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                    <dxe:ASPxComboBox ID="ComboRTA" runat="server" ClientInstanceName="cComboRTA"
                                         EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" SelectedIndex="0"
                                         ValueType="System.String" Width="150px">
                                         <Items>
                                             <dxe:ListEditItem  Text="Yes" Value="Y"/>
                                             <dxe:ListEditItem  Text="No" Value="N"/>
                                         </Items>
                                    </dxe:ASPxComboBox>
                                 </div>
                             </div> 
  
                             <div id="Row43" class="Row">
                                 <div id="Row43_Col0" class="LFloat_Lable Leftdiv">
                                   Basic Services Demat A/C Flag:
                                 </div>
                                 <div id="Row43_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                     <dxe:ASPxComboBox ID="ComboBSDA" runat="server" ClientInstanceName="cComboBSDA"
                                         EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" SelectedIndex="0"
                                         ValueType="System.String" Width="150px">
                                         <Items>
                                             <dxe:ListEditItem  Text="No" Value="N"/>
                                             <dxe:ListEditItem  Text="Yes" Value="Y"/>
                                         </Items>
                                    </dxe:ASPxComboBox>
                                 </div>
                                 <div id="Row43_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     Security Access Code: <span style="font-size: 10pt; color: blue">**</span></div>
                                 <div id="Row43_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                     <asp:TextBox ID="TxtSecAccess" runat="server" Width="144px"></asp:TextBox>
                                 </div>
                             </div>
                             <div id="Row44" class="Row">
                                 <div id="Row44_Col0" class="LFloat_Lable Leftdiv">
                                     <span style="font-size: 10pt; color: #ff0000"></span>BO Category: <span style="font-size: 10pt;
                                         color: #ff0000">** <span style="color: blue">**</span></span></div>
                                 <div id="Row44_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                    <asp:TextBox  ID="TxtBoCatg" runat="server" Width="144px"></asp:TextBox>
                                 </div>
                                 <div id="Row44_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     <span style="font-size: 10pt; color: #ff0000"></span>BO Settlement Planning Flag:
                                     <span style="font-size: 10pt; color: #ff0000">**</span></div>
                                 <div id="Row44_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                 <dxe:ASPxComboBox ID="ComboBOsett" runat="server" ClientInstanceName="cComboBOsett"
                                         EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" SelectedIndex="0"
                                         ValueType="System.String" Width="150px">
                                     <Items>
                                         <dxe:ListEditItem  Text="Yes" Value="Y"/>
                                         <dxe:ListEditItem  Text="No" Value="N"/>
                                     </Items>
                                 </dxe:ASPxComboBox>
                                 </div>
                             </div>
                             <div id="Row45" class="Row">
                                 <div id="Row45_Col0" class="LFloat_Lable Leftdiv">
                                     Dividend Bank IFSC Code:
                                 </div>
                                 <div id="Row45_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                 <dxe:ASPxTextBox ID="TxtIFSC" runat="server" ClientInstanceName="cTxtIFSC"
                                        Width="150px">
                                 </dxe:ASPxTextBox>
                                 </div>
                                 <div id="Row45_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     RBI Refference Number:
                                 </div>
                                 <div id="Row45_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                    <dxe:ASPxTextBox ID="TxtRBIRef" runat="server" ClientInstanceName="cTxtRBIRef"
                                        Width="150px">
                                    </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row46" class="Row">
                                 <div id="Row46_Col0" class="LFloat_Lable Leftdiv">
                                  RBI Approval Date:
                                 </div>
                                 <div id="Row46_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                     <dxe:ASPxDateEdit ID="RBIaprvDt" runat="server" ClientInstanceName="cRBIaprvDt" DateOnError="Today"
                                              EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="150px"
                                              Font-Size="11px" TabIndex="0">
                                              <ClientSideEvents  LostFocus="function(s,e){SetValidDate(cRBIaprvDt);}"/>
                                     </dxe:ASPxDateEdit>
                                 </div>
                                 <div id="Row46_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                    SEBI Registration Number:
                                 </div>
                                 <div id="Row46_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                    <dxe:ASPxTextBox ID="TxtSebiReg" runat="server" ClientInstanceName="cTxtSebiReg"
                                        Width="150px">
                                    </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row47" class="Row">
                                 <div id="Row47_Col0" class="LFloat_Lable Leftdiv" style="height: 38px">
                                     Beneficiary Tax Deductation Status: <span style="font-size: 10pt; color: blue">**</span></div>
                                 <div id="Row47_Col1" class="LFloat_Row FontChange" style="height: 38px">
                                    <asp:TextBox  ID="TxtBenTaxStatus" runat="server" Width="144px"></asp:TextBox>
                                 </div>
                                 <div id="Row47_Col2" class="LFloat_Lable Leftdiv  LeftMargin" style="height: 38px">
                                     Smart Card Required:
                                 </div>
                                 <div id="Row47_Col3" class="LFloat_Row FontChange" style="height: 38px">
                                 <dxe:ASPxComboBox ID="ComboSmartCrd" runat="server" ClientInstanceName="cComboSmartCrd"
                                         EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" SelectedIndex="0"
                                         ValueType="System.String" Width="150px">
                                     <Items>
                                         <dxe:ListEditItem  Text="No" Value="N"/>
                                         <dxe:ListEditItem  Text="Yes" Value="Y"/>
                                     </Items>
                                      
                                 </dxe:ASPxComboBox>
                                 </div>
                             </div>
                             <div id="Row48" class="Row">
                                 <div id="Row48_Col2" class="LFloat_Lable Leftdiv">
                                     Smart Card Number:
                                 </div>
                                 <div id="Row48_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                    <dxe:ASPxTextBox ID="TxtSmartCrd" runat="server" ClientInstanceName="cTxtSmartCrd"
                                        Width="150px">
                                    </dxe:ASPxTextBox>
                                 </div>
                                 <div id="Row48_Col0" class="LFloat_Lable Leftdiv LeftMargin">
                                     Smart Card PIN:
                                 </div>
                                 <div id="Row48_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                 <dxe:ASPxTextBox ID="TxtSmrtCrdPin" runat="server" ClientInstanceName="cTxtSmrtCrdPin" MaxLength="10"
                                        Width="80px">
                                         <MaskSettings Mask="<0..9999999999>" />
                                 </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row49" class="Row">
                                 <div id="Row49_Col0" class="LFloat_Lable Leftdiv">
                                  ECS/MANDATE:
                                 </div>
                                 <div id="Row49_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                 <dxe:ASPxComboBox ID="ComboEcsMandate" runat="server" ClientInstanceName="cComboEcsMandate"
                                         EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" SelectedIndex="0"
                                         ValueType="System.String" Width="150px">
                                     <Items>
                                         <dxe:ListEditItem  Text="Yes" Value="Y"/>
                                         <dxe:ListEditItem  Text="No" Value="N"/>
                                     </Items>
                                 </dxe:ASPxComboBox>
                                 </div>
                                 <div id="Row49_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     Electronic Confirmation:
                                 </div>
                                 <div id="Row49_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                    <dxe:ASPxTextBox ID="TxtElectronicConfrmatn" runat="server" ClientInstanceName="cTxtElectronicConfrmatn"
                                        Width="150px" ClientEnabled="False">
                                    </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             
                             <div id="Row50" class="Row">
                                 <div id="Row50_Col0" class="LFloat_Lable Leftdiv">
                                     Dividend Currency: <span style="font-size: 10pt; color: blue">**</span></div>
                                 <div id="Row50_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                    <asp:TextBox  ID="TxtDividndCurncy" runat="server" Width="144px"></asp:TextBox>
                                 </div>
                                 <div id="Row5_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     Group Code:
                                 </div>
                                 <div id="Row5_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                    <dxe:ASPxTextBox ID="TxtGrpCode" runat="server" ClientInstanceName="cTxtGrpCode"
                                        Width="150px">
                                    </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row51" class="Row">
                                 <div id="Row51_Col0" class="LFloat_Lable Leftdiv">
                                     <span style="font-size: 10pt; color: #ff0000"></span>BO Sub Satus: <span style="font-size: 10pt;
                                         color: #ff0000">** <span style="color: blue">**</span></span></div>
                                 <div id="Row51_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                    <asp:TextBox  ID="TxtBoSubstatus" runat="server" Width="144px"></asp:TextBox>
                                 </div>
                                 <div id="Row51_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     Clearing Corporation ID: <span style="font-size: 10pt; color: blue">**</span></div>
                                 <div id="Row51_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                     <asp:TextBox ID="TxtClrngCorpID" runat="server" Width="144px"></asp:TextBox>
                                 </div>
                             </div>
                             <div id="Row52" class="Row">
                                 <div id="Row52_Col0" class="LFloat_Lable Leftdiv">
                                     Clearing Member ID:
                                 </div>
                                 <div id="Row52_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                 <dxe:ASPxTextBox ID="TxtClrngMmbrID" runat="server" ClientInstanceName="cTxtClrngMmbrID"
                                        Width="150px">
                                 </dxe:ASPxTextBox>
                                 </div>
                                 <div id="Row52_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     Stock Exchange:
                                 </div>
                                 <div id="Row52_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                    <dxe:ASPxTextBox ID="TxtStckExchng" runat="server" ClientInstanceName="cTxtStckExchng"
                                        Width="150px" ClientEnabled="False">
                                    </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             
                             <div id="Row53" class="Row">
                                 <div id="Row53_Col0" class="LFloat_Lable Leftdiv">
                                     Confirmation Waived:
                                 </div>
                                 <div id="Row53_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                     <dxe:ASPxComboBox ID="ComboConfrmatnWavd" runat="server" ClientInstanceName="cComboConfrmatnWavd"
                                             EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" SelectedIndex="0"
                                             ValueType="System.String" Width="150px">
                                         <Items>
                                             <dxe:ListEditItem  Text="Yes" Value="Y"/>
                                             <dxe:ListEditItem  Text="No" Value="N"/>
                                         </Items>
                                     </dxe:ASPxComboBox>
                                 </div>
                                
                                 <div id="Row53_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     Trading ID:
                                 </div>
                                 <div id="Row53_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                    <dxe:ASPxTextBox ID="TxtTtradngID" runat="server" ClientInstanceName="cTxtTtradngID"
                                        Width="150px">
                                    </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row54" class="Row">
                                 <div id="Row54_Col0" class="LFloat_Lable Leftdiv">
                                     <span style="font-size: 10pt; color: #ff0000"></span>BO Statement Cycle Code: <span
                                         style="font-size: 10pt; color: #ff0000">** <span style="color: blue">**</span></span></div>
                                 <div id="Row54_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                    <asp:TextBox  ID="TxtBOStatemntCycle" runat="server" Width="144px"></asp:TextBox>
                                 </div>
                                 <div id="Row54_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     BENF Bank Code:
                                 </div>
                                 <div id="Row54_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                    <dxe:ASPxTextBox ID="TxtBENFBnkCode" runat="server" ClientInstanceName="cTxtBENFBnkCode"
                                        Width="150px">
                                    </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row55" class="Row">
                                 <div id="Row55_Col0" class="LFloat_Lable Leftdiv">
                                     BENF Bank Account Type: <span style="font-size: 10pt; color: blue">**</span></div>
                                 <div id="Row55_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                    <asp:TextBox  ID="TxtBENFBnkAcType" runat="server" Width="144px"></asp:TextBox>
                                 </div>
                                 <div id="Row55_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     BENF Bank Account Number:
                                 </div>
                                 <div id="Row55_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                    <dxe:ASPxTextBox ID="TxtBENFBnkAcNo" runat="server" ClientInstanceName="cTxtBENFBnkAcNo"
                                        Width="150px">
                                    </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row56" class="Row">
                                 <div id="Row56_Col0" class="LFloat_Lable Leftdiv">
                                     BENF Bank CCY: <span style="font-size: 10pt; color: blue">**</span></div>
                                 <div id="Row56_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                    <asp:TextBox  ID="TxtBENFBnkCCY" runat="server" Width="144px"></asp:TextBox>
                                 </div>
                                 <div id="Row56_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     DIVND Bank Account TYPE: <span style="font-size: 10pt; color: blue">**</span></div>
                                 <div id="Row56_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                     <asp:TextBox ID="TxtDIVNDBnkAcType" runat="server" Width="144px"></asp:TextBox>
                                 </div>
                             </div>
                             <div id="Row57" class="Row">
                                 <div id="Row57_Col0" class="LFloat_Lable Leftdiv">
                                     DIVND Bank CODE:
                                 </div>
                                 <div id="Row57_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                 <dxe:ASPxTextBox ID="TxtDIVNDBnkCode" runat="server" ClientInstanceName="cTxtDIVNDBnkCode"
                                        Width="150px">
                                 </dxe:ASPxTextBox>
                                 </div>
                                 <div id="Row57_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                     DIVND Account Number:
                                 </div>
                                 <div id="Row57_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                    <dxe:ASPxTextBox ID="TxtDIVNDBnkAcNo" runat="server" ClientInstanceName="cTxtDIVNDBnkAcNo"
                                        Width="150px">
                                    </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row58" class="Row">
                                 <div id="Row58_Col0" class="LFloat_Lable Leftdiv">
                                     DIVND Bank CCY: <span style="font-size: 10pt; color: blue">**</span></div>
                                 <div id="Row58_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                    <asp:TextBox  ID="TxtDIVNDBnkCCY" runat="server" Width="144px"></asp:TextBox>
                                 </div>
                                 
                            </div>
                           
                            <div id="Row580" class="right RightMargin">
                                 <dxe:ASPxButton ID="BtnNext4" runat="server" AccessKey="i" AutoPostBack="False"
                                     ClientInstanceName="cBtnNext4" ToolTip="Proceed To Next"
                                     Width="70px" BackColor="Transparent" Height="60px">
                                     <ClientSideEvents Click="function(s, e) {ProductDtlsNext();}" />
                                     <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_foward.png"
                                         Repeat="NoRepeat" />
                                     <Border BorderColor="Transparent" BorderStyle="None" />
                                 </dxe:ASPxButton>
                            </div>
                            <div id="DivBtnSaveProductDtls" class="right" style="font-size: 12pt; margin-left: 10px">
                               <dxe:ASPxButton ID="BtnSaveProductDtls" runat="server" AutoPostBack="False" BackColor="Transparent"
                                   ClientInstanceName="cBtnSaveProductDtls" Height="60px" ToolTip="Save Entered Data"
                                   Width="70px">
                                   <ClientSideEvents Click="function(s, e) {ProductDtlsSave();}" />
                                   <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_save.png"
                                       Repeat="NoRepeat" />
                                   <Border BorderColor="Black" BorderStyle="None" />
                               </dxe:ASPxButton>
                           </div>
                           <div class="right" id="DivBtnEditProductDtls">
                               <dxe:ASPxButton ID="BtnEditProductDtls" runat="server" AutoPostBack="False" BackColor="Transparent"
                                  ClientInstanceName="cBtnEditProductDtls" Height="60px" ToolTip="Edit Entered Data" Width="70px">
                                   <ClientSideEvents Click="function(s, e) {ProductDtlsEdit();}" />
                                   <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/Edit.jpg"
                                      Repeat="NoRepeat" />
                                   <Border BorderStyle="None" />
                               </dxe:ASPxButton>
                           </div>
                             <div id="Row581" class="right">
                                 <dxe:ASPxButton ID="BtnPrvs3" runat="server" AutoPostBack="False" ClientInstanceName="cBtnPrvs3" ToolTip="Back To Previous" Width="70px" BackColor="Transparent" Height="60px">
                                     <ClientSideEvents Click="function(s, e) {ProductDtlsPrevious();}" />
                                     <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_rewind.png"
                                         Repeat="NoRepeat" />
                                     <Border BorderColor="Transparent" BorderStyle="None" />
                                 </dxe:ASPxButton>
                             </div>
                             
                              <asp:HiddenField ID="TxtGeoCode_hidden" runat="server" /> 
                               <asp:HiddenField ID="TxtEduDegree_hidden" runat="server" /> 
                                <asp:HiddenField ID="TxtLang_hidden" runat="server" /> 
                                 <asp:HiddenField ID="TxtStaffRel_hidden" runat="server" /> 
                                  <asp:HiddenField ID="TxtSecAccess_hidden" runat="server" /> 
                                   <asp:HiddenField ID="TxtBoCatg_hidden" runat="server" /> 
                                    <asp:HiddenField ID="TxtBenTaxStatus_hidden" runat="server" />
                                    <asp:HiddenField ID="TxtDividndCurncy_hidden" runat="server" />
                                    <asp:HiddenField ID="TxtBoSubstatus_hidden" runat="server" /> 
                                    <asp:HiddenField ID="TxtClrngCorpID_hidden" runat="server" />
                                    <asp:HiddenField ID="TxtBOStatemntCycle_hidden" runat="server" />
                                    <asp:HiddenField ID="TxtBENFBnkAcType_hidden" runat="server" /> 
                                    <asp:HiddenField ID="TxtBENFBnkCCY_hidden" runat="server" /> 
                                    <asp:HiddenField ID="TxtDIVNDBnkAcType_hidden" runat="server" /> 
                                    <asp:HiddenField ID="TxtDIVNDBnkCCY_hidden" runat="server" /> 
                             <br class="clear"/>                             <br class="clear"/>
                             <div style="MARGIN-TOP: 10px; FONT-SIZE: 9pt; MARGIN-BOTTOM: 30px; WIDTH: 800px" 
                                   id="DivPrdctDtlAlrt" class="Success BtmMargin">
                                     <span style="color: #0066ff">Product Details</span> Submitted Successfully!!!!
                                   <br />
                                <div class="left" style="margin-right: 2px">Click</div> <div class="left" style="width:23px; background-position: center center; background-image: url(../../../../CentralData/Images/Small_Edit.jpg);height: 23px; background-color: transparent;"></div> <div class="left" style="margin-left: 2px; margin-right: 2px">
                                    To Edit The Section<span style="color: #0066ff"> Or </span>Click</div> <div class="left" style="width:22px; background-position: center center; background-image: url(../../../../CentralData/Images/Small_blue_foward.png); height: 22px; background-color: transparent;"></div> <div class="left" style="margin-left: 2px">
                                    To Go To the <span style="color: #0066ff">POA Details</span> <span style="color: #0066ff">Or</span> Click&nbsp;</div>
                                <div class="left" style="width:22px; background-position: center center; background-image: url(../../../../CentralData/Images/Small_blue_rewind.png); height: 22px; background-color: transparent;">
                                </div>
                                <div class="left" style="margin-left: 2px; width: 267px;">
                                    To Go Back To the <span style="color: #3366ff">Third Account Holder Details</span>..</div>
                            </div>
                       </dxp:panelcontent>
                   </PanelCollection>
                  <ClientSideEvents EndCallback="function (s, e) {CbpProductDtls_EndCallBack();}" />
              </dxcp:ASPxCallbackPanel>
         </div>
         
         <div id="Div_POADetails">
          <dxcp:ASPxCallbackPanel ID="CbpPOADtls" runat="server" ClientInstanceName="cCbpPOADtls"
                OnCallback="CbpPOADtls_Callback" BackColor="Transparent" Width="100%">
           <PanelCollection>
           <dxp:panelcontent runat="server"> 
           
              <div class="DivHeader" style="width: 100%" >&nbsp; POA DETAILS 
               </div>
               
                <div id="Row59" class="Row">
                     <div id="Row59_Col0" class="LFloat_Lable Leftdiv">
                         <span style="font-size: 10pt; color: #ff0000"></span>POA ID: <span style="font-size: 10pt;
                             color: #ff0000">** <span style="color: blue">**</span></span></div>
                     <div id="Row59_Col1" class="LFloat_Row FontChange" style="height: 25px">
                         <asp:TextBox ID="TxtPoaId" runat="server" Width="145px"></asp:TextBox>
                     </div>
                     <div id="Row59_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                         <span style="font-size: 10pt; color: #ff0000"></span>POA Registration Number: <span
                             style="font-size: 10pt; color: #ff0000">**</span></div>
                     <div id="Row59_Col3" class="LFloat_Row FontChange" style="height: 25px">
                        <dxe:ASPxTextBox ID="TxtPoaRegNo" runat="server" ClientInstanceName="cTxtPoaRegNo"
                            Width="150px">
                        </dxe:ASPxTextBox>
                     </div>
                 </div>
                 <div id="Row60" class="Row">
                     <div id="Row60_Col0" class="LFloat_Lable Leftdiv">
                         <span style="font-size: 10pt; color: #ff0000"></span>Purpose Code: <span style="font-size: 10pt;
                             color: #ff0000">**</span></div>
                     <div id="Row60_Col1" class="LFloat_Row FontChange" style="height: 25px">
                        <dxe:ASPxComboBox ID="ComboPurposeCode" runat="server" ClientInstanceName="cComboPurposeCode"
                                 EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" SelectedIndex="0"
                                 ValueType="System.String" Width="150px">
                             <Items>
                                 <dxe:ListEditItem  Text="First Holder" Value="1"/>
                                 <dxe:ListEditItem  Text="Second Holder" Value="2"/>
                                 <dxe:ListEditItem  Text="Third Holder" Value="3"/>
                             </Items>
                         </dxe:ASPxComboBox>  
                     </div>
                     <div id="Row60_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                         <span style="font-size: 10pt; color: #ff0000"></span>GPA/BPA: <span style="font-size: 10pt;
                             color: #ff0000">**</span></div>
                     <div id="Row60_Col3" class="LFloat_Row FontChange" style="height: 25px">
                       <%-- <dxe:ASPxTextBox ID="TxtGpaBpa" runat="server" ClientInstanceName="cTxtGpaBpa"
                            Width="150px">
                        </dxe:ASPxTextBox>--%>
                        <dxe:ASPxComboBox ID="ComboGpaBpa" runat="server" ClientInstanceName="cComboGpaBpa"
                                 EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" SelectedIndex="0"
                                 ValueType="System.String" Width="150px">
                             <Items>
                                 <dxe:ListEditItem  Text="GPA" Value="G"/>
                                 <dxe:ListEditItem  Text="BPA" Value="B"/>
                             </Items>
                         </dxe:ASPxComboBox>  
                     </div>
                 </div>
                 
                 <div id="Row61" class="Row">
                     <div id="Row61_Col0" class="LFloat_Lable Leftdiv">
                         <span style="font-size: 10pt; color: #ff0000"></span>Form Date: <span style="font-size: 10pt;
                             color: #ff0000">**</span></div>
                     <div id="Row61_Col1" class="LFloat_Row FontChange" style="height: 25px">
                         <dxe:ASPxDateEdit ID="FormDt" runat="server" ClientInstanceName="cFormDt" DateOnError="Today"
                                  EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="150px"
                                  Font-Size="11px" TabIndex="0">
                              <ClientSideEvents  LostFocus="function(s,e){SetValidDate(cFormDt);}"/>
                         </dxe:ASPxDateEdit>
                     </div>
                     <div id="Row61_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                        To Date:
                     </div>
                     <div id="Row61_Col3" class="LFloat_Row FontChange" style="height: 25px">
                        <dxe:ASPxDateEdit ID="ToDt" runat="server" ClientInstanceName="cToDt" DateOnError="Today"
                                  EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="150px"
                                  Font-Size="11px" TabIndex="0">
                            <ClientSideEvents LostFocus="function(s,e){SetValidDate(cToDt);}"/>                                  
                         </dxe:ASPxDateEdit>
                     </div>
                 </div>
                 <div id="Row62" class="Row">
                     <div id="Row62_Col0" class="LFloat_Lable Leftdiv">
                       User Field1:
                     </div>
                     <div id="Row62_Col1" class="LFloat_Row FontChange" style="height: 25px">
                         <dxe:ASPxTextBox ID="TxtUsrFld1" runat="server" ClientInstanceName="cTxtUsrFld1"
                            Width="150px">
                        </dxe:ASPxTextBox> 
                     </div>
                     <div id="Row62_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                       User Field2:
                     </div>
                     <div id="Row62_Col3" class="LFloat_Row FontChange" style="height: 25px">
                        <dxe:ASPxTextBox ID="TxtUsrFld2" runat="server" ClientInstanceName="cTxtUsrFld2"
                            Width="150px">
                        </dxe:ASPxTextBox>
                     </div>
                 </div>
                 <div id="Row63" class="Row">
                     <div id="Row63_Col0" class="LFloat_Lable Leftdiv">
                       Remarks:
                     </div>
                     <div id="Row63_Col1" class="LFloat_Row FontChange" style="height: 25px">
                         <dxe:ASPxTextBox ID="TxtRemarks" runat="server" ClientInstanceName="cTxtRemarks"
                            Width="150px">
                        </dxe:ASPxTextBox> 
                     </div>
                 </div>
                 <div id="DivBtnNextPOADtls" class="right RightMargin">
                     <dxe:ASPxButton ID="BtnNextPOADtls" runat="server" AccessKey="i" AutoPostBack="False"
                         ClientInstanceName="cBtnNextPOADtls" ToolTip="Proceed To Next"
                         Width="65px" BackColor="Transparent" Height="60px">
                         <ClientSideEvents Click="function(s, e) {POANext();}" />
                         <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_foward.png"
                             Repeat="NoRepeat" />
                         <Border BorderColor="Transparent" BorderStyle="None" />
                     </dxe:ASPxButton>
                 </div>
               <div id="DivBtnSavePOADtls" class="right" style="font-size: 12pt; margin-left: 2px">
                   <dxe:ASPxButton ID="BtnSavePOADtls" runat="server" AutoPostBack="False" BackColor="Transparent"
                       ClientInstanceName="cBtnSavePOADtls" Height="60px" ToolTip="Save Entered Data"
                       Width="65px">
                       <ClientSideEvents Click="function(s, e) {POASave();}" />
                       <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_save.png"
                           Repeat="NoRepeat" />
                       <Border BorderColor="Black" BorderStyle="None" />
                   </dxe:ASPxButton>
               </div>
               <div class="right" id="DivBtnEditPOADtls">
                   <dxe:ASPxButton ID="BtnEditPOADtls" runat="server" AutoPostBack="False" BackColor="Transparent"
                                  ClientInstanceName="cBtnEditPOADtls" Height="60px" ToolTip="Edit Entered Data" Width="70px">
                       <ClientSideEvents Click="function(s, e) {POAEdit();}" />
                       <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/Edit.jpg"
                                      Repeat="NoRepeat" />
                       <Border BorderStyle="None" />
                   </dxe:ASPxButton>
               </div>
                 
                 <div id="Row64" class="right" style="font-size: 12pt; margin-right: 10px;">
                     <dxe:ASPxButton ID="BtnPrvs4" runat="server" AutoPostBack="False" ClientInstanceName="cBtnPrvs4" ToolTip="Back To Previous" Width="70px" BackColor="Transparent" Height="60px">
                         <ClientSideEvents Click="function(s, e) {POAPrevious();}" />
                         <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_rewind.png"
                             Repeat="NoRepeat" />
                         <Border BorderColor="Transparent" BorderStyle="None" />
                     </dxe:ASPxButton>
                 </div>
                     <div id="Row59_Col4" class="right" style="margin-right: 10px" onclick="return Row59_Col4_onclick()">
                         <dxe:ASPxCheckBox ID="CbSkip3" runat="server" ClientInstanceName="cCbSkip3"
                                    ToolTip="Skip POA Details" Checked="False" Text="Skip This Section">
                             <ClientSideEvents CheckedChanged="OnSkipPOA" />
                         </dxe:ASPxCheckBox>
                     </div>
                     
                     <asp:HiddenField ID="TxtPoaId_hidden" runat="server" /> 
                  <div style="MARGIN-TOP: 10px; FONT-SIZE: 9pt; MARGIN-BOTTOM: 30px; WIDTH: 862px" 
                   id="DivPOAAlrt" class="Success BtmMargin" >
                     <span style="color: #3366ff">POA Details</span> Submitted Successfully!!!!
                   <br />
                       <div class="left" style="margin-right: 2px">Click</div> <div class="left" style="width:23px; background-position: center center; background-image: url(../../../../CentralData/Images/Small_Edit.jpg);height: 23px; background-color: transparent;"></div> <div class="left" style="margin-left: 2px; margin-right: 2px">
                            To Edit The Section<span style="color: #0066ff"> Or </span>Click</div> <div class="left" style="width:22px; background-position: center center; background-image: url(../../../../CentralData/Images/Small_blue_foward.png); height: 22px; background-color: transparent;"></div> <div class="left" style="margin-left: 2px">
                            To Go To the <span style="color: #0066ff">Nominee Name And Address</span> <span style="color: #0066ff">Or</span> Click&nbsp;</div>
                        <div class="left" style="width:22px; background-position: center center; background-image: url(../../../../CentralData/Images/Small_blue_rewind.png); height: 22px; background-color: transparent;">
                        </div>
                        <div class="left" style="margin-left: 2px">
                            To Go Back To the <span style="color: #0066ff">Product Details</span>..</div>
                 </div>
              </dxp:panelcontent>
             </PanelCollection>
            <ClientSideEvents EndCallback="function (s, e) {CbpPOADtls_EndCallBack();}" />
          </dxcp:ASPxCallbackPanel>  
         </div>
          
         <div id="Div_NomineeNameAdrs"  style="width:99%">
           <dxcp:ASPxCallbackPanel ID="CbpNomineeNameAdrs" runat="server" BackColor="Transparent"
                     ClientInstanceName="cCbpNomineeNameAdrs" OnCallback="CbpNomineeNameAdrs_Callback" Width="100%">
                     <PanelCollection>
                         <dxp:PanelContent runat="server">
                             <div class="DivHeader" style="width: 100%">
                                 &nbsp; NOMINEE NAME AND ADDRESS
                             </div>
                             <div id="Row66" class="Row">
                                 <div id="Row66_Col0" class="LFloat_Lable Leftdiv ">
                                     Title:
                                 </div>
                                 <div id="Row66_Col1" class="LFloat_Row" style="height: 25px">
                                     <dxe:ASPxTextBox ID="TxtTitl4" runat="server" ClientInstanceName="cTxtTitl4"
                                         Width="100px">
                                         <ClientSideEvents TextChanged="SkipNominee"/>
                                     </dxe:ASPxTextBox>
                                 </div>
                                 <div id="Row66_Col2" class="right" style="margin-right: 10px;">
                                     <span style="font-size: 10pt; color: #ff0000">**</span> <strong><span style="font-size: 8pt; color: #ff0000">
                                         Mandatory Fields To Be Filled</span> </strong>
                                 </div>
                             </div>
                             <div id="Row67" class="Row">
                                 <div id="Row67_Col0" class="LFloat_Lable Leftdiv " style="height: 38px">
                                     <span class="Spanclass"></span> Name Of The Applicant: <span style="font-size: 10pt;
                                         color: #ff0000">**</span>
                                 </div>
                                 <div id="Row67_Col1" class="LFloat_Row " style="height: 38px; text-align: center">
                                     <dxe:ASPxTextBox ID="TxtFName3" runat="server" ClientInstanceName="cTxtFName3"
                                         HorizontalAlign="Left" Width="155px">
                                         <ClientSideEvents TextChanged="SkipNominee"/>
                                     </dxe:ASPxTextBox>
                                     <span style="font-size: 8pt">[First Name]</span>
                                 </div> 
                                 <div id="Row67_Col2" class="LFloat_Row DivName" style="height: 38px">
                                     <dxe:ASPxTextBox ID="TxtMName3" runat="server" ClientInstanceName="cTxtMName3"
                                         HorizontalAlign="Left" Width="155px">
                                         <ClientSideEvents TextChanged="SkipNominee"/>
                                     </dxe:ASPxTextBox>
                                     <span style="font-size: 8pt">[Middle Name]</span>
                                     
                                 </div>
                                 <div id="Row67_Col3" class="LFloat_Row DivName" style="height: 38px">
                                     <dxe:ASPxTextBox ID="TxtLName3" runat="server" ClientInstanceName="cTxtLName3"
                                         HorizontalAlign="Left" Width="155px">
                                         <ClientSideEvents TextChanged="SkipNominee"/>
                                     </dxe:ASPxTextBox>
                                     <span style="font-size: 8pt">[Last Name]</span>
                                 </div>
                             </div>
                             <div id="Row68" class="Row">
                                 <div id="Row68_Col0" class="LFloat_Lable Leftdiv ">
                                     Suffix:
                                 </div>
                                 <div id="Row68_Col1" class="LFloat_Row" style="height: 25px">
                                     <dxe:ASPxTextBox ID="TxtSufx4" runat="server" ClientInstanceName="cTxtSufx4"
                                         Width="100px">
                                          <ClientSideEvents TextChanged="SkipNominee"/>
                                     </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row69" class="Row">
                                 <div id="Row69_Col0" class="LFloat_Lable Leftdiv">
                                     <span class="Spanclass"></span>Father's / Spouse Name:
                                 </div>
                                 <div id="Row69_Col1" class="LFloat_Row" style="height: 25px">
                                     <dxe:ASPxTextBox ID="TxtFthrName3" runat="server" ClientInstanceName="cTxtFthrName3"
                                         Width="500px">
                                          <ClientSideEvents TextChanged="SkipNominee"/>
                                     </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row690" class="Row">
                                <div id="Row690_Col0" class="LFloat_Lable Leftdiv">
                                    Date Of Birth:
                                </div>
                                <div id="Row690_Col1" class="LFloat_Row" style="height: 25px">
                                    <dxe:ASPxDateEdit ID="dobDt1" runat="server" ClientInstanceName="cdobDt1" DateOnError="Today"
                                        EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="150px"
                                        Font-Size="11px">
                                        <ClientSideEvents  LostFocus="function(s,e){SetValidDate(cdobDt1);}"/>
                                    </dxe:ASPxDateEdit>
                                </div>
                             </div>
                             <div id="Row70" class="Row">
                                            <div id="Row70_Col0" class="LFloat_Lable Leftdiv">
                                                <span class="Spanclass"></span>Address:<span style="font-size: 10pt;
                                                    color: #ff0000">**</span>&nbsp;
                                            </div>
                                            <div id="Row70_Col1" class="LFloat_Row FontChange BtmMargin" style="width: 56%">
                                                <div style="margin-bottom: 2px">
                                                    <span style="font-size: 8pt">[House No]</span>
                                                    <dxe:ASPxTextBox ID="TxtNomineeAdrs1" runat="server" ClientInstanceName="cTxtNomineeAdrs1"
                                                        HorizontalAlign="left" Width="460px">
                                                        <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtAddress1);}" 
                                             TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                             </ClientSideEvents>--%>
                                                    </dxe:ASPxTextBox>
                                                </div>
                                                <div style="margin-bottom: 2px">
                                                    <span style="font-size: 8pt">[Street Name]</span>
                                                    <dxe:ASPxTextBox ID="TxtNomineeAdrs2" runat="server" ClientInstanceName="cTxtNomineeAdrs2"
                                                        HorizontalAlign="left" Width="460px">
                                                        <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtAddress2);}" 
                                             TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                             </ClientSideEvents>--%>
                                                    </dxe:ASPxTextBox>
                                                </div>
                                                <div style="margin-bottom: 4px">
                                                    <span style="font-size: 8pt">[Area Name]</span>
                                                    <dxe:ASPxTextBox ID="TxtNomineeAdrs3" runat="server" ClientInstanceName="cTxtNomineeAdrs3"
                                                        HorizontalAlign="left" Width="460px">
                                                        <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtAddress3);}" 
                                             TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                             </ClientSideEvents>--%>
                                                    </dxe:ASPxTextBox>
                                                </div>
                                                <div class="left" style="width: 99%">
                                                    <div class="left" style="height: 25px">
                                                        City/Town/Village :
                                                    </div>
                                                    <div class="left" style="height: 25px">
                                                        <dxe:ASPxComboBox ID="ComboNomineeCity" runat="server" ClientInstanceName="cComboNomineeCity" EnableIncrementalFiltering="True"
                                                            Font-Size="Small" SelectedIndex="0" ValueType="System.String" Width="150px">
                                                        </dxe:ASPxComboBox>
                                                    </div>
                                                    <div class="left" style="height: 25px">
                                                        PinCode :
                                                    </div>
                                                    <div class="left" style="height: 25px">
                                                        <dxe:ASPxTextBox ID="TxtNomineePin" runat="server" ClientInstanceName="cTxtNomineePin" Width="153px"
                                                            HorizontalAlign="right">
                                                            <MaskSettings Mask="<0..9999999999>" />
                                                        </dxe:ASPxTextBox>
                                                    </div>
                                                </div>
                                                <div class="left" style="height: 30px">
                                                    <dxe:ASPxComboBox ID="ComboNomineeState" runat="server" ClientInstanceName="cComboNomineeState"
                                                        EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                        Width="150px">
                                                        <DropDownButton Text="State">
                                                        </DropDownButton>
                                                   </dxe:ASPxComboBox>
                                                </div>
                                               
                                                <div class="left" style="height: 30px; margin-left: 4px;">
                                                    <dxe:ASPxComboBox ID="ComboNomineeCountry" runat="server" ClientInstanceName="cComboNomineeCountry"
                                                        EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                        Width="150px">
                                                        <DropDownButton Text="Country">
                                                        </DropDownButton>
                                                    </dxe:ASPxComboBox>
                                                </div>
                                            </div>
                                        </div>   
                                        <div class="Row">
                                            <div id="Row701" class="LFloat_Lable Leftdiv" style="height: 70px">
                                                Contact&nbsp; Details:</div>
                                            <div id="Row702" class="LFloat_Row FontChange" style="width: 57%; height: 70px;">
                                                <div class="left" style="width: 99%">
                                                    <div class="left" style="height: 25px">
                                                        Tel(Off) &nbsp;:
                                                    </div>
                                                    <div class="left" style="height: 25px">
                                                        <dxe:ASPxTextBox ID="TxtTelOfc1" runat="server" ClientInstanceName="cTxtTelOfc1" MaxLength="11"
                                                            HorizontalAlign="Right" Width="120px">
                                                            <ClientSideEvents LostFocus="function(s, e) {CheckTheLeast(cTxtTelOfc1.GetText());}" />
                                                            <MaskSettings Mask="<0..99999999999>" />
                                                        </dxe:ASPxTextBox>
                                                    </div>
                                                    <div class="left" style="height: 25px">
                                                        &nbsp;Tel(Res) &nbsp;&nbsp; :
                                                    </div>
                                                    <div class="left" style="height: 25px">
                                                        <dxe:ASPxTextBox ID="TxtTelRes1" runat="server" ClientInstanceName="cTxtTelRes1" MaxLength="11"
                                                            HorizontalAlign="Right" Width="120px">
                                                            <ClientSideEvents LostFocus="function(s, e) {CheckTheLeast(cTxtTelRes1.GetText());}" />
                                                            <MaskSettings Mask="<0..99999999999>" />
                                                        </dxe:ASPxTextBox>
                                                    </div>
                                                </div>
                                                <div class="left" style="width: 99%">
                                                    <div class="left" style="height: 25px">
                                                        Fax No.&nbsp; :
                                                    </div>
                                                    <div class="left" style="height: 25px">
                                                        <dxe:ASPxTextBox ID="TxtFaxNo1" runat="server" ClientInstanceName="cTxtFaxNo1" HorizontalAlign="Right"
                                                            Width="120px">
                                                            <MaskSettings Mask="<0..99999999999>" />
                                                        </dxe:ASPxTextBox>
                                                    </div>
                                                    <div class="left" style="height: 25px">
                                                        Mobile No. :
                                                    </div>
                                                    <div class="left" style="height: 25px">
                                                        <dxe:ASPxTextBox ID="TxtMobileNo1" runat="server" ClientInstanceName="cTxtMobileNo1"
                                                            MaxLength="10" HorizontalAlign="Right" Width="120px">
                                                            <ClientSideEvents LostFocus="function(s, e) {CheckTheLeast(cTxtMobileNo1.GetText());}" />
                                                            <MaskSettings Mask="<0..9999999999>" />
                                                        </dxe:ASPxTextBox>
                                                    </div>
                                                </div>
                                                <div class="left" style="height: 25px">
                                                    Email ID:
                                                </div>
                                                <div class="left" style="height: 25px">
                                                    <dxe:ASPxTextBox ID="TxtEmailID1" runat="server" ClientInstanceName="cTxtEmailID1" Width="300px">
                                                        <ClientSideEvents LostFocus="function(s, e) {verifyEmail(cTxtEmailID1);}" />
                                                    </dxe:ASPxTextBox>
                                                </div>
                                            </div>
                                        </div>
                               <div id="Row703" class="Row">
                                 <div id="Row703_Col0" class="LFloat_Lable Leftdiv" style="height: 35px">
                                     PAN / GIR: <span style="font-size: 10pt; color: #ff0000">**</span><span style="font-size: 8pt">
                                     </span>
                                 </div>
                                 <div id="Row703_Col1" class="LFloat_Row FontChange" style="height: 35px">
                                     <dxe:ASPxTextBox ID="TxtPan3" runat="server" ClientInstanceName="cTxtPan3" MaxLength="10"
                                         Width="171px">
                                         <ClientSideEvents TextChanged="SkipNominee" KeyUp="function(s,e){s.SetText(s.GetValue().toUpperCase());}" LostFocus="function(s, e) {verifyPanCrdNo(cTxtPan3);}"/>
                                     </dxe:ASPxTextBox>
                                 </div>
                                 
                             </div>
                             <div id="Row704" class="Row">
                                <div id="Row704_Col0" class="LFloat_Lable Leftdiv" style="height: 37px">
                                    Unique Identification Number(UID) / Adhaar (If Any):</div>
                                <div id="Row704_Col1" class="LFloat_Row" style="height: 37px">
                                    <dxe:ASPxTextBox ID="TxtUIN4" runat="server" ClientInstanceName="cTxtUIN4" MaxLength="12"
                                        Width="170px">
                                    </dxe:ASPxTextBox>
                                </div>
                             </div>
                             <div id="Row705" class="Row">
                                 <div id="Row705_Col0" class="LFloat_Lable Leftdiv" style="height: 37px">
                                     IT Circle/Ward/District:</div>
                                 <div id="Row705_Col1" class="LFloat_Row" style="height: 37px">
                                     <dxe:ASPxTextBox ID="TxtDistrict4" runat="server" ClientInstanceName="cTxtDistrict4" 
                                         MaxLength="12" Width="170px">
                                          <ClientSideEvents TextChanged="SkipNominee"/>
                                     </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <br /> <br />
                             <div id="DivBtnNextNomineeNameAdrs" class="right RightMargin">
                                 <dxe:ASPxButton ID="BtnNextNomineeNameAdrs" runat="server" AccessKey="i" AutoPostBack="False"
                                     ClientInstanceName="cBtnNextNomineeNameAdrs" ToolTip="Proceed To Next"
                                     Width="70px" BackColor="Transparent" Height="60px">
                                     <ClientSideEvents Click="function(s, e) {NomineeNext();}" />
                                     <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_foward.png"
                                         Repeat="NoRepeat" />
                                     <Border BorderColor="Transparent" BorderStyle="None" />
                                 </dxe:ASPxButton>
                             </div>
                             <div id="DivBtnSaveNomineeNameAdrs" class="right" style="font-size: 12pt; margin-left: 10px">
                                 <dxe:ASPxButton ID="BtnSaveNomineeNameAdrs" runat="server" AutoPostBack="False" BackColor="Transparent"
                                     ClientInstanceName="cBtnSaveNomineeNameAdrs" Height="60px" ToolTip="Save Entered Data"
                                     Width="70px">
                                     <ClientSideEvents Click="function(s, e) {NomineeSave();}" />
                                     <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_save.png"
                                         Repeat="NoRepeat" />
                                     <Border BorderColor="Black" BorderStyle="None" />
                                 </dxe:ASPxButton>
                             </div>
                             <div class="right" id="DivBtnEditNomineeNameAdrs">
                                 <dxe:ASPxButton ID="BtnEditNomineeNameAdrs" runat="server" AutoPostBack="False" BackColor="Transparent"
                                  ClientInstanceName="cBtnEditNomineeNameAdrs" Height="60px" ToolTip="Edit Entered Data" Width="70px">
                                     <ClientSideEvents Click="function(s, e) {NomineeEdit();}" />
                                     <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/Edit.jpg"
                                      Repeat="NoRepeat" />
                                     <Border BorderStyle="None" />
                                 </dxe:ASPxButton>
                             </div>
                             <div id="DivBtnPrvsNomineeNameAdrs" class="right">
                                 <dxe:ASPxButton ID="BtnPrvsNomineeNameAdrs" runat="server" AutoPostBack="False" ClientInstanceName="cBtnPrvs2" ToolTip="Bck To Previous" Width="70px" BackColor="Transparent" Height="60px">
                                     <ClientSideEvents Click="function(s, e) {NomineePrevious();}" />
                                     <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_rewind.png"
                                         Repeat="NoRepeat" />
                                     <Border BorderColor="Transparent" BorderStyle="None" />
                                 </dxe:ASPxButton>
                             </div>
                             <div class="right" style="margin-right: 4px">
                                 <dxe:ASPxCheckBox ID="CbSkip4" runat="server" ClientInstanceName="cCbSkip4"
                                ToolTip="Skip Nominee Name And Address" Checked="False" Text="Skip This Section">
                                     <ClientSideEvents CheckedChanged="Skip4CheckedChanged" />
                                 </dxe:ASPxCheckBox>
                             </div>
                             <br class="clear"/>
                             <br class="clear"/>
                             <div style="MARGIN-TOP: 10px; FONT-SIZE: 9pt; MARGIN-BOTTOM: 30px; WIDTH: 845px" 
                               id="DivNomineeNameAdrsAlrt" class="Success BtmMargin">
                                 <span style="color: #0066ff">Nominee Name and Address</span> Submitted Successfully!!!!
                               <br />
                             <div class="left" style="margin-right: 2px">Click</div> <div class="left" style="width:23px; background-position: center center; background-image: url(../../../../CentralData/Images/Small_Edit.jpg);height: 23px; background-color: transparent;"></div> <div class="left" style="margin-left: 2px; margin-right: 2px">
                                To Edit The Section<span style="color: #0066ff"> Or </span>Click</div> <div class="left" style="width:22px; background-position: center center; background-image: url(../../../../CentralData/Images/Small_blue_foward.png); height: 22px; background-color: transparent;"></div> <div class="left" style="margin-left: 2px">
                                To Go To the <span style="color: #0066ff">Gurdian Name &amp; Address</span> <span style="color: #0066ff">Or</span> Click&nbsp;</div>
                            <div class="left" style="width:22px; background-position: center center; background-image: url(../../../../CentralData/Images/Small_blue_rewind.png); height: 22px; background-color: transparent;">
                        </div>
                        <div class="left" style="margin-left: 2px">
                            To Go Back To the <span style="color: #0066ff">POA Details</span>..</div>
                             </div>
                         </dxp:PanelContent>
                     </PanelCollection>
                     <ClientSideEvents EndCallback="function (s, e) {CbpNomineeNameAdrs_EndCallBack();}" />
                 </dxcp:ASPxCallbackPanel>
         </div>
         
         <div id="Div_GurdianNameAdrs"  style="width:99%">
           <dxcp:ASPxCallbackPanel ID="CbpGurdianNameAdrs" runat="server" BackColor="Transparent"
                     ClientInstanceName="cCbpGurdianNameAdrs" OnCallback="CbpGurdianNameAdrs_Callback" Width="100%">
                     <PanelCollection>
                         <dxp:PanelContent runat="server">
                             <div class="DivHeader" style="width: 100%">
                                 &nbsp; GURDIAN NAME AND ADDRESS
                             </div>
                             <div id="Row71" class="Row">
                                 <div id="Row71_Col0" class="LFloat_Lable Leftdiv ">
                                     Title:
                                 </div>
                                 <div id="Row71_Col1" class="LFloat_Row" style="height: 25px">
                                     <dxe:ASPxTextBox ID="TxtTitl5" runat="server" ClientInstanceName="cTxtTitl5"
                                         Width="100px">
                                         <ClientSideEvents TextChanged="SkipGurdian"/>
                                     </dxe:ASPxTextBox>
                                 </div>
                                 <div id="Row71_Col2" class="right" style="margin-right: 10px;">
                                     <span style="font-size: 10pt; color: #ff0000">**</span> <strong><span style="font-size: 8pt; color: #ff0000">
                                         Mandatory Fields To Be Filled</span> </strong>
                                 </div>
                             </div>
                             <div id="Row72" class="Row">
                                 <div id="Row72_Col0" class="LFloat_Lable Leftdiv " style="height: 38px">
                                     <span class="Spanclass"></span> Name Of The Applicant: <span style="font-size: 10pt;
                                         color: #ff0000">**</span>
                                 </div>
                                 <div id="Row72_Col1" class="LFloat_Row " style="height: 38px; text-align: center">
                                     <dxe:ASPxTextBox ID="TxtFName4" runat="server" ClientInstanceName="cTxtFName4"
                                         HorizontalAlign="Left" Width="155px">
                                         <ClientSideEvents TextChanged="SkipGurdian"/>
                                     </dxe:ASPxTextBox>
                                     <span style="font-size: 8pt">[First Name]</span>
                                 </div>
                                 <div id="Row72_Col2" class="LFloat_Row DivName" style="height: 38px">
                                     <dxe:ASPxTextBox ID="TxtMName4" runat="server" ClientInstanceName="cTxtMName4"
                                         HorizontalAlign="Left" Width="155px">
                                         <ClientSideEvents TextChanged="SkipGurdian"/>
                                     </dxe:ASPxTextBox>
                                     <span style="font-size: 8pt">[Middle Name]</span>
                                     
                                 </div>
                                 <div id="Row72_Col3" class="LFloat_Row DivName" style="height: 38px">
                                     <dxe:ASPxTextBox ID="TxtLName4" runat="server" ClientInstanceName="cTxtLName4"
                                         HorizontalAlign="Left" Width="155px">
                                         <ClientSideEvents TextChanged="SkipGurdian"/>
                                     </dxe:ASPxTextBox>
                                     <span style="font-size: 8pt">[Last Name]</span>
                                 </div>
                             </div>
                             <div id="Row73" class="Row">
                                 <div id="Row73_Col0" class="LFloat_Lable Leftdiv ">
                                     Suffix:
                                 </div>
                                 <div id="Row73_Col1" class="LFloat_Row" style="height: 25px">
                                     <dxe:ASPxTextBox ID="TxtSufx5" runat="server" ClientInstanceName="cTxtSufx5"
                                         Width="100px">
                                          <ClientSideEvents TextChanged="SkipGurdian"/>
                                     </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row74" class="Row">
                                 <div id="Row74_Col0" class="LFloat_Lable Leftdiv">
                                     <span class="Spanclass"></span>Father's / Spouse Name:
                                 </div>
                                 <div id="Row74_Col1" class="LFloat_Row" style="height: 25px">
                                     <dxe:ASPxTextBox ID="TxtFthrName4" runat="server" ClientInstanceName="cTxtFthrName4"
                                         Width="500px">
                                          <ClientSideEvents TextChanged="SkipGurdian"/>
                                     </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row740" class="Row">
                                <div id="Row740_Col0" class="LFloat_Lable Leftdiv">
                                    Date Of Birth:
                                        
                                </div>
                                <div id="Row740_Col1" class="LFloat_Row" style="height: 25px">
                                    <dxe:ASPxDateEdit ID="dobDt2" runat="server" ClientInstanceName="cdobDt2" DateOnError="Today"
                                        EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="150px"
                                        Font-Size="11px">
                                        <ClientSideEvents  LostFocus="function(s,e){SetValidDate(cdobDt2);}"/>
                                    </dxe:ASPxDateEdit>
                                </div>
                             </div>
                             <div id="Row75" class="Row">
                                            <div id="Row75_Col0" class="LFloat_Lable Leftdiv">
                                                <span class="Spanclass"></span>Address:<span style="font-size: 10pt;
                                                    color: #ff0000">**</span>&nbsp;
                                            </div>
                                            <div id="Row75_Col1" class="LFloat_Row FontChange BtmMargin" style="width: 57%">
                                                <div style="margin-bottom: 2px">
                                                    <span style="font-size: 8pt">[House No]</span>
                                                    <dxe:ASPxTextBox ID="TxtGurdianAdrs1" runat="server" ClientInstanceName="cTxtGurdianAdrs1"
                                                        HorizontalAlign="left" Width="460px">
                                                        <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtAddress1);}" 
                                             TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                             </ClientSideEvents>--%>
                                                    </dxe:ASPxTextBox>
                                                </div>
                                                <div style="margin-bottom: 2px">
                                                    <span style="font-size: 8pt">[Street Name]</span>
                                                    <dxe:ASPxTextBox ID="TxtGurdianAdrs2" runat="server" ClientInstanceName="cTxtGurdianAdrs2"
                                                        HorizontalAlign="left" Width="460px">
                                                        <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtAddress2);}" 
                                             TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                             </ClientSideEvents>--%>
                                                    </dxe:ASPxTextBox>
                                                </div>
                                                <div style="margin-bottom: 4px">
                                                    <span style="font-size: 8pt">[Area Name]</span>
                                                    <dxe:ASPxTextBox ID="TxtGurdianAdrs3" runat="server" ClientInstanceName="cTxtGurdianAdrs3"
                                                        HorizontalAlign="left" Width="460px">
                                                        <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtAddress3);}" 
                                             TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                             </ClientSideEvents>--%>
                                                    </dxe:ASPxTextBox>
                                                </div>
                                                <div class="left" style="width: 99%">
                                                    <div class="left" style="height: 25px">
                                                        City/Town/Village :
                                                    </div>
                                                    <div class="left" style="height: 25px">
                                                        <dxe:ASPxComboBox ID="ComboGurdianCity" runat="server" ClientInstanceName="cComboGurdianCity" EnableIncrementalFiltering="True"
                                                            Font-Size="Small" SelectedIndex="0" ValueType="System.String" Width="150px">
                                                        </dxe:ASPxComboBox>
                                                    </div>
                                                    <div class="left" style="height: 25px">
                                                        PinCode :
                                                    </div>
                                                    <div class="left" style="height: 25px">
                                                        <dxe:ASPxTextBox ID="TxtGurdianPin" runat="server" ClientInstanceName="cTxtGurdianPin" Width="150px"
                                                            HorizontalAlign="right">
                                                            <MaskSettings Mask="<0..999999999>" />
                                                        </dxe:ASPxTextBox>
                                                    </div>
                                                </div>
                                                <div class="left" style="height: 30px">
                                                    <dxe:ASPxComboBox ID="ComboGurdianState" runat="server" ClientInstanceName="cComboGurdianState"
                                                        EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                        Width="150px">
                                                        <DropDownButton Text="State">
                                                        </DropDownButton>
                                                   </dxe:ASPxComboBox>
                                                </div>
                                               
                                                <div class="left" style="height: 30px; margin-left: 4px;">
                                                    <dxe:ASPxComboBox ID="ComboGurdianCountry" runat="server" ClientInstanceName="cComboGurdianCountry"
                                                        EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                        Width="150px">
                                                        <DropDownButton Text="Country">
                                                        </DropDownButton>
                                                    </dxe:ASPxComboBox>
                                                </div>
                                            </div>
                                        </div>   
                                        <div class="Row">
                                            <div id="Row750" class="LFloat_Lable Leftdiv" style="height: 70px">
                                                Contact&nbsp; Details:</div>
                                            <div id="Row751" class="LFloat_Row FontChange" style="width: 57%; height: 70px;">
                                                <div class="left" style="width: 99%">
                                                    <div class="left" style="height: 25px">
                                                        Tel(Off) &nbsp;:
                                                    </div>
                                                    <div class="left" style="height: 25px">
                                                        <dxe:ASPxTextBox ID="TxtTelOfc2" runat="server" ClientInstanceName="cTxtTelOfc2" MaxLength="11"
                                                            HorizontalAlign="Right" Width="120px">
                                                            <ClientSideEvents LostFocus="function(s, e) {CheckTheLeast(cTxtTelOfc.GetText());}" />
                                                            <MaskSettings Mask="<0..99999999999>" />
                                                        </dxe:ASPxTextBox>
                                                    </div>
                                                    <div class="left" style="height: 25px">
                                                        &nbsp;Tel(Res) &nbsp;&nbsp; :
                                                    </div>
                                                    <div class="left" style="height: 25px">
                                                        <dxe:ASPxTextBox ID="TxtTelRes2" runat="server" ClientInstanceName="cTxtTelRes2" MaxLength="11"
                                                            HorizontalAlign="Right" Width="120px">
                                                            <ClientSideEvents LostFocus="function(s, e) {CheckTheLeast(cTxtTelRes.GetText());}" />
                                                            <MaskSettings Mask="<0..99999999999>" />
                                                        </dxe:ASPxTextBox>
                                                    </div>
                                                </div>
                                                <div class="left" style="width: 99%">
                                                    <div class="left" style="height: 25px">
                                                        Fax No.&nbsp; :
                                                    </div>
                                                    <div class="left" style="height: 25px">
                                                        <dxe:ASPxTextBox ID="TxtFaxNo2" runat="server" ClientInstanceName="cTxtFaxNo2" HorizontalAlign="Right"
                                                            Width="120px">
                                                            <MaskSettings Mask="<0..99999999999>" />
                                                        </dxe:ASPxTextBox>
                                                    </div>
                                                    <div class="left" style="height: 25px">
                                                        Mobile No. :
                                                    </div>
                                                    <div class="left" style="height: 25px">
                                                        <dxe:ASPxTextBox ID="TxtMobileNo2" runat="server" ClientInstanceName="cTxtMobileNo2"
                                                            MaxLength="10" HorizontalAlign="Right" Width="120px">
                                                            <ClientSideEvents LostFocus="function(s, e) {CheckTheLeast(cTxtMobileNo.GetText());}" />
                                                            <MaskSettings Mask="<0..9999999999>" />
                                                        </dxe:ASPxTextBox>
                                                    </div>
                                                </div>
                                                <div class="left" style="height: 25px">
                                                    Email ID:
                                                </div>
                                                <div class="left" style="height: 25px">
                                                    <dxe:ASPxTextBox ID="TxtEmailID2" runat="server" ClientInstanceName="cTxtEmailID2" Width="300px">
                                                        <ClientSideEvents LostFocus="function(s, e) {verifyEmail(cTxtEmlID);}" />
                                                    </dxe:ASPxTextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="Row752" class="Row">
                                             <div id="Row752_Col0" class="LFloat_Lable Leftdiv" style="height: 35px">
                                                 <span class="Spanclass"></span> PAN / GIR: <span style="font-size: 10pt; color: #ff0000">
                                                     **</span>
                                             </div>
                                             <div id="Row752_Col1" class="LFloat_Row FontChange" style="height: 35px">
                                                 <dxe:ASPxTextBox ID="TxtPan4" runat="server" ClientInstanceName="cTxtPan4" MaxLength="10"
                                                     Width="170px">
                                                     <ClientSideEvents TextChanged="SkipGurdian" KeyUp="function(s,e){s.SetText(s.GetValue().toUpperCase());}" LostFocus="function(s, e) {verifyPanCrdNo(cTxtPan4);}"/>
                                                 </dxe:ASPxTextBox>
                                             </div>
                                             
                                        </div>
                                         <div id="Row753" class="Row">
                                            <div id="Row753_Col0" class="LFloat_Lable Leftdiv" style="height: 37px">
                                                Unique Identification Number(UID) / Adhaar (If Any):</div>
                                            <div id="Row753_Col1" class="LFloat_Row" style="height: 37px">
                                                <dxe:ASPxTextBox ID="TxtUIN5" runat="server" ClientInstanceName="cTxtUIN5" MaxLength="12"
                                                    Width="170px">
                                                    <ClientSideEvents TextChanged="SkipGurdian"/>
                                                </dxe:ASPxTextBox>
                                            </div>
                                         </div>
                                         <div id="Row754" class="Row">
                                             <div id="Row754_Col0" class="LFloat_Lable Leftdiv" style="height: 37px">
                                                 IT Circle/Ward/District:</div>
                                             <div id="Row754_Col1" class="LFloat_Row" style="height: 37px">
                                                 <dxe:ASPxTextBox ID="TxtDistrict5" runat="server" ClientInstanceName="cTxtDistrict5" 
                                                     MaxLength="12" Width="170px">
                                                      <ClientSideEvents TextChanged="SkipGurdian"/>
                                                 </dxe:ASPxTextBox>
                                             </div>
                                         </div>
                             <br /> <br />
                             <div id="DivBtnNextGurdianNameAdrs" class="right RightMargin">
                                 <dxe:ASPxButton ID="BtnNextGurdianNameAdrs" runat="server" AccessKey="i" AutoPostBack="False"
                                     ClientInstanceName="cBtnNextGurdianNameAdrs" ToolTip="Proceed To Next"
                                     Width="70px" BackColor="Transparent" Height="60px">
                                     <ClientSideEvents Click="function(s, e) {GurdianNext();}" />
                                     <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_foward.png"
                                         Repeat="NoRepeat" />
                                     <Border BorderColor="Transparent" BorderStyle="None" />
                                 </dxe:ASPxButton>
                             </div>
                             <div id="DivBtnSaveGurdianNameAdrs" class="right" style="font-size: 12pt; margin-left: 10px">
                                 <dxe:ASPxButton ID="BtnSaveGurdianNameAdrs" runat="server" AutoPostBack="False" BackColor="Transparent"
                                     ClientInstanceName="cBtnSaveGurdianNameAdrs" Height="60px" ToolTip="Save Entered Data"
                                     Width="70px">
                                     <ClientSideEvents Click="function(s, e) {GurdianSave();}" />
                                     <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_save.png"
                                         Repeat="NoRepeat" />
                                     <Border BorderColor="Black" BorderStyle="None" />
                                 </dxe:ASPxButton>
                             </div>
                             <div class="right" id="DivBtnEditGurdianNameAdrs">
                                 <dxe:ASPxButton ID="BtnEditGurdianNameAdrs" runat="server" AutoPostBack="False" BackColor="Transparent"
                                  ClientInstanceName="cBtnEditGurdianNameAdrs" Height="60px" ToolTip="Edit Entered Data" Width="70px">
                                     <ClientSideEvents Click="function(s, e) {GurdianEdit();}" />
                                     <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/Edit.jpg"
                                      Repeat="NoRepeat" />
                                     <Border BorderStyle="None" />
                                 </dxe:ASPxButton>
                             </div>
                             <div id="DivBtnPrvsGurdianNameAdrs" class="right">
                                 <dxe:ASPxButton ID="BtnPrvsGurdianNameAdrs" runat="server" AutoPostBack="False" ClientInstanceName="cBtnPrvs2" ToolTip="Bck To Previous" Width="70px" BackColor="Transparent" Height="60px">
                                     <ClientSideEvents Click="function(s, e) {GurdianPrevious();}" />
                                     <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_rewind.png"
                                         Repeat="NoRepeat" />
                                     <Border BorderColor="Transparent" BorderStyle="None" />
                                 </dxe:ASPxButton>
                             </div>
                             <div class="right" style="margin-right: 4px">
                                 <dxe:ASPxCheckBox ID="CbSkip5" runat="server" ClientInstanceName="cCbSkip5"
                                ToolTip="Skip Gurdian Name and Address" Checked="False" Text="Skip This Section">
                                     <ClientSideEvents CheckedChanged="Skip5CheckedChanged" />
                                 </dxe:ASPxCheckBox>
                             </div> 
                             <br class="clear"/>
                             <br class="clear"/>
                             <div style="MARGIN-TOP: 10px; FONT-SIZE: 9pt; MARGIN-BOTTOM: 30px; WIDTH: 876px" 
                               id="DivGurdianNameAdrsAlrt" class="Success BtmMargin">
                                 <span style="color: #0066ff">Gurdian Name and Address</span> Submitted Successfully!!!!
                               <br />
                             <div class="left" style="margin-right: 2px">Click</div> <div class="left" style="width:23px; background-position: center center; background-image: url(../../../../CentralData/Images/Small_Edit.jpg);height: 23px; background-color: transparent;"></div> <div class="left" style="margin-left: 2px; margin-right: 2px">
                                    To Edit The Section<span style="color: #0066ff"> Or </span>Click</div> <div class="left" style="width:22px; background-position: center center; background-image: url(../../../../CentralData/Images/Small_blue_foward.png); height: 22px; background-color: transparent;"></div> <div class="left" style="margin-left: 2px">
                                    To Go To the <span style="color: #0066ff">Nominee Gurdian Name &amp; Address</span>
                                        <span style="color: #0066ff">Or</span> Click&nbsp;</div>
                                <div class="left" style="width:22px; background-position: center center; background-image: url(../../../../CentralData/Images/Small_blue_rewind.png); height: 22px; background-color: transparent;">
                                </div>
                                <div class="left" style="margin-left: 2px; width: 262px;">
                                    To Go Back To the <span style="color: #0066ff">Nominee Name &amp; Address</span>..</div>
                            </div>
                         </dxp:PanelContent>
                     </PanelCollection>
                     <ClientSideEvents EndCallback="function (s, e) {CbpGurdianNameAdrs_EndCallBack();}" />
                 </dxcp:ASPxCallbackPanel>
          </div>
          
         
         <div id="Div_NomGurdianNameAdrs" style="width: 99%">
             <dxcp:ASPxCallbackPanel ID="CbpNomGurdianNameAdrs" runat="server" BackColor="Transparent"
                 ClientInstanceName="cCbpNomGurdianNameAdrs" OnCallback="CbpNomGurdianNameAdrs_Callback"
                 Width="100%">
                 <PanelCollection>
                     <dxp:PanelContent runat="server">
                         <div class="DivHeader" style="width: 100%">
                             &nbsp; NOMINEE GURDIAN NAME AND ADDRESS
                         </div>
                         <div id="Row76" class="Row">
                             <div id="Row76_Col0" class="LFloat_Lable Leftdiv ">
                                 Title:
                             </div>
                             <div id="Row76_Col1" class="LFloat_Row" style="height: 25px">
                                 <dxe:ASPxTextBox ID="TxtTitl6" runat="server" ClientInstanceName="cTxtTitl6" Width="100px">
                                     <ClientSideEvents TextChanged="SkipNomGurdian" />
                                 </dxe:ASPxTextBox>
                             </div>
                             <div id="Row76_Col2" class="right" style="margin-right: 10px;">
                                 <span style="font-size: 10pt; color: #ff0000">**</span> <strong><span style="font-size: 8pt; color: #ff0000">
                                     Mandatory Fields To Be Filled</span> </strong>
                             </div>
                         </div>
                         <div id="Row77" class="Row">
                             <div id="Row77_Col0" class="LFloat_Lable Leftdiv " style="height: 38px">
                                 <span class="Spanclass"></span>Name Of The Applicant: <span style="font-size: 10pt;
                                     color: #ff0000">**</span>
                             </div>
                             <div id="Row77_Col1" class="LFloat_Row " style="height: 38px; text-align: center">
                                 <dxe:ASPxTextBox ID="TxtFName5" runat="server" ClientInstanceName="cTxtFName5" HorizontalAlign="Left"
                                     Width="155px">
                                     <ClientSideEvents TextChanged="SkipNomGurdian" />
                                 </dxe:ASPxTextBox>
                                 <span style="font-size: 8pt">[First Name]</span>
                             </div>
                             <div id="Row77_Col2" class="LFloat_Row DivName" style="height: 38px">
                                 <dxe:ASPxTextBox ID="TxtMName5" runat="server" ClientInstanceName="cTxtMName5" HorizontalAlign="Left"
                                     Width="155px">
                                     <ClientSideEvents TextChanged="SkipNomGurdian" />
                                 </dxe:ASPxTextBox>
                                 <span style="font-size: 8pt">[Middle Name]</span>
                             </div>
                             <div id="Row77_Col3" class="LFloat_Row DivName" style="height: 38px">
                                 <dxe:ASPxTextBox ID="TxtLName5" runat="server" ClientInstanceName="cTxtLName5" HorizontalAlign="Left"
                                     Width="155px">
                                     <ClientSideEvents TextChanged="SkipNomGurdian" />
                                 </dxe:ASPxTextBox>
                                 <span style="font-size: 8pt">[Last Name]</span>
                             </div>
                         </div>
                         <div id="Row78" class="Row">
                             <div id="Row78_Col0" class="LFloat_Lable Leftdiv ">
                                 Suffix:
                             </div>
                             <div id="Row78_Col1" class="LFloat_Row" style="height: 25px">
                                 <dxe:ASPxTextBox ID="TxtSufx6" runat="server" ClientInstanceName="cTxtSufx6" Width="100px">
                                     <ClientSideEvents TextChanged="SkipNomGurdian" />
                                 </dxe:ASPxTextBox>
                             </div>
                         </div>
                         <div id="Row79" class="Row">
                             <div id="Row79_Col0" class="LFloat_Lable Leftdiv">
                                 <span class="Spanclass"></span>Father's / Spouse Name:
                             </div>
                             <div id="Row79_Col1" class="LFloat_Row" style="height: 25px">
                                 <dxe:ASPxTextBox ID="TxtFthrName5" runat="server" ClientInstanceName="cTxtFthrName5"
                                     Width="500px">
                                     <ClientSideEvents TextChanged="SkipNomGurdian" />
                                 </dxe:ASPxTextBox>
                             </div>
                         </div>
                         <div id="Row790" class="Row">
                             <div id="Row790_Col0" class="LFloat_Lable Leftdiv">
                                 Date Of Birth:
                             </div>
                             <div id="Row790_Col1" class="LFloat_Row" style="height: 25px">
                                 <dxe:ASPxDateEdit ID="dobDt3" runat="server" ClientInstanceName="cdobDt3" DateOnError="Today"
                                     EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="150px"
                                     Font-Size="11px">
                                    <ClientSideEvents DateChanged="SkipNomGurdian" LostFocus="function(s,e){SetValidDate(cdobDt3);}"/>
                                 </dxe:ASPxDateEdit>
                             </div>
                         </div>
                         <div id="Row80" class="Row">
                             <div id="Row80_Col0" class="LFloat_Lable Leftdiv">
                                 <span class="Spanclass"></span>Address:<span style="font-size: 10pt; color: #ff0000">**</span>&nbsp;
                             </div>
                             <div id="Row80_Col1" class="LFloat_Row FontChange BtmMargin" style="width: 57%">
                                 <div style="margin-bottom: 2px">
                                     <span style="font-size: 8pt">[House No]</span>
                                     <dxe:ASPxTextBox ID="TxtNomGurdianAdrs1" runat="server" ClientInstanceName="cTxtNomGurdianAdrs1"
                                         HorizontalAlign="left" Width="460px">
                                         <ClientSideEvents TextChanged="SkipNomGurdian" />
                                     </dxe:ASPxTextBox>
                                 </div>
                                 <div style="margin-bottom: 2px">
                                     <span style="font-size: 8pt">[Street Name]</span>
                                     <dxe:ASPxTextBox ID="TxtNomGurdianAdrs2" runat="server" ClientInstanceName="cTxtNomGurdianAdrs2"
                                         HorizontalAlign="left" Width="460px">
                                         <ClientSideEvents TextChanged="SkipNomGurdian" />
                                     </dxe:ASPxTextBox>
                                 </div>
                                 <div style="margin-bottom: 4px">
                                     <span style="font-size: 8pt">[Area Name]</span>
                                     <dxe:ASPxTextBox ID="TxtNomGurdianAdrs3" runat="server" ClientInstanceName="cTxtNomGurdianAdrs3"
                                         HorizontalAlign="left" Width="460px">
                                         <ClientSideEvents TextChanged="SkipNomGurdian" />
                                     </dxe:ASPxTextBox>
                                 </div>
                                 <div class="left" style="width: 99%">
                                     <div class="left" style="height: 25px">
                                         City/Town/Village :
                                     </div>
                                     <div class="left" style="height: 25px">
                                         <dxe:ASPxComboBox ID="ComboNomGurdianCity" runat="server" ClientInstanceName="cComboNomGurdianCity"
                                             EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                             Width="150px">
                                             <ClientSideEvents SelectedIndexChanged="SkipNomGurdian" />
                                         </dxe:ASPxComboBox>
                                     </div>
                                     <div class="left" style="height: 25px">
                                         PinCode :
                                     </div>
                                     <div class="left" style="height: 25px">
                                         <dxe:ASPxTextBox ID="TxtNomGurdianPin" runat="server" ClientInstanceName="cTxtNomGurdianPin"
                                             Width="150px" HorizontalAlign="right">
                                             <ClientSideEvents TextChanged="SkipNomGurdian" />
                                             <MaskSettings Mask="<0..999999999>" />
                                         </dxe:ASPxTextBox>
                                     </div>
                                 </div>
                                 <div class="left" style="height: 30px">
                                     <dxe:ASPxComboBox ID="ComboNomGurdianState" runat="server" ClientInstanceName="cComboNomGurdianState"
                                         EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                         Width="150px">
                                         <ClientSideEvents SelectedIndexChanged="SkipNomGurdian" />
                                         <DropDownButton Text="State">
                                         </DropDownButton>
                                     </dxe:ASPxComboBox>
                                 </div>
                                 <div class="left" style="height: 30px; margin-left: 4px;">
                                     <dxe:ASPxComboBox ID="ComboNomGurdianCountry" runat="server" ClientInstanceName="cComboNomGurdianCountry"
                                         EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                         Width="150px">
                                         <ClientSideEvents SelectedIndexChanged="SkipNomGurdian" />
                                         <DropDownButton Text="Country">
                                         </DropDownButton>
                                     </dxe:ASPxComboBox>
                                 </div>
                             </div>
                         </div>
                         <div class="Row">
                             <div id="Row800" class="LFloat_Lable Leftdiv" style="height: 70px">
                                 Contact&nbsp; Details:</div>
                             <div id="Row801" class="LFloat_Row FontChange" style="width: 57%; height: 70px;">
                                 <div class="left" style="width: 99%">
                                     <div class="left" style="height: 25px">
                                         Tel(Off) &nbsp;:
                                     </div>
                                     <div class="left" style="height: 25px">
                                         <dxe:ASPxTextBox ID="TxtTelOfc3" runat="server" ClientInstanceName="cTxtTelOfc3"
                                             MaxLength="11" HorizontalAlign="Right" Width="120px">
                                             <ClientSideEvents LostFocus="function(s, e) {CheckTheLeast(cTxtTelOfc3.GetText());}"
                                                 TextChanged="SkipNomGurdian" />
                                             <MaskSettings Mask="<0..99999999999>" />
                                         </dxe:ASPxTextBox>
                                     </div>
                                     <div class="left" style="height: 25px">
                                         &nbsp;Tel(Res) &nbsp;&nbsp; :
                                     </div>
                                     <div class="left" style="height: 25px">
                                         <dxe:ASPxTextBox ID="TxtTelRes3" runat="server" ClientInstanceName="cTxtTelRes3"
                                             MaxLength="11" HorizontalAlign="Right" Width="120px">
                                             <ClientSideEvents LostFocus="function(s, e) {CheckTheLeast(cTxtTelRes3.GetText());}"
                                                 TextChanged="SkipNomGurdian" />
                                             <MaskSettings Mask="<0..99999999999>" />
                                         </dxe:ASPxTextBox>
                                     </div>
                                 </div>
                                 <div class="left" style="width: 99%">
                                     <div class="left" style="height: 25px">
                                         Fax No.&nbsp; :
                                     </div>
                                     <div class="left" style="height: 25px">
                                         <dxe:ASPxTextBox ID="TxtFaxNo3" runat="server" ClientInstanceName="cTxtFaxNo3" HorizontalAlign="Right"
                                             Width="120px">
                                             <ClientSideEvents TextChanged="SkipNomGurdian" />
                                             <MaskSettings Mask="<0..99999999999>" />
                                         </dxe:ASPxTextBox>
                                     </div>
                                     <div class="left" style="height: 25px">
                                         Mobile No. :
                                     </div>
                                     <div class="left" style="height: 25px">
                                         <dxe:ASPxTextBox ID="TxtMobileNo3" runat="server" ClientInstanceName="cTxtMobileNo3"
                                             MaxLength="10" HorizontalAlign="Right" Width="120px">
                                             <ClientSideEvents LostFocus="function(s, e) {CheckTheLeast(cTxtMobileNo3.GetText());}"
                                                 TextChanged="SkipNomGurdian" />
                                             <MaskSettings Mask="<0..9999999999>" />
                                         </dxe:ASPxTextBox>
                                     </div>
                                 </div>
                                 <div class="left" style="height: 25px">
                                     Email ID:
                                 </div>
                                 <div class="left" style="height: 25px">
                                     <dxe:ASPxTextBox ID="TxtEmailID3" runat="server" ClientInstanceName="cTxtEmailID3"
                                         Width="300px">
                                         <ClientSideEvents LostFocus="function(s, e) {verifyEmail(cTxtEmailID3);}" TextChanged="SkipNomGurdian" />
                                     </dxe:ASPxTextBox>
                                 </div>
                             </div>
                         </div>
                         <div id="Row802" class="Row">
                             <div id="Row802_Col0" class="LFloat_Lable Leftdiv" style="height: 35px">
                                 <span class="Spanclass"></span>PAN / GIR: <span style="font-size: 10pt; color: #ff0000">
                                     **</span>
                             </div>
                             <div id="Row802_Col1" class="LFloat_Row FontChange" style="height: 35px">
                                 <dxe:ASPxTextBox ID="TxtPan5" runat="server" ClientInstanceName="cTxtPan5" MaxLength="10"
                                     Width="170px">
                                     <ClientSideEvents TextChanged="SkipNomGurdian" KeyUp="function(s,e){s.SetText(s.GetValue().toUpperCase());}"
                                         LostFocus="function(s, e) {verifyPanCrdNo(cTxtPan5);}" />
                                 </dxe:ASPxTextBox>
                             </div>
                         </div>
                         <div id="Row803" class="Row">
                             <div id="Row803_Col0" class="LFloat_Lable Leftdiv" style="height: 37px">
                                 Unique Identification Number(UID) / Adhaar (If Any):</div>
                             <div id="Row803_Col1" class="LFloat_Row" style="height: 37px">
                                 <dxe:ASPxTextBox ID="TxtUIN6" runat="server" ClientInstanceName="cTxtUIN6" MaxLength="12"
                                     Width="170px">
                                     <ClientSideEvents TextChanged="SkipNomGurdian" />
                                 </dxe:ASPxTextBox>
                             </div>
                         </div>
                         <div id="Row804" class="Row">
                             <div id="Row804_Col0" class="LFloat_Lable Leftdiv" style="height: 37px">
                                 IT Circle/Ward/District:</div>
                             <div id="Row804_Col1" class="LFloat_Row" style="height: 37px">
                                 <dxe:ASPxTextBox ID="TxtDistrict6" runat="server" ClientInstanceName="cTxtDistrict6"
                                     MaxLength="12" Width="170px">
                                     <ClientSideEvents TextChanged="SkipNomGurdian" />
                                 </dxe:ASPxTextBox>
                             </div>
                         </div>
                         <br />
                         <br />
                         <div id="DivBtnSaveNomGurdianNameAdrs" class="right" style="font-size: 12pt; margin-left: 10px">
                             <dxe:ASPxButton ID="BtnSaveNomGurdianNameAdrs" runat="server" AutoPostBack="False"
                                 BackColor="Transparent" ClientInstanceName="cBtnSaveNomGurdianNameAdrs" Height="60px"
                                 ToolTip="Save Entered Data" Width="70px">
                                 <ClientSideEvents Click="function(s, e) {NomGurdianSave();}" />
                                 <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_save.png"
                                     Repeat="NoRepeat" />
                                 <Border BorderColor="Black" BorderStyle="None" />
                             </dxe:ASPxButton>
                         </div>
                         <div class="right" id="DivBtnEditNomGurdianNameAdrs">
                             <dxe:ASPxButton ID="BtnEditNomGurdianNameAdrs" runat="server" AutoPostBack="False"
                                 BackColor="Transparent" ClientInstanceName="cBtnEditNomGurdianNameAdrs" Height="60px"
                                 ToolTip="Edit Entered Data" Width="70px">
                                 <ClientSideEvents Click="function(s, e) {NomGurdianEdit();}" />
                                 <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/Edit.jpg"
                                     Repeat="NoRepeat" />
                                 <Border BorderStyle="None" />
                             </dxe:ASPxButton>
                         </div>
                         <div id="DivBtnPrvsNomGurdianNameAdrs" class="right">
                             <dxe:ASPxButton ID="BtnPrvsNomGurdianNameAdrs" runat="server" AutoPostBack="False"
                                 ClientInstanceName="cBtnPrvs2" ToolTip="Bck To Previous" Width="70px" BackColor="Transparent"
                                 Height="60px">
                                 <ClientSideEvents Click="function(s, e) {NomGurdianPrevious();}" />
                                 <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_rewind.png"
                                     Repeat="NoRepeat" />
                                 <Border BorderColor="Transparent" BorderStyle="None" />
                             </dxe:ASPxButton>
                         </div>
                         <div class="right" style="margin-right: 4px">
                             <dxe:ASPxCheckBox ID="CbSkip6" runat="server" ClientInstanceName="cCbSkip6" ToolTip="Skip Nominee Gurdian Name and Address"
                                 Checked="False" Text="Skip This Section">
                                 <ClientSideEvents CheckedChanged="Skip6CheckedChanged" />
                             </dxe:ASPxCheckBox>
                         </div>
                         <br class="clear"/>
                                <div id="DivSubmitAlert" class=" Success BtmMargin" style="margin-left: 2px; width: 870px;">
                                    <span style="font-size: 9pt">
                                    Now Click The <span style="color: #000000">[S]ubmit</span> Button To Save The Whole Entry </span>
                                </div>
                         <br class="clear"/>
                         <div style="margin-top: 10px; font-size: 9pt; margin-bottom: 30px; width: 870px"
                             id="DivNomGurdianAlrt" class="Success BtmMargin">
                             <span style="color: #0066ff">Nominee Gurdian Name and Address</span> Submitted Successfully!!!!
                             <br />
                             <div class="left" style="margin-right: 2px">Click</div> <div class="left" style="width:23px; background-position: center center; background-image: url(../../../../CentralData/Images/Small_Edit.jpg);height: 23px; background-color: transparent;"></div> <div class="left" style="margin-left: 2px; margin-right: 2px">
                                    To Edit The Section<span style="color: #0066ff"> Or </span>Click</div> 
                                <div class="left" style="width:22px; background-position: center center; background-image: url(../../../../CentralData/Images/Small_blue_rewind.png); height: 22px; background-color: transparent;">
                                </div>
                                <div class="left" style="margin-left: 2px; width: 579px;">
                                    To Go Back To the <span style="color: #0066cc">Gurdian Name &amp; Address</span>..
                                    <span style="color: #0066ff">Or</span> Click
                                    The <span style="color: #000000">[S]ubmit</span> Button To Save The Whole Entry
                                    &nbsp;
                                </div>
                          </div>
                     </dxp:PanelContent>
                 </PanelCollection>
                 <ClientSideEvents EndCallback="function (s, e) {CbpNomGurdianNameAdrs_EndCallBack();}" />
             </dxcp:ASPxCallbackPanel>
         </div>
          
       </div>
      </div>
    
      <div id="Row65" style="FLOAT: left; WIDTH: 100%;text-align:center" >
          <div class="left" style="width:352px"></div>
          <%--style="width:49%;text-align:right;"--%>
          <div id="DivBtnSave"class="left" style="margin-right: 4px" onclick="return DivBtnSave_onclick()">
              <dxe:ASPxButton accessKey="S" id="btnSave" tabIndex="0" runat="server" Width="130px" ToolTip="Click To Submit The Whole Entered  Data." Text="[S]ubmit" AutoPostBack="false">
                <Border BorderColor="White" ></Border>
                <ClientSideEvents Click="function(s, e) {SaveButtonClick();}" ></ClientSideEvents>
              </dxe:ASPxButton> 
          </div>
           <%--style="width:49%;text-align:left;margin-left:5px"--%>
          <div id="DivBtnReset" class="left">
              <dxe:ASPxButton accessKey="R" id="btnReset" tabIndex="0" runat="server" Width="130px" ToolTip="Reset Entered Data." Text="[R]eset" AutoPostBack="false">
                <Border BorderColor="White" ></Border>
                <ClientSideEvents Click="function(s, e) {ResetButtonClick();}" ></ClientSideEvents>
              </dxe:ASPxButton> 
          </div>
      </div>
    
   <asp:HiddenField ID="hdn_GridBindOrNotBind" runat="server" />
   <asp:HiddenField ID="Hdn_PageSize" runat="server" />
   <asp:HiddenField ID="Hdn_PageNumber" runat="server" />
    
    <dxpc:ASPxPopupControl ID="PopUp_StartPage" runat="server" ClientInstanceName="cPopUp_StartPage" 
                CloseAction="None" HeaderText="Search For CDSL Registration" Modal="True" PopupHorizontalAlign="LeftSides"
                PopupVerticalAlign="TopSides" ShowOnPageLoad="True" ShowSizeGrip="False" Width="840px">
                <ClientSideEvents PopUp="function(s, e)
                                                    {
                                                     setTimeout('cTxtFName.Focus()', 50);
                                                    
                                                    }" 
                                                     />
                <ContentCollection>
                   <dxpc:PopupControlContentControl runat="server">
                   
                    <dxp:ASPxPanel ID="Panel_Start" runat="server" DefaultButton="btnSearch" Width="99%">
                     <PanelCollection>
                       <dxp:panelcontent runat="server">
                         <div class="TopMargin" style="text-align:center;width:99%" > <br /> <br />
                          <div class="left BtmMargin LeftMargin">
                            <div class="left" style="margin-left:4px">
                                <dxe:ASPxRadioButton ID="rdNew" runat="server" Checked="True" ClientInstanceName="crdNew"
                                    GroupName="o" Layout="Flow">
                                    <ClientSideEvents CheckedChanged="function(s,e){NewChecked();}"></ClientSideEvents>
                                </dxe:ASPxRadioButton>
                                New Record
                            </div>
                            <div class="left" style="margin-left:4px">
                            <dxe:ASPxRadioButton ID="rdEdit" runat="server" ClientInstanceName="crdEdit"
                                GroupName="o" Layout="Flow">
                                <ClientSideEvents CheckedChanged="function(s,e){CheckedChangedHidden(crdEdit.GetChecked(),PopUpAdd); }"></ClientSideEvents>
                            </dxe:ASPxRadioButton>
                            Edit Saved Record
                            </div>
                            <div class="left" style="margin-left:4px;">
                            <dxe:ASPxRadioButton ID="rdUnSaved" runat="server" ClientInstanceName="crdUnSaved"
                                GroupName="o" Layout="Flow">
                                <ClientSideEvents CheckedChanged="function(s,e){CheckedChangedHidden(crdUnSaved.GetChecked(),PopUpAdd); }" />
                            </dxe:ASPxRadioButton>
                            Edit UnSaved Record
                            </div>
                         </div>
                        <div id="DivBtnOk" class="left" style="width: 90%; text-align: center; margin-top: 20px;">
                            <dxe:ASPxButton ID="btnOK" runat="server" AutoPostBack="False" Text="OK" Width="130px"  ClientInstanceName="cbtnOK" >
                                        <ClientSideEvents Click="function (s, e) {cPopUp_StartPage.Hide();PopUp_StartPage_btnOK_Click(); }" />
                            </dxe:ASPxButton>
                        </div>  
                         <div id="PopUpAdd" class="left" >
                          <div id="PopUpRow0" class="left BtmMargin">
                                <div id="PpRow0_Col0" class="left LeftMargin PopUpLable" style="width: 115px; text-align: center;Height:22px">
                                     Client Name:
                                </div>
                                <div id="PpRow0_Col1" class="left heightDiv">
                                    <div class="left " style="margin-left: 18px">
                                        <dxe:ASPxTextBox ID="TxtFName" runat="server" ClientInstanceName="cTxtFName"
                                            Width="140px" ForeColor="Silver" HorizontalAlign="Left" NullText="          First Name" Height="25px" >
                                         <ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtFName);}" 
                                          TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                         </ClientSideEvents>
                                        </dxe:ASPxTextBox> 
                                    </div> 
                                    <div class="left LeftMargin">    
                                        <dxe:ASPxTextBox ID="TxtMName" runat="server" ClientInstanceName="cTxtMName"
                                            Width="140px" ForeColor="Silver" HorizontalAlign="Left" NullText="         Middle Name" Height="25px" >
                                         <ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtMName);}" 
                                          TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                         </ClientSideEvents>
                                        </dxe:ASPxTextBox> 
                                    </div> 
                                    <div class="left LeftMargin">    
                                        <dxe:ASPxTextBox ID="TxtLName" runat="server" ClientInstanceName="cTxtLName"
                                            Width="140px" ForeColor="Silver" HorizontalAlign="Left" NullText="          Last Name" Height="25px" >
                                         <ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtLName);}" 
                                          TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                         </ClientSideEvents>
                                        </dxe:ASPxTextBox> 
                                    </div> 
                                </div>
                          </div>
                          <div id="PopUpRow2" class="left BtmMargin">      
                            
                            <div id="PpRow1" class="left  LeftMargin">
                                <div id="PpRow1_Col0" class="left PopUpLable" style="width: 115px; text-align: center;Height:22px">
                                    KRA
                                    AppliCation No:
                                </div>
                                <div id="PpRow1_Col1" class="left LeftMargin  heightDiv" style="font-size:12px">
                                    <asp:TextBox ID="TxtApliNo" runat="server" Font-Size="12px" Height="20px" Width="136px"></asp:TextBox>
                                </div>
                                <div id="PpRow1_Col2" class="left LeftMargin  heightDiv" style="font-size:12px; margin-left: 20px;" onclick="return PpRow1_Col2_onclick()">
                                     <dxe:ASPxDateEdit ID="ApliDt" runat="server" ClientInstanceName="cApliDt" 
                                          EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="180px"
                                          Font-Size="11px" Height="25px">
                                         <DropDownButton Text="Application Date">
                                         </DropDownButton>
                                      </dxe:ASPxDateEdit> 
                                </div>
                            </div>
                                <div id="PpRow0" class="left  " style="font-size:12px; margin-left: 20px;">
                                    <dxe:ASPxComboBox ID="ComboClType" runat="server" ClientInstanceName="cComboClType"
                                        EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" SelectedIndex="0"
                                        ValueType="System.String" Width="187px">
                                        <Items>
                                            <dxe:ListEditItem Text="Select" Value="0" />
                                            <dxe:ListEditItem Text="Individual" Value="I" />
                                            <dxe:ListEditItem Text="NonIndividual" Value="N" />
                                        </Items>
                                        <DropDownButton Text="ClientType">
                                        </DropDownButton>
                                    </dxe:ASPxComboBox>
                                </div>      
                            <div id="PpRow2" class="left" style="width: 100%">
                                <div id="PpRow2_Col0" class="left LeftMargin TopMargin PopUpLable" style="width: 115px; text-align: center;Height:25px">
                                    Pan Card No:
                                </div>
                                <div id="PpRow2_Col1" class="left LeftMargin TopMargin  heightDiv" style="font-size:12px">
                                   <asp:TextBox ID="TxtPanCrdNo" runat="server" Font-Size="12px" Height="20px" Width="136px"></asp:TextBox>
                                </div>
                                <div id="PpRow2_Col2" class="left LeftMargin TopMargin  heightDiv" style="font-size:12px; margin-left: 20px;">
                                    <dxe:ASPxDateEdit ID="DOBDt" runat="server" ClientInstanceName="cDOBDt" 
                                          EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="180px"
                                          Font-Size="11px" Height="25px">
                                        <DropDownButton Text="Date Of Birth">
                                        </DropDownButton>
                                    </dxe:ASPxDateEdit>
                                </div>
                                <div id="PpRow3_Col0" class="left TopMargin PopUpLable" style="width: 115px; text-align: center;Height:25px; margin-left: 20px;">
                                   Email ID:
                                </div>
                                <div id="PpRow3_Col1" class="left LeftMargin TopMargin  heightDiv" style="font-size:12px">
                                   <asp:TextBox ID="TxtEmlID" runat="server" Font-Size="12px" Height="20px" Width="136px"></asp:TextBox>
                                </div>
                            </div>
                     
                            <div class="Info TopMargin" style="width:680px; margin-top: 10px;" >If You Have Not done The KRA Registration Please Do That First</div>
                            
                        </div>
                        <div id="PopUpRow1" class="left BtmMargin" style="text-align:center;width:100%;margin-top:10px; vertical-align: bottom;">
                                <div class="left" style="margin-left: 270px">
                                    <dxe:ASPxButton ID="btnSearch" runat="server" AutoPostBack="False" Text="[S]earch" Width="130px"  ClientInstanceName="cbtnSearch" AccessKey="s" >
                                        <ClientSideEvents Click="function (s, e) {PopUp_StartPage_btnSearch_Click(); }" />
                                    </dxe:ASPxButton>
                                </div>
                                <div  id="DivAdvSrch" class="left LeftMargin">
                                    <dxe:ASPxButton ID="btnAdvSearch" runat="server" AutoPostBack="False" Text="[A]dvanced Search" Width="130px"  ClientInstanceName="cbtnAdvSearch" AccessKey="a" >
                                        <ClientSideEvents Click="function (s, e) {PopUp_StartPage_btnAdvSearch_Click(); }" />
                                    </dxe:ASPxButton>
                                </div>
                        </div>
                        </div>
                        </div>
                        
                        <div style="display:none">
                            <asp:HiddenField ID="txtClientName_Hidden" runat="server" />
                            <asp:HiddenField ID="TxtApliNo_Hidden" runat="server" />
                           
                        </div>
                        </dxp:panelcontent>
                        </PanelCollection>
                       </dxp:ASPxPanel>
                      </dxpc:PopupControlContentControl>
                </ContentCollection>
                <HeaderStyle BackColor="LightGray" ForeColor="Black" Font-Names="Calibri" />
         </dxpc:ASPxPopupControl>
     
        
         <dxpc:ASPxPopupControl ID="ConfirmPopUp1" runat="server" ClientInstanceName="cConfirmPopUp1"
            CloseAction="None" HeaderText="Confirmation Message(1)" Left="200" Modal="True" PopupHorizontalAlign="Center"
            PopupHorizontalOffset="500" PopupVerticalAlign="BottomSides" PopupVerticalOffset="2000"
            RenderIFrameForPopupElements="True" ShowSizeGrip="False" Top="100" Width="387px">
            <ContentCollection>
                <dxpc:PopupControlContentControl ID="PopupControlContentControl3" runat="server">
                    <table class="style1">
                        <tr>
                            <td colspan="5">
                                &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<span style="font-family: Calibri">If You Reset All Your Entered Data Will Be Lost<br />
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Do You Still Want To Reset???</span></td>
                        </tr>
                        <tr>
                            <td style="height: 41px">
                            </td>
                            <td style="width: 3px; height: 41px;">
                                <dxe:ASPxButton ID="btnCnfrmYs1" runat="server" AutoPostBack="False" Height="6px"
                                    meta:resourceKey="btnContinueResource1" Text="Yes" Width="192px">
                                    <ClientSideEvents Click="function (s, e) { ConfirmPopUpClickYes1(); cConfirmPopUp1.Hide(); }" />
                                </dxe:ASPxButton>
                            </td>
                            <td style="width: 3px; height: 41px;">
                                <dxe:ASPxButton ID="btnCnfrmYNo1" runat="server" AutoPostBack="False" Text="No" Width="140px">
                                    <ClientSideEvents Click="function (s, e) { cConfirmPopUp1.Hide(); }" />
                                </dxe:ASPxButton>
                            </td>
                        </tr>
                    </table>
                </dxpc:PopupControlContentControl>
            </ContentCollection>
        </dxpc:ASPxPopupControl>
        
        <dxpc:ASPxPopupControl ID="ConfirmPopUp2" runat="server" ClientInstanceName="cConfirmPopUp2"
            CloseAction="None" HeaderText="Confirmation Message(2)" Left="700" Modal="True" PopupHorizontalAlign="Center"
            PopupHorizontalOffset="500" PopupVerticalAlign="BottomSides" PopupVerticalOffset="2000"
            RenderIFrameForPopupElements="True" ShowSizeGrip="False" Top="100" Width="387px">
            <ContentCollection>
                <dxpc:PopupControlContentControl ID="PopupControlContentControl4"  runat="server">
                    <table class="style1">
                        <tr>
                            <td colspan="5">
                                &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<span style="font-family: Calibri">If You Reset All Your Entered Data Will Be Lost<br />
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Are You Sure You Want To Reset It???</span></td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td style="width: 3px">
                                <dxe:ASPxButton ID="btnCnfrmYs2" runat="server" AutoPostBack="False" Height="6px"
                                    meta:resourceKey="btnContinueResource1" Text="Yes" Width="192px">
                                    <ClientSideEvents Click="function (s, e) { ConfirmPopUpClickYes2(); cConfirmPopUp2.Hide(); }" />
                                </dxe:ASPxButton>
                            </td>
                            <td style="width: 3px">
                                <dxe:ASPxButton ID="btnCnfrmYNo2" runat="server" AutoPostBack="False" Text="No" Width="140px">
                                    <ClientSideEvents Click="function (s, e) { cConfirmPopUp2.Hide(); }" />
                                </dxe:ASPxButton>
                            </td>
                        </tr>
                    </table>
                </dxpc:PopupControlContentControl>
            </ContentCollection>
        </dxpc:ASPxPopupControl>
        <dxpc:ASPxPopupControl ID="PopUp_ExistEntry" runat="server" ClientInstanceName="cPopUp_ExistEntry"
            CloseAction="None" HeaderText="" Modal="True" PopupHorizontalAlign="LeftSides"
            PopupVerticalAlign="TopSides" ShowOnPageLoad="False" ShowSizeGrip="False" Width="750px">
            <ClientSideEvents PopUp="function(s, e)
                                                    {
                                                    setTimeout('cBtnContinue.Focus()', 50);
                                                    }" />
            <ContentCollection>
                <dxpc:PopupControlContentControl runat="server">
                    <asp:Panel ID="Panel1" runat="server" Width="700px">
                        <div style="text-align: center">
                            <div id="DivNotice" style="margin-bottom: 10px">
                                <span id="DivPopSaved">A Saved</span> <span id="DivPopUnSaved">An UnSaved</span>
                                Entry Already Exist for This Application Number
                            </div>
                            <div id="DivPopCont" align="center" style="float: left; width: 33%">
                                <dxe:ASPxButton ID="BtnContinue" runat="server" AutoPostBack="False" ClientInstanceName="cBtnContinue"
                                    HorizontalAlign="Center" Text="Continue Editing With The Old Entry">
                                    <ClientSideEvents Click="function (s, e) { PopUp_Continue_Click();cPopUp_ExistEntry.Hide(); }" />
                                </dxe:ASPxButton>
                            </div>
                           <div id="DivPopRfsh" runat="server" align="center" style="float: left; width: 30%">
                                <dxe:ASPxButton ID="BtnPopUpRfrsh" runat="server" AutoPostBack="False" ClientInstanceName="cBtnPopUpRfrsh"
                                    HorizontalAlign="Center" Text="Refresh With New Entry">
                                    <ClientSideEvents Click="function (s, e) {PopUp_Rfrsh_Click();cPopUp_ExistEntry.Hide(); }" />
                                </dxe:ASPxButton>
                            </div>
                            <div id="DivPopCncl" runat="server" align="center" style="float: left; width: 35%">
                                <dxe:ASPxButton ID="BtnPopUpCancel" runat="server" AutoPostBack="False" ClientInstanceName="cBtnPopUpCancel"
                                    HorizontalAlign="Center" Text="Cancel And Back To The Main Page">
                                    <ClientSideEvents Click="function (s, e) {PopUp_Cancel_Click();cPopUp_ExistEntry.Hide(); }" />
                                </dxe:ASPxButton>
                            </div>
                        </div>
                    </asp:Panel>
                </dxpc:PopupControlContentControl>
            </ContentCollection>
            <HeaderStyle BackColor="LightGray" Font-Names="Calibri" ForeColor="Black" />
        </dxpc:ASPxPopupControl>
        &nbsp;
      </div>
    
    </form>
</body>
</html>


