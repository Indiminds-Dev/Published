<%@ page language="C#" autoeventwireup="true" enableeventvalidation="false" inherits="Reports_CashBank_Aud, App_Web_jaxycpk3" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>Untitled Page</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />
    <%--<script type="text/javascript" src="../JSFUNCTION/loaddata.js"></script>--%>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>

    <link rel="stylesheet" href="../windowfiles/dhtmlwindow.css" type="text/css" />

    <script type="text/javascript" src="../windowfiles/dhtmlwindow.js"></script>

    <link rel="stylesheet" href="../modalfiles/modal.css" type="text/css" />

    <script type="text/javascript" src="../modalfiles/modal.js"></script>

    <script type="text/javascript"> 
        $(document).ready(function() { 

            $(".water").each(function() { 
                if ($(this).val() == this.title) { 
                    $(this).addClass("opaque"); 
                } 
            }); 

            $(".water").focus(function() { 
                if ($(this).val() == this.title) { 
                    $(this).val(""); 
                    $(this).removeClass("opaque"); 
                }                 
            }); 

            $(".water").blur(function() { 
                if ($.trim($(this).val()) == "") { 
                    $(this).val(this.title); 
                    $(this).addClass("opaque"); 
                } 
                else { 
                    $(this).removeClass("opaque"); 
                } 
            }); 
        });       

    </script>

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
	
	</style>

    <script type="text/javascript" src="../CentralData/JSScript/GenericJScript.js"></script>
    <script language="javascript" type="text/javascript" src="../CentralData/JSScript/timeSolver.min.js"></script>
    <script language="javascript" type="text/javascript">
    
    function ShowDateRange()
    {

   document.getElementById("ShowDt").style.display='none';
       document.getElementById("ShowHd").style.display='inline';
    
    
    }
      function ShowDateSelect()
     {
       document.getElementById("ShowDt").style.display='inline';
       document.getElementById("ShowHd").style.display='none';
     
     }
     
       function SignOff()
        {
            window.parent.SignOff();
        }
         FieldName='Button1';
        function showOptions(obj1,obj2,obj3)
         {
             var cmb=document.getElementById('cmbsearchOption');
            //alert(cmb.value);
            ajax_showOptions(obj1,obj2,obj3,cmb.value);
         }
         function ShowBankName(obj1,obj2,obj3)
         {
            ajax_showOptions(obj1,obj2,obj3);
         }
        function height()
        {
            if(document.body.scrollHeight>=350)
            {
                window.frameElement.height = document.body.scrollHeight;
            }
            else
            {
                window.frameElement.height = '350px';
            }
            window.frameElement.widht = document.body.scrollWidht;
        }
        function btnAddsubscriptionlist_click()
        {
            var userid = document.getElementById('txtsubscriptionID');
            if(userid.value != '')
            {
                var ids = document.getElementById('txtsubscriptionID_hidden');
                var listBox = document.getElementById('lstSuscriptions');
                var tLength = listBox.length;
                //alert(tLength);
                
                var no = new Option();
                no.value = ids.value;
                no.text = userid.value;
                listBox[tLength]=no;
                var recipient = document.getElementById('txtsubscriptionID');
                recipient.value='';
            }
            else
                alert('Please search name and then Add!')
            var s=document.getElementById('txtsubscriptionID');
            s.focus();
            s.select();
        }
        function btnRemovefromsubscriptionlist_click()
        {
            
            var listBox = document.getElementById('lstSuscriptions');
            var tLength = listBox.length;
            
            var arrTbox = new Array();
            var arrLookup = new Array();
            var i;
            var j = 0;
            for (i = 0; i < listBox.options.length; i++) 
            {
                if (listBox.options[i].selected && listBox.options[i].value != "") 
                {
                    
                }
                else 
                {
                    arrLookup[listBox.options[i].text] = listBox.options[i].value;
                    arrTbox[j] = listBox.options[i].text;
                    j++;
                }
            }
            listBox.length = 0;
            for (i = 0; i < j; i++) 
            {
                var no = new Option();
                no.value = arrLookup[arrTbox[i]];
                no.text = arrTbox[i];
                listBox[i]=no;
            }
        }
        function Page_Load()
        {
        
            document.getElementById('showFilter').style.display='none';
            document.getElementById('TdFilter').style.display='none';
            document.getElementById('Trfilter').style.display='none';
            document.getElementById('TrSearch').style.display='none';
            document.getElementById("showDetail").style.display='none';
            height();
        }
        function SegAll(obj)
        {
            document.getElementById('showFilter').style.display='none';
            document.getElementById('TdFilter').style.display='none';
            if(obj=='seg')
            {
                
            }
            else
            {
                document.getElementById('litBranch').innerText='';
                document.getElementById('Button1').disabled=false;
            }
        }
        function SegSelected(obj)
        {
            document.getElementById('showFilter').style.display='inline';
            document.getElementById('TdFilter').style.display='inline';
            if(obj=='seg')
            {
                document.getElementById('cmbsearchOption').value='Segment';
            }
            else
            {
                document.getElementById('cmbsearchOption').value='Branch';
                document.getElementById('Button1').disabled=true;
            }
        }
        function CheckDataExists()
        {
            alert('No Data Found');
        }
        function Disable(obj)
        {
            var gridview = document.getElementById('grdCashBankBook'); 
            var rCount = gridview.rows.length;
            if(rCount<10)
                rCount='0'+rCount;
            if(obj=='P')
            {
                document.getElementById("grdCashBankBook_ctl09_FirstPage").style.display='none';
                document.getElementById("grdCashBankBook_ctl09_PreviousPage").style.display='none';
                document.getElementById("grdCashBankBook_ctl09_NextPage").style.display='inline';
                document.getElementById("grdCashBankBook_ctl09_LastPage").style.display='inline';
            }
            else
            {
                document.getElementById("grdCashBankBook_ctl"+rCount+"_NextPage").style.display='none';
                document.getElementById("grdCashBankBook_ctl"+rCount+"_LastPage").style.display='none';
            }
        }
        function ShowHide(obj,obj1)
        {
           
            if(document.getElementById("HDNMAIN").value !='')
	        {
	         document.getElementById("trDateRange").style.display='inline';
	            document.getElementById("ShowDt").style.display='none';
                document.getElementById("ShowHd").style.display='inline';
                // document.getElementById("showDetail").style.display='none';
	        
	        }
            document.getElementById("TrAll").style.display='none';
            document.getElementById("Trfilter").style.display='inline';
            document.getElementById("showDetail").style.display='inline';
            document.getElementById("spanshow1").innerText=obj;
            document.getElementById("spanshow3").innerText=obj1;
            height();
    
        }
        function filter()
        {
            document.getElementById("Trfilter").style.display='none';
            document.getElementById("TrAll").style.display='inline';
            document.getElementById('TrSearch').style.display='none';
            height();
        }
        function search1()
        {
            document.getElementById('TrSearch').style.display='inline';
            height();
        }
        function ShowHideSearch()
        {
            document.getElementById('TrSearch').style.display='none';
            document.getElementById('txtVouno').value='Voucher Number';
            document.getElementById('txtInstNo').value='Instrument Number';
            //document.getElementById('dtSearchDate_I').GetValue() ='01-01-0100';
            height();
        }
        function clientselectionfinal()
	    {
	        var listBoxSubs = document.getElementById('lstSuscriptions');
            var cmb=document.getElementById('cmbsearchOption');
            var listIDs='';
            var i;
            if(listBoxSubs.length > 0)
            {                
                for(i=0;i<listBoxSubs.length;i++)
                {
                    if(listIDs == '')
                        listIDs = listBoxSubs.options[i].value+';'+listBoxSubs.options[i].text;
                    else
                        listIDs += ',' + listBoxSubs.options[i].value+';'+listBoxSubs.options[i].text;
                }
                var sendData = cmb.value + '~' + listIDs;
                CallServer(sendData,"");
            }
	        var i;
            for(i=listBoxSubs.options.length-1;i>=0;i--)
            {
                listBoxSubs.remove(i);
            }
            document.getElementById('showFilter').style.display='none';
            document.getElementById('TdFilter').style.display='none';
            document.getElementById('Button1').disabled=false;
	    }
	    function ColourChange(obj)
	    {
	        //obj1.parentElement.parentElement.style.backgroundColor='#EFF3FB';
	        //obj.style.backgroundColor='#EFF3FB';
	        if(obj.click)
	            obj.style.backgroundColor='#FFE1AC';
//	        else
//	            obj.style.backgroundColor='#EFF3FB';
	    }
	    function updateCashBankDetail(objDate,objVouNo,objMainID,objSubID,objCompID,objSegID)
	    {
	        var URL='CashBankEntryEdit.aspx?date='+objDate +' &vNo='+objVouNo+' &Compid='+objCompID+' &SegID='+objSegID;
	         editwin=dhtmlmodal.open("Editbox", "iframe", URL, "Update Cash/Bank Book", "width=940px,height=450px,center=1,resize=1,top=500", "recal");  
	       // parent.ParentWindowShow(URL);
	       //editwin=dhtmlmodal.open("Editbox", "iframe", URL, "Modify Employee Details", "width=940px,height=450px,center=1,resize=1,scrolling=2,top=500", "recal")

	    }
	   function  updateCashBankDetailDHTML(objDate,objVouNo,objMainID,objSubID,objCompID,objSegID)
	   {
	   
	      var URL='CashBankEntryEdit.aspx?date='+objDate +' &vNo='+objVouNo+' &Compid='+objCompID+' &SegID='+objSegID;
            editwin=dhtmlmodal.open("Editbox", "iframe", URL, "Update Cash/Bank Book", "width=940px,height=450px,center=1,resize=1,top=500", "recal");  
	   }
	    function callback()
        {
            var btn=document.getElementById('Button1');
            btn.click();
        }
	    function frmOpenNewWindow1(location,v_height,v_weight)
        {
            var y=(screen.availHeight-v_height)/2;
            var x=(screen.availWidth-v_weight)/2;
            window.open(location,"Search_Conformation_Box","height="+ v_height +",width="+ v_weight +",top="+ y +",left="+ x +",location=no,directories=no,menubar=no,toolbar=no,status=yes,scrollbars=no,resizable=no,dependent=no");       
        }
        function FillValues()
        {
       
            var btn=document.getElementById('Button1');
            btn.click();
        }
        function CallHeight()
        {
            height();
        }
         document.body.style.cursor = 'pointer'; 
         var oldColor = '';
	    function ChangeRowColor(rowID,rowNumber) 
        {              
            
            var gridview = document.getElementById('grdCashBankBook'); 
            var rCount = gridview.rows.length; 
            var rowIndex=1;
            var rowCount=0;
            if(rCount==28)
                 rowCount=25;
            else    
               rowCount=rCount-2;
            if(rowNumber>25 && rCount<28)
                rowCount=rCount-3;
            for (rowIndex; rowIndex<=rowCount; rowIndex++) 
            { 
                var rowElement = gridview.rows[rowIndex]; 
                rowElement.style.backgroundColor='#FFFFFF'
            }
            var color = document.getElementById(rowID).style.backgroundColor;
            if(color != '#ffe1ac') 
            {
                oldColor = color;
            }
            if(color == '#ffe1ac') 
            {
                document.getElementById(rowID).style.backgroundColor = oldColor;
            }
            else 
                document.getElementById(rowID).style.backgroundColor = '#ffe1ac'; 

        }
        function selecttion()
        {
            var combo=document.getElementById('ddlExport');
            combo.value='Ex';
        }
