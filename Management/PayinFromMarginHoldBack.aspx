<%@ page language="C#" autoeventwireup="true" inherits="management_PayinFromMarginHoldBack, App_Web_bfdn6hbr" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>Payin From Margin/HoldBack/Invoked Accounts</title>
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
	
	</style>
 <script language="javascript" type="text/javascript">

  
    function Page_Load()///Call Into Page Load
            {
             
                 Hide('tab_grid');
                 Show('tab2');
                 Hide('showFilter');
                 Hide('td_filter');
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
    
     function FunClientScrip(objID,objListFun,objEvent)
        {
          var cmbVal;
         
            if(document.getElementById('cmbsearchOption').value=="Clients")
            {
                if(document.getElementById('ddlGroup').value=="0")//////////////Group By  selected are branch
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
            height();
        }
        function fnScrips(obj)
        {
             if(obj=="a")
                Hide('showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='ScripsExchange';
                  Show('showFilter');
             }
            height();
        }
      function fnBranch(obj)
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

    function RecordDisplay(obj)
    {
        if(obj=='1')////No Record
        {
            Hide('tab_grid');
            Show('tab2');
            Hide('td_filter');
            alert('No Record Found !!');
        }
        if(obj=='2')////Display
        {
            Show('tab_grid');
            Hide('tab2');
            Show('td_filter');
        }
        if(obj=='3')////Filter
        {
            Hide('tab_grid');
            Show('tab2');
            Hide('td_filter');
        }
        if(obj=='4')////Transfers Generated Successfully
        {
            Hide('tab_grid');
            Show('tab2');
            Hide('td_filter');
            alert('Transfers Generated Successfully !!');
        }
        Hide('showFilter');
        height();
        
    }
     function FnFetchSettlement(objID,objListFun,objEvent)
        {
            var strQuery_Table = '';
           var strQuery_FieldName = '';
           var strQuery_WhereClause = '';
           var strQuery_OrderBy='';
           var strQuery_GroupBy='';
           var CombinedQuery='';
            
             var finyear='<%=Session["LastFinYear"]%>';
             var valyr= finyear.split('-');
             
             strQuery_Table = "Master_Settlements";
             strQuery_FieldName = "distinct top 10 RTRIM(settlements_Number)+RTRIM(settlements_TypeSuffix)+'  ' + REPLACE(CONVERT(VARCHAR(9), settlements_StartDateTime, 6), ' ', '-') AS [DD-Mon-YY],RTRIM(settlements_Number)+RTRIM(settlements_TypeSuffix)";
             strQuery_WhereClause = " settlements_exchangesegmentid='<%=Session["ExchangeSegmentID"]%>' and  ((RTRIM(settlements_Number)+RTRIM(settlements_TypeSuffix)) like (\'%RequestLetter%') and ((settlements_StartDateTime between '" + valyr[0]+"-04-01 00:00:00' and '"+ valyr[1]+"-03-31 11:59:59') or (Settlements_FundsPayin between '"+ valyr[0]+"-04-01 00:00:00' and '"+ valyr[1]+"-03-31 11:59:59'))) ";

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
    function ChangeRowColor(rowID,rowNumber) 
        { 
            var gridview = document.getElementById('GridPayinFromMarginHoldBack'); 
            var rCount = gridview.rows.length; 
            var rowIndex=1;
            var rowCount=0;
            if(rCount==28)
                 rowCount=25;
            else    
               rowCount=rCount-2;
            if(rowNumber>25 && rCount<28)
                rowCount=rCount-3;
            for (rowIndex; rowIndex<=rowCount; rowIndex++) 
            { 
                var rowElement = gridview.rows[rowIndex]; 
                rowElement.style.backgroundColor='#FFFFFF'
            }
            var color = document.getElementById(rowID).style.backgroundColor;
            if(color != '#ffe1ac') 
            {
                oldColor = color;
            }
            if(color == '#ffe1ac') 
            {
                document.getElementById(rowID).style.backgroundColor = oldColor;
            }
            else 
                document.getElementById(rowID).style.backgroundColor = '#ffe1ac';            
          
         
        } 
      function fn_Releaseqty(textid,qty,txtvalue,originaltransferqty)
      {
            if(parseInt(txtvalue)>parseInt(originaltransferqty))
            {
               alert('You Can Deliver Maximum '+originaltransferqty+' Share');
               textid.value=originaltransferqty;
               textid.focus();
               textid.select();
            }
      }
     
    FieldName='lstSlection';
     </script>
  <script type="text/javascript">
 function SelectAllCheckboxes(chk) 
  {
    $('#<%=GridPayinFromMarginHoldBack.ClientID %>').find("input:checkbox").each(function() 
    {
        if (this != chk) {
            this.checked = chk.checked;
        }
    });
  }
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
                if(j[0]=='ScripsExchange')
                {
                    document.getElementById('HiddenField_Scrip').value = j[1];
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
                    <strong><span id="SpanHeader" style="color: #000099">Payin From Margin/HoldBack/Invoked Accounts</span></strong></td>

              <td class="EHEADER" width="15%" id="td_filter" style="height: 22px">
                    <a href="javascript:void(0);" onclick="RecordDisplay('3');"><span style="color: Blue; text-decoration: underline;
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
                                    <tr valign="top">
                                       <td>
                                            <table>
                                                <tr valign="top">
                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                        Transfer From :
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlReleaseFromAc" runat="server" Font-Size="10px" Width="250px" onchange="FnTransferToBind()">
                                                                </asp:DropDownList>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td id="Td_TransferTo">
                                            <table>
                                                <tr valign="top">
                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                        Deliver To :
                                                    </td>
                                                    <td>
                                                         <asp:DropDownList ID="ddlReleaseToAc" runat="server" Font-Size="10px" Width="250px">
                                                                </asp:DropDownList>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr valign="top">
                                      <td >
                                <table border="10" cellpadding="1" cellspacing="1">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Position Of :
                                        </td>
                                       <td>
                                            <asp:TextBox ID="txtPostion" runat="server" Font-Size="10px" 
                                                Width="200Px" ></asp:TextBox></td>
                                        <td style="display: none;">
                                            <asp:TextBox ID="txtPostion_hidden" runat="server" Font-Size="10px" Width="200Px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                                       <td >
                                                        <table border="10" cellpadding="1" cellspacing="1">
                                                            <tr valign="top">
                                                                <td class="gridcellleft" bgcolor="#B7CEEC">
                                                                    Transfer Date :</td>
                                                                <td id="td_dtto" class="gridcellleft">
                                                                    <dxe:ASPxDateEdit ID="DtTransferDate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                                        Font-Size="10px" Width="108px" ClientInstanceName="DtTransferDate">
                                                                        <DropDownButton Text="For">
                                                                        </DropDownButton>
                                                                    </dxe:ASPxDateEdit>
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
                                        <td>
                                            <table>
                                               
                                                <tr id="Tr_Group">
                                                    <td class="gridcellleft">
                                                        <table border="10" cellpadding="1" cellspacing="1">
                                                            <tr>
                                                                <td class="gridcellleft" bgcolor="#B7CEEC">
                                                                    Group By</td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlGroup" runat="server" Width="80px" Font-Size="10px" onchange="fnddlGroup(this.value)">
                                                                        <asp:ListItem Value="0">Branch</asp:ListItem>
                                                                        <asp:ListItem Value="1">Group</asp:ListItem>
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
                                                            <tr>
                                                                <td class="gridcellleft" bgcolor="#B7CEEC">
                                                                    Clients :</td>
                                                                <td>
                                                                    <asp:RadioButton ID="rdbClientALL" runat="server" Checked="True" GroupName="c" onclick="fnClients('a')" />
                                                                    All
                                                                </td>
                                                                <td>
                                                                    <asp:RadioButton ID="radPOAClient" runat="server" GroupName="c" onclick="fnClients('a')" />POA
                                                                </td>
                                                                <td>
                                                                    <asp:RadioButton ID="rdbClientSelected" runat="server" GroupName="c" onclick="fnClients('b')" />
                                                                    Selected
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                   
                                                <tr>
                                                    <td class="gridcellleft">
                                                        <table border="10" cellpadding="1" cellspacing="1">
                                                            <tr>
                                                                <td class="gridcellleft" style="width: 100px;" bgcolor="#B7CEEC">
                                                                    Scrip :</td>
                                                                <td>
                                                                    <asp:RadioButton ID="rdbScripAll" runat="server" Checked="True" GroupName="e" onclick="fnScrips('a')" />
                                                                    All
                                                                </td>
                                                                <td>
                                                                    <asp:RadioButton ID="rdbScripSelected" runat="server" GroupName="e" onclick="fnScrips('b')" />Selected
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                             
                                                <tr>
                                                    <td class="gridcellleft">
                                                        <table border="10" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td class="gridcellleft" bgcolor="#B7CEEC">
                                                                    Remarks :</td>
                                                                <td>
                                                                    <asp:TextBox ID="txtRemarks" runat="server" Text="" MaxLength="500" Font-Size="10px"
                                                                        TextMode="MultiLine" Width="300px" Height="20px" Font-Names="Verdana"></asp:TextBox></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr><td class="gridcellleft"><table>
                                                            <tr>
                                                                <td class="gridcellleft" bgcolor="#B7CEEC">
                                                                    Order By :</td>
                                                                <td>
                                                                    <asp:DropDownList ID="ddlOrderBy" runat="server" Width="150px" Font-Size="10px">
                                                                        <asp:ListItem Value="1">Branch/Group + Client </asp:ListItem>
                                                                        <asp:ListItem Value="2">Client + Scrip </asp:ListItem>
                                                                        <asp:ListItem Value="3">Scrip + Client </asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                        </table></td></tr>
                                                <tr>
                                                    <td class="gridcellleft">
                                                        <asp:Button ID="btnshow" runat="server" CssClass="btnUpdate" Height="20px" Text="Show"
                                                            Width="101px" OnClick="btnshow_Click" />
                                                    </td>
                                                </tr>
                                               
                                            </table>
                                        </td>
                                        <td class="gridcellleft" valign="top">
                                            <table id="showFilter" border="10" cellpadding="1" cellspacing="1">
                                                <tr>
                                                    <td valign="Top">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="200px" onkeyup="FunClientScrip(this,'ShowClientFORMarginStocks',event)"></asp:TextBox>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="cmbsearchOption" runat="server" Font-Size="11px" Width="70px"
                                                                        Enabled="false">
                                                                      <asp:ListItem>Clients</asp:ListItem>
                                                                        <asp:ListItem>Branch</asp:ListItem>
                                                                        <asp:ListItem>Group</asp:ListItem>
                                                                        <asp:ListItem>ScripsExchange</asp:ListItem>
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
                                                        <asp:ListBox ID="lstSlection" runat="server" Font-Size="10px" Height="90px" Width="300px">
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
                    <asp:HiddenField ID="HiddenField_Scrip" runat="server" />
                    
                    
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
        <table id="tab_grid">
            <tr>
                <td>
                    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                        <ContentTemplate>
                            <div id="divdisplay" runat="server">
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnshow" EventName="Click"></asp:AsyncPostBackTrigger>
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
              <tr >
                <td>
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnProcessing1" runat="server" Text="Generate Transfers" CssClass="btnUpdate"
                                            Height="25px" OnClientClick="javascript:selecttion();" Width="147px" OnClick="btnProcessing1_Click"  />
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
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:GridView ID="GridPayinFromMarginHoldBack" runat="server" Width="100%" BorderColor="CornflowerBlue"
                                AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="2px" OnRowCreated="GridPayinFromMarginHoldBack_RowCreated" OnRowDataBound="GridPayinFromMarginHoldBack_RowDataBound">
                              
                                <Columns>
                                    <asp:TemplateField HeaderText="Branch/Group">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblGrpName" runat="server" Text='<%# Eval("GrpName")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Client Name">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblClientName" runat="server" Text='<%# Eval("ClientName")%>' CssClass="gridstyleheight1"></asp:Label>
                                            <asp:Label ID="lblClient" runat="server" Text='<%# Eval("Client")%>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Ucc">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblUcc" runat="server" Text='<%# Eval("Ucc")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Scrip">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblScripName" runat="server" Text='<%# Eval("ScripName")%>' CssClass="gridstyleheight1"></asp:Label>
                                            <asp:Label ID="lblProductid" runat="server" Text='<%# Eval("Productid")%>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ISIN">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblIsin" runat="server" Text='<%# Eval("Isin")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Pnding Incoming">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblPndIncoming" runat="server" Text='<%# Eval("PndIncoming")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Stocks Of">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblOtherScripName" runat="server" Text='<%# Eval("OtherScripName")%>' CssClass="gridstyleheight1"></asp:Label>
                                            <asp:Label ID="lblOtherProductid" runat="server" Text='<%# Eval("OtherProductid")%>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Transferable">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtTransferable" Font-Size="10px" Width="60px" runat="server" Onkeypress="return isNumberKey(event)"
                                                Text='<%# Eval("Transferable") %>' Style="text-align: right;"></asp:TextBox>
                                            <asp:Label ID="lblOriginalQuantity" runat="server" Text='<%# Eval("Transferable")%>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblSystmAcId" runat="server" Text='<%# Eval("SystmAcId")%>' Visible="false"></asp:Label>

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
                            <asp:AsyncPostBackTrigger ControlID="btnshow" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
                <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnProcessing2" runat="server" Text="Generate Transfers" CssClass="btnUpdate"
                                            Height="25px" OnClientClick="javascript:selecttion();" Width="147px" OnClick="btnProcessing2_Click"  />
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnProcessing2" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
      
    </div>
    </form>
</body>
</html>
