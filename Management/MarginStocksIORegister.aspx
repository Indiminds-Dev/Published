<%@ page language="C#" autoeventwireup="true" inherits="Reports_MarginStocksIORegister, App_Web_psdiigfa" enableeventvalidation="false" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Margin I/O Register</title>
     <link href="../CSS/style.css" rel="stylesheet" type="text/css" />
         <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
  <%--  <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>--%>
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
	.grid_scroll
     {
		    overflow-y: no;  
            overflow-x: scroll; 
            width:90%;
            scrollbar-base-color: #C0C0C0;
        
	}
	
	</style>
 <script language="javascript" type="text/javascript">
    groupvalue="";
   function Page_Load()///Call Into Page Load
            {   
                Hide('td_from');
                Hide('td_to');
                Show('td_for');
                Hide('showFilter');
                Hide('DATADISPLAY');
                Hide('tr_filter');
                Hide('UpdatePanel4');
                 SendmailFilter();
                document.getElementById('chkAc').disabled=false;
                document.getElementById('chkdp').disabled=false;
                document.getElementById('chksale').disabled=false;
                document.getElementById('chkpur').disabled=false;
                document.getElementById('chkledgerbaln').disabled=false;
                document.getElementById('chkcashmargin').disabled=false;
                height();
               
            }
  function Hide(obj)
            {
             document.getElementById(obj).style.display='none';
            }
  function Show(obj)
            {
             document.getElementById(obj).style.display='inline';
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
    function ddlchange(obj)
    {
    
       if(obj=="0")
       {
    
            Hide('td_from');
            Hide('td_to');
            Show('td_for');
                document.getElementById('chkAc').disabled=false;
                document.getElementById('chkdp').disabled=false;
                document.getElementById('chksale').disabled=false;
                document.getElementById('chkpur').disabled=false;
                document.getElementById('chkledgerbaln').disabled=false;
                document.getElementById('chkcashmargin').disabled=false;
       }
       else
       { 
            Show('td_from');
            Show('td_to');
            Hide('td_for');
                document.getElementById('chkAc').disabled=false;
                document.getElementById('chkdp').disabled=true;
                document.getElementById('chksale').disabled=true;
                document.getElementById('chkpur').disabled=true;
                document.getElementById('chkledgerbaln').disabled=true;
                document.getElementById('chkcashmargin').disabled=true;
       } 
       selecttion();
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
         
          ajax_showOptions(objID,objListFun,objEvent,cmbVal);
        }
     function Scrip(obj)
        {
             if(obj=="a")
                Hide('showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='Scrips';
                  Show('showFilter');
             }
             selecttion();
        }
     function Segment(obj)
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
             Hide('litSegmentMain');
              var btn = document.getElementById('btnhide');
              btn.click();
            selecttion();
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
             selecttion();
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
              selecttion();
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
           selecttion();
      }
      function ddldpac(obj)
      { 
        if(obj=="0")
        {
           document.getElementById('chkAc').disabled=false;
        }
        else
        {
           document.getElementById('chkAc').disabled=true;
        }
        selecttion();
      }
   function NORECORD(obj)
      {
       Show('tab1');
       Show('tab2');
       Show('tab3');
       Hide('td_from');
       Hide('td_to');
       Show('td_for');
       Hide('showFilter');
       Hide('tr_filter');
       Hide('DATADISPLAY');
       Hide('UpdatePanel4');
       document.getElementById('chkAc').disabled=false;
       document.getElementById('chkdp').checked=false;
       document.getElementById('chksale').checked=false;
       document.getElementById('chkpur').checked=false;
       document.getElementById('chkledgerbaln').disabled=false;
       document.getElementById('chkcashmargin').disabled=false;
       if(obj==1)
       {
              alert('No Record Found');
       }
       height();
      }
   function Display(obj)
        {
            Hide('tab1');
            Hide('tab2');
            Hide('tab3');
            Show('tr_filter');
            Show('DATADISPLAY');
            document.getElementById('spanshow2').innerText=obj;
            height();
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
                document.getElementById('btn_show').disabled=false;
                Hide('UpdatePanel4');
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
            var combo=document.getElementById('ddlExport');
            combo.value='Ex';
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
  function fn_ddlreportchange(obj)
  {
  
    if(obj.value=="0")
    {
       document.getElementById('chkAc').disabled=false;
       document.getElementById('chkdp').disabled=false;
       document.getElementById('chksale').disabled=false;
       document.getElementById('chkpur').disabled=false;
       document.getElementById('chkledgerbaln').disabled=false;
       document.getElementById('chkcashmargin').disabled=false;
    }
    else if(obj.value=="3")
    {
       document.getElementById('chkAc').disabled=true;
       document.getElementById('chkdp').disabled=true;
       document.getElementById('chksale').disabled=true;
       document.getElementById('chkpur').disabled=true;
       document.getElementById('chkledgerbaln').disabled=true;
       document.getElementById('chkcashmargin').disabled=true;
    }
    selecttion();
    
  }
   function showProgress()
        { 
         document.getElementById('Div1').style.display="inline";
        }
   
  
              FieldName='lstSlection';
    </script> 
     <script type="text/ecmascript">   
       function ReceiveServerData(rValue)
        {
               
//                var j=rValue.split('~');
//                if(j[0]=='Group')
//                {
//                   groupvalue=j[1];
//                }
                var j=rValue.split('~');
               
                if(j[0]=='Group')
                {
                   groupvalue=j[1];
                }
                if(j[0]=='Branch')
                {
                   groupvalue=j[1];
                }
                var btn = document.getElementById('btnhide');
                btn.click();
        }
                       //THIS IS FOR EMAIL
        
          function btnAddEmailtolist_click()
            {
            
                var cmb=document.getElementById('cmbsearch');
            
                    var userid = document.getElementById('txtSelectID');
                    if(userid.value != '')
                    {
                        var ids = document.getElementById('txtSelectID_hidden');
                        var listBox = document.getElementById('SelectionList');
                        var tLength = listBox.length;
                       
                        
                        var no = new Option();
                        no.value = ids.value;
                        no.text = userid.value;
                        listBox[tLength]=no;
                        var recipient = document.getElementById('txtSelectID');
                        recipient.value='';
                    }
                    else
                        alert('Please search name and then Add!')
                    var s=document.getElementById('txtSelectID');
                    s.focus();
                    s.select();

            }
    
        
   function callAjax1(obj1,obj2,obj3)
    {
     document.getElementById('SelectionList').style.display='none';
        var combo = document.getElementById("cmbsearch");
        var set_value = combo.value
        var obj4='Main';
       
        if (set_value=='16')
        {
            ajax_showOptions(obj1,'GetLeadId',obj3,set_value,obj4)
        }
        else
        {
         
            ajax_showOptions(obj1,obj2,obj3,set_value,obj4)	  
        }
        
    }
    
       function clientselection()
	        {
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
                 document.getElementById('ShowSelectUser').style.display='none';
                 document.getElementById('ShowTable').style.display='none';
                 document.getElementById('showFilter1').style.display='inline';
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
           
                window.frameElement.height = document.body.scrollHeight;
	        }
	        
	   function btnRemoveEmailFromlist_click()
            {
                
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
            }
        }
        
     function Sendmail() 
        {
         Show('UpdatePanel4');
          var cmbVal=document.getElementById('ddlreporttype').value;
         if(cmbVal=="0")
            {
             document.getElementById('ShowSelectUser').style.display='inline';
             document.getElementById('ShowTable').style.display='none';
             document.getElementById('showFilter1').style.display='inline';
             window.frameElement.height = document.body.scrollHeight;
           
            }
            else if(cmbVal=="3")
            {
             document.getElementById('rbOnlyClient').disabled=true;
             document.getElementById('rbClientUser').disabled=false;
             SelectUserClient('User');
             document.getElementById('ShowSelectUser').style.display='none';
             document.getElementById('ShowTable').style.display='inline';
             document.getElementById('showFilter1').style.display='none';
             window.frameElement.height = document.body.scrollHeight;
            
            }
          
        
        
        
        
//            document.getElementById('ShowSelectUser').style.display='inline';
//            document.getElementById('ShowTable').style.display='none';
//            document.getElementById('showFilter1').style.display='inline';
//             window.frameElement.height = document.body.scrollHeight;
            
        }
    function ForFilterOff()
     {
            selecttion();
             document.getElementById('ShowTable').style.display='none';
            document.getElementById('showFilter1').style.display='none';
            Show('tdgrdBrkgclient');
            Show('tr_export');
            Hide('tr_btn');
            Hide('tr_date');
            Hide('tr_under');
             window.frameElement.height = document.body.scrollHeight;
     }
    function MailsendT()
    {
    
    window.frameElement.height = document.body.scrollHeight;
    alert("Mail Sent Successfully");
    }
   function MailsendF()
    {
  window.frameElement.height = document.body.scrollHeight;
    alert("Error on sending!Try again..");
    }
   function MailsendFT()
    {
    alert("Email id could not found!Try again...");
    }
               
        function keyVal(obj)
         {
           document.getElementById('SelectionList').style.display='inline';
     
         }   
         
         function SendmailFilter() 
        {
            document.getElementById('ShowSelectUser').style.display='none';
            document.getElementById('ShowTable').style.display='none';
            document.getElementById('showFilter1').style.display='none';
            window.frameElement.height = document.body.scrollHeight;
            
        }
           function SelectUserClient(obj)
 {
            if(obj=='Client')
            {
                      
            document.getElementById('ShowSelectUser').style.display='inline';
            document.getElementById('ShowTable').style.display='none';
            document.getElementById('showFilter1').style.display='inline';
            window.frameElement.height = document.body.scrollHeight;
            
            }
           else if(obj=='User')
            {
                  document.getElementById('ShowTable').style.display='inline';
                  document.getElementById('ShowSelectUser').style.display='inline';
                  document.getElementById('showFilter1').style.display='none';
                  window.frameElement.height = document.body.scrollHeight;
            }
 }
        </script>
 
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server"  autocomplete="off">
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
                    <td class="EHEADER" colspan="0" style="text-align: center; height: 22px;">
                        <strong><span id="SpanHeader" style="color: #000099">Margin Stocks Inward/Outward Register</span></strong>
                    </td>
                    <td class="EHEADER" width="25%" id="tr_filter" style="height: 22px">
                        <a href="javascript:void(0);" onclick="Sendmail();"><span style="color: Blue; text-decoration: underline;
                            font-size: 8pt; font-weight: bold">Send Email</span></a>|| 
                        <a href="javascript:void(0);" onclick="NORECORD(2);"><span style="color: Blue; text-decoration: underline;
                            font-size: 8pt; font-weight: bold">Filter</span></a> &nbsp; &nbsp;||&nbsp;
                        <asp:DropDownList ID="ddlExport" Font-Size="Smaller" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlExport_SelectedIndexChanged">
                            <asp:ListItem Selected="True" Value="Ex">Export</asp:ListItem>
                            <asp:ListItem Value="E">Excel</asp:ListItem>
                            <asp:ListItem Value="P">PDF</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <table >
                <tr valign="top" id="tab1">
                    <td>
                        Report Type :
                    </td>
                    <td>
                        <asp:DropDownList ID="cmbreporttype" runat="server" Width="100px" Font-Size="10px"
                            onchange="ddlchange(this.value)">
                            <asp:ListItem Value="0">Holding</asp:ListItem>
                            <asp:ListItem Value="1">Transaction</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td id="td_for">
                        <dxe:ASPxDateEdit ID="dtFor" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                            Font-Size="10px" Width="108px" ClientInstanceName="dtfor">
                            <dropdownbutton text="For"></dropdownbutton>
                        </dxe:ASPxDateEdit>
                    </td>
                    <td id="td_from">
                        <dxe:ASPxDateEdit ID="dtFrom" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                            Font-Size="10px" Width="108px" ClientInstanceName="dtFrom">
                            <dropdownbutton text="From"></dropdownbutton>
                        </dxe:ASPxDateEdit>
                    </td>
                    <td id="td_to">
                        <dxe:ASPxDateEdit ID="dtTo" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                            Font-Size="10px" Width="108px" ClientInstanceName="dtTo">
                            <dropdownbutton text="To"></dropdownbutton>
                        </dxe:ASPxDateEdit>
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
                                        <tr>
                                            <td>
                                                Scrips :</td>
                                            <td>
                                                <asp:RadioButton ID="rdScripAll" runat="server" Checked="True" GroupName="a" onclick="Scrip('a')" /> All
                                            </td>
                                            
                                            <td>
                                                <asp:RadioButton ID="rdScripSelected" runat="server" GroupName="a" onclick="Scrip('b')" /> Selected
                                            </td>
                                           
                                            <td colspan="3">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Segment :</td>
                                            <td>
                                                <asp:RadioButton ID="rdbSegmentAll" runat="server" GroupName="b" onclick="Segment('a')" />All
                                            </td>
                                           
                                            <td>
                                                <asp:RadioButton ID="rdbSegmentSelected" runat="server" Checked="True" GroupName="b"
                                                    onclick="Segment('b')" />Selected
                                                    <span id="litSegmentMain" runat="server" style="color: Maroon"></span>

                                            </td>
                                            
                                            <td colspan="3">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                DP Accounts</td>
                                            <td colspan="5">
                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:DropDownList ID="ddlDPAc" runat="server" Width="191px" Font-Size="10px" onchange="ddldpac(this.value)">
                                                        </asp:DropDownList>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btnhide" EventName="Click"></asp:AsyncPostBackTrigger>
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </td>
                                        </tr>
                                        <tr>
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
                                                            <asp:RadioButton ID="rdbranchAll" runat="server" Checked="True" GroupName="c" onclick="Branch('a')" /> All
                                                        </td>
                                                       
                                                        <td>
                                                            <asp:RadioButton ID="rdbranchSelected" runat="server" GroupName="c" onclick="Branch('b')" />Selected
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
                                                         <asp:RadioButton ID="rdddlgrouptypeAll" runat="server" Checked="True" GroupName="e" onclick="Group('a')" /> All
                                                         <asp:RadioButton ID="rdddlgrouptypeSelected" runat="server" GroupName="e" onclick="Group('b')" />Selected
                                                        </td>
                                                    </tr>
                                                </table>
                                            
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Clients :</td>
                                            <td>
                                                <asp:RadioButton ID="rdbClientALL" runat="server" Checked="True" GroupName="d" onclick="Clients('a')" /> All Client
                                            </td>
                                             <td>
                                                    <asp:RadioButton ID="radPOAClient" runat="server" GroupName="d" onclick="Clients('a')" />POA Client
                                                </td>
                                            <td>
                                                <asp:RadioButton ID="rdbClientSelected" runat="server" GroupName="d" onclick="Clients('b')" /> Selected Client
                                            </td>
                                          
                                            <td colspan="2">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Report For</td>
                                            <td colspan="5">
                                                <asp:DropDownList ID="ddlreporttype" runat="server" Width="200px" Font-Size="10px" onchange="fn_ddlreportchange(this)">
                                                    <asp:ListItem Value="0">Client Wise [Default]</asp:ListItem>
                                                   <%-- <asp:ListItem Value="1">Branch/Group + Client</asp:ListItem>
                                                    <asp:ListItem Value="2">Scrip + Client +DP Account</asp:ListItem>--%>
                                                    <asp:ListItem Value="3">DP Account+Scrip+Client</asp:ListItem>
                                                </asp:DropDownList></td>
                                        </tr>
                                         <tr>
                                            <td colspan="6">
                                                Pendg. Pur/Sales Valuation Method 
                                           <asp:RadioButton ID="rdbCloseprice" runat="server" Checked="True" GroupName="dd" />Close Price
                                            <asp:RadioButton ID="rdbTradeprice" runat="server" GroupName="dd" />Trade Price
                                                </td>
                                        </tr>
                                        <tr>
                                            <td colspan="6">
                                                <asp:CheckBox ID="chkAc" runat="server" />
                                                Show A/C Details
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="6">
                                                <asp:CheckBox ID="chkdp" runat="server" />
                                                Show DP Holdings
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="6">
                                                <asp:CheckBox ID="chksale" runat="server" />
                                                Show Pending Sales
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="6">
                                                <asp:CheckBox ID="chkpur" runat="server" />
                                                Show Pending Purchases
                                            </td>
                                        </tr>
                                         <tr>
                                            <td colspan="6">
                                                <asp:CheckBox ID="chkledgerbaln" runat="server" />
                                                Show Ledger Baln.
                                            </td>
                                        </tr>
                                         <tr>
                                            <td colspan="6">
                                                <asp:CheckBox ID="chkcashmargin" runat="server" />
                                                Cash Margin Deposit
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="6">
                                                <asp:Button ID="btn_show" runat="server" CssClass="btnUpdate" Height="20px" Text="Show"
                                                    Width="101px" OnClick="btn_show_Click" OnClientClick="selecttion()"/>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                    <table width="100%" id="showFilter">
                                        <tr>
                                            <td style="text-align: right; vertical-align: top; height: 134px;">
                                                <table cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td class="gridcellleft" style="vertical-align: top; text-align: right; height: 21px;" id="TdFilter">
                                                            <span id="spanunder"></span><span id="spanclient"></span>
                                                                <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="150px" onkeyup="FunClientScrip(this,'ShowClientFORMarginStocks',event)"></asp:TextBox>

                                                            <asp:DropDownList ID="cmbsearchOption" runat="server" Font-Size="11px" Width="70px"
                                                                Enabled="false">
                                                                <asp:ListItem>Scrips</asp:ListItem>
                                                                <asp:ListItem>Segment</asp:ListItem>
                                                                <asp:ListItem>Clients</asp:ListItem>
                                                                <asp:ListItem>Branch</asp:ListItem>
                                                                <asp:ListItem>Group</asp:ListItem>
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
            <table id="tab3">
                <tr>
                    <td style="display: none;">
                        <asp:Button ID="btnhide" runat="server" Text="Button" OnClick="btnhide_Click" />
                        <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="150px"></asp:TextBox>

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
                                                            <font size='2' face='Tahoma'><strong align='center'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Loading..</strong></font></td>
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
        </div>
        
        
       <asp:UpdatePanel ID="UpdatePanel4" runat="server">
            <ContentTemplate>
                <table id="MainFilter">
                <tr>
                <td>
                  <table  id="ShowSelectUser"><tr>
                                            <td valign="top">
                                                <asp:RadioButton ID="rbOnlyClient" runat="server"  Checked="true" GroupName="h"/>
                                            </td>
                                            <td valign="top">
                                                Respective Client
                                            </td>
                                            <td valign="top">
                                                <asp:RadioButton ID="rbClientUser" runat="server" GroupName="h" />
                                            </td>
                                            <td valign="top">
                                                  Selected User
                                            </td>
                                           
                                        </tr></table>
                </td>
                </tr>
                    <tr>
                        <td>
                            <table id="ShowTable">
                                <tr>
                                    <td width="70px" style="text-align: left;">
                                        Type:</td>
                                    <td class="gridcellleft" style="vertical-align: top; text-align: left" id="Td1">
                                        <span id="span1">
                                            <asp:DropDownList ID="cmbsearch" runat="server" Width="150px" Font-Size="10px">
                                            </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="70px" style="text-align: left;">
                                        Select User:</td>
                                    <td class="gridcellleft" style="vertical-align: top; text-align: left" id="TdFilter1">
                                        <span id="spanal2">
                                            <asp:TextBox ID="txtSelectID" runat="server" Font-Size="12px" Width="285px"></asp:TextBox></span>
                                        <a id="A3" href="javascript:void(0);" onclick="btnAddEmailtolist_click()"><span style="color: #009900;
                                            text-decoration: underline; font-size: 8pt;">Add to List</span></a><span style="color: #009900;
                                                font-size: 8pt;"> </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="70px" style="text-align: left;">
                                    </td>
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
                                        <asp:TextBox ID="txtSelectID_hidden" runat="server" Font-Size="12px" Width="1px"></asp:TextBox>
                                        <asp:TextBox ID="dtFrom_hidden" runat="server" Font-Size="12px" Width="1px"></asp:TextBox>
                                        <asp:TextBox ID="dtTo_hidden" runat="server" Font-Size="12px" Width="1px"></asp:TextBox>
                                    </td>
                                </tr>
                                <%--  <tr>
                                    <td style="text-align:left;">
                                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" CssClass="btnUpdate" Text="Send" /></td>
                                    </tr>--%>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table id="showFilter1">
                                <tr>
                                    <td>
                                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" CssClass="btnUpdate"
                                            Text="Send" />
                                    </td>
                                </tr>
                            </table>
                </td> </tr> 
                
                </table>
          </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table id="DATADISPLAY">
                    <tr>
                        <td>
                            <span id="spanshow1" style="color: Blue; font-weight: bold">Period :</span> &nbsp;<span
                                id="spanshow2"></span></td>
                    </tr>
                    <tr>
                        <td style="display: none;">
                            <asp:DropDownList ID="cmbclient" runat="server" Font-Size="10px">
                            </asp:DropDownList></td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <table id="tblpage" cellspacing="0" cellpadding="0" runat="server" width="50%">
                                <tr>
                                    <td width="20" style="padding: 5px">
                                        <asp:LinkButton ID="ASPxFirst" runat="server" Font-Bold="True" ForeColor="maroon"
                                            OnClientClick="javascript:selecttion();showProgress();" OnClick="ASPxFirst_Click" >First</asp:LinkButton></td>
                                    <td width="25">
                                        <asp:LinkButton ID="ASPxPrevious" runat="server" Font-Bold="True" ForeColor="Blue"
                                            OnClientClick="javascript:selecttion();showProgress();" OnClick="ASPxPrevious_Click" >Previous</asp:LinkButton></td>
                                    <td width="20" style="padding: 5px">
                                        <asp:LinkButton ID="ASPxNext" runat="server" Font-Bold="True" ForeColor="maroon"
                                            OnClientClick="javascript:selecttion();showProgress();" OnClick="ASPxNext_Click" >Next</asp:LinkButton></td>
                                    <td width="20">
                                        <asp:LinkButton ID="ASPxLast" runat="server" Font-Bold="True" ForeColor="Blue" OnClientClick="javascript:selecttion();showProgress();"
                                            OnClick="ASPxLast_Click" >Last</asp:LinkButton></td>
                                </tr>
                            </table>
                        </td>
                        <td align="right">
                            <asp:Label ID="listRecord" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div id="display" runat="server">
                            </div>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btn_show" EventName="Click"></asp:AsyncPostBackTrigger>
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
</html>
