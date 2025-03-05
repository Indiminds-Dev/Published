<%@ page language="C#" autoeventwireup="true" inherits="management_BillPrintingNseFo, App_Web_e81qjzgk" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>Billing</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script language="javascript" type="text/javascript">

    function Page_Load()///Call Into Page Load
            {
                
                 Hide('Tab_DisplayNoAction');
                 Hide('Tab_BtnRemainingBill');
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
            window.frameElement.width = document.body.scrollwidth;
        }
    function Hide(obj)
            {
             document.getElementById(obj).style.display='none';
            }
    function Show(obj)
            {
             document.getElementById(obj).style.display='inline';
            }
            function DateChange(DateObj)
{
    //var Lck ='<%=Session["LCKBNK"] %>';
    var FYS ='<%=Session["FinYearStart"]%>';
    var FYE ='<%=Session["FinYearEnd"]%>'; 
    var LFY ='<%=Session["LastFinYear"]%>';
    //DevE_CheckForLockDate(DateObj,Lck);
    DevE_CheckForFinYear(DateObj,FYS,FYE,LFY);
//    DevE_CompareDateAndAddDay(DateObj,cDatepayinedit,2)
//    DevE_CompareDateAndAddDay(DateObj,cDatepayoutedit,2)
//    DevE_CompareDateAndAddDay(DateObj,cDatedelpayinedit,2)
//    DevE_CompareDateAndAddDay(DateObj,cDatedelpayoutedit,2)
//    DevE_CompareDateAndAddDay(DateObj,cDateconfedit,2)
//    DevE_CompareDateAndAddDay(DateObj,cDateendedit,0)
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
    if(!((MonthDate>=objDateFromMonth && YearDate==objDateFromYear)|| (MonthDate<=objDateToMonth && YearDate==objDateToYear)))
    {
         alert('Enter Date Is Outside Of Financial Year !!');
         
         if(new Date()<new Date(dateTo))
            dtFrom.SetDate(new Date());
         else if(new Date()>new Date(dateFrom))
            dtFrom.SetDate(new Date());
         else
             dtFrom.SetDate(new Date(dateTo));
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
            dtTo.SetDate(new Date());
         else
             dtTo.SetDate(new Date(dateTo));
         return false;
         
         
         
    }    
    else
    {
        return true;
    }
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
       
   function fnAlert(obj)
   {
   
        if(obj=="1")
        {
            Show('Tab_DisplayNoAction');
            Hide('Tab_BtnRemainingBill');
//            alert('Please Complete The Process For Above Days and Generate Bills...');
        }
        if(obj=="2")
        {
            Show('Tab_DisplayNoAction');
            Show('Tab_BtnRemainingBill');
//            alert('Generate For Remaining Bills...');
        }
        if(obj=="3")
        {
            Hide('Tab_DisplayNoAction');
            Hide('Tab_BtnRemainingBill');
            alert('Bill Generate Successfully !!');
        }
        if(obj=="4")
        {
            Hide('Tab_DisplayNoAction');
            Hide('Tab_BtnRemainingBill');
            alert('Bill Delete Successfully !!');
        }
         height();
   }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server">
        <div>
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
                <tr>
                    <td class="EHEADER" colspan="0" style="text-align: center; height: 20px;">
                        <strong><span id="SpanHeader" style="color: #000099">Billing</span></strong></td>
                </tr>
            </table>
            <table class="TableMain100">
                <tr>
                    <td align="center">
                        <table>
                            <tr>
                                <td>
                                    <table border="10" cellpadding="1" cellspacing="1">
                                        <tr>
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                Period :
                                            </td>
                                            <td>
                                                <dxe:ASPxDateEdit ID="dtFrom" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                    Font-Size="10px" Width="108px" ClientInstanceName="dtFrom">
                                                    <dropdownbutton text="For">
                                                    </dropdownbutton>
                                                    <clientsideevents datechanged="function(s,e){DateChangeForFrom();DateCompare(dtFrom,dtTo);}" />
                                                    <%--<clientsideevents datechanged="function(s,e){DateChange(dtFrom);}"></clientsideevents>--%>
                                                </dxe:ASPxDateEdit>
                                            </td>
                                            <td>
                                                <dxe:ASPxDateEdit ID="dtTo" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                    Font-Size="10px" Width="108px" ClientInstanceName="dtTo">
                                                    <dropdownbutton text="To">
                                                    </dropdownbutton>
                                                    <clientsideevents datechanged="function(s,e){DateChangeForTo();DateCompare(dtFrom,dtTo);}" />
                                                    <%--<ClientSideEvents DateChanged="function(s,e){DateCompare(dtFrom,dtTo);}" />--%>
                                                </dxe:ASPxDateEdit>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                Generate Type :
                                            </td>
                                            <td colspan="2" align="left">
                                                <asp:DropDownList ID="dllGenerate" runat="server" Width="100px" Font-Size="10px">
                                                    <asp:ListItem Value="1">Generate</asp:ListItem>
                                                    <asp:ListItem Value="2">Delete</asp:ListItem>
                                                </asp:DropDownList></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" colspan="3">
                                    <asp:Button ID="btnGenerate" runat="server" CssClass="btnUpdate" Height="20px" Text="Generate"
                                        Width="101px" OnClick="btnGenerate_Click" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
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
            <table>
                <tr>
                    <td>
                        <table style="display: none;" id="Tab_DisplayNoAction">
                            <tr>
                                <td>
                                    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                                        <ContentTemplate>
                                            <table width="100%" border="1">
                                                <tr>
                                                    <td>
                                                        <div id="Divdisplay" runat="server">
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnGenerate" EventName="Click"></asp:AsyncPostBackTrigger>
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table id="Tab_BtnRemainingBill" style="display: none;">
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <tr>
                                        <td>
                                            <asp:Button ID="BtnRemainingBill" runat="server" CssClass="btnUpdate" Height="20px"
                                                Text="Generate Remaining Bill" Width="150px" OnClick="BtnRemainingBill_Click" />
                                        </td>
                                    </tr>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="BtnRemainingBill" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
