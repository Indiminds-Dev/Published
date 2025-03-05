<%@ page language="C#" autoeventwireup="true" inherits="management_FrmCDSL_ShowClientHolding_popup, App_Web_nhjs8cfd" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
      <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>
    <link rel="stylesheet" href="../windowfiles/dhtmlwindow.css" type="text/css" />
    <script type="text/javascript" src="../windowfiles/dhtmlwindow.js"></script>
    <link rel="stylesheet" href="../modalfiles/modal.css" type="text/css" />
    <script type="text/javascript" src="../modalfiles/modal.js"></script>
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
      function ForFilterOff()
        {
            hide('filter');  
           show('btnfilter');
        
//            document.getElementById("TrAll").style.display='none';
//            document.getElementById("TdAll1").style.display='none';
//            document.getElementById("TrBtn").style.display='none';
//            document.getElementById('spanBtn').style.display='none';
            height();
        }
   function MailsendT()
    {
    alert("Mail Sent Successfully");
    }
   function MailsendF()
    {
    alert("Error on sending!Try again..");
    }
    function SignOff()
    {
        window.parent.SignOff();
    }
    
   function EndCall(obj)
    {
        height();
    }
   function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
    {
        if(document.body.scrollHeight>=500)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '500px';
        window.frameElement.Width = document.body.scrollWidth;
    }
    
    function PageLoad()
    {
        FieldName='SelectionList';
        document.getElementById('txtName_hidden').style.display="none";
      //  document.getElementById('txtISIN_hidden').style.display="none";
       // document.getElementById('txtSettlement_hidden').style.display="none";
        ShowEmployeeFilterForm('A');
//        ShowISINFilterForm('A');
//        ShowSettlementFilterForm('A');
       // hide('btnfilter');
         hide('ShowSelectUser');
       document.getElementById('showFilter1').style.display="none";
    } 
    
    
    function ShowEmployeeFilterForm(obj)
    {
        document.getElementById('txtName_hidden').value="";
        if(obj=='A')
        {
            hide('txttdName');
            hide('tdname');
            document.getElementById('txtName_hidden').style.display="none";
            document.getElementById('txtName').value="";
        }
        if(obj=='S')
        {
           var cmb=document.getElementById('cmbsearch');
            cmb.value='Clients';
            show('txttdName');
            show('tdname');
            document.getElementById('txtName_hidden').style.display="none";
             document.getElementById('txtName').focus();
        }
    }
    
    function NoOfRows(obj)
    {
        //alert(obj);
        Noofrows=obj;
        document.getElementById('txtName_hidden').style.display="none";
    }
    function show(obj1)
    {
        //alert(obj1);
         document.getElementById(obj1).style.display='inline';
    }
    function hide(obj1)
    {
        //alert(obj1);
         document.getElementById(obj1).style.display='none';
    }
    FieldName='SelectionList';
    
     function Sendmail() 
        {
        
       
              document.getElementById('ShowSelectUser').style.display='inline';
              
              if(document.getElementById('rbClientUser').checked==true)
                  {
                 
                   document.getElementById('showFilter1').style.display="none";
                   
                  }
                  else
                  {
                  
                   document.getElementById('showFilter1').style.display="inline";
                   
                  }
               
                       document.getElementById('tdBrGr').style.display="none";
                       document.getElementById('tdCl').style.display="inline";
                       document.getElementById('tdSU').style.display="inline";
            
            
        }  
   
   function User(obj)
      {
            if(obj=="User")
            {
                  var cmb=document.getElementById('cmbsearch');
                  cmb.value='User';
                  show('txttdname');
                  show('tdname');
                  document.getElementById('txtName_hidden').style.display="none";
                  document.getElementById('txtName').focus();
                  document.getElementById('showFilter1').style.display="none";
           }
          else
           {
                  document.getElementById('txttdname').style.display="none";
                  document.getElementById('tdname').style.display="none";
                  document.getElementById('showFilter1').style.display="inline";
           
           }
            
            height();
     }
   
    function FunClientScrip(objID,objListFun,objEvent)
        {
          if(document.getElementById('cmbsearch').value=="User")
          { 
           ajax_showOptions(objID,'GetMailId',objEvent,'EM');
          }
          else
          {
          
//          var Client=document.getElementById('txtName_hidden');
//        var isin=document.getElementById('txtISIN_hidden');
//        var obj4=dateCombo.GetValue()+'~'+ClientType.GetValue()+'~'+Client.value+'~'+isin.value;
//        ajax_showOptions(obj1,obj2,obj3,obj4 );
//          
          
//                var cmbVal;
//                var cmbTime=document.getElementById('txtDate_I');
//                var cmbType=document.getElementById('ASPxComboBox1_VI');
//                var Client=document.getElementById('txtName_hidden');
//                var isin=document.getElementById('txtISIN_hidden');
//                var GtCL=cmbTime.value+'~'+cmbType.value+'~'+Client.value+'~'+isin.value

         
                var cmbVal;
                var cmbTime=document.getElementById('txtDate_I');
                var cmbType=document.getElementById('ASPxComboBox1_VI');
                var Client=document.getElementById('txtName_hidden');
                var isin=document.getElementById('txtISIN_hidden');
                var GtCL=dateCombo.GetValue()+'~'+ClientType.GetValue()+'~'+Client.value+'~'+isin.value
                
//                 cmbVal=document.getElementById('cmbsearch').value;
//                           cmbVal=cmbVal+'~'+ GtCL + document.getElementById('ddlgrouptype').value;
//                
               
                
                  if(groupvalue=="")
                  {
                           if(document.getElementById('cmbsearch').value=="Clients")
                           {
                           cmbVal=document.getElementById('cmbsearch').value;
                           cmbVal=cmbVal+'~'+ GtCL + document.getElementById('ddlgrouptype').value;
                                                     
                           }
                          else
                           {
                           cmbVal=document.getElementById('cmbsearch').value;
                           cmbVal=cmbVal+'~'+document.getElementById('ddlgrouptype').value;
                          
                           }
                  }
                  else
                  { 
                    if(document.getElementById('cmbsearch').value=="Clients")
                    {
                       if(document.getElementById('ddlGroup').value=="0")//////////////Group By  selected are branch
                        {
                           if(document.getElementById('rdbranchAll').checked==true)
                              {                    
                                  cmbVal=document.getElementById('cmbsearch').value+'Branch';
                                  cmbVal=cmbVal+'~'+ GtCL +'ALL'+'~'+document.getElementById('ddlgrouptype').value;
                              }
                              else
                              {
                                  cmbVal=document.getElementById('cmbsearch').value+'Branch';
                                  cmbVal=cmbVal+'~'+ GtCL +'Selected'+'~'+groupvalue;
                                          
                              }
                          }
                           else //////////////Group By selected are Group
                              {
                               if(document.getElementById('rdddlgrouptypeAll').checked==true)
                                  {
                                    cmbVal=document.getElementById('cmbsearch').value+'Group';
                                    cmbVal=cmbVal+'~'+ GtCL +'ALL'+'~'+document.getElementById('ddlgrouptype').value;
                                  }
                                   else
                                  {
                                    cmbVal=document.getElementById('cmbsearch').value+'Group';
                                    cmbVal=cmbVal+'~'+ GtCL +'Selected'+'~'+groupvalue; 
                                 }
                             }
                    }
                    else
                    {
                        cmbVal=document.getElementById('cmbsearch').value;
                        cmbVal=cmbVal+'~'+document.getElementById('ddlgrouptype').value;
                    }
                  }
                 
                
                 
                  ajax_showOptions(objID,objListFun,objEvent,cmbVal);
          }

    }  
    
    function btnAddEmailtolist_click()
            {
            
                var cmb=document.getElementById('cmbsearch');
            
                    var userid = document.getElementById('txtName');
                    if(userid.value != '')
                    {
                        var ids = document.getElementById('txtName_hidden');
                        var listBox = document.getElementById('SelectionList');
                        var tLength = listBox.length;
                       
                        
                        var no = new Option();
                        no.value = ids.value;
                        no.text = userid.value;
                        listBox[tLength]=no;
                        var recipient = document.getElementById('txtName');
                        recipient.value='';
                    }
                    else
                        alert('Please search name and then Add!')
                    var s=document.getElementById('txtName');
                    s.focus();
                    s.select();

            }

           function clientselection()
	        {
	        
	           selecttion();
	            var listBoxSubs = document.getElementById('SelectionList');
	         
                var cmb=document.getElementById('cmbsearch');
              
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
                   
                    
                    CallServer1(sendData,"");
                   
                 document.getElementById('txttdname').style.display='none';
                 
                }
                else
                {
                alert("Please select email from list.")
                }
               
	            var i;
                for(i=listBoxSubs.options.length-1;i>=0;i--)
                {
                    listBoxSubs.remove(i);
                 }
                   if(cmb.value=="User")
                 {
                 document.getElementById('showFilter1').style.display="inline";
                 document.getElementById('ShowSelectUser').style.display="none";
                 }
                 height();
           
                
	        }
	        
	     function btnRemoveEmailFromlist_click()
            {
                selecttion();
                var listBox = document.getElementById('SelectionList');
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
	     
	     function ReceiveSvrData(rValue)
        {            
            var Data=rValue.split('~');
            if(Data[0]=='Clients')
            {
                document.getElementById('hidClients').value = Data[1];
            }
            else if(Data[0]=='Branch')
            {
                document.getElementById('hidBranch').value = Data[1];
            }
            else if(Data[0]=='Group')
            {
                document.getElementById('hidGroup').value = Data[1];
            }
            else if(Data[0]=='User')
            {
                
            }
        }
	     
	       function selecttion()
        {            
            var combo=document.getElementById('ddlExport');
            combo.value='Ex';
        }
	     
         function ShowHideFilter(obj)
        {
           grid.PerformCallback(obj);
        }
        
        function ShowTransactions(isinvalue)
        {
             var left = ((screen.width-920)/2)-10;
             var top = ((screen.height-450)/2);
             var benaccno=document.getElementById('hdnBenAccNo').value;
             var url='frmTransactionSingleClient.aspx?Boid=' + benaccno + '&isin=' + isinvalue;
                 
             tranwindow=window.open(url,'ViewTransactions','width=920,height=450,left=' + left + ',top=' + top);
//             tranwindow.moveTo(200,200);
//              window.open(url,"View Transactions","menubar=1,status=1,scrollbars=1,resizable=1,width=350,height=250");
             //OnMoreInfoClick(url,"View Transactions",'920px','410px',"Y");  
        }
        
        
function OnMoreInfoClick(url,HeaderText,Width,Height,anyKey) //AnyKey will help to call back event to child page, if u have to fire more that one function 
        {
             editwin=dhtmlmodal.open("Editbox", "iframe", url,HeaderText , "width="+Width+",height="+Height+",center=1,resize=1,scrolling=2,top=500", "recal")
             
        }
    
    </script>
     <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    <asp:ScriptManager ID="ScriptManager1" EnablePartialRendering="true" runat="server"
                AsyncPostBackTimeout="3600">
            </asp:ScriptManager>
         <table class="TableMain100">
                <tr>
                    <td class="EHEADER" colspan="0" style="text-align: center;">
                        <strong><span style="color: #000099">CDSL Holding Value</span></strong>
                    </td>
                    <td width="35%" id="btnfilter">
                     
                        <asp:DropDownList ID="ddlExport" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlExport_SelectedIndexChanged1">
                            <asp:ListItem Value="Ex" Selected="True">Export</asp:ListItem>
                            <asp:ListItem Value="E">Excel</asp:ListItem>
                            <asp:ListItem Value="P">PDF</asp:ListItem>
                            <asp:ListItem Value="PM">PDF DIFF PAGES</asp:ListItem>
                        </asp:DropDownList>||
                       
                     
                        <a href="javascript:void(0);" onclick="javascript:Sendmail();"><span style="color: Blue; text-decoration: underline;
                            font-size: 8pt; font-weight: bold">Send Email</span></a>
                           
                            
                    </td>
                </tr>
            </table>
            <table id="ShowSelectUser">
                <tr>
                    <td id="tdBrGr">
                        <table>
                            <tr>
                                <td valign="top">
                                    <asp:RadioButton ID="rbOnlyClient" runat="server" Checked="true" GroupName="h" />
                                </td>
                                <td valign="top">
                                    <%-- <asp:Label ID="lblSelectBrCl" runat="server" Text=""></asp:Label>--%>
                                    <asp:TextBox ID="lblSelectBrCl" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td id="tdCl">
                        <table>
                            <tr>
                                <td valign="top">
                                    <asp:RadioButton ID="rbRspctvClient" runat="server" Checked="true" GroupName="h" />
                                </td>
                                <td valign="top">
                                    <%-- <asp:Label ID="lblSelectBrCl" runat="server" Text=""></asp:Label>--%>
                                    Respective Client
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td id="tdSU">
                        <table>
                            <tr>
                                <td valign="top">
                                    <asp:RadioButton ID="rbClientUser" runat="server" GroupName="h" />
                                </td>
                                <td valign="top">
                                    Selected User
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
             <table id="showFilter1">
                <tr>
                    <td>
                        <asp:Button ID="Button2" runat="server" OnClick="Button1_Click" CssClass="btnUpdate"
                            Text="Send" OnClientClick="javascript:selecttion();" />
                    </td>
                </tr>
            </table><br />
            <table id="txttdname">
                                                <%--<table id="txttdname">--%>
                        
                                        <tr>
                                            <td id="tdname" valign="top">
                                                <span class="Ecoheadtxt" style="color: blue"><strong></strong></span>
                                            </td>
                                            <%-- <td id="txttdname">
                                                            <asp:TextBox ID="txtName_hidden" runat="server" Width="14px"></asp:TextBox>
                                                            <asp:TextBox ID="txtName" runat="server" Width="250px" Font-Size="11px" Height="20px"></asp:TextBox>
                                                        </td>--%>
                                            <td>
                                                <table width="100%">
                                                    <tr>
                                                        <td class="gridcellleft" style="vertical-align: top; text-align: left" id="TdFilter1">
                                                            <span id="spanal2">
                                                              <%-- <asp:TextBox ID="txtName" runat="server" Font-Size="12px" Width="285px"></asp:TextBox></span>--%>
                                                            <span id="span2">
                                                    <asp:TextBox ID="txtName" runat="server" Font-Size="12px" Width="285px" onkeyup="FunClientScrip(this,'CDSLHoldingClientsGroups',event)"></asp:TextBox></span>
                                                            <span id="span1" visible="false">
                                                                <asp:DropDownList ID="cmbsearch" runat="server" Width="70px" Font-Size="10px" Enabled="false">
                                                        <asp:ListItem>Clients</asp:ListItem>
                                                        <asp:ListItem>Branch</asp:ListItem>
                                                        <asp:ListItem>Group</asp:ListItem>
                                                        <asp:ListItem>User</asp:ListItem>
                                                                </asp:DropDownList></span> <a id="A3" href="javascript:void(0);" onclick="btnAddEmailtolist_click()">
                                                                    <span style="color: #009900; text-decoration: underline; font-size: 8pt;">Add to List</span></a><span
                                                                        style="color: #009900; font-size: 8pt;"> </span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left; vertical-align: top; height: 134px;">
                                                            <table cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        &nbsp;&nbsp;<asp:ListBox ID="SelectionList" runat="server" Font-Size="10px" Height="90px"
                                                                            Width="290px"></asp:ListBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: left">
                                                                        <table cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td>
                                                                                    <a id="AA2" href="javascript:void(0);" onclick="clientselection()"><span style="color: #000099;
                                                                                        text-decoration: underline; font-size: 10pt;">Done</span></a>&nbsp;&nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <a id="AA1" href="javascript:void(0);" onclick="btnRemoveEmailFromlist_click()"><span
                                                                                        style="color: #cc3300; text-decoration: underline; font-size: 8pt;">Remove</span></a>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr style="display: none">
                                                        <td width="70px" style="text-align: left;">
                                                        </td>
                                                        <td style="height: 23px">
                                                            <asp:TextBox ID="TextBox1" runat="server" Font-Size="12px" Width="1px"></asp:TextBox>
                                                            <asp:TextBox ID="TextBox2" runat="server" Font-Size="12px" Width="1px"></asp:TextBox>
                                                            <asp:TextBox ID="TextBox3" runat="server" Font-Size="12px" Width="1px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <%--  <tr>
                                    <td style="text-align:left;">
                                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" CssClass="btnUpdate" Text="Send" /></td>
                                    </tr>--%>
                                                </table>
                                            </td>
                                        </tr>
                                            <tr style="display: none">
                                <td style="height: 23px">
                                    <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="1px"></asp:TextBox>
                                    <asp:Button ID="btnhide" runat="server" Text="Button" OnClick="btnhide_Click" />
                                </td>
                            </tr>
                                    </table>
            
            
    <div>
                        <table class="TableMain100">
                            <tbody>
                                <tr>
                                    <td id="ShowFilter" width="7%">
                                        <a href="javascript:ShowHideFilter('s');"><span style="color: #000099; text-decoration: underline">
                                            Show Filter</span></a>
                                    </td>
                                    <td id="Td1" width="7%">
                                        <a href="javascript:ShowHideFilter('All');"><span style="color: #000099; text-decoration: underline">
                                            All Records</span></a>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
    <div>
    
        <dxwgv:ASPxGridView ID="gridHolding" runat="server" AutoGenerateColumns="False"
            ClientInstanceName="grid" KeyFieldName="CdslHolding_ISIN" OnCustomCallback="gridHolding_CustomCallback"
             Width="100%">
            <SettingsBehavior AllowFocusedRow="True" />
            <Styles>
                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                </Header>
                
            </Styles>
            <SettingsPager PageSize="20">
            </SettingsPager>
         
            
            <Columns>
                <dxwgv:GridViewDataTextColumn Caption="ISIN No:" VisibleIndex="0" >
                <DataItemTemplate>
                    <a href="javascript:void(0);" onclick="ShowTransactions('<%# Eval("CdslHolding_ISIN")%>');"><%# Eval("CdslHolding_ISIN")%></a>
                </DataItemTemplate>
                    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                    <FooterTemplate>
                                        Total Holding Value
                                    </FooterTemplate>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Instrument Name (Short)" FieldName="CDSLISIN_ShortName"
                    VisibleIndex="1">
                    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="SettlementID" FieldName="CdslHolding_SettlementID"
                    VisibleIndex="2">
                    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
                    <CellStyle CssClass="gridcellleft">
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Current Balance" FieldName="CdslHolding_CurrentBalance"
                    UnboundType="Integer" VisibleIndex="3">
                    <Settings AllowAutoFilter="False" />
                    <CellStyle CssClass="gridcellleft" HorizontalAlign="Right">
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Free" FieldName="CdslHolding_FreeBalance"
                    UnboundType="Integer" VisibleIndex="4">
                    <Settings AllowAutoFilter="False" />
                    <CellStyle CssClass="gridcellleft" HorizontalAlign="Right">
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Pledged" FieldName="CdslHolding_PledgeBalance"
                    UnboundType="Integer" VisibleIndex="5">
                    <Settings AllowAutoFilter="False" />
                    <CellStyle CssClass="gridcellleft" HorizontalAlign="Right">
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Blocked[Earmark]" FieldName="CdslHolding_EarmarkedBalance"
                    UnboundType="Integer" VisibleIndex="6">
                    <Settings AllowAutoFilter="False" />
                    <CellStyle CssClass="gridcellleft" HorizontalAlign="Right">
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Pending Remat" FieldName="CdslHolding_PendingRematBalance"
                    UnboundType="Integer" VisibleIndex="7">
                    <Settings AllowAutoFilter="False" />
                    <CellStyle CssClass="gridcellleft" HorizontalAlign="Right">
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Pending Demat" FieldName="CdslHolding_PendingDematBalance"
                    UnboundType="Integer" VisibleIndex="8">
                    <Settings AllowAutoFilter="False" />
                    <CellStyle CssClass="gridcellleft" HorizontalAlign="Right">
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Rate" FieldName="Rate" VisibleIndex="9">
                    <Settings AllowAutoFilter="False" />
                    <CellStyle CssClass="gridcellleft" HorizontalAlign="Right">
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Value" FieldName="ISINVAlue" VisibleIndex="10">
                    <Settings AllowAutoFilter="False" />
                    <CellStyle CssClass="gridcellleft" HorizontalAlign="Right">
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
               
            </Columns>
            <Settings ShowFooter="True" ShowStatusBar="Visible" ShowTitlePanel="True" />
            <StylesEditors>
                <ProgressBar Height="25px">
                </ProgressBar>
            </StylesEditors>
            <TotalSummary>
                <dxwgv:ASPxSummaryItem DisplayFormat="#,##,###.00" FieldName="ISINVAlue" ShowInColumn="Value"
                    ShowInGroupFooterColumn="Value" SummaryType="Sum" Tag="Total Holding Value" />
            </TotalSummary>
        </dxwgv:ASPxGridView>
         <asp:TextBox ID="txtName_hidden" runat="server" Font-Size="12px" Width="1px"></asp:TextBox>
                                                            
    </div>
      <asp:HiddenField ID="hdnBenAccNo" runat="server" />
      <asp:HiddenField ID="hdnSegment" runat="Server" />
                      
    </div>
    </form>
</body>
</html>
