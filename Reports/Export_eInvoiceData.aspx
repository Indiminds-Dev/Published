<%@ page language="C#" autoeventwireup="true" inherits="Reports_Export_eInvoiceData, App_Web_wqa_thzl" enableeventvalidation="false" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Export E-Invoice</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>
    <script type="text/javascript" src="../CentralData/JSScript/GenericJScript.js"></script>
    <script language="javascript" type="text/javascript" src="../CentralData/JSScript/timeSolver.min.js"></script>

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
        width:98%;
        scrollbar-base-color: #C0C0C0;
    
    }
	</style>

    <script language="javascript" type="text/javascript"> 
  
    function Page_Load()///Call Into Page Load
    {
         Hide('showFilter');
         height();                 
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
    }
    function Hide(obj)
    {
      document.getElementById(obj).style.display='none';
    }
    function Show(obj)
    {
      document.getElementById(obj).style.display='inline';
    }
    function DateCompare(DateobjFrm,DateobjTo)
    {
//        var Msg="To Date Can Not Be Less Than From Date!!!";
        var Msg="";
        DevE_CompareDateForMin(DateobjFrm,DateobjTo,Msg);
    }
    function DevE_CompareDateForMin(DateObjectFrm,DateObjectTo,Msg)    
    {
        var SelectedDate = new Date(DateObjectFrm.GetDate());
        var monthnumber = SelectedDate.getMonth();
        var monthday    = SelectedDate.getDate();
        var year        = SelectedDate.getYear();
        var SelectedDateValueFrm=new Date(year, monthnumber, monthday);
        
        var SelectedDate = new Date(DateObjectTo.GetDate());
        monthnumber = SelectedDate.getMonth();
        monthday    = SelectedDate.getDate();
        year        = SelectedDate.getYear();
        var SelectedDateValueTo=new Date(year, monthnumber, monthday);
        var SelectedDateNumericValueFrm=SelectedDateValueFrm.getTime();
        var SelectedDateNumericValueTo=SelectedDateValueTo.getTime();
        if(SelectedDateNumericValueFrm>SelectedDateNumericValueTo)
        {
//            alert(Msg);
//            DateObjectTo.SetDate(new Date(DateObjectFrm.GetDate()));
        }
    }
function DateChangeForFrom()
{    
    var dateFrom ='<%=Session["FinYearStart"]%>';    
    var dateTo ='<%=Session["FinYearEnd"]%>';
    
    var MonthDate=dtFrom.GetDate().getMonth()+1;
    var DayDate=dtFrom.GetDate().getDate();
    var YearDate=dtFrom.GetDate().getYear();
    var objdateFrom;
    var objdateTo;
    
    var objDateFromMonth;
    var objDateFromYear;
    var objDateToMonth;
    var objDateToYear;
    
    var n = dateFrom.indexOf("/");
    if(n>0)
    {
          objdateFrom=dateFrom.split('/');
          objdateTo=dateTo.split('/');
          
          objDateFromMonth=objdateFrom[0] ;
          objDateFromYear=objdateFrom[2].split(' ')[0];
          
          objDateToMonth=objdateTo[0] ;
          objDateToYear=objdateTo[2].split(' ')[0];
         
    }
    else
    {
         objdateFrom=dateFrom.split('-');
         objdateTo=dateTo.split('-');
           objDateFromMonth=objdateFrom[0] ;
          objDateFromYear=objdateFrom[2].split(' ')[0];
          
          objDateToMonth=objdateTo[0] ;
          objDateToYear=objdateTo[2].split(' ')[0];
    }
//    return true;
    if(!((MonthDate>=objDateFromMonth && YearDate==objDateFromYear)|| (MonthDate<=objDateToMonth && YearDate==objDateToYear)))
    {
         alert('Enter Date Is Outside Of Financial Year !!');
          if(new Date()<new Date(dateFrom))
            dtFrom.SetDate(new Date());
         else if(new Date()>new Date(dateFrom))
            dtFrom.SetDate(new Date(dateFrom));
         else
             dtFrom.SetDate(new Date(dateFrom));
         return false;
    }    
    else
    {
        return true;
    }
}

