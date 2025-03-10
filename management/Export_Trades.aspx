<%@ page language="C#" autoeventwireup="true" inherits="management_Export_Trades, App_Web_udicbieo" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Export_Trades</title>

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/GenericJScript.js"></script>

    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <link type="text/css" href="../CSS/AjaxStyle.css" rel="Stylesheet" />
    <style type="text/css">    
        form {
		    display:inline;		
	    }	
    </style>

    <script type="text/javascript" language="javascript">
    function SignOff()
    {
      window.parent.SignOff();
    }
    function PageLoad()///Call Into Page Load
    {         
         Hide('showFilter');
//         New Work 01/09/2023
//         cTradeDt.Focus();
         cDtFrom.Focus();
//         End of New Work 01/09/2023
         Reset();      
         height(); 
         var exchangeSegment="<%=Session["ExchangeSegmentID"]%>";
//         New Work 01/09/2023
//             if(exchangeSegment=="1" || exchangeSegment=="4")
//                {
//                 div_date.disabled=true;
//                 cTradeDt.SetEnabled(false);
//                 document.getElementById('ddlGroup').focus();
//                } 
//             else
//                 {
//                 cTradeDt.Focus();
//                 }
//        End of New Work 01/09/2023
    }
    function Hide(obj)
    {
      document.getElementById(obj).style.display='none';
    }
    function Show(obj)
    {
       document.getElementById(obj).style.display='inline';
    }
    function height()
    {        
       if(document.body.scrollHeight>=300)
        window.frameElement.height = document.body.scrollHeight;
       else
        window.frameElement.height = '350px';
        window.frameElement.Width = document.body.scrollWidth;
    }
    function ChangeDateFormat_CalToDB(obj)
    {
        var SelectedDate = new Date(obj);            
        var monthnumber = SelectedDate.getMonth() + 1;
        var monthday    = SelectedDate.getDate();
        var year        = SelectedDate.getYear();            
        var changedDateValue=year+'-'+monthnumber+'-'+monthday;
        return changedDateValue;
    }
    function ChangeDateFormat_SetCalenderValue(obj)
    {       
        var SelectedDate = new Date(obj);
        var monthnumber = SelectedDate.getMonth();
        var monthday    = SelectedDate.getDate();
        var year        = SelectedDate.getYear();            
        var changeDateValue=new Date(year, monthnumber, monthday);
        return changeDateValue;            
     }   
      function replaceChars(entry)
      {
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
     //New Work 01/09/2023
//     function DateChange(positionDate)
//    {
//        var FYS='<%=Session["FinYearStart"]%>';
//        var FYE='<%=Session["FinYearEnd"]%>';
//        var LFY='<%=Session["LastFinYear"]%>';
//        DevE_CheckForFinYear(positionDate,FYS,FYE,LFY);
//    }
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
        
        var MonthDate=cDtFrom.GetDate().getMonth()+1;
        var DayDate=cDtFrom.GetDate().getDate();
        var YearDate=cDtFrom.GetDate().getYear();
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
                cDtFrom.SetDate(new Date());
             else if(new Date()>new Date(dateFrom))
                cDtFrom.SetDate(new Date(dateFrom));
             else
                 cDtFrom.SetDate(new Date(dateTo));
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
        var MonthDate=cDtTo.GetDate().getMonth()+1;
        var DayDate=cDtTo.GetDate().getDate();
        var YearDate=cDtTo.GetDate().getYear();
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
                cDtTo.SetDate(new Date());
             else if(new Date()>new Date(dateFrom))
                cDtTo.SetDate(new Date(dateFrom));
             else
                 cDtTo.SetDate(new Date(dateTo));
             return false;
        }    
        else
        {
            return true;
        }
    }
    //End of New Work 01/09/2023
    </script>

    <script type="text/javascript" language="javascript">
      FieldName="none";
    //=================For Call ajax to fill text boxes after page Load and with ICallbackEventHandler Interface==================
        function CallGenericAjaxJS(e)
        {
            var AjaxList_TextBox=document.getElementById('<%=txtSelectionID.ClientID%>');
            AjaxList_TextBox.focus();
            AjaxComQuery=AjaxComQuery.replace("\'","'");
            ajax_showOptions(AjaxList_TextBox,'GenericAjaxList',e,replaceChars(AjaxComQuery),'Main');
        }
        //=================For Call ajax to fill text boxes on page Load==================
        function CallAjax(obj1,obj2,obj3,Query)
        {
            var CombinedQuery=new String(Query);
            ajax_showOptions(obj1,obj2,obj3,replaceChars(CombinedQuery),'Main');
        }    
       function  fnddlGroup(obj)
       {
            document.getElementById('<%=lstSelection.ClientID%>').length=0;
            if(obj=="0")
            {
                document.getElementById('rdbranchclientAll').checked=true;
                fn_Branch('a'); 
                Hide('dvGroup');
                Hide('dvGroupTypeByAllSelect');
                Show('dvBranch');               
                CallServer("CallAjax-Branch",""); 
            }           
            if(obj=="1")                
            {  
                Show('dvGroup');
                Hide('dvBranch');
                Hide('showFilter');
                document.getElementById('divExport').style.display='inline';
                var btn = document.getElementById('btnhide');
                btn.click();            
             }            
             if(obj=="2")
             { 
                document.getElementById('rdbranchclientAll').checked=true;
                fn_Clients('a');                
                Hide('dvGroup');
                Show('dvBranch');
                Hide('dvGroupTypeByAllSelect'); 
                CallServer("CallAjax-Client","");              
              }     
            height();
       }
       function fn_BranchClient(obj)
       {
            var grpBy=document.getElementById('<%=ddlGroup.ClientID%>');
            if(grpBy.value=="0")
            {               
                fn_Branch(obj);
            }
            else if(grpBy.value=="2")
            {               
                fn_Clients(obj);    
            }
       }
       function fn_Branch(obj)
       {  
            if(obj=="a")
              {
                Hide('showFilter');
//                Show('DivSeparateFile');
                document.getElementById('divExport').style.display='inline';
              }
             else
             {               
                  Show('showFilter');
//                  Hide('DivSeparateFile');
                  document.getElementById('divExport').style.display='none';
                  CallServer("CallAjax-Branch",""); 
                  document.getElementById('<%=txtSelectionID.ClientID%>').focus();
             }                      
        }
        function fn_Clients(obj)
        {  
             if(obj=="a")
             {
                Hide('showFilter');
//                Show('DivSeparateFile');
                document.getElementById('divExport').style.display='inline';
             }   
             else
             {
                  Show('showFilter');
//                  Hide('DivSeparateFile');
                  document.getElementById('divExport').style.display='none';
                  CallServer("CallAjax-Client","");
                  document.getElementById('<%=txtSelectionID.ClientID%>').focus();                    
             }             
        }       
       function fngrouptype(obj)
       {      
           if(obj=="0")
           {
             Hide('dvGroupTypeByAllSelect');
             alert('Please Select Group Type !');
             Hide('showFilter');
           }
           else
           {
               document.getElementById('rdddlgrouptypeAll').checked=true;
               Show('dvGroupTypeByAllSelect');
               Hide('showFilter');
               Show('divExport');
//               Show('DivSeparateFile');
               
           }      
           height();
       }
       function fn_Group(obj)
       {      
            if(obj=="a")
             {
                Hide('showFilter');
//                Show('DivSeparateFile');
                document.getElementById('divExport').style.display='inline';
             }
             else
             {
                  Show('showFilter');
                  document.getElementById('divExport').style.display='none';
//                  Hide('DivSeparateFile');
                  CallServer("CallAjax-Group","");
                  document.getElementById('<%=txtSelectionID.ClientID%>').focus(); 
             }                        
       }      
     function ReceiveServerData(rValue)
        {
            var Data=rValue.split('~');
            var btnHideGroupType=document.getElementById('btnGroupTypehide');
            if(Data[1]!="undefined")
            {
                if(Data[0]=='Client')
                {
                    document.getElementById('HiddenField_Client').value = Data[1];
                }
                if(Data[0]=='Branch')
                {
                    document.getElementById('HiddenField_Branch').value = Data[1];                    
                }
                if(Data[0]=='Group')
                { 
                    document.getElementById('HiddenField_Group').value = Data[1];
                }
            } 
            if(Data[0]=='AjaxQuery')
            {                
                AjaxComQuery = Data[1];
                var AjaxList_TextBox=document.getElementById('<%=txtSelectionID.ClientID%>');                          
                AjaxList_TextBox.value='';
                AjaxList_TextBox.attachEvent('onkeyup',CallGenericAjaxJS);
             }              
        }
        function btnAddsubscriptionlist_click()
        {            
            var txtName = document.getElementById('txtSelectionID');
            if(txtName != '')
            {
                var txtId = document.getElementById('txtSelectionID_hidden').value;
                var listBox = document.getElementById('<%=lstSelection.ClientID%>');
                var listLength = listBox.length;               
                var opt = new Option();
                opt.value = txtId;
                opt.text = txtName.value;
                listBox[listLength]=opt;
                txtName.value='';
            }
            else
                alert('Please search name and then Add!');
            txtName.focus();
            txtName.select();            
        }
        function lnkBtnAddFinalSelection()
        {
            var listBox = document.getElementById('<%=lstSelection.ClientID%>');	          
            var listID='';
            var i;
            if(listBox.length > 0)
            {                             
                for(i=0;i<listBox.length;i++)
                {
                    if(listID == '')
                        listID = listBox.options[i].value+';'+listBox.options[i].text;
                    else
                        listID += ',' + listBox.options[i].value+';'+listBox.options[i].text;
                }
                var sendData='';
                var grpBy=document.getElementById('<%=ddlGroup.ClientID%>').value; 
                if(grpBy=="0")
                {             
                    var sendData = 'Branch~' + listID;
                }
                else if(grpBy=="1")
                {             
                    var sendData = 'Group~' + listID;
                }
                else if(grpBy=="2")
                {             
                    var sendData = 'Client~' + listID;
                }
                CallServer(sendData,"");  
                for(i=listBox.options.length-1;i>=0;i--)
                {
                    listBox.remove(i);
                }            
                Hide('showFilter');
                document.getElementById('divExport').style.display='inline';                 
            }
            else
            {
                alert('Please Select Atleast One Item!!!');
                document.getElementById('<%=txtSelectionID.ClientID%>').focus();
            }
        
        }	        
        function lnkBtnRemoveFromSelection()
        {                
            var listBox = document.getElementById('<%=lstSelection.ClientID%>');
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
      function NORECORD(obj)
      {      
          Hide('showFilter');
          document.getElementById('divExport').style.display='inline';
          var grpBy=document.getElementById('<%=ddlGroup.ClientID%>').value;         
            if(obj=='1')
            {
                 if(grpBy=='0' && document.getElementById('HiddenField_Branch').value=='')
                 {
                    alert('You Have To Select Atleast One Branch !!');
                    Reset();  
                 }
                 if(grpBy=='1' && document.getElementById('HiddenField_Group').value=='')
                 {
                    alert('You Have To Select Atleast One Group !!');
                    Reset();  
                 }
                 if(grpBy=='2' && document.getElementById('HiddenField_Client').value=='')
                 {
                    alert('You Have To Select Atleast One Client !!');  
                    Reset();               
                 }
             }  
            if(obj=='2')
            {
                alert('No Record Found !! ');
                Reset();
            }
          height();
      }
      function Reset()
      {
           Hide('showFilter');  
           document.getElementById('divExport').style.display='inline';        
           document.getElementById('HiddenField_Branch').value=='';
           document.getElementById('HiddenField_Group').value=='';
           document.getElementById('HiddenField_Client').value=='';   
           document.getElementById('<%=ddlGroup.ClientID%>').selectedIndex=0;
           document.getElementById('rdbranchclientAll').checked=true;
           document.getElementById('<%=ddlgrouptype.ClientID%>').selectedIndex=0;  
           document.getElementById('<%=ddlgrouptype.ClientID%>').style.display='none';
           document.getElementById('dvGroup').style.display='none';   
           document.getElementById('dvBranch').style.display='inline';
           document.getElementById('ChkForSeparateFiles').checked = false;                                    
           height();
      }
      function Validate(obj)
      {
            if(obj=="1")
            {
//                New Work 01/09/2023
//                alert("Please Select Trade Date.");
//                cTradeDt.Focus();
                alert("Please Select Date Range.");
                cDtFrom.Focus();
//                End of New Work 01/09/2023
            }
            if(obj=="3") 
            {
                alert("Please Select A Group Type.");
                document.getElementById('<%=ddlgrouptype.ClientID%>').focus();                             
            }          
      }   
      function ErrorAlert(obj)
      {
        alert(obj);
        window.location="../management/Export_Trades.aspx";
      } 
      function NoRecordAlert()
      {
        alert('No Record Found For This Selection');
        window.location="../management/Export_Trades.aspx";
      }
      function Refresh()
      {
        window.location="../management/Export_Trades.aspx";
        PageLoad();
      }  
      function ChkExport()
      {
      
       if(document.getElementById('<%=ddlGroup.ClientID%>').selectedIndex == 0 ||document.getElementById('<%=ddlGroup.ClientID%>').selectedIndex == 2 )
       {
           if(document.getElementById('rdbranchclientAll').checked == true ) 
           {
               document.getElementById('HiddenField_Group').value="";
               document.getElementById('HiddenField_Branch').value="";
               document.getElementById('HiddenField_Client').value="";
           }
       }
       if(document.getElementById('<%=ddlGroup.ClientID%>').selectedIndex == 1)
       {
            if(document.getElementById('rdddlgrouptypeAll').checked == true)
            {
               document.getElementById('HiddenField_Group').value="";
               document.getElementById('HiddenField_Branch').value="";
               document.getElementById('HiddenField_Client').value="";
            }
       }

//      alert(document.getElementById('HiddenField_Group').value+'1');
//      alert(document.getElementById('HiddenField_Branch').value+'2');
//      alert(document.getElementById('HiddenField_Client').value+'3');
      
        if(document.getElementById('rdbranchclientSelected').checked == true || document.getElementById('rdddlgrouptypeSelected').checked == true ||  document.getElementById('rdbranchclientExcepted').checked == true || document.getElementById('rdddlgrouptypeExcepted').checked == true)
            { 
                if((document.getElementById('HiddenField_Group').value == null || document.getElementById('HiddenField_Group').value == "") && (document.getElementById('HiddenField_Branch').value == null||document.getElementById('HiddenField_Branch').value == "") && (document.getElementById('HiddenField_Client').value == null||document.getElementById('HiddenField_Client').value == ""))
                {
                  alert('Please Select First..');
                  
                }
            }
         
       
       }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE;" onload="clearPreloadPage();">
    <form id="form1" runat="server" autocomplete="off">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
        </asp:ScriptManager>
        <div>
            <div class="TableMain100">
                <div class="EHEADER" style="text-align: center;">
                    <strong><span style="color: #000099">Export_Trades</span></strong>
                </div>
            </div>
            <br class="clear" />
            <div class="pageContent">
                <div id="divPageFilter" style="width: 995px;">
                    <div id="showFilter" class="right" style="width: 452px; background-color: #B7CEEC;
                        border: solid 2px  #ccc; display: none;">
                        <div style="width: 100%">
                            <div class="frmleftContent">
                                <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Height="20px" Width="350px"
                                    TabIndex="0"></asp:TextBox>
                            </div>
                            <div class="frmleftContent">
                                <a id="A4" href="javascript:void(0);" tabindex="11" onclick="btnAddsubscriptionlist_click()">
                                    <span style="color: #009900; text-decoration: underline; font-size: 10pt;">Add to List</span></a>
                            </div>
                        </div>
                        <span class="clear" style="background-color: #B7CEEC;"></span>
                        <div class="frmleftContent" style="height: 105px; margin-top: 5px">
                            <asp:ListBox ID="lstSelection" runat="server" Font-Size="12px" Height="100px" Width="440px"
                                TabIndex="0"></asp:ListBox>
                        </div>
                        <span class="clear" style="background-color: #B7CEEC;"></span>
                        <div class="frmleftContent" style="text-align: center">
                            <a id="A2" href="javascript:void(0);" tabindex="13" onclick="lnkBtnAddFinalSelection()">
                                <span style="color: #000099; text-decoration: underline; font-size: 10pt;">Done</span></a>&nbsp;&nbsp;
                            <a id="A1" href="javascript:void(0);" tabindex="14" onclick="lnkBtnRemoveFromSelection()">
                                <span style="color: #cc3300; text-decoration: underline; font-size: 10pt;">Remove</span></a>
                        </div>
                    </div>
                    <div id="dvMainFilter" class="frmContent" style="width: 528px">
                        <%--New Work 01/09/2023--%>
                        <%--<div id="forDate">
                            <div class="frmleftContent" style="width: 110px; line-height: 20px">
                                <asp:Label ID="lblDate" runat="server" Text="Date : "></asp:Label>
                            </div>
                            <div class="left">
                                <div id="div_date" class="frmleftContent">
                                    <dxe:ASPxDateEdit ID="TradeDt" runat="server" ClientInstanceName="cTradeDt"
                                        DateOnError="Today" EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True"
                                        Width="125px" Height="25px" Font-Size="11px" TabIndex="0">
                                        <DropDownButton Text="TradeDate">
                                        </DropDownButton>
                                         <ClientSideEvents DateChanged="function(s,e){DateChange(cTradeDt);}"></ClientSideEvents>
                                    </dxe:ASPxDateEdit>
                                </div>
                            </div>
                        </div>--%>
                        <div id="DivDateRange" class="Row">
                            <div class="frmleftContent" style="width: 110px; line-height: 20px">
                                <asp:Label ID="lblDate" runat="server" Text="Date Range : "></asp:Label>
                            </div>
                            <div id="div_date" class="frmleftContent">
                                <dxe:ASPxDateEdit ID="DtFrom" runat="server" ClientInstanceName="cDtFrom"
                                    DateOnError="Today" EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True"
                                    Width="125px" Font-Size="11px" TabIndex="0">
                                    <dropdownbutton text="From">
                                    </dropdownbutton>
                                    <clientsideevents datechanged="function(s,e){DateChangeForFrom();DateCompare(cDtFrom,cDtTo);}" />
                                </dxe:ASPxDateEdit>
                            </div>
                            <div id="div_todate" class="frmleftContent">
                                <dxe:ASPxDateEdit ID="DtTo" runat="server" ClientInstanceName="cDtTo"
                                    DateOnError="Today" EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True"
                                    Width="125px" Font-Size="11px" TabIndex="0">
                                    <dropdownbutton text="To">
                                    </dropdownbutton>
                                    <clientsideevents datechanged="function(s,e){DateChangeForTo();DateCompare(cDtFrom,cDtTo);}" />
                                </dxe:ASPxDateEdit>
                            </div>
                        </div>
                        <%--End of New Work 01/09/2023--%>
                        <span class="clear"></span>
                        <div id="dvGroupBy">
                            <div class="frmleftContent" style="width: 110px; line-height: 20px">
                                <asp:Label ID="lblGroupBy" runat="server" Text="Group By : "></asp:Label>
                            </div>
                            <div class="left">
                                <div class="frmleftContent" style="padding-top: 3px">
                                    <asp:DropDownList ID="ddlGroup" runat="server" Width="125px" Font-Size="13px" onchange="fnddlGroup(this.value)"
                                        TabIndex="0">
                                        <asp:ListItem Value="0">Branch</asp:ListItem>
                                        <asp:ListItem Value="1">Group</asp:ListItem>
                                        <asp:ListItem Value="2">Clients</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div id="dvBranch" class="frmleftContent" style="width: 200px; padding-top: 3px;
                                    font-size: 12px;">
                                    <asp:RadioButton ID="rdbranchclientAll" runat="server" Checked="True" GroupName="a"
                                        onclick="fn_BranchClient('a')" TabIndex="0" />
                                    All
                                    <asp:RadioButton ID="rdbranchclientSelected" runat="server" GroupName="a" onclick="fn_BranchClient('b')"
                                        TabIndex="0" />Selected
                                    <asp:RadioButton ID="rdbranchclientExcepted" runat="server" GroupName="a" onclick="fn_BranchClient('b')"
                                        TabIndex="0" />All Except
                                </div>
                                <div id="dvGroup" class="left" style="display: none;">
                                    <div class="left">
                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <div class="frmleftContent">
                                                    <asp:DropDownList ID="ddlgrouptype" AutoPostBack="true" runat="server" Width="125px"
                                                        Font-Size="13px" onchange="fngrouptype(this.value)" TabIndex="0">
                                                    </asp:DropDownList>
                                                </div>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnhide" EventName="Click"></asp:AsyncPostBackTrigger>
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </div>
                                    <div id="dvGroupTypeByAllSelect" class="frmleftContent" style="display: none; width: 200px;
                                        font-size: 12px">
                                        <asp:RadioButton ID="rdddlgrouptypeAll" runat="server" Checked="True" GroupName="b"
                                            onclick="fn_Group('a')" TabIndex="0" />
                                        All
                                        <asp:RadioButton ID="rdddlgrouptypeSelected" runat="server" GroupName="b" onclick="fn_Group('b')"
                                            TabIndex="0" />Selected
                                        <asp:RadioButton ID="rdddlgrouptypeExcepted" runat="server" GroupName="b" onclick="fn_Group('b')"
                                            TabIndex="0" />All Except
                                    </div>
                                </div>
                            </div>
                            
                                <div class="frmleftContent" style="width: 150px; line-height: 20px; font-size: 12px;float:left" id="DivSeparateFile">
                                           
                                   <asp:CheckBox ID="ChkForSeparateFiles" runat="server" Checked="false" />
                                    Make Separate Files
                                           
                                </div>
                            
                        </div>
                        <span class="clear"></span>
                        <%--<div id="divRptType">
                            <div class="frmleftContent" style="width: 110px; line-height: 20px">
                                <asp:Label ID="lblRptType" runat="server" Text="Report Type : "></asp:Label>
                            </div>
                            <div class="frmleftContent">
                                <asp:DropDownList ID="ddlRptType" runat="server" Width="240px" Font-Size="13px" TabIndex="0">
                                    <asp:ListItem Value="0" Selected="True">Select Report Type</asp:ListItem>
                                    <asp:ListItem Value="Summary">Summary</asp:ListItem>
                                    <asp:ListItem Value="Detail">Detail Working</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>--%>
                        <span class="clear"></span>
                        <div id="divExport">
                            <div class="frmleftContent" style="width: 110px; line-height: 20px">
                                <asp:Label ID="Label1" runat="server" Text="Report Generate : "></asp:Label>
                            </div>
                            
                            <div class="frmleftContent">
                                <asp:Button ID="btnExport" TabIndex="0" runat="server" OnClick="btnExport_Click" Text="Export" OnClientClick="ChkExport()"
                                    CssClass="frmbtn" />
                            </div>
                        </div>
                    </div>
                </div>
                <%--<div style="float:left;margin-left:200px;margin-top:10px">
                <asp:Label ID="LabelMsg" runat="server"  Font-Bold="True" Font-Size="Medium" Width="706px"></asp:Label><br class="clear" />
                </div>--%>
                <div style="display: none">
                    <asp:HiddenField ID="hdnDPSessionValue" runat="server" />
                    <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="150px"></asp:TextBox>
                    <asp:Button ID="btnhide" runat="server" Text="Button" OnClick="btnhide_Click" />
                    <asp:HiddenField ID="HiddenField_Group" runat="server" />
                    <asp:HiddenField ID="HiddenField_Branch" runat="server" />
                    <asp:HiddenField ID="HiddenField_Client" runat="server" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
