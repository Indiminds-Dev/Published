<%@ page language="C#" autoeventwireup="true" inherits="KRA_Pages_RegistrationForm, App_Web_kgozdccm" %>

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
            width: 780px;
            height: 28px;
            padding: 2px 5px 2px 2px;
            background-color: #555;
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
            border: solid 2px #555;
        }
        .cellTotHeader
        {
            padding: 2px;
            height: 22px;
            border: solid .1pt #F4A460;
            font-size: 12px;
            background-color: #DDD;
            font-weight: bold;
            text-align: center;
            line-height: 2;
        }
    </style>
    <%------------PageLoad and Validation---------------%>

    <script type="text/javascript" language="javascript">
        //Global Variable
        FieldName = '';
        var ClientType = '';
        var Cmn = '';
        var Identity = '';
        var Address = '';
        var OtherDtls = '';
        var currentDateToset = new Date('<%=Session["ServerDate"] %>');
        var GvAlrt = '';
        var EntryType = '';
        var ApplicatnNo = '';
        var Clicked = '';
        var show = '';
        var ntshow = '';
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

        ///////////////////////////////////End Of DevExpressValidation///////////////////////////////////
        function CallAjax(obj1, obj2, obj3, Query) {
            var CombinedQuery = new String(Query);
            var GenericAjaxListAspxPath = '../CentralData/Pages/GenericAjaxList.aspx';
            ajax_showOptions(obj1, obj2, obj3, replaceChars(CombinedQuery), 'Main', GenericAjaxListAspxPath);
        }
        function PageLoad() {
            HideShow('Div_Identity', 'H');
            // HideShow('Row27','H');
            HideShow('div_othr', 'H');
            HideShow('divOthrStatus', 'H');
            HideShow('DivOthrAdrsPrf', 'H');
            HideShow('DivOthrAdrsPrfP', 'H');
            HideShow('DivOthrOccu', 'H');
            HideShow('divOthrID', 'H');
            //HideShow('showFilter','H');
            HideShow('DivBtnEditCmn', 'H');
            HideShow('DivBtnEditIdntty', 'H');
            HideShow('DivBtnEditAdrs', 'H');
            // HideShow('DivSaved','H');
            HideShow('divOthrDtlEdit', 'H');
            HideShow('DivApliNoAlert', 'H');
            HideShow('DivIdnttyAlrt', 'H');
            HideShow('DivAdrsAlrt', 'H');
            HideShow('DivOthrDtlsAlrt', 'H');
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
            HideShow('divForVerifyOverView', 'H');
            var IsComparable = '<%=Session["P_FileMode"]%>';
            if (IsComparable.trim() == "Double")
                HideShow('Row27', 'H');
            else
                HideShow('Row27', 'S');
        }

        function btnCloseTotal_click() {
            HideShow('btnClose', 'H');
            HideShow('divForVerifyOverView', 'H');
            HideShow('btnOpen', 'S');
            GetObjectID('btnOpen').style.borderBottom = '2px solid #555';
        }

        function btnOpenTotal_click() {
            HideShow('btnOpen', 'H');
            HideShow('btnClose', 'S');
            HideShow('divForVerifyOverView', 'S');
            GetObjectID('btnClose').style.borderBottom = 'none';

            if (GetObjectID('Div_Common').style.display == 'inline') {
                SetStyle("Div_Common_Show", "BGColor", "#F4A460");
                SetStyle("Div_Identity_Show", "BGColor", "#DDD");
                SetStyle("Div_Address_Show", "BGColor", "#DDD");
                SetStyle("Div_Other_Show", "BGColor", "#DDD");
            }
            if (GetObjectID('Accordion1Content').style.display == 'inline') {
                SetStyle("Div_Identity_Show", "BGColor", "#F4A460");
                SetStyle("Div_Common_Show", "BGColor", "#DDD");
                SetStyle("Div_Address_Show", "BGColor", "#DDD");
                SetStyle("Div_Other_Show", "BGColor", "#DDD");
            }
            if (GetObjectID('Accordion2Content').style.display == 'inline') {
                SetStyle("Div_Address_Show", "BGColor", "#F4A460");
                SetStyle("Div_Common_Show", "BGColor", "#DDD");
                SetStyle("Div_Identity_Show", "BGColor", "#DDD");
                SetStyle("Div_Other_Show", "BGColor", "#DDD");
            }
            if (GetObjectID('Accordion3Content').style.display == 'inline') {
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
    </script>

    <%------------------Start Common Fields---------------------%>

    <script type="text/javascript" language="javascript">

        function CommonFldValidtn() {
            if (Control_Empty("<%=TxtBranch.ClientID %>", "Please Enter The Branch"))
                return true;
            else
                return false;
        }
        function onClientChange() {
        }
        function LinkUcc_Click() {
            //    cCbpUcc.PerformCallback('GetUcc'+'~'+cTxtCntUcc.GetText());
        }
        function CbpUcc_EndCallBack() {
            //       if(cCbpUcc.cpPrefxAlrt == "T")
            //       {
            //         alert('Please Enter a Prefix for UCC to Generate');
            //         cTxtCntUcc.Focus();
            //         cCbpUcc.cpPrefxAlrt = null;
            //       }
        }

        function SaveCommon() {
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

                    //cCbpComon.PerformCallback('UpdtCommon~'+cTxtAppliNo.GetText()+ '~'+ cTxtCntUcc.GetText());
                    cCbpComon.PerformCallback('UpdtCommon~' + cTxtAppliNo.GetText());

                }
            }

        }
        function EditCommon() {
            HideShow('DivBtnSaveCmn', 'S');
            HideShow('DivBtnEditCmn', 'H');
            HideShow('DivApliNoAlert', 'H');
            cTxtAppliNo.SetEnabled(false);
            cAppliDt.SetEnabled(true);
            GetObjectID("<%=TxtBranch.ClientID %>").disabled = false;
            //    cTxtCntUcc.SetEnabled(true); 
            //    cLinkUcc.SetEnabled(true);
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
            var IsComparable = '<%=Session["P_FileMode"]%>'; //P_MatchStatus
            if (IsComparable.trim() == "Double") {
                //alert('CommonNext');
                cCbpCompare.PerformCallback('BindCompareControls~');
            }
            Height('350', '350');
        }
        function CbpComon_EndCallBack() {
            HideShow('DivBtnSaveCmn', 'H');
            HideShow('DivBtnEditCmn', 'S');
            HideShow('btnClose', 'H');
            HideShow('divForVerifyOverView', 'H');
            HideShow('btnOpen', 'S');
            cTxtAppliNo.SetEnabled(false);
            cAppliDt.SetEnabled(false);
            //    cTxtCntUcc.SetEnabled(false); 
            //    cLinkUcc.SetEnabled(false);
            GetObjectID("<%=TxtBranch.ClientID %>").disabled = true;
            cTxtFormNo.SetEnabled(false);

            if (cCbpComon.cpSaveCmn == "T") {
                if (cTxtAppliNo.GetText() == "") {
                    cTxtAppliNo.SetText(cTxtFormNo.GetText());
                    HideShow('DivApliNoAlert', 'S');
                    GetObjectID('DivApliNoAlert').className = "Info BtmMargin";
                    SetinnerHTML("DivApliNoAlert", "   As Application Number Was Not Given A Application Number = '" + cTxtFormNo.GetText() + "'  has been AutoGenerated..Note It Down For Future Refference");
                    cTxtApplicntName.Focus();
                }
                else {
                    HideShow('DivApliNoAlert', 'S');
                    GetObjectID('DivApliNoAlert').className = "Success BtmMargin";
                    SetinnerHTML("DivApliNoAlert", "Main Section Submitted Successfully !!");
                }
                cCbpComon.cpSaveCmn = null;
            }
            if (cCbpComon.cpBindForCmnEdit == 'T') {
                HideShow('DivEntryForm', 'S');
                HideShow('DivApliNoAlert', 'S');
                HideShow('Accordion1Content', 'H');
                HideShow('Accordion2Content', 'H');
                HideShow('Accordion3Content', 'H');
                HideShow('Div_Common', 'S');
                GetObjectID('DivApliNoAlert').className = "Success BtmMargin";
                SetinnerHTML("DivApliNoAlert", "Main Section Submitted Successfully !!");
                cCbpIdntty.PerformCallback('BindForEditIdntty~');
                Identity = "S";
                EntryType = "Edit";
                cCbpComon.cpBindForEditCmn = null;
            }
            Height('350', '350');
        }
    </script>

    <%----------------- Identity Details-------------------------------------%>

    <script type="text/javascript" language="javascript">
        function verifyPanCrdNo(Obj) {
            var status = false;
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
                //if (DevE_Control_Empty(cTxtFthrName, "Please Enter Fathers/Husbands Name")) {
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
                                    return true;
                            }
                        }
                    }
                }
            //}
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
            if (ClientType.trim() == "I") {
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
            else // if(ClientType=="N")
            {
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
            var IsComparable = '<%=Session["P_FileMode"]%>'; //P_MatchStatus
            if (IsComparable.trim() == "Double") {
                //alert('IdentityPrevious');
                cCbpCompare.PerformCallback('BindCompareControls~');
            }
            Height('350', '350');
        }
        function IdentityNext() {
            HideShow('Accordion1Content', 'H');
            HideShow('Accordion2Content', 'S');
            HideShow('Accordion3Content', 'H');
            HideShow('Div_Common', 'H');
            var IsComparable = '<%=Session["P_FileMode"]%>'; //P_MatchStatus
            if (IsComparable.trim() == "Double") {
                //alert('IdentityNext');
                cCbpCompare.PerformCallback('BindCompareControls~');
            }
            cTxtAddress1.Focus();
            Height('350', '350');
        }
        function EditIdentity() {
            Identity = '';
            HideShow('DivBtnSaveIdntty', 'S');
            HideShow('DivBtnEditIdntty', 'H');
            HideShow('DivIdnttyAlrt', 'H');
            cTxtApplicntName.SetEnabled(true);
            cTxtApplicntMidlName.SetEnabled(true);
            cTxtApplicntLstName.SetEnabled(true);
            cIncorpDt.SetEnabled(true);
            cComboIncorpPlc.SetEnabled(true);
            cComncmntDt.SetEnabled(true);
            cTxtFthrName.SetEnabled(true);
            GetObjectID('<%=rdMale.ClientID%>').disabled = false;
            GetObjectID('<%=rdFemale.ClientID%>').disabled = false;
            GetObjectID('<%=rdSingl.ClientID%>').disabled = false;
            GetObjectID('<%=rdMrd.ClientID%>').disabled = false;
            cdobDt.SetEnabled(true);
            crdIndian.SetEnabled(true);
            crdOthr.SetEnabled(true);
            GetObjectID('<%=TxtOthr.ClientID%>').disabled = false;
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
            cComboPanExempt.SetEnabled(true);
            //new edit---
            cTxtApplicntPrefix.SetEnabled(true);
            CcmbCountryOfIncorporation.SetEnabled(true);
            CcmdIdentificationType.SetEnabled(true);
            CcmbCountryresidenceTaxLaws.SetEnabled(true);
            GetObjectID("<%= btnFather.ClientID %>").disabled = false;
            GetObjectID("<%= btnSpouse.ClientID %>").disabled = false;
            ctxtFatherPrefix.SetEnabled(true);
            ctxtFatherFirstName.SetEnabled(true);
            ctxtFatherMiddleName.SetEnabled(true);
            ctxtFatherLastName.SetEnabled(true);
            ctxtMotherFirstName.SetEnabled(true);
            ctxtMotherMiddleName.SetEnabled(true);
            ctxtMotherLastName.SetEnabled(true);
            ctxtMotherNamePrefix.SetEnabled(true);
            CtxtPlaceogBirth.SetEnabled(true);
            CcmbCountryofBirth.SetEnabled(true);
            CcmbAccHolderTypeFlag.SetEnabled(true);
            CcmbAccHolderType.SetEnabled(true);
            CAccType.SetEnabled(true);
            CtxtTIN.SetEnabled(true);
            cTxtUIN.SetEnabled(true);
            CcmbResidentialStatus.SetEnabled(true);
            CJurisdictionofresidence.SetEnabled(true);
            CtxtResidentTIN.SetEnabled(true);
            ctxtIdentityNo.SetEnabled(true);
            
            cTxtApplicntName.inputElement.style.color = '#000000';
            if (cTxtApplicntMidlName.GetText() != "")
                cTxtApplicntMidlName.inputElement.style.color = '#000000';
            if (cTxtApplicntLstName.GetText() != "")
                cTxtApplicntLstName.inputElement.style.color = '#000000';
            if (ClientType.trim() == "I") {
                cComboStatus.PerformCallback('IndividualBind~' + cComboStatus.GetText());
            }
            if (ClientType.trim() == "N") {
                cComboStatus.PerformCallback('NonIndividualBind~' + cComboStatus.GetText());
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
        function CbpIdntty_EndCallBack() {
            if (cCbpIdntty.cpSaveIdntty == "T") {
                HideShow('DivBtnEditIdntty', 'S');
                HideShow('DivBtnSaveIdntty', 'H');
                HideShow('DivIdnttyAlrt', 'S');
                cTxtApplicntName.SetEnabled(false);
                cTxtApplicntMidlName.SetEnabled(false);
                cTxtApplicntLstName.SetEnabled(false);
                cIncorpDt.SetEnabled(false);
                cComboIncorpPlc.SetEnabled(false);
                cComncmntDt.SetEnabled(false);
                //cTxtFthrName.SetEnabled(false);
                GetObjectID('<%=rdMale.ClientID%>').disabled = true;
                GetObjectID('<%=rdFemale.ClientID%>').disabled = true;
                GetObjectID('<%=rdSingl.ClientID%>').disabled = true;
                GetObjectID('<%=rdMrd.ClientID%>').disabled = true;
                cdobDt.SetEnabled(false);
                crdIndian.SetEnabled(false);
                crdOthr.SetEnabled(false);
                GetObjectID('<%=TxtOthr.ClientID%>').disabled = true;
                cTxtPan.SetEnabled(false);
                crdPanxmptY.SetEnabled(false);
                crdPanxmptN.SetEnabled(false);
                cTxtRegNo.SetEnabled(false);
                cTxtUIN.SetEnabled(false);
                cTxtOthrProof.SetEnabled(false);
                cComboStatus.SetEnabled(false);
                cComboNRIStatusPrf.SetEnabled(false);
                cTxtOthrStatus.SetEnabled(false);
                cComboIdentityProof.SetEnabled(false);
                cComboPanExempt.SetEnabled(false);
                
                //------------------new--------------------
                cTxtApplicntPrefix.SetEnabled(false);
                CcmbCountryOfIncorporation.SetEnabled(false);
                CcmdIdentificationType.SetEnabled(false);
                CcmbCountryresidenceTaxLaws.SetEnabled(false);
                GetObjectID("<%= btnFather.ClientID %>").disabled = true;
                GetObjectID("<%= btnSpouse.ClientID %>").disabled = true;
                ctxtFatherPrefix.SetEnabled(false);
                ctxtFatherFirstName.SetEnabled(false);
                ctxtFatherMiddleName.SetEnabled(false);
                ctxtFatherLastName.SetEnabled(false);
                ctxtMotherFirstName.SetEnabled(false);
                ctxtMotherMiddleName.SetEnabled(false);
                ctxtMotherLastName.SetEnabled(false);
                ctxtMotherNamePrefix.SetEnabled(false);
                CtxtPlaceogBirth.SetEnabled(false);
                CcmbCountryofBirth.SetEnabled(false);
                CcmbAccHolderTypeFlag.SetEnabled(false);
                CcmbAccHolderType.SetEnabled(false);
                CAccType.SetEnabled(false);
                CtxtTIN.SetEnabled(false);
                cTxtUIN.SetEnabled(false);
                CcmbResidentialStatus.SetEnabled(false);
                CJurisdictionofresidence.SetEnabled(false);
                CtxtResidentTIN.SetEnabled(false);
                ctxtIdentityNo.SetEnabled(false);
                //address---
                //other---
                ctxtRPPrefix.SetEnabled(false);
                cTxtCHName.SetEnabled(false);
                ctxtRPMiddleName.SetEnabled(false);
                ctxtRPLastName.SetEnabled(false);
                GetObjectID("<%= rbtnRPFather.ClientID %>").disabled = true;
                GetObjectID("<%= rbtnRPSpouse.ClientID %>").disabled = true;
                ctxtRPFatherPrefix.SetEnabled(false);
                ctxtRPFatherFirstName.SetEnabled(false);
                ctxtRPFatherMiddleName.SetEnabled(false);
                ctxtRPFatherLastName.SetEnabled(false);
                ctxtRPMotherPrefix.SetEnabled(false);
                ctxtRPMotherFirstName.SetEnabled(false);
                ctxtRPMotherMiddleName.SetEnabled(false);
                txtRPMotherLastName.SetEnabled(false); 
                
                
                if (EntryType == "Edit") {
                    cCbpAdrs.PerformCallback('BindForEditAdrs~');
                    Address = "S";
                }
                cCbpIdntty.cpSaveIdntty = null;
            }
            if (cCbpIdntty.cpIdnttySavedOrNot == "T") {
                HideShow('DivIdnttyAlrt', 'H');
                EditIdentity();
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

                cCbpIdntty.cpFetchExistingIdntty = null;
            }
            OnCheckedShowHide(crdPanxmptY.GetChecked(), 'DivPanExempt');
            OnCheckedShowHide(crdPanxmptN.GetChecked(), 'Row10_Col1');
            if (ClientType.trim() == "I") {
                HideShow('Row1', 'H');
                HideShow('Row2', 'H');
                HideShow('Row3', 'H');
                HideShow('Row11', 'H');
            }
            else {
                HideShow('Row4', 'H');
                HideShow('Row5', 'H');
                HideShow('Row6', 'H');
                HideShow('Row7', 'H');
                HideShow('Row12', 'H');
                //HideShow('Row13','S');
                //HideShow('Row10_Col2','H');
                //HideShow('Row10_Col3','H');        
            }
            if (cComboStatus.GetText() == "Non Resident") {
                HideShow('Row09', 'S');
            }
            else {
                HideShow('Row09', 'H');
            }
            if (cComboIdentityProof.GetText() != "Others") {
                HideShow('divOthrID', 'H');
            }
            if (crdOthr.GetChecked() == false)
                HideShow('div_othr', 'H');
            if (cComboStatus.GetText() != "Others")
                HideShow('divOthrStatus', 'H');

            Height('350', '350');
        }
        function ComboStatus_EndCallback() {
            if (cComboStatus.cpSetText != null)
                cComboStatus.SetText(cComboStatus.cpSetText);
            if (cComboStatus.GetText() == "") {
                cComboStatus.SetText('Select');
            }
        }
        function IdChange() {
            if (cComboIdentityProof.GetText() == "Others") {
                HideShow('divOthrID', 'S');
            }
            else {
                HideShow('divOthrID', 'H');
            }
        }
    </script>

    <%-------------------------------Start Address Details------------------------------------------------%>

    <script type="text/javascript" language="javascript">
        function AddressValidatnIndividual() {
            if (DevE_Control_Empty(cTxtAddress1, "Please Enter The Permanent Address"))
                if (DevE_MaskedControl_Empty(cTxtPin, "Please Enter The Permanent Address Pin No."))
                if (cTxtTelOfc.GetText() == "0" && cTxtTelRes.GetText() == "0" && cTxtFaxNo.GetText() == "0" && cTxtMobileNo.GetText() == "0") {
                alert('Please Enter Your Contact Details');
                cTxtTelOfc.Focus();
                return false;
            }
            else {

                if (cCbSame.GetChecked() == false) {
                    if (DevE_Control_Empty(cTxtAddress1P, "Please Enter The Correspondence Address"))
                        if (DevE_MaskedControl_Empty(cTxtPinP, "Please Enter The Correspondence Address Pin No."))
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

        }

        function AddressValidatnNonIndividual() {
            if (DevE_Control_Empty(cTxtAddress1, "Please Enter The Permanent Address"))
                if (DevE_MaskedControl_Empty(cTxtPin, "Please Enter The Permanent Address Pin No."))
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
                //-----new-----------------
                CcmbAddressType.SetEnabled(false);
                CtxtLocDist.SetEnabled(false);
                CcmbPaddressType.SetEnabled(false);
                
                cTxtAddress1P.SetEnabled(false);
                cTxtAddress2P.SetEnabled(false);
                cTxtAddress3P.SetEnabled(false);
                cComboCityP.SetEnabled(false);
                cTxtPinP.SetEnabled(false);
                cComboStateP.SetEnabled(false);
                cComboCountryP.SetEnabled(false);
                cValidDtP.SetEnabled(false);
                cComboRegAdrs.SetText(cComboCrpndsAdrs.GetText());

                if (cComboCrpndsAdrs.GetText() == "Others") {
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
            cComboRegAdrs.SetEnabled(true);
            cComboCityP.SetEnabled(true);
            cTxtPinP.SetEnabled(true);
            cComboStateP.SetEnabled(true);
            cComboCountryP.SetEnabled(true);
            cValidDtP.SetEnabled(true);
            cTxtOthrAdrsPrfP.SetEnabled(true);
            cComboRegAdrs.SetSelectedIndex(0);
            cValidDtP.SetDate(currentDateToset);
            
            cTxtOthrAdrsPrfP.SetText("");
            HideShow('DivOthrAdrsPrfP', 'H');
        }

        function SaveAddress() {
            if (ClientType.trim() == "I") {
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
            else //if(ClientType=="N")
            {
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
            var IsComparable = '<%=Session["P_FileMode"]%>'; //P_MatchStatus
            if (IsComparable.trim() == "Double") {
                //alert('AddressPrv');
                cCbpCompare.PerformCallback('BindCompareControls~');
            }
            Height('350', '350');
        }
        function AddressNext() {
            HideShow('Accordion1Content', 'H');
            HideShow('Accordion2Content', 'H');
            HideShow('Accordion3Content', 'S');
            HideShow('Div_Common', 'H');
            if (EntryType == "Edit") {
                var ClientCat = '<%=Session["P_ClntType"]%>';
                if (ClientCat.trim() == "N") {
                    cGvCHRecord.PerformCallback('BindForEditPartnerRecord~');
                }
            }
            //    var IsComparable='<%=Session["P_FileMode"]%>';//P_MatchStatus
            //    if(IsComparable.trim()=="Double")
            //    {
            //    alert('AddressNext');
            //         cCbpCompare.PerformCallback('BindCompareControls~');
            //    }    
            Height('350', '350');
        }
        function EditAddress() {
            Address = '';
            HideShow('DivBtnSaveAdrs', 'S');
            HideShow('DivBtnEditAdrs', 'H');
            HideShow('DivAdrsAlrt', 'H');
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
            cComboCrpndsAdrs.SetEnabled(true);
            cTxtOthrAdrsPrf.SetEnabled(true);
            cValidDt.SetEnabled(true);
            cCbSame.SetEnabled(true);
            cTxtTelOfc.SetEnabled(true);
            cTxtTelRes.SetEnabled(true);
            cTxtFaxNo.SetEnabled(true);
            cTxtMobileNo.SetEnabled(true);
            cTxtEmlID.SetEnabled(true);
            CcmbAddressType.SetEnabled(true);
            CcmbPaddressType.SetEnabled(false);
            CcmbJDAddressType_Type.SetEnabled(true);
            if (cCbSame.GetChecked() == true) {
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
                CtxtLocDist.SetEnabled(false);
                
            }
            else {
                cTxtAddress1P.SetEnabled(true);
                cTxtAddress2P.SetEnabled(true);
                cTxtAddress3P.SetEnabled(true);
                cComboCityP.SetEnabled(true);
                cTxtPinP.SetEnabled(true);
                cComboStateP.SetEnabled(true);
                cComboCountryP.SetEnabled(true);
                cComboRegAdrs.SetEnabled(true);
                cTxtOthrAdrsPrfP.SetEnabled(true);
                cValidDtP.SetEnabled(true);
                CtxtLocDist.SetEnabled(false);
            }
            if (CcmbJDAddressType.GetValue() == "3") {
                document.getElementById("dvJDAddress").style.display = "block";
                
                CcmbJDAddressType.SetEnabled(true);
                CtxtJDAddress1.SetEnabled(true);
                CtxtJDAddress2.SetEnabled(true);
                CtxtJDAddress3.SetEnabled(true);
                CcmbJDCountry.SetEnabled(true);
                CtxtJDDistrict.SetEnabled(true);
                CcmbJDState.SetEnabled(true);
                CcmbJDCity.SetEnabled(true);
                CtxtJDPin.SetEnabled(true);
            }
            else {
                document.getElementById("dvJDAddress").style.display = "none";

            } 
        }
        function CbpAdrs_EndCallBack() {
            if (cCbpAdrs.cpSaveAdrs == "T") {
                HideShow('DivBtnSaveAdrs', 'H');
                HideShow('DivBtnEditAdrs', 'S');
                HideShow('DivAdrsAlrt', 'S');
                cTxtAddress1.SetEnabled(false);
                cTxtAddress2.SetEnabled(false);
                cTxtAddress3.SetEnabled(false);
                cComboCity.SetEnabled(false);
                cTxtPin.SetEnabled(false);
                cComboState.SetEnabled(false);
                cComboCountry.SetEnabled(false);
                cComboCrpndsAdrs.SetEnabled(false);
                cTxtOthrAdrsPrf.SetEnabled(false);
                cValidDt.SetEnabled(false);
                cCbSame.SetEnabled(false);
                

                //D--------new------
                if (CcmbJDAddressType.GetValue() == "3") {
                    document.getElementById("dvJDAddress").style.display = "block";
                    
                    CcmbJDAddressType.SetEnabled(false);
                    CtxtJDAddress1.SetEnabled(false);
                    CtxtJDAddress2.SetEnabled(false);
                    CtxtJDAddress3.SetEnabled(false);
                    CcmbJDCountry.SetEnabled(false);
                    CtxtJDDistrict.SetEnabled(false);
                    CcmbJDState.SetEnabled(false);
                    CcmbJDCity.SetEnabled(false);
                    CtxtJDPin.SetEnabled(false);
                }
                else {
                    document.getElementById("dvJDAddress").style.display = "none";

                } 
                CcmbAddressType.SetEnabled(false);
                CtxtLocDist.SetEnabled(false);
                CcmbPaddressType.SetEnabled(false);
                CcmbJDAddressType_Type.SetEnabled(false);
                
                
                
                if (cCbSame.GetChecked() == true) {
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

                    if (ClientType.trim() == "N") {
                        cGvCHRecord.PerformCallback('BindForEditPartnerRecord~');
                    }
                }
                cCbpAdrs.cpSaveAdrs = null;
            }
            if (cCbpAdrs.cpAdrsSavedOrNot == "T") {
                HideShow('DivAdrsAlrt', 'H');
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
                cCbpAdrs.cpFetchExistingAdrs = null;
            }
            if (ClientType.trim() == "I") {
                HideShow('Row17_Col1', 'H');
            }
            else {
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
                    HideShow('DivStateCHOthr', 'P');
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
    </script>

    <%------------------------------Start Other Details---------------------------------------------------%>

    <script type="text/javascript" language="javascript">
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
        function OthrDtlPrevious() {
            HideShow('Accordion1Content', 'H');
            HideShow('Accordion2Content', 'S');
            HideShow('Accordion3Content', 'H');
            HideShow('Div_Common', 'H');
            var IsComparable = '<%=Session["P_FileMode"]%>'; //P_MatchStatus
            if (IsComparable.trim() == "Double") {
                //alert('OtherDetailPrev');
                cCbpCompare.PerformCallback('BindCompareControls~');
            }
            Height('350', '350');
        }
        function SaveOthrDtl() {
            if (ClientType.trim() == "I") {
                if (OthrDetailsValidatnIndividual()) {
                    if (Cmn == 'S') {
                        if (Identity == 'S') {
                            if (Address == 'S') {
                                OtherDtls = 'S';
                                cCbpOthrDtls.PerformCallback('SaveOthrDtls~');
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
            else //if(ClientType=="N")
            {
                if (OthrDetailsValidatnNonIndividual()) {
                    if (Cmn == 'S') {
                        if (Identity == 'S') {
                            if (Address == 'S') {
                                OtherDtls = 'S';
                                cCbpOthrDtls.PerformCallback('SaveOthrDtls~');
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
            if (ClientType.trim() == "I") {
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
            else //if(ClientType=="N")
            {
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
                //        var IsComparable='<%=Session["P_FileMode"]%>';//P_MatchStatus
                //        if(IsComparable.trim()=="Double")
                //        {       
                //             cCbpCompare.PerformCallback('BindCompareControls~Final');             
                //        } 
                //        else
                //        { 
                alert('Data Submitted Successfully');
                parent.btnShow_Click();
                ////        }
                cCbpOthrDtls.cpSaved = null;
            }
            if (cCbpOthrDtls.cpSaved == "F") {
                alert('Error In Saving Data');
                cCbpOthrDtls.cpSaved = null;
            }
            if (cCbpOthrDtls.cpFetchExistingOthrDtl == "T") {
                var IsComparable = '<%=Session["P_FileMode"]%>';
                if (IsComparable.trim() == "Double")
                    HideShow('Row27', 'H');
                else
                    HideShow('Row27', 'S');
                HideShow('divOthrDtlEdit', 'H');
                HideShow('divOthrDtlSave', 'S');
                HideShow('DivOthrDtlsAlrt', 'H');
                cCbpOthrDtls.cpFetchExistingOthrDtl = null;
            }
            if (cCbpOthrDtls.cpBindForEditOthrDtls == "T") {
                var IsComparable = '<%=Session["P_FileMode"]%>';
                if (IsComparable.trim() == "Double")
                    HideShow('Row27', 'H');
                else
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
                GetObjectID('<%=rdYes.ClientID%>').disabled = true;
                GetObjectID('<%=rdNo.ClientID%>').disabled = true;
                GetObjectID('<%=rdForexY.ClientID%>').disabled = true;
                GetObjectID('<%=rdForexN.ClientID%>').disabled = true;
                GetObjectID('<%=rdGamingY.ClientID%>').disabled = true;
                GetObjectID('<%=rdGamingN.ClientID%>').disabled = true;
                GetObjectID('<%=rdMoneyLendingY.ClientID%>').disabled = true;
                GetObjectID('<%=rdMoneyLendingN.ClientID%>').disabled = true;
                cMemoOthrInfo.SetEnabled(false);
                cComboDocuments.SetEnabled(false);
                cComboPrtnrDocuments.SetEnabled(false);
                GetObjectID('<%=TxtIPVby.ClientID%>').disabled = true;
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
                GetObjectID('<%=TxtCHIPVby.ClientID%>').disabled = true;
                cCHIpvDt.SetEnabled(false);
                cTxtRelWthBrokr.SetEnabled(false);
                cBtnAddRecord.SetEnabled(false);

                //other

                ctxtRPPrefix.SetEnabled(false);
                cTxtCHName.SetEnabled(false);
                ctxtRPMiddleName.SetEnabled(false);
                ctxtRPLastName.SetEnabled(false);
                GetObjectID("<%= rbtnRPFather.ClientID %>").disabled = true;
                GetObjectID("<%= rbtnRPSpouse.ClientID %>").disabled = true;
                ctxtRPFatherPrefix.SetEnabled(false);
                ctxtRPFatherFirstName.SetEnabled(false);
                ctxtRPFatherMiddleName.SetEnabled(false);
                ctxtRPFatherLastName.SetEnabled(false);
                ctxtRPMotherPrefix.SetEnabled(false);
                ctxtRPMotherFirstName.SetEnabled(false);
                ctxtRPMotherMiddleName.SetEnabled(false);
                txtRPMotherLastName.SetEnabled(false); 
                
                var IsComparable = '<%=Session["P_FileMode"]%>'; //P_MatchStatus
                if (IsComparable.trim() == "Double") {
                    //alert('CbpOthrDtls_EndCallBack');
                    cCbpCompare.PerformCallback('BindCompareControls~');
                }
                cCbpOthrDtls.cpBindForEditOthrDtls = null;
            }
            if (cCbpOthrDtls.cpOthrDtlsSavedOrNot == "T") {
                HideShow('DivOthrDtlsAlrt', 'H');
                EditOthrDtl();
                cCbpOthrDtls.cpOthrDtlsSavedOrNot = null;
            }
            if (cCbpOthrDtls.cpIPVBind != null) {
                GetObjectID('<%=TxtIPVby.ClientID%>').focus();
                HideShow('DivOthrDtlsAlrt', 'H');
                HideShow('divOthrDtlEdit', 'H');
                cCbpOthrDtls.cpIPVBind = null;
            }
            if (cCbpOthrDtls.cpIPVCHBind != null) {
                GetObjectID('<%=TxtCHIPVby.ClientID%>').focus();
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
            if (ClientType.trim() == "I") {
                HideShow('Row23', 'H');
                HideShow('Row26', 'H');
                HideShow('DivPrtnerHdr', 'H');
                HideShow('DivNonInIPV', 'H');
                HideShow('div_PartnerDoc', 'H');
            }
            else {
                HideShow('Row26', 'S');
                HideShow('DivPrtnerHdr', 'S');
                HideShow('DivInIPV', 'H');
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
            cGvCHRecord.PerformCallback('Update~' + cComboCHCityE.GetValue() + '~' + cComboCHStateE.GetValue() + '~' + cComboCHCountryE.GetValue() + '~' + cComboPEP.GetValue() + '~' + cComboCHIPVConTypeE.GetValue());
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
                GetObjectID('<%=TxtCHIPVby.ClientID%>').value = "";
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
                cTxtCHPanE.Focus();
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
                cTxtStateCHOthrE.Focus();
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
            //alert('PartnerControl Verify1');
            cCbpCompare.PerformCallback("BindComparePartner~");
        }
        function Attach_Show_DeleteDoc_Click() {
            var url = '';
            var applicableFor = 'Customer/Client';
            var selfXmlFile = '<%=Session["KRA_XMLPATH"]%>';
            var docXmlFile = "KRADocRecords_" + '<%=Session["P_AppliNo"]%>' + '_' + '<%=Session["P_CompanyID"]%>' + '_' + '<%=Session["_EntryProfileType"]%>';
            if (cComboDocuments.GetValue() == "0") {
                url = "../management/frmAddDocuments.aspx?id=RegistrationForm.aspx&id1=Customer/Client&AcType=Add&FormNo=" + '<%=Session["P_AppliNo"]%>' + '_' + '<%=Session["P_CompanyID"]%>' + '_' + '<%=Session["_EntryProfileType"]%>';
                parent.OnMoreInfoClick(url, "Add Self Document", '900px', '350px', 'Y');
            }
            else if (cComboDocuments.GetValue() == "1") {
                url = "KraDoc_Imagedelete.aspx?docF=" + docXmlFile + "&appFor=" + applicableFor;
                parent.OnMoreInfoClick(url, "Document Delete For " + applicableFor, '995px', '500px', 'Y');
            }
            else if (cComboDocuments.GetValue() == "2") {
                url = "KraAuthentication_ImageViewer.aspx?parentF=" + selfXmlFile + "&docF=" + docXmlFile + "&appFor=" + applicableFor;
                parent.OnMoreInfoClick(url, "Document Detail For " + applicableFor, '995px', '500px', 'Y'); //+" ~Without Close"
            }
        }
        function Attach_Show_DeletePrtnrDoc_Click() {
            var url = '';
            var applicableFor = 'ContactPerson';
            var selfXmlFile = '<%=Session["KRA_XMLPATH"]%>';
            var docXmlFile = "KRADocRecords_" + '<%=Session["P_AppliNo"]%>' + '_' + '<%=Session["P_CompanyID"]%>' + '_' + '<%=Session["_EntryProfileType"]%>';
            if (cComboPrtnrDocuments.GetValue() == "0") {
                url = "../management/frmAddDocuments.aspx?id=RegistrationForm.aspx&id1=ContactPerson&AcType=Add&FormNo=" + '<%=Session["P_AppliNo"]%>' + '_' + '<%=Session["P_CompanyID"]%>' + '_' + '<%=Session["_EntryProfileType"]%>';
                parent.OnMoreInfoClick(url, "Add Partner Document", '900px', '350px', 'Y');
            }
            else if (cComboPrtnrDocuments.GetValue() == "1") {
                url = "KraDoc_Imagedelete.aspx?docF=" + docXmlFile + "&appFor=" + applicableFor;
                parent.OnMoreInfoClick(url, "Document Delete For " + applicableFor, '995px', '500px', 'Y');
            }
            else if (cComboPrtnrDocuments.GetValue() == "2") {
                url = "KraAuthentication_ImageViewer.aspx?parentF=" + selfXmlFile + "&docF=" + docXmlFile + "&appFor=" + applicableFor;
                parent.OnMoreInfoClick(url, "Document Detail For " + applicableFor, '995px', '480px', 'Y'); //+applicableFor+"~Without Close"  
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


            ctxtRPPrefix.SetEnabled(true);
            cTxtCHName.SetEnabled(true);
            ctxtRPMiddleName.SetEnabled(true);
            ctxtRPLastName.SetEnabled(true);
            GetObjectID("<%= rbtnRPFather.ClientID %>").disabled = false;
            GetObjectID("<%= rbtnRPSpouse.ClientID %>").disabled = false;
            ctxtRPFatherPrefix.SetEnabled(true);
            ctxtRPFatherFirstName.SetEnabled(true);
            ctxtRPFatherMiddleName.SetEnabled(true);
            ctxtRPFatherLastName.SetEnabled(true);
            ctxtRPMotherPrefix.SetEnabled(true);
            ctxtRPMotherFirstName.SetEnabled(true);
            ctxtRPMotherMiddleName.SetEnabled(true);
            txtRPMotherLastName.SetEnabled(true);
            
            
            ClientType = ('<%=Session["P_ClntType"]%>').trim();
            if (ClientType.trim() == "N")
                cbtnAddDocumentPrtner.SetEnabled(true);

            crdPEP.SetEnabled(true);
            GetObjectID('<%=rdYes.ClientID%>').disabled = false;
            GetObjectID('<%=rdNo.ClientID%>').disabled = false;
            GetObjectID('<%=rdForexY.ClientID%>').disabled = false;
            GetObjectID('<%=rdForexN.ClientID%>').disabled = false;
            GetObjectID('<%=rdGamingY.ClientID%>').disabled = false;
            GetObjectID('<%=rdGamingN.ClientID%>').disabled = false;
            GetObjectID('<%=rdMoneyLendingY.ClientID%>').disabled = false;
            GetObjectID('<%=rdMoneyLendingN.ClientID%>').disabled = false;
            cMemoOthrInfo.SetEnabled(true);
            cComboCHIPVConType.SetEnabled(true);
            cComboIPVConType.SetEnabled(true);
            cComboDocuments.SetEnabled(true);
            cComboPrtnrDocuments.SetEnabled(true);
            GetObjectID('<%=TxtIPVby.ClientID%>').disabled = false;
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
            GetObjectID('<%=TxtCHIPVby.ClientID%>').disabled = false;
            cCHIpvDt.SetEnabled(true);
            cTxtRelWthBrokr.SetEnabled(true);
            cBtnAddRecord.SetEnabled(true);
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
            GetObjectID('<%=TxtIPVby.ClientID%>').value = "";
            cCbpIpvBy.PerformCallback("BindIPVBy~" + cComboIPVConType.GetValue());
        }
        function IPVCHCntTypeChange() {
            GetObjectID('<%=TxtCHIPVby.ClientID%>').value = "";
            cCbpCHIpvBy.PerformCallback("BindIPVCHBy~" + cComboCHIPVConType.GetValue());
        }
        function ComboAttchShowDelDoc() {
            if (cComboDocuments.GetValue() == 0) {
                cbtnDocument.GetMainElement().title = "Click To Attach Documents";
            }
            else if (cComboDocuments.GetValue() == 1) {
                cbtnDocument.GetMainElement().title = "Click To Show And Delete Documents";
            }
            else if (cComboDocuments.GetValue() == 2) {
                cbtnDocument.GetMainElement().title = "Click To Show And Verify Documents";
            }
        }
        function ComboAttchShowDelPrtnrDoc() {
            if (cComboPrtnrDocuments.GetValue() == 0) {
                cbtnAddDocumentPrtner.GetMainElement().title = "Click To Attach Documents";
            }
            else if (cComboPrtnrDocuments.GetValue() == 1) {
                cbtnAddDocumentPrtner.GetMainElement().title = "Click To Show And Delete Documents";
            }
            else if (cComboPrtnrDocuments.GetValue() == 2) {
                cbtnAddDocumentPrtner.GetMainElement().title = "Click To Show And Verify Documents";
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
                if (ClientType.trim() == "I") {
                    alert('Please Attach Atleast Three Mandatory Type Documents For Individual');
                }
                else {
                    alert('Please Attach Atleast Three Mandatory Type Documents For NonIndividual');
                }
                cbtnDocument.Focus();
                cCbpOthrDtls.cpDocumentCheckng = null;
            }
            if (cCbpImage.cpDocumentCheckng == "Exist") {
                HideShow('DivOthrDtlsAlrt', 'H');
                HideShow('divOthrDtlEdit', 'H');
                if (ClientType.trim() == "I") {
                    alert('More Then One same type of Document has been Added in Individual Type of Document');
                }
                else {
                    alert('More Then One same type of Document has been Added in NonIndividual Type of Document');
                }
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
            if (cCbpImage.cpImageChecked == "T") {
                cCbpOthrDtls.PerformCallback('SaveOthrDtls~');
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

        //------------------------------------End Other Details--------------------------------------------------
        function SaveButtonClick() {
            if (ClientType.trim() == "I") {
                if (IdentityValidatnIndividual())
                    if (AddressValidatnIndividual())
                    if (OthrDetailsValidatnIndividual())
                    OthrDetlSave();
                else
                    return;
            }
            else {
                if (IdentityValidatnNonIndividual())
                    if (AddressValidatnNonIndividual())
                    if (OthrDetailsValidatnNonIndividual())
                    OthrDetlSave();
                else
                    return;
            }
        }
    </script>

    <%-------------------popup to bind,compare controls-------%>

    <script type="text/javascript" language="javascript">
        function fn_btnCont_PopUpEdit_Click() {
            //HideShow('div_popup_Loader','S');       
            ClientType = ('<%=Session["P_ClntType"]%>').trim();
            //alert('allocate'+ClientType);
            if (ClientType.trim() == "I") {
                cComboStatus.PerformCallback('IndividualBind~Select~');
            }
            else {
                cComboStatus.PerformCallback('NonIndividualBind~Select~');
            }
            cCbpComon.PerformCallback('BindForEditCmn~');
            Cmn = "S";
            Identity = "S";
            Adddress = "S";
            EntryType = "Edit";
            HideShow('btnOpen', 'S');
            HideShow('btnClose', 'H');
            HideShow('divForVerifyOverView', 'H');
            //HideShow('div_popup_Loader','H');        
            cPopUpEdit.Hide();
        }
        function fn_btnBack_PopUpEdit_Click() {
            parent.btnShow_Click();
            cPopUpEdit.Hide();
        }
        function CbpCompare_EndCallBack() {
            if (cCbpCompare.cpMatchControls != undefined) {
                for (var m = 0; m < cCbpCompare.cpMatchControls.split('~').length - 1; m++) {
                    if (GetObjectID(cCbpCompare.cpMatchControls.split('~')[m]))
                        GetObjectID(cCbpCompare.cpMatchControls.split('~')[m]).style.border = '1px solid #D1E0F3';
                }
            }
            if (cCbpCompare.cpCompareControls != undefined) {
                if (cCbpCompare.cpCompareControls == "T") {
                    if (cCbpCompare.cpMisMatchControls != undefined) {
                        for (var j = 0; j < cCbpCompare.cpMisMatchControls.split('~').length - 1; j++) {
                            if (GetObjectID(cCbpCompare.cpMisMatchControls.split('~')[j]))
                                GetObjectID(cCbpCompare.cpMisMatchControls.split('~')[j]).style.border = '1px solid Red';
                        }
                        alert('Some Field(s) Are Still Not Matched! Please Match Those Field(s)!!!');
                    }
                }
            }
            //=====Match Partner Records=========
            ClientType = ('<%=Session["P_ClntType"]%>').trim();
            if (ClientType == "N") {
                //alert('cCbpCompare.cpPartnerRecordCompare-'+cCbpCompare.cpPartnerRecordCompare);
                if (cCbpCompare.cpPartnerRecordCompare != undefined) {
                    if (cCbpCompare.cpPartnerRecordCompare == "Number Of Records Not Equal") {
                        GetObjectID('divComp_PartnerGvw').style.border = '1px solid Red';
                        GetObjectID('divComp_PartnerInfo').title = "Partner Records Are Not Equal.";
                    }
                    else if (cCbpCompare.cpPartnerRecordCompare == "Records Mismatch") {
                        GetObjectID('divComp_PartnerGvw').style.border = '1px solid Red';
                        GetObjectID('divComp_PartnerInfo').title = "Partner Records Mismatch.";
                    }
                    else //Records Matched
                    {
                        GetObjectID('divComp_PartnerGvw').style.border = '1px solid #D1E0F3';
                        GetObjectID('divComp_PartnerInfo').title = cCbpCompare.cpPartnerRecordCompare;
                    }
                    HideShow('divComp_PartnerGVWInfo', 'S');
                }
                else {
                    HideShow('divComp_PartnerGVWInfo', 'H');
                }
                //=========Non Individual=================
                //alert(cCbpCompare.cpCompareControls+'-Compare Controls## Non-Ind ##Partner Record Compare-'+cCbpCompare.cpPartnerRecordCompare);
                if ((cCbpCompare.cpCompareControls == "F" || cCbpCompare.cpCompareControls == null) && (cCbpCompare.cpPartnerRecordCompare == "Records Matched")) {
                    var ans = confirm('Data Matched Successfully! \n If You Want To Stay For futher Matching [Click OK] \n If You Want To Go To Verify Record [Click Cancel]');
                    if (ans != true)
                        parent.btnShow_Click();
                }
            }
            else {
                //=======Individual=================
                //alert('Ind cCbpCompare.cpCompareControls-'+cCbpCompare.cpCompareControls);
                if (cCbpCompare.cpCompareControls == "F" || cCbpCompare.cpCompareControls == null) {
                    var ans = confirm('Data Matched Successfully! \n If You Want To Stay For futher Matching [Click OK] \n If You Want To Go To Verify Record [Click Cancel]');
                    if (ans != true)
                        parent.btnShow_Click();
                }
            }
        }
    </script>

    <!--  For Floating Div with snap-->

    <script type="text/javascript" src="../JSFunction/floating-1.12.js"></script>

    <script type="text/javascript">
        floatingMenu.add('divForVerifyOverView', { targetLeft: 6, targetTop: 22, snap: true });
        floatingMenu.add('btnClose', { targetLeft: 2, targetTop: 2, snap: true });
        floatingMenu.add('btnOpen', { targetLeft: 2, targetTop: 2, snap: true });
        function fn_onmouseOver(ele) {
            if (ele == '1')
                GetObjectID('Div_Common_Show').title = "Go To Application Number & BranchID";
            else if (ele == '2')
                GetObjectID('Div_Identity_Show').title = "Go To Identity Details";
            else if (ele == '3')
                GetObjectID('Div_Address_Show').title = "Go To Address Details";
            else if (ele == '4')
                GetObjectID('Div_Other_Show').title = "Go To Other Details";
        }
    </script>

</head>
<body id="abc">
    <form id="form1" runat="server">
    <div>
        <div id="divPopup">
            <dxpc:ASPxPopupControl ID="PopUpEdit" runat="server" ClientInstanceName="cPopUpEdit"
                CloseAction="None" HeaderText="KRA ( KYC Registration Authorization )  Edit"
                Modal="True" PopupHorizontalAlign="LeftSides" PopupVerticalAlign="TopSides" ShowOnPageLoad="True"
                ShowSizeGrip="False" Width="700px" ShowCloseButton="false">
                <ContentCollection>
                    <dxpc:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
                        <asp:Panel ID="Panel1" runat="server" Width="99%">
                            <%--<div id="div_popup_Loader" class="right" style="display: none; width: 100px; text-align: left;
                                    padding-left: 10px;">
                                    <img src="../CentralData/Images/loading123.gif" width="71" height="49" alt="Please Wait Content Loading .." />
                                </div>--%>
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
        <div id="btnOpen" class="Box_closeTotal">
            <a href="javascript:void(0);" onclick="btnOpenTotal_click()" title="Click To have A OverView Of All Records">
                +</a></div>
        <div id="btnClose" class="Box_closeTotal">
            <a href="javascript:void(0);" onclick="btnCloseTotal_click()" title="Minimize The Section">
                -</a></div>
        <div id="divForVerifyOverView" class="Box_TotalRecord">
            <div style="width: 755px;">
                <div style="width: 100%">
                    <div id="Div_Common_Show" runat="server" class="left cellTotHeader" style="width: 182px;
                        cursor: pointer" onmouseover="fn_onmouseOver('1')" onclick="return CommonShow()">
                        <b>Application Number & BranchID</b>
                    </div>
                    <div id="Div_Identity_Show" runat="server" class="left cellTotHeader" style="width: 180px;
                        cursor: pointer" onmouseover="fn_onmouseOver('2')" onclick="return IdentityShow()">
                        <b>Identity Details</b>
                    </div>
                    <div id="Div_Address_Show" runat="server" class="left cellTotHeader" style="width: 180px;
                        cursor: pointer" onmouseover="fn_onmouseOver('3')" onclick="return AddressShow()">
                        <b>Address Details</b>
                    </div>
                    <div id="Div_Other_Show" runat="server" class="left cellTotHeader" style="width: 180px;
                        cursor: pointer" onmouseover="fn_onmouseOver('4')" onclick="return OtherShow()">
                        <b>Other Details</b>
                    </div>
                    <span class="clear"></span>
                </div>
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
                                        <span class="Spanclass"><span style="font-size: 9pt; color: #000000">Application No:
                                        </span></span>
                                    </div>
                                    <div id="Row00_Col1" class="LFloat_Row" style="height: 25px" onclick="return Row00_Col1_onclick()">
                                        <dxe:ASPxTextBox ID="TxtAppliNo" runat="server" ClientInstanceName="cTxtAppliNo"
                                            MaxLength="16" Width="150px">
                                        </dxe:ASPxTextBox>
                                    </div>
                                    <div id="Row00_Col2" class="LFloat_Lable Leftdiv" style="margin-left: 10px">
                                        <span class="Spanclass"></span>Application Date: <span style="font-size: 10pt; color: #ff0000">
                                            **</span>
                                    </div>
                                    <div id="Row00_Col3" class="LFloat_Row" style="height: 25px">
                                        <dxe:ASPxDateEdit ID="AppliDt" runat="server" ClientInstanceName="cAppliDt" DateOnError="Today"
                                            EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="150px"
                                            Font-Size="11px" TabIndex="0">
                                        </dxe:ASPxDateEdit>
                                    </div>
                                    <span class="Spanclass">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; **</span> <span style="font-size: 8pt">
                                        Mandatory Fields To Be Filled</span>
                                </div>
                                <div id="Row01" class="Row">
                                    <div id="Row01_Col0" class="LFloat_Lable Leftdiv" style="height: 30px">
                                        <span class="Spanclass"></span>Internal Refference No: <span style="font-size: 10pt;
                                            color: #ff0000">**</span>
                                    </div>
                                    <div id="Row01_Col1" class="LFloat_Row" style="height: 30px">
                                        <dxe:ASPxTextBox runat="server" Width="150px" ClientInstanceName="cTxtFormNo" ID="TxtFormNo">
                                        </dxe:ASPxTextBox>
                                    </div>
                                    <div id="Row01_Col4" class="LFloat_Lable Leftdiv LeftMargin" style="width: 190px;
                                        height: 30px;">
                                        Branch :
                                    </div>
                                    <div id="Row01_Col5" class="LFloat_Row" style="height: 30px">
                                        <asp:TextBox ID="TxtBranch" runat="server" Width="150px"></asp:TextBox>
                                    </div>
                                    <asp:HiddenField ID="TxtBranch_hidden" runat="server" />
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
                                    
                                    <%--<div id="Row01_Col2" class="LFloat_Lable Leftdiv" style="margin-left: 10px; height: 30px">
                                                <span style="font-size: 9pt; color: #000000">Client ID (UCC) : </span>
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
                                        </div>--%>
                                </div>
                                <div id="DivBtnSaveCmn" class="left" style="margin-left: 10px; font-size: 12pt;">
                                    <dxe:ASPxButton ID="BtnSaveCmn" runat="server" AutoPostBack="false" TabIndex="0"
                                        ToolTip="Save Entered Data" Width="106px" ClientInstanceName="cBtnSaveCmn" BackColor="Transparent"
                                        Height="60px">
                                        <Border BorderColor="Black" BorderStyle="None"></Border>
                                        <ClientSideEvents Click="function(s, e) {SaveCommon();}"></ClientSideEvents>
                                        <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_save.png"
                                            Repeat="NoRepeat" />
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
                                            <Border BorderStyle="None" />
                                            <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_foward.png"
                                                Repeat="NoRepeat" />
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
                            <div class="DivHeader" style="width: 100%">
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
                                        <div id="Div3" class="LFloat_Row BtmMargin" style="height: 38px; text-align: center;">
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
                                            **</span> <span style="font-size: 8pt">Mandatory Fields To Be Filled</span></div>
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
                                            <dxe:ASPxComboBox ID="ComboIncorpPlc" runat="server" ClientInstanceName="cComboIncorpPlc"
                                                EnableIncrementalFiltering="True" Font-Size="Small" ValueType="System.String"
                                                Width="155px">
                                                <ClientSideEvents SelectedIndexChanged="function(s,e){OnTypeChange()}" TextChanged="onClientChange">
                                                </ClientSideEvents>
                                            </dxe:ASPxComboBox>
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
                                    
                                    <div id="RowF" class="Row" style="height: 38px; text-align: center;">
                                        <div id="Row4_Col0" class="LFloat_Lable Leftdiv">
                                            <span class="Spanclass"></span>Father's / Spouse: <span style="font-size: 10pt;
                                                color: #ff0000">**</span>
                                        </div>
                                         <div id="Div5" class="LFloat_Row" style="height: 25px">
                                            <asp:RadioButton ID="btnFather" runat="server" Checked="True" Text="Father" GroupName="FS" />
                                            <asp:RadioButton ID="btnSpouse" runat="server" Text="Spouse" GroupName="FS" />
                                        </div>
                                    </div>
                                    
                                    <div id="Div4" class="Row" style="height: 38px; text-align: center;">
                                            <div id="Div9" class="LFloat_Row BtmMargin" style="height: 38px">
                                                </span>Father's/Spouse's Name: <span style="font-size: 10pt;
                                                color: #ff0000">**</span>
                                                
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
                                            <asp:RadioButton ID="rdMale" runat="server" Text="Male" GroupName="a" />
                                            <asp:RadioButton ID="rdFemale" runat="server" Text="Female" GroupName="a" />
                                        </div>
                                    </div>
                                    
                                    <div id="Row6">
                                        <div id="Row6_Col0" class="LFloat_Row Leftdiv" style="margin-left: 10px">
                                            Marital Status:
                                        </div>
                                        <div id="Row6_Col1" class="LFloat_Row FontChange" style="height: 25px; margin-left: 10px">
                                            <asp:RadioButton ID="rdSingl" runat="server" GroupName="mrgStat" Text="Single" />
                                            <asp:RadioButton ID="rdMrd" runat="server" GroupName="mrgStat" Text="Married" />
                                        </div>
                                    </div>
                                    
                                    <div id="RowMaiden" class="Row" style="display: none;">
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
                                     
                                    <div id="DvMother" class="Row" runat="server">
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
                                            <span style="font-size: 10pt; color: #ff0000"></span>Date Of Birth: <span style="font-size: 10pt;
                                                color: #ff0000">**</span></div>
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
                                            <dxe:ASPxTextBox ID="txtPlaceogBirth" runat="server" ClientInstanceName="CtxtPlaceogBirth"
                                                MaxLength="10" Width="150px">
                                            </dxe:ASPxTextBox>
                                        </div>
                                        <div id="Row7_Col4" class="LFloat_Lable Leftdiv">
                                            <span style="font-size: 10pt; color: #ff0000"></span>Country of Birth:<span style="font-size: 10pt;
                                                color: #ff0000">**</span>
                                        </div>
                                        <div id="Row7_Col5" class="LFloat_Row" style="height: 25px">
                                            <dxe:ASPxComboBox ID="cmbCountryofBirth" runat="server" EnableIncrementalFiltering="True"
                                                ValueType="System.String" Width="156px" ClientInstanceName="CcmbCountryofBirth"
                                                Font-Size="Small">
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
                                                    Text="Indian" Layout="Flow" GroupName="c">
                                                    <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdOthr.GetChecked(),'div_othr');}">
                                                    </ClientSideEvents>
                                                </dxe:ASPxRadioButton>
                                                <dxe:ASPxRadioButton ID="rdOthr" runat="server" ClientInstanceName="crdOthr" Text="Other"
                                                    Layout="Flow" GroupName="c">
                                                    <ClientSideEvents CheckedChanged="function(s,e){OnCheckedShowHide(crdOthr.GetChecked(),'div_othr');}">
                                                    </ClientSideEvents>
                                                </dxe:ASPxRadioButton>
                                            </div>
                                            <div id="div_othr" class="left FontChange" style="margin-left: 2px">
                                                <asp:TextBox ID="TxtOthr" runat="server" Width="150px"></asp:TextBox>
                                                (Please Specify)
                                            </div>
                                        </div>
                                        <asp:HiddenField ID="TxtOthr_Hidden" runat="server" />
                                    </div>
                                    <div id="Row9" class="Row">
                                        <div id="Row9_Col0" class="LFloat_Lable Leftdiv">
                                            <span style="font-size: 10pt; color: #ff0000"></span>Status: <span style="font-size: 10pt;
                                                color: #ff0000">**</span></div>
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
                                    <div id="DvAccHolder" class="Row" style="height: 38px; text-align: center;">
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
                                            <span class="Spanclass"></span>PAN: <span style="font-size: 10pt; color: #ff0000">**</span></div>
                                        <div id="Row10_Col1" class="LFloat_Row FontChange" style="height: 35px">
                                            <dxe:ASPxTextBox ID="TxtPan" runat="server" ClientInstanceName="cTxtPan" MaxLength="10"
                                                Width="150px">
                                                <ClientSideEvents KeyUp="function(s,e){s.SetText(s.GetValue().toUpperCase());}" LostFocus="function(s, e) {verifyPanCrdNo(cTxtPan);}" />
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
                                            <dxe:ASPxRadioButton ID="rdPanxmptN" runat="server" GroupName="z" ClientInstanceName="crdPanxmptN">
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
                                                color: #ff0000">**</span></div>
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
                                            <dxe:ASPxComboBox ID="cmbJurisdictionofresidence" runat="server" EnableIncrementalFiltering="True"
                                                ValueType="System.String" Width="156px" ClientInstanceName="CJurisdictionofresidence"
                                                Font-Size="Small">
                                                <ClientSideEvents EndCallback=" function(s,e){cmbHolderType_EndCallback()}"></ClientSideEvents>
                                            </dxe:ASPxComboBox>
                                            <span style="font-size: 8pt">[Jurisdiction of residence]</span>
                                        </div>
                                        <div id="Div33" class="LFloat_Row BtmMargin" style="height: 38px">
                                            <dxe:ASPxTextBox ID="txtResidentTIN" runat="server" Width="156px" ClientInstanceName="CtxtResidentTIN"
                                                Font-Size="Small">
                                            </dxe:ASPxTextBox>
                                            <span style="font-size: 8pt">[Tax Identification Number or equivalent (If issued by
                                                jurisdiction)]</span>
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
                                            <Border BorderColor="Transparent" BorderStyle="None"></Border>
                                            <ClientSideEvents Click="function(s, e) {SaveIdentity();}"></ClientSideEvents>
                                            <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_save.png"
                                                Repeat="NoRepeat" />
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
                            <div class="DivHeader" style="width: 100%">
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
                                        <div id="Row15_Col1" class="LFloat_Row FontChange BtmMargin" style="width: 57%">
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
                                            <div style="margin-bottom: 2px">
                                                <span style="font-size: 8pt">[House No]</span>
                                                <dxe:ASPxTextBox ID="TxtAddress1" runat="server" ClientInstanceName="cTxtAddress1"
                                                    HorizontalAlign="left" Width="460px">
                                                    <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtAddress1);}" 
                                                     TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                                     </ClientSideEvents>--%>
                                                </dxe:ASPxTextBox>
                                            </div>
                                            <div style="margin-bottom: 2px">
                                                <span style="font-size: 8pt">[Street Name]</span>
                                                <dxe:ASPxTextBox ID="TxtAddress2" runat="server" ClientInstanceName="cTxtAddress2"
                                                    HorizontalAlign="left" Width="460px">
                                                    <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtAddress2);}" 
                                                     TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                                     </ClientSideEvents>--%>
                                                </dxe:ASPxTextBox>
                                            </div>
                                            <div style="margin-bottom: 4px">
                                                <span style="font-size: 8pt">[Area Name]</span>
                                                <dxe:ASPxTextBox ID="TxtAddress3" runat="server" ClientInstanceName="cTxtAddress3"
                                                    HorizontalAlign="left" Width="460px">
                                                    <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtAddress3);}" 
                                                     TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                                     </ClientSideEvents>--%>
                                                </dxe:ASPxTextBox>
                                            </div>
                                            <%--<div class="left" style="height: 30px; margin-left: 66px;">
                                                <dxe:ASPxComboBox ID="ASPxComboBox1" runat="server" ClientInstanceName="cComboCountry"
                                                    EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                    Width="150px">
                                                    <ClientSideEvents SelectedIndexChanged="function(s,e){OnTypeChange()}"></ClientSideEvents>
                                                    <DropDownButton Text="Country">
                                                    </DropDownButton>
                                                </dxe:ASPxComboBox>
                                            </div>--%>
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
                                            <div id="DivStateOthr" class="left" style="height: 30px; margin-left: 2px">
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
                                        &nbsp; &nbsp;&nbsp; <span style="font-size: 10pt; color: #ff0000">**</span> <span
                                            style="font-size: 8pt">Mandatory Fields To Be Filled</span>
                                    </div>
                                    <div id="Row16" class="Row">
                                        <div id="Row16_Col0" class="LFloat_Lable Leftdiv" style="height: 100px">
                                            Proof Of Address<br />
                                            <strong>(For Correspondence Address )</strong>:
                                            <br />
                                            <span style="font-size: 8pt">**Validity/Expiry Date of Proof of address Must not be
                                                more than 3 Months old.</span></div>
                                        <div id="Row16_Col1" class="LFloat_Row FontChange" style="width: 57%; height: 100px;">
                                            <div class="LFloat_Row FontChange BtmMargin" style="height: 37px">
                                                <dxe:ASPxComboBox ID="ComboCrpndsAdrs" runat="server" ClientInstanceName="cComboCrpndsAdrs"
                                                    EnableIncrementalFiltering="True" Font-Size="12px" ValueType="System.String"
                                                    Width="200px" Height="25px">
                                                    <ClientSideEvents SelectedIndexChanged="CrpndsAdrsChange" />
                                                </dxe:ASPxComboBox>
                                            </div>
                                            <div id="DivOthrAdrsPrf" style="margin-left: 2px">
                                                <dxe:ASPxTextBox ID="TxtOthrAdrsPrf" runat="server" ClientInstanceName="cTxtOthrAdrsPrf"
                                                    Width="150px">
                                                </dxe:ASPxTextBox>
                                                (Please Specify)<br />
                                            </div>
                                            <br />
                                            <div class="left" style="height: 25px; width: 377px;">
                                                <dxe:ASPxDateEdit ID="ValidDt" runat="server" ClientInstanceName="cValidDt" DateOnError="Today"
                                                    EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="210px"
                                                    Font-Size="11px" TabIndex="0">
                                                    <DropDownButton Text="**Validity/Expiry Date">
                                                    </DropDownButton>
                                                </dxe:ASPxDateEdit>
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
                                            <div id="Row17_Col3" style="font-size: 12px; margin-top: 4px; width: 155px; border: solid 1px  #D1E0F3;">
                                                <dxe:ASPxCheckBox ID="CbSame" runat="server" ClientInstanceName="cCbSame" ToolTip="Same As The Corresponding Address"
                                                    Checked="False">
                                                    <ClientSideEvents CheckedChanged="OnCheckedChanged" />
                                                </dxe:ASPxCheckBox>
                                                <strong>Same As The
                                                    <br />
                                                    Correspondence Address </strong>
                                            </div>
                                        </div>
                                        <div id="Row16_Col2" class="LFloat_Row FontChange " style="width: 57%; margin-top: 4px;
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
                                            <div style="margin-bottom: 2px">
                                                <span style="font-size: 8pt">[House No] </span>
                                                <dxe:ASPxTextBox ID="TxtAddress1P" runat="server" ClientInstanceName="cTxtAddress1P"
                                                    HorizontalAlign="left" Width="460px">
                                                    <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtAddress1P);}" 
                                                     TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                                     </ClientSideEvents>--%>
                                                </dxe:ASPxTextBox>
                                            </div>
                                            <div style="margin-bottom: 2px">
                                                <span style="font-size: 8pt">[Street Name] </span>
                                                <dxe:ASPxTextBox ID="TxtAddress2P" runat="server" ClientInstanceName="cTxtAddress2P"
                                                    HorizontalAlign="left" Width="460px">
                                                    <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtAddress2P);}" 
                                                     TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                                     </ClientSideEvents>--%>
                                                </dxe:ASPxTextBox>
                                            </div>
                                            <div style="margin-bottom: 4px">
                                                <span style="font-size: 8pt">[Area Name] </span>
                                                <dxe:ASPxTextBox ID="TxtAddress3P" runat="server" ClientInstanceName="cTxtAddress3P"
                                                    HorizontalAlign="left" Width="460px">
                                                    <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtAddress3P);}" 
                                                     TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                                     </ClientSideEvents>--%>
                                                </dxe:ASPxTextBox>
                                            </div><%--
                                            <div class="left" style="height: 30px; margin-left: 66px;">
                                                <dxe:ASPxComboBox ID="ASPxComboBox2" runat="server" ClientInstanceName="cComboCountryP"
                                                    EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                    Width="150px">
                                                    <ClientSideEvents SelectedIndexChanged="function(s,e){OnTypeChange()}"></ClientSideEvents>
                                                    <DropDownButton Text="Country">
                                                    </DropDownButton>
                                                </dxe:ASPxComboBox>
                                            </div>--%>
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
                                            <%--<div class="left" style="height: 30px; margin-left: 4px; width: 100%">
                                                <dxe:ASPxComboBox ID="ASPxComboBox3" runat="server" ClientInstanceName="cComboStateP"
                                                    EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                    Width="150px">
                                                    <ClientSideEvents SelectedIndexChanged="function(s,e){OnStateChange('2')}"></ClientSideEvents>
                                                    <DropDownButton Text="State">
                                                    </DropDownButton>
                                                </dxe:ASPxComboBox>
                                            </div>
                                            <div id="Div1" class="left" style="height: 30px; margin-left: 2px">
                                                <div class="left">
                                                    <dxe:ASPxTextBox ID="ASPxTextBox1" runat="server" ClientInstanceName="cTxtStateOthrP"
                                                        Width="150px">
                                                    </dxe:ASPxTextBox>
                                                </div>
                                                <div class="left">
                                                    (Please Specify)
                                                </div>
                                            </div>--%>
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
                                            <div id="DivStateOthrP" class="left" style="height: 30px; margin-left: 2px">
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
                                    <%-- <div id="Row17_Col3" class="LFloat_Row" style="font-size: 12px">
                                            <dxe:ASPxCheckBox ID="CbSame" runat="server" ClientInstanceName="cCbSame" ToolTip="Same As The Corresponding Address"
                                                Checked="False">
                                                <clientsideevents checkedchanged="OnCheckedChanged" />
                                            </dxe:ASPxCheckBox>
                                            Same As The Correspondence Address
                                        </div>--%>
                                    <div id="Row18" class="Row">
                                        <div id="Row18_Col0" class="LFloat_Lable Leftdiv" style="height: 100px">
                                            Proof Of Address<br />
                                            <strong>(For Permanent Address )</strong>:<br />
                                            <span style="font-size: 8pt">**Validity/Expiry Date of Proof of address Must not be
                                                more than 3 Months old. </span>
                                        </div>
                                        <div id="Row18_Col1" class="LFloat_Row FontChange" style="width: 57%; height: 100px;">
                                            <div class="LFloat_Row FontChange BtmMargin" style="height: 37px">
                                                <dxe:ASPxComboBox ID="ComboRegAdrs" runat="server" ClientInstanceName="cComboRegAdrs"
                                                    EnableIncrementalFiltering="True" Font-Size="12px" ValueType="System.String"
                                                    Width="200px" Height="25px">
                                                    <ClientSideEvents SelectedIndexChanged="RegAdrsChange" />
                                                </dxe:ASPxComboBox>
                                            </div>
                                            <div id="DivOthrAdrsPrfP" style="margin-left: 2px">
                                                <dxe:ASPxTextBox ID="TxtOthrAdrsPrfP" runat="server" ClientInstanceName="cTxtOthrAdrsPrfP"
                                                    Width="150px">
                                                </dxe:ASPxTextBox>
                                                (Please Specify)<br />
                                            </div>
                                            <br />
                                            <div class="left" style="height: 25px; width: 377px;">
                                                <dxe:ASPxDateEdit ID="ValidDtP" runat="server" ClientInstanceName="cValidDtP" DateOnError="Today"
                                                    EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="210px"
                                                    Font-Size="11px" TabIndex="0">
                                                    <DropDownButton Text="**Validity/Expiry Date">
                                                    </DropDownButton>
                                                </dxe:ASPxDateEdit>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="dvJurisdiction" class="Row">
                                        <div id="Div20" class="LFloat_Lable Leftdiv">
                                            <span class="Spanclass"></span><span style="font-size: 8pt">Jurisdiction AddressType
                                                <span style="font-size: 10pt; color: #ff0000">**</span> </span>
                                        </div>
                                        <div id="Div34" class="LFloat_Row FontChange" style="width: 80%">
                                            <dxe:ASPxComboBox ID="cmbJDAddressType" runat="server" ClientInstanceName="CcmbJDAddressType_Type"
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
                                                <div class="left" style="margin-bottom: 2px; width: 100%">
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
                                                <div class="left" style="height: 30px; margin-left: 4px; width: 100%">
                                                    <dxe:ASPxComboBox ID="cmbJDState" runat="server" ClientInstanceName="CcmbJDState"
                                                        EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                        Width="150px">
                                                        <ClientSideEvents SelectedIndexChanged="function(s,e){OnStateChange('1')}"></ClientSideEvents>
                                                        <DropDownButton Text="State">
                                                        </DropDownButton>
                                                    </dxe:ASPxComboBox>
                                                </div>
                                                <%--<div id="dvJDState" class="left" style="height: 30px; margin-left: 2px">
                                                    <div class="left">
                                                        <dxe:ASPxTextBox ID="txtStateOther" runat="server" ClientInstanceName="CtxtStateOther"
                                                            Width="150px">
                                                        </dxe:ASPxTextBox>
                                                    </div>
                                                    <div class="left">
                                                        (Please Specify)
                                                    </div>
                                                </div>--%>
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
                                                    <dxe:ASPxDateEdit ID="dateJDValidDt" runat="server" ClientInstanceName="CdateJDValidDt"
                                                        DateOnError="Today" EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True"
                                                        Width="210px" Font-Size="11px" TabIndex="0" Height="23px">
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
                                        <div id="Row19_Col0" class="LFloat_Lable Leftdiv" style="height: 60px">
                                            Contact&nbsp; Details:<br />
                                            <span class="Spanclass"></span><span style="font-size: 8pt">[Mandatory to Give Atleast&nbsp;<br />
                                                &nbsp; &nbsp; &nbsp;One Contact No ] <span style="font-size: 10pt; color: #ff0000">**</span></span></div>
                                        <div id="Row19_Col1" class="LFloat_Row FontChange" style="width: 57%">
                                            <div class="left" style="width: 99%">
                                                <div class="left" style="height: 25px">
                                                    Tel(Off) &nbsp;:
                                                </div>
                                                <div class="left" style="height: 25px">
                                                    <dxe:ASPxTextBox ID="TxtTelOfc" runat="server" ClientInstanceName="cTxtTelOfc" MaxLength="11"
                                                        HorizontalAlign="Right" Width="120px">
                                                        <MaskSettings Mask="<0..99999999999>" />
                                                        <ClientSideEvents LostFocus="function(s, e) {CheckTheLeast(cTxtTelOfc.GetText());}" />
                                                    </dxe:ASPxTextBox>
                                                </div>
                                                <div class="left" style="height: 25px">
                                                    &nbsp;Tel(Res) &nbsp;&nbsp; :
                                                </div>
                                                <div class="left" style="height: 25px">
                                                    <dxe:ASPxTextBox ID="TxtTelRes" runat="server" ClientInstanceName="cTxtTelRes" MaxLength="11"
                                                        HorizontalAlign="Right" Width="120px">
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
                                                        <ClientSideEvents LostFocus="function(s, e) {CheckTheLeast(cTxtMobileNo.GetText());}" />
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
                                                BackColor="Transparent" Height="60px">
                                                <Border BorderColor="Transparent" BorderStyle="None"></Border>
                                                <ClientSideEvents Click="function(s, e) {SaveAddress();}"></ClientSideEvents>
                                                <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_save.png"
                                                    Repeat="NoRepeat" />
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
                            <div class="DivHeader" style="width: 100%">
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
                                            <div id="Row20_Col1" class="LFloat_Row FontChange BtmMargin">
                                                <div class="left" style="width: 600px">
                                                    <%--<div class="left" style="height: 25px">
                                                              <strong>Income Range Per Annum :</strong>
                                                          </div>--%>
                                                    <%--  <div class="LFloat_Row FontChange LeftMargin" style="height: 37px;">--%>
                                                    <dxe:ASPxComboBox ID="ComboAnnualIncm" runat="server" ClientInstanceName="cComboAnnualIncm"
                                                        EnableIncrementalFiltering="True" Font-Size="12px" ValueType="System.String"
                                                        Width="200px" Height="25px">
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
                                                        <div id="DivOthrOccu" class="left" style="margin-left: 2px">
                                                            <dxe:ASPxTextBox ID="TxtothrOccu" runat="server" ClientInstanceName="cTxtothrOccu"
                                                                Width="150px">
                                                            </dxe:ASPxTextBox>
                                                            (Please Specify)
                                                        </div>
                                                    </div>
                                                    <div class="left" style="width: 498px">
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
                                                    <asp:RadioButton ID="rdYes" runat="server" GroupName="i" TabIndex="0" />
                                                    YES
                                                    <asp:RadioButton ID="rdNo" runat="server" GroupName="i" TabIndex="0" />
                                                    NO
                                                    <div class="left" style="width: 99%">
                                                        <div class="left" style="height: 25px">
                                                            – For Foreign Exchange / Money Changer Services:
                                                        </div>
                                                        <div class="left" style="height: 25px">
                                                            <asp:RadioButton ID="rdForexY" runat="server" GroupName="j" TabIndex="0" />
                                                            YES
                                                            <asp:RadioButton ID="rdForexN" runat="server" GroupName="j" TabIndex="0" />
                                                            NO
                                                        </div>
                                                    </div>
                                                    <div class="left" style="width: 99%">
                                                        <div class="left" style="height: 25px">
                                                            – Gaming / Gambling / Lottery Services(e.g. casinos, betting syndicates):
                                                        </div>
                                                        <div class="left" style="height: 25px">
                                                            <asp:RadioButton ID="rdGamingY" runat="server" GroupName="j" TabIndex="0" />
                                                            YES
                                                            <asp:RadioButton ID="rdGamingN" runat="server" GroupName="j" TabIndex="0" />
                                                            NO
                                                        </div>
                                                    </div>
                                                    <div class="left" style="width: 99%">
                                                        <div class="left" style="height: 25px">
                                                            – Money Lending / Pawning:
                                                        </div>
                                                        <div class="left" style="height: 25px">
                                                            <asp:RadioButton ID="rdMoneyLendingY" runat="server" GroupName="j" TabIndex="0" />
                                                            YES
                                                            <asp:RadioButton ID="rdMoneyLendingN" runat="server" GroupName="j" TabIndex="0" />
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
                                            margin-bottom: 5px;" onclick="return Row25_Col1_onclick()">
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
                                    </div>
                                    <br class="clear" />
                                    <div id="DivPrtnerHdr" style="width: 1100px; font-family: Calibri; font-weight: bold;
                                        margin-top: 10px; margin-bottom: 10px; background-color: #DDD; height: 25px;">
                                        &nbsp;Details of Promoters/ Partners/ Karta / Trustees and whole time directors
                                        for Non-Individuals
                                    </div>
                                    <div id="Row26" class="Row">
                                        <div class="Row">
                                            <div id="Div2" class="LFloat_Lable Leftdiv BtmMargin" style="height: 38px;">
                                                <span class="Spanclass"></span>Name Of The Related Person:<span style="font-size: 10pt;
                                                    color: #ff0000">**</span>
                                            </div>
                                            <div id="Row26_Col11A" class="LFloat_Row BtmMargin" style="height: 38px; text-align: center;">
                                                <dxe:ASPxTextBox ID="txtRPPrefix" runat="server" ClientInstanceName="ctxtRPPrefix"
                                                    Width="100px">
                                                </dxe:ASPxTextBox>
                                                <span style="font-size: 8pt">[Prefix]</span>
                                            </div>
                                            <div id="Row26_Col11B" class="LFloat_Row BtmMargin" style="height: 38px; text-align: center;">
                                                <dxe:ASPxTextBox ID="TxtCHName" runat="server" ClientInstanceName="cTxtCHName" Width="482px">
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
                                                <span class="Spanclass"></span>Name Of The Related Related Person's Father/Spouse
                                                Name:<span style="font-size: 10pt; color: #ff0000">**</span>
                                            </div>
                                            <div id="Div60" class="LFloat_Row BtmMargin" style="height: 38px; text-align: center;">
                                                <dxe:ASPxTextBox ID="txtRPFatherPrefix" runat="server" ClientInstanceName="ctxtRPFatherPrefix"
                                                    Width="100px">
                                                </dxe:ASPxTextBox>
                                                <span style="font-size: 8pt">[Prefix]</span>
                                            </div>
                                            <div id="Div61" class="LFloat_Row BtmMargin" style="height: 38px; text-align: center;">
                                                <dxe:ASPxTextBox ID="txtRPFatherFirstName" runat="server" ClientInstanceName="ctxtRPFatherFirstName"
                                                    Width="100px">
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
                                                <span class="Spanclass"></span>Name Of The Related Person:<span style="font-size: 10pt;
                                                    color: #ff0000">**</span>
                                            </div>
                                            <div id="Div55" class="LFloat_Row BtmMargin" style="height: 38px; text-align: center;">
                                                <dxe:ASPxTextBox ID="txtRPMotherPrefix" runat="server" ClientInstanceName="ctxtRPMotherPrefix"
                                                    Width="100px">
                                                </dxe:ASPxTextBox>
                                                <span style="font-size: 8pt">[Prefix]</span>
                                            </div>
                                            <div id="Div56" class="LFloat_Row BtmMargin" style="height: 38px; text-align: center;">
                                                <dxe:ASPxTextBox ID="txtRPMotherFirstName" runat="server" ClientInstanceName="ctxtRPMotherFirstName"
                                                    Width="100px">
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
                                                <ClientSideEvents KeyUp="function(s,e){s.SetText(s.GetValue().toUpperCase());}" LostFocus="function(s, e) {verifyPanCrdNo(cTxtCHPan);}" />
                                            </dxe:ASPxTextBox>
                                        </div>
                                        <div class="Row">
                                            <div id="Row26_Col6" class="LFloat_Lable Leftdiv">
                                                <span class="Spanclass"></span>Address: <span style="font-size: 10pt; color: #ff0000">
                                                    **</span></div>
                                            <div id="Row26_Col7" class="LFloat_Row FontChange" style="width: 60%">
                                                <div style="margin-bottom: 2px">
                                                    <span style="font-size: 8pt">[House No]</span>
                                                    <dxe:ASPxTextBox ID="TxtCHAddress1" runat="server" ClientInstanceName="cTxtCHAddress1"
                                                        HorizontalAlign="left" Width="460px">
                                                        <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtCHAddress1);}" 
                                                                     TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                                         </ClientSideEvents>--%>
                                                    </dxe:ASPxTextBox>
                                                </div>
                                                <div style="margin-bottom: 2px">
                                                    <span style="font-size: 8pt">[Street Name]</span>
                                                    <dxe:ASPxTextBox ID="TxtCHAddress2" runat="server" ClientInstanceName="cTxtCHAddress2"
                                                        HorizontalAlign="left" Width="460px">
                                                        <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtCHAddress2);}" 
                                                             TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                                          </ClientSideEvents>--%>
                                                    </dxe:ASPxTextBox>
                                                </div>
                                                <div style="margin-bottom: 4px">
                                                    <span style="font-size: 8pt">[Area Name]</span>
                                                    <dxe:ASPxTextBox ID="TxtCHAddress3" runat="server" ClientInstanceName="cTxtCHAddress3"
                                                        HorizontalAlign="left" Width="460px">
                                                        <%--<ClientSideEvents GotFocus="function(s,e){s.inputElement.style.color = '#000000';}" LostFocus="function(s,e){ColourChangeLostFocus(s.inputElement,cTxtCHAddress3);}" 
                                                            TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                                         </ClientSideEvents>--%>
                                                    </dxe:ASPxTextBox>
                                                </div>
                                                <div class="left" style="width: 99%">
                                                    <div class="left" style="height: 25px">
                                                        City/Town/Village :
                                                    </div>
                                                    <div class="left" style="height: 25px">
                                                        <dxe:ASPxComboBox ID="ComboCHCity" runat="server" ClientInstanceName="cComboCHCity"
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
                                                        <dxe:ASPxTextBox ID="TxtCHPin" runat="server" ClientInstanceName="cTxtCHPin" Width="154px"
                                                            HorizontalAlign="right">
                                                            <MaskSettings Mask="<0..999999999>" />
                                                        </dxe:ASPxTextBox>
                                                    </div>
                                                </div>
                                                <div class="left" style="height: 30px">
                                                    <dxe:ASPxComboBox ID="ComboCHState" runat="server" ClientInstanceName="cComboCHState"
                                                        EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                        Width="150px">
                                                        <DropDownButton Text="State">
                                                        </DropDownButton>
                                                        <ClientSideEvents SelectedIndexChanged="function(s,e){OnStateChange('3')}" TextChanged="onClientChange">
                                                        </ClientSideEvents>
                                                    </dxe:ASPxComboBox>
                                                </div>
                                                <div id="DivStateCHOthr" class="left" style="height: 30px; margin-left: 2px">
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
                                            <div id="Row26_Col8" class="LFloat_Lable Leftdiv" style="height: 60px">
                                                Contact&nbsp; Details:
                                                <br />
                                                <span class="Spanclass"></span><span style="font-size: 8pt">[Mandatory to Give Atleast&nbsp;<br />
                                                    &nbsp; &nbsp; &nbsp;One Contact No ] <span style="font-size: 10pt; color: #ff0000">**</span></span>
                                            </div>
                                            <div id="Row26_Col9" class="LFloat_Row FontChange" style="width: 60%">
                                                <div class="left" style="width: 99%">
                                                    <div class="left" style="height: 25px">
                                                        &nbsp; &nbsp;&nbsp; Tel(Off) &nbsp;:
                                                    </div>
                                                    <div class="left" style="height: 25px">
                                                        <dxe:ASPxTextBox ID="TxtCHTelOfc" runat="server" ClientInstanceName="cTxtCHTelOfc"
                                                            MaxLength="11" HorizontalAlign="Right" Width="136px">
                                                            <MaskSettings Mask="<0..99999999999>" />
                                                            <ClientSideEvents LostFocus="function(s, e) {CheckTheLeast(cTxtCHTelOfc.GetText());}" />
                                                        </dxe:ASPxTextBox>
                                                    </div>
                                                    <div class="left" style="height: 25px">
                                                        &nbsp;Tel(Res) :
                                                    </div>
                                                    <div class="left" style="height: 25px">
                                                        <dxe:ASPxTextBox ID="TxtCHTelRes" runat="server" ClientInstanceName="cTxtCHTelRes"
                                                            MaxLength="11" HorizontalAlign="Right" Width="125px">
                                                            <MaskSettings Mask="<0..99999999999>" />
                                                            <ClientSideEvents LostFocus="function(s, e) {CheckTheLeast(cTxtCHTelRes.GetText());}" />
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
                                                            <ClientSideEvents LostFocus="function(s, e) {CheckTheLeast(cTxtCHMobileNo.GetText());}" />
                                                        </dxe:ASPxTextBox>
                                                    </div>
                                                </div>
                                                <div class="left" style="height: 25px">
                                                    &nbsp; &nbsp; Email ID :
                                                </div>
                                                <div class="left" style="height: 25px">
                                                    <dxe:ASPxTextBox ID="TxtCHEmlID" runat="server" ClientInstanceName="cTxtCHEmlID"
                                                        Width="300px">
                                                        <ClientSideEvents LostFocus="function(s, e) {verifyEmail(cTxtCHEmlID);}" />
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
                                                <br class="clear" />
                                            </div>
                                            <div class="Row">
                                                <div id="Row26_Col13" class="LFloat_Lable Leftdiv">
                                                    IPV Details:
                                                </div>
                                                <div id="Row26_Col14" class="LFloat_Row FontChange" style="height: 60px; width: 60%;">
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
                                            <div class="Row" style="margin-top: 30px;">
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
                                            <div id="Div_GVCHrecord" style="float: left; padding-top: 10px; width: 770px; margin-top: 10px;
                                                margin-left: 164px; margin-bottom: 10px;" align="center">
                                                <div id="divComp_PartnerGVWInfo" class="left" style="margin-right: 12px;">
                                                    <img id="divComp_PartnerInfo" src="../CentralData/Images/info.png" style="background-repeat: no-repeat;
                                                        width: 32px; height: 32px; cursor: pointer;" alt="" />
                                                </div>
                                                <div id="divComp_PartnerGvw" class="Content left" style="width: 706px;">
                                                    <dxwgv:ASPxGridView ID="GvCHRecord" runat="server" Settings-ShowHorizontalScrollBar="true"
                                                        AutoGenerateColumns="False" KeyFieldName="RowID" Width="700px" Font-Size="Small"
                                                        ClientInstanceName="cGvCHRecord" OnCustomCallback="GvCHRecord_CustomCallback"
                                                        OnHtmlEditFormCreated="GvCHRecord_HtmlEditFormCreated" OnRowDeleting="GvCHRecord_RowDeleting">
                                                        <ClientSideEvents EndCallback="function (s, e) {GvCHRecord_EndCallBack();}" />
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
                                                                Width="120px">
                                                                <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                                                </CellStyle>
                                                            </dxwgv:GridViewDataTextColumn>
                                                            <dxwgv:GridViewDataTextColumn Caption="State" FieldName="State" VisibleIndex="10"
                                                                Width="150px">
                                                                <CellStyle CssClass="gridcellleft" Font-Size="11px">
                                                                </CellStyle>
                                                            </dxwgv:GridViewDataTextColumn>
                                                            <dxwgv:GridViewDataTextColumn Caption="City" FieldName="City" VisibleIndex="11" Width="120px">
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
                                                                Width="70px">
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
                                                                                <dxe:ASPxTextBox ID="txtRPPrefixE" Text='<%# Bind("KYCDetail_RPersonPrefix") %>'
                                                                                    runat="server" ClientInstanceName="ctxtRPPrefixE" Width="100px">
                                                                                </dxe:ASPxTextBox>
                                                                                <span style="font-size: 8pt">[Prefix]</span>
                                                                            </div>
                                                                            <div id="Row26_Col11BE" class="LFloat_Row BtmMargin" style="height: 38px; text-align: center;">
                                                                                <dxe:ASPxTextBox ID="TxtCHNameE" runat="server" ClientInstanceName="cTxtCHName" Width="400px"
                                                                                    Text='<%# Bind("Name") %>'>
                                                                                </dxe:ASPxTextBox>
                                                                                <span style="font-size: 8pt">[First Name]</span>
                                                                            </div>
                                                                            <div id="Row26_Col11CE" class="LFloat_Row DivName" style="height: 38px;">
                                                                                <dxe:ASPxTextBox ID="txtRPMiddleNameE" Text='<%# Bind("KYCDetail_RPersonMiddleName") %>'
                                                                                    runat="server" ClientInstanceName="ctxtRPMiddleNameE" HorizontalAlign="left"
                                                                                    Width="100px">
                                                                                </dxe:ASPxTextBox>
                                                                                <span style="font-size: 8pt">[Middle Name]</span>
                                                                            </div>
                                                                            <div id="Row26_Col11DE" class="LFloat_Row DivName" style="height: 38px;">
                                                                                <dxe:ASPxTextBox ID="txtRPLastNameE" Text='<%# Bind("KYCDetail_RPersonLastName") %>'
                                                                                    runat="server" ClientInstanceName="ctxtRPLastNameE" HorizontalAlign="left" Width="100px">
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
                                                                                <span class="Spanclass"></span>Name Of The Related Related Person's Father/Spouse
                                                                                Name:<span style="font-size: 10pt; color: #ff0000">**</span>
                                                                            </div>
                                                                            <div id="EDiv60" class="LFloat_Row BtmMargin" style="height: 38px; text-align: center;">
                                                                                <dxe:ASPxTextBox ID="txtRPFatherPrefixE" Text='<%# Bind("KYCDetail_RPersonFatherPrefix") %>'
                                                                                    runat="server" ClientInstanceName="ctxtRPFatherPrefixE" Width="100px">
                                                                                </dxe:ASPxTextBox>
                                                                                <span style="font-size: 8pt">[Prefix]</span>
                                                                            </div>
                                                                            <div id="EDiv61" class="LFloat_Row BtmMargin" style="height: 38px; text-align: center;">
                                                                                <dxe:ASPxTextBox ID="txtRPFatherFirstNameE" Text='<%# Bind("KYCDetail_RPersonFatherFirstName") %>'
                                                                                    runat="server" ClientInstanceName="ctxtRPFatherFirstNameE" Width="100px">
                                                                                </dxe:ASPxTextBox>
                                                                                <span style="font-size: 8pt">[First Name]</span>
                                                                            </div>
                                                                            <div id="EDiv62" class="LFloat_Row DivName" style="height: 38px;">
                                                                                <dxe:ASPxTextBox ID="txtRPFatherMiddleNameE" Text='<%# Bind("KYCDetail_RPersonFatherMiddle") %>'
                                                                                    runat="server" ClientInstanceName="ctxtRPFatherMiddleNameE" HorizontalAlign="left"
                                                                                    Width="100px">
                                                                                </dxe:ASPxTextBox>
                                                                                <span style="font-size: 8pt">[Middle Name]</span>
                                                                            </div>
                                                                            <div id="EDiv63" class="LFloat_Row DivName" style="height: 38px;">
                                                                                <dxe:ASPxTextBox ID="txtRPFatherLastNameE" Text='<%# Bind("KYCDetail_RPersonFatherLastName") %>'
                                                                                    runat="server" ClientInstanceName="ctxtRPFatherLastName" HorizontalAlign="left"
                                                                                    Width="100px">
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
                                                                                <dxe:ASPxTextBox ID="txtRPMotherPrefixE" Text='<%# Bind("KYCDetail_RPersonMotherPrefix") %>'
                                                                                    runat="server" ClientInstanceName="ctxtRPMotherPrefixE" Width="100px">
                                                                                </dxe:ASPxTextBox>
                                                                                <span style="font-size: 8pt">[Prefix]</span>
                                                                            </div>
                                                                            <div id="EDiv56" class="LFloat_Row BtmMargin" style="height: 38px; text-align: center;">
                                                                                <dxe:ASPxTextBox ID="txtRPMotherFirstNameE" Text='<%# bind("KYCDetail_RPersonMotherFirstName") %>'
                                                                                    runat="server" ClientInstanceName="ctxtRPMotherFirstNameE" Width="100px">
                                                                                </dxe:ASPxTextBox>
                                                                                <span style="font-size: 8pt">[First Name]</span>
                                                                            </div>
                                                                            <div id="EDiv57" class="LFloat_Row DivName" style="height: 38px;">
                                                                                <dxe:ASPxTextBox ID="txtRPMotherMiddleNameE" Text='<%# Bind("KYCDetail_RPersonMotherMiddle") %>'
                                                                                    runat="server" ClientInstanceName="ctxtRPMotherMiddleNameE" HorizontalAlign="left"
                                                                                    Width="100px">
                                                                                </dxe:ASPxTextBox>
                                                                                <span style="font-size: 8pt">[Middle Name]</span>
                                                                            </div>
                                                                            <div id="EDiv58" class="LFloat_Row DivName" style="height: 38px;">
                                                                                <dxe:ASPxTextBox ID="txtRPMotherLastNameE" Text='<%# Bind("KYCDetail_RPersonMotherLastName") %>'
                                                                                    runat="server" ClientInstanceName="txtRPMotherLastNameE" HorizontalAlign="left"
                                                                                    Width="100px">
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
                                                                            <div id="Row26_Col7E" class="LFloat_Row" style="width: 20%">
                                                                                <div style="margin-bottom: 2px">
                                                                                    <dxe:ASPxTextBox ID="TxtCHAddress1E" runat="server" ClientInstanceName="cTxtCHAddress1E"
                                                                                        NullText="                                           House No" ForeColor="Silver"
                                                                                        HorizontalAlign="left" Width="350px" Text='<%# Bind("Address1") %>'>
                                                                                        <ClientSideEvents TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                                                                        </ClientSideEvents>
                                                                                    </dxe:ASPxTextBox>
                                                                                </div>
                                                                                <div style="margin-bottom: 2px">
                                                                                    <dxe:ASPxTextBox ID="TxtCHAddress2E" runat="server" ClientInstanceName="cTxtCHAddress2E"
                                                                                        NullText="                                           Street Name" ForeColor="Silver"
                                                                                        HorizontalAlign="left" Width="350px" Text='<%# Bind("Address2") %>'>
                                                                                        <ClientSideEvents TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                                                                        </ClientSideEvents>
                                                                                    </dxe:ASPxTextBox>
                                                                                </div>
                                                                                <div style="margin-bottom: 5px">
                                                                                    <dxe:ASPxTextBox ID="TxtCHAddress3E" runat="server" ClientInstanceName="cTxtCHAddress3E"
                                                                                        NullText="                                           Area Name" ForeColor="Silver"
                                                                                        HorizontalAlign="left" Width="350px" Text='<%# Bind("Address3") %>'>
                                                                                        <ClientSideEvents TextChanged="function(s,e){ s.inputElement.style.color = '#000000';}">
                                                                                        </ClientSideEvents>
                                                                                    </dxe:ASPxTextBox>
                                                                                </div>
                                                                                <div class="left" style="width: 99%; margin-bottom: 2px">
                                                                                    <div class="left" style="height: 25px">
                                                                                        City/Town/Village :
                                                                                    </div>
                                                                                    <div class="left" style="height: 25px">
                                                                                        <dxe:ASPxComboBox ID="ComboCHCityE" runat="server" ClientInstanceName="cComboCHCityE"
                                                                                            EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                                                            Width="150px">
                                                                                            <ClientSideEvents SelectedIndexChanged="function(s,e){OnTypeChange()}" TextChanged="onClientChange">
                                                                                            </ClientSideEvents>
                                                                                        </dxe:ASPxComboBox>
                                                                                    </div>
                                                                                    <div class="left" style="height: 25px">
                                                                                        &nbsp; &nbsp;PinCode :
                                                                                    </div>
                                                                                    <div class="left" style="height: 25px">
                                                                                        <dxe:ASPxTextBox ID="TxtCHPinE" runat="server" ClientInstanceName="cTxtCHPinE" Width="130px"
                                                                                            HorizontalAlign="right" Text='<%# Bind("PIN") %>'>
                                                                                            <MaskSettings Mask="<0..999999999>" />
                                                                                        </dxe:ASPxTextBox>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="left" style="height: 25px">
                                                                                    <dxe:ASPxComboBox ID="ComboCHStateE" runat="server" ClientInstanceName="cComboCHStateE"
                                                                                        EnableIncrementalFiltering="True" Font-Size="Small" SelectedIndex="0" ValueType="System.String"
                                                                                        Width="150px">
                                                                                        <DropDownButton Text="State">
                                                                                        </DropDownButton>
                                                                                        <ClientSideEvents SelectedIndexChanged="function(s,e){OnTypeChange()}" TextChanged="onClientChange">
                                                                                        </ClientSideEvents>
                                                                                    </dxe:ASPxComboBox>
                                                                                </div>
                                                                                <div id="DivStateCHOthrE" class="left" style="height: 30px; margin-left: 2px">
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
                                                                            <div id="Row26_Col9" class="LFloat_Row" style="width: 20%">
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
                                                                                    EnableIncrementalFiltering="True" Font-Size="12px" ValueType="System.String"
                                                                                    Width="130px" Height="25px">
                                                                                    <%--Value='<%#  Bind("RelationshipApli") %>'--%>
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
                                                                                                <DropDownButton Text="ContactType">
                                                                                                </DropDownButton>
                                                                                            </dxe:ASPxComboBox>
                                                                                        </div>
                                                                                        <div class="left LeftMargin" style="height: 25px">
                                                                                            Select Name:&nbsp;
                                                                                            <asp:TextBox ID="TxtCHIPVbyE" runat="server" Width="130px" Text='<%# Bind("IPVDoneBy") %>'></asp:TextBox>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="left" style="height: 25px">
                                                                                        &nbsp;IPV Date&nbsp; :
                                                                                    </div>
                                                                                    <div class="left" style="height: 25px">
                                                                                        <dxe:ASPxDateEdit ID="CHIpvDtE" TabIndex="0" runat="server" Width="150px" ClientInstanceName="cCHIpvDtE"
                                                                                            Font-Size="11px" UseMaskBehavior="True" EditFormatString="dd-MM-yyyy" EditFormat="Custom"
                                                                                            DateOnError="Today" Text='<%# Bind("IPVDate") %>'>
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
                                                                                <dxe:ASPxCheckBox ID="chkKYCDetail_ContrllingPerson" runat="server" Checked="true">
                                                                                </dxe:ASPxCheckBox>
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
                                                EnableIncrementalFiltering="True" Font-Size="12px" SelectedIndex="2" ValueType="System.String"
                                                Width="150px">
                                                <ClientSideEvents SelectedIndexChanged="function(s,e){ComboAttchShowDelDoc();}" />
                                                <Items>
                                                    <dxe:ListEditItem Text="Add Attachments" Value="0" />
                                                    <dxe:ListEditItem Text="Delete Attachments " Value="1" />
                                                    <dxe:ListEditItem Text="Verify Attachments " Value="2" />
                                                </Items>
                                            </dxe:ASPxComboBox>
                                        </div>
                                        <div id="Row26_Col19" class="left" style="font-size: 12pt;">
                                            <div class="left">
                                                <dxe:ASPxButton ID="btnDocument" runat="server" AutoPostBack="false" TabIndex="0"
                                                    Width="40px" ClientInstanceName="cbtnDocument" BackColor="Transparent" Height="40px"
                                                    ToolTip="Click To Attach Documents">
                                                    <ClientSideEvents Click="function(s, e) {Attach_Show_DeleteDoc_Click();}" />
                                                    <Border BorderColor="Transparent" BorderStyle="None" />
                                                    <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/attach.png"
                                                        Repeat="NoRepeat" />
                                                </dxe:ASPxButton>
                                            </div>
                                            <div class="left">
                                                <span style="font-size: 8pt; color: Red">** Atleast 3 Mandatory Documents Required</span>
                                            </div>
                                        </div>
                                        <div id="div_PartnerDoc" class="Row">
                                            <div id="Row260_Col17" class="LFloat_Lable Leftdiv" style="height: 80px; margin-bottom: 25px;">
                                                <span style="font-size: 10pt; color: #ff0000"></span>Attach Related Documents of
                                                Promoters\ Partners\ Karta \Trustees And Whole Time Directors: <span style="font-size: 10pt;
                                                    color: #ff0000">**</span></div>
                                            <div id="Row260_Col18" class="LFloat_Row" style="height: 25px">
                                                <dxe:ASPxComboBox ID="ComboPrtnrDocuments" runat="server" ClientInstanceName="cComboPrtnrDocuments"
                                                    EnableIncrementalFiltering="True" Font-Size="12px" SelectedIndex="2" ValueType="System.String"
                                                    Width="150px">
                                                    <ClientSideEvents SelectedIndexChanged="function(s,e){ComboAttchShowDelPrtnrDoc();}" />
                                                    <Items>
                                                        <dxe:ListEditItem Text="Add Attachments" Value="0" />
                                                        <dxe:ListEditItem Text="Delete Attachments " Value="1" />
                                                        <dxe:ListEditItem Text="Verify Attachments " Value="2" />
                                                    </Items>
                                                </dxe:ASPxComboBox>
                                            </div>
                                            <div id="Row260_Col19" class="left" style="margin-left: 4px;" onclick="return Row260_Col19_onclick()">
                                                <dxe:ASPxButton ID="btnAddDocumentPrtner" runat="server" AutoPostBack="false" TabIndex="0"
                                                    ToolTip="Click To Attach Documents" Width="40px" ClientInstanceName="cbtnAddDocumentPrtner"
                                                    BackColor="Transparent" Height="40px">
                                                    <ClientSideEvents Click="function(s, e) {Attach_Show_DeletePrtnrDoc_Click();}" />
                                                    <Border BorderColor="Transparent" BorderStyle="None" />
                                                    <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/attach.png"
                                                        Repeat="NoRepeat" />
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
                                                <Border BorderColor="Transparent" BorderStyle="None" />
                                                <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/blue_save.png"
                                                    Repeat="NoRepeat" />
                                            </dxe:ASPxButton>
                                        </div>
                                        <div id="divOthrDtlEdit" class="left BtmMargin" style="font-size: 12pt; float: right;
                                            width: 20%;">
                                            <dxe:ASPxButton ID="BtnEditOthrDtl" runat="server" AutoPostBack="false" TabIndex="0"
                                                ToolTip="Edit Other Details" Width="66px" ClientInstanceName="cBtnEditOthrDtl"
                                                BackColor="Transparent" Height="60px">
                                                <ClientSideEvents Click="function(s, e) {EditOthrDtl();}" />
                                                <Border BorderColor="Transparent" BorderStyle="None" />
                                                <BackgroundImage HorizontalPosition="center" ImageUrl="~/CentralData/Images/Edit.jpg"
                                                    Repeat="NoRepeat" />
                                            </dxe:ASPxButton>
                                        </div>
                                        <div class="left" style="font-size: 12pt; float: right; margin-left: 10px">
                                            <dxe:ASPxButton ID="BtnOthrDtlPrvs" runat="server" AutoPostBack="false" TabIndex="0"
                                                Text="" ToolTip="Back To AddressDetails" Width="66px" ClientInstanceName="cBtnOthrDtlPrvs"
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
                                            Other Details Section Submitted Successfully !!</div>
                                        <br />
                                        <br />
                                    </div>
                                    <div runat="server" style="display: none">
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
            <dxcp:ASPxCallbackPanel ID="CbpCompare" runat="server" ClientInstanceName="cCbpCompare"
                OnCallback="CbpCompare_Callback" BackColor="Transparent">
                <PanelCollection>
                    <dxp:PanelContent runat="server">
                    </dxp:PanelContent>
                </PanelCollection>
                <ClientSideEvents EndCallback="function (s, e) {CbpCompare_EndCallBack();}" />
            </dxcp:ASPxCallbackPanel>
        </div>
        <div id="Row27" style="float: left; width: 100%; text-align: center; margin-bottom: 10px;">
            <div class="left" style="width: 49%; text-align: right;">
                <dxe:ASPxButton AccessKey="S" ID="btnSave" TabIndex="0" runat="server" Width="130px"
                    ToolTip="Click To Submit The Whole Entered  Data." Text="[S]ubmit" AutoPostBack="false">
                    <Border BorderColor="White"></Border>
                    <ClientSideEvents Click="function(s, e) {SaveButtonClick();}"></ClientSideEvents>
                </dxe:ASPxButton>
            </div>
        </div>
        <br />
    </div>
    </form>
</body>
</html>
