<%@ page language="C#" autoeventwireup="true" inherits="Reports_arbStatement_new, App_Web_wttsrqio" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>Daily Arbitrage Statement</title>
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
	

	</style>
 <script language="javascript" type="text/javascript">

  
    function Page_Load()///Call Into Page Load
            {
                 Hide('showFilter');
                 FnReportType('1');
                 height();
                 document.getElementById("HiddenField_Validate").value=1;
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
    
    function FunClientScrip(objID,objListFun,objEvent)
        {
          ajax_showOptions(objID,objListFun,objEvent,document.getElementById('cmbsearchOption').value);
        }
        
        function fnClients(obj)
        {
             if(obj=="a")
                Hide('showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='Clients';
                  Show('showFilter');
             }
             selecttion();
        }
        function fnArbGroup(obj)
        {
             if(obj=="a")
                Hide('showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='ArbGroup';
                  Show('showFilter');
             }
             selecttion();
        }
        function fnArbExchange(obj)
        {
             if(obj=="ALL")
                Hide('showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='ArbExchange';
                  Show('showFilter');
             }
             selecttion();
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
   
  function selecttion()
  {
     var combo=document.getElementById('cmbExport');
     combo.value='Ex';
  } 
 function FnReportType(Obj)
 {
    if(Obj=='1')////Client [Summary]
    {
        Show('Tr_ForDate');
        Hide('Tr_Period');
        Hide('Tr_Cycle');
        Hide('tr_email');
        Hide("Tr_Exchange");
        Show("Tr_Segment");
    }
    if(Obj=='2')////ArbGroup + Client [Summary]
    {
        Show('Tr_ForDate');
        Hide('Tr_Period');
        Hide('Tr_Cycle');
        Hide('tr_email');
        Hide("Tr_Exchange");
        Show("Tr_Segment");
    }
    if(Obj=='3' || Obj=='4' || Obj=='13')////ArbGroup + Client + Product [Detail]
    {
        Hide('Tr_ForDate');
        Show('Tr_Period');
        Show('Tr_Cycle');
        Show('tr_email');
        Hide("Tr_Exchange");
        Show("Tr_Segment");
    }
    if(Obj=='14' || Obj=='15')////ArbGroup + Client + Product [Detail]
    {
        Hide('Tr_ForDate');
        Show('Tr_Period');
        Show('Tr_Cycle');
        Hide('tr_email');
        Hide("Tr_Exchange");
        Show("Tr_Segment");
    }
    if(Obj=='16' || Obj=='17')////Client PL With Charges [Detail]
    {
        Hide('Tr_ForDate');
        Show('Tr_Period');
        Show('Tr_Cycle');
        Hide('tr_email');
        Hide("Tr_Exchange");
        Hide("Tr_Segment");
    }
   if(Obj=='5' || Obj=='6' || Obj=='7' || Obj=='8' || Obj=='9' || Obj=='10' || Obj=='11' || Obj=='12')////Consolidated For the Cycle
    {
        Show('Tr_ForDate');
        Hide('Tr_Period');
        Hide('Tr_Cycle');
        Hide('tr_email');
        Hide("Tr_Exchange");
        Show("Tr_Segment");
    }
    Hide('showFilter');
 }
  function FnDateChange(s)
         {
            document.getElementById('btnhide').click();
         }
   function FnCycleChange(obj)
   {
     var objVal=obj.split('~');
     
     dtFrom1.SetDate(new Date(objVal[1]));
     dtTo1.SetDate(new Date(objVal[2]));
     DtFrom.SetDate(new Date(objVal[1]));
     DtTo.SetDate(new Date(objVal[2]));
   }
   function FromDateCheck(obj)
   {
        var date1 = DtFrom.GetDate();
        var date2 =(new Date(date1.getFullYear(), date1.getMonth(), date1.getDate())).getTime();
        
        var date3 = dtFrom1.GetDate();
        var date4 =(new Date(date3.getFullYear(), date3.getMonth(), date3.getDate())).getTime();
        
        if(date2<date4)
        {
            DtFrom.SetDate(new Date(dtFrom1.GetDate()));
            alert('Dates Can Not Be Outside The Selected Settlement Cycle !!');
        }
   }
   function ToDateCheck(obj)
   {
        var date1 = DtTo.GetDate();
        var date2 =(new Date(date1.getFullYear(), date1.getMonth(), date1.getDate())).getTime();
        
        var date3 = dtTo1.GetDate();
        var date4 =(new Date(date3.getFullYear(), date3.getMonth(), date3.getDate())).getTime();
        
        if(date2>date4)
        {
            DtTo.SetDate(new Date(dtTo1.GetDate()));
            alert('Dates Can Not Be Outside The Selected Settlement Cycle !! ');
        }
   }
   function fnAlert()
   {
    alert('No Record Found!!');
   }
   function FnValueInsert(obj)
   {
 
        document.getElementById('HiddenField_CycleFordate').value=obj
   }
   function RecordDisplay(obj)
 {
   if(obj=='4')
            alert("Error on sending!Try again.. !!");
        if(obj=='5')
           alert("'Mail Sent Successfully !!'+'\n'+'Emails not Sent For Some Clients...'");
        if(obj=='6')
          alert("Mail Sent Successfully !!");
        if(obj=='7')
          alert("Email Id Not Found!!");
          //FnReportType();
   }
   
   function FnSegmentSelectionErr()
   {
    alert("Please Select Atlease One Segment!!!");
    var rptType=document.getElementById("DdlRptType").value;
    FnReportType(rptType);
   }
   function FnExchangeSelectionErr()
   {
    alert("Please Select Atlease One Exchange!!!");
    var rptType=document.getElementById("DdlRptType").value;
    FnReportType(rptType);
   }
   
    FieldName='lstSlection';
     </script>
    
  
 
  <script type="text/ecmascript">   
       function ReceiveServerData(rValue)
        {
                
                var j=rValue.split('~');
                var btn = document.getElementById('btnhide');

                if(j[0]=='Branch')
                {
                    document.getElementById('HiddenField_Branch').value = j[1];
                }
                if(j[0]=='Group')
                {
                    document.getElementById('HiddenField_Group').value = j[1];
                }  
                if(j[0]=='Clients')
                {
                    document.getElementById('HiddenField_Client').value = j[1];
                } 
                if(j[0]=='Product')
                {
                    document.getElementById('HiddenField_Asset').value = j[1];
                }
                if(j[0]=='BranchGroup')
                {
                    document.getElementById('HiddenField_BranchGroup').value = j[1];
                }
                if(j[0]=='ArbExchange')
                {
                    document.getElementById('HiddenField_ArbExchange').value = j[1];
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
                <td class="EHEADER" colspan="0" style="text-align: center; height: 30px;">
                    <strong><span id="SpanHeader" style="color: #A52A21; text-decoration: underline; font-size: 12pt;">Daily Arbitrage Statement</span></strong></td>

              
            </tr>
        </table>
    
       <table id="tab1" border="0" cellpadding="0" cellspacing="0">
            <tr valign="top">
                <td>
                    <table>
                        <tr>
                            <td class="gridcellleft">
                                <table border="20" cellpadding="1" cellspacing="1" style="width: 600px">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC" style="font-size: 11pt">
                                            Report Type :</td>
                                        <td>
                                            <asp:DropDownList ID="DdlRptType" runat="server" Width="480px" Font-Size="15px" onchange="FnReportType(this.value)">
                                                <asp:ListItem Value="1">1. Dealer Wise Day Summary</asp:ListItem>	
                                                <asp:ListItem Value="2">2. ArbGroup + Dealer</asp:ListItem>	
                                                <asp:ListItem Value="3">3. ArbGroup + Dealer + Product</asp:ListItem>  
                                                <asp:ListItem Value="4">4. ArbGroup + Dealer + Product (Only Open Position)</asp:ListItem>
                                                <asp:ListItem Value="5">5. Dealer Wise (Consolidated For The Cycle)</asp:ListItem>	
                                                <asp:ListItem Value="6">6. ArbGroup + Dealer Wise (Consolidated For The Cycle)</asp:ListItem>	
                                                <asp:ListItem Value="7">7. Dealer Wise Interest</asp:ListItem>	
                                                <asp:ListItem Value="8">8. Dealer Wise Short Open Positions</asp:ListItem>	
                                                <asp:ListItem Value="9">9. Product + Dealer Short Open Positions</asp:ListItem>	
                                                <asp:ListItem Value="10">10.Product Wise Short Open Positions</asp:ListItem>	
                                                <asp:ListItem Value="11">11.Product Wise Open Positions</asp:ListItem>	
                                                <asp:ListItem Value="12">12.Product + Dealer Wise Open Positions</asp:ListItem>	
                                                <asp:ListItem Value="13">13.Dealer Wise Buy/Sell Summary</asp:ListItem>	
                                                <asp:ListItem Value="14">14.Product Wise Buy/Sell Summary</asp:ListItem>	
                                                <asp:ListItem Value="15">15.Product + Dealer Wise Buy/Sell Summary</asp:ListItem>	
                                                <asp:ListItem Value="16">16.Dealer Wise Charges And PL</asp:ListItem>	
                                                <asp:ListItem Value="17">17.Dealer + Date Wise Charges And PL</asp:ListItem>	
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="Tr_ForDate">
                            <td class="gridcellleft">
                                <table border="20" cellpadding="1" cellspacing="1" style="width: 480px">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC" style="font-size: 11pt">
                                            For Date :
                                        </td>
                                        <td class="gridcellleft">
                                            <dxe:ASPxDateEdit ID="DtFor" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                Font-Size="15px" Width="120px" ClientInstanceName="DtFor">
                                                <dropdownbutton text="For">
                                                </dropdownbutton>
                                                 <ClientSideEvents ValueChanged="function(s, e) {FnDateChange(s);}" />
                                            </dxe:ASPxDateEdit>
                                        </td>
                                        <td>
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div id="DivDisplay" runat="server" Width="150px" style="color: #A52A21; text-decoration: underline; font-size: 11pt">
                                                    </div>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btnhide" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="Tr_Exchange">
                            <td class="gridcellleft">
                                <table border="20" cellpadding="1" cellspacing="1" style="width: 398px">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Exchange</td>
                                        <td align="left">
                                            &nbsp;<asp:RadioButton ID="RdoExchange_ALL" runat="server" Font-Size="15px" Checked="True" GroupName="RdbGroup_Exchange" onclick="fnArbExchange('ALL')" /></td>
                                        <td align="left" style="width: 22px">
                                            ALL</td>
                                        <td align="left">
                                            <asp:RadioButton ID="RdoExhange_Selected" runat="server" Font-Size="15px" GroupName="RdbGroup_Exchange" onclick="fnArbExchange('SELECTED')" /></td>
                                        <td align="left">
                                            Selected</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="Tr_Segment">
                            <td class="gridcellleft">
                                <table border="20" cellpadding="1" cellspacing="1" style="width: 398px">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC" style="font-size: 11pt">
                                            Segment</td>
                                        <td align="left">
                                            <asp:CheckBox ID="ChkSegment_CM" runat="server" Font-Size="15px" Checked="true"/>CM</td>
                                        <td align="left">
                                            <asp:CheckBox ID="ChkSegment_FO" runat="server" Font-Size="15px" Checked="true"/>FO</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                         <tr id="Tr_Cycle">
                            <td class="gridcellleft">
                                <table border="20" cellpadding="1" cellspacing="1" style="width: 398px">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC" style="font-size: 11pt">
                                               Settlement Cycle :
                                            </td>
                                            <td align="left">
                                                <asp:DropDownList ID="DdlCycle" runat="server" Font-Size="15px" onchange="FnCycleChange(this.value)">
                                                   
                                                </asp:DropDownList></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="Tr_Period">
                            <td class="gridcellleft">
                                <table border="20" cellpadding="1" cellspacing="1" style="width: 450px">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC" style="font-size: 11pt">
                                            For A Period :
                                        </td>
                                        <td class="gridcellleft">
                                            <dxe:ASPxDateEdit ID="DtFrom" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                Font-Size="15px" Width="130px" ClientInstanceName="DtFrom">
                                                <dropdownbutton text="From">
                                                </dropdownbutton>
                                                 <clientsideevents valuechanged="function(s, e) {FromDateCheck(s);}" />
                                            </dxe:ASPxDateEdit>
                                        </td>
                                        <td class="gridcellleft">
                                            <dxe:ASPxDateEdit ID="DtTo" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                Font-Size="15px" Width="130px" ClientInstanceName="DtTo">
                                                <dropdownbutton text="To">
                                                </dropdownbutton>
                                                <clientsideevents valuechanged="function(s, e) {ToDateCheck(s);}" />
                                            </dxe:ASPxDateEdit>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        
                         <tr id="Tr_ArbGroup">
                            <td class="gridcellleft">
                                <table border="20" cellpadding="1" cellspacing="1" style="width: 398px">
                                    <tr>
                                       <td class="gridcellleft" bgcolor="#B7CEEC" style="font-size: 11pt">
                                            Arb-Group :</td>
                                        <td>
                                            <asp:RadioButton ID="rdArbGroupAll" runat="server" Font-Size="15px" Checked="True" GroupName="cd" onclick="fnArbGroup('a')" />
                                            All
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdArbGroupSelected" runat="server" Font-Size="15px" GroupName="cd" onclick="fnArbGroup('b')" />
                                            Selected
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="Tr_Clients">
                            <td class="gridcellleft">
                                <table border="20" cellpadding="1" cellspacing="1" style="width: 398px">
                                    <tr>
                                       <td class="gridcellleft" bgcolor="#B7CEEC" style="font-size: 11pt">
                                            Dealers :</td>
                                        <td>
                                            <asp:RadioButton ID="rdbClientALL" runat="server" Font-Size="15px" Checked="True" GroupName="c" onclick="fnClients('a')" />
                                            All
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbClientSelected" runat="server" Font-Size="15px" GroupName="c" onclick="fnClients('b')" />
                                            Selected
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                       
                        
                        <tr>
                            <td class="gridcellleft">
                                <table>
                                    <tr>
                                       
                                        <td id="td_Export">
                                            <asp:Button ID="btnExcel" runat="server" Font-Size="15px" CssClass="btnUpdate" Height="30px" Text="Export To Excel"
                                                Width="250px" OnClientClick="selecttion()" OnClick="btnExcel_Click" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="tr_email">
                            <td class="gridcellleft">
                                <table>
                                    <tr>
                                       
                                        <td >
                                            <asp:Button ID="btnemail" runat="server" Font-Size="15px" CssClass="btnUpdate" Height="30px" Text="Send Email To Dealers"
                                                Width="250px" OnClientClick="selecttion()" OnClick="btnemail_Click" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                     <table  border="10" cellpadding="1" cellspacing="1" id="showFilter">
                         <tr>
                             <td class="gridcellleft" style="vertical-align: top; text-align: right; height: 21px;"
                                 id="TdFilter">
                                 <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="150px" onkeyup="FunClientScrip(this,'ShowClientFORMarginStocks',event)"></asp:TextBox>
                                 <asp:DropDownList ID="cmbsearchOption" runat="server" Font-Size="11px" Width="70px"
                                     Enabled="false">
                                     <asp:ListItem>Clients</asp:ListItem>
                                     <asp:ListItem>ArbGroup</asp:ListItem>
                                     <asp:ListItem>ArbExchange</asp:ListItem>
                                    
                                 </asp:DropDownList>
                                 <a id="A4" href="javascript:void(0);" onclick="btnAddsubscriptionlist_click()"><span
                                     style="color: #009900; text-decoration: underline; font-size: 8pt;">Add to List</span></a><span
                                         style="color: #009900; font-size: 8pt;"> </span>
                             </td>
                         </tr>
                                    <tr>
                                        <td style="height: 94px">
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
        <table>
            <tr>
                <td style="display: none;">
                    <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="150px"></asp:TextBox>
   
                    <asp:HiddenField ID="HiddenField_ArbGroup" runat="server" />
                    <asp:HiddenField ID="HiddenField_CycleFordate" runat="server" />
                   
                    <asp:HiddenField ID="HiddenField_Client" runat="server" />
                    <asp:HiddenField ID="HiddenField_ArbExchange" runat="server" />
                    <asp:HiddenField ID="HiddenField_Validate" runat="server" />
                  
                    <asp:Button ID="btnhide" runat="server" Text="Button" OnClientClick="selecttion()" OnClick="btnhide_Click" />
 <dxe:ASPxDateEdit ID="dtFrom1" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                            Font-Size="10px" Width="108px" ClientInstanceName="dtFrom1">
                                            <dropdownbutton text="For">
                                                    </dropdownbutton>
                                        </dxe:ASPxDateEdit>
                                    
                                        <dxe:ASPxDateEdit ID="dtTo1" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                            Font-Size="10px" Width="108px" ClientInstanceName="dtTo1">
                                            <dropdownbutton text="To">
                                                    </dropdownbutton>
                                        </dxe:ASPxDateEdit>
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
            <asp:UpdatePanel runat="server" ID="UpdatePanel2">
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
                                               <%-- <td style="height: 44px">
                                                    <asp:LinkButton ID="lnkPrev" runat="server" CommandName="Prev" Text="[Prev]" OnCommand="NavigationLinkC_Click"
                                                        OnClientClick="javascript:selecttion();"> </asp:LinkButton>
                                                </td>--%>
                                                <td style="height: 44px">
                                                    <asp:DropDownList ID="cmbrecord" runat="server" Font-Size="10px" Width="300px" AutoPostBack="True"
                                                         onchange="selecttion()" OnSelectedIndexChanged="cmbrecord_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                                <%--<td style="height: 44px">
                                                    <asp:LinkButton ID="lnkNext" runat="server" CommandName="Next" Text="[Next]" OnCommand="NavigationLinkC_Click"
                                                        OnClientClick="javascript:selecttion();"> </asp:LinkButton>&nbsp;&nbsp;
                                                </td>--%>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnemail" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div id="Div2" runat="server">
                                </div>
                            </td>
                        </tr>
                         <asp:HiddenField ID="TotalGrp" runat="server" />
                    </table>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnemail" EventName="Click"></asp:AsyncPostBackTrigger>
                </Triggers>
            </asp:UpdatePanel>
        </div>
   
    </div>
    </form>
</body>
</html>

