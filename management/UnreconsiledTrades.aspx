<%@ page language="C#" autoeventwireup="true" inherits="management_UnreconsiledTrades, App_Web_npkqnqtr" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Trades Entry</title>
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
       groupvalue="";
         groupvalueterminal="";
         function Page_Load()///Call Into Page Load
            {   
               
                Hide('showFilter');
                Hide('tr_filter');
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
     function Hide(obj)
            {
             document.getElementById(obj).style.display='none';
            }
     function Show(obj)
            {
             document.getElementById(obj).style.display='inline';
            }
      function display(obj)
      {
       Show('GRID');
       Hide('SELECT');
       Hide('tab2');
       Show('tr_filter');
       document.getElementById('spanshow2').innerText=obj;
       height();
      }
      function NORECORD()
      {
       alert('No Record Found');
       Hide('GRID');
       Show('SELECT');
       Show('tab2');
       Hide('tr_filter');
       height();

      }
       function Disable(obj)
        {
            var gridview = document.getElementById('grdtrades'); 
            var rCount = gridview.rows.length;
           
            if(rCount<10)
                rCount='0'+rCount;
            if(obj=='P')
            {
                document.getElementById("grdtrades_ctl"+rCount+"_FirstPage").style.display='none';
                document.getElementById("grdtrades_ctl"+rCount+"_PreviousPage").style.display='none';
                document.getElementById("grdtrades_ctl"+rCount+"_NextPage").style.display='inline';
                document.getElementById("grdtrades_ctl"+rCount+"_LastPage").style.display='inline';
            }
            else
            {
                document.getElementById("grdtrades_ctl"+rCount+"_NextPage").style.display='none';
                document.getElementById("grdtrades_ctl"+rCount+"_LastPage").style.display='none';
            }
        }
         function ChangeRowColor(rowID,rowNumber) 
        {             
            var gridview = document.getElementById('grdtrades'); 
            var rCount = gridview.rows.length; 
            var rowIndex=1;
            var rowCount=0;
            
            if(rCount==18)
                 rowCount=15;
            else    
               rowCount=rCount-2;
            if(rowNumber>15 && rCount<18)
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
       function FunClientScrip(objID,objListFun,objEvent)
        {
          var cmbVal;
          if(groupvalue=="")
          {
               cmbVal=document.getElementById('cmbsearchOption').value;
               cmbVal=cmbVal+'~'+document.getElementById('ddlgrouptype').value;
          }
          else
          {
            if(document.getElementById('cmbsearchOption').value=="Clients")
            {
                if(document.getElementById('ddlGroup').value=="0")//////////////Group By  selected are branch
                {
                    if(document.getElementById('rdbranchAll').checked==true)
                       {
                           cmbVal=document.getElementById('cmbsearchOption').value+'Branch';
                           cmbVal=cmbVal+'~'+'ALL'+'~'+document.getElementById('ddlgrouptype').value;
                       }
                   else
                       {
                           cmbVal=document.getElementById('cmbsearchOption').value+'Branch';
                           cmbVal=cmbVal+'~'+'Selected'+'~'+groupvalue;
                       }
                }
               else //////////////Group By selected are Group
                {
                   if(document.getElementById('rdddlgrouptypeAll').checked==true)
                       {
                           cmbVal=document.getElementById('cmbsearchOption').value+'Group';
                           cmbVal=cmbVal+'~'+'ALL'+'~'+document.getElementById('ddlgrouptype').value;
                       }
                   else
                       {
                           cmbVal=document.getElementById('cmbsearchOption').value+'Group';
                           cmbVal=cmbVal+'~'+'Selected'+'~'+groupvalue;
                       }
               }
            }
            else
            {
                cmbVal=document.getElementById('cmbsearchOption').value;
                cmbVal=cmbVal+'~'+document.getElementById('ddlgrouptype').value;
            }
          }
        
          if(groupvalueterminal!="")
            {
                if(document.getElementById('cmbsearchOption').value=="CTCLID")
                {
                     if(document.getElementById('rdbterminalidSelected').checked==true)
                       {
                        cmbVal='TERMINALSELECTEDCTCLId'+groupvalueterminal;
                       }
                      else
                      {
                         cmbVal=document.getElementById('cmbsearchOption').value;
                         cmbVal=cmbVal+'~'+document.getElementById('ddlgrouptype').value;
                      }
                    
                }
                else
                {
                    cmbVal=document.getElementById('cmbsearchOption').value;
                    cmbVal=cmbVal+'~'+document.getElementById('ddlgrouptype').value;
                }
            }
            else
            {
                
                cmbVal=document.getElementById('cmbsearchOption').value;
                cmbVal=cmbVal+'~'+document.getElementById('ddlgrouptype').value;
               
            }
         
          ajax_showOptions(objID,objListFun,objEvent,cmbVal);

        }
     function Scrip(obj)
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
        
          function Clients(obj)
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
      function Branch(obj)
      {
            if(obj=="a")
                Hide('showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='Branch';
                  Show('showFilter');
             }
              
      }
     function Group(obj)
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
     function TerminalId(obj)
      {
            if(obj=="a")
                Hide('showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='TerminalId';
                  Show('showFilter');
             }
           
      }
     function CTCLID(obj)
      {
            if(obj=="a")
                Hide('showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='CTCLId';
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
                document.getElementById('btn_show').disabled=false;
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
   function fnddlType(obj)
   {
    if(obj=="0")
    {
        Hide('tr_Scrips');
        Hide('tr_Client');
        Hide('tr_branch');
    }
    else
    {
        Show('tr_Scrips');
        Show('tr_Client');
        Show('tr_branch');
    }
   }
  function Filter()
  {
       var combo=document.getElementById('ddlExport');
       combo.value='Ex';
       Hide('GRID');
       Show('SELECT');
       Show('tab2');
       Hide('tr_filter');
       height();
    
      
  }

  
    FieldName='lstSlection';
        </script>
         <script type="text/javascript">   
       function ReceiveServerData(rValue)
        {
               
               var j=rValue.split('~');
               var btn = document.getElementById('btnhide');
                
                if(j[0]=='Clients')
                {
                    document.getElementById('HiddenField_Clients').value = j[1];
                } 
                if(j[0]=='ScripsExchange')
                {
                    document.getElementById('HiddenField_Scrip').value = j[1];
                }
                if(j[0]=='Group')
                {
                   groupvalue=j[1];
                   document.getElementById('HiddenField_Group').value = j[1];
                   btn.click();
                }
                if(j[0]=='Branch')
                {
                   groupvalue=j[1];
                   document.getElementById('HiddenField_Branch').value = j[1];
                   btn.click();
                }
                if(j[0]=='TerminalId')
                {
                   groupvalueterminal=j[1];
                   document.getElementById('HiddenField_TerminalId').value = j[1];
                }
                if(j[0]=='CTCLId')
                {
                   groupvalueterminal=j[1];
                   document.getElementById('HiddenField_CTCLId').value = j[1];
                }
               
        }
        </script>
</head>


<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
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
                        <strong><span style="color: #000099">UnProcessed/UnIdentified Trades</span></strong>
                    </td>
                   <td class="EHEADER" width="15%" id="tr_filter" style="height: 22px">
                        <a href="javascript:void(0);" onclick="Filter();"><span style="color: Blue; text-decoration: underline;
                            font-size: 8pt; font-weight: bold">Filter</span></a>&nbsp;&nbsp;&nbsp;
                                                  
                      <asp:DropDownList ID="ddlExport" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlExport_SelectedIndexChanged">
                        <asp:ListItem Selected="true" Text="Export" Value="Ex"></asp:ListItem>
                        <asp:ListItem Text="Excel" Value="E"></asp:ListItem>
                        <asp:ListItem Text="PDF" Value="P"></asp:ListItem>
                    </asp:DropDownList>
                        
                    </td>
                </tr>
</table>
       
        <table id="tab2">
                <tr>
                    <td>
                        <table>
                            <tr valign="top">
                                <td>
                                    <table>
                                        <tr id="SELECT">
                                            <td>
                                                For :</td>
                                            <td colspan="2">
                                                <dxe:ASPxDateEdit ID="dtFor" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                    Font-Size="10px" Width="108px" ClientInstanceName="dtfor">
                                                    <dropdownbutton text="For">
                                                     </dropdownbutton>
                                                </dxe:ASPxDateEdit>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlType" runat="server" Width="154px" Font-Size="10px" onchange="fnddlType(this.value)">
                                                    <asp:ListItem Value="1">UnProcessed & UnIdentified</asp:ListItem>
                                                    <asp:ListItem Value="0">Only UnIdentified</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td style="display: none;" colspan="3">
                                                <asp:Button ID="btnhide" runat="server" Text="Button" OnClick="btnhide_Click" />
                                                <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="150px"></asp:TextBox>
                                                <asp:HiddenField ID="HiddenField_Group" runat="server" />
                                                <asp:HiddenField ID="HiddenField_Branch" runat="server" />
                                                <asp:HiddenField ID="HiddenField_Clients" runat="server" />
                                                <asp:HiddenField ID="HiddenField_Scrip" runat="server" />
                                                <asp:HiddenField ID="HiddenField_TerminalId" runat="server" />
                                                  <asp:HiddenField ID="HiddenField_CTCLId" runat="server" />
                                            </td>
                                        </tr>
                                        <tr id="tr_branch">
                                            <td>
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
                                                            <asp:RadioButton ID="rdbranchAll" runat="server" Checked="True" GroupName="a" onclick="Branch('a')" /> All
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
                                                        <td id="td_allselect" style="display:none;">
                                                         <asp:RadioButton ID="rdddlgrouptypeAll" runat="server" Checked="True" GroupName="f" onclick="Group('a')" /> All
                                                         <asp:RadioButton ID="rdddlgrouptypeSelected" runat="server" GroupName="f" onclick="Group('b')" />Selected
                                                        </td>
                                                    </tr>
                                                </table>
                                            
                                            </td>
                                        </tr>
                                        <tr id="tr_Client">
                                            <td>
                                                Clients :</td>
                                            <td>
                                                <asp:RadioButton ID="rdbClientALL" runat="server" Checked="True" GroupName="b" onclick="Clients('a')" /> All
                                            </td>
                                            
                                            <td>
                                                <asp:RadioButton ID="rdbClientSelected" runat="server" GroupName="b" onclick="Clients('b')" /> Selected
                                            </td>
                                          
                                            <td colspan="3">
                                            </td>
                                        </tr>
                                       <tr id="tr_Scrips">
                                            <td>
                                                Scrips :</td>
                                            <td>
                                                <asp:RadioButton ID="rdScripAll" runat="server" Checked="True" GroupName="c" onclick="Scrip('a')" /> All
                                            </td>
                                            
                                            <td>
                                                <asp:RadioButton ID="rdScripSelected" runat="server" GroupName="c" onclick="Scrip('b')" /> Selected
                                            </td>
                                           
                                            <td colspan="3">
                                            </td>
                                        </tr>
                                         <tr>
                                            <td>
                                                Terminal Id :</td>
                                            <td>
                                                <asp:RadioButton ID="rdbterminalidAll" runat="server" Checked="True" GroupName="d" onclick="TerminalId('a')" /> All
                                            </td>
                                            
                                            <td>
                                                <asp:RadioButton ID="rdbterminalidSelected" runat="server" GroupName="d" onclick="TerminalId('b')" /> Selected
                                            </td>
                                           
                                            <td colspan="3">
                                            </td>
                                        </tr>
                                         <tr>
                                            <td>
                                                CTCL Id :</td>
                                            <td>
                                                <asp:RadioButton ID="rdbctcldAll" runat="server" Checked="True" GroupName="e" onclick="CTCLID('a')" /> All
                                            </td>
                                            
                                            <td>
                                                <asp:RadioButton ID="rdbctclidSelected" runat="server" GroupName="e" onclick="CTCLID('b')" /> Selected
                                            </td>
                                           
                                            <td colspan="3">
                                            </td>
                                        </tr>
                                        <tr>  <td colspan="6">
                    <asp:Button ID="btn_show" runat="server" CssClass="btnUpdate" Height="20px" Text="Show"
                        Width="100px" OnClick="btn_show_Click" />
                </td></tr>
                                    </table>
                                </td>
                                <td>
                                    <table width="100%" id="showFilter">
                                        <tr>
                                            <td style="text-align: right; vertical-align: top; height: 134px;">
                                                <table cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td class="gridcellleft" style="vertical-align: top; text-align: right; height: 21px;" id="TdFilter">
                                                            <span id="spanunder"></span><span id="spanclient">
                                                                <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="150px" onkeyup="FunClientScrip(this,'ShowClientFORMarginStocks',event)"></asp:TextBox>

                                                            <asp:DropDownList ID="cmbsearchOption" runat="server" Font-Size="11px" Width="70px"
                                                                Enabled="false">
                                                                <asp:ListItem>ScripsExchange</asp:ListItem>
                                                                <asp:ListItem>Segment</asp:ListItem>
                                                                <asp:ListItem>Clients</asp:ListItem>
                                                                <asp:ListItem>Branch</asp:ListItem>
                                                                <asp:ListItem>Group</asp:ListItem>
                                                                <asp:ListItem>TerminalId</asp:ListItem>
                                                                <asp:ListItem>CTCLId</asp:ListItem>
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
        <table id="GRID">
           <tr><td><span id="spanshow2"></span></td></tr>
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:GridView ID="grdtrades" runat="server" Width="100%" BorderColor="CornflowerBlue"
                                ShowFooter="True" AutoGenerateColumns="false" BorderStyle="Solid" BorderWidth="2px"
                                CellPadding="4" AllowPaging="True" PageSize="15" ForeColor="#0000C0" OnRowCreated="grdtrades_RowCreated">
                                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True"></FooterStyle>
                                <Columns>
                                 <asp:TemplateField HeaderText="Order No.">
                                        <ItemStyle BorderWidth="1px" HorizontalAlign="Left" Wrap="False"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblExchangeTrades_OrderNumber" runat="server" Text='<%# Eval("ExchangeTrades_OrderNumber")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Trade No.">
                                        <ItemStyle BorderWidth="1px" HorizontalAlign="Left" Wrap="False"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblExchangeTrades_TradeNumber" runat="server" Text='<%# Eval("ExchangeTrades_TradeNumber")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="UCC">
                                        <ItemStyle BorderWidth="1px" HorizontalAlign="Left" Wrap="False"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblExchangeTrades_CustomerUcc" runat="server" Text='<%# Eval("ExchangeTrades_CustomerUcc")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Name">
                                        <ItemStyle BorderWidth="1px" HorizontalAlign="Left" Wrap="False"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Symbol">
                                        <ItemStyle BorderWidth="1px" HorizontalAlign="left" Wrap="False"></ItemStyle>
                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblExchangeTrades_SecuritySymbol" runat="server" Text='<%# Eval("ExchangeTrades_SecuritySymbol")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Product Name">
                                        <ItemStyle BorderWidth="1px" HorizontalAlign="left" Wrap="False"></ItemStyle>
                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblproductname" runat="server" Text='<%# Eval("productname")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Flag">
                                        <ItemStyle BorderWidth="1px" HorizontalAlign="Center" Wrap="False"></ItemStyle>
                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblExchangeTrades_BuySellFlag" runat="server" Text='<%# Eval("ExchangeTrades_BuySellFlag")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Qty">
                                        <ItemStyle BorderWidth="1px" HorizontalAlign="Right" Wrap="False"></ItemStyle>
                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblExchangeTrades_UnitPriceQuantity" runat="server" Text='<%# Eval("ExchangeTrades_UnitPriceQuantity")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Mkt Rate">
                                        <ItemStyle BorderWidth="1px" HorizontalAlign="Right" Wrap="False"></ItemStyle>
                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblExchangeTrades_UnitPrice" runat="server" Text='<%# Eval("ExchangeTrades_UnitPrice")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Type">
                                        <ItemStyle BorderWidth="1px" HorizontalAlign="Left" Wrap="False"></ItemStyle>
                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblExchangeTrades_TransactionType" runat="server" Text='<%# Eval("ExchangeTrades_TransactionType")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Terminal Id">
                                        <ItemStyle BorderWidth="1px" HorizontalAlign="Left" Wrap="False"></ItemStyle>
                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblExchangeTrades_TerminalID" runat="server" Text='<%# Eval("ExchangeTrades_TerminalID")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                      <asp:TemplateField HeaderText="CTCL Id">
                                        <ItemStyle BorderWidth="1px" HorizontalAlign="Left" Wrap="False"></ItemStyle>
                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblExchangeTrades_CTCLID" runat="server" Text='<%# Eval("ExchangeTrades_CTCLID")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Trade Time">
                                        <ItemStyle BorderWidth="1px" HorizontalAlign="right" Wrap="False"></ItemStyle>
                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblExchangeTrades_TradeEntryTime" runat="server" Text='<%# Eval("ExchangeTrades_TradeEntryTime")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                 <PagerTemplate>
                                        <table>
                                            <tr>
                                                <td colspan="10">
                                                    <asp:LinkButton ID="FirstPage" runat="server" Font-Bold="true" CommandName="First"
                                                        OnCommand="NavigationLink_Click" Text="[First Page]"> </asp:LinkButton>
                                                    <asp:LinkButton ID="PreviousPage" runat="server" Font-Bold="true" CommandName="Prev"
                                                        OnCommand="NavigationLink_Click" Text="[Previous Page]">  </asp:LinkButton>
                                                    <asp:LinkButton ID="NextPage" runat="server" Font-Bold="true" CommandName="Next"
                                                        OnCommand="NavigationLink_Click" Text="[Next Page]">
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="LastPage" runat="server" Font-Bold="true" CommandName="Last"
                                                        OnCommand="NavigationLink_Click" Text="[Last Page]">
                                                    </asp:LinkButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </PagerTemplate>
                                <RowStyle BackColor="White" ForeColor="#330099" BorderColor="#BFD3EE" BorderStyle="Double"
                                    BorderWidth="1px"></RowStyle>
                                <EditRowStyle BackColor="#E59930"></EditRowStyle>
                                <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" Font-Bold="True"></SelectedRowStyle>
                                <PagerStyle ForeColor="White" HorizontalAlign="Center"></PagerStyle>
                                <HeaderStyle ForeColor="Black" BorderWidth="1px" CssClass="EHEADER" BorderColor="AliceBlue"
                                    Font-Bold="False"></HeaderStyle>
                            </asp:GridView>
                             <asp:HiddenField ID="CurrentPage" runat="server"></asp:HiddenField>
                                <asp:HiddenField ID="TotalPages" runat="server"></asp:HiddenField>
                                <asp:HiddenField ID="TotalClient" runat="server" />
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btn_show" EventName="Click" />
                                                         
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
          
        </table>
        <table><tr><td>  <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
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
                                        
                                    </asp:UpdateProgress></td></tr></table>
       
    </div>
    </form>
</body>
</html>