<%@ page language="C#" autoeventwireup="true" inherits="Reports_SettlementTrialNSECM, App_Web_x3w6ygwt" %>
    

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Settlement Trial </title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

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
     scrollbar-base-color: #C0C0C0;
     }
	form{
		display:inline;
	}
	
	</style>

    <script language="javascript" type="text/javascript">	
  function Page_Load(obj)///Call Into Page Load
      { 
           btndisplay('1');
           document.getElementById('SpanShow').innerText=obj;
           height();
           Hide('filter');
           Hide('showFilter');
           Hide('Td_GroupType');
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
            window.frameElement.width = document.body.scrollWidth;
        } 
      function selecttion()
        {
            var combo=document.getElementById('ddlExport');
            combo.value='Ex';
        }  
     
  function btndisplay(obj)
     {
       
        if(obj=='1')////select screen
        {
            Show('td_Screen');
            Hide('td_Excel');
            Hide('td_PDF');
            Hide('td_mail');
            Hide('showFilter');
        }
        if(obj=='2')////select export
        {
  
            Hide('td_Screen');
            Show('td_Excel');
            Show('td_PDF');
            Hide('td_mail');
            Hide('showFilter');
        }
        if(obj=='3')////select email
        {
        
            Hide('td_Screen');
            Hide('td_Excel');
            Hide('td_PDF');
            Show('td_mail');
            Show('showFilter');
        }
        fnddlType(document.getElementById('ddlType').value);
     } 
function fnddlGeneration(obj)
     {
        btndisplay(obj); 
     }  
