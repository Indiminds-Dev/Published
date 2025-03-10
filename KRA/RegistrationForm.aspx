<%@ page language="C#" autoeventwireup="true" inherits="KRA_Pages_RegistrationForm, App_Web_e5uwtwx-" %>

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
    <script type="text/javascript" src="../CentralData/JSScript/jquery-1.3.2.js"></script>
    <script type="text/javascript" src="../CentralData/JSScript/init.js"></script>
    <script type="text/javascript" src="../CentralData/JSScript/GenericJScript.js"></script>
    <script type="text/javascript" src="../CentralData/JSScript/ajaxList.js"></script>
    
    
    <link type="text/css" href="../CentralData/CSS/AjaxStyle.css" rel="Stylesheet" />
    <link type="text/css" href="../CentralData/CSS/GenericCss.css" rel="Stylesheet" />
    <style type="text/css">
        .Header{height: 20px;padding-left: 10px;padding-right: 3px;background-image: url('../images/EHeaderBack.gif');background-repeat: repeat-x;
		        background-position: bottom;Margin-bottom:5px;text-align:center;font-weight:bold;color:#000099;}
        .Leftdiv{width:190px;height:25px;font-size:12px;}
        .DivHeader{background-color:#B8B8B8 ;width:99%; font-family:Calibri; font-weight:bold; padding-left:10px; margin-bottom:4px;}
        .Spanclass{color:Red;font-size:14px;}
        .DivName{height:25px;text-align:center;margin-left: 10px;}
        .frmleftContent{float:left; margin:2px; padding:2px; height:26px; border: solid 1px  #D1E0F3; font-size:14px;}
        .BtmMargin{margin-bottom:10px}
        .LeftMargin{margin-left:10px}
        .FontChange{font-family:Arial;font-size:9pt}
        
        
        .Info, .Success, .Warning, .Error, .Validation {
        border: 1px solid;margin: 10px 0px;padding:15px 10px 15px 50px;background-repeat: no-repeat;background-position: 10px center;}
        .Info {color: #00529B;background-color: #BDE5F8;background-image: url('../images/info.png');
	        background-position: Left; background-repeat: no-repeat;}
        .Success {color: #4F8A10;background-color: #DFF2BF;background-image:url('../images/success.png');
	        background-position: Left; background-repeat: no-repeat;}
        .Warning {color: #9F6000;background-color: #FEEFB3;background-image: url('../images/warning.png');
	        background-position: Left; background-repeat: no-repeat;}
        .Error {color: #D8000C;background-color: #FFBABA;background-image: url('../images/Error.png'); 
        background-position: Left; background-repeat: no-repeat; }
        .Validation {color: #D63301;background-color: #FFCCBA;background-image: url('../images/Validation.png');
	        background-position: Left; background-repeat: no-repeat;} 
    </style>
    <script type="text/javascript" language="javascript">
     //Global Variable
        FieldName = '';
        var ClientType = '';
        var Cmn = '';
        var Identity = '';
        var Address = '';
        var OtherDtls = '';
        var CurrentPg = '';
        var currentDateToset=new Date('<%=Session["ServerDate"] %>');
        var GvAlrt = '';
        var ExistingClientBind = '';
        var EntryType= '';
        var ApplicatnNo ='';
        var Clicked='';
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
function verifyEmail(Obj)
{
    var status = false;     
    var emailRegEx = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i;
     if (Obj.GetValue().search(emailRegEx) == -1) 
     {
          alert("Please enter a valid email address.");
          Obj.Focus();
     }
     else
     {
         status = true;
     }
     return status;
}
function SetinnerHTML(obj,Value)
{
    document.getElementById(obj).innerHTML=Value;
}
///////////////////////////////////End Of DevExpressValidation///////////////////////////////////


    
function PageLoad()
{   
    HideShow('Div_Identity','H');
    HideShow('Row27','H');
    HideShow('div_othr','H');
    HideShow('divOthrStatus','H');
    HideShow('DivOthrAdrsPrf','H');
    HideShow('DivOthrAdrsPrfP','H');
    HideShow('DivOthrOccu','H');
    HideShow('divOthrID','H');
    HideShow('showFilter','H');
    PopUpRow1.style.visibility = 'hidden';
    PopUpRow2.style.visibility = 'hidden';
    PopUpRow3.style.visibility = 'hidden';
    DivNewEntry.style.visibility = 'hidden';
    HideShow('DivBtnEditCmn','H');
    HideShow('DivBtnEditIdntty','H'); 
    HideShow('DivBtnEditAdrs','H');  
    HideShow('DivSaved','H');
    HideShow('divOthrDtlEdit','H');
    HideShow('Row26_Col19','H');
    HideShow('DivApliNoAlert','H');
    HideShow('DivIdnttyAlrt','H');
    HideShow('DivAdrsAlrt','H');
    HideShow('DivOthrDtlsAlrt','H');
    CallServer("CallAjax-Branch","");
    HideShow('DivStateOthr','H');  
    HideShow('DivStateOthrP','H');
    HideShow('DivStateCHOthr','H'); 
    HideShow('DivPanExempt','H');

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
    
    
//------------------------------------Start Common Fields------------------------------------------------
  function CheckAppliNoExist()
  {
   if(cTxtAppliNo.GetText() != "" && Cmn != 'S')
    {
     ApplicatnNo = cTxtAppliNo.GetText();
     cCbpAppliNo.PerformCallback("CheckAppliNoExist~"+cTxtAppliNo.GetText());      
    }
   else if(Cmn == 'S' &&  ApplicatnNo != cTxtAppliNo.GetText() && cTxtAppliNo.GetText() != "")
    {
      ApplicatnNo = cTxtAppliNo.GetText();
      cCbpAppliNo.PerformCallback("CheckAppliNoExist~"+cTxtAppliNo.GetText());      
    }
  }
  
  function AppliNoAlert()
  {
   if(cTxtAppliNo.GetText() == "" && GvAlrt == '')
      alert("Please Enter The Application Number If It Is Given In Your Form..");
  }
  function CommonFldValidtn()
  { 
//    if(DevE_Control_Empty(cTxtFormNo,"Please Enter The Form No/Refference No"))
//       if(DevE_Control_Empty(cTxtCntUcc,"Please Enter The Ucc No.")== false)
//            return false;
//        else
//            return true; 
  }
  
  function CommonFldReset()
  {
    cComboCompany.SetSelectedIndex(0); 
    cTxtAppliNo.SetText("");
    cAppliDt.SetDate(currentDateToset);
    cTxtCntUcc.SetText("");
  }
  
  function onClientChange()
  {
  }
  function LinkUcc_Click()
  {
    cCbpUcc.PerformCallback('GetUcc'+'~'+cTxtCntUcc.GetText());
  }
  function CbpUcc_EndCallBack()
  {
       if(cCbpUcc.cpPrefxAlrt == "T")
       {
         alert('Please Enter a Prefix for UCC to Generate');
         cTxtCntUcc.Focus();
         cCbpUcc.cpPrefxAlrt = null;
       }
  }
  
  function SaveCommon()
  {
      Clicked ='T';
      if(Cmn == '')
      {
        Cmn = 'S';
        EntryType = "Add";
        if(cTxtAppliNo.GetText()== "")
        {
          var AppliNo = cTxtFormNo.GetText();
        }
        else
        {
          var AppliNo = cTxtAppliNo.GetText();
        }
        cCbpComon.PerformCallback('SaveCommon~'+AppliNo+ '~'+ cTxtCntUcc.GetText());
      }
      else
      {
       
        cCbpComon.PerformCallback('UpdtCommon~'+cTxtAppliNo.GetText()+ '~'+ cTxtCntUcc.GetText());
      
      }
 
  }
  
  function EditCommon()
  {
    HideShow('DivBtnSaveCmn','S');
    HideShow('DivBtnEditCmn','H');
    HideShow('DivApliNoAlert','H');
    cTxtAppliNo.SetEnabled(true); 
    cAppliDt.SetEnabled(true); 
    cTxtCntUcc.SetEnabled(true); 
    cLinkUcc.SetEnabled(true);
    if( cTxtCntUcc.GetText()!="")
    {
        if(EntryType == "Edit")
        {
           cTxtCntUcc.SetEnabled(false); 
           cLinkUcc.SetEnabled(false); 
        }
    }
    
  }
  
  function CbpComon_EndCallBack()
  {
    HideShow('DivBtnSaveCmn','H');
    HideShow('DivBtnEditCmn','S');
    HideShow('Div_Identity','S');
    HideShow('Row27','S');
    cTxtAppliNo.SetEnabled(false); 
    cAppliDt.SetEnabled(false); 
    cTxtCntUcc.SetEnabled(false); 
    cLinkUcc.SetEnabled(false);
    cTxtFormNo.SetEnabled(false);
    if(cCbpComon.cpSaveCmn == "T")
    {
        if(cTxtAppliNo.GetText()== "")
        {
           cTxtAppliNo.SetText(cTxtFormNo.GetText());
           HideShow('DivApliNoAlert','S');
           document.getElementById('DivApliNoAlert').className="Info BtmMargin";
           SetinnerHTML("DivApliNoAlert","   As Application Number Was Not Given A Application Number = '"+ cTxtFormNo.GetText() + "'  has been AutoGenerated..Note It Down For Future Refference");
           //alert("As You Have Not Given Your Application Number We Have Generated A Application Number = '"+ cTxtFormNo.GetText() + "'.  For You..Please Note It Down For Your Future Refference ");
           cTxtApplicntName.Focus();
        }
        else
        {
          HideShow('DivApliNoAlert','S');
          document.getElementById('DivApliNoAlert').className="Success BtmMargin";
          SetinnerHTML("DivApliNoAlert","Main Section Submitted Successfully !!");
        }
        if(ExistingClientBind == 'T')
        {
         
          cCbpIdntty.PerformCallback('ExistingClientBindIdntty~'+cTxtAppliNo.GetText());  
          cCbpAdrs.PerformCallback('ExistingClientBindAdrs~'); 
          cCbpOthrDtls.PerformCallback('ExistingClientBindOthrDtls~'); 
          ExistingClientBind = '';
        }
        cCbpComon.cpSaveCmn = null;
    }
    if(cCbpComon.cpBindForCmnEdit == 'T')
    { 
      HideShow('DivGridRecord','H');
      HideShow('DivEntryForm','S');
      HideShow('DivApliNoAlert','S');
      document.getElementById('DivApliNoAlert').className="Success BtmMargin";
      SetinnerHTML("DivApliNoAlert","Main Section Submitted Successfully !!");
      cCbpComon.cpBindForEditCmn = null;
    }
    Height('350','350');
  }
  
  function RecordAddButtonClick()
  {
   //window.location="../KRA/RegistrationForm.aspx"; 
    ShowHideNewClient();
    cCbpFormNo.PerformCallback('FormNoGenerate~'+ cComboCompany.GetValue());  
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
        if( cGridEntryRecord.cpExistClientBind != null)
        {
           cGridEntryRecord.CancelEdit();
           var Data = cGridEntryRecord.cpExistClientBind.split('~');
           
           var ClntType = Data[0];
           var FormNo = Data[1];
           var ClntUcc = Data[2];
           
           cComboClType.SetText(ClntType);
           cTxtFormNo.SetEnabled(true);
           cTxtFormNo.SetText(FormNo);
           cTxtCntUcc.SetText(ClntUcc);
           cLinkUcc.SetEnabled(false);
           cTxtCntUcc.SetEnabled(false);
           cTxtFormNo.SetEnabled(false);
           ShowHideNewClient();  
           cGridEntryRecord.cpExistClientBind = null;
           ExistingClientBind = "T";
        }
        if(cGridEntryRecord.cpUnsavedClientBind!= null)
        {
            cComboClType.SetValue(cGridEntryRecord.cpUnsavedClientBind);
            cGridEntryRecord.cpUnsavedClientBind = null;
        }
        if( cGridEntryRecord.cpBindForEdit == "T")
        {
           cGridEntryRecord.CancelEdit();
           
           cCbpComon.PerformCallback('BindForEditCmn~');  
           cCbpIdntty.PerformCallback('BindForEditIdntty~');  
           cCbpAdrs.PerformCallback('BindForEditAdrs~'); 
           cCbpOthrDtls.PerformCallback('BindForEditOthrDtls~'); 
          
           Cmn = "S";
           Identity = "S";
           Address = "S";
           OtherDtls = "S";
           EntryType = "Edit";
           if(cComboClType.GetValue()=="N")
           {
            cGvCHRecord.PerformCallback('BindForEditPartnerRecord~');
           }
          
           cGridEntryRecord.cpBindForEdit = null;
        }
        if(cGridEntryRecord.cpNoFileFound == "T")
        {
            alert("No UnSaved Entries To Display");
            cGridEntryRecord.cpNoFileFound = null;
        }
        if(cGridEntryRecord.cpAplicatnNo != null)
        {
            ApplicatnNo = cGridEntryRecord.cpAplicatnNo;
            cGridEntryRecord.cpAplicatnNo = null;
        }
        Height('350','350');
        
  }
  
  function ShowHideFilter(obj)
  {
      cGridEntryRecord.PerformCallback('BindFilter~'+CurrentPg+'~'+obj); 
  } 
 
  function CbpFormNo_EndCallBack()
  {
    cTxtFormNo.SetEnabled(false);
    cTxtAppliNo.Focus();
  }
   
  function CbpAppliNo_EndCallBack()
  {
    GvAlrt = 'T';
     
    if( cCbpAppliNo.cpAppliNoCheck == "Final" )
    {
      alert("This Registration Has Been Already Made by a Final User!!");
      cTxtAppliNo.SetText('');
      cTxtAppliNo.Focus();
      cCbpAppliNo.cpAppliNoCheck = null;
    }
    else if( cCbpAppliNo.cpAppliNoCheck == "Exist" )
    {
      alert("This Registration Already Exists!!");
      cTxtAppliNo.SetText('');
      cTxtAppliNo.Focus();
      cCbpAppliNo.cpAppliNoCheck = null;  
    }
    else if( cCbpAppliNo.cpAppliNoCheck == "Invalid" )
    {
      alert("Sorry You are a Invalid User For This Registration!!");
      cTxtAppliNo.SetText('');
      cTxtAppliNo.Focus();
      cCbpAppliNo.cpAppliNoCheck = null;  
    }
    else if( cCbpAppliNo.cpAppliNoCheck == "UserSaved" )
    {
       alert("You Have Already Done This This Registration.To Edit the Entry Go To 'Show Or Change KYC Records'!!");
       cTxtAppliNo.SetText('');
       cTxtAppliNo.Focus();
       cCbpAppliNo.cpAppliNoCheck = null;  
    }
    else if( cCbpAppliNo.cpAppliNoCheck == "UserInserting" )
    {
       alert("You Have Done An UnSaved Entry For this Application Number.To Further Process Go To 'UnSaved Records' ");
       cTxtAppliNo.SetText('');
       cTxtAppliNo.Focus();
       cCbpAppliNo.cpAppliNoCheck = null;  
    }
    else if(cCbpAppliNo.cpAppliNoCheck != null)
    {
      
        cTxtFormNo.SetEnabled(true);
        cTxtFormNo.SetText(cCbpAppliNo.cpAppliNoCheck);
        cTxtFormNo.SetEnabled(false);
        cCbpAppliNo.cpAppliNoCheck = null;  
    }
    else if(cCbpAppliNo.cpAppliNoCheck == null)
    {
        
        if(Clicked == "T")
        {
          if(Cmn == '')
          {
            Cmn = 'S';
            EntryType = "Add";
            if(cTxtAppliNo.GetText()== "")
            {
              var AppliNo = cTxtFormNo.GetText();
            }
            else
            {
              var AppliNo = cTxtAppliNo.GetText();
            }
            cCbpComon.PerformCallback('SaveCommon~'+AppliNo+ '~'+ cTxtCntUcc.GetText());
          }
          else
          {
           
            cCbpComon.PerformCallback('UpdtCommon~'+cTxtAppliNo.GetText()+ '~'+ cTxtCntUcc.GetText());
          
          }
           Clicked = ''; 
        }  
    }
    
//    else 
//    {
//         if(cTxtCntUcc.GetText()=="")
//         {
//            alert("Give or Generate a Client UCC No if You want to Create a Trading Account of this Client Else Click Save [M]ain to Process");
//            cTxtCntUcc.Focus();
//         }
//         
//    }
   
    
  }
//------------------------------------End Common Fields--------------------------------------------------
    
    
    
    
//------------------------------------Start Identity Details---------------------------------------------

 function IdentityValidatnIndividual()
 {
   if(DevE_Control_Empty(cTxtApplicntName,"Please Enter The Name Of The Applicant"))
      if(DevE_Control_Empty(cTxtFthrName,"Please Enter Fathers/Husbands Name"))
        if (crdOthr.GetChecked()==true)
        {
           if(DevE_Control_Empty(cTxtOthr,"Please Enter Nationality"))
              return false;
           else
              return true;
        }
        else
        { 
             if (cComboStatus.GetText()== "Others")
             {
                  if(DevE_Control_Empty(cTxtOthrStatus,"Please Specify The Status.")==false)
                     return false;
                  else
                     return true;
             }
             else
             { 
                 if (crdPanxmptN.GetChecked()==true)
                 {
                    if(DevE_Control_Empty(cTxtPan,"Please Enter The Pan No."))
                       return true;
                    else
                       return false; 
                 }
                 else
                 {   
                        if (cComboIdentityProof.GetText()== "Others")
                        {
                            if(DevE_Control_Empty(cTxtOthrProof,"Please Specify The Proof Of Identity Submitted ")==false)
                                    return false;
                                else
                                    return true; 
                        }
                        else
                        {
                           return true; 
                        }
                  }
                                    
            }
         }
   
 }
 
 function IdentityValidatnNonIndividual()
 {
    if(DevE_Control_Empty(cTxtApplicntName,"Please Enter The Name Of The Applicant"))
       if(DevE_Control_Empty(cTxtRegNo,"Please Enter The Registration Number"))
           if (cComboStatus.GetText()== "Others")
              {
                   if(DevE_Control_Empty(cTxtOthrStatus,"Please Specify The Status.")==false)
                        return false;
                   else
                        return true; 
               }
           else
                return true; 
    
 }
 
 function IdentityReset()
 {
    cTxtApplicntName.SetText(""); 
    cTxtApplicntMidlName.SetText(""); 
    cTxtApplicntLstName.SetText(""); 
    cIncorpDt.SetDate(currentDateToset);
    cComboIncorpPlc.SetValue("1");
    cComncmntDt.SetDate(currentDateToset); 
    cTxtFthrName.SetText("");
    GetObjectID('<%=rdMale.ClientID%>').checked=true;  
    GetObjectID('<%=rdSingl.ClientID%>').checked=true; 
    cdobDt.SetDate(currentDateToset); 
    crdIndian.SetChecked(true);  
    cTxtOthr.SetText(""); 
    HideShow('div_othr','H');
    cTxtPan.SetText(""); 
    crdPanxmptN.SetChecked(true);   
    cTxtRegNo.SetText(""); 
    cTxtUIN.SetText("000000");
    cTxtOthrProof.SetText("");  
    HideShow('divOthrID','H');
    cComboStatus.SetText('Individual - Resident');    
    cTxtOthrStatus.SetText("");  
    HideShow('divOthrStatus','H'); 
 }
 
 function OnStatusChange()
 {
    if( cComboStatus.GetText()== "Others")
    {
       HideShow('divOthrStatus','S');  
    }
    else
    {
       HideShow('divOthrStatus','H');   
    }
 }
 
 function SaveIdentity()
 {
     if(cComboClType.GetValue()=="I")
     {
        if(IdentityValidatnIndividual())
        {
           if(Cmn == 'S')
           {
              Identity = 'S';
              cCbpIdntty.PerformCallback('SaveIdntty~'+cComboStatus.GetValue());  
           }
           else
           {
              alert("Please Save the Main Entry First.");
              cBtnSaveCmn.Focus();
           }
        }
     }
     else if(cComboClType.GetValue()=="N")
     {
       if(IdentityValidatnNonIndividual())
       {
          if(Cmn == 'S')
             {
                Identity = 'S';
                cCbpIdntty.PerformCallback('SaveIdntty~'+cComboStatus.GetValue());
             }
          else
             {
                 alert("Please Save the Main Entry First.");
                 cBtnSaveCmn.Focus();
             } 
       }
     }
 }
 
 function EditIdentity()
 {
   Identity = '';
   HideShow('DivBtnSaveIdntty','S');
   HideShow('DivBtnEditIdntty','H'); 
   HideShow('DivIdnttyAlrt','H'); 
   cTxtApplicntName.SetEnabled(true); 
   cTxtApplicntMidlName.SetEnabled(true); 
   cTxtApplicntLstName.SetEnabled(true); 
   cIncorpDt.SetEnabled(true); 
   cComboIncorpPlc.SetEnabled(true); 
   cComncmntDt.SetEnabled(true); 
   cTxtFthrName.SetEnabled(true); 
   document.getElementById('<%=rdMale.ClientID%>').disabled=false; 
   document.getElementById('<%=rdFemale.ClientID%>').disabled=false;  
   document.getElementById('<%=rdSingl.ClientID%>').disabled=false;  
   document.getElementById('<%=rdMrd.ClientID%>').disabled=false;  
   cdobDt.SetEnabled(true); 
   crdIndian.SetEnabled(true); 
   crdOthr.SetEnabled(true); 
   cTxtOthr.SetEnabled(true); 
   cTxtPan.SetEnabled(true); 
   crdPanxmptY.SetEnabled(true); 
   crdPanxmptN.SetEnabled(true); 
   cTxtRegNo.SetEnabled(true); 
   cTxtUIN.SetEnabled(true); 
   cTxtOthrProof.SetEnabled(true); 
   cComboStatus.SetEnabled(true); 
   cTxtOthrStatus.SetEnabled(true); 
   cTxtApplicntName.inputElement.style.color = '#000000';
   if(cTxtApplicntMidlName.GetText()!="")
     cTxtApplicntMidlName.inputElement.style.color = '#000000';
   if(cTxtApplicntLstName.GetText()!="")
     cTxtApplicntLstName.inputElement.style.color = '#000000'; 
   if(cComboClType.GetValue()=="I")
     {   
      cComboStatus.PerformCallback('IndividualBind~'+cComboStatus.GetText());
     }
   if(cComboClType.GetValue()=="N")
     {   
      cComboStatus.PerformCallback('NonIndividualBind~'+cComboStatus.GetText());
     } 
 }
 
 function CbpIdntty_EndCallBack()
 {
  if(cCbpIdntty.cpSaveIdntty == "T")
  {
   HideShow('DivBtnEditIdntty','S');
   HideShow('DivBtnSaveIdntty','H');  
   HideShow('DivIdnttyAlrt','S'); 
   cTxtApplicntName.SetEnabled(false); 
   cTxtApplicntMidlName.SetEnabled(false); 
   cTxtApplicntLstName.SetEnabled(false); 
   cIncorpDt.SetEnabled(false); 
   cComboIncorpPlc.SetEnabled(false); 
   cComncmntDt.SetEnabled(false); 
   cTxtFthrName.SetEnabled(false); 
   document.getElementById('<%=rdMale.ClientID%>').disabled=true; 
   document.getElementById('<%=rdFemale.ClientID%>').disabled=true;  
   document.getElementById('<%=rdSingl.ClientID%>').disabled=true;  
   document.getElementById('<%=rdMrd.ClientID%>').disabled=true;  
   cdobDt.SetEnabled(false); 
   crdIndian.SetEnabled(false); 
   crdOthr.SetEnabled(false); 
   cTxtOthr.SetEnabled(false); 
   cTxtPan.SetEnabled(false); 
   crdPanxmptY.SetEnabled(false); 
   crdPanxmptN.SetEnabled(false);  
   cTxtRegNo.SetEnabled(false); 
   cTxtUIN.SetEnabled(false); 
   cTxtOthrProof.SetEnabled(false); 
   cComboStatus.SetEnabled(false); 
   cTxtOthrStatus.SetEnabled(false);
   cCbpIdntty.cpSaveIdntty = null;
  }
  if(cCbpIdntty.cpIdnttySavedOrNot == "T")
  {
    HideShow('DivIdnttyAlrt','H');
    EditIdentity(); 
    cCbpIdntty.cpIdnttySavedOrNot = null;
  }
  if(cCbpIdntty.cpFetchExistingIdntty == "T") 
  {
    HideShow('DivBtnEditIdntty','H');
    HideShow('DivIdnttyAlrt','H'); 
    cCbpIdntty.cpFetchExistingIdntty =null;
  }
  
  if(cComboClType.GetValue()=="I")
  {
        HideShow('Row1','H');
        HideShow('Row2','H');
        HideShow('Row3','H');
        HideShow('Row11','H');
       
  }
  else if(cComboClType.GetValue()=="N")
  {
        HideShow('Row4','H');
        HideShow('Row5','H');
        HideShow('Row6','H');
        HideShow('Row7','H');
        HideShow('Row12','H');
        HideShow('Row13','H');
        HideShow('Row10_Col2','H');
        HideShow('Row10_Col3','H'); 
        
   }
   if(cComboIdentityProof.GetText() == "Others")
   {
        HideShow('divOthrID','S');
   }
   if(crdOthr.GetChecked()== false)
     HideShow('div_othr','H'); 
   if(cComboStatus.GetText()!="Others")  
     HideShow('divOthrStatus','H');
   
     Height('350','350');
 }
 
 function ComboStatus_EndCallback()
 {
    if(cComboStatus.cpSetText!= null)
    cComboStatus.SetText(cComboStatus.cpSetText);
    Height('350','350');
 }
 
 function IdChange()
 {
    if(cComboIdentityProof.GetText() == "Others")
    {
        HideShow('divOthrID','S');
    }
    else
    {
        HideShow('divOthrID','S'); 
    }
 }
//------------------------------------End Identity Details-----------------------------------------------



//------------------------------------Start Address Details----------------------------------------------


function AddressValidatnIndividual()
{
     if(DevE_Control_Empty(cTxtAddress1,"Please Enter The Permanent Address"))
       if(DevE_MaskedControl_Empty(cTxtPin,"Please Enter The Permanent Address Pin No."))
            if(cTxtTelOfc.GetText()=="0" && cTxtTelRes.GetText()=="0" && cTxtFaxNo.GetText()=="0" && cTxtMobileNo.GetText()=="0")
               {
                    alert('Please Enter Your Contact Details');
                    cTxtTelOfc.Focus();
                    return false;
               }
            else
               { 
                  
                       if(cCbSame.GetChecked()== false)
                         {
                            if(DevE_Control_Empty(cTxtAddress1P,"Please Enter The Correspondence Address"))
                                if(DevE_MaskedControl_Empty(cTxtPinP,"Please Enter The Correspondence Address Pin No."))
                                    if (crdOthrAdrsPrfP.GetChecked()== true)
                                        if(DevE_Control_Empty(cTxtOthrAdrsPrf,"Please Specify The Other Correspondence Address Proof.")== false)
                                             return false;
                                        else if(crdOthrAdrsPrf.GetChecked()== true)
                                             {
                                                  if(DevE_Control_Empty(cTxtOthrAdrsPrf,"Please Specify The Other Permanent Address Proof."))
                                                     return true;
                                                  else
                                                     return false; 
                                             }
                                        
                                            
                         }
                        else if(crdOthrAdrsPrf.GetChecked()== true)
                         {
                              if(DevE_Control_Empty(cTxtOthrAdrsPrf,"Please Specify The Other Permanent Address Proof."))
                                 return true;
                              else
                                 return false; 
                         }
                        else
                            return true; 
                        
               } 
                        
}
 
function AddressValidatnNonIndividual()
{
     if(DevE_Control_Empty(cTxtAddress1,"Please Enter The Permanent Address"))
        if(DevE_MaskedControl_Empty(cTxtPin,"Please Enter The Permanent Address Pin No."))
            if(cTxtTelOfc.GetText()=="0" && cTxtTelRes.GetText()=="0" && cTxtFaxNo.GetText()=="0" && cTxtMobileNo.GetText()=="0")
              {
                    alert('Please Enter Your Contact Details');
                    cTxtTelOfc.Focus();
                    return false;
              }
              else
              {
                 
                      if(cCbSame.GetChecked()== false)
                      {
                        if(DevE_Control_Empty(cTxtAddress1P,"Please Enter The Registered Address"))
                            if(DevE_MaskedControl_Empty(cTxtPinP,"Please Enter The Registered Address Pin No."))
                               return true;
                            else
                               return false; 
                      }
                      else
                          return true;      
             }           
                        
                   
}

function AddressReset()
{    
     cTxtAddress1.SetText(""); 
     cTxtAddress2.SetText(""); 
     cTxtAddress3.SetText(""); 
     cComboCity.SetValue('1'); 
     cTxtPin.SetText("0000"); 
     cComboState.SetValue('10');  
     cComboCountry.SetValue('1');  
     crdPassprt.SetChecked(true); 
     HideShow('DivOthrAdrsPrf','H'); 
     cTxtOthrAdrsPrf.SetText(""); 
     cCbSame.SetChecked(false);
     AddressEnable();
     
     cTxtTelOfc.SetText("000000000"); 
     cTxtTelRes.SetText("000000000"); 
     cTxtFaxNo.SetText("00000000"); 
     cTxtMobileNo.SetText("00000000"); 
     cTxtEmlID.SetText("");
     
}

function OnCheckedChanged()
{
    if(cCbSame.GetChecked()==true)
    {
         cTxtAddress1P.SetText(cTxtAddress1.GetText());
         cTxtAddress2P.SetText(cTxtAddress2.GetText());
         cTxtAddress3P.SetText(cTxtAddress3.GetText());
         cComboCityP.SetText(cComboCity.GetText());
         cTxtPinP.SetText(cTxtPin.GetText());
         cComboStateP.SetText(cComboState.GetText());
         cComboCountryP.SetText(cComboCountry.GetText());
         cValidDtP.SetDate(cValidDt.GetDate());
         
         cTxtAddress1P.SetEnabled(false);
         cTxtAddress2P.SetEnabled(false);
         cTxtAddress3P.SetEnabled(false);
         cComboCityP.SetEnabled(false);
         cTxtPinP.SetEnabled(false);
         cComboStateP.SetEnabled(false);
         cComboCountryP.SetEnabled(false);
         cValidDtP.SetEnabled(false);
                    
        if (crdPassprt.GetChecked()== true)
             {
                crdPassprtP.SetChecked(true);
             }
        if (crdRatncrd.GetChecked()== true)
             {
                crdRatncrdP.SetChecked(true);
             }
        if (crdAgrmnt.GetChecked()== true)
             {
                crdAgrmntP.SetChecked(true);
             }
        if (crdDrvlc.GetChecked()== true)
             {
                crdDrvlcP.SetChecked(true);
             }
        if (crdVotr.GetChecked()== true)
             {
                crdVotrP.SetChecked(true);
             }
       if (crdBnkAc.GetChecked()== true)
             {
                crdBnkAcP.SetChecked(true);
             }
        if (crdTelBil.GetChecked()== true)
             {
                crdTelBilP.SetChecked(true);
             }
        if (crdElecBil.GetChecked()== true)
             {
                crdElecBilP.SetChecked(true);
             }
        if (crdGasBil.GetChecked()== true)
             {
                crdGasBilP.SetChecked(true);
             }
        if (crdOthrAdrsPrf.GetChecked()== true)
             {
                crdOthrAdrsPrfP.SetChecked() = true;
                cTxtOthrAdrsPrfP.SetText(cTxtOthrAdrsPrf.GetText());
                cTxtOthrAdrsPrfP.SetEnabled(false);
             }
        crdPassprtP.SetEnabled(false); 
        crdRatncrdP.SetEnabled(false);  
        crdAgrmntP.SetEnabled(false);  
        crdDrvlcP.SetEnabled(false);  
        crdVotrP.SetEnabled(false);  
        crdBnkAcP.SetEnabled(false);  
        crdTelBilP.SetEnabled(false);  
        crdElecBilP.SetEnabled(false);  
        crdGasBilP.SetEnabled(false);  
        crdOthrAdrsPrfP.SetEnabled(false); 
        GetObjectID('Row16_Col2').disabled=true;
        GetObjectID('Row18_Col1').disabled=true;
    }
    else
    {
         AddressEnable();
         
    }
    
 }
 
 function  AddressEnable()
 {
         GetObjectID('Row16_Col2').disabled=false;
         GetObjectID('Row18_Col1').disabled=false;
         cTxtAddress1P.SetText("");
         cTxtAddress2P.SetText("");
         cTxtAddress3P.SetText("");
         cComboCityP.SetValue('1');  
         cTxtPinP.SetText("00000000"); 
         cComboStateP.SetValue('10');  
         cComboCountryP.SetValue('1');  
         
         cTxtAddress1P.SetEnabled(true);
         cTxtAddress2P.SetEnabled(true);
         cTxtAddress3P.SetEnabled(true);
         crdPassprtP.SetEnabled(true); 
         crdRatncrdP.SetEnabled(true);  
         crdAgrmntP.SetEnabled(true);  
         crdDrvlcP.SetEnabled(true);  
         crdVotrP.SetEnabled(true);  
         crdBnkAcP.SetEnabled(true);  
         crdTelBilP.SetEnabled(true);  
         crdElecBilP.SetEnabled(true);  
         crdGasBilP.SetEnabled(true);  
         crdOthrAdrsPrfP.SetEnabled(true); 
         cComboCityP.SetEnabled(true);
         cTxtPinP.SetEnabled(true);
         cComboStateP.SetEnabled(true);
         cComboCountryP.SetEnabled(true);
         cValidDtP.SetEnabled(true);
         cTxtOthrAdrsPrfP.SetEnabled(true);
         crdPassprtP.GetChecked(true);
         cValidDtP.SetDate(currentDateToset); 
         cTxtOthrAdrsPrfP.SetText(""); 
         HideShow('DivOthrAdrsPrfP','H'); 
 }
 
 function SaveAddress() 
 {
    if(cComboClType.GetValue()=="I")
     {
        if(AddressValidatnIndividual())
        {
           if(Cmn == 'S')
             {
                Address = 'S';
                cCbpAdrs.PerformCallback('SaveAdrs~'); 
             }
           else
             {
                 alert("Please Save the Main Entry First.");
                 cBtnSaveCmn.Focus();
             }  
        }
        
     }
     else if(cComboClType.GetValue()=="N")
     {
       if(AddressValidatnNonIndividual())
       {
          if(Cmn == 'S')
           {
             Address = 'S';
             cCbpAdrs.PerformCallback('SaveAdrs~');
            }
         else
            {
              alert("Please Save the Main Entry First.");
              cBtnSaveCmn.Focus();
            }   
       }
     } 
 }
 
 function EditAddress()
 {
   Address = '';
   HideShow('DivBtnSaveAdrs','S');
   HideShow('DivBtnEditAdrs','H'); 
   HideShow('DivAdrsAlrt','H');
   cTxtAddress1.SetEnabled(true); 
   cTxtAddress2.SetEnabled(true); 
   cTxtAddress3.SetEnabled(true);
   cTxtAddress1.inputElement.style.color = '#000000';
   if(cTxtAddress2.GetText()!="")
     cTxtAddress2.inputElement.style.color = '#000000';
   if(cTxtAddress3.GetText()!="")
     cTxtAddress3.inputElement.style.color = '#000000';   
   cComboCity.SetEnabled(true); 
   cTxtPin.SetEnabled(true); 
   cComboState.SetEnabled(true); 
   cComboCountry.SetEnabled(true); 
   crdPassprt.SetEnabled(true); 
   crdRatncrd.SetEnabled(true);  
   crdAgrmnt.SetEnabled(true);  
   crdDrvlc.SetEnabled(true);  
   crdVotr.SetEnabled(true);  
   crdBnkAc.SetEnabled(true);  
   crdTelBil.SetEnabled(true);  
   crdElecBil.SetEnabled(true);  
   crdGasBil.SetEnabled(true);  
   crdOthrAdrsPrf.SetEnabled(true);
   cTxtOthrAdrsPrf.SetEnabled(true); 
   cValidDt.SetEnabled(true);
   cCbSame.SetEnabled(true);
   cTxtTelOfc.SetEnabled(true); 
   cTxtTelRes.SetEnabled(true); 
   cTxtFaxNo.SetEnabled(true); 
   cTxtMobileNo.SetEnabled(true); 
   cTxtEmlID.SetEnabled(true); 
   if(cCbSame.GetChecked()== true)
   {
       cTxtAddress1P.SetEnabled(false); 
       cTxtAddress2P.SetEnabled(false); 
       cTxtAddress3P.SetEnabled(false); 
       cComboCityP.SetEnabled(false); 
       cTxtPinP.SetEnabled(false); 
       cComboStateP.SetEnabled(false); 
       cComboCountryP.SetEnabled(false); 
       crdPassprtP.SetEnabled(false); 
       crdRatncrdP.SetEnabled(false);  
       crdAgrmntP.SetEnabled(false);  
       crdDrvlcP.SetEnabled(false);  
       crdVotrP.SetEnabled(false);  
       crdBnkAcP.SetEnabled(false);  
       crdTelBilP.SetEnabled(false);  
       crdElecBilP.SetEnabled(false);  
       crdGasBilP.SetEnabled(false);  
       crdOthrAdrsPrfP.SetEnabled(false); 
       cTxtOthrAdrsPrfP.SetEnabled(false); 
       cValidDtP.SetEnabled(false);
   }  
   else
   {
       cTxtAddress1P.SetEnabled(true); 
       cTxtAddress2P.SetEnabled(true); 
       cTxtAddress3P.SetEnabled(true); 
       cComboCityP.SetEnabled(true); 
       cTxtPinP.SetEnabled(true); 
       cComboStateP.SetEnabled(true); 
       cComboCountryP.SetEnabled(true); 
       crdPassprtP.SetEnabled(true); 
       crdRatncrdP.SetEnabled(true);  
       crdAgrmntP.SetEnabled(true);  
       crdDrvlcP.SetEnabled(true);  
       crdVotrP.SetEnabled(true);  
       crdBnkAcP.SetEnabled(true);  
       crdTelBilP.SetEnabled(true);  
       crdElecBilP.SetEnabled(true);  
       crdGasBilP.SetEnabled(true);  
       crdOthrAdrsPrfP.SetEnabled(true); 
       cTxtOthrAdrsPrfP.SetEnabled(true); 
       cValidDtP.SetEnabled(true);
   }   
 }
 
function CbpAdrs_EndCallBack()
{
 
 if( cCbpAdrs.cpSaveAdrs == "T")
 {
   HideShow('DivBtnSaveAdrs','H');
   HideShow('DivBtnEditAdrs','S');
   HideShow('DivAdrsAlrt','S');
   cTxtAddress1.SetEnabled(false); 
   cTxtAddress2.SetEnabled(false); 
   cTxtAddress3.SetEnabled(false); 
   cComboCity.SetEnabled(false); 
   cTxtPin.SetEnabled(false); 
   cComboState.SetEnabled(false); 
   cComboCountry.SetEnabled(false); 
   crdPassprt.SetEnabled(false); 
   crdRatncrd.SetEnabled(false);  
   crdAgrmnt.SetEnabled(false);  
   crdDrvlc.SetEnabled(false);  
   crdVotr.SetEnabled(false);  
   crdBnkAc.SetEnabled(false);  
   crdTelBil.SetEnabled(false);  
   crdElecBil.SetEnabled(false);  
   crdGasBil.SetEnabled(false);  
   crdOthrAdrsPrf.SetEnabled(false); 
   cTxtOthrAdrsPrf.SetEnabled(false); 
   cValidDt.SetEnabled(false);
   cCbSame.SetEnabled(false);
   if(cCbSame.GetChecked()== true)
   {
       cTxtAddress1P.SetText(cTxtAddress1.GetText());
       cTxtAddress2P.SetText(cTxtAddress2.GetText());
       cTxtAddress3P.SetText(cTxtAddress3.GetText());
       cComboCityP.SetText(cComboCity.GetText());
       cTxtPinP.SetText(cTxtPin.GetText());
       cComboStateP.SetText(cComboState.GetText());
       cComboCountryP.SetText(cComboCountry.GetText());
       cValidDtP.SetDate(cValidDt.GetDate()); 
   }
   cTxtAddress1P.SetEnabled(false); 
   cTxtAddress2P.SetEnabled(false); 
   cTxtAddress3P.SetEnabled(false); 
   cComboCityP.SetEnabled(false); 
   cTxtPinP.SetEnabled(false); 
   cComboStateP.SetEnabled(false); 
   cComboCountryP.SetEnabled(false); 
   crdPassprtP.SetEnabled(false); 
   crdRatncrdP.SetEnabled(false);  
   crdAgrmntP.SetEnabled(false);  
   crdDrvlcP.SetEnabled(false);  
   crdVotrP.SetEnabled(false);  
   crdBnkAcP.SetEnabled(false);  
   crdTelBilP.SetEnabled(false);  
   crdElecBilP.SetEnabled(false);  
   crdGasBilP.SetEnabled(false);  
   crdOthrAdrsPrfP.SetEnabled(false); 
   cTxtOthrAdrsPrfP.SetEnabled(false); 
   cValidDtP.SetEnabled(false);
   cTxtTelOfc.SetEnabled(false); 
   cTxtTelRes.SetEnabled(false); 
   cTxtFaxNo.SetEnabled(false); 
   cTxtMobileNo.SetEnabled(false); 
   cTxtEmlID.SetEnabled(false);
   cCbpAdrs.cpSaveAdrs = null;
  }
  if(cCbpAdrs.cpAdrsSavedOrNot == "T")
  {
     HideShow('DivAdrsAlrt','H');
     EditAddress();
     cCbpAdrs.cpAdrsSavedOrNot = null;
  }
  if( cCbpAdrs.cpFetchExistingAdrs == "T")
  {
    HideShow('DivBtnEditAdrs','H');
    HideShow('DivAdrsAlrt','H');
    cCbpAdrs.cpFetchExistingAdrs =null;
  }
  if(cComboClType.GetValue()=="I")
  {
    HideShow('Row17_Col1','H');
  }
  else if(cComboClType.GetValue()=="N")
  {
    HideShow('Row17_Col0','H');
    HideShow('Row16_Col1','H');
    HideShow('Row18_Col1','H'); 
    HideShow('Row16_Col0','H');
    HideShow('Row18_Col0','H'); 

  }
  if(crdOthrAdrsPrf.GetChecked()== false)
  {
    HideShow('DivOthrAdrsPrf','H'); 
  }
  if(crdOthrAdrsPrfP.GetChecked()== false)
  {
    HideShow('DivOthrAdrsPrfP','H'); 
  }
  Height('350','350'); 
}

function OnStateChange(obj) 
{
 if(obj == 1)
 {
  if(cComboState.GetText() == "Others")
  {
     HideShow('DivStateOthr','S'); 
  } 
  else
  {
    HideShow('DivStateOthr','H'); 
  }
 }
 
 if(obj == 2)
 { 
  if(cComboStateP.GetText() == "Others")
  {
    HideShow('DivStateOthrP','S'); 
  }
  else
  {
    HideShow('DivStateOthrP','H'); 
  } 
 }
 if(obj == 3)
 { 
  if(cComboCHState.GetText() == "Others")
  {
    HideShow('DivStateCHOthr','S'); 
  } 
  else
  {
    HideShow('DivStateCHOthr','P');
  } 
 }
}
//------------------------------------End Address Details------------------------------------------------


    
//-----------------------------------Start Other Details-------------------------------------------------
 function OthrDetailsValidatnIndividual()
 {
     if (GetObjectID('<%=rdOthrs.ClientID%>').checked==true)
        {
            if(DevE_Control_Empty(cTxtothrOccu,"Please Specify The Other Occupation."))
                return true;
            else
                return false; 
        }
     else
        {    
            if(DevE_Control_Empty(cTxtIPVby,"Please Enter The Creator of IPV."))
                return true;
            else
                return false; 
         }
 }
 
 function OthrDetailsValidatnNonIndividual()
 {
    if(DevE_Control_Empty(cTxtIPVby,"Please Enter The Creator of IPV."))
        if(DevE_Control_Empty(cTxtRelBrokr,"Please Enter The Details/Designation.")==false)
            return false;
        else
            return true; 
 }
 
 function OtherDetailReset()
 {
   GetObjectID('<%=rdOneLc.ClientID%>').checked=true; 
   cTxtAmnt.SetText("000000000"); 
   cIncmDt.SetDate(currentDateToset);  
   GetObjectID('<%=rdPvtSctr.ClientID%>').checked=true; 
   cTxtothrOccu.SetText("");  
   HideShow('DivOthrOccu','H');  
   cMemoOccu.SetText("");   
   GetObjectID('<%=rdNa.ClientID%>').checked=true; 
   GetObjectID('<%=rdNo.ClientID%>').checked=true; 
   GetObjectID('<%=rdForexN.ClientID%>').checked=true; 
   GetObjectID('<%=rdGamingN.ClientID%>').checked=true; 
   GetObjectID('<%=rdMoneyLendingN.ClientID%>').checked=true; 
   cMemoOthrInfo.SetText("");   
   cChkDeclaratn.SetChecked(false); 
   cTxtIPVby.SetText(""); 
   cIpvDt.SetDate(currentDateToset);  
   cTxtRelBrokr.SetText(""); 
   cTxtCHName.SetText(""); 
   cTxtCHUIN.SetText("000000");  
   cTxtCHPan.SetText("");  
   cTxtCHAddress1.SetText("");  
   cTxtCHAddress2.SetText("");  
   cTxtCHAddress3.SetText("");  
   cComboCHCity.SetValue('1');   
   cTxtCHPin.SetText("000000"); 
   cComboCHState.SetValue('10');   
   cComboCHCountry.SetValue('1');   
   cTxtCHTelOfc.SetText("000000");  
   cTxtCHTelRes.SetText("000000");  
   cTxtCHMobileNo.SetText("000000");  
   cTxtCHEmlID.SetText("");  
   cTxtRelWthapli.SetText("");  
   cTxtCHIPVby.SetText("");  
   cCHIpvDt.SetDate(currentDateToset);
   GetObjectID('<%=rdCHNa.ClientID%>').checked=true;
   HideShow('DivOthrDtlsAlrt','H');
   HideShow('Row26_Col19','H');
   HideShow('divOthrDtlEdit','H');
 }
 
 function SaveOthrDtl()
 {
     if(cComboClType.GetValue()=="I")
     {
        if(OthrDetailsValidatnIndividual())
        {
           if(Cmn == 'S')
            {   
                if(Identity == 'S')
                {
                    if(Address == 'S')
                    {
                       OtherDtls = 'S';
                       cCbpOthrDtls.PerformCallback('SaveOthrDtls~');
                    }
                    else
                    {
                      alert("Please Save the Address Entry First.");
                      cBtnSaveAdrs.Focus();
                    } 
                }
                else
                {
                  alert("Please Save the Identity Entry First.");
                  cBtnSaveIdntty.Focus();
                }  
            }
           else
            {
                 alert("Please Save the Main Entry First.");
                 cBtnSaveCmn.Focus();
            }  
        }
        
     }
     else if(cComboClType.GetValue()=="N")
     {
       if(OthrDetailsValidatnNonIndividual())
       {
          if(Cmn == 'S')
            {
                if(Identity == 'S')
                {
                    if(Address == 'S')
                    {
                        OtherDtls = 'S';
                        cCbpOthrDtls.PerformCallback('SaveOthrDtls~');
                    }
                    else
                    {
                      alert("Please Save the Address Entry First.");
                      cBtnSaveAdrs.Focus();
                    } 
                }
                else
                {
                  alert("Please Save the Identity Entry First.");
                  cBtnSaveIdntty.Focus();
                }  
            }
          else
            {
              alert("Please Save the Main Entry First.");
              cBtnSaveCmn.Focus();
            }   
       }
     }     
 }
 
 function OthrDetlSave()
 {
    if(cComboClType.GetValue()=="I")
     {
        if(OthrDetailsValidatnIndividual())
        {
           if(Cmn == 'S')
            {   
                if(Identity == 'S')
                {
                    if(Address == 'S')
                    {
                       if(OtherDtls == 'S')
                       {
                        cCbpOthrDtls.PerformCallback('SubmitOthrDtls~');
                       }
                       else
                       {
                         alert("Please Save the Other Details Entry First.");
                         cBtnSaveOthrDtl.Focus();
                       } 
                    }
                    else
                    {
                      alert("Please Save the Address Entry First.");
                      cBtnSaveAdrs.Focus();
                    } 
                }
                else
                {
                  alert("Please Save the Identity Entry First.");
                  cBtnSaveIdntty.Focus();
                }  
            }
           else
            {
                 alert("Please Save the Main Entry First.");
                 cBtnSaveCmn.Focus();
            }  
        }
        
     }
     else if(cComboClType.GetValue()=="N")
     {
       if(OthrDetailsValidatnNonIndividual())
       {
          if(Cmn == 'S')
            {
                if(Identity == 'S')
                {
                    if(Address == 'S')
                    {
                       if(OtherDtls == 'S')
                       {
                        cCbpOthrDtls.PerformCallback('SubmitOthrDtls~');
                       }
                       else
                       {
                         alert("Please Save the Other Details Entry First.");
                         cBtnSaveOthrDtl.Focus();
                       } 
                    }
                    else
                    {
                      alert("Please Save the Address Entry First.");
                      cBtnSaveAdrs.Focus();
                    } 
                }
                else
                {
                  alert("Please Save the Identity Entry First.");
                  cBtnSaveIdntty.Focus();
                }  
            }
          else
            {
              alert("Please Save the Main Entry First.");
              cBtnSaveCmn.Focus();
            }   
       }
     }     
 }
 
 function CbpOthrDtls_EndCallBack()
 {
      if(cCbpOthrDtls.cpSaved == "T")
      {
        alert('Data Submitted Successfully');
        window.location="../KRA/RegistrationForm.aspx";  
        cCbpOthrDtls.cpSaved = null;
      }
      if(cCbpOthrDtls.cpSaved == "F")
      {
        alert('Error In Saving Data');
        cCbpOthrDtls.cpSaved = null;
      }
      if(cCbpOthrDtls.cpReset == "T")
      {
        Cmn = '';
        Identity = '';
        Address = '';
        OtherDtls = '';
        OtherDetailReset();
        cCbpOthrDtls.cpReset = null;
      }
      if(cCbpOthrDtls.cpFetchExistingOthrDtl == "T")
      {
         HideShow('divOthrDtlEdit','H');
         HideShow('divOthrDtlSave','S');
         HideShow('DivOthrDtlsAlrt','H');
         cCbpOthrDtls.cpFetchExistingOthrDtl = null;
      } 
      if(cCbpOthrDtls.cpBindForEditOthrDtls == "T") 
      {
         HideShow('divOthrDtlEdit','S');
         HideShow('divOthrDtlSave','H');
         HideShow('DivOthrDtlsAlrt','S');
         document.getElementById('<%=rdOneLc.ClientID%>').disabled=true;  
         document.getElementById('<%=rdFvLc.ClientID%>').disabled=true; 
         document.getElementById('<%=rdTenLc.ClientID%>').disabled=true; 
         document.getElementById('<%=rdTwentyFvLc.ClientID%>').disabled=true; 
         document.getElementById('<%=rdMrthn25Lc.ClientID%>').disabled=true; 
         document.getElementById('<%=rdOnecr.ClientID%>').disabled=true; 
         document.getElementById('<%=rdMrthn1cr.ClientID%>').disabled=true; 
         cTxtAmnt.SetEnabled(false); 
         cIncmDt.SetEnabled(false); 
         crdPvtSctr.SetEnabled(false); 
         crdPublcSctr.SetEnabled(false); 
         crdGvSv.SetEnabled(false); 
         crdBsPf.SetEnabled(false); 
         crdPrfsnl.SetEnabled(false); 
         crdAgri.SetEnabled(false); 
         crdRetred.SetEnabled(false); 
         crdHseWf.SetEnabled(false); 
         crdStdnt.SetEnabled(false); 
         crdOthrs.SetEnabled(false);
         cTxtothrOccu.SetEnabled(false);
         cMemoOccu.SetEnabled(false); 
         document.getElementById('<%=rdPEP.ClientID%>').disabled=true; 
         document.getElementById('<%=rdRPEP.ClientID%>').disabled=true; 
         document.getElementById('<%=rdNa.ClientID%>').disabled=true; 
         document.getElementById('<%=rdYes.ClientID%>').disabled=true; 
         document.getElementById('<%=rdNo.ClientID%>').disabled=true; 
         document.getElementById('<%=rdForexY.ClientID%>').disabled=true; 
         document.getElementById('<%=rdForexN.ClientID%>').disabled=true; 
         document.getElementById('<%=rdGamingY.ClientID%>').disabled=true; 
         document.getElementById('<%=rdGamingN.ClientID%>').disabled=true; 
         document.getElementById('<%=rdMoneyLendingY.ClientID%>').disabled=true; 
         document.getElementById('<%=rdMoneyLendingN.ClientID%>').disabled=true; 
         cMemoOthrInfo.SetEnabled(false);
         cChkDeclaratn.SetEnabled(false);
         cTxtIPVby.SetEnabled(false); 
         cIpvDt.SetEnabled(false); 
         cTxtRelBrokr.SetEnabled(false); 
         cTxtCHName.SetEnabled(false); 
         cTxtCHUIN.SetEnabled(false); 
         cTxtCHPan.SetEnabled(false); 
         cTxtCHAddress1.SetEnabled(false); 
         cTxtCHAddress2.SetEnabled(false); 
         cTxtCHAddress3.SetEnabled(false); 
         cComboCHCity.SetEnabled(false); 
         cTxtCHPin.SetEnabled(false);
         cComboCHState.SetEnabled(false); 
         cComboCHCountry.SetEnabled(false); 
         cTxtCHTelOfc.SetEnabled(false); 
         cTxtCHTelRes.SetEnabled(false); 
         cTxtCHMobileNo.SetEnabled(false); 
         cTxtCHEmlID.SetEnabled(false); 
         cTxtRelWthapli.SetEnabled(false); 
         document.getElementById('<%=rdCHPep.ClientID%>').disabled=true; 
         document.getElementById('<%=rdCHRPep.ClientID%>').disabled=true; 
         document.getElementById('<%=rdCHNa.ClientID%>').disabled=true;
         cTxtCHIPVby.SetEnabled(false); 
         cCHIpvDt.SetEnabled(false); 
         cTxtRelWthBrokr.SetEnabled(false); 
         cBtnAddRecord.SetEnabled(false); 
         HideShow('Row26_Col18','H'); 
         HideShow('Row26_Col19','S');
         cCbpOthrDtls.cpBindForEditOthrDtls = null;
      }
      if(cCbpOthrDtls.cpOthrDtlsSavedOrNot == "T")
      {
        HideShow('DivOthrDtlsAlrt','H');
        EditOthrDtl();
        cCbpOthrDtls.cpOthrDtlsSavedOrNot = null;
        
      }
      if(cCbpOthrDtls.cpDocumentCheckng == "F")
      {
        HideShow('DivOthrDtlsAlrt','H');
        HideShow('divOthrDtlEdit','H');
        HideShow('Row26_Col19','H');
        alert('Please Attach Related Documents..');
        cbtnDocument.Focus();
        cCbpOthrDtls.cpDocumentCheckng = null;
      }
      if(cComboClType.GetValue()=="I")
      {
        HideShow('Row26','H');
        HideShow('DivPrtnerHdr','H');
        HideShow('DivNonInIPV','H');
      }
      else if(cComboClType.GetValue()=="N")
      {
        HideShow('Row26','S');
        HideShow('DivPrtnerHdr','S'); 
        HideShow('DivInIPV','H'); 
      } 
      if(crdOthrs.GetChecked()== false)
      {
        HideShow('DivOthrOccu','H'); 
      }
      
      Height('350','350');
 }
 
 function AddCompanyHolderRecords()
 {
    if(DevE_Control_Empty(cTxtCHName,"Please Enter The Name."))
    if(DevE_Control_Empty(cTxtCHPan,"Please Enter The Pan No."))
    if(DevE_Control_Empty(cTxtCHAddress1,"Please Enter The Address"))
    if(DevE_Control_Empty(cTxtCHPin,"Please Enter The Pin."))
    if(DevE_Control_Empty(cTxtCHEmlID,"Please Enter The EmailID."))
    if(cTxtCHTelOfc.GetText()=="0" && cTxtCHTelRes.GetText()=="0" && cTxtCHMobileNo.GetText()=="0")
       {
            alert('Please Enter Your Contact Details');
            cTxtCHTelOfc.Focus();
            return false;
       }
    else  
       {
           var PEP = '';
     
           if (GetObjectID('<%=rdCHPep.ClientID%>').checked==true)
           {
             PEP = 1;
           }
           else if (GetObjectID('<%=rdCHRPep.ClientID%>').checked==true)
           {
             PEP = 2;
           }
           else if (GetObjectID('<%=rdCHNa.ClientID%>').checked==true)
           {
             PEP = 3;
           }
           
           if(Cmn == 'S')
           {
             HideShow('Div_GVCHrecord','S');
             cGvCHRecord.PerformCallback('SaveRecords~'+PEP+'~'+cTxtAppliNo.GetText());
           }
           else
           {
             alert("Please Save the Main Entry First.");
             cBtnSaveCmn.Focus();
           }   
        
       }
 }
 
 function CancelEditing()
 {
   cGvCHRecord.CancelEdit();
 }
 
 function Update()
 {
   cGvCHRecord.PerformCallback('Update~'+cComboCHCityE.GetValue()+'~'+cComboCHStateE.GetValue()+'~'+cComboCHCountryE.GetValue());
 }
 
 function GvCHRecord_EndCallBack()
 {
   if(cGvCHRecord.cpAfterRowDeleted == "D")
   {
     alert('Row Successfully Deleted');
   }
   if(cGvCHRecord.cpRecordAdded == "T")
   {
     cTxtCHName.SetText(""); 
     cTxtCHUIN.SetText("00000000");  
     cTxtCHPan.SetText("");  
     cTxtCHAddress1.SetText("");  
     cTxtCHAddress2.SetText("");  
     cTxtCHAddress3.SetText("");  
     cComboCHCity.SetValue('1');   
     cTxtCHPin.SetText("00000000"); 
     cComboCHState.SetValue('10');   
     cComboCHCountry.SetValue('1');   
     cTxtCHTelOfc.SetText("00000000000");  
     cTxtCHTelRes.SetText("00000000000");  
     cTxtCHMobileNo.SetText("00000000000");  
     cTxtCHEmlID.SetText("");  
     cTxtRelWthapli.SetText("");  
     cTxtCHIPVby.SetText("");  
     cCHIpvDt.SetDate(currentDateToset);
     GetObjectID('<%=rdCHNa.ClientID%>').checked=true;
     cGvCHRecord.cpRecordAdded = null;
   }
   if(cGvCHRecord.cpRecordAdded == "F")
   {
     cGvCHRecord.cpRecordAdded = null;
   }
   if(cGvCHRecord.cpUpdtAlrt == "Name")
   {
     alert("Please Enter The Name.");
     cTxtCHNameE.Focus();
     cGvCHRecord.cpUpdtAlrt =null;
   }
   if(cGvCHRecord.cpUpdtAlrt == "Pan")
   {
     alert("Please Enter The Pan No.");
     cTxtCHPanE.Focus();
     cGvCHRecord.cpUpdtAlrt =null;
   }
   if(cGvCHRecord.cpUpdtAlrt == "Adrs")
   {
     alert("Please Enter The Address");
     cTxtCHAddress1E.Focus();
     cGvCHRecord.cpUpdtAlrt =null;
   }
   if(cGvCHRecord.cpUpdtAlrt == "Pin")
   {
     alert("Please Enter The Pin.");
     cTxtCHPinE.Focus();
     cGvCHRecord.cpUpdtAlrt =null;
   }
   if(cGvCHRecord.cpUpdtAlrt == "Eml")
   {
     alert("Please Enter The EmailID.");
     cTxtCHEmlIDE.Focus();
     cGvCHRecord.cpUpdtAlrt =null;
   }
   if(cGvCHRecord.cpUpdtAlrt == "Contct")
   {
     alert("Please Enter Your Contact Details");
     cTxtCHMobileNoE.Focus();
     cGvCHRecord.cpUpdtAlrt =null;
   }
   if(cGvCHRecord.cpUpdated == "U")
   {
     alert("Successfully Updated");
     cGvCHRecord.CancelEdit();
     cGvCHRecord.cpUpdated = null;
   }
 }
 
 function AttachDoc_Click()
 {
     var url = "../management/frmAddDocuments.aspx?id=RegistrationForm.aspx&id1=Customer/Client&AcType=Add&FormNo="+cTxtAppliNo.GetText()+'_'+cComboCompany.GetValue();  
     popup.SetContentUrl(url);
     //alert (url);
     popup.Show();

 }
 function ShowDoc_Click()
 {
    var obj="123";
    var URL="KraAuthentication_ImageViewer.aspx?id="+obj;
    parent.OnMoreInfoClick(URL,"Document Detail For The Document Of [ "+ obj +" ]~Without Close",'980px','550px','Y');
     //cPopUpShowDocAttach.Show();
   // cCbpPopUpShowDocAttach.PerformCallback("ShowAllDoc~");
    
 }
 function EditOthrDtl()
 {
   OtherDtls = '';
   HideShow('divOthrDtlEdit','H');
   HideShow('divOthrDtlSave','S');
   HideShow('DivOthrDtlsAlrt','H');
   document.getElementById('<%=rdOneLc.ClientID%>').disabled=false;  
   document.getElementById('<%=rdFvLc.ClientID%>').disabled=false; 
   document.getElementById('<%=rdTenLc.ClientID%>').disabled=false; 
   document.getElementById('<%=rdTwentyFvLc.ClientID%>').disabled=false; 
   document.getElementById('<%=rdMrthn25Lc.ClientID%>').disabled=false; 
   document.getElementById('<%=rdOnecr.ClientID%>').disabled=false; 
   document.getElementById('<%=rdMrthn1cr.ClientID%>').disabled=false; 
   cTxtAmnt.SetEnabled(true); 
   cIncmDt.SetEnabled(true); 
   crdPvtSctr.SetEnabled(true); 
   crdPublcSctr.SetEnabled(true); 
   crdGvSv.SetEnabled(true); 
   crdBsPf.SetEnabled(true); 
   crdPrfsnl.SetEnabled(true); 
   crdAgri.SetEnabled(true); 
   crdRetred.SetEnabled(true); 
   crdHseWf.SetEnabled(true); 
   crdStdnt.SetEnabled(true); 
   crdOthrs.SetEnabled(true);
   cTxtothrOccu.SetEnabled(true);
   cMemoOccu.SetEnabled(true); 
   document.getElementById('<%=rdPEP.ClientID%>').disabled=false; 
   document.getElementById('<%=rdRPEP.ClientID%>').disabled=false; 
   document.getElementById('<%=rdNa.ClientID%>').disabled=false; 
   document.getElementById('<%=rdYes.ClientID%>').disabled=false; 
   document.getElementById('<%=rdNo.ClientID%>').disabled=false; 
   document.getElementById('<%=rdForexY.ClientID%>').disabled=false; 
   document.getElementById('<%=rdForexN.ClientID%>').disabled=false; 
   document.getElementById('<%=rdGamingY.ClientID%>').disabled=false; 
   document.getElementById('<%=rdGamingN.ClientID%>').disabled=false; 
   document.getElementById('<%=rdMoneyLendingY.ClientID%>').disabled=false; 
   document.getElementById('<%=rdMoneyLendingN.ClientID%>').disabled=false; 
   cMemoOthrInfo.SetEnabled(true);
   cChkDeclaratn.SetEnabled(true);
   cTxtIPVby.SetEnabled(true); 
   cIpvDt.SetEnabled(true); 
   cTxtRelBrokr.SetEnabled(true); 
   cTxtCHName.SetEnabled(true); 
   cTxtCHUIN.SetEnabled(true); 
   cTxtCHPan.SetEnabled(true); 
   cTxtCHAddress1.SetEnabled(true); 
   cTxtCHAddress2.SetEnabled(true); 
   cTxtCHAddress3.SetEnabled(true); 
   cComboCHCity.SetEnabled(true); 
   cTxtCHPin.SetEnabled(true);
   cComboCHState.SetEnabled(true); 
   cComboCHCountry.SetEnabled(true); 
   cTxtCHTelOfc.SetEnabled(true); 
   cTxtCHTelRes.SetEnabled(true); 
   cTxtCHMobileNo.SetEnabled(true); 
   cTxtCHEmlID.SetEnabled(true); 
   cTxtRelWthapli.SetEnabled(true); 
   document.getElementById('<%=rdCHPep.ClientID%>').disabled=false; 
   document.getElementById('<%=rdCHRPep.ClientID%>').disabled=false; 
   document.getElementById('<%=rdCHNa.ClientID%>').disabled=false;
   cTxtCHIPVby.SetEnabled(true); 
   cCHIpvDt.SetEnabled(true); 
   cTxtRelWthBrokr.SetEnabled(true); 
   cBtnAddRecord.SetEnabled(true); 
  }
 
//------------------------------------End Other Details--------------------------------------------------

//---------------------------------------Start Pop-Up-----------------------------------------------------

function PopUp_StartPage_btnOK_Click()
{
  if(crdEdit.GetChecked() == true)
  {
     HideShow('DivGridRecord','S');
     HideShow('DivEntryForm','H');
     HideShow('Row27','H');
     HideShow('DivUnsaved','H');
     HideShow('DivBtnReset','H');
     if(cComboClType.GetValue()=="I")
     {
        HideShow('SpNonIndiv','H');
        cComboStatus.PerformCallback('IndividualBind~Resident Individual~');
     }
     else if(cComboClType.GetValue()=="N")
     {
        HideShow('SpIndiv','H'); 
        cComboStatus.PerformCallback('NonIndividualBind~Private Limited Co~');    
     }
     HideShow('DivSaved','S');
     HideShow('DivEditGrdVw','S');
     cGridEntryRecord.PerformCallback('FetchClientDetailForEdit~'); 
     
  }
  else if(crdNew.GetChecked() == true)
  {
     if(crdExCl.GetChecked() == true)
     {
        var listBox = document.getElementById('<%=lstSelection.ClientID%>');	  
        if(listBox.length > 0)
        {
            HideShow('DivGridRecord','S');
            HideShow('DivUnsaved','S');
            HideShow('DivSaved','H');
            HideShow('DivEntryForm','H');
            HideShow('Row27','H');
            HideShow('rowGV0','H');
            
            cGridEntryRecord.PerformCallback('FetchClientDetail~'); 
        }
        else
        {
           alert('Please Select and Add Atleast One Item!!!');
           document.getElementById('<%=txtSelectionID.ClientID%>').focus();
           return; 
        }
        if(cComboClType.GetValue()=="I")
        {
          cComboStatus.PerformCallback('IndividualBind~Resident Individual~');
        }
        else if(cComboClType.GetValue()=="N")
        {
          cComboStatus.PerformCallback('NonIndividualBind~Private Limited Co~');   
        }
         
    }
    else if (crdNwCl.GetChecked() == true)
    {
       ShowHideNewClient();
       cPopUp_StartPage.Hide();
       cCbpFormNo.PerformCallback('FormNoGenerate~'+ cComboCompany.GetValue()); 
    }
    HideShow('Div_GVCHrecord','H');
    
  }
  else if(crdUnSaved.GetChecked() == true)
  {
     HideShow('DivGridRecord','S');
     HideShow('DivEditGrdVw','S');
     HideShow('DivEntryForm','H');
     HideShow('Row27','H');
     HideShow('DivUnsaved','S');
     HideShow('DivSaved','H');
     HideShow('DivBtnReset','H');
     HideShow('rowGV0','H');
     cGridEntryRecord.PerformCallback('BindUnSavedEntries~'+ cComboCompany.GetValue()); 
     if(cComboClType.GetValue()=="I")
     {
        cComboStatus.PerformCallback('IndividualBind~Resident Individual~');
     }
     else if(cComboClType.GetValue()=="N")
     {
        cComboStatus.PerformCallback('NonIndividualBind~Private Limited Co~');   
     }
  }
  
  cPopUp_StartPage.Hide();
 
}

function ShowHideNewClient()
{
        HideShow('DivGridRecord','H');
        HideShow('DivEntryForm','S');
        
        ClientType = cComboClType.GetValue();
       
        if(cComboClType.GetValue()=="I")
        {
          HideShow('SpNonIndiv','H');
          HideShow('Row1','H');
          HideShow('Row2','H');
          HideShow('Row3','H');
          HideShow('Row11','H');
          HideShow('Row17_Col1','H');
          HideShow('DivMrThn1cr','H');
          HideShow('Row23','H');
          HideShow('DivNonInIPV','H');
          HideShow('Row26','H');
          HideShow('DivPrtnerHdr','H');
          cComboStatus.PerformCallback('IndividualBind~Resident Individual~');
        } 
        if(cComboClType.GetValue()=="N")
        {
          HideShow('SpIndiv','H');  
          HideShow('Row4','H');
          HideShow('Row5','H');
          HideShow('Row6','H');
          HideShow('Row7','H');
          HideShow('Row8','H');
          HideShow('Row12','H');
          HideShow('Row13','H');
          HideShow('Row16','H');
          HideShow('Row17_Col0','H');
          HideShow('Row18','H');
          HideShow('DivMrThn25Lc','H');
          HideShow('DivInIPV','H');
          cComboStatus.PerformCallback('NonIndividualBind~Private Limited Co~');
        }
}    
//=================For Call ajax to fill text boxes after page Load and with ICallbackEventHandler Interface==================


function CallGenericAjaxJS(e)
{
    var AjaxList_TextBox=document.getElementById('<%=txtSelectionID.ClientID%>');
    AjaxList_TextBox.focus();
    AjaxComQuery=AjaxComQuery.replace("\'","'");
    ajax_showOptions(AjaxList_TextBox,'GenericAjaxList',e,replaceChars(AjaxComQuery),'Main');
   
}
//=================For Call ajax to fill text boxes on page Load===============================================================

function FnShowFilter()
{
  if(crdExCl.GetChecked() == true)
  {
    //cddlGroup.SetText('Branch');
    PopUpRow1.style.visibility = 'inherit';
    PopUpRow3.style.visibility = 'hidden';
    //HideShow('PopUpRow3','H');
    HideShow('PopUpRow4','H');
    HideShow('showFilter','S');
    //HideShow('PopUpRow1','S');
    CallServer("CallAjax-Branch","");
    cddlGroup.PerformCallback(); 
    document.getElementById('<%=txtSelectionID.ClientID%>').focus(); 
   // setTimeout('cddlGroup.Focus()', 50);
      
  }
  else 
  {
    HideShow('PopUpRow4','S');
    //HideShow('PopUpRow3','H');
    PopUpRow3.style.visibility = 'hidden';
    HideShow('showFilter','H');
    PopUpRow1.style.visibility = 'hidden';
    PopUpRow2.style.visibility = 'hidden';
//    HideShow('PopUpRow1','H');
//    HideShow('PopUpRow2','H');
  }
  
}

function FnShowNew()
{
  if(crdNew.GetChecked() == true)
  {
    //HideShow('DivNewEntry','S');
    DivNewEntry.style.visibility = 'inherit';
    //HideShow('PopUpRow3','H');
    PopUpRow3.style.visibility = 'hidden';
    cddlGroup.Focus();  
    HideShow('PopUpRow4','S');
  }
  else if(crdEdit.GetChecked() == true)
  {
    //HideShow('DivNewEntry','H');
    DivNewEntry.style.visibility = 'hidden';
    //HideShow('PopUpRow3','H');
    PopUpRow3.style.visibility = 'hidden'; 
    HideShow('PopUpRow4','S');
  }
  else if(crdImport.GetChecked() == true)
  {
   //HideShow('DivNewEntry','H');
   //HideShow('PopUpRow3','S');
   DivNewEntry.style.visibility = 'hidden';
   PopUpRow3.style.visibility = 'inherit'; 
   HideShow('PopUpRow4','S');
   cComboAgency.Focus();
   setTimeout('cComboAgency.Focus()', 50); 
  }
  else if(crdUnSaved.GetChecked() == true)
  {
   //HideShow('DivNewEntry','H');
   //HideShow('PopUpRow3','H');
   DivNewEntry.style.visibility = 'hidden';
   PopUpRow3.style.visibility = 'hidden'; 
   HideShow('PopUpRow4','H');
  }  
}

function lnkBtnAddFinalSelection()
{
    var listBox = document.getElementById('<%=lstSelection.ClientID%>');	          
    var listID='';
    var i;
    if(listBox.length > 0)
    {                             
//        for(i=0;i<listBox.length;i++)
//        {
//            if(listID == '')
//                listID = listBox.options[i].value+';'+listBox.options[i].text;
//            else
//                listID += ',' + listBox.options[i].value+';'+listBox.options[i].text;
//        }
//        var sendData='';
//        var grpBy = cddlGroup.GetValue(); 
//        if(grpBy=="0")
//        {             
//            var sendData = 'Branch~' + listID;
//        }
//        else if(grpBy=="1")
//        {             
//            var sendData = 'Group~' + listID;
//        }
//        else if(grpBy=="2")
//        {             
//            var sendData = 'Client~' + listID;
//        }
//        CallServer(sendData,"");  
//        for(i=listBox.options.length-1;i>=0;i--)
//        {
//            listBox.remove(i);
//        }            
        HideShow('showFilter','H');
        
    }
    else
    {
        alert('Please Select Atleast One Item!!!');
        document.getElementById('<%=txtSelectionID.ClientID%>').focus();
    }

}
	        
function lnkBtnRemoveFromSelection()
{                
    var listBox = document.getElementById('<%=lstSelection.ClientID%>');
    var i;
    for(i=listBox.options.length-1;i>=0;i--)
    {
     listBox.remove(i);
    }

//    var tLength = listBox.length;    
//    var arrTbox = new Array();
//    var arrLookup = new Array();
//    var i;
//    var j = 0;
//    for (i = 0; i < listBox.options.length; i++) 
//    {
//        if (listBox.options[i].selected && listBox.options[i].value != "") 
//        { 
//                              
//        }
//        else 
//        {
//            arrLookup[listBox.options[i].text] = listBox.options[i].value;
//            arrTbox[j] = listBox.options[i].text;
//            j++;
//        }
//    }
    listBox.length = 0;
//    for (i = 0; i < j; i++) 
//    {
//        var no = new Option();
//        no.value = arrLookup[arrTbox[i]];
//        no.text = arrTbox[i];
//        listBox[i]=no;
//    }
}

function btnAddsubscriptionlist_click()
{            
    var txtName = document.getElementById('<%=txtSelectionID.ClientID%>');
    if(txtName.value != '')
    {
        var txtId = document.getElementById('<%=txtSelectionID_hidden.ClientID%>').value;
        var listBox = document.getElementById('<%=lstSelection.ClientID%>');
        var listLength = listBox.length;               
        var opt = new Option();
        opt.value = txtId;
        opt.text = txtName.value;
        listBox[listLength]=opt;
        txtName.value='';
       
    }
    else
        alert('Please search name and then Add!');
        
    txtName.focus();
    txtName.select();            
} 

function  fnddlGroup()
{
    document.getElementById('<%=lstSelection.ClientID%>').length=0;
    if(cddlGroup.GetValue()=="0")
    {
        //fn_Branch(); 
        //HideShow('PopUpRow2','H');
        PopUpRow2.style.visibility = 'hidden';
        CallServer("CallAjax-Branch","");
        document.getElementById('<%=txtSelectionID.ClientID%>').focus();  
    }           
    if(cddlGroup.GetValue()=="1")                
    {  
        cddlgrouptype.PerformCallback('GroupTypeBind~');
        fn_Group();         
    }            
    if(cddlGroup.GetValue()=="2")
    { 
        //fn_Clients(); 
        //HideShow('PopUpRow2','H');  
        PopUpRow2.style.visibility = 'hidden';             
        CallServer("CallAjax-Client","");  
        document.getElementById('<%=txtSelectionID.ClientID%>').focus();             
    }     
  Height('700','700');
} 

function fn_Group()
{      
  CallServer("CallAjax-Group~" + cddlgrouptype.GetText(),"");
  document.getElementById('<%=txtSelectionID.ClientID%>').focus(); 
                          
}
      
function ddlgrouptype_EndCallback()
{
  if(cddlgrouptype.cpBind == "T")
  {
   //HideShow('PopUpRow2','S');
   PopUpRow2.style.visibility = 'inherit'; 
   cddlgrouptype.SetSelectedIndex(0);
   cddlgrouptype.cpBind = null;
  }
} 

function ReceiveServerData(rValue)
{
    var Data=rValue.split('!');
    if(Data[1]!="undefined")
    {
        if(Data[0]=='Client')
        {
            document.getElementById('<%=HiddenField_Client.ClientID%>').value = Data[1];
        }
        if(Data[0]=='Branch')
        {
            document.getElementById('<%=HiddenField_Branch.ClientID%>').value = Data[1];                    
        }
        if(Data[0]=='Group')
        { 
            document.getElementById('<%=HiddenField_Group.ClientID%>').value = Data[1];
        }
    } 
    if(Data[0]=='AjaxQuery')
    {                
        AjaxComQuery = Data[1];
        var AjaxList_TextBox=document.getElementById('<%=txtSelectionID.ClientID%>');                          
        AjaxList_TextBox.value='';
        AjaxList_TextBox.attachEvent('onkeyup',CallGenericAjaxJS);
    }              
} 
//-----------------------------------------------End Pop-Up---------------------------------------------------- 

function OnGridEditClick()
{
   SetValue("hdn_GridBindOrNotBind","False"); 
}
function ShowRecordButtonClick()
{
   HideShow('DivSaved','S');
   HideShow('DivEditGrdVw','S');
   cGridEntryRecord.PerformCallback('FetchClientDetailForEdit~'); 
}
function SaveButtonClick()
{
//     if(CommonFldValidtn())
//     {
        if(cComboClType.GetValue()=="I")
        {
            if(IdentityValidatnIndividual())
                if(AddressValidatnIndividual())
                    if(OthrDetailsValidatnIndividual())
                       OthrDetlSave();
                    else
                        return;
        }
        else
        {
            if(IdentityValidatnNonIndividual())
                if(AddressValidatnNonIndividual())
                    if(OthrDetailsValidatnNonIndividual())
                       OthrDetlSave(); 
                    else
                        return;
        }
//    }

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
    CommonFldReset();
    EditCommon();
    IdentityReset();
    EditIdentity()
    AddressReset();
    EditAddress();
    OtherDetailReset();
    Cmn = '';
    Identity = '';
    Address = '';
    cCbpOthrDtls.PerformCallback('Reset~');  
} 
  
function CbpPopUpShowDocAttach_EndCallBack()
{

   if(cCbpPopUpShowDocAttach.cpNoOfDoc != null)
   {

          cCbpPopUpShowDocAttach.cpNoOfDoc = null;
   }
   if(cCbpPopUpShowDocAttach.cpShowDoc1 == "T")
   {
        cCbpPopUpShowDocAttach.PerformCallback("ShowNextDoc~2");
//        DivChkBox1.style.visibility = 'inherit';
//        DivChkBox2.style.visibility = 'hidden';
//        DivChkBox3.style.visibility = 'hidden';
//        DivChkBox4.style.visibility = 'hidden';
//        DivChkBox5.style.visibility = 'hidden';
//        DivChkBox6.style.visibility = 'hidden';
        cCbpPopUpShowDocAttach.cpShowDoc1 = null;
   }
   if(cCbpPopUpShowDocAttach.cpShowDoc!= null)
   {
        var count = cCbpPopUpShowDocAttach.cpShowDoc+1;
        cCbpPopUpShowDocAttach.PerformCallback("ShowNextDoc~"+ count);
//        DivChkBox2.style.visibility = 'hidden';
//        DivChkBox3.style.visibility = 'hidden';
//        DivChkBox4.style.visibility = 'hidden';
//        DivChkBox5.style.visibility = 'hidden';
//        DivChkBox6.style.visibility = 'hidden';
        cCbpPopUpShowDocAttach.cpShowDoc = null;
   }
}

    </script>
</head>
<body id="abc">
    <form id="form1" runat="server">
   
    <div>
    <div id="header" class="Header">
              KRA (KYC Registration Authorization) Registration Form For
        <span id="SpIndiv"> Individual </span> <span id="SpNonIndiv">Non-Individual</span>
    </div>
        <div id="DivGridRecord" style="width: 90%; padding-top: 4px" align="center">
            
            <div id="rowGV0" class="Row">
                 <div id="rowGV0_Col0" class="LFloat_Lable Leftdiv BtmMargin" style="width: 202px"> &nbsp;KRA Created Date Range: </div>
                 <div id="rowGV0_Col1" class="LFloat_Row"  style="height:25px;text-align:center;"> 
                    <dxe:ASPxDateEdit ID="RecordFrmDt" runat="server" ClientInstanceName="cRecordFrmDt" DateOnError="Today"
                                 EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="150px"
                                 Font-Size="11px" TabIndex="0">
                        <DropDownButton Text="From">
                        </DropDownButton>
                    </dxe:ASPxDateEdit> 
                 </div>
                 <div id="rowGV0_Col2" class="LFloat_Row DivName BtmMargin"  style="height:25px;text-align:center;"> 
                    <dxe:ASPxDateEdit ID="RecordToDt" runat="server" ClientInstanceName="cRecordToDt" DateOnError="Today"
                                 EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="150px"
                                 Font-Size="11px" TabIndex="0">
                        <DropDownButton Text="To">
                        </DropDownButton>
                    </dxe:ASPxDateEdit> 
                 </div>
                 <%--<div id="rowGV0_Col2" class="LFloat_Row DivName BtmMargin"> 
                     <dxe:ASPxTextBox ID="TxtMidlName" runat="server" ClientInstanceName="cTxtMidlName" Width="155px" NullText="Middle Name" ForeColor="Silver" HorizontalAlign="Center" >
                      <clientsideevents textchanged="function(s,e){ s.inputElement.style.color = '#000000';}" ></clientsideevents>
                     </dxe:ASPxTextBox>
                 </div>
                 <div id="rowGV0_Col3" class="LFloat_Row DivName BtmMargin"> 
                     <dxe:ASPxTextBox ID="TxtLstName" runat="server" ClientInstanceName="cTxtLstName" Width="155px" NullText="Last Name" ForeColor="Silver" HorizontalAlign="Center" >
                      <clientsideevents textchanged="function(s,e){ s.inputElement.style.color = '#000000';}" ></clientsideevents>
                     </dxe:ASPxTextBox>
                 </div>--%>
                 <div class="left" style="margin-left:10px; font-size: 12pt;">
                  <dxe:ASPxButton ID="BtnShow" runat="server" AutoPostBack="false" TabIndex="0"
                    Text="Show" ToolTip="Add New Record" Width="100px" ClientInstanceName="cBtnShow">
                    <border bordercolor="White"></border>
                    <clientsideevents click="function(s, e) {ShowRecordButtonClick();}"></clientsideevents>
                  </dxe:ASPxButton>
                 </div>
           </div> 
           <%--<div id="rowGV1" class="Row">
                 <div id="rowGV1_Col0" class="LFloat_Row Leftdiv ">
                    <dxe:ASPxTextBox ID="TxtUcc" runat="server" ClientInstanceName="cTxtUcc" Width="155px" NullText="Client ID ( UCC)" ForeColor="Silver" HorizontalAlign="Center">
                     <clientsideevents textchanged="function(s,e){ s.inputElement.style.color = '#000000';}" ></clientsideevents>
                    </dxe:ASPxTextBox>
                 </div>
                 <div id="rowGV1_Col1" class="LFloat_Row DivName"> 
                    <dxe:ASPxTextBox ID="TxtFindFormNo" runat="server" ClientInstanceName="cTxtFindFormNo" Width="155px" NullText="Form/Refference No" ForeColor="Silver" HorizontalAlign="Center">
                     <clientsideevents textchanged="function(s,e){ s.inputElement.style.color = '#000000';}" ></clientsideevents>
                    </dxe:ASPxTextBox>               
                 </div>
                 
          </div>--%>
           <div id="DivEditGrdVw">
            <div id="lblGridHeader" class="paging textLeft" style="font-size: 12pt;width:950px;margin-top:10px">
                <span id="DivUnsaved" class="pagingContent">Unsaved Records Still In Process: </span>
                 <span id="DivSaved" class="pagingContent">Saved KRA Records Of The Given Date Range: </span>
            </div>
            <div id="Container2" class="paging textLeft" style="width: 950px">
                <div class="right">
                    <div id="ShowFilteredRecords" style="float: left; width: 69px">
                        <a href="javascript:ShowHideFilter('s');"><span style="font-size: 12px; color: #000099;
                            text-decoration: underline">Show Filter</span></a>
                    </div>
                    <div id="ShowAllRecords" style="float: left; width: 72px">
                        <a href="javascript:ShowHideFilter('All');"><span style="font-size: 12px; color: #000099;
                            text-decoration: underline">All Records</span></a>
                    </div>
                </div>
                <div class="left pagingContent" style="vertical-align: bottom;">
                    Page <b id="B_PageNo" runat="server"></b>Of <b id="B_TotalPage" runat="server"></b>
                    ( <b id="B_TotalRows" runat="server"></b>items ) <span class="textLeft"><a id="A_LeftNav"
                        runat="server" href="javascript:void(0);" onclick="OnLeftNav_Click()">
                        <img align="middle" alt="" class="paging_nav" src="../images/LeftNav.gif" width="16" />
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
                                                    <img align="middle" alt="" class="paging_nav" src="../images/RightNav.gif" width="16" />
                                                </a></span><span class="clear"></span>
              </div>
            </div>
            <dxwgv:ASPxGridView ID="GridEntryRecord" runat="server" Width="950px" ClientInstanceName="cGridEntryRecord"
                Font-Size="Small" KeyFieldName="RowID" AutoGenerateColumns="False" Settings-ShowHorizontalScrollBar="true"
                OnCustomCallback="GridEntryRecord_CustomCallback" OnHtmlEditFormCreated="GridEntryRecord_HtmlEditFormCreated">
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
                <SettingsEditing Mode="EditForm" PopupEditFormShowHeader="False" />
                <Columns>
                    <dxwgv:GridViewCommandColumn VisibleIndex="0" Width="70px" FixedStyle="Left">
                        <HeaderTemplate>
                            <dxe:ASPxButton ID="BtnAddRecord" runat="server" AutoPostBack="false" TabIndex="0"
                                Text="Add New" ToolTip="Add New Record" Width="15px" ClientInstanceName="cBtnAddRecord">
                                <border bordercolor="White"></border>
                                <clientsideevents click="function(s, e) {RecordAddButtonClick();}"></clientsideevents>
                            </dxe:ASPxButton>
                        </HeaderTemplate>
                        <EditButton Text="Edit"  Visible="True">
                       
                        </EditButton>
                        <CellStyle Font-Underline="False" Font-Size="12px">
                            <HoverStyle BackColor="#000040">
                            </HoverStyle>
                        </CellStyle>
                    </dxwgv:GridViewCommandColumn>
                    <dxwgv:GridViewDataTextColumn Caption="ClientType" FieldName="ClientType"
                        VisibleIndex="1" Width="80px" FixedStyle="Left">
                        <CellStyle CssClass="gridcellleft" Font-Size="11px" HorizontalAlign="Right">
                        </CellStyle>
                        <HeaderStyle HorizontalAlign="Center" />
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Form/Ref No" FieldName="FormNo"
                        VisibleIndex="2" Width="110px" FixedStyle="Left">
                        <CellStyle CssClass="gridcellleft" Font-Size="11px" HorizontalAlign="Right">
                        </CellStyle>
                        <HeaderStyle HorizontalAlign="Center" />
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Application No" FieldName="ApplicatnNo"
                        VisibleIndex="3" Width="110px" FixedStyle="Left">
                        <CellStyle CssClass="gridcellleft" Font-Size="11px" HorizontalAlign="Right">
                        </CellStyle>
                        <HeaderStyle HorizontalAlign="Center" />
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Client Name" FieldName="Name" VisibleIndex="4"
                        Width="180px" FixedStyle="Left">
                        <CellStyle CssClass="gridcellleft" Font-Size="11px">
                        </CellStyle>
                        <HeaderStyle HorizontalAlign="Center" />
                    </dxwgv:GridViewDataTextColumn>
                     <dxwgv:GridViewDataTextColumn Caption="Client ID" FieldName="ClntID" VisibleIndex="5"
                        Width="100px" >
                        <CellStyle CssClass="gridcellleft" Font-Size="11px">
                        </CellStyle>
                        <HeaderStyle HorizontalAlign="Center" />
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Client UCC" FieldName="ClntUCC" VisibleIndex="6"
                        Width="100px" >
                        <CellStyle CssClass="gridcellleft" Font-Size="11px">
                        </CellStyle>
                        <HeaderStyle HorizontalAlign="Center" />
                    </dxwgv:GridViewDataTextColumn>
                    
                    <dxwgv:GridViewDataTextColumn Caption="DOB" FieldName="DOB" VisibleIndex="7"
                        Width="170px">
                        <CellStyle CssClass="gridcellleft" Font-Size="11px">
                        </CellStyle>
                        <HeaderStyle HorizontalAlign="Center" />
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Registered Address" FieldName="RegisteredAddress" VisibleIndex="8"
                        Width="250px">
                        <CellStyle CssClass="gridcellleft" Font-Size="11px">
                        </CellStyle>
                        <HeaderStyle HorizontalAlign="Center" />
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Correspondence Address" FieldName="CorrespondenceAddress" VisibleIndex="9"
                        Width="250px">
                        <CellStyle CssClass="gridcellleft" Font-Size="11px">
                        </CellStyle>
                        <HeaderStyle HorizontalAlign="Center" />
                    </dxwgv:GridViewDataTextColumn>
                     <dxwgv:GridViewDataTextColumn Caption="Status" FieldName="Status" VisibleIndex="10"
                        Width="170px">
                        <CellStyle CssClass="gridcellleft" Font-Size="11px">
                        </CellStyle>
                        <HeaderStyle HorizontalAlign="Center" />
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Created By" FieldName="CreatedBy" VisibleIndex="11" 
                        Width="100px">
                        <CellStyle CssClass="gridcellleft" Font-Size="11px">
                        </CellStyle>
                        <HeaderStyle HorizontalAlign="Center" />
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Create DateTime" FieldName="CreateDateTime"
                        VisibleIndex="12">
                        <CellStyle CssClass="gridcellleft" Font-Size="11px">
                        </CellStyle>
                        <HeaderStyle HorizontalAlign="Center" />
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="RowID" FieldName="RowID" Visible="false"
                        VisibleIndex="13">
                        <CellStyle CssClass="gridcellleft" Font-Size="11px">
                        </CellStyle>
                        <HeaderStyle HorizontalAlign="Center" />
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="BindWith" FieldName="BindWith" Visible="false"
                        VisibleIndex="14">
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
         <dxcp:ASPxCallbackPanel ID="CbpComon" runat="server" ClientInstanceName="cCbpComon"
             OnCallback="CbpComon_Callback" BackColor="Transparent" Width="100%">
             <PanelCollection>
                <dxp:panelcontent runat="server">
                  <div id="Row00" class="Row">
                         <div id="Row00_Col0" class="LFloat_Lable Leftdiv">
                             <span class="Spanclass"><span style="font-size: 9pt; color: #000000">Application No:
                             </span></span> 
                         </div>
                         <div id="Row00_Col1" class="LFloat_Row" style="height: 25px">
                         
                         <dxcp:ASPxCallbackPanel ID="CbpAppliNo" runat="server" ClientInstanceName="cCbpAppliNo" BackColor="Transparent"
                            OnCallback="CbpAppliNo_Callback" Width="150px">
                             <clientsideevents endcallback="function (s, e) {CbpAppliNo_EndCallBack();}" />
                             <panelcollection>
                                <dxp:PanelContent runat="server">
                                     <dxe:ASPxTextBox ID="TxtAppliNo" runat="server" ClientInstanceName="cTxtAppliNo"
                                         Width="150px">
                                         <ClientSideEvents  TextChanged="CheckAppliNoExist"/>
                                     </dxe:ASPxTextBox>
                                </dxp:PanelContent>
                             </panelcollection>
                           </dxcp:ASPxCallbackPanel>
                         </div>
                         <div id="Row00_Col2" class="LFloat_Lable Leftdiv" style="margin-left: 10px" >
                             <span class="Spanclass">**</span>
                                 Application Date: 
                         </div>
                         <div id="Row00_Col3" class="LFloat_Row" style="height: 25px">
                             <dxe:ASPxDateEdit ID="AppliDt" runat="server" ClientInstanceName="cAppliDt" DateOnError="Today"
                                 EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="150px"
                                 Font-Size="11px" TabIndex="0">
                                 <ClientSideEvents GotFocus="AppliNoAlert" />
                             </dxe:ASPxDateEdit>
                         </div>
                         <span class="Spanclass">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; **</span>
                         <span style="font-size: 8pt">Mandatory Fields To Be Filled</span>
                     </div>
                     <div id="Row01" class="Row">
                         <div id="Row01_Col0" class="LFloat_Lable Leftdiv"  style="height: 30px">
                             <span class="Spanclass">**</span>
                                  Form No/Refference No: 
                         </div>
                         <div id="Row01_Col1" class="LFloat_Row" style="height: 30px">
                          <dxcp:ASPxCallbackPanel ID="CbpFormNo" runat="server" ClientInstanceName="cCbpFormNo" BackColor="Transparent"
                            OnCallback="CbpFormNo_Callback" Width="150px">
                             <clientsideevents endcallback="function (s, e) {CbpFormNo_EndCallBack();}" />
                             <panelcollection>
                                <dxp:PanelContent runat="server">
                                <dxe:ASPxTextBox runat="server" Width="150px" ClientInstanceName="cTxtFormNo" ID="TxtFormNo"></dxe:ASPxTextBox>

                                 </dxp:PanelContent>
                                </panelcollection>
                           </dxcp:ASPxCallbackPanel>
                         </div>
                         <div id="Row01_Col2" class="LFloat_Lable Leftdiv" style="margin-left: 10px;height: 30px" >
                             <span style="font-size: 9pt;color: #000000">
                                Client ID (UCC) : </span>
                         </div>
                         <div id="Row01_Col3" class="LFloat_Row" style="height: 30px">
                             <dxcp:ASPxCallbackPanel ID="CbpUcc" runat="server" ClientInstanceName="cCbpUcc" BackColor="Transparent"
                                 OnCallback="CbpUcc_Callback" Width="150px">
                                 <clientsideevents endcallback="function (s, e) {CbpUcc_EndCallBack();}" />
                                 <panelcollection>
                                    <dxp:PanelContent runat="server">
                                    <dxe:ASPxTextBox runat="server" Width="150px" ClientInstanceName="cTxtCntUcc" ID="TxtCntUcc" ></dxe:ASPxTextBox>

                                 <dxe:ASPxButton runat="server" AutoPostBack="False" ClientInstanceName="cLinkUcc" Text="  Make System Generate UCC" Cursor="pointer" EnableDefaultAppearance="False" Font-Size="11px" Font-Underline="True" ForeColor="Blue" ID="LinkUcc">
                                <ClientSideEvents Click="function(s, e) {LinkUcc_Click();}"></ClientSideEvents>
                                </dxe:ASPxButton>

                                 </dxp:PanelContent>
                                </panelcollection>
                             </dxcp:ASPxCallbackPanel>
                             &nbsp;
                         </div> 
                     </div>
                    
                     <div id="DivBtnSaveCmn" class="left" style="margin-left: 10px; font-size: 12pt;">
                         <dxe:ASPxButton ID="BtnSaveCmn" runat="server" AutoPostBack="false" TabIndex="0"
                             Text="Save [M]ain" ToolTip="Save Entered Data" Width="100px" ClientInstanceName="cBtnSaveCmn" AccessKey="m">
                             <Border BorderColor="White"></Border>
                             <ClientSideEvents Click="function(s, e) {SaveCommon();}"  ></ClientSideEvents>
                         </dxe:ASPxButton>
                     </div>
                     <div id="DivBtnEditCmn" class="left" style="margin-left: 10px; font-size: 12pt;">
                         <dxe:ASPxButton ID="BtnEditCmn" runat="server" AutoPostBack="false" TabIndex="0"
                             Text="Edit" ToolTip="Edit Entered Data" Width="100px" ClientInstanceName="cBtnEditCmn">
                             <Border BorderColor="White"></Border>
                             <ClientSideEvents Click="function(s, e) {EditCommon();}"></ClientSideEvents>
                         </dxe:ASPxButton>
                     </div>
                    <br />
                    <br />
                    <br />
                    <br />
                     <div id="DivApliNoAlert"  style="width:1200px;font-size:9pt;height:30px"></div>
                     <br />
                     <br />
                    <br />
                    
                 </dxp:panelcontent>
             </PanelCollection>
            <ClientSideEvents EndCallback="function (s, e) {CbpComon_EndCallBack();}" />
         </dxcp:ASPxCallbackPanel>
        
         <div id="Div_Identity" class="AccordionContainer" style="width:99%">
          <div>
               <div class="DivHeader" style="width: 100%" onselectstart="return false;">&nbsp; IDENTITY DETAILS 
               </div>
          </div>
             <div id="Accordion1Content" class="AccordionContent" style="left: 0px; top: 0px">
                 <dxcp:ASPxCallbackPanel ID="CbpIdntty" runat="server" ClientInstanceName="cCbpIdntty"
                     OnCallback="CbpIdntty_Callback" BackColor="Transparent" Width="100%">
                     <PanelCollection>
                         <dxp:panelcontent runat="server">
                             <div id="Row0" class="Row">
                                 <div id="Row0_Col0" class="LFloat_Lable Leftdiv BtmMargin">
                                     <span class="Spanclass">**</span> Name Of The Applicant:
                                 </div>
                                 <div id="Row0_Col1" class="LFloat_Row BtmMargin" style="height: 25px; text-align: center;">
                                     <dxe:ASPxTextBox ID="TxtApplicntName" runat="server" ClientInstanceName="cTxtApplicntName"
                                         Width="155px" NullText="First Name" ForeColor="Silver" HorizontalAlign="Center">
                                         <ClientSideEvents TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                         </ClientSideEvents>
                                     </dxe:ASPxTextBox>
                                 </div>
                                 <div id="Row0_Col2" class="LFloat_Row DivName">
                                     <dxe:ASPxTextBox ID="TxtApplicntMidlName" runat="server" ClientInstanceName="cTxtApplicntMidlName"
                                         Width="155px" NullText="Middle Name" ForeColor="Silver" HorizontalAlign="Center">
                                         <ClientSideEvents TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                         </ClientSideEvents>
                                     </dxe:ASPxTextBox>
                                 </div>
                                 <div id="Row0_Col3" class="LFloat_Row DivName">
                                     <dxe:ASPxTextBox ID="TxtApplicntLstName" runat="server" ClientInstanceName="cTxtApplicntLstName"
                                         Width="155px" NullText="Last Name" ForeColor="Silver" HorizontalAlign="Center">
                                         <ClientSideEvents TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                         </ClientSideEvents>
                                     </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row1" class="Row">
                                 <div id="Row1_Col0" class="LFloat_Lable Leftdiv">
                                     Date Of Incorporation:
                                 </div>
                                 <div id="Row1_Col1" class="LFloat_Row" style="height: 25px">
                                     <dxe:ASPxDateEdit ID="IncorpDt" runat="server" ClientInstanceName="cIncorpDt" DateOnError="Today"
                                         EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="155px"
                                         Font-Size="11px" TabIndex="0">
                                     </dxe:ASPxDateEdit>
                                 </div>
                             </div>
                             <div id="Row2">
                                 <div id="Row2_Col0" class="LFloat_Lable Leftdiv" style="margin-left: 10px; width: 155px;">
                                     Place Of Incorporation :
                                 </div>
                                 <div id="Row2_Col1" class="LFloat_Row" style="height: 25px">
                                     <dxe:ASPxComboBox ID="ComboIncorpPlc" runat="server" ClientInstanceName="cComboIncorpPlc"
                                         EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                         Width="155px">
                                         <ClientSideEvents SelectedIndexChanged="function(s,e){OnTypeChange()}" TextChanged="onClientChange">
                                         </ClientSideEvents>
                                     </dxe:ASPxComboBox>
                                 </div>
                             </div>
                             <div id="Row3" class="Row">
                                 <div id="Row3_Col0" class="LFloat_Lable Leftdiv" style="height: 37px">
                                     Date Of Commencement Of Business:
                                 </div>
                                 <div id="Row3_Col1" class="LFloat_Row" style="height: 37px">
                                     <dxe:ASPxDateEdit ID="ComncmntDt" runat="server" ClientInstanceName="cComncmntDt"
                                         DateOnError="Today" EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True"
                                         Width="155px" Font-Size="11px" TabIndex="0">
                                     </dxe:ASPxDateEdit>
                                 </div>
                             </div>
                             <div id="Row4" class="Row">
                                 <div id="Row4_Col0" class="LFloat_Lable Leftdiv">
                                     <span class="Spanclass">**</span> Father's / Spouse Name:
                                 </div>
                                 <div id="Row4_Col1" class="LFloat_Row" style="height: 25px">
                                     <dxe:ASPxTextBox ID="TxtFthrName" runat="server" ClientInstanceName="cTxtFthrName"
                                         Width="500px">
                                     </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row5" class="Row">
                                 <div id="Row5_Col0" class="LFloat_Lable Leftdiv">
                                     Gender:
                                 </div>
                                 <div id="Row5_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                     <asp:RadioButton ID="rdMale" runat="server" Checked="True"  Text="Male" GroupName="a" TabIndex="0" />
                                     
                                     <asp:RadioButton ID="rdFemale" runat="server" Checked="False"  Text="Female" GroupName="a" TabIndex="0" />
                                     
                                 </div>
                             </div>
                             <div id="Row6">
                                 <div id="Row6_Col0" class="LFloat_Row Leftdiv" style="margin-left: 10px">
                                     Marital Status:
                                 </div>
                                 <div id="Row6_Col1" class="LFloat_Row FontChange" style="height: 25px; margin-left: 10px">
                                     <asp:RadioButton ID="rdSingl" runat="server" Checked="True" GroupName="b"  Text="Single" TabIndex="0" />
                                     
                                     <asp:RadioButton ID="rdMrd" runat="server" Checked="False" GroupName="b"  Text="Married" TabIndex="0" />
                                     
                                 </div>
                             </div>
                             <div id="Row7" class="Row">
                                 <div id="Row7_Col0" class="LFloat_Lable Leftdiv">
                                     Date Of Birth:
                                 </div>
                                 <div id="Row7_Col1" class="LFloat_Row" style="height: 25px">
                                     <dxe:ASPxDateEdit ID="dobDt" runat="server" ClientInstanceName="cdobDt" DateOnError="Today"
                                         EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="150px"
                                         Font-Size="11px" TabIndex="0">
                                     </dxe:ASPxDateEdit>
                                 </div>
                             </div>
                             <div id="Row8" class="Row">
                                 <div id="Row8_Col0" class="LFloat_Lable Leftdiv" style="height: 35px">
                                     Nationality:
                                 </div>
                                 <div id="Row8_Col1" class="LFloat_Row" style="height: 35px">
                                     <div class="left">
                                         <dxe:ASPxRadioButton ID="rdIndian" runat="server" ClientInstanceName="crdIndian" Checked="True" Text="Indian"  Layout="Flow"
                                                 GroupName="c" TabIndex="0" >
                                                <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdOthr.GetChecked(),'div_othr');}"></ClientSideEvents>
                                         </dxe:ASPxRadioButton>
                                             
                                         <dxe:ASPxRadioButton ID="rdOthr" runat="server" ClientInstanceName="crdOthr" Checked="False" Text="Other" Layout="Flow"
                                                 GroupName="c" TabIndex="0" >
                                                 <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdOthr.GetChecked(),'div_othr');}"></ClientSideEvents>
                                         </dxe:ASPxRadioButton>
                                         
                                     </div>
                                     <div id="div_othr" class="left FontChange" style="margin-left: 2px">
                                         <dxe:ASPxTextBox ID="TxtOthr" runat="server" ClientInstanceName="cTxtOthr" Width="150px">
                                         </dxe:ASPxTextBox>
                                         (Please Specify)
                                     </div>
                                 </div>
                             </div>
                             <div id="Row9" class="Row">
                                 <div id="Row9_Col0" class="LFloat_Lable Leftdiv">
                                     Status:
                                 </div>
                                 <div id="Row9_Col1" class="LFloat_Row" style="height: 25px">
                             
                                     <div class="left">
                                      
                                            <dxe:ASPxComboBox ID="ComboStatus"  OnCallback="ComboStatus_Callback" runat="server" EnableIncrementalFiltering="True" ValueType="System.String" Width="156px" ClientInstanceName="cComboStatus" Font-Size="Small" >
                                            <ClientSideEvents SelectedIndexChanged="function(s,e){OnStatusChange()}" EndCallback =" function(s,e){ComboStatus_EndCallback()}"></ClientSideEvents>
                                            </dxe:ASPxComboBox>
                                     </div>
                                     <div id="divOthrStatus" class="left FontChange" style="margin-left: 10px">
                                         <dxe:ASPxTextBox ID="TxtOthrStatus" runat="server" ClientInstanceName="cTxtOthrStatus"
                                             Width="150px">
                                         </dxe:ASPxTextBox>
                                         (Please Specify)
                                     </div>
                                 </div>
                             </div>
                             <div id="Row10" class="Row">
                                 <div id="Row10_Col0" class="LFloat_Lable Leftdiv" style="height: 35px">
                                     <span class="Spanclass">**</span> PAN:
                                 </div>
                                 <div id="Row10_Col1" class="LFloat_Row FontChange" style="height: 35px">
                                     <dxe:ASPxTextBox ID="TxtPan" runat="server" ClientInstanceName="cTxtPan" MaxLength="10"
                                         Width="150px">
                                     </dxe:ASPxTextBox>
                                     (Attach attested copy of PAN Card)
                                 </div>
                                 <div id="Row10_Col2" class="LFloat_Lable Leftdiv" style="height: 35px; margin-left: 10px; width: 100px;">
                                     Is PAN Exempt:
                                 </div>
                                 <div id="Row10_Col3" class="LFloat_Row FontChange" style="height: 35px;">
                                     <dxe:ASPxRadioButton ID="rdPanxmptY" runat="server" Checked="False" GroupName="z" TabIndex="0" ClientInstanceName="crdPanxmptY">
                                        <ClientSideEvents  ValueChanged="function(s,e){OnCheckedShowHide(crdPanxmptN.GetChecked(),'Row10_Col1');}" CheckedChanged="function(s,e){OnCheckedShowHide(crdPanxmptY.GetChecked(),'DivPanExempt');}"></ClientSideEvents>
                                     </dxe:ASPxRadioButton>
                                     YES
                                     <dxe:ASPxRadioButton ID="rdPanxmptN" runat="server" Checked="True" GroupName="z" TabIndex="0" ClientInstanceName="crdPanxmptN" >
                                        <ClientSideEvents  ValueChanged="function(s,e){OnCheckedShowHide(crdPanxmptN.GetChecked(),'Row10_Col1');}" CheckedChanged="function(s,e){OnCheckedShowHide(crdPanxmptY.GetChecked(),'DivPanExempt');}"></ClientSideEvents>
                                     </dxe:ASPxRadioButton>
                                     NO
                                 </div>
                                 <div id="DivPanExempt" class="LFloat_Row" style="height: 35px; margin-left: 10px">
                                     <dxe:ASPxComboBox ID="ComboPanExempt" runat="server" ClientInstanceName="cComboPanExempt" EnableIncrementalFiltering="True"
                                        Font-Size="12px" SelectedIndex="0" ValueType="System.String" Width="200px" Height="25px">
                                         <Items>
                                             <dxe:ListEditItem Text="Sikkim resident" Value="1" />
                                             <dxe:ListEditItem Text="Transactions undertaken on behalf of Central Government and/or State Government and by officials appointed by Courts" Value="3" />
                                             <dxe:ListEditItem Text="UN entities/multilateral agencies exempt from paying taxes/filing tax returns in India." Value="6" />
                                             <dxe:ListEditItem Text="SIP of Mutual Funds upto Rs 50, 000/- p.a." Value="9" />
                                          </Items>
                                         <DropDownButton text="PanExempt">
                                         </DropDownButton>
                                     </dxe:ASPxComboBox>
                                 </div>
                             </div>
                             <div id="Row11" class="Row">
                                 <div id="Row11_Col0" class="LFloat_Lable Leftdiv">
                                      <span class="Spanclass">**</span> Registration No. (e.g. CIN)</div>
                                 <div id="Row11_Col1" class="LFloat_Row" style="height: 25px">
                                     <dxe:ASPxTextBox ID="TxtRegNo" runat="server" ClientInstanceName="cTxtRegNo" 
                                         Width="150px">
                                     </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row12" class="Row">
                                 <div id="Row12_Col0" class="LFloat_Lable Leftdiv" style="height: 37px">
                                     Unique Identification Number(UID) / Adhaar (If Any):</div>
                                 <div id="Row12_Col1" class="LFloat_Row" style="height: 37px">
                                     <dxe:ASPxTextBox ID="TxtUIN" runat="server" ClientInstanceName="cTxtUIN" MaxLength="12"
                                         HorizontalAlign="Right" Width="150px">
                                         <MaskSettings Mask="<0..999999999>" />
                                     </dxe:ASPxTextBox>
                                 </div>
                             </div>
                             <div id="Row13" class="Row">
                                 <div id="Row13_Col0" class="LFloat_Lable Leftdiv" style="height: 37px">
                                     Specify The Proof Of Identity Submitted:
                                 </div>
                                 <div id="Row13_Col1" class="LFloat_Row FontChange" style="height: 37px">
                                         <dxe:ASPxComboBox ID="ComboIdentityProof" runat="server" ClientInstanceName="cComboIdentityProof" EnableIncrementalFiltering="True"
                                                Font-Size="12px" SelectedIndex="0" ValueType="System.String" Width="200px" Height="25px">
                                             <Items>
                                                 <dxe:ListEditItem Text="Unique Identification Number (UID) (Aadhaar)" Value="1" />
                                                 <dxe:ListEditItem Text="Passport" Value="2" />
                                                 <dxe:ListEditItem Text="Voter ID Card" Value="3" />
                                                 <dxe:ListEditItem Text="PAN Card with Photograph" Value="4" />
                                                 <dxe:ListEditItem Text="ID Card with photo issued by Central / State Govt" Value="5" />
                                                 <dxe:ListEditItem Text="ID Card with photo issued by Statutory/Regulatory Authorities" Value="6" />
                                                 <dxe:ListEditItem Text="ID Card with photo issued by Public Sector Undertakings" Value="7" />
                                                 <dxe:ListEditItem Text="ID Card with photo issued by Scheduled Commercial Banks" Value="8" />
                                                 <dxe:ListEditItem Text="ID Card with photo issued by Public Financial Institutions" Value="9" />
                                                 <dxe:ListEditItem Text="ID Card with photo issued by Colleges affiliated to Universities" Value="10" />
                                                 <dxe:ListEditItem Text="ID Card with photo issued by Professional Bodies such as ICAI, ICWAI, ICSI, Bar Council etc., to their Members" Value="11" />
                                                 <dxe:ListEditItem Text="Credit cards/Debit cards issued by Banks" Value="2" />
                                                 <dxe:ListEditItem Text="Others" Value="12" />
                                            </Items>
                                            <ClientSideEvents  SelectedIndexChanged="IdChange"/> 
                                         </dxe:ASPxComboBox>
                                     
                                 </div>
                                
                                 <div id="divOthrID" class="LFloat_Row FontChange LeftMargin" style="height: 37px;">
                                     <dxe:ASPxTextBox ID="TxtOthrProof" runat="server" ClientInstanceName="cTxtOthrProof"
                                         Width="150px">
                                     </dxe:ASPxTextBox>
                                     (Please Specify)
                                 </div>
                                
                             </div>
                             
                             <div id="DivBtnSaveIdntty" class="right" style="margin-left: 10px; font-size: 12pt; margin-right: 10px;">
                                 <dxe:ASPxButton ID="BtnSaveIdntty" runat="server" AutoPostBack="false" TabIndex="0"
                                     Text="Save [I]dentity Detail" ToolTip="Save Entered Data" Width="140px" ClientInstanceName="cBtnSaveIdntty" AccessKey="i">
                                     <Border BorderColor="White"></Border>
                                     <ClientSideEvents Click="function(s, e) {SaveIdentity();}"></ClientSideEvents>
                                 </dxe:ASPxButton>
                             </div>
                             <div id="DivBtnEditIdntty" class="right" style="margin-left: 10px; font-size: 12pt;">
                                 <dxe:ASPxButton ID="BtnEditIdntty" runat="server" AutoPostBack="false" TabIndex="0"
                                     Text="Edit" ToolTip="Edit Entered Data" Width="100px" ClientInstanceName="cBtnEditIdntty">
                                     <Border BorderColor="White"></Border>
                                     <ClientSideEvents Click="function(s, e) {EditIdentity();}"></ClientSideEvents>
                                 </dxe:ASPxButton>
                             </div>
                             <br />
                             <br />
                              <br /> <br /> 
                             <div id="DivIdnttyAlrt" class="Success BtmMargin" style="margin-top:10px; width:800px;font-size:9pt;">
                             Identity Section Submitted Successfully !!
                             </div>
                             <br /> <br />
                         </dxp:panelcontent>
                     </PanelCollection>
                     <ClientSideEvents EndCallback="function (s, e) {CbpIdntty_EndCallBack();}" />
                 </dxcp:ASPxCallbackPanel>
             </div>
             <div>
               <div class="DivHeader" style="width: 100%" onselectstart="return false;">&nbsp; ADDRESS DETAILS 
               </div>
             </div>
             <div id="Accordion2Content" class="AccordionContent">
                 <dxcp:ASPxCallbackPanel ID="CbpAdrs" runat="server" ClientInstanceName="cCbpAdrs"
                     OnCallback="CbpAdrs_Callback" BackColor="Transparent" Width="100%">
                     <PanelCollection>
                         <dxp:panelcontent runat="server">
                             <div id="Row15" class="Row">
                                 <div id="Row15_Col0" class="LFloat_Lable Leftdiv">
                                     <span class="Spanclass">**</span> Correspondence Address:
                                 </div>
                                 <div id="Row15_Col1" class="LFloat_Row FontChange" style="width: 57%">
                                     <div style="margin-bottom: 2px">
                                         <dxe:ASPxTextBox ID="TxtAddress1" runat="server" ClientInstanceName="cTxtAddress1"
                                             NullText="                                              House No" ForeColor="Silver" HorizontalAlign="left" Width="460px">
                                             <ClientSideEvents TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                             </ClientSideEvents>
                                         </dxe:ASPxTextBox>
                                     </div>
                                     <div style="margin-bottom: 2px">
                                         <dxe:ASPxTextBox ID="TxtAddress2" runat="server" ClientInstanceName="cTxtAddress2"
                                             NullText="                                           Street Name" ForeColor="Silver" HorizontalAlign="left" Width="460px">
                                             <ClientSideEvents TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                             </ClientSideEvents>
                                         </dxe:ASPxTextBox>
                                     </div>
                                     <div style="margin-bottom: 2px">
                                         <dxe:ASPxTextBox ID="TxtAddress3" runat="server" ClientInstanceName="cTxtAddress3"
                                             NullText="                                             Area Name" ForeColor="Silver" HorizontalAlign="left" Width="460px">
                                             <ClientSideEvents  TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                             </ClientSideEvents>
                                         </dxe:ASPxTextBox>
                                     </div>
                                     <div class="left" style="width: 99%">
                                         <div class="left" style="height: 25px">
                                             City/Town/Village :
                                         </div>
                                         <div class="left" style="height: 25px">
                                             <dxe:ASPxComboBox ID="ComboCity" runat="server" ClientInstanceName="cComboCity" EnableIncrementalFiltering="True"
                                                 Font-Size="Small" SelectedIndex="0" ValueType="System.String" Width="150px">
                                                 <ClientSideEvents SelectedIndexChanged="function(s,e){OnTypeChange()}" TextChanged="onClientChange">
                                                 </ClientSideEvents>
                                             </dxe:ASPxComboBox>
                                         </div>
                                         <div class="left" style="height: 25px">
                                             PinCode :
                                         </div>
                                         <div class="left" style="height: 25px">
                                             <dxe:ASPxTextBox ID="TxtPin" runat="server" ClientInstanceName="cTxtPin" Width="150px"
                                                 HorizontalAlign="right">
                                                 <MaskSettings Mask="<0..999999999>" />
                                             </dxe:ASPxTextBox> 
                                         </div>
                                     </div>
                                     <div class="left" style="height: 30px">
                                         <dxe:ASPxComboBox ID="ComboState" runat="server" ClientInstanceName="cComboState"
                                             EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                             Width="150px">
                                             <DropDownButton Text="State">
                                             </DropDownButton>
                                             <ClientSideEvents SelectedIndexChanged="function(s,e){OnStateChange('1')}" TextChanged="onClientChange">
                                             </ClientSideEvents>
                                         </dxe:ASPxComboBox>
                                     </div>
                                     <div id ="DivStateOthr" class="left" style="height: 30px;margin-left: 2px">
                                           
                                         <dxe:ASPxTextBox ID="TxtStateOthr" runat="server" ClientInstanceName="cTxtStateOthr"
                                             Width="150px">
                                         </dxe:ASPxTextBox>
                                         (Please Specify)
                                    
                                     </div>
                                     <div class="left" style="height: 30px; margin-left: 4px;">
                                         <dxe:ASPxComboBox ID="ComboCountry" runat="server" ClientInstanceName="cComboCountry"
                                             EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                             Width="150px">
                                             <DropDownButton Text="Country">
                                             </DropDownButton>
                                             <ClientSideEvents SelectedIndexChanged="function(s,e){OnTypeChange()}" TextChanged="onClientChange">
                                             </ClientSideEvents>
                                         </dxe:ASPxComboBox>
                                     </div>
                                 </div>
                             </div>
                             <div id="Row16" class="Row">
                                 <div id="Row16_Col0" class="LFloat_Lable Leftdiv" style="height: 60px">
                                     Proof Of Address To Be Provided By Applicant<br />
                                     <strong>(For Correspondence Address )</strong>:
                                 </div>
                                 <div id="Row16_Col1" class="LFloat_Row FontChange" style="width: 57%">
                                     <dxe:ASPxRadioButton ID="rdPassprt" runat="server" Checked="True" ClientInstanceName="crdPassprt"
                                         GroupName="f" TabIndex="0">
                                         <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdOthrAdrsPrf.GetChecked(),'DivOthrAdrsPrf');}"></ClientSideEvents>
                                     </dxe:ASPxRadioButton>
                                     ** Passport
                                     <br />
                                    <dxe:ASPxRadioButton ID="rdRatncrd" runat="server" Checked="False" ClientInstanceName="crdRatncrd"
                                         GroupName="f" TabIndex="0" >
                                         <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdOthrAdrsPrf.GetChecked(),'DivOthrAdrsPrf');}"></ClientSideEvents>
                                     </dxe:ASPxRadioButton>
                                     Ration Card<br />
                                    <dxe:ASPxRadioButton ID="rdAgrmnt" runat="server" Checked="False" ClientInstanceName="crdAgrmnt"
                                         GroupName="f" TabIndex="0" >
                                         <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdOthrAdrsPrf.GetChecked(),'DivOthrAdrsPrf');}"></ClientSideEvents>
                                     </dxe:ASPxRadioButton>
                                     Registered Lease/Sale Agreement of Residence/Office<br />
                                    <dxe:ASPxRadioButton ID="rdDrvlc" runat="server" Checked="False" ClientInstanceName="crdDrvlc"
                                         GroupName="f" TabIndex="0" >
                                         <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdOthrAdrsPrf.GetChecked(),'DivOthrAdrsPrf');}"></ClientSideEvents>
                                     </dxe:ASPxRadioButton>
                                     Driving License<br />
                                    <dxe:ASPxRadioButton ID="rdVotr" runat="server" Checked="False" ClientInstanceName="crdVotr"
                                         GroupName="f" TabIndex="0" >
                                         <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdOthrAdrsPrf.GetChecked(),'DivOthrAdrsPrf');}"></ClientSideEvents>
                                     </dxe:ASPxRadioButton>
                                     Voter Identity Card<br />
                                    <dxe:ASPxRadioButton ID="rdBnkAc" runat="server" Checked="False" ClientInstanceName="crdBnkAc"
                                         GroupName="f" TabIndex="0" >
                                         <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdOthrAdrsPrf.GetChecked(),'DivOthrAdrsPrf');}"></ClientSideEvents>
                                    </dxe:ASPxRadioButton>
                                     Latest Bank Account Statement/Passbook<br />
                                    <dxe:ASPxRadioButton ID="rdTelBil" runat="server" Checked="False" ClientInstanceName="crdTelBil"
                                         GroupName="f" TabIndex="0" >
                                         <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdOthrAdrsPrf.GetChecked(),'DivOthrAdrsPrf');}"></ClientSideEvents>
                                    </dxe:ASPxRadioButton>
                                     Latest Land Line Telephone Bill<br />
                                    <dxe:ASPxRadioButton ID="rdElecBil" runat="server" Checked="False" ClientInstanceName="crdElecBil"
                                         GroupName="f" TabIndex="0" >
                                      <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdOthrAdrsPrf.GetChecked(),'DivOthrAdrsPrf');}"></ClientSideEvents>
                                    </dxe:ASPxRadioButton>   
                                     Latest Electricity Bill<br />
                                    <dxe:ASPxRadioButton ID="rdGasBil" runat="server" Checked="False" ClientInstanceName="crdGasBil"
                                         GroupName="f" TabIndex="0" >
                                         <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdOthrAdrsPrf.GetChecked(),'DivOthrAdrsPrf');}"></ClientSideEvents>
                                     </dxe:ASPxRadioButton>
                                     Latest Gas Bill
                                     <br />
                                     <dxe:ASPxRadioButton ID="rdOthrAdrsPrf" runat="server" Checked="False" ClientInstanceName="crdOthrAdrsPrf"
                                         GroupName="f" TabIndex="0" >
                                         <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdOthrAdrsPrf.GetChecked(),'DivOthrAdrsPrf');}"></ClientSideEvents>
                                     </dxe:ASPxRadioButton>
                                     Others
                                     <div id="DivOthrAdrsPrf" style="margin-left: 2px">
                                         <dxe:ASPxTextBox ID="TxtOthrAdrsPrf" runat="server" ClientInstanceName="cTxtOthrAdrsPrf"
                                             Width="150px">
                                         </dxe:ASPxTextBox>
                                         (Please Specify)<br />
                                     </div>
                                     <br />
                                     <div class="left" style="height: 25px; width: 377px;">
                                         **Not more than 3 Months old. Validity/Expiry Date of Proof of address submitted:</div>
                                     <div class="left" style="height: 25px;">
                                         <dxe:ASPxDateEdit ID="ValidDt" runat="server" ClientInstanceName="cValidDt" DateOnError="Today"
                                             EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="150px"
                                             Font-Size="11px" TabIndex="0">
                                         </dxe:ASPxDateEdit>
                                     </div>
                                 </div>
                             </div>
                             <div id="Row17" class="Row">
                                 <div id="Row17_Col0" class="LFloat_Lable Leftdiv">
                                     <span class="Spanclass">**</span> Permanent &nbsp;Address:
                                 </div>
                                 <div id="Row17_Col1" class="LFloat_Lable Leftdiv">
                                     <span class="Spanclass">**</span> Registered &nbsp;Address:
                                 </div>
                                 <div id="Row16_Col2" class="LFloat_Row FontChange" style="width: 57%">
                                     <div style="margin-bottom: 2px">
                                         <dxe:ASPxTextBox ID="TxtAddress1P" runat="server" ClientInstanceName="cTxtAddress1P"
                                             NullText="                                            House No" ForeColor="Silver" HorizontalAlign="left" Width="460px">
                                             <ClientSideEvents TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                             </ClientSideEvents>
                                         </dxe:ASPxTextBox>
                                     </div>
                                     <div style="margin-bottom: 2px">
                                         <dxe:ASPxTextBox ID="TxtAddress2P" runat="server" ClientInstanceName="cTxtAddress2P"
                                             NullText="                                          Street Name" ForeColor="Silver" HorizontalAlign="left" Width="460px">
                                             <ClientSideEvents TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                             </ClientSideEvents>
                                         </dxe:ASPxTextBox>
                                     </div>
                                     <div style="margin-bottom: 2px">
                                         <dxe:ASPxTextBox ID="TxtAddress3P" runat="server" ClientInstanceName="cTxtAddress3P"
                                             NullText="                                           Area Name" ForeColor="Silver" HorizontalAlign="left" Width="460px">
                                             <ClientSideEvents TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                             </ClientSideEvents>
                                         </dxe:ASPxTextBox>
                                     </div>
                                     <div class="left" style="width: 99%">
                                         <div class="left" style="height: 25px">
                                             City/Town/Village :
                                         </div>
                                         <div class="left" style="height: 25px">
                                             <dxe:ASPxComboBox ID="ComboCityP" runat="server" ClientInstanceName="cComboCityP"
                                                 EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                 Width="150px">
                                                 <ClientSideEvents SelectedIndexChanged="function(s,e){OnTypeChange()}" TextChanged="onClientChange">
                                                 </ClientSideEvents>
                                             </dxe:ASPxComboBox>
                                         </div>
                                         <div class="left" style="height: 25px">
                                             PinCode :
                                         </div>
                                         <div class="left" style="height: 25px">
                                             <dxe:ASPxTextBox ID="TxtPinP" runat="server" ClientInstanceName="cTxtPinP" Width="150px"
                                                 HorizontalAlign="right">
                                                 <MaskSettings Mask="<0..999999999>" />
                                             </dxe:ASPxTextBox>
                                         </div>
                                     </div>
                                     <div class="left" style="height: 30px">
                                         <dxe:ASPxComboBox ID="ComboStateP" runat="server" ClientInstanceName="cComboStateP"
                                             EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                             Width="150px">
                                             <DropDownButton Text="State">
                                             </DropDownButton>
                                             <ClientSideEvents SelectedIndexChanged="function(s,e){OnStateChange('2')}" TextChanged="onClientChange">
                                             </ClientSideEvents>
                                         </dxe:ASPxComboBox>
                                         
                                     </div>
                                     <div  id="DivStateOthrP" class="left" style="height: 30px;margin-left: 2px">
                                           
                                         <dxe:ASPxTextBox ID="TxtStateOthrP" runat="server" ClientInstanceName="cTxtStateOthrP"
                                             Width="150px">
                                         </dxe:ASPxTextBox>
                                         (Please Specify)
                                    
                                     </div>
                                     <div class="left" style="height: 30px; margin-left: 4px;">
                                         <dxe:ASPxComboBox ID="ComboCountryP" runat="server" ClientInstanceName="cComboCountryP"
                                             EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                             Width="150px">
                                             <DropDownButton Text="Country">
                                             </DropDownButton>
                                             <ClientSideEvents SelectedIndexChanged="function(s,e){OnTypeChange()}" TextChanged="onClientChange">
                                             </ClientSideEvents>
                                         </dxe:ASPxComboBox>
                                     </div>
                                      
                                     
                                 </div>
                             </div>
                             <div id="Row17_Col3" class="left" style="font-size: 12px">
                                 <dxe:ASPxCheckBox ID="CbSame" runat="server" ClientInstanceName="cCbSame" ToolTip="Same As The Corresponding Address" 
                                     Checked="False" >
                                     <ClientSideEvents CheckedChanged="OnCheckedChanged" />
                                 </dxe:ASPxCheckBox>
                                 Same As The Correspondence Address
                             </div>
                             <div id="Row18" class="Row">
                                 <div id="Row18_Col0" class="LFloat_Lable Leftdiv" style="height: 60px">
                                     Proof Of Address To Be Provided By Applicant<br />
                                     <strong>(For Permanent Address )</strong>:
                                 </div>
                                 <div id="Row18_Col1" class="LFloat_Row FontChange" style="width: 57%">
                                     <dxe:ASPxRadioButton ID="rdPassprtP" runat="server" Checked="True" ClientInstanceName="crdPassprtP"
                                         GroupName="t" TabIndex="0">
                                        <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdOthrAdrsPrfP.GetChecked(),'DivOthrAdrsPrfP');}"></ClientSideEvents>
                                     </dxe:ASPxRadioButton>
                                     Passport
                                     <br />
                                     <dxe:ASPxRadioButton ID="rdRatncrdP" runat="server" Checked="False" ClientInstanceName="crdRatncrdP"
                                         GroupName="t" TabIndex="0" >
                                         <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdOthrAdrsPrfP.GetChecked(),'DivOthrAdrsPrfP');}"></ClientSideEvents>
                                     </dxe:ASPxRadioButton>
                                     Ration Card<br />
                                     <dxe:ASPxRadioButton ID="rdAgrmntP" runat="server" Checked="False" ClientInstanceName="crdAgrmntP" 
                                         GroupName="t" TabIndex="0" >
                                         <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdOthrAdrsPrfP.GetChecked(),'DivOthrAdrsPrfP');}"></ClientSideEvents>
                                     </dxe:ASPxRadioButton>
                                     Registered Lease/Sale Agreement of Residence/Office<br />
                                     <dxe:ASPxRadioButton ID="rdDrvlcP" runat="server" Checked="False"  ClientInstanceName="crdDrvlcP"
                                         GroupName="t" TabIndex="0" >
                                         <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdOthrAdrsPrfP.GetChecked(),'DivOthrAdrsPrfP');}"></ClientSideEvents>
                                     </dxe:ASPxRadioButton>
                                     Driving License<br />
                                     <dxe:ASPxRadioButton ID="rdVotrP" runat="server" Checked="False"  ClientInstanceName="crdVotrP" 
                                         GroupName="t" TabIndex="0" >
                                         <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdOthrAdrsPrfP.GetChecked(),'DivOthrAdrsPrfP');}"></ClientSideEvents>
                                     </dxe:ASPxRadioButton>
                                     Voter Identity Card<br />
                                     <dxe:ASPxRadioButton ID="rdBnkAcP" runat="server" Checked="False" ClientInstanceName="crdBnkAcP" 
                                         GroupName="t" TabIndex="0" >
                                         <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdOthrAdrsPrfP.GetChecked(),'DivOthrAdrsPrfP');}"></ClientSideEvents>
                                     </dxe:ASPxRadioButton>
                                     ** Latest Bank Account Statement/Passbook<br />
                                     <dxe:ASPxRadioButton ID="rdTelBilP" runat="server" Checked="False" ClientInstanceName="crdTelBilP"
                                         GroupName="t" TabIndex="0" >
                                         <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdOthrAdrsPrfP.GetChecked(),'DivOthrAdrsPrfP');}"></ClientSideEvents>
                                     </dxe:ASPxRadioButton>
                                     ** Latest Land Line Telephone Bill<br />
                                     <dxe:ASPxRadioButton ID="rdElecBilP" runat="server" Checked="False" ClientInstanceName="crdElecBilP"
                                         GroupName="t" TabIndex="0" >
                                         <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdOthrAdrsPrfP.GetChecked(),'DivOthrAdrsPrfP');}"></ClientSideEvents>
                                     </dxe:ASPxRadioButton>
                                     ** Latest Electricity Bill<br />
                                     <dxe:ASPxRadioButton ID="rdGasBilP" runat="server" Checked="False" ClientInstanceName="crdGasBilP" 
                                         GroupName="t" TabIndex="0" >
                                         <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdOthrAdrsPrfP.GetChecked(),'DivOthrAdrsPrfP');}"></ClientSideEvents>
                                     </dxe:ASPxRadioButton>
                                     ** Latest Gas Bill
                                     <br />
                                     <dxe:ASPxRadioButton ID="rdOthrAdrsPrfP" runat="server" Checked="False" ClientInstanceName="crdOthrAdrsPrfP"
                                         GroupName="t" TabIndex="0" >
                                         <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdOthrAdrsPrfP.GetChecked(),'DivOthrAdrsPrfP');}"></ClientSideEvents>
                                     </dxe:ASPxRadioButton>
                                     Others
                                     <div id="DivOthrAdrsPrfP" style="margin-left: 2px">
                                         <dxe:ASPxTextBox ID="TxtOthrAdrsPrfP" runat="server" ClientInstanceName="cTxtOthrAdrsPrfP"
                                             Width="150px">
                                         </dxe:ASPxTextBox>
                                         (Please Specify)<br />
                                     </div>
                                     <br />
                                     <div class="left" style="height: 25px; width: 380px;">
                                         **Not more than 3 Months old. Validity/Expiry Date of Proof of address submitted:</div>
                                     <div class="left" style="height: 25px;">
                                         <dxe:ASPxDateEdit ID="ValidDtP" runat="server" ClientInstanceName="cValidDtP" DateOnError="Today"
                                             EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="150px"
                                             Font-Size="11px" TabIndex="0">
                                         </dxe:ASPxDateEdit>
                                     </div>
                                 </div>
                             </div>
                             <div id="Row19" class="Row">
                                 <div id="Row19_Col0" class="LFloat_Lable Leftdiv" style="height:60px">
                                      Contact&nbsp; Details:<br />
                                      <span class="Spanclass">**</span><span style="font-size: 8pt">[Mandatory to Give Atleast&nbsp;<br />
                                          &nbsp; &nbsp; &nbsp;One Contact No ] </span>
                                 </div>
                                 <div id="Row19_Col1" class="LFloat_Row FontChange" style="width: 57%">
                                     <div class="left" style="width: 99%">
                                         <div class="left" style="height: 25px">
                                             Tel(Off) &nbsp;:
                                         </div>
                                         <div class="left" style="height: 25px">
                                             <dxe:ASPxTextBox ID="TxtTelOfc" runat="server" ClientInstanceName="cTxtTelOfc" MaxLength="11"
                                                 HorizontalAlign="Right" Width="120px">
                                                 <MaskSettings Mask="<0..99999999999>" />
                                             </dxe:ASPxTextBox>
                                         </div>
                                         <div class="left" style="height: 25px">
                                             &nbsp;Tel(Res) &nbsp;&nbsp; :
                                         </div>
                                         <div class="left" style="height: 25px">
                                             <dxe:ASPxTextBox ID="TxtTelRes" runat="server" ClientInstanceName="cTxtTelRes" MaxLength="11"
                                                 HorizontalAlign="Right" Width="120px">
                                                 <MaskSettings Mask="<0..99999999999>" />
                                             </dxe:ASPxTextBox>
                                         </div>
                                     </div>
                                     <div class="left" style="width: 99%">
                                         <div class="left" style="height: 25px">
                                             Fax No.&nbsp; :
                                         </div>
                                         <div class="left" style="height: 25px">
                                             <dxe:ASPxTextBox ID="TxtFaxNo" runat="server" ClientInstanceName="cTxtFaxNo" HorizontalAlign="Right"
                                                 Width="120px">
                                                 <MaskSettings Mask="<0..99999999999>" />
                                             </dxe:ASPxTextBox>
                                         </div>
                                         <div class="left" style="height: 25px">
                                             Mobile No. :
                                         </div>
                                         <div class="left" style="height: 25px">
                                             <dxe:ASPxTextBox ID="TxtMobileNo" runat="server" ClientInstanceName="cTxtMobileNo"
                                                 MaxLength="10" HorizontalAlign="Right" Width="120px">
                                                 <MaskSettings Mask="<0..9999999999>" />
                                             </dxe:ASPxTextBox>
                                         </div>
                                     </div>
                                     <div class="left" style="height: 25px">
                                         Email ID:
                                     </div>
                                     <div class="left" style="height: 25px">
                                         <dxe:ASPxTextBox ID="TxtEmlID" runat="server" ClientInstanceName="cTxtEmlID" Width="300px">
                                             <ClientSideEvents LostFocus="function(s, e) {verifyEmail(cTxtEmlID);}" />
                                         </dxe:ASPxTextBox>
                                     </div>
                                </div>
                             </div>
                             <div id="DivBtnSaveAdrs" class="left" style="margin-left: 10px; font-size: 12pt;">
                                 <dxe:ASPxButton ID="BtnSaveAdrs" runat="server" AutoPostBack="false" TabIndex="0"
                                     Text="Save Address Detai[L]" ToolTip="Save Entered Data" Width="142px" ClientInstanceName="cBtnSaveAdrs" AccessKey="l">
                                     <Border BorderColor="White"></Border>
                                     <ClientSideEvents Click="function(s, e) {SaveAddress();}"></ClientSideEvents>
                                 </dxe:ASPxButton>
                             </div>
                             <div id="DivBtnEditAdrs" class="left" style="margin-left: 10px; font-size: 12pt;">
                                 <dxe:ASPxButton ID="BtnEditAdrs" runat="server" AutoPostBack="false" TabIndex="0"
                                     Text="Edit" ToolTip="Edit Entered Data" Width="100px" ClientInstanceName="cBtnEditAdrs">
                                     <Border BorderColor="White"></Border>
                                     <ClientSideEvents Click="function(s, e) {EditAddress();}"></ClientSideEvents>
                                 </dxe:ASPxButton>
                             </div>
                             <br />
                             <br />
                             <br />
                             <br />
                             <br />
                             <br />
                             <br />
                             <br />
                             <div id="DivAdrsAlrt" class="Success BtmMargin" style="margin-top:10px;width:800px;font-size:9pt;">
                                 Address Section Submitted Successfully !!
                             </div>
                             <br /><br />
                         </dxp:panelcontent>
                     </PanelCollection>
                     <ClientSideEvents EndCallback="function (s, e) {CbpAdrs_EndCallBack();}" />
                 </dxcp:ASPxCallbackPanel>
             </div>
          
         <div>
               <div class="DivHeader" style="width: 100%" onselectstart="return false;">&nbsp; OTHER DETAILS 
               </div>
         </div>
         <div id="Accordion3Content" class="AccordionContent">
          <dxcp:ASPxCallbackPanel ID="CbpOthrDtls" runat="server" ClientInstanceName="cCbpOthrDtls"
                OnCallback="CbpOthrDtls_Callback" BackColor="Transparent" Width="100%">
           <PanelCollection>
           <dxp:panelcontent runat="server"> 
            <div id="Div_OtherDetail" style="width: 99%">
             
              <div id="Row20" class="Row">
                  <div id="Row20_Col0" class="LFloat_Lable Leftdiv">
                      <span class="Spanclass">**</span>
                      Gross Anual Income Details:
                  </div>
                  <div id="Row20_Col1" class="LFloat_Row FontChange" style="width: 66%;height: 250px">
                      <div class="left" style="width: 99%">
                          <div class="left" style="height: 25px">
                              <strong>Income Range Per Annum :</strong>
                          </div>
                          <div class="left" style="height:140px">
                              <asp:RadioButton ID="rdOneLc" runat="server" Checked="True" GroupName="r" TabIndex="0" />
                              Below Rs. 1 Lac<br />
                              <asp:RadioButton ID="rdFvLc" runat="server" Checked="False" GroupName="r" TabIndex="0" />
                              Rs. 1- 5 Lac<br />
                              <asp:RadioButton ID="rdTenLc" runat="server" Checked="False" GroupName="r" TabIndex="0" />
                              Rs. 5- 10 lac
                              <br />
                              <asp:RadioButton ID="rdTwentyFvLc" runat="server" Checked="False" GroupName="r" TabIndex="0" />
                              Rs. 10- 25 lac<br />
                              <div id="DivMrThn25Lc">
                                  <asp:RadioButton ID="rdMrthn25Lc" runat="server" Checked="False" GroupName="r" TabIndex="0" />
                                  More than Rs. 25 lac<br />
                              </div>
                              <div id="DivMrThn1cr">
                                  <asp:RadioButton ID="rdOnecr" runat="server" Checked="False" GroupName="r" TabIndex="0" />
                                  Rs. 25 lac - 1 Cr<br />
                                  <asp:RadioButton ID="rdMrthn1cr" runat="server" Checked="False" GroupName="r" TabIndex="0" />
                                  More than Rs. 1 crore
                              </div>
                          </div>
                          <div style="width: 99%; text-align: center; margin: 2px; height: 20px;">
                              <strong>OR </strong>
                          </div>
                          <div class="left" style="height: 25px">
                              <strong>NetWorth : </strong>
                          </div>
                          <div class="left" style="height: 25px">
                              &nbsp; &nbsp; Amount(Rs.):
                          </div>
                          <div class="left" style="height: 25px;">
                              <dxe:ASPxTextBox ID="TxtAmnt" runat="server" ClientInstanceName="cTxtAmnt" Width="190px" HorizontalAlign="right">
                                  <masksettings mask="&lt;0..999999999999g&gt;" />
                              </dxe:ASPxTextBox>
                          </div>
                          <div class="left" style="width:99%">
                              <div class="left" style="height: 25px; width: 148px; text-align: right">
                                  As On Date:</div>
                              <div class="left" style="height: 25px;">
                                  <dxe:ASPxDateEdit ID="IncmDt" runat="server" ClientInstanceName="cIncmDt" DateOnError="Today"
                                      EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="150px"
                                      Font-Size="11px" TabIndex="0">
                                  </dxe:ASPxDateEdit>
                              </div>
                            (Networth should not be older than 1 year)
                          </div>
                       </div>
                  </div>
                  <div id="Row21" class="Row">
                      <div id="Row21_Col0" class="LFloat_Lable Leftdiv">
                          Occupation:
                      </div>
                      <div id="Row21_Col1" class="LFloat_Row FontChange" style="height: 220px; width: 66%;">
                          <div class="left">
                              <dxe:ASPxRadioButton ID="rdPvtSctr" runat="server" Checked="True"  ClientInstanceName="crdPvtSctr" GroupName="g" TabIndex="0">
                                <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdOthrs.GetChecked(),'DivOthrOccu');}"></ClientSideEvents>
                              </dxe:ASPxRadioButton>
                              Private Sector <br />
                              <dxe:ASPxRadioButton ID="rdPublcSctr" runat="server" Checked="False"  ClientInstanceName="crdPublcSctr"  GroupName="g" TabIndex="0" >
                                <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdOthrs.GetChecked(),'DivOthrOccu');}"></ClientSideEvents>
                              </dxe:ASPxRadioButton>
                              Public Sector <br />
                              <dxe:ASPxRadioButton ID="rdGvSv" runat="server" Checked="False"  ClientInstanceName="crdGvSv"  GroupName="g" TabIndex="0" >
                                <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdOthrs.GetChecked(),'DivOthrOccu');}"></ClientSideEvents>
                              </dxe:ASPxRadioButton>
                              Government Service <br />
                              <dxe:ASPxRadioButton ID="rdBsPf" runat="server" Checked="False"  ClientInstanceName="crdBsPf" GroupName="g" TabIndex="0" >
                                <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdOthrs.GetChecked(),'DivOthrOccu');}"></ClientSideEvents>
                              </dxe:ASPxRadioButton>
                              Business  <br />
                              <dxe:ASPxRadioButton ID="rdPrfsnl" runat="server" Checked="False"  ClientInstanceName="crdPrfsnl" GroupName="g" TabIndex="0" >
                                <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdOthrs.GetChecked(),'DivOthrOccu');}"></ClientSideEvents>
                              </dxe:ASPxRadioButton>
                              Professional <br />
                              <dxe:ASPxRadioButton ID="rdAgri" runat="server" Checked="False"  ClientInstanceName="crdAgri" GroupName="g" TabIndex="0" >
                                <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdOthrs.GetChecked(),'DivOthrOccu');}"></ClientSideEvents>
                              </dxe:ASPxRadioButton>
                              Agriculturist <br />
                              <dxe:ASPxRadioButton ID="rdRetred" runat="server" Checked="False"  ClientInstanceName="crdRetred" GroupName="g" TabIndex="0" >
                                <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdOthrs.GetChecked(),'DivOthrOccu');}"></ClientSideEvents>
                              </dxe:ASPxRadioButton>
                              Retired <br />
                              <dxe:ASPxRadioButton ID="rdHseWf" runat="server" Checked="False"  ClientInstanceName="crdHseWf" GroupName="g" TabIndex="0" >
                                <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdOthrs.GetChecked(),'DivOthrOccu');}"></ClientSideEvents>
                              </dxe:ASPxRadioButton>
                              Housewife <br />
                              <dxe:ASPxRadioButton ID="rdStdnt" runat="server" Checked="False"  ClientInstanceName="crdStdnt" GroupName="g" TabIndex="0" >
                                <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdOthrs.GetChecked(),'DivOthrOccu');}"></ClientSideEvents>
                              </dxe:ASPxRadioButton>
                              Student <br />
                              <dxe:ASPxRadioButton ID="rdOthrs" runat="server" Checked="False"  ClientInstanceName="crdOthrs" GroupName="g" TabIndex="0" >
                                <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdOthrs.GetChecked(),'DivOthrOccu');}"></ClientSideEvents>
                              </dxe:ASPxRadioButton>
                              Others&nbsp;
                              <div id="DivOthrOccu" class="left" style="margin-left: 2px">
                                  <dxe:ASPxTextBox ID="TxtothrOccu" runat="server" ClientInstanceName="cTxtothrOccu"
                                      Width="150px">
                                  </dxe:ASPxTextBox>
                                  (Please Specify)
                              </div>
                          </div>
                          <div class="left">
                              <div id="DivBrfDtl" class="left" style="height: 25px">
                                  Please Give Some Brief Details:
                              </div>
                              <dxe:ASPxMemo ID="MemoOccu" runat="server" ClientInstanceName="cMemoOccu" HorizontalAlign="left"
                                  Width="230px">
                              </dxe:ASPxMemo>
                          </div>
                      </div>
                  </div>
        
                  <div id="Row22" class="Row">
                      <div id="Row22_Col0" class="LFloat_Lable Leftdiv">
                          Please Select One If Applicable:
                      </div>
                      <div id="Row22_Col1" class="LFloat_Row FontChange" style="height: 25px; width: 66%;">
                          <asp:RadioButton ID="rdPEP" runat="server" Checked="False" GroupName="h" TabIndex="0" />
                          Politically Exposed Person (PEP)
                          <asp:RadioButton ID="rdRPEP" runat="server" Checked="False" GroupName="h" TabIndex="0" />
                          Related to Politically Exposed Person (PEP)
                          <asp:RadioButton ID="rdNa" runat="server" Checked="True" GroupName="h" TabIndex="0" />
                          NA
                      </div>
                  </div>
                   <div id="Row23" class="Row">
                      <div id="Row23_Col0" class="LFloat_Lable Leftdiv" style="height: 38px">
                        Is The Entity Involved/Providing any of the following Services:
                      </div>
                      <div id="Row23_Col1" class="LFloat_Row FontChange" style="height: 100px; width: 66%;">
                          <asp:RadioButton ID="rdYes" runat="server" Checked="False" GroupName="i" TabIndex="0" />
                          YES
                          <asp:RadioButton ID="rdNo" runat="server" Checked="True" GroupName="i" TabIndex="0" />
                          NO
                          <div class ="left" style="width:99%">
                              <div class="left" style="height: 25px">
                                  – For Foreign Exchange / Money Changer Services:
                              </div>
                              <div class="left" style="height: 25px">
                                 <asp:RadioButton ID="rdForexY" runat="server" Checked="False" GroupName="j" TabIndex="0" />
                                 YES
                                <asp:RadioButton ID="rdForexN" runat="server" Checked="True" GroupName="j" TabIndex="0" />
                                 NO 
                              </div>  
                          </div>
                          <div class ="left" style="width:99%">
                              <div class="left" style="height: 25px">
                                 – Gaming / Gambling / Lottery Services(e.g. casinos, betting syndicates):
                                  </div>
                              <div class="left" style="height: 25px">
                                   <asp:RadioButton ID="rdGamingY" runat="server" Checked="False" GroupName="k" TabIndex="0" />
                                    YES
                                   <asp:RadioButton ID="rdGamingN" runat="server" Checked="True" GroupName="k" TabIndex="0" />
                                    NO   
                              </div>
                          </div>
                          <div class ="left" style="width:99%">
                              <div class="left" style="height: 25px">
                                 – Money Lending / Pawning:
                              </div>
                              <div class="left" style="height: 25px">
                                   <asp:RadioButton ID="rdMoneyLendingY" runat="server" Checked="False" GroupName="l" TabIndex="0" />
                                    YES
                                   <asp:RadioButton ID="rdMoneyLendingN" runat="server" Checked="True" GroupName="l" TabIndex="0" />
                                    NO   
                              </div>
                          </div>
                      </div>
                  </div>
                   <div id="Row24" class="Row">
                      <div id="Row24_Col0" class="LFloat_Lable Leftdiv">
                          Any Other Information:
                      </div>
                      <div id="Row24_Col1" class="LFloat_Row" style="height: 31px">
                          <dxe:ASPxMemo ID="MemoOthrInfo" runat="server" ClientInstanceName="cMemoOthrInfo" HorizontalAlign="left"
                                  Width="350px">
                          </dxe:ASPxMemo>
                      </div>
                   </div>   
              </div>
          </div>
          <div style="font-style:italic;font-size:12px">
              <div id="Div_declare" class="left" style="font-size: 12px">
                  <dxe:ASPxCheckBox ID="ChkDeclaratn" runat="server" ClientInstanceName="cChkDeclaratn" ToolTip="Please Select If You Want To Declare It"
                          Checked="False" >
                     <%-- <clientsideevents checkedchanged="OnAllCheckedChanged" />--%>
                  </dxe:ASPxCheckBox>
              </div>
              <strong>I hereby declare that the details furnished above are true 
              and correct to the best of my knowledge and belief and I undertake to inform you 
              of any changes therein, immediately. In case any of the above information is found to be 
              false or untrue or misleading or misrepresenting, I am aware that I may be held liable for it.</strong>
          </div>
          <div id="Row25" class="Row">
              <div id="Row25_Col0" class="LFloat_Lable Leftdiv">
                  <span class="Spanclass">**</span>
                  IPV Details:
              </div>
              <div id="Row25_Col1" class="LFloat_Row FontChange" style="height: 60px; width: 500px; margin-bottom: 5px;" onclick="return Row25_Col1_onclick()">
                  <div class="left" style="width: 100%">
                      <div class="left" style="height: 25px">
                          IPV Done By :
                      </div>
                      <div class="left" style="height: 25px">
                          <dxe:ASPxTextBox ID="TxtIPVby" runat="server" ClientInstanceName="cTxtIPVby" MaxLength="11"
                                      HorizontalAlign="left" Width="170px">
                          </dxe:ASPxTextBox>
                      </div>
                      <div class="left" style="height: 25px">
                          &nbsp;IPV Date&nbsp; :
                      </div>
                      <div class="left" style="height: 25px">
                          <dxe:ASPxDateEdit id="IpvDt" tabIndex=0 runat="server" Width="150px" ClientInstanceName="cIpvDt" Font-Size="11px" UseMaskBehavior="True" EditFormatString="dd-MM-yyyy" EditFormat="Custom" DateOnError="Today">
                          </dxe:ASPxDateEdit>
                      </div>
                  </div>
                  <div class="left" style="width: 100%">
                      <div  id="DivInIPV" class="left" style="height: 25px">
                          Relationship with the Intermediary / Designation :</div>
                      <div id="DivNonInIPV" class="left" style="height: 25px; width: 150px;">
                          Details / Designation:</div>
                      <div class="left" style="height: 25px">
                          <dxe:ASPxTextBox ID="TxtRelBrokr" runat="server" ClientInstanceName="cTxtRelBrokr" MaxLength="11"
                                      HorizontalAlign="left" Width="185px">
                          </dxe:ASPxTextBox>
                      </div>
                  </div>
               
             </div>
              <br />
              <br />
              <br />
              <br />
              <br />
              <br />
        </div>
        <div id="DivPrtnerHdr" style="width:1100px;font-family:Calibri;font-weight:bold; margin-top: 10px; margin-bottom: 10px;background-color:#DDD; height: 25px;" >
            &nbsp;Details of Promoters/ Partners/ Karta / Trustees and whole time directors for Non-Individuals </div>
        <div id="Row26" class="Row">
             <div class="Row">
                 <div id="Row26_Col0" class="LFloat_Lable Leftdiv">
                      <span class="Spanclass">**</span>Name:
                 </div>
                 <div id="Row26_Col1" class="LFloat_Row" style="height: 25px">
                     <dxe:ASPxTextBox ID="TxtCHName" runat="server" ClientInstanceName="cTxtCHName"
                         Width="482px">
                     </dxe:ASPxTextBox>
                 </div>
             </div>
             <div class="Row">
                 <div id="Row26_Col2" class="LFloat_Lable Leftdiv" style="height: 37px">
                     DIN (For Directors) / UID (For Others):</div>
                 <div id="Row26_Col3" class="LFloat_Row" style="height: 37px; margin-right: 10px;">
                     <dxe:ASPxTextBox ID="TxtCHUIN" runat="server" ClientInstanceName="cTxtCHUIN" MaxLength="12"
                         HorizontalAlign="Right" Width="150px">
                         <MaskSettings Mask="<0..999999999>" />
                     </dxe:ASPxTextBox>
                 </div>
             </div>
             
                 <div id="Row26_Col4" class="LFloat_Lable Leftdiv" style="height: 35px; width: 150px;">
                     <span class="Spanclass">**</span> PAN:
                 </div>
                 <div id="Row26_Col5" class="LFloat_Row" style="height: 35px">
                     <dxe:ASPxTextBox ID="TxtCHPan" runat="server" ClientInstanceName="cTxtCHPan" MaxLength="10"
                         Width="150px">
                     </dxe:ASPxTextBox>
                 </div> 
             
             <div class="Row">
  
                 <div id="Row26_Col6" class="LFloat_Lable Leftdiv">
                     <span class="Spanclass">**</span>Address:
                 </div>
                 <div id="Row26_Col7" class="LFloat_Row FontChange" style="width: 60%">
                     <div style="margin-bottom: 2px">
                         <dxe:ASPxTextBox ID="TxtCHAddress1" runat="server" ClientInstanceName="cTxtCHAddress1"
                             NullText="                                             House No" ForeColor="Silver" HorizontalAlign="left" Width="460px">
                             <ClientSideEvents TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                             </ClientSideEvents>
                         </dxe:ASPxTextBox>
                     </div>
                     <div style="margin-bottom: 2px">
                         <dxe:ASPxTextBox ID="TxtCHAddress2" runat="server" ClientInstanceName="cTxtCHAddress2"
                             NullText="                                           Street Name" ForeColor="Silver" HorizontalAlign="left" Width="460px">
                             <ClientSideEvents TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                             </ClientSideEvents>
                         </dxe:ASPxTextBox>
                     </div>
                     <div style="margin-bottom: 2px">
                         <dxe:ASPxTextBox ID="TxtCHAddress3" runat="server" ClientInstanceName="cTxtCHAddress3"
                             NullText="                                            Area Name" ForeColor="Silver" HorizontalAlign="left" Width="460px">
                             <ClientSideEvents TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                             </ClientSideEvents>
                         </dxe:ASPxTextBox>
                     </div>
                     <div class="left" style="width: 99%">
                         <div class="left" style="height: 25px">
                             City/Town/Village :
                         </div>
                         <div class="left" style="height: 25px">
                             <dxe:ASPxComboBox ID="ComboCHCity" runat="server" ClientInstanceName="cComboCHCity" EnableIncrementalFiltering="True"
                                 Font-Size="Small" SelectedIndex="0" ValueType="System.String" Width="150px">
                                 <ClientSideEvents SelectedIndexChanged="function(s,e){OnTypeChange()}" TextChanged="onClientChange">
                                 </ClientSideEvents>
                             </dxe:ASPxComboBox>
                         </div>
                         <div class="left" style="height: 25px">
                             PinCode :
                         </div>
                         <div class="left" style="height: 25px">
                             <dxe:ASPxTextBox ID="TxtCHPin" runat="server" ClientInstanceName="cTxtCHPin" Width="154px"
                                 HorizontalAlign="right">
                                 <MaskSettings Mask="<0..999999999>" />
                             </dxe:ASPxTextBox> 
                         </div>
                     </div>
                     <div class="left" style="height:30px">
                         <dxe:ASPxComboBox ID="ComboCHState" runat="server" ClientInstanceName="cComboCHState"
                             EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                             Width="150px">
                             <DropDownButton Text="State">
                             </DropDownButton>
                             <ClientSideEvents SelectedIndexChanged="function(s,e){OnStateChange('3')}" TextChanged="onClientChange">
                             </ClientSideEvents>
                         </dxe:ASPxComboBox>
                     </div>
                     <div id ="DivStateCHOthr" class="left" style="height:30px;margin-left: 2px">
                                           
                             <dxe:ASPxTextBox ID="TxtStateCHOthr" runat="server" ClientInstanceName="cTxtStateCHOthr"
                                 Width="150px">
                             </dxe:ASPxTextBox>
                             (Please Specify)
                                    
                     </div>
                     <div class="left" style="height: 30px; margin-left: 4px;">
                         <dxe:ASPxComboBox ID="ComboCHCountry" runat="server" ClientInstanceName="cComboCHCountry"
                             EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                             Width="150px">
                             <DropDownButton Text="Country">
                             </DropDownButton>
                             <ClientSideEvents SelectedIndexChanged="function(s,e){OnTypeChange()}" TextChanged="onClientChange">
                             </ClientSideEvents>
                         </dxe:ASPxComboBox>
                     </div>
                 </div>
               </div>
                 <div class="Row">
                     <div id="Row26_Col8" class="LFloat_Lable Leftdiv">
                          Contact&nbsp; Details:
                          <br />
                                      <span class="Spanclass">**</span><span style="font-size: 8pt">[Mandatory to Give Atleast&nbsp;<br />
                                          &nbsp; &nbsp; &nbsp;One Contact No ] </span>
                     </div>
                     <div id="Row26_Col9" class="LFloat_Row FontChange" style="width: 60%">
                         <div class="left" style="width: 99%">
                             <div class="left" style="height: 25px">
                                 &nbsp; &nbsp;&nbsp;
                                 Tel(Off) &nbsp;:
                             </div>
                             <div class="left" style="height: 25px">
                                 <dxe:ASPxTextBox ID="TxtCHTelOfc" runat="server" ClientInstanceName="cTxtCHTelOfc" MaxLength="11"
                                     HorizontalAlign="Right" Width="136px">
                                     <MaskSettings Mask="<0..99999999999>" />
                                 </dxe:ASPxTextBox>
                             </div>
                             <div class="left" style="height: 25px">
                                 &nbsp;Tel(Res) :
                             </div>
                             <div class="left" style="height: 25px">
                                 <dxe:ASPxTextBox ID="TxtCHTelRes" runat="server" ClientInstanceName="cTxtCHTelRes" MaxLength="11"
                                     HorizontalAlign="Right" Width="125px">
                                     <MaskSettings Mask="<0..99999999999>" />
                                 </dxe:ASPxTextBox>
                             </div>
                         </div>
                         <div class="left" style="width: 99%">
                             
                             <div class="left" style="height: 25px">
                                 Mobile No. :
                             </div>
                             <div class="left" style="height: 25px">
                                 <dxe:ASPxTextBox ID="TxtCHMobileNo" runat="server" ClientInstanceName="cTxtCHMobileNo"
                                     MaxLength="10" HorizontalAlign="Right" Width="136px">
                                     <MaskSettings Mask="<0..9999999999>" />
                                 </dxe:ASPxTextBox>
                             </div>
                         </div>
                         <div class="left" style="height: 25px">
                             &nbsp; &nbsp; Email ID :
                         </div>
                         <div class="left" style="height: 25px">
                             <dxe:ASPxTextBox ID="TxtCHEmlID" runat="server" ClientInstanceName="cTxtCHEmlID" Width="300px">
                                 <ClientSideEvents LostFocus="function(s, e) {verifyEmail(cTxtCHEmlID);}"  />
                             </dxe:ASPxTextBox>
                         </div>
                     </div>
                 <div class="Row">
                     <div id="Row26_Col10" class="LFloat_Lable Leftdiv">
                          Relationship with Applicant:
                     </div>
                     <div id="Row26_Col11" class="LFloat_Row" style="height: 25px">
                         <dxe:ASPxTextBox ID="TxtRelWthapli" runat="server" ClientInstanceName="cTxtRelWthapli"
                             Width="130px">
                         </dxe:ASPxTextBox>
                     </div>
               
                     <div id="Row26_Col12" class="LFloat_Row FontChange" style="height: 25px; width: 60%; margin-left: 10px;">
                              <asp:RadioButton ID="rdCHPep" runat="server" Checked="False" GroupName="p" TabIndex="0" />
                              Politically Exposed Person (PEP)
                              <asp:RadioButton ID="rdCHRPep" runat="server" Checked="False" GroupName="p" TabIndex="0" />
                              Related to Politically Exposed Person (PEP)
                              <asp:RadioButton ID="rdCHNa" runat="server" Checked="True" GroupName="p" TabIndex="0" />
                              NA
                     </div>
                 </div> 
                 <div class="Row">
                      <div id="Row26_Col13" class="LFloat_Lable Leftdiv">
                          IPV Details:
                      </div>
                      <div id="Row26_Col14" class="LFloat_Row FontChange" style="height: 60px; width: 60%;">
                          <div class="left">
                              <div class="left" style="height: 25px">
                                  IPV Done By :
                              </div>
                              <div class="left" style="height: 25px">
                                  <dxe:ASPxTextBox ID="TxtCHIPVby" runat="server" ClientInstanceName="cTxtCHIPVby" MaxLength="11"
                                              HorizontalAlign="left" Width="170px">
                                  </dxe:ASPxTextBox>
                              </div>
                              <div class="left" style="height: 25px">
                                  &nbsp;IPV Date&nbsp; :
                              </div>
                              <div class="left" style="height: 25px">
                                  <dxe:ASPxDateEdit id="CHIpvDt" tabIndex=0 runat="server" Width="150px" ClientInstanceName="cCHIpvDt" Font-Size="11px" UseMaskBehavior="True" EditFormatString="dd-MM-yyyy" EditFormat="Custom" DateOnError="Today">
                                  </dxe:ASPxDateEdit>
                              </div>
                          </div>
                      </div> 
               </div>
               <div class="Row">
                     <div id="Row26_Col15" class="LFloat_Lable Leftdiv">
                         Relationship with Broker:
                     </div>
                     <div id="Row26_Col16" class="LFloat_Row" style="height: 25px">
                         <dxe:ASPxTextBox ID="TxtRelWthBrokr" runat="server" ClientInstanceName="cTxtRelWthBrokr"
                             Width="150px">
                         </dxe:ASPxTextBox>
                     </div>
              </div>        
              <div runat="server" style="width:10%; padding-left: 10px;">
                  <dxe:ASPxButton  id="BtnAddRecord" tabIndex="0" runat="server" Width="130px" Text="AddRecord" ClientInstanceName="cBtnAddRecord"  AutoPostBack="false">
                    <ClientSideEvents Click="function(s, e) {AddCompanyHolderRecords();}" ></ClientSideEvents>
                  </dxe:ASPxButton>
              </div> 
              <div id="Div_GVCHrecord" style="float: left; padding-top: 10px; width: 100%; border-top: #ddd 1px solid; margin-top: 10px; margin-bottom: 10px;" align="center">
                    <dxwgv:ASPxGridView ID="GvCHRecord" runat="server" Settings-ShowHorizontalScrollBar="true"
                        AutoGenerateColumns="False" KeyFieldName="RowID" Width="800px" Font-Size="Small"
                        ClientInstanceName="cGvCHRecord" OnCustomCallback="GvCHRecord_CustomCallback"
                        OnHtmlEditFormCreated="GvCHRecord_HtmlEditFormCreated" OnRowDeleting="GvCHRecord_RowDeleting" >
                        <ClientSideEvents  EndCallback="function (s, e) {GvCHRecord_EndCallBack();}" />
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
                            <dxwgv:GridViewDataTextColumn Caption="Serial No" FieldName="RowID" VisibleIndex="1"
                                Width="70px">
                                <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Name" FieldName="Name" VisibleIndex="2" Width="150px">
                                <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Din/Uid" FieldName="DinUid" VisibleIndex="3" Width="80px">
                                <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="PAN" FieldName="PAN" VisibleIndex="4" Width="80px">
                                <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Address1" FieldName="Address1" VisibleIndex="5" Width="180px">
                                <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Address2" FieldName="Address2" VisibleIndex="6" Width="180px">
                                <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Address3" FieldName="Address3" VisibleIndex="7" Width="180px">
                                <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="PIN" FieldName="PIN" VisibleIndex="8" Width="150px">
                                <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Country" FieldName="Country" VisibleIndex="9" Width="120px">
                                <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="State" FieldName="State" VisibleIndex="10" Width="150px">
                                <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="City" FieldName="City" VisibleIndex="11" Width="120px">
                                <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Ofc Phone" FieldName="OPhone" VisibleIndex="12" Width="120px">
                                <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Res Phone" FieldName="RPhone" VisibleIndex="13" Width="120px">
                                <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Mobile" FieldName="Mobile" VisibleIndex="14" Width="120px">
                                <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Email" FieldName="Email" VisibleIndex="15" Width="120px">
                                <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="RelationshipWithApplicant" FieldName="RelationshipApli" VisibleIndex="16" Width="180px">
                                <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Is PeP Or Not" FieldName="PeP" VisibleIndex="17" Width="70px">
                                <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="IPVDoneBy" FieldName="IPVDoneBy" VisibleIndex="18" Width="120px">
                                <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="IPVDate" FieldName="IPVDate" VisibleIndex="19" Width="120px">
                                <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="RelationWithBroker" FieldName="RelationWithBroker" VisibleIndex="20" Width="180px">
                                <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <Templates>
                            <EditForm>
                             <div> 
                                          <div id="Row26E" class="Row">
                                             <div class="Row">
                                                 <div id="Row26_Col0E" class="LFloat_Lable Leftdiv">
                                                      <span class="Spanclass">**</span>Name:
                                                 </div>
                                                 <div id="Row26_Col1E" class="LFloat_Row" style="height: 25px">
                                                     <dxe:ASPxTextBox ID="TxtCHNameE" runat="server" ClientInstanceName="cTxtCHName"
                                                         Width="400px" Text='<%# Bind("Name") %>'>
                                                     </dxe:ASPxTextBox>
                                                 </div>
                                             </div>
                                             <div class="Row">
                                                 <div id="Row26_Col2E" class="LFloat_Lable Leftdiv" style="height: 37px">
                                                     DIN (For Directors) / UID (For Others):</div>
                                                 <div id="Row26_Col3E" class="LFloat_Row" style="height: 37px; margin-right: 10px;">
                                                     <dxe:ASPxTextBox ID="TxtCHUINE" runat="server" ClientInstanceName="cTxtCHUIN" MaxLength="12"
                                                         HorizontalAlign="Right" Width="150px" Text='<%# Bind("DinUid") %>'>
                                                         <MaskSettings Mask="<0..999999999>" />
                                                     </dxe:ASPxTextBox>
                                                 </div>
                                             </div>
                                     
                                             <div id="Row26_Col4E" class="LFloat_Lable Leftdiv" style="height: 35px; width: 150px;">
                                                 <span class="Spanclass">**</span> PAN:
                                             </div>
                                             <div id="Row26_Col5E" class="LFloat_Row" style="height: 35px">
                                                 <dxe:ASPxTextBox ID="TxtCHPanE" runat="server" ClientInstanceName="cTxtCHPan" MaxLength="10"
                                                     Width="150px" Text='<%# Bind("PAN") %>'>
                                                 </dxe:ASPxTextBox>
                                             </div> 
                                     
                                             <div class="Row">
                                  
                                                 <div id="Row26_Col6E" class="LFloat_Lable Leftdiv">
                                                     <span class="Spanclass">**</span>Address:
                                                 </div>
                                                 <div id="Row26_Col7E" class="LFloat_Row" style="width:20%">
                                                     <div style="margin-bottom: 2px">
                                                         <dxe:ASPxTextBox ID="TxtCHAddress1E" runat="server" ClientInstanceName="cTxtCHAddress1E"
                                                             NullText="                                           House No" ForeColor="Silver" HorizontalAlign="left" Width="350px" Text='<%# Bind("Address1") %>'>
                                                             <ClientSideEvents TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                                             </ClientSideEvents>
                                                         </dxe:ASPxTextBox>
                                                     </div>
                                                     <div style="margin-bottom: 2px">
                                                         <dxe:ASPxTextBox ID="TxtCHAddress2E" runat="server" ClientInstanceName="cTxtCHAddress2E"
                                                             NullText="                                           Street Name" ForeColor="Silver" HorizontalAlign="left" Width="350px" Text='<%# Bind("Address2") %>'>
                                                             <ClientSideEvents TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                                             </ClientSideEvents>
                                                         </dxe:ASPxTextBox>
                                                     </div>
                                                     <div style="margin-bottom: 5px">
                                                         <dxe:ASPxTextBox ID="TxtCHAddress3E" runat="server" ClientInstanceName="cTxtCHAddress3E"
                                                             NullText="                                           Area Name" ForeColor="Silver" HorizontalAlign="left" Width="350px" Text='<%# Bind("Address3") %>'>
                                                             <ClientSideEvents TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                                             </ClientSideEvents>
                                                         </dxe:ASPxTextBox>
                                                     </div>
                                                     <div class="left" style="width: 99%;margin-bottom:2px">
                                                         <div class="left" style="height: 25px">
                                                             City/Town/Village :
                                                         </div>
                                                         <div class="left" style="height: 25px">
                                                             <dxe:ASPxComboBox ID="ComboCHCityE" runat="server" ClientInstanceName="cComboCHCityE" EnableIncrementalFiltering="True"
                                                                 Font-Size="Small" SelectedIndex="0" ValueType="System.String" Width="150px" >
                                                                 <ClientSideEvents SelectedIndexChanged="function(s,e){OnTypeChange()}" TextChanged="onClientChange">
                                                                 </ClientSideEvents>
                                                             </dxe:ASPxComboBox>
                                                         </div>
                                                         <div class="left" style="height: 25px">
                                                             &nbsp; &nbsp;PinCode :
                                                         </div>
                                                         <div class="left" style="height: 25px">
                                                             <dxe:ASPxTextBox ID="TxtCHPinE" runat="server" ClientInstanceName="cTxtCHPinE" Width="130px"
                                                                 HorizontalAlign="right"  Text='<%# Bind("PIN") %>'>
                                                                 <MaskSettings Mask="<0..999999999>" />
                                                             </dxe:ASPxTextBox> 
                                                         </div>
                                                     </div>
                                                     <div class="left" style="height: 25px">
                                                         <dxe:ASPxComboBox ID="ComboCHStateE" runat="server" ClientInstanceName="cComboCHStateE"
                                                             EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                             Width="150px" >
                                                             <DropDownButton Text="State">
                                                             </DropDownButton>
                                                             <ClientSideEvents SelectedIndexChanged="function(s,e){OnTypeChange()}" TextChanged="onClientChange">
                                                             </ClientSideEvents>
                                                         </dxe:ASPxComboBox>
                                                     </div>
                                                     <div class="left" style="height: 25px; margin-left: 4px;">
                                                         <dxe:ASPxComboBox ID="ComboCHCountryE" runat="server" ClientInstanceName="cComboCHCountryE"
                                                             EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                             Width="150px">
                                                             <DropDownButton Text="Country">
                                                             </DropDownButton>
                                                             <ClientSideEvents SelectedIndexChanged="function(s,e){OnTypeChange()}" TextChanged="onClientChange">
                                                             </ClientSideEvents>
                                                         </dxe:ASPxComboBox>
                                                     </div>
                                                 </div>
                                               </div> 
                                                 <div class="Row">
                                                     <div id="Row26_Col8" class="LFloat_Lable Leftdiv">
                                                          Contact&nbsp; Details:
                                                          <br />
                                                          <span class="Spanclass">**</span><span style="font-size: 8pt">[Mandatory to Give Atleast&nbsp;<br />
                                                              &nbsp; &nbsp; &nbsp;One Contact No ] </span>
                                                     </div>
                                                     <div id="Row26_Col9" class="LFloat_Row" style="width:20%">
                                                         <div class="left" style="width: 99%">
                                                             <div class="left" style="height: 25px">
                                                                 Tel(Off) &nbsp;:
                                                             </div>
                                                             <div class="left" style="height: 25px">
                                                                 <dxe:ASPxTextBox ID="TxtCHTelOfcE" runat="server" ClientInstanceName="cTxtCHTelOfcE" MaxLength="11"
                                                                     HorizontalAlign="Right" Width="120px" Text='<%# Bind("OPhone") %>'>
                                                                     <MaskSettings Mask="<0..99999999999>" />
                                                                 </dxe:ASPxTextBox>
                                                             </div>
                                                             <div class="left" style="height: 25px">
                                                                Tel(Res) :
                                                             </div>
                                                             <div class="left" style="height: 25px">
                                                                 <dxe:ASPxTextBox ID="TxtCHTelResE" runat="server" ClientInstanceName="cTxtCHTelResE" MaxLength="11"
                                                                     HorizontalAlign="Right" Width="120px" Text='<%# Bind("RPhone") %>'>
                                                                     <MaskSettings Mask="<0..99999999999>" />
                                                                 </dxe:ASPxTextBox>
                                                             </div>
                                                         </div>
                                                         <div class="left" style="width: 99%">
                                                             
                                                             <div class="left" style="height: 25px">
                                                                 Mobile No:
                                                             </div>
                                                             <div class="left" style="height: 25px">
                                                                 <dxe:ASPxTextBox ID="TxtCHMobileNoE" runat="server" ClientInstanceName="cTxtCHMobileNoE"
                                                                     MaxLength="10" HorizontalAlign="Right" Width="125px" Text='<%# Bind("Mobile") %>'>
                                                                     <MaskSettings Mask="<0..9999999999>" />
                                                                 </dxe:ASPxTextBox>
                                                             </div>
                                                         </div>
                                                         <div class="left" style="height: 25px">
                                                              Email ID  :
                                                         </div>
                                                         <div class="left" style="height: 25px">
                                                             <dxe:ASPxTextBox ID="TxtCHEmlIDE" runat="server" ClientInstanceName="cTxtCHEmlIDE" Width="300px" Text='<%# Bind("Email") %>'>
                                                                 <ClientSideEvents LostFocus="function(s, e) {verifyEmail(cTxtCHEmlIDE);}"  />
                                                             </dxe:ASPxTextBox>
                                                         </div>
                                                     </div>
                                                     </div>
                                                 <div class="Row">
                                                     <div id="Row26_Col10E" class="LFloat_Lable Leftdiv">
                                                          Relationship with Applicant:
                                                     </div>
                                                     <div id="Row26_Col11E" class="LFloat_Row" style="height: 25px">
                                                         <dxe:ASPxTextBox ID="TxtRelWthapliE" runat="server" ClientInstanceName="cTxtRelWthapliE"
                                                             Width="130px" Text='<%# Bind("RelationshipApli") %>'>
                                                         </dxe:ASPxTextBox>
                                                     </div>
                                          
                                                     <div id="Row26_Col12E" class="LFloat_Row" style="height: 25px; margin-left: 10px;">
                                                     
                                                              <dxe:ASPxComboBox ID="ComboPEP" runat="server" ClientInstanceName="cComboPEP" EnableIncrementalFiltering="True"
                                                                 Font-Size="Small" SelectedIndex="0" ValueType="System.String" Width="200px"  Value='<%# Bind("PEP") %>'>
                                                                  <Items> 
                                                                        <dxe:ListEditItem Text="Politically Exposed Person (PEP)" Value="1"></dxe:ListEditItem>
                                                                        <dxe:ListEditItem Text="Related to Politically Exposed Person (PEP)" Value="2"></dxe:ListEditItem>
                                                                        <dxe:ListEditItem Text="NA" Value="3"></dxe:ListEditItem>
                                                                  </Items>
                                                                  <dropdownbutton text="PEP"></dropdownbutton>
                                                              </dxe:ASPxComboBox>
                                                           
                                                     </div>
                                                 </div> 
                                                 <div class="Row">
                                                      <div id="Row26_Col13E" class="LFloat_Lable Leftdiv">
                                                          IPV Details:
                                                      </div>
                                                      <div id="Row26_Col14E" class="LFloat_Row" style="height: 60px; width: 20%;">
                                                          <div class="left">
                                                              <div class="left" style="height: 25px">
                                                                  IPV Done By :
                                                              </div>
                                                              <div class="left" style="height: 25px">
                                                                  <dxe:ASPxTextBox ID="TxtCHIPVbyE" runat="server" ClientInstanceName="cTxtCHIPVbyE" MaxLength="11"
                                                                              HorizontalAlign="left" Width="120px" Text='<%# Bind("IPVDoneBy") %>'>
                                                                  </dxe:ASPxTextBox>
                                                              </div>
                                                              <div class="left" style="height: 25px">
                                                                  &nbsp;IPV Date&nbsp; :
                                                              </div>
                                                              <div class="left" style="height: 25px">
                                                                  <dxe:ASPxDateEdit id="CHIpvDtE" tabIndex=0 runat="server" Width="150px" ClientInstanceName="cCHIpvDtE" Font-Size="11px" UseMaskBehavior="True" EditFormatString="dd-MM-yyyy" EditFormat="Custom" DateOnError="Today" Text='<%# Bind("IPVDate") %>'>
                                                                  </dxe:ASPxDateEdit>
                                                              </div>
                                                          </div>
                                                      </div> 
                                               </div>
                                         
                                               <div class="Row">
                                                     <div id="Row26_Col15E" class="LFloat_Lable Leftdiv">
                                                         Relationship with Broker:
                                                     </div>
                                                     <div id="Row26_Col16E" class="LFloat_Row" style="height: 25px">
                                                         <dxe:ASPxTextBox ID="TxtRelWthBrokrE" runat="server" ClientInstanceName="cTxtRelWthBrokr"
                                                             Width="150px" Text='<%# Bind("RelationWithBroker") %>'>
                                                         </dxe:ASPxTextBox>
                                                     </div>
                                              </div>
                                                                   
                                            </div>                     
                                               
                                           <div id="DivbtnUpdtgv" style="float: left; width: 5%;margin-left:15px">
                                                <dxe:ASPxButton ID="btnUpdate" runat="server" AccessKey="X" AutoPostBack="False"
                                                    TabIndex="0" Text="Update Detail" ToolTip="Update the Detail you have inserted now."
                                                    Width="90%">
                                                    <Border BorderColor="White" />
                                                    <ClientSideEvents Click="function(s, e) { Update();}" />
                                                </dxe:ASPxButton>
                                            </div>
                                            <div id="DivbtnCnclgv" style="float: left; width: 5%">
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
               </div>
                                
        </div>
                <div class="Row">
                    <div id="Row26_Col17" class="LFloat_Lable Leftdiv">
                        <span style="font-size: 10pt; color: #ff0000">**</span>Attach Related Documents :
                    </div>
                    <div id="Row26_Col18" style="margin-top:10px;float:left">
                        <dxe:ASPxButton ID="btnDocument" runat="server" AutoPostBack="False" ClientInstanceName="cbtnDocument" Text="Click To Add Attachments" Cursor="pointer" EnableDefaultAppearance="False" Font-Size="13px" Font-Underline="True" ForeColor="Blue" >
                            <ClientSideEvents Click="function(s, e) {AttachDoc_Click();}"></ClientSideEvents>
                        </dxe:ASPxButton>
                        
                    </div> 
                    <div id="Row26_Col19" style="margin-top:10px;float:left; margin-left: 10px;">
                        <dxe:ASPxButton ID="btnShowDocument" runat="server" AutoPostBack="False" ClientInstanceName="cbtnShowDocument" Text="Click To See Attachments" Cursor="pointer" EnableDefaultAppearance="False" Font-Size="13px" Font-Underline="True" ForeColor="Blue" >
                            <ClientSideEvents Click="function(s, e) {ShowDoc_Click();}"></ClientSideEvents>
                        </dxe:ASPxButton>
                        
                    </div> 
                    
                    <div id="divOthrDtlSave" class="left BtmMargin" style="margin-left: 10px; font-size: 12pt; float: right; width: 20%;">
                            <dxe:ASPxButton ID="BtnSaveOthrDtl" runat="server" AutoPostBack="false" TabIndex="0"
                                Text="Save [O]therDetail" ToolTip="Save Entered Data" Width="126px" ClientInstanceName="cBtnSaveOthrDtl" AccessKey="o">
                                <ClientSideEvents Click="function(s, e) {SaveOthrDtl();}" />
                                <Border BorderColor="White" />
                            </dxe:ASPxButton>
                    </div>
                    <div id="divOthrDtlEdit" class="left BtmMargin" style="margin-left: 10px; font-size: 12pt; float: right; width: 20%;">
                            <dxe:ASPxButton ID="BtnEditOthrDtl" runat="server" AutoPostBack="false" TabIndex="0"
                                Text="Edit" ToolTip="Edit Entered Data" Width="100px" ClientInstanceName="cBtnEditOthrDtl">
                                <ClientSideEvents Click="function(s, e) {EditOthrDtl();}" />
                                <Border BorderColor="White" />
                            </dxe:ASPxButton>
                    </div>
                    <br />
                     <br /> <br /> <br /> 
                    <div id="DivOthrDtlsAlrt" class="Success BtmMargin" style="margin-top:10px;width:800px;font-size:9pt;">
                        Other Details Section Submitted Successfully !!
                    </div>
                    <br /><br />
                </div>
                <div runat="server" style="display:none">
                  <dxe:ASPxButton  id="BtnHidn" tabIndex="0" runat="server" Width="130px"  ClientInstanceName="cBtnHidn"  AutoPostBack="false">
                    <ClientSideEvents Click="function(s, e) {OthrDetlSave();}" ></ClientSideEvents>
                  </dxe:ASPxButton>
                  <dxe:ASPxTextBox ID="TxtClientID" runat="server" ClientInstanceName="cTxtClientID"
                       Width="136px">
                                     
                  </dxe:ASPxTextBox>
                </div>
              </dxp:panelcontent>
             </PanelCollection>
           <ClientSideEvents EndCallback="function (s, e) {CbpOthrDtls_EndCallBack();}" />
         </dxcp:ASPxCallbackPanel>  
         </div>
       </div>
      </div>
    </div> 
          <div  id="Row27" style="FLOAT: left; WIDTH: 100%;text-align:center; margin-bottom: 10px;" >
              <div class="left" style="width:49%;text-align:right;">
                  <dxe:ASPxButton accessKey="S" id="btnSave" tabIndex="0" runat="server" Width="130px" ToolTip="Click To Submit The Whole Entered  Data." Text="[S]ubmit" AutoPostBack="false">
                    <Border BorderColor="White" ></Border>
                    <ClientSideEvents Click="function(s, e) {SaveButtonClick();}" ></ClientSideEvents>
                  </dxe:ASPxButton> 
              </div>
              <div id="DivBtnReset" class="left" style="width:49%;text-align:left;margin-left:5px">
                   <dxe:ASPxButton accessKey="R" id="btnReset" tabIndex="0" runat="server" Width="130px" ToolTip="Reset Entered Data." Text="[R]eset" AutoPostBack="false">
                    <Border BorderColor="White" ></Border>
                    <ClientSideEvents Click="function(s, e) {ResetButtonClick();}" ></ClientSideEvents>
                  </dxe:ASPxButton> 
              </div>
          </div>
        <br />
    
   <asp:HiddenField ID="hdn_GridBindOrNotBind" runat="server" />
   <asp:HiddenField ID="Hdn_PageSize" runat="server" />
   <asp:HiddenField ID="Hdn_PageNumber" runat="server" />
    
    <dxpc:ASPxPopupControl ID="PopUp_StartPage" runat="server" ClientInstanceName="cPopUp_StartPage" 
                CloseAction="None" HeaderText="  KRA ( KYC Registration Authorization )  Entry" Modal="True" PopupHorizontalAlign="LeftSides"
                PopupVerticalAlign="TopSides" ShowOnPageLoad="True" ShowSizeGrip="False" Width="840px">
                <ClientSideEvents PopUp="function(s, e)
                                                    {
                                                     setTimeout('cComboClType.Focus()', 50);
                                                    
                                                    }" 
                                                     />
                <ContentCollection>
                   <dxpc:PopupControlContentControl runat="server">
                   
                    <dxp:ASPxPanel ID="Panel_Start" runat="server" DefaultButton="btnOk" Width="99%" >
                     <PanelCollection>
                       <dxp:panelcontent ID="Panelcontent1" runat="server">
                           <div style="text-align:center;width:99%"> 
                           <br />
                           <div  class="LFloat_Row DivName" style="font-size:12px;margin-bottom:10px"> 
                                     
                                    <dxe:ASPxRadioButton ID="rdEdit" runat="server" Checked="true" ClientInstanceName="crdEdit" GroupName="o" Layout="Flow" >
                                         <clientsideevents CheckedChanged="function(s,e){FnShowNew()}" ></clientsideevents>  
                                    </dxe:ASPxRadioButton>
                                                        Show Or Change KYC Records
                                     <dxe:ASPxRadioButton ID="rdNew" runat="server" Checked="false" ClientInstanceName="crdNew" GroupName="o" Layout="Flow" >
                                        <clientsideevents CheckedChanged="function(s,e){FnShowNew()}" ></clientsideevents>  
                                     </dxe:ASPxRadioButton>
                                                        Create New KYC Record
                               <dxe:ASPxRadioButton ID="rdUnSaved" runat="server" Checked="false" ClientInstanceName="crdUnSaved" GroupName="o" Layout="Flow" >
                                   <ClientSideEvents CheckedChanged="function(s,e){FnShowNew()}" />
                               </dxe:ASPxRadioButton>
                               UnSaved Records &nbsp;<dxe:ASPxRadioButton ID="rdImport" runat="server" Checked="false" ClientInstanceName="crdImport" GroupName="o" Layout="Flow" >
                                        <clientsideevents CheckedChanged="function(s,e){FnShowNew()}" ></clientsideevents>  
                                     </dxe:ASPxRadioButton>
                                                        Import KYC Record
                           </div>
                           <div id="DivNewEntry" class="left BtmMargin" style="width:99%">
                              <div id="PopUpRow0" class="LFloat_Row DivName" style="font-size:12px;margin-bottom:10px"> 
                     
                                     <dxe:ASPxRadioButton ID="rdNwCl" runat="server" Checked="True" ClientInstanceName="crdNwCl"  GroupName="q" Layout="Flow">
                                         <clientsideevents CheckedChanged="function(s,e){FnShowFilter()}" ></clientsideevents>  
                                     </dxe:ASPxRadioButton>
                                                        Creating New Client
                                     <dxe:ASPxRadioButton ID="rdExCl" runat="server" Checked="false" ClientInstanceName="crdExCl" GroupName="q" Layout="Flow">
                                         <clientsideevents CheckedChanged="function(s,e){FnShowFilter()}" ></clientsideevents>  
                                     </dxe:ASPxRadioButton>
                                                        Existing Client
                              </div>
                               
                               <div id="PopUpRow1" class="LFloat_Row DivName"  style="margin-left:10px;" >
                                   <dxe:ASPxComboBox ID="ddlGroup" runat="server" ClientInstanceName="cddlGroup" EnableIncrementalFiltering="True"
                                    Font-Size="12px" SelectedIndex="0" ValueType="System.String" Width="140px" Height="25px" >
                                    
                                    <Items> 
                                        <dxe:ListEditItem Text="Branch" Value="0"></dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Group" Value="1"></dxe:ListEditItem>
                                        <dxe:ListEditItem Text="Client" Value="2"></dxe:ListEditItem>
                                    </Items>
                                     <clientsideevents selectedindexchanged="function(s,e){fnddlGroup()}" ></clientsideevents>     
                                  </dxe:ASPxComboBox>
                                          <%-- 
                                          <dxe:ASPxComboBox ID="ddlGroup" runat="server" ClientInstanceName="cddlGroup"
                                                  EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0"  ValueType="System.String"
                                                  Width="140px" OnCallback="ddlGroup_Callback">
                                                  
                                              <clientsideevents selectedindexchanged="function(s,e){fnddlGroup()}" ></clientsideevents>     
                                          </dxe:ASPxComboBox>--%>
                                 
                               </div>
                               <div id="PopUpRow2" class="LFloat_Row DivName"  style="margin-left:10px;"><%--OnCallback="CbpBindGroup_Callback"--%>
                                    <%--<dxcp:ASPxCallbackPanel ID="CbpBindGroup" runat="server" ClientInstanceName="cCbpBindGroup"  BackColor="Transparent" >
                                     <PanelCollection>
                                       <dxp:panelcontent runat="server">--%>
                                          <dxe:ASPxComboBox ID="ddlgrouptype" runat="server" ClientInstanceName="cddlgrouptype"
                                                  EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                  Width="140px" OnCallback="ddlgrouptype_Callback">
                                              <clientsideevents selectedindexchanged="function(s,e){fn_Group()}"  EndCallback="function(s,e){ddlgrouptype_EndCallback()}"></clientsideevents>     
                                          </dxe:ASPxComboBox>
                                       <%-- </dxp:panelcontent>
                                       </PanelCollection>
                                     <ClientSideEvents  EndCallback="function (s, e) {CbpBindGroup_EndCallBack();}" />
                                   </dxcp:ASPxCallbackPanel> --%>
                               </div> 
                                <div id="showFilter" class="LFloat_Row left" style="width: 452px;margin-left:10px;margin-bottom:10px ">
                                    <div style="width: 100%">
                                        <div class="frmleftContent">
                                            <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Height="20px" Width="350px"
                                                TabIndex="0"></asp:TextBox>
                                        </div>
                                        <div class="frmleftContent">
                                            <a id="A11" href="javascript:void(0);" tabindex="11" onclick="btnAddsubscriptionlist_click()">
                                                <span style="color: #009900; text-decoration: underline; font-size: 10pt;">Add to List</span></a>
                                        </div>
                                    </div>
                                    <span class="clear" style="background-color: #B7CEEC;"></span>
                                    <div class="frmleftContent" style="height: 105px; margin-top: 5px">
                                        <asp:ListBox ID="lstSelection" runat="server" Font-Size="12px" Height="100px" Width="440px"
                                            TabIndex="0"></asp:ListBox>
                                    </div>
                                    <span class="clear" style="background-color: #B7CEEC;"></span>
                                    <div class="frmleftContent" style="text-align: center">
                                        <a id="A12" href="javascript:void(0);" tabindex="13" onclick="lnkBtnAddFinalSelection()">
                                            <span style="color: #000099; text-decoration: underline; font-size: 10pt;">Done</span></a>&nbsp;&nbsp;
                                        <a id="A13" href="javascript:void(0);" tabindex="14" onclick="lnkBtnRemoveFromSelection()">
                                            <span style="color: #cc3300; text-decoration: underline; font-size: 10pt;">Remove</span></a>
                                    </div>
                               </div>
                       
                           
                       </div>
                       <div id="PopUpRow3" class="LFloat_Row DivName" style="font-size:12px"> 
                            <dxe:ASPxComboBox ID="ComboAgency" runat="server" ClientInstanceName="cComboAgency" EnableIncrementalFiltering="True"
                                Font-Size="12px" SelectedIndex="0" ValueType="System.String" Width="187px" Height="25px">
                                <Items> 
                                    <dxe:ListEditItem Text="NDML" Value="3"></dxe:ListEditItem>
                                    <dxe:ListEditItem Text="CVL" Value="4"></dxe:ListEditItem>
                                    <dxe:ListEditItem Text="DotEx" Value="5"></dxe:ListEditItem>
                                </Items>
                                <dropdownbutton text="Reg. Agency"></dropdownbutton>
                            </dxe:ASPxComboBox>
                        </div>
                        <div id="PopUpRow4" class="LFloat_Row DivName" style="font-size:12px"> 
                            <dxe:ASPxComboBox ID="ComboClType" runat="server" ClientInstanceName="cComboClType" EnableIncrementalFiltering="True"
                                Font-Size="12px" SelectedIndex="0" ValueType="System.String" Width="187px" Height="25px">
                                <Items>
                                    <dxe:ListEditItem Text="Individual" Value="I"></dxe:ListEditItem>
                                    <dxe:ListEditItem Text="NonIndividual" Value="N"></dxe:ListEditItem>
                                </Items>
                                <dropdownbutton text="ClientType"></dropdownbutton>
                            </dxe:ASPxComboBox>
                        </div>
                        <div id="PopUpRow5" class="LFloat_Row DivName" style="font-size:12px">
                             <dxe:ASPxComboBox ID="ComboCompany" runat="server" ClientInstanceName="cComboCompany"
                                 EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                 Width="187px">
                                 <DropDownButton Text="Company">
                                 </DropDownButton>
                             </dxe:ASPxComboBox>
                        </div>
                        <div class="left" style="text-align:center;width:100%;margin-top:10px">
                            <dxe:ASPxButton ID="btnOk" runat="server" AutoPostBack="False" Text="Ok" Width="85px"  ClientInstanceName="cbtnOk" >
                                <ClientSideEvents Click="function (s, e) {PopUp_StartPage_btnOK_Click(); }" />
                            </dxe:ASPxButton>
                        </div>
                        
                        </div>
                        <div style="display:none">
                            <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="150px"></asp:TextBox>
                            <asp:HiddenField ID="HiddenField_Group" runat="server" />
                            <asp:HiddenField ID="HiddenField_Branch" runat="server" />
                            <asp:HiddenField ID="HiddenField_Client" runat="server" />
                               
                        </div>
                        </dxp:panelcontent>
                        </PanelCollection>
                       </dxp:ASPxPanel>
                      </dxpc:PopupControlContentControl>
                </ContentCollection>
                <HeaderStyle BackColor="LightGray" ForeColor="Black" Font-Names="Calibri" />
         </dxpc:ASPxPopupControl>
     
        <dxpc:ASPxPopupControl ID="PopUpDocAttach" runat="server" ContentUrl="../management/frmAddDocuments.aspx"
            CloseAction="CloseButton" Top="2000" Left="400" ClientInstanceName="popup" Height="350px"
            Width="900px" HeaderText="Add Document" AllowResize="true" ResizingMode="Postponed">
            <ContentCollection>
                <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                </dxpc:PopupControlContentControl>
            </ContentCollection>
            <HeaderStyle BackColor="#B8B8B8" Font-Bold="True"  ForeColor="Black" />
        </dxpc:ASPxPopupControl>
        
        <dxpc:ASPxPopupControl ID="PopUpShowDocAttach" runat="server" ClientInstanceName="cPopUpShowDocAttach"
            CloseAction="closeButton" HeaderText="Show Document" Top="2000" Left="400"
            Modal="false" PopupHorizontalAlign="LeftSides" PopupVerticalAlign="BottomSides" ShowOnPageLoad="false"
            ShowSizeGrip="False" Width="840px">
            <ClientSideEvents />
            <ContentCollection>
                <dxpc:PopupControlContentControl ID="PopupControlContentControl2" runat="server" >
                    <dxcp:ASPxCallbackPanel ID="CbpPopUpShowDocAttach" runat="server" ClientInstanceName="cCbpPopUpShowDocAttach" OnCallback="CbpPopUpShowDocAttach_CallBack">
                     <PanelCollection>
                     
                            <dxp:PanelContent  runat="server" >
                             <div style="text-align: center; width: 99%">
                                    <div id="DivChkBox0" style="width: 70%" class="left  BtmMargin" runat="server">
                                        <div id="Div1" class="left  BtmMargin" style="font-size: 12px; width: 60%"
                                            runat="server">
                                            <dxe:ASPxTextBox ID="TxtPopUpshw1" runat="server" ClientInstanceName="cTxtPopUpshw1"
                                                Border-BorderStyle="None" Text="No File Uploaded" ClientEnabled="false" ReadOnlyStyle-ForeColor="black" Font-Size="14px"
                                                Cursor="pointer" DisabledStyle-Font-Bold="true" DisabledStyle-ForeColor="black"  Width="130px">
                                            </dxe:ASPxTextBox>
                                        </div>
                                        <div class="left  BtmMargin">
                                            <dxe:ASPxButton ID="BtnPopUpshw1" runat="server" AutoPostBack="False" ClientInstanceName="cLinkUcc"
                                                Cursor="pointer" EnableDefaultAppearance="False" Font-Size="14px" Font-Underline="True"
                                                ForeColor="Blue" Text="Delete">
                                                <ClientSideEvents Click="function(s, e) {LinkUcc_Click();}" />
                                            </dxe:ASPxButton>
                                        </div>
                                    </div>
                                    <div id="DivChkBox1" class="left  BtmMargin" style="width: 70%"  runat="server">
                                        <div class="left  BtmMargin" style="font-size: 12px; width: 60%">
                                            <dxe:ASPxTextBox ID="TxtPopUpshw2" runat="server" ClientInstanceName="cTxtPopUpshw2"
                                                Border-BorderStyle="None" Text="No File Uploaded" ClientEnabled="false" ReadOnlyStyle-ForeColor="black" Font-Size="14px"
                                                Cursor="pointer" DisabledStyle-Font-Bold="true" DisabledStyle-ForeColor="black"  Width="130px">
                                            </dxe:ASPxTextBox>
                                        </div>
                                        <div class="left  BtmMargin">
                                            <dxe:ASPxButton ID="BtnPopUpshw2" runat="server" AutoPostBack="False" ClientInstanceName="cLinkUcc"
                                                Cursor="pointer" EnableDefaultAppearance="False" Font-Size="14px" Font-Underline="True"
                                                ForeColor="Blue" Text="Delete">
                                                <ClientSideEvents Click="function(s, e) {LinkUcc_Click();}" />
                                            </dxe:ASPxButton>
                                        </div>
                                    </div>
                                    <div id="DivChkBox2" style="width: 70%"  runat="server" class="left  BtmMargin">
                                        <div class="left  BtmMargin" style="font-size: 12px; width: 60%">
                                            <dxe:ASPxTextBox ID="TxtPopUpshw3" runat="server" ClientInstanceName="cTxtPopUpshw3"
                                                Border-BorderStyle="None"  Text="No File Uploaded" ClientEnabled="false" ReadOnlyStyle-ForeColor="black" Font-Size="14px"
                                                Cursor="pointer" DisabledStyle-Font-Bold="true" DisabledStyle-ForeColor="black"  Width="130px">
                                            </dxe:ASPxTextBox>
                                        </div>
                                        <div class="left  BtmMargin">
                                            <dxe:ASPxButton ID="BtnPopUpshw3" runat="server" AutoPostBack="False" ClientInstanceName="cLinkUcc"
                                                Cursor="pointer" EnableDefaultAppearance="False" Font-Size="14px" Font-Underline="True"
                                                ForeColor="Blue" Text="Delete">
                                                <ClientSideEvents Click="function(s, e) {LinkUcc_Click();}" />
                                            </dxe:ASPxButton>
                                        </div>
                                    </div>
                                    <div id="DivChkBox3" style="width: 70%"  runat="server" class="left  BtmMargin">
                                        <div class="left  BtmMargin" style="font-size: 12px; width: 60%">
                                            <dxe:ASPxTextBox ID="TxtPopUpshw4" runat="server" ClientInstanceName="cTxtPopUpshw4"
                                                Border-BorderStyle="None"  Text="No File Uploaded" ClientEnabled="false" ReadOnlyStyle-ForeColor="black" Font-Size="14px"
                                                Cursor="pointer" DisabledStyle-Font-Bold="true" DisabledStyle-ForeColor="black"  Width="130px">
                                            </dxe:ASPxTextBox>
                                        </div>
                                        <div class="left  BtmMargin">
                                            <dxe:ASPxButton ID="BtnPopUpshw4" runat="server" AutoPostBack="False" ClientInstanceName="cLinkUcc"
                                                Cursor="pointer" EnableDefaultAppearance="False" Font-Size="14px" Font-Underline="True"
                                                ForeColor="Blue" Text="Delete">
                                                <ClientSideEvents Click="function(s, e) {LinkUcc_Click();}" />
                                            </dxe:ASPxButton>
                                        </div>
                                    </div>
                                    <div id="DivChkBox4" style="width: 70%"  runat="server" class="left  BtmMargin">
                                        <div class="left  BtmMargin" style="font-size: 12px; width: 60%">
                                            <dxe:ASPxTextBox ID="TxtPopUpshw5" runat="server" ClientInstanceName="cTxtPopUpshw5"
                                                Border-BorderStyle="None"  Text="No File Uploaded" ClientEnabled="false" ReadOnlyStyle-ForeColor="black" Font-Size="14px"
                                                Cursor="pointer" DisabledStyle-Font-Bold="true" DisabledStyle-ForeColor="black"  Width="130px">
                                            </dxe:ASPxTextBox>
                                        </div>
                                        <div class="left  BtmMargin">
                                            <dxe:ASPxButton ID="BtnPopUpshw5" runat="server" AutoPostBack="False" ClientInstanceName="cLinkUcc"
                                                Cursor="pointer" EnableDefaultAppearance="False" Font-Size="14px" Font-Underline="True"
                                                ForeColor="Blue" Text="Delete">
                                                <ClientSideEvents Click="function(s, e) {LinkUcc_Click();}" />
                                            </dxe:ASPxButton>
                                        </div>
                                    </div>
                                    <div id="DivChkBox5" style="width: 70%"  runat="server" class="left  BtmMargin">
                                        <div class="left  BtmMargin" style="font-size: 12px; width: 60%">
                                            <dxe:ASPxTextBox ID="TxtPopUpshw6" runat="server" ClientInstanceName="cTxtPopUpshw6" 
                                                Border-BorderStyle="None"  Text="No File Uploaded" ClientEnabled="false" ReadOnlyStyle-ForeColor="black" Font-Size="14px" 
                                                Cursor="pointer" DisabledStyle-Font-Bold="true" DisabledStyle-ForeColor="black"  Width="130px">
                                            </dxe:ASPxTextBox>
                                        </div>
                                        <div class="left  BtmMargin">
                                            <dxe:ASPxButton ID="BtnPopUpshw6" runat="server" AutoPostBack="False" ClientInstanceName="cLinkUcc"
                                                Cursor="pointer" EnableDefaultAppearance="False" Font-Size="14px" Font-Underline="True"
                                                ForeColor="Blue" Text="Delete">
                                                <ClientSideEvents Click="function(s, e) {LinkUcc_Click();}" />
                                            </dxe:ASPxButton>
                                        </div>
                                    </div>
                                    <div id="DivChkBox6" style="width: 70%"  runat="server" class="left  BtmMargin">
                                        <div class="left  BtmMargin" style="font-size: 12px; width: 60%;">
                                            <dxe:ASPxTextBox ID="TxtPopUpshw7" runat="server" ClientInstanceName="cTxtPopUpshw7" 
                                                Border-BorderStyle="None"  Text="No File Uploaded" ClientEnabled="false"  Font-Size="14px" 
                                                Cursor="pointer" DisabledStyle-Font-Bold="true" DisabledStyle-ForeColor="black"  Width="130px">
                                            </dxe:ASPxTextBox>
                                        </div>
                                        <div class="left  BtmMargin"> 
                                            <dxe:ASPxButton ID="BtnPopUpshw7" runat="server" AutoPostBack="False" ClientInstanceName="cLinkUcc"
                                                Cursor="pointer" EnableDefaultAppearance="False" Font-Size="14px" Font-Underline="True"
                                                ForeColor="Blue" Text="Delete">
                                                <ClientSideEvents Click="function(s, e) {LinkUcc_Click();}" />
                                            </dxe:ASPxButton>
                                        </div>
                                    </div>
                                    <div class="left" style="text-align: center; width: 100%; margin-top: 10px">
                                        <dxe:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" Text="Ok" Width="85px"
                                            ClientInstanceName="cbtnOk">
                                            <ClientSideEvents Click="function (s, e) {cPopUpShowDocAttach.Hide(); }" />
                                        </dxe:ASPxButton>
                                    </div>
                                </div>
                               </dxp:PanelContent>
                               
                        </PanelCollection>
                        <ClientSideEvents EndCallback="CbpPopUpShowDocAttach_EndCallBack"/>
                     </dxcp:ASPxCallbackPanel>
                </dxpc:PopupControlContentControl>
            </ContentCollection>
            <HeaderStyle BackColor="LightGray" ForeColor="Black" Font-Names="Calibri" />
        </dxpc:ASPxPopupControl>
         
         <%-- <dxpc:ASPxPopupControl ID="PopUpShowDocAttach" runat="server" 
            CloseAction="CloseButton" Top="2000" Left="400" ClientInstanceName="cPopUpShowDocAttach" Height="350px"
            Width="800px" HeaderText="Show Document" AllowResize="true" ResizingMode="Postponed">
           
            <ContentCollection>
               <dxpc:PopupControlContentControl  runat="server">
               <dxcp:ASPxCallbackPanel ID="CbpPopUpShowDocAttach" runat="server" ClientInstanceName="cCbpPopUpShowDocAttach" OnCallback="CbpPopUpShowDocAttach_CallBack">
               <PanelCollection>
                <dxp:panelcontent runat="server">
                   <div style="text-align:center;width:99%"> 
                    <div id="DivChkBox0" style="width:70%" >
                        <div  class="left Success BtmMargin" style="font-size: 12px;width:60%" runat="server">
                        <dxe:ASPxTextBox ID="TxtPopUpshw1" runat="server" ClientInstanceName="cTxtPopUpshw1" Border-BorderStyle="None"
                             ClientEnabled="false" ReadOnlyStyle-ForeColor="black" Cursor="pointer" BackColor="#DFF2BF" Width="130px">
                        </dxe:ASPxTextBox>
                        </div>
                        <div>
                        <dxe:ASPxButton ID="BtnPopUpshw1" runat="server" AutoPostBack="False"
                                ClientInstanceName="cLinkUcc" Cursor="pointer" EnableDefaultAppearance="False"
                                Font-Size="14px" Font-Underline="True" ForeColor="Blue" Text="Delete">
                        <ClientSideEvents Click="function(s, e) {LinkUcc_Click();}" />
                        </dxe:ASPxButton>
                     </div>
                    </div>
                    <div id="DivChkBox1" style="width:70%">
                         <div  class="left Success BtmMargin" style="font-size: 12px;width:60%">
                             <dxe:ASPxTextBox ID="TxtPopUpshw2" runat="server" ClientInstanceName="cTxtPopUpshw2" Border-BorderStyle="None"
                                     ClientEnabled="false" ReadOnlyStyle-ForeColor="black" Cursor="pointer" BackColor="#DFF2BF" Width="130px">
                             </dxe:ASPxTextBox>
                        </div>
                         <div>
                              <dxe:ASPxButton ID="BtnPopUpshw2" runat="server" AutoPostBack="False"
                                                    ClientInstanceName="cLinkUcc" Cursor="pointer" EnableDefaultAppearance="False"
                                                    Font-Size="14px" Font-Underline="True" ForeColor="Blue" Text="Delete">
                                 <ClientSideEvents Click="function(s, e) {LinkUcc_Click();}" />
                             </dxe:ASPxButton>
                         </div>
                    </div>
                    <div id="DivChkBox2" style="width:70%">
                         <div  class="left Success BtmMargin" style="font-size: 12px;width:60%">
                         <dxe:ASPxTextBox ID="TxtPopUpshw3" runat="server" ClientInstanceName="cTxtPopUpshw3" Border-BorderStyle="None"
                                ClientEnabled="false" ReadOnlyStyle-ForeColor="black" Cursor="pointer"  BackColor="#DFF2BF" Width="130px">
                        </dxe:ASPxTextBox>
                        </div> 
                         <div>                                         
                             <dxe:ASPxButton ID="BtnPopUpshw3" runat="server" AutoPostBack="False"
                                                    ClientInstanceName="cLinkUcc" Cursor="pointer" EnableDefaultAppearance="False"
                                                    Font-Size="14px" Font-Underline="True" ForeColor="Blue" Text="Delete">
                                 <ClientSideEvents Click="function(s, e) {LinkUcc_Click();}" />
                             </dxe:ASPxButton>
                         </div> 
                    </div>
                    <div id="DivChkBox3" style="width:70%">
                       <div  class="left Success BtmMargin" style="font-size: 12px;width:60%">
                             <dxe:ASPxTextBox ID="TxtPopUpshw4" runat="server" ClientInstanceName="cTxtPopUpshw4" Border-BorderStyle="None"
                                    ClientEnabled="false" ReadOnlyStyle-ForeColor="black" Cursor="pointer"  BackColor="#DFF2BF" Width="130px">
                             </dxe:ASPxTextBox>
                       </div>
                       <div> 
                          <dxe:ASPxButton ID="BtnPopUpshw4" runat="server" AutoPostBack="False"
                                                ClientInstanceName="cLinkUcc" Cursor="pointer" EnableDefaultAppearance="False"
                                                Font-Size="14px" Font-Underline="True" ForeColor="Blue" Text="Delete">
                             <ClientSideEvents Click="function(s, e) {LinkUcc_Click();}" />
                          </dxe:ASPxButton>
                     </div>
                    </div>
                    <div id="DivChkBox4" style="width:70%">
                        <div  class="left Success BtmMargin" style="font-size: 12px;width:60%">
                            <dxe:ASPxTextBox ID="TxtPopUpshw5" runat="server" ClientInstanceName="cTxtPopUpshw5" Border-BorderStyle="None"
                                   ClientEnabled="false" ReadOnlyStyle-ForeColor="black" Cursor="pointer"   BackColor="#DFF2BF" Width="130px">
                            </dxe:ASPxTextBox>
                        </div>
                        <div>
                             <dxe:ASPxButton ID="BtnPopUpshw5" runat="server" AutoPostBack="False"
                                                    ClientInstanceName="cLinkUcc" Cursor="pointer" EnableDefaultAppearance="False"
                                                    Font-Size="14px" Font-Underline="True" ForeColor="Blue" Text="Delete">
                                <ClientSideEvents Click="function(s, e) {LinkUcc_Click();}" />
                             </dxe:ASPxButton>
                        </div>
                    </div>
                    <div id="DivChkBox5" style="width:70%">
                        <div  class="left Success BtmMargin" style="font-size: 12px;width:60%"> 
                            <dxe:ASPxTextBox ID="TxtPopUpshw6" runat="server" ClientInstanceName="cTxtPopUpshw6" Border-BorderStyle="None"
                                       ClientEnabled="false" ReadOnlyStyle-ForeColor="black" Cursor="pointer"  BackColor="#DFF2BF" Width="130px">
                            </dxe:ASPxTextBox>
                        </div>
                        <div>
                             <dxe:ASPxButton ID="BtnPopUpshw6" runat="server" AutoPostBack="False"
                                                    ClientInstanceName="cLinkUcc" Cursor="pointer" EnableDefaultAppearance="False"
                                                    Font-Size="14px" Font-Underline="True" ForeColor="Blue" Text="Delete">
                                <ClientSideEvents Click="function(s, e) {LinkUcc_Click();}" />
                             </dxe:ASPxButton>
                        </div>
                    </div>
                    <div id="DivChkBox6" style="width:70%">
                        <div  class="left Success BtmMargin" style="font-size: 12px;width:60%"> 
                            <dxe:ASPxTextBox ID="TxtPopUpshw7" runat="server" ClientInstanceName="cTxtPopUpshw7" Border-BorderStyle="None"
                                   ClientEnabled="false" ReadOnlyStyle-ForeColor="black" Cursor="pointer"  BackColor="#DFF2BF" Width="130px">
                            </dxe:ASPxTextBox>
                        </div>
                        <div>
                             <dxe:ASPxButton ID="BtnPopUpshw7" runat="server" AutoPostBack="False"
                                                    ClientInstanceName="cLinkUcc" Cursor="pointer" EnableDefaultAppearance="False"
                                                    Font-Size="14px" Font-Underline="True" ForeColor="Blue" Text="Delete">
                                <ClientSideEvents Click="function(s, e) {LinkUcc_Click();}" />
                             </dxe:ASPxButton>
                        </div>
                    </div>
                
                 <div class="left" style="text-align:center;width:100%;margin-top:10px">
                 <dxe:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" Text="Ok" Width="85px"  ClientInstanceName="cbtnOk" >
                <ClientSideEvents Click="function (s, e) {cPopUpShowDocAttach.Hide(); }" />
                </dxe:ASPxButton>

                 </div>
                 </div>
                 </dxp:panelcontent>
                 </PanelCollection>
                 <ClientSideEvents EndCallback="CbpPopUpShowDocAttach_EndCallBack"/>
                 </dxcp:ASPxCallbackPanel>
                </dxpc:PopupControlContentControl>
            </ContentCollection>

            <HeaderStyle BackColor="#B8B8B8" Font-Bold="True"  ForeColor="Black" />
        </dxpc:ASPxPopupControl>--%>
        
        <dxpc:ASPxPopupControl ID="ConfirmPopUp1" runat="server" ClientInstanceName="cConfirmPopUp1"
            CloseAction="None" HeaderText="Confirmation Message(1)" Left="200" Modal="True" PopupHorizontalAlign="Center"
            PopupHorizontalOffset="500" PopupVerticalAlign="BottomSides" PopupVerticalOffset="2000"
            RenderIFrameForPopupElements="True" ShowSizeGrip="False" Top="100" Width="387px">
            <ContentCollection>
                <dxpc:PopupControlContentControl runat="server">
                    <table class="style1">
                        <tr>
                            <td colspan="5">
                                &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<span style="font-family: Calibri">If You Reset All Your Entered Data Will Be Lost<br />
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Do You Still Want To Reset???</span></td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td style="width: 3px">
                                <dxe:ASPxButton ID="btnCnfrmYs1" runat="server" AutoPostBack="False" Height="6px"
                                    meta:resourceKey="btnContinueResource1" Text="Yes" Width="192px">
                                    <ClientSideEvents Click="function (s, e) { ConfirmPopUpClickYes1(); cConfirmPopUp1.Hide(); }" />
                                </dxe:ASPxButton>
                            </td>
                            <td style="width: 3px">
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
                <dxpc:PopupControlContentControl  runat="server">
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
      </div>
    </form>
</body>
</html>
