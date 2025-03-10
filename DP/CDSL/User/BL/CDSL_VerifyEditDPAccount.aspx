<%@ page language="C#" autoeventwireup="true" inherits="DP_CDSL_User_BL_CDSL_VerifyEditDPAccount, App_Web_f9t-z9uf" %>

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
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Untitled Page</title>

    <script type="text/javascript" src="../../../../CentralData/JSScript/jquery-1.3.2.js"></script>

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
                           width: 950px; height: 28px; padding: 2px 5px 2px 2px; background-color: #555; 
                           opacity: 0.75; filter: alpha(opacity=75);}
        .Box_closeTotal { margin-left:20px;z-index: 55; position: fixed; width:16px; height:20px;text-align:center; 
                          color: #000;  font-weight:bold; background: #EC733A; border:solid 2px #555; } /*background: #F4A460;*/
        .cellTotHeader { padding:2px; height: 22px; border: solid .1pt #FF5500;font-size: 12px; background-color: #DDD;/*border: solid .1pt #F4A460;*/
                         font-weight:bold; text-align:center; line-height:2; cursor:pointer;}
    </style>
    <%-----------------------Start New DevExpress Validation---------------------------%>

    <script type="text/javascript" language="javascript">    
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
    </script>

    <%------------------------End New DevExpress Validation----------------------------%>
    <%-------------------------Start Common Methods PageLoad-----------%>

    <script type="text/javascript" language="javascript">
     //Global Variable
        FieldName = '';
        var AplicatnNo = '';
        var PrdctBind = '';
        var EntryType = 'AddEdit';
        var currentDateToset=new Date('<%=Session["ServerDate"] %>');
        /****** Modify for Floatable Div Not Go To Other section If current Section In edit Mode ******/
        var NameAdrs = 'T';
        var ContactPan = 'T';
        var UserDefSection = 'T';
        var SecndAcntHldr = 'T';
        var ThrdAcntHldr = 'T';
        var ProductDtls = 'T';
        var POADtls = 'T';
        var Nominee = 'T';
        var Gurdian = 'T';
        var NomineeGurdian = 'T';        
    //End
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
      HideShow('Div_FirstAccountHlder','H');  
      HideShow('Div_SecondAccountHlder','H');  
      HideShow('Div_ThirdAccountHlder','H');  
      HideShow('Div_ProductDetails','H');  
      HideShow('Div_POADetails','H');
      HideShow('Div_NomineeNameAdrs','H');
      HideShow('Div_GurdianNameAdrs','H');
      HideShow('Div_NomGurdianNameAdrs','H'); 
      HideShow('Row18_Col2','H');
      HideShow('Row27_Col2','H');
      
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
      HideShow('DivBtnEditNomGurdianNameAdrs','H');       
      HideShow('Row6_0','H');
      
      HideShow('btnCDSLOpen','S');
      HideShow('btnCDSLClose','H'); 
      HideShow('divForCDSLVerifyOverView','H');      
    }
    function CallAjax(obj1,obj2,obj3,Query)
    {
        var CombinedQuery=new String(Query);
        var GenericAjaxListAspxPath = '../../../../CentralData/Pages/GenericAjaxList.aspx';
        ajax_showOptions(obj1,obj2,obj3,replaceChars(CombinedQuery),'Main',GenericAjaxListAspxPath);
    } 
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
    function verifyPanCrdNo(Obj)
    {
         var status = false;
         var PanCrdChk=/^([A-Z]){5}([0-9]){4}([A-Z]){1}?$/;
         if(PanCrdChk.test(Obj.GetValue())==false)
         {
            alert("Please Enter Valid PAN/GIR");
            Obj.Focus();
         }
         else
         {
            status = true;
         }    
         return status;
    }
    function ChangeDateFormat_SetCalenderValue(obj)
    {       
        var SelectedDate = new Date(obj);
        var monthnumber = SelectedDate.getMonth();
        var monthday    = SelectedDate.getDate();
        var year        = SelectedDate.getYear();            
        var changeDateValue=new Date(year, monthnumber, monthday);
        return changeDateValue;            
    }
    </script>

    <%-------------------------Start FrstHlder Details-----------------%>
    <%--------Start Name Address Section------------------%>

    <script type="text/javascript" language="javascript">
