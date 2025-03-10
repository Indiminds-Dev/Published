<%@ page language="C#" autoeventwireup="true" inherits="management_AGEINGANALYSIS, App_Web_d3reltht" %>


<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>Ageing Analysis</title>
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
	.grid_scroll
    {
        overflow-y: scroll;  
        overflow-x: scroll; 
        width:80%;
        scrollbar-base-color: #C0C0C0;
    
    }
	form{
		display:inline;
	}
	

	</style>
 <script language="javascript" type="text/javascript">

  
    function Page_Load()///Call Into Page Load
            {
                 Hide('showFilter');
                 Hide('td_filter');
                 document.getElementById('hiddencount').value=0;
                 txtnoofcolumns.SetValue('8');
                 txtAgegroupdays.SetValue('90');
                 txtdebit.SetValue('0.0');
                 querySt();
                 FnddlGeneration('1');
                 height();
            }
     function querySt()
     {
       if(window.location.search.substring(1)=='CLIENTS=ALL')
       {
           Show('Tr_GroupBy');
           Show('Tr_Clients');
           Show('Td_SegSelected');
           Show('Tr_HairCut');
           Show('Tr_ShowColumn');
       }
       else
       {
           Hide('Tr_GroupBy');
           Hide('Tr_Clients');
           Hide('Td_SegSelected');
           Hide('Tr_HairCut');
           Hide('Tr_ShowColumn');
       }
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
        function fnInstrument(obj)
        {
             if(obj=="a")
                Hide('showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='Product';
                  Show('showFilter');
             }
             selecttion();
        }
      
        function fnSegment(obj)
        {
             if(obj=="a")
             {
                Hide('showFilter');
              }
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='Segment';
                  Show('showFilter');
             }
             selecttion();
        }
      function fnBranch(obj)
      {
            if(obj=="a")
                Hide('showFilter');
             else
             {
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
         selecttion();
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
        if(obj=="0" || obj=="2")
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
       selecttion();
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
      selecttion();
   }
    function fnRecord(obj,colcount)
    {
       if(obj=="1")
       {
            Hide('td_filter');
            Show('tab1');
            Hide('displayAll');
            Hide('showFilter');
            alert('No Record Found!!');
       } 
       if(obj=="2")
       {
            Show('td_filter');
            Hide('tab1');
            Show('displayAll');
            Hide('showFilter');
            Show('tr_prvnxt');
           
       }
       if(obj=="3")
       {
            Hide('td_filter');
            Show('tab1');
            Hide('displayAll');
            Hide('showFilter');
           
       } 
       if(obj=="4")
       {
            Hide('td_filter');
            Show('tab1');
            Hide('displayAll');
            Hide('showFilter');
            alert('User Email Id Not Found!!');
       }  
        if(obj=='5' || obj=='6' || obj=='7')
        {
            Show('tab1');
            Hide('displayAll');
            Hide('td_filter');
           
            if(obj=='7')
            alert("Mail Sent Successfully !!");
            if(obj=='5')
             alert("Error on sending!Try again.. !!");
            if(obj=='6')
             alert("'Mail Sent Successfully !!'+'\n'+'Emails not Sent For Clients Without Email-Id ...'");
            FnddlGeneration('3'); 
            document.getElementById('hiddencount').value=0;
            
        }   
        document.getElementById('hiddencount').value=0;  
        if(colcount>9)
        {
            document.getElementById('Divdisplay').className="grid_scroll";    
        }
        height();
        selecttion();
    }
   
  function FnddlGeneration(obj)
  {
    if(obj=="1")
    {
        Show('td_Screen');
        Hide('td_Export');
        Hide('td_SendMail');
        Hide('Tr_EmailType');
    }
    if(obj=="2")
    {
        Hide('td_Screen');
        Show('td_Export');
        Hide('td_SendMail');
        Hide('Tr_EmailType');
    }
    if(obj=="3")
    {
        Hide('td_Screen');
        Hide('td_Export');
        Show('td_SendMail');
        Show('Tr_EmailType');
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
  function selecttion()
  {
     var combo=document.getElementById('cmbExport');
     combo.value='Ex';
  } 

    FieldName='lstSlection';
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
                if(j[0]=='Clients')
                {
                    document.getElementById('HiddenField_Client').value = j[1];
                } 
                if(j[0]=='BranchGroup')
                {
                    document.getElementById('HiddenField_BranchGroup').value = j[1];
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
                    <strong><span id="SpanHeader" style="color: #000099">Ageing Analysis</span></strong></td>

              <td class="EHEADER" width="15%" id="td_filter" style="height: 22px">
                    <a href="javascript:void(0);" onclick="fnRecord(3,0);"><span style="color: Blue; text-decoration: underline;
                        font-size: 8pt; font-weight: bold">Filter</span></a>
                 <asp:DropDownList ID="cmbExport" runat="server" AutoPostBack="True" Font-Size="10px" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged">
                        <asp:ListItem Selected="True" Value="Ex">Export</asp:ListItem>
                        <asp:ListItem Value="E">Excel</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <table id="tab1" border="0" cellpadding="0" cellspacing="0">
            <tr valign="top">
                <td valign="top">
                    <table>
                        <tr>
                            <td valign="top">
                                <table>
                                    <tr >
                                        <td class="gridcellleft" valign="top">
                                            <table border="10" cellpadding="1" cellspacing="1">
                                                <tr id="Tr_GroupBy">
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
                                                                    <asp:RadioButton ID="rdbranchAll" runat="server" Checked="True" GroupName="a" onclick="fnBranch('a')" />
                                                                    All
                                                                </td>
                                                                <td>
                                                                    <asp:RadioButton ID="rdbranchSelected" runat="server" GroupName="a" onclick="fnBranch('b')" />Selected
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
                                                <tr id="Tr_Clients">
                                                    <td colspan="4">
                                                        <table border="10" cellpadding="1" cellspacing="1">
                                                            <tr>
                                                                <td class="gridcellleft" bgcolor="#B7CEEC">
                                                                    Clients :</td>
                                                                <td>
                                                                    <asp:RadioButton ID="rdbClientALL" runat="server" Checked="True" GroupName="c" onclick="fnClients('a')" />
                                                                    All
                                                                </td>
                                                                <td>
                                                                    <asp:RadioButton ID="rdPOAClient" runat="server" GroupName="c" onclick="fnClients('a')" />POA
                                                                </td>
                                                                <td>
                                                                    <asp:RadioButton ID="rdbClientSelected" runat="server" GroupName="c" onclick="fnClients('b')" />
                                                                    Selected
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr id="Tr_Segment">
                                                    <td colspan="4">
                                                        <table border="10" cellpadding="1" cellspacing="1">
                                                            <tr>
                                                                <td class="gridcellleft" bgcolor="#B7CEEC">
                                                                    Segment :</td>
                                                                <td>
                                                                    <asp:RadioButton ID="rdbSegmentAll" runat="server" GroupName="ab"
                                                                        onclick="fnSegment('a')" />All
                                                                </td>
                                                                <td>
                                                                    <asp:RadioButton ID="rdbSegmentCurrent" runat="server" GroupName="ab"  Checked="True" onclick="fnSegment('a')" />Currenct
                                                                </td>
                                                                <td>
                                                                   [ <span id="litSegmentMain" runat="server" style="color: Maroon"></span> ]
                                                                </td>
                                                                <td id="Td_SegSelected">
                                                                    <asp:RadioButton ID="rdbSegmentSelected" runat="server" GroupName="ab" onclick="fnSegment('b')" />Selected
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td valign="top" colspan="4">
                                                        <table border="10" cellpadding="1" cellspacing="1">
                                                            <tr>
                                                                <td class="gridcellleft" bgcolor="#B7CEEC">
                                                                    Balance Type :</td>
                                                                <td>
                                                                    <asp:DropDownList ID="dllbalnType" runat="server" Width="100px" Font-Size="10px">
                                                                        <asp:ListItem Value="Debit">Debit</asp:ListItem>
                                                                        <asp:ListItem Value="Credit">Credit</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr id="Tr_HairCut"><td  valign="top" colspan="4">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            <asp:CheckBox ID="ChkApplyHaircut" runat="server" />
                                            Apply Haircut
                                        </td>
                                    </tr>
                                </table>
                            </td></tr>
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
                                            <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="150px" onkeyup="FunClientScrip(this,'ShowClientFORMarginStocks',event)"></asp:TextBox><asp:DropDownList ID="cmbsearchOption" runat="server" Font-Size="11px" Width="70px"
                                                Enabled="false">
                                                <asp:ListItem>Clients</asp:ListItem>
                                                <asp:ListItem>Branch</asp:ListItem>
                                                <asp:ListItem>Group</asp:ListItem>
                                                <asp:ListItem>BranchGroup</asp:ListItem>
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
            <tr>
                <td valign="top">
                    <table>
                        <tr>
                            <td class="gridcellleft" valign="top">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            As on a Date :</td>
                                        <td>
                                            <dxe:ASPxDateEdit ID="dtFor" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                Font-Size="10px" Width="108px" ClientInstanceName="dtfor">
                                                <dropdownbutton text="For">
                                                    </dropdownbutton>
                                            </dxe:ASPxDateEdit>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td class="gridcellleft" id="td_Account" valign="top">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Account :</td>
                                        <td>
                                            <asp:DropDownList ID="ddlAccount" runat="server" Width="250px" Font-Size="10px">
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
                <td>
                    <table>
                        <tr>
                            <td class="gridcellleft">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Age Group Days :</td>
                                        <td>
                                            <dxe:ASPxTextBox ID="txtAgegroupdays" runat="server" HorizontalAlign="Right" Width="50px">
                                                <masksettings mask="&lt;1..99g&gt;" includeliterals="DecimalSymbol" />
                                                <validationsettings errordisplaymode="None">
                                                    </validationsettings>
                                            </dxe:ASPxTextBox>
                                        </td>
                                        <td>
                                            (From 3 to 90 days)</td>
                                    </tr>
                                </table>
                            </td>
                            <td class="gridcellleft">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Number Of Columns :</td>
                                        <td>
                                            <dxe:ASPxTextBox ID="txtnoofcolumns" runat="server" HorizontalAlign="Right" Width="50px">
                                                <masksettings mask="&lt;1..8g&gt;" includeliterals="DecimalSymbol" />
                                                <validationsettings errordisplaymode="None">
                                                    </validationsettings>
                                            </dxe:ASPxTextBox>
                                        </td>
                                        <td>
                                            (From 1 to 8 Columns)</td>
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
                            <td class="gridcellleft">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Clients Having Current Debit/Credit >=
                                        </td>
                                        <td>
                                            <dxe:ASPxTextBox ID="txtdebit" runat="server" HorizontalAlign="Right" Width="100px">
                                                <masksettings mask="&lt;0..9999999999g&gt;" includeliterals="DecimalSymbol" />
                                                <validationsettings errordisplaymode="None">
                                                     </validationsettings>
                                            </dxe:ASPxTextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td class="gridcellleft" valign="top">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Age Group Calculation Basis :</td>
                                        <td>
                                            <asp:DropDownList ID="DdlAgeGroupCalBasis" runat="server" Width="200px" Font-Size="10px">
                                                <asp:ListItem Value="Net">Net Debit/Credit</asp:ListItem>
                                                <asp:ListItem Value="Running">Running Debit/Credit</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr id="Tr_ShowColumn">
                <td>
                    <table>
                        <tr >
                            <td class="gridcellleft" valign="top">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Show Cloumns :
                                        </td>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:CheckBox ID="CHKMRGNDEP" runat="server" />
                                                        Margin Dep.</td>
                                                    <td>
                                                        <asp:CheckBox ID="CHKSTOCKS" runat="server" />
                                                        Collateral</td>
                                                    <td>
                                                        <asp:CheckBox ID="CHKDP" runat="server" />
                                                        Consider POA Holding</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:CheckBox ID="ChkPendingPurchase" runat="server" />
                                                        Pending Purchase</td>
                                                    <td colspan="2">
                                                        <asp:CheckBox ID="ChkPendingSales" runat="server" />
                                                        Pending Sales</td>
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
                            <td class="gridcellleft">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Generate Type :</td>
                                        <td>
                                            <asp:DropDownList ID="ddlGeneration" runat="server" Width="100px" Font-Size="10px"
                                                onchange="FnddlGeneration(this.value)">
                                                <asp:ListItem Value="1">Screen</asp:ListItem>
                                                <asp:ListItem Value="2">Export</asp:ListItem>
                                                <asp:ListItem Value="3">Send Mail</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                         <tr id="Tr_EmailType" style="display: none;">
                <td class="gridcellleft">
                    <table border="10" cellpadding="1" cellspacing="1">
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Respective :</td>
                            <td>
                                <asp:DropDownList ID="ddloptionformail" runat="server" Width="100px" Font-Size="10px"
                                    onchange="fnddloptionformail(this.value)">
                                    <asp:ListItem Value="1">Group/Branch</asp:ListItem>
                                    <asp:ListItem Value="2">User</asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>
                    </table>
                </td>
            </tr>
                          <tr>
                            <td class="gridcellleft">
                                <table>
                                    <tr>
                                        <td id="td_Screen">
                                            <asp:Button ID="btnScreen" runat="server" CssClass="btnUpdate" Height="20px" Text="Screen"
                                                Width="101px" OnClientClick="selecttion()" OnClick="btnScreen_Click" />
                                        </td>
                                        <td id="td_Export">
                                            <asp:Button ID="btnExcel" runat="server" CssClass="btnUpdate" Height="20px" Text="Export To Excel"
                                                Width="101px" OnClientClick="selecttion()" OnClick="btnExcel_Click"/></td>
                                                
                                                 <td id="td_SendMail">
                                            <asp:Button ID="btnMail" runat="server" CssClass="btnUpdate" Height="20px" Text="Send E-Mail"
                                                Width="101px" OnClientClick="selecttion()" OnClick="btnMail_Click"/></td>
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
                    <asp:HiddenField ID="HiddenField_BranchGroup" runat="server" />
                    <asp:HiddenField ID="HiddenField_Segment" runat="server" />
                    <asp:HiddenField ID="hiddencount" runat="server" />
                     <asp:HiddenField ID="HiddenField_emmail" runat="server" />
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
        <div id="displayAll" style="display: none;" width="100%">
            <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                <ContentTemplate>
                    <table width="100%" border="1">
                    <tr style="display: none;">
                            <td>
                                <asp:DropDownList ID="cmbrecord" runat="server" Font-Size="10px" Width="300px" AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                        </tr>
                           
                        <tr>
                            <td>
                                <div id="DivHeader" runat="server">
                                </div>
                            </td>
                        </tr>
                          <tr bordercolor="Blue" id="tr_prvnxt">
                            <td align="left">
                                <table id="tblpage" cellspacing="0" cellpadding="0" runat="server" width="10%">
                                    <tr>
                                             <td width="20" style="padding: 5px">
                                                 <asp:LinkButton ID="ASPxFirst" runat="server" Font-Bold="True" ForeColor="maroon"
                                                     OnClientClick="javascript:selecttion();;" OnClick="ASPxFirst_Click">First</asp:LinkButton></td>
                                             <td width="25">
                                                 <asp:LinkButton ID="ASPxPrevious" runat="server" Font-Bold="True" ForeColor="Blue"
                                                     OnClientClick="javascript:selecttion();" OnClick="ASPxPrevious_Click">Previous</asp:LinkButton></td>
                                             <td width="20" style="padding: 5px">
                                                 <asp:LinkButton ID="ASPxNext" runat="server" Font-Bold="True" ForeColor="maroon"
                                                     OnClientClick="javascript:selecttion();" OnClick="ASPxNext_Click">Next</asp:LinkButton></td>
                                             <td width="20">
                                                 <asp:LinkButton ID="ASPxLast" runat="server" Font-Bold="True" ForeColor="Blue" OnClientClick="javascript:selecttion();"
                                                     OnClick="ASPxLast_Click">Last</asp:LinkButton></td>
                                             <td align="right" style="display:none;">
                                              
                                             </td>
                                         </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div id="Divdisplay" runat="server">
                                </div>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnScreen" EventName="Click"></asp:AsyncPostBackTrigger>
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </div>
    </form>
</body>
</html>
