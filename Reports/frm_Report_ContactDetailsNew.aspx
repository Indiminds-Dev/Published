<%@ page language="C#" autoeventwireup="true" inherits="Reports_frm_Report_ContactDetailsNew, App_Web_chtr38ms" enableeventvalidation="false" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../CentralData/JSScript/GenericJScript.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>

    <style type="text/css">
        /* Big box with list of options */#ajax_listOfOptions
        {
            position: absolute; /* Never change this one */
            width: 50px; /* Width of box */
            height: auto; /* Height of box */
            overflow: auto; /* Scrolling features */
            border: 1px solid Blue; /* Blue border */
            background-color: #FFF; /* White background color */
            text-align: left;
            font-size: 0.9em;
            z-index: 32767;
        }
        #ajax_listOfOptions div
        {
            /* General rule for both .optionDiv and .optionDivSelected */
            margin: 1px;
            padding: 1px;
            cursor: pointer;
            font-size: 0.9em;
        }
        #ajax_listOfOptions .optionDiv
        {
            /* Div for each item in list */
        }
        #ajax_listOfOptions .optionDivSelected
        {
            /* Selected item in the list */
            background-color: #DDECFE;
            color: Blue;
        }
        #ajax_listOfOptions_iframe
        {
            background-color: #F00;
            position: absolute;
            z-index: 3000;
        }
        form
        {
            display: inline;
        }
        .grid_scroll
        {
            overflow-y: no;
            overflow-x: scroll;
            width: 98%;
            scrollbar-base-color: #C0C0C0;
        }
        .box {
            width: 200px;
            height: 40px;
            float: left;
            background-color: white;
            margin: 25px 15px;
            border-radius: 5px;
        }
    </style>

    <script language="javascript" type="text/javascript">


        groupvalue = "";

        function Page_Load()///Call Into Page Load
        {
            Hide('tr_display');

            document.getElementById('td_Clientwise').style.display = 'none';
            document.getElementById('td_EmailSubject').style.display = 'none';
            document.getElementById('Tr2').style.display = 'none';
            document.getElementById('Tr3').style.display = 'none';
            document.getElementById('trComplogo').style.display = 'none';
            document.getElementById('trCompAddr').style.display = 'none';
            document.getElementById('CbpExportPanel_btnprint').style.display = 'none';
            document.getElementById('CbpExportPanel_btnEmail').style.display = 'none';
            document.getElementById('trPrintdate').style.display = 'none';
            document.getElementById('trcpdetails').style.display = 'none';
            Hide('tdHeader');
            Hide('tdAddSig');
            Hide('showFilter');
//          New Work 22/06/2024
            Hide("tr_AttachLocFile");
            Hide("FormLocalFile");
//            End of New Work 22/06/2024
            height();
        }

        function height() {
            if (document.body.scrollHeight >= 500) {
                window.frameElement.height = document.body.scrollHeight;
            }
            else {
                window.frameElement.height = '500px';
            }
        }
        function Hide(obj) {
            document.getElementById(obj).style.display = 'none';
        }
        function Show(obj) {
            document.getElementById(obj).style.display = 'inline';
        }
        function ddltradetypechange(obj) {
            if (obj == "4") {
                document.getElementById('radPOAClient').disabled = true;
                document.getElementById('rdbClientSelected').disabled = true;

            }
            else {
                document.getElementById('radPOAClient').disabled = false;
                document.getElementById('rdbClientSelected').disabled = false;
            }
            document.getElementById('rdbClientALL').checked = true;
        }

        function FunClientScrip(objID, objListFun, objEvent) {


            var cmbVal;
            if (groupvalue == "") {
                cmbVal = document.getElementById('cmbsearchOption').value;
                cmbVal = cmbVal + '~' + document.getElementById('ddlgrouptype').value;
            }
            else {
                if (document.getElementById('cmbsearchOption').value == "Clients") {
                    if (document.getElementById('ddlGroup').value == "0")//////////////Group By  selected are branch
                    {
                        if (document.getElementById('rdbranchAll').checked == true) {
                            cmbVal = document.getElementById('cmbsearchOption').value + 'Branch';
                            cmbVal = cmbVal + '~' + 'ALL' + '~' + document.getElementById('ddlgrouptype').value;
                        }
                        else {
                            cmbVal = document.getElementById('cmbsearchOption').value + 'Branch';
                            cmbVal = cmbVal + '~' + 'Selected' + '~' + groupvalue;
                        }
                    }
                    else //////////////Group By selected are Group
                    {
                        if (document.getElementById('rdddlgrouptypeAll').checked == true) {
                            cmbVal = document.getElementById('cmbsearchOption').value + 'Group';
                            cmbVal = cmbVal + '~' + 'ALL' + '~' + document.getElementById('ddlgrouptype').value;
                        }
                        else {
                            cmbVal = document.getElementById('cmbsearchOption').value + 'Group';
                            cmbVal = cmbVal + '~' + 'Selected' + '~' + groupvalue;
                        }
                    }
                }
                else {
                    cmbVal = document.getElementById('cmbsearchOption').value;
                    cmbVal = cmbVal + '~' + document.getElementById('ddlgrouptype').value;
                }
            }

            ajax_showOptions(objID, 'ShowClientFORClientMaster', objEvent, cmbVal);
        }
        function fnTerminalcallajax(objID, objListFun, objEvent) {
            var datefrom;
            var dateto;
            var date;

            datefrom = new Date(dtFrom.GetDate());
            dateto = new Date(dtTo.GetDate());

            datefrom = parseInt(datefrom.getMonth() + 1) + '-' + datefrom.getDate() + '-' + datefrom.getFullYear();
            dateto = parseInt(dateto.getMonth() + 1) + '-' + dateto.getDate() + '-' + dateto.getFullYear();

            date = "'" + datefrom + "' and '" + dateto + "'";
            ajax_showOptions(objID, 'ShowClientFORMarginStocks', objEvent, 'TerminalIdDate' + '~' + date);
        }
        function Clients(obj) {
            if (obj == "a")
                Hide('showFilter');
            else {
                var cmb = document.getElementById('cmbsearchOption');
                cmb.value = 'Clients';
                Show('showFilter');
            }
            selecttion();
            height();
        }

        function Branch(obj) {
            if (obj == "a")
                Hide('showFilter');
            else {
                var cmb = document.getElementById('cmbsearchOption');
                cmb.value = 'Branch';
                Show('showFilter');
            }
            selecttion();
            height();
        }
        function Group(obj) {
            if (obj == "a")
                Hide('showFilter');
            else {
                var cmb = document.getElementById('cmbsearchOption');
                cmb.value = 'Group';
                Show('showFilter');
            }
            selecttion();
            height();
        }
        function Segment(obj) {

            if (obj == "a")
                Hide('showFilter');
            else {
                var cmb = document.getElementById('cmbsearchOption');
                cmb.value = 'Segment';
                Show('showFilter');
            }
            selecttion();
            height();
        }


        function btnAddsubscriptionlist_click() {

            var cmb = document.getElementById('cmbsearchOption');
            var userid = document.getElementById('txtSelectionID');
            if (userid.value != '') {
                var ids = document.getElementById('txtSelectionID_hidden');
                var listBox = document.getElementById('lstSlection');
                var tLength = listBox.length;


                var no = new Option();
                no.value = ids.value;
                no.text = userid.value;
                listBox[tLength] = no;
                var recipient = document.getElementById('txtSelectionID');
                recipient.value = '';
            }
            else
                alert('Please search name and then Add!')
            var s = document.getElementById('txtSelectionID');
            s.focus();
            s.select();

        }

        function clientselectionfinal() {
            var listBoxSubs = document.getElementById('lstSlection');

            var cmb = document.getElementById('cmbsearchOption');
            var listIDs = '';
            var i;
            if (listBoxSubs.length > 0) {

                for (i = 0; i < listBoxSubs.length; i++) {
                    if (listIDs == '')
                        listIDs = listBoxSubs.options[i].value + ';' + listBoxSubs.options[i].text;
                    else
                        listIDs += ',' + listBoxSubs.options[i].value + ';' + listBoxSubs.options[i].text;
                }
                var sendData = cmb.value + '~' + listIDs;
                CallServer(sendData, "");

            }
            var i;
            for (i = listBoxSubs.options.length - 1; i >= 0; i--) {
                listBoxSubs.remove(i);
            }

            Hide('showFilter');
            document.getElementById('btnshow').disabled = false;
        }


        function btnRemovefromsubscriptionlist_click() {

            var listBox = document.getElementById('lstSlection');
            var tLength = listBox.length;

            var arrTbox = new Array();
            var arrLookup = new Array();
            var i;
            var j = 0;
            for (i = 0; i < listBox.options.length; i++) {
                if (listBox.options[i].selected && listBox.options[i].value != "") {

                }
                else {
                    arrLookup[listBox.options[i].text] = listBox.options[i].value;
                    arrTbox[j] = listBox.options[i].text;
                    j++;
                }
            }
            listBox.length = 0;
            for (i = 0; i < j; i++) {
                var no = new Option();
                no.value = arrLookup[arrTbox[i]];
                no.text = arrTbox[i];
                listBox[i] = no;
            }
        }


        function fnddlGroup(obj) {
            if (obj == "0") {
                Hide('td_group');
                Show('td_branch');
            }
            else {
                Show('td_group');
                Hide('td_branch');
                var btn = document.getElementById('btnhide');
                btn.click();
            }
            selecttion();
            height();
        }
        function fngrouptype(obj) {
            if (obj == "0") {
                Hide('td_allselect');
                alert('Please Select Group Type !');
            }
            else {
                Show('td_allselect');
            }
            selecttion();
            height();
        }

        function NORECORD() {
            alert('No Record Found!!');
            height();
        }


        function Filter() {
            Hide('showFilter');
            selecttion();
            height();
        }


        FieldName = 'lstSlection';
    </script>

    <script type="text/ecmascript">
        function ReceiveServerData(rValue) {

            var j = rValue.split('~');
            var btn = document.getElementById('btnhide');


            if (j[0] == 'Clients') {
                document.getElementById('HiddenField_Client').value = j[1];
            }
            else if (j[0] == 'Segment') {
                var combo = document.getElementById('litSegment');
                var NoItems = j[1].split(',');
                var i;
                var val = '';
                var seg = '';
                for (i = 0; i < NoItems.length; i++) {
                    var items = NoItems[i].split(';');
                    if (val == '') {
                        seg = items[0];
                        val = items[1];

                    }
                    else {
                        seg += ',' + items[0];
                        val += ',' + items[1];

                    }
                }
                document.getElementById('HiddenField_Segment').value = seg;
                combo.innerText = val;
                document.getElementById('HiddenField_SegmentName').value = val;
                //document.getElementById('HiddenField_Segment').value = j[1];
            }
            else if (j[0] == 'ScripsExchange') {
                document.getElementById('HiddenField_Instrument').value = j[1];
            }
            else if (j[0] == 'SettlementNo') {
                document.getElementById('HiddenField_SettNo').value = j[1];
            }
            else if (j[0] == 'SettlementType') {
                document.getElementById('HiddenField_Setttype').value = j[1];
            }
            else if (j[0] == 'Branch') {
                document.getElementById('HiddenField_Branch').value = j[1];
                groupvalue = j[1];
                btn.click();
            }
            else if (j[0] == 'Group') {
                document.getElementById('HiddenField_Group').value = j[1];
                groupvalue = j[1];
                btn.click();
            }
        }


        function iframesource(obj) {

            //alert('calluserinformation');
            iFrmInformation.location = "ContactDetailsIframe.aspx?ID=" + obj;
        }


        function OpenWindow(obj, obj1) {

            var x = window.open('ContactDetailsIframe.aspx?ID=' + obj + '&Seg=' + obj1, 'FS', 'width=900, height=600,menubar=0,toolbar=0 scrollbars=yes,resizable=yes')
            x.focus
        }



        function ChkCheckProperty(obj, objChk) {
            if (objChk == true) {
                if (obj == 'H')
                    Show('tdHeader');
                else if (obj == 'F')
                    Hide('tdHeader');
            }
            else {
                Hide('tdHeader');
            }


        }


        function FunTemplate(objID, objListFun, objEvent) {
            ajax_showOptions(objID, objListFun, objEvent);
        }

        function ChkAddSig(obj) {
            if (obj == true)
                Show('tdAddSig');
            else
                Hide('tdAddSig');
        }

        function FunAddSig(objID, objListFun, objEvent) {
            ajax_showOptions(objID, objListFun, objEvent);
        }

        //    function fn_ddllistType(obj)
        //   {    
        //    if(obj=='0')
        //    {
        //         document.getElementById('td_Clientwise').style.display='inline';
        //        // document.getElementById('td_Consolidated').style.display='none';
        //      
        //    }
        //     if(obj=='1')
        //     {
        //       //  document.getElementById('td_Consolidated').style.display='inline';
        //        document.getElementById('td_Clientwise').style.display='none';

        //         
        //     }
        //   }


        function Display() {
            document.getElementById('tr_display').style.display = 'inline';
            height();
        }

        function DisplayCon() {
            document.getElementById('tr_display').style.display = 'none';
            height();
        }

        function fn_ddllist(obj) {
            if (obj == '0') {
                document.getElementById('CbpExportPanel_btnprint').style.display = 'none';
                document.getElementById('CbpExportPanel_btnEmail').style.display = 'none';
                document.getElementById('btnshow').style.display = 'inline';
                document.getElementById('td_Clientwise').style.display = 'none';
                document.getElementById('td_EmailSubject').style.display = 'none';
                document.getElementById('Tr2').style.display = 'none';
                document.getElementById('Tr3').style.display = 'none';
                document.getElementById('trComplogo').style.display = 'none';
                document.getElementById('trCompAddr').style.display = 'none';
                document.getElementById('trPrintdate').style.display = 'none';
                document.getElementById('trcpdetails').style.display = 'none';
//                New Work 22/06/2024
                Hide("tr_AttachLocFile");
                Hide("FormLocalFile");
//                End of New Work 22/06/2024
            }
            if (obj == '1') {
                document.getElementById('btnshow').style.display = 'none';
                document.getElementById('CbpExportPanel_btnEmail').style.display = 'none';
                document.getElementById('CbpExportPanel_btnprint').style.display = 'inline';
                document.getElementById('td_Clientwise').style.display = 'inline';
                document.getElementById('td_EmailSubject').style.display = 'none';
                document.getElementById('Tr2').style.display = 'inline';
                document.getElementById('Tr3').style.display = 'inline';
                document.getElementById('trComplogo').style.display = 'inline';
                document.getElementById('trCompAddr').style.display = 'inline';
                document.getElementById('trPrintdate').style.display = 'inline';
                document.getElementById('trcpdetails').style.display = 'inline';
//                New Work 22/06/2024
                Hide("tr_AttachLocFile");
                Hide("FormLocalFile");
//                End of New Work 22/06/2024
            }
            if (obj == '2') {
                document.getElementById('btnshow').style.display = 'none';
                document.getElementById('CbpExportPanel_btnprint').style.display = 'none';
                document.getElementById('CbpExportPanel_btnEmail').style.display = 'inline';
                document.getElementById('td_EmailSubject').style.display = 'inline';
                document.getElementById('td_Clientwise').style.display = 'inline';
                document.getElementById('Tr2').style.display = 'inline';
                document.getElementById('Tr3').style.display = 'inline';
                document.getElementById('trComplogo').style.display = 'inline';
                document.getElementById('trCompAddr').style.display = 'inline';
                document.getElementById('trPrintdate').style.display = 'inline';
                document.getElementById('trcpdetails').style.display = 'inline';
//                New Work 22/06/2024
                Show("tr_AttachLocFile");
//                End of New Work 22/06/2024
            }
            height();
        }

        function DisplayButton() {
            Show('trButton');
            height();
        }

        function PdfExport() {
            HideShow('LoadingDiv', 'S');
            cCbpExportPanel.PerformCallback("pdf");
        }
        function SendEmail() {
            HideShow('LoadingDiv', 'S');
            cCbpExportPanel.PerformCallback("email");
        }
        function cCbpExportPanel_EndCallBack() {
            if (cCbpExportPanel.cpIsPdfProcDone != null) {
                if (cCbpExportPanel.cpIsPdfProcDone == "1") {
                    document.getElementById('btnPdfExport').click()
                    document.getElementById('CbpExportPanel_btnprint').style.display = 'inline';
                    document.getElementById('CbpExportPanel_btnEmail').style.display = 'none';
                    setTimeout(function () { HideShow('LoadingDiv', 'H'); }, 50000);
                }
                else alert(cCbpExportPanel.cpIsPdfProcDone);
            }
            if (cCbpExportPanel.cpIsEmailProcDone != null) {
                if (cCbpExportPanel.cpIsEmailProcDone == "1") {
                    if (document.getElementById("ddllistType").value == "0") { alert("Email(s) Created...."); window.location = "../Reports/frm_Report_ContactDetailsNew.aspx"; }
                    else document.getElementById('btnSendEmail').click()
                    HideShow('LoadingDiv', 'H');
                } 
                else alert(cCbpExportPanel.cpIsEmailProcDone);
            }
        }
        
