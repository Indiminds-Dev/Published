<%@ page language="C#" autoeventwireup="true" enableeventvalidation="false" inherits="management_ClearingTax, App_Web_sggmuspu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register TagPrefix="dxrp" Namespace="DevExpress.Web.ASPxRoundPanel" Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <!--___________________These files are for datetime calander___________________-->
    <link type="text/css" rel="stylesheet" href="../CSS/dhtmlgoodies_calendar.css?random=20051112"
        media="screen" />

    <script type="text/javascript" src="../JSFUNCTION/dhtmlgoodies_calendar.js?random=20060118"></script>

    <!--___________________________________________________________________________-->
    <!--___________________These files are for List Items__________________________-->

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>
    
    
    
    
    <%--//------------------------------------------------%>
     
    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>
    
   <%-- ------------------------------------------------------------------------------%>
    

    <!--___________________________________________________________________________-->
    <style type="text/css">
	
	/* Big box with list of options */
	#ajax_listOfOptions{
		position:absolute;	    /* Never change this one */
		width:50px;	        /* Width of box */
		height:auto;	        /* Height of box */
		overflow:auto;	        /* Scrolling features */
		border:1px solid Blue;	/* Blue border */
		background-color:#FFF;	/* White background color */
		text-align:left;
		font-size:0.9em;
		z-index:100;
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
		z-index:900;
	}
	#ajax_listOfOptions_iframe{
		background-color:#F00;
		position:absolute;
		z-index:10;
	}
	
	form{
		display:inline;
	}
	
	</style>
    <style type="text/css">
       a:hover {background:#ffffff; text-decoration:none;} /*BG color is a must for IE6*/
       a.tooltip span {display:none; padding:2px 3px; font-size:smaller; margin-left:1px; width:100px;}
       a.tooltip:hover span{display:inline; position:horizontal; background:#ffffff; border:1px solid #cccccc; color:#6c6c6c; width:100px}
    
        .style1
        {
            width: 8px;
            text-align: right;
            vertical-align: middle;
            height: 25px; /*font-weight:bold; */;
            font-family: Tahoma,Arial, Verdana, sans-serif;
            color: Blue;
            font-size: 11px;
        }
    
    </style>

    <script language="javascript" type="text/javascript">

        function Page_Load() {



            Scrip('a');

          //  GetCalculatedOn('1');    
                
            document.getElementById("tr_5").style.visibility = "hidden";
            document.getElementById("td_Min_v").style.display = "none";
            document.getElementById("td_Max_v").style.display = "none";



            document.getElementById("tr_ddlcalculatedOn1").style.display = "none";
            document.getElementById("tr_ddlcalculatedOn").style.display = "inline";
            
            
            height();
        }

      
        
        
        function height() {
            if (document.body.scrollHeight >= 500) {
                window.frameElement.height = document.body.scrollHeight;
            }
            else {
                window.frameElement.height = '500';
            }
            window.frameElement.width = document.body.scrollWidth;
        }
    
    

        FieldName = 'abcd';
    
// <!CDATA[
//function is called on changing country

         function textValidation()
           {
              
               var ob3=document.getElementById("hdType");
               var typeb = ob3.value;
               var str = document.getElementById('txtGroup').value;
               var str1 = ddlcmpname.GetValue();
               var str2 = ddlsegment.GetValue();
               var str3 = ddlsegmentdp.GetValue();
             if(str=="")
              {
              alert("Please select group.");
              return false;
              }
              if(str1=="--Select Company--")
              {
              alert("Please select Company name.");
              return false;
              }
              if (typeb=="9" || typeb=="10")
              {
                  if(str3==null)
                   {
                   alert("Please select Segment.");
                   return false;
                   }
               
               }
               else
               {
                    if(str2==null)
                      {
                      alert("Please select Segment.");
                      return false;
                      }
               }
           
              
           }
 
     
           function noNumbers(e)
            {
                var keynum
                var keychar
                var numcheck
                
                if(window.event)//IE
                {
                    keynum = e.keyCode                        
                    if(keynum>=48 && keynum<=57 || keynum==46)
                         {
                          return true;
                         }
                         else
                        {
                         alert("Please Insert Numeric Only");
                         return false;
                        }
                 } 
                 
                  else if(e.which) // Netscape/Firefox/Opera
               {
                   keynum = e.which  
                   
                   if(keynum>=48 && keynum<=57 || keynum==46)
                         {
                          return true;
                         }
                         else
                         {
                         alert("Please Insert Numeric Only");
                         return false;
                         }     
                }
          } 
  
         function  Valueseg(e1)
         {
            dd=e1;
         
         }
        function OnAccountChanged(ddlrmainacc)
        {
           CallServer('AccRel' + '~' + ddlrmainacc.GetValue().toString(), ""); 
           ddlrsubacc.PerformCallback(ddlrmainacc.GetValue().toString());
        }
        function OnAccountUnChanged(ddlunracc)
        {
          CallServer('AccUnRel' + '~' + ddlunracc.GetValue().toString(), ""); 
          ddlunrsubacc.PerformCallback(ddlunracc.GetValue().toString());
        }

//        function ReceiveServerData(rValue)
//            {   
//           
//                var DATA=rValue.split('~');  
//                if(DATA[0]=="AccRel")
//                {
//                 if(DATA[1]!="N")
//                    { 
//                     document.getElementById("tdrsubacc").style.display = "inline";
//                    }
//                    
//                    else
//                    {
//                    document.getElementById("tdrsubacc").style.display = "none";
//                    }
//                }
//                
//                 if(DATA[0]=="AccUnRel")
//                {
//                 if(DATA[1]!="N")
//                    { 
//                     document.getElementById("tdunsubacc").style.display = "inline";
//                    }
//                    
//                    else
//                    {
//                    document.getElementById("tdunsubacc").style.display = "none";
//                    }
//                    
//                }
//                
//                  if(DATA[0]=="Segment")
//                {
//              
//                 if(DATA[1]!="N")
//                    { 
//                    
//                     document.getElementById("tdlevelsegment").style.display = "inline";
//                     document.getElementById("tdsegment").style.display = "inline";
//                    }
//                    
//                    else
//                    {
//                  
//                    document.getElementById("tdlevelsegment").style.display = "none";
//                    document.getElementById("tdsegment").style.display = "none";
//                    }
//                    
//             }
        //         }



        function ReceiveServerData(rValue) {
            var Data = rValue.split('~');
        } 


       function display()
        {
          document.getElementById("tdlevelsegment").style.display = "inline";
          document.getElementById("tdsegment").style.display = "inline";
          document.getElementById("ddlsegmentdp").style.display = "none";
        }
        function displaynsdl()
        {
          document.getElementById("tdlevelsegment").style.display = "inline";
          document.getElementById("tdsegment").style.display = "inline";
          document.getElementById("ddlsegment").style.display = "none";
        }
        function ALERT()
        {
          alert('This Date Already Exist for this combination.\n Date Should be Greater than Or Less Than From Previous Date');
        
        }
        function displaysubclient()
        {
          document.getElementById("tdrsubacc").style.display = "inline";
        }
        function displaysubclientnot()
        {
         document.getElementById("tdrsubacc").style.display = "none";
        }
        function displaytax()
        {
          document.getElementById("tdunsubacc").style.display = "inline";
        }
        function displaytaxnot()
        {
         document.getElementById("tdunsubacc").style.display = "none";
        }
         function CallAjax(obj1,obj2,obj3)
        {
        FieldName='Button1';
        ajax_showOptions(obj1,obj2,obj3);
        }
        function winclose()
        {
        parent.editwin.close();
    }



    //        ------------ For Auto Complete Start -----------------

    function FunCallAjaxList(objID, objEvent, ObjType) {

        var strQuery_Table = '';
        var strQuery_FieldName = '';
        var strQuery_WhereClause = '';
        var strQuery_OrderBy = '';
        var strQuery_GroupBy = '';
        var CombinedQuery = '';

        if (ObjType == 'MainAccount') {

            document.getElementById('TxtMainAccount_hidden').value = '';

            strQuery_Table = "Master_MainAccount";
            strQuery_FieldName = "distinct top 10 MainAccount_Name+' ['+isnull(MainAccount_AccountCode,'')+']' AS loginid,MainAccount_AccountCode user_id";
            strQuery_WhereClause = " MainAccount_AccountType in ('Income','Expences')  and MainAccount_SubLedgerType in ('None','Custom')  and ( MainAccount_Name like (\'%RequestLetter%') or MainAccount_AccountCode like (\'%RequestLetter%'))";

            
            
            
           

        }

        else if (ObjType == 'SubAccount') {

        document.getElementById('TxtSubAccount_hidden').value = '';

        var Mainvalue = document.getElementById('TxtMainAccount_hidden').value

        strQuery_Table = "Master_SubAccount";
        strQuery_FieldName = "distinct top 10 SubAccount_Name+' ['+isnull(SubAccount_Code,'')+']' AS loginid,SubAccount_Code user_id";
        strQuery_WhereClause = " SubAccount_MainAcReferenceID in (select distinct MainAccount_AccountCode from Master_MainAccount where isnull(MainAccount_SubLedgerType,'''') <>'None' and MainAccount_AccountCode =" + "'" + Mainvalue + "'" + " )  and ( SubAccount_Name like (\'%RequestLetter%') or SubAccount_Code like (\'%RequestLetter%'))";


        }
        
        else if   (ObjType == 'Exchange') {

            document.getElementById('TxtExchange_hidden').value = '';

            strQuery_Table = "Master_Exchange";
            strQuery_FieldName = "distinct top 10 Exchange_Name+' ['+isnull(Exchange_ShortName,'')+']' AS loginid,Exchange_ID user_id";
            strQuery_WhereClause = " ( Exchange_Name like (\'%RequestLetter%') or Exchange_ShortName like (\'%RequestLetter%'))";


        }


        else if (ObjType == 'Currency') {

        document.getElementById('TxtCurrency_hidden').value = '';

        strQuery_Table = "Master_Currency";
        strQuery_FieldName = "distinct top 10 Currency_Name +' ['+isnull(Currency_Symbol,'')+']' AS loginid,Currency_ID user_id";
        strQuery_WhereClause = " ( Currency_Name like (\'%RequestLetter%') or Currency_Symbol like (\'%RequestLetter%'))";


    }


    else if (ObjType == 'Product') {

      document.getElementById('TxtProduct_hidden').value = '';

      strQuery_Table = "Master_Products";
      strQuery_FieldName = "distinct top 10 Products_Name +' ['+isnull(Products_ShortName,'')+']' AS loginid,Products_ID user_id";
      strQuery_WhereClause = " Products_DerivedFromID is null and ( Products_Name like (\'%RequestLetter%') or Products_ShortName like (\'%RequestLetter%'))";


    }



        CombinedQuery = new String(strQuery_Table + "$" + strQuery_FieldName + "$" + strQuery_WhereClause + "$" + strQuery_OrderBy + "$" + strQuery_GroupBy);


        ajax_showOptions(objID, 'GenericAjaxList', objEvent, replaceChars(CombinedQuery));
      //  alert (CombinedQuery);
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



    function OnTaxChanged(ddltaxapp) {




        var text = ddltaxapp.GetValue().toString();




        if (text == "2") {

            document.getElementById("tr_5").style.visibility = "visible";
            document.getElementById("td_Min_v").style.display = "inline";
            document.getElementById("td_Max_v").style.display = "inline";

            document.getElementById("tr_ddlcalculatedOn").style.display = "none";
            document.getElementById("tr_ddlcalculatedOn1").style.display = "inline";



            //   GetCalculatedOn1();


            //            document.getElementById("td_Decimal_l").style.visibility = "visible";
            //            document.getElementById("td_round_l").style.visibility = "visible";
            //            document.getElementById("td_Min_l").style.visibility = "visible";

            //            document.getElementById("td_Decimal_v").style.visibility = "visible";
            //            document.getElementById("td_round_v").style.visibility = "visible";



        }
        else {

            document.getElementById("tr_5").style.visibility = "hidden";
            document.getElementById("td_Min_v").style.display = "none";
            document.getElementById("td_Max_v").style.display = "none";


            document.getElementById("tr_ddlcalculatedOn1").style.display = "none";
            document.getElementById("tr_ddlcalculatedOn").style.display = "inline";


            // GetCalculatedOn();


            //            document.getElementById("td_Decimal_l").style.visibility = "hidden";
            //            document.getElementById("td_round_l").style.visibility = "hidden";
            //            document.getElementById("td_Min_l").style.visibility = "hidden";

            //            document.getElementById("td_Decimal_v").style.visibility = "hidden";
            //            document.getElementById("td_round_v").style.visibility = "hidden";



            //            document.getElementById("td_Decimal_l").style.display = "none";
            //            document.getElementById("td_round_l").style.display = "none";
            //            document.getElementById("td_Min_l").style.display = "none";

            //            document.getElementById("td_Decimal_v").style.display = "none";
            //            document.getElementById("td_round_v").style.display = "none";
            //            document.getElementById("td_Min_v").style.display = "none";



        }
    }





function OnTaxChangedFromPage(ddltaxapp) {

       

      
        var text = ddltaxapp;

             

        if (text == "2") {

            document.getElementById("tr_5").style.visibility = "visible";
            document.getElementById("td_Min_v").style.display = "inline";
            document.getElementById("td_Max_v").style.display = "inline";

            document.getElementById("tr_ddlcalculatedOn").style.display = "none";
            document.getElementById("tr_ddlcalculatedOn1").style.display = "inline";

        
          
        }
        else {

            document.getElementById("tr_5").style.visibility = "hidden";
            document.getElementById("td_Min_v").style.display = "none";
            document.getElementById("td_Max_v").style.display = "none";


            document.getElementById("tr_ddlcalculatedOn1").style.display = "none";
            document.getElementById("tr_ddlcalculatedOn").style.display = "inline";
           
           
       }

       
       
    }

//------------------------------------- End -------------------------------------



    //        ------------ For Product List Start --------------------

    function Show(obj) {
        document.getElementById(obj).style.display = 'inline';
    }
    function Hide(obj) {
    
        document.getElementById(obj).style.display = 'none';
    }
    function Scrip(obj) {

          
        if (obj == "a")
            Hide('showFilter');
        else {
//            var cmb = document.getElementById('cmbsearchOption');
//            cmb.value = 'Scrips';
            Show('showFilter');
        }
    }


    function FunClientScrip(objID, objListFun, objEvent) {
        var cmbVal = document.getElementById('cmbsearchOption').value;
        ajax_showOptions(objID, objListFun, objEvent, cmbVal, 'Sub');
    }



    function btnAddsubscriptionlist_click() {
        var userid = document.getElementById('txtsubscriptionID');
        if (userid.value != '') {
            var ids = document.getElementById('txtsubscriptionID_hidden');
            var listBox = document.getElementById('lstSuscriptions');
            var tLength = listBox.length;
            //alert(tLength);

            var no = new Option();
            no.value = ids.value;
            no.text = userid.value;
            listBox[tLength] = no;
            var recipient = document.getElementById('txtsubscriptionID');
            recipient.value = '';
        }
        else
            alert('Please search name and then Add!')
        var s = document.getElementById('txtsubscriptionID');
        s.focus();
        s.select();
    }
    function btnRemovefromsubscriptionlist_click() {
        var listBox = document.getElementById('lstSuscriptions');
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
    function clientselectionfinal() {
        var listBoxSubs = document.getElementById('lstSuscriptions');
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
	  

//--------------------------------------------------------------------------------
        
        
        
//-->
    </script>
    
    
    <script type = "text/javascript">
        var ddlCountries;
        
        function GetCalculatedOn() {

            $('#ddlcalculatedOn').empty();
          
            ddlCountries = document.getElementById('ddlcalculatedOn');                      
            ddlCountries.options.length == 0;
                      
              AddOption("Lots", "1");
              AddOption("Price Units", "2");
                         

          }

          function GetCalculatedOn1() {

              $('#ddlcalculatedOn').empty();

              ddlCountries = document.getElementById('ddlcalculatedOn');
              ddlCountries.options.length == 0;
              AddOption("Market-Value", "3");
              AddOption("Unit-Price", "4");

          }
                
        
        function AddOption(text, value) {
            var option = document.createElement('option');
            option.value = value;
            option.innerHTML = text;
            ddlCountries.options.add(option);
        }



      
        
</script>
    
   

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
        <div>
            <table class="TableMain100">
                <tr>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellcenter">
                        <table style="border: solid 3px lightblue; width: auto" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="text-align: center">
                                    <table style="border: solid 1px blue; width: auto">
                                        <tr>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 41%;">
                                                <dxe:ASPxLabel ID="lbl6" runat="server" Width="40px" Text="Group:">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 30%;">
                                                <asp:TextBox ID="txtGroup" Width="160px" runat="server" Font-Size="11px"></asp:TextBox>
                                                <asp:TextBox ID="txtGroup_hidden" runat="server" Width="14px" Style="display: none"></asp:TextBox>
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 148%;">
                                                <dxe:ASPxLabel runat="server" Text="Company :" Width="90px" ID="ASPxLabel1">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td style="text-align: left;" class="Ecoheadtxt">
                                                <dxe:ASPxComboBox runat="server" Font-Size="10px" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                    ValueType="System.String" DataSourceID="AccessDataSourceCompany" TextField="cmp_Name"
                                                    ValueField="cmp_internalid" ID="ddlcmpname" Width="220px">
                                                </dxe:ASPxComboBox>
                                            </td>
                                            <td class="Ecoheadtxt" id="tdlevelsegment" runat="server">
                                                <dxe:ASPxLabel runat="server" Text="Segment :" ID="ASPxLabel2" Width="60px">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td style="text-align: left;" class="Ecoheadtxt" id="tdsegment" runat="server">
                                                <dxe:ASPxComboBox runat="server" Font-Size="10px" DropDownStyle="DropDown" Width="120px"
                                                    EnableSynchronization="False" EnableIncrementalFiltering="True" ValueType="System.String"
                                                    DataSourceID="AccessDataSourceSegment" TextField="segment_name" ValueField="exch_internalId"
                                                    ClientInstanceName="ddlsegment" ID="ddlsegment">
                                                </dxe:ASPxComboBox>
                                            </td>
                                        </tr>
                                        
                                         <%-- ------------------ New Page  Start ----------------------%>
                                        
                                       <%-- ----- Row 1-------%>
                                        
                                        
                                        <tr id="tr_1">
                                            <td class="Ecoheadtxt" style="text-align: left; width: 41%; height: 25px;">
                                                <dxe:ASPxLabel runat="server" Text="Narration:" ID="ASPxLabel3">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td style="text-align: left; width: 30%; height: 25px;" class="Ecoheadtxt">
                                              
                                               <asp:TextBox ID="TxtNarration" runat="server" TextMode="MultiLine" Width="250px" 
                                                    MaxLength="150" ></asp:TextBox>
                                              
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 148%; height: 25px;">
                                                <dxe:ASPxLabel runat="server" Text="Revenue A/c:" ID="ASPxLabel5">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td style="text-align: left; height: 25px;" class="Ecoheadtxt">
                                                <asp:TextBox ID="TxtMainAccount" Width="160px" runat="server"
                                                onkeyup="FunCallAjaxList(this,event,'MainAccount')"
                                                 Font-Size="11px"></asp:TextBox>
                                                 
                                         
                                                 
                                                  <asp:TextBox ID="TxtMainAccount_hidden" Style="display: none" runat="server" Width="100px"  ></asp:TextBox>
                                               
                                             
                                               
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; height: 25px;">
                                                <dxe:ASPxLabel runat="server" Text="Revenue A/c [Sub]:" ID="ASPxLabel4">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td style="text-align: left; height: 25px;" class="Ecoheadtxt">
                                                <asp:TextBox ID="TxtSubAccount" Width="160px" runat="server"
                                                 onkeyup="FunCallAjaxList(this,event,'SubAccount')"
                                                 Font-Size="11px"></asp:TextBox>
                                                
                                                 <asp:TextBox ID="TxtSubAccount_hidden" Style="display: none" runat="server" Width="100px"  ></asp:TextBox>
                                                
                                            </td>
                                        </tr>
                                        
                                        <%---------Row 2 ---------%>
                                        
                                         <tr id="tr_2">
                                            <td class="Ecoheadtxt" style="text-align: left; width: 41%;">
                                                <dxe:ASPxLabel runat="server" Text="ProdType:" ID="ASPxLabel17">
                                                </dxe:ASPxLabel>
                                                
                                                  
                                            </td>
                                            <td style="text-align: left; width: 30%;" class="Ecoheadtxt">
                                              
                                               <asp:DropDownList runat="server" Width="129px" ID="ddlProductType">
                                                    <asp:ListItem Value="0">Any</asp:ListItem>
                                                    <asp:ListItem Value="1">All Futures</asp:ListItem>
                                                    <asp:ListItem Value="2">All Options</asp:ListItem>
                                                    
                                                </asp:DropDownList>
                                              
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 148%;">
                                                <dxe:ASPxLabel runat="server" Text="Product" ID="ASPxLabel18">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td style="text-align: left" class="Ecoheadtxt" colspan="4">
                                                
                                                 <table>
                                        <tr>
                                            <td>
                                                <asp:RadioButton ID="radScripAll" runat="server" Checked="true" GroupName="b" onclick="Scrip('a')" />
                                            </td>
                                            <td>
                                                All</td>
                                            <td>
                                                <asp:RadioButton ID="radScripSelected" runat="server" GroupName="b" onclick="Scrip('b')" />
                                            </td>
                                            <td>
                                                Selected</td>
                                                
                                               
                                               <td>
                                               
                                               <table width="100%" id="showFilter">
                                               <tr>
                                               <td>
                                                <asp:TextBox ID="TxtProduct" runat="server" onkeyup="FunCallAjaxList(this,event,'Product')"  Width="250px" ></asp:TextBox>
                                                    
                                             <asp:TextBox ID="TxtProduct_hidden" Style="display: none" runat="server" Width="100px"  ></asp:TextBox>
                                             </td>
                                               </tr>
                                               </table>
                                               </td>
                                                
                                                
                                                
                                        </tr>
                                        
                                     
                                        
                                    </table>
                                               
                                            </td>
                                            
                                            
                                            
                                           
                                        </tr>
                                        
                                      
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        <%------------ Row 3 --------%>
                                        
                                          <tr id="tr_3">
                                            <td class="Ecoheadtxt" style="text-align: left; width: 41%;">
                                                <dxe:ASPxLabel runat="server" Text="Exchange:" ID="ASPxLabel19">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td style="text-align: left; width: 30%;" class="Ecoheadtxt">
                                              
                                               <asp:TextBox ID="TxtExchange" runat="server" onkeyup="FunCallAjaxList(this,event,'Exchange')"  Width="250px" ></asp:TextBox>
                                                    
                                             <asp:TextBox ID="TxtExchange_hidden" Style="display: none" runat="server" Width="100px"  ></asp:TextBox>
                                             
                                             
                                                    
                                              
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 148%;">
                                                <dxe:ASPxLabel runat="server" Text="Trade Type:" ID="ASPxLabel20">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td style="text-align: left" class="Ecoheadtxt">
                                            
                                                <asp:DropDownList runat="server" Width="129px" ID="DdlTradeType">
                                                    <asp:ListItem Value="0">Any</asp:ListItem>
                                                    <asp:ListItem Value="1">Normal</asp:ListItem>
                                                    <asp:ListItem Value="2">Final Settled</asp:ListItem>
                                                    
                                                </asp:DropDownList>
                                               
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxLabel runat="server" Text="Transaction Type:" ID="ASPxLabel21">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td style="text-align: left" class="Ecoheadtxt">
                                               
                                                <asp:DropDownList runat="server" Width="129px" ID="ddlTransactionType">
                                                    <asp:ListItem Value="0">Any</asp:ListItem>
                                                    <asp:ListItem Value="1">Buy</asp:ListItem>
                                                    <asp:ListItem Value="2">Sell</asp:ListItem>
                                                    
                                                </asp:DropDownList>
                                               
                                            </td>
                                        </tr>
                                        
                                        
                                        
                                         <%------------ Row 4 --------%>
                                        
                                          <tr id="tr_4">
                                            <td class="Ecoheadtxt" style="text-align: left; width: 41%;">
                                                <dxe:ASPxLabel runat="server" Text="Fee Rate:" ID="ASPxLabel22">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td style="text-align: left; width: 30%;" class="Ecoheadtxt">
                                              
                                              <dxe:ASPxTextBox runat="server" ID="TxtFeeRate" onkeypress="return noNumbers(event)"
                                                    Width="130px">
                                                    <MaskSettings Mask="&lt;0..99g&gt;.&lt;00..999999&gt;" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                              
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 148%;">
                                                <dxe:ASPxLabel runat="server" Text="Rate Type:" ID="ASPxLabel24">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td style="text-align: left" class="Ecoheadtxt">
                                            
                                              <%-- <asp:DropDownList runat="server" Width="129px" ID="ddlRateType" OnTextChanged="OnTaxChanged(this)" >
                                                    <asp:ListItem Value="1">Fixed Amount</asp:ListItem>
                                                    <asp:ListItem Value="2">Percentage</asp:ListItem>                                                    
                                                </asp:DropDownList>
                                                --%>
                                                
                                                <dxe:ASPxComboBox runat="server" Width="100px" ID="ddlRateType" DropDownStyle="DropDown"
                                                    EnableSynchronization="False" EnableIncrementalFiltering="True" >
                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) { OnTaxChanged(s); }"></ClientSideEvents>
                                                    <Items>
                                                        <dxe:ListEditItem Text="Fixed Amount" Value="1"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Percentage" Value="2"></dxe:ListEditItem>
                                                    </Items>
                                                </dxe:ASPxComboBox>
                                                
                                               
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxLabel runat="server" Text="Calculated On:" ID="ASPxLabel25">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td style="text-align: left" class="Ecoheadtxt">
                                               
                                               <table>
                                               <tr>
                                               <td id="tr_ddlcalculatedOn">
                                               
                                                <asp:DropDownList runat="server" Width="129px" ID="ddlcalculatedOn">
                                                    <asp:ListItem Value="1">Lots</asp:ListItem>
                                                    <asp:ListItem Value="2">Price Units</asp:ListItem>         
                                                                                                 
                                                </asp:DropDownList>
                                               
                                               </td>
                                               
                                                <td id="tr_ddlcalculatedOn1">
                                               
                                                <asp:DropDownList runat="server" Width="129px" ID="ddlcalculatedOn1">
                                                    <asp:ListItem Value="3">Market-Value</asp:ListItem>
                                                    <asp:ListItem Value="4">Unit-Price</asp:ListItem>         
                                                                                                 
                                                </asp:DropDownList>
                                               
                                               </td>
                                               
                                               </tr>
                                               </table>
                                              
                                                
                                             <%--  <asp:DropDownList ID="ddlcalculatedOn" runat="server"  Width="129px">
                                                </asp:DropDownList>--%>
                                                
                                                
                                                
                                            </td>
                                        </tr>
                                        
                                        
                                          <%------------ Row 5 --------%>
                                        
                                          <tr id="tr_5">
                                            <td id="td_Decimal_l" class="Ecoheadtxt" style="text-align: left; width: 41%;">
                                                <dxe:ASPxLabel runat="server" Text="Decimals:" ID="ASPxLabel26">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td id="td_Decimal_v" style="text-align: left; width: 30%;" class="Ecoheadtxt">
                                              
                                              <asp:DropDownList runat="server" Width="129px" ID="DdlDecimalPoint">
                                                    <asp:ListItem Value="2">2</asp:ListItem>
                                                    <asp:ListItem Value="3">3</asp:ListItem>         
                                                    <asp:ListItem Value="4">4</asp:ListItem>
                                                    <asp:ListItem Value="5">5</asp:ListItem>   
                                                    <asp:ListItem Value="6">6</asp:ListItem>                                                   
                                                </asp:DropDownList>
                                                
                                                 
                                              
                                            </td>
                                            <td id="td_round_l" class="Ecoheadtxt" style="text-align: left; width: 148%;">
                                                <dxe:ASPxLabel runat="server" Text="Round Off:" ID="ASPxLabel27">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td id="td_round_v" style="text-align: left" class="Ecoheadtxt">
                                            
                                                <asp:DropDownList runat="server" Width="129px" ID="DdlroundPattern">
                                                    <asp:ListItem Value="1">None</asp:ListItem>
                                                    <asp:ListItem Value="2">Nearest</asp:ListItem>  
                                                     <asp:ListItem Value="3">Higher</asp:ListItem>  
                                                       <asp:ListItem Value="4">Truncate</asp:ListItem>  
                                                    
                                                                                                                                                        
                                                </asp:DropDownList>
                                               
                                            </td>
                                            
                                            <td colspan="2">
                                            
                                            <table>
                                            <tr>
                                            
                                             <td id="td_Min_l" class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxLabel runat="server" Text="Min Amt/Unit:" ID="ASPxLabel28">
                                                </dxe:ASPxLabel>
                                            </td>
                                            
                                            <td id="td_Min_v" style="text-align: left" class="Ecoheadtxt">
                                               
                                                <dxe:ASPxTextBox runat="server" Width="100px"  ID="TxtMinAmount" onkeypress="return noNumbers(event)"
                                                   >
                                                    <MaskSettings Mask="&lt;0..99g&gt;.&lt;00..999999&gt;" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                               
                                            </td>
                                            
                                             <td id="td2" class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxLabel runat="server" Text="MaxAmt/Unit:" ID="ASPxLabel32">
                                                </dxe:ASPxLabel>
                                            </td>
                                            
                                            <td id="td_Max_v" style="text-align: left" class="Ecoheadtxt">
                                               
                                                <dxe:ASPxTextBox runat="server" ID="TxtMaxAmount" Width="100px" onkeypress="return noNumbers(event)"
                                                    >
                                                    <MaskSettings Mask="&lt;0..99g&gt;.&lt;00..999999&gt;" />
                                                    <ValidationSettings ErrorDisplayMode="None">
                                                    </ValidationSettings>
                                                </dxe:ASPxTextBox>
                                               
                                            </td>
                                            
                                            
                                            </tr>
                                            
                                            </table>
                                            
                                            </td>
                                           
                                        </tr>
                                        
                                        
                                         <%------------ Row 6 --------%>
                                        
                                          <tr id="tr_6">
                                            <td class="Ecoheadtxt" style="text-align: left; width: 41%;">
                                                <dxe:ASPxLabel runat="server" Text="Currency:" ID="ASPxLabel29">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td style="text-align: left; width: 30%;" class="Ecoheadtxt">
                                              
                                              <asp:TextBox ID="TxtCurrency" runat="server" onkeyup="FunCallAjaxList(this,event,'Currency')"  Width="250px" ></asp:TextBox>
                                              
                                               <asp:TextBox ID="TxtCurrency_hidden" Style="display: none" runat="server" Width="100px"  ></asp:TextBox>
                                              
                                            </td>
                                            <td class="Ecoheadtxt" style="text-align: left; width: 148%;">
                                                <dxe:ASPxLabel runat="server" Text="STax/VAT/GST :" ID="ASPxLabel30">
                                                </dxe:ASPxLabel>
                                            </td>
                                            <td style="text-align: left" class="Ecoheadtxt">
                                            
                                                <asp:DropDownList runat="server" Width="129px" ID="ddlTaxApplicable">
                                                    <asp:ListItem Value="N">No</asp:ListItem>
                                                    <asp:ListItem Value="Y">Yes</asp:ListItem>  
                                                     
                                                    
                                                                                                                                                        
                                                </asp:DropDownList>
                                               
                                            </td>
                                            
                                             <td id="td1" class="Ecoheadtxt" style="text-align: left">
                                                <dxe:ASPxLabel runat="server" Text="Date:" ID="ASPxLabel31">
                                                </dxe:ASPxLabel>
                                            </td>
                                            
                                            <td class="Ecoheadtxt" style="text-align: left" >
                                            
                                             <dxe:ASPxDateEdit runat="server" UseMaskBehavior="True" DateOnError="Today" Width="120px"
                                                    EditFormat="Custom" ID="dtFrom">
                                                    <ButtonStyle Width="13px">
                                                    </ButtonStyle>
                                                </dxe:ASPxDateEdit>
                                            
                                               </td>  
                                                
                                    
                                           
                                        </tr>
                                        
                                        
                                        <%-------------- For Date ---------------%>
                                        
                                          <tr id="tr_date">  
                                          
                                          <td class="Ecoheadtxt" style="text-align: left; width: 41%;" >
                                    
                                 <%--  <dxe:ASPxDateEdit ID="dtFrom" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                        Font-Size="10px" Width="108px" ClientInstanceName="dtfrom" >
                                        <DropDownButton Text="From">
                                        </DropDownButton>
                                       <ClientSideEvents valuechanged="function(s, e) {dateassign(s.GetValue());}" />

                                    </dxe:ASPxDateEdit>--%>
                                    
                                      
                                    
                                </td>
                                <td class="Ecoheadtxt" style="text-align: left; display: none; width: 30%;"  >
                                
                                     <dxe:ASPxDateEdit runat="server" UseMaskBehavior="True" DateOnError="Today" Width="120px"
                                                    EditFormat="Custom" ID="dtTo">
                                                    <ButtonStyle Width="13px">
                                                    </ButtonStyle>
                                                </dxe:ASPxDateEdit>
                                </td> 
                                <td colspan="1" class="Ecoheadtxt" style="text-align: left; width: 148%;">
                                </td>
                                </tr>
                                        
                                        
                                        
                                      
                                        <%-- ------------------------ New Page End ----------------------------%>
                                       

                                        <tr>
                                            <td class="Ecoheadtxt" colspan="6" style="text-align: center">
                                                <asp:Button ID="Button1" runat="server" Text="Save" CssClass="btnUpdate" OnClick="Button1_Click">
                                                </asp:Button>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <%-- BeginRegion DataSources --%>
        <asp:SqlDataSource ID="AccessDataSourceCompany" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="SELECT cmp_internalid,cmp_Name FROM [tbl_master_company] where cmp_internalid in(select exch_compid from tbl_master_companyExchange)">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="AccessDataSourceSegment" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="select A.EXCH_INTERNALID AS exch_internalId ,isnull((TME.EXH_ShortName + '-' + A.EXCH_SEGMENTID),exch_membershipType) AS segment_name from (SELECT TMCE.* FROM TBL_MASTER_COMPANYEXCHANGE AS TMCE WHERE  TMCE.EXCH_COMPID=@CompId ) AS A LEFT OUTER JOIN   TBL_MASTER_EXCHANGE AS TME ON TME.EXH_CNTID=A.EXCH_EXCHID">
            <SelectParameters>
                <asp:SessionParameter Name="CompId" SessionField="LastCompany" Type="string" />
            </SelectParameters>
        </asp:SqlDataSource>
       
       
        <asp:HiddenField ID="hdType" runat="server" />
        <%-- EndRegion --%>
    </form>
</body>
</html>
