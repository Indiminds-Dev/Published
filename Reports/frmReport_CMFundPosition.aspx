<%@ page language="C#" autoeventwireup="true" inherits="Reports_frmReport_CMFundPosition, App_Web_x3w6ygwt" enableeventvalidation="false" %>

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
    <title>Client Trade Detail</title>
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
//        window.frameElement.width = document.body.scrollwidth;
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
        var Msg="To Date Can Not Be Less Than From Date!!!";
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
            alert(Msg);
            DateObjectTo.SetDate(new Date(DateObjectFrm.GetDate()));
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
    return true;
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


  function NORECORD()
  {
        alert('No Record Found!!');
        Reset();
        dtFrom.Focus(); 
        height();        
  } 
  function Reset()
  {       
        document.getElementById('tab1').style.display='none'; 
  }
  function Display()
  {
      Hide('tab1');
      Hide('tab2');
      selecttion();
      height();
  }
  
  function DisplayMessage()
    {
        alert('File Create Successfully !!');
        height()
    }
       
  function selecttion()
  {
     var combo=document.getElementById('cmbExport');
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
 
    function GnrcCallBackPanel_Methods(WhichCall)
    {
        Show("divLoading");
        cbtnExportSF.SetEnabled(false);
        cGnrcCallBackPanel.PerformCallback(WhichCall+'~');
        height();
    }
    function GnrcCallBackPanel_EndCallBack()
    {
        Hide("divLoading");
        cbtnExportSF.SetEnabled(true);
        if(cGnrcCallBackPanel.cpIsSpData!=undefined)
        {
            if(cGnrcCallBackPanel.cpIsSpData=="ExportSF")
                GetObjectID('AbtnExportSF').click();
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
            <table id="tab2">
                <tr valign="top">
                    <td class="gridcellleft">
                        <table border="1">
                            <tr valign="top">
                                <td class="gridcellleft" bgcolor="#B7CEEC">
                                    Date :
                                </td>
                                <td class="gridcellleft">
                                    <dxe:ASPxDateEdit ID="dtFrom" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                        Font-Size="10px" Width="108px" ClientInstanceName="dtFrom">
                                        <dropdownbutton text="From">
                                        </dropdownbutton>
                                        <clientsideevents datechanged="function(s,e){DateChangeForFrom();DateCompare(dtFrom,dtTo);}" />
                                    </dxe:ASPxDateEdit>
                                </td>
                                <td class="gridcellleft">
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
                <tr>
                    <td>
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td id="Td_ExportSingleFile" class="gridcellleft" style="width: 267px">
                                    <table border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                <dxe:ASPxButton ID="btnExportSF" runat="server" AutoPostBack="False" ClientInstanceName="cbtnExportSF"
                                                    Text="Export To Excel">
                                                    <ClientSideEvents Click="function(s,e){GnrcCallBackPanel_Methods('ExportSF');}" />
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
                <asp:Button ID="AbtnExportSF" runat="server" BackColor="#DDECFE" BorderStyle="None"
                    OnClick="btnExportSF_Click" />
            </div>
            
            <table>
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