//        New Work 22/06/2024
        function btnLocalAtt_click()
        {
            document.getElementById("FormLocalFile").style.display = 'inline';
            document.getElementById("TRLocalGrid").style.display = 'none';
             document.getElementById("TRServerGrid").style.display = 'none';
            CallServer("LocalCall","");
        }
        function btnCancelAttach_click()
        {
            document.getElementById("FormLocalFile").style.display = 'none';
            grid.PerformCallback('cancel');
        }
        function btnremoveAttach_click()
        {
        
        }
        function btnAddLocal_click()
        {
            var fileupload = document.getElementById("FileUpload1");
            document.getElementById("TRLocalGrid").style.display = 'inline';
            var filename = fileupload.value;
            var file = filename.split('\\');
            var length = file.length;
            var data = 'addLocal' + '~' + filename + '~' + file[length-1];
            //alert(filename);
            var senddata="AttachLocal~"+filename;
            CallServer(senddata,"");
            gridLocal.PerformCallback(data);
        }
        function btnCancelAddLocal_click()
        {
            document.getElementById("FormLocalFile").style.display = 'none';
        }
        
        function btnCancelAttachLocal_click()
        {
//         alert("btnCancelAttachLocal");
            document.getElementById("FormLocalFile").style.display = 'none';
            var senddata = 'Canloc';
            gridLocal.PerformCallback(senddata);
        }
        function btnRemoveAttachLocal_click()
        {
            var senddata = 'remvloc~' + counterLocal;
            gridLocal.PerformCallback(senddata);
        }
        function OnGridLocalSelectAll(obj)
        {
            OnGridLocalSelectionChanged();  
        }
        function OnGridLocalSelectionChanged() 
        {
            gridLocal.GetSelectedFieldValues('filepathServer', OnGridLocalSelectionComplete);
        }
        function OnGridLocalSelectionComplete(values) 
        {
            counterLocal = 'n';
            for(var i = 0; i < values.length; i ++) {
                if(counterLocal != 'n')
                    counterLocal += ',' + values[i];
                else
                    counterLocal = values[i];
            }
        }
        function AttachmentCall()
        {
            fn_ddllist("2");
            Show("FormLocalFile");
            height();
        }
