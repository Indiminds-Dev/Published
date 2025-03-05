<%@ page language="C#" autoeventwireup="true" inherits="management_GeneratePayout_CM, App_Web_e81qjzgk" %>

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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>PayOut Position </title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>
    <script type="text/javascript" src="../CentralData/JSScript/GenericJScript.js"></script>

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
                 Hide('Tab_showFilter');
                 Hide('Td_Filter');
                 Hide('Tb_RecordDisplay');
                 FnddlGroupBy(document.getElementById('ddlGroupBy').value);
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
            
   
     function FoDpExists(obj)
     {
             if(obj=='FO')
                Hide('Td_FO');
             else
                Show('Td_FO');
             
             if(obj=='DP')
                Hide('Td_DP');
             else
                Show('Td_DP');
                   
            
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
      function FunCallAjaxList(objID,objEvent)
        {
               var strQuery_Table = '';
               var strQuery_FieldName = '';
               var strQuery_WhereClause = '';
               var strQuery_OrderBy='';
               var strQuery_GroupBy='';
               var CombinedQuery='';
               
            if(document.getElementById('cmbsearchOption').value=="Segment")
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
            else if(document.getElementById('cmbsearchOption').value=="BranchGroup")
            {
               strQuery_Table = "master_branchgroups";
               strQuery_FieldName = "top 10 rtrim(ltrim(branchgroups_name))+' [ '+rtrim(ltrim(branchgroups_code))+' ]',branchgroups_id";
               strQuery_WhereClause = " (branchgroups_name Like (\'%RequestLetter%') or branchgroups_code like (\'%RequestLetter%'))";
            }
            else if(document.getElementById('cmbsearchOption').value=="Group")
            {
               strQuery_Table = "tbl_master_groupmaster";
               strQuery_FieldName = "top 10 gpm_description+'-'+gpm_code ,gpm_id";
               strQuery_WhereClause = " (gpm_description Like (\'%RequestLetter%') or gpm_code like (\'%RequestLetter%')) and gpm_type='"+document.getElementById('ddlGroup').value+"'";
            }
            else
            {
               strQuery_Table = "tbl_master_contact,tbl_master_contactexchange,tbl_master_branch";
               strQuery_FieldName = "distinct top 10  isnull(rtrim(cnt_firstName),'')+' '+isnull(rtrim(cnt_middlename),'')+' '+isnull(rtrim(cnt_lastName),'')+' ['+isnull(rtrim(crg_tcode),'')+'] ['+isnull(rtrim( BRANCH_DESCRIPTION),'')+']' ,cnt_internalID";
               strQuery_WhereClause = "  branch_id=cnt_branchid and crg_cntid=cnt_internalid  and cnt_internalid like 'CL%' and (crg_tcode Like (\'%RequestLetter%') or CNT_FIRSTNAME like (\'%RequestLetter%')) and cnt_branchid in (<%=Session["userbranchHierarchy"]%>)";
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
    
  
       function fnSegment(obj)
        {
             if(obj=="a")
                Hide('Tab_showFilter');
		     else if(obj=="c")
             {
                Hide('Tab_showFilter');
                Show('Td_Specific');
             }
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='Segment';
                  Show('Tab_showFilter');
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
            
                Hide('Tab_showFilter');
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
   
  function selecttion()
  {
     var combo=document.getElementById('cmbExport');
     combo.value='Ex';
  } 
   
   function fnRecord(obj)
    {
       if(obj=="1")
       {
            Hide('Td_Filter');
            Show('tab1');
            Hide('Tb_RecordDisplay');
            Hide('displayAll');
            alert('No Record Found!!');
       } 
       if(obj=="2")
       {
            Show('td_filter');
            Hide('tab1');
            Hide('displayAll');
            Show('Tb_RecordDisplay');
           
       } 
       if(obj=="3")
       {
            Hide('Td_Filter');
            Show('tab1');
            Hide('displayAll');
            Hide('Tb_RecordDisplay');
           
       }
       if(obj=="4")
       {
            Hide('Td_Filter');
            Show('tab1');
            Hide('Tb_RecordDisplay');
            Hide('displayAll');
            alert('Payout Generate Successfully !!');
       }  
       if(obj=="5")
       {
            Show('Td_Filter');
            Hide('tab1');
            Hide('Tb_RecordDisplay');
            Show('displayAll');
           
       }  
        Hide('Tab_showFilter');
        height();
        selecttion();
    }
  
 
   function SelectAllCheckboxes(chk) 
          {
            $('#<%=grdPayout.ClientID %>').find("input:checkbox").each(function() 
            {
                if (this != chk) {
                    this.checked = chk.checked;
                }
            });
          }
  function FnBankName(obj)
  {
     var j=obj.split('~');
     document.getElementById('lblBankBalance').innerText=j[1];
     
     if(j[2]=='0')
        document.getElementById('lblBankBalance').style.color = 'red';
     if(j[2]=='1')
        document.getElementById('lblBankBalance').style.color = 'green';
  }
    function fn_Amnt(textid,originalamnt,txtAmnt)
      {
            if(parseInt(txtAmnt)>parseInt(originalamnt))
            {
               alert('You Cannot Pay More Than '+originalamnt+' To This Client');
               textid.value=originalamnt;
               textid.focus();
               textid.select();
            }
           
      }
     
      
    FieldName='lstSlection';
     </script>
    
  
 
  <script type="text/ecmascript">   
       function ReceiveServerData(rValue)
        {
                var j=rValue.split('~');
                if(j[0]=='Branch')
                    document.getElementById('HiddenField_Branch').value = j[1];
                if(j[0]=='Segment')
                    document.getElementById('HiddenField_Segment').value = j[1];
                if(j[0]=='BranchGroup')
                    document.getElementById('HiddenField_BranchGroup').value = j[1];
                if(j[0]=='Group')
                    document.getElementById('HiddenField_Group').value = j[1];
                if(j[0]=='Clients')
                    document.getElementById('HiddenField_Client').value = j[1];

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
                    <strong><span id="SpanHeader" style="color: #000099">PayOut Position </span></strong></td>

                <td class="EHEADER" width="15%" id="Td_Filter" style="height: 22px">
                    <a href="javascript:void(0);" onclick="fnRecord(3);"><span style="color: Blue; text-decoration: underline;
                        font-size: 8pt; font-weight: bold">Filter</span></a>
                  
                </td>
            </tr>
        </table>
        <table id="tab1" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table>
                        <tr>
                            <td class="gridcellleft">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            For Date :
                                        </td>
                                        <td>
                                            <dxe:ASPxDateEdit ID="DtFor" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                Font-Size="10px" Width="108px" ClientInstanceName="DtFor">
                                                <dropdownbutton text="For">
                                                </dropdownbutton>
                                            </dxe:ASPxDateEdit>
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
                                            <asp:RadioButton ID="rdbSegmentAll" runat="server" GroupName="bb" onclick="fnSegment('a')" />All
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbSegmentSpecific" runat="server" Checked="True" GroupName="bb"
                                                onclick="fnSegment('c')" />Specific
                                        </td>
                                        <td>
                                            [ <span id="litSegmentMain" runat="server" style="color: Maroon"></span>]</td>
                                        <td id="Td_SegmentSelected">
                                            <asp:RadioButton ID="rdSegmentSelected" runat="server" GroupName="bb" onclick="fnSegment('b')" />Selected
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
                                                            onclick="FnOtherGroupBy('a')" />
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
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="gridcellleft">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC" id="Td_FO">
                                            <asp:CheckBox ID="ChkFODr" runat="server" />
                                            Consider FO Segment Debit Balance
                                        </td>
                                        <td class="gridcellleft" bgcolor="#B7CEEC" id="Td_DP">
                                            <asp:CheckBox ID="ChkDPDr" runat="server" />
                                            Consider DP Segment Debit Balance
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            <asp:CheckBox ID="ChkAppMrgn" runat="server" />
                                            Consider Applicable Margin
                                        </td>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            <asp:CheckBox ID="ChkCashMrgn" runat="server" />
                                            Show Cash Margin Balance
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
                                            Consider Clients With Payable Amount >=
                                        </td>
                                        <td>
                                            <dxe:ASPxTextBox ID="txtAmntGreaterThan" runat="server" HorizontalAlign="Right" Width="100px">
                                                <masksettings mask="&lt;0..9999999999g&gt;.&lt;00..99&gt;" includeliterals="DecimalSymbol" />
                                                <validationsettings errordisplaymode="None"></validationsettings>
                                            </dxe:ASPxTextBox></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="gridcellleft">
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Payment Mode :
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlPaymentMode" runat="server" Font-Size="11px" Width="80px">
                                                <asp:ListItem Value="C">Cheque</asp:ListItem>
                                                <asp:ListItem Value="E">E Transfer</asp:ListItem>
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
                                        <td>
                                            <asp:Button ID="btnScreen" runat="server" CssClass="btnUpdate" Height="20px" Text="Show"
                                                Width="101px" OnClientClick="selecttion()" OnClick="btnScreen_Click" />
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
                                            <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="300px" onkeyup="FunCallAjaxList(this,event)"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="cmbsearchOption" runat="server" Font-Size="11px" Width="70px"
                                                Enabled="false">
                                                <asp:ListItem>Clients</asp:ListItem>
                                                <asp:ListItem>Group</asp:ListItem>
                                                <asp:ListItem>Branch</asp:ListItem>
                                                <asp:ListItem>BranchGroup</asp:ListItem>
                                                <asp:ListItem>Segment</asp:ListItem>
                                               
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
        <table>
            <tr>
                <td style="display: none;">
                    <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="150px"></asp:TextBox>
                    <asp:Button ID="BtnGroup" runat="server" Text="BtnGroup" OnClick="BtnGroup_Click" />
                    <asp:HiddenField ID="HiddenField_Group" runat="server" />
                    <asp:HiddenField ID="HiddenField_Branch" runat="server" />
                    <asp:HiddenField ID="HiddenField_BranchGroup" runat="server" />
                    <asp:HiddenField ID="HiddenField_Client" runat="server" />
                    <asp:HiddenField ID="HiddenField_Segment" runat="server" />
                   
                   
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
            <asp:UpdatePanel runat="server" ID="UpdatePanel7">
                <ContentTemplate>
                    <table width="50%" border="1">
                       
                        <tr>
                            <td>
                                <div id="Div_Activity" runat="server">
                                </div>
                            </td>
                        </tr>
                        <br />
                       
                        <tr>
                            <td>
                                <div id="Div_bill" runat="server">
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
        <table id="Tb_RecordDisplay">
            <tr>
                <td class="gridcellleft">
                    <table border="10" cellpadding="1" cellspacing="1">
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Bank Name :
                            </td>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>

                                        <asp:DropDownList ID="ddlBankName" runat="server" Font-Size="11px" onchange="FnBankName(this.value)">
                                        </asp:DropDownList>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnScreen" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Current Balance :</td>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate><img src="../images/indianrupee.jpg" alt="abc" height="15px" width="15px"/>

                                        <asp:Label ID="lblBankBalance" runat="server" Font-Bold="true"></asp:Label>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnScreen" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                            <td>
                                <asp:Button ID="BtnReCalculate" runat="server" CssClass="btnUpdate" Height="20px"
                                    Text="Re-Calculate" Width="101px" ForeColor="green" OnClientClick="selecttion()"
                                    OnClick="BtnReCalculate_Click" />
                            </td>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Net Payout :</td>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate><img src="../images/indianrupee.jpg" alt="abc" height="15px" width="15px"/>
                                        <asp:Label ID="lblPayableBalance" runat="server" Font-Bold="true" ForeColor="green"></asp:Label>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnScreen" EventName="Click" />
                                        <asp:AsyncPostBackTrigger ControlID="BtnReCalculate" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                            <td align="right">
                                <asp:DropDownList ID="cmbExport" runat="server" AutoPostBack="True" Font-Size="10px"
                                    Width="100px" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged">
                                    <asp:ListItem Selected="True" Value="Ex">Export To Excel</asp:ListItem>
                                    <asp:ListItem Value="D">Detail</asp:ListItem>
                                    <asp:ListItem Value="S">Summary</asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="gridcellleft">
                    <table border="10" cellpadding="1" cellspacing="1">
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Main Narration</td>
                            <td>
                                <asp:TextBox ID="txtLineNarration" Font-Size="10px" TextMode="MultiLine" runat="server"
                                    Height="25px" Width="330px"></asp:TextBox>
                            </td>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Line Narration</td>
                            <td>
                                <asp:TextBox ID="txtMainNarration" Font-Size="10px" TextMode="MultiLine" runat="server"
                                    Height="25px" Width="330px"></asp:TextBox>
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
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:GridView ID="grdPayout" runat="server" Width="100%" BorderColor="CornflowerBlue"
                                            AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="2px" ForeColor="#0000C0"
                                            OnRowDataBound="grdPayout_RowDataBound">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Client Name">
                                                    <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblClientName" runat="server" Text='<%# Eval("ClientName")%>' CssClass="gridstyleheight1"></asp:Label>
                                                        <asp:Label ID="lblClientId" runat="server" Text='<%# Eval("Clientid")%>' Visible="false"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Ucc">
                                                    <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblUcc" runat="server" Text='<%# Eval("Ucc")%>' CssClass="gridstyleheight1"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Ledger Baln.">
                                                    <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLedgr" runat="server" Text='<%# Eval("Ledger")%>' CssClass="gridstyleheight1"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Net Payable">
                                                    <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPayableFormat" runat="server" Text='<%# Eval("PayableFormat")%>'
                                                            CssClass="gridstyleheight1"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Transfer">
                                                    <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtPayableAmnt" Style="text-align: right;" Onkeypress="return isNumberKey(event)"
                                                            runat="server" CssClass="gridstyleheight1" Text='<%# Eval("PayableAmnt")%>'></asp:TextBox>
                                                        <asp:Label ID="lblPayableFormatOriginal" runat="server" Text='<%# Eval("PayableAmnt")%>'
                                                            CssClass="gridstyleheight1" Visible="false"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="SettNoType">
                                                    <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtSettNoType" Style="text-align: right;" 
                                                            runat="server" CssClass="gridstyleheight1"></asp:TextBox>
                                                        <asp:TextBox  ID="txtSettNoType_hidden" runat="server" Width="14px" style="display:none;"></asp:TextBox>
                                                        <asp:Label ID="lblSettNoType" runat="server"
                                                            CssClass="gridstyleheight1" Visible="false"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                                    <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkSelected" runat="server" />
                                                    </ItemTemplate>
                                                    <HeaderTemplate>
                                                        <asp:CheckBox ID="chkAll" runat="server" onclick="javascript:SelectAllCheckboxes(this);" />
                                                    </HeaderTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <RowStyle BackColor="White" ForeColor="#330099" BorderColor="#BFD3EE" BorderStyle="Double"
                                                BorderWidth="1px"></RowStyle>
                                            <HeaderStyle ForeColor="Black" BorderWidth="1px" CssClass="EHEADER" BorderColor="AliceBlue"
                                                Font-Bold="True" Wrap="False"></HeaderStyle>
                                        </asp:GridView>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btnScreen" EventName="Click" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnProcessing1" runat="server" Text="Generate Payout" CssClass="btnUpdate"
                                            Height="25px" OnClientClick="javascript:selecttion();" Width="147px" OnClick="btnProcessing1_Click" />
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnProcessing1" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>