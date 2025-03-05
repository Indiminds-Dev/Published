<%@ page language="C#" autoeventwireup="true" inherits="management_DDPITransferForSale, App_Web_im-ehkhh" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%--<head id="Head1" runat="server">--%>
<head id="Head1">
    <title>Poa/DDPI Account Transfer For Sale</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
    <%--New Work--%>
    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>
    <%--End of New Work--%>
    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>

    <style type="text/css">
        /* Big box with list of options */#ajax_listOfOptions
        {
            position: absolute; /* Never change this one */
            width: 50px; /* Width of box */
            height: auto; /* Height of box */
            overflow: auto; /* Scrolling features */
            border: 1px solid Blue; /* Blue border */
            background-color: #FFF; /* White background color */
            text-align: left;
            font-size: 0.9em;
            z-index: 32767;
        }
        #ajax_listOfOptions div
        {
            /* General rule for both .optionDiv and .optionDivSelected */
            margin: 1px;
            padding: 1px;
            cursor: pointer;
            font-size: 0.9em;
        }
        #ajax_listOfOptions .optionDiv
        {
            /* Div for each item in list */
        }
        #ajax_listOfOptions .optionDivSelected
        {
            /* Selected item in the list */
            background-color: #DDECFE;
            color: Blue;
        }
        #ajax_listOfOptions_iframe
        {
            background-color: #F00;
            position: absolute;
            z-index: 3000;
        }
        form
        {
            display: inline;
        }
    </style>

    <script language="javascript" type="text/javascript">

  
    function Page_Load()///Call Into Page Load
            {
                 Hide('TabGrid');
                 //New Work
                 Hide('showSCFilter');
                 Hide('Tr_ProClient');
                 document.getElementById('tr_export').style.display='none';
                 //End of New Work
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
            
    //New Work
    function FunClientScrip(objID,objListFun,objEvent)
        {
          var cmbVal;
//          var k=  document.getElementById('ddlReleaseToAc').value.split('~');
//          var AccountType=k[3];
         
            if(document.getElementById('cmbsearchOption').value=="Clients")
            {
                if(document.getElementById('ddlGroup').value=="0")//////////////Group By  selected are branch
                {
                    if(document.getElementById('ddlGroup').value=="0")
                    {
                        if(document.getElementById('rdbranchAll').checked==true)
                           {
                               cmbVal='POATfMargnPledgClientsBranch'+'~'+'ALL'+'~'+document.getElementById('ddlDp').value;
                           }
                        else
                           {
                                 cmbVal='POATfMargnPledgClientsBranch'+'~'+'Selected'+'~'+document.getElementById('HiddenField_Branch').value+'~'+document.getElementById('ddlDp').value;
                           }
                    }
                   
                }
               else //////////////Group By selected are Group
                {
                   if(document.getElementById('rdddlgrouptypeAll').checked==true)
                       {
                             cmbVal='POATfMargnPledgClientsGroup'+'~'+'ALL'+'~'+document.getElementById('ddlgrouptype').value+'~'+document.getElementById('ddlDp').value;
                       }
                   else
                           {
                             cmbVal='POATfMargnPledgClientsGroup'+'~'+'Selected'+'~'+document.getElementById('HiddenField_Group').value+'~'+document.getElementById('ddlDp').value;
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
                Hide('showSCFilter');
             else
             { 
                  if((document.getElementById('ddlGroup').value=="1")&&(document.getElementById('ddlgrouptype').value=="0") )
                  {
                    alert('Please Select the Group type First!!');
                    document.getElementById('rdbClientSelected').checked=false;
                    document.getElementById('rdbClientALL').checked=true;
                    document.getElementById('ddlgrouptype').focus();
                  }
                  else
                  {
                      var cmb=document.getElementById('cmbsearchOption');
                      cmb.value='Clients';
                      Show('showSCFilter');
                  }
             }
            height();
        }
        
    function fnBranch(obj)
      {
            if(obj=="a")
                Hide('showSCFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='Branch';
                  Show('showSCFilter');
             }
          height();
      }
     function fnGroup(obj)
      {
            if(obj=="a")
                Hide('showSCFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='Group';
                  Show('showSCFilter');
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
            
                Hide('showSCFilter');
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
    //End of New Work
    
    function ChangeRowColor(rowID,rowNumber) 
        { 
            var gridview = document.getElementById('GrdPoaAcPayin'); 
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
  
  function isNumberKey(e)      
        {         
            var keynum
            var keychar
            var numcheck
            if(window.event)//IE
            {
                keynum = e.keyCode 
                if(keynum>=48 && keynum<=57 || keynum==46)
                   {
                      return true;
                   }
                else
                    {
                     alert("Please Insert Numeric Only");
                     return false;
                    }
             } 
         
         else if(e.which) // Netscape/Firefox/Opera
           {
               keynum = e.which  
               if(keynum>=48 && keynum<=57 || keynum==46)
                     {
                      return true;
                     }
                     else
                     {
                     alert("Please Insert Numeric Only");
                     return false;
                     }     
                }
        }
     //New Work 07/06/2023
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
    //End of New Work 07/06/2023
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
        
    function RecordDisplay(obj)
    {
        if(obj=="1")
        {
            Hide('TabGrid');
            alert('No Record Found !!');
            //New Work
            document.getElementById('tr_export').style.display='none';
            //End of New Work
        }
        if(obj=="2")
        {
            Show('TabGrid');
            //New Work
            document.getElementById('tr_export').style.display='inline';
            //End of New Work
        }
        if(obj=="3")
        {
            Hide('TabGrid');
            alert('Processing Successfully !!!!');
            //New Work
            document.getElementById('tr_export').style.display='none';
            //End of New Work
        }
        if(obj=="4")
        {
            Hide('TabGrid');
            alert('You must select a Branch to generate the report !!');
        }
        if(obj=="5")
        {
            Hide('TabGrid');
            alert('You must select a Client to generate the report !!');
        }
        if(obj=="6")
        {
            Hide('TabGrid');
            alert('You must select a Group to generate the report !!');
        }
        if(obj=="7")
        {
            Show('TabGrid');
            alert('Transferable Quantity must be greater than ZERO !!');
        }
        height();
    }
     function Fn_DeliverQty(textid,txtqty,deliverqty)
      {
        if(parseInt(txtqty)>parseInt(deliverqty))
        {
           alert('You Can Transfer Maximum '+deliverqty+' Share');
           textid.value=deliverqty;
           textid.focus();
           textid.select();
        }
        
      }
     FieldName='lstSlection';
     
     function ShowHideFilter(obj)
    {
        /* if(document.getElementById('TxtSeg').value=='N')
           {
             document.getElementById('TxtTCODE').style.display="none";
           }
           else
           {
            document.getElementById('TxtTCODE').style.display="inline";
           }*/
           
        InitialTextVal();
        if(obj=="s")
            document.getElementById('TrFilter').style.display="inline";
            //grid.PerformCallback('ssss');
        else
        {
            document.getElementById('TrFilter').style.display="none";
            document.getElementById('btnAll').click();
            //grid.PerformCallback(obj);
        }
    }
     function InitialTextVal()
   {
        document.getElementById('txtClientName').value = "";
        document.getElementById('txtClientID').value = "";
        document.getElementById('txtBranchCode').value = "";
        document.getElementById('txtScriptName').value = "";
        document.getElementById('txtIsIn').value = "";
   }  
    
    </script>

    <script type="text/javascript">
        function SelectAllCheckboxes(chk) {
            $('#<%=GrdPoaAcPayin.ClientID %>').find("input:checkbox").each(function() {
                if (this != chk) {
                    this.checked = chk.checked;
                }
            });
        }
        //New Work
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
        }
        //End of New Work
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
        function InitializeRequest(sender, args) {
            if (prm.get_isInAsyncPostBack())
                args.set_cancel(true);
            postBackElement = args.get_postBackElement();
            $get('UpdateProgress1').style.display = 'block';
        }
        function EndRequest(sender, args) {
            $get('UpdateProgress1').style.display = 'none';

        } 
    </script>

    <div>
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" colspan="0" style="text-align: center; height: 20px;">
                    <strong><span id="SpanHeader" style="color: #000099">Poa/DDPI Account Transfer For Sale</span></strong>
                </td>
                <%--New Work--%>
                <td class="EHEADER" width="15%" id="tr_export" style="height: 22px">

                <asp:DropDownList ID="ddlExport" Font-Size="Smaller" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlExport_SelectedIndexChanged">
                            <asp:ListItem Selected="True" Value="Ex">Export</asp:ListItem>
                            <asp:ListItem Value="E">Excel</asp:ListItem>
                            <asp:ListItem Value="P">PDF</asp:ListItem>
                </asp:DropDownList> 

             </td>
             <%--End of New Work--%>
            </tr>
        </table>
        <table id="tab2" border="0" cellpadding="0" cellspacing="0">
            <tr valign="top">
                <%--New Work 07/06/2023--%>
                <td class="gridcellleft">
                    <table border="10" cellpadding="1" cellspacing="1">
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Pending Position Of :
                            </td>
                            <td>
                                <asp:TextBox ID="txtPendingPostion" runat="server" Font-Size="10px" onkeyup="FnFetchSettlement(this,'GenericAjaxList',event)"
                                    Width="200Px"></asp:TextBox>
                            </td>
                            <td style="display: none;">
                                <asp:TextBox ID="txtPendingPostion_hidden" runat="server" Font-Size="10px" Width="200Px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
                <%--End of New Work 07/06/2023--%>
                <td class="gridcellleft">
                    <table border="10" cellpadding="1" cellspacing="1">
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Select Dp :
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlDp" Font-Size="10px" runat="server" Width="150px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="gridcellleft">
                    <table border="10" cellpadding="1" cellspacing="1">
                        <tr valign="top">
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Transfer Date :
                            </td>
                            <td class="gridcellleft">
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
            <tr valign="top">
                <td class="gridcellleft">
                    <table border="10" cellpadding="1" cellspacing="1">
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Target Account :
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlTargetAc" Font-Size="10px" runat="server" Width="250px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table border="10" cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Slip Number :
                            </td>
                            <td>
                                <asp:TextBox ID="txtSlipNo" runat="server" Text="" Font-Size="10px" Width="200px"
                                    Height="15px" Font-Names="Verdana"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="gridcellleft" bgcolor="#B7CEEC">
                    <asp:CheckBox ID="ChkALL" runat="server" />
                    Transfer All
                </td>
                <%--New Work 15Jun2023--%>
                <td class="gridcellleft">
                    <table border="10" cellpadding="1" cellspacing="1">
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Select Account Type :
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlAccType" Font-Size="10px" runat="server" Width="100px">
                                <asp:ListItem Value="D">Default</asp:ListItem>
                                <asp:ListItem Value="S">Secondary</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </td>
                <%--End of New Work 15Jun2023--%>
            </tr>
            <%--New work--%>
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
                                <asp:RadioButton ID="rdbClientSelected" runat="server" GroupName="c" onclick="fnClients('b')" />
                                Selected
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr id="Tr_ProClient">
                <td class="gridcellleft">
                    <table  border="10" cellpadding="1" cellspacing="1">
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Pro Client:
                            </td>
                            <td>
                                <asp:TextBox ID="txtClientPro" runat="server" Width="250px" Font-Size="10px" onkeyup="ajax_showOptions(this,'ShowClientFORDDPIStocks',event,'ProClients')"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
            <td class="gridcellleft" valign="top">
                <table id="showSCFilter" border="10" cellpadding="1" cellspacing="1">
                    <tr>
                        <td valign="Top">
                            <table>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="200px" onkeyup="FunClientScrip(this,'ShowClientFORDDPIStocks',event)"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="cmbsearchOption" runat="server" Font-Size="11px" Width="70px"
                                            Enabled="false">
                                          <asp:ListItem>Clients</asp:ListItem>
                                            <asp:ListItem>Branch</asp:ListItem>
                                            <asp:ListItem>Group</asp:ListItem>
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
            <%--End of New work--%>
            <tr>
                <td class="gridcellleft" colspan="3">
                    <asp:Button ID="BtnScreen" runat="server" CssClass="btnUpdate" Height="20px" Text="Show"
                        Width="101px" OnClick="BtnScreen_Click" />
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
                                                        <img src='../images/progress.gif' width='18' height='18'>
                                                    </td>
                                                    <td height='10' width='100%' align='center' bgcolor='#FFFFFF'>
                                                        <font size='1' face='Tahoma'><strong align='center'>Please Wait..</strong></font>
                                                    </td>
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
        <%--New Work--%>
        <table>
            <tr>
                <td style="display: none;">
                    <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="150px"></asp:TextBox>
                    <asp:Button ID="btnhide" runat="server" Text="btnhide" OnClick="btnhide_Click" />
                    <asp:HiddenField ID="HiddenField_Group" runat="server" />
                    <asp:HiddenField ID="HiddenField_Branch" runat="server" />
                    <asp:HiddenField ID="HiddenField_Client" runat="server" />
                </td>
            </tr>
        </table>
        <%--End of New Work--%>
        <table id="TabGrid">
            <tr>
                <td>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnGenerate1" runat="server" Text="Generate" CssClass="btnUpdate"
                                            Height="25px" Width="147px" OnClick="btnGenerate1_Click" />
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnGenerate1" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td id="ShowFilter">
                                <a href="javascript:ShowHideFilter('s');"><span style="color: #000099; text-decoration: underline">
                                    Show Filter</span></a>
                            </td>
                            <td id="Td1">
                                <a href="javascript:ShowHideFilter('All');" runat="server" >
                                <span style="color: #000099; text-decoration: underline">
                                    All Records</span>
                                    </a>
                                    <asp:Button ID="btnAll" runat="server" onclick="All_Click" style="display:none;" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr id="TrFilter" style="display: none" runat="server">
                <td>
                    <table>
                        <tr>
                            <td>
                                Client Name : 
                                <asp:TextBox ID="txtClientName" runat="server" CssClass="water" 
                                    ToolTip="Client Name" Font-Size="10px" Width="119px"></asp:TextBox>
                            </td>
                            <td>
                                Client ID :
                                <asp:TextBox ID="txtClientID" runat="server" CssClass="water" ToolTip="Client ID"
                                    Font-Size="10px" Width="100px"></asp:TextBox>
                            </td>
                            <td>
                                Branch Code :
                                <asp:TextBox ID="txtBranchCode" runat="server" CssClass="water" 
                                    ToolTip="Branch Code" Font-Size="10px" Width="100px"></asp:TextBox>
                            </td>
                            <td>
                                Script Name :
                                <asp:TextBox ID="txtScriptName" runat="server" CssClass="water" 
                                    ToolTip="Script Name" Font-Size="10px" Width="100px"></asp:TextBox>
                            </td>
                            <td>
                                Isin :
                                <asp:TextBox ID="txtIsIn" runat="server" CssClass="water"  ToolTip="Isin"
                                    Font-Size="10px" Width="100px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Button ID="btnSearch" runat="server" CssClass="btnUpdate" OnClick="btnSearch_Click" Text="Search" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:GridView ID="GrdPoaAcPayin" runat="server" Width="100%" BorderColor="CornflowerBlue"
                                AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="2px" ForeColor="#0000C0"
                                OnRowCreated="GrdPoaAcPayin_RowCreated" OnRowDataBound="GrdPoaAcPayin_RowDataBound">
                                <Columns>
                                    <asp:TemplateField HeaderText="Client Name">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblClientName" runat="server" Text='<%# Eval("ClientName")%>' CssClass="gridstyleheight1"></asp:Label>
                                            <asp:Label ID="lblClientId" runat="server" Text='<%# Eval("ClientId")%>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblDpdid" runat="server" Text='<%# Eval("Dpdid")%>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblDpCode" runat="server" Text='<%# Eval("DpCode")%>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ClientId">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblBenAcno" runat="server" Text='<%# Eval("BenAcno")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="BranchCode">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblBranchCode" runat="server" Text='<%# Eval("BranchCode")%>' CssClass="gridstyleheight1"></asp:Label>
                                            <asp:Label ID="lblBranchid" runat="server" Text='<%# Eval("Branchid")%>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ScripName">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblScripName" runat="server" Text='<%# Eval("ScripName")%>' CssClass="gridstyleheight1"></asp:Label>
                                            <asp:Label ID="lblProductid" runat="server" Text='<%# Eval("Productid")%>' Visible="false"></asp:Label>
					    <asp:Label ID="lblPendingInComing" runat="server" Text='<%# Eval("PendingInComing")%>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Isin">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Center"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblIsinNo" runat="server" Text='<%# Eval("IsinNo")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Holding">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblHolding" runat="server" Text='<%# Eval("Holding")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Transferable">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Right"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:TextBox ID="TxtDeliver" Font-Size="10px" Width="60px" runat="server" Onkeypress="return isNumberKey(event)"
                                                Text='<%# Eval("TxtDeliver") %>' Style="text-align: right;"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Holding Date">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblHldDateTime" runat="server" Text='<%# Eval("HldDateTime")%>' CssClass="gridstyleheight1"
                                                ForeColor="red"></asp:Label>
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
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Button ID="btnGenerate2" runat="server" Text="Generate" CssClass="btnUpdate"
                                            Height="25px" Width="147px" OnClick="btnGenerate2_Click" />
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnGenerate2" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
