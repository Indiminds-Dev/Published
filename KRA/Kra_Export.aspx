<%@ page language="C#" autoeventwireup="true" inherits="KRA_Kra_Export, App_Web_fok8amxh" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>KRA EXPORT</title>
    <!--External Scripts file-->
    <!--Other Script-->

    <script type="text/javascript" src="../CentralData/JSScript/GenericJScript.js"></script>

    <link type="text/css" href="../CentralData/CSS/GenericCss.css" rel="Stylesheet" />
    <!--JS Inline Method-->
    <style type="text/css">
        #MainFull
        {
            padding: 5px;
        }
        #Container1
        {
            width: 520px;
        }
        .SplitCont
        {
            height: 200px;
            overflow-y: scroll;
        }
        .tab
        {
            border: 1px solid #555;
            padding: 5px;
            vertical-align: bottom;
            background-color: #ddd;
            float: left;
        }
        .tab-Selected
        {
            border: 1px solid #555;
            padding: 7px;
            vertical-align: bottom;
            background-color: #aeaeae; ;float:left;}
        .LableWidth
        {
            width: 130px;
        }
        .ContentWidth
        {
            width: 170px;
            height: 21px;
        }
        .labelCont
        {
            font-size: 13px;
            margin-top: 7px;
        }
        .btnRight
        {
            margin-right: 18px;
            float: right;
        }
        .txt_left
        {
            text-align: left;
        }
        .txt_right
        {
            text-align: right;
        }
        .Row
        {
            margin-bottom: 25px;
            clear: both;
        }
        .lable_left
        {
            float: left;
            border: solid 1px #aaa;
            padding: 2px;
            height: 18px;
            width: 200px;
            margin-right: 10px;
            font-size: 12px;
            line-height: 18px;
        }
        .content_left
        {
            float: left;
            margin-right: 3px;
            border: solid 1px #aaa;
            padding: 2px 10px 2px 10px;
            background-color: #FFD4AA;
            height: 18px;
            line-height: 18px;
        }
    </style>

    <script language="javascript" type="text/javascript">
        String.prototype.repeat = function(count) {
            if (count < 1) return '';
            var result = '', pattern = this.valueOf();
            while (count > 0) {
                if (count & 1) result += pattern;
                count >>= 1, pattern += pattern;
            }
            return result;
        };
        function message(msg) {
            alert(msg + ' has already using this routine.\nMore than one user can not use this routine at a time !! ');

            cBtnupdate.SetText(msg + ' has already using this routine.More than one user can not use this Export at a time');
            cBtnupdate.SetEnabled(false);
        }
        function PageLoad() {
            HideShow('Row0', 'S');
            HideShow('Row3', 'S');
            HideShow('Row4', 'S');
            HideShow('Row6', 'S');
            HideShow('Row11', 'H');

            HideShow('row3_colverify', 'H');



        }
        function SignOff() {
            window.parent.SignOff()
        }
        function height() {
            if (document.body.scrollHeight >= 600)
                window.frameElement.height = document.body.scrollHeight;
            else
                window.frameElement.height = '600px';
            window.frameElement.Width = document.body.scrollWidth;
        }

        var batchnumber
        var RowID
        var totrecord
        var totcnt
        var updatebatchnumber
        function OnGridFocusedRowChanged() {

            cGvAuthRecord.GetSelectedFieldValues('kycmain_id', OnGetRowValues);

        }
        function OnGetRowValues(values) {

            RowID = 'n';
            for (var j = 0; j < values.length; j++) {
                if (RowID != 'n')
                    RowID += ',' + values[j];
                else

                    RowID = values[j];

            }

        }

        function ExportTypeChangebse(val, txt) {
            var finalval;
            if (val.toUpperCase() == 'NDML') {
                finalval = 'Intermediary Role' + '~' + txt;
                cddlimtype.SetEnabled(true);
            }
            if (val.toUpperCase() == 'DOTEX') {
                finalval = 'Intermediary Type' + '~' + txt;
                cddlimtype.SetEnabled(true);
            }
            if (val.toUpperCase() == 'CVL' || val.toUpperCase() == 'CKYC')
                cddlimtype.SetEnabled(false);
            else {
                cddlimtype.PerformCallback(finalval);
                cddlimtype.SetEnabled(true);
            }

        }
        function cddlimtype_EndCallback() {


        }

        function OnAllCheckedChanged(s, e) {

            if (s.GetChecked())
                cGvAuthRecord.SelectRows();
            else
                cGvAuthRecord.UnselectRows();


        }

        function BtnShow_Click() {
            GetObjectID('hdngridbindornot').value = "";
            HideShow('Row0', 'S');
            HideShow('Row3', 'S');
            HideShow('Row4', 'S');
            HideShow('Row6', 'S');
            HideShow('Row11', 'H');
            HideShow('row3_colverify', 'H');
            cCmbRecordChoser.SetValue("U");
            HideShow('divbuton', 'S');
            cGvAuthRecord.PerformCallback("Show");

        }

        function btncancelpopup_Click() {
            cpopup_export.Hide();
            cCmbRecordChoser.SetValue("U");
            cGvAuthRecord.PerformCallback("Show");

        }
        function btnnext_Click() {
            GetObjectID('hdngridbindornot').value = "";
            if (RowID == undefined || RowID == 'n')
                alert('Please Select Atleast one Item !!..');
            else
                cGvAuthRecord.PerformCallback("Next");
        }
        function GvAuthRecord_EndCallBack() {
            cBtnupdate.SetEnabled(true);
            GetObjectID('hdngridbindornot').value = "";
            if (cGvAuthRecord.cpexportidentifier == "open") {
                cpopup_export.ShowAtPos(5, 400);
                HideShow('Row9', 'S');
                HideShow('Row10', 'S');
                HideShow('Row12', 'H');
                HideShow('row3_colverify', 'H');
            }
            if (cGvAuthRecord.cpEmpty == "nullvalue") {
                HideShow('Row0', 'S');
                HideShow('Row4', 'S');
                HideShow('Row3', 'S');
                HideShow('row3_colverify', 'H');
            }
            if (cGvAuthRecord.cpEmptyoth == "nullvalue")
            { }
            if (cGvAuthRecord.cpvalidate == "imidnotexist") {
                HideShow('row3_colverify', 'S');
                cBtnupdate.SetEnabled(false);
            }
            if ((cGvAuthRecord.cptotaldoc != null) && (cGvAuthRecord.cpexportdoc != null)) {

                totrecord = cGvAuthRecord.cptotaldoc;
                totcnt = cGvAuthRecord.cpexportdoc;
                GetObjectID('<%=B_cptotaldoc.ClientID %>').innerHTML = totrecord;
                GetObjectID('<%=B_cpexportdoc.ClientID %>').innerHTML = totcnt;

                HideShow('divtxtauto', 'S');
                HideShow('divtxttext', 'S');
                ctxtmanualbatch.SetEnabled(false);
                ctxtmanualbatch.SetText('');
                GetObjectID('<%=chkparamucc.ClientID %>').checked = false;

            }
            if (cGvAuthRecord.cpbatchnumber != null) {
                GetObjectID('<%=B_auto.ClientID %>').innerHTML = cGvAuthRecord.cpbatchnumber;
                GetObjectID('hdnbatch').value = cGvAuthRecord.cpbatchnumber;
            }
            height();

        }
        function ShowHideFilter(obj) {
            if (obj == "back")
                window.location = "../KRA/Kra_Export.aspx";
            else {
                cGvAuthRecord.PerformCallback(obj);
                cBatchCancelGrid.PerformCallback(obj);
            }
        }



        function CmbRecordChoser_change(Val) {
            height();
            cBtnupdate.SetEnabled(true);
            GetObjectID('hdngridbindornot').value = "";
            if (Val == 'A') {
                HideShow('Row6', 'H');
                HideShow('Row11', 'S');
                HideShow('divbuton', 'H');
                HideShow('row3_colverify', 'H');
                cBatchCancelGrid.PerformCallback("Show~");
            }
            else {
                HideShow('Row6', 'S');
                HideShow('Row11', 'H');
                HideShow('divbuton', 'S');
                HideShow('row3_colverify', 'H');

                cGvAuthRecord.PerformCallback(Val);
            }
        }
        function fn_linkMouseOver(obj) {
            GetObjectID(obj).style.borderLeft = '1px solid #aaa';
            GetObjectID(obj).style.borderTop = '1px solid #aaa';
            GetObjectID(obj).style.borderRight = '1px solid #aaa';
            GetObjectID(obj).style.borderBottom = '1px solid #aaa';
        }
        function fn_linkMouseOut(obj) {
            GetObjectID(obj).style.border = 'none';
        }
        function divshowhide() {
            if (cddlExportType.GetText().toUpperCase() != 'DOTEX')
                ctxtmanualbatch.GetInputElement().maxLength = 8;
            else
                ctxtmanualbatch.GetInputElement().maxLength = 3;

            if (GetObjectID('<%=chkparamucc.ClientID %>').checked == true) {
                HideShow('divtxtauto', 'H');
                HideShow('divtxttext', 'H');
                ctxtmanualbatch.SetEnabled(true);

            }
            else {
                HideShow('divtxtauto', 'S');
                HideShow('divtxttext', 'S');
                ctxtmanualbatch.SetEnabled(false);
                ctxtmanualbatch.SetText('');
            }
        }
        function openpopupgridc(partnerid) {
            cgridpartner.PerformCallback(partnerid);
        }

        function openpopupgrid(cancelbatchnumber, noofclient) {
            GetObjectID('<%=sapn_totalcancelbatch.ClientID %>').innerHTML = noofclient;
            batchnumber = cancelbatchnumber;
            cpopup_export.ShowAtPos(5, 400);
            HideShow('Row9', 'H');
            HideShow('Row10', 'H');
            HideShow('Row12', 'S');
            height();
        }

        function btnno_Click() {
            cpopup_export.Hide();
            height();
        }

        function btnyes_Click() {
            cCbpSuggestdocument.PerformCallback("Cancelbatch~" + batchnumber);
        }

        function CbpSuggestdocument_EndCallBack() {
            if (cCbpSuggestdocument.cpcancelbatch == 'successfullycancel') {
                cpopup_export.Hide();
                GetObjectID('hdngridbindornot').value = "cancel";
                cBatchCancelGrid.Refresh();
            }
            if (cCbpSuggestdocument.cpdownload == 'downloadcomplete') {
                cpopup_export.Hide();
                GetObjectID('hdnbatchnumber').value = updatebatchnumber;
                GetObjectID('BtnForExportEvent').click();
                GetObjectID('hdngridbindornot').value = updatebatchnumber;
                cGvAuthRecord.Refresh();
            }
            if (cCbpSuggestdocument.cperror == 'batchexists') {
                alert('This batch number Already Exists !!');
                cpopup_export.Hide();
            }

            if (cCbpSuggestdocument.cpclose == 'Close') {
                cpopup_export.Hide();
            }
            if (cCbpSuggestdocument.cpbatchexist == 'Exist') {
                alert('Batch No already Exists!please try another');
                GetObjectID('<%=B_cptotaldoc.ClientID %>').innerHTML = totrecord;
                GetObjectID('<%=B_cpexportdoc.ClientID %>').innerHTML = totcnt;
                HideShow('divtxtauto', 'H');
                HideShow('divtxttext', 'H');
                HideShow('Row12', 'H');
                ctxtmanualbatch.SetEnabled(true);
                ctxtmanualbatch.SetText('');
                GetObjectID('<%=chkparamucc.ClientID %>').checked = true;
            }
            height();

        }


        function gridpartner_EndCallBack() {
            GetObjectID('hdngridbindornot').value = "";
            if (cgridpartner.cpopencontrol != null)
                cPopUp_ScripAlert.ShowAtPos(5, 400);
            height();
        }

        function btnproceed_Click() {
            height();
            GetObjectID('hdngridbindornot').value = "";
            if (GetObjectID('<%=chkparamucc.ClientID %>').checked == false) {
                updatebatchnumber = GetObjectID('<%=B_auto.ClientID %>').innerHTML;
                cCbpSuggestdocument.PerformCallback("Export~" + updatebatchnumber);
            }
            else {

                var txtbatch = ctxtmanualbatch.GetText();
                if (txtbatch.trim().length == 0) {
                    alert('Please Type Batch Number !!')
                }
                else if (parseInt(txtbatch.trim()) == 0) {
                    alert('Invalid Batch Number !!')
                }

                else {
                    if (cddlExportType.GetText().toUpperCase() != 'DOTEX') {
                        if (txtbatch.length < 8) {
                            var Zero = '0';
                            updatebatchnumber = Zero.repeat(8 - txtbatch.length) + txtbatch;
                            GetObjectID('hdnbatchnumber').value = updatebatchnumber;
                            cCbpSuggestdocument.PerformCallback("Export~" + updatebatchnumber);
                        }
                        else {
                            updatebatchnumber = txtbatch;
                            GetObjectID('hdnbatchnumber').value = updatebatchnumber;
                            cCbpSuggestdocument.PerformCallback("Export~" + updatebatchnumber);
                        }
                    }
                    else {
                        if (txtbatch.length < 3) {
                            var Zero = '0';
                            updatebatchnumber = Zero.repeat(3 - txtbatch.length) + txtbatch;
                            GetObjectID('hdnbatchnumber').value = updatebatchnumber;
                            cCbpSuggestdocument.PerformCallback("Export~" + updatebatchnumber);
                        }
                        else {
                            updatebatchnumber = txtbatch;
                            GetObjectID('hdnbatchnumber').value = updatebatchnumber;
                            cCbpSuggestdocument.PerformCallback("Export~" + updatebatchnumber);
                        }

                    }


                }

            }

        }

        function cbatchcancelgrid_EndCallBack() {
            height();
        }

        function ShowHideFilterLast(obj) {
            if (obj == 'export') {
                if (document.getElementById('invalid').disabled == false) {
                    GetObjectID('hdnexcel').value = 'excel';
                    GetObjectID('BtnForExportEvent1').click();

                }
                else
                    alert('You dont Have Any Error Record To Show !!');

            }
            if (obj == 'download') {
                cGvAuthRecord.Refresh();
                if (document.getElementById('download').disabled == false)
                    GetObjectID('BtnForExportEvent').click();
                else
                    alert('You dont Have Any Record To Download !!');


            }
        }
        function cddlcompanytype_EndCallback() {
            height();
        }
    </script>

</head>
<body>
    <%--style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">--%>
    <form id="form1" runat="server" autocomplete="off">
    <div id="MainFull">
        <div id="Header" class="Header">
            KRA EXPORT</div>
        <div id="Row0" class="Row">
            <div id="Container1" class="container">
                <div id="Row1">
                    <div id="Row1_Col1" class="LFloat_Lable LableWidth">
                        Date</div>
                    <div id="Row1_Col2" class="LFloat_Content ContentWidth">
                        <dxe:ASPxDateEdit ID="dtDate" runat="server" EditFormat="Custom" ClientInstanceName="dtDate"
                            EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" DateOnError="Today">
                            <DropDownButton Text="Application From ">
                            </DropDownButton>
                        </dxe:ASPxDateEdit>
                    </div>
                    <div id="Row1_Col3" class="LFloat_Content ContentWidth">
                        <dxe:ASPxDateEdit ID="dtToDate" runat="server" EditFormat="Custom" ClientInstanceName="dtToDate"
                            EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" DateOnError="Today">
                            <DropDownButton Text="Application To">
                            </DropDownButton>
                        </dxe:ASPxDateEdit>
                    </div>
                </div>
                <span class="clear" style="height: 5px;">&nbsp;</span>
                <div id="Row3_additional1" class="Row">
                    <div id="Row3__col1_additional1" class="LFloat_Lable LableWidth">
                        Select Company</div>
                    <div id="Row2_company" class="LFloat_Content ContentWidth">
                        <dxe:ASPxComboBox ID="ddlcompanytype" Width="160px" runat="server" Font-Size="13px"
                            ValueType="System.String" ClientInstanceName="cddlcompanytype" Font-Bold="False"
                            SelectedIndex="0" TabIndex="0">
                            <Items>
                                <%--<dxe:ListEditItem Text="NDML" Value="NDML" />OnCallback="cddlcompanytype_Callback"
                                        <dxe:ListEditItem Text="CVL" Value="CVL" />
                                        <dxe:ListEditItem Text="DOTEX" Value="DOTEX" />--%>
                            </Items>
                            <ClientSideEvents EndCallback="cddlcompanytype_EndCallback" />
                            <Paddings PaddingBottom="0px"></Paddings>
                        </dxe:ASPxComboBox>
                    </div>
                    <br class="clear" />
                </div>
                <span class="clear" style="height: 5px;">&nbsp;</span>
                <div id="Row2" class="Row">
                    <div id="Row2_Col1" class="LFloat_Lable LableWidth">
                        Client Type</div>
                    <div id="Row2_Col2" class="LFloat_Content ContentWidth">
                        <dxe:ASPxComboBox ID="ddlClientType" Width="160px" runat="server" Font-Size="13px"
                            ValueType="System.String" ClientInstanceName="cddlAccountType" Font-Bold="False"
                            SelectedIndex="0" TabIndex="0">
                            <Items>
                                <dxe:ListEditItem Text="Individual" Value="I" />
                                <dxe:ListEditItem Text="Non-Individual" Value="NI" />
                            </Items>
                            <%--<ClientSideEvents ValueChanged="function(s, e) {AccountTypeChange(s.GetValue());}" />--%>
                            <Paddings PaddingBottom="0px"></Paddings>
                        </dxe:ASPxComboBox>
                    </div>
                    <br class="clear" />
                </div>
                <br class="clear" />
                <div id="Row3" class="Row">
                    <div id="Row3_Col1" class="LFloat_Lable LableWidth">
                        Export Type</div>
                    <div id="Row3_Col2" class="LFloat_Content ContentWidth">
                        <dxe:ASPxComboBox ID="ddlExportType" Width="160px" runat="server" Font-Size="13px"
                            ValueType="System.String" ClientInstanceName="cddlExportType" Font-Bold="False"
                            SelectedIndex="0" TabIndex="0">
                            <Items>
                                <%--<dxe:ListEditItem Text="NDML" Value="NDML" />
                                    <dxe:ListEditItem Text="CVL" Value="CVL" />
                                    <dxe:ListEditItem Text="DOTEX" Value="DOTEX" />--%>
                            </Items>
                            <ClientSideEvents ValueChanged="function(s, e) {ExportTypeChangebse(s.GetText(),s.GetValue());}" />
                            <Paddings PaddingBottom="0px"></Paddings>
                        </dxe:ASPxComboBox>
                    </div>
                    <br class="clear" />
                </div>
                <br class="clear" />
                <div id="Row3_additional" class="Row">
                    <div id="Row3_Col1_additional" class="LFloat_Lable LableWidth">
                        Intermediary Type</div>
                    <div id="Row3_Col2_additional" class="LFloat_Content ContentWidth">
                        <dxe:ASPxComboBox ID="ddlimtype" Width="160px" runat="server" Font-Size="13px" ValueType="System.String"
                            ClientInstanceName="cddlimtype" Font-Bold="False" SelectedIndex="0" TabIndex="0"
                            OnCallback="cddlimtype_Callback">
                            <Items>
                                <%--<dxe:ListEditItem Text="NDML" Value="NDML" />
                                        <dxe:ListEditItem Text="CVL" Value="CVL" />
                                        <dxe:ListEditItem Text="DOTEX" Value="DOTEX" />--%>
                            </Items>
                            <ClientSideEvents EndCallback="cddlimtype_EndCallback" />
                            <Paddings PaddingBottom="0px"></Paddings>
                        </dxe:ASPxComboBox>
                    </div>
                    <br class="clear" />
                </div>
                <br class="clear" />
                <div id="row3_colverify" class="Error" style="margin-left: 50px; height: 1px;">
                    Before Export Please fill IntermediaryID for this company !!
                </div>
                <br class="clear" />
                <div id="Row4" class="Row btnRight">
                    <br class="clear" />
                    <dxe:ASPxButton ID="BtnShow" runat="server" AutoPostBack="False" Text="SHOW" Width="85px">
                        <ClientSideEvents Click="function (s, e) {BtnShow_Click();}" />
                    </dxe:ASPxButton>
                </div>
            </div>
        </div>
        <div id="Row5" class="Row">
            <div class="left" style="padding: 3px 0px 3px 3px; background-color: #eee; border: 1px solid #aaa;
                border-bottom: none; width: 996px;">
                <div class="left" style="margin-left: 5px; margin-right: 5px;" id="divbuton">
                    <center>
                        <dxe:ASPxButton ID="Btnupdate" ClientInstanceName="cBtnupdate" runat="server" AutoPostBack="False"
                            Text="&nbsp;&nbsp;&nbsp;&nbsp;Click to Ne[x]t&nbsp;&nbsp;&nbsp;&nbsp;" Font-Size="12px"
                            AccessKey="X">
                            <Paddings Padding="0"></Paddings>
                            <ClientSideEvents Click="function (s, e) {btnnext_Click();}" />
                        </dxe:ASPxButton>
                    </center>
                </div>
                <div class="paging LFloat_Lable" style="width: 40px; border: 1px solid white;" id="divimg1">
                    <center>
                        <a href="javascript:ShowHideFilter('s');">
                            <img id="Img2" alt="" src="../CentralData/Images/filteron.png" onmouseover="fn_linkMouseOver('divimg1')"
                                onmouseout="fn_linkMouseOut('divimg1')" title="Filter On" height="16px;" width="16px"
                                onclick="changevalueandpicture('su3')" style="border: none;" /></a>
                    </center>
                </div>
                <div class="paging LFloat_Lable" style="width: 40px; border: 1px solid white;" id="divimg2">
                    <center>
                        <a href="javascript:ShowHideFilter('All');">
                            <img id="Img1" alt="" src="../CentralData/Images/filteroff.png" onmouseover="fn_linkMouseOver('divimg2')"
                                onmouseout="fn_linkMouseOut('divimg2')" title="Filter Off" height="16px;" width="16px"
                                onclick="changevalueandpicture('su3')" style="border: none;" /></a>
                    </center>
                </div>
                <div class="paging LFloat_Lable" style="width: 40px; border: 1px solid white;" id="divimg3">
                    <center>
                        <a href="javascript:ShowHideFilter('back');">
                            <img id="su3" alt="" src="../CentralData/Images/reload.png" onmouseover="fn_linkMouseOver('divimg3')"
                                onmouseout="fn_linkMouseOut('divimg3')" title="Reload" height="24px;" width="24px"
                                onclick="changevalueandpicture('su3')" style="border: none;" /></a>
                    </center>
                </div>
                <div class="left" style="width: 170px;">
                    <dxe:ASPxComboBox ID="CmbRecordChoser" runat="server" ClientInstanceName="cCmbRecordChoser"
                        EnableIncrementalFiltering="True" EnableSynchronization="False" SelectedIndex="0"
                        ValueType="System.String">
                        <Items>
                            <dxe:ListEditItem Text="To Be Export" Value="U"></dxe:ListEditItem>
                            <dxe:ListEditItem Text="Already Exported" Value="A"></dxe:ListEditItem>
                        </Items>
                        <DropDownButton Text="Export For">
                        </DropDownButton>
                        <ClientSideEvents ValueChanged="function (s, e) {CmbRecordChoser_change(s.GetValue());}" />
                    </dxe:ASPxComboBox>
                </div>
                <br class="clear" />
            </div>
            <br class="clear" />
            <div id="Row6" class="Row1">
                <dxwgv:ASPxGridView ID="GvAuthRecord" ClientInstanceName="cGvAuthRecord" runat="server"
                    KeyFieldName="kycmain_id" AutoGenerateColumns="False" Width="998px" OnHtmlRowCreated="GvAuthRecord_HtmlRowCreated"
                    OnCustomCallback="GvAuthRecord_CustomCallback" OnProcessColumnAutoFilter="GvAuthRecord_ProcessColumnAutoFilter">
                    <ClientSideEvents EndCallback="function(s, e) {GvAuthRecord_EndCallBack();}" />
                    <ClientSideEvents SelectionChanged="function(s, e) { OnGridFocusedRowChanged(); }" />
                    <Columns>
                        <dxwgv:GridViewCommandColumn ShowSelectCheckbox="True" Width="40px" VisibleIndex="0"
                            HeaderStyle-HorizontalAlign="Center" FixedStyle="Left">
                            <HeaderTemplate>
                                <dxe:ASPxCheckBox ID="cbAll" runat="server" ClientInstanceName="cbAll" ToolTip="Select/Deselect all rows"
                                    BackColor="White" OnInit="cbAll_Init">
                                    <ClientSideEvents CheckedChanged="OnAllCheckedChanged" />
                                </dxe:ASPxCheckBox>
                            </HeaderTemplate>
                        </dxwgv:GridViewCommandColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Application No" FieldName="KYCMain_ApplicationNumber"
                            VisibleIndex="1" Width="120px" FixedStyle="Left">
                            <CellStyle CssClass="gridcellleft" Wrap="False">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataColumn FieldName="Appdate" Caption="Application Dt" VisibleIndex="2"
                            Width="75px" FixedStyle="Left">
                            <CellStyle CssClass="gridcellleft" Wrap="False">
                            </CellStyle>
                        </dxwgv:GridViewDataColumn>
                        <dxwgv:GridViewDataColumn FieldName="Clientname" Caption="Customer Name" VisibleIndex="3"
                            Width="175px" FixedStyle="Left">
                            <CellStyle CssClass="gridcellleft" Wrap="False">
                            </CellStyle>
                        </dxwgv:GridViewDataColumn>
                        <dxwgv:GridViewDataColumn FieldName="Dob" Caption="DOB" VisibleIndex="4" Width="75px">
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dxwgv:GridViewDataColumn>
                        <dxwgv:GridViewDataColumn FieldName="Gender" Caption="Gender" VisibleIndex="5" Width="40px">
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dxwgv:GridViewDataColumn>
                        <dxwgv:GridViewDataColumn FieldName="clienttype" Caption="Type" VisibleIndex="6"
                            Width="80px">
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dxwgv:GridViewDataColumn>
                        <dxwgv:GridViewDataColumn FieldName="fathername" Caption="Father Name" VisibleIndex="7"
                            Width="200px">
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dxwgv:GridViewDataColumn>
                        <dxwgv:GridViewDataColumn FieldName="exportdate" Caption="Export Date" VisibleIndex="9"
                            Width="75px">
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dxwgv:GridViewDataColumn>
                        <dxwgv:GridViewDataColumn FieldName="username" Caption="Exported User" VisibleIndex="10"
                            Width="100px">
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dxwgv:GridViewDataColumn>
                        <dxwgv:GridViewDataColumn FieldName="batchnumber" Caption="Batch No." VisibleIndex="8"
                            Width="50px">
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dxwgv:GridViewDataColumn>
                        <dxwgv:GridViewDataColumn FieldName="partner" Caption="Is Partner?" VisibleIndex="11"
                            Width="70px">
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dxwgv:GridViewDataColumn>
                    </Columns>
                    <SettingsBehavior AllowFocusedRow="True" AllowGroup="false" AllowSort="false" />
                    <Settings ShowGroupPanel="True" ShowHorizontalScrollBar="True" GridLines="Both" />
                    <Styles>
                        <FocusedRow HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FCA977">
                        </FocusedRow>
                        <AlternatingRow Enabled="True">
                        </AlternatingRow>
                    </Styles>
                    <SettingsPager NumericButtonCount="20" Mode="ShowAllRecords" PageSize="20" ShowSeparators="True"
                        AlwaysShowPager="True">
                        <FirstPageButton Visible="True">
                        </FirstPageButton>
                        <LastPageButton Visible="True">
                        </LastPageButton>
                    </SettingsPager>
                </dxwgv:ASPxGridView>
            </div>
            <div id="Row11" class="Row1">
                <dxwgv:ASPxGridView ID="BatchCancelGrid" ClientInstanceName="cBatchCancelGrid" runat="server"
                    OnCustomCallback="BatchCancelGrid_CustomCallback" OnHtmlRowCreated="Batchcancelgrid_HtmlRowCreated"
                    KeyFieldName="batchnumber" Width="998px">
                    <ClientSideEvents EndCallback="function(s, e) {cbatchcancelgrid_EndCallBack();}" />
                    <%-- OnHtmlRowCreated="Batchcancelgrid_HtmlRowCreated"--%>
                    <Columns>
                        <dxwgv:GridViewDataTextColumn Caption="Cancel Batches" FieldName="Cancelbatch" VisibleIndex="0"
                            Width="75px">
                            <CellStyle CssClass="gridcellleft" Wrap="False">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Batch Number" FieldName="batchnumber" VisibleIndex="1"
                            Width="75px">
                            <CellStyle CssClass="gridcellleft" Wrap="false">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="ClientExist" FieldName="Counting" VisibleIndex="1"
                            Width="75px">
                            <CellStyle CssClass="gridcellleft" Wrap="false">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <Templates>
                        <DetailRow>
                            <dxwgv:ASPxGridView ID="DetailGrid" runat="server" ClientInstanceName="cDetailsGrid"
                                Width="95%" OnInit="DetailGrid_Init">
                                <Columns>
                                    <dxwgv:GridViewDataTextColumn Caption="ID" FieldName="kycmain_id" VisibleIndex="1"
                                        Width="120px" FixedStyle="Left" Visible="false">
                                        <CellStyle CssClass="gridcellleft" Wrap="False">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="ClientName" FieldName="Clientname" VisibleIndex="1"
                                        Width="120px" FixedStyle="Left">
                                        <CellStyle CssClass="gridcellleft" Wrap="False">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Doc No" FieldName="KYCMain_DocNo" VisibleIndex="1"
                                        Width="120px" FixedStyle="Left">
                                        <CellStyle CssClass="gridcellleft" Wrap="False">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Application No" FieldName="KYCMain_ApplicationNumber"
                                        VisibleIndex="1" Width="120px" FixedStyle="Left">
                                        <CellStyle CssClass="gridcellleft" Wrap="False">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Client Type" FieldName="clienttype" VisibleIndex="1"
                                        Width="120px" FixedStyle="Left">
                                        <CellStyle CssClass="gridcellleft" Wrap="False">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Gender" FieldName="Gender" VisibleIndex="1"
                                        Width="120px" FixedStyle="Left">
                                        <CellStyle CssClass="gridcellleft" Wrap="False">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Father Name" FieldName="fathername" VisibleIndex="1"
                                        Width="120px" FixedStyle="Left">
                                        <CellStyle CssClass="gridcellleft" Wrap="False">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Date Of Birth" FieldName="Dob" VisibleIndex="1"
                                        Width="120px" FixedStyle="Left">
                                        <CellStyle CssClass="gridcellleft" Wrap="False">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Export Date" FieldName="exportdate" VisibleIndex="1"
                                        Width="120px" FixedStyle="Left" Visible="false">
                                        <CellStyle CssClass="gridcellleft" Wrap="False">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Batch Number" FieldName="batchnumber" VisibleIndex="1"
                                        Width="120px" FixedStyle="Left" Visible="false">
                                        <CellStyle CssClass="gridcellleft" Wrap="False">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="User Name" FieldName="username" VisibleIndex="1"
                                        Width="120px" FixedStyle="Left" Visible="false">
                                        <CellStyle CssClass="gridcellleft" Wrap="False">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                            </dxwgv:ASPxGridView>
                        </DetailRow>
                    </Templates>
                    <SettingsDetail ShowDetailRow="true" />
                    <%--<Settings ShowVerticalScrollBar="true" />--%>
                </dxwgv:ASPxGridView>
            </div>
            <%--  <div id="row4_col1" class="Row" style="width: 994px; padding: 3px 0px 3px 3px; vertical-align: top;
                    background-color: #eee; border: 1px solid #aaa; border-top: none;">
                    <div id="div1" style="margin-left: 5px;">
                        <dxe:ASPxButton ID="btnnext" runat="server" AutoPostBack="False" Width="150px" Font-Size="12px"
                            Text="Click to Ne[x]t" AccessKey="X">
                            <clientsideevents click="function (s, e) {btnnext_Click();}" />
                        </dxe:ASPxButton>
                    </div>
                </div>--%>
            <br class="clear" />
        </div>
        <br class="clear" />
        <div>
            <dxpc:ASPxPopupControl ID="popup_export" runat="server" ClientInstanceName="cpopup_export"
                Width="350px" HeaderText="Export Detail" PopupHorizontalAlign="Center" PopupVerticalAlign="middle"
                Modal="true" ShowCloseButton="true" PopupAction="None" CloseAction="CloseButton">
                <ContentCollection>
                    <dxpc:PopupControlContentControl ID="PopupControlContentControl" runat="server">
                        <dxcp:ASPxCallbackPanel ID="CbpSuggestdocument" Height="230px" runat="server" ClientInstanceName="cCbpSuggestdocument"
                            OnCallback="CbpSuggestdocument_Callback" LoadingPanelText="Please Wait !!" LoadingPanelStyle-Font-Bold="true"
                            LoadingPanelStyle-Cursor="wait" LoadingPanelStyle-ForeColor="gray">
                            <ClientSideEvents EndCallback="CbpSuggestdocument_EndCallBack" />
                            <PanelCollection>
                                <dxp:PanelContent runat="server">
                                    <div style="border: 1px solid gray; background-color: #DDD;">
                                        <br class="clear" />
                                        <br class="clear" />
                                        <div id="Row9" style="border: 1 px solid gray;">
                                            <div class="Row">
                                                <div class="lable_left" style="background: #D3D3D3;">
                                                    Total No of Records :
                                                </div>
                                                <div class="content_left">
                                                    <b style="text-align: right" id="B_cptotaldoc" runat="server"></b>
                                                </div>
                                                <br class="clear" />
                                            </div>
                                            <div class="Row">
                                                <div class="lable_left" style="background: #D3D3D3;">
                                                    Select Records To Be Export :
                                                </div>
                                                <div class="content_left">
                                                    <b style="text-align: right" id="B_cpexportdoc" runat="server"></b>
                                                </div>
                                                <br class="clear" />
                                            </div>
                                        </div>
                                        <br class="clear" />
                                        <div id="Row10" style="border: 1 px solid gray;">
                                            <div class="Row" id="divtxttext">
                                                <div class="lable_left" style="background: #D3D3D3;">
                                                    Batch Number :
                                                </div>
                                                <div id="divtxtauto" class="content_left">
                                                    <span style="text-align: right; color: Maroon" id="B_auto" runat="server"></span>
                                                </div>
                                                <br class="clear" />
                                            </div>
                                            <br class="clear" />
                                            <div class="Row">
                                                <div class="lable_left" style="background: #D3D3D3;">
                                                    <asp:CheckBox ID="chkparamucc" runat="server" Checked="false" onclick="divshowhide()" />
                                                    Other Batch Number :</div>
                                                <div class="content_left" id="divtxtmanual" style="height: 20px;">
                                                    <dxe:ASPxTextBox ID="txtmanualbatch" ClientInstanceName="ctxtmanualbatch" runat="server"
                                                        Width="80px" Onkeypress="return onlyNumbers(event)" Height="16px">
                                                    </dxe:ASPxTextBox>
                                                </div>
                                                <br class="clear" />
                                            </div>
                                            <div class="left" id="dvbtnproceed" style="width: 80px; margin-left: 10px; margin-top: 20px;
                                                margin-right: 15px;">
                                                <dxe:ASPxButton ID="btnproceed" runat="server" AutoPostBack="False" Text="[E]xport"
                                                    AccessKey="E">
                                                    <ClientSideEvents Click="function (s, e) {btnproceed_Click();}" />
                                                </dxe:ASPxButton>
                                            </div>
                                            <div class="left" id="btnback" style="margin-left: 10px; margin-top: 20px; margin-right: 25px;">
                                                <dxe:ASPxButton ID="btncancelpopup" runat="server" AutoPostBack="False" Text="[B]ack"
                                                    AccessKey="B">
                                                    <ClientSideEvents Click="function (s, e) {btncancelpopup_Click();}" />
                                                </dxe:ASPxButton>
                                            </div>
                                            <br class="clear" />
                                        </div>
                                        <div id="Row12" style="border: 1px solid gray;">
                                            <div>
                                                <span id="sapn_totalcancelbatch" runat="server" style="color: Maroon; font-weight: bold;
                                                    font-size: 12px; background: #D3D3D3;"></span><span style="color: Black; font-weight: bold;
                                                        font-size: 12px; background: #D3D3D3;">&nbsp; Client Already Exists in This Batch
                                                    </span>
                                                <br class="clear" />
                                                <br class="clear" />
                                                <span id="cancelbatch" style="color: Black; font-weight: bold; font-size: 12px; background: #D3D3D3;">
                                                    Do You Really Want To Cancel The Batch ?? </span>
                                            </div>
                                            <div class="left" style="width: 80px; margin-left: 10px; margin-top: 20px; margin-right: 15px;">
                                                <dxe:ASPxButton ID="btnyes" runat="server" AutoPostBack="False" Text="[Y]es" AccessKey="Y">
                                                    <ClientSideEvents Click="function (s, e) {btnyes_Click();}" />
                                                </dxe:ASPxButton>
                                            </div>
                                            <div class="left" style="margin-top: 20px; margin-right: 25px;">
                                                <dxe:ASPxButton ID="btnno" runat="server" AutoPostBack="False" Text="[N]o" AccessKey="N">
                                                    <ClientSideEvents Click="function (s, e) {btnno_Click();}" />
                                                </dxe:ASPxButton>
                                            </div>
                                        </div>
                                    </div>
                                    <br class="clear" />
                                </dxp:PanelContent>
                            </PanelCollection>
                        </dxcp:ASPxCallbackPanel>
                    </dxpc:PopupControlContentControl>
                </ContentCollection>
            </dxpc:ASPxPopupControl>
        </div>
    </div>
    <div id="Row61">
        <dxpc:ASPxPopupControl ID="PopUp_ScripAlert" runat="server" ClientInstanceName="cPopUp_ScripAlert"
            Width="550px" HeaderText="Partner Record Details" PopupHorizontalAlign="Center"
            PopupVerticalAlign="Middle" Modal="True" ShowCloseButton="true" PopupAction="None"
            CloseAction="CloseButton">
            <ContentCollection>
                <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                    <dxwgv:ASPxGridView ID="gridpartner" ClientInstanceName="cgridpartner" runat="server"
                        KeyFieldName="kycdetail_id" AutoGenerateColumns="False" Width="500px" OnCustomCallback="gridpartner_CustomCallback">
                        <ClientSideEvents EndCallback="function(s, e) {gridpartner_EndCallBack();}" />
                        <Columns>
                            <dxwgv:GridViewDataTextColumn Caption="Partner Name" FieldName="name" VisibleIndex="1"
                                Width="150px" FixedStyle="Left">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataColumn FieldName="relation" Caption="RelationShip" VisibleIndex="2"
                                Width="150px" FixedStyle="Left">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="pan" Caption="Pan No." VisibleIndex="3" Width="100px"
                                FixedStyle="Left">
                                <CellStyle CssClass="gridcellleft" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                            <dxwgv:GridViewDataColumn FieldName="uidno" Caption="UID NO." VisibleIndex="4" Width="100px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" />
                        <Styles>
                            <FocusedRow HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FCA977">
                            </FocusedRow>
                            <AlternatingRow Enabled="True">
                            </AlternatingRow>
                        </Styles>
                        <SettingsPager NumericButtonCount="5" PageSize="5" ShowSeparators="True" AlwaysShowPager="True">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                    </dxwgv:ASPxGridView>
                </dxpc:PopupControlContentControl>
            </ContentCollection>
            <HeaderStyle BackColor="LightGray" ForeColor="Black" />
        </dxpc:ASPxPopupControl>
    </div>
    <asp:HiddenField ID="hdnbatch" runat="server" />
    <asp:HiddenField ID="hdnbatchnumber" runat="server" />
    <asp:HiddenField ID="hdnexcel" runat="server" />
    <asp:HiddenField ID="hdngridbindornot" runat="server" />
    <asp:Button ID="BtnForExportEvent" runat="server" OnClick="cmbExport_SelectedIndexChanged"
        BackColor="#DDECFE" BorderStyle="None" />
    <asp:Button ID="BtnForExportEvent1" runat="server" OnClick="cmbExport1_SelectedIndexChanged"
        BackColor="#DDECFE" BorderStyle="None" />
    </form>
</body>
</html>
