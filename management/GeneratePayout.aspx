<%@ page language="C#" autoeventwireup="true" inherits="management_GeneratePayout, App_Web_e158i_8t" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>Obligation Summary Report</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <%-- <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>--%>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>

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
            width:55%;
            scrollbar-base-color: #C0C0C0;
        
	}
	
	</style>

    <script language="javascript" type="text/javascript">
        groupvalue = "";
        function Page_Load()///Call Into Page Load
        {
            height();
            Hide('tabBankTran');
            Hide('showFilter');
            Hide('trGenerate');
            Hide('td_filter');
            Hide('td_grid');
            //Addition of AC
            document.getElementById('TrSubAccount').style.display = 'none';
            //End
        }
        function Hide(obj) {
            document.getElementById(obj).style.display = 'none';
        }
        function Show(obj) {
            document.getElementById(obj).style.display = 'inline';
        }
        function height() {
            if (document.body.scrollHeight >= 350) {
                window.frameElement.height = document.body.scrollHeight;
            }
            else {
                window.frameElement.height = '350px';
            }

        }
        function FunClientScrip(objID, objListFun, objEvent) {
            var cmbVal;

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
            if (document.getElementById('cmbsearchOption').value == "SubAccount") {
                cmbVal = document.getElementById('cmbsearchOption').value;
                cmbVal = cmbVal + '~ SubAccount_MainAcReferenceId=\'' + document.getElementById("HdnMainAcCode").value + "'";
            }
            else {
                cmbVal = document.getElementById('cmbsearchOption').value;
                cmbVal = cmbVal + '~' + document.getElementById('ddlgrouptype').value;
            }

            ajax_showOptions(objID, objListFun, objEvent, cmbVal);
        }
        function Filter() {
            Hide('tabBankTran');
            Hide('trGenerate');
            Hide('showFilter');
            Hide('td_grid');
            Hide('td_filter');
            Show("MainTable");
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
            document.getElementById('ShowSelectUser').style.display = 'none';
            document.getElementById('btn_show').disabled = false;
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

        function selecttion() {
            var combo = document.getElementById('ddlExport');
            combo.value = 'Ex';
        }
        function displaydate(obj) {
            document.getElementById('lblTrDate').innerText = obj;
            SearchOnPrefix();
            Show('tabBankTran');
            height();
        }
        function line() {
            Hide("MainTable");
            Show('tabBankTran');
            Show('trGenerate');
            Show('td_filter');
            Show('td_grid');


            window.frameElement.height = document.body.scrollHeight;

        }
        function ChangeRowColor(rowID, rowNumber) {

            var gridview = document.getElementById('grdBilling');
            var rCount = gridview.rows.length;
            var rowIndex = 1;
            var rowCount = 0;
            if (rCount == 18)
                rowCount = 15;
            else
                rowCount = rCount - 2;
            if (rowNumber > 15 && rCount < 18)
                rowCount = rCount - 3;
            for (rowIndex; rowIndex <= rowCount; rowIndex++) {
                var rowElement = gridview.rows[rowIndex];
                rowElement.style.backgroundColor = '#FFFFFF'
            }
            var color = document.getElementById(rowID).style.backgroundColor;
            if (color != '#ffe1ac') {
                oldColor = color;
            }
            if (color == '#ffe1ac') {
                document.getElementById(rowID).style.backgroundColor = oldColor;
            }
            else
                document.getElementById(rowID).style.backgroundColor = '#ffe1ac';

        }
        function Disable(obj) {
            var gridview = document.getElementById('grdBilling');
            var rCount = gridview.rows.length;

            if (rCount < 10)
                rCount = '0' + rCount;
            if (obj == 'P') {
                document.getElementById("grdBilling_ctl" + rCount + "_FirstPage").style.display = 'none';
                document.getElementById("grdBilling_ctl" + rCount + "_PreviousPage").style.display = 'none';
                document.getElementById("grdBilling_ctl" + rCount + "_NextPage").style.display = 'inline';
                document.getElementById("grdBilling_ctl" + rCount + "_LastPage").style.display = 'inline';
            }
            else {
                document.getElementById("grdBilling_ctl" + rCount + "_NextPage").style.display = 'none';
                document.getElementById("grdBilling_ctl" + rCount + "_LastPage").style.display = 'none';
            }
        }
        function DisableC(obj) {

            if (obj == 'P') {

                document.getElementById('lnkPrevClient').style.display = 'none';
                document.getElementById('lnkNextClient').style.display = 'inline';
            }
            else {
                document.getElementById('lnkPrevClient').style.display = 'inline';
                document.getElementById('lnkNextClient').style.display = 'none';
            }
        }
        FieldName = 'lstSlection';

        //THIS IS FOR EMAIL

        function btnAddEmailtolist_click() {

            var cmb = document.getElementById('cmbsearch');

            var userid = document.getElementById('txtSelectID');
            if (userid.value != '') {
                var ids = document.getElementById('txtSelectID_hidden');
                var listBox = document.getElementById('SelectionList');
                var tLength = listBox.length;


                var no = new Option();
                no.value = ids.value;
                no.text = userid.value;
                listBox[tLength] = no;
                var recipient = document.getElementById('txtSelectID');
                recipient.value = '';
            }
            else
                alert('Please search name and then Add!')
            var s = document.getElementById('txtSelectID');
            s.focus();
            s.select();

        }


        function callAjax1(obj1, obj2, obj3) {
            document.getElementById('SelectionList').style.display = 'none';
            var combo = document.getElementById("cmbsearch");
            var set_value = combo.value
            var obj4 = 'Main';

            if (set_value == '16') {
                ajax_showOptions(obj1, 'GetLeadId', obj3, set_value, obj4)
            }
            else {

                ajax_showOptions(obj1, obj2, obj3, set_value, obj4)
            }

        }

        function clientselection() {
            var listBoxSubs = document.getElementById('SelectionList');

            var cmb = document.getElementById('cmbsearch');

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

                CallServer1(sendData, "");

            }
            else {
                alert("Please select email from list.")
            }

            var i;
            for (i = listBoxSubs.options.length - 1; i >= 0; i--) {
                listBoxSubs.remove(i);
            }

            window.frameElement.height = document.body.scrollHeight;
        }

        function btnRemoveEmailFromlist_click() {

            var listBox = document.getElementById('SelectionList');
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

        function ReceiveSvrData(rValue) {
            var Data = rValue.split('~');
            if (Data[0] == 'Clients') {
            }
        }

        function Sendmail() {


            var cmbVal = document.getElementById('ddlGroup').value;
            if (cmbVal == "0") {

                document.getElementById('lblSelectBrCl').value = 'Respective Branch';
                document.getElementById('ShowSelectUser').style.display = 'inline';
                window.frameElement.height = document.body.scrollHeight;

            }
            else if (cmbVal == "1") {

                document.getElementById('lblSelectBrCl').value = 'Respective Group';
                document.getElementById('ShowSelectUser').style.display = 'inline';
                window.frameElement.height = document.body.scrollHeight;

            }
            window.frameElement.height = document.body.scrollHeight;
        
        }
        function ForFilterOff() {
            selecttion();
            Show('tdgrdBrkgclient');
            Show('tr_export');
            Hide('tr_btn');
            Hide('tr_date');
            Hide('tr_under');
            window.frameElement.height = document.body.scrollHeight;
        }
        function MailsendT() {
            window.frameElement.height = document.body.scrollHeight;
            alert("Mail Sent Successfully");
        }
        function MailsendF() {
            window.frameElement.height = document.body.scrollHeight;
            alert("Error on sending!Try again..");
        }
        function MailsendFT() {
            alert("Email id could not found!Try again...");
        }


        function SendmailFilter() {
            document.getElementById('ShowSelectUser').style.display = 'none';
            window.frameElement.height = document.body.scrollHeight;

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
        }
        function Branch(obj) {
            if (obj == "a") {
                Hide('showFilter');
            }
            else {
                var cmb = document.getElementById('cmbsearchOption');
                cmb.value = 'Branch';
                Show('showFilter');
            }
            selecttion();
        }
        function Group(obj) {
            if (obj == "a") {
                Hide('showFilter');
            }
            else {
                var cmb = document.getElementById('cmbsearchOption');
                cmb.value = 'Group';
                Show('showFilter');
            }
            selecttion();
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
        }
        function SelectUserClient(obj) {
            if (obj == 'Client') {

                document.getElementById('ShowSelectUser').style.display = 'inline';
                window.frameElement.height = document.body.scrollHeight;

            }
            else if (obj == 'User') {
                document.getElementById('ShowSelectUser').style.display = 'inline';
                window.frameElement.height = document.body.scrollHeight;
            }
        }
        function isNumberKey(e) {
            var keynum
            var keychar
            var numcheck
            if (window.event)//IE
            {
                keynum = e.keyCode
                if (keynum >= 48 && keynum <= 57 || keynum == 46) {
                    return true;
                }
                else {
                    alert("Please Insert Numeric Only");
                    return false;
                }
            }

            else if (e.which) // Netscape/Firefox/Opera
            {
                keynum = e.which
                if (keynum >= 48 && keynum <= 57 || keynum == 46) {
                    return true;
                }
                else {
                    alert("Please Insert Numeric Only");
                    return false;
                }
            }
        }
        function SelectAll(id) {
            var frm = document.forms[0];
            var val;
            for (i = 0; i < frm.elements.length; i++) {
                if (frm.elements[i].type == "checkbox") {
                    frm.elements[i].checked = document.getElementById(id).checked;
                }
            }
            SelectSingle();
        }
        function DeliverableValue(objVal, StockPrevVal) {
            if (parseFloat(StockPrevVal) < parseFloat(objVal.value)) {
                alert('You Can Transfer Maximum ' + StockPrevVal + ' Amount');
                objVal.value = StockPrevVal;
            }
        }
        /////////////////////Show Footer Amount/////////////
        function SelectSingle() {
            var gridview = document.getElementById('grdBilling');
            var rCount = gridview.rows.length;
            var SumAmt = 0;
            var SumChq = 0;
            var chqNo1;
            var j = 0;
            var ModeType = document.getElementById('ddlPMode').value;
            for (i = 2; i < rCount; i++) {
                var leni;
                var a = new String(i)
                j = i - 1;
                var b = new String(j)
                if (a.length == 1)
                    leni = "0" + i;
                else
                    leni = i;
                if (b.length == 1)
                    j = "0" + j;
                var obj = 'grdBilling' + '_ctl' + leni + '_' + 'ChkDelivery';
                var txtVal = 'grdBilling' + '_ctl' + leni + '_' + 'txtPaying';
                var chqNo = 'grdBilling' + '_ctl' + leni + '_' + 'txtChqNo';
                if (i != 2)
                    chqNo1 = 'grdBilling' + '_ctl' + j + '_' + 'txtChqNo';
                if (document.getElementById(obj).checked == true) {
                    SumAmt = parseFloat(SumAmt) + parseFloat(document.getElementById(txtVal).value);
                    if (ModeType == 'C') {
                        if (i != 2) {
                            if (document.getElementById(chqNo1).value == '') {
                                if (SumChq != 0) {
                                    SumChq = 1 + parseFloat(SumChq);
                                    var Chq = new String(SumChq)
                                    if (Chq.length == 1)
                                        SumChq = "00000" + SumChq;
                                    else if (Chq.length == 2)
                                        SumChq = "0000" + SumChq;
                                    else if (Chq.length == 3)
                                        SumChq = "000" + SumChq;
                                    else if (Chq.length == 4)
                                        SumChq = "00" + SumChq;
                                    else if (Chq.length == 5)
                                        SumChq = "0" + SumChq;
                                    document.getElementById(chqNo).innerText = SumChq;
                                }

                            }
                            else {
                                SumChq = 1 + parseFloat(document.getElementById(chqNo1).value);
                                var Chq = new String(SumChq)
                                if (Chq.length == 1)
                                    SumChq = "00000" + SumChq;
                                else if (Chq.length == 2)
                                    SumChq = "0000" + SumChq;
                                else if (Chq.length == 3)
                                    SumChq = "000" + SumChq;
                                else if (Chq.length == 4)
                                    SumChq = "00" + SumChq;
                                else if (Chq.length == 5)
                                    SumChq = "0" + SumChq;
                                document.getElementById(chqNo).innerText = SumChq;
                            }


                        }
                        else
                            SumChq = document.getElementById(chqNo).value;
                    }

                }
                else {
                    if (ModeType == 'C')
                        document.getElementById(chqNo).innerText = '';
                }
            }
            var footerLab;
            var a = new String(rCount)
            if (a.length == 1)
                footerLab = "0" + rCount;
            else
                footerLab = rCount
            var FooterValue = 'grdBilling' + '_ctl' + footerLab + '_' + 'lbTransFerTotal';
            var NumberFor = intToFormat(SumAmt.toFixed(2));
            document.getElementById(FooterValue).innerText = NumberFor;
        }

        function intToFormat(nStr) {
            nStr += '';
            x = nStr.split('.');
            x1 = x[0];
            x2 = x.length > 1 ? '.' + x[1] : '';
            var rgx = /(\d+)(\d{3})/;
            var z = 0;
            var len = String(x1).length;
            var num = parseInt((len / 2) - 1);

            while (rgx.test(x1)) {
                if (z > 0) {
                    x1 = x1.replace(rgx, '$1' + ',' + '$2');
                }
                else {
                    x1 = x1.replace(rgx, '$1' + ',' + '$2');
                    rgx = /(\d+)(\d{2})/;
                }
                z++;
                num--;
                if (num == 0) {
                    break;
                }
            }
            return x1 + x2;
        }
        ///////////////////End/////////////////
        function BankChange() {
            SearchOnPrefix();
        }
        function SearchOnPrefix() {
            var date = document.getElementById('dtFor_I').value;
            var dateVal = date.split('-');
            var dateFval = dateVal[1] + "/" + dateVal[0] + "/" + dateVal[2];
            var bank = document.getElementById('ddlBankName').value;
            var dest = document.getElementById('lblValue');
            var CompID ="<%=Session["LastCompany"]%>";
                var SegID ="<%=Session["usersegid"]%>";
                var param = dateFval + '~' + bank + '~' + CompID + '~' + SegID;
                PageMethods.GetContactName(param, CallSuccess, CallFailed, dest);
            }
            function CallSuccess(res, destCtrl) {
                destCtrl.innerText = res;
                var cc = res.substr(0, 1);
                if (cc == '-')
                    destCtrl.style.color = 'red';
            }
            function CallFailed(res, destCtrl) {
                alert(res.get_message());
            }
            function AfterInsert() {
                alert('Generate Successfully !!');
                Hide('tabBankTran');
                Hide('td_grid');
                Hide('td_filter');
                height();
            }

            //Addition of Ac 
            function showOptions1(obj1, obj2, obj3) {
                ajax_showOptions(obj1, obj2, obj3, 'Ac Name1', 'Main');
            }
            function keyVal(obj) {

                var obj1 = obj.split('~');

                Mainvalue = "'" + obj1[0] + "'";
                document.getElementById('HdnMainAc').value = Mainvalue;
                document.getElementById('HdnSubLedgerType').value = obj1[1];
                document.getElementById('HdnForBranchGroup').value = 'a';

                if (obj1[2] == "MAINAC") {
                    Hide('showFilter');
                    document.getElementById("rdSubAcAll").checked = true;
                    document.getElementById("txtSelectionID").value = "";

                    var MainAcId = obj1[0];
                    var MainAcCode = "";
                    if (MainAcId > 9999) MainAcCode = 'SYSTM' + MainAcId;
                    else if (MainAcId > 999) MainAcCode = 'SYSTM0' + MainAcId;
                    else if (MainAcId > 99) MainAcCode = 'SYSTM00' + MainAcId;
                    else if (MainAcId > 9) MainAcCode = 'SYSTM000' + MainAcId;
                    else MainAcCode = 'SYSTM0000' + MainAcId;
                    document.getElementById("HdnMainAcCode").value = MainAcCode;

                    if (obj1[1] == 'CUSTOMERS') {
                        document.getElementById('TrForGroup').style.display = 'inline';
                        document.getElementById('TrSubAccount').style.display = 'inline';
                    }
                    else if (obj1[1] == 'CUSTOM' || obj1[1] == 'PRODUCTS-EQUITY' || obj1[1] == 'PRODUCTS-COMMODITY' ||
                        obj1[1] == 'PRODUCTS-MF' || obj1[1] == 'PRODUCTS-INSURANCE' || obj1[1] == 'PRODUCTS-CONSUMERFINANCE' || obj1[1] == 'RTAS' ||
                        obj1[1] == 'MFS' || obj1[1] == 'AMCS ' || obj1[1] == 'INSURANCE COS' || obj1[1] == 'CONSUMER FINANCE COS' ||
                        obj1[1] == 'CUSTODIANS' || obj1[1] == 'CONSULTANTS' || obj1[1] == 'SHARE HOLDER' || obj1[1] == 'DEBTORS' || obj1[1] == 'CREDITORS') {
                        document.getElementById('TrForGroup').style.display = 'none';
                        document.getElementById('TrSubAccount').style.display = 'inline';
                    }
                    else {
                        document.getElementById('TrForGroup').style.display = 'none';
                        document.getElementById('TrSubAccount').style.display = 'none';
                        if (obj1[1] != 'NSDL Clients' || obj1[1] != 'CDSL Clients')
                            document.getElementById('HdnForBranchGroup').value = obj1[1];
                    }
                }

                if (obj1[1] == 'None') {
                    document.getElementById('TrSubAccount').style.display = 'none';
                    document.getElementById('TrForGroup').style.display = 'none';
                }
                
            }
            function SubAcSelected(val) {
                if (val == "A") {
                    Hide('showFilter');
                    if (document.getElementById("HdnSubLedgerType").value=="CUSTOMERS")
                        document.getElementById('TrForGroup').style.display = 'inline';
                    else
                        document.getElementById('TrForGroup').style.display = 'none';
                }
                else {
                    Show('showFilter');
                    if (document.getElementById("HdnSubLedgerType").value=="CUSTOMERS")
                        document.getElementById('cmbsearchOption').value = 'Clients';
                    else
                        document.getElementById('cmbsearchOption').value = 'SubAccount';
                    document.getElementById('TrForGroup').style.display = 'none';
                }
            }
            function CallMainAccount(obj1, obj2, obj3) {
                var strQuery_Table = "Master_MainAccount";
                var strQuery_FieldName = " top 10 MainAccount_Name+\' [ \'+rtrim(ltrim(MainAccount_AccountCode))+\' ]\' as MainAccount_Name1,cast(MainAccount_ReferenceID as varchar)+\'~\'+MainAccount_SubLedgerType+\'~MAINAC~\'+MainAccount_AccountType as MainAccount_ReferenceID";
                var strQuery_WhereClause = " (MainAccount_Name like (\'%RequestLetter%\') or MainAccount_AccountCode like (\'%RequestLetter%\')) and isnull(MainAccount_BankCashType,'abc') not in('Cash','Bank')";
                var strQuery_OrderBy = '';
                var strQuery_GroupBy = '';
                var CombinedQuery = new String(strQuery_Table + "$" + strQuery_FieldName + "$" + strQuery_WhereClause + "$" + strQuery_OrderBy + "$" + strQuery_GroupBy);
                ajax_showOptions(obj1, obj2, obj3, replaceChars(CombinedQuery), 'Main');
            }
            function replaceChars(entry) {
                out = "+"; // replace this
                add = "--"; // with this
                temp = "" + entry; // temporary holder

                while (temp.indexOf(out) > -1) {
                    pos = temp.indexOf(out);
                    temp = "" + (temp.substring(0, pos) + add +
                        temp.substring((pos + out.length), temp.length));
                }
                return temp;

            }
        //End 
    </script>

    <script type="text/ecmascript">   
            function ReceiveServerData(rValue) {
                var j = rValue.split('~');

                if (j[0] == 'Group') {
                    groupvalue = j[1];
                    document.getElementById('HdnGroup').value = groupvalue;
                }
                if (j[0] == 'Branch') {
                    groupvalue = j[1];
                    document.getElementById('HdnBranch').value = groupvalue;
                }
                if (j[0] == 'SubAccount') {
                    groupvalue = j[1];
                    document.getElementById('HdnSubAc').value = groupvalue;
                }
                if(j[0]=='Clients'){
                    groupvalue = j[1];
                    document.getElementById('HdnClient').value = groupvalue;
                }

                var btn = document.getElementById('btnhide');
                btn.click();
            }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server" autocomplete="off">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True" AsyncPostBackTimeout="3600">
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

            <table class="TableMain100">
                <tr class="EHEADER">
                    <td colspan="0" style="text-align: center; height: 22px;">
                        <strong><span id="SpanHeader" style="color: #000099">Generate Payout Voucher</span></strong>
                    </td>
                    <td id="td_filter">
                        <a href="javascript:void(0);" onclick="Filter();"><span style="color: Blue; text-decoration: underline;
                            font-size: 8pt; font-weight: bold">Filter</span></a>
                    </td>
                </tr>
            </table>
            <!--Account Info Addition-->
            <table id="MainTable" cellspacing="1" cellpadding="2" style="float:left;background-color: #B7CEEC; border: solid 1px  #ffffff" border="1">
                <tr>
                    <td class="gridcellleft" id="TdAc">Main Account Name
                    </td>
                    <td style="text-align: left;" id="TdAc1">
                        <table>
                            <tr>
                                <td>
                                    <asp:TextBox ID="txtMainAccount" runat="server" Font-Size="10px" onkeyup="CallMainAccount(this,'GenericAjaxList',event)"
                                        Width="198px"></asp:TextBox>
                                    <asp:HiddenField ID="txtMainAccount_hidden" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="TrSubAccount">
                    <td class="gridcellleft">Sub Account Name:
                    </td>
                    <td style="text-align: left;">
                        <table>
                            <tr>
                                <td>
                                    <asp:RadioButton ID="rdSubAcAll" runat="server" Checked="True" GroupName="c" onclick="SubAcSelected('A')" />
                                </td>
                                <td>All
                                </td>
                                <td>
                                    <asp:RadioButton ID="rdSubAcSelected" runat="server" GroupName="c" onclick="SubAcSelected('S')" />
                                </td>
                                <td>Selected
                                </td>
                                <td>
                                    <span id="Span2" runat="server" style="color: Maroon"></span>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="TrForGroup">
                    <td class="gridcellleft">Group By : </td>
                    <td>
                        <table>
                            <tr>
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
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft">For Date : </td>
                    <td>
                        <dxe:ASPxDateEdit ID="dtFor" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                            Font-Size="10px" Width="108px" ClientInstanceName="dtfor">
                            <DropDownButton Text="For">
                            </DropDownButton>
                        </dxe:ASPxDateEdit>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft" bgcolor="#B7CEEC">Consider Clients With Payable Amount >=
                    </td>
                    <td>
                        <dxe:ASPxTextBox ID="txtAmntGreaterThan" runat="server" HorizontalAlign="Right" Width="100px">
                            <MaskSettings Mask="&lt;0..9999999999g&gt;.&lt;00..99&gt;" IncludeLiterals="DecimalSymbol" />
                            <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>
                        </dxe:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft">Payment Mode :
                    </td>
                    <td colspan="2">
                        <asp:DropDownList ID="ddlPMode" Font-Size="10px" runat="server">
                            <asp:ListItem Value="C">Cheque</asp:ListItem>
                            <asp:ListItem Value="E">E Transfer</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="3">
                        <asp:Button ID="btn_show" OnClientClick="selecttion()" CssClass="btnUpdate" Height="20px"
                            Width="90px" runat="server" Text="Show" OnClick="btn_show_Click" />
                    </td>
                </tr>
            </table>
            <!--End Account Info Addition-->
            <table>
                <tr>
                   <td  colspan="4">
                        <table id="showFilter" cellspacing="1" cellpadding="2" style="float:left;background-color: #B7CEEC; border: solid 1px  #ffffff" border="1">
                            <tr>
                                <td style="text-align: right; vertical-align: top; height: 134px;">
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="gridcellleft" style="vertical-align: top; text-align: right" id="TdFilter">
                                                <span id="spanunder"></span><span id="spanclient">
                                                    <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="200px" onkeyup="FunClientScrip(this,'ShowClientFORMarginStocks',event)"></asp:TextBox></span>
                                                <asp:DropDownList ID="cmbsearchOption" runat="server" Font-Size="11px" Width="70px"
                                                    Enabled="false">
                                                    <asp:ListItem>Clients</asp:ListItem>
                                                    <asp:ListItem>Branch</asp:ListItem>
                                                    <asp:ListItem>Group</asp:ListItem>
                                                    <asp:ListItem>Ac Name</asp:ListItem>
                                                    <asp:ListItem>SubAccount</asp:ListItem>
                                                </asp:DropDownList>
                                                <a id="A4" href="javascript:void(0);" onclick="btnAddsubscriptionlist_click()"><span
                                                    style="color: #009900; text-decoration: underline; font-size: 8pt;">Add to List</span></a><span
                                                        style="color: #009900; font-size: 8pt;"> </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="gridcellleft" style="vertical-align: top; text-align: right">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
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
                            <tr style="display: none">
                                <td style="height: 23px" align="right">
                                    <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="1px"></asp:TextBox></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel2">
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
                                                            <font size='2' face='Tahoma'><strong align='center'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Loading..</strong></font></td>
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
            <table>
                <tr>
                    <td style="display: none;">
                        <asp:Button ID="btnhide" runat="server" Text="Button" OnClientClick="selecttion()"
                            OnClick="btnhide_Click" /></td>
                </tr>
            </table>
            
            <table id="tabBankTran" cellspacing="1" cellpadding="2" style="background-color: #B7CEEC; border: solid 1px  #ffffff" border="1">
                <tr>
                    <td class="gridcellleft">
                        Bank Name</td>
                    <td>
                        <asp:DropDownList ID="ddlBankName" OnChange="javascript:BankChange();" Font-Size="10px"
                            runat="server">
                        </asp:DropDownList>
                    </td>
                    <td class="gridcellleft">
                        Current Balance :</td>
                    <td>
                        <asp:Label ID="lblValue" runat="server" Width="332px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft">
                        Main Narration</td>
                    <td>
                        <asp:TextBox ID="txtMainNarration" Font-Size="10px" TextMode="MultiLine" runat="server"
                            Height="65px" Width="273px"></asp:TextBox>
                    </td>
                    <td class="gridcellleft">
                        Line Narration</td>
                    <td>
                        <asp:TextBox ID="txtLineNarration" Font-Size="10px" TextMode="MultiLine" runat="server"
                            Height="63px" Width="293px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft">
                        Transaction Date</td>
                    <td>
                        <asp:Label ID="lblTrDate" runat="server" Text=""></asp:Label>
                    </td>
                    <td>
                        Export
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlExport" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlExport_SelectedIndexChanged" Width="100px">
                            <asp:ListItem Value="Ex" Selected="True">Export</asp:ListItem>
                            <asp:ListItem Value="E">Excel</asp:ListItem>
                            <asp:ListItem Value="P">PDF</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td id="td_grid">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:GridView ID="grdBilling" runat="server" BorderColor="CornflowerBlue" ShowFooter="True"
                                    AutoGenerateColumns="false" BorderStyle="Solid" AllowSorting="true" BorderWidth="2px"
                                    CellPadding="4" ForeColor="#0000C0" OnRowCreated="grdBilling_RowCreated" OnRowDataBound="grdBilling_RowDataBound">
                                    <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True"></FooterStyle>
                                    <Columns>
                                        <asp:TemplateField HeaderText="Account Code" Visible="false">
                                            <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="left"></ItemStyle>
                                            <HeaderStyle Wrap="False" HorizontalAlign="center" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblCusid" runat="server" Text='<%# Eval("SubAc")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Account Name">
                                            <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                            <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblclientname" runat="server" Text='<%# Eval("Name")%>' CssClass="gridstyleheight1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="UCC">
                                            <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                            <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblclientucc" runat="server" Text='<%# Eval("UCC")%>' CssClass="gridstyleheight1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Net Payable">
                                            <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                            <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblNetPayable" runat="server" Text='<%# Eval("Payable")%>' CssClass="gridstyleheight1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Transfer">
                                            <ItemStyle Font-Size="10px" BorderWidth="1px" Wrap="False" HorizontalAlign="Right"></ItemStyle>
                                            <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtPaying" Font-Size="10px" Width="130px" runat="server" Text='<%# Eval("Paying") %>'
                                                    Style="text-align: right;" Onkeypress="javascript:return isNumberKey(event);"></asp:TextBox>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:Label ID="lbTransFerTotal" runat="server"></asp:Label>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cheque No">
                                            <ItemStyle Font-Size="10px" BorderWidth="1px" Wrap="False" HorizontalAlign="Right"></ItemStyle>
                                            <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtChqNo" Font-Size="10px" Width="130px" runat="server"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                            <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="ChkDelivery" runat="server" onclick="SelectSingle()" />
                                            </ItemTemplate>
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="cbSelectAll" runat="server" />
                                            </HeaderTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <RowStyle BackColor="#FFFFFF" ForeColor="#330099" BorderColor="#BFD3EE" BorderStyle="Double"
                                        BorderWidth="1px"></RowStyle>
                                    <EditRowStyle BackColor="#E59930"></EditRowStyle>
                                    <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" Font-Bold="True"></SelectedRowStyle>
                                    <PagerStyle ForeColor="White" HorizontalAlign="Center"></PagerStyle>
                                    <HeaderStyle ForeColor="Black" BorderWidth="1px" CssClass="EHEADER" BorderColor="AliceBlue"
                                        Font-Bold="False"></HeaderStyle>
                                    <%--<AlternatingRowStyle BackColor="White"></AlternatingRowStyle>--%>
                                </asp:GridView>
                                <asp:HiddenField ID="TotalGROUP" runat="server" />
                                <asp:HiddenField ID="CurrentPage" runat="server"></asp:HiddenField>
                                <asp:HiddenField ID="TotalPages" runat="server"></asp:HiddenField>
                                <asp:HiddenField ID="TotalClient" runat="server" />
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btn_show" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr id="trGenerate">
                    <td>
                        <asp:Button ID="btnGenerate" runat="server" Text="Generate" CssClass="btnUpdate" OnClientClick="selecttion()"
                            OnClick="btnGenerate_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <div style="display:none">
            <asp:HiddenField ID="HdnBranch" runat="server" />
            <asp:HiddenField ID="HdnMainAc" runat="server" />
            <asp:HiddenField ID="HdnMainAcCode" runat="server" />
            <asp:HiddenField ID="HdnClient" runat="server" />
            <asp:HiddenField ID="HdnSubAc" runat="server" />
            <asp:HiddenField ID="HdnSubLedgerType" runat="server" />
            <asp:HiddenField ID="HdnGroup" runat="server" />
            <asp:HiddenField ID="HdnForBranchGroup" runat="server" />
        </div>
    </form>
</body>
</html>
