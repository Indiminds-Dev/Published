<%@ page language="C#" autoeventwireup="true" inherits="management_contractnogenarationiframe, App_Web_bfdn6hbr" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>*-*-*-*-* Generate ContractNote Numbers *-*-*-*-*</title>
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
	  .grid_scroll
    {
        overflow-y: no;  
        overflow-x: scroll; 
        width:85%;
        scrollbar-base-color: #C0C0C0;
    
    }
	</style>

    <script language="javascript" type="text/javascript">
 sessionexchsegment="";
 checkbrkgmain="";
    function Page_Load(obj,obj1)///Call Into Page Load
            {
                 if(obj=='1' || obj=='4')
                    Show('tr_Setttype');
                 else
                    Hide('tr_Setttype');
                    
                 if(obj1=='YES')
                    Show('tr_Scrip');
                 else
                    Hide('tr_Scrip');
                    
                 sessionexchsegment=obj;
                 checkbrkgmain=obj1;
                 fnddlGeneration('1');
//                 Hide('showFilter');
                  Hide('showFilter');
                  FnddlGroupBy(document.getElementById('ddlGroupBy').value);
                 height();
            }
    function del_pageload()
    {
                if(obj=='1' || obj=='4')
                    Show('tr_Setttype');
                 else
                    Hide('tr_Setttype');
                    
                 if(obj1=='YES')
                    Show('tr_Scrip');
                 else
                    Hide('tr_Scrip');
                 fnddlGeneration(document.getElementById('ddlGeneration').value);
                 Hide('showFilter');
                 height();
    }
    function fnddlGeneration(obj)
       {
            if(obj=='1')
            {
                 Show('td_btnShow');
                 Hide('td_btnRemove');
                 Show('tr_reuse');
            }
            else
            {
                 Hide('td_btnShow');
                 Show('td_btnRemove');
                 Hide('tr_reuse');
            }
       
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
                cmbVal=document.getElementById('cmbsearchOption').value;
                 if(cmbVal=="Group")
                    {
                         cmbVal='Group~'+document.getElementById('ddlGroup').value;
                         //ajax_showOptions(objID,objListFun,objEvent,cmbVal);
                    }
                    if(cmbVal=="ScripsExchange")
                    {
                         cmbVal='ScripsExchange~Nodate';
                         //ajax_showOptions(objID,objListFun,objEvent,cmbVal);
                    }
                ajax_showOptions(objID,objListFun,objEvent,cmbVal);
        }
        function FnOtherGroupBy(obj)
        {
             if(obj=="a")
                Hide('showFilter');
             else
             {
                
                  var cmb=document.getElementById('cmbsearchOption');
                   if(document.getElementById('ddlGroupBy').value=='Clients')
                   {
                        cmb.value='Clients';
                    }
                     if(document.getElementById('ddlGroupBy').value=='Branch')
                     {
                        cmb.value='Branch';
                     }
                  Show('showFilter');
             }
             // height();
        }
        function FnGroup(obj)
          {
               
                if(obj=="a")
                    Hide('showFilter');
                 else
                 {
                      // var cmb=document.getElementById('cmbsearchOption');
                      document.getElementById('cmbsearchOption').value='Group';
                     //alert(cmb.value);
//                      cmb.value='Group~'+document.getElementById('ddlGroup').value;
//                      alert(cmb.value);
                      Show('showFilter');
                 }
                
          }
           function  FnddlGroupBy(obj)
             {
                
                if(obj=='Group')
                {
                    
                    //alert(obj);
                   // Hide('Td_OtherGroupBy');
                    //alert(obj);
                    //Show('Td_Group');
                    
                    //alert(obj);
                    
                    Hide('Td_OtherGroupBy');
                    //alert(obj);
                    Show('Td_Group');
                    document.getElementById('BtnGroup').click();
                    
                    
                }
                else
                {
                    //alert(obj);
                    //alert(obj);
                    Show('Td_OtherGroupBy');
                    Hide('Td_Group');
                   // Show('Td_Group');
                }
                 //height();
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
                    if(document.getElementById('ddlGroupBy').value=='Group')
                        {
                            
                            CallServer(sendData+'~'+document.getElementById('ddlGroup').value,"");
                        }
                    else
                        {
                            
                            CallServer(sendData,"");
                        }
                   
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
    
   
  
 
   function fn_Scrip(obj)
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
 
  function Delete()
    {        
        var answer = confirm ("Are You Sure You Want To Delete ?");
        if (answer==true)
        {
            var answer1 = confirm ("Are You Really Sure ?");
            if(answer1==true)
            {
                var answer2 = confirm ("Are You Really Sure ?");
                if(answer2==true)
                {
                    document.getElementById('btnRemove').click();
                }
                else   
                {
                     del_pageload(sessionexchsegment,checkbrkgmain);
                }
            }
            else
            {
                  del_pageload(sessionexchsegment,checkbrkgmain);
            }
        } 
        else
        {
             del_pageload(sessionexchsegment,checkbrkgmain);
        }
                
    }
    function alertshow(obj)
    {
        Hide('tr_table1');
        if(obj=='1')
            alert('ContractNote Numbers Not Generated...Please Check Settings!');
        if(obj=='2')
            alert('Total ContractNote Numbers: -0'+ '\n' +'Number From - 0 To 0');
        if(obj=='3')
            alert('ContractNote Numbers Deleted !!');     
        Hide('tr_table1');
        height();
    }
    function display()
    {
        Show('tr_table1');
        alert('ContractNote Numbers Generated !!!');
        height();
    }
   FieldName='lstSlection';
    </script>

    <script type="text/ecmascript">   
       function ReceiveServerData(rValue)
        {
                var j=rValue.split('~');
                if(j[0]=='Clients')
                {
                    document.getElementById('HiddenField_Client').value = j[1];
                } 
                if(j[0]=='ScripsExchange')
                {
                    document.getElementById('HiddenField_ScripsExchange').value = j[1];
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
                        <strong><span id="SpanHeader" style="color: #000099">*-*-*-*-* Generate ContractNote Numbers *-*-*-*-* </span>
                        </strong>
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
                                        <tr>
                                            <td>
                                                <table border="10" cellpadding="1" cellspacing="1">
                                                    <tr>
                                                        <td>
                                                            <b>For :</b>
                                                        </td>
                                                        <td>
                                                            <dxe:aspxdateedit id="dtfor" runat="server" editformat="Custom" usemaskbehavior="True"
                                                                font-size="10px" width="108px" clientinstancename="dtfor">
                                                                <dropdownbutton text="For"></dropdownbutton>
                                                            </dxe:aspxdateedit>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr id="tr_client">
                                            <td>
                                                <table border="10" cellpadding="1" cellspacing="1">
                                                    <tr>
                                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                                            <asp:DropDownList ID="ddlGroupBy" runat="server" Width="120px" Font-Size="10px" onchange="FnddlGroupBy(this.value)">
                                                                <asp:ListItem Value="Clients">Clients</asp:ListItem>
                                                                <asp:ListItem Value="Branch">Branch</asp:ListItem>
                                                                <asp:ListItem Value="Group">Group</asp:ListItem>
                                                            </asp:DropDownList></td>
                                                        <%--<td class="gridcellleft">
                                                            <table border="10" cellpadding="1" cellspacing="1">
                                                                <tr>--%>
                                                                    <td class="gridcellleft" id="Td_OtherGroupBy">
                                                                        <table border="10" cellpadding="1" cellspacing="1">
                                                                            <tr>
                                                                                <td>
                                                                                    <td id="tr_allclients">
                                                                                        <asp:RadioButton ID="RadioBtnOtherGroupByAll" runat="server" Checked="True" GroupName="cc"
                                                                                            onclick="FnOtherGroupBy('a')" />
                                                                                        All
                                                                                    </td>
                                                                                    <td id="tr_Selectedclients">
                                                                                        <asp:RadioButton ID="RadioBtnOtherGroupBySelected" runat="server" GroupName="cc"
                                                                                            onclick="FnOtherGroupBy('b')" />
                                                                                        Selected
                                                                                    </td>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td class="gridcellleft" id="Td_Group">
                                                                        <table border="10" cellpadding="1" cellspacing="1">
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
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
                                                               <%-- </tr>
                                                            </table>
                                                        </td>--%>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr id="tr_Scrip">
                                            <td>
                                                <table border="10" cellpadding="1" cellspacing="1">
                                                    <tr>
                                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                                            Scrip :</td>
                                                        <td>
                                                            <asp:RadioButton ID="rdbScripAll" runat="server" Checked="True" GroupName="c" onclick="fn_Scrip('a')" />
                                                            All
                                                        </td>
                                                        <td>
                                                            <asp:RadioButton ID="rdbScripSelected" runat="server" GroupName="c" onclick="fn_Scrip('b')" />
                                                            Selected
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr id="tr_Setttype">
                                            <td>
                                                <table border="10" cellpadding="1" cellspacing="1">
                                                    <tr>
                                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                                            Settlement Type :</td>
                                                        <td>
                                                            <asp:RadioButton ID="rdbSettAll" runat="server" Checked="True" GroupName="d" />
                                                            All
                                                        </td>
                                                        <td>
                                                            <asp:RadioButton ID="rdbSettSpecific" runat="server" GroupName="d" />
                                                            Current
                                                        </td>
                                                        <td>
                                                            <span id="litSettlementTypeCurrent" runat="server" style="color: Maroon"></span>
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
                                                            Generate Type :</td>
                                                        <td>
                                                            <asp:DropDownList ID="ddlGeneration" runat="server" Width="100px" Font-Size="10px"
                                                                onchange="fnddlGeneration(this.value)">
                                                                <asp:ListItem Value="1">Generate</asp:ListItem>
                                                                <asp:ListItem Value="2">Delete</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr id="tr_reuse">
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                                            <asp:CheckBox ID="chkreuse" runat="server" />
                                                            Reuse Existing Cancelled ContractNote Numbers</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td id="td_btnShow">
                                                            <asp:Button ID="btnshow" runat="server" CssClass="btnUpdate" Height="20px" Text="Generate"
                                                                Width="101px" OnClick="btnshow_Click" /></td>
                                                        <td id="td_btnRemove">
                                                            <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                                                                <ContentTemplate>
                                                                    <asp:Button ID="btn_del" OnClientClick="javascript:return Delete();" runat="server"
                                                                        Text="Remove" CssClass="btnUpdate" Height="23px" Width="101px" />
                                                                </ContentTemplate>
                                                                <Triggers>
                                                                    <asp:AsyncPostBackTrigger ControlID="btnremove" EventName="Click"></asp:AsyncPostBackTrigger>
                                                                </Triggers>
                                                            </asp:UpdatePanel>
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
                                                    <asp:ListItem>Clients</asp:ListItem>
                                                    <asp:ListItem>Branch</asp:ListItem>
                                                    <asp:ListItem>Group</asp:ListItem>
                                                    <asp:ListItem>ScripsExchange</asp:ListItem>
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
                        <asp:Button ID="btnremove" runat="server" Text="Remove" CssClass="btnUpdate" Height="23px"
                            Width="101px" OnClick="btnremove_Click" />
                        <asp:Button ID="BtnGroup" runat="server" Text="BtnGroup" OnClick="BtnGroup_Click" />
                        <asp:HiddenField ID="HiddenField_Group" runat="server" />
                        <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="150px"></asp:TextBox>
                        <asp:HiddenField ID="HiddenField_Client" runat="server" />
                        <asp:HiddenField ID="HiddenField_ScripsExchange" runat="server" />
                        <asp:HiddenField ID="HiddenField_SettType" runat="server" />
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
        </div>
        <table>
            <tr id="tr_table1">
                <td>
                    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                        <ContentTemplate>
                            <div id="display" runat="server">
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnshow" EventName="Click"></asp:AsyncPostBackTrigger>
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
