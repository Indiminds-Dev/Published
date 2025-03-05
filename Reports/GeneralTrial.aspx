<%@ page language="C#" autoeventwireup="true" inherits="Reports_GeneralTrial, App_Web_hnkxxmul" %>


<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>General Trial </title>
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
                 Hide('td_filter');
                 Hide('Td_OnlyMonthlyBreakUp');
                 Hide('Tr_OnlySubLedgerBreakUp');
                 document.getElementById('hiddencount').value=0;
                 FnDateSelection('1');
                 FnddlGeneration('1');
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
    
      function FunCallAjaxList(objID,objEvent)
        {
               var strQuery_Table = '';
               var strQuery_FieldName = '';
               var strQuery_WhereClause = '';
               var strQuery_OrderBy='';
               var strQuery_GroupBy='';
               var CombinedQuery='';
               
            if(document.getElementById('cmbsearchOption').value=="Company")
            {
               strQuery_Table = "tbl_master_company";
               strQuery_FieldName = "distinct top 10 cmp_Name,cmp_internalid";
               strQuery_WhereClause = " cmp_Name like (\'%RequestLetter%')";
            }
            else if(document.getElementById('cmbsearchOption').value=="ExcludeMainAc")
            {
               strQuery_Table = "Master_MainAccount";
               strQuery_FieldName = "distinct top 10 ltrim(rtrim(MainAccount_Name))+\' [\'+rtrim(MainAccount_AccountCode)+\']\',rtrim(MainAccount_AccountCode)";
               strQuery_WhereClause = " (MainAccount_Name like (\'%RequestLetter%') or MainAccount_AccountCode like (\'%RequestLetter%') or MainAccount_AccountType like (\'%RequestLetter%') ) and MainAccount_SubLedgerType<>'None'";
            }
            else if(document.getElementById('cmbsearchOption').value=="Segment")
            {
               
               strQuery_Table = "(select A.EXCH_INTERNALID AS SEGMENTID ,isnull((TME.EXH_ShortName +\'-'\ + A.EXCH_SEGMENTID),exch_membershipType) AS EXCHANGENAME from (SELECT TMCE.* FROM TBL_MASTER_COMPANYEXCHANGE AS TMCE Where  TMCE.EXCH_COMPID=\'<%=Session["LastCompany"]%>'\) AS A LEFT OUTER JOIN   TBL_MASTER_EXCHANGE AS TME ON TME.EXH_CNTID=A.EXCH_EXCHID)as TAB";
               strQuery_FieldName = "distinct top 10 EXCHANGENAME,SEGMENTID";
               strQuery_WhereClause = " EXCHANGENAME like (\'%RequestLetter%')";
            }
            else if(document.getElementById('cmbsearchOption').value=="Branch")
            {
               strQuery_Table = "tbl_master_branch";
               strQuery_FieldName = "top 10 branch_description+'-'+branch_code,branch_id";
               strQuery_WhereClause = " (branch_description Like (\'%RequestLetter%') or branch_code like (\'%RequestLetter%')) and branch_id in (<%=Session["userbranchHierarchy"]%>)";
            }
            CombinedQuery=new String(strQuery_Table+"$"+strQuery_FieldName+"$"+strQuery_WhereClause+"$"+strQuery_OrderBy+"$"+strQuery_GroupBy);
            ajax_showOptions(objID,'GenericAjaxList',objEvent,replaceChars(CombinedQuery));
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
      function fnBranch(obj)
      {
            if(obj=="a")
                Hide('showFilter');
             else
             {
                 document.getElementById('cmbsearchOption').value='Branch';
                 Show('showFilter');
             }
         selecttion();
      }
    function fnCompany(obj)
      {
        if(obj=="a")
            Hide('showFilter');
         else
         {
            Show('showFilter');
            document.getElementById('cmbsearchOption').value='Company';
         }
         selecttion();
      }
       function fnSegment(obj)
        {
             if(obj=="a")
                Hide('showFilter');
		     else if(obj=="c")
             {
                Hide('showFilter');
                Show('Td_Specific');
             }
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='Segment';
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
    
   
  
    function fnRecord(obj)
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
           
       } 
       if(obj=="3")
       {
            Hide('td_filter');
            Show('tab1');
            Hide('displayAll');
            Hide('showFilter');
           
       }     
        document.getElementById('hiddencount').value=0;  
       
        height();
        selecttion();
    }
   
  function FnddlGeneration(obj)
  {
    if(obj=="1")
    {
        Show('td_Screen');
        Hide('td_Export');
        Hide('td_Pdf');
    }
    if(obj=="2")
    {
        Hide('td_Screen');
        Show('td_Export');
        Hide('td_Pdf');
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
  function selecttion()
  {
     var combo=document.getElementById('cmbExport');
     combo.value='Ex';
  } 
   
   function FnChkBox(obj,objtype)
       {
           if(objtype=='Monthly')
           {
                  if(obj.checked==true)
                   {
                        Show('Tr_AsOnDate');
                        Hide('Tr_Date');
                        Hide('Tr_Period'); 
                        Hide('Td_SubLedger');
                        Show('Td_OnlyMonthlyBreakUp');
                        Hide('Td_DisplayCompanyinColumns'); 
                   }
                   else
                   {
                        Show('Tr_AsOnDate');
                        Show('Tr_Date');
                        Hide('Tr_Period'); 
                        Show('Td_SubLedger');
                        Hide('Td_OnlyMonthlyBreakUp');
                        Show('Td_DisplayCompanyinColumns'); 
                   }
                  Show('Tr_RptStyle');
                  Show('Td_MonthlyBreakUp');
                  Show('Tr_GenerationType');
                  Hide('Tr_OnlySubLedgerBreakUp');
                  FnddlGeneration('1');
           }
           if(objtype=='SubLedger')
           {
                 if(obj.checked==true)
                   {
                        Show('Tr_AsOnDate');
                        Hide('Tr_Date');
                        Hide('Tr_Period'); 
                        Hide('Td_MonthlyBreakUp');
                        Hide('Tr_GenerationType');
                        Hide('Tr_RptStyle');
                        Hide('td_Screen');
                        Show('td_Pdf');
                        Show('td_Export');
                        Show('Td_DisplayCompanyinColumns');   
                        Show('Tr_OnlySubLedgerBreakUp');
                   }
                   else
                   {
                        Show('Tr_AsOnDate');
                        Show('Tr_Date');
                        Hide('Tr_Period'); 
                        Show('Td_MonthlyBreakUp');
                        Show('Tr_GenerationType');
                        Show('Tr_RptStyle');
                        Hide('Tr_OnlySubLedgerBreakUp');
                        Show('Td_DisplayCompanyinColumns'); 
                        FnddlGeneration('1');
                        
                   }
                  Show('Td_SubLedger');
                  Hide('Td_OnlyMonthlyBreakUp');
                  
           }
           
           height();
       }
      function FnDateSelection(obj)
      {
        Show('Tr_Date');
        if(obj=='1')
        {
           Show('Tr_AsOnDate');
           Hide('Tr_Period');
           Show('Td_DisplayCompanyinColumns');    
        }
        else
        {
           Hide('Tr_AsOnDate');
           Show('Tr_Period'); 
           Hide('Td_DisplayCompanyinColumns');   
           
        }
        
      }  
  function FnOnlySubLedgerBreakUp(obj)
   {
      if(obj=="b")
      {
        Show('showFilter');
        document.getElementById('cmbsearchOption').value='ExcludeMainAc';  
      }
      else
        Hide('showFilter');
   }
  function FnReportView(obj)
  {
      if(obj=="1")
      {
        Show('Td_DisplayCompanyinColumns');
        if(document.getElementById('ChkMonthlyBreakUp').checked)  
            Hide('Td_DisplayCompanyinColumns');
        else
            Show('Td_DisplayCompanyinColumns'); 
      }
      else
        Hide('Td_DisplayCompanyinColumns'); 
        
     
      
       
    
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
                    document.getElementById('HiddenField_BranchName').value = j[2];
                }
                if(j[0]=='Segment')
                {
                    document.getElementById('HiddenField_Segment').value = j[1];
                    document.getElementById('HiddenField_SegmentName').value = j[2];
                } 
                if(j[0]=='Company')
                {
                    document.getElementById('HiddenField_Company').value = j[1];
                    document.getElementById('HiddenField_CompanyName').value = j[2];
                }
                if(j[0]=='ExcludeMainAc')
                {
                    document.getElementById('HiddenField_ExcludeMainAc').value = j[1];
                  
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
                    <strong><span id="SpanHeader" style="color: #000099">General Trial </span></strong></td>

              <td class="EHEADER" width="15%" id="td_filter" style="height: 22px">
                    <a href="javascript:void(0);" onclick="fnRecord(3);"><span style="color: Blue; text-decoration: underline;
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
                <td>
                    <table>
                        <tr>
                            <td class="gridcellleft">
                                <table>
                                    <tr>
                                        <td class="gridcellleft">
                                            <table border="10" cellpadding="1" cellspacing="1">
                                                <tr>
                                                    <td class="gridcellleft" bgcolor="#B7CEEC" id="Td_MonthlyBreakUp">
                                                        <asp:CheckBox ID="ChkMonthlyBreakUp" runat="server" onclick="FnChkBox(this,'Monthly')" />
                                                        Show Monthly BreakUp
                                                    </td>
                                                    <td id="Td_OnlyMonthlyBreakUp">
                                                        <table>
                                                            <tr>
                                                                <td class="gridcellleft">
                                                                    <table border="10" cellpadding="1" cellspacing="1">
                                                                        <tr>
                                                                            <td>
                                                                                <asp:RadioButton ID="RdbMonthWiseGross" runat="server" Checked="True" GroupName="m" />
                                                                                Month Wise Gross
                                                                            </td>
                                                                            <td>
                                                                                <asp:RadioButton ID="RdbMonthWiseNet" runat="server" GroupName="m" />Month Wise
                                                                                Net
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td class="gridcellleft" bgcolor="#B7CEEC" id="Td_SubLedger">
                                                        <asp:CheckBox ID="ChkSubLedgerBreakUp" runat="server" onclick="FnChkBox(this,'SubLedger')" />
                                                        Show Sub-Ledger BreakUp
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr id="Tr_Date">
                                        <td class="gridcellleft">
                                            <table border="10" cellpadding="1" cellspacing="1">
                                                <tr>
                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                        Date :
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="DdlDateSelection" runat="server" Width="150px" Font-Size="10px"
                                                            onchange="FnDateSelection(this.value)">
                                                            <asp:ListItem Value="1">As On Date</asp:ListItem>
                                                            <asp:ListItem Value="2">Period</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr id="Tr_Period">
                                        <td class="gridcellleft">
                                            <table border="10" cellpadding="1" cellspacing="1">
                                                <tr>
                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                        For The Period :
                                                    </td>
                                                    <td class="gridcellleft">
                                                        <dxe:ASPxDateEdit ID="DtFrom" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                            Font-Size="10px" Width="108px" ClientInstanceName="DtFrom">
                                                            <dropdownbutton text="From">
                                                </dropdownbutton>
                                                        </dxe:ASPxDateEdit>
                                                    </td>
                                                    <td class="gridcellleft">
                                                        <dxe:ASPxDateEdit ID="DtTo" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                            Font-Size="10px" Width="108px" ClientInstanceName="DtTo">
                                                            <dropdownbutton text="To">
                                                </dropdownbutton>
                                                        </dxe:ASPxDateEdit>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr id="Tr_AsOnDate">
                                        <td class="gridcellleft">
                                            <table border="10" cellpadding="1" cellspacing="1">
                                                <tr>
                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                        As On Date :
                                                    </td>
                                                    <td class="gridcellleft">
                                                        <dxe:ASPxDateEdit ID="DtAsOnDate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                            Font-Size="10px" Width="108px" ClientInstanceName="DtAsOnDate">
                                                            <dropdownbutton text="Date">
                                                </dropdownbutton>
                                                        </dxe:ASPxDateEdit>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr valign="top">
                            <td class="gridcellleft">
                                <table>
                                    <tr>
                                        <td class="gridcellleft">
                                            <table border="10" cellpadding="1" cellspacing="1">
                                                <tr>
                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                        Company :</td>
                                                    <td>
                                                        <asp:RadioButton ID="RdbAllCompany" runat="server" GroupName="a" onclick="fnCompany('a')" />
                                                        All
                                                        <asp:RadioButton ID="RdbCurrentCompany" runat="server" Checked="True" GroupName="a"
                                                            onclick="fnCompany('a')" />
                                                        Current
                                                        <asp:RadioButton ID="RdbSelectedCompany" runat="server" GroupName="a" onclick="fnCompany('b')" />Selected
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
                                                        Segment :</td>
                                                    <td>
                                                        <asp:RadioButton ID="rdbSegmentAll" runat="server" GroupName="b" onclick="fnSegment('a')" />All
                                                    </td>
                                                    <td>
                                                        <asp:RadioButton ID="rdbSegmentSpecific" runat="server" Checked="True" GroupName="b"
                                                            onclick="fnSegment('c')" />Specific
                                                    </td>
                                                    <td>
                                                        [ <span id="litSegmentMain" runat="server" style="color: Maroon"></span>]</td>
                                                    <td id="Td_SegmentSelected">
                                                        <asp:RadioButton ID="rdSegmentSelected" runat="server" GroupName="b" onclick="fnSegment('b')" />Selected
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
                                                        Branch :</td>
                                                    <td>
                                                        <asp:RadioButton ID="RdBranchAll" runat="server" Checked="True" GroupName="c" onclick="fnBranch('a')" />
                                                        All
                                                    </td>
                                                    <td>
                                                        <asp:RadioButton ID="RdBranchSelected" runat="server" GroupName="c" onclick="fnBranch('b')" />Selected
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
                                                        Report View :</td>
                                                    <td>
                                                        <asp:DropDownList ID="DdlrptView" runat="server" Width="200px" Font-Size="10px"  onchange="FnReportView(this.value)">
                                                            <asp:ListItem Value="1">Company Wise</asp:ListItem>
                                                            <asp:ListItem Value="2">Consolidated-Company Wise</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td class="gridcellleft" bgcolor="#B7CEEC" id="Td_DisplayCompanyinColumns">
                                                        <asp:CheckBox ID="ChkCompanyColumns" runat="server" />
                                                       Display Company in Columns
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr id="Tr_RptStyle">
                                        <td class="gridcellleft">
                                            <table border="10" cellpadding="1" cellspacing="1">
                                                <tr>
                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                        Report Style :</td>
                                                    <td>
                                                        <asp:DropDownList ID="DdlrptStyle" runat="server" Width="200px" Font-Size="10px">
                                                            <asp:ListItem Value="1">Account Head Wise</asp:ListItem>
                                                            <asp:ListItem Value="2">Account Group Wise</asp:ListItem>
                                                            <asp:ListItem Value="3">Account Group+Head Wise</asp:ListItem>
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
                                                        <asp:CheckBox ID="ChkZeroAmntAc" runat="server" />
                                                        Show Zero Amount Account
                                                    </td>
                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                        <asp:CheckBox ID="ChkConvtToBaseCurrency" runat="server" />
                                                        Convert To Base Currency
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        
                                    </tr>
                                   <tr id="Tr_OnlySubLedgerBreakUp"><td class="gridcellleft"> <table border="10" cellpadding="1" cellspacing="1">
                                           <tr>
                                               <td bgcolor="#B7CEEC">
                                                   <asp:RadioButton ID="RdbSubLedgerBreakUpDefault" runat="server" Checked="true" GroupName="ss" onclick="FnOnlySubLedgerBreakUp('a')"/>
                                                   
                                               </td>
                                               <td bgcolor="#B7CEEC">Show SubLedger BreakUp For All Accounts</td>
                                           </tr>
                                           <tr>
                                               <td bgcolor="#B7CEEC">
                                                   <asp:RadioButton ID="RdbSubLedgerBreakUpDays" runat="server" GroupName="ss" onclick="FnOnlySubLedgerBreakUp('a')"/>
                                               </td>
                                               <td bgcolor="#B7CEEC">
                                                   Do Not Show SubLedger BreakUp For Accounts More Than
                                               </td>
                                               <td bgcolor="#B7CEEC" valign="top">
                                                   <dxe:ASPxTextBox ID="TxtShowUnclearedformorethan" runat="server" HorizontalAlign="Right"
                                                       Width="50px">
                                                       <masksettings mask="&lt;0..9999999999g&gt;" includeliterals="DecimalSymbol" />
                                                       <validationsettings errordisplaymode="None"></validationsettings>
                                                   </dxe:ASPxTextBox></td>
                                               <td bgcolor="#B7CEEC">
                                                   items</td>
                                           </tr>
                                           <tr>
                                               <td bgcolor="#B7CEEC">
                                                   <asp:RadioButton ID="RdbSubLedgerBreakUpFollowingClients" runat="server" GroupName="ss" onclick="FnOnlySubLedgerBreakUp('b')"/>
                                               </td>
                                               <td bgcolor="#B7CEEC" colspan="3">
                                                   Do Not Show Sub-Ledger BreakUp for following Accounts
                                               </td>
                                           </tr>
                                       </table></td></tr>
                                    <tr id="Tr_GenerationType">
                                        <td class="gridcellleft">
                                            <table border="10" cellpadding="1" cellspacing="1">
                                                <tr>
                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                        Generate Type :</td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlGeneration" runat="server" Width="200px" Font-Size="10px"
                                                            onchange="FnddlGeneration(this.value)">
                                                            <asp:ListItem Value="1">Screen</asp:ListItem>
                                                            <asp:ListItem Value="2">Export</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
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
                                                            Width="101px" OnClientClick="selecttion()" OnClick="btnExcel_Click" /></td>
                                                  <td id="td_Pdf">
                                                        <asp:Button ID="BtnPdf" runat="server" CssClass="btnUpdate" Height="20px" Text="Export To PDF"
                                                            Width="101px" OnClientClick="selecttion()" OnClick="BtnPdf_Click" /></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table border="10" cellpadding="1" cellspacing="1" id="showFilter">
                                    <tr>
                                        <td class="gridcellleft" style="vertical-align: top; text-align: right; height: 21px;"
                                            id="TdFilter">
                                            <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="150px" onkeyup="FunCallAjaxList(this,event)"></asp:TextBox>
                                            <asp:DropDownList ID="cmbsearchOption" runat="server" Font-Size="11px" Width="70px"
                                                Enabled="false">
                                                <asp:ListItem>Branch</asp:ListItem>
                                                <asp:ListItem>Segment</asp:ListItem>
                                                <asp:ListItem>Company</asp:ListItem>
                                                <asp:ListItem>ExcludeMainAc</asp:ListItem>
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
                <td style="display: none;">
                    <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="150px"></asp:TextBox>
                    
                    <asp:HiddenField ID="HiddenField_Branch" runat="server" />
                    <asp:HiddenField ID="HiddenField_BranchName" runat="server" />
                    <asp:HiddenField ID="hiddencount" runat="server" />
                    <asp:HiddenField ID="HiddenField_Segment" runat="server" />
                    <asp:HiddenField ID="HiddenField_SegmentName" runat="server" />
                    <asp:HiddenField ID="HiddenField_CompanyName" runat="server" />
                    <asp:HiddenField ID="HiddenField_Company" runat="server" />
                    <asp:HiddenField ID="HiddenField_ExcludeMainAc" runat="server" />
                    
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
                            
                             <tr>
                                 <td>
                                     <div id="DivHeader" runat="server">
                                     </div>
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