function DateChangeForTo()
{    
    var dateFrom ='<%=Session["FinYearStart"]%>';    
    var dateTo ='<%=Session["FinYearEnd"]%>';
    var MonthDate=dtTo.GetDate().getMonth()+1;
    var DayDate=dtTo.GetDate().getDate();
    var YearDate=dtTo.GetDate().getYear();
    var objdateFrom;
    var objdateTo;
    
    var objDateFromMonth;
    var objDateFromYear;
    var objDateToMonth;
    var objDateToYear;
    
    var n = dateFrom.indexOf("/");
    if(n>0)
    {
          objdateFrom=dateFrom.split('/');
          objdateTo=dateTo.split('/');
          
          objDateFromMonth=objdateFrom[0] ;
          objDateFromYear=objdateFrom[2].split(' ')[0];
          
          objDateToMonth=objdateTo[0] ;
          objDateToYear=objdateTo[2].split(' ')[0];         
    }
    else
    {
         objdateFrom=dateFrom.split('-');
         objdateTo=dateTo.split('-');
         
         objDateFromMonth=objdateFrom[0] ;
         objDateFromYear=objdateFrom[2].split(' ')[0];
          
         objDateToMonth=objdateTo[0] ;
         objDateToYear=objdateTo[2].split(' ')[0];
    }
    if(!((MonthDate>=objDateFromMonth && YearDate==objDateFromYear)|| (MonthDate<=objDateToMonth && YearDate==objDateToYear)))
    {
         alert('Enter Date Is Outside Of Financial Year !!');
          if(new Date()<new Date(dateTo))
            dtTo.SetDate(new Date());
         else if(new Date()>new Date(dateFrom))
            dtTo.SetDate(new Date(dateFrom));
         else
             dtTo.SetDate(new Date(dateTo));
         return false;
    }    
    else
    {
        return true;
    }
}
function DateChangeForFrom1()
    {
        var sessionVal ="<%=Session["LastFinYear"]%>";
        var objsession=sessionVal.split('-');
        var MonthDate=dtFrom.GetDate().getMonth()+1;
        var DayDate=dtFrom.GetDate().getDate();
        var YearDate=dtFrom.GetDate().getYear();
        if(YearDate>=objsession[0])
        {
            if(MonthDate<4 && YearDate==objsession[0])
            {
                alert('Enter Date Is Outside Of Financial Year !!');
                var datePost=(4+'-'+1+'-'+objsession[0]);
                dtFrom.SetDate(new Date(datePost));
            }
            else if(MonthDate>3 && YearDate==objsession[1])
            {
                alert('Enter Date Is Outside Of Financial Year !!');
                var datePost=(4+'-'+1+'-'+objsession[0]);
                dtFrom.SetDate(new Date(datePost));
            }
            else if(YearDate!=objsession[0] && YearDate!=objsession[1])
            {
                alert('Enter Date Is Outside Of Financial Year !!');
                var datePost=(4+'-'+1+'-'+objsession[0]);
                dtFrom.SetDate(new Date(datePost));
            }
        }
        else
        {
            alert('Enter Date Is Outside Of Financial Year !!');
            var datePost=(4+'-'+1+'-'+objsession[0]);
            dtFrom.SetDate(new Date(datePost));
        }
    }
    function DateChangeForTo1()
    {
        var sessionVal ="<%=Session["LastFinYear"]%>";
        var objsession=sessionVal.split('-');
        var MonthDate=dtTo.GetDate().getMonth()+1;
        var DayDate=dtTo.GetDate().getDate();
        var YearDate=dtTo.GetDate().getYear();
        
        if(YearDate<=objsession[1])
        {
            if(MonthDate<4 && YearDate==objsession[0])
            {
                alert('Enter Date Is Outside Of Financial Year !!');
                var datePost=(3+'-'+31+'-'+objsession[1]);
                dtTo.SetDate(new Date(datePost));
            }
            else if(MonthDate>3 && YearDate==objsession[1])
            {
                alert('Enter Date Is Outside Of Financial Year !!');
                var datePost=(3+'-'+31+'-'+objsession[1]);
                dtTo.SetDate(new Date(datePost));
            }
            else if(YearDate!=objsession[0] && YearDate!=objsession[1])
            {
                alert('Enter Date Is Outside Of Financial Year !!');
                var datePost=(3+'-'+31+'-'+objsession[1]);
                dtTo.SetDate(new Date(datePost));
            }
        }
        else
        {
            alert('Enter Date Is Outside Of Financial Year !!');
            var datePost=(3+'-'+31+'-'+objsession[1]);
            dtTo.SetDate(new Date(datePost));
        }
    }        
    function FunClientScrip(objID,objListFun,objEvent)
    {
      var cmbVal;         
        if(document.getElementById('cmbsearchOption').value=="Clients")
        {
            var datefrom;
            datefrom=new Date(dtFrom.GetDate());
//            datefrom=parseInt(datefrom.getMonth()+1)+'-'+datefrom.getDate()+'-'+ datefrom.getFullYear();
            datefrom=datefrom.getFullYear()+'-'+parseInt(datefrom.getMonth()+1)+'-'+datefrom.getDate();
            cmbVal='Clients'+'~'+'ALL'+'~'+datefrom;
        }
        else if(document.getElementById('cmbsearchOption').value=="ScripsExchange")
        {
             var dateto;
            dateto=new Date(dtTo.GetDate());
            dateto=parseInt(dateto.getMonth()+1)+'-'+dateto.getDate()+'-'+ dateto.getFullYear();
            
             var criteritype='B';
             criteritype=' AND Commodity_ExpiryDate>="'+dateto+'"  ';
             criteritype=criteritype.replace('"',"'");
             criteritype=criteritype.replace('"',"'");
             cmbVal=document.getElementById('cmbsearchOption').value+'~'+'Date'+'~'+criteritype;
        }
        else
        {
            cmbVal=document.getElementById('cmbsearchOption').value;
        }
      ajax_showOptions(objID,'ShowClientFOREInvoice',objEvent,cmbVal);
    }
    function fn_Clients(obj)
    {        
        if(obj=="a")
        {
           Hide('showFilter');
           document.getElementById('rdbranchclientAll').checked=true;
           var cmb=document.getElementById('cmbsearchOption');
           cmb.value='Clients';
        }
        else
        {
             document.getElementById('rdbranchclientSelected').checked=true;
             var cmb=document.getElementById('cmbsearchOption');
             cmb.value='Clients';
             Show('showFilter');
        }           
    }

    function fngrouptype(obj)
    {
        if(obj=="0")
        {
         Hide('td_allselect');
         alert('Please Select Group Type !');
        }
        else
        {
        Show('td_allselect');
        }
        var cmb=document.getElementById('cmbsearchOption');
        cmb.value='Group';
        selecttion();
        height();
    }    
       function btnAddsubscriptionlist_click()
            {            
                var cmb=document.getElementById('cmbsearchOption');
                        var userid = document.getElementById('txtSelectionID');
                        if(userid.value != '')
                        {
                            var ids = document.getElementById('txtSelectionID_hidden');
                            var listBox = document.getElementById('lstSlection');
                            var tLength = listBox.length;
                           
                            
                            var no = new Option();
                            no.value = ids.value;
                            no.text = userid.value;
                            listBox[tLength]=no;
                            var recipient = document.getElementById('txtSelectionID');
                            recipient.value='';
                        }
                        else
                            alert('Please search name and then Add!')
                        var s=document.getElementById('txtSelectionID');
                        s.focus();
                        s.select();
                   
            }
        
      function clientselectionfinal()
	        {
	            var listBoxSubs = document.getElementById('lstSlection');
	          
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
            
                Hide('showFilter');
//                document.getElementById('btnshow').disabled=false;
	        }
	     
	        
	   function btnRemovefromsubscriptionlist_click()
            {
                
                var listBox = document.getElementById('lstSlection');
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
  function ExcelValidate(obj)
  {
     if(obj !=null || obj!=undefined)
     {
            if(obj==1)
            {
                alert("Please Select Atleast One Branch!!!");            
            }
            else if(obj==2)
            {
                alert("Please Select Atleast One GroupType!!!");  
            }
            else if(obj==3)
            {
                alert("Please Select Atleast One Branch Group!!!");
            }
            else if(obj==4)
            {
                alert("Please Select Atleast One Client!!!");  
            }
            else if(obj==5)
            {
               alert("Please Select Atleast One Product!!!");  
            }   
            else if(obj==6)
            {
               alert("Please Select Atleast One Segment!!!");  
            }
            Reset();
            dtFrom.Focus(); 
            height(); 
     }     
  }
  function NORECORD()
  {
        alert('No Record Found!!');
        Reset();
        dtFrom.Focus(); 
        height();        
  } 
  function Reset()
  { 

        document.getElementById('HiddenField_Group').setvalue='';
        document.getElementById('HiddenField_Branch').setvalue='';
        document.getElementById('HiddenField_BranchGroup').setvalue=''; 
        document.getElementById('HiddenField_Client').setvalue='';
        document.getElementById('HiddenField_Instrument').setvalue='';
        document.getElementById('HiddenField_SettNo').setvalue='';
        document.getElementById('HiddenField_Setttype').setvalue='';
        document.getElementById('HiddenField_emmail').setvalue='';
        
        document.getElementById('tab1').style.display='none'; 
  }
  function Display()
  {
      Show('displayAll');
      Show('displayAll1');
      Hide('showFilter');
      Hide('tab1');
      Hide('tab2');
      selecttion();
      height();
  }
  
  function DisplayMessage()
    {
        alert('File Create Successfully !!');
        Hide('showFilter');
        height()
    }
        
  function selecttion()
  {
     var combo=document.getElementById('cmbExport');
  } 

     function Filter()
      {
          Hide('displayAll');
          Hide('displayAll1');
          Show('tab2');
          Show('tab1');
          Hide('showFilter');
          selecttion();
          height();
      } 
     function ChangeRowColor(rowID,rowNumber) 
        {             
         
            var gridview = document.getElementById('grdTradeRegister'); 
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
 function MailsendT()
    {
    alert("Mail Sent Successfully");
    }
   function MailsendF()
    {
    alert("Error on sending!Try again..");
    }
 function ForDamat()
    {
        Hide('tab1');
        Hide('tab2');
        Hide('displayAll');
        Show('displayAll1');
    }
    function GnrcCallBackPanel_Methods(WhichCall)
    {
        Show("divLoading");
        cbtnExportFile.SetEnabled(false);
        cGnrcCallBackPanel.PerformCallback(WhichCall+'~');
        height();
    }
    function GnrcCallBackPanel_EndCallBack()
    {
        Hide("divLoading");
        cbtnExportFile.SetEnabled(true);
        if(cGnrcCallBackPanel.cpIsSpData!=undefined)
        {
            if(cGnrcCallBackPanel.cpIsSpData=="ExportFile")
                GetObjectID('AbtnExportFile').click();
            else 
                alert(cGnrcCallBackPanel.cpIsSpData);
        }
        if(cGnrcCallBackPanel.cpDateSat!=undefined)
        {
            DtFor.SetDate(new Date(cGnrcCallBackPanel.cpDateSat));
        }
        height();
    }
   FieldName='lstSlection';
    </script>

    <script type="text/ecmascript">   
       function ReceiveServerData(rValue)
        {
            var j=rValue.split('~');
            var btn = document.getElementById('btnhide');            
            if(j[0]=='Clients')
            {
                document.getElementById('HiddenField_Client').value = j[1];
            }  
            if(j[0]=='Branch')
            {
                document.getElementById('HiddenField_Branch').value = j[1];
            }
            if(j[0]=='BranchGroup')
            {
                document.getElementById('HiddenField_BranchGroup').value = j[1];
            }
             if(j[0]=='Broker')
            {
                document.getElementById('HiddenField_Broker').value = j[1];
            }  
            if(j[0]=='Group')
            {
                document.getElementById('HiddenField_Group').value = j[1];
                btn.click();
            }  
            if(j[0]=='Segment')
            {
                document.getElementById('HiddenField_Segment').value = j[1];
            }
            if(j[0]=='ScripsExchange')
            {
                document.getElementById('HiddenField_Instrument').value = j[1];
            }
            if(j[0]=='MAILTOEMPLOYEE')
            {
                document.getElementById('HiddenField_emmail').value =j[1];
            }
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
//                      document.getElementById('btn_show').disabled=false;
                      var sessionvalue='<%=Session["ExchangeSegmentID"]%>';
//                      divscroll();
                      height();                    
               } 
               
        </script>

        <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" colspan="0" style="text-align: center; height: 20px;">
                        <strong><span id="SpanHeader" style="color: #000099">Export E-Invoice
                        </span></strong>
                    </td>
                   
                </tr>
            </table>
            <table id="tab2">
                <tr valign="top">
                    <td class="gridcellleft">
                        <table border="1">
                            <tr valign="top">
                                <td class="gridcellleft" bgcolor="#B7CEEC">
                                    Trade Date :
                                </td>
                                <td class="gridcellleft">
                                    <dxe:ASPxDateEdit ID="dtFrom" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                        Font-Size="10px" Width="108px" ClientInstanceName="dtFrom">
                                        <dropdownbutton text="From">
                                        </dropdownbutton>
                                        <clientsideevents datechanged="function(s,e){DateChangeForFrom();DateCompare(dtFrom,dtTo);}" />
                                    </dxe:ASPxDateEdit>
                                </td>
                                <td class="gridcellleft" style="display: none;">
                                    <dxe:ASPxDateEdit ID="dtTo" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                        Font-Size="10px" Width="108px" ClientInstanceName="dtTo">
                                        <dropdownbutton text="To">
                                        </dropdownbutton>
                                        <clientsideevents datechanged="function(s,e){DateChangeForTo();DateCompare(dtFrom,dtTo);}" />
                                    </dxe:ASPxDateEdit>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <div class="clear" style="height: 0px">
            </div>
            <table id="tab1">
                <tr valign="top">
                    <td class="gridcellleft">
                        <table border="10" cellpadding="1" cellspacing="1">
                            <tr>
                                <td class="gridcellleft">
                                    <table border="10" cellpadding="1" cellspacing="1">
                                        <tr>
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                Clients :
                                            </td>
                                            <td colspan="2" id="td_client">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:RadioButton ID="rdbranchclientAll" runat="server" Checked="True" GroupName="a" Font-Size="12px"
                                                                onclick="fn_Clients('a')" />
                                                            All
                                                        </td>
                                                        <td>
                                                            <asp:RadioButton ID="rdbranchclientSelected" runat="server" GroupName="a" Font-Size="12px" onclick="fn_Clients('b')" />Selected
                                                        </td>
                                                    </tr>
                                                </table>
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
                                                        <asp:DropDownList ID="ddlgrouptype" runat="server" Font-Size="12px" onchange="fngrouptype(this.value)">
                                                        </asp:DropDownList>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btnhide" EventName="Click"></asp:AsyncPostBackTrigger>
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </td>
                                            <td id="td_allselect" style="display: none;">
                                                <asp:RadioButton ID="rdddlgrouptypeAll" runat="server" Checked="True" GroupName="b" Font-Size="12px"
                                                    onclick="fn_Group('a')" />
                                                All
                                                <asp:RadioButton ID="rdddlgrouptypeSelected" runat="server" GroupName="b"  Font-Size="12px" onclick="fn_Group('b')" />Selected
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="gridcellleft">
                                    <table border="10" cellpadding="1" cellspacing="1">
                                        <tr>
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                Re Generate :</td>
                                            <td>
                                                <asp:DropDownList ID="ddlGeneration" runat="server" Width="130px" Font-Size="12px"
                                                    onchange="fnddlGeneration(this.value)">
                                                    <asp:ListItem Value="N">NO</asp:ListItem>
                                                    <asp:ListItem Value="Y">YES</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table width="100%" id="showFilter">
                            <tr valign="top">
                                <td style="text-align: right; vertical-align: top; height: 134px;">
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="gridcellleft" style="vertical-align: top; text-align: right; height: 21px;"
                                                id="TdFilter">
                                                <span id="spanunder"></span><span id="spanclient"></span>
                                                <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="150px" onkeyup="FunClientScrip(this,'fn_name',event)"></asp:TextBox><asp:DropDownList
                                                    ID="cmbsearchOption" runat="server" Font-Size="11px" Width="70px" Enabled="false">
                                                    <asp:ListItem>Clients</asp:ListItem>
                                                    <asp:ListItem>Group</asp:ListItem>
                                                    <asp:ListItem>Branch</asp:ListItem>
                                                    <asp:ListItem>BranchGroup</asp:ListItem>
                                                    <asp:ListItem>Broker</asp:ListItem>
                                                    <asp:ListItem>Segment</asp:ListItem>
                                                    <asp:ListItem>ScripsExchange</asp:ListItem>
                                                    <asp:ListItem>SettlementType</asp:ListItem>
                                                    <asp:ListItem>SettlementNo</asp:ListItem>
                                                    <asp:ListItem>MAILEMPLOYEE</asp:ListItem>
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
                    <td>
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td id="Td_ExportFile" class="gridcellleft" style="width: 267px">
                                    <table border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                <dxe:ASPxButton ID="btnExportFile" runat="server" AutoPostBack="False" ClientInstanceName="cbtnExportFile"
                                                    Text="Export File">
                                                    <ClientSideEvents Click="function(s,e){GnrcCallBackPanel_Methods('ExportFile');}" />
                                                </dxe:ASPxButton>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            
            <div id="divLoading">
                <dxcp:ASPxCallbackPanel ID="GnrcCallBackPanel" runat="server" ClientInstanceName="cGnrcCallBackPanel"
                    BackColor="White" OnCallback="GnrcCallBackPanel_Callback" LoadingPanelText="Generating File...Please Wait..."
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
                <asp:Button ID="AbtnExportFile" runat="server" BackColor="#DDECFE" BorderStyle="None"
                    OnClick="btnExportFile_Click" />
            </div>
            
            <table>
                <tr>
                    <td style="display: none;">
                        <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="150px"></asp:TextBox>
                        <asp:Button ID="btnhide" runat="server" Text="Button" OnClick="btnhide_Click" />
                        <asp:HiddenField ID="HiddenField_Group" runat="server" />
                        <asp:HiddenField ID="HiddenField_Branch" runat="server" />
                        <asp:HiddenField ID="HiddenField_Broker" runat="server" />
                        <asp:HiddenField ID="HiddenField_BranchGroup" runat="server" />
                        <asp:HiddenField ID="HiddenField_Client" runat="server" />
                        <asp:HiddenField ID="HiddenField_Instrument" runat="server" />
                        <asp:HiddenField ID="HiddenField_Segment" runat="server" />
                        <asp:HiddenField ID="HiddenField_SettNo" runat="server" />
                        <asp:HiddenField ID="HiddenField_Setttype" runat="server" />
                        <asp:HiddenField ID="HiddenField_emmail" runat="server" />
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
            <div id="displayAll" style="display: none;">
                <table width="100%" border="1">
                    <tr id="tr_DIVdisplayPERIOD">
                        <td>
                            <asp:UpdatePanel ID="updatepanel2" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div id="DIVdisplayPERIOD" runat="server">
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="displayAll1" style="display: none;">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                </asp:UpdatePanel>
            </div>
        </div>
    </form>
</body>
</html>