function fnddlType(obj)
{
     if(obj=='1')////select Client+Branch Wise
     {
       Show('td_PDF');
       Hide('Td_GroupType');
     }  
     if(obj=='2')////select Branch Wise
     {
       Hide('td_PDF');
       Hide('Td_GroupType');
     }  
     if(obj=='3')////select Client Wise
     {
       Hide('td_PDF');
       Hide('Td_GroupType');
     }
     if(obj=='4' || obj=='5')
     {
       Hide('td_PDF');
       Show('Td_GroupType');
     } 
    
}
 function displayalldata()
  {
    Hide('tab_All');
    Show('displayAll');
    Show('filter');
    height();
   
  }
  function NoRecord()
  {
    
    Show('tab_All');
    Hide('displayAll');
    alert('No record Found');
    height();
  }
    function filter() 
        {
            Show('tab_All');
            Hide('displayAll');
            Hide('filter');
            height();
            selecttion();
        }
        FieldName='lstSlection';
 function FunClientScrip(objID,objListFun,objEvent)
        {
                var cmbVal;
                cmbVal=document.getElementById('cmbsearchOption').value;
                ajax_showOptions(objID,objListFun,objEvent,cmbVal);

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
    </script>
  
<script type="text/ecmascript">   
       function ReceiveServerData(rValue)
        {
               
                var j=rValue.split('~');
              

                if(j[0]=='MAILEMPLOYEE')
                {
                    document.getElementById('HiddenField_emmail').value = j[1];
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
                    <td class="EHEADER" style="text-align:center">
                        <strong><span style="color: #000099;">Settlement Trial </span></strong>
                    </td>
                    <td class="EHEADER" width="25%" id="filter">
                        <a href="javascript:void(0);" onclick="filter();"><span style="color: Blue; text-decoration: underline;
                            font-size: 8pt; font-weight: bold">Filter</span></a> ||
                        <asp:DropDownList ID="ddlExport" Font-Size="10px" runat="server" AutoPostBack="True"
                            OnSelectedIndexChanged="ddlExport_SelectedIndexChanged">
                            <asp:ListItem Selected="True" Value="Ex">Export</asp:ListItem>
                            <asp:ListItem Value="E">Excel</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <table>
                <tr valign="top">
                    <td>
                        <table id="tab_All">
                            <tr>
                                <td>
                                    <span id="SpanShow" style="color: Black; font-weight: bold"></span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table border="10" cellpadding="1" cellspacing="1">
                                        <tr>
                                            <td bgcolor="#B7CEEC" class="gridcellleft">
                                                Generate Type :
                                            </td>
                                            <td class="gridcellleft" colspan="2">
                                                <asp:DropDownList ID="ddlGeneration" runat="server" Width="130px" Font-Size="10px"
                                                    onchange="fnddlGeneration(this.value)">
                                                    <asp:ListItem Value="1">Screen</asp:ListItem>
                                                    <asp:ListItem Value="2">Export</asp:ListItem>
                                                    <asp:ListItem Value="3">Send Mail</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table border="10" cellpadding="1" cellspacing="1">
                                        <tr>
                                            <td bgcolor="#B7CEEC" class="gridcellleft">
                                                Report View :
                                            </td>
                                            <td class="gridcellleft" colspan="2">
                                                <asp:DropDownList ID="ddlType" runat="server" Width="128px" Font-Size="10px"
                                                onchange="fnddlType(this.value)">
                                                    <asp:ListItem Value="1">Branch + Client Wise </asp:ListItem>
                                                    <asp:ListItem Value="2">Branch Wise</asp:ListItem>
                                                     <asp:ListItem Value="3">Client Wise </asp:ListItem>
                                                     <asp:ListItem Value="4">Group + Client Wise </asp:ListItem>
                                                     <asp:ListItem Value="5">Group Wise </asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td id="Td_GroupType" class="gridcellleft" colspan="1">
                                                <asp:DropDownList ID="ddlGroupType" runat="server" Font-Size="10px">
                                                </asp:DropDownList></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table border="10" cellpadding="1" cellspacing="1">
                                        <tr>
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                Settlement Type
                                            </td>
                                            <td>
                                                <table border="10" cellpadding="1" cellspacing="1">
                                                    <tr>
                                                        <td>
                                                            <asp:RadioButton ID="rdbSettTypeAll" runat="server" GroupName="c" />
                                                        </td>
                                                        <td>
                                                            All
                                                        </td>
                                                        <td>
                                                            <asp:RadioButton ID="rdbSettTypeCurrent" Checked="True" runat="server" GroupName="c" />
                                                        </td>
                                                        <td>
                                                            Current
                                                        </td>
                                                        <td>
                                                            (<span id="litSettlementTypeCurrent" runat="server" style="color: Maroon"></span>)
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
                                    <table border="10" cellpadding="1" cellspacing="1">
                                        <tr>
                                            <td id="td_Screen" style="height: 22px">
                                                <asp:Button ID="btnScreen" runat="server" CssClass="btnUpdate" Height="20px" Text="Screen"
                                                    Width="101px" OnClientClick="selecttion()" OnClick="btnScreen_Click" /></td>
                                            <td id="td_Excel" style="height: 22px">
                                                    <asp:Button ID="btnExcel" runat="server" CssClass="btnUpdate" Height="20px" Text="Export To Excel"
                                                    Width="101px" OnClientClick="selecttion()" OnClick="btnExcel_Click" />
                                            </td>
                                            <td id="td_PDF" style="height: 22px">
                                                   <asp:Button ID="btnPDF" runat="server" CssClass="btnUpdate" Height="20px" Text="Export To PDF"
                                                    Width="101px" OnClientClick="selecttion()" OnClick="btnPDF_Click"/>
                                            </td>
                                            <td id="td_mail" style="height: 22px">
                                                <asp:Button ID="btnMail" runat="server" CssClass="btnUpdate" Height="20px" Text="Send Mail"
                                                    Width="101px" OnClientClick="selecttion()" OnClick="btnMail_Click" /></td>
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
                                    <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="150px" onkeyup="FunClientScrip(this,'ShowClientFORMarginStocks',event)"></asp:TextBox>
                                    <asp:DropDownList ID="cmbsearchOption" runat="server" Font-Size="11px" Width="70px"
                                        Enabled="false">
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
                <tr>
                    <td colspan="2">
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
           
            
            <div id="displayAll" style="display: none;">
                <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                    <ContentTemplate>
                        <table width="100%" border="1">
                            <tr style="display: none;">
                                <td>
                                   <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="150px"></asp:TextBox>
                                   <asp:HiddenField ID="hiddencount" runat="server" />
                                     <asp:HiddenField ID="HiddenField_Date" runat="server" />
                                     <asp:HiddenField ID="HiddenField_emmail" runat="server" />
                                </td>
                            </tr>
                            <tr id="tr_DIVdisplayPERIOD">
                                <td>
                                    <div id="DIVdisplayPERIOD" runat="server">
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <div id="display" runat="server">
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