function CbpNameAddress_EndCallBack() 
{
     if(cCbpNameAddress.cpBindFrstHlder != null)   
     {
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
            cCbSame.SetChecked(true);
        else if(Data[11]== 'N')
            cCbSame.SetChecked(false);
        cCbSame.SetEnabled(false); 
        SetinnerHTML("Row5_Col1_row0",Data[12]);
        SetinnerHTML("Row5_Col1_row1",Data[13]);
        SetinnerHTML("Row5_Col1_row2",Data[14]);
        SetinnerHTML("Row5_Col1_row3_col1",Data[15]);
        SetinnerHTML("Row5_Col1_row3_col3",Data[16]);
        SetinnerHTML("Row5_Col1_row5",Data[17]);
        SetinnerHTML("Row5_Col1_row7",Data[18]);
            
        HideShow('Row6_0','H'); 
        HideShow('Row010','H');
        HideShow('DivBtnEditNameAdrs','H'); 
        if(Data[1] == "")
           HideShow('Row1_Col2','H');
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
     HideShow('Div_NameAddress','S'); 
     HideShow('Div_Contact_Pan','H'); 
     HideShow('Div_UserDef','H'); 
     HideShow('Div_FirstAccountHlder','S');  
     HideShow('Div_SecondAccountHlder','H');  
     HideShow('Div_ThirdAccountHlder','H');  
     HideShow('Div_ProductDetails','H');  
     HideShow('Div_POADetails','H');
     HideShow('Div_NomineeNameAdrs','H');
     HideShow('Div_GurdianNameAdrs','H');
     HideShow('Div_NomGurdianNameAdrs','H');
     if(GetObjectID('divForCDSLVerifyOverView').style.display == 'inline') 
        NameAdrsColourChange();  
     //====Start Modify Compare===========
     var IsComparable='<%=Session["P_FileMode"]%>';
     if(IsComparable.trim()=="Double")
        cCbpCompare.PerformCallback('BindCompareControls~');
     //====End Modify Compare===========
     Height('350','350');
}
function OnInfoChecked()
{
    OnCheckedShowHide(cCbChecked.GetChecked(),'DivBtnSaveContactPan');
    OnCheckedShowHide(cCbNameAdrs.GetChecked(),'DivBtnSaveNameAdrs');
}
function NameAdrsSave()
{
    if(Requiredfield('<%=TxtProductType.ClientID%>',"Please Enter The Product Type") && Requiredfield('<%=TxtProductType_hidden.ClientID%>',"Please Enter The Product Type"))
    {
        cCbpNameAddress.PerformCallback('SaveNameAddress~');   
        DisableAll('<%=CbpNameAddress.ClientID%>');
    }  
}
function NameAdrsNext()
{
    if(EntryType == 'AddEdit'|| EntryType == 'Edit')
    {
        cCbpContactPan.PerformCallback('BindContactPanUnsaved~');  
    }
    else
    {
        cCbpContactPan.PerformCallback('NameAdrsNext~');  
    }
    //====Start Modify Compare===========
    var IsComparable='<%=Session["P_FileMode"]%>';
    if(IsComparable.trim()=="Double")
    {    
         cCbpCompare.PerformCallback('BindCompareControls~');
    }
    //====End Modify Compare=========== 
    Height('350','350'); 
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
    </script>

    <%--------End Name Address Section--------------------%>
    <%--------Start Contact Section-----------------------%>

    <script type="text/javascript" language="javascript">
function ContactSave()
{
    if(DevE_Control_CompareText(cComboPanVerificatn1,"S","Please Select The Pan Verification Type"))
    { 
        cCbpContactPan.PerformCallback('SaveContactPan~');
    }
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
    //====Start Modify Compare===========
    var IsComparable='<%=Session["P_FileMode"]%>';
    if(IsComparable.trim()=="Double")
    {    
         cCbpCompare.PerformCallback('BindCompareControls~');
    }
    //====End Modify Compare=========== 
    Height('350','350');
}
function ContactPrevious()
{
   if(EntryType == 'AddEdit' || EntryType == 'Edit')
   {
      cCbpNameAddress.PerformCallback('BindFrstHolderUnSaved~<%=Session["P_AplicatnNo"]%>');   
   } 
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
        cCbpContactPan.cpBindFrstHlder = null;
     } 
     if(cCbpContactPan.cpSaveContactPan != null)   
     {
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
     HideShow('Div_NameAddress','H'); 
     HideShow('Div_Contact_Pan','S'); 
     HideShow('Div_UserDef','H'); 
     HideShow('Div_FirstAccountHlder','S');  
     HideShow('Div_SecondAccountHlder','H');  
     HideShow('Div_ThirdAccountHlder','H');  
     HideShow('Div_ProductDetails','H');  
     HideShow('Div_POADetails','H');
     HideShow('Div_NomineeNameAdrs','H');
     HideShow('Div_GurdianNameAdrs','H');
     HideShow('Div_NomGurdianNameAdrs','H'); 
     if(GetObjectID('divForCDSLVerifyOverView').style.display == 'inline') 
        ContactPanColourChange();
     //====Start Modify Compare===========
     var IsComparable='<%=Session["P_FileMode"]%>';
     if(IsComparable.trim()=="Double")
     {    
          cCbpCompare.PerformCallback('BindCompareControls~');
     }
     //====End Modify Compare===========
     Height('350','350');  
}
    </script>

    <%--------End Contact Section-------------------------%>
    <%--------Start User Defined Section------------------%>

    <script type="text/javascript" language="javascript">
function CbpUserDefined_EndCallBack()
{
     if(cCbpUserDefined.cpSaveUserFld != null)   
     {
        HideShow('DivBtnEditUserDefined','S');
        HideShow('DivBtnSaveUserDefined','H');
        HideShow('Row11','S');  
        DisableAll('<%=CbpUserDefined.ClientID%>');
        VisibleInVisible('DivUsrDefindAlrt','S');
        UserDefSection = 'T';
        cCbpUserDefined.cpSaveUserFld = null;
     }
     if(cCbpUserDefined.cpUserFldUnSaved != null)   
     {
        HideShow('DivBtnEditUserDefined','H');
        HideShow('DivBtnSaveUserDefined','S');
        cCbpUserDefined.cpUserFldUnSaved = null;
     }
     HideShow('Div_NameAddress','H'); 
     HideShow('Div_Contact_Pan','H'); 
     HideShow('Div_UserDef','S'); 
     HideShow('Div_FirstAccountHlder','S');  
     HideShow('Div_SecondAccountHlder','H');  
     HideShow('Div_ThirdAccountHlder','H');  
     HideShow('Div_ProductDetails','H');  
     HideShow('Div_POADetails','H');
     HideShow('Div_NomineeNameAdrs','H');
     HideShow('Div_GurdianNameAdrs','H');
     HideShow('Div_NomGurdianNameAdrs','H');
     if(GetObjectID('divForCDSLVerifyOverView').style.display == 'inline') 
        UserDefinedColourChange(); 
     //====Start Modify Compare===========
     var IsComparable='<%=Session["P_FileMode"]%>';
     if(IsComparable.trim()=="Double")
     {    
          cCbpCompare.PerformCallback('BindCompareControls~');
     }
     //====End Modify Compare===========
     Height('350','350'); 
}
function FirstHolderPrevious()
{
   if(EntryType == "AddEdit" || EntryType == 'Edit')
   {
       cCbpContactPan.PerformCallback('BindContactPanUnsaved~');  
   }
   //====Start Modify Compare===========
    var IsComparable='<%=Session["P_FileMode"]%>';
    if(IsComparable.trim()=="Double")
    {    
         cCbpCompare.PerformCallback('BindCompareControls~');
    }
    //====End Modify Compare=========== 
    Height('350','350');
}
function UserDefinedSave()
{
   cCbpUserDefined.PerformCallback('SaveUserField~');    
}
function UserDefSectionEdit()
{
  UserDefSection = '';
  HideShow('DivBtnEditUserDefined','H');
  HideShow('DivBtnSaveUserDefined','S');
  EnableAll('<%=CbpUserDefined.ClientID%>'); 
  VisibleInVisible('DivUsrDefindAlrt','H');   
}
function FirstHolderNext()
{
    if(EntryType == "AddEdit" || EntryType == 'Edit')
    {
      cCbpSecondAccountHlder.PerformCallback('BindScndAcntHlderUnSaved~');     
    }
    //====Start Modify Compare===========
    var IsComparable='<%=Session["P_FileMode"]%>';
    if(IsComparable.trim()=="Double")
    {    
         cCbpCompare.PerformCallback('BindCompareControls~');
    }
    //====End Modify Compare=========== 
    Height('350','350');
} 
    </script>

    <%--------End User Defined Section------------------%>
    <%-------------------------End FrstHlder Details-------------------%>
    <%-------------------------Start ScndHlder Details-----------------%>

    <script type="text/javascript" language="javascript">
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
     HideShow('Div_FirstAccountHlder','H');  
     HideShow('Div_SecondAccountHlder','S');  
     HideShow('Div_ThirdAccountHlder','H');  
     HideShow('Div_ProductDetails','H');  
     HideShow('Div_POADetails','H');
     HideShow('Div_NomineeNameAdrs','H');
     HideShow('Div_GurdianNameAdrs','H');
     HideShow('Div_NomGurdianNameAdrs','H');
     if(GetObjectID('divForCDSLVerifyOverView').style.display == 'inline') 
        SecondAccHldrColourChange(); 
     //====Start Modify Compare===========
     var IsComparable='<%=Session["P_FileMode"]%>';
     if(IsComparable.trim()=="Double")
     {    
          cCbpCompare.PerformCallback('BindCompareControls~');
     }
     //====End Modify Compare===========
     Height('350','350');  
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
           if(cTxtPan1.GetText()=="" && crdPanxmptN1.GetChecked()== true)
             {
                alert('Please Enter Your Pan Card Number');
                cTxtPan1.Focus();
             }
             else
             {
                  DisableAll('<%=CbpSecondAccountHlder.ClientID%>'); 
                  cCbpSecondAccountHlder.PerformCallback('SaveScndAcntHlder~');
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
   }
   //====Start Modify Compare===========
    var IsComparable='<%=Session["P_FileMode"]%>';
    if(IsComparable.trim()=="Double")
    {    
         cCbpCompare.PerformCallback('BindCompareControls~');
    }
    //====End Modify Compare=========== 
     Height('350','350'); 
}
function SecondHolderPrevious()  
{
  if(EntryType == "AddEdit" || EntryType == 'Edit')
  {
        cCbpUserDefined.PerformCallback('BindUserFldUnSaved~');    
  }
  //====Start Modify Compare===========
  var IsComparable='<%=Session["P_FileMode"]%>';
  if(IsComparable.trim()=="Double")
  {    
     cCbpCompare.PerformCallback('BindCompareControls~');
  }
  //====End Modify Compare=========== 
  Height('350','350'); 
}
    </script>

    <%-------------------------End ScndHlder Details-------------------%>
    <%-------------------------Start ThrdHlder Details-----------------%>

    <script type="text/javascript" language="javascript">
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
    cCbpThirdAccountHlder.cpThirdAcntHlderUnSaved = null;
  }
  OnCheckedShowHide(crdPanxmptY2.GetChecked(),'Row27_Col2');
     HideShow('Div_FirstAccountHlder','H');  
     HideShow('Div_SecondAccountHlder','H');  
     HideShow('Div_ThirdAccountHlder','S');  
     HideShow('Div_ProductDetails','H');  
     HideShow('Div_POADetails','H');
     HideShow('Div_NomineeNameAdrs','H');
     HideShow('Div_GurdianNameAdrs','H');
     HideShow('Div_NomGurdianNameAdrs','H'); 
     if(GetObjectID('divForCDSLVerifyOverView').style.display == 'inline') 
        ThrdAccHldrColourChange(); 
     //====Start Modify Compare===========
     var IsComparable='<%=Session["P_FileMode"]%>';
     if(IsComparable.trim()=="Double")
     {    
          cCbpCompare.PerformCallback('BindCompareControls~');
     }
     //====End Modify Compare===========
     Height('350','350');   
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
  VisibleInVisible('DivThrdHldrAlrt','H');
  cComboPanExempt3.SetEnabled(true);
  cComboPanVerificatn3.SetEnabled(true);  
  EnableAll('<%=CbpThirdAccountHlder.ClientID%>');
}
function ThirdHolderNext()
{
    if(EntryType == "AddEdit" || EntryType == 'Edit')
    {
         cCbpProductDtls.PerformCallback('BindProductDtlsUnSaved~'); 
    }     
    //====Start Modify Compare===========
    var IsComparable='<%=Session["P_FileMode"]%>';
    if(IsComparable.trim()=="Double")
    {    
         cCbpCompare.PerformCallback('BindCompareControls~');
    }
    //====End Modify Compare=========== 
    Height('350','350');
} 
function ThirdHolderPrevious()
{
  if(EntryType == "AddEdit" || EntryType == 'Edit')
  {
      cCbpSecondAccountHlder.PerformCallback('BindScndAcntHlderUnSaved~');     
  }
  //====Start Modify Compare===========
  var IsComparable='<%=Session["P_FileMode"]%>';
  if(IsComparable.trim()=="Double")
  {    
       cCbpCompare.PerformCallback('BindCompareControls~');
  }
  //====End Modify Compare=========== 
  Height('350','350');
}
    </script>

    <%-------------------------End ThrdHlder Details-------------------%>
    <%-------------------------Start Product Details-------------------%>

    <script type="text/javascript" language="javascript">    
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
    var maturityDt=ChangeDateFormat_SetCalenderValue(Data[6]);
    var rbiAprvDt=ChangeDateFormat_SetCalenderValue(Data[7]);
    cMaturityDt.SetDate(maturityDt);
    cRBIaprvDt.SetDate(rbiAprvDt);
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
    VisibleInVisible('DivPrdctDtlAlrt','S');  
    cComboRGESS.SetEnabled(false);
    cComboAnualReprt.SetEnabled(false);
    cComboPledge.SetEnabled(false);
    cComboRTA.SetEnabled(false);
    cComboBSDA.SetEnabled(false);
    cComboBOsett.SetEnabled(false);
    cComboSmartCrd.SetEnabled(false);
    cComboEcsMandate.SetEnabled(false);
    cComboConfrmatnWavd.SetEnabled(false);
    ProductDtls = 'T';
    cCbpProductDtls.cpSaveProductDtls = null;
 }
 if(cCbpProductDtls.cpProductDtlsUnSaved != null)   
 {
    HideShow('DivBtnEditProductDtls','H');
    HideShow('Row580','S'); 
    HideShow('DivBtnSaveProductDtls','S'); 
 }
 HideShow('Div_FirstAccountHlder','H');  
 HideShow('Div_SecondAccountHlder','H');  
 HideShow('Div_ThirdAccountHlder','H');  
 HideShow('Div_ProductDetails','S');  
 HideShow('Div_POADetails','H');
 HideShow('Div_NomineeNameAdrs','H');
 HideShow('Div_GurdianNameAdrs','H');
 HideShow('Div_NomGurdianNameAdrs','H'); 
 if(GetObjectID('divForCDSLVerifyOverView').style.display == 'inline') 
     ProductDtlsColourChange(); 
 //====Start Modify Compare===========
 var IsComparable='<%=Session["P_FileMode"]%>';
 if(IsComparable.trim()=="Double")
 {    
      cCbpCompare.PerformCallback('BindCompareControls~');
 }
 //====End Modify Compare===========
 Height('350','350');  
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
        ProductDtls = 'T';
        Empty_HiddenFields();         
        cCbpProductDtls.PerformCallback('SaveProductDtls~');
   } 
}
function  ProductDtlsNext() 
{
      if(EntryType == "AddEdit" || EntryType == 'Edit')
      {
        cCbpPOADtls.PerformCallback('BindPoaDtlsUnSaved~'); 
      }
     //====Start Modify Compare===========
    var IsComparable='<%=Session["P_FileMode"]%>';
    if(IsComparable.trim()=="Double")
    {    
         cCbpCompare.PerformCallback('BindCompareControls~');
    }
    //====End Modify Compare=========== 
     Height('350','350');
}
function ProductDtlsPrevious() 
{
  if(cCbSkip1.GetChecked() == true)
  {
    ThirdHolderPrevious();
  }
  else
  { 
      if(EntryType == "AddEdit" || EntryType == 'Edit')
      {
         cCbpThirdAccountHlder.PerformCallback('BindThirdAcntHlderUnSaved~');     
      }
     //====Start Modify Compare===========
      var IsComparable='<%=Session["P_FileMode"]%>';
      if(IsComparable.trim()=="Double")
      {    
           cCbpCompare.PerformCallback('BindCompareControls~');
      }
      //====End Modify Compare=========== 
      Height('350','350'); 
  } 
}
function Empty_HiddenFields()
{
//    if(GetObjectID('TxtGeoCode').value == "") 
//      GetObjectID('TxtGeoCode_hidden').value = "";
//    if(GetObjectID('TxtEduDegree').value == "")
//      GetObjectID('TxtEduDegree_hidden').value = "";
//    if(GetObjectID('TxtLang').value == "")
//      GetObjectID('TxtLang_hidden').value = "";
//    if(GetObjectID('TxtStaffRel').value == "")
//      GetObjectID('TxtStaffRel_hidden').value = "";
//    if(GetObjectID('TxtSecAccess').value == "") 
//      GetObjectID('TxtSecAccess_hidden').value = "";
//    if(GetObjectID('TxtBenTaxStatus').value == "")
//      GetObjectID('TxtBenTaxStatus_hidden').value = "";
//    if(GetObjectID('TxtDividndCurncy').value == "") 
//      GetObjectID('TxtDividndCurncy_hidden').value = "";
//    if(GetObjectID('TxtClrngCorpID').value == "") 
//      GetObjectID('TxtClrngCorpID_hidden').value = "";
//    if(GetObjectID('TxtBENFBnkAcType').value == "") 
//      GetObjectID('TxtBENFBnkAcType_hidden').value = "";
//    if(GetObjectID('TxtBENFBnkCCY').value == "") 
//      GetObjectID('TxtBENFBnkCCY_hidden').value = "";
//    if(GetObjectID('TxtDIVNDBnkAcType').value == "") 
//      GetObjectID('TxtDIVNDBnkAcType_hidden').value = "";
//    if(GetObjectID('TxtDIVNDBnkCCY').value == "")
//      GetObjectID('TxtDIVNDBnkCCY_hidden').value = "";

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
    </script>

    <%-------------------------End Product Details---------------------%>
    <%-------------------------Start POA Details-----------------------%>

    <script type="text/javascript" language="javascript">
function CbpPOADtls_EndCallBack() 
{  
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
  HideShow('Div_FirstAccountHlder','H');  
  HideShow('Div_SecondAccountHlder','H');  
  HideShow('Div_ThirdAccountHlder','H');  
  HideShow('Div_ProductDetails','H');  
  HideShow('Div_POADetails','S');
  HideShow('Div_NomineeNameAdrs','H');
  HideShow('Div_GurdianNameAdrs','H');
  HideShow('Div_NomGurdianNameAdrs','H'); 
  if(GetObjectID('divForCDSLVerifyOverView').style.display == 'inline') 
     POADtlsColourChange(); 
  //====Start Modify Compare===========
  var IsComparable='<%=Session["P_FileMode"]%>';
  if(IsComparable.trim()=="Double")
  {    
      cCbpCompare.PerformCallback('BindCompareControls~');
  }
  //====End Modify Compare===========
  Height('350','350');  
}
function POAPrevious()
{
  if(EntryType == "AddEdit" || EntryType == 'Edit')
  {
       cCbpProductDtls.PerformCallback('BindProductDtlsUnSaved~'); 
  }     
  //====Start Modify Compare===========
  var IsComparable='<%=Session["P_FileMode"]%>';
  if(IsComparable.trim()=="Double")
  {    
       cCbpCompare.PerformCallback('BindCompareControls~');
  }
  //====End Modify Compare=========== 
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
            if(CompareDate_TrueFalse(FDate,TodayDate,"LT"))
            {
                alert("Please Enter a Valid From Date!!!");
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
  if(EntryType == "AddEdit" || EntryType == 'Edit')
  {
    cCbpNomineeNameAdrs.PerformCallback('NomineeNameAdrsUnSaved~'); 
  }
  //====Start Modify Compare===========
    var IsComparable='<%=Session["P_FileMode"]%>';
    if(IsComparable.trim()=="Double")
    {    
         cCbpCompare.PerformCallback('BindCompareControls~');
    }
    //====End Modify Compare=========== 
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
    </script>

    <%-------------------------End POA Details---------------------%>
    <%-------------------------Start NomineeNameAddress Details-----------------------%>

    <script type="text/javascript" language="javascript">
    function NomineeNext()
    {
      if(EntryType == "AddEdit" || EntryType == 'Edit')
      {
          cCbpGurdianNameAdrs.PerformCallback('GurdianNameAdrsUnSaved~'); 
      }
      //====Start Modify Compare===========
      var IsComparable='<%=Session["P_FileMode"]%>';
      if(IsComparable.trim()=="Double")
      {    
         cCbpCompare.PerformCallback('BindCompareControls~');
      }
      //====End Modify Compare=========== 
      Height('350','350');
    }    
    function NomineePrevious()
    {
      if(EntryType == "AddEdit" || EntryType == 'Edit')
      {
        cCbpPOADtls.PerformCallback('BindPoaDtlsUnSaved~'); 
      }
      //====Start Modify Compare===========
      var IsComparable='<%=Session["P_FileMode"]%>';
      if(IsComparable.trim()=="Double")
      {    
         cCbpCompare.PerformCallback('BindCompareControls~');
      }
      //====End Modify Compare=========== 
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
      VisibleInVisible('DivNomineeNameAdrsAlrt','H');    
      EnableAll('<%=CbpNomineeNameAdrs.ClientID%>');   
    }    
    function CbpNomineeNameAdrs_EndCallBack()
    {
        if(cCbpNomineeNameAdrs.cpBindNomineeDOB !=null) 
        {
          var NomineeDOB = cCbpNomineeNameAdrs.cpBindNomineeDOB.split('~')[0];
          cdobDt1.SetDate(ChangeDateFormat_SetCalenderValue(NomineeDOB));
        }
        if(cCbpNomineeNameAdrs.cpSaveNomineeNameAdrs != null)
        {
            HideShow('DivBtnNextNomineeNameAdrs','S'); 
            HideShow('DivBtnSaveNomineeNameAdrs','H'); 
            HideShow('DivBtnEditNomineeNameAdrs','S');
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
        HideShow('Div_FirstAccountHlder','H');  
        HideShow('Div_SecondAccountHlder','H');  
        HideShow('Div_ThirdAccountHlder','H');  
        HideShow('Div_ProductDetails','H');  
        HideShow('Div_POADetails','H');
        HideShow('Div_NomineeNameAdrs','S');
        HideShow('Div_GurdianNameAdrs','H');
        HideShow('Div_NomGurdianNameAdrs','H'); 
        if(GetObjectID('divForCDSLVerifyOverView').style.display == 'inline') 
            NomineeNameAdrsColourChange(); 
        //====Start Modify Compare===========
        var IsComparable='<%=Session["P_FileMode"]%>';
        if(IsComparable.trim()=="Double")
        {    
            cCbpCompare.PerformCallback('BindCompareControls~');
        }
        //====End Modify Compare===========
        Height('350','350');
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
    </script>

    <%--------------------------End NomineeNameAddress-------------------------%>
    <%-------------------------Start GurdianNameAddress-------------------------%>

    <script type="text/javascript" language="javascript">
    function GurdianNext() 
    {
      if(EntryType == "AddEdit" || EntryType == 'Edit')
      {
        cCbpNomGurdianNameAdrs.PerformCallback('NomGurdianNameAdrsUnSaved~'); 
      }
      //====Start Modify Compare===========
      var IsComparable='<%=Session["P_FileMode"]%>';
      if(IsComparable.trim()=="Double")
      {    
         cCbpCompare.PerformCallback('BindCompareControls~');
      }
      //====End Modify Compare=========== 
      Height('350','350');
    }    
    function GurdianPrevious() 
    {
      if(EntryType == "AddEdit" || EntryType == 'Edit')
      {
        cCbpNomineeNameAdrs.PerformCallback('NomineeNameAdrsUnSaved~'); 
      }
      //====Start Modify Compare===========
      var IsComparable='<%=Session["P_FileMode"]%>';
      if(IsComparable.trim()=="Double")
      {    
         cCbpCompare.PerformCallback('BindCompareControls~');
      }
      //====End Modify Compare===========  
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
      VisibleInVisible('DivGurdianNameAdrsAlrt','H');    
      EnableAll('<%=CbpGurdianNameAdrs.ClientID%>');     
    }
    
    function CbpGurdianNameAdrs_EndCallBack()
    {
       //alert('cCbpGurdianNameAdrs.cpBindGurdianDOB-'+cCbpGurdianNameAdrs.cpBindGurdianDOB);
        if(cCbpGurdianNameAdrs.cpBindGurdianDOB !=null) 
        {
          var GurdianDOB = cCbpGurdianNameAdrs.cpBindGurdianDOB.split('~')[0];
          cdobDt2.SetDate(ChangeDateFormat_SetCalenderValue(GurdianDOB));
        }
        if(cCbpGurdianNameAdrs.cpSaveGurdianNameAdrs != null)
        {
          HideShow('DivBtnNextGurdianNameAdrs','S'); 
          HideShow('DivBtnSaveGurdianNameAdrs','H'); 
          HideShow('DivBtnEditGurdianNameAdrs','S');
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
        HideShow('Div_FirstAccountHlder','H');  
        HideShow('Div_SecondAccountHlder','H');  
        HideShow('Div_ThirdAccountHlder','H');  
        HideShow('Div_ProductDetails','H');  
        HideShow('Div_POADetails','H');
        HideShow('Div_NomineeNameAdrs','H');
        HideShow('Div_GurdianNameAdrs','S');
        HideShow('Div_NomGurdianNameAdrs','H'); 
        if(GetObjectID('divForCDSLVerifyOverView').style.display == 'inline') 
            GurdianNameAdrsColourChange(); 
        //====Start Modify Compare===========
        var IsComparable='<%=Session["P_FileMode"]%>';
        if(IsComparable.trim()=="Double")
        {    
            cCbpCompare.PerformCallback('BindCompareControls~');
        }
        //====End Modify Compare===========
        Height('350','350');
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
    </script>

    <%--------------------------End GurdianNameAddress-------------------------%>
    <%-------------------------Start NomineeGurdian Address-------------------------%>

    <script type="text/javascript" language="javascript">   
    function NomGurdianPrevious()
    {
      if(EntryType == "AddEdit" || EntryType == 'Edit')
      {
          cCbpGurdianNameAdrs.PerformCallback('GurdianNameAdrsUnSaved~'); 
      }
      //====Start Modify Compare===========
      var IsComparable='<%=Session["P_FileMode"]%>';
      if(IsComparable.trim()=="Double")
      {    
         cCbpCompare.PerformCallback('BindCompareControls~');
      }
      //====End Modify Compare===========  
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
      VisibleInVisible('DivNomGurdianAlrt','H');    
      EnableAll('<%=CbpNomGurdianNameAdrs.ClientID%>');  
    }
    function CbpNomGurdianNameAdrs_EndCallBack()
    {
      if(cCbpNomGurdianNameAdrs.cpBindNomGurdianDOB !=null) 
      {
        var NomGurdianDOB = cCbpNomGurdianNameAdrs.cpBindNomGurdianDOB.split('~')[0];
        cdobDt3.SetDate(ChangeDateFormat_SetCalenderValue(NomGurdianDOB));
      }
      if(cCbpNomGurdianNameAdrs.cpSaveNomGurdianNameAdrs !=null) 
      {
        HideShow('DivBtnSaveNomGurdianNameAdrs','H'); 
        HideShow('DivBtnEditNomGurdianNameAdrs','S'); 
        DisableAll('<%=CbpNomGurdianNameAdrs.ClientID%>');  
        VisibleInVisible('DivNomGurdianAlrt','S');    
        NomineeGurdian = 'T';
        cCbpNomGurdianNameAdrs.cpSaveNomGurdianNameAdrs =null;
      } 
      if(cCbpNomGurdianNameAdrs.cpNomGurdianNameAdrsUnSaved !=null) 
      {
        NomGurdianEdit();
        Skip6CheckedChanged();
        cCbpNomGurdianNameAdrs.cpNomGurdianNameAdrsUnSaved = null;
      } 
      HideShow('Div_FirstAccountHlder','H');  
      HideShow('Div_SecondAccountHlder','H');  
      HideShow('Div_ThirdAccountHlder','H');  
      HideShow('Div_ProductDetails','H');  
      HideShow('Div_POADetails','H');
      HideShow('Div_NomineeNameAdrs','H');
      HideShow('Div_GurdianNameAdrs','H');
      HideShow('Div_NomGurdianNameAdrs','S'); 
      if(GetObjectID('divForCDSLVerifyOverView').style.display == 'inline') 
          NomGurdianNameAdrsColourChange(); 
      //====Start Modify Compare===========
      var IsComparable='<%=Session["P_FileMode"]%>';
      if(IsComparable.trim()=="Double")
      {    
          cCbpCompare.PerformCallback('BindCompareControls~');
      }
      //====End Modify Compare===========
      Height('350','350');
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
        }
        else
        {
           HideShow('DivBtnSaveNomGurdianNameAdrs','S');            
        }
    }
    </script>

    <%-------------------------End NomineeGurdian Address-------------------------%>
    <%------------------Start Modify Popup to bind and Compare Controls--------------%>

    <script type="text/javascript" language="javascript">
    function fn_btnCont_PopUpEdit_Click()
    {       
        if(EntryType == 'AddEdit')
        {
            cCbpNameAddress.PerformCallback('BindFrstHolderUnSaved~<%=Session["P_AplicatnNo"]%>');   
        }       
        cPopUpEdit.Hide();                      
    }
    function fn_btnBack_PopUpEdit_Click()
    {
       parent.btnShow_Click();
       cPopUpEdit.Hide();               
    }
    function CbpCompare_EndCallBack()
    { 
        //====Matched Records Border Normal===================
        if(cCbpCompare.cpMatchControls!=undefined)
        {
             for(var m=0;m<cCbpCompare.cpMatchControls.split('~').length-1;m++)
             {                      
                 if(GetObjectID(cCbpCompare.cpMatchControls.split('~')[m]))
                     GetObjectID(cCbpCompare.cpMatchControls.split('~')[m]).style.border='1px solid #D1E0F3';
             }
        }
        //====UnMatched Records Border Red===================
        if(cCbpCompare.cpCompareControls!=undefined)
        {
            if(cCbpCompare.cpCompareControls=="T")
            {            
                if(cCbpCompare.cpMisMatchControls!=undefined)
                {
                     for(var j=0;j<cCbpCompare.cpMisMatchControls.split('~').length-1;j++)
                     {          
                         if(GetObjectID(cCbpCompare.cpMisMatchControls.split('~')[j]))
                                GetObjectID(cCbpCompare.cpMisMatchControls.split('~')[j]).style.border='1px solid Red';
                     }
                     alert('Some Field(s) Are Still Not Matched! Please Match Those Field(s)!!!');  
                }      
            }
        }
        //=======Matched Finally=================
        if(cCbpCompare.cpCompareControls=="F")
        {
            var ans = confirm('Data Matched Successfully! \n If You Want To Stay For futher Matching [Click OK] \n If You Want To Go To Verify Record [Click Cancel]');
            if(ans!=true)
               parent.btnShow_Click();               
        }                            
    }
    </script>

    <%------------------End Modify Popup to bind and Compare Controls----------------%>
    <%------------------Start For Floating Div with Jump any section--------------%>

    <script type="text/javascript">  
    function NameAddressView()
    {
       ContactPrevious();       
       NameAdrsColourChange();
    }
    function ContactPanView()
    {
      if(NameAdrs == 'T')
      {
          NameAdrsNext();
          ContactPanColourChange();
      }
      else
      {
        alert("Please Fill Up The Name Address Details First..");
        NameAddressView();        
      }
    }
    function UserDefinedView()
    {
      if(NameAdrs == '')
      {
        alert("Please Fill Up The Name & Address Details First..");
        NameAddressView();
      }
      else if(ContactPan == '')
      {
        alert("Please Fill Up The Contact & Pan Details First..");
        ContactPanView();
      }
      else
      {
        ContactNext(); 
        UserDefinedColourChange();
      } 
    }
    function SecndAcntHldrView()
    {
      if(NameAdrs == '')
      {
        alert("Please Fill Up The Name & Address Details First..");
        NameAddressView();
      }
      else if(ContactPan == '')
      {
        alert("Please Fill Up The Contact & Pan Details First..");
        ContactPanView();
      }
      else if(UserDefSection == '')
      {
        alert("Please Fill Up The User Defined Field First..");
        UserDefinedView();
      }
      else
      {
        FirstHolderNext();
        SecondAccHldrColourChange();  
      }      
    }
    function ThrdAcntHldrView()
    {
      if(NameAdrs == '')
      {
        alert("Please Fill Up The Name & Address Details First..");
        NameAddressView();
      }
      else if(ContactPan == '')
      {
        alert("Please Fill Up The Contact & Pan Details First..");
        ContactPanView();
      }
      else if(UserDefSection == '')
      {
        alert("Please Fill Up The User Defined Field First..");
        UserDefinedView();
      }
      else if(SecndAcntHldr == '' && cCbSkip1.GetChecked() == false)
      {
        alert("Please Fill Up The Second Account Holder First..");
        SecndAcntHldrView();
      }
      else
      {
         SecondHolderNext();  
         ThrdAccHldrColourChange();
      }
      Height('350','350');      
    }
    function PrdctDtlsView()
    {
      if(NameAdrs == '')
      {
         alert("Please Fill Up The Name & Address Details First..");
         NameAddressView();
      }
      else if(ContactPan == '')
      {
         alert("Please Fill Up The Contact & Pan Details First..");
         ContactPanView();
      }
      else if(UserDefSection == '')
      {
         alert("Please Fill Up The User Defined Field First..");
         UserDefinedView();
      }
      else if(SecndAcntHldr == '' && cCbSkip1.GetChecked() == false)
      {
         alert("Please Fill Up The Second Account Holder First..");
         SecndAcntHldrView();
      }
      else if(ThrdAcntHldr == '' && cCbSkip2.GetChecked() == false)
      {
         alert("Please Fill Up The Third Account Holder First..");
         ThrdAcntHldrView();
      }
      else
      {
         ThirdHolderNext(); 
         ProductDtlsColourChange();
      }      
    }
    function POADtlsView()
    {
      if(NameAdrs == '')
      {
        alert("Please Fill Up The Name & Address Details First..");
        NameAddressView();
      }
      else if(ContactPan == '')
      {
        alert("Please Fill Up The Contact & Pan Details First..");
        ContactPanView();
      }
      else if(UserDefSection == '')
      {
        alert("Please Fill Up The User Defined Field First..");
        UserDefinedView();
      }
      else if(SecndAcntHldr == '' && cCbSkip1.GetChecked() == false)
      {
        alert("Please Fill Up The Second Account Holder First..");
        SecndAcntHldrView();
      }
      else if(ThrdAcntHldr == '' && cCbSkip2.GetChecked() == false)
      {
        alert("Please Fill Up The Third Account Holder First..");
        ThrdAcntHldrView();
      }
      else if(ProductDtls == '')
      {
        alert("Please Fill Up The Product Details First..");
        PrdctDtlsView();
      }
      else
      {
        ProductDtlsNext();  
        POADtlsColourChange();        
      }
    }
    function NomineeView()
    {
      if(NameAdrs == '')
      {
        alert("Please Fill Up The Name & Address Details First..");
        NameAddressView();
      }
      else if(ContactPan == '')
      {
        alert("Please Fill Up The Contact & Pan Details First..");
        ContactPanView();
      }
      else if(UserDefSection == '')
      {
        alert("Please Fill Up The User Defined Field First..");
        UserDefinedView();
      }
      else if(SecndAcntHldr == '' && cCbSkip1.GetChecked() == false)
      {
        alert("Please Fill Up The Second Account Holder First..");
        SecndAcntHldrView();
      }
      else if(ThrdAcntHldr == '' && cCbSkip2.GetChecked() == false)
      {
        alert("Please Fill Up The Third Account Holder First..");
        ThrdAcntHldrView();
      }
      else if(ProductDtls == '')
      {
        alert("Please Fill Up The Product Details First..");
        PrdctDtlsView();
      }
      else if(POADtls == '' && cCbSkip3.GetChecked() == false)
      {
        alert("Please Fill Up The POA Details First..");
        POADtlsView();
      }
      else
      {
        POANext();
        NomineeNameAdrsColourChange();
      }      
    }
    function GurdianView()
    {
      if(NameAdrs == '')
      {
        alert("Please Fill Up The Name & Address Details First..");
        NameAddressView();
      }
      else if(ContactPan == '')
      {
        alert("Please Fill Up The Contact & Pan Details First..");
        ContactPanView();
      }
      else if(UserDefSection == '')
      {
        alert("Please Fill Up The User Defined Field First..");
        UserDefinedView();
      }
      else if(SecndAcntHldr == '' && cCbSkip1.GetChecked() == false)
      {
        alert("Please Fill Up The Second Account Holder First..");
        SecndAcntHldrView();
      }
      else if(ThrdAcntHldr == '' && cCbSkip2.GetChecked() == false)
      {
        alert("Please Fill Up The Third Account Holder First..");
        ThrdAcntHldrView();
      }
      else if(ProductDtls == '')
      {
        alert("Please Fill Up The Product Details First..");
        PrdctDtlsView();
      }
      else if(POADtls == '' && cCbSkip3.GetChecked() == false)
      {
        alert("Please Fill Up The POA Details First..");
        POADtlsView();
      }
      else if(Nominee == '' && cCbSkip4.GetChecked() == false)
      {
        alert("Please Fill Up The Nominee Details First..");
        NomineeView();
      }
      else
      {
        NomineeNext();
        GurdianNameAdrsColourChange();
      }
    }
    function NomineeGurdianView()
    {
      if(NameAdrs == '')
      {
        alert("Please Fill Up The Name & Address Details First..");
        NameAddressView();
      }
      else if(ContactPan == '')
      {
        alert("Please Fill Up The Contact & Pan Details First..");
        ContactPanView();
      }
      else if(UserDefSection == '')
      {
        alert("Please Fill Up The User Defined Field First..");
        UserDefinedView();
      }
      else if(SecndAcntHldr == '' && cCbSkip1.GetChecked() == false)
      {
        alert("Please Fill Up The Second Account Holder First..");
        SecndAcntHldrView();
      }
      else if(ThrdAcntHldr == '' && cCbSkip2.GetChecked() == false)
      {
        alert("Please Fill Up The Third Account Holder First..");
        ThrdAcntHldrView();
      }
      else if(ProductDtls == '')
      {
        alert("Please Fill Up The Product Details First..");
        PrdctDtlsView();
      }
      else if(POADtls == '' && cCbSkip3.GetChecked() == false)
      {
        alert("Please Fill Up The POA Details First..");
        POADtlsView();
      }
      else if(Nominee == '' && cCbSkip4.GetChecked() == false)
      {
        alert("Please Fill Up The Nominee Details First..");
        NomineeView();
      }
      else if(Gurdian == '')
      {
        alert("Please Fill Up The Gurdian Details First..");
        GurdianView();
      }
      else
      {
        GurdianNext();
        NomGurdianNameAdrsColourChange();
      }
    }
    </script>

    <script type="text/javascript">      
    function btnCloseTotal_click()
    {
       HideShow('btnCDSLClose','H');
       HideShow('divForCDSLVerifyOverView','H');
       HideShow('btnCDSLOpen','S');
       GetObjectID('btnCDSLOpen').style.borderBottom='2px solid #555';
    }
    function btnOpenTotal_click() 
    {
       HideShow('btnCDSLOpen','H');
       HideShow('btnCDSLClose','S');
       HideShow('divForCDSLVerifyOverView','S');
       GetObjectID('btnCDSLClose').style.borderBottom='none';
       if(GetObjectID('Div_NameAddress').style.display == 'inline')
            NameAdrsColourChange();          
       if(GetObjectID('Div_Contact_Pan').style.display == 'inline')
            ContactPanColourChange();          
        if(GetObjectID('Div_UserDef').style.display == 'inline')
            UserDefinedColourChange();          
       if(GetObjectID('Div_SecondAccountHlder').style.display == 'inline')
            SecondAccHldrColourChange();
       if(GetObjectID('Div_ThirdAccountHlder').style.display == 'inline')
            ThrdAccHldrColourChange();
       if(GetObjectID('Div_ProductDetails').style.display == 'inline')
            ProductDtlsColourChange();
       if(GetObjectID('Div_POADetails').style.display == 'inline')
            POADtlsColourChange();
       if(GetObjectID('Div_NomineeNameAdrs').style.display == 'inline')
            NomineeNameAdrsColourChange(); 
       if(GetObjectID('Div_GurdianNameAdrs').style.display == 'inline')
            GurdianNameAdrsColourChange();
       if(GetObjectID('Div_NomGurdianNameAdrs').style.display == 'inline')
            NomGurdianNameAdrsColourChange();
    }        
    function NameAdrsColourChange()
    {
      SetStyle("Div_FNameAddress","BGColor","#FF5500");
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
      SetStyle("Div_FContactPan","BGColor","#FF5500");
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
      SetStyle("Div_FUserDefined","BGColor","#FF5500");
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
      SetStyle("Div_SecondAccount","BGColor","#FF5500");
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
      SetStyle("Div_ThirdAccount","BGColor","#FF5500");
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
      SetStyle("Div_Product","BGColor","#FF5500");
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
      SetStyle("Div_POA","BGColor","#FF5500");
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
      SetStyle("Div_Nominee","BGColor","#FF5500");
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
      SetStyle("Div_Gurdian","BGColor","#FF5500");
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
      SetStyle("Div_NomGurdian","BGColor","#FF5500");  
    }
    </script>

    <script type="text/javascript" src="../../../../JSFunction/floating-1.12.js"></script>

    <script type="text/javascript">  
    floatingMenu.add('divForCDSLVerifyOverView',{ targetLeft: 6,targetTop: 22,snap: true}); 
    floatingMenu.add('btnCDSLClose',{targetLeft: 2, targetTop: 2,snap: true});      
    floatingMenu.add('btnCDSLOpen',{targetLeft: 2, targetTop: 2,snap: true});
    function fn_onmouseOver(ele)
    {
        if(ele=='1')
            GetObjectID('Div_FNameAddress').title="Go To First Account Holder Name & Address Section"; 
        else if(ele=='2')
            GetObjectID('Div_FContactPan').title="Go To First Account Holder Contact & Pan Section";
        else if(ele=='3')
            GetObjectID('Div_FUserDefined').title="Go To First Account Holder User Defined Section";
        else if(ele=='4')
            GetObjectID('Div_SecondAccount').title="Go To Second Account Holder Section"; 
        else if(ele=='5')
            GetObjectID('Div_ThirdAccount').title="Go To Third Account Holder Section";
        else if(ele=='6')
            GetObjectID('Div_Product').title="Go To Product Details Section";
        else if(ele=='7')
            GetObjectID('Div_POA').title="Go To POA Details Section";
        else if(ele=='8')
            GetObjectID('Div_Nominee').title="Go To Nominee Details Section";     
        else if(ele=='9')
            GetObjectID('Div_Gurdian').title="Go To Gurdian Details Section"; 
        else if(ele=='10')
            GetObjectID('Div_NomGurdian').title="Go To Nominee Gurdian Details Section";                                                 
    }
    </script>

    <%------------------End For Floating Div with snap--------------%>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="btnCDSLOpen" class="Box_closeTotal">
                <a href="javascript:void(0);" onclick="btnOpenTotal_click()" title="Click To have An OverView Of All Records">
                    +</a></div>
            <div id="btnCDSLClose" class="Box_closeTotal">
                <a href="javascript:void(0);" onclick="btnCloseTotal_click()" title="Minimize The Section">
                    -</a></div>
            <div id="divForCDSLVerifyOverView" class="Box_TotalRecord">
                <div style="width: 950px;">
                    <div style="width: 100%">
                        <div id="Div_FNameAddress" class="left cellTotHeader" runat="server" style="width: 100px;"
                            onmouseover="return fn_onmouseOver('1')" onclick="return NameAddressView()">
                            <b>Name & Address</b>
                        </div>
                        <div id="Div_FContactPan" runat="server" class="left cellTotHeader" style="width: 85px;"
                            onmouseover="return fn_onmouseOver('2')" onclick="return ContactPanView()">
                            <b>Contact & Pan</b>
                        </div>
                        <div id="Div_FUserDefined" runat="server" class="left cellTotHeader" style="width: 85px;"
                            onmouseover="return fn_onmouseOver('3')" onclick="return UserDefinedView()">
                            <b>User Defined</b>
                        </div>
                        <div id="Div_SecondAccount" runat="server" class="left cellTotHeader" style="width: 135px;"
                            onmouseover="return fn_onmouseOver('4')" onclick="return SecndAcntHldrView()">
                            <b>Second Account Holder </b>
                        </div>
                        <div id="Div_ThirdAccount" runat="server" class="left cellTotHeader" style="width: 125px;"
                            onmouseover="return fn_onmouseOver('5')" onclick="return ThrdAcntHldrView()">
                            <b>Third Account Holder</b>
                        </div>
                        <div id="Div_Product" runat="server" class="left cellTotHeader" style="width: 65px;"
                            onmouseover="return fn_onmouseOver('6')" onclick="return PrdctDtlsView()">
                            <b>Product</b>
                        </div>
                        <div id="Div_POA" runat="server" class="left cellTotHeader" style="width: 55px;"
                            onmouseover="return fn_onmouseOver('7')" onclick="return POADtlsView()">
                            <b>POA</b>
                        </div>
                        <div id="Div_Nominee" runat="server" class="left cellTotHeader" style="width: 70px;"
                            onmouseover="return fn_onmouseOver('8')" onclick="return NomineeView()">
                            <b>Nominee</b>
                        </div>
                        <div id="Div_Gurdian" runat="server" class="left cellTotHeader" style="width: 67px;"
                            onmouseover="return fn_onmouseOver('9')" onclick="return GurdianView()">
                            <b>Gurdian</b>
                        </div>
                        <div id="Div_NomGurdian" runat="server" class="left cellTotHeader" style="width: 103px;"
                            onmouseover="return fn_onmouseOver('10')" onclick="return NomineeGurdianView()">
                            <b>Nominee Gurdian</b>
                        </div>
                        <span class="clear"></span>
                    </div>
                </div>
            </div>
            <div id="divPopup">
                <dxpc:ASPxPopupControl ID="PopUpEdit" runat="server" ClientInstanceName="cPopUpEdit"
                    CloseAction="None" HeaderText="CDSL ( CDSL Registration Authorization )  Edit"
                    Modal="True" PopupHorizontalAlign="LeftSides" PopupVerticalAlign="TopSides" ShowOnPageLoad="True"
                    ShowSizeGrip="False" Width="700px" ShowCloseButton="false">
                    <ContentCollection>
                        <dxpc:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
                            <asp:Panel ID="Panel1" runat="server" Width="99%">
                                <div class="left">
                                    Click "Continue" To Proceed<br />
                                    <br />
                                    <div class="left" style="margin-left: 50px;">
                                        <dxe:ASPxButton AccessKey="c" ID="btnCont_PopUpEdit" runat="server" Width="130px"
                                            ToolTip="Proceed To Edit Data." Text="[C]ontinue" AutoPostBack="False">
                                            <ClientSideEvents Click="function(s, e) {fn_btnCont_PopUpEdit_Click();}"></ClientSideEvents>
                                        </dxe:ASPxButton>
                                    </div>
                                    <div class="left" style="margin-left: 20px; display: none;">
                                        <dxe:ASPxButton AccessKey="b" ID="btnBack_PopUpEdit" runat="server" Width="130px"
                                            ToolTip="Back To Previous Page." Text="[B]ack" AutoPostBack="False">
                                            <ClientSideEvents Click="function(s, e) {fn_btnBack_PopUpEdit_Click();}"></ClientSideEvents>
                                        </dxe:ASPxButton>
                                    </div>
                                    <br class="clear" />
                                </div>
                                <br class="clear" />
                            </asp:Panel>
                        </dxpc:PopupControlContentControl>
                    </ContentCollection>
                    <HeaderStyle BackColor="LightGray" ForeColor="Black" Font-Names="Calibri" />
                </dxpc:ASPxPopupControl>
            </div>
            <div id="Div_Container" class="container" style="width: 99%">
                <dxcp:ASPxCallbackPanel ID="CbpCompare" runat="server" ClientInstanceName="cCbpCompare"
                    OnCallback="CbpCompare_Callback" BackColor="Transparent" LoadingPanelText="Comparing&hellip;">
                    <PanelCollection>
                        <dxp:panelcontent runat="server">
                        </dxp:panelcontent>
                    </PanelCollection>
                    <ClientSideEvents EndCallback="function (s, e) {CbpCompare_EndCallBack();}" />
                </dxcp:ASPxCallbackPanel>
                <div id="Div_FirstAccountHlder" style="width: 99%">
                    <div id="Div_NameAddress">
                        <dxcp:ASPxCallbackPanel ID="CbpNameAddress" runat="server" BackColor="Transparent"
                            ClientInstanceName="cCbpNameAddress" OnCallback="CbpNameAddress_Callback" Width="100%">
                            <PanelCollection>
                                <dxp:PanelContent runat="server">
                                    <div class="DivHeader" style="width: 100%">
                                        NAME &amp; ADDRESS DETAILS
                                    </div>
                                    <div id="Row00" class="Row">
                                        <div id="Row00_Col0" class="LFloat_Lable Leftdiv ">
                                            <span style="font-size: 10pt; color: #ff0000"></span>Product Type: <span style="font-size: 10pt;
                                                color: #ff0000">**</span></div>
                                        <div id="Row00_Col1" class="LFloat_Row" style="height: 25px">
                                            <asp:TextBox ID="TxtProductType" runat="server" Width="150px"></asp:TextBox>
                                        </div>
                                        <div class="right" style="margin-right: 10px;">
                                            <span style="font-size: 10pt; color: #ff0000">**</span> <span style="font-size: 8pt">
                                                Mandatory Fields To Be Filled</span>
                                        </div>
                                    </div>
                                    <div id="Row0" class="Row">
                                        <div id="Row0_Col1" class="LFloat_Lable Leftdiv ">
                                            Title:
                                        </div>
                                        <div id="Row0_Col2" class="LFloat_Row" style="height: 25px">
                                            <dxe:ASPxTextBox ID="TxtTitl1" runat="server" ClientInstanceName="cTxtTitl1" MaxLength="10"
                                                Width="100px">
                                            </dxe:ASPxTextBox>
                                        </div>
                                    </div>
                                    <div id="Row1" class="Row">
                                        <div id="Row1_Col0" class="LFloat_Lable Leftdiv ">
                                            <span class="Spanclass"></span>Name Of The Applicant:
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
                                            <dxe:ASPxTextBox ID="TxtSufx1" runat="server" ClientInstanceName="cTxtSufx1" MaxLength="10"
                                                Width="100px">
                                            </dxe:ASPxTextBox>
                                        </div>
                                    </div>
                                    <div id="Row3" class="Row">
                                        <div id="Row3_Col0" class="LFloat_Lable Leftdiv">
                                            <span class="Spanclass"></span>Father's / Spouse Name:
                                        </div>
                                        <div id="Row3_Col1" class="LFloat_Row BindDiv" style="height: 25px">
                                        </div>
                                    </div>
                                    <div id="Row4" class="Row">
                                        <div class="left" style="width: 20%; margin-right: 10px;">
                                            <div id="Row4_Col0" class="LFloat_Lable Leftdiv">
                                                Correspondence Address:
                                            </div>
                                            <div id="Row6" class="LFloat_Row" style="font-size: 12px; margin-top: 4px;">
                                                <strong>Same As The Correspondence Address</strong>
                                                <dxe:ASPxCheckBox ID="CbSame" runat="server" ClientInstanceName="cCbSame" ToolTip="Same As The Corresponding Address">
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
                                                <div id="Row5_Col1_row3_col1" class="left LeftMargin SetBorder BindDiv" style="height: 25px;
                                                    width: 100px;">
                                                </div>
                                                <div id="Row5_Col1_row3_col2" class="left" style="height: 25px; padding-left: 4px;">
                                                    PinCode :
                                                </div>
                                                <div id="Row5_Col1_row3_col3" class="left LeftMargin SetBorder BindDiv" style="height: 25px;
                                                    width: 100px;">
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
                                    </div>
                                    <asp:HiddenField ID="TxtProductType_hidden" runat="server" />
                                    <br class="clear" />
                                    <div id="Row6_0" class="right RightMargin">
                                        <dxe:ASPxButton ID="BtnNext00" runat="server" AccessKey="i" AutoPostBack="False"
                                            ClientInstanceName="cBtnNext00" ToolTip="Go to Next Page" Width="70px" BackColor="Transparent"
                                            Height="60px">
                                            <ClientSideEvents Click="function(s, e) {NameAdrsNext();}" />
                                            <Border BorderColor="Transparent" BorderStyle="None" />
                                            <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_foward.png"
                                                Repeat="NoRepeat" />
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
                                            ClientInstanceName="cBtnEditNameAdrs" Height="60px" ToolTip="Edit Entered Data"
                                            Width="70px">
                                            <ClientSideEvents Click="function(s, e) {NameAdrsEdit();}" />
                                            <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/Edit.jpg"
                                                Repeat="NoRepeat" />
                                            <Border BorderStyle="None" />
                                        </dxe:ASPxButton>
                                    </div>
                                    <div id="Row6_1" class="right" style="font-size: 12pt; margin-left: 10px; width: 143px;">
                                        <dxe:ASPxCheckBox ID="CbNameAdrs" runat="server" ClientInstanceName="cCbNameAdrs"
                                            ToolTip="Click If All The Informations Has Been Checked" Text="Information Checked">
                                            <ClientSideEvents CheckedChanged="function(s, e) {OnCheckedShowHide(cCbNameAdrs.GetChecked(),'DivBtnSaveNameAdrs');Height('350','350');}" />
                                        </dxe:ASPxCheckBox>
                                    </div>
                                    <br class="clear" />
                                </dxp:PanelContent>
                            </PanelCollection>
                            <ClientSideEvents EndCallback="function (s, e) {CbpNameAddress_EndCallBack();}" />
                            <BackgroundImage HorizontalPosition="left" />
                        </dxcp:ASPxCallbackPanel>
                        <br class="clear" />
                        <div id="DivNameAdrsAlrt" class="Success BtmMargin" style="font-size: 9pt; width: 800px;">
                            <span style="color: #3366ff">Name And Address Details</span> Submitted Successfully
                            !!!!
                            <br />
                            <div class="left" style="margin-right: 2px">
                                Click&nbsp;</div>
                            <div class="left" style="width: 26px; height: 26px; background-position: center center;
                                background-image: url(../../../../CentralData/Images/Small_Edit.jpg); background-repeat: no-repeat;
                                background-color: transparent;">
                            </div>
                            <div class="left" style="margin-left: 2px; margin-right: 2px">
                                To Edit The Section<span style="color: #0066ff"> Or </span>Click</div>
                            <div class="left" style="width: 26px; height: 26px; background-position: center center;
                                background-image: url(../../../../CentralData/Images/Small_blue_foward.png);
                                background-repeat: no-repeat; background-color: transparent;">
                            </div>
                            <div class="left" style="margin-left: 2px; width: 280px;">
                                To Go To the <span style="color: #0066ff">Contact &amp; Pan Details</span>..</div>
                        </div>
                    </div>
                    <dxcp:ASPxCallbackPanel ID="CbpContactPan" runat="server" BackColor="Transparent"
                        ClientInstanceName="cCbpContactPan" OnCallback="CbpContactPan_Callback" Width="100%">
                        <PanelCollection>
                            <dxp:PanelContent runat="server">
                                <div id="Div_Contact_Pan" class="left">
                                    <div class="DivHeader" style="width: 1000px">
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
                                                <div id="Row7_Col1_row0_col1" class="left SetBorder BindDiv" style="height: 25px;
                                                    width: 100px;">
                                                </div>
                                                <div id="Row7_Col1_row0_col2" class="left" style="height: 25px; width: 65px; padding-left: 4px;">
                                                    Tel(Res) :
                                                </div>
                                                <div id="Row7_Col1_row0_col3" class="left SetBorder BindDiv" style="height: 25px;
                                                    width: 100px;">
                                                </div>
                                            </div>
                                            <div id="Row7_Col1_row1" class="left BtmMargin TopMargin" style="width: 550px">
                                                <div id="Row7_Col1_row1_col0" class="left" style="height: 25px; width: 60px; padding-left: 4px;">
                                                    Fax No. :
                                                </div>
                                                <div id="Row7_Col1_row1_col1" class="left SetBorder BindDiv" style="height: 25px;
                                                    width: 100px;">
                                                </div>
                                                <div id="Row7_Col1_row1_col2" class="left" style="height: 25px; width: 65px; padding-left: 4px;">
                                                    Mobile No. :
                                                </div>
                                                <div id="Row7_Col1_row1_col3" class="left SetBorder BindDiv" style="height: 25px;
                                                    width: 100px;">
                                                </div>
                                            </div>
                                            <div id="Row7_Col1_row2" class="left BtmMargin" style="height: 25px; width: 60px;
                                                padding-left: 4px;">
                                                Email ID:
                                            </div>
                                            <div id="Row7_Col1_row3" class="left SetBorder BtmMargin BindDiv" style="height: 25px;
                                                width: 250px;">
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
                                                EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" ValueType="System.String"
                                                Width="250px">
                                                <DropDownButton Text="PanExemptionType">
                                                </DropDownButton>
                                            </dxe:ASPxComboBox>
                                        </div>
                                    </div>
                                    <div id="Row9" class="Row">
                                        <div id="Row9_Col0" class="LFloat_Lable Leftdiv" style="height: 35px">
                                            <span class="Spanclass"></span>PAN / GIR: <span style="font-size: 10pt; color: #ff0000">
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
                                            <dxe:ASPxTextBox ID="TxtUIN1" runat="server" ClientInstanceName="cTxtUIN1" MaxLength="15"
                                                Width="170px">
                                            </dxe:ASPxTextBox>
                                        </div>
                                    </div>
                                    <div id="Row10" class="Row">
                                        <div id="Row10_Col0" class="LFloat_Lable Leftdiv" style="height: 37px">
                                            IT Circle/Ward/District:</div>
                                        <div id="Row10_Col1" class="LFloat_Row" style="height: 37px">
                                            <dxe:ASPxTextBox ID="TxtDistrict1" runat="server" ClientInstanceName="cTxtDistrict1"
                                                MaxLength="15" Width="170px">
                                            </dxe:ASPxTextBox>
                                        </div>
                                    </div>
                                    <br class="clear" />
                                    <div id="Row010" class="right RightMargin">
                                        <dxe:ASPxButton ID="BtnNext0" runat="server" AccessKey="i" AutoPostBack="False" ClientInstanceName="cBtnNext0"
                                            ToolTip="Go to Next Page" Width="70px" BackColor="Transparent" Height="60px">
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
                                            ClientInstanceName="cBtnEditContactPan" Height="60px" ToolTip="Edit Entered Data"
                                            Width="70px">
                                            <ClientSideEvents Click="function(s, e) {ContactEdit();}" />
                                            <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/Edit.jpg"
                                                Repeat="NoRepeat" />
                                            <Border BorderStyle="None" />
                                        </dxe:ASPxButton>
                                    </div>
                                    <div id="Row120" class="right">
                                        <dxe:ASPxButton ID="BtnPrvs00" runat="server" AutoPostBack="False" ClientInstanceName="cBtnPrvs00"
                                            ToolTip="Bck To Previous" Width="70px" BackColor="Transparent" Height="60px">
                                            <ClientSideEvents Click="function(s, e) {ContactPrevious();}" />
                                            <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_rewind.png"
                                                Repeat="NoRepeat" />
                                            <Border BorderColor="Transparent" BorderStyle="None" />
                                        </dxe:ASPxButton>
                                    </div>
                                    <div id="Row12" class="right" style="font-size: 12pt; width: 143px;">
                                        <dxe:ASPxCheckBox ID="CbChecked" runat="server" ClientInstanceName="cCbChecked" ToolTip="Click If All The Informations Has Been Checked"
                                            Text="Information Checked">
                                            <ClientSideEvents CheckedChanged="function(s, e) {OnCheckedShowHide(cCbChecked.GetChecked(),'DivBtnSaveContactPan')}" />
                                        </dxe:ASPxCheckBox>
                                    </div>
                                    <br class="clear" />
                                    <div style="valign: top; font-size: 9pt; width: 863px" id="DivPanContctAlrt" class="Success BtmMargin">
                                        <span style="color: #0066ff">Contact And Pan Details</span> Submitted Successfully
                                        !!!!
                                        <br />
                                        <div class="left" style="margin-right: 2px">
                                            Click</div>
                                        <div class="left" style="width: 26px; height: 26px; background-position: center center;
                                            background-image: url(../../../../CentralData/Images/Small_Edit.jpg); background-repeat: no-repeat;
                                            background-color: transparent;">
                                        </div>
                                        <div class="left" style="margin-left: 2px; margin-right: 2px">
                                            To Edit The Section<span style="color: #0066ff"> Or </span>Click</div>
                                        <div class="left" style="width: 26px; height: 26px; background-position: center center;
                                            background-image: url(../../../../CentralData/Images/Small_blue_foward.png);
                                            background-repeat: no-repeat; background-color: transparent;">
                                        </div>
                                        <div class="left" style="margin-left: 2px">
                                            To Go To the <span style="color: #0066ff">User Defined Fields</span> <span style="color: #0066ff">
                                                Or</span> Click&nbsp;</div>
                                        <div class="left" style="width: 26px; height: 26px; background-position: center center;
                                            background-image: url(../../../../CentralData/Images/Small_blue_rewind.png);
                                            background-repeat: no-repeat; background-color: transparent;">
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
                                    <div class="DivHeader" style="width: 1000px">
                                        USER DEFINED FIELDS
                                    </div>
                                    <div id="Row100" class="Row">
                                        <div id="Row100_Col0" class="LFloat_Lable Leftdiv" style="height: 37px">
                                            User Field1:</div>
                                        <div id="Row100_Col1" class="LFloat_Row" style="height: 37px">
                                            <dxe:ASPxTextBox ID="TxtUsrTxt1" runat="server" ClientInstanceName="cTxtUsrTxt1"
                                                MaxLength="50" Width="270px">
                                            </dxe:ASPxTextBox>
                                        </div>
                                    </div>
                                    <div id="Row101" class="Row">
                                        <div id="Row101_Col0" class="LFloat_Lable Leftdiv" style="height: 37px">
                                            User Field2:</div>
                                        <div id="Row101_Col1" class="LFloat_Row" style="height: 37px">
                                            <dxe:ASPxTextBox ID="TxtUsrTxt2" runat="server" ClientInstanceName="cTxtUsrTxt2"
                                                MaxLength="50" Width="270px">
                                            </dxe:ASPxTextBox>
                                        </div>
                                    </div>
                                    <div id="Row102" class="Row">
                                        <div id="Row102_Col0" class="LFloat_Lable Leftdiv" style="height: 37px">
                                            User Field3:</div>
                                        <div id="Row102_Col1" class="LFloat_Row" style="height: 37px">
                                            <dxe:ASPxTextBox ID="TxtUsrTxt3" runat="server" ClientInstanceName="cTxtUsrTxt3"
                                                MaxLength="50" Width="120px">
                                            </dxe:ASPxTextBox>
                                        </div>
                                    </div>
                                    <br class="clear" />
                                    <div id="Row11" class="right RightMargin">
                                        <dxe:ASPxButton ID="BtnNext1" runat="server" AccessKey="i" AutoPostBack="False" ClientInstanceName="cBtnNext1"
                                            ToolTip="Go to Next Page" Width="70px" BackColor="Transparent" Height="60px">
                                            <ClientSideEvents Click="function(s, e) {FirstHolderNext();}" />
                                            <Border BorderColor="Transparent" BorderStyle="None" />
                                            <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_foward.png"
                                                Repeat="NoRepeat" />
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
                                            ClientInstanceName="cBtnEditUserDefined" Height="60px" ToolTip="Edit Entered Data"
                                            Width="70px">
                                            <ClientSideEvents Click="function(s, e) {UserDefSectionEdit();}" />
                                            <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/Edit.jpg"
                                                Repeat="NoRepeat" />
                                            <Border BorderStyle="None" />
                                        </dxe:ASPxButton>
                                    </div>
                                    <div id="Row12_0" class="right">
                                        <dxe:ASPxButton ID="BtnPrvs0" runat="server" AutoPostBack="False" ClientInstanceName="cBtnPrvs0"
                                            ToolTip="Back To Previous" Width="70px" BackColor="Transparent" Height="60px">
                                            <ClientSideEvents Click="function(s, e) {FirstHolderPrevious();}" />
                                            <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_rewind.png"
                                                Repeat="NoRepeat" />
                                            <Border BorderColor="Transparent" BorderStyle="None" />
                                        </dxe:ASPxButton>
                                    </div>
                                    <br class="clear" />
                                    <div style="font-size: 9pt; width: 836px" id="DivUsrDefindAlrt" class="Success BtmMargin">
                                        <span style="color: #0066ff">User Defined Fields</span> Submitted Successfully !!!!
                                        <br />
                                        <div class="left" style="margin-right: 2px">
                                            Click</div>
                                        <div class="left" style="width: 26px; height: 26px; background-position: center center;
                                            background-image: url(../../../../CentralData/Images/Small_Edit.jpg); background-repeat: no-repeat;
                                            background-color: transparent;">
                                        </div>
                                        <div class="left" style="margin-left: 2px; margin-right: 2px">
                                            To Edit The Section<span style="color: #0066ff"> Or </span>Click</div>
                                        <div class="left" style="width: 26px; height: 26px; background-position: center center;
                                            background-image: url(../../../../CentralData/Images/Small_blue_foward.png);
                                            background-repeat: no-repeat; background-color: transparent;">
                                        </div>
                                        <div class="left" style="margin-left: 2px">
                                            To Go To the <span style="color: #0066ff">Second Account Holder Details</span> &nbsp;<span
                                                style="color: #0066ff">Or</span> Click&nbsp;</div>
                                        <div class="left" style="width: 26px; height: 26px; background-position: center center;
                                            background-image: url(../../../../CentralData/Images/Small_blue_rewind.png);
                                            background-repeat: no-repeat; background-color: transparent;">
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
                <div id="Div_SecondAccountHlder" style="width: 99%">
                    <dxcp:ASPxCallbackPanel ID="CbpSecondAccountHlder" runat="server" BackColor="Transparent"
                        ClientInstanceName="cCbpSecondAccountHlder" OnCallback="CbpSecondAccountHlder_Callback"
                        Width="100%">
                        <PanelCollection>
                            <dxp:PanelContent runat="server">
                                <div class="DivHeader" style="width: 100%">
                                    &nbsp; SECOND ACCOUNT HOLDER DETAILS
                                </div>
                                <div id="Row13" class="Row">
                                    <div id="Row13_Col0" class="LFloat_Lable Leftdiv ">
                                        Title:
                                    </div>
                                    <div id="Row13_Col1" class="LFloat_Row" style="height: 25px">
                                        <dxe:ASPxTextBox ID="TxtTitl2" runat="server" ClientInstanceName="cTxtTitl2" MaxLength="10"
                                            Width="100px">
                                            <ClientSideEvents TextChanged="SkipSecondHolder" />
                                        </dxe:ASPxTextBox>
                                    </div>
                                </div>
                                <div id="Row14" class="right" style="margin-right: 10px;">
                                    <span style="font-size: 10pt; color: #ff0000">**</span> <span style="font-size: 8pt">
                                        Mandatory Fields To Be Filled</span>
                                </div>
                                <div id="Row15" class="Row">
                                    <div id="Row15_Col0" class="LFloat_Lable Leftdiv " style="height: 38px">
                                        <span class="Spanclass"></span>Name Of The Applicant: <span style="font-size: 10pt;
                                            color: #ff0000">**</span>
                                    </div>
                                    <div id="Row15_Col1" class="LFloat_Row " style="height: 38px; text-align: center">
                                        <dxe:ASPxTextBox ID="TxtFName1" runat="server" ClientInstanceName="cTxtFName1" MaxLength="120"
                                            HorizontalAlign="Left" Width="155px">
                                            <ClientSideEvents TextChanged="SkipSecondHolder" />
                                        </dxe:ASPxTextBox>
                                        <span style="font-size: 8pt">[First Name]</span>&nbsp;</div>
                                    <div id="Row15_Col2" class="LFloat_Row DivName" style="height: 38px">
                                        <dxe:ASPxTextBox ID="TxtMName1" runat="server" ClientInstanceName="cTxtMName1" MaxLength="50"
                                            HorizontalAlign="Left" Width="155px">
                                            <ClientSideEvents TextChanged="SkipSecondHolder" />
                                        </dxe:ASPxTextBox>
                                        <span style="font-size: 8pt">[Middle Name]</span>&nbsp;</div>
                                    <div id="Row15_Col3" class="LFloat_Row DivName" style="height: 38px">
                                        <dxe:ASPxTextBox ID="TxtLName1" runat="server" ClientInstanceName="cTxtLName1" MaxLength="50"
                                            HorizontalAlign="Left" Width="155px">
                                            <ClientSideEvents TextChanged="SkipSecondHolder" />
                                        </dxe:ASPxTextBox>
                                        <span style="font-size: 8pt">[Last Name]</span>&nbsp;</div>
                                </div>
                                <div id="Row16" class="Row">
                                    <div id="Row16_Col0" class="LFloat_Lable Leftdiv ">
                                        Suffix:
                                    </div>
                                    <div id="Row16_Col1" class="LFloat_Row" style="height: 25px">
                                        <dxe:ASPxTextBox ID="TxtSufx2" runat="server" ClientInstanceName="cTxtSufx2" MaxLength="10"
                                            Width="100px">
                                            <ClientSideEvents TextChanged="SkipSecondHolder" />
                                        </dxe:ASPxTextBox>
                                    </div>
                                </div>
                                <div id="Row17" class="Row">
                                    <div id="Row17_Col0" class="LFloat_Lable Leftdiv">
                                        Father's / Spouse Name:
                                    </div>
                                    <div id="Row17_Col1" class="LFloat_Row" style="height: 25px">
                                        <dxe:ASPxTextBox ID="TxtFthrName1" runat="server" ClientInstanceName="cTxtFthrName1"
                                            MaxLength="120" Width="500px">
                                            <ClientSideEvents TextChanged="SkipSecondHolder" />
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
                                            <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdPanxmptY1.GetChecked(),'Row18_Col2');SkipSecondHolder();}" />
                                        </dxe:ASPxRadioButton>
                                        YES
                                        <dxe:ASPxRadioButton ID="rdPanxmptN1" runat="server" Checked="True" ClientInstanceName="crdPanxmptN1"
                                            GroupName="z">
                                            <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdPanxmptY1.GetChecked(),'Row18_Col2');SkipSecondHolder();}" />
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
                                        <span class="Spanclass"></span>PAN / GIR: <span style="font-size: 10pt; color: #ff0000">
                                            **</span>
                                    </div>
                                    <div id="Row19_Col1" class="LFloat_Row FontChange" style="height: 35px">
                                        <dxe:ASPxTextBox ID="TxtPan1" runat="server" ClientInstanceName="cTxtPan1" MaxLength="10"
                                            Width="150px">
                                            <ClientSideEvents TextChanged="SkipSecondHolder" KeyUp="function(s,e){s.SetText(s.GetValue().toUpperCase());}"
                                                LostFocus="function(s, e) {verifyPanCrdNo(cTxtPan1);}" />
                                        </dxe:ASPxTextBox>
                                    </div>
                                    <div id="Row19_Col2" class="LFloat_Row" style="margin-left: 10px; height: 35px">
                                        <dxe:ASPxComboBox ID="ComboPanVerificatn2" runat="server" ClientInstanceName="cComboPanVerificatn2"
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
                                            <ClientSideEvents SelectedIndexChanged="SkipSecondHolder" />
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
                                            <ClientSideEvents TextChanged="SkipSecondHolder" />
                                        </dxe:ASPxTextBox>
                                    </div>
                                </div>
                                <br class="clear" />
                                <div id="Row21" class="right RightMargin">
                                    <dxe:ASPxButton ID="BtnNext2" runat="server" AccessKey="i" AutoPostBack="False" ClientInstanceName="cBtnNext2"
                                        ToolTip="Proceed To Next" Width="70px" BackColor="Transparent" Height="60px">
                                        <ClientSideEvents Click="function(s, e) {SecondHolderNext();}" />
                                        <Border BorderColor="Transparent" BorderStyle="None" />
                                        <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_foward.png"
                                            Repeat="NoRepeat" />
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
                                        ClientInstanceName="cBtnEditScndAcntHlder" Height="60px" ToolTip="Edit Entered Data"
                                        Width="70px">
                                        <ClientSideEvents Click="function(s, e) {SecondHolderEdit();}" />
                                        <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/Edit.jpg"
                                            Repeat="NoRepeat" />
                                        <Border BorderStyle="None" />
                                    </dxe:ASPxButton>
                                </div>
                                <div id="Row22" class="right" style="margin-left: 4px">
                                    <dxe:ASPxButton ID="BtnPrvs1" runat="server" AutoPostBack="False" ClientInstanceName="cBtnPrvs1"
                                        ToolTip="Back To Previous" Width="70px" BackColor="Transparent" Height="60px">
                                        <ClientSideEvents Click="function(s, e) {SecondHolderPrevious();}" />
                                        <Border BorderColor="Transparent" BorderStyle="None" />
                                        <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_rewind.png"
                                            Repeat="NoRepeat" />
                                    </dxe:ASPxButton>
                                </div>
                                <div class="right">
                                    <div id="divSkipSecondAccHolder" class="LFloat_Row" style="margin-right: 4px;">
                                        <dxe:ASPxCheckBox ID="CbSkip1" runat="server" ClientInstanceName="cCbSkip1" ToolTip="Skip Second Account Holder Details"
                                            Checked="False" Text="Skip This Section">
                                            <ClientSideEvents CheckedChanged="Skip1CheckedChanged" />
                                        </dxe:ASPxCheckBox>
                                    </div>
                                </div>
                                <br class="clear" />
                                <div style="font-size: 9pt; width: 860px" id="DivScndHlderAlrt" class="Success BtmMargin">
                                    <span style="color: #0066ff">Second Account Holder Details</span> Submitted Successfully
                                    !!!!
                                    <br />
                                    <div class="left" style="margin-right: 2px">
                                        Click</div>
                                    <div class="left" style="width: 26px; height: 26px; background-position: center center;
                                        background-image: url(../../../../CentralData/Images/Small_Edit.jpg); background-repeat: no-repeat;
                                        background-color: transparent;">
                                    </div>
                                    <div class="left" style="margin-left: 2px; margin-right: 2px">
                                        To Edit The Section<span style="color: #0066ff"> Or </span>Click</div>
                                    <div class="left" style="width: 26px; height: 26px; background-position: center center;
                                        background-image: url(../../../../CentralData/Images/Small_blue_foward.png);
                                        background-repeat: no-repeat; background-color: transparent;">
                                    </div>
                                    <div class="left" style="margin-left: 2px">
                                        To Go To the <span style="color: #0066cc">Third Account Holder Details</span> <span
                                            style="color: #0066ff">Or</span> Click&nbsp;</div>
                                    <div class="left" style="width: 26px; height: 26px; background-position: center center;
                                        background-image: url(../../../../CentralData/Images/Small_blue_rewind.png);
                                        background-repeat: no-repeat; background-color: transparent;">
                                    </div>
                                    <div class="left" style="margin-left: 2px; width: 280px;">
                                        To Go Back To the <span style="color: #0066ff">User Defined Details</span>..</div>
                                </div>
                            </dxp:PanelContent>
                        </PanelCollection>
                        <ClientSideEvents EndCallback="function (s, e) {CbpSecondAccountHlder_EndCallBack();}" />
                    </dxcp:ASPxCallbackPanel>
                </div>
                <div id="Div_ThirdAccountHlder" style="width: 99%">
                    <dxcp:ASPxCallbackPanel ID="CbpThirdAccountHlder" runat="server" BackColor="Transparent"
                        ClientInstanceName="cCbpThirdAccountHlder" OnCallback="CbpThirdAccountHlder_Callback"
                        Width="100%">
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
                                        <dxe:ASPxTextBox ID="TxtTitl3" runat="server" ClientInstanceName="cTxtTitl3" MaxLength="10"
                                            Width="100px">
                                            <ClientSideEvents TextChanged="SkipThirdHolder" />
                                        </dxe:ASPxTextBox>
                                    </div>
                                    <div id="Div4" class="right" style="margin-right: 10px;">
                                        <span style="font-size: 10pt; color: #ff0000">**</span> <span style="font-size: 8pt">
                                            Mandatory Fields To Be Filled</span>
                                    </div>
                                </div>
                                <div id="Row24" class="Row">
                                    <div id="Row24_Col0" class="LFloat_Lable Leftdiv " style="height: 38px">
                                        <span class="Spanclass"></span>Name Of The Applicant: <span style="font-size: 10pt;
                                            color: #ff0000">**</span>
                                    </div>
                                    <div id="Row24_Col1" class="LFloat_Row " style="height: 38px; text-align: center">
                                        <dxe:ASPxTextBox ID="TxtFName2" runat="server" ClientInstanceName="cTxtFName2" MaxLength="120"
                                            HorizontalAlign="Left" Width="155px">
                                            <ClientSideEvents TextChanged="SkipThirdHolder" />
                                        </dxe:ASPxTextBox>
                                        <span style="font-size: 8pt">[First Name]</span>
                                    </div>
                                    <div id="Row24_Col2" class="LFloat_Row DivName" style="height: 38px">
                                        <dxe:ASPxTextBox ID="TxtMName2" runat="server" ClientInstanceName="cTxtMName2" MaxLength="50"
                                            HorizontalAlign="Left" Width="155px">
                                            <ClientSideEvents TextChanged="SkipThirdHolder" />
                                        </dxe:ASPxTextBox>
                                        <span style="font-size: 8pt">[Middle Name]</span>
                                    </div>
                                    <div id="Row24_Col3" class="LFloat_Row DivName" style="height: 38px">
                                        <dxe:ASPxTextBox ID="TxtLName2" runat="server" ClientInstanceName="cTxtLName2" MaxLength="50"
                                            HorizontalAlign="Left" Width="155px">
                                            <ClientSideEvents TextChanged="SkipThirdHolder" />
                                        </dxe:ASPxTextBox>
                                        <span style="font-size: 8pt">[Last Name]</span>
                                    </div>
                                </div>
                                <div id="Row25" class="Row">
                                    <div id="Row25_Col0" class="LFloat_Lable Leftdiv ">
                                        Suffix:
                                    </div>
                                    <div id="Row25_Col1" class="LFloat_Row" style="height: 25px">
                                        <dxe:ASPxTextBox ID="TxtSufx3" runat="server" ClientInstanceName="cTxtSufx3" MaxLength="10"
                                            Width="100px">
                                            <ClientSideEvents TextChanged="SkipThirdHolder" />
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
                                            <ClientSideEvents TextChanged="SkipThirdHolder" />
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
                                            <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdPanxmptY2.GetChecked(),'Row27_Col2');SkipThirdHolder();}" />
                                        </dxe:ASPxRadioButton>
                                        YES
                                        <dxe:ASPxRadioButton ID="rdPanxmptN2" runat="server" Checked="True" ClientInstanceName="crdPanxmptN2"
                                            GroupName="z">
                                            <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdPanxmptY2.GetChecked(),'Row27_Col2');SkipThirdHolder();}" />
                                        </dxe:ASPxRadioButton>
                                        NO
                                    </div>
                                    <div id="Row27_Col2" class="LFloat_Row" style="margin-left: 10px; height: 35px">
                                        <dxe:ASPxComboBox ID="ComboPanExempt3" runat="server" ClientInstanceName="cComboPanExempt3"
                                            EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" SelectedIndex="0"
                                            ValueType="System.String" Width="250px">
                                            <ClientSideEvents SelectedIndexChanged="SkipThirdHolder" />
                                            <DropDownButton Text="PanExemptionType">
                                            </DropDownButton>
                                        </dxe:ASPxComboBox>
                                    </div>
                                </div>
                                <div id="Row28" class="Row">
                                    <div id="Row28_Col0" class="LFloat_Lable Leftdiv" style="height: 35px">
                                        <span class="Spanclass"></span>PAN / GIR: <span style="font-size: 10pt; color: #ff0000">
                                            **</span>
                                    </div>
                                    <div id="Row28_Col1" class="LFloat_Row FontChange" style="height: 35px">
                                        <dxe:ASPxTextBox ID="TxtPan2" runat="server" ClientInstanceName="cTxtPan2" MaxLength="10"
                                            Width="150px">
                                            <ClientSideEvents TextChanged="SkipThirdHolder" KeyUp="function(s,e){s.SetText(s.GetValue().toUpperCase());}"
                                                LostFocus="function(s, e) {verifyPanCrdNo(cTxtPan2);}" />
                                        </dxe:ASPxTextBox>
                                    </div>
                                    <div id="Row28_Col2" class="LFloat_Row" style="margin-left: 10px; height: 35px">
                                        <dxe:ASPxComboBox ID="ComboPanVerificatn3" runat="server" ClientInstanceName="cComboPanVerificatn3"
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
                                            <ClientSideEvents SelectedIndexChanged="SkipThirdHolder" />
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
                                            <ClientSideEvents TextChanged="SkipThirdHolder" />
                                        </dxe:ASPxTextBox>
                                    </div>
                                </div>
                                <br class="clear" />
                                <div id="Row30" class="right RightMargin">
                                    <dxe:ASPxButton ID="BtnNext3" runat="server" AccessKey="i" AutoPostBack="False" ClientInstanceName="cBtnNext3"
                                        ToolTip="Proceed To Next" Width="70px" BackColor="Transparent" Height="60px">
                                        <ClientSideEvents Click="function(s, e) {ThirdHolderNext();}" />
                                        <Border BorderColor="Transparent" BorderStyle="None" />
                                        <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_foward.png"
                                            Repeat="NoRepeat" />
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
                                        ClientInstanceName="cBtnEditThrdAcntHlder" Height="60px" ToolTip="Edit Entered Data"
                                        Width="70px">
                                        <ClientSideEvents Click="function(s, e) {ThirdHolderEdit();}" />
                                        <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/Edit.jpg"
                                            Repeat="NoRepeat" />
                                        <Border BorderStyle="None" />
                                    </dxe:ASPxButton>
                                </div>
                                <div id="Row31" class="right">
                                    <dxe:ASPxButton ID="BtnPrvs2" runat="server" AutoPostBack="False" ClientInstanceName="cBtnPrvs2"
                                        ToolTip="Bck To Previous" Width="70px" BackColor="Transparent" Height="60px">
                                        <ClientSideEvents Click="function(s, e) {ThirdHolderPrevious();}" />
                                        <Border BorderColor="Transparent" BorderStyle="None" />
                                        <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_rewind.png"
                                            Repeat="NoRepeat" />
                                    </dxe:ASPxButton>
                                </div>
                                <div class="right">
                                    <div id="Row23_Col2" class="LFloat_Row" style="margin-right: 4px">
                                        <dxe:ASPxCheckBox ID="CbSkip2" runat="server" ClientInstanceName="cCbSkip2" ToolTip="Skip Third Account Holder Details"
                                            Checked="False" Text="Skip This Section">
                                            <ClientSideEvents CheckedChanged="Skip2CheckedChanged" />
                                        </dxe:ASPxCheckBox>
                                    </div>
                                </div>
                                <br class="clear" />
                                <div style="font-size: 9pt; width: 800px" id="DivThrdHldrAlrt" class="Success BtmMargin">
                                    <span style="color: #0066ff">Third Account Holder Details</span> Submitted Successfully
                                    !!!!
                                    <br />
                                    <div class="left" style="margin-right: 2px">
                                        Click</div>
                                    <div class="left" style="width: 26px; height: 26px; background-position: center center;
                                        background-image: url(../../../../CentralData/Images/Small_Edit.jpg); background-repeat: no-repeat;
                                        background-color: transparent;">
                                    </div>
                                    <div class="left" style="margin-left: 2px; margin-right: 2px">
                                        To Edit The Section<span style="color: #0066ff"> Or </span>Click</div>
                                    <div class="left" style="width: 26px; height: 26px; background-position: center center;
                                        background-image: url(../../../../CentralData/Images/Small_blue_foward.png);
                                        background-repeat: no-repeat; background-color: transparent;">
                                    </div>
                                    <div class="left" style="margin-left: 2px">
                                        To Go To the <span style="color: #0066cc">Product Details</span> <span style="color: #0066ff">
                                            Or</span> Click&nbsp;</div>
                                    <div class="left" style="width: 26px; height: 26px; background-position: center center;
                                        background-image: url(../../../../CentralData/Images/Small_blue_rewind.png);
                                        background-repeat: no-repeat; background-color: transparent;">
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
                                <div class="DivHeader" style="width: 100%">
                                    &nbsp; PRODUCT DETAILS
                                </div>
                                <%--<div id="Row32" class="Row">
                                    <div id="Row32_Col0" class="LFloat_Lable Leftdiv">
                                        DP Internal Ref No:
                                    </div>
                                    <div id="Row32_Col1" class="LFloat_Row BtmMargin" style="height: 25px;">
                                        <dxe:ASPxTextBox ID="TxtIntrnlRef" runat="server" ClientInstanceName="cTxtIntrnlRef"
                                            Width="150px">
                                        </dxe:ASPxTextBox>
                                    </div>
                                   
                                </div>--%>
                                <div id="Row33" class="Row">
                                    <div id="Row33_Col0" class="LFloat_Lable Leftdiv ">
                                        DATE OF ACCOUNT OPEN:
                                    </div>
                                    <div id="Row33_Col1" class="LFloat_Row" style="height: 25px;">
                                        <dxe:ASPxDateEdit ID="MaturityDt" runat="server" ClientInstanceName="cMaturityDt"
                                            DateOnError="Today" EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True"
                                            Width="150px" Font-Size="11px" TabIndex="0">
                                        </dxe:ASPxDateEdit>
                                    </div>
                                    <div id="Row33_Col2" class="LFloat_Lable Leftdiv LeftMargin">
                                        Date Of Birth:
                                    </div>
                                    <div id="Row33_Col3" class="LFloat_Row BtmMargin BindDiv" style="height: 25px;">
                                    </div>
                                     <div id="Div5" class="right" style="margin-right: 10px;">
                                        <span style="font-size: 10pt; color: #ff0000">**</span> <span style="font-size: 8pt">
                                            Mandatory Fields To Be Filled</span>
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
                                        Geographical Code:
                                    </div>
                                    <div id="Row35_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                        <asp:TextBox ID="TxtGeoCode" runat="server" Width="144px"></asp:TextBox>
                                    </div>
                                </div>
                                <div id="Row36" class="Row">
                                    <div id="Row36_Col0" class="LFloat_Lable Leftdiv">
                                        Education /Degree:
                                    </div>
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
                                        <dxe:ASPxTextBox ID="TxtBoFee" runat="server" ClientInstanceName="cTxtBoFee" MaxLength="2"
                                            Width="150px">
                                        </dxe:ASPxTextBox>
                                    </div>
                                    <div id="Row38_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                        Language :
                                    </div>
                                    <div id="Row38_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                        <asp:TextBox ID="TxtLang" runat="server" Width="144px"></asp:TextBox>
                                    </div>
                                </div>
                                <div id="Row39" class="Row">
                                    <div id="Row39_Col0" class="LFloat_Lable Leftdiv">
                                        Catagory 4 Code:
                                    </div>
                                    <div id="Row39_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                        <dxe:ASPxTextBox ID="TxtCatg4" runat="server" ClientInstanceName="cTxtCatg4" MaxLength="2"
                                            Width="150px">
                                        </dxe:ASPxTextBox>
                                    </div>
                                    <div id="Row39_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                        Bank Option 5:
                                    </div>
                                    <div id="Row39_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                        <dxe:ASPxTextBox ID="TxtBnkOptn5" runat="server" ClientInstanceName="cTxtBnkOptn5"
                                            MaxLength="2" Width="150px">
                                        </dxe:ASPxTextBox>
                                    </div>
                                </div>
                                <div id="Row40" class="Row">
                                    <div id="Row40_Col0" class="LFloat_Lable Leftdiv">
                                        Staff/Relative:
                                    </div>
                                    <div id="Row40_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                        <asp:TextBox ID="TxtStaffRel" runat="server" Width="144px"></asp:TextBox>
                                    </div>
                                    <div id="Row40_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                        Staff Code:
                                    </div>
                                    <div id="Row40_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                        <dxe:ASPxTextBox ID="TxtStafCode" runat="server" ClientInstanceName="cTxtStafCode"
                                            MaxLength="10" Width="150px">
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
                                                <dxe:ListEditItem Text="No" Value="N" />
                                                <dxe:ListEditItem Text="Yes" Value="Y" />
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
                                                <dxe:ListEditItem Text="Physical Annual Report" Value="1" />
                                                <dxe:ListEditItem Text="Electronic Annual Report" Value="2" />
                                                <dxe:ListEditItem Text="Both Physical and Electronic Annual Report" Value="3" />
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
                                                <dxe:ListEditItem Text="Yes" Value="Y" />
                                                <dxe:ListEditItem Text="No" Value="N" />
                                            </Items>
                                        </dxe:ASPxComboBox>
                                    </div>
                                    <div id="Row42_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                        Email RTA Download Flag:
                                    </div>
                                    <div id="Row42_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                        <dxe:ASPxComboBox ID="ComboRTA" runat="server" ClientInstanceName="cComboRTA" EnableIncrementalFiltering="True"
                                            Font-Size="12px" Height="25px" SelectedIndex="0" ValueType="System.String" Width="150px">
                                            <Items>
                                                <dxe:ListEditItem Text="Yes" Value="Y" />
                                                <dxe:ListEditItem Text="No" Value="N" />
                                            </Items>
                                        </dxe:ASPxComboBox>
                                    </div>
                                </div>
                                <div id="Row43" class="Row">
                                    <div id="Row43_Col0" class="LFloat_Lable Leftdiv">
                                        Basic Services Demat A/C Flag:
                                    </div>
                                    <div id="Row43_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                        <dxe:ASPxComboBox ID="ComboBSDA" runat="server" ClientInstanceName="cComboBSDA" EnableIncrementalFiltering="True"
                                            Font-Size="12px" Height="25px" SelectedIndex="0" ValueType="System.String" Width="150px">
                                            <Items>
                                                <dxe:ListEditItem Text="No" Value="N" />
                                                <dxe:ListEditItem Text="Yes" Value="Y" />
                                            </Items>
                                        </dxe:ASPxComboBox>
                                    </div>
                                    <div id="Row43_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                        Security Access Code:
                                    </div>
                                    <div id="Row43_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                        <asp:TextBox ID="TxtSecAccess" runat="server" Width="144px"></asp:TextBox>
                                    </div>
                                </div>
                                <div id="Row44" class="Row">
                                    <div id="Row44_Col0" class="LFloat_Lable Leftdiv">
                                        <span style="font-size: 10pt; color: #ff0000"></span>BO Category: <span style="font-size: 10pt;
                                            color: #ff0000">**</span></div>
                                    <div id="Row44_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                        <asp:TextBox ID="TxtBoCatg" runat="server" Width="144px"></asp:TextBox>
                                    </div>
                                    <div id="Row44_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                        <span style="font-size: 10pt; color: #ff0000"></span>BO Settlement Planning Flag:
                                        <span style="font-size: 10pt; color: #ff0000">**</span></div>
                                    <div id="Row44_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                        <dxe:ASPxComboBox ID="ComboBOsett" runat="server" ClientInstanceName="cComboBOsett"
                                            EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" SelectedIndex="0"
                                            ValueType="System.String" Width="150px">
                                            <Items>
                                                <dxe:ListEditItem Text="Yes" Value="Y" />
                                                <dxe:ListEditItem Text="No" Value="N" />
                                            </Items>
                                        </dxe:ASPxComboBox>
                                    </div>
                                </div>
                                <div id="Row45" class="Row">
                                    <div id="Row45_Col0" class="LFloat_Lable Leftdiv">
                                        Dividend Bank IFSC Code:
                                    </div>
                                    <div id="Row45_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                        <dxe:ASPxTextBox ID="TxtIFSC" runat="server" ClientInstanceName="cTxtIFSC" MaxLength="15"
                                            Width="150px">
                                        </dxe:ASPxTextBox>
                                    </div>
                                    <div id="Row45_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                        RBI Refference Number:
                                    </div>
                                    <div id="Row45_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                        <dxe:ASPxTextBox ID="TxtRBIRef" runat="server" ClientInstanceName="cTxtRBIRef" MaxLength="30"
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
                                        </dxe:ASPxDateEdit>
                                    </div>
                                    <div id="Row46_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                        SEBI Registration Number:
                                    </div>
                                    <div id="Row46_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                        <dxe:ASPxTextBox ID="TxtSebiReg" runat="server" ClientInstanceName="cTxtSebiReg"
                                            MaxLength="25" Width="150px">
                                        </dxe:ASPxTextBox>
                                    </div>
                                </div>
                                <div id="Row47" class="Row">
                                    <div id="Row47_Col0" class="LFloat_Lable Leftdiv" style="height: 38px">
                                        Beneficiary Tax Deductation Status:
                                    </div>
                                    <div id="Row47_Col1" class="LFloat_Row FontChange" style="height: 38px">
                                        <asp:TextBox ID="TxtBenTaxStatus" runat="server" Width="144px"></asp:TextBox>
                                    </div>
                                    <div id="Row47_Col2" class="LFloat_Lable Leftdiv  LeftMargin" style="height: 38px">
                                        Smart Card Required:
                                    </div>
                                    <div id="Row47_Col3" class="LFloat_Row FontChange" style="height: 38px">
                                        <dxe:ASPxComboBox ID="ComboSmartCrd" runat="server" ClientInstanceName="cComboSmartCrd"
                                            EnableIncrementalFiltering="True" Font-Size="12px" Height="25px" SelectedIndex="0"
                                            ValueType="System.String" Width="150px">
                                            <Items>
                                                <dxe:ListEditItem Text="Yes" Value="Y" />
                                                <dxe:ListEditItem Text="No" Value="N" />
                                            </Items>
                                        </dxe:ASPxComboBox>
                                    </div>
                                </div>
                                <div id="Row48" class="Row">
                                    <div id="Row48_Col2" class="LFloat_Lable Leftdiv  ">
                                        Smart Card Number:
                                    </div>
                                    <div id="Row48_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                        <dxe:ASPxTextBox ID="TxtSmartCrd" runat="server" ClientInstanceName="cTxtSmartCrd"
                                            MaxLength="20" Width="150px">
                                        </dxe:ASPxTextBox>
                                    </div>
                                    <div id="Row48_Col0" class="LFloat_Lable Leftdiv LeftMargin">
                                        Smart Card PIN:
                                    </div>
                                    <div id="Row48_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                        <dxe:ASPxTextBox ID="TxtSmrtCrdPin" runat="server" ClientInstanceName="cTxtSmrtCrdPin"
                                            MaxLength="10" Width="80px">
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
                                                <dxe:ListEditItem Text="Yes" Value="Y" />
                                                <dxe:ListEditItem Text="No" Value="N" />
                                            </Items>
                                        </dxe:ASPxComboBox>
                                    </div>
                                    <div id="Row49_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                        Electronic Confirmation:
                                    </div>
                                    <div id="Row49_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                        <dxe:ASPxTextBox ID="TxtElectronicConfrmatn" runat="server" ClientInstanceName="cTxtElectronicConfrmatn"
                                            MaxLength="1" Width="150px">
                                        </dxe:ASPxTextBox>
                                    </div>
                                </div>
                                <div id="Row50" class="Row">
                                    <div id="Row50_Col0" class="LFloat_Lable Leftdiv">
                                        Dividend Currency:
                                    </div>
                                    <div id="Row50_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                        <asp:TextBox ID="TxtDividndCurncy" runat="server" Width="144px"></asp:TextBox>
                                    </div>
                                    <div id="Row5_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                        Group Code:
                                    </div>
                                    <div id="Row5_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                        <dxe:ASPxTextBox ID="TxtGrpCode" runat="server" ClientInstanceName="cTxtGrpCode"
                                            MaxLength="8" Width="150px">
                                        </dxe:ASPxTextBox>
                                    </div>
                                </div>
                                <div id="Row51" class="Row">
                                    <div id="Row51_Col0" class="LFloat_Lable Leftdiv">
                                        <span style="font-size: 10pt; color: #ff0000"></span>BO Sub Satus: <span style="font-size: 10pt;
                                            color: #ff0000">**</span></div>
                                    <div id="Row51_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                        <asp:TextBox ID="TxtBoSubstatus" runat="server" Width="144px"></asp:TextBox>
                                    </div>
                                    <div id="Row51_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                        Clearing Corporation ID:
                                    </div>
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
                                            MaxLength="8" Width="150px">
                                        </dxe:ASPxTextBox>
                                    </div>
                                    <div id="Row52_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                        Stock Exchange:
                                    </div>
                                    <div id="Row52_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                        <dxe:ASPxTextBox ID="TxtStckExchng" runat="server" ClientInstanceName="cTxtStckExchng"
                                            MaxLength="2" Width="150px">
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
                                                <dxe:ListEditItem Text="Yes" Value="Y" />
                                                <dxe:ListEditItem Text="No" Value="N" />
                                            </Items>
                                        </dxe:ASPxComboBox>
                                    </div>
                                    <div id="Row53_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                        Trading ID:
                                    </div>
                                    <div id="Row53_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                        <dxe:ASPxTextBox ID="TxtTtradngID" runat="server" ClientInstanceName="cTxtTtradngID"
                                            MaxLength="8" Width="150px">
                                        </dxe:ASPxTextBox>
                                    </div>
                                </div>
                                <div id="Row54" class="Row">
                                    <div id="Row54_Col0" class="LFloat_Lable Leftdiv">
                                        <span style="font-size: 10pt; color: #ff0000"></span>BO Statement Cycle Code: <span
                                            style="font-size: 10pt; color: #ff0000">**</span></div>
                                    <div id="Row54_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                        <asp:TextBox ID="TxtBOStatemntCycle" runat="server" Width="144px"></asp:TextBox>
                                    </div>
                                    <div id="Row54_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                        BENF Bank Code:
                                    </div>
                                    <div id="Row54_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                        <dxe:ASPxTextBox ID="TxtBENFBnkCode" runat="server" ClientInstanceName="cTxtBENFBnkCode"
                                            MaxLength="12" Width="150px">
                                        </dxe:ASPxTextBox>
                                    </div>
                                </div>
                                <div id="Row55" class="Row">
                                    <div id="Row55_Col0" class="LFloat_Lable Leftdiv">
                                        BENF Bank Account Type:
                                    </div>
                                    <div id="Row55_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                        <asp:TextBox ID="TxtBENFBnkAcType" runat="server" Width="144px"></asp:TextBox>
                                    </div>
                                    <div id="Row55_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                        BENF Bank Account Number:
                                    </div>
                                    <div id="Row55_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                        <dxe:ASPxTextBox ID="TxtBENFBnkAcNo" runat="server" ClientInstanceName="cTxtBENFBnkAcNo"
                                            MaxLength="20" Width="150px">
                                        </dxe:ASPxTextBox>
                                    </div>
                                </div>
                                <div id="Row56" class="Row">
                                    <div id="Row56_Col0" class="LFloat_Lable Leftdiv">
                                        BENF Bank CCY:
                                    </div>
                                    <div id="Row56_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                        <asp:TextBox ID="TxtBENFBnkCCY" runat="server" Width="144px"></asp:TextBox>
                                    </div>
                                    <div id="Row56_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                        DIVND Bank Account TYPE:
                                    </div>
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
                                            MaxLength="12" Width="150px">
                                        </dxe:ASPxTextBox>
                                    </div>
                                    <div id="Row57_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                        DIVND Account Number:
                                    </div>
                                    <div id="Row57_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                        <dxe:ASPxTextBox ID="TxtDIVNDBnkAcNo" runat="server" ClientInstanceName="cTxtDIVNDBnkAcNo"
                                            MaxLength="20" Width="150px">
                                        </dxe:ASPxTextBox>
                                    </div>
                                </div>
                                <div id="Row58" class="Row">
                                    <div id="Row58_Col0" class="LFloat_Lable Leftdiv">
                                        DIVND Bank CCY:
                                    </div>
                                    <div id="Row58_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                        <asp:TextBox ID="TxtDIVNDBnkCCY" runat="server" Width="144px"></asp:TextBox>
                                    </div>
                                </div>
                                <br class="clear" />
                                <div id="Row580" class="right RightMargin">
                                    <dxe:ASPxButton ID="BtnNext4" runat="server" AccessKey="i" AutoPostBack="False" ClientInstanceName="cBtnNext4"
                                        ToolTip="Proceed To Next" Width="70px" BackColor="Transparent" Height="60px">
                                        <ClientSideEvents Click="function(s, e) {ProductDtlsNext();}" />
                                        <Border BorderColor="Transparent" BorderStyle="None" />
                                        <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_foward.png"
                                            Repeat="NoRepeat" />
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
                                        ClientInstanceName="cBtnEditProductDtls" Height="60px" ToolTip="Edit Entered Data"
                                        Width="70px">
                                        <ClientSideEvents Click="function(s, e) {ProductDtlsEdit();}" />
                                        <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/Edit.jpg"
                                            Repeat="NoRepeat" />
                                        <Border BorderStyle="None" />
                                    </dxe:ASPxButton>
                                </div>
                                <div id="Row581" class="right">
                                    <dxe:ASPxButton ID="BtnPrvs3" runat="server" AutoPostBack="False" ClientInstanceName="cBtnPrvs3"
                                        ToolTip="Back To Previous" Width="70px" BackColor="Transparent" Height="60px">
                                        <ClientSideEvents Click="function(s, e) {ProductDtlsPrevious();}" />
                                        <Border BorderColor="Transparent" BorderStyle="None" />
                                        <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_rewind.png"
                                            Repeat="NoRepeat" />
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
                                <br class="clear" />
                                <div style="font-size: 9pt; width: 800px" id="DivPrdctDtlAlrt" class="Success BtmMargin">
                                    <span style="color: #0066ff">Product Details</span> Submitted Successfully!!!!
                                    <br />
                                    <div class="left" style="margin-right: 2px">
                                        Click</div>
                                    <div class="left" style="width: 26px; height: 26px; background-position: center center;
                                        background-image: url(../../../../CentralData/Images/Small_Edit.jpg); background-repeat: no-repeat;
                                        background-color: transparent;">
                                    </div>
                                    <div class="left" style="margin-left: 2px; margin-right: 2px">
                                        To Edit The Section<span style="color: #0066ff"> Or </span>Click</div>
                                    <div class="left" style="width: 26px; height: 26px; background-position: center center;
                                        background-image: url(../../../../CentralData/Images/Small_blue_foward.png);
                                        background-repeat: no-repeat; background-color: transparent;">
                                    </div>
                                    <div class="left" style="margin-left: 2px">
                                        To Go To the <span style="color: #0066ff">POA Details</span> <span style="color: #0066ff">
                                            Or</span> Click&nbsp;</div>
                                    <div class="left" style="width: 26px; height: 26px; background-position: center center;
                                        background-image: url(../../../../CentralData/Images/Small_blue_rewind.png);
                                        background-repeat: no-repeat; background-color: transparent;">
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
                                <div class="DivHeader" style="width: 100%">
                                    &nbsp; POA DETAILS
                                </div>
                                <div id="Row59" class="Row">
                                    <div id="Row59_Col0" class="LFloat_Lable Leftdiv">
                                        <span style="font-size: 10pt; color: #ff0000"></span>POA ID: <span style="font-size: 10pt;
                                            color: #ff0000">**</span></div>
                                    <div id="Row59_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                        <asp:TextBox ID="TxtPoaId" runat="server" Width="145px"></asp:TextBox>
                                    </div>
                                    <div id="Row59_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                        <span style="font-size: 10pt; color: #ff0000"></span>POA Registration Number: <span
                                            style="font-size: 10pt; color: #ff0000">**</span></div>
                                    <div id="Row59_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                        <dxe:ASPxTextBox ID="TxtPoaRegNo" runat="server" ClientInstanceName="cTxtPoaRegNo"
                                            MaxLength="16" Width="150px">
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
                                                <dxe:ListEditItem Text="All Holders" Value="0" />
                                                <dxe:ListEditItem Text="First Holder" Value="1" />
                                                <dxe:ListEditItem Text="Second Holder" Value="2" />
                                                <dxe:ListEditItem Text="Third Holder" Value="3" />
                                            </Items>
                                        </dxe:ASPxComboBox>
                                    </div>
                                    <div id="Row60_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                        <span style="font-size: 10pt; color: #ff0000"></span>GPA/BPA: <span style="font-size: 10pt;
                                            color: #ff0000">**</span></div>
                                    <div id="Row60_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                        <%--<dxe:ASPxTextBox ID="TxtGpaBpa" runat="server" ClientInstanceName="cTxtGpaBpa" MaxLength="1"
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
                                        </dxe:ASPxDateEdit>
                                    </div>
                                    <div id="Row61_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                        To Date:
                                    </div>
                                    <div id="Row61_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                        <dxe:ASPxDateEdit ID="ToDt" runat="server" ClientInstanceName="cToDt" DateOnError="Today"
                                            EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="150px"
                                            Font-Size="11px" TabIndex="0">
                                        </dxe:ASPxDateEdit>
                                    </div>
                                </div>
                                <div id="Row62" class="Row">
                                    <div id="Row62_Col0" class="LFloat_Lable Leftdiv">
                                        User Field1:
                                    </div>
                                    <div id="Row62_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                        <dxe:ASPxTextBox ID="TxtUsrFld1" runat="server" ClientInstanceName="cTxtUsrFld1"
                                            MaxLength="20" Width="150px">
                                        </dxe:ASPxTextBox>
                                    </div>
                                    <div id="Row62_Col2" class="LFloat_Lable Leftdiv  LeftMargin">
                                        User Field2:
                                    </div>
                                    <div id="Row62_Col3" class="LFloat_Row FontChange" style="height: 25px">
                                        <dxe:ASPxTextBox ID="TxtUsrFld2" runat="server" ClientInstanceName="cTxtUsrFld2"
                                            MaxLength="20" Width="150px">
                                        </dxe:ASPxTextBox>
                                    </div>
                                </div>
                                <div id="Row63" class="Row">
                                    <div id="Row63_Col0" class="LFloat_Lable Leftdiv">
                                        Remarks:
                                    </div>
                                    <div id="Row63_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                        <dxe:ASPxTextBox ID="TxtRemarks" runat="server" ClientInstanceName="cTxtRemarks"
                                            MaxLength="50" Width="150px">
                                        </dxe:ASPxTextBox>
                                    </div>
                                </div>
                                <div id="DivBtnNextPOADtls" class="right RightMargin">
                                    <dxe:ASPxButton ID="BtnNextPOADtls" runat="server" AccessKey="i" AutoPostBack="False"
                                        ClientInstanceName="cBtnNextPOADtls" ToolTip="Proceed To Next" Width="65px" BackColor="Transparent"
                                        Height="60px">
                                        <ClientSideEvents Click="function(s, e) {POANext();}" />
                                        <Border BorderColor="Transparent" BorderStyle="None" />
                                        <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_foward.png"
                                            Repeat="NoRepeat" />
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
                                        ClientInstanceName="cBtnEditPOADtls" Height="60px" ToolTip="Edit Entered Data"
                                        Width="70px">
                                        <ClientSideEvents Click="function(s, e) {POAEdit();}" />
                                        <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/Edit.jpg"
                                            Repeat="NoRepeat" />
                                        <Border BorderStyle="None" />
                                    </dxe:ASPxButton>
                                </div>
                                <div id="Row64" class="right" style="font-size: 12pt; margin-right: 10px;">
                                    <dxe:ASPxButton ID="BtnPrvs4" runat="server" AutoPostBack="False" ClientInstanceName="cBtnPrvs4"
                                        ToolTip="Back To Previous" Width="70px" BackColor="Transparent" Height="60px">
                                        <ClientSideEvents Click="function(s, e) {POAPrevious();}" />
                                        <Border BorderColor="Transparent" BorderStyle="None" />
                                        <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_rewind.png"
                                            Repeat="NoRepeat" />
                                    </dxe:ASPxButton>
                                </div>
                                <div class="right">
                                    <div id="Row59_Col4" class="LFloat_Row" style="margin-right: 10px" onclick="return Row59_Col4_onclick()">
                                        <dxe:ASPxCheckBox ID="CbSkip3" runat="server" ClientInstanceName="cCbSkip3" ToolTip="Skip POA Details"
                                            Checked="False" Text="Skip This Section">
                                            <ClientSideEvents CheckedChanged="OnSkipPOA" />
                                        </dxe:ASPxCheckBox>
                                    </div>
                                </div>
                                <asp:HiddenField ID="TxtPoaId_hidden" runat="server" />
                                <br class="clear" />
                                <div style="font-size: 9pt; width: 862px" id="DivPOAAlrt" class="Success BtmMargin">
                                    <span style="color: #3366ff">POA Details</span> Submitted Successfully!!!!
                                    <br />
                                    <div class="left" style="margin-right: 2px">
                                        Click</div>
                                    <div class="left" style="width: 26px; height: 26px; background-position: center center;
                                        background-image: url(../../../../CentralData/Images/Small_Edit.jpg); background-repeat: no-repeat;
                                        background-color: transparent;">
                                    </div>
                                    <div class="left" style="margin-left: 2px; margin-right: 2px">
                                        To Edit The Section<span style="color: #0066ff"> Or </span>Click</div>
                                    <div class="left" style="width: 26px; height: 26px; background-position: center center;
                                        background-image: url(../../../../CentralData/Images/Small_blue_foward.png);
                                        background-repeat: no-repeat; background-color: transparent;">
                                    </div>
                                    <div class="left" style="margin-left: 2px">
                                        To Go To the <span style="color: #0066ff">Nominee Name And Address</span> <span style="color: #0066ff">
                                            Or</span> Click&nbsp;</div>
                                    <div class="left" style="width: 26px; height: 26px; background-position: center center;
                                        background-image: url(../../../../CentralData/Images/Small_blue_rewind.png);
                                        background-repeat: no-repeat; background-color: transparent;">
                                    </div>
                                    <div class="left" style="margin-left: 2px">
                                        To Go Back To the <span style="color: #0066ff">Product Details</span>..</div>
                                </div>
                            </dxp:panelcontent>
                        </PanelCollection>
                        <ClientSideEvents EndCallback="function (s, e) {CbpPOADtls_EndCallBack();}" />
                    </dxcp:ASPxCallbackPanel>
                </div>
                <div id="Div_NomineeNameAdrs" style="width: 99%">
                    <dxcp:ASPxCallbackPanel ID="CbpNomineeNameAdrs" runat="server" BackColor="Transparent"
                        ClientInstanceName="cCbpNomineeNameAdrs" OnCallback="CbpNomineeNameAdrs_Callback"
                        Width="100%">
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
                                        <dxe:ASPxTextBox ID="TxtTitl4" runat="server" ClientInstanceName="cTxtTitl4" MaxLength="10"
                                            Width="100px">
                                            <ClientSideEvents TextChanged="SkipNominee" />
                                        </dxe:ASPxTextBox>
                                    </div>
                                    <div id="Row66_Col2" class="right" style="margin-right: 10px;">
                                        <span style="font-size: 10pt; color: #ff0000">**</span> <span style="font-size: 8pt">
                                            Mandatory Fields To Be Filled</span>
                                    </div>
                                </div>
                                <div id="Row67" class="Row">
                                    <div id="Row67_Col0" class="LFloat_Lable Leftdiv " style="height: 38px">
                                        <span class="Spanclass"></span>Name Of The Applicant: <span style="font-size: 10pt;
                                            color: #ff0000">**</span>
                                    </div>
                                    <div id="Row67_Col1" class="LFloat_Row " style="height: 38px; text-align: center">
                                        <dxe:ASPxTextBox ID="TxtFName3" runat="server" ClientInstanceName="cTxtFName3" MaxLength="120"
                                            HorizontalAlign="Left" Width="155px">
                                            <ClientSideEvents TextChanged="SkipNominee" />
                                        </dxe:ASPxTextBox>
                                        <span style="font-size: 8pt">[First Name]</span>
                                    </div>
                                    <div id="Row67_Col2" class="LFloat_Row DivName" style="height: 38px">
                                        <dxe:ASPxTextBox ID="TxtMName3" runat="server" ClientInstanceName="cTxtMName3" MaxLength="50"
                                            HorizontalAlign="Left" Width="155px">
                                            <ClientSideEvents TextChanged="SkipNominee" />
                                        </dxe:ASPxTextBox>
                                        <span style="font-size: 8pt">[Middle Name]</span>
                                    </div>
                                    <div id="Row67_Col3" class="LFloat_Row DivName" style="height: 38px">
                                        <dxe:ASPxTextBox ID="TxtLName3" runat="server" ClientInstanceName="cTxtLName3" MaxLength="50"
                                            HorizontalAlign="Left" Width="155px">
                                            <ClientSideEvents TextChanged="SkipNominee" />
                                        </dxe:ASPxTextBox>
                                        <span style="font-size: 8pt">[Last Name]</span>
                                    </div>
                                </div>
                                <div id="Row68" class="Row">
                                    <div id="Row68_Col0" class="LFloat_Lable Leftdiv ">
                                        Suffix:
                                    </div>
                                    <div id="Row68_Col1" class="LFloat_Row" style="height: 25px">
                                        <dxe:ASPxTextBox ID="TxtSufx4" runat="server" ClientInstanceName="cTxtSufx4" MaxLength="10"
                                            Width="100px">
                                            <ClientSideEvents TextChanged="SkipNominee" />
                                        </dxe:ASPxTextBox>
                                    </div>
                                </div>
                                <div id="Row69" class="Row">
                                    <div id="Row69_Col0" class="LFloat_Lable Leftdiv">
                                        <span class="Spanclass"></span>Father's / Spouse Name:
                                    </div>
                                    <div id="Row69_Col1" class="LFloat_Row" style="height: 25px">
                                        <dxe:ASPxTextBox ID="TxtFthrName3" runat="server" ClientInstanceName="cTxtFthrName3"
                                            MaxLength="120" Width="500px">
                                            <ClientSideEvents TextChanged="SkipNominee" />
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
                                        </dxe:ASPxDateEdit>
                                    </div>
                                </div>
                                <div id="Row70" class="Row">
                                    <div id="Row70_Col0" class="LFloat_Lable Leftdiv">
                                        <span class="Spanclass"></span>Address:<span style="font-size: 10pt; color: #ff0000">**</span>&nbsp;
                                    </div>
                                    <div id="Row70_Col1" class="LFloat_Row FontChange BtmMargin" style="width: 56%">
                                        <div style="margin-bottom: 2px">
                                            <span style="font-size: 8pt">[House No]</span>
                                            <dxe:ASPxTextBox ID="TxtNomineeAdrs1" runat="server" ClientInstanceName="cTxtNomineeAdrs1"
                                                MaxLength="120" HorizontalAlign="left" Width="460px">
                                            </dxe:ASPxTextBox>
                                        </div>
                                        <div style="margin-bottom: 2px">
                                            <span style="font-size: 8pt">[Street Name]</span>
                                            <dxe:ASPxTextBox ID="TxtNomineeAdrs2" runat="server" ClientInstanceName="cTxtNomineeAdrs2"
                                                MaxLength="80" HorizontalAlign="left" Width="460px">
                                            </dxe:ASPxTextBox>
                                        </div>
                                        <div style="margin-bottom: 4px">
                                            <span style="font-size: 8pt">[Area Name]</span>
                                            <dxe:ASPxTextBox ID="TxtNomineeAdrs3" runat="server" ClientInstanceName="cTxtNomineeAdrs3"
                                                MaxLength="80" HorizontalAlign="left" Width="460px">
                                            </dxe:ASPxTextBox>
                                        </div>
                                        <div class="left" style="width: 99%">
                                            <div class="left" style="height: 25px">
                                                City/Town/Village :
                                            </div>
                                            <div class="left" style="height: 25px">
                                                <dxe:ASPxComboBox ID="ComboNomineeCity" runat="server" ClientInstanceName="cComboNomineeCity"
                                                    EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                    Width="150px">
                                                </dxe:ASPxComboBox>
                                            </div>
                                            <div class="left" style="height: 25px; margin-left: 10px;">
                                                PinCode :
                                            </div>
                                            <div class="left" style="height: 25px">
                                                <dxe:ASPxTextBox ID="TxtNomineePin" runat="server" ClientInstanceName="cTxtNomineePin"
                                                    MaxLength="10" Width="135px" HorizontalAlign="right">
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
                                                <dxe:ASPxTextBox ID="TxtTelOfc1" runat="server" ClientInstanceName="cTxtTelOfc1"
                                                    MaxLength="11" HorizontalAlign="Right" Width="120px">
                                                    <MaskSettings Mask="<0..99999999999>" />
                                                    <ClientSideEvents LostFocus="function(s, e) {CheckTheLeast(cTxtTelOfc1.GetText());}" />
                                                </dxe:ASPxTextBox>
                                            </div>
                                            <div class="left" style="height: 25px">
                                                &nbsp;Tel(Res) &nbsp;&nbsp; :
                                            </div>
                                            <div class="left" style="height: 25px">
                                                <dxe:ASPxTextBox ID="TxtTelRes1" runat="server" ClientInstanceName="cTxtTelRes1"
                                                    MaxLength="11" HorizontalAlign="Right" Width="120px">
                                                    <MaskSettings Mask="<0..99999999999>" />
                                                    <ClientSideEvents LostFocus="function(s, e) {CheckTheLeast(cTxtTelRes1.GetText());}" />
                                                </dxe:ASPxTextBox>
                                            </div>
                                        </div>
                                        <div class="left" style="width: 99%">
                                            <div class="left" style="height: 25px">
                                                Fax No.&nbsp; :
                                            </div>
                                            <div class="left" style="height: 25px">
                                                <dxe:ASPxTextBox ID="TxtFaxNo1" runat="server" ClientInstanceName="cTxtFaxNo1" HorizontalAlign="Right"
                                                    MaxLength="20" Width="120px">
                                                    <MaskSettings Mask="<0..99999999999>" />
                                                </dxe:ASPxTextBox>
                                            </div>
                                            <div class="left" style="height: 25px">
                                                Mobile No. :
                                            </div>
                                            <div class="left" style="height: 25px">
                                                <dxe:ASPxTextBox ID="TxtMobileNo1" runat="server" ClientInstanceName="cTxtMobileNo1"
                                                    MaxLength="10" HorizontalAlign="Right" Width="120px">
                                                    <MaskSettings Mask="<0..9999999999>" />
                                                    <ClientSideEvents LostFocus="function(s, e) {CheckTheLeast(cTxtMobileNo1.GetText());}" />
                                                </dxe:ASPxTextBox>
                                            </div>
                                        </div>
                                        <div class="left" style="height: 25px">
                                            Email ID:
                                        </div>
                                        <div class="left" style="height: 25px">
                                            <dxe:ASPxTextBox ID="TxtEmailID1" runat="server" ClientInstanceName="cTxtEmailID1"
                                                MaxLength="100" Width="300px">
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
                                            <ClientSideEvents TextChanged="SkipNominee" KeyUp="function(s,e){s.SetText(s.GetValue().toUpperCase());}"
                                                LostFocus="function(s, e) {verifyPanCrdNo(cTxtPan3);}" />
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
                                            <ClientSideEvents TextChanged="SkipNominee" />
                                        </dxe:ASPxTextBox>
                                    </div>
                                </div>
                                <br class="clear" />
                                <div id="DivBtnNextNomineeNameAdrs" class="right RightMargin">
                                    <dxe:ASPxButton ID="BtnNextNomineeNameAdrs" runat="server" AccessKey="i" AutoPostBack="False"
                                        ClientInstanceName="cBtnNextNomineeNameAdrs" ToolTip="Proceed To Next" Width="70px"
                                        BackColor="Transparent" Height="60px">
                                        <ClientSideEvents Click="function(s, e) {NomineeNext();}" />
                                        <Border BorderColor="Transparent" BorderStyle="None" />
                                        <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_foward.png"
                                            Repeat="NoRepeat" />
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
                                        ClientInstanceName="cBtnEditNomineeNameAdrs" Height="60px" ToolTip="Edit Entered Data"
                                        Width="70px">
                                        <ClientSideEvents Click="function(s, e) {NomineeEdit();}" />
                                        <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/Edit.jpg"
                                            Repeat="NoRepeat" />
                                        <Border BorderStyle="None" />
                                    </dxe:ASPxButton>
                                </div>
                                <div id="DivBtnPrvsNomineeNameAdrs" class="right">
                                    <dxe:ASPxButton ID="BtnPrvsNomineeNameAdrs" runat="server" AutoPostBack="False" ClientInstanceName="cBtnPrvs2"
                                        ToolTip="Bck To Previous" Width="70px" BackColor="Transparent" Height="60px">
                                        <ClientSideEvents Click="function(s, e) {NomineePrevious();}" />
                                        <Border BorderColor="Transparent" BorderStyle="None" />
                                        <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_rewind.png"
                                            Repeat="NoRepeat" />
                                    </dxe:ASPxButton>
                                </div>
                                <div class="right">
                                    <div id="divSkipNomineeNameAddress" class="LFloat_Row" style="margin-right: 4px">
                                        <dxe:ASPxCheckBox ID="CbSkip4" runat="server" ClientInstanceName="cCbSkip4" ToolTip="Skip Nominee Name And Address"
                                            Checked="False" Text="Skip This Section">
                                            <ClientSideEvents CheckedChanged="Skip4CheckedChanged" />
                                        </dxe:ASPxCheckBox>
                                    </div>
                                </div>
                                <br class="clear" />
                                <div style="font-size: 9pt; width: 845px" id="DivNomineeNameAdrsAlrt" class="Success BtmMargin">
                                    <span style="color: #0066ff">Nominee Name and Address</span> Submitted Successfully!!!!
                                    <br />
                                    <div class="left" style="margin-right: 2px">
                                        Click</div>
                                    <div class="left" style="width: 26px; height: 26px; background-position: center center;
                                        background-image: url(../../../../CentralData/Images/Small_Edit.jpg); background-repeat: no-repeat;
                                        background-color: transparent;">
                                    </div>
                                    <div class="left" style="margin-left: 2px; margin-right: 2px">
                                        To Edit The Section<span style="color: #0066ff"> Or </span>Click</div>
                                    <div class="left" style="width: 26px; height: 26px; background-position: center center;
                                        background-image: url(../../../../CentralData/Images/Small_blue_foward.png);
                                        background-repeat: no-repeat; background-color: transparent;">
                                    </div>
                                    <div class="left" style="margin-left: 2px">
                                        To Go To the <span style="color: #0066ff">Gurdian Name &amp; Address</span> <span
                                            style="color: #0066ff">Or</span> Click&nbsp;</div>
                                    <div class="left" style="width: 26px; height: 26px; background-position: center center;
                                        background-image: url(../../../../CentralData/Images/Small_blue_rewind.png);
                                        background-repeat: no-repeat; background-color: transparent;">
                                    </div>
                                    <div class="left" style="margin-left: 2px">
                                        To Go Back To the <span style="color: #0066ff">POA Details</span>..</div>
                                </div>
                            </dxp:PanelContent>
                        </PanelCollection>
                        <ClientSideEvents EndCallback="function (s, e) {CbpNomineeNameAdrs_EndCallBack();}" />
                    </dxcp:ASPxCallbackPanel>
                </div>
                <div id="Div_GurdianNameAdrs" style="width: 99%">
                    <dxcp:ASPxCallbackPanel ID="CbpGurdianNameAdrs" runat="server" BackColor="Transparent"
                        ClientInstanceName="cCbpGurdianNameAdrs" OnCallback="CbpGurdianNameAdrs_Callback"
                        Width="100%">
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
                                        <dxe:ASPxTextBox ID="TxtTitl5" runat="server" ClientInstanceName="cTxtTitl5" MaxLength="10"
                                            Width="100px">
                                            <ClientSideEvents TextChanged="SkipGurdian" />
                                        </dxe:ASPxTextBox>
                                    </div>
                                    <div id="Row71_Col2" class="right" style="margin-right: 10px;">
                                        <span style="font-size: 10pt; color: #ff0000">**</span> <span style="font-size: 8pt">
                                            Mandatory Fields To Be Filled</span>
                                    </div>
                                </div>
                                <div id="Row72" class="Row">
                                    <div id="Row72_Col0" class="LFloat_Lable Leftdiv " style="height: 38px">
                                        <span class="Spanclass"></span>Name Of The Applicant: <span style="font-size: 10pt;
                                            color: #ff0000">**</span>
                                    </div>
                                    <div id="Row72_Col1" class="LFloat_Row " style="height: 38px; text-align: center">
                                        <dxe:ASPxTextBox ID="TxtFName4" runat="server" ClientInstanceName="cTxtFName4" MaxLength="120"
                                            HorizontalAlign="Left" Width="155px">
                                            <ClientSideEvents TextChanged="SkipGurdian" />
                                        </dxe:ASPxTextBox>
                                        <span style="font-size: 8pt">[First Name]</span>
                                    </div>
                                    <div id="Row72_Col2" class="LFloat_Row DivName" style="height: 38px">
                                        <dxe:ASPxTextBox ID="TxtMName4" runat="server" ClientInstanceName="cTxtMName4" MaxLength="50"
                                            HorizontalAlign="Left" Width="155px">
                                            <ClientSideEvents TextChanged="SkipGurdian" />
                                        </dxe:ASPxTextBox>
                                        <span style="font-size: 8pt">[Middle Name]</span>
                                    </div>
                                    <div id="Row72_Col3" class="LFloat_Row DivName" style="height: 38px">
                                        <dxe:ASPxTextBox ID="TxtLName4" runat="server" ClientInstanceName="cTxtLName4" MaxLength="50"
                                            HorizontalAlign="Left" Width="155px">
                                            <ClientSideEvents TextChanged="SkipGurdian" />
                                        </dxe:ASPxTextBox>
                                        <span style="font-size: 8pt">[Last Name]</span>
                                    </div>
                                </div>
                                <div id="Row73" class="Row">
                                    <div id="Row73_Col0" class="LFloat_Lable Leftdiv ">
                                        Suffix:
                                    </div>
                                    <div id="Row73_Col1" class="LFloat_Row" style="height: 25px">
                                        <dxe:ASPxTextBox ID="TxtSufx5" runat="server" ClientInstanceName="cTxtSufx5" MaxLength="10"
                                            Width="100px">
                                            <ClientSideEvents TextChanged="SkipGurdian" />
                                        </dxe:ASPxTextBox>
                                    </div>
                                </div>
                                <div id="Row74" class="Row">
                                    <div id="Row74_Col0" class="LFloat_Lable Leftdiv">
                                        <span class="Spanclass"></span>Father's / Spouse Name:
                                    </div>
                                    <div id="Row74_Col1" class="LFloat_Row" style="height: 25px">
                                        <dxe:ASPxTextBox ID="TxtFthrName4" runat="server" ClientInstanceName="cTxtFthrName4"
                                            MaxLength="120" Width="500px">
                                            <ClientSideEvents TextChanged="SkipGurdian" />
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
                                        </dxe:ASPxDateEdit>
                                    </div>
                                </div>
                                <div id="Row75" class="Row">
                                    <div id="Row75_Col0" class="LFloat_Lable Leftdiv">
                                        <span class="Spanclass"></span>Address:<span style="font-size: 10pt; color: #ff0000">**</span>&nbsp;
                                    </div>
                                    <div id="Row75_Col1" class="LFloat_Row FontChange BtmMargin" style="width: 57%">
                                        <div style="margin-bottom: 2px">
                                            <span style="font-size: 8pt">[House No]</span>
                                            <dxe:ASPxTextBox ID="TxtGurdianAdrs1" runat="server" ClientInstanceName="cTxtGurdianAdrs1"
                                                MaxLength="120" HorizontalAlign="left" Width="460px">
                                            </dxe:ASPxTextBox>
                                        </div>
                                        <div style="margin-bottom: 2px">
                                            <span style="font-size: 8pt">[Street Name]</span>
                                            <dxe:ASPxTextBox ID="TxtGurdianAdrs2" runat="server" ClientInstanceName="cTxtGurdianAdrs2"
                                                MaxLength="80" HorizontalAlign="left" Width="460px">
                                            </dxe:ASPxTextBox>
                                        </div>
                                        <div style="margin-bottom: 4px">
                                            <span style="font-size: 8pt">[Area Name]</span>
                                            <dxe:ASPxTextBox ID="TxtGurdianAdrs3" runat="server" ClientInstanceName="cTxtGurdianAdrs3"
                                                MaxLength="80" HorizontalAlign="left" Width="460px">
                                            </dxe:ASPxTextBox>
                                        </div>
                                        <div class="left" style="width: 99%">
                                            <div class="left" style="height: 25px">
                                                City/Town/Village :
                                            </div>
                                            <div class="left" style="height: 25px">
                                                <dxe:ASPxComboBox ID="ComboGurdianCity" runat="server" ClientInstanceName="cComboGurdianCity"
                                                    EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                    Width="150px">
                                                </dxe:ASPxComboBox>
                                            </div>
                                            <div class="left" style="height: 25px; margin-left: 10px;">
                                                PinCode :
                                            </div>
                                            <div class="left" style="height: 25px;">
                                                <dxe:ASPxTextBox ID="TxtGurdianPin" runat="server" ClientInstanceName="cTxtGurdianPin"
                                                    MaxLength="10" Width="140px" HorizontalAlign="right">
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
                                                <dxe:ASPxTextBox ID="TxtTelOfc2" runat="server" ClientInstanceName="cTxtTelOfc2"
                                                    MaxLength="11" HorizontalAlign="Right" Width="120px">
                                                    <MaskSettings Mask="<0..99999999999>" />
                                                    <ClientSideEvents LostFocus="function(s, e) {CheckTheLeast(cTxtTelOfc.GetText());}" />
                                                </dxe:ASPxTextBox>
                                            </div>
                                            <div class="left" style="height: 25px">
                                                &nbsp;Tel(Res) &nbsp;&nbsp; :
                                            </div>
                                            <div class="left" style="height: 25px">
                                                <dxe:ASPxTextBox ID="TxtTelRes2" runat="server" ClientInstanceName="cTxtTelRes2"
                                                    MaxLength="11" HorizontalAlign="Right" Width="120px">
                                                    <MaskSettings Mask="<0..99999999999>" />
                                                    <ClientSideEvents LostFocus="function(s, e) {CheckTheLeast(cTxtTelRes.GetText());}" />
                                                </dxe:ASPxTextBox>
                                            </div>
                                        </div>
                                        <div class="left" style="width: 99%">
                                            <div class="left" style="height: 25px">
                                                Fax No.&nbsp; :
                                            </div>
                                            <div class="left" style="height: 25px">
                                                <dxe:ASPxTextBox ID="TxtFaxNo2" runat="server" ClientInstanceName="cTxtFaxNo2" MaxLength="20"
                                                    HorizontalAlign="Right" Width="120px">
                                                    <MaskSettings Mask="<0..99999999999>" />
                                                </dxe:ASPxTextBox>
                                            </div>
                                            <div class="left" style="height: 25px">
                                                Mobile No. :
                                            </div>
                                            <div class="left" style="height: 25px">
                                                <dxe:ASPxTextBox ID="TxtMobileNo2" runat="server" ClientInstanceName="cTxtMobileNo2"
                                                    MaxLength="10" HorizontalAlign="Right" Width="120px">
                                                    <MaskSettings Mask="<0..9999999999>" />
                                                    <ClientSideEvents LostFocus="function(s, e) {CheckTheLeast(cTxtMobileNo.GetText());}" />
                                                </dxe:ASPxTextBox>
                                            </div>
                                        </div>
                                        <div class="left" style="height: 25px">
                                            Email ID:
                                        </div>
                                        <div class="left" style="height: 25px">
                                            <dxe:ASPxTextBox ID="TxtEmailID2" runat="server" ClientInstanceName="cTxtEmailID2"
                                                MaxLength="100" Width="300px">
                                                <ClientSideEvents LostFocus="function(s, e) {verifyEmail(cTxtEmlID);}" />
                                            </dxe:ASPxTextBox>
                                        </div>
                                    </div>
                                </div>
                                <div id="Row752" class="Row">
                                    <div id="Row752_Col0" class="LFloat_Lable Leftdiv" style="height: 35px">
                                        <span class="Spanclass"></span>PAN / GIR: <span style="font-size: 10pt; color: #ff0000">
                                            **</span>
                                    </div>
                                    <div id="Row752_Col1" class="LFloat_Row FontChange" style="height: 35px">
                                        <dxe:ASPxTextBox ID="TxtPan4" runat="server" ClientInstanceName="cTxtPan4" MaxLength="10"
                                            Width="170px">
                                            <ClientSideEvents TextChanged="SkipGurdian" KeyUp="function(s,e){s.SetText(s.GetValue().toUpperCase());}"
                                                LostFocus="function(s, e) {verifyPanCrdNo(cTxtPan4);}" />
                                        </dxe:ASPxTextBox>
                                    </div>
                                </div>
                                <div id="Row753" class="Row">
                                    <div id="Row753_Col0" class="LFloat_Lable Leftdiv" style="height: 37px">
                                        Unique Identification Number(UID) / Adhaar (If Any):</div>
                                    <div id="Row753_Col1" class="LFloat_Row" style="height: 37px">
                                        <dxe:ASPxTextBox ID="TxtUIN5" runat="server" ClientInstanceName="cTxtUIN5" MaxLength="12"
                                            Width="170px">
                                            <ClientSideEvents TextChanged="SkipGurdian" />
                                        </dxe:ASPxTextBox>
                                    </div>
                                </div>
                                <div id="Row754" class="Row">
                                    <div id="Row754_Col0" class="LFloat_Lable Leftdiv" style="height: 37px">
                                        IT Circle/Ward/District:</div>
                                    <div id="Row754_Col1" class="LFloat_Row" style="height: 37px">
                                        <dxe:ASPxTextBox ID="TxtDistrict5" runat="server" ClientInstanceName="cTxtDistrict5"
                                            MaxLength="12" Width="170px">
                                            <ClientSideEvents TextChanged="SkipGurdian" />
                                        </dxe:ASPxTextBox>
                                    </div>
                                </div>
                                <br class="clear" />
                                <div id="DivBtnNextGurdianNameAdrs" class="right RightMargin">
                                    <dxe:ASPxButton ID="BtnNextGurdianNameAdrs" runat="server" AccessKey="i" AutoPostBack="False"
                                        ClientInstanceName="cBtnNextGurdianNameAdrs" ToolTip="Proceed To Next" Width="70px"
                                        BackColor="Transparent" Height="60px">
                                        <ClientSideEvents Click="function(s, e) {GurdianNext();}" />
                                        <Border BorderColor="Transparent" BorderStyle="None" />
                                        <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_foward.png"
                                            Repeat="NoRepeat" />
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
                                        ClientInstanceName="cBtnEditGurdianNameAdrs" Height="60px" ToolTip="Edit Entered Data"
                                        Width="70px">
                                        <ClientSideEvents Click="function(s, e) {GurdianEdit();}" />
                                        <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/Edit.jpg"
                                            Repeat="NoRepeat" />
                                        <Border BorderStyle="None" />
                                    </dxe:ASPxButton>
                                </div>
                                <div id="DivBtnPrvsGurdianNameAdrs" class="right">
                                    <dxe:ASPxButton ID="BtnPrvsGurdianNameAdrs" runat="server" AutoPostBack="False" ClientInstanceName="cBtnPrvs2"
                                        ToolTip="Bck To Previous" Width="70px" BackColor="Transparent" Height="60px">
                                        <ClientSideEvents Click="function(s, e) {GurdianPrevious();}" />
                                        <Border BorderColor="Transparent" BorderStyle="None" />
                                        <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_rewind.png"
                                            Repeat="NoRepeat" />
                                    </dxe:ASPxButton>
                                </div>
                                <div class="right">
                                    <div id="divSkipGurdianNameAddress" class="LFloat_Row" style="margin-right: 4px">
                                        <dxe:ASPxCheckBox ID="CbSkip5" runat="server" ClientInstanceName="cCbSkip5" ToolTip="Skip Gurdian Name and Address"
                                            Checked="False" Text="Skip This Section">
                                            <ClientSideEvents CheckedChanged="Skip5CheckedChanged" />
                                        </dxe:ASPxCheckBox>
                                    </div>
                                </div>
                                <br class="clear" />
                                <div style="font-size: 9pt; width: 876px" id="DivGurdianNameAdrsAlrt" class="Success BtmMargin">
                                    <span style="color: #0066ff">Gurdian Name and Address</span> Submitted Successfully!!!!
                                    <br />
                                    <div class="left" style="margin-right: 2px">
                                        Click</div>
                                    <div class="left" style="width: 26px; height: 26px; background-position: center center;
                                        background-image: url(../../../../CentralData/Images/Small_Edit.jpg); background-repeat: no-repeat;
                                        background-color: transparent;">
                                    </div>
                                    <div class="left" style="margin-left: 2px; margin-right: 2px">
                                        To Edit The Section<span style="color: #0066ff"> Or </span>Click</div>
                                    <div class="left" style="width: 26px; height: 26px; background-position: center center;
                                        background-image: url(../../../../CentralData/Images/Small_blue_foward.png);
                                        background-repeat: no-repeat; background-color: transparent;">
                                    </div>
                                    <div class="left" style="margin-left: 2px">
                                        To Go To the <span style="color: #0066ff">Nominee Gurdian Name &amp; Address</span>
                                        <span style="color: #0066ff">Or</span> Click&nbsp;</div>
                                    <div class="left" style="width: 26px; height: 26px; background-position: center center;
                                        background-image: url(../../../../CentralData/Images/Small_blue_rewind.png);
                                        background-repeat: no-repeat; background-color: transparent;">
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
                                        <dxe:ASPxTextBox ID="TxtTitl6" runat="server" ClientInstanceName="cTxtTitl6" MaxLength="10"
                                            Width="100px">
                                            <ClientSideEvents TextChanged="SkipNomGurdian" />
                                        </dxe:ASPxTextBox>
                                    </div>
                                    <div id="Row76_Col2" class="right" style="margin-right: 10px;">
                                        <span style="font-size: 10pt; color: #ff0000">**</span> <span style="font-size: 8pt">
                                            Mandatory Fields To Be Filled</span>
                                    </div>
                                </div>
                                <div id="Row77" class="Row">
                                    <div id="Row77_Col0" class="LFloat_Lable Leftdiv " style="height: 38px">
                                        <span class="Spanclass"></span>Name Of The Applicant: <span style="font-size: 10pt;
                                            color: #ff0000">**</span>
                                    </div>
                                    <div id="Row77_Col1" class="LFloat_Row " style="height: 38px; text-align: center">
                                        <dxe:ASPxTextBox ID="TxtFName5" runat="server" ClientInstanceName="cTxtFName5" MaxLength="120"
                                            HorizontalAlign="Left" Width="155px">
                                            <ClientSideEvents TextChanged="SkipNomGurdian" />
                                        </dxe:ASPxTextBox>
                                        <span style="font-size: 8pt">[First Name]</span>
                                    </div>
                                    <div id="Row77_Col2" class="LFloat_Row DivName" style="height: 38px">
                                        <dxe:ASPxTextBox ID="TxtMName5" runat="server" ClientInstanceName="cTxtMName5" MaxLength="50"
                                            HorizontalAlign="Left" Width="155px">
                                            <ClientSideEvents TextChanged="SkipNomGurdian" />
                                        </dxe:ASPxTextBox>
                                        <span style="font-size: 8pt">[Middle Name]</span>
                                    </div>
                                    <div id="Row77_Col3" class="LFloat_Row DivName" style="height: 38px">
                                        <dxe:ASPxTextBox ID="TxtLName5" runat="server" ClientInstanceName="cTxtLName5" MaxLength="50"
                                            HorizontalAlign="Left" Width="155px">
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
                                        <dxe:ASPxTextBox ID="TxtSufx6" runat="server" ClientInstanceName="cTxtSufx6" MaxLength="10"
                                            Width="100px">
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
                                            MaxLength="120" Width="500px">
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
                                                MaxLength="120" HorizontalAlign="left" Width="460px">
                                            </dxe:ASPxTextBox>
                                        </div>
                                        <div style="margin-bottom: 2px">
                                            <span style="font-size: 8pt">[Street Name]</span>
                                            <dxe:ASPxTextBox ID="TxtNomGurdianAdrs2" runat="server" ClientInstanceName="cTxtNomGurdianAdrs2"
                                                MaxLength="80" HorizontalAlign="left" Width="460px">
                                            </dxe:ASPxTextBox>
                                        </div>
                                        <div style="margin-bottom: 4px">
                                            <span style="font-size: 8pt">[Area Name]</span>
                                            <dxe:ASPxTextBox ID="TxtNomGurdianAdrs3" runat="server" ClientInstanceName="cTxtNomGurdianAdrs3"
                                                MaxLength="80" HorizontalAlign="left" Width="460px">
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
                                                </dxe:ASPxComboBox>
                                            </div>
                                            <div class="left" style="height: 25px; margin-left: 10px;">
                                                PinCode :
                                            </div>
                                            <div class="left" style="height: 25px;">
                                                <dxe:ASPxTextBox ID="TxtNomGurdianPin" runat="server" ClientInstanceName="cTxtNomGurdianPin"
                                                    MaxLength="10" Width="140px" HorizontalAlign="right">
                                                    <MaskSettings Mask="<0..999999999>" />
                                                </dxe:ASPxTextBox>
                                            </div>
                                        </div>
                                        <div class="left" style="height: 30px">
                                            <dxe:ASPxComboBox ID="ComboNomGurdianState" runat="server" ClientInstanceName="cComboNomGurdianState"
                                                EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                Width="150px">
                                                <DropDownButton Text="State">
                                                </DropDownButton>
                                            </dxe:ASPxComboBox>
                                        </div>
                                        <div class="left" style="height: 30px; margin-left: 4px;">
                                            <dxe:ASPxComboBox ID="ComboNomGurdianCountry" runat="server" ClientInstanceName="cComboNomGurdianCountry"
                                                EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                Width="150px">
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
                                                    <MaskSettings Mask="<0..99999999999>" />
                                                    <ClientSideEvents LostFocus="function(s, e) {CheckTheLeast(cTxtTelOfc3.GetText());}" />
                                                </dxe:ASPxTextBox>
                                            </div>
                                            <div class="left" style="height: 25px">
                                                &nbsp;Tel(Res) &nbsp;&nbsp; :
                                            </div>
                                            <div class="left" style="height: 25px">
                                                <dxe:ASPxTextBox ID="TxtTelRes3" runat="server" ClientInstanceName="cTxtTelRes3"
                                                    MaxLength="11" HorizontalAlign="Right" Width="120px">
                                                    <MaskSettings Mask="<0..99999999999>" />
                                                    <ClientSideEvents LostFocus="function(s, e) {CheckTheLeast(cTxtTelRes3.GetText());}" />
                                                </dxe:ASPxTextBox>
                                            </div>
                                        </div>
                                        <div class="left" style="width: 99%">
                                            <div class="left" style="height: 25px">
                                                Fax No.&nbsp; :
                                            </div>
                                            <div class="left" style="height: 25px">
                                                <dxe:ASPxTextBox ID="TxtFaxNo3" runat="server" ClientInstanceName="cTxtFaxNo3" MaxLength="20"
                                                    HorizontalAlign="Right" Width="120px">
                                                    <MaskSettings Mask="<0..99999999999>" />
                                                </dxe:ASPxTextBox>
                                            </div>
                                            <div class="left" style="height: 25px">
                                                Mobile No. :
                                            </div>
                                            <div class="left" style="height: 25px">
                                                <dxe:ASPxTextBox ID="TxtMobileNo3" runat="server" ClientInstanceName="cTxtMobileNo3"
                                                    MaxLength="10" HorizontalAlign="Right" Width="120px">
                                                    <MaskSettings Mask="<0..9999999999>" />
                                                    <ClientSideEvents LostFocus="function(s, e) {CheckTheLeast(cTxtMobileNo3.GetText());}" />
                                                </dxe:ASPxTextBox>
                                            </div>
                                        </div>
                                        <div class="left" style="height: 25px">
                                            Email ID:
                                        </div>
                                        <div class="left" style="height: 25px">
                                            <dxe:ASPxTextBox ID="TxtEmailID3" runat="server" ClientInstanceName="cTxtEmailID3"
                                                MaxLength="100" Width="300px">
                                                <ClientSideEvents LostFocus="function(s, e) {verifyEmail(cTxtEmailID3);}" />
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
                                        </dxe:ASPxTextBox>
                                    </div>
                                </div>
                                <div id="Row804" class="Row">
                                    <div id="Row804_Col0" class="LFloat_Lable Leftdiv" style="height: 37px">
                                        IT Circle/Ward/District:</div>
                                    <div id="Row804_Col1" class="LFloat_Row" style="height: 37px">
                                        <dxe:ASPxTextBox ID="TxtDistrict6" runat="server" ClientInstanceName="cTxtDistrict6"
                                            MaxLength="12" Width="170px">
                                            <ClientSideEvents TextChanged="SkipThirdHolder" />
                                        </dxe:ASPxTextBox>
                                    </div>
                                </div>
                                <br class="clear" />
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
                                        <Border BorderColor="Transparent" BorderStyle="None" />
                                        <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_rewind.png"
                                            Repeat="NoRepeat" />
                                    </dxe:ASPxButton>
                                </div>
                                <div class="right">
                                    <div id="divSkipNomineeGurdianNameAddress" class="LFloat_Row" style="margin-right: 4px">
                                        <dxe:ASPxCheckBox ID="CbSkip6" runat="server" ClientInstanceName="cCbSkip6" ToolTip="Skip Nominee Gurdian Name and Address"
                                            Checked="False" Text="Skip This Section">
                                            <ClientSideEvents CheckedChanged="Skip6CheckedChanged" />
                                        </dxe:ASPxCheckBox>
                                    </div>
                                </div>
                                <br class="clear" />
                                <div style="font-size: 9pt; width: 870px" id="DivNomGurdianAlrt" class="Success BtmMargin">
                                    <span style="color: #0066ff">Nominee Gurdian Name and Address</span> Submitted Successfully!!!!
                                    <br />
                                    <div class="left" style="margin-right: 2px">
                                        Click</div>
                                    <div class="left" style="width: 26px; height: 26px; background-position: center center;
                                        background-image: url(../../../../CentralData/Images/Small_Edit.jpg); background-repeat: no-repeat;
                                        background-color: transparent;">
                                    </div>
                                    <div class="left" style="margin-left: 2px; margin-right: 2px">
                                        To Edit The Section<span style="color: #0066ff"> Or </span>Click</div>
                                    <div class="left" style="width: 26px; height: 26px; background-position: center center;
                                        background-image: url(../../../../CentralData/Images/Small_blue_rewind.png);
                                        background-repeat: no-repeat; background-color: transparent;">
                                    </div>
                                    <div class="left" style="margin-left: 2px; width: 579px;">
                                        To Go Back To the <span style="color: #0066cc">Gurdian Name &amp; Address</span>..</div>
                                </div>
                            </dxp:PanelContent>
                        </PanelCollection>
                        <ClientSideEvents EndCallback="function (s, e) {CbpNomGurdianNameAdrs_EndCallBack();}" />
                    </dxcp:ASPxCallbackPanel>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
