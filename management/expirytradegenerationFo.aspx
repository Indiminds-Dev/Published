<%@ page language="C#" autoeventwireup="true" inherits="management_expirytradegenerationFo, App_Web_6bj03ldo" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1">
    <title>Expiry Trade Generation</title>
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
                FnInstumentType("Futures");
                FnAction('Generate');
                Hide('showFilter');
                height();
               
            }
    function height()
        {
            if(document.body.scrollHeight>=450)
            {
                window.frameElement.height = document.body.scrollHeight;
            }
            else
            {
                window.frameElement.height = '450px';
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
     
    function FnInstumentType(obj)
    {
        if(obj=="Futures")
        {
            Hide('Tr_GenerationType');
            Hide('Tr_Asset');
            Hide('Tr_OptionType');
            Hide('Tr_Expiry');
            Hide('Tr_Scrip');
            
        }
        else
        {
            Show('Tr_GenerationType');
            Show('Tr_Asset');
            Show('Tr_OptionType');
            Show('Tr_Expiry');
            Show('Tr_Scrip');
        }
        Show('Tr_BtnGenerate');
        Hide('Tr_BtnExcelCancelGenerate');
       
    }
    function FnAsset(obj)
    {
        if(obj=="a")
         Hide('showFilter');
        else
         Show('showFilter');
    }
    function FnExpiry(obj)
    {
        if(obj=="a")
         Hide('Td_ExpirySpecific');
        else
         Show('Td_ExpirySpecific');
         
          Hide('showFilter');
    }
    function FnScrip(obj)
    {
        if(obj=="a")
         Hide('Td_ScripSpecific');
        else
         Show('Td_ScripSpecific');
         
          Hide('showFilter');
    }
     function FunCallAjaxList(objID,objEvent,ObjType)
        {
               var strQuery_Table = '';
               var strQuery_FieldName = '';
               var strQuery_WhereClause = '';
               var strQuery_OrderBy='';
               var strQuery_GroupBy='';
               var CombinedQuery='';
                
               var date;
               date=new Date(DtFor.GetDate());
               date=parseInt(date.getMonth()+1)+'-'+date.getDate()+'-'+ date.getFullYear();

               var ExchangeSegmentid='<%=Session["ExchangeSegmentID"]%>';
               
            if(ObjType=='Expiry')
            {
                 if(ExchangeSegmentid=="2" || ExchangeSegmentid=="5" || ExchangeSegmentid=="20")
                 {
                      strQuery_Table = "master_equity";
                      strQuery_FieldName = "distinct top 10 CONVERT(VARCHAR(11),CAST(equity_effectuntil AS DATETIME),106),equity_effectuntil";
                      strQuery_WhereClause = " (CONVERT(VARCHAR(11),CAST(equity_effectuntil AS DATETIME),106) like (\'RequestLetter%') ) and equity_effectuntil>='"+date+"'";
                 }
                 else
                 {
                      strQuery_Table = "master_commodity";
                      strQuery_FieldName = "distinct top 10 CONVERT(VARCHAR(11),CAST(commodity_expirydate AS DATETIME),106),commodity_expirydate";
                      strQuery_WhereClause = " (CONVERT(VARCHAR(11),CAST(commodity_expirydate AS DATETIME),106) like (\'RequestLetter%') ) and commodity_expirydate>='"+date+"'";
                 }
               
            }
            else if(ObjType=='Scrip')
            {
                 if(ExchangeSegmentid=="2" || ExchangeSegmentid=="5" || ExchangeSegmentid=="20")
                 {
                      strQuery_Table = "(select (case when isnull(Equity_StrikePrice,0)=0.0 then isnull(rtrim(ltrim(Equity_TickerSymbol)),'')+' '+isnull(rtrim(ltrim(Equity_Series)),'')+' '+convert(varchar(9),Equity_EffectUntil,6) else isnull(rtrim(ltrim(Equity_TickerSymbol)),'')+' '+isnull(rtrim(ltrim(Equity_Series)),'')+' '+convert(varchar(9),Equity_EffectUntil,6)+' '+cast(cast(round(Equity_StrikePrice,2) as numeric(28,2)) as varchar) end) as TickerSymbol,Equity_SeriesID from Master_Equity  WHERE Equity_ExchSegmentID='" + ExchangeSegmentid + "' and equity_effectuntil>='"+date+"' )as tb";
                      strQuery_FieldName = "distinct top 10 TickerSymbol,Equity_SeriesID";
                      strQuery_WhereClause = " (TickerSymbol like (\'RequestLetter%') )";
                 }
                 else
                 {
                      strQuery_Table = "(select (case when isnull(commodity_StrikePrice,0)=0.0 then isnull(rtrim(ltrim(commodity_TickerSymbol)),'')+' '+isnull(rtrim(ltrim(commodity_Tickercode)),isnull(rtrim(ltrim(Commodity_Tickerseries)),''))+' '+isnull(convert(varchar(9),commodity_ExpiryDate,6),'') else isnull(rtrim(ltrim(commodity_TickerSymbol)),'')+' '+isnull(rtrim(ltrim(commodity_Tickercode)),isnull(rtrim(ltrim(Commodity_Tickerseries)),''))+' '+isnull(convert(varchar(9),commodity_ExpiryDate,6),'')+' '+cast(cast(round(commodity_StrikePrice,2) as numeric(28,2)) as varchar) end) as TickerSymbol,Commodity_ProductSeriesID from Master_commodity  WHERE commodity_ExchangeSegmentID='" + ExchangeSegmentid + "' and commodity_expirydate>='"+date+"' )as tb";
                      strQuery_FieldName = "distinct top 10 TickerSymbol,Commodity_ProductSeriesID";
                      strQuery_WhereClause = " (TickerSymbol like (\'RequestLetter%') )";
                 }
               
            }
            else
            {
                strQuery_Table = "master_products";
                strQuery_FieldName = "distinct top 10 ltrim(rtrim(products_name))+\' [\'+rtrim(products_shortname)+\']\',rtrim(products_id)";
                
                if(ExchangeSegmentid=="2" || ExchangeSegmentid=="5" || ExchangeSegmentid=="20")
                  strQuery_WhereClause = " products_producttypeid in (1,5) and (products_name like (\'RequestLetter%') or products_shortname like (\'RequestLetter%')) ";
                else
                  strQuery_WhereClause = " products_producttypeid in (10,8) and (products_name like (\'RequestLetter%') or products_shortname like (\'RequestLetter%')) ";
                
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
       function btnAddsubscriptionlist_click()
        {
    
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
                    var sendData = 'Asset~' + listIDs;
                    CallServer(sendData,"");
                   
                }
	            var i;
                for(i=listBoxSubs.options.length-1;i>=0;i--)
                {
                    listBoxSubs.remove(i);
                }
            
                Hide('showFilter');
                
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
        if(obj=='Other')
        {
            Show('Tr_BtnExcelCancelGenerate');
            Hide('Tr_BtnGenerate');
        }
        else if(obj=='Cancel')
        {
            FnInstumentType("Futures");
            document.getElementById('DdlInstrumentType').value='Futures';
        }
        else
        {
            FnInstumentType("Futures");
            document.getElementById('DdlInstrumentType').value='Futures';
            alert(obj);
        }
        Hide('showFilter');
      }
      
      function FnAction(obj)
      {
        if(obj=="Generate")
        {
            Show('Td_ActionGenerate');
            Hide('Td_ActionDelete');
        }
        if(obj=="Delete")
        {
            Hide('Td_ActionGenerate');
            Show('Td_ActionDelete');
        }
      }
 FieldName='lstSlection';
 </script>	
  <script type="text/ecmascript">   
       function ReceiveServerData(rValue)
        {
                var j=rValue.split('~');
                document.getElementById('HiddenField_Product').value = j[1];
               
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
                    <strong><span id="SpanHeader" style="color: #000099">Expiry Trade Generation</span></strong>
                </td>
                
            </tr>
        </table>
        <table>
            <tr valign="top">
                <td>
                    <table>
                        <tr>
                            <td class="gridcellleft">
                                <table border="10" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#b7ceec">
                                            For :
                                        </td>
                                        <td>
                                            <dxe:ASPxDateEdit ID="DtFor" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                Font-Size="10px" Width="108px" ClientInstanceName="DtFor">
                                                <dropdownbutton text="For">
                                    </dropdownbutton>
                                            </dxe:ASPxDateEdit>
                                        </td>
                                        <td class="gridcellleft" bgcolor="#b7ceec">
                                            Instrument Type
                                        </td>
                                        <td valign="top">
                                            <asp:DropDownList ID="DdlInstrumentType" runat="server" Width="100px" Font-Size="10px"
                                                onchange="FnInstumentType(this.value)">
                                                <asp:ListItem Value="Futures">Futures</asp:ListItem>
                                                <asp:ListItem Value="Options">Options</asp:ListItem>
                                            </asp:DropDownList></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="Tr_GenerationType">
                            <td class="gridcellleft">
                                <table border="10" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Generate Type:</td>
                                        <td>
                                            <asp:DropDownList ID="DdlGenerationType" runat="server" Width="150px" Font-Size="10px"
                                               >
                                                <asp:ListItem Value="EXC">Excercise</asp:ListItem>
                                                <asp:ListItem Value="ASN">Assignment</asp:ListItem>
                                                <asp:ListItem Value="BOTH">Both</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="Tr_Asset">
                            <td class="gridcellleft">
                                <table border="10" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Asset:</td>
                                        <td>
                                            <asp:RadioButton ID="rdAssetAll" runat="server" Checked="True" GroupName="a" onclick="FnAsset('a')" />
                                            All
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdAssetSelected" runat="server" GroupName="a" onclick="FnAsset('b')" />Selected
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="Tr_OptionType">
                            <td class="gridcellleft">
                                <table border="10" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Option Type:</td>
                                        <td>
                                            <asp:CheckBox ID="ChkOptionTypeCall" runat="server" Checked="true" />
                                            Call
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="ChkOptionTypePut" runat="server" Checked="true" />
                                            Put
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="Tr_Expiry">
                            <td class="gridcellleft">
                                <table border="10" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Expiry :</td>
                                        <td>
                                            <asp:RadioButton ID="rdbExpiryAll" runat="server" Checked="True" GroupName="b" onclick="FnExpiry('a')" />
                                            All
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbExpirySpecific" runat="server" GroupName="b" onclick="FnExpiry('b')" />
                                            Specific
                                        </td>
                                        <td id="Td_ExpirySpecific" style="display: none;">
                                            <asp:TextBox runat="server" Width="150px" Font-Size="10px" ID="txtExpiry" onkeyup="FunCallAjaxList(this,event,'Expiry')"></asp:TextBox>
                                            <asp:TextBox ID="txtExpiry_hidden" runat="server" Width="14px" Style="display: none;"> </asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="Tr_Scrip">
                            <td class="gridcellleft">
                                <table border="10" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Scrip :</td>
                                        <td>
                                            <asp:RadioButton ID="rdbScripAll" runat="server" Checked="True" GroupName="c" onclick="FnScrip('a')" />
                                            All
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbScripSelected" runat="server" GroupName="c" onclick="FnScrip('b')" />
                                            Specific
                                        </td>
                                        <td id="Td_ScripSpecific" style="display: none;">
                                            <asp:TextBox runat="server" Width="250px" Font-Size="10px" ID="txtScrip" onkeyup="FunCallAjaxList(this,event,'Scrip')"></asp:TextBox>
                                            <asp:TextBox ID="txtScrip_hidden" runat="server" Width="14px" Style="display: none;"> </asp:TextBox></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="gridcellleft">
                                <table border="10" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                           Action :</td>
                                        <td>
                                            <asp:DropDownList ID="DdlAction" runat="server" Width="150px" Font-Size="10px" onchange="FnAction(this.value)">
                                                <asp:ListItem Value="Generate">Generate</asp:ListItem>
                                                <asp:ListItem Value="Delete">Delete</asp:ListItem>
                                               
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="Tr_BtnGenerate">
                            <td class="gridcellleft">
                                <table>
                                    <tr>
                                        <td class="gridcellleft" id="Td_ActionGenerate">
                                            <asp:Button ID="BtnGenerate" runat="server" CssClass="btnUpdate" Height="20px" Text="Generate Position"
                                                Width="120px" OnClick="BtnGenerate_Click" />
                                        </td>
                                        <td class="gridcellleft" id="Td_ActionDelete">
                                            <asp:Button ID="BtnDelete" runat="server" CssClass="btnUpdate" Height="20px" Text="Delete Position"
                                                Width="120px" OnClick="BtnDelete_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="Tr_BtnExcelCancelGenerate">
                            <td class="gridcellleft">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Button ID="BtnExcel" runat="server" CssClass="btnUpdate" Height="20px" Text="Open To Excel"
                                                ForeColor="green" Width="120px" OnClick="BtnExcel_Click" /></td>
                                        <td>
                                            <asp:Button ID="BtnCancel" runat="server" CssClass="btnUpdate" Height="20px" Text="Cancel"
                                                Width="120px" OnClick="BtnCancel_Click" /></td>
                                         <td>
                                            <asp:Button ID="BtnGenerateOptPosition" runat="server" CssClass="btnUpdate" Height="20px" Text="Generate"
                                                Width="120px" ForeColor="blue" OnClick="BtnGenerateOptPosition_Click"/></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table border="10" cellpadding="1" cellspacing="1" id="showFilter">
                        <tr>
                            <td>
                                <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="340px" onkeyup="FunCallAjaxList(this,event,'Asset')"></asp:TextBox></td>
                           
                            <td>
                                <a id="P4" href="javascript:void(0);" onclick="btnAddsubscriptionlist_click()"><span
                                    style="color: #009900; text-decoration: underline; font-size: 8pt;">Add to List</span></a><span
                                        style="color: #009900; font-size: 8pt;"> </span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:ListBox ID="lstSlection" runat="server" Font-Size="10px" Height="120px" Width="400px">
                                </asp:ListBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <a id="P1" href="javascript:void(0);" onclick="clientselectionfinal()"><span style="color: #000099;
                                                text-decoration: underline; font-size: 10pt;">Done</span></a>&nbsp;&nbsp;
                                        </td>
                                        <td>
                                            <a id="P2" href="javascript:void(0);" onclick="btnRemovefromsubscriptionlist_click()">
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
            <tr style="display:none;">
                <td> <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="150px"></asp:TextBox>
                 <asp:HiddenField ID="HiddenField_Product" runat="server" />
                  <asp:DropDownList ID="cmbscrip" runat="server" Font-Size="10px" Width="300px" AutoPostBack="True">
                                </asp:DropDownList>

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
            <tr>
                <td>
                    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                        <ContentTemplate>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="BtnGenerate" EventName="Click"></asp:AsyncPostBackTrigger>
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
