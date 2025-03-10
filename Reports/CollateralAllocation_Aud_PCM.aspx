<%@ page language="C#" autoeventwireup="true" inherits="Reports_CollateralAllocation_Aud_PCM, App_Web_w8tpuxyq" enableeventvalidation="false" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>Holding Report</title>
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
	

	</style>
 <script language="javascript" type="text/javascript">

  
    function Page_Load()///Call Into Page Load
            {
                 Hide('showFilter');
                 Hide('Td_ShoNegative');
                 Hide('Td_CorpAcType');
                 Hide('Tr_DdlCorpAcType');
                 document.getElementById('hiddencount').value=0;
                 FnddlGeneration('1');
                 ExportBatchSetting('Export');
                 Hide('tr_BSERow');
                    //New Batch
                    DTBatch.SetEnabled(false);
                    cBatchInfo.SetEnabled(false);
                    ///End
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
//            window.frameElement.width = document.body.scrollwidth;
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
         
            if(document.getElementById('cmbsearchOption').value=="ClientsSelction")
            {
               var criteritype='B';
               if(document.getElementById('rdbSegmentAll').checked)
               {
                  criteritype='ALL';
               }
               else
               {
                  criteritype='Exchange';
               }
              
               cmbVal='ClientsSelction'+'~'+criteritype;
            }
            else if(document.getElementById('cmbsearchOption').value=="Group")
            {
                cmbVal='Group'+'~'+document.getElementById('ddlgrouptype').value;
            }
            else
            {
                cmbVal=document.getElementById('cmbsearchOption').value;
            }
          ajax_showOptions(objID,objListFun,objEvent,cmbVal);

        }

        function fnBranchclient(obj)
        {
        
             if(obj=="a")
                Hide('showFilter');
             else
             {
              
                   if(document.getElementById('ddlGroup').value=="1")
                    {
                        document.getElementById('cmbsearchOption').value='Branch';
                    }
                   if(document.getElementById('ddlGroup').value=="3")
                    {   
                        document.getElementById('cmbsearchOption').value='ClientsSelction';
                    }
                  Show('showFilter');
             }
            
        }
        function fnInstrument(obj)
        {
             if(obj=="a")
                Hide('showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='Scrips';
                  Show('showFilter');
             }
             
        }
        function fnSegment(obj)
        {
             if(obj=="a")
             {
                Hide('showFilter');
                Hide('Td_CurrentSpecific');
             }
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='Segment';
                  Show('showFilter');
             }
             
        }
     function fnGroup(obj)
      {
            if(obj=="a")
                Hide('showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='Group';
                  Show('showFilter');
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
                document.getElementById('btnScreen').disabled=false;
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
        if(obj=="1" || obj=="3")
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
    
   }

  function FnddlGeneration(obj)
  {
  
    if(obj=="1")////////Screen
    {
        
        Hide('td_printlogo');
        
        
        
    }
    if(obj=="2")////////Export
    {
        
        
        Show('td_printlogo');
        
        
        
    }
    if(obj=="3")///////Email
    {
        
        
        Hide('td_printlogo');
        
        EmailVisible();
    }
   
  }
  function EmailVisible()
  {
    if(document.getElementById('ddlreporttype').value=="1")
    {
       
       
       Hide('showFilter');
    }
    else
    {
       
       
       var cmb=document.getElementById('cmbsearchOption');
       cmb.value='MAILEMPLOYEE';
       Show('showFilter');
    }
  }
  function fn_ddlreportchange(obj)
  {

    if(obj=="1")
    {
        Show('Tr_ChkBoxOtherSelection');
        Hide('Td_ShoNegative');
        Hide('Td_CorpAcType');
        Show('Tr_PendingPurSaleValuemethod');
        Show('Tr_ChkBoxOtherSelection');
    }
    if (obj == "2" || obj == "3")
    {
        Hide('Tr_ChkBoxOtherSelection');
        Show('Td_ShoNegative');
        Show('Td_CorpAcType');
        Hide('Tr_PendingPurSaleValuemethod');
        Hide('Tr_ChkBoxOtherSelection');
    }
     Hide('Tr_DdlCorpAcType');
     FnddlGeneration(document.getElementById('ddlGeneration').value);
     document.getElementById('ChkPendingPurchase').checked=false;
     document.getElementById('ChkPendingSales').checked=false;
     document.getElementById('ChkLedgerBaln').checked=false;
     document.getElementById('ChkCashMarginDep').checked=false;
     document.getElementById('ChkNegative').checked=false;
     document.getElementById('ChkDpDetails').checked=false;
     height();
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
   function RecordStatus(obj)
   {
   
        Hide('showFilter');
        if(obj=="1" || obj=='4' || obj=='5' || obj=='6' || obj=='7')
        {
            Show('tab1');
            Hide('displayAll');
            Hide('td_filter');
           
            if(obj=='4')
            alert("Mail Sent Successfully !!");
            if(obj=='5')
             alert("Error on sending!Try again.. !!");
            if(obj=='6')
             alert("'Mail Sent Successfully !!'+'\n'+'Emails not Sent For Clients Without Email-Id ...'");
            if(obj=='7')
             alert("E-Mail Id Could Not Be Found !!");
            if(obj=="1")
              alert('No Record Found!!');
             
            document.getElementById('hiddencount').value=0;
            FnddlGeneration(document.getElementById('ddlGeneration').value);
            fn_ddlreportchange(document.getElementById('ddlreporttype').value);
            
        }
        if(obj=="2")
        {
            Show('tab1');
            Hide('displayAll');
            Hide('td_filter');
            document.getElementById('hiddencount').value=0;
            FnddlGeneration(document.getElementById('ddlGeneration').value);
            fn_ddlreportchange(document.getElementById('ddlreporttype').value);
        }
        if(obj=="3")
        {
           
            Hide('tab1');
            Show('displayAll');
            Show('td_filter');
            document.getElementById('hiddencount').value=0;
           
        }
       
             
  selecttion();
                
   height();
   }
  function selecttion()
  {
     var combo=document.getElementById('ddlExport');
     combo.value='Ex';
  } 
  function fnddloptionformail(obj)
  {
    if(obj=='2')
    {
         var cmb=document.getElementById('cmbsearchOption');
         cmb.value='MAILEMPLOYEE';
         Show('showFilter');
    }
    else
        Hide('showFilter');
  }
  function FnCorpAc(obj)
  {
    if(obj.checked==true)
       {
            Show('Tr_DdlCorpAcType');
       }
   else
       {
            Hide('Tr_DdlCorpAcType'); 
       }
      
  }
  
    FieldName='lstSlection';
    
    
    //New Export Or Batch Script
    function chkBatch_Checked(obj)
    {
        DTBatch.SetEnabled(obj.checked);
        cBatchInfo.SetEnabled(obj.checked);
    }
    function ExportBatchSetting(obj)
    {
        if(obj!="3")
        {
            Hide('showFilter');
            Show('Td_Export');
            Hide('Td_Batch');
            Hide('tr_BSERow');
        }
        else
        {
            Hide('showFilter');
            Hide('Td_Export');
            Show('Td_Batch');
            Hide('tr_BSERow');
        }
        Height('350','350');
    }
    function OnMoreInfoClick()
    {
        var dateString = timeSolver.getString(DTBatch.GetDate(), "YYYY-MM-DD");
        var SqlWhere="(DATEADD(dd, 0, DATEDIFF(dd, 0, ExportFiles_ForDate)))='"+dateString+"'";
        var url ="../GenericRoutines/Batch/GenericBatchMaintenance.aspx?FileType=CollateralAllocation&SqlWhere="+SqlWhere;
        parent.OnMoreInfoClick(url,"Holding Statement Batch Detail",'1150px','480px',"Y");
    }

    function GnrcCallBackPanel_Methods(WhichCall)
    {
        Show("divLoading");
        cBtnExcel.SetEnabled(false);
        cBatchCreate.SetEnabled(false);
        cGnrcCallBackPanel.PerformCallback(WhichCall+'~');
        Height('350','350'); 
    }
    function GnrcCallBackPanel_EndCallBack()
    {
        Hide("divLoading");
        cBtnExcel.SetEnabled(true);
        cBatchCreate.SetEnabled(true);
        if(cGnrcCallBackPanel.cpIsSpData!=undefined)
        {
            if(cGnrcCallBackPanel.cpIsSpData=="Export")
                GetObjectID('btnExcelExport').click();
            else if(cGnrcCallBackPanel.cpIsSpData=="Batch")
                GetObjectID('btnBatchExport').click();
            else 
                alert(cGnrcCallBackPanel.cpIsSpData);
        }
        if(cGnrcCallBackPanel.cpDateSat!=undefined)
        {
            DtFor.SetDate(new Date(cGnrcCallBackPanel.cpDateSat));
        }
        Height('350','350'); 
    }
    //End New Export Or Batch Script
    
 </script>
    
  
 
  <script type="text/ecmascript">   
       function ReceiveServerData(rValue)
        {
                var j=rValue.split('~');

                if(j[0]=='Branch')
                {
                    document.getElementById('HiddenField_Branch').value = j[1];
                }
                if(j[0]=='Group')
                {
                    document.getElementById('HiddenField_Group').value = j[1];
                }  
                if(j[0]=='ClientsSelction')
                {
                    document.getElementById('HiddenField_Client').value = j[1];
                } 
                if(j[0]=='Scrips')
                {
                    document.getElementById('HiddenField_Scrips').value = j[1];
                }
                if(j[0]=='Segment')
                {
                    document.getElementById('HiddenField_Segment').value = j[1];
                }
                if(j[0]=='MAILEMPLOYEE')
                {
                    document.getElementById('HiddenField_emmail').value = j[1];
                }
            }





            //-----------------------------------------------


            function DateCompare() {
                dtColleterate.SetDate(new Date(DtFor.GetDate()));
                DTBatch.SetDate(new Date(DtFor.GetDate()));

                SelectedDate = new Date(DtFor.GetDate());
                //cGnrcCallBackPanel.PerformCallback('DateChanged'+'~'+SelectedDate);
            }



            //-----------------------------------------------
        
        
        function FnAlert(msg){alert(msg);}
        
        
        
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
                        <strong><span id="SpanHeader" style="color: #000099">Collateral Allocation Report For PCM
                        </span></strong>
                    </td>
                   
                </tr>
            </table>
            <table>
                <tr>
                    <td class="gridcellleft" bgcolor="#B7CEEC">
                        For A Date :
                    </td>
                    <td class="gridcellleft">
                        <dxe:ASPxDateEdit ID="DtFor" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                            Font-Size="10px" Width="108px" ClientInstanceName="DtFor">
                            <DropDownButton Text="For">
                            </DropDownButton>
                            <ClientSideEvents DateChanged="function(s,e){DateCompare();}"></ClientSideEvents>
                        </dxe:ASPxDateEdit> 
                    </td>
                </tr>
            </table>
            <table id="tab1" style="display:none" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td>
                        <table>
                            <tr>
                                <td class="gridcellleft">
                                    <table border="10" cellpadding="1" cellspacing="1">
                                        <tr valign="top">
                                            <td class="gridcellleft">
                                                
                                            </td>
                                            <td style="display: none">
                                                <table>
                                                    <tr>
                                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                                            Report For</td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlreporttype" runat="server" Width="200px" Font-Size="10px"
                                                                onchange="fn_ddlreportchange(this.value)">
                                                                <asp:ListItem Value="1">Client Wise [Default]</asp:ListItem>
                                                                <asp:ListItem Value="2">DP Account+Scrip+Client</asp:ListItem>
                                                                <asp:ListItem Value="3">Scrip+Client+DPAccount</asp:ListItem>
                                                            </asp:DropDownList></td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                                            DP Accounts</td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlDPAc" runat="server" Width="191px" Font-Size="10px" onchange="ddldpac(this.value)">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <%-- --------------- Colleterate Valuation Date Start ----------------------------%>
                            <tr>
                                <table>
                                    <tr>
                                        <td valign="top" bgcolor="#B7CEEC" class="gridcellleft">
                                            Colleteral Valuation Date :
                                        </td>
                                        <td style="width: 100px">
                                            <dxe:ASPxDateEdit ID="dtColleterate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                Font-Size="10px" Width="108px" ClientInstanceName="dtColleterate">
                                                <DropDownButton Text="">
                                                </DropDownButton>
                                            </dxe:ASPxDateEdit>
                                        </td>
                                    </tr>
                                </table>
                            </tr>
                            <%-- ---------------Colleterate Valuation Date End----------------------------%>
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td>
                                                <table>
                                                    <tr id="Tr_Segment">
                                                        <td class="gridcellleft">
                                                            <table border="10" cellpadding="1" cellspacing="1">
                                                                <tr>
                                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                                        Segment :</td>
                                                                    <td>
                                                                        <asp:RadioButton ID="rdbSegmentAll" runat="server" GroupName="ef" onclick="fnSegment('a')" />
                                                                        All
                                                                    </td>
                                                                    <td>
                                                                        <asp:RadioButton ID="rdbSegmentSelected" runat="server" Checked="True" GroupName="ef"
                                                                            onclick="fnSegment('b')" />Selected
                                                                    </td>
                                                                    <td id="Td_CurrentSpecific">
                                                                        [ <span id="litSegmentMain" runat="server" style="color: Maroon"></span>]</td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr id="Tr_GroupBy">
                                                        <td class="gridcellleft">
                                                            <table border="10" cellpadding="1" cellspacing="1">
                                                                <tr>
                                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                                        Group By</td>
                                                                    <td>
                                                                        <asp:DropDownList ID="ddlGroup" runat="server" Width="100px" Font-Size="10px" onchange="fnddlGroup(this.value)">
                                                                            <asp:ListItem Value="1">Branch</asp:ListItem>
                                                                            <asp:ListItem Value="2">Group</asp:ListItem>
                                                                            <asp:ListItem Value="3">Client</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td id="td_branch">
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:RadioButton ID="rdBranchClientAll" runat="server" Checked="True" GroupName="a"
                                                                                        onclick="fnBranchclient('a')" />
                                                                                    All
                                                                                </td>
                                                                                <td>
                                                                                    <asp:RadioButton ID="rdBranchClientSelected" runat="server" GroupName="a" onclick="fnBranchclient('b')" />Selected
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td id="td_group" style="display: none;">
                                                                        <table>
                                                                            <tr>
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
                                                                                <td id="td_allselect" style="display: none;">
                                                                                    <asp:RadioButton ID="rdddlgrouptypeAll" runat="server" Checked="True" GroupName="b"
                                                                                        onclick="fnGroup('a')" />
                                                                                    All
                                                                                    <asp:RadioButton ID="rdddlgrouptypeSelected" runat="server" GroupName="b" onclick="fnGroup('b')" />Selected
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr id="Tr_Instrument">
                                                        <td class="gridcellleft">
                                                            <table border="10" cellpadding="1" cellspacing="1">
                                                                <tr>
                                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                                        Instrument :</td>
                                                                    <td>
                                                                        <asp:RadioButton ID="rdbInstrumentAll" runat="server" Checked="True" GroupName="ee"
                                                                            onclick="fnInstrument('a')" />
                                                                        All
                                                                    </td>
                                                                    <td>
                                                                        <asp:RadioButton ID="rdInstrumentSelected" runat="server" GroupName="ee" onclick="fnInstrument('b')" />Selected
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr id="Tr_PendingPurSaleValuemethod">
                                                        <td class="gridcellleft">
                                                            <table border="10" cellpadding="1" cellspacing="1">
                                                                <tr>
                                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                                        Pendg. Pur/Sales Valuation Method
                                                                    </td>
                                                                    <td>
                                                                        <asp:RadioButton ID="rdbCloseprice" runat="server" Checked="True" GroupName="dd" />Close
                                                                        Price
                                                                    </td>
                                                                    <td>
                                                                        <asp:RadioButton ID="rdbTradeprice" runat="server" GroupName="dd" />Trade Price</td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="gridcellleft">
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
                                                    <tr id="Tr_ChkBoxOtherSelection">
                                                        <td class="gridcellleft">
                                                            <table border="10" cellpadding="1" cellspacing="1">
                                                                <tr>
                                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                                        <asp:CheckBox ID="ChkPendingPurchase" runat="server" />
                                                                        Show Pending Purchases
                                                                    </td>
                                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                                        <asp:CheckBox ID="ChkPendingSales" runat="server" />
                                                                        Show Pending Sales
                                                                    </td>
                                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                                        <asp:CheckBox ID="ChkDpDetails" runat="server" />
                                                                        Show Holding in DP Account
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                                        <asp:CheckBox ID="ChkLedgerBaln" runat="server" />
                                                                        Show Ledger Baln.
                                                                    </td>
                                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                                        <asp:CheckBox ID="ChkCashMarginDep" runat="server" />
                                                                        Cash Margin Deposit
                                                                    </td>
                                                                    <td class="gridcellleft" bgcolor="#B7CEEC" id="td_printlogo">
                                                                        <asp:CheckBox ID="ChkLogoPrint" runat="server" Checked="true" />
                                                                        Do Not Print Logo</td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="gridcellleft">
                                                            <table border="10" cellpadding="1" cellspacing="1">
                                                                <tr>
                                                                    <td class="gridcellleft" bgcolor="#B7CEEC" style="color: Red;" id="Td_ShoNegative">
                                                                        <asp:CheckBox ID="ChkNegative" runat="server" />
                                                                        Show Only Negative Holding Clients
                                                                    </td>
                                                                    <td class="gridcellleft" bgcolor="#B7CEEC" id="Td_CorpAcType">
                                                                        <asp:CheckBox ID="ChkCorpAcType" runat="server" onclick="FnCorpAc(this)" />
                                                                        Show Only Corporate-Action Due Shares
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr id="Tr_DdlCorpAcType">
                                                        <td class="gridcellleft">
                                                            <table border="10" cellpadding="1" cellspacing="1">
                                                                <tr>
                                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                                        Corp.Action Type
                                                                    </td>
                                                                    <td>
                                                                        <asp:DropDownList ID="ddlCorpActionType" runat="server" Width="80px" Font-Size="10px">
                                                                        </asp:DropDownList>
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
                                                                        Applicable Haircut Rate
                                                                    </td>
                                                                    <td>
                                                                        <asp:RadioButton ID="rdbVarmarginElm" runat="server" Checked="True" GroupName="elm" />
                                                                        Var Margin+ELM
                                                                        <asp:RadioButton ID="rdbVarmargin" runat="server" GroupName="elm" />Var Margin
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td valign="top">
                                                <table border="10" cellpadding="1" cellspacing="1" id="showFilter">
                                                    <tr>
                                                        <td class="gridcellleft" style="vertical-align: top; text-align: right; height: 21px;"
                                                            id="TdFilter">
                                                            <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="150px" onkeyup="FunClientScrip(this,'ShowClientFORMarginStocks',event)"></asp:TextBox>
                                                            <asp:DropDownList ID="cmbsearchOption" runat="server" Font-Size="11px" Width="70px"
                                                                Enabled="false">
                                                                <asp:ListItem>ClientsSelction</asp:ListItem>
                                                                <asp:ListItem>Branch</asp:ListItem>
                                                                <asp:ListItem>Group</asp:ListItem>
                                                                <asp:ListItem>Scrips</asp:ListItem>
                                                                <asp:ListItem>Segment</asp:ListItem>
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
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td style="display: none;">
                        <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="150px"></asp:TextBox>
                        <asp:Button ID="btnhide" runat="server" Text="btnhide" OnClick="btnhide_Click" />
                        <asp:HiddenField ID="HiddenField_Group" runat="server" />
                        <asp:HiddenField ID="HiddenField_Branch" runat="server" />
                        <asp:HiddenField ID="HiddenField_Client" runat="server" />
                        <asp:HiddenField ID="HiddenField_Scrips" runat="server" />
                        <asp:HiddenField ID="HiddenField_Segment" runat="server" />
                        <asp:HiddenField ID="hiddencount" runat="server" />
                        <asp:HiddenField ID="HiddenField_emmail" runat="server" />
                        <asp:DropDownList ID="cmb" runat="server" Font-Size="10px" Width="300px" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            
        </div>
        <!--New Export and Batch HTML-->
        
        <table>
            <tr>
                <td class="gridcellleft" bgcolor="#B7CEEC">
                    Report Type :</td>
                <td>
                    <dxe:ASPxComboBox ID="CmbGenerate" runat="server" ClientInstanceName="cCmbGenerate"
                        EnableIncrementalFiltering="True" Font-Size="10px" SelectedIndex="0" ValueType="System.String"
                        Width="200px">
                        <Items>
                            <dxe:ListEditItem Text="Export Detail Report" Value="1" />
                            <dxe:ListEditItem Text="Export Batch Report" Value="2" />
                            <dxe:ListEditItem Text="Export Batch" Value="3" />
                        </Items>
                        <ClientSideEvents SelectedIndexChanged="function(s,e){ExportBatchSetting(cCmbGenerate.GetValue())}" />
                    </dxe:ASPxComboBox>
                </td>
            </tr>
            <tr id="tr_BSERow" runat="server">
                <td class="gridcellleft" bgcolor="#B7CEEC">
                    Action For Previous Submitted Record (if Any) :</td>
                <td>
                    <dxe:ASPxComboBox ID="CmbAction" runat="server" ClientInstanceName="cCmbAction"
                        EnableIncrementalFiltering="True" Font-Size="10px" SelectedIndex="0" ValueType="System.String"
                        Width="200px">
                        <Items>
                            <dxe:ListEditItem Text="Delete" Value="D" />
                            <dxe:ListEditItem Text="Update" Value="U" />
                        </Items>
                    </dxe:ASPxComboBox>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td id="Td_Export" style="height: 30px">
                    <dxe:ASPxButton ID="aBtnExcel" runat="server" AutoPostBack="False" ClientInstanceName="cBtnExcel"
                        Text="Export To Excel">
                        <ClientSideEvents Click="function(s,e){GnrcCallBackPanel_Methods('Export');}" />
                    </dxe:ASPxButton>
                </td>
            </tr>
            <tr>
                <td id="Td_Batch" style="display: none">
                    <table>
                        <tr>
                            <td>
                                <dxe:ASPxButton ID="Abtn_BatchCreate" runat="server" AutoPostBack="False" ClientInstanceName="cBatchCreate"
                                    Text="Create Batch">
                                    <ClientSideEvents Click="function(s,e){GnrcCallBackPanel_Methods('Batch');}" />
                                </dxe:ASPxButton>
                            </td>
                        </tr>
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC" id="Td1">
                                <asp:CheckBox ID="chkBatch" runat="server" onclick="chkBatch_Checked(this)" />
                                Show Created Batch Detail
                            </td>
                            <td>
                                <dxe:ASPxDateEdit ID="DTBatch" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                    Font-Size="10px" Width="150px" ClientInstanceName="DTBatch">
                                    <DropDownButton Text="For Date">
                                    </DropDownButton>
                                </dxe:ASPxDateEdit>
                            </td>
                            <td>
                                <dxe:ASPxButton ID="Abtn_BatchInfo" runat="server" AutoPostBack="False" ClientInstanceName="cBatchInfo"
                                    Text="Show">
                                    <ClientSideEvents Click="function(s,e){OnMoreInfoClick();}" />
                                </dxe:ASPxButton>
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
            <asp:Button ID="btnExcelExport" runat="server" BackColor="#DDECFE" BorderStyle="None"
                OnClick="btnExcelExport_Click" />
            <asp:Button ID="btnBatchExport" runat="server" BackColor="#DDECFE" BorderStyle="None"
                OnClick="btnBatchExport_Click" />
            <asp:Button ID="btnNBatchExport" runat="server" BackColor="#DDECFE" BorderStyle="None"
                OnClick="btnNBatchExport_Click" />
        </div>
        
        <!--End New Export and Batch HTML-->
    </form>
    
</body>
</html>

