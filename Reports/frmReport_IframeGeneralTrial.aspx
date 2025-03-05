<%@ page language="C#" autoeventwireup="true" enableeventvalidation="false" inherits="Reports_frmReport_IframeGeneralTrial, App_Web_hnkxxmul" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>General Trial</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/GenericJscript.js"></script>
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

    <script language="javascript" type="text/javascript">
//        function winclose()
//        {
//        alert("No Data found");
//        return false;
//        }

        function filter()
        {
            document.getElementById("Trfilter").style.display='none';
            document.getElementById("TrAll").style.display='inline';
            document.getElementById('TrSearch').style.display='none';
            height();
        }

        function ShowHidePeriod(obj,obj1)
        {
            document.getElementById("TdAsOnDate").style.display='none';
            document.getElementById("TdPeriod").style.display='inline';
            
            
            document.getElementById("TrAll").style.display='none';
            document.getElementById("Trfilter").style.display='inline';
            document.getElementById("showDetail").style.display='inline';
            document.getElementById("spanshow1").innerText=obj;
            document.getElementById("spanshow3").innerText=obj1;
            
            
            
            height();
          
        }
        
        function ShowHideAsOn(obj,obj1)
        {
     
             document.getElementById("TdAsOnDate").style.display='inline';
            document.getElementById("TdPeriod").style.display='none';
     
            document.getElementById("TrAll").style.display='none';
            document.getElementById("Trfilter").style.display='inline';
            document.getElementById("showDetail").style.display='inline';
            document.getElementById("spanshow1").innerText=obj;
            document.getElementById("spanshow3").innerText=obj1;
            
           
            
            height();
          
        }
        
        function SignOff()
        {
            window.parent.SignOff();
        }
         FieldName='lstSuscriptions';
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
//        function ShowHide(obj)
//        {
//            document.getElementById("TdExport").style.display='inline';
//            height();
//        }
        function Disable(obj)
        {
            var gridview = document.getElementById('grdGeneralTrial'); 
            var rCount = gridview.rows.length; 
            if(rCount<10)
                rCount='0'+rCount;
            if(obj=='P')
            {
                document.getElementById("grdGeneralTrial_ctl18_FirstPage").style.display='none';
                document.getElementById("grdGeneralTrial_ctl18_PreviousPage").style.display='none';
                document.getElementById("grdGeneralTrial_ctl18_NextPage").style.display='inline';
                document.getElementById("grdGeneralTrial_ctl18_LastPage").style.display='inline';
            }
            else
            {
                document.getElementById("grdGeneralTrial_ctl"+rCount+"_NextPage").style.display='none';
                document.getElementById("grdGeneralTrial_ctl"+rCount+"_LastPage").style.display='none';
            }
        }
        function ShowGeneralTrialDetail(objMainAcc,objDate,objMain,objSegment,objTo,objType,ObjAcType,objZero)
        {
//        alert(objMainAcc);
//        alert(objDate);
//        alert(objMain);
//        alert(objSegment);
//        alert(objTo);
//        alert(objType);
//        
         //   var URL='frmReport_IframeSubsidiaryTrial.aspx?mainacc='+objMainAcc+' &date='+objDate+' &Segment='+objSegment+' &TDate='+objTo+' &Type='+objType;
	        var URL='frmReport_GeneralTrialDetail.aspx?mainacc='+objMainAcc+' &date='+objDate+' &Segment='+objSegment+' &TDate='+objTo+' &Type='+objType + ' &AccName='+objMain+ ' &AccType='+ObjAcType + ' &ZeroBal='+objZero;
	       
	       // parent.ParentWindowShow(URL,objMain);
	         parent.OnMoreInfoClick(URL,objMain,'980px','500px',"Y");
        }
        
        
        
         function ShowCashBankDetail(objMainAcc,objDate,objMain,objSegment,objTo,objType,ObjAcType)
        {
	         var URL='frmReport_IFrameCashBankBook.aspx?mainacc='+objMainAcc+' &date='+objDate+' &Segment='+objSegment+' &TDate='+objTo+' &Type='+objType + ' &AccName='+objMain+ ' &AccType='+ObjAcType;     	   
	         parent.OnMoreInfoClick(URL,objMain,'980px','500px',"Y");
        }
        
        
      function ShowLedger(objMainID,objSubID,objSegmentID,objMainAcc,objSubAcc,objUcc,objDate)
        {
                var URL='frmReport_IFrameLedgerView.aspx?MainID='+objMainID +' &SubID='+objSubID +' &SegmentID='+objSegmentID +' &date='+objDate;	        
               // editwin=dhtmlmodal.open("Editbox", "iframe", URL, "Bill For - "+objMainAcc+"", "width=940px,height=450px,center=1,resize=1,top=500", "recal");                 
                 parent.OnMoreInfoClick(URL,objMainAcc,'980px','500px',"Y");
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
                alert('Please search name and then Add!');
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
        function clientselectionfinal()
	    {
	        var listBoxSubs = document.getElementById('lstSuscriptions');
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
                var sendData = 'Segment' + '~' + listIDs;
                CallServer(sendData,"");
            }
	        var i;
            for(i=listBoxSubs.options.length-1;i>=0;i--)
            {
                listBoxSubs.remove(i);
            }
            document.getElementById('TdFilter').style.display='none';
	        document.getElementById('TdSelect').style.display='none';
	    }
	    function ShowMainAccountName(obj1,obj2,obj3)
         {
            ajax_showOptions(obj1,obj2,obj3,'Segment');
         }
        function MainAll(obj)
        {
        
            if(obj=='all')
            {
                document.getElementById('TdFilter').style.display='none';
	            document.getElementById('TdSelect').style.display='none';
            }
            else    
            {
                if(document.getElementById('HDNAccInd').value=='Y')
                {
                document.getElementById('TdFilter').style.display='inline';
	            document.getElementById('TdSelect').style.display='inline';
	            }
            }
        }
        function DateAll(obj)
        {
            if(obj=='all')
            {
                document.getElementById('asOnDate1').style.display='inline';
                document.getElementById('AsOnTr').style.display='inline';                
                document.getElementById('asOnDate2').style.display='inline';
	            document.getElementById('Period1').style.display='none';
	            document.getElementById('PeriodTr').style.display='none';	            
	            document.getElementById('Period2').style.display='none';
	            document.getElementById('Period3').style.display='none';
	            
	             document.getElementById('Tr2').style.display='none';
	         
            }
            else    
            {
                document.getElementById('asOnDate1').style.display='none';
                 document.getElementById('AsOnTr').style.display='none';
                document.getElementById('asOnDate2').style.display='none';
	            document.getElementById('Period1').style.display='inline';
	             document.getElementById('PeriodTr').style.display='inline';
	            document.getElementById('Period2').style.display='inline';
	            document.getElementById('Period3').style.display='inline';	  
	            
	             document.getElementById('Tr2').style.display='inline';      
            }
        }
        function Page_Load()
	    {        
	        document.getElementById("showDetail").style.display='none';
	        document.getElementById('Trfilter').style.display='none';
	        document.getElementById('TdFilter').style.display='none';
	        document.getElementById('TdSelect').style.display='none';
	        document.getElementById('asOnDate1').style.display='inline';
	        document.getElementById('AsOnTr').style.display='inline';
            document.getElementById('asOnDate2').style.display='inline';
	        document.getElementById('Period1').style.display='none';
	        document.getElementById('PeriodTr').style.display='none';
	        document.getElementById('Period2').style.display='none';
	        document.getElementById('Period3').style.display='none';
	        
	         document.getElementById('Tr2').style.display='none';
	       
	    }
	    function ChangeRowColor(rowID,rowNumber) 
        {
            var gridview = document.getElementById('grdGeneralTrial'); 
            var rCount = gridview.rows.length; 
            var rowIndex=1;
            var rowCount=0;
            if(rCount==18)
                 rowCount=15;
            else    
               rowCount=rCount-3;
            if(rowNumber>15 && rCount<18)
                rowCount=rCount-3;
            for (rowIndex; rowIndex<=rowCount; rowIndex++) 
            { 
                var rowElement = gridview.rows[rowIndex]; 
                rowElement.style.backgroundColor='#FFFFFF'
            }
            document.getElementById(rowID).style.backgroundColor = '#ffe1ac'; 

        }
        function ChangeRowColorPeriod(rowID,rowNumber)
        {
            var gridview = document.getElementById('grdPeriod'); 
            var rCount = gridview.rows.length; 
            var rowIndex=2;
            var rowCount=0;
            if(rCount==18)
                 rowCount=15;
            else    
               rowCount=rCount-3;
            if(rowNumber>15 && rCount<18)
                rowCount=rCount-3;
            for (rowIndex; rowIndex<=rowCount; rowIndex++) 
            { 
                var rowElement = gridview.rows[rowIndex]; 
                rowElement.style.backgroundColor='#FFFFFF';
            }
            document.getElementById(rowID).style.backgroundColor = '#ffe1ac'; 
        }
        function DisablePeriod(obj)
        {
            var gridview = document.getElementById('grdPeriod'); 
            var rCount = gridview.rows.length; 
            if(rCount<10)
                rCount='0'+(rCount-1);
            if(obj=='P')
            {
                document.getElementById("grdPeriod_ctl18_FirstPage").style.display='none';
                document.getElementById("grdPeriod_ctl18_PreviousPage").style.display='none';
                document.getElementById("grdPeriod_ctl18_NextPage").style.display='inline';
                document.getElementById("grdPeriod_ctl18_LastPage").style.display='inline';
            }
            else
            {
                document.getElementById("grdPeriod_ctl"+rCount+"_NextPage").style.display='none';
                document.getElementById("grdPeriod_ctl"+rCount+"_LastPage").style.display='none';
            }
        }
	    function DisableFirst()
	    {
	        var gridview = document.getElementById('grdGeneralTrial'); 
            var rCount = gridview.rows.length; 
            if(rCount<10)
                rCount='0'+(rCount-1);
            document.getElementById("grdGeneralTrial_ctl"+rCount+"_NextPage").style.display='none';
            document.getElementById("grdGeneralTrial_ctl"+rCount+"_LastPage").style.display='none';
            document.getElementById("grdGeneralTrial_ctl"+rCount+"_FirstPage").style.display='none';
            document.getElementById("grdGeneralTrial_ctl"+rCount+"_PreviousPage").style.display='none';
	    }
	    function selecttion()
        {
            var combo=document.getElementById('ddlExport');
            combo.value='Ex';
        }  
    function DateChange(DateObj)
    {
        var Lck ='<%=Session["LCKBNK"] %>';
        var FYS ='<%=Session["FinYearStart"]%>';
        var FYE ='<%=Session["FinYearEnd"]%>'; 
        var LFY ='<%=Session["LastFinYear"]%>';
        var GetDate='<%=Session["ServerDate"]%>';
        var ExpDate='<%=Session["ExpireDate"]%>';
        //DevE_CheckForLockDate(DateObj,Lck);
        DevE_CheckForFinYear(DateObj,FYS,FYE,LFY);
        DevE_CompareDateForMin(dtFrom,dtToDate,'From Date Must Be Less than To Date!!!');
    }
    </script>

    <script type="text/ecmascript">
        
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
                        val=items[1];
                       
                    }
                    else
                    {
                        seg+=','+items[0];
                        val+=','+items[1];
                      
                    }
                }               
                document.getElementById('hdnSegment').value=seg;
                combo.innerText=val;
            }
        } 
            
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server" autocomplete="off">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
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

            <table class="TableMain100" border="0">
                <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">General Trial</span></strong>
                    </td>
                </tr>
            </table>
            <table class="TableMain100" border="0">
                <tr id="TrAll">
                    <td style="vertical-align: top">
                        <table cellspacing="1" cellpadding="2" style="background-color: #B7CEEC; border: solid 1px  #ffffff"
                            border="1">
                            <tr>
                                <td class="gridcellleft">
                                    Date :
                                </td>
                                <td colspan="2">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:RadioButton ID="radAsDate" runat="server" Checked="True" GroupName="a1" />
                                            </td>
                                            <td>
                                                As On Date
                                            </td>
                                            <td>
                                                <asp:RadioButton ID="radPeriod" runat="server" GroupName="a1" />
                                            </td>
                                            <td>
                                                Period
                                            </td>
                                            <td>
                                                <span id="Span1" runat="server" style="color: Maroon"></span>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr id="PeriodTr">
                                <td class="gridcellleft" id="Period1">
                                    Period :
                                </td>
                                <td>
                                    <table>
                                        <tr>
                                            <td id="Period2">
                                                <dxe:ASPxDateEdit ID="dtFrom" runat="server" EditFormat="Custom" ClientInstanceName="dtFrom"
                                                    UseMaskBehavior="True">
                                                    <DropDownButton Text="From">
                                                    </DropDownButton>
                                                    <ClientSideEvents DateChanged="function(s,e){DateChange(dtFrom);}" />
                                                </dxe:ASPxDateEdit>
                                            </td>
                                            <td id="Period3">
                                                <dxe:ASPxDateEdit ID="dtTo" runat="server" EditFormat="Custom" ClientInstanceName="dtToDate"
                                                    UseMaskBehavior="True">
                                                    <DropDownButton Text="To">
                                                    </DropDownButton>
                                                    <ClientSideEvents DateChanged="function(s,e){DateChange(dtToDate);}" />
                                                </dxe:ASPxDateEdit>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr id="AsOnTr">
                                <td class="gridcellleft" id="asOnDate1">
                                    As On Date :
                                </td>
                                <td>
                                    <table>
                                        <tr>
                                            <td style="width: 160px" id="asOnDate2">
                                                <dxe:ASPxDateEdit ID="dtDate" runat="server" EditFormat="Custom" UseMaskBehavior="True" ClientInstanceName="dtDate">
                                                    <DropDownButton Text="As on Date">
                                                    </DropDownButton>
                                                    <ClientSideEvents DateChanged="function(s,e){DateChange(dtDate);}" />
                                                </dxe:ASPxDateEdit>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr id="TrAccount" runat="Server">
                                <td class="gridcellleft">
                                    Segment :
                                </td>
                                <td>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:RadioButton ID="rdbMainAll" runat="server" GroupName="a" />
                                            </td>
                                            <td>
                                                All
                                            </td>
                                            <td>
                                                <asp:RadioButton ID="rdbMainSelected" runat="server" Checked="True" GroupName="a" />
                                            </td>
                                            <td>
                                                Selected
                                            </td>
                                            <td>
                                                [<span id="litSegment" runat="server" style="color: Maroon"></span>]
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:CheckBox ID="chkZero" runat="server" />
                                    Show Zero Balance Account
                                </td>
                            </tr>
                            
                            
                             <%--------------------- For Hide Opening  Start --------------------%>
                                        
                                        <tr id="Tr2" >
                                            <td colspan="2">
                                                <asp:CheckBox ID="Chk_HOpening" runat="server" />
                                                Ignore Opening Balance
                                            </td>
                                        </tr>
                                        
                                        
                             <%---------------------For Hide Opening  End --------------------%>
                            
                            
                            <tr>
                                <td style="text-align: left">
                                    <asp:Button ID="btnShow" runat="server" Text="Show" CssClass="btnUpdate" Height="25px"
                                        OnClientClick="selecttion()" OnClick="btnShow_Click" Width="90px" />
                                </td>
                                <td style="display: none">
                                    <asp:TextBox ID="txtsubscriptionID_hidden" runat="server" Font-Size="12px" Width="1px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="vertical-align: top">
                        <table>
                            <tr>
                                <td class="gridcellleft" style="vertical-align: top; text-align: right" id="TdFilter">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txtsubscriptionID" runat="server" Font-Size="12px" Width="193px"></asp:TextBox>
                                                <a id="A4" href="javascript:void(0);" onclick="btnAddsubscriptionlist_click()"><span
                                                    style="color: #009900; text-decoration: underline; font-size: 8pt;">Add to List</span></a><span
                                                        style="color: #009900; font-size: 8pt;"> </span>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right; vertical-align: top">
                                    <table cellpadding="0" cellspacing="0" id="TdSelect">
                                        <tr>
                                            <td>
                                                <asp:ListBox ID="lstSuscriptions" runat="server" Font-Size="10px" Height="90px" Width="253px">
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
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                            <ProgressTemplate>
                                <div id='Div1' style='position: absolute; font-family: arial; font-size: 30; left: 100;
                                    top: 8; background-color: white; layer-background-color: white; height: 80; width: 150;'>
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
                <tr style="text-align: right" id="Trfilter">
                    <td style="text-align: right" colspan="2">
                        <a href="#" style="font-weight: bold; color: Blue" onclick="javascript:filter();">Filter</a>
                        ||
                        <asp:DropDownList ID="ddlExport" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlExport_SelectedIndexChanged">
                            <asp:ListItem Value="Ex" Selected="True">Export</asp:ListItem>
                            <asp:ListItem Value="E">Excel</asp:ListItem>
                            <asp:ListItem Value="P">PDF</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td id="showDetail">
                        <span id="spanshow" style="color: Blue; font-weight: bold"></span>&nbsp;&nbsp;<span
                            id="spanshow1" style="color: Blue; font-weight: bold"></span>&nbsp;&nbsp;<span id="spanshow2"
                                style="color: Blue; font-weight: bold"></span>&nbsp;&nbsp;<span id="spanshow3"></span>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" id="TdAsOnDate">
                        <table style="width: 100%">
                            <tr>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:GridView ID="grdGeneralTrial" runat="server" Width="100%" BorderColor="CornflowerBlue"
                                                ShowFooter="True" AutoGenerateColumns="false" AllowPaging="true" BorderStyle="Solid"
                                                AllowSorting="true" BorderWidth="2px" CellPadding="4" ForeColor="#0000C0" PageSize="20000"
                                                OnRowCreated="grdSubsidiaryTrial_RowCreated" OnRowDataBound="grdGeneralTrial_RowDataBound"
                                                OnSorting="grdGeneralTrial_Sorting">
                                                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True"></FooterStyle>
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Main Account" SortExpression="accountsledger_mainaccountid">
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblMainAccount" runat="server" Text='<%# Eval("accountsledger_mainaccountid")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Main Account Code" SortExpression="MainAccID">
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSubAccount" runat="server" Text='<%# Eval("MainAccID")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Detail">
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                                        <ItemTemplate>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Debit">
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="center" Font-Bold="False"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDebit" runat="server" Text='<%# Eval("AmountDR")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Credit">
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCredit" runat="server" Text='<%# Eval("AmountCR")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Credit" Visible="false">
                                                        <ItemStyle BorderWidth="1px" HorizontalAlign="right"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblMainAcc" runat="server" Text='<%# Eval("ID")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Credit" Visible="false">
                                                        <ItemStyle BorderWidth="1px" HorizontalAlign="right"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSubLedgerType" runat="server" Text='<%# Eval("SubLedgerType")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="CashBank" Visible="false">
                                                        <ItemStyle BorderWidth="1px" HorizontalAlign="right"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCashBankType" runat="server" Text='<%# Eval("CashBankType")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <PagerTemplate>
                                                    <table width="100%">
                                                        <tr>
                                                            <td colspan="4" style="text-align: right">
                                                                [Records
                                                                <%if (grdGeneralTrial.PageCount == grdGeneralTrial.PageIndex + 1)
                                                                  {%>
                                                                <%= grdGeneralTrial.PageIndex * grdGeneralTrial.PageSize%>
                                                                -
                                                                <%= grdGeneralTrial.PageIndex * grdGeneralTrial.PageSize + grdGeneralTrial.Rows.Count-1%>
                                                                <%}
                                                                  else
                                                                  {%>
                                                                <%= grdGeneralTrial.PageIndex * grdGeneralTrial.PageSize%>
                                                                -
                                                                <%= grdGeneralTrial.PageIndex * grdGeneralTrial.PageSize + grdGeneralTrial.PageSize - 1 %>
                                                                <%}%>
                                                                ]
                                                                <asp:LinkButton ID="FirstPage" runat="server" Font-Bold="true" CommandName="First"
                                                                    OnCommand="NavigationLink_Click" Text="[First Page]"> </asp:LinkButton>
                                                                <asp:LinkButton ID="PreviousPage" runat="server" Font-Bold="true" CommandName="Prev"
                                                                    OnCommand="NavigationLink_Click" Text="[Previous Page]">  </asp:LinkButton>
                                                                <asp:LinkButton ID="NextPage" runat="server" Font-Bold="true" CommandName="Next"
                                                                    OnCommand="NavigationLink_Click" Text="[Next Page]">
                                                                </asp:LinkButton>
                                                                <asp:LinkButton ID="LastPage" runat="server" Font-Bold="true" CommandName="Last"
                                                                    OnCommand="NavigationLink_Click" Text="[Last Page]">
                                                                </asp:LinkButton>
                                                            </td>
                                                            <td colspan="2" style="text-align: right; font-weight: bold">
                                                                <asp:Literal ID="litDiff" runat="server"></asp:Literal>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </PagerTemplate>
                                                <RowStyle BackColor="#FFFFFF" ForeColor="#330099" BorderColor="#BFD3EE" BorderStyle="Double"
                                                    BorderWidth="1px"></RowStyle>
                                                <EditRowStyle BackColor="#E59930"></EditRowStyle>
                                                <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" Font-Bold="True"></SelectedRowStyle>
                                                <PagerStyle ForeColor="White" HorizontalAlign="Center"></PagerStyle>
                                                <HeaderStyle ForeColor="Black" BorderWidth="1px" CssClass="EHEADER" BorderColor="AliceBlue"
                                                    Font-Bold="False"></HeaderStyle>
                                                <%--<AlternatingRowStyle BackColor="White"></AlternatingRowStyle>--%>
                                            </asp:GridView>
                                            <asp:HiddenField ID="CurrentPage" runat="server"></asp:HiddenField>
                                            <asp:HiddenField ID="TotalPages" runat="server"></asp:HiddenField>
                                            <asp:HiddenField ID="TotalClient" runat="server" />
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnShow" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" id="TdPeriod">
                        <table style="width: 100%">
                            <tr>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:GridView ID="grdPeriod" runat="server" Width="100%" BorderColor="CornflowerBlue"
                                                ShowFooter="True" AutoGenerateColumns="false" AllowPaging="True" BorderStyle="Solid"
                                                AllowSorting="true" BorderWidth="2px" CellPadding="4" ForeColor="#0000C0" PageSize="20000"
                                                OnRowCreated="grdPeriod_RowCreated" OnRowDataBound="grdPeriod_RowDataBound">
                                                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True"></FooterStyle>
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Main Account">
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblMainAccount" runat="server" Text='<%# Eval("accountsledger_mainaccountid")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Code">
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSubAccount" runat="server" Text='<%# Eval("MainAccID")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Detail">
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                                        <ItemTemplate>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Opening Dr">
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCredit" runat="server" Text='<%# Eval("OpeningDr")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Opening Cr">
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="center" Font-Bold="False"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDebit" runat="server" Text='<%# Eval("OpeningCr")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Amount Dr">
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="center" Font-Bold="False"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDebit1" runat="server" Text='<%# Eval("AmountDR")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Amount Cr">
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCredit1" runat="server" Text='<%# Eval("AmountCR")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Closing Dr">
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="center" Font-Bold="False"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDebit2" runat="server" Text='<%# Eval("ClosingDr")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Closing Cr">
                                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCredit2" runat="server" Text='<%# Eval("ClosingCr")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Credit" Visible="false">
                                                        <ItemStyle BorderWidth="1px" HorizontalAlign="right"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblMainAcc" runat="server" Text='<%# Eval("ID")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Credit" Visible="false">
                                                        <ItemStyle BorderWidth="1px" HorizontalAlign="right"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblSubLedgerType" runat="server" Text='<%# Eval("SubLedgerType")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="CashBank" Visible="false">
                                                        <ItemStyle BorderWidth="1px" HorizontalAlign="right"></ItemStyle>
                                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCashBankType" runat="server" Text='<%# Eval("CashBankType")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <PagerTemplate>
                                                    <table width="100%">
                                                        <tr>
                                                            <td colspan="4" style="text-align: center">
                                                                <asp:LinkButton ID="FirstPage" runat="server" Font-Bold="true" CommandName="First"
                                                                    OnCommand="NavigationLinkPeriod_Click" Text="[First Page]"> </asp:LinkButton>
                                                                <asp:LinkButton ID="PreviousPage" runat="server" Font-Bold="true" CommandName="Prev"
                                                                    OnCommand="NavigationLinkPeriod_Click" Text="[Previous Page]">  </asp:LinkButton>
                                                                <asp:LinkButton ID="NextPage" runat="server" Font-Bold="true" CommandName="Next"
                                                                    OnCommand="NavigationLinkPeriod_Click" Text="[Next Page]">
                                                                </asp:LinkButton>
                                                                <asp:LinkButton ID="LastPage" runat="server" Font-Bold="true" CommandName="Last"
                                                                    OnCommand="NavigationLinkPeriod_Click" Text="[Last Page]">
                                                                </asp:LinkButton>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </PagerTemplate>
                                                <RowStyle BackColor="#FFFFFF" ForeColor="#330099" BorderColor="#BFD3EE" BorderStyle="Double"
                                                    BorderWidth="1px"></RowStyle>
                                                <EditRowStyle BackColor="#E59930"></EditRowStyle>
                                                <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" Font-Bold="True"></SelectedRowStyle>
                                                <PagerStyle ForeColor="White" HorizontalAlign="Center"></PagerStyle>
                                                <HeaderStyle ForeColor="Black" BorderWidth="1px" BackColor="#C6D6FD" BorderColor="AliceBlue"
                                                    Font-Bold="False"></HeaderStyle>
                                                <%--<AlternatingRowStyle BackColor="White"></AlternatingRowStyle>--%>
                                            </asp:GridView>
                                            <asp:HiddenField ID="CurrentPagePeriod" runat="server"></asp:HiddenField>
                                            <asp:HiddenField ID="TotalPagesPeriod" runat="server"></asp:HiddenField>
                                            <asp:HiddenField ID="TotalClientPeriod" runat="server" />
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnShow" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:HiddenField ID="hdnSegment" runat="server" />
                         <asp:HiddenField ID="HDNAccInd" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
