<%@ page language="C#" autoeventwireup="true" inherits="Reports_frmReport_TradeRegisteriframe, App_Web_d3reltht" enableeventvalidation="false" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>Trade Register</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

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
        width:98%;
        scrollbar-base-color: #C0C0C0;
    
    }
	</style>
 <script language="javascript" type="text/javascript">
  
    function Page_Load()///Call Into Page Load
            {
                 Hide('TrFilter');
                 Hide('Tr_Assets');
                 FnddlGeneration();
                 Hide('Tab_showFilter');
                 document.getElementById('hiddencount').value=0;
                 height();
            }
  function SignOff()
    {
        window.parent.SignOff();
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
            
     function FnTerminal(obj)
        {
             if(obj=="a")
                Hide('Td_TerminalidSpecific');
             else
                Show('Td_TerminalidSpecific');
             selecttion();
             height();
        }
       function FnCTCL(obj)
        {
             if(obj=="a")
                Hide('Td_CTCLidSpecific');
             else
                  Show('Td_CTCLidSpecific');
             selecttion();
             height();
        }
     function FnSegment(obj)
      {
      
             if(obj=="a")
                Hide('Tab_showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='Segment';
                  Show('Tab_showFilter');
             }
             document.getElementById("rdbSettNoAll").checked=true;
             document.getElementById("RadbSettlementTypeAll").checked=true;
             selecttion();
             height();
      }
      function FnScrips(obj)
      {
              if(obj=="a")
                Hide('Tab_showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='Scrips';
                  Show('Tab_showFilter');
             }
             selecttion();
             height();
           
      }
      function FnSettlementNo(obj)
      {
            if(obj=="a")
                Hide('Tab_showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='SettlementNo';
                  Show('Tab_showFilter');
             }
             selecttion();
             height();
      }
      function FnSettlementType(obj)
      {
             if(obj=="a")
                Hide('Tab_showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='SettlementType';
                  Show('Tab_showFilter');
             }
             selecttion();
             height();
           
      }
     function  FnddlGroupBy(obj)
     {
        if(obj=='Group')
        {
            Hide('Td_OtherGroupBy');
            Show('Td_Group');
            document.getElementById('BtnGroup').click();
        }
        else
        {
            Show('Td_OtherGroupBy');
            Hide('Td_Group');
        }
     }
    function FnGroup(obj)
      {
            if(obj=="a")
                Hide('Tab_showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='Group';
                  Show('Tab_showFilter');
             }
            
      }
    function FnOtherGroupBy(obj)
    {
       if(obj=="a")
            Hide('Tab_showFilter');
         else
         {
             if(document.getElementById('ddlGroupBy').value=='Clients')
             {
                 var cmb=document.getElementById('cmbsearchOption');
                 cmb.value='Clients';
             }
             if(document.getElementById('ddlGroupBy').value=='Branch')
             {
                 var cmb=document.getElementById('cmbsearchOption');
                 cmb.value='Branch';
             }
             if(document.getElementById('ddlGroupBy').value=='BranchGroup')
             {
                 var cmb=document.getElementById('cmbsearchOption');
                 cmb.value='BranchGroup';
             }
             Show('Tab_showFilter');
         }
         
    }
    function FnddlTradeType(obj)
    {
       if(obj=="4")
         Hide('Tr_Group');
       else
         Show('Tr_Group');
         
        selecttion();
        height();
    }
    function FnddlGeneration()
    {
        var obj=document.getElementById('ddlGeneration').value;
       
        if(obj=='SelectType')
        {
            Hide('Tab_Selection');
            Hide('Tr_FilterColumn');
            FnOther();
        }
        else if(obj=='Screen')
        {
            Show('Tab_Selection');
            Show('Tr_FilterColumn');
            FnScreen();
        }
        else
        {
            Show('Tab_Selection');
            Show('Tr_FilterColumn');
            FnOther();
        }
        DisplayBtn();
        FnddlGroupBy(document.getElementById('ddlGroupBy').value);
        Hide('DivRecordDisplay');
        height();
    }
    function FnScreen()
    {
         document.getElementById('RadioBtnOtherGroupBySelected').checked=true;
         document.getElementById('RadioBtnOtherGroupByAll').disabled=true;
         document.getElementById('RadioBtnOtherGroupByAll').checked=false;
         document.getElementById('RadioBtnGroupSelected').checked=true;
         document.getElementById('RadioBtnGroupAll').disabled=true;
         document.getElementById('RadioBtnGroupAll').checked=false;
         Show('Tab_showFilter');
    }
    function FnOther()
    {
         document.getElementById('RadioBtnOtherGroupBySelected').checked=false;
         document.getElementById('RadioBtnOtherGroupByAll').disabled=false;
         document.getElementById('RadioBtnOtherGroupByAll').checked=true;
         document.getElementById('RadioBtnGroupSelected').checked=false;
         document.getElementById('RadioBtnGroupAll').disabled=false;
         document.getElementById('RadioBtnGroupAll').checked=true;
         Hide('Tab_showFilter');
    }
    function fnunderlying(obj)
    {
         if(obj=="a")
            Hide('Tab_showFilter');
         else
         {
              var cmb=document.getElementById('cmbsearchOption');
              cmb.value='Product';
              Show('Tab_showFilter');
         }
         selecttion();
         height();
    }
    function DisplayBtn()
    {
         var obj=document.getElementById('ddlGeneration').value;
         if(obj=='Screen')
         {
            Hide('Td_BtnExport');
            Show('Td_BtnScreen');
            Hide('Td_BtnEmail');
         }
         else if(obj=='Export')
         {
            Show('Td_BtnExport');
            Hide('Td_BtnScreen');
            Hide('Td_BtnEmail');
         }
         else if(obj=='Mail')
         {
            Hide('Td_BtnExport');
            Hide('Td_BtnScreen');
            Show('Td_BtnEmail');
         }
         else 
         {
            Hide('Td_BtnExport');
            Hide('Td_BtnScreen');
            Hide('Td_BtnEmail');
         }
    }
function FunClient(objID,objListFun,objEvent)
{
        var cmbVal;
   
       if(document.getElementById('ddlGroupBy').value=="Group")//////////////Group By selected are Group
        {
           if(document.getElementById('rdddlgrouptypeAll').checked==true)
               {
                   cmbVal='ClientsGroup'+'~'+'ALL'+'~'+document.getElementById('ddlgrouptype').value;
               }
           else
               {
                   cmbVal='ClientsGroup'+'~'+'Selected'+'~'+document.getElementById('HiddenField_Group').value;
               }
        }
     else if(document.getElementById('ddlGroupBy').value=="Branch")/////branch selection
        {
            if(document.getElementById('rdbranchAll').checked==true)
               {
                   cmbVal='ClientsBranch'+'~'+'ALL';
               }
           else
               {
                   cmbVal='ClientsBranch'+'~'+'Selected'+'~'+document.getElementById('HiddenField_Branch').value;
               }
        }
      else if(document.getElementById('ddlGroupBy').value=="BranchGroup")/////branch-group selection
        {
           if(document.getElementById('rdbranchAll').checked==true)
               {
                   cmbVal='ClientsBranchGroup'+'~'+'ALL';
               }
           else
               {
                   cmbVal='ClientsBranchGroup'+'~'+'Selected'+'~'+document.getElementById('HiddenField_BranchGroup').value;
               }
        }
       else if(document.getElementById('ddlGroupBy').value=="Clients")///////client wise
        {
               cmbVal='ClientsBranch'+'~'+'ALL';
        }
         ajax_showOptions(objID,objListFun,objEvent,cmbVal);

    }
 function FnScrip(objID,objListFun,objEvent)
 {
     var dateto;
    dateto=new Date(dtTo.GetDate());
    dateto=parseInt(dateto.getMonth()+1)+'-'+dateto.getDate()+'-'+ dateto.getFullYear();
    
     var criteritype='B';
     criteritype=' AND Equity_EffectUntil>="'+dateto+'"  ';
     criteritype=criteritype.replace('"',"'");
     criteritype=criteritype.replace('"',"'");
     cmbVal='Scrips~'+'Date'+'~'+criteritype;
     ajax_showOptions(objID,objListFun,objEvent,cmbVal);
 }
 function Fncallajax(objID,objListFun,objEvent)
 {
    var cmbVal=document.getElementById('cmbsearchOption').value;
    
    if(cmbVal=="Clients")
    {
        FunClient(objID,objListFun,objEvent);
    }
    else if(cmbVal=="Group")
    {
         cmbVal='Group~'+document.getElementById('ddlGroup').value;
         ajax_showOptions(objID,objListFun,objEvent,cmbVal);
    }
    if(cmbVal=="Scrips")
    {
        FnScrip(objID,objListFun,objEvent);
    }
    else 
    {
         ajax_showOptions(objID,objListFun,objEvent,cmbVal);
    }
 }
 function fnTerminalCTCLcallajax(objID,objListFun,objEvent,ObjCriteria)
 {
     var datefrom;
     var dateto;
     var date;
     
        datefrom=new Date(dtFrom.GetDate());
        dateto=new Date(dtTo.GetDate());
        
        datefrom=parseInt(datefrom.getMonth()+1)+'-'+datefrom.getDate()+'-'+ datefrom.getFullYear();
        dateto=parseInt(dateto.getMonth()+1)+'-'+dateto.getDate()+'-'+ dateto.getFullYear();
        
     if (ObjCriteria=='TERMINALID')
         ObjCriteria= 'TerminalIdCriteria'+'~'+"ExchangeTrades_Tradedate between '"+datefrom +"' and '" + dateto +"'";
     else
         ObjCriteria= 'CTCLIdCriteria'+'~'+"ExchangeTrades_Tradedate between '"+datefrom +"' and '" + dateto +"'";
           
     ajax_showOptions(objID,'ShowClientFORMarginStocks',objEvent,ObjCriteria);
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
    
        Hide('Tab_showFilter');
        document.getElementById('BtnScreen').disabled=false;
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
function SelectAllFilter(chk) 
  {
    $('#<%=ChkFilterDetail.ClientID %>').find("input:checkbox").each(function() 
    {
        if (this != chk) {
            this.checked = chk.checked;
        }
    });
    
 }
 function RecordDisplay(obj)
 {
    document.getElementById('hiddencount').value=0;
    if(obj=='3')
    {
         Hide('Tab1');
         Show('DivRecordDisplay');
         Show('TrFilter');
    }
    else if(obj=='8')////View From Demat Center
    {
         Hide('Tab1');
         Show('DivRecordDisplay');
         Hide('TrFilter');
         Hide('Tr_DllPrevNext');
    }
    else  if(obj=='9')////View From Demat Center
    {
         Hide('Tab1');
         Hide('TrFilter');
         Hide('Tab_showFilter');
         Hide('DivRecordDisplay');
         alert('No Record Found !!');
    }
    else
    {
         Show('Tab1');
         Hide('TrFilter');
         Hide('Tab_showFilter');
         if(obj=='1')
            alert('No Record Found !!');
            
        /////////Email
        if(obj=='4')
            alert("Error on sending!Try again.. !!");
        if(obj=='5')
           alert("'Mail Sent Successfully !!'+'\n'+'Emails not Sent For Some Clients...'");
        if(obj=='6')
          alert("Mail Sent Successfully !!");
        if(obj=='7')
          alert("Email Id Not Found!!");
           FnddlGeneration();
    }
     height();
 }  
 function selecttion()
  {
     var combo=document.getElementById('cmbExport');
     combo.value='Ex';
  } 
  function heightlight(obj)
    {
  
    var colorcode=obj.split('&');
    
     if((document.getElementById('hiddencount').value)==0)
     {
        prevobj='';
        prevcolor='';
        document.getElementById('hiddencount').value=1;
       
     }
      document.getElementById(obj).style.backgroundColor='#ffe1ac';
     
      if(prevobj!='')
      {
        document.getElementById(prevobj).style.backgroundColor=prevcolor;
      }
      prevobj=obj;
      prevcolor=colorcode[1];

    } 
    function FnddlEmail(obj)
    {
        if(obj=='User')
        {
          Show('Tab_showFilter'); 
          var cmb=document.getElementById('cmbsearchOption');
          cmb.value='MAILEMPLOYEE';  
        }
        else
        {
            Hide('Tab_showFilter');
        }
    }
    function ForDemat()
    {
         Hide('TdHeader');
         Hide('TrFilter');
         Hide('Tab_showFilter');
         Show('DivRecordDisplay');
         document.getElementById('hiddencount').value=0;
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
            if(j[0]=='Segment')
            {
                document.getElementById('HiddenField_Segment').value = j[1];
            }
            if(j[0]=='Scrips')
            {
                document.getElementById('HiddenField_Instrument').value = j[1];
            }
            if(j[0]=='SettlementNo')
            {
                document.getElementById('HiddenField_SettNo').value = j[1];
            }
            if(j[0]=='SettlementType')
            {
                document.getElementById('HiddenField_Setttype').value = j[1];
            }
            if(j[0]=='Branch')
            {
                document.getElementById('HiddenField_Branch').value = j[1];
            }
            if(j[0]=='BranchGroup')
            {
                document.getElementById('HiddenField_BranchGroup').value = j[1];
            }
            if(j[0]=='Group')
            {
                document.getElementById('HiddenField_Group').value = j[1];
                btn.click();
            }  
            if(j[0]=='MAILEMPLOYEE')
            {
                document.getElementById('HiddenField_emmail').value = j[1];
               
            }  
            if(j[0]=='Product')
            {
                document.getElementById('HiddenField_Product').value = j[1];
            }

        }
        function SearchByAssetOrScript(obj)
        {
            if(obj=="ASSETS")
            {
                document.getElementById("Tr_Assets").style.display="inline";
                document.getElementById("rdbunderlyingall").checked=true;
                document.getElementById("Tr_Scrip").style.display="none";
            }
            else
            {
                document.getElementById("Tr_Assets").style.display="none";
                document.getElementById("Tr_Scrip").style.display="inline";
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
 
   } 
            </script>
    <div>
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" colspan="0" style="text-align: center; height: 20px;" id="TdHeader">
                    <strong><span id="SpanHeader" style="color: #000099">Trade Register</span></strong></td>
                <td class="EHEADER" width="25%" id="TrFilter" style="height: 22px">
                    <a href="javascript:void(0);" onclick="RecordDisplay(2);"><span style="color: Blue; text-decoration: underline;
                        font-size: 8pt; font-weight: bold">Filter</span></a>||
                    <asp:DropDownList ID="cmbExport" runat="server" AutoPostBack="True" Font-Size="10px" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged">
                        <asp:ListItem Selected="True" Value="Ex">Export</asp:ListItem>
                        <asp:ListItem Value="E">Excel</asp:ListItem>
                       
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <table id="Tab1">
            <tr>
                <td class="gridcellleft">
                    <table>
                        <tr valign="top">
                            <td>
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Date :
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
                            <td>
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Trade Type :
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlTradeType" runat="server" Width="250px" Font-Size="10px"
                                                onchange="FnddlTradeType(this.value)">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="gridcellleft">
                   <table><tr><td> <table border="10" cellpadding="1" cellspacing="1">
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Generate Type :</td>
                            <td>
                                <asp:DropDownList ID="ddlGeneration" runat="server" Width="130px" Font-Size="10px"
                                    onchange="FnddlGeneration()">
                                    <asp:ListItem Value="SelectType">Select Type</asp:ListItem>
                                    <asp:ListItem Value="Screen">Screen</asp:ListItem>
                                    <asp:ListItem Value="Export">Export</asp:ListItem>
                                    <asp:ListItem Value="Mail">Send Mail</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table></td></tr></table>
                </td>
            </tr>
            <tr id="Tab_Selection">
                <td class="gridcellleft">
                    <table >
                        <tr>
                            <td valign="top">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr id="Tr_Group">
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Group By</td>
                                        <td>
                                            <asp:DropDownList ID="ddlGroupBy" runat="server" Width="120px" Font-Size="10px" onchange="FnddlGroupBy(this.value)">
                                                <asp:ListItem Value="Clients">Clients</asp:ListItem>
                                                <asp:ListItem Value="Branch">Branch</asp:ListItem>
                                                <asp:ListItem Value="Group">Group</asp:ListItem>
                                                <asp:ListItem Value="BranchGroup">Branch Group</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td class="gridcellleft" id="Td_OtherGroupBy">
                                            <table border="10" cellpadding="1" cellspacing="1">
                                                <tr>
                                                    <td>
                                                        <asp:RadioButton ID="RadioBtnOtherGroupByAll" runat="server" Checked="True" GroupName="a"
                                                            onclick="FnGroupBy('a')" />
                                                        All
                                                    </td>
                                                    <td>
                                                        <asp:RadioButton ID="RadioBtnOtherGroupBySelected" runat="server" GroupName="a" onclick="FnOtherGroupBy('b')" />Selected
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="gridcellleft" id="Td_Group">
                                            <table border="10" cellpadding="1" cellspacing="1">
                                                <tr>
                                                    <td>
                                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:DropDownList ID="ddlGroup" runat="server" Font-Size="10px">
                                                                </asp:DropDownList>
                                                            </ContentTemplate>
                                                             <Triggers>
                                                     <asp:AsyncPostBackTrigger ControlID="BtnGroup" EventName="Click"></asp:AsyncPostBackTrigger>
                                                 </Triggers>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                    <td>
                                                        <asp:RadioButton ID="RadioBtnGroupAll" runat="server" Checked="True" GroupName="b"
                                                            onclick="FnGroup('a')" />
                                                        All
                                                        <asp:RadioButton ID="RadioBtnGroupSelected" runat="server" GroupName="b" onclick="FnGroup('b')" />Selected
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <table border="10" cellpadding="1" cellspacing="1">
                                                <tr>
                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                        Trade Category :</td>
                                                    <td>
                                                        <asp:TextBox runat="server" Width="20px" Font-Size="10px" ID="txtTradeCategory" Text="???"
                                                            MaxLength="3"></asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <table border="10" cellpadding="1" cellspacing="1">
                                                <tr>
                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                        Terminal Id:</td>
                                                    <td>
                                                        <asp:RadioButton ID="rdbTerminalAll" runat="server" Checked="True" GroupName="ter"
                                                            onclick="FnTerminal('a')" />
                                                        All
                                                    </td>
                                                    <td>
                                                        <asp:RadioButton ID="rdbTerminalSpecific" runat="server" GroupName="ter" onclick="FnTerminal('b')" />Specific
                                                    </td>
                                                    <td style="display: none;" id="Td_TerminalidSpecific">
                                                        <asp:TextBox runat="server" Width="100px" Font-Size="10px" ID="txtTerminal" onkeyup="fnTerminalCTCLcallajax(this,'chkfn',event,'TERMINALID')"></asp:TextBox><asp:TextBox
                                                            ID="txtTerminal_hidden" runat="server" Width="14px" Style="display: none;"> </asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <table border="10" cellpadding="1" cellspacing="1">
                                                <tr>
                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                        CTCL Id:</td>
                                                    <td>
                                                        <asp:RadioButton ID="rdbCTCLAll" runat="server" Checked="True" GroupName="ctcl" onclick="FnCTCL('a')" />
                                                        All
                                                    </td>
                                                    <td>
                                                        <asp:RadioButton ID="rdbCTCLSpecific" runat="server" GroupName="ctcl" onclick="FnCTCL('b')" />Specific
                                                    </td>
                                                    <td style="display: none;" id="Td_CTCLidSpecific">
                                                        <asp:TextBox runat="server" Width="100px" Font-Size="10px" ID="txtCtCLID" onkeyup="fnTerminalCTCLcallajax(this,'chkfn',event,'CTCLID')"></asp:TextBox>
                                                        <asp:TextBox ID="txtCtCLID_hidden" runat="server" Width="14px" Style="display: none;"> </asp:TextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <table border="10" cellpadding="1" cellspacing="1">
                                                <tr>
                                                    <td bgcolor="#b7ceec" class="gridcellleft">
                                                        Search By</td>
                                                    <td>
                                                        <asp:RadioButton ID="rdbAssets" runat="server"  GroupName="SearchBy"
                                                            onclick="SearchByAssetOrScript('ASSETS')" Text="Product(s)" />
                                                        </td>
                                                    <td>
                                                        <asp:RadioButton ID="rdbscrips" runat="server" Checked="True" GroupName="SearchBy" onclick="SearchByAssetOrScript('SCRIP')" Text="Instument(s)" /></td>
                                                </tr>
                                                <tr id="Tr_Scrip">
                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                        Instument(s)</td>
                                                    <td>
                                                        <asp:RadioButton ID="rdInstrumentAll" runat="server" Checked="True" GroupName="d"
                                                            onclick="FnScrips('a')" />
                                                        All
                                                    </td>
                                                    <td>
                                                        <asp:RadioButton ID="rdInstrumentSelected" runat="server" GroupName="d" onclick="FnScrips('b')" />
                                                        Selected
                                                    </td>
                                                </tr>
                                                <tr id="Tr_Assets">
                                                    <td bgcolor="#b7ceec" class="gridcellleft">
                                                        Product(s)</td>
                                                    <td>
                                                        <asp:RadioButton ID="rdbunderlyingall" runat="server" Checked="True" GroupName="A"
                                                            onclick="fnunderlying('a')" />All</td>
                                                    <td>
                                                        <asp:RadioButton ID="rdbunderlyingselected" runat="server" GroupName="A" onclick="fnunderlying('b')" />Selected</td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <table border="10" cellpadding="1" cellspacing="1">
                                                <tr>
                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                        Segment :</td>
                                                    <td>
                                                        <asp:RadioButton ID="rdbSegAll" runat="server" GroupName="e" onclick="FnSegment('a')" />
                                                        All
                                                    </td>
                                                    <td>
                                                        <asp:RadioButton ID="rdbSegSelected" runat="server" Checked="True" GroupName="e"
                                                            onclick="FnSegment('b')" />
                                                        Selected
                                                    </td>
                                                    <td>
                                                        [ <span id="litSegmentMain" runat="server" style="color: Maroon"></span>]
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <table border="10" cellpadding="1" cellspacing="1">
                                                <tr>
                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                        Sett No. :</td>
                                                    <td>
                                                        <asp:RadioButton ID="rdbSettNoAll" runat="server" GroupName="f" onclick="FnSettlementNo('a')" />
                                                        All
                                                    </td>
                                                    <td>
                                                        <asp:RadioButton ID="rdbSettNoSelected" runat="server" Checked="True" GroupName="f"
                                                            onclick="FnSettlementNo('b')" />
                                                        Selected
                                                    </td>
                                                    <td>
                                                        [ <span id="litSettlementNo" runat="server" style="color: Maroon"></span>]
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                     <tr>
                                         <td colspan="4">
                                             <table border="10" cellpadding="1" cellspacing="1">
                                                 <tr>
                                                     <td class="gridcellleft" bgcolor="#B7CEEC">
                                                         Sett Type :</td>
                                                     <td>
                                                         <asp:RadioButton ID="RadbSettlementTypeAll" runat="server" GroupName="g" onclick="FnSettlementType('a')" />
                                                         All
                                                     </td>
                                                     <td>
                                                         <asp:RadioButton ID="rdbSettlementTypeSelected" runat="server" Checked="True" GroupName="g"
                                                             onclick="FnSettlementType('b')" />
                                                         Selected
                                                     </td>
                                                     <td>
                                                         [ <span id="litSettlementType" runat="server" style="color: Maroon"></span>]
                                                     </td>
                                                 </tr>
                                             </table>
                                         </td>
                                    </tr>
                                      <tr>
                                        <td colspan="4">
                                            <table border="10" cellpadding="1" cellspacing="1">
                                                <tr>
                                                    <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 50%">
                                                        Trade Time :
                                                    </td>
                                                    <td>
                                                        <dxe:ASPxTextBox ID="txtfromtime" runat="server" HorizontalAlign="Left" Width="100px"
                                                            Text="00:00:00">
                                                            <validationsettings errordisplaymode="None">
                                                </validationsettings>
                                                            <masksettings mask="HH:mm:ss" />
                                                        </dxe:ASPxTextBox>
                                                    </td>
                                                    <td>
                                                        To
                                                    </td>
                                                    <td>
                                                        <dxe:ASPxTextBox ID="txttotime" runat="server" HorizontalAlign="Left" Width="100px"
                                                            Text="23:59:59">
                                                            <validationsettings errordisplaymode="None">
                                                </validationsettings>
                                                            <masksettings mask="HH:mm:ss" />
                                                        </dxe:ASPxTextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <table border="10" cellpadding="1" cellspacing="1">
                                                <tr>
                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                        Security Type :
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="DdlSecurityType" runat="server" Font-Size="11px" Width="150px">
                                                            <asp:ListItem Value="ALL">ALL</asp:ListItem>
                                                            <asp:ListItem Value="Approved">Only Approved</asp:ListItem>
                                                             <asp:ListItem Value="UnApproved">Only UnApproved</asp:ListItem>
                                                            <asp:ListItem Value="Illiquid">Only Illiquid</asp:ListItem>
                                                            <asp:ListItem Value="liquid">Only liquid</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                   
                                                </tr>
                                            </table>
                                        </td>
                                       
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <table border="10" cellpadding="1" cellspacing="1">
                                                <tr>
                                                     <td class="gridcellleft" bgcolor="#B7CEEC">
                                                        Order By :
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlOrderBy" runat="server" Width="200px" Font-Size="10px">
                                                            <asp:ListItem Value="1">Group+Client+Instrument+TradeDate</asp:ListItem>
                                                            <asp:ListItem Value="2">Group+Client+TradeDate+Instrument</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                       
                                    </tr>

                                </table>
                            </td>
                            <td valign="top">
                                <table id="Tab_showFilter" border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="300px" onkeyup="Fncallajax(this,'ShowClientFORMarginStocks',event)"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="cmbsearchOption" runat="server" Font-Size="11px" Width="70px"
                                                            Enabled="false">
                                                            <asp:ListItem>Clients</asp:ListItem>
                                                            <asp:ListItem>Group</asp:ListItem>
                                                            <asp:ListItem>Branch</asp:ListItem>
                                                            <asp:ListItem>BranchGroup</asp:ListItem>
                                                            <asp:ListItem>Segment</asp:ListItem>
                                                            <asp:ListItem>Scrips</asp:ListItem>
                                                            <asp:ListItem>SettlementType</asp:ListItem>
                                                            <asp:ListItem>SettlementNo</asp:ListItem>
                                                            <asp:ListItem>MAILEMPLOYEE</asp:ListItem>
                                                            <asp:ListItem>Product</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        <a id="A3" href="javascript:void(0);" onclick="btnAddsubscriptionlist_click()"><span
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
                                                        <a id="A5" href="javascript:void(0);" onclick="clientselectionfinal()"><span style="color: #000099;
                                                            text-decoration: underline; font-size: 10pt;">Done</span></a>&nbsp;&nbsp;
                                                    </td>
                                                    <td>
                                                        <a id="A6" href="javascript:void(0);" onclick="btnRemovefromsubscriptionlist_click()">
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
            <tr id="Tr_FilterColumn">
                <td class="gridcellleft">
                    <table>
                        <tr>
                            <td valign="top">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Filter Columns :
                                        </td>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:CheckBox ID="ChkFilterALL" runat="server" onclick="javascript:SelectAllFilter(this);"
                                                            Checked="true" /><span style="font-family: Verdana; color: Teal; font-size: x-small;"><b>Check/UnCheck
                                                                ALL</b></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <div style="overflow: auto; border: 1px black solid; scrollbar-base-color: #C0C0C0">
                                                            <asp:CheckBoxList ID="ChkFilterDetail" runat="server" RepeatDirection="Vertical"
                                                                Width="600px" RepeatColumns="7">
                                                                <asp:ListItem Value="Terminalid" Selected="True">Terminalid</asp:ListItem>
                                                                <asp:ListItem Value="TradeCode" Selected="True">Trade Code</asp:ListItem>
                                                                <asp:ListItem Value="OrderNo" Selected="True">Order No</asp:ListItem>
                                                                <asp:ListItem Value="OrderEntryTime" Selected="True">Order EntryTime</asp:ListItem>
                                                                <asp:ListItem Value="TradeNo" Selected="True">TradeNo</asp:ListItem>
                                                                <asp:ListItem Value="TradeEntryTime" Selected="True">Trade EntryTime</asp:ListItem>
                                                                <asp:ListItem Value="CntrNo" Selected="True">Contract No</asp:ListItem>
                                                            </asp:CheckBoxList>
                                                        </div>
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
                <td valign="top">
                    <table>
                        <tr >
                            <td id="Td_BtnScreen" class="gridcellleft" valign="top">
                                <asp:Button ID="BtnScreen" runat="server" CssClass="btnUpdate" Height="20px" Text="Screen"
                                    Width="101px" OnClick="BtnScreen_Click" OnClientClick="selecttion()"/>
                            </td>
                            <td id="Td_BtnExport" class="gridcellleft" valign="top">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Export Type :</td>
                                        <td>
                                            <asp:DropDownList ID="ddlExportType" runat="server" Width="150px" Font-Size="10px">
                                                <asp:ListItem Value="Excel">Excel</asp:ListItem>
                                                <asp:ListItem Value="PDF">PDF</asp:ListItem>
                                            </asp:DropDownList></td>
                                        <td>
                                            <asp:Button ID="BtnExport" runat="server" CssClass="btnUpdate" Height="20px" Text="Export"
                                                Width="120px" OnClick="BtnExport_Click" OnClientClick="selecttion()"/></td>
                                    </tr>
                                </table>
                            </td>
                            <td id="Td_BtnEmail" class="gridcellleft" valign="top">
                             <table border="10" cellpadding="1" cellspacing="1">
                             <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                           Respective :</td>
                                        <td>
                                            <asp:DropDownList ID="ddlEmail" runat="server" Width="150px" Font-Size="10px" onchange="FnddlEmail(this.value)">
                                                <asp:ListItem Value="Client">Client</asp:ListItem>
                                                <asp:ListItem Value="Group/Branch">Group/Branch</asp:ListItem>
                                                <asp:ListItem Value="User">User</asp:ListItem>

                                            </asp:DropDownList></td>
                                        <td>
                                             <asp:Button ID="BtnEmail" runat="server" CssClass="btnUpdate" Height="20px" Text="Send Email"
                                    Width="120px" OnClick="BtnEmail_Click" OnClientClick="selecttion()"/></td>
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
                    <asp:Button ID="BtnGroup" runat="server" Text="BtnGroup" OnClick="BtnGroup_Click" />
                    <asp:HiddenField ID="HiddenField_Group" runat="server" />
                    <asp:HiddenField ID="HiddenField_Branch" runat="server" />
                    <asp:HiddenField ID="HiddenField_BranchGroup" runat="server" />
                    <asp:HiddenField ID="HiddenField_Client" runat="server" />
                    <asp:HiddenField ID="HiddenField_Instrument" runat="server" />
                    <asp:HiddenField ID="HiddenField_Segment" runat="server" />
                    <asp:HiddenField ID="HiddenField_SettNo" runat="server" />
                    <asp:HiddenField ID="HiddenField_Setttype" runat="server" />
                    <asp:HiddenField ID="HiddenField_emmail" runat="server" />
                    <asp:HiddenField ID="HiddenField_Product" runat="server" />
                    <asp:HiddenField ID="hiddencount" runat="server" />
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
        <div id="DivRecordDisplay" style="display: none;" width="100%">
            <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                <ContentTemplate>
                    <table width="100%" border="1">
                       
                        <tr>
                            <td>
                                <div id="DivHeader" runat="server">
                                </div>
                            </td>
                        </tr>
                        <tr bordercolor="Blue" id="Tr_DllPrevNext">
                            <td align="left">
                                <asp:UpdatePanel ID="updatepanel_trprevnext" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <table>
                                            <tr valign="top">
                                                <td style="height: 44px">
                                                    <asp:LinkButton ID="lnkPrev" runat="server" CommandName="Prev" Text="[Prev]" OnCommand="NavigationLinkC_Click"
                                                        OnClientClick="javascript:selecttion();"> </asp:LinkButton>
                                                </td>
                                                <td style="height: 44px">
                                                    <asp:DropDownList ID="cmbrecord" runat="server" Font-Size="10px" Width="300px" AutoPostBack="True"
                                                         onchange="selecttion()" OnSelectedIndexChanged="cmbrecord_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="height: 44px">
                                                    <asp:LinkButton ID="lnkNext" runat="server" CommandName="Next" Text="[Next]" OnCommand="NavigationLinkC_Click"
                                                        OnClientClick="javascript:selecttion();"> </asp:LinkButton>&nbsp;&nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="BtnScreen" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div id="Divdisplay" runat="server">
                                </div>
                            </td>
                        </tr>
                         <asp:HiddenField ID="TotalGrp" runat="server" />
                    </table>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="BtnScreen" EventName="Click"></asp:AsyncPostBackTrigger>
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </div>
    </form>
</body>
</html>
