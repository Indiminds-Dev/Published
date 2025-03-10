<%@ page language="C#" autoeventwireup="true" inherits="Reports_frmReport_HoldingNseCm, App_Web_-n9yptcr" enableeventvalidation="false" %>


<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>Demat Holding Report </title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>
    <script type="text/javascript" src="../CentralData/JSScript/jquery-1.8.3.min.js"></script>


    <link href="../CentralData/CSS/GenericLoading.css" rel="stylesheet" type="text/css" /><!--Generic Loading Part 1-->
    <script type="text/javascript">//Generic Loading Part 2
    function ShowProgress() {
         var modal = document.getElementById("myModal");
         modal.style.display = "block";
    }
    $('form').live("submit", function () {
       if(document.activeElement.getAttribute!=undefined && document.activeElement.getAttribute('id')=="btnExcel")
        ShowProgress();
    });
    
    function HideLoading(){ 
        var modal = document.getElementById("myModal");
        modal.style.display = "none";
        Page_Load();
        var chkCompare=document.getElementById("chkCompare");
        chkCompare.checked=true;
        Show("trCompare");
        Show("trExcel");
        Hide("trScreen");
        document.getElementById("BtnExport").click();
    }
   
</script>
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
                 Hide('Tab_Display');
                 Show('tab1');
                 Hide('td_filter');
                 Hide('showFilter');
                 Hide('Tr_Settlement');
                 Hide("trCompare");
                 Hide("trExcel");
                 document.getElementById('chkCompare').checked=false;
                 document.getElementById('hiddencount').value=0;
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
          cmbVal=document.getElementById('cmbsearchOption').value;
          ajax_showOptions(objID,objListFun,objEvent,cmbVal);
        }
        
        function fnProduct(obj)
        {
             if(obj=="a")
                Hide('showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='Product';
                  Show('showFilter');
             }
            height();
        }
        function fnSettNo(obj)
        {
             if(obj=="a")
                Hide('Td_SelectedSettlement');
             else
                  Show('Td_SelectedSettlement');
                  
                  Hide('showFilter');
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
                document.getElementById('BtnScreen').disabled=false;
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
    
        function RecordDisplay(obj)
        {
            if(obj=="1")
            {
                 Show('Tab_Display');
                 Hide('tab1');
                 Show('td_filter');
                
            }
            if(obj=="2")
            {
                 Hide('Tab_Display');
                 Show('tab1');
                 Hide('td_filter');
               
            }
            if(obj=="3")
            {
                 Hide('Tab_Display');
                 Show('tab1');
                 Hide('td_filter');
                 alert('No Record Found !!');
            }
            document.getElementById('hiddencount').value=0;
             Hide('showFilter');
             height();
        }
       function FnDpAccChange(obj)
       {
         var ObjAc=obj.split('~');
         if(obj!='All')
         {
             var ObjAcType=ObjAc[3].substring(1, 2);
             if(ObjAcType=="P" || ObjAcType=="C")
             {
                 Show('Tr_Settlement');
                 Hide('Td_SelectedSettlement');
             }
             else
             {
                 Hide('Tr_Settlement');
                 Show('Td_SelectedSettlement');
             }
             
             //Rev-20190522
             var nsdlDpID = '<%=Session["nsdlDpID"]%>'
             var cdslDpID = '<%=Session["cdslDpID"]%>'
             var curDpID=ObjAc[1];
             if(nsdlDpID==curDpID || cdslDpID==curDpID)
                Show("trCompare");
             else
             {
                Hide("trCompare");
                document.getElementById('chkCompare').checked=false;s
             }
        }
        else
        {
            Hide('Tr_Settlement');
            Show('Td_SelectedSettlement');
            Hide("trCompare");
            document.getElementById('chkCompare').checked=false;
        }
       }
        function FnFetchSettlement(objID,objListFun,objEvent)
        {
            ajax_showOptions(objID,objListFun,objEvent,'SettlementNoAll');
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
        function chkCompareClick(chkCompare) 
        {
            if(chkCompare.checked) 
            {
                Show("trExcel");
                Hide("trScreen");
            }
            else
            {
                Hide("trExcel");
                Show("trScreen");
            }
        }
        FieldName='lstSlection';
      
     
    </script>

    <script type="text/ecmascript">   
       function ReceiveServerData(rValue)
        {
               
                var j=rValue.split('~');
                
                if(j[0]=='Product')
                {
                    document.getElementById('HiddenField_Product').value = j[1];
                }
               
        }
    </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server" autocomplete="off">
        <!--Generic Loading Part 3-->
        <div id="myModal" class="modal">
            <!-- Modal content -->
            <div class="modal-content">
                <div id='divLoading' style="font-family: arial; font-size: 30; -color: white; height: 80;
                width: 150;">
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
            </div>
        </div>
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
                        <strong><span id="SpanHeader" style="color: #000099">Demat Holding Report </span></strong>
                    </td>
                    <td class="EHEADER" width="15%" id="td_filter" style="height: 22px">
                        <a href="javascript:void(0);" onclick="RecordDisplay(2);"><span style="color: Blue;
                            text-decoration: underline; font-size: 8pt; font-weight: bold">Filter</span></a>
                        <asp:DropDownList ID="cmbExport" runat="server" AutoPostBack="True" Font-Size="10px"
                            OnSelectedIndexChanged="cmbExport_SelectedIndexChanged">
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
                                    <table border="10" cellpadding="1" cellspacing="1">
                                        <tr>
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                DP Account :
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlDpAc" Font-Size="10px" runat="server" Width="250px" onchange="FnDpAccChange(this.value)">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td class="gridcellleft">
                                    <table border="10" cellpadding="1" cellspacing="1">
                                        <tr>
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                As On Date :
                                            </td>
                                            <td class="gridcellleft">
                                                <dxe:ASPxDateEdit ID="DtHoldingDate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                    Font-Size="10px" Width="108px" ClientInstanceName="DtHoldingDate">
                                                    <DropDownButton Text="Date">
                                                    </DropDownButton>
                                                </dxe:ASPxDateEdit>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <table>
                                        <tr>
                                            <td class="gridcellleft" valign="top">
                                                <table border="10" cellpadding="1" cellspacing="1">
                                                    <tr>
                                                        <td>
                                                            <table>
                                                                <tr>
                                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                                        Product :</td>
                                                                    <td>
                                                                        <asp:RadioButton ID="rdbProductAll" runat="server" Checked="True" GroupName="e" onclick="fnProduct('a')" />
                                                                        All
                                                                    </td>
                                                                    <td>
                                                                        <asp:RadioButton ID="rdbProductSelected" runat="server" GroupName="e" onclick="fnProduct('b')" />Selected
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr id="Tr_Settlement">
                                                        <td>
                                                            <table border="10" cellpadding="1" cellspacing="1">
                                                                <tr>
                                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                                        Settlement No :
                                                                    </td>
                                                                    <td>
                                                                        <asp:RadioButton ID="RdSettNoAll" runat="server" Checked="True" GroupName="f" onclick="fnSettNo('a')" />
                                                                        All
                                                                    </td>
                                                                    <td>
                                                                        <asp:RadioButton ID="RdSettNoSelected" runat="server" GroupName="f" onclick="fnSettNo('b')" />Selected
                                                                    </td>
                                                                    <td id="Td_SelectedSettlement">
                                                                        <asp:TextBox ID="txtSettlement" runat="server" Font-Size="10px" Width="200Px" onkeyup="FnFetchSettlement(this,'ShowClientFORMarginStocks',event)"></asp:TextBox></td>
                                                                    <td style="display: none;">
                                                                        <asp:TextBox ID="txtSettlement_hidden" runat="server" Font-Size="10px" Width="200Px"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <table border="10" cellpadding="1" cellspacing="1">
                                                                <tr valign="top">
                                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                                        <asp:CheckBox ID="ChkHldingValue" runat="server" />
                                                                        Calculate Holding Value
                                                                    </td>
                                                                </tr>
                                                                <tr id="trCompare" valign="top">
                                                                    <td class="gridcellleft" bgcolor="#B7CEEC">
                                                                        <asp:CheckBox ID="ChkCompare" runat="server" onclick="chkCompareClick(this)" />
                                                                        Compare Holding With Own Dp
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
                                                                        Security Type :
                                                                    </td>
                                                                    <td>
                                                                        <asp:DropDownList ID="DdlSecurityType" runat="server" Font-Size="10px" Width="150px">
                                                                            <asp:ListItem Value="ALL">ALL</asp:ListItem>
                                                                            <asp:ListItem Value="Approved">Only Approved</asp:ListItem>
                                                                            <asp:ListItem Value="UnApproved">Only UnApproved</asp:ListItem>
                                                                            <asp:ListItem Value="Illiquid">Only Illiquid</asp:ListItem>
                                                                            <asp:ListItem Value="liquid">Only liquid</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr id="trScreen">
                                                        <td class="gridcellleft" colspan="4">
                                                            <asp:Button ID="BtnScreen" runat="server" CssClass="btnUpdate" Height="20px" Text="Show"
                                                                Width="101px" OnClick="BtnScreen_Click" />
                                                        </td>
                                                    </tr>
                                                    <tr id="trExcel">
                                                        <td>
                                                            <asp:Button ID="btnExcel" runat="server" CssClass="btnUpdate" Height="20px" Text="Export To Excel"
                                                                Width="101px" OnClick="BtnExcel_Click" /></td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td valign="top">
                                                <table id="showFilter">
                                                    <tr>
                                                        <td>
                                                            <table cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td class="gridcellleft" style="vertical-align: top; text-align: right; height: 21px;"
                                                                        id="TdFilter">
                                                                        <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="150px" onkeyup="FunClientScrip(this,'ShowClientFORMarginStocks',event)"></asp:TextBox>
                                                                        <asp:DropDownList ID="cmbsearchOption" runat="server" Font-Size="11px" Width="70px"
                                                                            Enabled="false">
                                                                            <asp:ListItem>Product</asp:ListItem>
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
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td style="display: none;">
                        <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="150px"></asp:TextBox>
                        <asp:HiddenField ID="hiddencount" runat="server" />
                        <asp:HiddenField ID="HiddenField_Product" runat="server" />
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
            <table style="display: none;" id="Tab_Display">
                <tr>
                    <td>
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
                                            <div id="DivRecord" runat="server">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="BtnScreen" EventName="Click"></asp:AsyncPostBackTrigger>
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </div>
        <div style="display: none">
            <asp:Button ID="btnExport" runat="server" CssClass="btnUpdate" Height="20px" Text="Export To Excel"
                Width="101px" OnClick="btnExport_Click" />
        </div>
    </form>
</body>
</html>