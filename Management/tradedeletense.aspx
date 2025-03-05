<%@ page language="C#" autoeventwireup="true" inherits="management_tradedeletense, App_Web_0payuukt" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1">
    <title>Trade Delete</title>
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
        Hide('td_txtterminalid');
        Hide('tr_expla');
        Hide('showFilter');
        Hide('tr_clients');
        Hide('tr_Scrip');
        var sessionValue = '<%= Session["ExchangeSegmentID"] %>';
       
        if(sessionValue==1 || sessionValue==4 || sessionValue==15)
        {
         
            Hide('tr_date');
            Show('tr_divsett');
        }
        else
        {
            Hide('tr_divsett');
            Show('tr_date');
        }
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
        window.frameElement.width = document.body.scrollWidth;
    }
      
	
   function fn_TerminalId(obj)
   {
           if(obj=="a")
                Hide('td_txtterminalid');
           else
                Show('td_txtterminalid');
   }
  function fn_expla(obj)
  {
        if(obj=="4")
        {
              Show('tr_expla');
              Show('tr_clients');
              Show('tr_Scrip');
              Hide('showFilter');
              Hide('tr_terminalid');
              
        }
        else
        {
              Hide('tr_expla');
              Hide('tr_clients');
              Hide('tr_Scrip');
              Show('tr_terminalid');
              Hide('showFilter');   
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
   function Delete()
    {        
        var answer = confirm ("Are You Sure You Want To Delete ?");
        if (answer==true)
        {
            var answer1 = confirm ("Are You Sure ??");
            if(answer1==true)
            {
                var answer2 = confirm ("Are You Really Sure ??");
                if(answer2==true)
                {
//                    document.getElementById('btnremove').click();
                      cCbpRemove.PerformCallback();
                      if(document.getElementById('rdbtradetypeall').checked==true)
                      {
                         Hide('tr_expla');
                      }
                }
            }
        } 
                
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
   function fn_Scrip(obj)
   {
          if(obj=="a")
                Hide('showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='ScripsExchange';
                  Show('showFilter');
                
             }
   }
   function fn_Clients(obj)
   {
          if(obj=="a")
                Hide('showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='Clients';
                  Show('showFilter');
                
             }
   }
   function fn_callajax(objID,objListFun,objEvent,objcriteria)
   {
         cmbVal=document.getElementById('cmbsearchOption').value;
         if(objcriteria=='TerminalIdCriteria')
         {
            cmbVal='TerminalIdCriteria';
         }
         var date2=null;
         var date1=null;
         var date1 = dtFrom.GetDate();
         var date2 = dtTo.GetDate();
         if(date1 != null) 
         {
           date1 =parseInt(date1.getMonth()+1)+'-'+date1.getDate()+'-'+ date1.getFullYear();
         }
         if(date2 != null) 
         {
           date2 =parseInt(date2.getMonth()+1)+'-'+date2.getDate()+'-'+ date2.getFullYear();
         }
         var criteritype='B';
    
         if(cmbVal=='ScripsExchange')
         {
            criteritype='Equity_EffectUntil>="'+date2+'"  ';
            criteritype=criteritype.replace('"',"'");
            criteritype=criteritype.replace('"',"'");
            cmbVal=cmbVal+'~'+'Date'+'~'+criteritype;
         }
         if(cmbVal=='TerminalIdCriteria')
         {
            criteritype=" ExchangeTrades_Tradedate between '"+date1 +"' and '" + date2 +"'";
            criteritype=criteritype.replace('"',"'");
            criteritype=criteritype.replace('"',"'");
            cmbVal='TerminalIdCriteria'+'~'+criteritype;
         }
        ajax_showOptions(objID,objListFun,objEvent,cmbVal);
   }
   
   function CbpRemove_EndCallBack()
   {
    if(cCbpRemove.cpDeleted == "F")
    {
       alert('No Trade To Delete..');
    }
    else if(cCbpRemove.cpDeleted == "T")
    {
        alert('Trade Deleted Successfully');
    }
    document.getElementById('rdbTerminalAll').checked = true;
    document.getElementById('TerminalId').value = '';
    Hide('td_txtterminalid');
   }
   FieldName='lstSlection'; 
 </script>
      <script type="text/ecmascript">
        
	    function ReceiveServerData(rValue)
        {
            var j=rValue.split('~');
       
          
           if(j[0]=='ScripsExchange')
            {
                document.getElementById('HiddenField_ScripsExchange').value = j[1];
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
    <div>
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

        <table class="TableMain100">
            <tr>
                <td class="EHEADER" style="text-align: center;">
                    <strong><span style="color: #000099">Delete Trade</span></strong>
                </td>
            </tr>
        </table>
      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
               
            </ContentTemplate>
        </asp:UpdatePanel>
         <table>
                    <tr valign="top">
                        <td>
                            <table border="1" cellpadding="0" cellspacing="0">
                                <tr>
                                      <td class="gridcellleft">
                                        <table>
                                            <tr valign="top" id="tr_date">
                                                <td>
                                                    <table>
                                                        <tr>
                                                            <td class="gridcellleft" bgcolor="#b7ceec">
                                                                For A Period :</td>
                                                            <td>
                                                                <dxe:ASPxDateEdit ID="dtFrom" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                                    Font-Size="10px" Width="108px" ClientInstanceName="dtFrom">
                                                                    <dropdownbutton text="From">
                                                        </dropdownbutton>
                                                                </dxe:ASPxDateEdit>
                                                            </td>
                                                            <td>
                                                                <dxe:ASPxDateEdit ID="dtTo" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                                    Font-Size="10px" Width="108px" ClientInstanceName="dtTo">
                                                                    <dropdownbutton text="To">
                                                                    </dropdownbutton>
                                                                </dxe:ASPxDateEdit>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                          <tr id="tr_divsett">
                                                <td class="gridcellleft" bgcolor="#b7ceec">
                                                    <div id="Div_displayALL" runat="server" style="color:#800080">

                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="gridcellleft">
                                        <table>
                                            <tr>
                                                <td class="gridcellleft" bgcolor="#b7ceec">
                                                    Trade Type:
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddlTYPE" runat="server" Width="100px" Font-Size="10px" onchange="fn_expla(this.value)">
                                                        <asp:ListItem Value="1">All Trades</asp:ListItem>
                                                        <asp:ListItem Value="2">Manual Trades</asp:ListItem>
                                                        <asp:ListItem Value="3">Imported Trades</asp:ListItem>
                                                        <asp:ListItem Value="4">Split Trades</asp:ListItem>
                                                    </asp:DropDownList></td>
                                                <td>
                                                    <table style="width: 300px;">
                                                        <tr id="tr_expla" style="display: none;" valign="top">
                                                            <td style="color: Blue; height: 80px;">
                                                                Only Splited Trades Will Be Remove from the System.You Have To Process Trades Again
                                                                To Get back the Original Un-Splited Records.</td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr id="tr_terminalid">
                                    <td class="gridcellleft">
                                        <table>
                                            <tr>
                                                <td class="gridcellleft" bgcolor="#b7ceec">
                                                    Terminal Id:
                                                </td>
                                                <td valign="top">
                                                    <asp:RadioButton ID="rdbTerminalAll" runat="server" Checked="true" GroupName="a"
                                                        onclick="fn_TerminalId('a')" />
                                                </td>
                                                <td valign="top">
                                                    All
                                                </td>
                                                <td valign="top">
                                                    <asp:RadioButton ID="rdbTerminalSelected" runat="server" GroupName="a" onclick="fn_TerminalId('b')" />
                                                </td>
                                                <td valign="top">
                                                    Selected
                                                </td>
                                                <td id="td_txtterminalid" style="display: none;">
                                                    <asp:TextBox ID="TerminalId" runat="server" onkeyup="fn_callajax(this,'ShowClientFORMarginStocks',event,'TerminalIdCriteria')"></asp:TextBox></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                             
                                   <tr id="tr_clients">
                                    <td class="gridcellleft">
                                        <table>
                                            <tr>
                                                <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 50%">
                                                    Clients :</td>
                                                <td>
                                                    <asp:RadioButton ID="rdbClientAll" runat="server" Checked="True" GroupName="c" onclick="fn_Clients('a')" />
                                                    All
                                                </td>
                                                <td>
                                                    <asp:RadioButton ID="rdbClientSelected" runat="server" GroupName="c" onclick="fn_Clients('b')" />
                                                    Selected
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr id="tr_Scrip">
                                    <td class="gridcellleft">
                                        <table>
                                            <tr>
                                                <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 50%">
                                                    Scrip :</td>
                                                <td>
                                                    <asp:RadioButton ID="rdbScripAll" runat="server" Checked="True" GroupName="d" onclick="fn_Scrip('a')" />
                                                    All
                                                </td>
                                                <td>
                                                    <asp:RadioButton ID="rdbScripSelected" runat="server" GroupName="d" onclick="fn_Scrip('b')" />
                                                    Selected
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                      <dxcp:ASPxCallbackPanel ID="CbpRemove" runat="server" BackColor="Transparent"
                                        ClientInstanceName="cCbpRemove" OnCallback="CbpRemove_Callback"
                                        Width="100%" LoadingPanelText="Processing&hellip;">
                                        <PanelCollection>
                                             <dxp:PanelContent runat="server">
                                                <asp:Button ID="btn_del" OnClientClick="javascript:return Delete();" runat="server"
                                                    Text="Remove" CssClass="btnUpdate" Height="23px" Width="101px" />
                                             </dxp:PanelContent>
                                        </PanelCollection>
                                        <ClientSideEvents EndCallback="function (s, e) {CbpRemove_EndCallBack();}" />
                                      </dxcp:ASPxCallbackPanel>
                                    </td>
                                </tr>
                            </table>
                        </td>
                          <td>
                                        <table id="showFilter" border="10" cellpadding="1" cellspacing="1">
                                            <tr>
                                                <td>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="300px" onkeyup="fn_callajax(this,'ShowClientFORMarginStocks',event,'other')"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="cmbsearchOption" runat="server" Font-Size="11px" Width="70px"
                                                                    Enabled="false">
                                                                    <asp:ListItem>ScripsExchange</asp:ListItem>
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
                    <tr>
                        <td style="visibility:hidden">
                            <%--<asp:Button ID="btnremove" runat="server" Text="Remove" CssClass="btnUpdate" Height="23px"
                                Width="101px" OnClick="btnremove_Click" />--%>
                            <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="150px"></asp:TextBox>
                            <asp:TextBox ID="TerminalId_hidden" runat="server"></asp:TextBox>
                            <asp:HiddenField ID="HiddenField_ScripsExchange" runat="server" />
                            <asp:HiddenField ID="HiddenField_Clients" runat="server" />
                        </td>
                    </tr>
                </table>
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
        </table>
     
    </div>
    </form>
</body>
</html>
