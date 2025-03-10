<%@ page language="C#" autoeventwireup="true" inherits="GenericRoutines_Reporting_GenericReport, App_Web_cog1k1a-" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export" Namespace="DevExpress.Web.ASPxGridView.Export"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Generic Report</title>
     <link type="text/css" href="../../CentralData/CSS/style.css" rel="Stylesheet" />
    <!--External Scripts file-->
    <!-- Ajax List Requierd-->
    <link type="text/css" href="../../CentralData/CSS/GenericAjaxStyle.css" rel="Stylesheet" />
    <script type="text/javascript" src="../../CentralData/JSScript/GenericAjaxList.js"></script>
    <script type="text/javascript" src="../../CentralData/JSScript/init.js"></script>
    <!--Other Script-->
    <script type="text/javascript" src="../../CentralData/JSScript/GenericJScript.js"></script>
    <style type="text/css">
    form{
		display:inline;
	}
    </style>

    <script language="javascript" type="text/javascript">
    var inProcSelction="";
    var GenericAjaxListAspxPath = '../../Management/ajax_list.aspx';
    function Page_Load()///Call Into Page Load
    {
         Hide('showFilter');
         Hide('tr_filter'); 
         Hide('Tr_Broker');
         HideShow('divDate','S');
         HideShow('divDateRange','H')
         document.getElementById("rdbSegmentSelected").checked=true;
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
     
   function FunClientScrip(objID,objListFun,objEvent)
        {
          var cmbVal;
         
            if(document.getElementById('cmbsearchOption').value=="Clients")
            {
                if(document.getElementById('ddlGroup').value=="0" || document.getElementById('ddlGroup').value=="2")//////////////Group By  selected are branch
                {
                    if(document.getElementById('ddlGroup').value=="0")
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
                    if(document.getElementById('ddlGroup').value=="2")
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
                }
               else //////////////Group By selected are Group
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
            }
            else
            {
                cmbVal=document.getElementById('cmbsearchOption').value;
                cmbVal=cmbVal+'~'+document.getElementById('ddlgrouptype').value;
            }
          
          ajax_showOptions(objID,objListFun,objEvent,cmbVal,'Main',GenericAjaxListAspxPath);

        }
        function isSelectFree()
        {
            var cmb=document.getElementById('cmbsearchOption');
            if(cmb.value!="None") {
	                alert("Please Select "+cmb.value+" First!!!");
	                return false;
	        } 
	      return true;
        }
        function setSelectFree(){
            var cmb=document.getElementById('cmbsearchOption');
            cmb.value='None';
            Hide('showFilter');
        }
        function Clients(obj)
        {
             if(obj=="a")
                setSelectFree();
             else
             {
                  if(!isSelectFree()) {
                  document.getElementById('rdbClientALL').checked=true;
                  return false;  
                  }
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='Clients';
                  Show('showFilter');
             }
             
              height();
        }
      function Branch(obj)
      {
            if(obj=="a")
                setSelectFree();
             else
             {
                  if(!isSelectFree()) {
                  document.getElementById('rdbranchAll').checked=true;
                  return false;  
                  }
                  if(document.getElementById('ddlGroup').value=="0")
                   {
                    document.getElementById('cmbsearchOption').value='Branch';
                   }
                   if(document.getElementById('ddlGroup').value=="2")
                   {
                    document.getElementById('cmbsearchOption').value='BranchGroup';
                   }
                  Show('showFilter');
             }
           
                height();
      }
     function Group(obj)
      {
             if(obj=="a")
                setSelectFree();
             else
             {
                  if(!isSelectFree()) {
                  document.getElementById('rdddlgrouptypeAll').checked=true;
                  return false; 
                  } 
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='Group';
                  Show('showFilter');
              }
        
         height();
      }
      function Segment(obj)
      {
           if(obj=="a")
                  setSelectFree();
           else 
           {
                if(!isSelectFree()) {
                document.getElementById('rdbSegmentAll').checked=true;
                return false;  
                }
                var cmb=document.getElementById('cmbsearchOption');
                cmb.value='Segment';
                Show('showFilter');
                Hide('litSegmentMain');
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
	            
	            if(length == 0) {
                    alert("No Data Selected!!!");
                    return false;
	            }
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
                    inProcSelction=cmb.value;
                    CallServer(sendData,"");
                   
                }
	            var i;
                for(i=listBoxSubs.options.length-1;i>=0;i--)
                {
                    listBoxSubs.remove(i);
                }
            
                setSelectFree();
                
	        }
	     
	        
	   function btnRemovefromsubscriptionlist_click()
            {
                
                var listBox = document.getElementById('lstSlection');
                var tLength = listBox.length;
                isListEmpty(tLength);
                
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
        if(!isSelectFree()) {
          document.getElementById('ddlGroup').value=0;
          return false; 
        } 
        
        if(obj=="0" || obj=="2")
        {
            Hide('td_group');
            Show('td_branch');
        }
        else if(obj=="1")
        {
            Show('td_group');
            Hide('td_branch');
            var btn = document.getElementById('btnhide');
            btn.click();
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
      
       height();
   } 
   function  fnddlview(obj)
   {
   if(obj=="1")
   {
   Show('tr_client');
   Hide('Tr_Broker');
   }
   if(obj=="2")
   {
   Hide('tr_client');
   Show('Tr_Broker');
   
   }
   if(obj=="3")
   {
   Hide('tr_client');
   Hide('Tr_Broker');
   
   }
   height();
   }
   function fnbroker(obj)
        {
             if(obj=="a")
                setSelectFree();
             else
             {
                  if(!isSelectFree()) {
                  document.getElementById('rdbbrokerall').checked=true;
                  return false;  
                  }
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='Broker';
                  Show('showFilter');
             }
             height();
        }
   function NORECORD(obj)
   {
        Show('tab2')
        Hide('showFilter');
        Hide('tr_filter');
        Hide('displayAll');
        Show('Td_DateDisply');
            
        if(obj=='1')
            alert('No Record Found !! ');
        if(obj=='2')
            alert("Mail Sent Successfully !!");
        if(obj=='3')
             alert("Error on sending!Try again.. !!");
        if(obj=='4')
             alert("'Mail Sent Successfully !!'+'\n'+'Emails not Sent For Clients Without Email-Id ...'");
         if(obj=='5')
             alert("E-Mail Id Could Not Be Found !!");
        
             if(document.getElementById('rbScreen').checked==true)
                RBShowHide('rbShow');
            if(document.getElementById('rbPrint').checked==true)
                RBShowHide('rbPrint');
            if(document.getElementById('rbMail').checked==true)
                RBShowHide('rbMail');
       height();
   }
   
   function btnShow_Click()
   {
        cGridCntNetWrth.PerformCallback("Show"+'~');
   }
   function btnExcel_Click()
   {
        cGridCntNetWrth.PerformCallback("Excel"+'~');
   }
   
   function ReceiveServerData(rValue)
   {            
       var Data=rValue.split('@');           
       if(Data[1]!="undefined")
       {
            if((Data[0]=='Branch')||(Data[0]=='Group')||(Data[0]=='Client'))
               SetValue('HiddenField_ClientBranchGroup',Data[1]);                                                     
       } 
   }
   function GridCntNetWrth_EndCallBack()
   {
    if(cGridCntNetWrth.cpExcel != null && cGridCntNetWrth.cpExcel=="Continue")
    {
        document.getElementById("btnExport").click();
    }    
    cGridCntNetWrth.cpExcel=null;
    height();
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
                    btn.click();
                } 
                if(j[0]=='BranchGroup')
                {
                    document.getElementById('HiddenField_BranchGroup').value = j[1];
                } 
                if(j[0]=='Clients')
                {
                    document.getElementById('HiddenField_Client').value = j[1];
                } 
                 if(j[0]=='Broker')
                {
                    document.getElementById('HiddenField_Broker').value = j[1];
                } 
                if(j[0]=='MAILEMPLOYEE')
                {
                    document.getElementById('HiddenField_emmail').value = j[1];
                }
                 if(j[0]=='Segment')
                {
                    document.getElementById('HiddenField_Segment').value = j[1];
                }


            }
  //-----------------------------------------------
        
      function fn_DatePeriod(obj)
        {
            if(obj=="D")
            {
                HideShow('DivDate','S');
                HideShow('DivDateRange','H');
            }
            else
            {
                HideShow('DivDate','H');
                HideShow('DivDateRange','S');
            }
        }  
        function BtnGenerateReport_Click()
        {
            cCbpButtons.PerformCallback("GenerateReport~");
        }
        function CbpButtons_EndCallBack()
        {
            if(cCbpButtons.cpClientMsg != null)
            {
                alert(cCbpButtons.cpClientMsg);
            }
            if(cCbpButtons.cpCommand!=null)
            {
                if(cCbpButtons.cpCommand == "Generate")
                {
                    document.getElementById("btnReportExport").click();
                }
            }
        }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server" autocomplete="off">
        <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600">
        </asp:ScriptManager>
        <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" colspan="0" style="text-align: center; height: 20px;">
                        <strong><span id="SpanHeader" style="color: #000099">Generic Report</span></strong></td>
                    <td class="EHEADER" width="5%" id="tr_filter" style="height: 22px">
                        <a href="javascript:void(0);" onclick="NORECORD(6);"><span style="color: Blue; text-decoration: underline;
                            font-size: 8pt; font-weight: bold">Filter</span></a>
                    </td>
                </tr>
            </table>
            <table id="tab2" border="0" cellpadding="0" cellspacing="0">
                
                <tr valign="top">
                    <td>
                        <table>
                            <tr>
                                <td class="gridcellleft">
                                    <table border="10" cellpadding="1" cellspacing="1">
                                        <tr id="DivPeriod" class="Row">
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                <asp:Label ID="lblPeriod" runat="server" Text="Select Period : "></asp:Label>
                                            </td>
                                            <td id="divPeriodContent">
                                                <dxe:ASPxRadioButtonList ID="RblDatePeriod" runat="server" SelectedIndex="0" ItemSpacing="5px"
                                                    Paddings-PaddingTop="1px" RepeatDirection="Horizontal" TextWrap="False" TabIndex="0"
                                                    ClientInstanceName="cRblDatePeriod">
                                                    <Items>
                                                        <dxe:ListEditItem Text="As On Date" Value="D" />
                                                        <dxe:ListEditItem Text="Date Range" Value="P" />
                                                    </Items>
                                                    <ClientSideEvents ValueChanged="function(s, e) {fn_DatePeriod(s.GetValue());}" />
                                                    <Border BorderWidth="0px" />
                                                </dxe:ASPxRadioButtonList>
                                            </td>
                                        </tr>
                                        <tr id="DivDate">
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                Date :</td>
                                            <td>
                                                <dxe:ASPxDateEdit ID="ToDate" runat="server" ClientInstanceName="cToDate" DateOnError="Today"
                                                    EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="125px"
                                                    Font-Size="11px" TabIndex="0">
                                                    <DropDownButton Text="Select">
                                                    </DropDownButton>
                                                </dxe:ASPxDateEdit>
                                            </td>
                                        </tr>
                                        <tr id="DivDateRange" class="Row">
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                <asp:Label ID="Label10" runat="server" Text="Date Range : "></asp:Label>
                                            </td>
                                            <td id="Div17" class="LFloat_Content ContentWidth">
                                                <dxe:ASPxDateEdit ID="DtFrom" runat="server" ClientInstanceName="cDtFrom" DateOnError="Today"
                                                    EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="125px"
                                                    Font-Size="11px" TabIndex="0">
                                                    <DropDownButton Text="From">
                                                    </DropDownButton>
                                                    <ClientSideEvents DateChanged="function(s,e){DateChange(cDtFrom);}"></ClientSideEvents>
                                                </dxe:ASPxDateEdit>
                                            </td>
                                            <td id="Div1" class="LFloat_Content ContentWidth">
                                                <dxe:ASPxDateEdit ID="DtTo" runat="server" ClientInstanceName="cDtTo" DateOnError="Today"
                                                    EditFormat="Custom" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True" Width="125px"
                                                    Font-Size="11px" TabIndex="0">
                                                    <DropDownButton Text="To">
                                                    </DropDownButton>
                                                    <ClientSideEvents DateChanged="function(s,e){DateChange(cDtTo);}"></ClientSideEvents>
                                                </dxe:ASPxDateEdit>
                                            </td>
                                        </tr>
                                        <tr id="tr_Segment">
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                Segment :</td>
                                            <td>
                                                <asp:RadioButton ID="rdbSegmentAll" runat="server" GroupName="b" onclick="Segment('a')" />All
                                            </td>
                                            <td>
                                                <asp:RadioButton ID="rdbSegmentSelected" runat="server" Checked="true" GroupName="b"
                                                    onclick="Segment('s')" />Selected <span id="litSegmentMain" runat="server" style="color: Maroon">
                                                    </span>
                                            </td>
                                            <td colspan="3">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                Group By</td>
                                            <td>
                                                <asp:DropDownList ID="ddlGroup" runat="server" Width="100px" Font-Size="10px" onchange="fnddlGroup(this.value)">
                                                    <asp:ListItem Value="0">Branch</asp:ListItem>
                                                    <asp:ListItem Value="1">Group</asp:ListItem>
                                                    <asp:ListItem Value="2">Branch Group</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td colspan="2" id="td_branch">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:RadioButton ID="rdbranchAll" runat="server" Checked="True" GroupName="a" onclick="Branch('a')" />
                                                            All
                                                        </td>
                                                        <td>
                                                            <asp:RadioButton ID="rdbranchSelected" runat="server" GroupName="a" onclick="Branch('b')" />Selected
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td id="td_group" style="display: none;" colspan="2">
                                                <table>
                                                    <tr>
                                                        <td style="display: none;">
                                                            <asp:TextBox ID="TextBox1" runat="server" Font-Size="12px" Width="150px"></asp:TextBox>
                                                            <asp:Button ID="btnhide" runat="server" Text="Button" OnClick="btnhide_Click" />
                                                        </td>
                                                        <td>
                                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:DropDownList ID="ddlgrouptype" runat="server" Font-Size="10px" onchange="fngrouptype(this.value)">
                                                                    </asp:DropDownList>
                                                                </ContentTemplate>
                                                                <Triggers>
                                                                    <asp:AsyncPostBackTrigger ControlID="btnhide" EventName="Click"></asp:AsyncPostBackTrigger>
                                                                </Triggers>
                                                            </asp:UpdatePanel>
                                                        </td>
                                                        <td id="td_allselect">
                                                            <asp:RadioButton ID="rdddlgrouptypeAll" runat="server" Checked="True" GroupName="b"
                                                                onclick="Group('a')" />
                                                            All
                                                            <asp:RadioButton ID="rdddlgrouptypeSelected" runat="server" GroupName="b" onclick="Group('b')" />Selected
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr id="Tr_viewby">
                                            <td colspan="3">
                                                <table border="10" cellpadding="1" cellspacing="1">
                                                    <tr>
                                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                                            View By :</td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlviewby" runat="server" Width="100px" Font-Size="10px" onchange="fnddlview(this.value)">
                                                                <asp:ListItem Value="1">Client</asp:ListItem>
                                                                <asp:ListItem Value="2">Broker</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr id="tr_client">
                                            <td colspan="3">
                                                <table>
                                                    <tr>
                                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                                            Clients :</td>
                                                        <td>
                                                            <asp:RadioButton ID="rdbClientALL" runat="server" Checked="True" GroupName="c" onclick="Clients('a')" />
                                                            All Client
                                                        </td>
                                                        <td>
                                                            <asp:RadioButton ID="radPOAClient" runat="server" GroupName="c" onclick="Clients('a')" />POA
                                                            Client
                                                        </td>
                                                        <td>
                                                            <asp:RadioButton ID="rdbClientSelected" runat="server" GroupName="c" onclick="Clients('b')" />
                                                            Selected Client
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr id="Tr_Broker">
                                            <td colspan="3">
                                                <table border="10" cellpadding="1" cellspacing="1">
                                                    <tr>
                                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                                            Broker :</td>
                                                        <td>
                                                            <asp:RadioButton ID="rdbbrokerall" runat="server" Checked="True" GroupName="M" onclick="fnbroker('a')" />
                                                            All
                                                        </td>
                                                        <td>
                                                            <asp:RadioButton ID="rdbbrokerselected" runat="server" GroupName="M" onclick="fnbroker('b')" />
                                                            Selected
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                Report Name</td>
                                            <td>
                                                <dxe:ASPxComboBox ID="CmbName" runat="server" Font-Size="13px" ValueType="System.String"
                                                    ClientInstanceName="cCmbName" Font-Bold="False" SelectedIndex="0" TabIndex="0">
                                                    <Paddings PaddingBottom="0px"></Paddings>
                                                </dxe:ASPxComboBox>
                                            </td>
                                        </tr>
                                    </table>
                                    <table>
                                        <tr>
                                            <td class="gridcellleft">
                                                <table border="10" cellpadding="1" cellspacing="1">
                                                    <tr>
                                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                                            Use Header
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtHeader" runat="server" Width="279px" Font-Size="10px" onkeyup="ajax_showOptions(this,'GetHeaderFooter',event,'H','Main','../../Management/ajax_list.aspx')"></asp:TextBox>
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
                                                            Use Footer
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="txtFooter" runat="server" Width="279px" Font-Size="10px" onkeyup="ajax_showOptions(this,'GetHeaderFooter',event,'F','Main','../../Management/ajax_list.aspx')"></asp:TextBox>
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
                                                            <asp:CheckBox ID="ChkBothSidePrint" runat="server" />
                                                            Both Side Print
                                                        </td>
                                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                                            <asp:CheckBox ID="ChkCompanyLogo" runat="server" Checked="true" />
                                                            Use Company Logo
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
                    <td>
                        <table id="showFilter">
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="gridcellleft" style="vertical-align: top; text-align: right; height: 21px;"
                                                id="TdFilter">
                                                <span id="spanunder"></span><span id="spanclient"></span>
                                                <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="150px" onkeyup="FunClientScrip(this,'ShowClientFORMarginStocks',event)"></asp:TextBox>
                                                <asp:DropDownList ID="cmbsearchOption" runat="server" Font-Size="11px" Width="70px"
                                                    Enabled="false">
                                                    <asp:ListItem Selected="True">None</asp:ListItem>
                                                    <asp:ListItem>Segment</asp:ListItem>
                                                    <asp:ListItem>Clients</asp:ListItem>
                                                    <asp:ListItem>Broker</asp:ListItem>
                                                    <asp:ListItem>Branch</asp:ListItem>
                                                    <asp:ListItem>Group</asp:ListItem>
                                                    <asp:ListItem>BranchGroup</asp:ListItem>
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
                
            </table>
            <table>
                <tr>
                    <td>
                        <dxe:ASPxButton ID="BtnGenerateReport" ClientInstanceName="cBtnGenerateReport" runat="server" AutoPostBack="False" 
                        Text="Generate Report" Width="150px">
                        <ClientSideEvents Click="function (s, e) {BtnGenerateReport_Click();}" />
                    </dxe:ASPxButton>
                    </td>
                    <td>
                        <dxcp:ASPxCallbackPanel ID="CbpButtons" runat="server" Width="400px" ClientInstanceName="cCbpButtons"
                            OnCallback="CbpButtons_Callback">
                            <PanelCollection>
                                <dxp:panelcontent runat="server">
                                </dxp:panelcontent>
                            </PanelCollection>
                            <ClientSideEvents EndCallback="function(s, e) {
	                                                    CbpButtons_EndCallBack(); }" />
                        </dxcp:ASPxCallbackPanel>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td style="display: none;">
                        <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="150px"></asp:TextBox>
                        <asp:HiddenField ID="HiddenField_Group" runat="server" />
                        <asp:HiddenField ID="HiddenField_Branch" runat="server" />
                        <asp:HiddenField ID="HiddenField_Client" runat="server" />
                        <asp:HiddenField ID="HiddenField_Broker" runat="server" />
                        <asp:HiddenField ID="HiddenField_emmail" runat="server" />
                        <asp:HiddenField ID="HiddenField_BranchGroup" runat="server" />
                        <asp:HiddenField ID="HiddenField_Segment" runat="server" />
                        <asp:HiddenField ID="txtHeader_hidden" runat="server" />
                        <asp:HiddenField ID="txtFooter_hidden" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="hiddenDiv" style="display:none"><asp:Button id="btnReportExport" Text="Client" runat="server" OnClick="btnReportExport_Click" /></div>
    </form>
</body>
</html>
