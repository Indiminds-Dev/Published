<%@ page language="C#" autoeventwireup="true" enableeventvalidation="false" inherits="management_changeclienttradesCOMM, App_Web_vvdfezxa" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
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

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>Change Client Trades</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
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
        width:85%;
        scrollbar-base-color: #C0C0C0;
    
    }
	</style>
    <script language="javascript" type="text/javascript">
        function Page_Load()///Call Into Page Load
        {
            document.getElementById('txtClientFrom').focus();
            document.getElementById('txtClientFrom').select();
            Hide('showFilter');
            Hide('td_Show');
            Hide('tab2');
            Hide('td_Summary1');
            Hide('td_Summary2');
            //#Region Search By Assest Or Scrip
            var exchSeg = '<%=Session["Segmentname"]%>';
                 if (exchSeg.search("COMM")>0 || exchSeg.search("CDX")>0) {
                     FillAllInstrumentType();
                     Hide('tdInstruType');
                     Show('trAssetScrip');
                     Hide('trSCrip');
                 }
                 else {
                     Hide('trAssetScrip');
                     Show('trSCrip');
                     Hide('tdInstruType');
                 }
                 Hide('Tr_Assets');
                 //#endRegion
                 height();
        }
        //#Region Search By Assest Or Scrip
        function SearchByAssetOrScript(obj) {
            if (obj == "ASSETS") {
                document.getElementById("Tr_Assets").style.display = "inline";
                document.getElementById("rdbunderlyingall").checked = true;
                document.getElementById("Tr_Scrip").style.display = "none";
            }
            else {
                document.getElementById("Tr_Assets").style.display = "none";
                document.getElementById("Tr_Scrip").style.display = "inline";
            }
        }
        function FnScrips(obj) {
            if (obj == "a") {
                Hide('showFilter');
            }
            else {
                var cmb = document.getElementById('cmbsearchOption');
                cmb.value = 'ScripsExchange';
                Show('showFilter');
            }
            height();
        }
        function AddComboItem(ddlText, ddlValue) {
            var ddlinstrutype = document.getElementById('<%=cmbinstrutype.ClientID%>');
            var myoption = document.createElement("option");
            myoption.text = ddlText;
            myoption.value = ddlValue;
            ddlinstrutype.options.add(myoption);
        }
        function FillAllInstrumentType() {
            var ddlinstrutype = document.getElementById('<%=cmbinstrutype.ClientID%>');
            ddlinstrutype.options.length = 0;
            AddComboItem('NA', '0');
            ddlinstrutype.selectedIndex = 0;
        }
        function fnunderlying(obj) {
            if (obj == "a") {
                Hide('showFilter');
                var exchSeg = '<%=Session["Segmentname"]%>';
                if (exchSeg.search("COMM") || exchSeg.search("CDX"))
                    FillAllInstrumentType();
            }
            else {
                var cmb = document.getElementById('cmbsearchOption');
                cmb.value = 'Product';
                Show('showFilter');
            }
            height();
        }
        function fn_InstrumentType(obj) {
            var selectedFOIdentifier = document.getElementById('HiddenField_SelectedFOIdentifier');
            if (obj == "0")
                selectedFOIdentifier.value = "FUTSTK,OPTSTK,FUTIDX,OPTIDX";
            else if (obj == "1")
                selectedFOIdentifier.value = "FUTSTK,OPTSTK";
            else if (obj == "2")
                selectedFOIdentifier.value = "FUTSTK";
            else if (obj == "3")
                selectedFOIdentifier.value = "OPTSTK";
            else if (obj == "4")
                selectedFOIdentifier.value = "FUTIDX,OPTIDX";
            else if (obj == "5")
                selectedFOIdentifier.value = "FUTIDX";
            else if (obj == "6")
                selectedFOIdentifier.value = "OPTIDX";
            else if (obj == "7")
                selectedFOIdentifier.value = "FUTSTK,FUTIDX";
            else if (obj == "8")
                selectedFOIdentifier.value = "OPTSTK,OPTIDX";
        }
        //#end Region
        function height() {
            if (document.body.scrollHeight >= 450) {
                window.frameElement.height = document.body.scrollHeight;
            }
            else {
                window.frameElement.height = '450px';
            }

        }
        function Hide(obj) {
            document.getElementById(obj).style.display = 'none';
        }
        function Show(obj) {
            document.getElementById(obj).style.display = 'inline';
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
                alert('Please Search Name And Then Add!')
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

        function fn_Scrip(obj) {
            if (document.getElementById('txtClientFrom_hidden').value != '' && document.getElementById('txtClientTo_hidden').value != '') {
                if (obj == "a")
                    Hide('showFilter');
                else {
                    var cmb = document.getElementById('cmbsearchOption');
                    cmb.value = 'ScripsExchange';
                    Show('showFilter');

                }
            }
            else {
                alert('Please Select Client!');
                document.getElementById('rdbScripAll').checked = true;
            }

        }
        function fn_OrderNo(obj) {
            if (document.getElementById('txtClientFrom_hidden').value != '' && document.getElementById('txtClientTo_hidden').value != '') {
                if (obj == "a")
                    Hide('showFilter');
                else {
                    var cmb = document.getElementById('cmbsearchOption');
                    cmb.value = 'OrdernoCriteria';
                    Show('showFilter');
                }
            }
            else {
                alert('Please Select Client!');
                document.getElementById('rdbAllOrder').checked = true;
            }
        }
        function fn_TerminalId(obj) {
            if (document.getElementById('txtClientFrom_hidden').value != '' && document.getElementById('txtClientTo_hidden').value != '') {

                if (obj == "a")
                    Hide('showFilter');
                else {
                    var cmb = document.getElementById('cmbsearchOption');
                    cmb.value = 'TerminalIdCriteria';
                    Show('showFilter');
                }
            }
            else {
                alert('Please Select Client!');
                document.getElementById('rdbTerminalAll').checked = true;
            }

        }
        function fn_CTCLId(obj) {
            if (document.getElementById('txtClientFrom_hidden').value != '' && document.getElementById('txtClientTo_hidden').value != '') {
                if (obj == "a")
                    Hide('showFilter');
                else {
                    var cmb = document.getElementById('cmbsearchOption');
                    cmb.value = 'CTCLIdCriteria';
                    Show('showFilter');
                }
            }
            else {
                alert('Please Select Client!');
                document.getElementById('rdbCTCLALL').checked = true;
            }
        }
        function fn_ACType(obj) {
            if (document.getElementById('txtClientFrom_hidden').value != '' && document.getElementById('txtClientTo_hidden').value != '') {
                if (obj == "B") {
                    Hide('showFilter');
                    Show('td_cli');
                    Show('td_pro');
                    Hide('td_sectedac');

                }
                if (obj == "C") {
                    Show('td_cli');
                    Hide('td_pro');
                    Show('td_sectedac');
                    Hide('showFilter');

                }
                if (obj == "P") {
                    Hide('showFilter');
                    Show('td_cli');
                    Show('td_pro');
                    Hide('td_sectedac');
                }

            }
            else {
                alert('Please Select Client!');
                document.getElementById('rdbBothACType').checked = true;
                Hide('showFilter');
                Show('td_cli');
                Show('td_pro');
                Hide('td_sectedac');
            }
        }
        function fn_Accode(obj) {
            if (document.getElementById('txtClientFrom_hidden').value != '' && document.getElementById('txtClientTo_hidden').value != '') {
                if (obj == "a")
                    Hide('showFilter');
                else {
                    var cmb = document.getElementById('cmbsearchOption');
                    cmb.value = 'CliCustomerucc';
                    Show('showFilter');
                }
            }
            else {
                alert('Please Select Client!');
                document.getElementById('rdallAccode').checked = true;
            }
        }
        function fn_displayscreen(obj) {
            if (obj.checked == true) {
                Hide('td_displayscreen');
                Hide('td_Show');
                Show('td_excelbn');
                Show('td_generatedbn');
                Hide('td_Summary1');
                Hide('td_Summary2');
            }
            else {
                Show('td_displayscreen');
                Show('td_Show');
                Hide('td_generatedbn');
                Hide('td_excelbn');
                Show('td_Summary1');
                Show('td_Summary2');
            }

        }
        function fn_displaysummary(obj) {
            if (obj.checked == true) {
                Show('ShowSummary');
            }
            else {
                Hide('ShowSummary');
            }

        }

        function fn_callajax(objID, objListFun, objEvent) {
            cmbVal = document.getElementById('cmbsearchOption').value;
            var date2 = null;
            var date1 = dtfor.GetDate();
            if (date1 != null) {
                date2 = parseInt(date1.getMonth() + 1) + '-' + date1.getDate() + '-' + date1.getFullYear();
            }
            var criteritype = 'B';


            if (cmbVal != 'ScripsExchange') {
                criteritype = '  comexchangetrades_tradedate="' + date2 + '" AND ';
                criteritype = criteritype.replace('"', "'");
                criteritype = criteritype.replace('"', "'");
                criteritype = criteritype + '  comexchangetrades_customerid="' + document.getElementById('txtClientFrom_hidden').value + '" ';
                criteritype = criteritype.replace('"', "'");
                criteritype = criteritype.replace('"', "'");
                cmbVal = cmbVal + '~' + criteritype;
            }
            else {
                criteritype = ' AND commodity_ExpiryDate>="' + date2 + '"  ';
                criteritype = criteritype.replace('"', "'");
                criteritype = criteritype.replace('"', "'");
                cmbVal = cmbVal + '~' + 'Date' + '~' + criteritype;
            }
            ajax_showOptions(objID, objListFun, objEvent, cmbVal);
        }
        function fn_callajaxclientto(objID, objListFun, objEvent, objCreteria) {
            if (document.getElementById('txtClientFrom_hidden').value != '') {

                objCreteria = objCreteria + '~' + "'" + document.getElementById('txtClientFrom_hidden').value + "'";
                ajax_showOptions(objID, objListFun, objEvent, objCreteria);
            }
            else {
                alert('Please Select Client!');
            }
        }
        function txtclientonblur() {
            if (document.getElementById('txtClientFrom').value != '') {
                document.getElementById('txtClientTo').disabled = false;
                document.getElementById('txtClientTo').focus();
                document.getElementById('txtClientTo').select();
            }
            else {

                document.getElementById('txtClientFrom_hidden').value = '';
                document.getElementById('txtClientTo').value = '';
                document.getElementById('txtClientTo_hidden').value = '';
                if (document.getElementById('txtClientFrom_hidden').value == '') {
                    document.getElementById('txtClientTo').disabled = true;
                }
            }
        }
        function alertstatus(obj) {
            if (obj == '1') {
                alert('Trade Change Successfully !!');
            }
            if (obj == '2') {
                alert('No Record Found !!');
            }
            if (obj == '4') {
                alert('Please Select Client!');
            }
            Hide('tab2');
            Show('tab1');
            Hide('showFilter');
            height();
        }
        function fngridbind(obj) {
            Show('tab2');
            Hide('tab1');
            DIVdisplayPERIOD.innerHTML = obj;
            if (document.getElementById('ChkSummary').checked == false) {
                Hide('ShowSummary');
            }
            height();
        }
        function PopUpOpenForShowSummary() {
            var url = 'changeclienttradeshowsummary.aspx';
            parent.OnMoreInfoClick(url, "Show Summary", '500px', '350px', "Y");
        }
        function OnAllCheckedChanged() {
            if (document.getElementById('ChkSummary').checked == false) {
                Show('tdShow');
                cCbpComon.PerformCallback();
            }
        }
        function CbpComon_EndCallBack() {
            //alert(cCbpComon.cpSummary); 
            if (cCbpComon.cpSummary != null) {
                document.getElementById("DivSummary").innerHTML = cCbpComon.cpSummary;
            }
        }
        FieldName = 'lstSlection';
    </script>
    <script type="text/ecmascript">   
        function ReceiveServerData(rValue) {
            var j = rValue.split('~');
            if (j[0] == 'ScripsExchange') {
                document.getElementById('HiddenField_ScripsExchange').value = j[1];
            }
            if (j[0] == 'OrdernoCriteria') {
                document.getElementById('HiddenField_OrdernoCriteria').value = j[1];
            }
            if (j[0] == 'TerminalIdCriteria') {
                document.getElementById('HiddenField_TerminalIdCriteria').value = j[1];
            }
            if (j[0] == 'CTCLIdCriteria') {
                document.getElementById('HiddenField_CTCLIdCriteria').value = j[1];
            }
            if (j[0] == 'CliCustomerucc') {
                document.getElementById('HiddenField_CliCustomerucc').value = j[1];
            }
            //#Region Search By Assest Or Scrip
            if (j[0] == 'Product') {
                document.getElementById('HiddenField_ScripsExchange').value = j[1];
            }
            //#endRegion
        }
    </script>
   

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server" autocomplete="off">
        <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600">
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
                    <strong><span id="SpanHeader" style="color: #000099">Change Client Trades</span></strong></td>
               
                 
               
            </tr>
        </table>
        <table id="tab1" border="0" cellpadding="0" cellspacing="0">
            <tr valign="top">
                <td colspan="2" class="gridcellleft">
                    <table border="10" cellpadding="1" cellspacing="1">
                        <tr>
                            <td>
                                <asp:CheckBox ID="ChkExchange" runat="server" />
                            </td>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Report Changes To Exchange</td>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Date:
                            </td>
                            <td>
                                <dxe:ASPxDateEdit ID="dtFor" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                    Font-Size="10px" Width="108px" ClientInstanceName="dtfor">
                                    <DropDownButton Text="For">
                                    </DropDownButton>
                                </dxe:ASPxDateEdit>
                            </td>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                From Client:
                            </td>
                            <td>
                                <asp:TextBox ID="txtClientFrom" runat="server" Width="200px" Font-Size="10px" onfocusout="txtclientonblur();"></asp:TextBox>
                            </td>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                To Client:
                            </td>
                            <td>
                                <asp:TextBox ID="txtClientTo" runat="server" Width="200px" Font-Size="10px" onkeyup="fn_callajaxclientto(this,'ShowClientFORMarginStocks',event,'ClientsNotIn')"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="gridcellleft">
                    <table>
                        <tr>
                            <td>
                                <asp:CheckBox ID="chkdisplay" runat="server" Checked="true" onclick="fn_displayscreen(this)" /></td>
                            <td>
                                Do Not Display On Screen</td>
                            <td id="td_displayscreen" style="color: Red; display: none;">
                                (Please Note That Displaying On Screen May Slow Down The Routine )</td>
                            <td id="td_Summary1">
                                <asp:CheckBox ID="ChkSummary" runat="server" Checked="true" onclick="fn_displaysummary(this)" /></td>
                            <td id="td_Summary2">
                              Do Not Display Summary</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr valign="top">
                <td class="gridcellleft">
                    <table border="10" cellpadding="1" cellspacing="1">
                        <tr id="trScrip">
                            <td>
                                <table>
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 50%">
                                            Scrip :</td>
                                        <td>
                                            <asp:RadioButton ID="rdbScripAll" runat="server" Checked="True" GroupName="c" onclick="fn_Scrip('a')" />
                                            All
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbScripSelected" runat="server" GroupName="c" onclick="fn_Scrip('b')" />
                                            Selected
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="trAssetScrip">
                            <td>
                                <table  border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td bgcolor="#b7ceec" class="gridcellleft">Search By</td>
                                        <td>
                                            <asp:RadioButton ID="rdbAssets" runat="server" GroupName="SearchBy" onclick="SearchByAssetOrScript('ASSETS')"
                                                Text="Assets(s)" />
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbscrips" runat="server" Checked="True" GroupName="SearchBy"
                                                onclick="SearchByAssetOrScript('SCRIP')" Text="Scrip(s)" /></td>
                                    </tr>
                                    <tr id="Tr_Scrip">
                                        <td class="gridcellleft" bgcolor="#B7CEEC">Scrip(s)</td>
                                        <td>
                                            <asp:RadioButton ID="rdInstrumentAll" runat="server" Checked="True" GroupName="Instr"
                                                onclick="FnScrips('a')" />
                                            All
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdInstrumentSelected" runat="server" GroupName="Instr" onclick="FnScrips('b')" />
                                            Selected
                                        </td>
                                    </tr>
                                    <tr id="Tr_Assets">
                                        <td bgcolor="#b7ceec" class="gridcellleft">Asset(s)</td>
                                        <td>
                                            <asp:RadioButton ID="rdbunderlyingall" runat="server" Checked="True" GroupName="A"
                                                onclick="fnunderlying('a')" />All</td>
                                        <td>
                                            <asp:RadioButton ID="rdbunderlyingselected" runat="server" GroupName="A" onclick="fnunderlying('b')" />Selected</td>
                                    </tr>
                                    <tr id="tdInstruType" >
                                        <td bgcolor="#b7ceec" class="gridcellleft">Instrument Type :</td>
                                        <td colspan="2">
                                            <asp:DropDownList ID="cmbinstrutype" runat="server" Font-Size="10px" Width="125px" onchange="fn_InstrumentType(this.value)">
                                            </asp:DropDownList></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 50%">
                                            Order No :</td>
                                        <td>
                                            <asp:RadioButton ID="rdbAllOrder" runat="server" Checked="True" GroupName="d" onclick="fn_OrderNo('a')" />
                                            All
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbOrderSelected" runat="server" GroupName="d" onclick="fn_OrderNo('b')" />
                                            Selected
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 50%">
                                            Terminal Id:
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbTerminalAll" runat="server" Checked="True" GroupName="e"
                                                onclick="fn_TerminalId('a')" />
                                            All
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbTerminalSelected" runat="server" GroupName="e" onclick="fn_TerminalId('b')" />
                                            Selected
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 50%">
                                            CTCL Id:
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbCTCLALL" runat="server" Checked="True" GroupName="f" onclick="fn_CTCLId('a')" />
                                            All
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbCTCLSelected" runat="server" GroupName="f" onclick="fn_CTCLId('b')" />
                                            Selected
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 30%">
                                            A/C Type:
                                        </td>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td id="td_Both">
                                                        <asp:RadioButton ID="rdbBothACType" runat="server" Checked="True" GroupName="g" onclick="fn_ACType('B')"/>
                                                        Both
                                                    </td>
                                                    <td id="td_cli">
                                                        <asp:RadioButton ID="rdbCliACType" runat="server" GroupName="g" onclick="fn_ACType('C')"/>
                                                        Cli
                                                    </td>
                                                    <td id="td_pro">
                                                        <asp:RadioButton ID="rdbProACType" runat="server" GroupName="g" onclick="fn_ACType('P')"/>
                                                        Pro
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td id="td_sectedac" style="display:none;">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:RadioButton ID="rdallAccode" runat="server" Checked="True" GroupName="ff" onclick="fn_Accode('a')" />
                                                        All
                                                    </td>
                                                    <td>
                                                        <asp:RadioButton ID="rdSeclectedAccode" runat="server" GroupName="ff" onclick="fn_Accode('b')" />
                                                        Selected
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 50%">
                                            Trade Type:
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbtradetypeall" runat="server" Checked="True" GroupName="h" />
                                            All
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbtradetypebuy" runat="server" GroupName="h" />
                                            Buy
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbtradetypesell" runat="server" GroupName="h" />
                                            Sell
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 50%">
                                            Trade Time :
                                        </td>
                                        <td>
                                            <dxe:ASPxTextBox ID="txtfromtime" runat="server" HorizontalAlign="Left" Width="100px"
                                                Text="00:00:00">
                                                <ValidationSettings ErrorDisplayMode="None">
                                                </ValidationSettings>
                                                <MaskSettings Mask="HH:mm:ss" />
                                            </dxe:ASPxTextBox>
                                        </td>
                                        <td>
                                            To
                                        </td>
                                        <td>
                                            <dxe:ASPxTextBox ID="txttotime" runat="server" HorizontalAlign="Left" Width="100px"
                                                Text="23:59:59">
                                                <ValidationSettings ErrorDisplayMode="None">
                                                </ValidationSettings>
                                                <MaskSettings Mask="HH:mm:ss" />
                                            </dxe:ASPxTextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 50%">
                                            Mkt Price Range :
                                        </td>
                                        <td>
                                            <dxe:ASPxTextBox ID="txtmktpriceto" runat="server" HorizontalAlign="Left" Width="100px"
                                                Text="00.0000">
                                                <ValidationSettings ErrorDisplayMode="None">
                                                </ValidationSettings>
                                                <MaskSettings Mask="&lt;0..999999999999999999g&gt;.&lt;0000..9999&gt;" IncludeLiterals="DecimalSymbol" />
                                            </dxe:ASPxTextBox>
                                        </td>
                                        <td>
                                            To
                                        </td>
                                        <td>
                                            <dxe:ASPxTextBox ID="txtmktpricefrom" runat="server" HorizontalAlign="Left" Width="100px"
                                                Text="00.0000">
                                                <ValidationSettings ErrorDisplayMode="None">
                                                </ValidationSettings>
                                                <MaskSettings Mask="&lt;0..999999999999999999g&gt;.&lt;0000..9999&gt;" IncludeLiterals="DecimalSymbol" />
                                            </dxe:ASPxTextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                         <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 50%">
                                            Sort Order :
                                        </td>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:RadioButton ID="rdSororder1" runat="server" Checked="True" GroupName="hh" />
                                                        Scrip+Buy/Sell+Time
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:RadioButton ID="rdSororder2" runat="server" GroupName="hh" />
                                                        Time
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:RadioButton ID="rdSororder3" runat="server" GroupName="hh" />
                                                        Scrip+Time
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td id="td_generatedbn">
                                            <asp:Button ID="btngeneratetrade" runat="server" CssClass="btnUpdate" Height="20px"
                                                Text="Change Trade" Width="101px" OnClick="btngeneratetrade_Click" /></td>
                                        <td id="td_excelbn">
                                            <asp:Button ID="btnexcelopen" runat="server" CssClass="btnUpdate" Height="20px" Text="Open To Excel"
                                                Width="101px" OnClick="btnexcelopen_Click" /></td>
                                        <td id="td_Show">
                                            <asp:Button ID="btnShow" runat="server" CssClass="btnUpdate" Height="20px" Text="Screen"
                                                Width="101px" OnClick="btnShow_Click" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="gridcellleft">
                    <table id="showFilter"  border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="300px" onkeyup="fn_callajax(this,'ShowClientFORMarginStocks',event)"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="cmbsearchOption" runat="server" Font-Size="11px" Width="70px"
                                                            Enabled="false">
                                                            <asp:ListItem>ScripsExchange</asp:ListItem>
                                                            <asp:ListItem>OrdernoCriteria</asp:ListItem>
                                                            <asp:ListItem>TerminalIdCriteria</asp:ListItem>
                                                            <asp:ListItem>CTCLIdCriteria</asp:ListItem>
                                                            <asp:ListItem>CliCustomerucc</asp:ListItem>
                                                            <asp:ListItem>Scrips</asp:ListItem>
                                                            <asp:ListItem>Product</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        <a id="A4" href="javascript:void(0);" onclick="btnAddsubscriptionlist_click()"><span
                                                            style="color: #2554C7; text-decoration: underline; font-size: 8pt;"><b>Add to List</b></span></a><span
                                                                style="color: #009900; font-size: 8pt;"> </span>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:ListBox ID="lstSlection" runat="server" Font-Size="10px" Height="100px" Width="400px">
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
        <table>
            <tr>
                <td style="display: none;">
                    <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="150px"></asp:TextBox>
                    <asp:TextBox ID="txtClientFrom_hidden" runat="server" Width="5px"></asp:TextBox>
                    <asp:TextBox ID="txtClientTo_hidden" runat="server" Width="5px"></asp:TextBox>
                    <asp:HiddenField ID="HiddenField_ScripsExchange" runat="server" />
                    <asp:HiddenField ID="HiddenField_OrdernoCriteria" runat="server" />
                    <asp:HiddenField ID="HiddenField_TerminalIdCriteria" runat="server" />
                    <asp:HiddenField ID="HiddenField_CTCLIdCriteria" runat="server" />
                    <asp:HiddenField ID="HiddenField_CliCustomerucc" runat="server" />
                    <asp:HiddenField ID="HiddenField_SelectedFOIdentifier" runat="server" />
                    <asp:HiddenField ID="HiddenField_Product" runat="server" />
                    <asp:HiddenField ID="HiddenField_Instrument" runat="server" />
                </td>
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
        <table id="tab2">
            <tr>
                <td>
                    <div id="DIVdisplayPERIOD" runat="server" style="border:2px solid #87CEEB;">
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                  <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                         <ContentTemplate>
                             <table>
                                 <tr>
                                     <td> <asp:Button ID="btnChangeAll" runat="server" Text="Change ALL" CssClass="btnUpdate"
                                             Height="20px" OnClick="btnChangeAll_Click" />
                                       
                                     </td>
                                     <td>
                                          <asp:Button ID="btnChangeSelected" runat="server" Text="Change Selected" CssClass="btnUpdate"
                                             Height="20px" OnClick="btnChangeSelected_Click" />
                                     </td>
                                     <td>
                                         <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btnUpdate" Height="20px"
                                             OnClick="btnCancel_Click" /></td>
						             <td id="ShowSummary">
                                         <asp:Button ID="btnShowSumary" runat="server" Text="Show Summary" CssClass="btnUpdate" Height="20px" 
                                          OnClick="btnShowSumary_Click"/></td>

                                 </tr>
                             </table>
                         </ContentTemplate>
                         <Triggers>
                             <asp:AsyncPostBackTrigger ControlID="btnChangeSelected" EventName="Click" />
                             <asp:AsyncPostBackTrigger ControlID="btnChangeAll" EventName="Click" />
                             <asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="Click" />
                         </Triggers>
                     </asp:UpdatePanel>
<br />
                </td>  
            </tr>
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:GridView ID="grdtradechange" runat="server" Width="100%" BorderColor="CornflowerBlue"
                                AllowSorting="true" AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="2px"
                                ForeColor="#0000C0">
                                <Columns>
                                    <asp:TemplateField HeaderText="Scrip Name">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblinstrument" runat="server" Text='<%# Eval("instrument")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Order No.">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblOrderNo" runat="server" Text='<%# Eval("orderno")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Trade No.">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lbltradeno" runat="server" Text='<%# Eval("tradeno")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Trade Time">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblTRADETIME" runat="server" Text='<%# Eval("TRADETIME")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Terminal Id">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblTerminalid" runat="server" Text='<%# Eval("Terminalid")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="CTCL ID">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblCTCLID" runat="server" Text='<%# Eval("CTCLID")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Flag">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblflag" runat="server" Text='<%# Eval("flag")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="A/c Code">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblactype" runat="server" Text='<%# Eval("actype")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Quantity">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblUnitPriceQuantity" runat="server" Text='<%# Eval("PriceQuantityDISPLAY")%>'
                                                CssClass="gridstyleheight1"></asp:Label>
								<asp:Label ID="lblqty" runat="server" Visible="false" Text='<%# Eval("Quantity")%>'
                                                CssClass="gridstyleheight1"></asp:Label>

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Mkt Price">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblUnitPrice" runat="server" Text='<%# Eval("PriceDISPLAY")%>' CssClass="gridstyleheight1"></asp:Label>
                                          
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Select">
                                        <HeaderTemplate>
                                            <asp:CheckBox ID="checkAll" runat="server" AutoPostBack="true" OnCheckedChanged="CheckUnCheckAll" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <dxe:ASPxCheckBox ID="chkSelect" runat="server" BackColor="White" ClientInstanceName="cchkSelect" 
                                               ToolTip="Select one">
                                                <clientsideevents checkedchanged="OnAllCheckedChanged" ></clientsideevents>
                                            </dxe:ASPxCheckBox>
                                            <asp:Label ID="lblcustid" runat="server" Visible="false" Text='<%# Eval("CustTransactionID")%>'></asp:Label>
                                            <asp:Label ID="lblexchid" runat="server" Visible="false" Text='<%# Eval("ExchangeTradesID")%>'></asp:Label>
                                            <asp:Label ID="lblprdid" runat="server" Visible="false" Text='<%# Eval("PRODUCTID")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <RowStyle BackColor="White" ForeColor="#330099" BorderColor="#BFD3EE" BorderStyle="Double"
                                    BorderWidth="1px"></RowStyle>
                                <HeaderStyle ForeColor="Black" BorderWidth="1px" CssClass="EHEADER" BorderColor="AliceBlue"
                                    Font-Bold="true" Wrap="false"></HeaderStyle>
                            </asp:GridView>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnshow" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
                <td id="tdShow" valign="top">
                <dxcp:ASPxCallbackPanel ID="CbpComon" runat="server" ClientInstanceName="cCbpComon"
                        OnCallback="CbpComon_Callback" BackColor="Transparent" Width="100%">
                        <PanelCollection>
                            <dxp:panelcontent runat="server">
                            <div id="DivSummary" style="width:200px;margin-left:40px;"></div>
                             <br />
                            </dxp:panelcontent>
                        </PanelCollection>
                        <ClientSideEvents EndCallback="function (s, e) {CbpComon_EndCallBack();}" />
                </dxcp:ASPxCallbackPanel>
            </td>
            </tr>
          
            <tr>
                <td>  <br />
                  <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                         <ContentTemplate>
                             <table>
                                 <tr>
                                     <td>
                                         <asp:Button ID="btnChangeAll1" runat="server" Text="Change ALL" CssClass="btnUpdate"
                                             Height="20px" OnClick="btnChangeAll1_Click"  />
                                     </td>
                                     <td>
                                         <asp:Button ID="btnChangeSelected1" runat="server" Text="Change Selected" CssClass="btnUpdate"
                                             Height="20px" OnClick="btnChangeSelected1_Click" />
                                     </td>
                                     <td>
                                         <asp:Button ID="btnCancel1" runat="server" Text="Cancel" CssClass="btnUpdate" Height="20px"
                                             OnClick="btnCancel1_Click" /></td>
                                 </tr>
                             </table>
                         </ContentTemplate>
                         <Triggers>
                             <asp:AsyncPostBackTrigger ControlID="btnChangeSelected1" EventName="Click" />
                             <asp:AsyncPostBackTrigger ControlID="btnChangeAll1" EventName="Click" />
                             <asp:AsyncPostBackTrigger ControlID="btnCancel1" EventName="Click" />
                         </Triggers>
                     </asp:UpdatePanel>

                </td>
            </tr>
        </table>
    </div>
    
    </form>
</body>
</html>
