<%@ page language="C#" autoeventwireup="true" inherits="ObligationStatementFO_Int, App_Web_njtlujlb" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>F& O Obligation/Margin Statement</title>
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
    var inProcSelction="";
    function Page_Load()///Call Into Page Load
            {
                 Hide('td_dtfrom');
                 Hide('td_dtto');
                 Hide('showFilter');
                 Hide('tr_filter'); 
                 Hide('Tr_Broker');
                 Show('td_btnprint');
                 Hide('td_sendMail');
                 Hide('TR_OPTIONFORMAIL');
                 Hide('td_excel');
                 document.getElementById('td_bothside').style.display = 'inline';
                 document.getElementById('tr_hdrall').style.display = 'inline';
                 document.getElementById('tr_ftrall').style.display = 'inline';
                 document.getElementById('td_hdr').style.display = 'none';
                 document.getElementById('td_footer').style.display = 'none';
                 Hide('btnRefresh');
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
           // window.frameElement.width = document.body.scrollwidth;
        }
    function Hide(obj)
            {
             document.getElementById(obj).style.display='none';
            }
    function Show(obj)
            {
             document.getElementById(obj).style.display='inline';
            }
     function  fn_ddldateChange(obj)
       {
            if(obj=='0')
            {
                Show('td_dtfor');
                Hide('td_dtfrom');
                Hide('td_dtto');
              

            }
            else
            {
                Hide('td_dtfor');
                Show('td_dtfrom');
                Show('td_dtto');
                
                 
            }
            selecttion();
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
          
          ajax_showOptions(objID,objListFun,objEvent,cmbVal);

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
   
   function RBShowHide(obj) {
             if(obj=='rbPrint')
                 {
                     Show('td_btnprint');
                     Hide('td_excel');
                     document.getElementById('td_bothside').style.display = 'inline';
                     document.getElementById('tr_hdrall').style.display = 'inline';
                     document.getElementById('tr_ftrall').style.display = 'inline';
                     document.getElementById('td_hdr').style.display = 'none';
                     document.getElementById('td_footer').style.display = 'none';
                     Hide('td_sendMail');
                     Hide('TR_OPTIONFORMAIL');
                 }
             else if(obj=='rbMail')
                 {
                     Hide('td_btnprint');
                     Hide('td_excel');
                     document.getElementById('td_bothside').style.display = 'none';
                     document.getElementById('tr_hdrall').style.display = 'inline';
                     document.getElementById('tr_ftrall').style.display = 'inline';
                     document.getElementById('td_hdr').style.display = 'none';
                     document.getElementById('td_footer').style.display = 'none';
                     Show('td_sendMail');
                     Show('TR_OPTIONFORMAIL');
                 }
             else if(obj=='rbExcel')
                 {
                     Show('td_excel');
                     Hide('td_btnprint');
                     document.getElementById('td_bothside').style.display = 'none';
                     document.getElementById('tr_hdrall').style.display='none';
                     document.getElementById('tr_ftrall').style.display='none';
                     Hide('td_sendMail');
                     Hide('TR_OPTIONFORMAIL');
                 }
             else
                 {
                     Hide('td_btnprint');
                     document.getElementById('td_bothside').style.display = 'none';
                     document.getElementById('tr_hdrall').style.display='none';
                     document.getElementById('tr_ftrall').style.display='none';
                 }
                 Hide('showFilter');
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
        function ChkCheckProperty(obj,objChk)
        {
        
            if(objChk==true)
            {
                if(obj=='H')
                    document.getElementById('tdHeader').style.display='inline';
                else if(obj=='F')
                    document.getElementById('tdfooter').style.display='inline';
            }
            else
            {
                if(obj=='H')
                    document.getElementById('tdHeader').style.display='none';
                else if(obj=='F')
                     document.getElementById('tdfooter').style.display='none';
            }
        }
        
         function FunHeaderFooter(objID,objListFun,objEvent,objParam)
        {
            ajax_showOptions(objID,objListFun,objEvent,objParam);
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
  function Display()
  {
    Show('displayAll');
    Hide('tab2')
    Show('tr_filter');
    Hide('showFilter');
    Hide('Td_DateDisply');
    height();
  }
  function DisplayLedger()
  {
    Show('displayAll');
    Hide('tab2')
    Hide('tr_filter');
    Hide('showFilter');
    Hide('tr_group');
    Hide('tr_prvnxt');
    Hide('Td_DateDisply');
    height();
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
  function DisableBtn()
  {
    Show('btnRefresh');
    Hide('btnprint');
    Hide('btnSend');
    Hide('btnExcel');
    
  }
  function PageReLoad()
    {
        Hide('btnRefresh');
        Show('btnprint');
        Show('btnSend');
        Show('btnExcel');
    }
  function DisableC(obj)
        {
            if(obj=='P')
            {
                Hide('lnkPrev');
                Show('lnkNext');
            }
            else
            {
                Show('lnkPrev');
                Hide('lnkNext');
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


            function DateCompare() {



                dtColleterate.SetDate(new Date(dtfor.GetDate()));

               // alert('Hi');

//      var x = document.getElementById("dtfor_I").value;
//     $('#dtColleterate_I').val(x);
  
     }
   


//-----------------------------------------------
     
     function EmailNotFound(obj)
     {  
        var Emails=document.getElementById("hdnEmailNotFound").value;
        alert('Email not Found!!!\n'+Emails);
        Page_Load();
        
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
                        <strong><span id="SpanHeader" style="color: #000099">F& O Obligation/Margin Statement</span></strong></td>
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
                            <tr valign="top">
                                <td>
                                    <table border="10" cellpadding="1" cellspacing="1">
                                        <tr valign="top">
                                            <td class="gridcellleft">
                                                <asp:DropDownList ID="ddldate" runat="server" Width="100px" Font-Size="10px" onchange="fn_ddldateChange(this.value)">
                                                    <asp:ListItem Value="0">For a Date</asp:ListItem>
                                                    <asp:ListItem Value="1">For a Period</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td id="td_dtfor" class="gridcellleft">
                                                <dxe:ASPxDateEdit ID="dtfor" runat="server" EditFormat="Custom" UseMaskBehavior="True" 
                                                    Font-Size="10px" Width="108px" ClientInstanceName="dtfor">
                                                    <dropdownbutton text="For">
                                                </dropdownbutton>
                                                 <ClientSideEvents DateChanged="function(s,e){DateCompare();}" />
                                                  <%--<clientsideevents datechanged="function(s,e){DateCompare();}"></clientsideevents>--%>
                                                </dxe:ASPxDateEdit>
                                            </td>
                                            <td id="td_dtfrom" class="gridcellleft">
                                                <dxe:ASPxDateEdit ID="dtfrom" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                    Font-Size="10px" Width="108px" ClientInstanceName="dtfrom">
                                                    <dropdownbutton text="From">
                                                </dropdownbutton>
                                                </dxe:ASPxDateEdit>
                                            </td>
                                            <td id="td_dtto" class="gridcellleft">
                                                <dxe:ASPxDateEdit ID="dtto" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                    Font-Size="10px" Width="108px" ClientInstanceName="dtto">
                                                    <dropdownbutton text="To">
                                                </dropdownbutton>
                                                </dxe:ASPxDateEdit>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            
                            
                             <%-- --------------- Colleterate Valuation Date Start ----------------------------%>
                            
                            <tr>
                            
                            <td>
                            
                           <table border="10" cellpadding="1" cellspacing="1">
                            
                            <tr>
                            
                            <td>
                            
                            Colleteral Valuation Date &nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                                <td id="td_Colleterate" class="gridcellleft">
                                    <dxe:ASPxDateEdit ID="dtColleterate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                        Font-Size="10px" Width="108px" ClientInstanceName="dtColleterate">
                                        <dropdownbutton text="">
                                                </dropdownbutton>
                                    </dxe:ASPxDateEdit>
                                </td>
                            
                            </tr>
                            
                            </table>
                            </td>
                          
                            
                           
                            
                           
                            </tr>
                            
                            
                           <%-- ---------------Colleterate Valuation Date End----------------------------%>
                            
                            
                            <tr id="tr_Segment">
                                <td>
                                    <table border="10" cellpadding="1" cellspacing="1">
                                        <tr>
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                Segment :</td>
                                            <td>
                                                <asp:RadioButton ID="rdbSegmentAll" runat="server" GroupName="b" onclick="Segment('a')" />All
                                            </td>
                                            <td>
                                                <asp:RadioButton ID="rdbSegmentSelected" Checked="true" runat="server" GroupName="b" onclick="Segment('s')" />Selected
                                                <span id="litSegmentMain" runat="server" style="color: Maroon"></span>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table border="10" cellpadding="1" cellspacing="1">
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
                                            <td class="gridcellleft" bgcolor="#B7CEEC" colspan="4">
                                                <asp:CheckBox ID="ChkCollateralDeposit" runat="server" />
                                                Generate For Client Without Position
                                                <br />
                                                But Having Collateral Deposit
                                            </td>
                                        </tr>
                                        <%--New Work 24/05/2024--%>
                                        <tr>
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                <asp:CheckBox ID="chkConvBal" runat="server" />Do Not Print Ledger Account Balances
                                            </td>
                                        </tr>
                                        <%--End of New Work 24/05/2024--%>
                                    </table>
                                </td>
                            </tr>
                            <tr id="tr_hdrall">
                                <td colspan="2">
                                    <table>
                                        <tr>
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                Use Header :
                                            </td>
                                            <td id="td_hdr" runat="server">
                                                <asp:CheckBox ID="chkHeader" runat="server" onclick="ChkCheckProperty('H',this.checked);" />
                                            </td>
                                            <td id="tdHeader" runat="server">
                                                <asp:TextBox ID="txtHeader" runat="server" Width="279px" Font-Size="10px" onkeyup="FunHeaderFooter(this,'GetHeaderFooter',event,'H')"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <table>
                                        <tr id="tr_ftrall">
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                Use Footer :
                                            </td>
                                            <td id="td_footer" runat="server">
                                                <asp:CheckBox ID="chkFooter" runat="server" onclick="ChkCheckProperty('F',this.checked);" />
                                            </td>
                                            <td id="tdfooter">
                                                <asp:TextBox ID="txtFooter" runat="server" Width="279px" Font-Size="10px" onkeyup="FunHeaderFooter(this,'GetHeaderFooter',event,'F')"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="gridcellleft" id="td_email">
                                    <asp:RadioButton ID="rbPrint" Checked="true" runat="server" GroupName="f" onclick="RBShowHide(this.value)" />Print
                                    <asp:RadioButton ID="rbMail" runat="server" GroupName="f" onclick="RBShowHide(this.value)" />Send Mail
                                    <asp:RadioButton ID="rbExcel" runat="server" GroupName="f" onclick="RBShowHide(this.value)" />Excel
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
                                                    <asp:ListItem>Clients</asp:ListItem>
                                                    <asp:ListItem>Broker</asp:ListItem>
                                                    <asp:ListItem>Branch</asp:ListItem>
                                                    <asp:ListItem>Group</asp:ListItem>
                                                    <asp:ListItem>BranchGroup</asp:ListItem>
                                                    <asp:ListItem>MAILEMPLOYEE</asp:ListItem>
                                                    <asp:ListItem>Segment</asp:ListItem>
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
                    <td id="Td_DateDisply">
                        <table>
                            <tr>
                                <td>
                                    <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                                        <ContentTemplate>
                                            <div id="DivDateDisply" runat="server">
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table>
                <tr id="td_bothside">
                    <td>
                        <table border="10" cellpadding="1" cellspacing="1">
                            <%--New Work 09/01/2023--%>
                            <tr>
                                <td class="gridcellleft" bgcolor="#B7CEEC">
                                    <asp:CheckBox ID="chkShowSummary" runat="server" />Show Summarized Trades
                                </td>
                            </tr>
                            <%--End of New Work 09/01/2023--%>
                            <tr>
                                <td class="gridcellleft" bgcolor="#B7CEEC">
                                    <asp:CheckBox ID="chkBothPrint" runat="server" />Both Side Print
                                </td>
                            </tr>
                            <tr>
                                <td class="gridcellleft" bgcolor="#B7CEEC">
                                    <asp:CheckBox ID="CHKLOGOPRINT" runat="server" />
                                    Do Not Print Logo</td>
                            </tr>
                            <tr>
                                <td class="gridcellleft" bgcolor="#B7CEEC">
                                    <asp:CheckBox ID="ChkDISTRIBUTION" runat="server" Checked="true" />
                                    Distribution Copy</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td id="td_btnprint">
                        <asp:Button ID="btnprint" runat="server" CssClass="btnUpdate" Text="Print" Width="100px"
                            OnClientClick="DisableBtn()" OnClick="btnprint_Click" />
                    </td>
                    <td>
                        <input type="button" id="btnRefresh" class="btnUpdate" onclick="PageReLoad()" value="Please Wait for Result then Click to Refresh!!!" />
                    </td>
                </tr>
                <tr id="TR_OPTIONFORMAIL">
                    <td>
                        <table border="10" cellpadding="1" cellspacing="1">
                            <tr>
                                <td class="gridcellleft" bgcolor="#B7CEEC">
                                    Respective :</td>
                                <td>
                                    <asp:DropDownList ID="ddloptionformail" runat="server" Width="100px" Font-Size="10px"
                                        onchange="fnddloptionformail(this.value)">
                                        <asp:ListItem Value="0">Client</asp:ListItem>
                                        <asp:ListItem Value="1">Group/Branch</asp:ListItem>
                                        <asp:ListItem Value="2">User</asp:ListItem>
                                    </asp:DropDownList></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="td_sendMail">
                    <td>
                        <asp:Button ID="btnSend" runat="server" CssClass="btnUpdate" Text="Send Email" Width="100px"
                            OnClientClick="DisableBtn()" OnClick="btnSendEmail_Click" />
                    </td>
                </tr>
                <tr id="td_excel">
                    <td>
                        <asp:Button ID="btnExcel" runat="server" CssClass="btnUpdate" Text="Excel" Width="100px"
                            OnClientClick="DisableBtn()" OnClick="btnExcel_Click" />
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td style="display: none;">
                        <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="150px"></asp:TextBox>
                        <asp:Button ID="btnhide" runat="server" Text="Button" OnClick="btnhide_Click" />
                        <asp:HiddenField ID="txtHeader_hidden" runat="server" />
                        <asp:HiddenField ID="txtFooter_hidden" runat="server" />
                        <asp:HiddenField ID="HiddenField_Group" runat="server" />
                        <asp:HiddenField ID="HiddenField_Branch" runat="server" />
                        <asp:HiddenField ID="HiddenField_Client" runat="server" />
                        <asp:HiddenField ID="HiddenField_Broker" runat="server" />
                        <asp:HiddenField ID="HiddenField_emmail" runat="server" />
                        <asp:HiddenField ID="HiddenField_BranchGroup" runat="server" />
                        <asp:HiddenField ID="hdnEmailNotFound" runat="server" />
                        <asp:HiddenField ID="HiddenField_Segment" runat="server" />
                    </td>
                </tr>
            </table>
           
        </div>
    </form>
</body>
</html>