//        End of New Work 22/06/2024
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600">
    </asp:ScriptManager>

    <script language="javascript" type="text/javascript">
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_initializeRequest(InitializeRequest);
        prm.add_endRequest(EndRequest);
        var postBackElement;
        function InitializeRequest(sender, args) {
            if (prm.get_isInAsyncPostBack())
                args.set_cancel(true);
            postBackElement = args.get_postBackElement();
            $get('UpdateProgress1').style.display = 'block';
        }
        function EndRequest(sender, args) {
            $get('UpdateProgress1').style.display = 'none';

        } 
    </script>

    <div>
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" colspan="0" style="text-align: center; height: 20px;">
                    <strong><span id="SpanHeader" style="color: #000099">Client Master</span></strong>
                </td>
            </tr>
        </table>
        <table width="100%">
            <%--<tr>
                    <td colspan="2">
                        <table border="1">
                            <tr valign="top">
                                <td class="gridcellleft" bgcolor="#B7CEEC">
                                    Client Registered Between :
                                </td>
                                <td class="gridcellleft">
                                    <dxe:ASPxDateEdit ID="dtFrom" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                        Font-Size="10px" Width="108px" ClientInstanceName="dtFrom">
                                        <dropdownbutton text="From">
                                        </dropdownbutton>
                                    </dxe:ASPxDateEdit>
                                </td>
                                <td class="gridcellleft">
                                    <dxe:ASPxDateEdit ID="dtTo" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                        Font-Size="10px" Width="108px" ClientInstanceName="dtTo">
                                        <dropdownbutton text="To">
                                        </dropdownbutton>
                                    </dxe:ASPxDateEdit>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>--%>
            <tr valign="top">
                <td class="gridcellleft">
                    <table cellspacing="1" cellpadding="2" style="background-color: #B7CEEC; border: solid 1px  #ffffff"
                        border="1">
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Client Registered Between :
                            </td>
                            <td class="gridcellleft">
                                <dxe:ASPxDateEdit ID="dtFrom" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                    Font-Size="10px" Width="108px" ClientInstanceName="dtFrom">
                                    <DropDownButton Text="From">
                                    </DropDownButton>
                                </dxe:ASPxDateEdit>
                            </td>
                            <td class="gridcellleft">
                                <dxe:ASPxDateEdit ID="dtTo" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                    Font-Size="10px" Width="108px" ClientInstanceName="dtTo">
                                    <DropDownButton Text="To">
                                    </DropDownButton>
                                </dxe:ASPxDateEdit>
                            </td>
                        </tr>
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Segment :
                            </td>
                            <td>
                                <asp:RadioButton ID="rdbSegAll" runat="server" GroupName="e" onclick="Segment('a')" />
                                All
                            </td>
                            <td>
                                <asp:RadioButton ID="rdbSegSelected" runat="server" Checked="True" GroupName="e"
                                    onclick="Segment('b')" />
                                Selected
                            </td>
                            <td>
                                [<span id="litSegment" runat="server" style="color: Maroon"></span>]
                            </td>
                        </tr>
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Group By
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlGroup" runat="server" Width="80px" Font-Size="10px" onchange="fnddlGroup(this.value)">
                                    <asp:ListItem Value="0">Branch</asp:ListItem>
                                    <asp:ListItem Value="1">Group</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td colspan="2" id="td_branch">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:RadioButton ID="rdbranchAll" runat="server" Checked="True" GroupName="a" onclick="Branch('a')" />
                                            All
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbranchSelected" runat="server" GroupName="a" onclick="Branch('b')" />Selected
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
                                                onclick="Group('a')" />
                                            All
                                            <asp:RadioButton ID="rdddlgrouptypeSelected" runat="server" GroupName="b" onclick="Group('b')" />Selected
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Clients :
                            </td>
                            <td>
                                <asp:RadioButton ID="rdbClientALL" runat="server" Checked="True" GroupName="c" onclick="Clients('a')" />
                                All Client
                            </td>
                            <td>
                                <asp:RadioButton ID="radPOAClient" runat="server" GroupName="c" onclick="Clients('a')" />POA
                                Client
                            </td>
                            <td>
                                <asp:RadioButton ID="rdbClientSelected" runat="server" GroupName="c" onclick="Clients('b')" />
                                Selected Client
                            </td>
                        </tr>
                        <tr>
                            <td class="gridcellleft">
                                Report Type
                            </td>
                            <td colspan="3">
                                <asp:DropDownList ID="ddllistType" runat="server" Width="120px" Font-Size="10px">
                                    <asp:ListItem Value="0">Clientwise</asp:ListItem>
                                    <asp:ListItem Value="1">Clientwise Consolidated</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="gridcellleft">
                                Show Report
                            </td>
                            <td class="gridcellleft" colspan="3">
                                <asp:DropDownList ID="ddllist" runat="server" Width="120px" Font-Size="10px" onchange="fn_ddllist(this.value)">
                                    <asp:ListItem Value="0">Screen</asp:ListItem>
                                    <asp:ListItem Value="1">PDF</asp:ListItem>
                                    <asp:ListItem Value="2">EMail</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr id="td_EmailSubject" runat="server">
                            <td class="gridcellleft">
                                <asp:Label ID="lblEmailSubject" runat="server" Text="Email Subject"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmailSubject" runat="server" Text="New Account Opening Details" TextMode="MultiLine" Rows="5" Columns="50">
                                </asp:TextBox>
                            </td>
                        </tr>
                        <%--New Work 22/06/2024--%>
                        <tr id="tr_AttachLocFile" runat="server">
                            <td class="gridcellright" style="width: 111px">
                                <span style="color: #000099"> <strong> </strong></span>
                            </td>
                            <td class="gridcellleft">                                
                                <input id="btnLocalAttach" type="button" value="Attach Local File" class="btnUpdate"
                                    onclick="btnLocalAtt_click();" style="width: 119px; height: 19px" tabindex="1" />
                                </td>
                        </tr>
                        <tr id="FormLocalFile">
                            <td colspan="2" class="gridcellleft">
                                <table class="TableMain100">
                                    <tr>
                                        <td class="gridcellright" style="width: 111px">
                                        </td>
                                        <td style="width: auto">
                                            <asp:FileUpload ID="FileUpload1" runat="server" Width="314px" Font-Size="12px" />
                                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Upload" CssClass="btnUpdate"
                                                Height="19px" Width="62px" />
                                            <input id="btnCancelAddLocal" type="button" value="Cancel" class="btnUpdate" onclick="btnCancelAddLocal_click();"
                                                style="width: 62px; height: 19px" tabindex="1" />
                                        </td>
                                    </tr>
                                    <tr id="TRLocalGrid">
                                        <td colspan="2">
                                            <table class="TableMain100">
                                                <tr>
                                                    <td>
                                                        <dxwgv:ASPxGridView ID="GridAttachmentLocal" ClientInstanceName="gridLocal" runat="server"
                                                            Width="100%" KeyFieldName="filepathServer" AutoGenerateColumns="False" OnCustomCallback="GridAttachmentLocal_CustomCallback">
                                                            <Styles>
                                                                <LoadingPanel ImageSpacing="10px">
                                                                </LoadingPanel>
                                                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                </Header>
                                                            </Styles>
                                                            <SettingsPager AlwaysShowPager="True" NumericButtonCount="20" ShowSeparators="True"
                                                                Visible="False">
                                                                <FirstPageButton Visible="True">
                                                                </FirstPageButton>
                                                                <LastPageButton Visible="True">
                                                                </LastPageButton>
                                                            </SettingsPager>
                                                            <SettingsBehavior AllowMultiSelection="True" />
                                                            <ClientSideEvents SelectionChanged="function(s, e) { OnGridLocalSelectionChanged(); }" />
                                                            
                                                            <Columns>
                                                                <dxwgv:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0" Width="3%">
                                                                    <HeaderStyle HorizontalAlign="Center">
                                                                        <Paddings PaddingBottom="1px" PaddingTop="1px" />
                                                                    </HeaderStyle>
                                                                    <HeaderTemplate>
                                                                        <input type="checkbox" onclick="gridLocal.SelectAllRowsOnPage(this.checked);OnGridLocalSelectAll(this.checked);"
                                                                            style="vertical-align: middle;" title="Select/Unselect all rows on the page"></input>
                                                                    </HeaderTemplate>
                                                                </dxwgv:GridViewCommandColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="File Name" FieldName="filename" ReadOnly="True"
                                                                    VisibleIndex="1">
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="File Path" FieldName="filepath" ReadOnly="True"
                                                                    VisibleIndex="2">
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Server File Path" FieldName="filepathServer"
                                                                    ReadOnly="True" VisibleIndex="2">
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                            </Columns>
                                                        </dxwgv:ASPxGridView>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="gridcellleft">
                                                        <input id="btnRemoveAttachLocal" type="button" value="Remove" class="btnUpdate" onclick="btnRemoveAttachLocal_click();"
                                                            style="width: 62px; height: 19px" tabindex="1" />
                                                        <input id="btnCancelAttachLocal" type="button" value="Cancel" class="btnUpdate" onclick="btnCancelAttachLocal_click();"
                                                            style="width: 62px; height: 19px" tabindex="1" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <%--End of New Work 22/06/2024--%>
                        <tr id="td_Clientwise" runat="server">
                            <td class="gridcellleft">
                                <asp:CheckBox ID="chkHeader" runat="server" onclick="ChkCheckProperty('H',this.checked);" />
                                Use Template :
                            </td>
                            <td id="tdHeader" colspan="3">
                                <asp:TextBox ID="txtHeader" runat="server" Width="279px" Font-Size="10px" onkeyup="FunTemplate(this,'GetTeplate',event)"></asp:TextBox>
                            </td>
                        </tr>
                        <tr id="td_Details" runat="server">
                            <td class="gridcellleft">
                                <asp:CheckBox ID="chkDetailPage" runat="server" />
                                Do not show detail page
                            </td>
                        </tr>
                        <tr id="Tr2" runat="server">
                            <td class="gridcellleft">
                                <asp:CheckBox ID="ChkSignatory" runat="server" onclick="ChkAddSig(this.checked);" />
                                Add Signatory :
                            </td>
                            <td id="tdAddSig" colspan="3">
                                <asp:TextBox ID="txtSignature" runat="server" Width="279px" Font-Size="10px" onkeyup="FunAddSig(this,'SearchByEmployeesWithSignature',event)"></asp:TextBox>
                            </td>
                        </tr>
                        <tr id="Tr3" runat="server">
                            <td class="gridcellleft" colspan="4">
                                <asp:CheckBox ID="CheckBrkg" runat="server" />
                                Print Brokerage Detail :
                            </td>
                        </tr>
                        <tr id="trComplogo" runat="server">
                            <td class="gridcellleft" colspan="4">
                                <asp:CheckBox ID="chkComplogo" runat="server" />
                                Add Company Logo :
                            </td>
                        </tr>
                        <tr id="trCompAddr" runat="server">
                            <td class="gridcellleft" colspan="4">
                                <asp:CheckBox ID="chkCompAddr" runat="server" />
                                Add Company Address :
                            </td>
                        </tr>
                        <%-- added by krishnendu dated 11 july 2013--%>
                        <tr id="trPrintdate" runat="server">
                            <td class="gridcellleft" colspan="4">
                                <asp:CheckBox ID="chkPrint" runat="server" />
                                Printed DateTime :
                            </td>
                        </tr>
                        <tr id="trcpdetails" runat="server">
                            <td class="gridcellleft" colspan="4">
                                <asp:CheckBox ID="chkPrintCPD" runat="server" />
                                Print Contact Person Details :
                            </td>
                        </tr>
                        <tr id="td_Consolidated" runat="server">
                            <td colspan="4" class="gridcellleft">
                                <asp:Button ID="btnshow" runat="server" CssClass="btnUpdate" Height="20px" Text="Show"
                                    Width="101px" OnClick="btnshow_Click" />
                                <dxcp:ASPxCallbackPanel ID="CbpExportPanel" runat="server" ClientInstanceName="cCbpExportPanel"
                                    OnCallback="CbpExportPanel_Callback">
                                    <LoadingPanelImage Url="../images/progress.gif" />
                                    <PanelCollection>
                                        <dxp:PanelContent runat="server">
                                            <dxe:ASPxButton ID="btnprint" runat="server" CssClass="btnUpdate" AutoPostBack="False"
                                                Height="5px" Text="Print PDF" Width="110px" ClientInstanceName="cbtnprint">
                                                <ClientSideEvents Click="function (s, e) {PdfExport();}" />
                                            </dxe:ASPxButton>
                                            <dxe:ASPxButton ID="btnEmail" runat="server" CssClass="btnUpdate" AutoPostBack="False"
                                                Height="5px" Text="Send Email" Width="110px" ClientInstanceName="cbtnEmail">
                                                <ClientSideEvents Click="function (s, e) {SendEmail();}" />
                                            </dxe:ASPxButton>
                                            
                                        </dxp:PanelContent>
                                    </PanelCollection>
                                    <ClientSideEvents EndCallback="cCbpExportPanel_EndCallBack" />
                                </dxcp:ASPxCallbackPanel>
                               
                                
                            </td>
                        </tr>
                    </table>
                </td>
                <td valign="top">
                    <table width="100%" id="showFilter">
                        <tr valign="top">
                            <td style="text-align: right; vertical-align: top; height: 134px;">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="gridcellleft" style="vertical-align: top; text-align: right; height: 21px;"
                                            id="TdFilter">
                                            <span id="spanunder"></span><span id="spanclient"></span>
                                            <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="155px" onkeyup="FunClientScrip(this,'fn_name',event)"></asp:TextBox><asp:DropDownList
                                                ID="cmbsearchOption" runat="server" Font-Size="11px" Width="70px" Enabled="false">
                                                <asp:ListItem>Clients</asp:ListItem>
                                                <asp:ListItem>Group</asp:ListItem>
                                                <asp:ListItem>Branch</asp:ListItem>
                                                <asp:ListItem>Segment</asp:ListItem>
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
                <td colspan="2">
                    <table>
                        <tr>
                            <td style="display: none;">
                                <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="150px"></asp:TextBox>
                                <asp:Button ID="btnhide" runat="server" Text="Button" OnClick="btnhide_Click" />
                                <asp:HiddenField ID="HiddenField_Group" runat="server" />
                                <asp:HiddenField ID="HiddenField_Branch" runat="server" />
                                <asp:HiddenField ID="HiddenField_Client" runat="server" />
                                <asp:HiddenField ID="HiddenField_Segment" runat="server" />
                                <asp:HiddenField ID="txtSignature_hidden" runat="server" />
                                <asp:HiddenField ID="txtHeader_hidden" runat="server" />
                                <asp:HiddenField ID="HiddenField_SegmentName" runat="server" />
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr id="tr_display">
                <td colspan="2">
                    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                        <ContentTemplate>
                            <table width="100%">
                                <tr runat="server">
                                    <td colspan="2">
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:ImageButton ID="btnFirst" runat="server" ImageUrl='../images/pFirst.png' OnClick="btnFirst_Click" />
                                                </td>
                                                <td>
                                                    <asp:ImageButton ID="btnPrevious" runat="server" ImageUrl='../images/pPrev.png' OnClick="btnPrevious_Click1" />
                                                </td>
                                                <td>
                                                    <asp:ImageButton ID="btnNext" runat="server" ImageUrl='../images/pNext.png' OnClick="btnNext_Click1" />
                                                </td>
                                                <td>
                                                    <asp:ImageButton ID="btnLast" runat="server" ImageUrl='../images/pLast.png' OnClick="btnLast_Click1" />
                                                </td>
                                                <td>
                                                    <asp:HiddenField ID="HdPageNo" runat="server" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnshow" EventName="Click"></asp:AsyncPostBackTrigger>
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
        <table>
            <tr id="tr1">
                <td>
                    <asp:UpdatePanel runat="server" ID="UpdatePanel4">
                        <ContentTemplate>
                            <div id="display" runat="server" style="width: 950px; overflow: scroll;">
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnshow" EventName="Click"></asp:AsyncPostBackTrigger>
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
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
                                                        <img src='../images/progress.gif' width='18' height='18'>
                                                    </td>
                                                    <td height='10' width='100%' align='center' bgcolor='#FFFFFF'>
                                                        <font size='1' face='Tahoma'><strong align='center'>Please Wait..</strong></font>
                                                    </td>
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
    </div>
        <div id='LoadingDiv' style='display:none;position: absolute; font-family: arial; font-size: 30; left: 50%; top: 20%; background-color: white; layer-background-color: white; height: 80; width: 150;'>
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
        <div style="display: none">
            <asp:Button ID="btnPdfExport" runat="server" OnClick="btnPdfExport_Click" />
            <asp:Button ID="btnSendEmail" runat="server" OnClick="btnSendEmail_Click" />
        </div>
    </form>
</body>
</html>
