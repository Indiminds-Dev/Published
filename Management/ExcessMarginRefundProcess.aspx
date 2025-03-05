<%@ page language="C#" autoeventwireup="true" inherits="management_ExcessMarginRefundProcess, App_Web_i8xxwgwk" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Generate Positions</title>
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
                 txtmarkupappmrgn.SetValue('225.00');
                 txtmaintaincashcomp.SetValue('50.00');
                 txtCashRefund.SetValue('0.00');
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
        
     function fn_txtmarkupappmrgn(obj)
     {
       if(obj>9999.99)
       {
            txtmarkupappmrgn.SetValue('100.00');
       }
      
     }
     function fn_txtmaintaincashcomp(obj)
     {
       if(obj>100.00)
       {
            txtmaintaincashcomp.SetValue('100.00');
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

   function FunClientScrip(objID,objListFun,objEvent)
        {
          var cmbVal;
          var Segments="";
          //Get Selected Segment
          if(document.getElementById("rdSegmentALLCM").checked==true) Segments="CM";
          if(document.getElementById("rdSegmentALLCMFO").checked==true) Segments="CM,FO,CDX";
          if(document.getElementById("rdSpecificSegment").checked==true) Segments="SelectedSegmentID,"+document.getElementById("txtSegment_hidden").value;
          
            if(document.getElementById('cmbsearchOption').value=="Clients")
            {
                if(document.getElementById('ddlGroup').value=="0")//////////////Group By  selected are branch
                {
                    if(document.getElementById('rdbranchAll').checked==true)
                       {
                           cmbVal='ClientsBranch'+'~'+'ALL'+"~"+Segments;
                       }
                   else
                       {
                           cmbVal='ClientsBranch'+'~'+'Selected'+'~'+document.getElementById('HiddenField_Branch').value+"~"+Segments;
                       }
                }
               else //////////////Group By selected are Group
                {
                   if(document.getElementById('rdddlgrouptypeAll').checked==true)
                       {
                           cmbVal='ClientsGroup'+'~'+'ALL'+'~'+document.getElementById('ddlgrouptype').value+"~"+Segments;
                       }
                   else
                       {
                           cmbVal='ClientsGroup'+'~'+'Selected'+'~'+document.getElementById('HiddenField_Group').value+"~"+Segments;
                       }
               }
            }
            else
            {
                cmbVal=document.getElementById('cmbsearchOption').value;
                cmbVal=cmbVal+'~'+document.getElementById('ddlgrouptype').value;
            }
          ajax_showOptions(objID,objListFun,objEvent,cmbVal);
        }
        function FnClients(obj)
        {
             if(obj=="a")
                Hide('showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='Clients';
                  Show('showFilter');
             }
            
              height();
        }
      function FnBranch(obj)
      {
            if(obj=="a")
                Hide('showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='Branch';
                  Show('showFilter');
             }
            
                height();
      }
     function FnGroup(obj)
      {
            if(obj=="a")
                Hide('showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='Group';
                  Show('showFilter');
             }
            
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
                document.getElementById('btnshow').disabled=false;
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
    
   
   function  fnddlGroup(obj)
   {
        if(obj=="0")
        {
            Hide('td_group');
            Show('td_branch');
        }
        else
        {
            Show('td_group');
            Hide('td_branch');
            var btn = document.getElementById('btnhide');
            btn.click();
        }
       
         height();
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
      
       height();
   } 
  function FnSegment(Obj)
  {
    if(Obj=="b")
    {
        Show('Td_SpecificSegment');
    }
    else
    {
        Hide('Td_SpecificSegment');
    }
  } 

  function FnQuatarlyDate()
  {
    document.getElementById('lblcashmargin').innerHTML=DdlQuatarlyDate.GetText();
    document.getElementById('btndate').click();
  }
  function FnGenerate(obj)
  {
      Hide('showFilter');
      if(obj=='1')
      {
        alert('Generate Successfully!!');
      }
      else if(obj=='2')
      {
        alert('Delete Successfully!!!');
      }
      else
      {
        alert('No Record Found!!');
      }
      height();
  }
  
  function btnYesClick()
  {
    cCbp_GenDel.PerformCallback('Delete~');
  }
  function BtnGenDelClick()
  {
    if(cComboGenOrDel.GetValue()=="GP")
        cCbp_GenDel.PerformCallback('Generate~');
    else
        cDeleteMsgPopUp.Show();
  }
  function Cbp_GenDel_EndCallBack()
  {
    if(cCbp_GenDel.cpStatus != null)
    {
        if(cCbp_GenDel.cpStatus=='1')
        {
            alert('Generate Successfully!!');
        }
        else if(cCbp_GenDel.cpStatus=='3')
        {
            alert('Delete Successfully!!!');
        }
        else
        {
            if(cComboGenOrDel.GetValue()=="GP")
                alert('Unable To Process!!!\nPossible Error : \n1.Position Already Generated.\n2.Any Exception is Occurred.');
            else
                alert('Unable To Process!!!\nPossible Error : \n1.Position Already Deleted.\n2.Any Exception is Occurred.');
        }
        
    }       
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
                    btn.click();
                    document.getElementById('HiddenField_Group').value = j[1];
                }  
                if(j[0]=='Clients')
                {
                    document.getElementById('HiddenField_Client').value = j[1];
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
                    <strong><span id="SpanHeader" style="color: #000099">Generate Positions</span></strong></td>
            
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <table border="10" cellpadding="0" cellspacing="0">
                        <tr valign="top">
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Settlement
                                Date :
                            </td>
                            <td>
                                <dxe:ASPxDateEdit ID="dtSettlementDate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                    Font-Size="10px" Width="108px" ClientInstanceName="cdtSettlementDate" EditFormatString="dd-MM-yyyy">
                                </dxe:ASPxDateEdit></td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table border="10" cellpadding="0" cellspacing="0" style="width: 944px">
                        <tr valign="top">
                            <td class="gridcellleft" bgcolor="#B7CEEC" style="width: 276px">
                                <b>1.</b> Applicable Margin is Average Daily Margin For The last
                            </td>
                            <td>
                                <dxe:ASPxTextBox ID="txtWorkingdays" runat="server" HorizontalAlign="Right" Width="50px" ReadOnly="True">
                                    <masksettings mask="&lt;1..99g&gt;" includeliterals="DecimalSymbol" />
                                    <validationsettings errordisplaymode="None">
                                                    </validationsettings>
                                </dxe:ASPxTextBox></td>
                            <td bgcolor="#B7CEEC">
                                Working Days & Markedup To :</td>
                            <td style="width: 97px" >
                                <dxe:ASPxTextBox ID="txtmarkupappmrgn" runat="server" HorizontalAlign="Right" Width="100px">
                                    <masksettings mask="&lt;0..9999g&gt;.&lt;00..99&gt;%" includeliterals="DecimalSymbol" />
                                    <validationsettings errordisplaymode="None">
                                               </validationsettings>
                                                
                                    <clientsideevents lostfocus="function(s, e) {
	                                        fn_txtmarkupappmrgn(s.GetValue())
                                        }" />
                                </dxe:ASPxTextBox>
                            </td>
                          <td class="gridcellleft" bgcolor="#B7CEEC">
                                <b>2.</b> Maintain Cash Component at:
                            </td>
                            <td class="gridcellleft">
                                <dxe:ASPxTextBox ID="txtmaintaincashcomp" runat="server" HorizontalAlign="Right"
                                    Width="100px">
                                    <masksettings mask="&lt;0..100g&gt;.&lt;00..99&gt;%" includeliterals="DecimalSymbol" />
                                    <validationsettings errordisplaymode="None">
                                               </validationsettings>
                                    <clientsideevents lostfocus="function(s, e) {
	                                        fn_txtmaintaincashcomp(s.GetValue())
                                        }" />
                                </dxe:ASPxTextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr valign="top">
                            <td>
                                <table border="10" cellpadding="0" cellspacing="0">
                                    <tr id="tr_grp">
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Group By</td>
                                        <td>
                                            <asp:DropDownList ID="ddlGroup" runat="server" Width="80px" Font-Size="10px" onchange="fnddlGroup(this.value)">
                                                <asp:ListItem Value="0">Branch</asp:ListItem>
                                                <asp:ListItem Value="1">Group</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td id="td_branch">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:RadioButton ID="rdbranchAll" runat="server" Checked="True" GroupName="b" onclick="FnBranch('a')" />
                                                        All
                                                    </td>
                                                    <td>
                                                        <asp:RadioButton ID="rdbranchSelected" runat="server" GroupName="b" onclick="FnBranch('b')" />Selected
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td id="td_group" style="display: none;">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:DropDownList ID="ddlgrouptype" runat="server" Font-Size="10px" onchange="fngrouptype(this.value)">
                                                                </asp:DropDownList>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="btnhide" EventName="Click"></asp:AsyncPostBackTrigger>
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                    <td id="td_allselect" style="display: none;">
                                                        <asp:RadioButton ID="rdddlgrouptypeAll" runat="server" Checked="True" GroupName="c"
                                                            onclick="FnGroup('a')" />
                                                        All
                                                        <asp:RadioButton ID="rdddlgrouptypeSelected" runat="server" GroupName="c" onclick="FnGroup('b')" />Selected
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <table>
                                                <tr>
                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                        Segment :</td>
                                                    <td>
                                                        <asp:RadioButton ID="rdSegmentALLCM" runat="server" GroupName="dd"
                                                            onclick="FnSegment('a')" />
                                                        All CM
                                                    </td>
                                                    <td>
                                                        <asp:RadioButton ID="rdSegmentALLCMFO" runat="server" GroupName="dd" onclick="FnSegment('a')" Checked="True" />
                                                        All CM, FO,CDX
                                                    </td>
                                                    <td>
                                                        <asp:RadioButton ID="rdSpecificSegment" runat="server" GroupName="dd" onclick="FnSegment('b')" />
                                                        Specific
                                                    </td>
                                                    <td id="Td_SpecificSegment" style="display: none;">
                                                        <asp:TextBox ID="txtSegment" runat="server" Width="100px" Font-Size="10px" onkeyup="ajax_showOptions(this,'ShowClientFORMarginStocks',event,'Segment')"></asp:TextBox></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr id="tr_client">
                                       <td colspan="4"><table><tr> <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Clients :</td>
                                        <td>
                                            <asp:RadioButton ID="rdbClientALL" runat="server" Checked="True" GroupName="d" onclick="FnClients('a')" />
                                            All Client
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbPOAClient" runat="server" GroupName="d" onclick="FnClients('a')" />POA
                                            Client
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbClientSelected" runat="server" GroupName="d" onclick="FnClients('b')" />
                                            Selected Client
                                        </td></tr></table></td>
                                    </tr>
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC" colspan="4">
                                            <asp:CheckBox ID="chkpartialrelease" runat="server" />
                                            No Partial Release of Stocks
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td>
                                <table border="10" cellpadding="0" cellspacing="0" id="showFilter">
                                    <tr>
                                        <td id="TdFilter">
                                            <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="150px" onkeyup="FunClientScrip(this,'ShowClientFORMarginStocks',event)"></asp:TextBox>
                                            <asp:DropDownList ID="cmbsearchOption" runat="server" Font-Size="11px" Width="70px"
                                                Enabled="false">
                                                <asp:ListItem>Clients</asp:ListItem>
                                                <asp:ListItem>Branch</asp:ListItem>
                                                <asp:ListItem>Group</asp:ListItem>
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
                    <table border="10" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Bank Account :
                            </td>
                            <td>
                                <asp:DropDownList ID="DdlBankAc" runat="server" Font-Size="10px">
                                </asp:DropDownList></td>
                                <td class="gridcellleft" bgcolor="#B7CEEC">
                                Payment Mode :
                            </td>
                            <td>
                                <asp:DropDownList ID="DdlPaymentMode" runat="server" Font-Size="10px" Width="120px">
                                    <asp:ListItem Value="E">E-Transfer</asp:ListItem>
                                    <asp:ListItem Value="C">Cheque</asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table border="10" cellpadding="0" cellspacing="0">
                        <tr>
                            
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Stock Release Order</td>
                            <td>
                                <asp:DropDownList ID="ddlStock" runat="server" Width="200px" Font-Size="10px">
                                    <asp:ListItem Value="0">Margin then Holdback [Default]</asp:ListItem>
                                    <asp:ListItem Value="1">Hlodback then Margin</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Consider Cash Refund Above Rs/-
                            </td>
                            <td>
                                <dxe:ASPxTextBox ID="txtCashRefund" runat="server" HorizontalAlign="Right" Width="100px">
                                    <masksettings mask="&lt;0..10000g&gt;.&lt;00..99&gt;" includeliterals="DecimalSymbol" />
                                    <validationsettings errordisplaymode="None">
                                               </validationsettings>
                                </dxe:ASPxTextBox></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table border="10" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Inter A/c Trans. Narration :</td>
                            <td>
                                <asp:TextBox ID="txtInterAcNarration" runat="server" Text="Amount Transferred between 'Trading' and 'Margin Deposit' Accounts Upon Quarterly Settlement Of Accounts"
                                    MaxLength="500" Font-Size="10px" TextMode="MultiLine" Width="800px" Height="20px" Font-Names="Verdana"></asp:TextBox></td>
                                   
                        </tr>
                    </table>
                </td>
            </tr>
             <tr>
                <td style="height: 46px">
                    <table border="10" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Cash Bank Narration :</td>
                            <td>
                                <asp:TextBox ID="txtCaskBankNarration" runat="server" Text="Amount Paid Towards Quarterly Settlement Of Accounts"
                                    MaxLength="500" TextMode="MultiLine" Width="400px" Height="20px" Font-Size="10px" Font-Names="Verdana"></asp:TextBox></td>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Remarks For Demat Trans.</td>
                            <td>
                                <asp:TextBox ID="txtDematTransNarration" runat="server" Text="Excess Margin Stocks Refund"
                                    MaxLength="100" TextMode="MultiLine" Width="200px" Height="20px" Font-Size="10px" Font-Names="Verdana"></asp:TextBox></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="gridcellleft">
                    <div style="float: left">
                        <dxe:ASPxComboBox ID="ComboGenOrDel" runat="server" ClientInstanceName="cComboGenOrDel" Font-Size="Small" 
                        SelectedIndex="0" ValueType="System.String" EnableIncrementalFiltering="True" Height="15px" Width="130px">
                            <Items>
                                <dxe:ListEditItem Text="Gererate Position" Value="GP"></dxe:ListEditItem>
                                <dxe:ListEditItem Text="Delete Position" Value="DP"></dxe:ListEditItem>
                            </Items>
                        </dxe:ASPxComboBox>
                    </div>
                    <div>
                        <dxcp:ASPxCallbackPanel ID="Cbp_GenDel" runat="server" ClientInstanceName="cCbp_GenDel" OnCallback="Cbp_GenDel_Callback" LoadingPanelText="Please Wait!!!&hellip;">
                            <ClientSideEvents EndCallback="function(s, e) {
	                                                    Cbp_GenDel_EndCallBack(); }" />
                            <PanelCollection>
                                <dxp:PanelContent runat="server">
                                    <dxe:ASPxButton ID="BtnGenDel" ClientInstanceName="cBtnGenDel" runat="server" AutoPostBack="False" Text="[P]rocess" UseSubmitBehavior="False" CssClass="Button" AccessKey="P" Height="10px">
                                        <ClientSideEvents Click="function(s, e) {BtnGenDelClick();}"></ClientSideEvents>
                                    </dxe:ASPxButton>
                                </dxp:PanelContent>
                            </PanelCollection>
                            <LoadingPanelStyle BackColor="Transparent">
                                <BackgroundImage HorizontalPosition="center" ImageUrl="~/images/Loading_Squre.gif" Repeat="NoRepeat" 
                                VerticalPosition="center" />
                            </LoadingPanelStyle>
                        </dxcp:ASPxCallbackPanel>
                        <dxpc:ASPxPopupControl ID="DeleteMsgPopUp" runat="server" ClientInstanceName="cDeleteMsgPopUp" HeaderText="Notice" 
                        Left="100" ShowSizeGrip="False" Top="100" Width="387px" PopupHorizontalAlign="LeftSides" PopupVerticalAlign="TopSides">
                            <ContentCollection>
                                <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                                    <table class="style1">
                                        <tr>
                                            <td colspan="5">
                                                Are u Sure? Do You Want To Process?</td>
                                        </tr>
                                        <tr>
                                            <td style="width: 3px">
                                            </td>
                                            <td>
                                            </td>
                                            <td style="width: 164px">
                                            </td>
                                            <td style="width: 3px">
                                                <dxe:ASPxButton ID="btnYes" runat="server" AutoPostBack="False" Text="Yes">
                                                    <ClientSideEvents Click="function (s, e) { btnYesClick(); cDeleteMsgPopUp.Hide(); }" />
                                                </dxe:ASPxButton>
                                            </td>
                                            <td style="width: 3px">
                                                <dxe:ASPxButton ID="btnNo" runat="server" AutoPostBack="False" Text="No">
                                                    <ClientSideEvents Click="function (s, e) { cDeleteMsgPopUp.Hide(); }" />
                                                </dxe:ASPxButton>
                                            </td>
                                        </tr>
                                    </table>
                                </dxpc:PopupControlContentControl>
                            </ContentCollection>
                        </dxpc:ASPxPopupControl>
                    </div>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td style="display: none;">
                    <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="150px"></asp:TextBox>
                    <asp:TextBox ID="txtSegment_hidden" runat="server" Width="5px"></asp:TextBox>
                    <asp:HiddenField ID="HiddenField_Group" runat="server" />
                    <asp:HiddenField ID="HiddenField_Branch" runat="server" />
                    <asp:HiddenField ID="HiddenField_Client" runat="server" />
                    <asp:Button ID="btnhide" runat="server" Text="Button"  OnClick="btnhide_Click"/>
                    <asp:Button ID="btndate" runat="server" Text="btndate" OnClick="btndate_Click" />
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
    </div>
    </form>
</body>
</html>
