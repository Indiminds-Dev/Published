<%@ page language="C#" autoeventwireup="true" inherits="Management_CustodialTradeModification, App_Web_6yanuau_" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
     document.getElementById('rdbTranTypeAll').disabled=true; 
     Hide('showFilter');
     Hide('td_Show');
     Hide('tab2');
     height();
}
function height()
{
    if(document.body.scrollHeight>=450)
    {
        window.frameElement.height = document.body.scrollHeight;
    }
    else
    {
        window.frameElement.height = '450px';
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
        alert('Please Search Name And Then Add!')
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

    Hide('showFilter');+6
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

function fn_Client(obj)
{
    if(obj=="a")
    {
      Hide('showFilter');
      document.getElementById('rdbTranTypeConfrmd').checked=true;
      document.getElementById('rdbTranTypeAll').checked=false;
      document.getElementById('rdbTranTypeAll').disabled=true; 
    }
    else
    {
      document.getElementById('rdbTranTypeConfrmd').checked=false;
      document.getElementById('rdbTranTypeAll').disabled=false; 
      document.getElementById('rdbTranTypeAll').checked=true;
      var cmb=document.getElementById('cmbsearchOption');
      cmb.value='Clients';
      Show('showFilter');
         
    }
}
function fn_Scrip(obj)
{
//    if(document.getElementById('HiddenField_Clients').value!='')
//    {
      if(obj=="a")
            Hide('showFilter');
         else
         {
              var cmb=document.getElementById('cmbsearchOption');
              cmb.value='ScripsExchange';
              Show('showFilter');
            
         }
//    }
//    else
//    {
//        alert('Please Select Client!');
//        document.getElementById('rdbScripAll').checked=true;
//    }
  
}
function fn_OrderNo(obj)
{
////    if(document.getElementById('HiddenField_Clients').value!='')
////    {
         if(obj=="a")
             Hide('showFilter');
         else
         {
              var cmb=document.getElementById('cmbsearchOption');
              cmb.value='OrdernoCriteria';
              Show('showFilter');
         }
//    }
//    else
//    {
//         alert('Please Select Client!');
//         document.getElementById('rdbAllOrder').checked=true;
//    }
}
function fn_TerminalId(obj)
{
//    if(document.getElementById('HiddenField_Clients').value!='')
//    {
     
      if(obj=="a")
            Hide('showFilter');
         else
         {
              var cmb=document.getElementById('cmbsearchOption');
              cmb.value='TerminalIdCriteria';
              Show('showFilter');
         }
////    }
////    else
////    {
////       alert('Please Select Client!');
////       document.getElementById('rdbTerminalAll').checked=true;
////    }    
  
}
function fn_CTCLId(obj)
{
//    if(document.getElementById('HiddenField_Clients').value!='')
//    {
      if(obj=="a")
            Hide('showFilter');
         else
         {
              var cmb=document.getElementById('cmbsearchOption');
              cmb.value='CTCLIdCriteria';
              Show('showFilter');
         }
////    }
////    else
////    {
////       alert('Please Select Client!');
////       document.getElementById('rdbCTCLALL').checked=true;
////    }
}
function fn_ACType(obj)
{
    if(document.getElementById('HiddenField_Clients').value!='')
    {
      if(obj=="B")
      {
            Hide('showFilter');
            Show('td_cli');
            Show('td_pro');
            Hide('td_sectedac');
       
      }
      if(obj=="C")
      {
              Show('td_cli');
              Hide('td_pro');
              Show('td_sectedac');
              Hide('showFilter');
       
      }
      if(obj=="P")
      {
            Hide('showFilter');
            Show('td_cli');
            Show('td_pro');
            Hide('td_sectedac');
      }
        
    }
    else
    {
       //alert('Please Select Client!');
       document.getElementById('rdbBothACType').checked=true;
       Hide('showFilter');
       Show('td_cli');
       Show('td_pro');
       Hide('td_sectedac');
    }
}
function fn_Accode(obj)
{
//    if(document.getElementById('HiddenField_Clients').value!='')
//    {
      if(obj=="a")
            Hide('showFilter');
         else
         {
              var cmb=document.getElementById('cmbsearchOption');
              cmb.value='CliCustomerucc';
              Show('showFilter');
         }
 //   }
//    else
//    {
//       alert('Please Select Client!');
//       document.getElementById('rdallAccode').checked=true;
//    }
}
function fn_displayscreen(obj)
{
    if(obj.checked==true)
    {
        Hide('td_displayscreen');
        Hide('td_Show');
        Show('td_excelbn');
        Show('td_generatedbn');
    }
    else
    {
        Show('td_displayscreen');
        Show('td_Show');
        Hide('td_generatedbn');
        Hide('td_excelbn');
    }
    
}

   
function fn_callajax(objID,objListFun,objEvent)
{
    cmbVal=document.getElementById('cmbsearchOption').value;
    var date2=null;
    var date1 = dtfor.GetDate();
    if(date1 != null) 
    {
       date2 =parseInt(date1.getMonth()+1)+'-'+date1.getDate()+'-'+ date1.getFullYear();
    }
    var criteritype='B';
     
    
     if((cmbVal!='ScripsExchange') && (document.getElementById('rdbClientSelected').checked==true))
     {
         criteritype='  ExchangeTrades_TRADEDATE="'+date2+'" AND ';
         criteritype=criteritype.replace('"',"'");
         criteritype=criteritype.replace('"',"'");
         criteritype=criteritype+ '  EXCHANGETRADES_CUSTOMERID in "'+document.getElementById('HiddenField_Clients').value+'" ';
         criteritype=criteritype.replace('"',"'");
         criteritype=criteritype.replace('"',"'");
         cmbVal=cmbVal+'~'+criteritype;
     }
     else if((cmbVal!='ScripsExchange') && (document.getElementById('rdbClientAll').checked==true))
     {
         criteritype='  ExchangeTrades_TRADEDATE="'+date2+'"';
         criteritype=criteritype.replace('"',"'");
         criteritype=criteritype.replace('"',"'");
         cmbVal=cmbVal+'~'+criteritype;
     }
     else
     {
        criteritype=' AND Equity_EffectUntil>="'+date2+'"  ';
         criteritype=criteritype.replace('"',"'");
         criteritype=criteritype.replace('"',"'");
        cmbVal=cmbVal+'~'+'Date'+'~'+criteritype;
     }
     ajax_showOptions(objID,objListFun,objEvent,cmbVal);
}
function fn_callajaxclientto(objID,objListFun,objEvent,objCreteria)
{
    if(document.getElementById('HiddenField_Clients').value!='')
    {
       
         objCreteria=objCreteria+'~'+"'"+document.getElementById('HiddenField_Clients').value+"'";
         ajax_showOptions(objID,objListFun,objEvent,objCreteria);
    }
    else
    {
        alert('Please Select Client!');
    }
}
//   function txtclientonblur()
//   {
//        if(document.getElementById('txtClientFrom').value!='')
//        {
//            document.getElementById('txtClientTo').disabled=false;
//            document.getElementById('txtClientTo').focus();
//            document.getElementById('txtClientTo').select();
//        }
//        else
//        {
//       
//            document.getElementById('txtClientFrom_hidden').value='';
//            document.getElementById('txtClientTo').value='';
//            document.getElementById('txtClientTo_hidden').value='';
//            if(document.getElementById('txtClientFrom_hidden').value=='')
//            {
//                 document.getElementById('txtClientTo').disabled=true;
//            }
//        } 
//   }
function alertstatus(obj)
{
    if(obj=='1')
    {
        alert('Custodial Flag Changed Successfully !!');
    }
    if(obj=='2')
    {
        alert('No Record Found !!');
    }
    if(obj=='3')
    {
        alert('Contract Number Already Generated !!');
    }
    if(obj=='4')
    {
         alert('Please Select Client!');
    }
    Hide('tab2');
    Show('tab1');
    Hide('showFilter');
    height();
}
function fngridbind(obj)
{
    Show('tab2');
    Hide('tab1');
    DIVdisplayPERIOD.innerHTML=obj;
    height();
}
 
   FieldName='lstSlection';
 </script>	
 <script type="text/ecmascript">   
       function ReceiveServerData(rValue)
       {       // alert(rValue);
                var j=rValue.split('~');
                if(j[0]=='ScripsExchange')
                {
                    document.getElementById('HiddenField_ScripsExchange').value = j[1];
                } 
                if(j[0]=='OrdernoCriteria')
                {
                    document.getElementById('HiddenField_OrdernoCriteria').value = j[1];
                }
                if(j[0]=='TerminalIdCriteria')
                {
                    document.getElementById('HiddenField_TerminalIdCriteria').value = j[1];
                }
                if(j[0]=='CTCLIdCriteria')
                {
                    document.getElementById('HiddenField_CTCLIdCriteria').value = j[1];
                }
                if(j[0]=='CliCustomerucc')
                {
                    document.getElementById('HiddenField_CliCustomerucc').value = j[1];
                }
                if(j[0]=='Clients')
                {
                    document.getElementById('HiddenField_Clients').value = j[1];
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
                <td class="EHEADER" colspan="0" style="text-align: center; height: 20px;">
                    <strong><span id="SpanHeader" style="color: #000099">Mark or Un-Mark Custodial Trades</span></strong></td>
                         
            </tr>
        </table>
        <table id="tab1" border="0" cellpadding="0" cellspacing="0">
            <tr valign="top">
                <td colspan="2" class="gridcellleft">
                    <table border="10" cellpadding="1" cellspacing="1">
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC" style="height: 38px">
                                Date:
                            </td>
                            <td style="height: 38px">
                                <dxe:ASPxDateEdit ID="dtFor" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                    Font-Size="10px" Width="108px" ClientInstanceName="dtfor">
                                    <DropDownButton Text="For">
                                    </DropDownButton>
                                </dxe:ASPxDateEdit>
                            </td>
                            <td class="gridcellleft" bgcolor="#B7CEEC" style="height: 38px">
                                Select Client:
                            </td>
                            <td>
                                <asp:RadioButton ID="rdbClientAll" runat="server" Checked="True" GroupName="b" onclick="fn_Client('a')" />
                                All
                            </td>
                            <td>
                                <asp:RadioButton ID="rdbClientSelected" runat="server" GroupName="b" onclick="fn_Client('b')" />
                                Selected
                            </td>
                            
                            <%--<td style="height: 38px">
                                <asp:TextBox ID="txtClientFrom" runat="server" Width="200px" Font-Size="10px" ></asp:TextBox>
                            </td>--%>
                            
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
                        </tr>
                    </table>
                </td>
            </tr>
            <tr valign="top">
                <td class="gridcellleft">
                    <table border="10" cellpadding="1" cellspacing="1">
                        <tr>
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
                                            Transaction Type:
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbTranTypeAll" runat="server" GroupName="i" />
                                            All
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbTranTypeConfrmd" runat="server" Checked="True" GroupName="i" />
                                            Confirmed
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbTranTypeUnConfrmd" runat="server" GroupName="i" />
                                            Unconfirmed
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
                                        <td id="td_generatedbn" style="width: 127px">
                                            <asp:Button ID="btngeneratetrade" runat="server" CssClass="btnUpdate" Height="20px"
                                                Text="Change Custodial Trade" Width="142px" OnClick="btngeneratetrade_Click" /></td>
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
                                                            <asp:ListItem>Clients</asp:ListItem>
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
                    <asp:HiddenField ID="HiddenField_ScripsExchange" runat="server" />
                    <asp:HiddenField ID="HiddenField_OrdernoCriteria" runat="server" />
                    <asp:HiddenField ID="HiddenField_TerminalIdCriteria" runat="server" />
                    <asp:HiddenField ID="HiddenField_CTCLIdCriteria" runat="server" />
                    <asp:HiddenField ID="HiddenField_CliCustomerucc" runat="server" />
                    <asp:HiddenField ID="HiddenField_Clients" runat="server" />
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
                                    <asp:TemplateField HeaderText="Custodial Flag">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblCustodialFlag" runat="server" Text='<%# Eval("CustodialFlag")%>' CssClass="gridstyleheight1"></asp:Label>
                                          
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Select">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelect" runat="server"/>
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