//    function callback()
//     {
//     alert("das")
//     grdCashBankBook.PerformCallback();
//     }

    function DateChangeForFrom()
    {
        //var datePost=(dtFrom.GetDate().getMonth()+2)+'-'+dtFrom.GetDate().getDate()+'-'+dtFrom.GetDate().getYear();
         var sessionValFrom ="<%=Session["FinYearStart"]%>";
                var sessionValTo ="<%=Session["FinYearEnd"]%>"; 
                var sessionVal ="<%=Session["LastFinYear"]%>";
                var objsession=sessionVal.split('-');   
                var MonthDate=dtDate.GetDate().getMonth()+1;
                var DayDate=dtDate.GetDate().getDate();
                var YearDate=dtDate.GetDate().getYear();
                var Cdate=MonthDate+"/"+DayDate+"/"+YearDate;
                var Sto=new Date(sessionValTo).getMonth()+1;
                var SFrom=new Date(sessionValFrom).getMonth()+1;   
                var SDto=new Date(sessionValTo).getDate();
                var SDFrom=new Date(sessionValFrom).getDate();   
                
                if(YearDate>=objsession[0])
                {
                    if(MonthDate<SFrom && YearDate==objsession[0])
                    {
                        alert('Enter Date Is Outside Of Financial Year !!');
                        var datePost=(SFrom+'-'+SDFrom+'-'+objsession[0]);
                        dtDate.SetDate(new Date(datePost));
                    }
                    else if(MonthDate>Sto && YearDate==objsession[1])
                    {
                        alert('Enter Date Is Outside Of Financial Year !!');
                        var datePost=(SFrom+'-'+SDFrom+'-'+objsession[0]);
                        dtDate.SetDate(new Date(datePost));
                    }
                    else if(YearDate!=objsession[0] && YearDate!=objsession[1])
                    {
                        alert('Enter Date Is Outside Of Financial Year !!');
                        var datePost=(SFrom+'-'+SDFrom+'-'+objsession[0]);
                        dtDate.SetDate(new Date(datePost));
                    }
                }
                else
                {
                    alert('Enter Date Is Outside Of Financial Year !!');
                    var datePost=(SFrom+'-'+SDFrom+'-'+objsession[0]);
                    dtDate.SetDate(new Date(datePost));
                }
      
    }
    function DateChangeForTo()
    {
        var sessionValFrom ="<%=Session["FinYearStart"]%>";
                var sessionValTo ="<%=Session["FinYearEnd"]%>"; 
                var sessionVal ="<%=Session["LastFinYear"]%>";
                var objsession=sessionVal.split('-');   
                var MonthDate=dtToDate.GetDate().getMonth()+1;
                var DayDate=dtToDate.GetDate().getDate();
                var YearDate=dtToDate.GetDate().getYear();
                var Cdate=MonthDate+"/"+DayDate+"/"+YearDate;
                var Sto=new Date(sessionValTo).getMonth()+1;
                var SFrom=new Date(sessionValFrom).getMonth()+1;   
                var SDto=new Date(sessionValTo).getDate();
                var SDFrom=new Date(sessionValFrom).getDate();   
                
                if(YearDate<=objsession[1])
                {
                    if(MonthDate<SFrom && YearDate==objsession[0])
                    {
                        alert('Enter Date Is Outside Of Financial Year !!');
                        var datePost=(Sto+'-'+SDto+'-'+objsession[1]);
                        dtToDate.SetDate(new Date(datePost));
                    }
                    else if(MonthDate>Sto && YearDate==objsession[1])
                    {
                        alert('Enter Date Is Outside Of Financial Year !!');
                        var datePost=(Sto+'-'+SDto+'-'+objsession[1]);
                        dtToDate.SetDate(new Date(datePost));
                    }
                    else if(YearDate!=objsession[0] && YearDate!=objsession[1])
                    {
                        alert('Enter Date Is Outside Of Financial Year !!');
                        var datePost=(Sto+'-'+SDto+'-'+objsession[1]);
                        dtToDate.SetDate(new Date(datePost));
                    }
                }
                else
                {
                    alert('Enter Date Is Outside Of Financial Year !!');
                    var datePost=(Sto+'-'+SDto+'-'+objsession[1]);
                    dtToDate.SetDate(new Date(datePost));
                }
    }
       
    </script>

    <script type="text/ecmascript">
        function Hide(obj)
        {
            document.getElementById(obj).style.display='none';
        }
        function Show(obj)
        {
            document.getElementById(obj).style.display='inline';
        }
	    function ReceiveServerData(rValue)
        {
            var Data=rValue.split('~');
            if(Data[0]=='Segment')
            {
            
              var combo = document.getElementById('litSegment');
                var NoItems=Data[1].split(',');
                var i;
                var val='';
                var seg='';
                for(i=0;i<NoItems.length;i++)
                {
                    var items = NoItems[i].split(';');
                    if(val=='')
                    {
                        seg=items[0];
                        val="'" +items[1]+ "'";
                       
                    }
                    else
                    {
                        seg+=','+items[0];
                        val+=",'"+items[1] +"'";
                      
                    }
                }     

                combo.innerText=val;
                document.getElementById('HDNSeg').value=seg;
                
//                var combo = document.getElementById('litSegment');
//                var NoItems=Data[1].split(',');
//                var i;
//                var val='';
//                for(i=0;i<NoItems.length;i++)
//                {
//                    var items = NoItems[i].split(';');
//                    if(val=='')
//                    {
//                        val=items[1];
//                    }
//                    else
//                    {
//                        val+=','+items[1];
//                    }
//                    alert(val);
//                }
//                combo.innerText=val;
            }
            if(Data[0]=='Branch')
            {
                var combo = document.getElementById('litBranch');
                var NoItems=Data[1].split(',');
                var i;
                var val='';
                for(i=0;i<NoItems.length;i++)
                {
                    var items = NoItems[i].split(';');
                    var items1=items[1].split('-');
                    if(val=='')
                    {
                        val='('+items1[1];
                    }
                    else
                    {
                        val+=','+items1[1];
                    }
                }
                val=val+')';
                combo.innerText=val;
            }
        } 
    function CallBankAccount(obj1,obj2,obj3)
    {
       var CurrentSegment='<%=Session["usersegid"]%>'
       if(CurrentSegment.length==8)
        CurrentSegment=document.getElementById("hdn_NsdlCdslExchangeSegment").value;
       var strPutSegment = " and (MainAccount_ExchangeSegment=" + CurrentSegment + " or MainAccount_ExchangeSegment=0)";
       var strQuery_Table = "(Select MainAccount_AccountCode+\'-\'+MainAccount_Name+\' [ \'+MainAccount_BankAcNumber+\' ]\' as IntegrateMainAccount,MainAccount_AccountCode as MainAccount_AccountCode,MainAccount_Name,MainAccount_BankAcNumber from Master_MainAccount where (MainAccount_BankCashType=\'Bank\' or MainAccount_BankCashType=\'Cash\') and (MainAccount_BankCompany=\'" + '<%=Session["LastCompany"] %>' + "\' Or IsNull(MainAccount_BankCompany,'')='')" + strPutSegment + ") as t1";
       var strQuery_FieldName = " Top 10 * ";
       var strQuery_WhereClause = "MainAccount_AccountCode like (\'%RequestLetter%\') or MainAccount_Name like (\'%RequestLetter%\') or MainAccount_BankAcNumber like (\'%RequestLetter%\')";
       var strQuery_OrderBy='';
       var strQuery_GroupBy='';
       var CombinedQuery=new String(strQuery_Table+"$"+strQuery_FieldName+"$"+strQuery_WhereClause+"$"+strQuery_OrderBy+"$"+strQuery_GroupBy);
       ajax_showOptions(obj1,obj2,obj3,replaceChars(CombinedQuery),'Main');
    }
    function replaceChars(entry) {
        out = "+"; // replace this
        add = "--"; // with this
        temp = "" + entry; // temporary holder

        while (temp.indexOf(out)>-1) {
        pos= temp.indexOf(out);
        temp = "" + (temp.substring(0, pos) + add + 
        temp.substring((pos + out.length), temp.length));
        }
        return temp;
        
    }
    
    //New Export Or Batch Script
    function ExportBatchSetting(obj)
    {
        if(obj=="Export")
        {
            Hide('showFilter');
            Show('Td_Export');
            Hide('Td_Batch');
        }
        else
        {
            Hide('showFilter');
            Hide('Td_Export');
            Show('Td_Batch');
        }
        Height('350','350');
    }
    function OnMoreInfoClick()
    {
        var dateString = timeSolver.getString(DTBatch.GetDate(), "YYYY-MM-DD");
        var SqlWhere="(DATEADD(dd, 0, DATEDIFF(dd, 0, ExportFiles_CreateDatetime)))='"+dateString+"'";
        var url="../GenericRoutines/Batch/GenericBatchMaintenance.aspx?FileType=BankBook&SqlWhere="+SqlWhere;
        parent.OnMoreInfoClick(url,"Bank Book",'1150px','480px',"Y");
    }

    function GnrcCallBackPanel_Methods(WhichCall)
    {
        Show("divLoading");
        cBtnExcel.SetEnabled(false);
        cBatchCreate.SetEnabled(false);
        cGnrcCallBackPanel.PerformCallback(WhichCall+'~');
        Height('350','350'); 
    }
    function GnrcCallBackPanel_EndCallBack()
    {
        Hide("divLoading");
        cBtnExcel.SetEnabled(true);
        cBatchCreate.SetEnabled(true);
        if(cGnrcCallBackPanel.cpIsSpData!=undefined)
        {
            if(cGnrcCallBackPanel.cpIsSpData=="Export")
                GetObjectID('btnExcelExport').click();
            if(cGnrcCallBackPanel.cpIsSpData=="Batch")
                GetObjectID('btnBatchExport').click();
        }
        Height('350','350'); 
    }
    //End New Export Or Batch Script
            
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Cash/Bank Book</span></strong>
                    </td>
                </tr>
            </table>
            <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="36000">
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
                <tr id="TrAll">
                    <td colspan="2">
                        <table width="100%">
                            <tr>
                                <td>
                                    <table cellspacing="1" cellpadding="2" style="background-color: #B7CEEC; border: solid 1px  #ffffff"
                                        border="1">
                                        <tr>
                                            <td class="gridcellleft" style="width: 58px">
                                                Bank Name
                                            </td>
                                            <td style="text-align: left; width: 196px;">
                                                <asp:TextBox ID="txtBankName" runat="server" Font-Size="10px" Width="296px" 
                                                onkeyup ="CallBankAccount(this,'GenericAjaxList',event)"></asp:TextBox>
                                                <asp:HiddenField ID="txtBankName_hidden" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="gridcellleft" style="width: 58px">
                                                Segment
                                            </td>
                                            <td style="text-align: left;" colspan="2">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:RadioButton ID="rdbSegAll" runat="server"  Checked="True"  GroupName="a" />
                                                        </td>
                                                        <td>
                                                            All
                                                        </td>
                                                        <td>
                                                            <asp:RadioButton ID="rdbSegSelected" runat="server"    GroupName="a" />
                                                        </td>
                                                        <td>
                                                            Selected
                                                        </td>
                                                        <td>
                                                            <span id="litSegment" runat="server" style="color: Maroon"></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="gridcellleft" style="width: 58px">
                                                Branch
                                            </td>
                                            <td style="text-align: left;" colspan="2">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:RadioButton ID="rdbbAll" runat="server" Checked="True" GroupName="b" />
                                                        </td>
                                                        <td>
                                                            All
                                                        </td>
                                                        <td>
                                                            <asp:RadioButton ID="rdbbSelected" runat="server" GroupName="b" />
                                                        </td>
                                                        <td>
                                                            Selected
                                                        </td>
                                                        <td>
                                                            <span id="litBranch" runat="server" style="color: Maroon"></span>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="gridcellleft" style="width: 58px">
                                                Date
                                            </td>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td style="width: 196px">
                                                            <dxe:ASPxDateEdit ID="dtDate" runat="server" EditFormat="Custom" ClientInstanceName="dtDate"
                                                                UseMaskBehavior="True">
                                                                <dropdownbutton text="From ">
                                        </dropdownbutton>
                                                                <clientsideevents datechanged="function(s,e){DateChangeForFrom();}" />
                                                            </dxe:ASPxDateEdit>
                                                        </td>
                                                        <td>
                                                            <dxe:ASPxDateEdit ID="dtToDate" runat="server" EditFormat="Custom" ClientInstanceName="dtToDate"
                                                                UseMaskBehavior="True">
                                                                <dropdownbutton text="To">
                                        </dropdownbutton>
                                                                <clientsideevents datechanged="function(s,e){DateChangeForTo();}" />
                                                            </dxe:ASPxDateEdit>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        
                                    </table>
                                </td>
                                <td>
                                      <table width="100%" id="showFilter">
                                        <tr>
                                            <td class="gridcellleft" style="vertical-align: top;" id="TdFilter">
                                                <asp:TextBox ID="txtsubscriptionID" runat="server" Font-Size="12px" Width="220px"></asp:TextBox>
                                                <asp:DropDownList ID="cmbsearchOption" runat="server" Font-Size="11px" Width="70px"
                                                    Enabled="false">
                                                    <asp:ListItem>Segment</asp:ListItem>
                                                    <asp:ListItem>Branch</asp:ListItem>
                                                </asp:DropDownList>
                                                <a id="A4" href="javascript:void(0);" onclick="btnAddsubscriptionlist_click()"><span
                                                    style="color: #009900; text-decoration: underline; font-size: 8pt;">Add to List</span></a><span
                                                        style="color: #009900; font-size: 8pt;"> </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left; vertical-align: top">
                                                <table cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td class="gridcellleft" >
                                                            <asp:ListBox ID="lstSuscriptions" runat="server" Font-Size="10px" Height="90px" Width="300px">
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
                                            <td>
                                                <asp:TextBox ID="txtsubscriptionID_hidden" runat="server" Font-Size="12px" Width="1px"></asp:TextBox>
                                                <asp:HiddenField ID="HDNMAIN" runat="server" />
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
                        <table id="TrSearch">
                            <tr>
                                <td>
                                    <dxe:ASPxDateEdit ID="dtSearchDate" runat="server" CssClass="water" NullText="Tr Date"
                                        ToolTip="Tr Date" EditFormat="Custom" Font-Size="10px" UseMaskBehavior="True">
                                    </dxe:ASPxDateEdit>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtVouno" runat="server" CssClass="water" Text="Voucher Number"
                                        ToolTip="Voucher Number" Font-Size="10px" Width="150px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtInstNo" runat="server" CssClass="water" Text="Instrument Number"
                                        ToolTip="Instrument Number" Font-Size="10px" Width="150px"></asp:TextBox>
                                </td>
                                
                            </tr>
                        </table>
                    </td>
                    <td style="text-align: right" id="Trfilter">
                        <a href="#" style="font-weight: bold; color: Blue" onclick="javascript:filter();">Filter</a>
                        || <a href="#" style="font-weight: bold; color: Blue" onclick="javascript:search1();">
                            Search</a>
                        <asp:DropDownList ID="ddlExport" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlExport_SelectedIndexChanged">
                            <asp:ListItem Value="Ex" Selected="True">Export</asp:ListItem>
                            <asp:ListItem Value="E">Excel</asp:ListItem>
                            <asp:ListItem Value="P">PDF</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" id="showDetail">
                        <span id="spanshow" style="color: Blue; font-weight: bold">Bank Name :</span>&nbsp;&nbsp;<span
                            id="spanshow1"></span>&nbsp;&nbsp;<span id="spanshow2" style="color: Blue; font-weight: bold">
                                Period :</span>&nbsp;&nbsp;<span id="spanshow3"></span>
                    </td>
                </tr>
                
                <tr id="trDateRange" style="display: none;">
                    <td colspan="2">
                        <table>
                            <tr id="ShowHd">
                                <td colspan="2">
                                    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <span id="SpanShowHeader" runat="server" style="font-weight: bold; color: Maroon"></span>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="Button2" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                                <td>
                                    <a href="javascript:void(0);" onclick="ShowDateSelect()" style="font-weight: bold;
                                        color: Blue">Show Another Date Range</a>
                                </td>
                            </tr>
                            <tr id="ShowDt">
                                <td style="width: 110px">
                                    <dxe:ASPxDateEdit ID="dtFromG" runat="server" ClientInstanceName="dtFrom" EditFormat="Custom"
                                        UseMaskBehavior="True" Font-Size="10px" Width="108px">
                                        <dropdownbutton text="From">
                                        </dropdownbutton>
                                        <clientsideevents valuechanged="function(s,e){dateChange();DateChangeForFrom();}"
                                            gotfocus="function(s,e){dateChange11();}" />
                                    </dxe:ASPxDateEdit>
                                </td>
                                <td style="width: 110px">
                                    <dxe:ASPxDateEdit ID="dtToG" runat="server" ClientInstanceName="dtTo" EditFormat="Custom"
                                        UseMaskBehavior="True" Font-Size="10px" Width="98px">
                                        <dropdownbutton text="To">
                                        </dropdownbutton>
                                        <clientsideevents valuechanged="function(s,e){dateChange();DateChangeForTo();}" gotfocus="function(s,e){dateChange11();}" />
                                    </dxe:ASPxDateEdit>
                                </td>
                                <td>
                                    <asp:Button ID="Button2" runat="server" Text="Show" CssClass="btnUpdate" Height="23px"
                                        Width="101px" OnClientClick="javascript:selecttion();" OnClick="Button2_Click" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <!--New Export and Batch HTML-->
            <div id="divExlBtch" style="background-color: #DDECFE; border: solid 1px  #ffffff">
                <table>
                    <tr>
                        <td class="gridcellleft" bgcolor="#B7CEEC">
                            Generate Type :</td>
                        <td>
                            <dxe:ASPxComboBox ID="CmbGenerate" runat="server" ClientInstanceName="cCmbGenerate"
                                EnableIncrementalFiltering="True" Font-Size="10px" SelectedIndex="0" ValueType="System.String"
                                Width="200px">
                                <Items>
                                    <dxe:ListEditItem Text="Export To Excel" Value="Export" />
                                    <dxe:ListEditItem Text="Create Batch" Value="Batch" />
                                </Items>
                                <ClientSideEvents SelectedIndexChanged="function(s,e){ExportBatchSetting(cCmbGenerate.GetValue())}" />
                            </dxe:ASPxComboBox>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td id="Td_Export" style="height: 30px">
                            <dxe:ASPxButton ID="aBtnExcel" runat="server" AutoPostBack="False" ClientInstanceName="cBtnExcel"
                                Text="Export To Excel">
                                <ClientSideEvents Click="function(s,e){GnrcCallBackPanel_Methods('Export');}" />
                            </dxe:ASPxButton>
                        </td>
                    </tr>
                    <tr>
                        <td id="Td_Batch" style="display: none">
                            <table>
                                <tr>
                                    <td>
                                        <dxe:ASPxDateEdit ID="DTBatch" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                            Font-Size="10px" Width="150px" ClientInstanceName="DTBatch">
                                            <DropDownButton Text="Batch Info Date">
                                            </DropDownButton>
                                            <ClientSideEvents DateChanged="function(s,e){DateChange(DtFrom);}" />
                                        </dxe:ASPxDateEdit>
                                    </td>
                                    <td>
                                        <dxe:ASPxButton ID="Abtn_BatchInfo" runat="server" AutoPostBack="False" ClientInstanceName="cBatchInfo"
                                            Text="Batch Info">
                                            <ClientSideEvents Click="function(s,e){OnMoreInfoClick();}" />
                                        </dxe:ASPxButton>
                                    </td>
                                    <td>
                                        <dxe:ASPxButton ID="Abtn_BatchCreate" runat="server" AutoPostBack="False" ClientInstanceName="cBatchCreate"
                                            Text="Batch Create">
                                            <ClientSideEvents Click="function(s,e){GnrcCallBackPanel_Methods('Batch');}" />
                                        </dxe:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <div id="divLoading">
                    <dxcp:ASPxCallbackPanel ID="GnrcCallBackPanel" runat="server" ClientInstanceName="cGnrcCallBackPanel"
                        BackColor="White" OnCallback="GnrcCallBackPanel_Callback" LoadingPanelText="Please Wait Until File Not Generated.."
                        LoadingPanelStyle-Font-Size="Medium">
                        <PanelCollection>
                            <dxp:panelcontent>
                            </dxp:panelcontent>
                        </PanelCollection>
                        <ClientSideEvents EndCallback="function(s, e) {
	                                                            GnrcCallBackPanel_EndCallBack(); }" />
                    </dxcp:ASPxCallbackPanel>
                </div>
                <div style="display: none">
                    <asp:Button ID="btnExcelExport" runat="server" BackColor="#DDECFE" BorderStyle="None"
                        OnClick="btnExcelExport_Click" />
                    <asp:Button ID="btnBatchExport" runat="server" BackColor="#DDECFE" BorderStyle="None"
                        OnClick="btnBatchExport_Click" />
                </div>
            </div>
                <!--End New Export and Batch HTML-->
            <table>
                <tr>
                    <td>
                    <asp:HiddenField ID="HDNSeg" runat="server" />
                    <asp:HiddenField ID="hdn_NsdlCdslExchangeSegment" runat="server" />
                    </td>
                </tr>
            </table>
            
        </div>
        
    </form>
</body>
</html>
