<%@ page language="C#" autoeventwireup="true" inherits="KRA_Pages_RegistrationForm, App_Web_5dnhcjdf" %>

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
   

    <script type="text/javascript" src="../CentralData/JSScript/jquery-1.3.2.js"></script>

    <script type="text/javascript" src="../CentralData/JSScript/init.js"></script>

    <script type="text/javascript" src="../CentralData/JSScript/GenericJScript.js"></script>

    <script type="text/javascript" src="../CentralData/JSScript/GenericAjaxList.js"></script>

    <link type="text/css" href="../CentralData/CSS/GenericAjaxStyle.css" rel="Stylesheet" />
    <link type="text/css" href="../CentralData/CSS/GenericCss.css" rel="Stylesheet" />
    <style type="text/css">
        .Header
        {
            height: 20px;
            padding-left: 10px;
            padding-right: 3px;
            background-image: url('../images/EHeaderBack.gif');
            background-repeat: repeat-x;
            background-position: bottom;
            margin-bottom: 5px;
            text-align: center;
            font-weight: bold;
            color: #000099;
        }
        .Leftdiv
        {
            width: 190px;
            height: 25px;
            font-size: 12px;
        }
        .DivHeader
        {
            background-color: #B8B8B8;
            width: 99%;
            font-family: Calibri;
            font-weight: bold;
            padding-left: 10px;
            margin-bottom: 4px;
        }
        .Spanclass
        {
            color: Red;
            font-size: 14px;
        }
        .DivName
        {
            height: 25px;
            text-align: center;
            margin-left: 10px;
        }
        .frmleftContent
        {
            float: left;
            margin: 2px;
            padding: 2px;
            height: 26px;
            border: solid 1px #D1E0F3;
            font-size: 14px;
        }
        .BtmMargin
        {
            margin-bottom: 10px;
        }
        .TopMargin
        {
            margin-top: 10px;
        }
        .LeftMargin
        {
            margin-left: 10px;
        }
        .FontChange
        {
            font-family: Arial;
            font-size: 9pt;
        }
        .Box_TotalRecord
        {
            margin-left: 5px;
            z-index: 50;
            position: absolute;
            overflow-x: hidden;
            overflow-y: hidden;
            width: 1080px;
            height: 35px;
            padding: 2px 20px 2px 2px;
            background-color: #aaa;
            opacity: 0.9;
            filter: alpha(opacity=90);
        }
        .Box_closeTotal
        {
            margin-left: 20px;
            z-index: 55;
            position: fixed;
            width: 16px;
            height: 20px;
            text-align: center;
            color: #000;
            font-weight: bold;
            background: #F4A460;
            border: solid 2px #ccc;
            border-bottom: none;
        }
        .cellTotHeader
        {
            padding: 2px;
            height: 22px;
            border: solid .1pt #F4A460;
            font-size: 11px;
            background-color: #DDD;
            font-weight: bold;
            text-align: center;
        }
    </style>

    <script type="text/javascript" language="javascript">
        //Global Variable
        FieldName = '';
        var ClientType = '';
        var Cmn = '';
        var Identity = '';
        var Address = '';
        var OtherDtls = '';
        var CurrentPg = 1;
        var currentDateToset = new Date('<%=Session["ServerDate"] %>');
        var GvAlrt = '';
        var ExistingClientBind = '';
        var EntryType = '';
        var ApplicatnNo = '';
        var KraXMLPath = '';
        var Clicked = '';
        var show = '';
        var ntshow = '';
        var alertShow = '';
        //End



        ////////////////////////New DevExpress validation///////////////////////////////////
        function DevE_Control_Empty(obj, ErrMsg) {

            if (obj.GetText().trim() == "") {
                alert(ErrMsg);
                obj.Focus();
                return false;
            }
            else {
                return true;
            }
        }
        function DevE_MaskedControl_Empty(obj, ErrMsg) {
            if (obj.GetValue() == '0') {
                alert(ErrMsg);
                obj.Focus();
                return false;
            }
            else {
                return true;
            }
        }
        function DevE_Control_CompareText(obj, CompareText, ErrMsg) {
            var TextToCompare = '';
            var WhatReturn = 'true';
            for (var i = 0; i < CompareText.split(',').length; i++) {
                TextToCompare = CompareText.split(',')[i];
                if (obj.GetValue().trim() == TextToCompare) {
                    alert(ErrMsg);
                    obj.Focus();
                    WhatReturn = 'false';
                }
            }
            if (WhatReturn == 'false')
                return false;
            else
                return true;
        }
        function DevE_Control_IsChecked(obj) {
            return obj.GetChecked();
        }
        //These Method When Compare Any Control and Focus On Other
        function DevE_Control_Empty_FocusOtherCntrl(obj, FcsObj, ErrMsg) {
            if (obj.GetValue() == null) {
                alert(ErrMsg);
                FcsObj.Focus();
                return false;
            }
            else {
                return true;
            }
        }
        function DevE_Control_CompareText_FocusOtherCntrl(obj, CompareText, FcsObj, ErrMsg) {
            var TextToCompare = '';
            var WhatReturn = 'true';
            for (var i = 0; i < CompareText.split(',').length; i++) {
                TextToCompare = CompareText.split(',')[i];
                if (obj.GetValue().trim() == TextToCompare) {
                    alert(ErrMsg);
                    FcsObj.Focus();
                    WhatReturn = 'false';
                }
            }
            if (WhatReturn == 'false')
                return false;
            else
                return true;
        }
        function verifyEmail(Obj) {
            var status = false;
            var emailRegEx = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i;
            if (Obj.GetValue().search(emailRegEx) == -1) {
                alert("Please enter a valid email address.");
                Obj.Focus();
            }
            else {
                status = true;
            }
            return status;
        }

        function SetinnerHTML(obj, Value) {
            document.getElementById(obj).innerHTML = Value;
        }

        function DevE_WaterMark_Focus(objname, waterMarkText) {
            if (objname.GetText() == waterMarkText) {
                objname.SetText("");
                //objname.className = "NormalTextBox";
            }
        }
        function DevE_WaterMark_Blur(objname, waterMarkText) {

            if (objname.GetText() == "") {
                objname.SetText(waterMarkText);
                //objname.className = "WaterMarkedTextBox";
            }

        }
        ///////////////////////////////////End Of DevExpressValidation///////////////////////////////////



        function PageLoad() { 
            HideShow('Div_Identity', 'H');
            HideShow('Row27', 'H');
            HideShow('div_othr', 'H');
            HideShow('divOthrStatus', 'H');
            HideShow('DivOthrAdrsPrf', 'H');
            HideShow('DivOthrAdrsPrfP', 'H');
            HideShow('DivOthrOccu', 'H');
            HideShow('divOthrID', 'H');
            HideShow('divIdentityNumber', 'S');
            HideShow('showFilter', 'H');
            PopUpRow1.style.visibility = 'hidden';
            PopUpRow2.style.visibility = 'hidden';
            PopUpRow3.style.visibility = 'hidden';
            HideShow('DivBtnEditCmn', 'H');
            HideShow('DivBtnEditIdntty', 'H');
            HideShow('DivBtnEditAdrs', 'H');
            HideShow('DivSaved', 'H');
            HideShow('divOthrDtlEdit', 'H');
            HideShow('DivApliNoAlert', 'H');
            HideShow('DivIdnttyAlrt', 'H');
            HideShow('DivAdrsAlrt', 'H');
            HideShow('DivOthrDtlsAlrt', 'H');
            CallServer("CallAjax-Branch", "");
            HideShow('DivStateOthr', 'H');
            HideShow('DivStateOthrP', 'H');
            HideShow('DivStateCHOthr', 'H');
            HideShow('DivPanExempt', 'H');
            HideShow('Row25_Col1_row4', 'H');
            HideShow('Div_GVCHrecord', 'H');
            //HideShow('DivStateCHOthrE','H');
            HideShow('Row09', 'H');
            HideShow('Div_NetWorth', 'H');
            HideShow('btnOpen', 'S');
            HideShow('btnClose', 'H');
            HideShow('divForOverView', 'H');
            if (CcmbJDAddressType.GetValue() == "3") {
                document.getElementById("dvJDAddress").style.display = "block";
            }
            else {
                document.getElementById("dvJDAddress").style.display = "none";
            }
            var TINNo = CtxtTIN.GetValue();
            if (TINNo != "" || TINNo!=null) {
                document.getElementById("dvTINCountry").style.display = "block";
            }
        }
        function Fn_CtxtTINTextChanged() {
            var TINNo = CtxtTIN.GetValue(); 
            if (TINNo != "") { 
                document.getElementById("dvTINCountry").style.display = "block";
            }
            else {
                document.getElementById("dvTINCountry").style.display = "none";
            }
        }
        function CallAjax(obj1, obj2, obj3, Query) {
            var CombinedQuery = new String(Query);
            var GenericAjaxListAspxPath = '../CentralData/Pages/GenericAjaxList.aspx';
            ajax_showOptions(obj1, obj2, obj3, replaceChars(CombinedQuery), 'Main', GenericAjaxListAspxPath);
        }

        function btnCloseTotal_click() {
            HideShow('btnClose', 'H');
            HideShow('divForOverView', 'H');
            HideShow('btnOpen', 'S');
        }
        function btnOpenTotal_click() {
            HideShow('btnOpen', 'H');
            HideShow('btnClose', 'S');
            HideShow('divForOverView', 'S');


            if (document.getElementById('Div_Common').style.display == 'inline') {
                SetStyle("Div_Common_Show", "BGColor", "#F4A460");
                SetStyle("Div_Identity_Show", "BGColor", "#DDD");
                SetStyle("Div_Address_Show", "BGColor", "#DDD");
                SetStyle("Div_Other_Show", "BGColor", "#DDD");
            }
            if (document.getElementById('Accordion1Content').style.display == 'inline') {
                SetStyle("Div_Identity_Show", "BGColor", "#F4A460");
                SetStyle("Div_Common_Show", "BGColor", "#DDD");
                SetStyle("Div_Address_Show", "BGColor", "#DDD");
                SetStyle("Div_Other_Show", "BGColor", "#DDD");
            }
            if (document.getElementById('Accordion2Content').style.display == 'inline') {
                SetStyle("Div_Address_Show", "BGColor", "#F4A460");
                SetStyle("Div_Common_Show", "BGColor", "#DDD");
                SetStyle("Div_Identity_Show", "BGColor", "#DDD");
                SetStyle("Div_Other_Show", "BGColor", "#DDD");
            }
            if (document.getElementById('Accordion3Content').style.display == 'inline') {
                SetStyle("Div_Other_Show", "BGColor", "#F4A460");
                SetStyle("Div_Common_Show", "BGColor", "#DDD");
                SetStyle("Div_Identity_Show", "BGColor", "#DDD");
                SetStyle("Div_Address_Show", "BGColor", "#DDD");
            }

            


        }

        function OnCheckedShowHide(rdBtn, objShowHide) {

            if (rdBtn == true) {
                HideShow(objShowHide, 'S');
            }
            else {
                HideShow(objShowHide, 'H');
            }

        }

        function ColourChangeLostFocus(obj1, obj2) {
            if (obj2.GetText() == "") {
                obj1.style.color = '#CCCCCC';
            }
        }

        function keyVal(obj) {
            if (obj == "No Record Found") {
                if (GetObjectID("TxtIPVby").value == "No Record Found" || cComboIPVConType.GetValue() != 'EM') {
                    cTxtRelBrokr.SetText("");
                }

            }
            var WhichCall = obj.split('~')[0];
            if (WhichCall == "Main" || WhichCall == "MAIN") {
                // cTxtRelBrokr.SetEnabled(true);
                cTxtRelBrokr.SetText(obj.split('~')[1]);
                //cTxtRelBrokr.SetEnabled(false); 
            }
            else if (WhichCall != "PARTNER") {
                cTxtRelBrokr.SetText("");
            }

        }

        function OnLeftNav_Click() {
            SetValue("hdn_GridBindOrNotBind", "False");
            var i = GetObjectID("A1").innerText;
            GetObjectID('A1').className = "number_box_selected";

            if (parseInt(i) > 1) {
                cGridEntryRecord.PerformCallback("SearchByNavigation~" + GetObjectID("A1").innerText + "~LeftNav");
            }
            else {
                alert('No More Pages.');
            }
        }

        function OnRightNav_Click() {
            SetValue("hdn_GridBindOrNotBind", "False");
            var TestEnd = GetObjectID("A10").innerText;
            var TotalPage = GetObjectID("B_TotalPage").innerText;
            if (TestEnd == "" || TestEnd == TotalPage) {
                alert('No More Records.');
                return;
            }
            var i = GetObjectID("A1").innerText;

            if (parseInt(i) < TotalPage) {
                cGridEntryRecord.PerformCallback("SearchByNavigation~" + GetObjectID("A1").innerText + "~RightNav");
            }
            else {
                alert('You are at the End');
            }
        }

        function OnPageNo_Click(obj) {
            SetValue("hdn_GridBindOrNotBind", "False");
            var i = GetObjectID(obj).innerText;
            CurrentPg = i;
            cGridEntryRecord.PerformCallback("SearchByNavigation~" + i + "~PageNav");
        }
        function CommonShow() {
            HideShow('Div_Identity', 'H');
            HideShow('Accordion1Content', 'H');
            HideShow('Accordion2Content', 'H');
            HideShow('Accordion3Content', 'H');
            HideShow('Div_Common', 'S');
            SetStyle("Div_Common_Show", "BGColor", "#F4A460");
            SetStyle("Div_Identity_Show", "BGColor", "#DDD");
            SetStyle("Div_Address_Show", "BGColor", "#DDD");
            SetStyle("Div_Other_Show", "BGColor", "#DDD");
            Height('350', '350');
        }

        function IdentityShow() {
            if (Cmn != 'S') {
                alert("Please Save The Application Number & Branch Section First");
            }
            else {
                SetStyle("Div_Identity_Show", "BGColor", "#F4A460");
                SetStyle("Div_Common_Show", "BGColor", "#DDD");
                SetStyle("Div_Address_Show", "BGColor", "#DDD");
                SetStyle("Div_Other_Show", "BGColor", "#DDD");
                HideShow('Div_Identity', 'S');
                CommonNext();
            }
        }
        function AddressShow() {
            if (Cmn != 'S') {
                alert("Please Save The Application Number & Branch Section First");
            }
            else if (Identity != 'S') {
                alert("Please Save The Identity Details Section First");
            }
            else {
                SetStyle("Div_Address_Show", "BGColor", "#F4A460");
                SetStyle("Div_Common_Show", "BGColor", "#DDD");
                SetStyle("Div_Identity_Show", "BGColor", "#DDD");
                SetStyle("Div_Other_Show", "BGColor", "#DDD");
                HideShow('Div_Identity', 'S');
                IdentityNext();
            }
        }
        function OtherShow() {
            if (Cmn != 'S') {
                alert("Please Save The Application Number & Branch Section First");
            }
            else if (Identity != 'S') {
                alert("Please Save The Identity Details Section First");
            }
            else if (Address != 'S') {
                alert("Please Save The Address Details Section First");
            }
            else {
                SetStyle("Div_Other_Show", "BGColor", "#F4A460");
                SetStyle("Div_Common_Show", "BGColor", "#DDD");
                SetStyle("Div_Identity_Show", "BGColor", "#DDD");
                SetStyle("Div_Address_Show", "BGColor", "#DDD");
                HideShow('Div_Identity', 'S');
                AddressNext();
            }
        }

        //------------------------------------Start Common Fields------------------------------------------------
        function CheckAppliNoExist() {
            
            
            
            if (cTxtAppliNo.GetText() != "" && Cmn != 'S') {
                ApplicatnNo = cTxtAppliNo.GetText();
                cCbpAppliNo.PerformCallback("CheckAppliNoExist~" + cTxtAppliNo.GetText());
            }
            else if (Cmn == 'S' && ApplicatnNo != cTxtAppliNo.GetText() && cTxtAppliNo.GetText() != "") {
                ApplicatnNo = cTxtAppliNo.GetText();
                cCbpAppliNo.PerformCallback("CheckAppliNoExist~" + cTxtAppliNo.GetText());
            }
            else {
                if (Cmn == '') {
                    Cmn = 'S';
                    EntryType = "Add";
                    if (cTxtAppliNo.GetText() == "") {
                        var AppliNo = cTxtFormNo.GetText();
                    }
                    else {
                        var AppliNo = cTxtAppliNo.GetText();
                    }
                    
                    //cCbpComon.PerformCallback('SaveCommon~'+AppliNo+ '~'+ cTxtCntUcc.GetText());
                    cCbpComon.PerformCallback('SaveCommon~' + AppliNo);
                }
                else {
                    if (cTxtAppliNo.GetText() == "") {
                        var AppliNo = cTxtFormNo.GetText();
                    }
                    else {
                        var AppliNo = cTxtAppliNo.GetText();
                    }
                    //cCbpComon.PerformCallback('UpdtCommon~'+cTxtAppliNo.GetText()+ '~'+ cTxtCntUcc.GetText());
                    cCbpComon.PerformCallback('UpdtCommon~' + AppliNo);

                }
            }
        }

        function AppliNoAlert() {
            if (cTxtAppliNo.GetText() == "" && GvAlrt == '')
                alert("Please Enter The Application Number If It Is Given In Your Form..");
        }

        function CommonFldValidtn() {
            if (Requiredfield("<%=TxtBranch.ClientID%>", "Please Enter The Branch") && Requiredfield("<%=TxtBranch_hidden.ClientID%>", "Please Enter The Branch"))
                return true;
            else
                return false;
        }
        function CommonFldReset() {
            cComboCompany.SetSelectedIndex(0);
            cTxtAppliNo.SetText("");
            cAppliDt.SetDate(currentDateToset);
            SetValue("<%=TxtBranch.ClientID %>", "");
            //cTxtCntUcc.SetText("");
        }

        //  function LinkUcc_Click()
        //  {
        //    cCbpUcc.PerformCallback('GetUcc'+'~'+cTxtCntUcc.GetText());
        //  }
        //  function CbpUcc_EndCallBack()
        //  {
        //       if(cCbpUcc.cpPrefxAlrt == "T")
        //       {
        //         alert('Please Enter a Prefix for UCC to Generate');
        //         cTxtCntUcc.Focus();
        //         cCbpUcc.cpPrefxAlrt = null;
        //       }
        //  }

        function SaveCommon() {
            
            Clicked = 'T';
            if (CommonFldValidtn()) {
                if (cTxtAppliNo.GetText() != "") {
                    CheckAppliNoExist();
                }
                else {
                    if (Cmn == '') {
                        Cmn = 'S';
                        EntryType = "Add";
                        if (cTxtAppliNo.GetText() == "") {
                            var AppliNo = cTxtFormNo.GetText();
                        }
                        else {
                            var AppliNo = cTxtAppliNo.GetText();
                        }
                        //cCbpComon.PerformCallback('SaveCommon~'+AppliNo+ '~'+ cTxtCntUcc.GetText());
                        cCbpComon.PerformCallback('SaveCommon~' + AppliNo);
                    }
                    else {
                        //cCbpComon.PerformCallback('UpdtCommon~'+cTxtAppliNo.GetText()+ '~'+ cTxtCntUcc.GetText());
                        if (cTxtAppliNo.GetText() == "") {
                            var AppliNo = cTxtFormNo.GetText();
                        }
                        else {
                            var AppliNo = cTxtAppliNo.GetText();
                        }
                        cCbpComon.PerformCallback('UpdtCommon~' + AppliNo);

                    }
                }
            }

        }

        function EditCommon() {
            HideShow('DivBtnSaveCmn', 'S');
            HideShow('DivBtnEditCmn', 'H');
            HideShow('DivApliNoAlert', 'H');
            cTxtAppliNo.SetEnabled(true);
            cAppliDt.SetEnabled(true);
            document.getElementById("<%=TxtBranch.ClientID %>").disabled = false;
            //cTxtCntUcc.SetEnabled(true); 
            //cLinkUcc.SetEnabled(true);
            //    if( cTxtCntUcc.GetText()!="")
            //    {
            //        if(EntryType == "Edit")
            //        {
            //           cTxtCntUcc.SetEnabled(false); 
            //           cLinkUcc.SetEnabled(false); 
            //        }
            //    }

        }
        function CommonNext() {
            HideShow('Div_Identity', 'S');
            HideShow('Accordion1Content', 'S');
            HideShow('Accordion2Content', 'H');
            HideShow('Accordion3Content', 'H');
            HideShow('Div_Common', 'H');
            Height('350', '350');
        }
        function CbpComon_EndCallBack() {
            HideShow('DivBtnSaveCmn', 'H');
            HideShow('DivBtnEditCmn', 'S');
            HideShow('btnClose', 'H');
            HideShow('divForOverView', 'H');
            HideShow('btnOpen', 'S');
            //    HideShow('Div_Identity','S');
            //    HideShow('Row27','S');
            cTxtAppliNo.SetEnabled(false);
            cAppliDt.SetEnabled(false);
            document.getElementById("<%=TxtBranch.ClientID %>").disabled = true;
            //cTxtCntUcc.SetEnabled(false); 
            //cLinkUcc.SetEnabled(false);
            cTxtFormNo.SetEnabled(false);
            if (cCbpComon.cpSaveCmn == "T") {
                if (cTxtAppliNo.GetText() == "") {
                    cTxtAppliNo.SetText(cTxtFormNo.GetText());
                    HideShow('DivApliNoAlert', 'S');
                    document.getElementById('DivApliNoAlert').className = "Info BtmMargin";
                    SetinnerHTML("DivApliNoAlert", "   As Application Number Was Not Given A Application Number = '" + cTxtFormNo.GetText() + "'  has been AutoGenerated..Note It Down For Future Refference");
                    //alert("As You Have Not Given Your Application Number We Have Generated A Application Number = '"+ cTxtFormNo.GetText() + "'.  For You..Please Note It Down For Your Future Refference ");
                    //cTxtApplicntName.Focus();
                    cTxtApplicntPrefix.Focus();
                }
                else {
                    HideShow('DivApliNoAlert', 'S');
                    document.getElementById('DivApliNoAlert').className = "Success BtmMargin";
                    SetinnerHTML("DivApliNoAlert", "Main Section Submitted Successfully !!");
                }
                if (ExistingClientBind == 'T') {
                    cCbpIdntty.PerformCallback('ExistingClientBindIdntty~' + cTxtAppliNo.GetText());
                    //          cCbpAdrs.PerformCallback('ExistingClientBindAdrs~'); 
                    //          cCbpOthrDtls.PerformCallback('ExistingClientBindOthrDtls~'); 
                    //          ExistingClientBind = '';
                }
                cCbpComon.cpSaveCmn = null;
            }
            if (cCbpComon.cpSetAplinoXML != null) {
                ApplicatnNo = cCbpComon.cpSetAplinoXML.split('!')[0];
                KraXMLPath = cCbpComon.cpSetAplinoXML.split('!')[1];
                cCbpComon.cpSetAplinoXML = null;
            }
            if (cCbpComon.cpBindForCmnEdit == 'T') {
                HideShow('DivGridRecord', 'H');
                HideShow('DivEntryForm', 'S');
                HideShow('Div_Identity', 'H');
                HideShow('Accordion1Content', 'H');
                HideShow('Accordion2Content', 'H');
                HideShow('Accordion3Content', 'H');
                HideShow('Div_Common', 'S');
                HideShow('DivApliNoAlert', 'S');
                document.getElementById('DivApliNoAlert').className = "Success BtmMargin";
                SetinnerHTML("DivApliNoAlert", "Main Section Submitted Successfully !!");
                cCbpIdntty.PerformCallback('BindForEditIdntty~');
                Identity = "S";
                EntryType = "Edit";
                cCbpComon.cpBindForEditCmn = null;
            }
            Height('350', '350');
        }

        function RecordAddButtonClick() {
            window.location = "../KRA/KRA_RegistrationForm.aspx";
            //    ShowHideNewClient();
            //    cCbpFormNo.PerformCallback('FormNoGenerate~'+ cComboCompany.GetValue());  
        }

        function GridEntryRecord_EndCallBack() {
            if (cGridEntryRecord.cpRefreshNavPanel != undefined) {
                GetObjectID("B_PageNo").innerText = '';
                GetObjectID("B_TotalPage").innerText = '';
                GetObjectID("B_TotalRows").innerText = '';

                var NavDirection = cGridEntryRecord.cpRefreshNavPanel.split('~')[0];
                var PageNum = cGridEntryRecord.cpRefreshNavPanel.split('~')[1];
                var TotalPage = cGridEntryRecord.cpRefreshNavPanel.split('~')[2];
                var TotalRows = cGridEntryRecord.cpRefreshNavPanel.split('~')[3];

                if (NavDirection == "RightNav") {
                    PageNum = parseInt(PageNum) + 10;
                    GetObjectID("B_PageNo").innerText = PageNum;
                    GetObjectID("B_TotalPage").innerText = TotalPage;
                    GetObjectID("B_TotalRows").innerText = TotalRows;
                    var n = parseInt(TotalPage) - parseInt(PageNum) > 10 ? parseInt(11) : parseInt(TotalPage) - parseInt(PageNum) + 2;
                    for (r = 1; r < n; r++) {
                        var obj = "A" + r;
                        GetObjectID(obj).innerText = " " + PageNum++ + " ";
                    }
                    for (r = n; r < 11; r++) {
                        var obj = "A" + r;
                        GetObjectID(obj).innerText = "";
                    }
                }
                if (NavDirection == "LeftNav") {
                    if (parseInt(PageNum) >= 1) {
                        PageNum = parseInt(PageNum) - 10;
                        GetObjectID("B_PageNo").innerText = PageNum;
                        GetObjectID("B_TotalPage").innerText = TotalPage;
                        GetObjectID("B_TotalRows").innerText = TotalRows;
                        for (l = 1; l < 11; l++) {
                            var obj = "A" + l;
                            GetObjectID(obj).innerText = " " + PageNum++ + " ";
                        }
                    }
                    else {
                        alert('No More Pages.');
                    }
                }
                if (NavDirection == "PageNav") {
                    GetObjectID("B_PageNo").innerText = PageNum;
                    GetObjectID("B_TotalPage").innerText = TotalPage;
                    GetObjectID("B_TotalRows").innerText = TotalRows;
                }
                if (NavDirection == "ShowBtnClick") {
                    GetObjectID("B_PageNo").innerText = PageNum;
                    GetObjectID("B_TotalPage").innerText = TotalPage;
                    GetObjectID("B_TotalRows").innerText = TotalRows;
                    var n = parseInt(TotalPage) - parseInt(PageNum) >= 10 ? parseInt(11) : parseInt(TotalPage) - parseInt(PageNum) + 2;
                    for (r = 1; r < n; r++) {
                        var obj = "A" + r;
                        GetObjectID(obj).innerText = " " + PageNum++ + " ";
                    }
                    for (r = n; r < 11; r++) {
                        var obj = "A" + r;
                        GetObjectID(obj).innerText = "";
                    }

                }
            }
            if (cGridEntryRecord.cpSetGlobalFields != undefined) {
                SetValue("Hdn_PageSize", cGridEntryRecord.cpSetGlobalFields.split('~')[0]);
                SetValue("Hdn_PageNumber", cGridEntryRecord.cpSetGlobalFields.split('~')[1]);

            }
            SetValue("hdn_GridBindOrNotBind", "True");
            if (cGridEntryRecord.cpExistClientBind != null) {
                cGridEntryRecord.CancelEdit();
                var Data = cGridEntryRecord.cpExistClientBind.split('!');

                var ClntType = Data[0];
                var FormNo = Data[1];
                var BranchName = Data[2];
                var BranchID = Data[3];
                //var ClntUcc = Data[2];

                cComboClType.SetText(ClntType);
                cTxtFormNo.SetEnabled(true);
                cTxtFormNo.SetText(FormNo);
                SetValue("<%=TxtBranch.ClientID %>", BranchName);
                SetValue("<%=TxtBranch_hidden.ClientID %>", BranchID);
                //           cTxtCntUcc.SetText(ClntUcc);
                //           cLinkUcc.SetEnabled(false);
                //           cTxtCntUcc.SetEnabled(false);
                cTxtFormNo.SetEnabled(false);
                ShowHideNewClient();
                cGridEntryRecord.cpExistClientBind = null;
                ExistingClientBind = "T";
            }
            if (cGridEntryRecord.cpUnsavedClientBind != null) {
                cComboClType.SetValue(cGridEntryRecord.cpUnsavedClientBind);
                ClientType = cGridEntryRecord.cpUnsavedClientBind;
                if (ClientType == "N") {
                    HideShow('SpIndiv', 'H');
                    HideShow('SpNonIndiv', 'S');
                    HideShow('Div_GVCHrecord', 'H');
                    if (GetValue("<%=HiddenField_I_NI_BindIndicator.ClientID %>") != "1") {
                        SetValue("<%=HiddenField_I_NI_BindIndicator.ClientID %>", "0");
                        cComboStatus.PerformCallback('E_NonIndividualBind');
                        cComboAnnualIncm.PerformCallback('N');
                    }
                }
                else {
                    HideShow('SpIndiv', 'S');
                    HideShow('SpNonIndiv', 'H');
                }
                cGridEntryRecord.cpUnsavedClientBind = null;
            }
            if (cGridEntryRecord.cpBindForEdit == "T") {
                cGridEntryRecord.CancelEdit();
                UserMatched = '';
                cCbpComon.PerformCallback('BindForEditCmn~');
                //           cCbpIdntty.PerformCallback('BindForEditIdntty~');  
                //           cCbpAdrs.PerformCallback('BindForEditAdrs~'); 
                //           cCbpOthrDtls.PerformCallback('BindForEditOthrDtls~'); 

                Cmn = "S";
                //           Identity = "S";
                //           Address = "S";
                //           OtherDtls = "S";
                //           EntryType = "Edit";
                //           if(cComboClType.GetValue()=="N")
                //           {
                //            cGvCHRecord.PerformCallback('BindForEditPartnerRecord~');
                //           }

                cGridEntryRecord.cpBindForEdit = null;
            }
            if (cGridEntryRecord.cpNoFileFound == "T") {
                alert("No UnSaved Entries To Display");
                cGridEntryRecord.cpNoFileFound = null;
            }
            if (cGridEntryRecord.cpAplicatnNo != null) {
                ApplicatnNo = cGridEntryRecord.cpAplicatnNo;
                cGridEntryRecord.cpAplicatnNo = null;
            }
            if (cGridEntryRecord.cpUserMatching == "F") {
                cGridEntryRecord.CancelEdit();
                alert('Sorry it is Using by another User..You dont have the Permission to Edit this Record!!');
                cGridEntryRecord.cpUserMatching = null;
            }
            if (cGridEntryRecord.cpAnotherUser == "T") {
                alert('Sorry it is Created by another User..You dont have the Permission to Delete this Record!!');
                cGridEntryRecord.cpAnotherUser = null;
            }
            if (cGridEntryRecord.cpDBData == "T") {
                alert('Sorry you dont have the permission to delete this Record..It is already Saved in the Database!!');
                cGridEntryRecord.cpDBData = null;
            }
            if (cGridEntryRecord.cpBindEditClient == "T") {
                cGridEntryRecord.PerformCallback('FetchClientDetailForEdit~');
                cGridEntryRecord.cpBindEditClient = null;
            }
            Height('350', '350');

        }

        function ShowHideFilter(obj) {
            cGridEntryRecord.PerformCallback('BindFilter~' + CurrentPg + '~' + obj);
        }

        function CbpFormNo_EndCallBack() {
            cTxtFormNo.SetEnabled(false);
            cTxtAppliNo.Focus();
        }

        function CbpAppliNo_EndCallBack() {
            GvAlrt = 'T';

            if (cCbpAppliNo.cpAppliNoCheck == "Final") {
                alert("This Registration Has Been Already Made by a Final User!!");
                cTxtAppliNo.SetText('');
                cTxtAppliNo.Focus();
                cCbpAppliNo.cpAppliNoCheck = null;
            }
            else if (cCbpAppliNo.cpAppliNoCheck == "Exist") {
                alert("This Registration Already Exists!!");
                cTxtAppliNo.SetText('');
                cTxtAppliNo.Focus();
                cCbpAppliNo.cpAppliNoCheck = null;
            }
            else if (cCbpAppliNo.cpAppliNoCheck == "Invalid") {
                alert("Sorry You are a Invalid User For This Registration!!");
                cTxtAppliNo.SetText('');
                cTxtAppliNo.Focus();
                cCbpAppliNo.cpAppliNoCheck = null;
            }
            else if (cCbpAppliNo.cpAppliNoCheck == "UserSaved") {
                alert("You Have Already Done This This Registration.To Edit the Entry Go To 'Show Or Change KYC Records'!!");
                cTxtAppliNo.SetText('');
                cTxtAppliNo.Focus();
                cCbpAppliNo.cpAppliNoCheck = null;
            }
            else if (cCbpAppliNo.cpAppliNoCheck == "UserInserting") {
                alert("You Have Done An UnSaved Entry For this Application Number.To Further Process Go To 'UnSaved Records' ");
                cTxtAppliNo.SetText('');
                cTxtAppliNo.Focus();
                cCbpAppliNo.cpAppliNoCheck = null;
            }
            else if (cCbpAppliNo.cpAppliNoCheck != null) {
                var Data = cCbpAppliNo.cpAppliNoCheck.split('!');

                cTxtFormNo.SetEnabled(true);
                cTxtFormNo.SetText(Data[0]);
                cTxtFormNo.SetEnabled(false);
                Clicked = 'T';
                //        cTxtCntUcc.SetText(Data[1]);
                //        cTxtCntUcc.SetEnabled(false);
                if (CommonFldValidtn()) {
                    if (Cmn == '') {
                        Cmn = 'S';
                        EntryType = "Add";
                        //cCbpComon.PerformCallback('SaveCommon~'+AppliNo+ '~'+ cTxtCntUcc.GetText());
                        cCbpComon.PerformCallback('SaveCommon~' + cTxtAppliNo.GetText());
                    }
                    else {

                        if (cTxtAppliNo.GetText() == "") {
                            var AppliNo = cTxtFormNo.GetText();
                        }
                        else {
                            var AppliNo = cTxtAppliNo.GetText();
                        }
                        //cCbpComon.PerformCallback('UpdtCommon~'+cTxtAppliNo.GetText()+ '~'+ cTxtCntUcc.GetText());
                        cCbpComon.PerformCallback('UpdtCommon~' + AppliNo);

                    }
                }
                cCbpAppliNo.cpAppliNoCheck = null;
            }
            else if (cCbpAppliNo.cpAppliNoCheck == null) {
                Clicked = 'T';
                if (CommonFldValidtn()) {
                    if (Cmn == '') {
                        Cmn = 'S';
                        EntryType = "Add";
                        if (cTxtAppliNo.GetText() == "") {
                            var AppliNo = cTxtFormNo.GetText();
                        }
                        else {
                            var AppliNo = cTxtAppliNo.GetText();
                        }
                        //cCbpComon.PerformCallback('SaveCommon~'+AppliNo+ '~'+ cTxtCntUcc.GetText());
                        cCbpComon.PerformCallback('SaveCommon~' + AppliNo);
                    }
                    else {
                        if (cTxtAppliNo.GetText() == "") {
                            var AppliNo = cTxtFormNo.GetText();
                        }
                        else {
                            var AppliNo = cTxtAppliNo.GetText();
                        }
                        //cCbpComon.PerformCallback('UpdtCommon~'+cTxtAppliNo.GetText()+ '~'+ cTxtCntUcc.GetText());
                        cCbpComon.PerformCallback('UpdtCommon~' + AppliNo);

                    }
                }


                ////        if(Clicked == "T")
                ////        {
                ////          if(Cmn == '')
                ////          {
                ////            Cmn = 'S';
                ////            EntryType = "Add";
                ////            if(cTxtAppliNo.GetText()== "")
                ////            {
                ////              var AppliNo = cTxtFormNo.GetText();
                ////            }
                ////            else
                ////            {
                ////              var AppliNo = cTxtAppliNo.GetText();
                ////            }
                ////            //cCbpComon.PerformCallback('SaveCommon~'+AppliNo+ '~'+ cTxtCntUcc.GetText());
                ////            cCbpComon.PerformCallback('SaveCommon~'+AppliNo);
                ////          }
                ////          else
                ////          {
                ////           
                ////            //cCbpComon.PerformCallback('UpdtCommon~'+cTxtAppliNo.GetText()+ '~'+ cTxtCntUcc.GetText());
                ////            cCbpComon.PerformCallback('UpdtCommon~'+cTxtAppliNo.GetText());
                ////          
                ////          }
                ////           Clicked = ''; 
                ////        }  
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

        function verifyPanCrdNo(Obj) {
            var status = false;
            // var PanCrdChk = /[A-Z]{1,5}/+/\d{6,9}/+/[A-Z]{10,11}$/i;
            //var PanCrdChk = /\w{5}\d\d\d\d\w{1}$/i;    
            //if (Obj.GetValue().search(PanCrdChk) == -1) 
            //{
            //     alert("Please enter a valid PanCard No");
            //     Obj.Focus();
            //}
            //else
            //{
            //    status = true;
            //}

            var PanCrdChk = /^([A-Z]){5}([0-9]){4}([A-Z]){1}?$/;
            if (PanCrdChk.test(Obj.GetValue()) == false) {
                alert("Please enter a valid PanCard No");
                Obj.Focus();
            }
            else {
                status = true;
            }
            return status;
        }


        function IdentityValidatnIndividual() {
            if (DevE_Control_Empty(cTxtApplicntName, "Please Enter The Name Of The Applicant"))
                if (DevE_Control_Empty(ctxtFatherFirstName, "Please Enter Fathers/Spouse Name")) {
                var ToDateMinTwo = new Date();
                ToDateMinTwo.setDate(ToDateMinTwo.getDate() - 2);
                var DOB = cdobDt.GetValue();
                if (CompareDate_TrueFalse(DOB, ToDateMinTwo, "LT")) {
                    alert("Please Enter a Valid Date Of Birth.Atleast Two Day Less Than Current Date!!!");
                    return false;
                }
                else {
                    if (DevE_Control_IsChecked(crdOthr)) {
                        if (Control_Empty('<%=TxtOthr.ClientID%>', "Please Enter Nationality!!!")) {
                            if (DevE_Control_CompareText(cComboStatus, "0", "Please Select The Status!!!")) {
                                if (DevE_Control_IsChecked(crdPanxmptN)) {
                                    if (DevE_Control_Empty(cTxtPan, "Please Enter The Pan No."))
                                        if (verifyPanCrdNo(cTxtPan))
                                        if (DevE_Control_CompareText(cComboIdentityProof, "0", "Please Select The Identity Proof Type Submitted"))
                                        return true;
                                }
                                else {
                                    if (DevE_Control_CompareText(cComboPanExempt, "0", "Please Select The Pan Exemption Type!!!"))
                                        if (DevE_Control_CompareText(cComboIdentityProof, "0", "Please Select The Identity Proof Type Submitted"))
                                        if (DevE_Control_CompareText(cComboIdentityProof, "14", "Pan can not be selected as Identity Proof when Pan Exempts !!!"))
                                        return true;
                                }
                            }
                        }
                    }
                    else {
                        if (DevE_Control_CompareText(cComboStatus, "0", "Please Select The Status!!!")) {
                            if (DevE_Control_IsChecked(crdPanxmptN)) {

                                if (DevE_Control_Empty(cTxtPan, "Please Enter The Pan No."))
                                    if (verifyPanCrdNo(cTxtPan))
                                    if (DevE_Control_CompareText(cComboIdentityProof, "0", "Please Select The Identity Proof Type Submitted"))
                                    return true;
                            }
                            else {
                                if (DevE_Control_CompareText(cComboPanExempt, "0", "Please Select The Pan Exemption Type!!!"))
                                    if (DevE_Control_CompareText(cComboIdentityProof, "0", "Please Select The Identity Proof Type Submitted"))
                                    if (DevE_Control_CompareText(cComboIdentityProof, "14", "Pan can not be selected as Identity Proof when Pan Exempts !!!"))
                                    return true;
                            }
                        }
                    }
                }
            }
        }

        function IdentityValidatnNonIndividual() {
            if (DevE_Control_Empty(cTxtApplicntName, "Please Enter The Name Of The Applicant"))
                if (DevE_Control_Empty(cTxtRegNo, "Please Enter The Registration Number"))
                if (DevE_Control_CompareText(cComboIdentityProof, "0", "Please Select The Identity Proof Type Submitted"))
                if (cComboStatus.GetText() == "Others") {
                if (DevE_Control_Empty(cTxtOthrStatus, "Please Specify The Status."))
                    return true;
            }
            else if (DevE_Control_IsChecked(crdPanxmptN)) {
                if (DevE_Control_Empty(cTxtPan, "Please Enter The Pan No."))
                    if (verifyPanCrdNo(cTxtPan))
                    return true;
            }
            else {
                if (DevE_Control_CompareText(cComboPanExempt, "0", "Please Select The Pan Exemption Type!!!"))
                    return true;
            }
        }


        function IdentityReset() {
            cTxtApplicntPrefix.SetText("");
            ctxtFatherPrefix.SetText("");
            ctxtFatherFirstName.SetText("");
            ctxtFatherMiddleName.SetText("");
            ctxtFatherLastName.SetText("");
            ctxtMaidenNamePrefix.SetText("");
            ctxtMaidenNameFirst.SetText("");
            ctxtMaidenNameMiddle.SetText("");
            ctxtMaidenNameLast.SetText("");
            ctxtMotherNamePrefix.SetText("");
            ctxtMotherFirstName.SetText("");
            ctxtMotherMiddleName.SetText("");
            ctxtMotherLastName.SetText("");
                       
            cTxtApplicntName.SetText("");
            cTxtApplicntMidlName.SetText("");
            cTxtApplicntLstName.SetText("");            
            cIncorpDt.SetDate(currentDateToset);
            cComboIncorpPlc.SetValue("");
            cComncmntDt.SetDate(currentDateToset);
            //cTxtFthrName.SetText("");
            GetObjectID('<%=btnFather.ClientID%>').checked = true;
            GetObjectID('<%=rdMale.ClientID%>').checked = true;
            GetObjectID('<%=rdSingl.ClientID%>').checked = true;
            cdobDt.SetDate(currentDateToset);
            crdIndian.SetChecked(true);
            document.getElementById('<%=TxtOthr.ClientID%>').value = "";
            HideShow('div_othr', 'H');
            cTxtPan.SetText("");
            crdPanxmptN.SetChecked(true);
            cTxtRegNo.SetText("");
            cTxtUIN.SetText("000000");
            cTxtOthrProof.SetText("");
            HideShow('divOthrID', 'H');
            cComboStatus.SetText('Select');
            cComboNRIStatusPrf.SetSelectedIndex(0);
            cTxtOthrStatus.SetText("");
            HideShow('divOthrStatus', 'H');
	    HideShow('divIdentityNumber', 'S');
        }

        function OnStatusChange() {
            if (cComboStatus.GetText() == "Others") {
                HideShow('divOthrStatus', 'S');
            }
            else {
                HideShow('divOthrStatus', 'H');
            }
            if (cComboStatus.GetText() == "Non Resident") {
                HideShow('Row09', 'S');
            }
            else {
                HideShow('Row09', 'H');
            }

        }

        function SaveIdentity() {
            if (cComboClType.GetValue() == "I") {
                if (IdentityValidatnIndividual()) {
                    if (Cmn == 'S') {
                        Identity = 'S';
                        cCbpIdntty.PerformCallback('SaveIdntty~' + cComboStatus.GetValue());
                    }
                    else {
                        alert("Please Save the Main Entry First.");
                        cBtnSaveCmn.Focus();
                    }
                }
            }
            else if (cComboClType.GetValue() == "N") {
                if (IdentityValidatnNonIndividual()) {
                    if (Cmn == 'S') {
                        Identity = 'S';
                        cCbpIdntty.PerformCallback('SaveIdntty~' + cComboStatus.GetValue());
                    }
                    else {
                        alert("Please Save the Main Entry First.");
                        cBtnSaveCmn.Focus();
                    }
                }
            }
        }
        function IdentityPrevious() {
            HideShow('Accordion1Content', 'H');
            HideShow('Accordion2Content', 'H');
            HideShow('Accordion3Content', 'H');
            HideShow('Div_Common', 'S');
            Height('350', '350');
        }
        function IdentityNext() {
            HideShow('Accordion1Content', 'H');
            HideShow('Accordion2Content', 'S');
            HideShow('Accordion3Content', 'H');
            HideShow('Div_Common', 'H');
            Height('350', '350');
        }
        function EditIdentity() {
            Identity = '';
            HideShow('DivBtnSaveIdntty', 'S');
            HideShow('DivBtnEditIdntty', 'H');
            HideShow('DivIdnttyAlrt', 'H');
            cTxtApplicntPrefix.SetEnabled(true);
            cTxtApplicntName.SetEnabled(true);
            cTxtApplicntMidlName.SetEnabled(true);
            cTxtApplicntLstName.SetEnabled(true);
            cIncorpDt.SetEnabled(true);
            cComboIncorpPlc.SetEnabled(true);
            cComncmntDt.SetEnabled(true);
            ctxtFatherPrefix.SetEnabled(true);
            ctxtFatherFirstName.SetEnabled(true);
            ctxtFatherMiddleName.SetEnabled(true);
            ctxtFatherLastName.SetEnabled(true);

            ctxtMaidenNamePrefix.SetEnabled(true);
            ctxtMaidenNameFirst.SetEnabled(true);
            ctxtMaidenNameMiddle.SetEnabled(true);
            ctxtMaidenNameLast.SetEnabled(true);

            ctxtMotherNamePrefix.SetEnabled(true);
            ctxtMotherFirstName.SetEnabled(true);
            ctxtMotherMiddleName.SetEnabled(true);
            ctxtMotherLastName.SetEnabled(true);

            //cTxtFthrName.SetEnabled(true);
            document.getElementById('<%=btnFather.ClientID%>').disabled = false;
            document.getElementById('<%=btnSpouse.ClientID%>').disabled = false;

            document.getElementById('<%=rdMale.ClientID%>').disabled = false;
            document.getElementById('<%=rdFemale.ClientID%>').disabled = false;
            document.getElementById('<%=rdSingl.ClientID%>').disabled = false;
            document.getElementById('<%=rdMrd.ClientID%>').disabled = false;
            cdobDt.SetEnabled(true);
            crdIndian.SetEnabled(true);
            crdOthr.SetEnabled(true);
            document.getElementById('<%=TxtOthr.ClientID%>').disabled = false;

            CcmbAccHolderTypeFlag.SetEnabled(true);
            CcmbAccHolderType.SetEnabled(true);
            CAccType.SetEnabled(true);

            CcmbCountryOfIncorporation.SetEnabled(true);
            CcmdIdentificationType.SetEnabled(true);
            CcmbCountryresidenceTaxLaws.SetEnabled(true);

            CtxtTIN.SetEnabled(true);
            CcmbTINCountry.SetEnabled(true);

            CtxtPlaceogBirth.SetEnabled(true);
            CcmbCountryofBirth.SetEnabled(true);

            CcmbResidentialStatus.SetEnabled(true);
            CJurisdictionofresidence.SetEnabled(true);
            CtxtResidentTIN.SetEnabled(true);

            CcmbAddressType.SetEnabled(true);
            
            
            cTxtPan.SetEnabled(true);
            crdPanxmptY.SetEnabled(true);
            crdPanxmptN.SetEnabled(true);
            cTxtRegNo.SetEnabled(true);
            cTxtUIN.SetEnabled(true);
            cTxtOthrProof.SetEnabled(true);
            cComboStatus.SetEnabled(true);
            cComboNRIStatusPrf.SetEnabled(true);
            cTxtOthrStatus.SetEnabled(true);
            cComboIdentityProof.SetEnabled(true);
            ctxtIdentityNo.SetEnabled(true);
            cComboPanExempt.SetEnabled(true);
            cTxtApplicntName.inputElement.style.color = '#000000';
            if (cTxtApplicntMidlName.GetText() != "")
                cTxtApplicntMidlName.inputElement.style.color = '#000000';
            if (cTxtApplicntLstName.GetText() != "")
                cTxtApplicntLstName.inputElement.style.color = '#000000';
            if (cComboClType.GetValue() == "I") {
                cComboStatus.PerformCallback('IndividualBind~' + cComboStatus.GetText());
            }
            if (cComboClType.GetValue() == "N") {
                cComboStatus.PerformCallback('NonIndividualBind~' + cComboStatus.GetText());
            }
            if (CcmbJDAddressType.GetValue() == "3") {
                document.getElementById("dvJDAddress").style.display = "block";
            }
            else {
                document.getElementById("dvJDAddress").style.display = "none";
            }
        }

        function CbpIdntty_EndCallBack() {
            if (cCbpIdntty.cpSaveIdntty == "T") {
                HideShow('DivBtnEditIdntty', 'S');
                HideShow('DivBtnSaveIdntty', 'H');
                HideShow('DivIdnttyAlrt', 'S');
                cTxtApplicntPrefix.SetEnabled(false);
                cTxtApplicntName.SetEnabled(false);
                cTxtApplicntMidlName.SetEnabled(false);
                cTxtApplicntLstName.SetEnabled(false);
                cIncorpDt.SetEnabled(false);
                cComboIncorpPlc.SetEnabled(false);
                cComncmntDt.SetEnabled(false);
                //cTxtFthrName.SetEnabled(false);
                ctxtFatherPrefix.SetEnabled(false);
                ctxtFatherFirstName.SetEnabled(false);
                ctxtFatherMiddleName.SetEnabled(false);
                ctxtFatherLastName.SetEnabled(false);
                ctxtMaidenNamePrefix.SetEnabled(false);
                ctxtMaidenNameFirst.SetEnabled(false);
                ctxtMaidenNameMiddle.SetEnabled(false);
                ctxtMaidenNameLast.SetEnabled(false);

                ctxtMotherNamePrefix.SetEnabled(false);
                ctxtMotherFirstName.SetEnabled(false);
                ctxtMotherMiddleName.SetEnabled(false);
                ctxtMotherLastName.SetEnabled(false);
                
                document.getElementById('<%=btnFather.ClientID%>').disabled = true;
                document.getElementById('<%=btnSpouse.ClientID%>').disabled = true;
                document.getElementById('<%=rdMale.ClientID%>').disabled = true;
                document.getElementById('<%=rdFemale.ClientID%>').disabled = true;
                document.getElementById('<%=rdSingl.ClientID%>').disabled = true;
                document.getElementById('<%=rdMrd.ClientID%>').disabled = true;
                cdobDt.SetEnabled(false);
                crdIndian.SetEnabled(false);
                crdOthr.SetEnabled(false);
                document.getElementById('<%=TxtOthr.ClientID%>').disabled = true;
                cTxtPan.SetEnabled(false);
                crdPanxmptY.SetEnabled(false);
                crdPanxmptN.SetEnabled(false);
                cTxtRegNo.SetEnabled(false);
                cTxtUIN.SetEnabled(false);
                cTxtOthrProof.SetEnabled(false);
                cComboStatus.SetEnabled(false);
                cComboNRIStatusPrf.SetEnabled(false);
                cTxtOthrStatus.SetEnabled(false);

                CcmbAccHolderTypeFlag.SetEnabled(false);
                CcmbAccHolderType.SetEnabled(false);
                CAccType.SetEnabled(false);


                CcmbCountryOfIncorporation.SetEnabled(false);
                CcmdIdentificationType.SetEnabled(false);
                CcmbCountryresidenceTaxLaws.SetEnabled(false);

                CtxtTIN.SetEnabled(false);
                CcmbTINCountry.SetEnabled(false);
                
                CtxtPlaceogBirth.SetEnabled(false);
                CcmbCountryofBirth.SetEnabled(false);

                CcmbResidentialStatus.SetEnabled(false);
                CJurisdictionofresidence.SetEnabled(false);
                CtxtResidentTIN.SetEnabled(false);

                CcmbAddressType.SetEnabled(true);


                if (CcmbJDAddressType.GetValue() == "3") {
                    document.getElementById("dvJDAddress").style.display = "block";
                }
                else {
                    document.getElementById("dvJDAddress").style.display = "none";
                }
                ctxtIdentityNo.SetEnabled(false);                
                cComboIdentityProof.SetEnabled(false);
                cComboPanExempt.SetEnabled(false);
                if (EntryType == "Edit") {
                    cCbpAdrs.PerformCallback('BindForEditAdrs~');
                    Address = "S";
                    //EntryType = "Edit";
                }
                cCbpIdntty.cpSaveIdntty = null;
            }
            if (cCbpIdntty.cpIdnttySavedOrNot == "T") {
                HideShow('DivIdnttyAlrt', 'H');
                EditIdentity();
                HideShow('DivFinalSubmit', 'H');
                cCbpIdntty.cpIdnttySavedOrNot = null;
            }
            if (cCbpIdntty.cpFetchExistingIdntty == "T") {
                HideShow('DivBtnEditIdntty', 'H');
                HideShow('DivIdnttyAlrt', 'H');
                cTxtApplicntName.inputElement.style.color = '#000000';
                if (cTxtApplicntMidlName.GetText() != "")
                    cTxtApplicntMidlName.inputElement.style.color = '#000000';
                if (cTxtApplicntLstName.GetText() != "")
                    cTxtApplicntLstName.inputElement.style.color = '#000000';
                if (ExistingClientBind == 'T') {
                    cCbpAdrs.PerformCallback('ExistingClientBindAdrs~');
                }
                cCbpIdntty.cpFetchExistingIdntty = null;
            }
            if (crdPanxmptY.GetChecked() == true) {
                crdPanxmptN.SetChecked(false);
                crdPanxmptY.SetChecked(true);
            }
            OnCheckedShowHide(crdPanxmptY.GetChecked(), 'DivPanExempt');
            OnCheckedShowHide(crdPanxmptN.GetChecked(), 'Row10_Col1');
            if (cComboStatus.GetText() == "Non Resident") {
                HideShow('Row09', 'S');
            }
            else {
                HideShow('Row09', 'H');
            }
            if (cComboClType.GetValue() == "I") {
                HideShow('Row1', 'H');
                HideShow('Row2', 'H');
                HideShow('Row3', 'H');
                HideShow('Row11', 'H');

            }
            else if (cComboClType.GetValue() == "N") {
                //HideShow('Row4', 'H');
                HideShow('Row5', 'H');
                HideShow('Row6', 'H');
                HideShow('Row7', 'H');
                HideShow('Row8', 'H');
                HideShow('Row12', 'H');
                //HideShow('Row13','H');
                //HideShow('Row10_Col2','H');
                //HideShow('Row10_Col3','H'); 

            }
            if (cComboIdentityProof.GetText() != "Others") {
                HideShow('divOthrID', 'H');
            }
            if (crdOthr.GetChecked() == false) {
                HideShow('div_othr', 'H');
            }
            if (cComboStatus.GetText() != "Others") {
                HideShow('divOthrStatus', 'H');
            }
            if (cComboStatus.GetText() == "") {
                cComboStatus.SetText('Select');
            }
            if (DivFinalSubmit.style.display == "none") {
                HideShow('DivFinalSubmit', 'H');
            }
		
		if (cComboIdentityProof.GetText() != "Others") {
                HideShow('divOthrID', 'H');
                HideShow('divIdentityNumber', 'S');
            }
            else {
                HideShow('divOthrID', 'S');
                HideShow('divIdentityNumber', 'H');
            }


            Height('350', '350');
		
        }

        function ComboStatus_EndCallback() {
            if (cComboStatus.cpSetText != null)
                cComboStatus.SetText(cComboStatus.cpSetText);
            if (cComboStatus.cpStopAfteOneBind != null) {
                SetValue("<%=HiddenField_I_NI_BindIndicator.ClientID %>", "1");
                cComboStatus.SetText("Select");
            }
            if (cComboStatus.GetText() == "") {
                cComboStatus.SetText('Select');
            }
        }

        function IdChange() {
            
             if (cComboIdentityProof.GetText() == "Others") {
                HideShow('divOthrID', 'S');
                HideShow('divIdentityNumber', 'H');
            }
            else {
                HideShow('divOthrID', 'H');
                HideShow('divIdentityNumber', 'S');
            }
            if(cComboIdentityProof.GetText() == "Pan"){                
                ctxtIdentityNo.SetText(cTxtPan.GetText());
            } 
            else if(cComboIdentityProof.GetText() == "UID NO."){            
                ctxtIdentityNo.SetText(cTxtUIN.GetText());
            }
            else
            {
                ctxtIdentityNo.SetText("");
            }            
        }

        function GenerateUCC() {
            // cCbpUcc.PerformCallback('GetUcc'+'~'+cTxtApplicntName.GetText());
        }

        function OnNationalityOtherSelected(obj) {
            if (obj == true) {
                cComboStatus.SetText('Foreign National');
                cComboStatus.SetEnabled(false);
            }
            else {
                cComboStatus.SetText('Select');
                cComboStatus.SetEnabled(true);
            }
        }
        //------------------------------------End Identity Details-----------------------------------------------



        //------------------------------------Start Address Details----------------------------------------------


        function AddressValidatnIndividual() {
            if (DevE_Control_Empty(cTxtAddress1, "Please Enter The Correspondence Address"))
                if (DevE_MaskedControl_Empty(cTxtPin, "Please Enter The Correspondence Address Pin No.")) {
                var ToDateMinThreeMnth = new Date();
                ToDateMinThreeMnth.setDate(ToDateMinThreeMnth.getDate() - 90);
                var ValidDt = cValidDt.GetValue();
                
                if (cComboCrpndsAdrs.GetText() != 'Select' && (cComboCrpndsAdrs.GetText()== 'Passport' || cComboCrpndsAdrs.GetText()== 'Driving License') && CompareDate_TrueFalse(ToDateMinThreeMnth, ValidDt, "LT")) {
                    alert("Validity/Expiry Date of Proof of address Must not be more than 3 Months old!!!");
                    return false;
                }
                //              else
                //              {
                if (cTxtTelOfc.GetText() == "0" && cTxtTelRes.GetText() == "0" && cTxtFaxNo.GetText() == "0" && cTxtMobileNo.GetText() == "0") {
                    alert('Please Enter Your Contact Details');
                    cTxtTelOfc.Focus();
                    return false;
                }
                else {
                    if (cCbSame.GetChecked() == false) {
                        if (DevE_Control_Empty(cTxtAddress1P, "Please Enter The Permanent Address"))
                            if (DevE_MaskedControl_Empty(cTxtPinP, "Please Enter The Permanent Address Pin No."))
                            if (cComboCrpndsAdrs.GetText() == "Others") {
                            if (DevE_Control_Empty(cTxtOthrAdrsPrf, "Please Specify The Other Correspondence Address Proof.") == false)
                                return false;
                        }
                        else if (cComboRegAdrs.GetText() == "Others") {
                            if (DevE_Control_Empty(cTxtOthrAdrsPrfP, "Please Specify The Other Permanent Address Proof."))
                                return true;
                            else
                                return false;
                        }
                        else
                            return true;


                    }
                    else if (cComboCrpndsAdrs.GetText() == "Others") {
                        if (DevE_Control_Empty(cTxtOthrAdrsPrf, "Please Specify The Other Permanent Address Proof."))
                            return true;
                        else
                            return false;
                    }
                    else
                        return true;

                }
                //}
            }
        }

        function AddressValidatnNonIndividual() {
            if (DevE_Control_Empty(cTxtAddress1, "Please Enter The Correspondence Address"))
                if (DevE_MaskedControl_Empty(cTxtPin, "Please Enter The Correspondence Address Pin No."))
                if (cTxtTelOfc.GetText() == "0" && cTxtTelRes.GetText() == "0" && cTxtFaxNo.GetText() == "0" && cTxtMobileNo.GetText() == "0") {
                alert('Please Enter Your Contact Details');
                cTxtTelOfc.Focus();
                return false;
            }
            else {
                if (cCbSame.GetChecked() == false) {
                    if (DevE_Control_Empty(cTxtAddress1P, "Please Enter The Registered Address"))
                        if (DevE_MaskedControl_Empty(cTxtPinP, "Please Enter The Registered Address Pin No."))
                        return true;
                    else
                        return false;
                }
                else
                    return true;

            }


        }

        function AddressReset() {
            cTxtAddress1.SetText("");
            cTxtAddress2.SetText("");
            cTxtAddress3.SetText("");
            cComboCity.SetValue('1');
            cTxtPin.SetText("0000");
            cComboState.SetValue('10');
            cComboCountry.SetValue('1');
            cComboCrpndsAdrs.SetSelectedIndex(0);
            HideShow('DivOthrAdrsPrf', 'H');
            cTxtOthrAdrsPrf.SetText("");
            cCbSame.SetChecked(false);
            AddressEnable();

            cTxtTelOfc.SetText("000000000");
            cTxtTelRes.SetText("000000000");
            cTxtFaxNo.SetText("00000000");
            cTxtMobileNo.SetText("00000000");
            cTxtEmlID.SetText("");

        }

        function OnCheckedChanged() {
            if (cCbSame.GetChecked() == true) {
                CcmbPaddressType.SetText(CcmbAddressType.GetText());
                cTxtAddress1P.SetText(cTxtAddress1.GetText());
                cTxtAddress2P.SetText(cTxtAddress2.GetText());
                cTxtAddress3P.SetText(cTxtAddress3.GetText());
                cComboCityP.SetText(cComboCity.GetText());
                cTxtPinP.SetText(cTxtPin.GetText());
                cComboStateP.SetText(cComboState.GetText());
                cComboCountryP.SetText(cComboCountry.GetText());
                cValidDtP.SetDate(cValidDt.GetDate());
                CtxtPAdddist.SetText(CtxtLocDist.GetText());

                CcmbPaddressType.SetEnabled(false);
                cTxtAddress1P.SetEnabled(false);
                cTxtAddress2P.SetEnabled(false);
                cTxtAddress3P.SetEnabled(false);
                cComboCityP.SetEnabled(false);
                cTxtPinP.SetEnabled(false);
                cComboStateP.SetEnabled(false);
                cComboCountryP.SetEnabled(false);
                cValidDtP.SetEnabled(false);
                CtxtPAdddist.SetEnabled(false);
                cComboRegAdrs.SetText(cComboCrpndsAdrs.GetText());

                if (cComboCrpndsAdrs.GetText() == "Others") {
                    // crdOthrAdrsPrfP.SetChecked() = true;
                    cTxtOthrAdrsPrfP.SetText(cTxtOthrAdrsPrf.GetText());
                    cTxtOthrAdrsPrfP.SetEnabled(false);
                }
                cComboRegAdrs.SetEnabled(false);
                GetObjectID('Row16_Col2').disabled = true;
                GetObjectID('Row18_Col1').disabled = true;
            }
            else {
                AddressEnable();

            }

        }

        function AddressEnable() {
            GetObjectID('Row16_Col2').disabled = false;
            GetObjectID('Row18_Col1').disabled = false;
            //CcmbPaddressType.SetValue('1');
            cTxtAddress1P.SetText("");
            cTxtAddress2P.SetText("");
            cTxtAddress3P.SetText("");
            cComboCityP.SetValue('1');
            cTxtPinP.SetText("00000000");
            cComboStateP.SetValue('10');
            cComboCountryP.SetValue('1');

            CcmbPaddressType.SetEnabled(true);
            cTxtAddress1P.SetEnabled(true);
            cTxtAddress2P.SetEnabled(true);
            cTxtAddress3P.SetEnabled(true);
            cComboRegAdrs.SetEnabled(true);
            cComboCityP.SetEnabled(true);
            cTxtPinP.SetEnabled(true);
            cComboStateP.SetEnabled(true);
            cComboCountryP.SetEnabled(true);
            CtxtPAdddist.SetEnabled(true);
            cValidDtP.SetEnabled(true);
            cTxtOthrAdrsPrfP.SetEnabled(true);
            //crdPassprtP.GetChecked(true);
            cComboRegAdrs.SetSelectedIndex(0);
            cValidDtP.SetDate(currentDateToset);
            cTxtOthrAdrsPrfP.SetText("");
            HideShow('DivOthrAdrsPrfP', 'H');
        }

        function SaveAddress() {
            if (cComboClType.GetValue() == "I") {
                if (AddressValidatnIndividual()) {
                    if (Cmn == 'S') {
                        Address = 'S';
                        cCbpAdrs.PerformCallback('SaveAdrs~');
                    }
                    else {
                        alert("Please Save the Main Entry First.");
                        cBtnSaveCmn.Focus();
                    }
                }

            }
            else if (cComboClType.GetValue() == "N") {
                if (AddressValidatnNonIndividual()) {
                    if (Cmn == 'S') {
                        Address = 'S';
                        cCbpAdrs.PerformCallback('SaveAdrs~');
                    }
                    else {
                        alert("Please Save the Main Entry First.");
                        cBtnSaveCmn.Focus();
                    }
                }
            }
        }
        function AddressPrv() {
            HideShow('Accordion1Content', 'S');
            HideShow('Accordion2Content', 'H');
            HideShow('Accordion3Content', 'H');
            HideShow('Div_Common', 'H');
            Height('350', '350');
        }
        function AddressNext() {
            HideShow('Accordion1Content', 'H');
            HideShow('Accordion2Content', 'H');
            HideShow('Accordion3Content', 'S');
            HideShow('Div_Common', 'H');
            if (EntryType == "Edit") {
                if (cComboClType.GetValue() == "N") {
                    cGvCHRecord.PerformCallback('BindForEditPartnerRecord~');
                }
            }
            Height('350', '350');
        }
        function EditAddress() { 
            Address = '';
            HideShow('DivBtnSaveAdrs', 'S');
            HideShow('DivBtnEditAdrs', 'H');
            HideShow('DivAdrsAlrt', 'H');
            if (CcmbJDAddressType.GetValue() == "3") {
                document.getElementById("dvJDAddress").style.display = "block";
            }
            else {
                document.getElementById("dvJDAddress").style.display = "none";
            }
            cTxtAddress1.SetEnabled(true);
            cTxtAddress2.SetEnabled(true);
            cTxtAddress3.SetEnabled(true);
            cTxtAddress1.inputElement.style.color = '#000000';
            if (cTxtAddress2.GetText() != "")
                cTxtAddress2.inputElement.style.color = '#000000';
            if (cTxtAddress3.GetText() != "")
                cTxtAddress3.inputElement.style.color = '#000000';
            cComboCity.SetEnabled(true);
            cTxtPin.SetEnabled(true);
            cComboState.SetEnabled(true);
            cComboCountry.SetEnabled(true);
            CtxtLocDist.SetEnabled(true);
            cComboCrpndsAdrs.SetEnabled(true);
            cTxtOthrAdrsPrf.SetEnabled(true);
            cValidDt.SetEnabled(true);
            cCbSame.SetEnabled(true);
            cTxtTelOfc.SetEnabled(true);
            cTxtTelRes.SetEnabled(true);
            cTxtFaxNo.SetEnabled(true);
            cTxtMobileNo.SetEnabled(true);
            cTxtEmlID.SetEnabled(true);
            
            if (cCbSame.GetChecked() == true) {
                CcmbPaddressType.SetEnabled(false);
                cTxtAddress1P.SetEnabled(false);
                cTxtAddress2P.SetEnabled(false);
                cTxtAddress3P.SetEnabled(false);
                cComboCityP.SetEnabled(false);
                cTxtPinP.SetEnabled(false);
                cComboStateP.SetEnabled(false);
                cComboCountryP.SetEnabled(false);
                txtPAdddist.SetEnabled(false);
                cComboRegAdrs.SetEnabled(false);
                cTxtOthrAdrsPrfP.SetEnabled(false);
                cValidDtP.SetEnabled(false);
            }
            else {
            CcmbPaddressType.SetEnabled(true);
                cTxtAddress1P.SetEnabled(true);
                cTxtAddress2P.SetEnabled(true);
                cTxtAddress3P.SetEnabled(true);
                cComboCityP.SetEnabled(true);
                cTxtPinP.SetEnabled(true);
                cComboStateP.SetEnabled(true);
                cComboCountryP.SetEnabled(true);
                //txtPAdddist.SetEnabled(true);
                cComboRegAdrs.SetEnabled(true);
                cTxtOthrAdrsPrfP.SetEnabled(true);
                cValidDtP.SetEnabled(true);
                CtxtPAdddist.SetEnabled(true)
            }
        }

        function CbpAdrs_EndCallBack() {
            if (cCbpAdrs.cpSaveAdrs == "T") {
                HideShow('DivBtnSaveAdrs', 'H');
                HideShow('DivBtnEditAdrs', 'S');
                HideShow('DivAdrsAlrt', 'S');
                if (CcmbJDAddressType.GetValue() == "3") {
                    document.getElementById("dvJDAddress").style.display = "block";
                }
                else {
                    document.getElementById("dvJDAddress").style.display = "none";
                } 
                cTxtAddress1.SetEnabled(false);
                cTxtAddress2.SetEnabled(false);
                cTxtAddress3.SetEnabled(false);
                cComboCity.SetEnabled(false);
                cTxtPin.SetEnabled(false);
                cComboState.SetEnabled(false);
                cComboCountry.SetEnabled(false);
                CtxtLocDist.SetEnabled(false);
                cComboCrpndsAdrs.SetEnabled(false);
                cTxtOthrAdrsPrf.SetEnabled(false);
                cValidDt.SetEnabled(false);
                cCbSame.SetEnabled(false);
                if (cCbSame.GetChecked() == true) {
                CcmbPaddressType.SetText(CcmbAddressType.GetText());
                    cTxtAddress1P.SetText(cTxtAddress1.GetText());
                    cTxtAddress2P.SetText(cTxtAddress2.GetText());
                    cTxtAddress3P.SetText(cTxtAddress3.GetText());
                    cComboCityP.SetText(cComboCity.GetText());
                    cTxtPinP.SetText(cTxtPin.GetText());
                    cComboStateP.SetText(cComboState.GetText());
                    cComboCountryP.SetText(cComboCountry.GetText());
                    cValidDtP.SetDate(cValidDt.GetDate());
                }
                //CcmbAddressType.SetEnabled(false);
                cTxtAddress1P.SetEnabled(false);
                cTxtAddress2P.SetEnabled(false);
                cTxtAddress3P.SetEnabled(false);
                cComboCityP.SetEnabled(false);
                cTxtPinP.SetEnabled(false);
                cComboStateP.SetEnabled(false);
                cComboCountryP.SetEnabled(false);
                cComboRegAdrs.SetEnabled(false);
                cTxtOthrAdrsPrfP.SetEnabled(false);
                cValidDtP.SetEnabled(false);
                cTxtTelOfc.SetEnabled(false);
                cTxtTelRes.SetEnabled(false);
                cTxtFaxNo.SetEnabled(false);
                cTxtMobileNo.SetEnabled(false);
                cTxtEmlID.SetEnabled(false);
                if (EntryType == "Edit") {
                    cCbpOthrDtls.PerformCallback('BindForEditOthrDtls~');
                    OtherDtls = "S";
                    //EntryType = "Edit";
                    //       if(cComboClType.GetValue()=="N")
                    //       {
                    //         cGvCHRecord.PerformCallback('BindForEditPartnerRecord~');
                    //       }
                }
                cCbpAdrs.cpSaveAdrs = null;
            }
            if (cCbpAdrs.cpAdrsSavedOrNot == "T") {
                HideShow('DivAdrsAlrt', 'H');
                HideShow('DivFinalSubmit', 'H');
                EditAddress();
                cCbpAdrs.cpAdrsSavedOrNot = null;
            }
            if (cCbpAdrs.cpFetchExistingAdrs == "T") {
                HideShow('DivBtnEditAdrs', 'H');
                HideShow('DivAdrsAlrt', 'H');
                if (cTxtAddress1.GetText() != "")
                    cTxtAddress1.inputElement.style.color = '#000000';
                if (cTxtAddress2.GetText() != "")
                    cTxtAddress2.inputElement.style.color = '#000000';
                if (cTxtAddress3.GetText() != "")
                    cTxtAddress3.inputElement.style.color = '#000000';
                if (cTxtAddress1P.GetText() != "")
                    cTxtAddress1P.inputElement.style.color = '#000000';
                if (cTxtAddress2P.GetText() != "")
                    cTxtAddress2P.inputElement.style.color = '#000000';
                if (cTxtAddress3P.GetText() != "")
                    cTxtAddress3P.inputElement.style.color = '#000000';
                if (ExistingClientBind == 'T') {
                    cCbpOthrDtls.PerformCallback('ExistingClientBindOthrDtls~');
                    ExistingClientBind = '';
                }
                cCbpAdrs.cpFetchExistingAdrs = null;
            }
            if (cComboClType.GetValue() == "I") {
                HideShow('Row17_Col1', 'H');
            }
            else if (cComboClType.GetValue() == "N") {
                HideShow('Row17_Col0', 'H');
                HideShow('Row16_Col1', 'H');
                HideShow('Row18_Col1', 'H');
                HideShow('Row16_Col0', 'H');
                HideShow('Row18_Col0', 'H');

            }
            if (cComboCrpndsAdrs.GetText() != "Others") {
                HideShow('DivOthrAdrsPrf', 'H');
            }
            if (cComboRegAdrs.GetText() != "Others") {
                HideShow('DivOthrAdrsPrfP', 'H');
            }
            if (cComboState.GetText() != "Others" || cComboState.GetText() != "Other") {
                HideShow('DivStateOthr', 'H');
            }
            if (cComboStateP.GetText() != "Others" || cComboStateP.GetText() != "Other") {
                HideShow('DivStateOthrP', 'H');
            }
            if (DivFinalSubmit.style.display == "none") {
                HideShow('DivFinalSubmit', 'H');
            }
            Height('350', '350');
        }

        function OnStateChange(obj) {
            if (obj == 1) {
                if (cComboState.GetText() == "Others") {
                    HideShow('DivStateOthr', 'S');
                }
                else {
                    HideShow('DivStateOthr', 'H');
                }
            }

            if (obj == 2) {
                if (cComboStateP.GetText() == "Others") {
                    HideShow('DivStateOthrP', 'S');
                }
                else {
                    HideShow('DivStateOthrP', 'H');
                }
            }
            if (obj == 3) {
                if (cComboCHState.GetText() == "Others") {
                    HideShow('DivStateCHOthr', 'S');
                }
                else {
                    HideShow('DivStateCHOthr', 'H');
                }
            }
            if (obj == 4) {
                if (cComboCHStateE.GetText() == "Others") {
                    HideShow('DivStateCHOthrE', 'S');
                }
                else {
                    HideShow('DivStateCHOthrE', 'H');
                }
            }
        }

        function RegAdrsChange() {
            if (cComboRegAdrs.GetText() == "Others") {
                HideShow('DivOthrAdrsPrfP', 'S');
            }
            else {
                HideShow('DivOthrAdrsPrfP', 'H');
            }
        }

        function CrpndsAdrsChange() {
            if (cComboCrpndsAdrs.GetText() == "Others") {
                HideShow('DivOthrAdrsPrf', 'S');
            }
            else {
                HideShow('DivOthrAdrsPrf', 'H');
            }
        }

        function CheckTheLeast(obj) {
            if (obj != 0 && obj.length < 8) {
                alert('Please Enter Valid Number');
                return false;
            }
        }
        //------------------------------------End Address Details------------------------------------------------



        //-----------------------------------Start Other Details-------------------------------------------------
        function OthrDetailsValidatnIndividual() {
            if (DevE_Control_CompareText(cComboOccupation, "0", "Please Select Occupation"))
                if (cComboOccupation.GetText() == "Other") {
                if (DevE_Control_Empty(cTxtothrOccu, "Please Specify The Other Occupation."))
                    if (DevE_Control_CompareText(cComboAnnualIncm, "0", "Please Enter The Anuual Income Details"))
                    if ((cComboAnnualIncm.GetText() == "NetWorth") && (cTxtAmnt.GetText() == "0")) {
                    alert("Please Enter NetWorth Details");
                    cTxtAmnt.Focus();
                    return false;
                }
                else {
                    var IPVDate = new Date(cIpvDt.GetValue());
                    var currentTime = new Date();

                    if (Control_Empty('<%=TxtIPVby.ClientID%>', "Please Enter The Name of the Person who have done IPV"))
                        if (cComboIPVConType.GetValue() == "EM") {
                        if (DevE_Control_Empty(cTxtRelBrokr, "Please Enter The Relationship with the Intermediary / Designation .") == false)
                            return false;
                        else
                            return true;
                    }
                    else if (IPVDate > currentTime) {
                        alert("Please Enter a Valid IPV Date");
                        cIpvDt.Focus();
                        return false;
                    }
                    else
                        return true;
                }
            }
            else {
                if (DevE_Control_CompareText(cComboAnnualIncm, "0", "Please Enter The Anuual Income Details"))
                    if ((cComboAnnualIncm.GetText() == "NetWorth") && (cTxtAmnt.GetText() == "0")) {
                    alert("Please Enter NetWorth Details");
                    cTxtAmnt.Focus();
                    return false;
                }
                else {
                    var IPVDate = new Date(cIpvDt.GetValue());
                    var currentTime = new Date();

                    if (Control_Empty('<%=TxtIPVby.ClientID%>', "Please Enter The Name of the Person who have done IPV"))
                        if (cComboIPVConType.GetValue() == "EM") {
                        if (DevE_Control_Empty(cTxtRelBrokr, "Please Enter The Relationship with the Intermediary / Designation .") == false)
                            return false;
                        else
                            return true;
                    }
                    else if (IPVDate > currentTime) {
                        alert("Please Enter a Valid IPV Date");
                        cIpvDt.Focus();
                        return false;
                    }
                    else
                        return true;
                }
            }

        }

        function OthrDetailsValidatnNonIndividual() {
            if (DevE_Control_CompareText(cComboAnnualIncm, "0", "Please Enter The Anuual Income Details"))
                if ((cComboAnnualIncm.GetText() == "NetWorth") && (cTxtAmnt.GetText() == "0")) {
                alert("Please Enter NetWorth Details");
                cTxtAmnt.Focus();
                return false;
            }
            else {
                if (Control_Empty('<%=TxtIPVby.ClientID%>', "Please Enter The Name of the Person who have done IPV."))
                    if (cComboIPVConType.GetValue() == "EM") {
                    if (DevE_Control_Empty(cTxtRelBrokr, "Please Enter The Details/Designation.") == false)
                        return false;
                    else
                        return true;
                }
                else
                    return true;
            }

        }

        function OtherDetailReset() {
            cComboAnnualIncm.SetSelectedIndex(0);
            cTxtAmnt.SetText("000000000");
            cIncmDt.SetDate(currentDateToset);
            cComboOccupation.SetSelectedIndex(0);
            cTxtothrOccu.SetText("");
            HideShow('DivOthrOccu', 'H');
            cMemoOccu.SetText("");
            crdPEP.SetSelectedIndex(0);
            GetObjectID('<%=rdNo.ClientID%>').checked = true;
            GetObjectID('<%=rdForexN.ClientID%>').checked = true;
            GetObjectID('<%=rdGamingN.ClientID%>').checked = true;
            GetObjectID('<%=rdMoneyLendingN.ClientID%>').checked = true;
            cMemoOthrInfo.SetText("");
            GetObjectID('<%=TxtIPVby.ClientID%>').value = "";
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
            cComboRelWthapli.SetSelectedIndex(0);
            document.getElementById('<%=TxtCHIPVby.ClientID%>').value = "";
            cComboIPVConType.SetValue('SB');
            cComboCHIPVConType.SetValue('SB');
            cCHIpvDt.SetDate(currentDateToset);
            crdCHPep.SetSelectedIndex(0);
            HideShow('DivOthrDtlsAlrt', 'H');
            HideShow('divOthrDtlEdit', 'H');
        }

        function OthrDtlPrevious() {
            HideShow('Accordion1Content', 'H');
            HideShow('Accordion2Content', 'S');
            HideShow('Accordion3Content', 'H');
            HideShow('Div_Common', 'H');
            Height('350', '350');
        }

        function SaveOthrDtl() {
            if (cComboClType.GetValue() == "I") {
                if (OthrDetailsValidatnIndividual()) {
                    if (Cmn == 'S') {
                        if (Identity == 'S') {
                            if (Address == 'S') {
                                OtherDtls = 'S';
                                cCbpImage.PerformCallback('CheckImage~');

                            }
                            else {
                                alert("Please Save the Address Entry First.");
                                cBtnSaveAdrs.Focus();
                            }
                        }
                        else {
                            alert("Please Save the Identity Entry First.");
                            cBtnSaveIdntty.Focus();
                        }
                    }
                    else {
                        alert("Please Save the Main Entry First.");
                        cBtnSaveCmn.Focus();
                    }
                }

            }
            else if (cComboClType.GetValue() == "N") {
                if (OthrDetailsValidatnNonIndividual()) {
                    if (Cmn == 'S') {
                        if (Identity == 'S') {
                            if (Address == 'S') {
                                OtherDtls = 'S';
                                cCbpImage.PerformCallback('CheckImage~');
                                //cCbpOthrDtls.PerformCallback('SaveOthrDtls~');
                            }
                            else {
                                alert("Please Save the Address Entry First.");
                                cBtnSaveAdrs.Focus();
                            }
                        }
                        else {
                            alert("Please Save the Identity Entry First.");
                            cBtnSaveIdntty.Focus();
                        }
                    }
                    else {
                        alert("Please Save the Main Entry First.");
                        cBtnSaveCmn.Focus();
                    }
                }
            }
        }

        function OthrDetlSave() {
            if (cComboClType.GetValue() == "I") {
                if (OthrDetailsValidatnIndividual()) {
                    if (Cmn == 'S') {
                        if (Identity == 'S') {
                            if (Address == 'S') {
                                if (OtherDtls == 'S') {
                                    cCbpOthrDtls.PerformCallback('SubmitOthrDtls~');
                                }
                                else {
                                    alert("Please Save the Other Details Entry First.");
                                    cBtnSaveOthrDtl.Focus();
                                }
                            }
                            else {
                                alert("Please Save the Address Entry First.");
                                cBtnSaveAdrs.Focus();
                            }
                        }
                        else {
                            alert("Please Save the Identity Entry First.");
                            cBtnSaveIdntty.Focus();
                        }
                    }
                    else {
                        alert("Please Save the Main Entry First.");
                        cBtnSaveCmn.Focus();
                    }
                }

            }
            else if (cComboClType.GetValue() == "N") {
                if (OthrDetailsValidatnNonIndividual()) {
                    if (Cmn == 'S') {
                        if (Identity == 'S') {
                            if (Address == 'S') {
                                if (OtherDtls == 'S') {
                                    cCbpOthrDtls.PerformCallback('SubmitOthrDtls~');
                                }
                                else {
                                    alert("Please Save the Other Details Entry First.");
                                    cBtnSaveOthrDtl.Focus();
                                }
                            }
                            else {
                                alert("Please Save the Address Entry First.");
                                cBtnSaveAdrs.Focus();
                            }
                        }
                        else {
                            alert("Please Save the Identity Entry First.");
                            cBtnSaveIdntty.Focus();
                        }
                    }
                    else {
                        alert("Please Save the Main Entry First.");
                        cBtnSaveCmn.Focus();
                    }
                }
            }
        }

        function CbpOthrDtls_EndCallBack() {
            if (cCbpOthrDtls.cpSaved == "T") {
                alert('Data Submitted Successfully');
                window.location = "../KRA/KRA_RegistrationForm.aspx";
                cCbpOthrDtls.cpSaved = null;
            }
            if (cCbpOthrDtls.cpSaved == "F") {
                alert('Error In Saving Data');
                cCbpOthrDtls.cpSaved = null;
            }
            if (cCbpOthrDtls.cpReset == "T") {
                Cmn = '';
                Identity = '';
                Address = '';
                OtherDtls = '';
                OtherDetailReset();
                cCbpOthrDtls.cpReset = null;
            }
            if (cCbpOthrDtls.cpFetchExistingOthrDtl == "T") {
                HideShow('Row27', 'S');
                HideShow('divOthrDtlEdit', 'H');
                HideShow('divOthrDtlSave', 'S');
                HideShow('DivOthrDtlsAlrt', 'H');
                HideShow('Div_GVCHrecord', 'H');
                cCbpOthrDtls.cpFetchExistingOthrDtl = null;
            }
            if (cCbpOthrDtls.cpBindForEditOthrDtls == "T") {
                HideShow('Row27', 'S');
                HideShow('divOthrDtlEdit', 'S');
                HideShow('divOthrDtlSave', 'H');
                HideShow('DivOthrDtlsAlrt', 'S');
                cComboAnnualIncm.SetEnabled(false);
                cTxtAmnt.SetEnabled(false);
                cIncmDt.SetEnabled(false);
                cComboOccupation.SetEnabled(false);
                cTxtothrOccu.SetEnabled(false);
                cMemoOccu.SetEnabled(false);
                cbtnDocument.SetEnabled(false);
                cbtnAddDocumentPrtner.SetEnabled(false);
                cComboCHIPVConType.SetEnabled(false);
                cComboIPVConType.SetEnabled(false);
                crdPEP.SetEnabled(false);
                document.getElementById('<%=rdYes.ClientID%>').disabled = true;
                document.getElementById('<%=rdNo.ClientID%>').disabled = true;
                document.getElementById('<%=rdForexY.ClientID%>').disabled = true;
                document.getElementById('<%=rdForexN.ClientID%>').disabled = true;
                document.getElementById('<%=rdGamingY.ClientID%>').disabled = true;
                document.getElementById('<%=rdGamingN.ClientID%>').disabled = true;
                document.getElementById('<%=rdMoneyLendingY.ClientID%>').disabled = true;
                document.getElementById('<%=rdMoneyLendingN.ClientID%>').disabled = true;
                cMemoOthrInfo.SetEnabled(false);
                cComboDocuments.SetEnabled(false);
                cComboPrtnrDocuments.SetEnabled(false);
                document.getElementById('<%=TxtIPVby.ClientID%>').disabled = true;
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
                cComboRelWthapli.SetEnabled(false);
                crdCHPep.SetEnabled(false);
                document.getElementById('<%=TxtCHIPVby.ClientID%>').disabled = true;
                cCHIpvDt.SetEnabled(false);
                cTxtRelWthBrokr.SetEnabled(false);
                cBtnAddRecord.SetEnabled(false);
                cCbpOthrDtls.cpBindForEditOthrDtls = null;
            }
            if (cCbpOthrDtls.cpOthrDtlsSavedOrNot == "T") {
                HideShow('DivOthrDtlsAlrt', 'H');
                EditOthrDtl();
                cCbpOthrDtls.cpOthrDtlsSavedOrNot = null;
            }
            if (cCbpOthrDtls.cpIPVBind != null) {
                document.getElementById('<%=TxtIPVby.ClientID%>').focus();
                HideShow('DivOthrDtlsAlrt', 'H');
                HideShow('divOthrDtlEdit', 'H');
                cCbpOthrDtls.cpIPVBind = null;
            }
            if (cCbpOthrDtls.cpIPVCHBind != null) {
                document.getElementById('<%=TxtCHIPVby.ClientID%>').focus();
                if (cComboIPVConType.GetValue() == 'EM') {
                    HideShow('Row25_Col1_row4', 'S');
                }
                else {
                    HideShow('Row25_Col1_row4', 'H');
                }
                HideShow('DivOthrDtlsAlrt', 'H');
                HideShow('divOthrDtlEdit', 'H');
                cTxtRelBrokr.SetEnabled(false);
                cCbpOthrDtls.cpIPVCHBind = null;
            }
            if (cCbpOthrDtls.cpShowSubmit == 'T') {
                HideShow('DivFinalSubmit', 'S');
                cCbpOthrDtls.cpShowSubmit = null;
            }

            if (cComboClType.GetValue() == "I") {
                HideShow('Row23', 'H');
                HideShow('Row26', 'H');
                HideShow('DivPrtnerHdr', 'H');
                HideShow('div_PartnerDoc', 'H');
                HideShow('DivNonInIPV', 'H');
                HideShow('NonIndiDoc', 'H');
            }
            else if (cComboClType.GetValue() == "N") {
                HideShow('Row26', 'S');
                HideShow('DivPrtnerHdr', 'S');
                HideShow('DivInIPV', 'H');
                HideShow('IndiDoc', 'H');
            }
            if (cComboOccupation.GetText() != "Other") {
                HideShow('DivOthrOccu', 'H');
            }

            if (cComboCHState.GetText() == "Others") {
                HideShow('DivStateCHOthr', 'S');
            }
            else {
                HideShow('DivStateCHOthr', 'H');
            }

            if (cComboIPVConType.GetValue() == 'EM') {
                HideShow('Row25_Col1_row4', 'S');
            }
            else {
                HideShow('Row25_Col1_row4', 'H');
            }
            if (cComboAnnualIncm.GetText() == "NetWorth") {
                HideShow('Div_NetWorth', 'S');
            }
            else {
                HideShow('Div_NetWorth', 'H');
            }
            Height('350', '350');
        }

        function AddCompanyHolderRecords() {
            if (DevE_Control_Empty(cTxtCHName, "Please Enter The Name."))
                if (DevE_Control_Empty(cTxtCHPan, "Please Enter The Pan No."))
                if (verifyPanCrdNo(cTxtCHPan))
                if (DevE_Control_Empty(cTxtCHAddress1, "Please Enter The Address"))
                if (DevE_Control_Empty(cTxtCHPin, "Please Enter The Pin."))
                if (cTxtCHTelOfc.GetText() == "0" && cTxtCHTelRes.GetText() == "0" && cTxtCHMobileNo.GetText() == "0") {
                alert('Please Enter Your Contact Details');
                cTxtCHTelOfc.Focus();
                return false;
            }
            else {
                var PEP = crdCHPep.GetValue();

                if (Cmn == 'S') {
                    HideShow('Div_GVCHrecord', 'S');
                    cGvCHRecord.PerformCallback('SaveRecords~' + PEP + '~' + cTxtAppliNo.GetText());
                }
                else {
                    alert("Please Save the Main Entry First.");
                    cBtnSaveCmn.Focus();
                }

            }
        }

        function CancelEditing() {
            cGvCHRecord.CancelEdit();
        }

        function Update() {
            cGvCHRecord.PerformCallback('Update~' + cComboCHCityE.GetValue() + '~' + cComboCHStateE.GetValue() + '~' + cComboCHCountryE.GetValue() + '~' + cComboPEP.GetValue() + '~' + cComboCHIPVConTypeE.GetValue() + '~' + cComboRelWthapliE.GetValue());
        }

        function GvCHRecord_EndCallBack() {
            if (cGvCHRecord.cpAfterRowDeleted == "D") {
                alert('Row Successfully Deleted');
                cGvCHRecord.cpAfterRowDeleted = null;
            }
            if (cGvCHRecord.cpRecordAdded == "T") {
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
                cComboRelWthapli.SetSelectedIndex(0);
                document.getElementById('<%=TxtCHIPVby.ClientID%>').value = "";
                cCHIpvDt.SetDate(currentDateToset);
                crdCHPep.SetSelectedIndex(0);
                cComboCHIPVConType.SetValue('SB');
                cTxtRelWthBrokr.SetText("");
                cGvCHRecord.cpRecordAdded = null;
            }
            if (cGvCHRecord.cpRecordAdded == "F") {
                cGvCHRecord.cpRecordAdded = null;
            }
            if (cGvCHRecord.cpUpdtAlrt == "Name") {
                alert("Please Enter The Name.");
                cTxtCHNameE.Focus();
                cGvCHRecord.cpUpdtAlrt = null;
            }
            if (cGvCHRecord.cpUpdtAlrt == "Pan") {
                alert("Please Enter The Pan No.");
                cGvCHRecord.cpUpdtAlrt = null;
            }
            if (cGvCHRecord.cpUpdtAlrt == "Adrs") {
                alert("Please Enter The Address");
                cTxtCHAddress1E.Focus();
                cGvCHRecord.cpUpdtAlrt = null;
            }
            if (cGvCHRecord.cpUpdtAlrt == "Pin") {
                alert("Please Enter The Pin.");
                cTxtCHPinE.Focus();
                cGvCHRecord.cpUpdtAlrt = null;
            }
            if (cGvCHRecord.cpUpdtAlrt == "Contct") {
                alert("Please Enter Contact Details");
                cTxtCHMobileNoE.Focus();
                cGvCHRecord.cpUpdtAlrt = null;
            }
            if (cGvCHRecord.cpUpdtAlrt == "OtherState") {
                alert("Please Enter The Other State");
                cGvCHRecord.cpUpdtAlrt = null;

            }
            if (cGvCHRecord.cpUpdated == "U") {
                alert("Successfully Updated");
                cGvCHRecord.CancelEdit();
                cGvCHRecord.cpUpdated = null;
            }
            if (cGvCHRecord.cpStateOthrShow == "T") {
                if (show == '') {
                    HideShow('DivStateCHOthrE', 'S');
                    show = 1;
                }
                cGvCHRecord.cpStateOthrShow = null;
            }
            if (cGvCHRecord.cpStateOthrShow == "F") {
                if (ntshow == '') {
                    HideShow('DivStateCHOthrE', 'H');
                    ntshow = 1;
                }
                cGvCHRecord.cpStateOthrShow = null;

            }
            Height('350', '350');

        }



        function Attach_Show_DeleteDoc_Click() {
            if (cComboDocuments.GetValue() == "0") {
                var profileType = '<%=Session["EntryProfileType"]%>';
                var url = "../management/frmAddDocuments.aspx?id=RegistrationForm.aspx&id1=Customer/Client&AcType=Add&FormNo=" + cTxtAppliNo.GetText() + '_' + cComboCompany.GetValue() + '_' + profileType;
                popup.SetContentUrl(url);
                popup.Show();
            }
            //   else if(cComboDocuments.GetValue()=="1")
            //   { 
            //      var applicableFor='Customer/Client';       
            //      var profileType='<%=Session["EntryProfileType"]%>'        
            //      var selfXmlFile = KraXMLPath;
            ////      alert(selfXmlFile); 
            ////      alert(ApplicatnNo); 
            //      var docXmlFile="KRADocRecords_"+ ApplicatnNo +'_'+'<%=Session["P_CompanyID"]%>'+'_'+profileType;
            //      var URL="KraAuthentication_ImageViewer.aspx?parentF="+selfXmlFile+"&docF="+docXmlFile+"&appFor="+applicableFor;
            //      parent.OnMoreInfoClick(URL,"Document Detail For "+applicableFor,'995px','480px','Y');//+applicableFor+"~Without Close"
            //     
            //   }
            else if (cComboDocuments.GetValue() == "1") {
                var applicableFor = 'Customer/Client';
                var profileType = '<%=Session["EntryProfileType"]%>';
                var docXmlFile = "KRADocRecords_" + ApplicatnNo + '_' + GetValue("Hdn_CompanyID") + '_' + profileType;
                var URL = "KraDoc_Imagedelete.aspx?docF=" + docXmlFile + "&appFor=" + applicableFor;
                parent.OnMoreInfoClick(URL, "Document Delete For " + applicableFor, '995px', '500px', 'Y');
            }
        }


        function Attach_Show_DeletePrtnrDoc_Click() {
            if (cComboPrtnrDocuments.GetValue() == "0") {
                var profileType = '<%=Session["EntryProfileType"]%>';
                var url = "../management/frmAddDocuments.aspx?id=RegistrationForm.aspx&id1=ContactPerson&AcType=Add&FormNo=" + cTxtAppliNo.GetText() + '_' + cComboCompany.GetValue() + '_' + profileType;
                popup.SetContentUrl(url);
                popup.Show();
            }
            //    else if(cComboPrtnrDocuments.GetValue()== "1")
            //    {
            //        var applicableFor='ContactPerson';       
            //        var profileType='<%=Session["EntryProfileType"]%>'        
            //        var selfXmlFile = KraXMLPath;
            //        alert(selfXmlFile); 
            //        alert(ApplicatnNo); 
            //        var docXmlFile="KRADocRecords_"+ ApplicatnNo +'_'+'<%=Session["P_CompanyID"]%>'+'_'+profileType
            //        var URL="KraAuthentication_ImageViewer.aspx?parentF="+selfXmlFile+"&docF="+docXmlFile+"&appFor="+applicableFor;
            //        parent.OnMoreInfoClick(URL,"Document Detail For "+applicableFor,'995px','480px','Y');//+applicableFor+"~Without Close"  
            //    }
            else if (cComboPrtnrDocuments.GetValue() == "1") {
                var applicableFor = 'ContactPerson';
                var profileType = '<%=Session["EntryProfileType"]%>';
                var docXmlFile = "KRADocRecords_" + ApplicatnNo + '_' + GetValue("Hdn_CompanyID") + '_' + profileType;
                var URL = "KraDoc_Imagedelete.aspx?docF=" + docXmlFile + "&appFor=" + applicableFor;
                parent.OnMoreInfoClick(URL, "Document Delete For " + applicableFor, '995px', '500px', 'Y');
            }
        }


        function EditOthrDtl() {
            OtherDtls = '';
            HideShow('divOthrDtlEdit', 'H');
            HideShow('divOthrDtlSave', 'S');
            HideShow('DivOthrDtlsAlrt', 'H');
            cComboAnnualIncm.SetEnabled(true);
            cTxtAmnt.SetEnabled(true);
            cIncmDt.SetEnabled(true);
            cComboOccupation.SetEnabled(true);
            cTxtothrOccu.SetEnabled(true);
            cMemoOccu.SetEnabled(true);
            cbtnDocument.SetEnabled(true);
            cbtnAddDocumentPrtner.SetEnabled(true);
            //cbtnShowDocument.SetEnabled(true); 
            crdPEP.SetEnabled(true);
            document.getElementById('<%=rdYes.ClientID%>').disabled = false;
            document.getElementById('<%=rdNo.ClientID%>').disabled = false;
            document.getElementById('<%=rdForexY.ClientID%>').disabled = false;
            document.getElementById('<%=rdForexN.ClientID%>').disabled = false;
            document.getElementById('<%=rdGamingY.ClientID%>').disabled = false;
            document.getElementById('<%=rdGamingN.ClientID%>').disabled = false;
            document.getElementById('<%=rdMoneyLendingY.ClientID%>').disabled = false;
            document.getElementById('<%=rdMoneyLendingN.ClientID%>').disabled = false;
            cMemoOthrInfo.SetEnabled(true);
            cComboCHIPVConType.SetEnabled(true);
            cComboIPVConType.SetEnabled(true);
            cComboDocuments.SetEnabled(true);
            cComboPrtnrDocuments.SetEnabled(true);
            document.getElementById('<%=TxtIPVby.ClientID%>').disabled = false;
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
            cComboRelWthapli.SetEnabled(true);
            crdCHPep.SetEnabled(true);
            document.getElementById('<%=TxtCHIPVby.ClientID%>').disabled = false;
            cCHIpvDt.SetEnabled(true);
            cTxtRelWthBrokr.SetEnabled(true);
            cBtnAddRecord.SetEnabled(true);
            //   if(cComboClType.GetValue()=="I")
            //   {   
            //      cComboAnnualIncm.PerformCallback('I');  
            //   }
            //   if(cComboClType.GetValue()=="N")
            //   {   
            //      cComboAnnualIncm.PerformCallback('N');  
            //   } 
        }
        function OccupationChange() {
            if (cComboOccupation.GetText() == "Other")
                HideShow('DivOthrOccu', 'S');
            else
                HideShow('DivOthrOccu', 'H');

        }

        function IPVCntTypeChange() {
            if (cComboIPVConType.GetValue() == 'EM') {
                HideShow('Row25_Col1_row4', 'S');
            }
            else {
                HideShow('Row25_Col1_row4', 'H');
            }

            document.getElementById('<%=TxtIPVby.ClientID%>').value = "";
            cCbpIpvBy.PerformCallback("BindIPVBy~" + cComboIPVConType.GetValue());

        }

        function IPVCHCntTypeChange() {
            document.getElementById('<%=TxtCHIPVby.ClientID%>').value = "";
            cCbpCHIpvBy.PerformCallback("BindIPVCHBy~" + cComboCHIPVConType.GetValue());

        }
        function IPVCHCntTypeChangeE() {
            //document.getElementById('TxtCHIPVbyE').value="";
            //cCbpCHIpvBy.PerformCallback("BindIPVCHBy~"+cComboCHIPVConType.GetValue());

        }
        function ComboAttchShowDelDoc() {
            if (cComboDocuments.GetValue() == 0) {
                cbtnDocument.GetMainElement().title = "Click To Attach Documents";
            }
            else if (cComboDocuments.GetValue() == 1) {
                cbtnDocument.GetMainElement().title = "Click To Show And Delete Documents";
            }

        }
        function ComboAttchShowDelPrtnrDoc() {
            if (cComboPrtnrDocuments.GetValue() == 0) {
                cbtnAddDocumentPrtner.GetMainElement().title = "Click To Attach Documents";
            }
            else if (cComboPrtnrDocuments.GetValue() == 1) {
                cbtnAddDocumentPrtner.GetMainElement().title = "Click To Show And Delete Documents";
            }

        }

        function AnnualIncmChange() {
            if (cComboAnnualIncm.GetText() == "NetWorth") {
                HideShow('Div_NetWorth', 'S');
            }
            else {
                HideShow('Div_NetWorth', 'H');
            }
        }

        function CbpImage_EndCallBack() {
            if (cCbpImage.cpDocumentCheckng == "F") {
                HideShow('DivOthrDtlsAlrt', 'H');
                HideShow('divOthrDtlEdit', 'H');
                alert('Please Attach Related Documents..');
                cbtnDocument.Focus();
                cCbpOthrDtls.cpDocumentCheckng = null;
            }
            if (cCbpImage.cpDocumentCheckng == "Less") {
                HideShow('DivOthrDtlsAlrt', 'H');
                HideShow('divOthrDtlEdit', 'H');
                alert('Please Attach Atleast Three Mandatory Type Documents For ' + cComboClType.GetText());
                cbtnDocument.Focus();
                cCbpOthrDtls.cpDocumentCheckng = null;
            }
            if (cCbpImage.cpDocumentCheckng == "Exist") {
                HideShow('DivOthrDtlsAlrt', 'H');
                HideShow('divOthrDtlEdit', 'H');
                alert('More Then One same type of Document has been Added in ' + cComboClType.GetText() + ' Type of Document');
                cbtnDocument.Focus();
                cCbpOthrDtls.cpDocumentCheckng = null;
            }
            if (cCbpImage.cpPartnerDocumentCheckng == "F") {
                HideShow('DivOthrDtlsAlrt', 'H');
                HideShow('divOthrDtlEdit', 'H');
                alert('Please Attach Promoters,Partners,Karta,Trustees And Whole Time Directors Related Documents..');
                cbtnAddDocumentPrtner.Focus();
                cCbpOthrDtls.cpPartnerDocumentCheckng = null;
            }
            if (cCbpImage.cpPartnerCheckng == "F") {
                HideShow('DivOthrDtlsAlrt', 'H');
                HideShow('divOthrDtlEdit', 'H');
                alert('Please Enter Promoters,Partners,Karta,Trustees And Whole Time Directors Records..');
                cTxtCHName.Focus();
                cCbpOthrDtls.cpPartnerCheckng = null;
            }
            if (cCbpImage.cpImageChecked == "T") {
                cCbpOthrDtls.PerformCallback('SaveOthrDtls~');
            }
        }
        //------------------------------------End Other Details--------------------------------------------------

        //---------------------------------------Start Pop-Up-----------------------------------------------------

        function PopUp_StartPage_btnOK_Click() {
            if (cComboClType.GetText() == 'Select' && crdUnSaved.GetChecked() == false && crdExCl.GetChecked() == false && (crdEdit.GetChecked() == true || crdNew.GetChecked() == true || crdImport.GetChecked() == true)) {
                alert('Please Select The Client Type First');
                cComboClType.Focus();
            }
            else if (cComboCompany.GetText() == 'Select') {
                alert('Please Select The Company First');
                cComboCompany.Focus();
            }
            else {
                if (crdEdit.GetChecked() == true) {
                    HideShow('DivGridRecord', 'S');
                    HideShow('DivEntryForm', 'H');
                    HideShow('Row27', 'H');
                    HideShow('DivUnsaved', 'H');
                    HideShow('DivBtnReset', 'H');
                    if (cComboClType.GetValue() == "I") {
                        HideShow('SpNonIndiv', 'H');
                        HideShow('NonIndiDoc', 'H');
                        cComboAnnualIncm.PerformCallback('I');
                        cComboStatus.PerformCallback('IndividualBind~Select~');
                    }
                    else if (cComboClType.GetValue() == "N") {
                        HideShow('SpIndiv', 'H');
                        HideShow('IndiDoc', 'H');
                        cComboAnnualIncm.PerformCallback('N');
                        cComboStatus.PerformCallback('NonIndividualBind~Select~');
                    }
                    HideShow('DivSaved', 'S');
                    HideShow('DivEditGrdVw', 'S');
                    cGridEntryRecord.PerformCallback('FetchClientDetailForEdit~');
                    HideShow('btnOpen', 'H');
                    HideShow('btnClose', 'H');
                    HideShow('divForOverView', 'H');
                }
                else if (crdNew.GetChecked() == true) {
                    if (crdExCl.GetChecked() == true) {
                        var listBox = document.getElementById('<%=lstSelection.ClientID%>');
                        if (listBox.length > 0) {
                            HideShow('DivGridRecord', 'S');
                            HideShow('DivUnsaved', 'S');
                            HideShow('DivSaved', 'H');
                            HideShow('DivEntryForm', 'H');
                            HideShow('Row27', 'H');
                            HideShow('rowGV0', 'H');

                            cGridEntryRecord.PerformCallback('FetchClientDetail~');
                        }
                        else {
                            alert('Please Select and Add Atleast One Item!!!');
                            document.getElementById('<%=txtSelectionID.ClientID%>').focus();
                            return;
                        }
                        if (cComboClType.GetValue() == "I") {
                            HideShow('SpNonIndiv', 'H');
                            cComboAnnualIncm.PerformCallback('I');
                            cComboStatus.PerformCallback('IndividualBind~Select~');
                        }
                        else if (cComboClType.GetValue() == "N") {
                            HideShow('SpIndiv', 'H');
                            cComboAnnualIncm.PerformCallback('N');
                            cComboStatus.PerformCallback('NonIndividualBind~Select~');
                        }

                    }
                    else if (crdNwCl.GetChecked() == true) {
                        ShowHideNewClient();
                        cPopUp_StartPage.Hide();
                        cCbpFormNo.PerformCallback('FormNoGenerate~' + cComboCompany.GetValue());
                    }

                    HideShow('Div_GVCHrecord', 'H');
                    HideShow('Row09', 'H');
                    HideShow('Div_NetWorth', 'H');
                    HideShow('btnOpen', 'S');
                    HideShow('btnClose', 'H');
                    HideShow('divForOverView', 'H');
                }
                else if (crdUnSaved.GetChecked() == true) {
                    HideShow('DivGridRecord', 'S');
                    HideShow('DivEditGrdVw', 'S');
                    HideShow('DivEntryForm', 'H');
                    HideShow('Row27', 'H');
                    HideShow('DivUnsaved', 'S');
                    HideShow('DivSaved', 'H');
                    HideShow('DivBtnReset', 'H');
                    HideShow('rowGV0', 'H');
                    HideShow('Container2', 'H');
                    HideShow('btnClose', 'H');
                    HideShow('divForOverView', 'H');
                    HideShow('btnOpen', 'H');
                    cGridEntryRecord.PerformCallback('BindUnSavedEntries~' + cComboCompany.GetValue());
                    cComboStatus.PerformCallback('IndividualBind~Select~');
                    cComboAnnualIncm.PerformCallback('I');
                    //         if(cComboClType.GetValue()=="I")
                    //         {
                    //            HideShow('SpNonIndiv','H');
                    //         }
                    //         else if(cComboClType.GetValue()=="N")
                    //         {
                    HideShow('SpIndiv', 'H');
                    //            cComboStatus.PerformCallback('NonIndividualBind~Select~');   
                    //         }
                }
                cPopUp_StartPage.Hide();
            }
        }

        function ShowHideNewClient() {
            HideShow('DivGridRecord', 'H');
            HideShow('DivEntryForm', 'S');
            HideShow('Div_Identity', 'H');
            HideShow('Accordion1Content', 'H');
            HideShow('Accordion2Content', 'H');
            HideShow('Accordion3Content', 'H');
            HideShow('Div_Common', 'S');
            ClientType = cComboClType.GetValue();

            if (cComboClType.GetValue() == "I") {
                HideShow('NonIndiDoc', 'H');
                HideShow('SpNonIndiv', 'H');
                HideShow('Row1', 'H');
                HideShow('Row2', 'H');
                HideShow('Row3', 'H');
                HideShow('Row11', 'H');
                HideShow('Row17_Col1', 'H');
                // HideShow('DivMrThn1cr','H');
                HideShow('Row23', 'H');
                HideShow('DivNonInIPV', 'H');
                HideShow('Row26', 'H');
                HideShow('DivPrtnerHdr', 'H');
                HideShow('div_PartnerDoc', 'H');
                cComboStatus.PerformCallback('IndividualBind~Select~');
                cComboAnnualIncm.PerformCallback('I');
            }
            if (cComboClType.GetValue() == "N") {
                HideShow('IndiDoc', 'H');
                HideShow('SpIndiv', 'H');
                //HideShow('Row4', 'H');
                HideShow('Row5', 'H');
                HideShow('Row6', 'H');
                HideShow('Row7', 'H');
                HideShow('Row8', 'H');
                HideShow('Row12', 'H');
                //HideShow('Row13','H');
                HideShow('Row16', 'H');
                HideShow('Row17_Col0', 'H');
                HideShow('Row18', 'H');
                //HideShow('DivMrThn25Lc','H');
                HideShow('DivInIPV', 'H');
                HideShow('Div_GVCHrecord', 'H');
                cComboStatus.PerformCallback('NonIndividualBind~Select~');
                cComboAnnualIncm.PerformCallback('N');
            }
        }


        function ChangeCompany() {
            SetValue("Hdn_CompanyID", cComboCompany.GetValue());
        }

        //=================For Call ajax to fill text boxes after page Load and with ICallbackEventHandler Interface==================


        function CallGenericAjaxJS(e) {
            // var AjaxList_TextBox=document.getElementById('<%=txtSelectionID.ClientID%>');
            //    AjaxList_TextBox.focus();
            //    AjaxComQuery=AjaxComQuery.replace("\'","'");
            //    ajax_showOptions(AjaxList_TextBox,'GenericAjaxList',e,replaceChars(AjaxComQuery),'Main');

            var AjaxList_TextBox = document.getElementById('<%=txtSelectionID.ClientID%>');
            AjaxList_TextBox.focus();
            AjaxComQuery = AjaxComQuery.replace("\'", "'");
            var GenericAjaxListAspxPath = '../CentralData/Pages/GenericAjaxList.aspx';
            ajax_showOptions(AjaxList_TextBox, 'GenericAjaxList', e, replaceChars(AjaxComQuery), 'Main', GenericAjaxListAspxPath);
        }
        //=================For Call ajax to fill text boxes on page Load===============================================================

        function FnShowFilter() {
            if (crdExCl.GetChecked() == true) {
                //cddlGroup.SetText('Branch');
                PopUpRow1.style.visibility = 'inherit';
                PopUpRow3.style.visibility = 'hidden';
                //HideShow('PopUpRow3','H');
                HideShow('PopUpRow4', 'H');
                HideShow('showFilter', 'S');
                //HideShow('PopUpRow1','S');
                CallServer("CallAjax-Branch", "");
                cddlGroup.PerformCallback();
                document.getElementById('<%=txtSelectionID.ClientID%>').focus();
                // setTimeout('cddlGroup.Focus()', 50);

            }
            else {
                HideShow('PopUpRow4', 'S');
                //HideShow('PopUpRow3','H');
                PopUpRow3.style.visibility = 'hidden';
                HideShow('showFilter', 'H');
                PopUpRow1.style.visibility = 'hidden';
                PopUpRow2.style.visibility = 'hidden';
                //    HideShow('PopUpRow1','H');
                //    HideShow('PopUpRow2','H');
            }

        }

        function FnShowNew() {
            if (crdNew.GetChecked() == true) {
                //HideShow('DivNewEntry','S');
                DivNewEntry.style.visibility = 'inherit';
                //HideShow('PopUpRow3','H');
                PopUpRow3.style.visibility = 'hidden';
                cddlGroup.Focus();
                HideShow('PopUpRow4', 'S');
            }
            else if (crdEdit.GetChecked() == true) {
                //HideShow('DivNewEntry','H');
                DivNewEntry.style.visibility = 'hidden';
                //HideShow('PopUpRow3','H');
                PopUpRow3.style.visibility = 'hidden';
                HideShow('PopUpRow4', 'S');
            }
            else if (crdImport.GetChecked() == true) {
                //HideShow('DivNewEntry','H');
                //HideShow('PopUpRow3','S');
                DivNewEntry.style.visibility = 'hidden';
                PopUpRow3.style.visibility = 'inherit';
                HideShow('PopUpRow4', 'S');
                cComboAgency.Focus();
                setTimeout('cComboAgency.Focus()', 50);
            }
            else if (crdUnSaved.GetChecked() == true) {
                //HideShow('DivNewEntry','H');
                //HideShow('PopUpRow3','H');
                DivNewEntry.style.visibility = 'hidden';
                PopUpRow3.style.visibility = 'hidden';
                HideShow('PopUpRow4', 'H');
            }
        }

        function lnkBtnAddFinalSelection() {
            var listBox = document.getElementById('<%=lstSelection.ClientID%>');
            var listID = '';
            var i;
            if (listBox.length > 0) {
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
                HideShow('showFilter', 'H');

            }
            else {
                alert('Please Select Atleast One Item!!!');
                document.getElementById('<%=txtSelectionID.ClientID%>').focus();
            }

        }

        function lnkBtnRemoveFromSelection() {
            var listBox = document.getElementById('<%=lstSelection.ClientID%>');
            var i;
            for (i = listBox.options.length - 1; i >= 0; i--) {
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

        function btnAddsubscriptionlist_click() {
            var txtName = document.getElementById('<%=txtSelectionID.ClientID%>');
            if (txtName.value != '') {
                var txtId = document.getElementById('<%=txtSelectionID_hidden.ClientID%>').value;
                var listBox = document.getElementById('<%=lstSelection.ClientID%>');
                var listLength = listBox.length;
                var opt = new Option();
                opt.value = txtId;
                opt.text = txtName.value;
                listBox[listLength] = opt;
                txtName.value = '';

            }
            else
                alert('Please search name and then Add!');

            txtName.focus();
            txtName.select();
        }

        function fnddlGroup() {
            document.getElementById('<%=lstSelection.ClientID%>').length = 0;
            if (cddlGroup.GetValue() == "0") {
                //fn_Branch(); 
                //HideShow('PopUpRow2','H');
                PopUpRow2.style.visibility = 'hidden';
                CallServer("CallAjax-Branch", "");
                document.getElementById('<%=txtSelectionID.ClientID%>').focus();
            }
            if (cddlGroup.GetValue() == "1") {
                cddlgrouptype.PerformCallback('GroupTypeBind~');
                fn_Group();
            }
            if (cddlGroup.GetValue() == "2") {
                //fn_Clients(); 
                //HideShow('PopUpRow2','H');  
                PopUpRow2.style.visibility = 'hidden';
                CallServer("CallAjax-Client", "");
                document.getElementById('<%=txtSelectionID.ClientID%>').focus();
            }
            Height('700', '700');
        }

        function fn_Group() {
            CallServer("CallAjax-Group~" + cddlgrouptype.GetText(), "");
            document.getElementById('<%=txtSelectionID.ClientID%>').focus();

        }

        function ddlgrouptype_EndCallback() {
            if (cddlgrouptype.cpBind == "T") {
                //HideShow('PopUpRow2','S');
                PopUpRow2.style.visibility = 'inherit';
                cddlgrouptype.SetSelectedIndex(0);
                cddlgrouptype.cpBind = null;

            }
        }

        function ReceiveServerData(rValue) {
            var Data = rValue.split('!');
            if (Data[1] != "undefined") {
                if (Data[0] == 'Client') {
                    document.getElementById('<%=HiddenField_Client.ClientID%>').value = Data[1];
                }
                if (Data[0] == 'Branch') {
                    document.getElementById('<%=HiddenField_Branch.ClientID%>').value = Data[1];
                }
                if (Data[0] == 'Group') {
                    document.getElementById('<%=HiddenField_Group.ClientID%>').value = Data[1];
                }
            }
            if (Data[0] == 'AjaxQuery') {
                AjaxComQuery = Data[1];
                var AjaxList_TextBox = document.getElementById('<%=txtSelectionID.ClientID%>');
                AjaxList_TextBox.value = '';
                AjaxList_TextBox.attachEvent('onkeyup', CallGenericAjaxJS);
            }
        }
        //-----------------------------------------------End Pop-Up---------------------------------------------------- 

        function OnGridEditClick() {
            SetValue("hdn_GridBindOrNotBind", "False");
        }
        function ShowRecordButtonClick() {
            HideShow('DivSaved', 'S');
            HideShow('DivEditGrdVw', 'S');
            cGridEntryRecord.PerformCallback('FetchClientDetailForEdit~');
        }
        function SaveButtonClick() {
            if (cComboClType.GetValue() == "I") {
                if (IdentityValidatnIndividual())
                    if (AddressValidatnIndividual())
                    if (OthrDetailsValidatnIndividual())
                    OthrDetlSave();
                else
                    return;
            }
            else {

                //            if(IdentityValidatnNonIndividual())
                //                if(AddressValidatnNonIndividual())
                //                    if(OthrDetailsValidatnNonIndividual())
                OthrDetlSave();
                //                    else
                //                        return;
            }


        }

        function ResetButtonClick() {
            cConfirmPopUp1.Show();

        }
        function ConfirmPopUpClickYes1() {
            cConfirmPopUp2.Show();
        }

        function ConfirmPopUpClickYes2() {
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

        function CbpPopUpShowDocAttach_EndCallBack() {

            if (cCbpPopUpShowDocAttach.cpNoOfDoc != null) {

                cCbpPopUpShowDocAttach.cpNoOfDoc = null;
            }
            if (cCbpPopUpShowDocAttach.cpShowDoc1 == "T") {
                cCbpPopUpShowDocAttach.PerformCallback("ShowNextDoc~2");
                cCbpPopUpShowDocAttach.cpShowDoc1 = null;
            }
            if (cCbpPopUpShowDocAttach.cpShowDoc != null) {
                var count = cCbpPopUpShowDocAttach.cpShowDoc + 1;
                cCbpPopUpShowDocAttach.PerformCallback("ShowNextDoc~" + count);
                cCbpPopUpShowDocAttach.cpShowDoc = null;
            }
        }



    </script>

    <!--  For Floating Div with snap-->

    <script type="text/javascript" src="../JSFunction/floating-1.12.js"></script>

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
     floatingMenu.add('btnClose',{targetLeft: 20, targetBottom: 190,snap: true});      
     floatingMenu.add('btnOpen',{targetLeft: 20, targetBottom: 190,snap: true});   

    </script>
    
    <script type="text/javascript">
        var LastFlag = null;
        function OnAccHolderFlagChange(cmbFlag) { 
            if (CcmbAccHolderType.InCallback())
                LastFlag = CcmbAccHolderTypeFlag.GetValue().toString();
            else
                CcmbAccHolderType.PerformCallback(CcmbAccHolderTypeFlag.GetValue().toString());
        }
        function cmbHolderType_EndCallback() {
            if (LastFlag) {
                CcmbAccHolderType.PerformCallback(LastFlag);
                LastFlag = null;
            }
        }
        function Fn_JDAddressTypeChanged(s) {
            var JDAddressType = s.GetValue(); 
            if (JDAddressType == "3") { 
                document.getElementById("dvJDAddress").style.display = "block";
            }
            else {
                document.getElementById("dvJDAddress").style.display = "none";
            
            }
        }
    </script>

</head>
<body id="abc">
    <form id="form1" runat="server">
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
                    <div class="left cellTotHeader" style="width: 90px;">
                        &nbsp;
                    </div>
                    <div id="Div_Common_Show" runat="server" class="left cellTotHeader" style="width: 182px;
                        cursor: pointer" onclick="return CommonShow()">
                        <b>Application Number & BranchID</b>
                    </div>
                    <div id="Div_Identity_Show" runat="server" class="left cellTotHeader" style="width: 180px;
                        cursor: pointer" onclick="return IdentityShow()">
                        <b>Identity Details</b>
                    </div>
                    <div id="Div_Address_Show" runat="server" class="left cellTotHeader" style="width: 180px;
                        cursor: pointer" onclick="return AddressShow()">
                        <b>Address Details</b>
                    </div>
                    <div id="Div_Other_Show" runat="server" class="left cellTotHeader" style="width: 180px;
                        cursor: pointer" onclick="return OtherShow()">
                        <b>Other Details</b>
                    </div>
                    <span class="clear"></span>
                </div>
            </div>
        </div>
        <div id="header" class="Header" style="height: 26px">
            <div class="left" style="width: 85%">
                KRA Registration Form For <span id="SpIndiv">Individual </span><span id="SpNonIndiv">
                    Non-Individual</span>
            </div>
            <div class="left" style="width: 15%;">
                <dxe:ASPxButton ID="BtnGoBack" runat="server" AutoPostBack="false" TabIndex="0" ToolTip="Return Back To First Selection"
                    Width="26px" Height="25px" BackColor="Transparent" ClientInstanceName="cBtnGoBack">
                    <Border BorderColor="Transparent"></Border>
                    <BackgroundImage HorizontalPosition="left" ImageUrl="../images/back.png" VerticalPosition="Top" />
                    <ClientSideEvents Click="function(s, e) {RecordAddButtonClick();}"></ClientSideEvents>
                </dxe:ASPxButton>
            </div>
        </div>
        <div id="DivGridRecord" style="width: 90%; padding-top: 4px" align="center">
            <div id="rowGV0" class="container" style="height: 35px">
                <div id="rowGV0_Col0" class="LFloat_Lable Leftdiv BtmMargin" style="width: 180px;
                    height: 20px; margin-left: 4px">
                    &nbsp;KRA Created Date Range:
                </div>
                <div id="rowGV0_Col1" class="LFloat_Row BtmMargin" style="height: 20px; text-align: center;">
                    <dxe:ASPxDateEdit ID="RecordFrmDt" runat="server" ClientInstanceName="cRecordFrmDt"
                        DateOnError="Today" EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True"
                        Width="150px" Font-Size="11px" TabIndex="0">
                        <DropDownButton Text="From">
                        </DropDownButton>
                    </dxe:ASPxDateEdit>
                </div>
                <div id="rowGV0_Col2" class="LFloat_Row DivName BtmMargin" style="height: 20px; text-align: center;">
                    <dxe:ASPxDateEdit ID="RecordToDt" runat="server" ClientInstanceName="cRecordToDt"
                        DateOnError="Today" EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True"
                        Width="150px" Font-Size="11px" TabIndex="0">
                        <DropDownButton Text="To">
                        </DropDownButton>
                    </dxe:ASPxDateEdit>
                </div>
                <div class="left BtmMargin" style="margin-left: 10px; font-size: 12pt; margin-right: 4px">
                    <dxe:ASPxButton ID="BtnShow" runat="server" AutoPostBack="false" TabIndex="0" Text="Show"
                        ToolTip="Add New Record" Width="100px" ClientInstanceName="cBtnShow" Height="20px">
                        <Border BorderColor="White"></Border>
                        <ClientSideEvents Click="function(s, e) {ShowRecordButtonClick();}"></ClientSideEvents>
                    </dxe:ASPxButton>
                </div>
            </div>
            <div id="DivEditGrdVw">
                <div id="lblGridHeader" class="paging textLeft" style="font-size: 12pt; width: 950px;
                    margin-top: 10px">
                    <span id="DivUnsaved" class="pagingContent">Unsaved Records Still In Process: </span>
                    <span id="DivSaved" class="pagingContent">Saved KRA Records Of The Given Date Range:
                    </span>
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
                        Page <b id="B_PageNo" runat="server"></b>&nbsp;Of &nbsp;<b id="B_TotalPage" runat="server"></b>
                        ( <b id="B_TotalRows" runat="server"></b>items ) <span class="textLeft"><a id="A_LeftNav"
                            runat="server" href="javascript:void(0);" onclick="OnLeftNav_Click()">
                            <img align="middle" alt="" class="paging_nav" src="../images/LeftNav.gif" width="16" />
                        </a></span><a id="A1" runat="server" class="number_box" href="javascript:void(0);"
                            onclick="OnPageNo_Click('A1')">1 </a><a id="A2" runat="server" class="number_box"
                                href="javascript:void(0);" onclick="OnPageNo_Click('A2')">2 </a><a id="A3" runat="server"
                                    class="number_box" href="javascript:void(0);" onclick="OnPageNo_Click('A3')">3
                        
                        
                        
                        </a><a id="A4" runat="server" class="number_box" href="javascript:void(0);" onclick="OnPageNo_Click('A4')">
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
                    SettingsBehavior-ConfirmDelete="true" OnCustomCallback="GridEntryRecord_CustomCallback"
                    OnHtmlEditFormCreated="GridEntryRecord_HtmlEditFormCreated" OnRowDeleting="GridEntryRecord_RowDeleting"
                    OnCommandButtonInitialize="GridEntryRecord_CommandButtonInitialize">
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
                        <dxwgv:GridViewCommandColumn VisibleIndex="0" Width="125px" FixedStyle="Left">
                            <HeaderTemplate>
                                <dxe:ASPxButton ID="BtnGoBack" runat="server" AutoPostBack="false" TabIndex="0" Text="        Back To Selection"
                                    ToolTip="Return Back To The Selection" Width="150px" ClientInstanceName="cBtnGoBack">
                                    <Border BorderColor="White"></Border>
                                    <BackgroundImage HorizontalPosition="left" ImageUrl="~/images/pFirst.png" Repeat="NoRepeat"
                                        VerticalPosition="center" />
                                    <ClientSideEvents Click="function(s, e) {RecordAddButtonClick();}"></ClientSideEvents>
                                </dxe:ASPxButton>
                            </HeaderTemplate>
                            <EditButton Text="Edit" Visible="True">
                            </EditButton>
                            <CellStyle Font-Underline="False" Font-Size="12px">
                                <HoverStyle BackColor="#000040">
                                </HoverStyle>
                            </CellStyle>
                            <DeleteButton Visible="True">
                            </DeleteButton>
                        </dxwgv:GridViewCommandColumn>
                        <dxwgv:GridViewDataTextColumn Caption="ClientType" FieldName="ClientType" VisibleIndex="1"
                            Width="80px" FixedStyle="Left">
                            <CellStyle CssClass="gridcellleft" Font-Size="11px" HorizontalAlign="Center">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Internal Ref No" FieldName="FormNo" VisibleIndex="2"
                            Width="110px" FixedStyle="Left">
                            <CellStyle CssClass="gridcellleft" Font-Size="11px">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Application No" FieldName="ApplicatnNo" VisibleIndex="3"
                            Width="110px" FixedStyle="Left">
                            <CellStyle CssClass="gridcellleft" Font-Size="11px">
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
                            Width="100px">
                            <CellStyle CssClass="gridcellleft" Font-Size="11px" HorizontalAlign="Center">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Client UCC" FieldName="ClntUCC" VisibleIndex="6"
                            Width="100px">
                            <CellStyle CssClass="gridcellleft" Font-Size="11px">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataDateColumn Caption="DOB" FieldName="DOB" VisibleIndex="7" Width="170px">
                            <CellStyle CssClass="gridcellleft" Font-Size="11px">
                            </CellStyle>
                            <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy" EditFormat="Custom">
                            </PropertiesDateEdit>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataDateColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Registered Address" FieldName="RegisteredAddress"
                            VisibleIndex="8" Width="250px">
                            <CellStyle CssClass="gridcellleft" Font-Size="11px">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Correspondence Address" FieldName="CorrespondenceAddress"
                            VisibleIndex="9" Width="250px">
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
                        <dxwgv:GridViewDataDateColumn Caption="Create DateTime" FieldName="CreateDateTime"
                            VisibleIndex="12">
                            <CellStyle CssClass="gridcellleft" Font-Size="11px">
                            </CellStyle>
                            <PropertiesDateEdit DisplayFormatString="dd-MMM-yyyy" EditFormat="Custom">
                            </PropertiesDateEdit>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataDateColumn>
                        <dxwgv:GridViewDataTextColumn Caption="RowID" FieldName="RowID" Visible="False" VisibleIndex="13">
                            <CellStyle CssClass="gridcellleft" Font-Size="11px" HorizontalAlign="Center">
                            </CellStyle>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="BindWith" FieldName="BindWith" Visible="False"
                            VisibleIndex="14">
                            <CellStyle CssClass="gridcellleft" Font-Size="11px" HorizontalAlign="Center">
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
        <div id="DivEntryForm">
            <div id="Div_Container" class="container" style="width: 99%">
                <div id="Div_Common">
                    <dxcp:ASPxCallbackPanel ID="CbpComon" runat="server" ClientInstanceName="cCbpComon"
                        OnCallback="CbpComon_Callback" BackColor="Transparent" Width="100%">
                        <PanelCollection>
                            <dxp:PanelContent runat="server">
                                <div id="Row00" class="Row">
                                    <div id="Row00_Col0" class="LFloat_Lable Leftdiv">
                                        Application No:
                                    </div>
                                    <div id="Row00_Col1" class="LFloat_Row" style="height: 25px" onclick="return Row00_Col1_onclick()">
                                        <dxcp:ASPxCallbackPanel ID="CbpAppliNo" runat="server" ClientInstanceName="cCbpAppliNo"
                                            BackColor="Transparent" OnCallback="CbpAppliNo_Callback" Width="150px">
                                            <ClientSideEvents EndCallback="function (s, e) {CbpAppliNo_EndCallBack();}" />
                                            <PanelCollection>
                                                <dxp:PanelContent runat="server">
                                                    <dxe:ASPxTextBox ID="TxtAppliNo" runat="server" ClientInstanceName="cTxtAppliNo"
                                                        MaxLength="16" Width="150px">
                                                        <%--<ClientSideEvents  TextChanged="CheckAppliNoExist"/>--%>
                                                    </dxe:ASPxTextBox>
                                                </dxp:PanelContent>
                                            </PanelCollection>
                                        </dxcp:ASPxCallbackPanel>
                                    </div>
                                    <div id="Row00_Col2" class="LFloat_Lable Leftdiv" style="margin-left: 10px">
                                        <span class="Spanclass"></span>Application Date:<span style="font-size: 10pt; color: #ff0000">**</span>&nbsp;
                                    </div>
                                    <div id="Row00_Col3" class="LFloat_Row" style="height: 25px">
                                        <dxe:ASPxDateEdit ID="AppliDt" runat="server" ClientInstanceName="cAppliDt" DateOnError="Today"
                                            EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="150px"
                                            Font-Size="11px" TabIndex="0">
                                            <ClientSideEvents GotFocus="AppliNoAlert" />
                                        </dxe:ASPxDateEdit>
                                    </div>
                                    <span class="Spanclass">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; **</span> <span style="font-size: 8pt">
                                        Mandatory Fields</span>
                                </div>
                                <div id="Row01" class="Row">
                                    <div id="Row01_Col0" class="LFloat_Lable Leftdiv" style="height: 30px">
                                        <span class="Spanclass"></span>Internal Refference No:<span style="font-size: 10pt;
                                            color: #ff0000">**</span>
                                    </div>
                                    <div id="Row01_Col1" class="LFloat_Row" style="height: 30px">
                                        <dxcp:ASPxCallbackPanel ID="CbpFormNo" runat="server" ClientInstanceName="cCbpFormNo"
                                            BackColor="Transparent" OnCallback="CbpFormNo_Callback" Width="150px">
                                            <ClientSideEvents EndCallback="function (s, e) {CbpFormNo_EndCallBack();}" />
                                            <PanelCollection>
                                                <dxp:PanelContent runat="server">
                                                    <dxe:ASPxTextBox runat="server" Width="150px" ClientInstanceName="cTxtFormNo" ID="TxtFormNo">
                                                    </dxe:ASPxTextBox>
                                                </dxp:PanelContent>
                                            </PanelCollection>
                                        </dxcp:ASPxCallbackPanel>
                                    </div>
                                </div>
                                <div id="Row01_Col4" class="LFloat_Lable Leftdiv LeftMargin" style="width: 190px;
                                    height: 30px;">
                                    Branch :
                                </div>
                                <div id="Row01_Col5" class="LFloat_Row" style="height: 30px">
                                    <asp:TextBox ID="TxtBranch" runat="server" Width="150px"></asp:TextBox>
                                </div>
                                <%-- <div id="Row01_Col2" class="LFloat_Lable Leftdiv LeftMargin" style="height: 30px" >
                                     <span style="font-size: 9pt;color: #000000">
                                        Client ID (UCC) : </span>
                                 </div>
                                 <div id="Row01_Col3" class="LFloat_Row" style="height: 30px; width: 155px;">
                                     <dxcp:ASPxCallbackPanel ID="CbpUcc" runat="server" ClientInstanceName="cCbpUcc" BackColor="Transparent"
                                         OnCallback="CbpUcc_Callback" Width="150px">
                                         <clientsideevents endcallback="function (s, e) {CbpUcc_EndCallBack();}" />
                                          <panelcollection>
                                            <dxp:PanelContent runat="server">
                                             <dxe:ASPxTextBox runat="server" Width="155px" ClientInstanceName="cTxtCntUcc" ID="TxtCntUcc"></dxe:ASPxTextBox>

                                             </dxp:PanelContent>
                                            </panelcollection>
                                     </dxcp:ASPxCallbackPanel>
                                     
                                 </div>
                             </div> --%>
                                <asp:HiddenField ID="TxtBranch_hidden" runat="server" Value="0" />
                                <asp:HiddenField ID="hdnApplicantNameUpdateFlag" runat="server" Value="0" />
                                <asp:HiddenField ID="hdnPersonalEntityDetailsUpdateFlag" runat="server" Value="0" />
                                <asp:HiddenField ID="hdnAddressDetailsUpdateFlag" runat="server" Value="0" />
                                <asp:HiddenField ID="hdnContactDetailsUpdateFlag" runat="server" Value="0" />
                                <asp:HiddenField ID="hdnRemarksUpdateFlag" runat="server" Value="0" />
                                <asp:HiddenField ID="hdnKYCVerificationUpdateFlag" runat="server" Value="0" />
                                <asp:HiddenField ID="hdnIdentityDetailsUpdateFlag" runat="server" Value="0" />
                                <asp:HiddenField ID="hdnRelatedPersonDetailsFlag" runat="server" Value="0" />
                                <asp:HiddenField ID="hdnControllingPersonDetailsFlag" runat="server" Value="0" />
                                <asp:HiddenField ID="hdnImageDetailsUpdateFlag" runat="server" Value="0" />
                                <div id="DivBtnSaveCmn" class="left" style="margin-left: 10px; font-size: 12pt;">
                                    <dxe:ASPxButton ID="BtnSaveCmn" runat="server" AutoPostBack="false" TabIndex="0"
                                        ToolTip="Save Entered Data" Width="106px" ClientInstanceName="cBtnSaveCmn" BackColor="Transparent"
                                        Height="60px">
                                        <ClientSideEvents Click="function(s, e) {SaveCommon();}"></ClientSideEvents>
                                        <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_save.png"
                                            Repeat="NoRepeat" />
                                        <Border BorderColor="Black" BorderStyle="None"></Border>
                                    </dxe:ASPxButton>
                                </div>
                                <div id="DivBtnEditCmn" class="left" style="margin-left: 10px; font-size: 12pt;">
                                    <div class="left">
                                        <dxe:ASPxButton ID="BtnEditCmn" runat="server" AutoPostBack="false" TabIndex="0"
                                            ToolTip="Edit Entered Data" Width="70px" ClientInstanceName="cBtnEditCmn" BackColor="Transparent"
                                            Height="60px">
                                            <ClientSideEvents Click="function(s, e) {EditCommon();}"></ClientSideEvents>
                                            <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/Edit.jpg"
                                                Repeat="NoRepeat" />
                                            <Border BorderStyle="None" />
                                        </dxe:ASPxButton>
                                    </div>
                                    <div class="left ">
                                        <dxe:ASPxButton ID="BtnNextCmn" runat="server" AutoPostBack="false" TabIndex="0"
                                            Text="" ToolTip="Proceed To Identity Details" Width="70px" ClientInstanceName="cBtnNextCmn"
                                            Height="60px" BackColor="Transparent">
                                            <ClientSideEvents Click="function(s, e) {CommonNext();}"></ClientSideEvents>
                                            <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_foward.png"
                                                Repeat="NoRepeat" />
                                            <Border BorderStyle="None" />
                                        </dxe:ASPxButton>
                                    </div>
                                </div>
                                <br />
                                <br />
                                <br />
                                <br />
                                <div id="DivApliNoAlert" style="width: 1200px; font-size: 9pt; height: 30px">
                                </div>
                                <br />
                                <br />
                                <br />
                            </dxp:PanelContent>
                        </PanelCollection>
                        <ClientSideEvents EndCallback="function (s, e) {CbpComon_EndCallBack();}" />
                    </dxcp:ASPxCallbackPanel>
                </div>
                <div id="Div_Identity" class="AccordionContainer" style="width: 99%">
                    <div id="Accordion1Content" class="AccordionContent" style="left: 0px; top: 0px">
                        <div>
                            <div class="DivHeader" style="width: 100%" onselectstart="return false;">
                                &nbsp; IDENTITY DETAILS
                            </div>
                        </div>
                        <dxcp:ASPxCallbackPanel ID="CbpIdntty" runat="server" ClientInstanceName="cCbpIdntty"
                            OnCallback="CbpIdntty_Callback" BackColor="Transparent" Width="100%">
                            <PanelCollection>
                                <dxp:PanelContent runat="server">
                                    <div id="Row0" class="Row">
                                        <div id="Row0_Col0" class="LFloat_Lable Leftdiv BtmMargin" style="height: 38px;">
                                            <span class="Spanclass"></span>Name Of The Applicant:<span style="font-size: 10pt;
                                                color: #ff0000">**</span>
                                        </div>
                                        <div id="Div1" class="LFloat_Row BtmMargin" style="height: 38px; text-align: center;">
                                            <dxe:ASPxTextBox ID="txtApplicantPrefix" runat="server" ClientInstanceName="cTxtApplicntPrefix"
                                                Width="155px" HorizontalAlign="Left">
                                                <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtApplicntName);GenerateUCC();}" 
                                         TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                         </ClientSideEvents>--%>
                                            </dxe:ASPxTextBox>
                                            <span style="font-size: 8pt">[Prefix]</span>
                                        </div>
                                        <div id="Row0_Col1" class="LFloat_Row BtmMargin" style="height: 38px; text-align: center;">
                                            <dxe:ASPxTextBox ID="TxtApplicntName" runat="server" ClientInstanceName="cTxtApplicntName"
                                                Width="155px" HorizontalAlign="Left">
                                                <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtApplicntName);GenerateUCC();}" 
                                         TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                         </ClientSideEvents>--%>
                                            </dxe:ASPxTextBox>
                                            <span style="font-size: 8pt">[First Name]</span>
                                        </div>
                                        <div id="Row0_Col2" class="LFloat_Row DivName" style="height: 38px;">
                                            <dxe:ASPxTextBox ID="TxtApplicntMidlName" runat="server" ClientInstanceName="cTxtApplicntMidlName"
                                                Width="155px" HorizontalAlign="Left">
                                                <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtApplicntMidlName);}" 
                                         TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                         </ClientSideEvents>--%>
                                            </dxe:ASPxTextBox>
                                            <span style="font-size: 8pt">[Middle Name]</span>
                                        </div>
                                        <div id="Row0_Col3" class="LFloat_Row DivName" style="height: 38px;">
                                            <dxe:ASPxTextBox ID="TxtApplicntLstName" runat="server" ClientInstanceName="cTxtApplicntLstName"
                                                Width="155px" HorizontalAlign="Left">
                                                <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtApplicntLstName);}" 
                                         TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                         </ClientSideEvents>--%>
                                            </dxe:ASPxTextBox>
                                            <span style="font-size: 8pt">[Last Name]</span>
                                        </div>
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="font-size: 10pt; color: #ff0000">
                                            **</span> <span style="font-size: 8pt">Mandatory Fields</span></div>
                                    <%--<div id="Row0" class="Row">
                                 <div id="Row0_Col0" class="LFloat_Lable Leftdiv BtmMargin">
                                     <span class="Spanclass"></span> Name Of The Applicant:<span style="font-size: 10pt;
                                         color: #ff0000">**</span>&nbsp;
                                 </div>
                                 <div id="Row0_Col1" class="LFloat_Row BtmMargin" style="height: 25px; text-align: center;">
                                     <dxe:ASPxTextBox ID="TxtApplicntName" ForeColor="Silver" Text="First Name" runat="server" ClientInstanceName="cTxtApplicntName"
                                         Width="155px" HorizontalAlign="Left">
                                         <ClientSideEvents GotFocus="function(s,e){DevE_WaterMark_Focus(cTxtApplicntName,'First Name');}" LostFocus="function(s,e){DevE_WaterMark_Blur(cTxtApplicntName,'First Name');}" />
                                     </dxe:ASPxTextBox>
                                 </div>
                                 <div id="Row0_Col2" class="LFloat_Row DivName">
                                     <dxe:ASPxTextBox ID="TxtApplicntMidlName" runat="server" ClientInstanceName="cTxtApplicntMidlName"
                                         Width="155px" NullText="          Middle Name" ForeColor="Silver" HorizontalAlign="Left">
                                         <ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtApplicntMidlName);}" 
                                         TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                         </ClientSideEvents>
                                     </dxe:ASPxTextBox>
                                 </div>
                                 <div id="Row0_Col3" class="LFloat_Row DivName">
                                     <dxe:ASPxTextBox ID="TxtApplicntLstName" runat="server" ClientInstanceName="cTxtApplicntLstName"
                                         Width="155px" NullText="           Last Name" ForeColor="Silver" HorizontalAlign="Left">
                                         <ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtApplicntLstName);}" 
                                         TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                         </ClientSideEvents>
                                     </dxe:ASPxTextBox>
                                 </div>
                             </div>--%>
                                    <div id="Row1" class="Row">
                                        <div id="Row1_Col0" class="LFloat_Lable Leftdiv">
                                            Date Of Incorporation:
                                        </div>
                                        <div id="Row1_Col1" class="LFloat_Row" style="height: 25px">
                                            <dxe:ASPxDateEdit ID="IncorpDt" runat="server" ClientInstanceName="cIncorpDt" DateOnError="Today"
                                                EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="155px"
                                                Font-Size="11px">
                                            </dxe:ASPxDateEdit>
                                        </div>
                                    </div>
                                    <div id="Row2">
                                        <div id="Row2_Col0" class="LFloat_Lable Leftdiv" style="margin-left: 10px; width: 155px;">
                                            Place Of Incorporation :
                                        </div>
                                        <div id="Row2_Col1" class="LFloat_Row" style="height: 25px">
                                            <%--<dxe:ASPxComboBox ID="ComboIncorpPlc" runat="server" ClientInstanceName="cComboIncorpPlc"
                                                EnableIncrementalFiltering="True" Font-Size="Small" ValueType="System.String"
                                                Width="155px">
                                                <ClientSideEvents SelectedIndexChanged="function(s,e){OnTypeChange()}"></ClientSideEvents>
                                            </dxe:ASPxComboBox>--%>                                            
                                            <dxe:ASPxTextBox ID="ComboIncorpPlc" runat="server" ClientInstanceName="cComboIncorpPlc"
                                                Width="155px" HorizontalAlign="Left">                                               
                                            </dxe:ASPxTextBox>                                            
                                        </div>
                                        <div id="Row2_Col2" class="LFloat_Lable Leftdiv" style="height: 37px">
                                            Country of Incorporation:
                                        </div>
                                        <div id="Row2_Col3" class="LFloat_Row" style="height: 37px">
                                            <dxe:ASPxComboBox ID="cmbCountryOfIncorporation" runat="server" EnableIncrementalFiltering="True"
                                                ValueType="System.String" ClientInstanceName="CcmbCountryOfIncorporation" Width="155px"
                                                Font-Size="11px">
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
                                                Width="155px" Font-Size="11px">
                                            </dxe:ASPxDateEdit>
                                        </div>
                                        <div id="Row3_Col2" class="LFloat_Lable Leftdiv" style="height: 37px">
                                            Identification Type:
                                        </div>
                                        <div id="Row3_Col3" class="LFloat_Row" style="height: 37px">
                                            <dxe:ASPxComboBox ID="cmdIdentificationType" runat="server" EnableIncrementalFiltering="True"
                                                ValueType="System.String" ClientInstanceName="CcmdIdentificationType" Width="155px"
                                                Font-Size="11px">
                                            </dxe:ASPxComboBox>
                                        </div>
                                        <div id="Row2_Col4" class="LFloat_Lable Leftdiv" style="height: 37px">
                                            Country of residence as per Tax Laws:
                                        </div>
                                        <div id="Row2_Col5" class="LFloat_Row" style="height: 37px">
                                            <dxe:ASPxComboBox ID="cmbCountryresidenceTaxLaws" runat="server" EnableIncrementalFiltering="True"
                                                ValueType="System.String" ClientInstanceName="CcmbCountryresidenceTaxLaws" Width="155px"
                                                Font-Size="11px">
                                            </dxe:ASPxComboBox>
                                        </div>
                                    </div>
                                    <div id="Div2" class="Row">
                                        <div id="Div3" class="LFloat_Lable Leftdiv">
                                            <span class="Spanclass"></span>Specify Father / Spouse:<span style="font-size: 10pt;
                                                color: #ff0000">**</span>&nbsp;
                                        </div>
                                        <div id="Div5" class="LFloat_Row" style="height: 25px">
                                            <asp:RadioButton ID="btnFather" runat="server" Checked="True" Text="Father" GroupName="FS" />
                                            <asp:RadioButton ID="btnSpouse" runat="server" Text="Spouse" GroupName="FS" />
                                        </div>
                                    </div>
                                    <div id="Row4" class="Row" style="height: 38px; text-align: center;">
                                        <div id="Row4_Col0" class="LFloat_Lable Leftdiv">
                                            Father's / Spouse Name:<span style="font-size: 10pt; color: #ff0000">**</span>&nbsp;
                                        </div>
                                        <div id="Row4_Col1" class="LFloat_Row BtmMargin" style="height: 38px">
                                            <dxe:ASPxTextBox ID="TxtFthrName" runat="server" ClientInstanceName="cTxtFthrName"
                                                Width="500px" Visible="false">
                                            </dxe:ASPxTextBox>
                                            <dxe:ASPxTextBox ID="txtFatherPrefix" runat="server" ClientInstanceName="ctxtFatherPrefix"
                                                Width="155px" HorizontalAlign="Left">
                                            </dxe:ASPxTextBox>
                                            <span style="font-size: 8pt">[Prefix]</span>
                                        </div>
                                        <div id="Div6" class="LFloat_Row BtmMargin" style="height: 38px">
                                            <dxe:ASPxTextBox ID="txtFatherFirstName" runat="server" ClientInstanceName="ctxtFatherFirstName"
                                                Width="155px" HorizontalAlign="Left">
                                            </dxe:ASPxTextBox>
                                            <span style="font-size: 8pt">[First Name]</span>
                                        </div>
                                        <div id="Div7" class="LFloat_Row BtmMargin" style="height: 38px">
                                            <dxe:ASPxTextBox ID="txtFatherMiddleName" runat="server" ClientInstanceName="ctxtFatherMiddleName"
                                                Width="155px" HorizontalAlign="Left">
                                            </dxe:ASPxTextBox>
                                            <span style="font-size: 8pt">[Middle Name]</span>
                                        </div>
                                        <div id="Div8" class="LFloat_Row DivName" style="height: 38px">
                                            <dxe:ASPxTextBox ID="txtFatherLastName" runat="server" ClientInstanceName="ctxtFatherLastName"
                                                Width="155px" HorizontalAlign="Left">
                                            </dxe:ASPxTextBox>
                                            <span style="font-size: 8pt">[Last Name]</span>
                                        </div>
                                    </div>
                                    <div id="Row5" class="Row">
                                        <div id="Row5_Col0" class="LFloat_Lable Leftdiv">
                                            Gender:
                                        </div>
                                        <div id="Row5_Col1" class="LFloat_Row FontChange" style="height: 25px">
                                            <asp:RadioButton ID="rdMale" runat="server" Checked="True" Text="Male" GroupName="a" />
                                            <asp:RadioButton ID="rdFemale" runat="server" Text="Female" GroupName="a" />
                                        </div>
                                    </div>
                                    <div id="Row6">
                                        <div id="Row6_Col0" class="LFloat_Row Leftdiv" style="margin-left: 5px">
                                            Marital Status:
                                        </div>
                                        <div id="Row6_Col1" class="LFloat_Row FontChange" style="height: 25px; margin-left: 10px">
                                            <asp:RadioButton ID="rdSingl" runat="server" Checked="True" GroupName="b" Text="Single"/>
                                            <asp:RadioButton ID="rdMrd" runat="server" GroupName="b" Text="Married" />
                                        </div>
                                    </div>
                                    <div id="RowMaiden" class="Row" runat="server">
                                        <div id="Div10" class="LFloat_Lable Leftdiv BtmMargin" style="height: 38px;">
                                            Maiden Name:<%--<span style="font-size: 10pt;
                                                    color: #ff0000">**</span>--%>
                                        </div>
                                        <div id="Div11" class="LFloat_Row BtmMargin" style="height: 38px; text-align: center;">
                                            <dxe:ASPxTextBox ID="txtMaidenNamePrefix" runat="server" ClientInstanceName="ctxtMaidenNamePrefix"
                                                Width="155px" HorizontalAlign="Left">
                                                <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtApplicntName);GenerateUCC();}" 
                                         TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                         </ClientSideEvents>--%>
                                            </dxe:ASPxTextBox>
                                            <span style="font-size: 8pt">[Prefix]</span>
                                        </div>
                                        <div id="Div12" class="LFloat_Row BtmMargin" style="height: 38px; text-align: center;">
                                            <dxe:ASPxTextBox ID="txtMaidenNameFirst" runat="server" ClientInstanceName="ctxtMaidenNameFirst"
                                                Width="155px" HorizontalAlign="Left">
                                                <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtApplicntName);GenerateUCC();}" 
                                         TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                         </ClientSideEvents>--%>
                                            </dxe:ASPxTextBox>
                                            <span style="font-size: 8pt">[First Name]</span>
                                        </div>
                                        <div id="Div13" class="LFloat_Row DivName" style="height: 38px;">
                                            <dxe:ASPxTextBox ID="txtMaidenNameMiddle" runat="server" ClientInstanceName="ctxtMaidenNameMiddle"
                                                Width="155px" HorizontalAlign="Left">
                                                <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtApplicntMidlName);}" 
                                         TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                         </ClientSideEvents>--%>
                                            </dxe:ASPxTextBox>
                                            <span style="font-size: 8pt">[Middle Name]</span>
                                        </div>
                                        <div id="Div14" class="LFloat_Row DivName" style="height: 38px;">
                                            <dxe:ASPxTextBox ID="txtMaidenNameLast" runat="server" ClientInstanceName="ctxtMaidenNameLast"
                                                Width="155px" HorizontalAlign="Left">
                                                <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtApplicntLstName);}" 
                                         TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                         </ClientSideEvents>--%>
                                            </dxe:ASPxTextBox>
                                            <span style="font-size: 8pt">[Last Name]</span>
                                        </div>
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="font-size: 10pt; color: #ff0000">
                                            **</span> <span style="font-size: 8pt">Mandatory Fields</span></div>
                                    <div id="Div9" class="Row" runat="server">
                                        <div id="Div15" class="LFloat_Lable Leftdiv BtmMargin" style="height: 38px;">
                                            Mother Name:<%--<span style="font-size: 10pt;
                                                    color: #ff0000">**</span>--%>
                                        </div>
                                        <div id="Div16" class="LFloat_Row BtmMargin" style="height: 38px; text-align: center;">
                                            <dxe:ASPxTextBox ID="txtMotherNamePrefix" runat="server" ClientInstanceName="ctxtMotherNamePrefix"
                                                Width="155px" HorizontalAlign="Left">
                                                <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtApplicntName);GenerateUCC();}" 
                                         TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                         </ClientSideEvents>--%>
                                            </dxe:ASPxTextBox>
                                            <span style="font-size: 8pt">[Prefix]</span>
                                        </div>
                                        <div id="Div17" class="LFloat_Row BtmMargin" style="height: 38px; text-align: center;">
                                            <dxe:ASPxTextBox ID="txtMotherFirstName" runat="server" ClientInstanceName="ctxtMotherFirstName"
                                                Width="155px" HorizontalAlign="Left">
                                                <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtApplicntName);GenerateUCC();}" 
                                         TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                         </ClientSideEvents>--%>
                                            </dxe:ASPxTextBox>
                                            <span style="font-size: 8pt">[First Name]</span>
                                        </div>
                                        <div id="Div18" class="LFloat_Row DivName" style="height: 38px;">
                                            <dxe:ASPxTextBox ID="txtMotherMiddleName" runat="server" ClientInstanceName="ctxtMotherMiddleName"
                                                Width="155px" HorizontalAlign="Left">
                                                <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtApplicntMidlName);}" 
                                         TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                         </ClientSideEvents>--%>
                                            </dxe:ASPxTextBox>
                                            <span style="font-size: 8pt">[Middle Name]</span>
                                        </div>
                                        <div id="Div19" class="LFloat_Row DivName" style="height: 38px;">
                                            <dxe:ASPxTextBox ID="txtMotherLastName" runat="server" ClientInstanceName="ctxtMotherLastName"
                                                Width="155px" HorizontalAlign="Left">
                                                <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtApplicntLstName);}" 
                                         TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                         </ClientSideEvents>--%>
                                            </dxe:ASPxTextBox>
                                            <span style="font-size: 8pt">[Last Name]</span>
                                        </div>
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="font-size: 10pt; color: #ff0000">
                                            **</span> <span style="font-size: 8pt">Mandatory Fields</span></div>
                                    <div id="Row7" class="Row">
                                        <div id="Row7_Col0" class="LFloat_Lable Leftdiv">
                                            <span style="font-size: 10pt; color: #ff0000"></span>Date Of Birth:<span style="font-size: 10pt;
                                                color: #ff0000">**</span>
                                        </div>
                                        <div id="Row7_Col1" class="LFloat_Row" style="height: 25px">
                                            <dxe:ASPxDateEdit ID="dobDt" runat="server" ClientInstanceName="cdobDt" DateOnError="Today"
                                                EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="150px"
                                                Font-Size="11px">
                                            </dxe:ASPxDateEdit>
                                        </div>
                                        <div id="Row7_Col2" class="LFloat_Lable Leftdiv">
                                            <span style="font-size: 10pt; color: #ff0000"></span>City/Place of Birth:<span style="font-size: 10pt;
                                                color: #ff0000">**</span>
                                        </div>
                                        <div id="Row7_Col3" class="LFloat_Row" style="height: 25px">
                                            <dxe:ASPxTextBox ID="txtPlaceogBirth" runat="server" ClientInstanceName="CtxtPlaceogBirth" MaxLength="10"
                                                Width="150px"> 
                                            </dxe:ASPxTextBox>
                                        </div>
                                        <div id="Row7_Col4" class="LFloat_Lable Leftdiv">
                                            <span style="font-size: 10pt; color: #ff0000"></span>Country of Birth:<span style="font-size: 10pt;
                                                color: #ff0000">**</span>
                                        </div>
                                        <div id="Row7_Col5" class="LFloat_Row" style="height: 25px">
                                            <dxe:ASPxComboBox ID="cmbCountryofBirth"  runat="server" EnableIncrementalFiltering="True"
                                                    ValueType="System.String" Width="156px" ClientInstanceName="CcmbCountryofBirth" Font-Size="Small"> 
                                                </dxe:ASPxComboBox>
                                        </div>
                                        
                                    </div>
                                    <div id="Row8" class="Row">
                                        <div id="Row8_Col0" class="LFloat_Lable Leftdiv" style="height: 35px">
                                            Nationality:
                                        </div>
                                        <div id="Row8_Col1" class="LFloat_Row" style="height: 35px">
                                            <div class="left">
                                                <dxe:ASPxRadioButton ID="rdIndian" runat="server" ClientInstanceName="crdIndian"
                                                    Checked="True" Text="Indian" Layout="Flow" GroupName="c">
                                                    <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdOthr.GetChecked(),'div_othr');}">
                                                    </ClientSideEvents>
                                                </dxe:ASPxRadioButton>
                                                <dxe:ASPxRadioButton ID="rdOthr" runat="server" ClientInstanceName="crdOthr" Text="Other"
                                                    Layout="Flow" GroupName="c">
                                                    <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdOthr.GetChecked(),'div_othr');OnNationalityOtherSelected(crdOthr.GetChecked());}">
                                                    </ClientSideEvents>
                                                </dxe:ASPxRadioButton>
                                            </div>
                                            <div id="div_othr" class="left FontChange" style="margin-left: 2px;display:none;">
                                                <asp:TextBox ID="TxtOthr" runat="server" Width="150px"></asp:TextBox>
                                                (Please Specify)
                                            </div>
                                        </div>
                                        <asp:HiddenField ID="TxtOthr_Hidden" runat="server" />
                                    </div>
                                    <div id="Row9" class="Row">
                                        <div id="Row9_Col0" class="LFloat_Lable Leftdiv">
                                            <span style="font-size: 10pt; color: #ff0000"></span>Status / Constitution Type:<span
                                                style="font-size: 10pt; color: #ff0000">**</span>
                                        </div>
                                        <div id="Row9_Col1" class="LFloat_Row" style="height: 25px">
                                            <div class="left">
                                                <dxe:ASPxComboBox ID="ComboStatus" OnCallback="ComboStatus_Callback" runat="server"
                                                    EnableIncrementalFiltering="True" ValueType="System.String" Width="156px" ClientInstanceName="cComboStatus"
                                                    Font-Size="Small">
                                                    <ClientSideEvents SelectedIndexChanged="function(s,e){OnStatusChange()}" EndCallback=" function(s,e){ComboStatus_EndCallback()}">
                                                    </ClientSideEvents>
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
                                    <div id="Div23" class="Row" style="height: 38px; text-align: center;">
                                        <div id="Div24" class="LFloat_Lable Leftdiv">
                                            Account Holder Type:<span style="font-size: 10pt; color: #ff0000">**</span>&nbsp;
                                        </div>
                                        <div id="Div25" class="LFloat_Row BtmMargin" style="height: 38px">
                                            <dxe:ASPxComboBox ID="cmbAccHolderTypeFlag" runat="server" EnableIncrementalFiltering="True"
                                                ValueType="System.String" Width="156px" ClientInstanceName="CcmbAccHolderTypeFlag"
                                                Font-Size="Small">
                                                <ClientSideEvents SelectedIndexChanged="function(s,e){OnAccHolderFlagChange(s)}">
                                                </ClientSideEvents>
                                            </dxe:ASPxComboBox>
                                            <span style="font-size: 8pt">[Flag]</span>
                                        </div>
                                        <div id="Div26" class="LFloat_Row BtmMargin" style="height: 38px">
                                            <dxe:ASPxComboBox ID="cmbAccHolderType" runat="server" OnCallback="cmbAccHolderType_CallBack"
                                                EnableIncrementalFiltering="True" ValueType="System.String" Width="156px" ClientInstanceName="CcmbAccHolderType"
                                                Font-Size="Small">
                                                <ClientSideEvents EndCallback=" function(s,e){cmbHolderType_EndCallback()}"></ClientSideEvents>
                                            </dxe:ASPxComboBox>
                                            <span style="font-size: 8pt">[Holder Type]</span>
                                        </div>
                                        <div id="Div27" class="LFloat_Row BtmMargin" style="height: 38px">
                                            <dxe:ASPxComboBox ID="AccType" runat="server" EnableIncrementalFiltering="True" ValueType="System.String"
                                                Width="156px" ClientInstanceName="CAccType" Font-Size="Small">
                                                <%--<ClientSideEvents SelectedIndexChanged="function(s,e){OnStatusChange()}" EndCallback=" function(s,e){ComboStatus_EndCallback()}">
                                                    </ClientSideEvents>--%>
                                            </dxe:ASPxComboBox>
                                            <span style="font-size: 8pt">[Account Type]</span>
                                        </div>
                                    </div>
                                    <div id="Row09" class="Row">
                                        <div class="LFloat_Lable Leftdiv">
                                            NRI StatusProof:
                                        </div>
                                        <div class="LFloat_Row" style="height: 25px">
                                            <div class="left">
                                                <dxe:ASPxComboBox ID="ComboNRIStatusPrf" runat="server" EnableIncrementalFiltering="True"
                                                    ValueType="System.String" Width="156px" ClientInstanceName="cComboNRIStatusPrf"
                                                    Font-Size="Small">
                                                </dxe:ASPxComboBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="Row10" class="Row">
                                        <div id="Row10_Col0" class="LFloat_Lable Leftdiv" style="height: 35px">
                                            <span class="Spanclass"></span>PAN:<span style="font-size: 10pt; color: #ff0000">**</span>&nbsp;
                                        </div>
                                        <div id="Row10_Col1" class="LFloat_Row FontChange" style="height: 35px">
                                            <dxe:ASPxTextBox ID="TxtPan" runat="server" ClientInstanceName="cTxtPan" MaxLength="10"
                                                Width="150px">
                                                <ClientSideEvents KeyUp="function(s,e){s.SetText(s.GetValue().toUpperCase());}" />
                                                <%--LostFocus="function(s, e) {verifyPanCrdNo(cTxtPan);}"--%>
                                            </dxe:ASPxTextBox>
                                            (Attach attested copy of PAN Card)
                                        </div>
                                        <div id="Row10_Col2" class="LFloat_Lable Leftdiv" style="height: 35px; margin-left: 10px;
                                            width: 100px;">
                                            Is PAN Exempt:
                                        </div>
                                        <div id="Row10_Col3" class="LFloat_Row FontChange" style="height: 35px;">
                                            <dxe:ASPxRadioButton ID="rdPanxmptY" runat="server" GroupName="z" ClientInstanceName="crdPanxmptY">
                                                <ClientSideEvents ValueChanged="function(s,e){OnCheckedShowHide(crdPanxmptN.GetChecked(),'Row10_Col1');}"
                                                    CheckedChanged="function(s,e){OnCheckedShowHide(crdPanxmptY.GetChecked(),'DivPanExempt');}">
                                                </ClientSideEvents>
                                            </dxe:ASPxRadioButton>
                                            YES
                                            <dxe:ASPxRadioButton ID="rdPanxmptN" runat="server" Checked="True" GroupName="z"
                                                ClientInstanceName="crdPanxmptN">
                                                <ClientSideEvents ValueChanged="function(s,e){OnCheckedShowHide(crdPanxmptN.GetChecked(),'Row10_Col1');}"
                                                    CheckedChanged="function(s,e){OnCheckedShowHide(crdPanxmptY.GetChecked(),'DivPanExempt');}">
                                                </ClientSideEvents>
                                            </dxe:ASPxRadioButton>
                                            NO
                                        </div>
                                        <div id="DivPanExempt" class="LFloat_Row" style="height: 35px; margin-left: 10px">
                                            <dxe:ASPxComboBox ID="ComboPanExempt" runat="server" ClientInstanceName="cComboPanExempt"
                                                EnableIncrementalFiltering="True" Font-Size="12px" ValueType="System.String"
                                                Width="250px" Height="25px">
                                                <DropDownButton Text="PanExemptType">
                                                </DropDownButton>
                                            </dxe:ASPxComboBox>
                                        </div>
                                    </div>
                                    <div id="dvTIN" class="Row">
                                        <div id="Div21" class="LFloat_Lable Leftdiv">
                                            <span class="Spanclass"></span>Tax Identification Number (TIN)
                                        </div>
                                        <div id="Div22" class="LFloat_Row" style="height: 25px">
                                            <dxe:ASPxTextBox ID="txtTIN" runat="server" ClientInstanceName="CtxtTIN" Width="150px">
                                                <ClientSideEvents TextChanged="function(s,e){Fn_CtxtTINTextChanged();}" />
                                            </dxe:ASPxTextBox>
                                        </div>
                                        <div id="dvTINCountry" class="Row" style="display: none">
                                            <div id="Div29" class="LFloat_Lable Leftdiv" style="height: 37px">
                                                TIN Issuing Country</div>
                                            <div id="Div30" class="LFloat_Row" style="height: 37px">
                                                <dxe:ASPxComboBox ID="cmbTINCountry" runat="server" EnableIncrementalFiltering="True"
                                                    ValueType="System.String" Width="156px" ClientInstanceName="CcmbTINCountry" Font-Size="Small">
                                                    <%--<ClientSideEvents SelectedIndexChanged="function(s,e){OnStatusChange()}" EndCallback=" function(s,e){ComboStatus_EndCallback()}">
                                                    </ClientSideEvents>--%>
                                                </dxe:ASPxComboBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="Row11" class="Row">
                                        <div id="Row11_Col0" class="LFloat_Lable Leftdiv">
                                            <span class="Spanclass"></span>Registration No. (e.g. CIN):<span style="font-size: 10pt;
                                                color: #ff0000">**</span>
                                        </div>
                                        <div id="Row11_Col1" class="LFloat_Row" style="height: 25px">
                                            <dxe:ASPxTextBox ID="TxtRegNo" runat="server" ClientInstanceName="cTxtRegNo" Width="150px">
                                            </dxe:ASPxTextBox>
                                        </div>
                                    </div>
                                    <div id="Row12" class="Row">
                                        <div id="Row12_Col0" class="LFloat_Lable Leftdiv" style="height: 37px">
                                            Unique Identification Number(UID) / Adhaar (If Any):</div>
                                        <div id="Row12_Col1" class="LFloat_Row" style="height: 37px">
                                            <dxe:ASPxTextBox ID="TxtUIN" runat="server" ClientInstanceName="cTxtUIN" MaxLength="12"
                                                Width="150px">
                                            </dxe:ASPxTextBox>
                                        </div>
                                    </div> 
                                    <div id="dvResidentStatus" class="Row" style="height: 38px; text-align: center;">
                                        <div id="Div28" class="LFloat_Lable Leftdiv">
                                            Residential Status:<span style="font-size: 10pt; color: #ff0000">**</span>&nbsp;
                                        </div>
                                        <div id="Div31" class="LFloat_Row BtmMargin" style="height: 38px">
                                            <dxe:ASPxComboBox ID="cmbResidentialStatus" runat="server" EnableIncrementalFiltering="True"
                                                ValueType="System.String" Width="156px" ClientInstanceName="CcmbResidentialStatus"
                                                Font-Size="Small">
                                                
                                            </dxe:ASPxComboBox>
                                            <span style="font-size: 8pt">[Residential Status]</span>
                                        </div>
                                        <div id="Div32" class="LFloat_Row BtmMargin" style="height: 38px">
                                            <dxe:ASPxComboBox ID="cmbJurisdictionofresidence" runat="server"
                                                EnableIncrementalFiltering="True" ValueType="System.String" Width="156px" ClientInstanceName="CJurisdictionofresidence"
                                                Font-Size="Small">
                                                <ClientSideEvents EndCallback=" function(s,e){cmbHolderType_EndCallback()}"></ClientSideEvents>
                                            </dxe:ASPxComboBox>
                                            <span style="font-size: 8pt">[Jurisdiction of residence]</span>
                                        </div>
                                        <div id="Div33" class="LFloat_Row BtmMargin" style="height: 38px">
                                            <dxe:ASPxTextBox ID="txtResidentTIN" runat="server" Width="156px" ClientInstanceName="CtxtResidentTIN" Font-Size="Small"> 
                                            </dxe:ASPxTextBox>
                                            <span style="font-size: 8pt">[Tax Identification Number or equivalent (If issued by jurisdiction)]</span>
                                        </div>
                                    </div>  
                                    <div id="Row13" class="Row">
                                        <div id="Row13_Col0" class="LFloat_Lable Leftdiv" style="height: 37px">
                                            <span style="font-size: 10pt; color: #ff0000"></span>Specify The Proof Of Identity
                                            Submitted:<span style="font-size: 10pt; color: #ff0000">**</span>
                                        </div>
                                        <div id="Row13_Col1" class="LFloat_Row FontChange" style="height: 37px">
                                            <dxe:ASPxComboBox ID="ComboIdentityProof" runat="server" ClientInstanceName="cComboIdentityProof"
                                                EnableIncrementalFiltering="True" Font-Size="12px" ValueType="System.String"
                                                Width="200px" Height="25px">
                                                <ClientSideEvents SelectedIndexChanged="IdChange" />
                                            </dxe:ASPxComboBox>
                                        </div>
                                        <div id="divOthrID" class="LFloat_Row FontChange LeftMargin" style="height: 37px;">
                                            <dxe:ASPxTextBox ID="TxtOthrProof" runat="server" ClientInstanceName="cTxtOthrProof"
                                                Width="150px">
                                            </dxe:ASPxTextBox>
                                            (Please Specify)
                                        </div>
					                    <div id="divIdentityNumber" class="LFloat_Row FontChange LeftMargin" style="height: 37px;">
                                            <dxe:ASPxTextBox ID="txtIdentityNo" runat="server" ClientInstanceName="ctxtIdentityNo"
                                                Width="150px">
                                            </dxe:ASPxTextBox>
                                            (Identify Number)
                                        </div>
                                    </div>
                                    <div class="left" id="DivBtnPrvsIdntty" style="margin-left: 20px">
                                        <dxe:ASPxButton ID="BtnPrvIdntty" runat="server" AutoPostBack="False" ToolTip="Back to Previous"
                                            Width="66px" ClientInstanceName="cBtnPrvIdntty" BackColor="Transparent" Height="60px">
                                            <ClientSideEvents Click="function(s, e) {IdentityPrevious();}"></ClientSideEvents>
                                            <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_rewind.png"
                                                Repeat="NoRepeat" />
                                            <Border BorderStyle="None" />
                                        </dxe:ASPxButton>
                                    </div>
                                    <div id="DivBtnSaveIdntty" class="left">
                                        <dxe:ASPxButton ID="BtnSaveIdntty" runat="server" AutoPostBack="False" ToolTip="Save Identity Details"
                                            Width="70px" ClientInstanceName="cBtnSaveIdntty" BackColor="Transparent" Height="60px">
                                            <ClientSideEvents Click="function(s, e) {SaveIdentity();}"></ClientSideEvents>
                                            <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_save.png"
                                                Repeat="NoRepeat" />
                                            <Border BorderColor="Transparent" BorderStyle="None"></Border>
                                        </dxe:ASPxButton>
                                    </div>
                                    <div id="DivBtnEditIdntty" class="left" style="margin-right: 20px;">
                                        <div class="left">
                                            <dxe:ASPxButton ID="BtnEditIdntty" runat="server" AutoPostBack="False" ToolTip="Edit Identity Details"
                                                Width="70px" ClientInstanceName="cBtnEditIdntty" BackColor="Transparent" Height="60px">
                                                <ClientSideEvents Click="function(s, e) {EditIdentity();}"></ClientSideEvents>
                                                <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/Edit.jpg"
                                                    Repeat="NoRepeat" />
                                                <Border BorderStyle="None" />
                                            </dxe:ASPxButton>
                                        </div>
                                        <div class="left">
                                            <dxe:ASPxButton ID="BtnNextIdntty" runat="server" AutoPostBack="False" ToolTip="Proceed To Address Details"
                                                Width="70px" ClientInstanceName="cBtnNextIdntty" BackColor="Transparent" Height="60px">
                                                <ClientSideEvents Click="function(s, e) {IdentityNext();}"></ClientSideEvents>
                                                <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_foward.png"
                                                    Repeat="NoRepeat" />
                                                <Border BorderStyle="None" />
                                            </dxe:ASPxButton>
                                        </div>
                                    </div>
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <div id="DivIdnttyAlrt" class="Success BtmMargin" style="margin-top: 10px; width: 800px;
                                        font-size: 9pt; margin-bottom: 30px;">
                                        Identity Section Submitted Successfully !!
                                    </div>
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                </dxp:PanelContent>
                            </PanelCollection>
                            <ClientSideEvents EndCallback="function (s, e) {CbpIdntty_EndCallBack();}" />
                        </dxcp:ASPxCallbackPanel>
                    </div>
                    <div id="Accordion2Content" class="AccordionContent">
                        <div>
                            <div class="DivHeader" style="width: 100%" onselectstart="return false;">
                                &nbsp; ADDRESS DETAILS
                            </div>
                        </div>
                        <dxcp:ASPxCallbackPanel ID="CbpAdrs" runat="server" ClientInstanceName="cCbpAdrs"
                            OnCallback="CbpAdrs_Callback" BackColor="Transparent" Width="100%">
                            <PanelCollection>
                                <dxp:PanelContent runat="server"> 
                                    <div id="Row15" class="Row">
                                        <div id="Row15_Col0" class="LFloat_Lable Leftdiv">
                                            <span class="Spanclass"></span>Correspondence Address:<span style="font-size: 10pt;
                                                color: #ff0000">**</span>&nbsp;
                                        </div>
                                        <div id="Row15_Col1" class="LFloat_Row FontChange BtmMargin" style="width: 62%">
                                            <div class="left" style="margin-bottom: 2px;width:100%">
                                                <div class="left" style="margin-right: 14px">
                                                    <span style="font-size: 8pt">[Address Type]</span>
                                                </div>
                                                <div class="left">
                                                    <dxe:ASPxComboBox ID="cmbAddressType" runat="server" ClientInstanceName="CcmbAddressType"
                                                    EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                    Width="150px"> 
                                                </dxe:ASPxComboBox>
                                                </div>
                                            </div> 
                                            <div class="left" style="margin-bottom: 2px">
                                                <div class="left" style="margin-right: 14px">
                                                    <span style="font-size: 8pt">[House No]</span>
                                                </div>
                                                <div class="left">
                                                    <dxe:ASPxTextBox ID="TxtAddress1" runat="server" ClientInstanceName="cTxtAddress1"
                                                        HorizontalAlign="left" Width="470px">
                                                        <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtAddress1);}" 
                                                 TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                                 </ClientSideEvents>--%>
                                                    </dxe:ASPxTextBox>
                                                </div>
                                            </div>
                                            <div class="left" style="margin-bottom: 2px">
                                                <div class="left" style="margin-right: 2px">
                                                    <span style="font-size: 8pt">[Street Name]</span>
                                                </div>
                                                <div class="left">
                                                    <dxe:ASPxTextBox ID="TxtAddress2" runat="server" ClientInstanceName="cTxtAddress2"
                                                        HorizontalAlign="left" Width="470px">
                                                        <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtAddress2);}" 
                                             TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                             </ClientSideEvents>--%>
                                                    </dxe:ASPxTextBox>
                                                </div>
                                            </div>
                                            
                                            <div class="left" style="margin-bottom: 4px">
                                                <div class="left" style="margin-right: 7px">
                                                    <span style="font-size: 8pt">[Area Name]</span>
                                                </div>
                                                <div class="left">
                                                    <dxe:ASPxTextBox ID="TxtAddress3" runat="server" ClientInstanceName="cTxtAddress3"
                                                        HorizontalAlign="left" Width="470px">
                                                        <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtAddress3);}" 
                                                 TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                                 </ClientSideEvents>--%>
                                                    </dxe:ASPxTextBox>
                                                </div>
                                            </div>
                                            <div class="left" style="height: 30px; margin-left: 66px;">
                                                <dxe:ASPxComboBox ID="ComboCountry" runat="server" ClientInstanceName="cComboCountry"
                                                    EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                    Width="150px">
                                                    <ClientSideEvents SelectedIndexChanged="function(s,e){OnTypeChange()}"></ClientSideEvents>
                                                    <DropDownButton Text="Country">
                                                    </DropDownButton>
                                                </dxe:ASPxComboBox>
                                            </div>
                                            
                                            <div class="left" style="width: 100%">
                                            <div class="left" style="height: 25px">
                                                    District :
                                                </div>
                                                <div class="left" style="height: 25px">
                                                   <dxe:ASPxTextBox ID="txtLocDist" runat="server" ClientInstanceName="CtxtLocDist"
                                                        HorizontalAlign="left" Width="100px"> 
                                                    </dxe:ASPxTextBox>
                                                </div>
                                            </div>
                                            
                                            <div class="left" style="height: 30px; margin-left: 4px; width:100%">
                                                <dxe:ASPxComboBox ID="ComboState" runat="server" ClientInstanceName="cComboState"
                                                    EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                    Width="150px">
                                                    <ClientSideEvents SelectedIndexChanged="function(s,e){OnStateChange('1')}"></ClientSideEvents>
                                                    <DropDownButton Text="State">
                                                    </DropDownButton>
                                                </dxe:ASPxComboBox>  
                                            </div>
                                            <div id="DivStateOthr" class="left" style="height: 30px; margin-left: 2px">
                                                <div class="left">
                                                    <dxe:ASPxTextBox ID="TxtStateOthr" runat="server" ClientInstanceName="cTxtStateOthr"
                                                        Width="150px">
                                                    </dxe:ASPxTextBox>
                                                </div>
                                                <div class="left">
                                                    (Please Specify)
                                                </div>
                                            </div>
                                            
                                            
                                            <div class="left" style="width: 99%">
                                                <div class="left" style="height: 25px">
                                                    City/Town/Village :
                                                </div>
                                                <div class="left" style="height: 25px">
                                                    <dxe:ASPxComboBox ID="ComboCity" runat="server" ClientInstanceName="cComboCity" EnableIncrementalFiltering="True"
                                                        Font-Size="Small" SelectedIndex="0" ValueType="System.String" Width="150px">
                                                        <ClientSideEvents SelectedIndexChanged="function(s,e){OnTypeChange()}"></ClientSideEvents>
                                                    </dxe:ASPxComboBox>
                                                </div>
                                                <div class="left" style="height: 25px; margin-left: 2px;">
                                                    PinCode :
                                                </div>
                                                <div class="left" style="height: 25px">
                                                    <dxe:ASPxTextBox ID="TxtPin" runat="server" ClientInstanceName="cTxtPin" Width="150px"
                                                        HorizontalAlign="right">
                                                        <MaskSettings Mask="<0..999999999>" />
                                                    </dxe:ASPxTextBox>
                                                </div>
                                            </div>
                                        </div>
                                        &nbsp; &nbsp;&nbsp;<span style="font-size: 10pt; color: #ff0000"> **</span> <span
                                            style="font-size: 8pt">Mandatory Fields&nbsp;</span></div>
                                    <div id="Row16" class="Row">
                                        <div id="Row16_Col0" class="LFloat_Lable Leftdiv" style="height: 60px">
                                            Proof Of Address<br />
                                            <strong>(For Correspondence Address )</strong>:
                                        </div>
                                        <div id="Row16_Col1" class="LFloat_Row FontChange" style="width: 62%; height: 60px;">
                                            <div class="left" style="margin-left: 2px">
                                                <dxe:ASPxComboBox ID="ComboCrpndsAdrs" runat="server" ClientInstanceName="cComboCrpndsAdrs"
                                                    EnableIncrementalFiltering="True" Font-Size="12px" ValueType="System.String"
                                                    Width="200px" Height="23px">
                                                    <ClientSideEvents SelectedIndexChanged="CrpndsAdrsChange" />
                                                </dxe:ASPxComboBox>
                                            </div>
                                            <div id="DivOthrAdrsPrf" class="left" style="margin-left: 2px">
                                                <dxe:ASPxTextBox ID="TxtOthrAdrsPrf" runat="server" ClientInstanceName="cTxtOthrAdrsPrf"
                                                    Width="150px" Height="23px">
                                                </dxe:ASPxTextBox>
                                                (Please Specify)
                                            </div>
                                            <div class="left" style="margin-left: 2px">
                                                <dxe:ASPxDateEdit ID="ValidDt" runat="server" ClientInstanceName="cValidDt" DateOnError="Today"
                                                    EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="210px"
                                                    Font-Size="11px" TabIndex="0" Height="23px">
                                                    <DropDownButton Text="**Validity/Expiry Date">
                                                    </DropDownButton>
                                                </dxe:ASPxDateEdit>
                                            </div>
                                            <div class="left" style="width: 450px">
                                                <span style="font-size: 8pt">**Validity/Expiry Date of Proof of address Must not be
                                                    more than 3 Months old.</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="Row17" class="Row">
                                        <div class="left" style="width: 190px; margin-top: 4px;">
                                            <div id="Row17_Col0" class="LFloat_Lable Leftdiv">
                                                <span class="Spanclass"></span>Permanent &nbsp;Address: <span style="font-size: 10pt;
                                                    color: #ff0000">**</span>
                                            </div>
                                            <div id="Row17_Col1" class="LFloat_Lable Leftdiv">
                                                <span class="Spanclass"></span>Registered &nbsp;Address: <span style="font-size: 10pt;
                                                    color: #ff0000">**</span>
                                            </div>
                                            <div id="Row17_Col3" style="font-size: 12px; margin-top: 4px; width: 155px">
                                                <dxe:ASPxCheckBox ID="CbSame" runat="server" ClientInstanceName="cCbSame" ToolTip="Same As The Corresponding Address"
                                                    Checked="False">
                                                    <ClientSideEvents CheckedChanged="OnCheckedChanged" />
                                                </dxe:ASPxCheckBox>
                                                <strong>Same As The
                                                    <br />
                                                    Correspondence Address</strong>
                                            </div>
                                        </div>
                                        <div id="Row16_Col2" class="LFloat_Row FontChange " style="width: 62%; margin-top: 4px;
                                            margin-left: 15px;">
                                            
                                            <div class="left" style="margin-bottom: 2px;width:100%">
                                                <div class="left" style="margin-right: 14px">
                                                    <span style="font-size: 8pt">[Address Type]</span>
                                                </div>
                                                <div class="left">
                                                    <dxe:ASPxComboBox ID="cmbPaddressType" runat="server" ClientInstanceName="CcmbPaddressType"
                                                    EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                    Width="150px"> 
                                                </dxe:ASPxComboBox>
                                                </div>
                                            </div> 
                                            
                                            <div class="left" style="margin-bottom: 4px">
                                                <div class="left" style="margin-right: 14px">
                                                    <span style="font-size: 8pt">[House No] </span>
                                                </div>
                                                <div class="left">
                                                    <dxe:ASPxTextBox ID="TxtAddress1P" runat="server" ClientInstanceName="cTxtAddress1P"
                                                        HorizontalAlign="left" Width="470px">
                                                        <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtAddress1P);}" 
                                                 TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                                 </ClientSideEvents>--%>
                                                    </dxe:ASPxTextBox>
                                                </div>
                                            </div>
                                            <div class="left" style="margin-bottom: 4px">
                                                <div class="left" style="margin-right: 2px">
                                                    <span style="font-size: 8pt">[Street Name] </span>
                                                </div>
                                                <div class="left">
                                                    <dxe:ASPxTextBox ID="TxtAddress2P" runat="server" ClientInstanceName="cTxtAddress2P"
                                                        HorizontalAlign="left" Width="470px">
                                                        <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtAddress2P);}" 
                                                 TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                                 </ClientSideEvents>--%>
                                                    </dxe:ASPxTextBox>
                                                </div>
                                            </div>
                                            <div class="left" style="margin-bottom: 4px">
                                                <div class="left" style="margin-right: 7px">
                                                    <span style="font-size: 8pt">[Area Name] </span>
                                                </div>
                                                <div class="left">
                                                    <dxe:ASPxTextBox ID="TxtAddress3P" runat="server" ClientInstanceName="cTxtAddress3P"
                                                        HorizontalAlign="left" Width="470px">
                                                        <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtAddress3P);}" 
                                                 TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                                 </ClientSideEvents>--%>
                                                    </dxe:ASPxTextBox>
                                                </div>
                                            </div>
                                            <div class="left" style="height: 30px; margin-left: 66px;">
                                                <dxe:ASPxComboBox ID="ComboCountryP" runat="server" ClientInstanceName="cComboCountryP"
                                                    EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                    Width="150px">
                                                    <ClientSideEvents SelectedIndexChanged="function(s,e){OnTypeChange()}"></ClientSideEvents>
                                                    <DropDownButton Text="Country">
                                                    </DropDownButton>
                                                </dxe:ASPxComboBox>
                                            </div>
                                            
                                            <div class="left" style="width: 100%">
                                                <div class="left" style="height: 25px">
                                                    District :
                                                </div>
                                                <div class="left" style="height: 25px">
                                                   <dxe:ASPxTextBox ID="txtPAdddist" runat="server" ClientInstanceName="CtxtPAdddist"
                                                        HorizontalAlign="left" Width="100px"> 
                                                    </dxe:ASPxTextBox>
                                                </div>
                                                </div>
                                            
                                            <div class="left" style="height: 30px; margin-left: 4px; width:100%">
                                                <dxe:ASPxComboBox ID="ComboStateP" runat="server" ClientInstanceName="cComboStateP"
                                                    EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                    Width="150px">
                                                    <ClientSideEvents SelectedIndexChanged="function(s,e){OnStateChange('2')}"></ClientSideEvents>
                                                    <DropDownButton Text="State">
                                                    </DropDownButton>
                                                </dxe:ASPxComboBox>
                                                 
                                            </div>
                                            <div id="DivStateOthrP" class="left" style="height: 30px; margin-left: 2px">
                                                <div class="left">
                                                    <dxe:ASPxTextBox ID="TxtStateOthrP" runat="server" ClientInstanceName="cTxtStateOthrP"
                                                        Width="150px">
                                                    </dxe:ASPxTextBox>
                                                </div>
                                                <div class="left">
                                                    (Please Specify)
                                                </div>
                                            </div>
                                            <div class="left" style="width: 99%">
                                                <div class="left" style="height: 25px">
                                                    City/Town/Village :
                                                </div>
                                                <div class="left" style="height: 25px">
                                                    <dxe:ASPxComboBox ID="ComboCityP" runat="server" ClientInstanceName="cComboCityP"
                                                        EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                        Width="150px">
                                                        <ClientSideEvents SelectedIndexChanged="function(s,e){OnTypeChange()}"></ClientSideEvents>
                                                    </dxe:ASPxComboBox>
                                                </div>
                                                <div class="left" style="height: 25px; margin-left: 2px;">
                                                    PinCode :
                                                </div>
                                                <div class="left" style="height: 25px">
                                                    <dxe:ASPxTextBox ID="TxtPinP" runat="server" ClientInstanceName="cTxtPinP" Width="150px"
                                                        HorizontalAlign="right">
                                                        <MaskSettings Mask="<0..999999999>" />
                                                    </dxe:ASPxTextBox>
                                                </div>
                                            </div> 
                                        </div>
                                    </div>
                                    <div id="Row18" class="Row">
                                        <div id="Row18_Col0" class="LFloat_Lable Leftdiv" style="height: 60px">
                                            Proof Of Address<br />
                                            <strong>(For Permanent Address )</strong>:</div>
                                        <div id="Row18_Col1" class="LFloat_Row FontChange" style="width: 62%; height: 60px;">
                                            <div class="left">
                                                <dxe:ASPxComboBox ID="ComboRegAdrs" runat="server" ClientInstanceName="cComboRegAdrs"
                                                    EnableIncrementalFiltering="True" Font-Size="12px" ValueType="System.String"
                                                    Width="200px" Height="23px">
                                                    <ClientSideEvents SelectedIndexChanged="RegAdrsChange" />
                                                </dxe:ASPxComboBox>
                                            </div>
                                            <div id="DivOthrAdrsPrfP" class="left" style="margin-left: 2px">
                                                <dxe:ASPxTextBox ID="TxtOthrAdrsPrfP" runat="server" ClientInstanceName="cTxtOthrAdrsPrfP"
                                                    Width="150px" Height="23px">
                                                </dxe:ASPxTextBox>
                                                (Please Specify)
                                            </div>
                                            <div class="left" style="margin-left: 2px">
                                                <dxe:ASPxDateEdit ID="ValidDtP" runat="server" ClientInstanceName="cValidDtP" DateOnError="Today"
                                                    EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="210px"
                                                    Font-Size="11px" TabIndex="0" Height="23px">
                                                    <DropDownButton Text="**Validity/Expiry Date">
                                                    </DropDownButton>
                                                </dxe:ASPxDateEdit>
                                            </div>
                                            <div class="left" style="width: 450px">
                                                <span style="font-size: 8pt">**Validity/Expiry Date of Proof of address Must not be
                                                    more than 3 Months old.</span>
                                            </div>
                                        </div>
                                    </div>
                                     <div id="dvJurisdiction" class="Row">
                                        <div id="Div20" class="LFloat_Lable Leftdiv"> 
                                                <span class="Spanclass"></span><span style="font-size: 8pt">
                                                    Jurisdiction AddressType
                                                <span style="font-size: 10pt; color: #ff0000">**</span>
                                            </span>
                                        </div>
                                        <div id="Div34" class="LFloat_Row FontChange" style="width: 80%">
                                             <dxe:ASPxComboBox ID="cmbJDAddressType" runat="server" ClientInstanceName="CcmbJDAddressType"
                                                    EnableIncrementalFiltering="True" Font-Size="12px" ValueType="System.String"
                                                    Width="300px" Height="23px"> 
                                                    <ClientSideEvents SelectedIndexChanged="function (s, e) {Fn_JDAddressTypeChanged(s);}" />
                                                </dxe:ASPxComboBox>
                                        </div>
                                     </div>
                                    <div id="dvJDAddress">
                                    <div id="Div35" class="Row">
                                        <div id="Div36" class="LFloat_Lable Leftdiv">
                                            <span class="Spanclass"></span>Jurisdiction Address:<span style="font-size: 10pt;
                                                color: #ff0000">**</span>&nbsp;
                                        </div>
                                        <div id="Div37" class="LFloat_Row FontChange BtmMargin" style="width: 62%">
                                            <div class="left" style="margin-bottom: 2px;width:100%">
                                                <div class="left" style="margin-right: 14px">
                                                    <span style="font-size: 8pt">[Address Type]</span>
                                                </div>
                                                <div class="left">
                                                    <dxe:ASPxComboBox ID="cmbJDAddType" runat="server" ClientInstanceName="CcmbJDAddressType"
                                                    EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                    Width="150px"> 
                                                </dxe:ASPxComboBox>
                                                </div>
                                            </div> 
                                            <div class="left" style="margin-bottom: 2px">
                                                <div class="left" style="margin-right: 14px">
                                                    <span style="font-size: 8pt">[House No]</span>
                                                </div>
                                                <div class="left">
                                                    <dxe:ASPxTextBox ID="txtJDAddress1" runat="server" ClientInstanceName="CtxtJDAddress1"
                                                        HorizontalAlign="left" Width="470px">
                                                        <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtAddress1);}" 
                                                 TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                                 </ClientSideEvents>--%>
                                                    </dxe:ASPxTextBox>
                                                </div>
                                            </div>
                                            <div class="left" style="margin-bottom: 2px">
                                                <div class="left" style="margin-right: 2px">
                                                    <span style="font-size: 8pt">[Street Name]</span>
                                                </div>
                                                <div class="left">
                                                    <dxe:ASPxTextBox ID="txtJDAddress2" runat="server" ClientInstanceName="CtxtJDAddress2"
                                                        HorizontalAlign="left" Width="470px">
                                                        <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtAddress2);}" 
                                             TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                             </ClientSideEvents>--%>
                                                    </dxe:ASPxTextBox>
                                                </div>
                                            </div>
                                            
                                            <div class="left" style="margin-bottom: 4px">
                                                <div class="left" style="margin-right: 7px">
                                                    <span style="font-size: 8pt">[Area Name]</span>
                                                </div>
                                                <div class="left">
                                                    <dxe:ASPxTextBox ID="txtJDAddress3" runat="server" ClientInstanceName="CtxtJDAddress3"
                                                        HorizontalAlign="left" Width="470px">
                                                        <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtAddress3);}" 
                                                 TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                                 </ClientSideEvents>--%>
                                                    </dxe:ASPxTextBox>
                                                </div>
                                            </div>
                                            <div class="left" style="height: 30px; margin-left: 66px;">
                                                <dxe:ASPxComboBox ID="cmbJDCountry" runat="server" ClientInstanceName="CcmbJDCountry"
                                                    EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                    Width="150px">
                                                    <ClientSideEvents SelectedIndexChanged="function(s,e){OnTypeChange()}"></ClientSideEvents>
                                                    <DropDownButton Text="Country">
                                                    </DropDownButton>
                                                </dxe:ASPxComboBox>
                                            </div>
                                            
                                            <div class="left" style="width: 100%">
                                            <div class="left" style="height: 25px">
                                                    District :
                                                </div>
                                                <div class="left" style="height: 25px">
                                                   <dxe:ASPxTextBox ID="txtJDDistrict" runat="server" ClientInstanceName="CtxtJDDistrict"
                                                        HorizontalAlign="left" Width="100px"> 
                                                    </dxe:ASPxTextBox>
                                                </div>
                                            </div>
                                            
                                            <div class="left" style="height: 30px; margin-left: 4px; width:100%">
                                                <dxe:ASPxComboBox ID="cmbJDState" runat="server" ClientInstanceName="CcmbJDState"
                                                    EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                    Width="150px">
                                                    <ClientSideEvents SelectedIndexChanged="function(s,e){OnStateChange('1')}"></ClientSideEvents>
                                                    <DropDownButton Text="State">
                                                    </DropDownButton>
                                                </dxe:ASPxComboBox>  
                                            </div>
                                            <div id="dvJDState" class="left" style="height: 30px; margin-left: 2px">
                                                <div class="left">
                                                    <dxe:ASPxTextBox ID="txtStateOther" runat="server" ClientInstanceName="CtxtStateOther"
                                                        Width="150px">
                                                    </dxe:ASPxTextBox>
                                                </div>
                                                <div class="left">
                                                    (Please Specify)
                                                </div>
                                            </div> 
                                            <div class="left" style="width: 99%">
                                                <div class="left" style="height: 25px">
                                                    City/Town/Village :
                                                </div>
                                                <div class="left" style="height: 25px">
                                                    <dxe:ASPxComboBox ID="cmbJDCity" runat="server" ClientInstanceName="CcmbJDCity" EnableIncrementalFiltering="True"
                                                        Font-Size="Small" SelectedIndex="0" ValueType="System.String" Width="150px">
                                                        <ClientSideEvents SelectedIndexChanged="function(s,e){OnTypeChange()}"></ClientSideEvents>
                                                    </dxe:ASPxComboBox>
                                                </div>
                                                <div class="left" style="height: 25px; margin-left: 2px;">
                                                    PinCode :
                                                </div>
                                                <div class="left" style="height: 25px">
                                                    <dxe:ASPxTextBox ID="txtJDPin" runat="server" ClientInstanceName="CtxtJDPin" Width="150px"
                                                        HorizontalAlign="right">
                                                        <MaskSettings Mask="<0..999999999>" />
                                                    </dxe:ASPxTextBox>
                                                </div>
                                            </div>
                                        </div>
                                        &nbsp; &nbsp;&nbsp;<span style="font-size: 10pt; color: #ff0000"> **</span> <span
                                            style="font-size: 8pt">Mandatory Fields&nbsp;</span></div>
                                    <div id="Div39" class="Row">
                                        <div id="Div40" class="LFloat_Lable Leftdiv" style="height: 60px">
                                            Proof Of Address<br />
                                            <strong>(For Correspondence Address )</strong>:
                                        </div>
                                        <div id="Div41" class="LFloat_Row FontChange" style="width: 62%; height: 60px;">
                                            <div class="left" style="margin-left: 2px">
                                                <dxe:ASPxComboBox ID="cmbJDCrpndsAdrs" runat="server" ClientInstanceName="CcmbJDCrpndsAdrs"
                                                    EnableIncrementalFiltering="True" Font-Size="12px" ValueType="System.String"
                                                    Width="200px" Height="23px">
                                                    <ClientSideEvents SelectedIndexChanged="CrpndsAdrsChange" />
                                                </dxe:ASPxComboBox>
                                            </div>
                                            <div id="dvJDCrpndsAdrs" class="left" style="margin-left: 2px">
                                                <dxe:ASPxTextBox ID="txtJDOthrAdrsPrf" runat="server" ClientInstanceName="CtxtJDOthrAdrsPrf"
                                                    Width="150px" Height="23px">
                                                </dxe:ASPxTextBox>
                                                (Please Specify)
                                            </div>
                                            <div class="left" style="margin-left: 2px">
                                                <dxe:ASPxDateEdit ID="dateJDValidDt" runat="server" ClientInstanceName="CdateJDValidDt" DateOnError="Today"
                                                    EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="210px"
                                                    Font-Size="11px" TabIndex="0" Height="23px">
                                                    <DropDownButton Text="**Validity/Expiry Date">
                                                    </DropDownButton>
                                                </dxe:ASPxDateEdit>
                                            </div>
                                            <div class="left" style="width: 450px">
                                                <span style="font-size: 8pt">**Validity/Expiry Date of Proof of address Must not be
                                                    more than 3 Months old.</span>
                                            </div>
                                        </div>
                                    </div>
                                    </div> 
                                    <div id="Row19" class="Row">
                                        <div id="Row19_Col0" class="LFloat_Lable Leftdiv" style="height: 70px">
                                            Contact&nbsp; Details:<br />
                                            <span class="Spanclass"></span><span style="font-size: 8pt">[Mandatory to Give Atleast&nbsp;<br />
                                                &nbsp; &nbsp; &nbsp;One Contact No ]<span style="font-size: 10pt; color: #ff0000">**</span>
                                            </span>
                                        </div>
                                        <div id="Row19_Col1" class="LFloat_Row FontChange" style="width: 62%; height: 70px;">
                                            <div class="left" style="width: 99%">
                                                <div class="left" style="height: 25px">
                                                    Tel(Off) &nbsp;:
                                                </div>
                                                <div class="left" style="height: 25px">
                                                    <dxe:ASPxTextBox ID="TxtTelOfc" runat="server" ClientInstanceName="cTxtTelOfc" MaxLength="11"
                                                        HorizontalAlign="Right" Width="120px">
                                                        <ClientSideEvents LostFocus="function(s, e) {CheckTheLeast(cTxtTelOfc.GetText());}" />
                                                        <MaskSettings Mask="<0..99999999999>" />
                                                    </dxe:ASPxTextBox>
                                                </div>
                                                <div class="left" style="height: 25px">
                                                    &nbsp;Tel(Res) &nbsp;&nbsp; :
                                                </div>
                                                <div class="left" style="height: 25px">
                                                    <dxe:ASPxTextBox ID="TxtTelRes" runat="server" ClientInstanceName="cTxtTelRes" MaxLength="11"
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
                                                        <ClientSideEvents LostFocus="function(s, e) {CheckTheLeast(cTxtMobileNo.GetText());}" />
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
                                    <div style="width: 33%" class="right">
                                        <div id="DivBtnPrvsAdrs" class="left" style="margin-top: 30px;">
                                            <dxe:ASPxButton ID="BtnAdrsPrevious" runat="server" AutoPostBack="false" TabIndex="0"
                                                Text="" ToolTip="Back To Identity Details" Width="70px" Height="60px" ClientInstanceName="cBtnAdrsPrevious"
                                                BackColor="Transparent">
                                                <ClientSideEvents Click="function(s, e) {AddressPrv();}"></ClientSideEvents>
                                                <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_rewind.png"
                                                    Repeat="NoRepeat" />
                                                <Border BorderStyle="None" />
                                            </dxe:ASPxButton>
                                        </div>
                                        <div id="DivBtnSaveAdrs" class="left" style="margin-top: 30px;">
                                            <dxe:ASPxButton ID="BtnSaveAdrs" runat="server" AutoPostBack="false" TabIndex="0"
                                                ToolTip="Save Address Details" Width="70px" ClientInstanceName="cBtnSaveAdrs"
                                                BackColor="Transparent" Height="60px" >
                                                <ClientSideEvents Click="function(s, e) {SaveAddress();}"></ClientSideEvents>
                                                <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_save.png"
                                                    Repeat="NoRepeat" />
                                                <Border BorderColor="Transparent" BorderStyle="None"></Border>
                                            </dxe:ASPxButton>
                                        </div>
                                        <div id="DivBtnEditAdrs" class="left" style="margin-top: 30px;">
                                            <div class="left">
                                                <dxe:ASPxButton ID="BtnEditAdrs" runat="server" AutoPostBack="false" TabIndex="0"
                                                    ToolTip="Edit Entered Data" Width="70px" Height="60px" ClientInstanceName="cBtnEditAdrs"
                                                    BackColor="Transparent">
                                                    <ClientSideEvents Click="function(s, e) {EditAddress();}"></ClientSideEvents>
                                                    <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/Edit.jpg"
                                                        Repeat="NoRepeat" />
                                                    <Border BorderStyle="None" />
                                                </dxe:ASPxButton>
                                            </div>
                                            <div class="left">
                                                <dxe:ASPxButton ID="BtnAdrsNext" runat="server" AutoPostBack="false" TabIndex="0"
                                                    Text="" ToolTip="Proceed To Other Details" Width="70px" Height="60px" ClientInstanceName="cBtnAdrsNext"
                                                    BackColor="Transparent">
                                                    <ClientSideEvents Click="function(s, e) {AddressNext();}"></ClientSideEvents>
                                                    <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_foward.png"
                                                        Repeat="NoRepeat" />
                                                    <Border BorderStyle="None" />
                                                </dxe:ASPxButton>
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                    <br />
                                    <div id="DivAdrsAlrt" class="Success BtmMargin" style="margin-top: 10px; width: 800px;
                                        font-size: 9pt;">
                                        Address Section Submitted Successfully !!
                                    </div>
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                </dxp:PanelContent>
                            </PanelCollection>
                            <ClientSideEvents EndCallback="function (s, e) {CbpAdrs_EndCallBack();}" />
                        </dxcp:ASPxCallbackPanel>
                    </div>
                    <div id="Accordion3Content" class="AccordionContent">
                        <div>
                            <div class="DivHeader" style="width: 100%" onselectstart="return false;">
                                &nbsp; OTHER DETAILS
                            </div>
                        </div>
                        <dxcp:ASPxCallbackPanel ID="CbpOthrDtls" runat="server" ClientInstanceName="cCbpOthrDtls"
                            OnCallback="CbpOthrDtls_Callback" BackColor="Transparent" Width="100%">
                            <PanelCollection>
                                <dxp:PanelContent runat="server">
                                    <div id="Div_OtherDetail" style="width: 99%">
                                        <div id="Row20" class="Row">
                                            <div id="Row20_Col0" class="LFloat_Lable Leftdiv">
                                                <span class="Spanclass"></span>Gross Annual Income Details: <span style="font-size: 10pt;
                                                    color: #ff0000">**</span>
                                            </div>
                                            <div id="Row20_Col1" class="LFloat_Row FontChange BtmMargin" style="width: 66%">
                                                <div class="left" style="width: 600px">
                                                    <%--<div class="left" style="height: 25px">
                                                                  <strong>Income Range Per Annum :</strong>
                                                              </div>--%>
                                                    <%--  <div class="LFloat_Row FontChange LeftMargin" style="height: 37px;">--%>
                                                    <dxe:ASPxComboBox ID="ComboAnnualIncm" runat="server" ClientInstanceName="cComboAnnualIncm"
                                                        EnableIncrementalFiltering="True" Font-Size="12px" ValueType="System.String"
                                                        Width="200px" Height="25px" OnCallback="ComboAnnualIncm_Callback">
                                                        <ClientSideEvents SelectedIndexChanged="AnnualIncmChange" />
                                                    </dxe:ASPxComboBox>
                                                    <%--</div>--%>
                                                    <%-- <div style="width: 99%; text-align: center; margin: 4px;">
                                                             <strong>OR </strong>
                                                                </div>--%>
                                                    <div style="height: 25px; width: 530px; margin-top: 4px;" id="Div_NetWorth">
                                                        <strong></strong>
                                                        <div class="LFloat_Row" style="height: 25px; margin-top: 4px;">
                                                            &nbsp; &nbsp; Amount(Rs.):
                                                        </div>
                                                        <div class="LFloat_Row  LeftMargin" style="height: 25px; margin-top: 4px;">
                                                            <dxe:ASPxTextBox ID="TxtAmnt" runat="server" ClientInstanceName="cTxtAmnt" Width="150px"
                                                                HorizontalAlign="right">
                                                                <MaskSettings Mask="&lt;0..999999999999g&gt;" />
                                                            </dxe:ASPxTextBox>
                                                        </div>
                                                        <div class="LFloat_Row  LeftMargin" style="height: 25px; margin-top: 4px;">
                                                            <dxe:ASPxDateEdit ID="IncmDt" runat="server" ClientInstanceName="cIncmDt" DateOnError="Today"
                                                                EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="165px"
                                                                Font-Size="11px" TabIndex="0">
                                                                <DropDownButton Text="As On Date">
                                                                </DropDownButton>
                                                            </dxe:ASPxDateEdit>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="Row21" class="Row">
                                                <div id="Row21_Col0" class="LFloat_Lable Leftdiv">
                                                    <span style="font-size: 10pt; color: #ff0000"></span>Occupation: <span style="font-size: 10pt;
                                                        color: #ff0000">**</span></div>
                                                <div id="Row21_Col1" class="LFloat_Row FontChange" style="height: 101px; width: 66%;">
                                                    <div class="left BtmMargin">
                                                        <div class="LFloat_Row FontChange  BtmMargin" style="height: 37px; margin-bottom: 20px;">
                                                            <dxe:ASPxComboBox ID="ComboOccupation" runat="server" ClientInstanceName="cComboOccupation"
                                                                EnableIncrementalFiltering="True" Font-Size="12px" ValueType="System.String"
                                                                Width="200px" Height="25px">
                                                                <ClientSideEvents SelectedIndexChanged="OccupationChange" />
                                                            </dxe:ASPxComboBox>
                                                        </div>
                                                        <div id="DivOthrOccu" class="left" style="margin-left: 2px;display:none;">
                                                            <dxe:ASPxTextBox ID="TxtothrOccu" runat="server" ClientInstanceName="cTxtothrOccu"
                                                                Width="150px">
                                                            </dxe:ASPxTextBox>
                                                            (Please Specify)
                                                        </div>
                                                    </div>
                                                    <div class="left" style="width: 500px">
                                                        <div id="DivBrfDtl" class="left" style="height: 25px; margin-right: 4px;">
                                                            Please Give Some Brief Details:
                                                        </div>
                                                        <dxe:ASPxMemo ID="MemoOccu" runat="server" ClientInstanceName="cMemoOccu" HorizontalAlign="left"
                                                            Width="300px">
                                                        </dxe:ASPxMemo>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="Row22" class="Row">
                                                <div id="Row22_Col0" class="LFloat_Lable Leftdiv">
                                                    Select As Applicable:
                                                </div>
                                                <div id="Row22_Col1" class="LFloat_Row FontChange" style="width: 66%;">
                                                    <dxe:ASPxRadioButtonList ID="rdPEP" runat="server" ClientInstanceName="crdPEP" Border-BorderStyle="none"
                                                        RepeatLayout="Flow" RepeatDirection="Horizontal">
                                                        <Border BorderStyle="None"></Border>
                                                    </dxe:ASPxRadioButtonList>
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
                                                    <div class="left" style="width: 99%">
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
                                                    <div class="left" style="width: 99%">
                                                        <div class="left" style="height: 25px">
                                                            – Gaming / Gambling / Lottery Services(e.g. casinos, betting syndicates):
                                                        </div>
                                                        <div class="left" style="height: 25px">
                                                            <asp:RadioButton ID="rdGamingY" runat="server" Checked="False" GroupName="j" TabIndex="0" />
                                                            YES
                                                            <asp:RadioButton ID="rdGamingN" runat="server" Checked="True" GroupName="j" TabIndex="0" />
                                                            NO
                                                        </div>
                                                    </div>
                                                    <div class="left" style="width: 99%">
                                                        <div class="left" style="height: 25px">
                                                            – Money Lending / Pawning:
                                                        </div>
                                                        <div class="left" style="height: 25px">
                                                            <asp:RadioButton ID="rdMoneyLendingY" runat="server" Checked="False" GroupName="j"
                                                                TabIndex="0" />
                                                            YES
                                                            <asp:RadioButton ID="rdMoneyLendingN" runat="server" Checked="True" GroupName="j"
                                                                TabIndex="0" />
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
                                                    <dxe:ASPxMemo ID="MemoOthrInfo" runat="server" ClientInstanceName="cMemoOthrInfo"
                                                        HorizontalAlign="left" Width="350px">
                                                    </dxe:ASPxMemo>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="Row25" class="Row">
                                        <div id="Row25_Col0" class="LFloat_Lable Leftdiv">
                                            <span class="Spanclass"></span>IPV Details: <span style="font-size: 10pt; color: #ff0000">
                                                **</span>
                                        </div>
                                        <div id="Row25_Col1" class="LFloat_Row FontChange" style="height: 75px; width: 66%;
                                            margin-bottom: 5px;">
                                            <div class="left" style="width: 100%; margin-bottom: 4px;">
                                                <div class="left" style="height: 25px">
                                                    IPV Done By :
                                                </div>
                                                <div class="left LeftMargin" style="height: 25px;">
                                                    <dxe:ASPxComboBox ID="ComboIPVConType" runat="server" ClientInstanceName="cComboIPVConType"
                                                        EnableIncrementalFiltering="True" Font-Size="12px" ValueType="System.String"
                                                        Width="185px">
                                                        <ClientSideEvents SelectedIndexChanged="IPVCntTypeChange" />
                                                        <DropDownButton Text="ContactType">
                                                        </DropDownButton>
                                                    </dxe:ASPxComboBox>
                                                </div>
                                                <div class="left" style="height: 25px">
                                                    &nbsp; Select Name :
                                                </div>
                                                <div class="left LeftMargin" style="height: 25px">
                                                    <dxcp:ASPxCallbackPanel ID="CbpIpvBy" runat="server" ClientInstanceName="cCbpIpvBy"
                                                        OnCallback="CbpIpvBy_Callback" BackColor="Transparent" Height="20px">
                                                        <PanelCollection>
                                                            <dxp:PanelContent runat="server">
                                                                <asp:TextBox runat="server" Width="180px" ID="TxtIPVby"></asp:TextBox>
                                                                <asp:HiddenField ID="TxtIPVby_hidden" runat="server" />
                                                            </dxp:PanelContent>
                                                        </PanelCollection>
                                                    </dxcp:ASPxCallbackPanel>
                                                </div>
                                            </div>
                                            <div class="left" style="height: 25px">
                                                &nbsp;IPV Date&nbsp; :
                                            </div>
                                            <div class="left" style="height: 25px; margin-left: 25px;">
                                                <dxe:ASPxDateEdit ID="IpvDt" TabIndex="0" runat="server" Width="150px" ClientInstanceName="cIpvDt"
                                                    Font-Size="11px" UseMaskBehavior="True" EditFormatString="dd-MM-yyyy" EditFormat="Custom"
                                                    DateOnError="Today">
                                                </dxe:ASPxDateEdit>
                                            </div>
                                            <div id="Row25_Col1_row4" class="left" style="width: 100%">
                                                <div id="DivInIPV" class="left" style="height: 25px">
                                                    Relationship with the Intermediary / Designation :</div>
                                                <div id="DivNonInIPV" class="left" style="height: 25px; width: 150px;">
                                                    Details / Designation:</div>
                                                <div class="left" style="height: 25px">
                                                    <dxe:ASPxTextBox ID="TxtRelBrokr" runat="server" ClientInstanceName="cTxtRelBrokr"
                                                        MaxLength="50" HorizontalAlign="left" Width="185px">
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
                                    <div id="DivPrtnerHdr" style="width: 1200px; font-family: Calibri; font-weight: bold;
                                        margin-top: 10px; margin-bottom: 20px; background-color: #DDD; height: 25px;">
                                        &nbsp;Details of Promoters/ Partners/ Karta / Trustees and whole time directors
                                        for Non-Individuals &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    </div>
                                    <div id="Row26" class="Row">
                                        <div class="Row"> 
                                            <div id="Row26_Col0" class="LFloat_Lable Leftdiv BtmMargin" style="height: 38px;">
                                                <span class="Spanclass"></span>Name Of The Related Person:<span style="font-size: 10pt;
                                                    color: #ff0000">**</span>
                                            </div>  
                                            <div id="Row26_Col11A" class="LFloat_Row BtmMargin" style="height: 38px; text-align: center;">
                                                <dxe:ASPxTextBox ID="txtRPPrefix" runat="server" ClientInstanceName="ctxtRPPrefix" Width="100px">
                                                </dxe:ASPxTextBox>
                                                <span style="font-size: 8pt">[Prefix]</span>
                                            </div>
                                            <div id="Row26_Col11B" class="LFloat_Row BtmMargin" style="height: 38px; text-align: center;">
                                               <dxe:ASPxTextBox ID="TxtCHName" runat="server" ClientInstanceName="cTxtCHName" Width="100px">
                                               </dxe:ASPxTextBox>
                                                <span style="font-size: 8pt">[First Name]</span>
                                            </div>
                                            <div id="Row26_Col11C" class="LFloat_Row DivName" style="height: 38px;">
                                                <dxe:ASPxTextBox ID="txtRPMiddleName" runat="server" ClientInstanceName="ctxtRPMiddleName"
                                                                HorizontalAlign="left" Width="100px"> 
                                               </dxe:ASPxTextBox>
                                                <span style="font-size: 8pt">[Middle Name]</span>
                                            </div>
                                            <div id="Row26_Col11D" class="LFloat_Row DivName" style="height: 38px;">
                                                 <dxe:ASPxTextBox ID="txtRPLastName" runat="server" ClientInstanceName="ctxtRPLastName"
                                                                HorizontalAlign="left" Width="100px"> 
                                                 </dxe:ASPxTextBox>
                                                 <span style="font-size: 8pt">[Last Name]</span>
                                            </div> 
                                        </div>  
                                        <div class="Row">
                                            <div id="Div53" class="LFloat_Lable Leftdiv" style="height: 37px">
                                                Father / Spouse:
                                                </div>
                                            <div id="Div54" class="LFloat_Row" style="height: 37px; margin-right: 10px;">
                                                 <asp:RadioButton ID="rbtnRPFather" runat="server" Checked="True" Text="Father" GroupName="RP" />
                                                 <asp:RadioButton ID="rbtnRPSpouse" runat="server" Text="Spouse" GroupName="RP" />
                                            </div>
                                        </div>
                                        
                                        <div class="Row">  
                                            <div id="Div59" class="LFloat_Lable Leftdiv BtmMargin" style="height: 38px;">
                                                <span class="Spanclass"></span>Name Of The Related Related Person's Father/Spouse Name:<span style="font-size: 10pt;
                                                    color: #ff0000">**</span>
                                            </div>  
                                            <div id="Div60" class="LFloat_Row BtmMargin" style="height: 38px; text-align: center;">
                                                <dxe:ASPxTextBox ID="txtRPFatherPrefix" runat="server" ClientInstanceName="ctxtRPFatherPrefix" Width="100px">
                                                </dxe:ASPxTextBox>
                                                <span style="font-size: 8pt">[Prefix]</span>
                                            </div>
                                            <div id="Div61" class="LFloat_Row BtmMargin" style="height: 38px; text-align: center;">
                                               <dxe:ASPxTextBox ID="txtRPFatherFirstName" runat="server" ClientInstanceName="ctxtRPFatherFirstName" Width="100px">
                                                </dxe:ASPxTextBox>
                                                <span style="font-size: 8pt">[First Name]</span>
                                            </div>
                                            <div id="Div62" class="LFloat_Row DivName" style="height: 38px;"> 
                                                 <dxe:ASPxTextBox ID="txtRPFatherMiddleName" runat="server" ClientInstanceName="ctxtRPFatherMiddleName"
                                                            HorizontalAlign="left" Width="100px"> 
                                                  </dxe:ASPxTextBox>
                                                <span style="font-size: 8pt">[Middle Name]</span>
                                            </div>
                                            <div id="Div63" class="LFloat_Row DivName" style="height: 38px;"> 
                                                  <dxe:ASPxTextBox ID="txtRPFatherLastName" runat="server" ClientInstanceName="ctxtRPFatherLastName"
                                                            HorizontalAlign="left" Width="100px"> 
                                               </dxe:ASPxTextBox>
                                                 <span style="font-size: 8pt">[Last Name]</span>
                                            </div>  
                                        </div> 
                                        <div class="Row"> 
                                            <div id="Div44" class="LFloat_Lable Leftdiv BtmMargin" style="height: 38px;">
                                                <span class="Spanclass"></span>Mother's Name Of The Related Person:<span style="font-size: 10pt;
                                                    color: #ff0000">**</span>
                                            </div>  
                                            <div id="Div55" class="LFloat_Row BtmMargin" style="height: 38px; text-align: center;">
                                                 <dxe:ASPxTextBox ID="txtRPMotherPrefix" runat="server" ClientInstanceName="ctxtRPMotherPrefix" Width="100px">
                                                 </dxe:ASPxTextBox>
                                                <span style="font-size: 8pt">[Prefix]</span>
                                            </div>
                                            <div id="Div56" class="LFloat_Row BtmMargin" style="height: 38px; text-align: center;"> 
                                               <dxe:ASPxTextBox ID="txtRPMotherFirstName" runat="server" ClientInstanceName="ctxtRPMotherFirstName" Width="100px">
                                                </dxe:ASPxTextBox>
                                                <span style="font-size: 8pt">[First Name]</span>
                                            </div>
                                            <div id="Div57" class="LFloat_Row DivName" style="height: 38px;">
                                                
                                                <dxe:ASPxTextBox ID="txtRPMotherMiddleName" runat="server" ClientInstanceName="ctxtRPMotherMiddleName"
                                                            HorizontalAlign="left" Width="100px"> 
                                                 </dxe:ASPxTextBox>
                                                <span style="font-size: 8pt">[Middle Name]</span>
                                            </div>
                                            <div id="Div58" class="LFloat_Row DivName" style="height: 38px;">
                                                 
                                                  <dxe:ASPxTextBox ID="txtRPMotherLastName" runat="server" ClientInstanceName="txtRPMotherLastName"
                                                            HorizontalAlign="left" Width="100px"> 
                                                  </dxe:ASPxTextBox> 
                                                 <span style="font-size: 8pt">[Last Name]</span>
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
                                            <span class="Spanclass"></span>PAN: <span style="font-size: 10pt; color: #ff0000">**</span>
                                        </div>
                                        <div id="Row26_Col5" class="LFloat_Row" style="height: 35px">
                                            <dxe:ASPxTextBox ID="TxtCHPan" runat="server" ClientInstanceName="cTxtCHPan" MaxLength="10"
                                                Width="150px">
                                                <ClientSideEvents KeyUp="function(s,e){s.SetText(s.GetValue().toUpperCase());}" />
                                                <%--LostFocus="function(s, e) {verifyPanCrdNo(cTxtCHPan);}"--%>
                                            </dxe:ASPxTextBox>
                                        </div>
                                        <div class="Row">
                                            <div id="Row26_Col6" class="LFloat_Lable Leftdiv">
                                                <span class="Spanclass"></span>Address: <span style="font-size: 10pt; color: #ff0000">
                                                    **</span></div>
                                            <div id="Row26_Col7" class="LFloat_Row FontChange" style="width: 58%">
                                                <div style="margin-bottom: 2px" class="left">
                                                    <div class="left" style="margin-right: 14px">
                                                        <span style="font-size: 8pt">[House No]</span>
                                                    </div>
                                                    <div class="left">
                                                        <dxe:ASPxTextBox ID="TxtCHAddress1" runat="server" ClientInstanceName="cTxtCHAddress1"
                                                            HorizontalAlign="left" Width="500px">
                                                            <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtCHAddress1);}" 
                                                                TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                                                </ClientSideEvents>--%>
                                                        </dxe:ASPxTextBox>
                                                    </div>
                                                </div>
                                                <div style="margin-bottom: 2px" class="left">
                                                    <div class="left" style="margin-right: 2px">
                                                        <span style="font-size: 8pt">[Street Name]</span>
                                                    </div>
                                                    <div class="left">
                                                        <dxe:ASPxTextBox ID="TxtCHAddress2" runat="server" ClientInstanceName="cTxtCHAddress2"
                                                            HorizontalAlign="left" Width="500px">
                                                            <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtCHAddress2);}" 
                                                                 TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                                              </ClientSideEvents>--%>
                                                        </dxe:ASPxTextBox>
                                                    </div>
                                                </div>
                                                <div style="margin-bottom: 4px" class="left">
                                                    <div class="left" style="margin-right: 7px">
                                                        <span style="font-size: 8pt">[Area Name]</span>
                                                    </div>
                                                    <div class="left">
                                                        <dxe:ASPxTextBox ID="TxtCHAddress3" runat="server" ClientInstanceName="cTxtCHAddress3"
                                                            HorizontalAlign="left" Width="500px">
                                                            <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtCHAddress3);}" 
                                                                    TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                                                </ClientSideEvents>--%>
                                                        </dxe:ASPxTextBox>
                                                    </div>
                                                </div>
                                                <div class="left" style="height: 30px; margin-left: 67px;">
                                                    <dxe:ASPxComboBox ID="ComboCHCountry" runat="server" ClientInstanceName="cComboCHCountry"
                                                        EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                        Width="150px">
                                                        <ClientSideEvents SelectedIndexChanged="function(s,e){OnTypeChange()}"></ClientSideEvents>
                                                        <DropDownButton Text="Country">
                                                        </DropDownButton>
                                                    </dxe:ASPxComboBox>
                                                </div>
                                                <div class="left" style="height: 30px; margin-left: 2px;">
                                                    <dxe:ASPxComboBox ID="ComboCHState" runat="server" ClientInstanceName="cComboCHState"
                                                        EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                        Width="150px">
                                                        <ClientSideEvents SelectedIndexChanged="function(s,e){OnStateChange('3')}"></ClientSideEvents>
                                                        <DropDownButton Text="State">
                                                        </DropDownButton>
                                                    </dxe:ASPxComboBox>
                                                </div>
                                                <div id="DivStateCHOthr" class="left" style="height: 30px; margin-left: 2px;display:none;">
                                                    <dxe:ASPxTextBox ID="TxtStateCHOthr" runat="server" ClientInstanceName="cTxtStateCHOthr"
                                                        Width="150px">
                                                    </dxe:ASPxTextBox>
                                                    (Please Specify)
                                                </div>
                                                <div class="left" style="width: 99%">
                                                    <div class="left" style="height: 25px">
                                                        City/Town/Village :
                                                    </div>
                                                    <div class="left" style="height: 25px">
                                                        <dxe:ASPxComboBox ID="ComboCHCity" runat="server" ClientInstanceName="cComboCHCity"
                                                            EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                            Width="150px">
                                                            <ClientSideEvents SelectedIndexChanged="function(s,e){OnTypeChange()}"></ClientSideEvents>
                                                        </dxe:ASPxComboBox>
                                                    </div>
                                                    <div class="left" style="height: 25px; margin-left: 2px;">
                                                        PinCode :
                                                    </div>
                                                    <div class="left" style="height: 25px">
                                                        <dxe:ASPxTextBox ID="TxtCHPin" runat="server" ClientInstanceName="cTxtCHPin" Width="154px"
                                                            HorizontalAlign="right">
                                                            <MaskSettings Mask="<0..999999999>" />
                                                        </dxe:ASPxTextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="Row">
                                            <div id="Row26_Col8" class="LFloat_Lable Leftdiv" style="height: 60px">
                                                Contact&nbsp; Details:
                                                <br />
                                                <span class="Spanclass"></span><span style="font-size: 8pt">[Mandatory to Give Atleast&nbsp;<br />
                                                    &nbsp; &nbsp; &nbsp;One Contact No ] <span style="font-size: 10pt; color: #ff0000">**</span></span></div>
                                            <div id="Row26_Col9" class="LFloat_Row FontChange" style="width: 58%">
                                                <div class="left" style="width: 99%">
                                                    <div class="left" style="height: 25px">
                                                        &nbsp; &nbsp;&nbsp; Tel(Off) &nbsp;:
                                                    </div>
                                                    <div class="left" style="height: 25px">
                                                        <dxe:ASPxTextBox ID="TxtCHTelOfc" runat="server" ClientInstanceName="cTxtCHTelOfc"
                                                            MaxLength="11" HorizontalAlign="Right" Width="136px">
                                                            <ClientSideEvents LostFocus="function(s, e) {CheckTheLeast(cTxtCHTelOfc.GetText());}" />
                                                            <MaskSettings Mask="<0..99999999999>" />
                                                        </dxe:ASPxTextBox>
                                                    </div>
                                                    <div class="left" style="height: 25px">
                                                        &nbsp;Tel(Res) :
                                                    </div>
                                                    <div class="left" style="height: 25px">
                                                        <dxe:ASPxTextBox ID="TxtCHTelRes" runat="server" ClientInstanceName="cTxtCHTelRes"
                                                            MaxLength="11" HorizontalAlign="Right" Width="125px">
                                                            <ClientSideEvents LostFocus="function(s, e) {CheckTheLeast(cTxtCHTelRes.GetText());}" />
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
                                                            <ClientSideEvents LostFocus="function(s, e) {CheckTheLeast(cTxtCHMobileNo.GetText());}" />
                                                            <MaskSettings Mask="<0..9999999999>" />
                                                        </dxe:ASPxTextBox>
                                                    </div>
                                                </div>
                                                <div class="left" style="height: 25px">
                                                    &nbsp; &nbsp; Email ID :
                                                </div>
                                                <div class="left" style="height: 25px">
                                                    <dxe:ASPxTextBox ID="TxtCHEmlID" runat="server" ClientInstanceName="cTxtCHEmlID"
                                                        Width="300px">
                                                        <ClientSideEvents LostFocus="function(s, e) {verifyEmail(cTxtCHEmlID.GetText());}" />
                                                    </dxe:ASPxTextBox>
                                                </div>
                                            </div>
                                            <div class="Row">
                                                <div id="Row26_Col10" class="LFloat_Lable Leftdiv" style="margin-bottom: 10px; height: 38px;">
                                                    Relationship with Applicant (Proffession):
                                                </div>
                                                <div id="Row26_Col11" class="LFloat_Row" style="height: 38px">
                                                    <dxe:ASPxComboBox ID="ComboRelWthapli" runat="server" ClientInstanceName="cComboRelWthapli"
                                                        EnableIncrementalFiltering="True" Font-Size="12px" ValueType="System.String"
                                                        Width="150px" Height="25px">
                                                        <%-- <ClientSideEvents  SelectedIndexChanged="OccupationChange"/>--%>
                                                    </dxe:ASPxComboBox>
                                                </div>
                                                <div id="Row26_Col12" class="LFloat_Row FontChange" style="height: 38px; width: 52%;
                                                    margin-left: 10px;">
                                                    <dxe:ASPxRadioButtonList ID="rdCHPep" runat="server" ClientInstanceName="crdCHPep"
                                                        Border-BorderStyle="none" RepeatLayout="Flow" RepeatDirection="Horizontal">
                                                        <Border BorderStyle="None" />
                                                    </dxe:ASPxRadioButtonList>
                                                </div>
                                            </div>
                                            <div class="Row">
                                                <div id="Row26_Col13" class="LFloat_Lable Leftdiv">
                                                    IPV Details:
                                                </div>
                                                <div id="Row26_Col14" class="LFloat_Row FontChange" style="height: 60px; width: 58%;">
                                                    <div class="left" style="width: 99%">
                                                        <div class="left" style="height: 25px">
                                                            IPV Done By :
                                                        </div>
                                                        <div class="left LeftMargin" style="height: 25px">
                                                            <dxe:ASPxComboBox ID="ComboCHIPVConType" runat="server" ClientInstanceName="cComboCHIPVConType"
                                                                EnableIncrementalFiltering="True" Font-Size="12px" ValueType="System.String"
                                                                Width="185px">
                                                                <ClientSideEvents SelectedIndexChanged="IPVCHCntTypeChange" />
                                                                <DropDownButton Text="ContactType">
                                                                </DropDownButton>
                                                            </dxe:ASPxComboBox>
                                                        </div>
                                                        <div class="left" style="height: 25px">
                                                            &nbsp; Select Name :
                                                        </div>
                                                        <div class="left LeftMargin" style="height: 25px">
                                                            <dxcp:ASPxCallbackPanel ID="CbpCHIpvBy" runat="server" ClientInstanceName="cCbpCHIpvBy"
                                                                OnCallback="CbpCHIpvBy_Callback" BackColor="Transparent" Height="20px">
                                                                <PanelCollection>
                                                                    <dxp:PanelContent runat="server">
                                                                        <asp:TextBox ID="TxtCHIPVby" runat="server" Width="172px"></asp:TextBox>
                                                                        <asp:HiddenField ID="TxtCHIPVby_hidden" runat="server" />
                                                                    </dxp:PanelContent>
                                                                </PanelCollection>
                                                            </dxcp:ASPxCallbackPanel>
                                                        </div>
                                                    </div>
                                                    <div class="left" style="height: 25px">
                                                        &nbsp;IPV Date&nbsp; :
                                                    </div>
                                                    <div class="left" style="height: 25px; margin-left: 25px;">
                                                        <dxe:ASPxDateEdit ID="CHIpvDt" TabIndex="0" runat="server" Width="150px" ClientInstanceName="cCHIpvDt"
                                                            Font-Size="11px" UseMaskBehavior="True" EditFormatString="dd-MM-yyyy" EditFormat="Custom"
                                                            DateOnError="Today">
                                                        </dxe:ASPxDateEdit>
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
                                            <div class="Row">
                                                <div id="Div38" class="LFloat_Lable Leftdiv">
                                                    Is Controlling Person:
                                                </div>
                                                <dxe:ASPxCheckBox ID="chkControllingPerson" runat="server">
                                                    
                                                </dxe:ASPxCheckBox> 
                                            </div>
                                            <div runat="server" style="width: 10%; padding-left: 100px; margin-left: 20px;">
                                                <dxe:ASPxButton ID="BtnAddRecord" TabIndex="0" runat="server" Width="130px" Text="AddRecord"
                                                    ClientInstanceName="cBtnAddRecord" AutoPostBack="false">
                                                    <ClientSideEvents Click="function(s, e) {AddCompanyHolderRecords();}"></ClientSideEvents>
                                                </dxe:ASPxButton>
                                            </div>
                                            <br />
                                            <br />
                                            <div id="Div_GVCHrecord" style="float: left; padding-top: 10px; width: 100%; margin-top: 10px;
                                                margin-bottom: 10px;" align="center">
                                                <dxwgv:ASPxGridView ID="GvCHRecord" runat="server" Settings-ShowHorizontalScrollBar="true"
                                                    AutoGenerateColumns="False" KeyFieldName="RowID" Width="850px" Font-Size="Small"
                                                    ClientInstanceName="cGvCHRecord" OnCustomCallback="GvCHRecord_CustomCallback"
                                                    OnHtmlEditFormCreated="GvCHRecord_HtmlEditFormCreated" OnRowDeleting="GvCHRecord_RowDeleting">
                                                    <ClientSideEvents EndCallback="function (s, e) {GvCHRecord_EndCallBack();}" />
                                                    <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="NextColumn" ConfirmDelete="true"
                                                        AllowDragDrop="False" AllowSort="false" />
                                                    <Styles>
                                                        <Header CssClass="gridheader" ImageSpacing="5px">
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
                                                        <dxwgv:GridViewDataTextColumn Caption="Din/Uid" FieldName="DinUid" VisibleIndex="3"
                                                            Width="80px">
                                                            <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="PAN" FieldName="PAN" VisibleIndex="4" Width="80px">
                                                            <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Address1" FieldName="Address1" VisibleIndex="5"
                                                            Width="180px">
                                                            <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Address2" FieldName="Address2" VisibleIndex="6"
                                                            Width="180px">
                                                            <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Address3" FieldName="Address3" VisibleIndex="7"
                                                            Width="180px">
                                                            <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="PIN" FieldName="PIN" VisibleIndex="8" Width="150px">
                                                            <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Country" FieldName="Country" VisibleIndex="9"
                                                            Width="120px" Visible="false">
                                                            <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="State" FieldName="State" VisibleIndex="10"
                                                            Width="150px" Visible="false">
                                                            <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="City" FieldName="City" VisibleIndex="11" Width="120px"
                                                            Visible="false">
                                                            <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Ofc Phone" FieldName="OPhone" VisibleIndex="12"
                                                            Width="120px">
                                                            <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Res Phone" FieldName="RPhone" VisibleIndex="13"
                                                            Width="120px">
                                                            <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Mobile" FieldName="Mobile" VisibleIndex="14"
                                                            Width="120px">
                                                            <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Email" FieldName="Email" VisibleIndex="15"
                                                            Width="120px">
                                                            <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="RelationshipWithApplicant" FieldName="RelText"
                                                            VisibleIndex="16" Width="180px">
                                                            <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Is PeP Or Not" FieldName="PeP" VisibleIndex="17"
                                                            Width="70px" Visible="false">
                                                            <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="IPVDoneBy" FieldName="IPVDoneBy" VisibleIndex="18"
                                                            Width="120px">
                                                            <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="IPVDate" FieldName="IPVDate" VisibleIndex="19"
                                                            Width="120px">
                                                            <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="RelationWithBroker" FieldName="RelationWithBroker"
                                                            VisibleIndex="20" Width="180px">
                                                            <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="StateOther" FieldName="StateOther" VisibleIndex="21"
                                                            Width="180px" Visible="false">
                                                            <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="IPVDoneByText" FieldName="IPVDoneByText" VisibleIndex="22"
                                                            Width="180px" Visible="false">
                                                            <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                    </Columns>
                                                    <Templates>
                                                        <EditForm>
                                                            <div>
                                                                <div id="Row26E" class="Row">
                                                                    <div class="Row">   
                                                                        <div id="ERow26_Col0" class="LFloat_Lable Leftdiv BtmMargin" style="height: 38px;">
                                                                        <span class="Spanclass"></span>Name Of The Related Person:<span style="font-size: 10pt;
                                                                        color: #ff0000">**</span>
                                                                    </div>  
                                                                        <div id="Row26_Col11AE" class="LFloat_Row BtmMargin" style="height: 38px; text-align: center;">
                                                                        <dxe:ASPxTextBox ID="txtRPPrefixE" Text='<%# Bind("KYCDetail_RPersonPrefix") %>' runat="server" ClientInstanceName="ctxtRPPrefixE" Width="100px">
                                                                        </dxe:ASPxTextBox>
                                                                        <span style="font-size: 8pt">[Prefix]</span>
                                                                    </div>
                                                                        <div id="Row26_Col11BE" class="LFloat_Row BtmMargin" style="height: 38px; text-align: center;">
                                                                        <dxe:ASPxTextBox ID="TxtCHNameE" runat="server" Text='<%# Bind("Name") %>' ClientInstanceName="cTxtCHName" Width="100px">
                                                                        </dxe:ASPxTextBox>
                                                                        <span style="font-size: 8pt">[First Name]</span>
                                                                    </div>
                                                                        <div id="Row26_Col11CE" class="LFloat_Row DivName" style="height: 38px;">
                                                                        <dxe:ASPxTextBox ID="txtRPMiddleNameE" Text='<%# Bind("KYCDetail_RPersonMiddleName") %>' runat="server" ClientInstanceName="ctxtRPMiddleNameE"
                                                                                    HorizontalAlign="left" Width="100px"> 
                                                                        </dxe:ASPxTextBox>
                                                                        <span style="font-size: 8pt">[Middle Name]</span>
                                                                    </div>
                                                                        <div id="Row26_Col11DE" class="LFloat_Row DivName" style="height: 38px;">
                                                                        <dxe:ASPxTextBox ID="txtRPLastNameE" Text='<%# Bind("KYCDetail_RPersonLastName") %>' runat="server" ClientInstanceName="ctxtRPLastNameE"
                                                                                    HorizontalAlign="left" Width="100px"> 
                                                                        </dxe:ASPxTextBox>
                                                                        <span style="font-size: 8pt">[Last Name]</span>
                                                                     </div>  
                                                                        <%--<div id="Row26_Col0E" class="LFloat_Lable Leftdiv">
                                                                            <span class="Spanclass">**</span>Name:
                                                                        </div>
                                                                        <div id="Row26_Col1E" class="LFloat_Row" style="height: 25px">
                                                                            <dxe:ASPxTextBox ID="TxtCHNameE" runat="server" ClientInstanceName="cTxtCHName" Width="400px"
                                                                                Text='<%# Bind("Name") %>'>
                                                                            </dxe:ASPxTextBox>
                                                                        </div>--%>
                                                                    </div>
                                                                    <div class="Row">
                                                                        <div id="EDiv53" class="LFloat_Lable Leftdiv" style="height: 37px">
                                                                            Father / Spouse:
                                                                            </div>
                                                                        <div id="EDiv54" class="LFloat_Row" style="height: 37px; margin-right: 10px;">
                                                                             <asp:RadioButton ID="rbtnRPFatherE" runat="server" Checked="True" Text="Father" GroupName="RPE" />
                                                                             <asp:RadioButton ID="rbtnRPSpouseE" runat="server" Text="Spouse" GroupName="RPE" />
                                                                        </div>
                                                                    </div>                 
                                                                    <div class="Row">  
                                                                        <div id="EDiv59" class="LFloat_Lable Leftdiv BtmMargin" style="height: 38px;">
                                                                            <span class="Spanclass"></span>Name Of The Related Related Person's Father/Spouse Name:<span style="font-size: 10pt;
                                                                                color: #ff0000">**</span>
                                                                        </div>  
                                                                        <div id="EDiv60" class="LFloat_Row BtmMargin" style="height: 38px; text-align: center;">
                                                                            <dxe:ASPxTextBox ID="txtRPFatherPrefixE" Text='<%# Bind("KYCDetail_RPersonFatherPrefix") %>' runat="server" ClientInstanceName="ctxtRPFatherPrefixE" Width="100px">
                                                                            </dxe:ASPxTextBox>
                                                                            <span style="font-size: 8pt">[Prefix]</span>
                                                                        </div>
                                                                        <div id="EDiv61" class="LFloat_Row BtmMargin" style="height: 38px; text-align: center;">
                                                                           <dxe:ASPxTextBox ID="txtRPFatherFirstNameE" Text='<%# Bind("KYCDetail_RPersonFatherFirstName") %>' runat="server" ClientInstanceName="ctxtRPFatherFirstNameE" Width="100px">
                                                                            </dxe:ASPxTextBox>
                                                                            <span style="font-size: 8pt">[First Name]</span>
                                                                        </div>
                                                                        <div id="EDiv62" class="LFloat_Row DivName" style="height: 38px;"> 
                                                                             <dxe:ASPxTextBox ID="txtRPFatherMiddleNameE" Text='<%# Bind("KYCDetail_RPersonFatherMiddle") %>' runat="server" ClientInstanceName="ctxtRPFatherMiddleNameE"
                                                                                        HorizontalAlign="left" Width="100px"> 
                                                                              </dxe:ASPxTextBox>
                                                                            <span style="font-size: 8pt">[Middle Name]</span>
                                                                        </div>
                                                                        <div id="EDiv63" class="LFloat_Row DivName" style="height: 38px;"> 
                                                                              <dxe:ASPxTextBox ID="txtRPFatherLastNameE" Text='<%# Bind("KYCDetail_RPersonFatherLastName") %>' runat="server" ClientInstanceName="ctxtRPFatherLastName"
                                                                                        HorizontalAlign="left" Width="100px"> 
                                                                           </dxe:ASPxTextBox>
                                                                             <span style="font-size: 8pt">[Last Name]</span>
                                                                        </div>  
                                                                </div> 
                                                                <div class="Row"> 
                                                                    <div id="EDiv44" class="LFloat_Lable Leftdiv BtmMargin" style="height: 38px;">
                                                                        <span class="Spanclass"></span>Name Of The Related Person:<span style="font-size: 10pt;
                                                                            color: #ff0000">**</span>
                                                                    </div>  
                                                                    <div id="EDiv55" class="LFloat_Row BtmMargin" style="height: 38px; text-align: center;">
                                                                         <dxe:ASPxTextBox ID="txtRPMotherPrefixE" Text='<%# Bind("KYCDetail_RPersonMotherPrefix") %>' runat="server" ClientInstanceName="ctxtRPMotherPrefixE" Width="100px">
                                                                         </dxe:ASPxTextBox>
                                                                        <span style="font-size: 8pt">[Prefix]</span>
                                                                    </div>
                                                                    <div id="EDiv56" class="LFloat_Row BtmMargin" style="height: 38px; text-align: center;"> 
                                                                       <dxe:ASPxTextBox ID="txtRPMotherFirstNameE" Text='<%# bind("KYCDetail_RPersonMotherFirstName") %>' runat="server" ClientInstanceName="ctxtRPMotherFirstNameE" Width="100px">
                                                                        </dxe:ASPxTextBox>
                                                                        <span style="font-size: 8pt">[First Name]</span>
                                                                    </div>
                                                                    <div id="EDiv57" class="LFloat_Row DivName" style="height: 38px;">
                                                                        
                                                                        <dxe:ASPxTextBox ID="txtRPMotherMiddleNameE" Text='<%# Bind("KYCDetail_RPersonMotherMiddle") %>' runat="server" ClientInstanceName="ctxtRPMotherMiddleNameE"
                                                                                    HorizontalAlign="left" Width="100px"> 
                                                                         </dxe:ASPxTextBox>
                                                                        <span style="font-size: 8pt">[Middle Name]</span>
                                                                    </div>
                                                                    <div id="EDiv58" class="LFloat_Row DivName" style="height: 38px;">
                                                                         
                                                                          <dxe:ASPxTextBox ID="txtRPMotherLastNameE" Text='<%# Bind("KYCDetail_RPersonMotherLastName") %>' runat="server" ClientInstanceName="txtRPMotherLastNameE"
                                                                                    HorizontalAlign="left" Width="100px"> 
                                                                          </dxe:ASPxTextBox> 
                                                                         <span style="font-size: 8pt">[Last Name]</span>
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
                                                                        <div id="Row26_Col7E" class="LFloat_Row" style="width: 30%">
                                                                            <div style="margin-bottom: 2px">
                                                                                <dxe:ASPxTextBox ID="TxtCHAddress1E" runat="server" ClientInstanceName="cTxtCHAddress1E"
                                                                                    NullText="                                           House No" ForeColor="Silver"
                                                                                    HorizontalAlign="left" Width="350px" Text='<%# Bind("Address1") %>'>
                                                                                    <ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}"
                                                                                        LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtCHAddress1E);}"
                                                                                        TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}"></ClientSideEvents>
                                                                                </dxe:ASPxTextBox>
                                                                            </div>
                                                                            <div style="margin-bottom: 2px">
                                                                                <dxe:ASPxTextBox ID="TxtCHAddress2E" runat="server" ClientInstanceName="cTxtCHAddress2E"
                                                                                    NullText="                                           Street Name" ForeColor="Silver"
                                                                                    HorizontalAlign="left" Width="350px" Text='<%# Bind("Address2") %>'>
                                                                                    <ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}"
                                                                                        LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtCHAddress2E);}"
                                                                                        TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}"></ClientSideEvents>
                                                                                </dxe:ASPxTextBox>
                                                                            </div>
                                                                            <div style="margin-bottom: 5px">
                                                                                <dxe:ASPxTextBox ID="TxtCHAddress3E" runat="server" ClientInstanceName="cTxtCHAddress3E"
                                                                                    NullText="                                           Area Name" ForeColor="Silver"
                                                                                    HorizontalAlign="left" Width="350px" Text='<%# Bind("Address3") %>'>
                                                                                    <ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}"
                                                                                        LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtCHAddress3E);}"
                                                                                        TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}"></ClientSideEvents>
                                                                                </dxe:ASPxTextBox>
                                                                            </div>
                                                                            <div class="left" style="width: 99%; margin-bottom: 2px">
                                                                                <div class="left" style="height: 25px">
                                                                                    City/Town/Village :
                                                                                </div>
                                                                                <div class="left" style="height: 25px">
                                                                                    <dxe:ASPxComboBox ID="ComboCHCityE" runat="server" ClientInstanceName="cComboCHCityE"
                                                                                        EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                                                        Width="140px">
                                                                                        <ClientSideEvents SelectedIndexChanged="function(s,e){OnTypeChange()}"></ClientSideEvents>
                                                                                    </dxe:ASPxComboBox>
                                                                                </div>
                                                                                <div class="left" style="height: 25px">
                                                                                    &nbsp; &nbsp;PinCode :
                                                                                </div>
                                                                                <div class="left" style="height: 25px">
                                                                                    <dxe:ASPxTextBox ID="TxtCHPinE" runat="server" ClientInstanceName="cTxtCHPinE" Width="125px"
                                                                                        HorizontalAlign="right" Text='<%# Bind("PIN") %>'>
                                                                                        <MaskSettings Mask="<0..999999999>" />
                                                                                    </dxe:ASPxTextBox>
                                                                                </div>
                                                                            </div>
                                                                            <div class="left" style="height: 25px">
                                                                                <dxe:ASPxComboBox ID="ComboCHStateE" runat="server" ClientInstanceName="cComboCHStateE"
                                                                                    EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                                                    Width="140px">
                                                                                    <DropDownButton Text="State">
                                                                                    </DropDownButton>
                                                                                    <ClientSideEvents SelectedIndexChanged="function(s,e){OnStateChange('4')}"></ClientSideEvents>
                                                                                </dxe:ASPxComboBox>
                                                                            </div>
                                                                            <div id="DivStateCHOthrE" class="left" style="height: 30px; margin-left: 2px;display:none;">
                                                                                <dxe:ASPxTextBox ID="TxtStateCHOthrE" runat="server" ClientInstanceName="cTxtStateCHOthrE"
                                                                                    Text='<%# Bind("StateOther") %>' Width="150px">
                                                                                </dxe:ASPxTextBox>
                                                                                (Please Specify)
                                                                            </div>
                                                                            <div class="left" style="height: 25px; margin-left: 4px;">
                                                                                <dxe:ASPxComboBox ID="ComboCHCountryE" runat="server" ClientInstanceName="cComboCHCountryE"
                                                                                    EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                                                    Width="150px">
                                                                                    <DropDownButton Text="Country">
                                                                                    </DropDownButton>
                                                                                    <ClientSideEvents SelectedIndexChanged="function(s,e){OnTypeChange()}"></ClientSideEvents>
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
                                                                        <div id="Row26_Col9" class="LFloat_Row" style="width: 30%">
                                                                            <div class="left" style="width: 99%">
                                                                                <div class="left" style="height: 25px">
                                                                                    Tel(Off) &nbsp;:
                                                                                </div>
                                                                                <div class="left" style="height: 25px">
                                                                                    <dxe:ASPxTextBox ID="TxtCHTelOfcE" runat="server" ClientInstanceName="cTxtCHTelOfcE"
                                                                                        MaxLength="11" HorizontalAlign="Right" Width="120px" Text='<%# Bind("OPhone") %>'>
                                                                                        <MaskSettings Mask="<0..99999999999>" />
                                                                                    </dxe:ASPxTextBox>
                                                                                </div>
                                                                                <div class="left" style="height: 25px">
                                                                                    Tel(Res) :
                                                                                </div>
                                                                                <div class="left" style="height: 25px">
                                                                                    <dxe:ASPxTextBox ID="TxtCHTelResE" runat="server" ClientInstanceName="cTxtCHTelResE"
                                                                                        MaxLength="11" HorizontalAlign="Right" Width="120px" Text='<%# Bind("RPhone") %>'>
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
                                                                                Email ID :
                                                                            </div>
                                                                            <div class="left" style="height: 25px">
                                                                                <dxe:ASPxTextBox ID="TxtCHEmlIDE" runat="server" ClientInstanceName="cTxtCHEmlIDE"
                                                                                    Width="300px" Text='<%# Bind("Email") %>'>
                                                                                    <ClientSideEvents LostFocus="function(s, e) {verifyEmail(cTxtCHEmlIDE);}" />
                                                                                </dxe:ASPxTextBox>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="Row">
                                                                        <div id="Row26_Col10E" class="LFloat_Lable Leftdiv">
                                                                            Relationship with Applicant:
                                                                        </div>
                                                                        <div id="Row26_Col11E" class="LFloat_Row" style="height: 25px">
                                                                            <dxe:ASPxComboBox ID="ComboRelWthapliE" runat="server" ClientInstanceName="cComboRelWthapliE"
                                                                                EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                                                Width="130px" Height="25px">
                                                                            </dxe:ASPxComboBox>
                                                                        </div>
                                                                        <div id="Row26_Col12E" class="LFloat_Row" style="height: 25px; margin-left: 10px;">
                                                                            <dxe:ASPxComboBox ID="ComboPEP" runat="server" ClientInstanceName="cComboPEP" EnableIncrementalFiltering="True"
                                                                                Font-Size="Small" SelectedIndex="0" ValueType="System.String" Width="200px">
                                                                                <DropDownButton Text="PEP">
                                                                                </DropDownButton>
                                                                            </dxe:ASPxComboBox>
                                                                        </div>
                                                                    </div>
                                                                    <div class="Row">
                                                                        <div id="Row26_Col13E" class="LFloat_Lable Leftdiv">
                                                                            IPV Details:
                                                                        </div>
                                                                        <div id="Row26_Col14E" class="LFloat_Row" style="height: 60px; width: 23%;">
                                                                            <div class="left">
                                                                                <div class="left" style="height: 25px">
                                                                                    IPV Done By :
                                                                                </div>
                                                                                <div class="left" style="height: 25px">
                                                                                    <div class="left LeftMargin" style="height: 25px">
                                                                                        <dxe:ASPxComboBox ID="ComboCHIPVConTypeE" runat="server" ClientInstanceName="cComboCHIPVConTypeE"
                                                                                            EnableIncrementalFiltering="True" Font-Size="12px" ValueType="System.String"
                                                                                            Width="185px">
                                                                                            <ClientSideEvents SelectedIndexChanged="IPVCHCntTypeChangeE" />
                                                                                            <DropDownButton Text="ContactType">
                                                                                            </DropDownButton>
                                                                                        </dxe:ASPxComboBox>
                                                                                    </div>
                                                                                    <div class="left LeftMargin" style="height: 25px">
                                                                                        Select Name:&nbsp;
                                                                                        <asp:TextBox ID="TxtCHIPVbyE" runat="server" Width="130px" Text='<%# Bind("IPVDoneByText") %>'></asp:TextBox>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="left" style="height: 25px">
                                                                                    &nbsp;IPV Date&nbsp; :
                                                                                </div>
                                                                                <div class="left" style="height: 25px">
                                                                                    <dxe:ASPxDateEdit ID="CHIpvDtE" TabIndex="0" runat="server" Width="150px" ClientInstanceName="cCHIpvDtE"
                                                                                        Font-Size="11px" UseMaskBehavior="True" EditFormatString="dd-MM-yyyy" EditFormat="Custom"
                                                                                        DateOnError="Today" Value='<%# Bind("IPVDate") %>' Text='<%# Bind("IPVDate") %>'>
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
                                                                    
                                                                    <div class="Row">
                                                                        <div id="Div42" class="LFloat_Lable Leftdiv">
                                                                            Is Controlling Person
                                                                        </div>
                                                                        <div id="Div43" class="LFloat_Row" style="height: 25px">
                                                                        <dxe:ASPxCheckBox ID="chkKYCDetail_ContrllingPerson" runat="server" 
                                                                        Checked="true"></dxe:ASPxCheckBox> 
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div id="DivbtnUpdtgv" style="float: left; width: 5%; margin-left: 15px">
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
                                            <div style="border-top: #ddd 1px solid; width: 100%; height: 10px; margin-top: 10px;">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="DivHeader" style="width: 100%">
                                        &nbsp; ATTACH DOCUMENTS
                                    </div>
                                    <div class="Row">
                                        <div id="Row26_Col17" class="LFloat_Lable Leftdiv" style="height: 40px; margin-bottom: 20px;">
                                            <span style="font-size: 10pt; color: #ff0000"></span>Attach Related Documents Of
                                            <span id="IndiDoc">Individual</span><span id="NonIndiDoc"> NonIndividual</span>:
                                            <span style="font-size: 10pt; color: #ff0000">**</span></div>
                                        <div id="Row26_Col18" class="LFloat_Row" style="height: 40px; margin-bottom: 20px;">
                                            <dxe:ASPxComboBox ID="ComboDocuments" runat="server" ClientInstanceName="cComboDocuments"
                                                EnableIncrementalFiltering="True" Font-Size="12px" SelectedIndex="0" ValueType="System.String"
                                                Width="150px">
                                                <ClientSideEvents SelectedIndexChanged="function(s,e){ComboAttchShowDelDoc();}" />
                                                <Items>
                                                    <dxe:ListEditItem Text="Add Attachments" Value="0" />
                                                    <dxe:ListEditItem Text="Show Attachments " Value="1" />
                                                </Items>
                                            </dxe:ASPxComboBox>
                                        </div>
                                        <div id="Row26_Col19" class="left" style="font-size: 12pt;">
                                            <div class="left">
                                                <dxe:ASPxButton ID="btnDocument" runat="server" AutoPostBack="false" TabIndex="0"
                                                    Width="40px" ClientInstanceName="cbtnDocument" BackColor="Transparent" Height="40px"
                                                    ToolTip="Click To Attach Documents">
                                                    <ClientSideEvents Click="function(s, e) {Attach_Show_DeleteDoc_Click();}" />
                                                    <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/attach.png"
                                                        Repeat="NoRepeat" />
                                                    <Border BorderColor="Transparent" BorderStyle="None" />
                                                </dxe:ASPxButton>
                                            </div>
                                            &nbsp;
                                            <div class="left" style="margin-right: 4px">
                                                <span style="font-size: 8pt; color: Red">** Atleast 3 Mandatory Docum ents Required</span>
                                            </div>
                                            <dxe:ASPxComboBox ID="ComboListMandatry" runat="server" ClientInstanceName="cComboListMandatry"
                                                EnableIncrementalFiltering="True" Font-Size="12px" ValueType="System.String"
                                                Width="120px" Height="25px">
                                                <DropDownButton Text="Click To View The List of Mandatory Type Documents">
                                                </DropDownButton>
                                            </dxe:ASPxComboBox>
                                        </div>
                                        <div id="div_PartnerDoc" class="Row">
                                            <div id="Row260_Col17" class="LFloat_Lable Leftdiv" style="height: 80px; margin-bottom: 25px;">
                                                <span style="font-size: 10pt; color: #ff0000"></span>Attach Related Documents of
                                                Promoters\ Partners\ Karta \Trustees And Whole Time Directors:<span style="font-size: 10pt;
                                                    color: #ff0000">**</span>
                                            </div>
                                            <div id="Row260_Col18" class="LFloat_Row" style="height: 25px">
                                                <dxe:ASPxComboBox ID="ComboPrtnrDocuments" runat="server" ClientInstanceName="cComboPrtnrDocuments"
                                                    EnableIncrementalFiltering="True" Font-Size="12px" SelectedIndex="0" ValueType="System.String"
                                                    Width="150px">
                                                    <ClientSideEvents SelectedIndexChanged="function(s,e){ComboAttchShowDelPrtnrDoc()}" />
                                                    <Items>
                                                        <dxe:ListEditItem Text="Add Attachments" Value="0" />
                                                        <dxe:ListEditItem Text="Show Attachments " Value="1" />
                                                    </Items>
                                                </dxe:ASPxComboBox>
                                            </div>
                                            <div id="Row260_Col19" class="left" style="margin-left: 4px;" onclick="return Row260_Col19_onclick()">
                                                <dxe:ASPxButton ID="btnAddDocumentPrtner" runat="server" AutoPostBack="false" TabIndex="0"
                                                    ToolTip="Click To Attach Documents" Width="40px" ClientInstanceName="cbtnAddDocumentPrtner"
                                                    BackColor="Transparent" Height="40px">
                                                    <ClientSideEvents Click="function(s, e) {Attach_Show_DeletePrtnrDoc_Click();}" />
                                                    <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/attach.png"
                                                        Repeat="NoRepeat" />
                                                    <Border BorderColor="Transparent" BorderStyle="None" />
                                                </dxe:ASPxButton>
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <dxcp:ASPxCallbackPanel ID="CbpImage" runat="server" ClientInstanceName="cCbpImage"
                                            BackColor="Transparent" OnCallback="CbpImage_Callback" Width="150px">
                                            <ClientSideEvents EndCallback="function (s, e) {CbpImage_EndCallBack();}" />
                                            <PanelCollection>
                                                <dxp:PanelContent runat="server">
                                                </dxp:PanelContent>
                                            </PanelCollection>
                                        </dxcp:ASPxCallbackPanel>
                                    </div>
                                    <div class="Row">
                                        <div id="divOthrDtlSave" class="left BtmMargin" style="font-size: 12pt; float: right;
                                            width: 20%;">
                                            <dxe:ASPxButton ID="BtnSaveOthrDtl" runat="server" AutoPostBack="false" TabIndex="0"
                                                ToolTip="Save Other Details" Width="66px" ClientInstanceName="cBtnSaveOthrDtl"
                                                AccessKey="o" BackColor="Transparent" Height="60px">
                                                <ClientSideEvents Click="function(s, e) {SaveOthrDtl();}" />
                                                <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_save.png"
                                                    Repeat="NoRepeat" />
                                                <Border BorderColor="Transparent" BorderStyle="None" />
                                            </dxe:ASPxButton>
                                        </div>
                                        <div id="divOthrDtlEdit" class="left BtmMargin" style="font-size: 12pt; float: right;
                                            width: 20%;">
                                            <dxe:ASPxButton ID="BtnEditOthrDtl" runat="server" AutoPostBack="false" TabIndex="0"
                                                ToolTip="Edit Other Details" Width="66px" ClientInstanceName="cBtnEditOthrDtl"
                                                BackColor="Transparent" Height="60px">
                                                <ClientSideEvents Click="function(s, e) {EditOthrDtl();}" />
                                                <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/Edit.jpg"
                                                    Repeat="NoRepeat" />
                                                <Border BorderColor="Transparent" BorderStyle="None" />
                                            </dxe:ASPxButton>
                                        </div>
                                        <div class="left" style="font-size: 12pt; float: right; margin-left: 10px">
                                            <dxe:ASPxButton ID="BtnOthrDtlPrvs" runat="server" AutoPostBack="false" TabIndex="0"
                                                Text="" ToolTip="Back To Address Details" Width="66px" ClientInstanceName="cBtnOthrDtlPrvs"
                                                BackColor="Transparent" Height="60px">
                                                <ClientSideEvents Click="function(s, e) {OthrDtlPrevious();}" />
                                                <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_rewind.png"
                                                    Repeat="NoRepeat" />
                                                <Border BorderColor="Transparent" BorderStyle="None" />
                                            </dxe:ASPxButton>
                                        </div>
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <div id="DivOthrDtlsAlrt" class="Success BtmMargin" style="margin-top: 10px; width: 800px;
                                            font-size: 9pt;">
                                            Other Details Section Submitted Successfully !!<span style="color: #ff6633"> <span
                                                style="color: #0000ff"><strong>Please Click On The [S]ubmit Button To Save The Record
                                                    Finally....</strong></span></span></div>
                                        <br />
                                        <br />
                                    </div>
                                    <div runat="server" style="display: none" id="Div4">
                                        <dxe:ASPxButton ID="BtnHidn" TabIndex="0" runat="server" Width="130px" ClientInstanceName="cBtnHidn"
                                            AutoPostBack="false">
                                            <ClientSideEvents Click="function(s, e) {OthrDetlSave();}"></ClientSideEvents>
                                        </dxe:ASPxButton>
                                        <dxe:ASPxTextBox ID="TxtClientID" runat="server" ClientInstanceName="cTxtClientID"
                                            Width="136px">
                                        </dxe:ASPxTextBox>
                                    </div>
                                </dxp:PanelContent>
                            </PanelCollection>
                            <ClientSideEvents EndCallback="function (s, e) {CbpOthrDtls_EndCallBack();}" />
                        </dxcp:ASPxCallbackPanel>
                    </div>
                </div>
            </div>
        </div>
        <div id="Row27" style="float: left; width: 100%; text-align: center; margin-bottom: 10px;">
            <div class="left" style="width: 49%; text-align: right;" id="DivFinalSubmit">
                <dxe:ASPxButton AccessKey="S" ID="btnSave" TabIndex="0" runat="server" Width="130px"
                    ToolTip="Click To Submit The Whole Entered  Data." Text="[S]ubmit" AutoPostBack="false">
                    <Border BorderColor="White"></Border>
                    <ClientSideEvents Click="function(s, e) {SaveButtonClick();}"></ClientSideEvents>
                </dxe:ASPxButton>
            </div>
            <div id="DivBtnReset" class="left" style="width: 49%; text-align: left; margin-left: 5px">
                <dxe:ASPxButton AccessKey="R" ID="btnReset" TabIndex="0" runat="server" Width="130px"
                    ToolTip="Reset Entered Data." Text="[R]eset" AutoPostBack="false">
                    <Border BorderColor="White"></Border>
                    <ClientSideEvents Click="function(s, e) {ResetButtonClick();}"></ClientSideEvents>
                </dxe:ASPxButton>
            </div>
        </div>
        <br />
        <asp:HiddenField ID="hdn_GridBindOrNotBind" runat="server" />
        <asp:HiddenField ID="Hdn_PageSize" runat="server" />
        <asp:HiddenField ID="Hdn_PageNumber" runat="server" />
        <asp:HiddenField ID="Hdn_CompanyID" runat="server" />
        <dxpc:ASPxPopupControl ID="PopUp_StartPage" runat="server" ClientInstanceName="cPopUp_StartPage"
            CloseAction="None" HeaderText="Capture KYC Data" Modal="True" PopupHorizontalAlign="LeftSides"
            PopupVerticalAlign="TopSides" ShowOnPageLoad="True" ShowSizeGrip="False" Width="840px">
            <ClientSideEvents PopUp="function(s, e)
                                                    {
                                                     setTimeout('cComboClType.Focus()', 50);
                                                    
                                                    }" />
            <ContentCollection>
                <dxpc:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
                    <dxp:ASPxPanel ID="Panel_Start" runat="server" DefaultButton="btnOk" Width="99%">
                        <PanelCollection>
                            <dxp:PanelContent ID="Panelcontent1" runat="server">
                                <div style="text-align: center; width: 99%">
                                    <br />
                                    <div class="LFloat_Row DivName" style="font-size: 12px; margin-bottom: 10px">
                                        <dxe:ASPxRadioButton ID="rdNew" runat="server" Checked="true" ClientInstanceName="crdNew"
                                            GroupName="o" Layout="Flow">
                                            <ClientSideEvents CheckedChanged="function(s,e){FnShowNew()}"></ClientSideEvents>
                                        </dxe:ASPxRadioButton>
                                        New Record
                                        <dxe:ASPxRadioButton ID="rdEdit" runat="server" Checked="false" ClientInstanceName="crdEdit"
                                            GroupName="o" Layout="Flow">
                                            <ClientSideEvents CheckedChanged="function(s,e){FnShowNew()}"></ClientSideEvents>
                                        </dxe:ASPxRadioButton>
                                        Edit Saved Record
                                        <dxe:ASPxRadioButton ID="rdUnSaved" runat="server" Checked="false" ClientInstanceName="crdUnSaved"
                                            GroupName="o" Layout="Flow">
                                            <ClientSideEvents CheckedChanged="function(s,e){FnShowNew()}" />
                                        </dxe:ASPxRadioButton>
                                        Edit UnSaved Record
                                        <dxe:ASPxRadioButton ID="rdImport" runat="server" Checked="false" ClientInstanceName="crdImport"
                                            GroupName="o" Layout="Flow">
                                            <ClientSideEvents CheckedChanged="function(s,e){FnShowNew()}"></ClientSideEvents>
                                        </dxe:ASPxRadioButton>
                                        Import Record
                                    </div>
                                    <div id="DivNewEntry" class="left BtmMargin" style="width: 99%">
                                        <div id="PopUpRow0" class="LFloat_Row DivName" style="font-size: 12px; margin-bottom: 10px">
                                            <dxe:ASPxRadioButton ID="rdNwCl" runat="server" Checked="True" ClientInstanceName="crdNwCl"
                                                GroupName="q" Layout="Flow">
                                                <ClientSideEvents CheckedChanged="function(s,e){FnShowFilter()}"></ClientSideEvents>
                                            </dxe:ASPxRadioButton>
                                            Create New Client
                                            <dxe:ASPxRadioButton ID="rdExCl" runat="server" Checked="false" ClientInstanceName="crdExCl"
                                                GroupName="q" Layout="Flow">
                                                <ClientSideEvents CheckedChanged="function(s,e){FnShowFilter()}"></ClientSideEvents>
                                            </dxe:ASPxRadioButton>
                                            Existing Client
                                        </div>
                                        <div id="PopUpRow1" class="LFloat_Row DivName" style="margin-left: 10px;">
                                            <dxe:ASPxComboBox ID="ddlGroup" runat="server" ClientInstanceName="cddlGroup" EnableIncrementalFiltering="True"
                                                Font-Size="12px" SelectedIndex="0" TabIndex="0" ValueType="System.String" Width="140px"
                                                Height="25px">
                                                <ClientSideEvents SelectedIndexChanged="function(s,e){fnddlGroup()}"></ClientSideEvents>
                                                <Items>
                                                    <dxe:ListEditItem Text="Branch" Value="0"></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Group" Value="1"></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Client" Value="2"></dxe:ListEditItem>
                                                </Items>
                                            </dxe:ASPxComboBox>
                                            <%-- 
                                          <dxe:ASPxComboBox ID="ddlGroup" runat="server" ClientInstanceName="cddlGroup"
                                                  EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0"  ValueType="System.String"
                                                  Width="140px" OnCallback="ddlGroup_Callback">
                                                  
                                              <clientsideevents selectedindexchanged="function(s,e){fnddlGroup()}" ></clientsideevents>     
                                          </dxe:ASPxComboBox>--%>
                                        </div>
                                        <div id="PopUpRow2" class="LFloat_Row DivName" style="margin-left: 10px;">
                                            <%--OnCallback="CbpBindGroup_Callback"--%>
                                            <%--<dxcp:ASPxCallbackPanel ID="CbpBindGroup" runat="server" ClientInstanceName="cCbpBindGroup"  BackColor="Transparent" >
                                     <PanelCollection>
                                       <dxp:panelcontent runat="server">--%>
                                            <dxe:ASPxComboBox ID="ddlgrouptype" runat="server" ClientInstanceName="cddlgrouptype"
                                                EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                Width="140px" OnCallback="ddlgrouptype_Callback" TabIndex="0">
                                                <ClientSideEvents SelectedIndexChanged="function(s,e){fn_Group()}" EndCallback="function(s,e){ddlgrouptype_EndCallback()}">
                                                </ClientSideEvents>
                                            </dxe:ASPxComboBox>
                                            <%-- </dxp:panelcontent>
                                       </PanelCollection>
                                     <ClientSideEvents  EndCallback="function (s, e) {CbpBindGroup_EndCallBack();}" />
                                   </dxcp:ASPxCallbackPanel> --%>
                                        </div>
                                        <div id="showFilter" class="LFloat_Row left" style="width: 452px; margin-left: 10px;
                                            margin-bottom: 10px">
                                            <div style="width: 100%">
                                                <div class="frmleftContent">
                                                    <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Height="20px" Width="350px"
                                                        TabIndex="0"></asp:TextBox>
                                                </div>
                                                <div class="frmleftContent">
                                                    <a id="A11" href="javascript:void(0);" tabindex="0" onclick="btnAddsubscriptionlist_click()">
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
                                                <a id="A12" href="javascript:void(0);" tabindex="0" onclick="lnkBtnAddFinalSelection()">
                                                    <span style="color: #000099; text-decoration: underline; font-size: 10pt;">Done</span></a>&nbsp;&nbsp;
                                                <a id="A13" href="javascript:void(0);" tabindex="0" onclick="lnkBtnRemoveFromSelection()">
                                                    <span style="color: #cc3300; text-decoration: underline; font-size: 10pt;">Remove</span></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="PopUpRow4" class="LFloat_Row DivName" style="font-size: 12px">
                                        <dxe:ASPxComboBox ID="ComboClType" runat="server" ClientInstanceName="cComboClType"
                                            EnableIncrementalFiltering="True" Font-Size="12px" SelectedIndex="0" TabIndex="0"
                                            ValueType="System.String" Width="187px" Height="25px">
                                            <Items>
                                                <dxe:ListEditItem Text="Select" Value="0"></dxe:ListEditItem>
                                                <dxe:ListEditItem Text="Individual" Value="I"></dxe:ListEditItem>
                                                <dxe:ListEditItem Text="NonIndividual" Value="N"></dxe:ListEditItem>
                                            </Items>
                                            <DropDownButton Text="ClientType">
                                            </DropDownButton>
                                        </dxe:ASPxComboBox>
                                    </div>
                                    <div id="PopUpRow5" class="LFloat_Row DivName" style="font-size: 12px">
                                        <dxe:ASPxComboBox ID="ComboCompany" runat="server" ClientInstanceName="cComboCompany"
                                            TabIndex="0" EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0"
                                            ValueType="System.String" Width="260px">
                                            <ClientSideEvents SelectedIndexChanged="function(s,e){ChangeCompany()}"></ClientSideEvents>
                                            <DropDownButton Text="Company">
                                            </DropDownButton>
                                        </dxe:ASPxComboBox>
                                    </div>
                                    <div id="PopUpRow3" class="LFloat_Row DivName" style="font-size: 12px">
                                        <dxe:ASPxComboBox ID="ComboAgency" runat="server" ClientInstanceName="cComboAgency"
                                            TabIndex="0" EnableIncrementalFiltering="True" Font-Size="12px" SelectedIndex="0"
                                            ValueType="System.String" Width="187px" Height="25px">
                                            <Items>
                                                <dxe:ListEditItem Text="NDML" Value="3"></dxe:ListEditItem>
                                                <dxe:ListEditItem Text="CVL" Value="4"></dxe:ListEditItem>
                                                <dxe:ListEditItem Text="DotEx" Value="5"></dxe:ListEditItem>
                                            </Items>
                                            <DropDownButton Text="Reg. Agency">
                                            </DropDownButton>
                                        </dxe:ASPxComboBox>
                                    </div>
                                    <div class="left" style="text-align: center; width: 100%; margin-top: 10px">
                                        <dxe:ASPxButton ID="btnOk" runat="server" AutoPostBack="False" Text="Ok" Width="85px"
                                            TabIndex="0" ClientInstanceName="cbtnOk">
                                            <ClientSideEvents Click="function (s, e) {PopUp_StartPage_btnOK_Click(); }" />
                                        </dxe:ASPxButton>
                                    </div>
                                </div>
                                <div style="display: none">
                                    <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="150px"></asp:TextBox>
                                    <asp:HiddenField ID="HiddenField_Group" runat="server" />
                                    <asp:HiddenField ID="HiddenField_Branch" runat="server" />
                                    <asp:HiddenField ID="HiddenField_Client" runat="server" />
                                    <asp:HiddenField ID="HiddenField_I_NI_BindIndicator" runat="server" />
                                </div>
                            </dxp:PanelContent>
                        </PanelCollection>
                    </dxp:ASPxPanel>
                </dxpc:PopupControlContentControl>
            </ContentCollection>
            <HeaderStyle BackColor="LightGray" ForeColor="Black" Font-Names="Calibri" Font-Bold="True"
                Font-Size="Medium" />
        </dxpc:ASPxPopupControl>
        <dxpc:ASPxPopupControl ID="PopUpDocAttach" runat="server" ContentUrl="../management/frmAddDocuments.aspx"
            CloseAction="CloseButton" Top="2000" Left="400" ClientInstanceName="popup" Height="350px"
            Width="900px" HeaderText="Add Document" AllowResize="true" ResizingMode="Postponed">
            <ContentCollection>
                <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                </dxpc:PopupControlContentControl>
            </ContentCollection>
            <HeaderStyle BackColor="#B8B8B8" Font-Bold="True" ForeColor="Black" />
        </dxpc:ASPxPopupControl>
        <dxpc:ASPxPopupControl ID="ConfirmPopUp1" runat="server" ClientInstanceName="cConfirmPopUp1"
            CloseAction="None" HeaderText="Confirmation Message(1)" Left="200" Modal="True"
            PopupHorizontalAlign="Center" PopupHorizontalOffset="500" PopupVerticalAlign="BottomSides"
            PopupVerticalOffset="2000" RenderIFrameForPopupElements="True" ShowSizeGrip="False"
            Top="100" Width="387px">
            <ContentCollection>
                <dxpc:PopupControlContentControl runat="server">
                    <table class="style1">
                        <tr>
                            <td colspan="3">
                                &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<span style="font-family: Calibri">If You Reset All
                                    Your Entered Data Will Be Lost<br />
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Do
                                    You Still Want To Reset???</span>
                            </td>
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
            CloseAction="None" HeaderText="Confirmation Message(2)" Left="700" Modal="True"
            PopupHorizontalAlign="Center" PopupHorizontalOffset="500" PopupVerticalAlign="BottomSides"
            PopupVerticalOffset="2000" RenderIFrameForPopupElements="True" ShowSizeGrip="False"
            Top="100" Width="387px">
            <ContentCollection>
                <dxpc:PopupControlContentControl runat="server">
                    <table class="style1">
                        <tr>
                            <td colspan="3">
                                &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<span style="font-family: Calibri">If You Reset All
                                    Your Entered Data Will Be Lost<br />
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Are
                                    You Sure You Want To Reset It???</span>
                            </td>
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
