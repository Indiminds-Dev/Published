<%@ page language="C#" autoeventwireup="true" inherits="management_mktratechange, App_Web_kqhq1k1d" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Change Mkt Rate</title>
     <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
     <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

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
</head>

<script language="javascript" type="text/javascript">
      function Page_Load()///Call Into Page Load
      { 
           Hide('td_showFilter');
           Hide('GRID');
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
              
                Hide('td_showFilter');
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
      function Instruments(obj)
        {
             if(obj=="a")
             {
                Hide('td_showFilter');
             }
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='Scrips';
                  Show('td_showFilter');
             }
             
        }       
      function FunScrip(objID,objListFun,objEvent)
        {
         cmbVal=document.getElementById('cmbsearchOption').value;
         ajax_showOptions(objID,objListFun,objEvent,cmbVal);
        }
        function Hide(obj)
            {
             document.getElementById(obj).style.display='none';
            }
        function Show(obj)
            {
             document.getElementById(obj).style.display='inline';
            }
       function Message(obj)
            {
                if(obj==3)
                {
                    
                     Hide('td_showFilter');
                     Hide('GRID');
                     Hide('td_filter');
                     alert('No Record Found!!');
                     height();
                    
                 }
                 else if (obj==1)
                 {
                    alert('Modification disallowed,You can change Mkt. Rate of only Purchases in Auction Settlement!');
                    Hide('td_showFilter');
                    Hide('td_filter');
                    Hide('GRID');
                    height();
                 }
                 else if (obj==2)
                 {
                     Hide('td_showFilter');
                     Hide('GRID');
                     Hide('td_filter');
                     height();
                 }
                 
           }
       function DISPLAY(obj)
            {
                document.getElementById('spanshow2').innerText=obj;
                Hide('SELECT');
                Show('GRID');
                Show('td_filter');
                height();

            }
        function filter()
          {
            Hide('td_showFilter');
            Hide('GRID');
            Show('SELECT');
            Hide('td_filter');
            height();
          }

        function tabindexset(obj)
        {
            document.getElementById(obj).focus();
            document.getElementById(obj).select();
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
          FieldName='lstSlection';
    

</script>
   <script type="text/ecmascript">
        
	    function ReceiveServerData(rValue)
        {
        
        }
        </script>
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
                        <strong><span style="color: #000099">Change Mkt Rate</span></strong>
                    </td>
                    <td class="EHEADER" width="10%" id="td_filter">
                        <a href="javascript:void(0);" onclick="filter();"><span style="color: Blue; text-decoration: underline;
                            font-size: 8pt; font-weight: bold">Filter</span></a> 
                    </td>
                </tr>
        </table>
        <table id="SELECT">
            <tr>
                <td style="text-align: left;" colspan="2">
                    <table>
                        <tr valign="top">
                            <td class="gridcellleft">
                                For :
                            </td>
                            <td colspan="5">
                                <dxe:ASPxDateEdit ID="dtFor" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                    Font-Size="10px" Width="108px" ClientInstanceName="dtfor">
                                    <dropdownbutton text="For">
                        </dropdownbutton>
                                </dxe:ASPxDateEdit>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr valign="top">
                <td style="text-align: left;" colspan="2">
                    <table>
                        <tr>
                            <td class="gridcellleft">
                                Instruments
                            </td>
                            <td>
                                <asp:RadioButton ID="rdInstrumentAll" runat="server" Checked="True" GroupName="b"
                                    onclick="Instruments('a')" />
                            </td>
                            <td>
                                All
                            </td>
                            <td>
                                <asp:RadioButton ID="rdInstrumentSelected" runat="server" GroupName="b" onclick="Instruments('b')" />
                            </td>
                            <td>
                                Selected
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td class="gridcellleft" colspan="5">
                                             <asp:Button ID="btn_show" runat="server" CssClass="btnUpdate" Height="20px" Text="Show" Width="100px" OnClick="btn_show_Click" />

                            </td>
                           
                        </tr>
                    </table>
                </td>
                <td>
                    <table width="100%" id="td_showFilter">
                        <tr align="left">
                            <td style="text-align: left; vertical-align: top; height: 134px;">
                                <table cellpadding="0" cellspacing="0">
                                    <tr align="left">
                                        <td class="gridcellleft" style="vertical-align: top; text-align: left" id="TdFilter">
                                            <span id="spanall">
                                                <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="200px" onkeyup="FunScrip(this,'ShowClientFORMarginStocks',event)"></asp:TextBox></span>
                                            <asp:DropDownList ID="cmbsearchOption" runat="server" Font-Size="11px" Width="70px"
                                                Enabled="false">
                                                <asp:ListItem>Scrips</asp:ListItem>
                                            </asp:DropDownList>
                                            <a id="A4" href="javascript:void(0);" onclick="btnAddsubscriptionlist_click()"><span
                                                style="color: #009900; text-decoration: underline; font-size: 8pt;">Add to List</span></a><span
                                                    style="color: #009900; font-size: 8pt;"> </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="height: 90px">
                                            &nbsp;
                                            <asp:ListBox ID="lstSlection" runat="server" Font-Size="10px" Height="90px" Width="290px">
                                            </asp:ListBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <table cellpadding="0" cellspacing="0">
                                                <tr align="left">
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
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
              
            <tr>
                <td style="display: none;">
                    <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="1px"></asp:TextBox>
                </td>
            </tr>
          
        </table>
        <table id="GRID">
            <tr>
                <td>
                    <span id="spanshow1" style="color: Blue; font-weight: bold">Mkt. Rate Change For :</span>&nbsp;&nbsp;<span
                        id="spanshow2"></span></td>
            </tr>
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:GridView ID="grdmktrate" runat="server" Width="100%" BorderColor="CornflowerBlue"
                                ShowFooter="True" AutoGenerateColumns="false" BorderStyle="Solid" BorderWidth="2px"
                                CellPadding="4" ForeColor="#0000C0">
                                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True"></FooterStyle>
                                <Columns>
                                    <asp:TemplateField HeaderText="Scrip">
                                        <ItemStyle BorderWidth="1px" HorizontalAlign="Left" Wrap="False"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblSecuritySymbol" runat="server" Text='<%# Eval("SecuritySymbol")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Series">
                                        <ItemStyle BorderWidth="1px" HorizontalAlign="Left" Wrap="False"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblSecuritySeries" runat="server" Text='<%# Eval("SecuritySeries")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Mkt Rate">
                                        <ItemStyle BorderWidth="1px" HorizontalAlign="Right" Wrap="False"></ItemStyle>
                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtUnitPric" Onkeypress="return isNumberKey(event)" AutoPostBack="True" Width="100px" Text='<%# Eval("UnitPric")%>'
                                                style="text-align: right;" runat="server" OnTextChanged="txtUnitPric_TextChanged" ></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Qty">
                                        <ItemStyle BorderWidth="1px" HorizontalAlign="Right" Wrap="False"></ItemStyle>
                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtUnitPriceQuantity" Enabled="false" AutoPostBack="True" Width="100px" Text='<%# Eval("UnitPriceQuantity")%>'
                                               style="text-align: right;" runat="server" ></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Mkt. Value">
                                        <ItemStyle BorderWidth="1px" HorizontalAlign="Right" Wrap="False"></ItemStyle>
                                        <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtMarketValue" Width="100px" Enabled="false" runat="server"
                                               style="text-align: right;" Text='<%# Eval("MarketValue")%>'></asp:TextBox>
                                            <asp:Label ID="lblCustTransactionID" runat="server" Text='<%# Eval("CustTransactionID")%>'
                                                Visible="false"></asp:Label>
                                            <asp:Label ID="lblExchangeTradesID" runat="server" Text='<%# Eval("ExchangeTrades_ID")%>'
                                                Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <RowStyle BackColor="White" ForeColor="#330099" BorderColor="#BFD3EE" BorderStyle="Double"
                                    BorderWidth="1px"></RowStyle>
                                <EditRowStyle BackColor="#E59930"></EditRowStyle>
                                <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" Font-Bold="True"></SelectedRowStyle>
                                <PagerStyle ForeColor="White" HorizontalAlign="Center"></PagerStyle>
                                <HeaderStyle ForeColor="Black" BorderWidth="1px" CssClass="EHEADER" BorderColor="AliceBlue"
                                    Font-Bold="False"></HeaderStyle>
                            </asp:GridView>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btn_show" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnupdate" runat="server" CssClass="btnUpdate" Height="20px" Text="Update"
                        Width="100px" OnClick="btnupdate_Click" />
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

