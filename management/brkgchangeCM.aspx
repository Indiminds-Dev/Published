<%@ page language="C#" autoeventwireup="true" inherits="management_brkgchangeCM, App_Web_d3reltht" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>Trades Entry</title>
    <link type="text/css" href="../CSS/GenericCss.css" rel="Stylesheet" />
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/GenericJScript.js"></script>

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

    <script language="javascript" type="text/javascript">
        function Page_Load()///Call Into Page Load
        {  
           document.getElementById('txtClient').focus();
           document.getElementById('txtClient').select();
           Hide('td_showFilter');
           Hide('GRID');
           //height();            
           Height('350','350');         
        }
        function showOptions(obj1,obj2,obj3)
        {
                var date2=null;
                var date1 = dtfor.GetDate();
                 if(date1 != null) 
                 {
                   date2 =parseInt(date1.getMonth()+1)+'-'+date1.getDate()+'-'+ date1.getFullYear();
                 } 
                 obj=date2+'~'+'CLIENT';
                 ajax_showOptions(obj1,obj2,obj3,obj);
        }
        function ajaxshowOption(obj1,obj2,obj3)
        {
                var date2=null;
                var date1 = dtfor.GetDate();
                 if(date1 != null) 
                 {
                   date2 =parseInt(date1.getMonth()+1)+'-'+date1.getDate()+'-'+ date1.getFullYear();
                 } 
                 obj=date2+'~'+document.getElementById('txtClient_hidden').value;
                 ajax_showOptions(obj1,obj2,obj3,obj);
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
        function rdbtnAll(obj)
        {
            Hide('td_showFilter');
            document.getElementById('btn_show').disabled=false;
            
        }
        function rdbtnSelected(obj)
        {          
          if(document.getElementById('txtClient_hidden').value!='')
          {
               document.getElementById('td_showFilter').style.display='inline';
               if(obj=='Instruments')
               {
                   document.getElementById('cmbsearchOption').value='Instruments';
                   document.getElementById('btn_show').disabled=true;
                   document.getElementById('spanall').style.display="inline";
               }                
           }
           else
           {
             alert('Please Select Client!');
             document.getElementById('rdInstrumentAll').checked=true;
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
        function NORECORD(obj)
        {
           if(obj==1)
           {
               alert('No Record Found !!');
               Hide('td_showFilter');
               Hide('GRID');
               Height('350','350');                 
           }
           else
           {
               alert('Brkg should be less than Mkt Rate !!');
           }
        }
        function DISPLAY()
        {
            Hide('SELECT');
            Show('GRID');
            Height('350','350');
        }
        function filter()
        {
            Hide('td_showFilter');
            Hide('GRID');
            Show('SELECT');
            Height('350','350');
        }
        function displaydate(obj)
        {
            document.getElementById('spanshow2').innerText=obj;
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
                keynum = e.keyCode; 
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
    function Show_popUp_SetAmntAll()
    {  
        cPopUpEdit.Show();
    }
    function fn_btnDone_PopUpAmount_Click()
    {      
       var oAmntType=document.getElementById("<%=ddlAmountBy.ClientID%>").value;
       var oTxtVal= ctxtAmntUnitBrkg.GetText();
       SetAllTextBoxes(oAmntType,oTxtVal);
       cPopUpEdit.Hide();                        
    }
    function fn_btnCancel_PopUpAmount_Click()
    {
      cPopUpEdit.Hide();               
    }
    function string_contains(containerString, matchBySubString)
    {
        if(containerString.indexOf(matchBySubString) == -1)
        {
            return false;
        }
        else
        {
            return true;
        }
    }
    function SetAllTextBoxes(oAmntType,oTxtVal)
    {    
       var Gvw = document.getElementById("<%=grdbrkgchange.ClientID %>");
       var GvwQnty='';
       var GvwMrktRate='';
       var GvwBrkgAmnt='';
       for(i = 1;i < Gvw.rows.length-1; i++)
       { 
          GvwQnty=parseFloat(Gvw.rows[i].cells[1].getElementsByTagName("span")[0].innerHTML).toFixed(0);
          GvwMrktRate=Gvw.rows[i].cells[2].getElementsByTagName("span")[0].innerHTML;
          if(string_contains(GvwMrktRate,',')==true)
          {
             GvwMrktRate=GvwMrktRate.replace(',','');
          }
          GvwMrktRate=parseFloat(GvwMrktRate).toFixed(2);
          
          if(oAmntType=="2")
          {                
              GvwBrkgAmnt=parseFloat(parseFloat(parseFloat(GvwMrktRate) * parseFloat(oTxtVal))/100);
              if(GvwQnty<0)
              {
                Gvw.rows[i].cells[3].getElementsByTagName("input")[0].value = parseFloat(GvwBrkgAmnt).toFixed(2);
                Gvw.rows[i].cells[4].getElementsByTagName("input")[0].value = parseFloat(parseFloat(GvwMrktRate) + parseFloat(GvwBrkgAmnt)).toFixed(2);
                //Gvw.rows[i].cells[4].getElementsByTagName("span")[0].innerHTML ='M'; 
                //Gvw.rows[i].cells[4].getElementsByTagName("span")[0].style.visibility='hidden';
              }
              else
              {
                  if(parseFloat(GvwBrkgAmnt)>parseFloat(GvwMrktRate))
                  {
                      NORECORD(2);
                  }
                  else
                  {
                    Gvw.rows[i].cells[3].getElementsByTagName("input")[0].value = parseFloat(GvwBrkgAmnt).toFixed(2);
                    Gvw.rows[i].cells[4].getElementsByTagName("input")[0].value = parseFloat(parseFloat(GvwMrktRate) - parseFloat(GvwBrkgAmnt)).toFixed(2);
                    //Gvw.rows[i].cells[4].getElementsByTagName("span")[0].innerHTML ='M';
                    //Gvw.rows[i].cells[4].getElementsByTagName("span")[0].style.visibility='hidden';
                  }
              }
          }
          else
          {   
              GvwBrkgAmnt=parseFloat(oTxtVal);
              if(GvwQnty<0)
              {
                Gvw.rows[i].cells[3].getElementsByTagName("input")[0].value = parseFloat(GvwBrkgAmnt).toFixed(2);
                Gvw.rows[i].cells[4].getElementsByTagName("input")[0].value = parseFloat(parseFloat(GvwMrktRate) + parseFloat(GvwBrkgAmnt)).toFixed(2);             
                //Gvw.rows[i].cells[4].getElementsByTagName("span")[0].innerHTML ='M';
                //Gvw.rows[i].cells[4].getElementsByTagName("span")[0].style.visibility='hidden';
              }
              else
              {
                  if(parseFloat(GvwBrkgAmnt)>parseFloat(GvwMrktRate))
                  {
                      NORECORD(2);
                  }
                  else
                  {
                    Gvw.rows[i].cells[3].getElementsByTagName("input")[0].value = parseFloat(GvwBrkgAmnt).toFixed(2);
                    Gvw.rows[i].cells[4].getElementsByTagName("input")[0].value = parseFloat(parseFloat(GvwMrktRate) - parseFloat(GvwBrkgAmnt)).toFixed(2);             
                    //Gvw.rows[i].cells[4].getElementsByTagName("span")[0].innerHTML ='M';
                    //Gvw.rows[i].cells[4].getElementsByTagName("span")[0].style.visibility='hidden';
                  }
              }
          }
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
                        <strong><span style="color: #000099">Brokerage Change</span></strong>
                    </td>
                    <td class="EHEADER" width="10%" id="filter">
                        <a href="javascript:void(0);" onclick="filter();"><span style="color: Blue; text-decoration: underline;
                            font-size: 8pt; font-weight: bold">Filter</span></a>
                    </td>
                </tr>
            </table>
            <table id="SELECT">
                <tr valign="top">
                    <td colspan="3">
                        <dxe:ASPxDateEdit ID="dtFor" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                            Font-Size="10px" Width="108px" ClientInstanceName="dtfor">
                            <dropdownbutton text="For">
                        </dropdownbutton>
                        </dxe:ASPxDateEdit>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft" id="TdAc">
                        Clients
                    </td>
                    <td>
                        <asp:TextBox ID="txtClient" runat="server" Width="250px" Font-Size="10px"></asp:TextBox>
                    </td>
                    <td style="display: none;">
                        <asp:TextBox ID="txtClient_hidden" runat="server" Width="5px"></asp:TextBox>
                        <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="1px"></asp:TextBox>
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
                                    <asp:RadioButton ID="rdInstrumentAll" runat="server" Checked="True" GroupName="b" />
                                </td>
                                <td>
                                    All
                                </td>
                                <td>
                                    <asp:RadioButton ID="rdInstrumentSelected" runat="server" GroupName="b" />
                                </td>
                                <td>
                                    Selected
                                </td>
                                <td>
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
                                                    <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="200px"></asp:TextBox></span>
                                                <asp:DropDownList ID="cmbsearchOption" runat="server" Font-Size="11px" Width="70px"
                                                    Enabled="false">
                                                    <asp:ListItem>Instruments</asp:ListItem>
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
                <tr valign="top">
                    <td class="gridcellleft" colspan="2">
                        <asp:Button ID="btn_show" runat="server" CssClass="btnUpdate" Height="20px" Text="Show"
                            Width="100px" OnClick="btn_show_Click" />
                    </td>
                </tr>
            </table>
            <table id="GRID">
                <tr>
                    <td>
                        <span id="spanshow1" style="color: Blue; font-weight: bold">Brokerage Change For :</span>&nbsp;&nbsp;<span
                            id="spanshow2"></span></td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <div id="Row1" class="Row">
                                    <div id="lblGridHeader" class="paging textLeft" style="border-bottom: 1px solid #aaa;">
                                        <center>
                                            <div id="spnReqType" class="pagingContent">
                                                <a href="javascript:void(0);" onclick="Show_popUp_SetAmntAll()" title="Change The Brokerage By % or Amount"
                                                    style="border: 1px solid #aaa; color: #000; line-height: 2; color: #000; background-color: #eee;
                                                    padding: 2px; cursor: pointer; margin-top: 2px; font-size: 14px;">Change Brokerage
                                                    For All</a></div>
                                        </center>
                                        <span class="clear"></span>
                                        <asp:GridView ID="grdbrkgchange" runat="server" Width="450px" BorderColor="CornflowerBlue"
                                            ShowFooter="True" AutoGenerateColumns="false" BorderStyle="Solid" BorderWidth="2px"
                                            CellPadding="4" ForeColor="#0000C0">
                                            <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True"></FooterStyle>
                                            <Columns>
                                                <asp:TemplateField HeaderText="Scrip Name">
                                                    <ItemStyle BorderWidth="1px" HorizontalAlign="Left" Wrap="False"></ItemStyle>
                                                    <HeaderStyle HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblTickerSymbol" runat="server" Text='<%# Eval("TickerSymbol")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Qty">
                                                    <ItemStyle BorderWidth="1px" HorizontalAlign="Right" Wrap="False"></ItemStyle>
                                                    <HeaderStyle HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblQty" runat="server" Text='<%# Eval("CustomerTrades_UnitPriceQuantity")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Mkt Rate">
                                                    <ItemStyle BorderWidth="1px" HorizontalAlign="Right" Wrap="False"></ItemStyle>
                                                    <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblUnitPrice" runat="server" Text='<%# Eval("UnitPrice")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Unit Brkg">
                                                    <ItemStyle BorderWidth="1px" HorizontalAlign="Right" Wrap="False"></ItemStyle>
                                                    <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtUnitBrokerage" Onkeypress="return isNumberKey(event)" AutoPostBack="True"
                                                            Width="100px" Text='<%# Eval("UnitBrokerage")%>' runat="server" OnTextChanged="txtUnitBrokerage_TextChanged"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Net Rate">
                                                    <ItemStyle BorderWidth="1px" HorizontalAlign="Right" Wrap="False"></ItemStyle>
                                                    <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="txtNetRatePerUnit" Width="100px" Enabled="false" runat="server"
                                                            Text='<%# Eval("NetRatePerUnit")%>'></asp:TextBox>
                                                        <asp:Label ID="lblcustomertradeid" runat="server" Text='<%# Eval("CustomerTrades_ID")%>'
                                                            Visible="false"></asp:Label>
                                                        <asp:Label ID="lblcaltype" runat="server" Visible="false"></asp:Label>
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
                                        <span class="clear"></span>
                                    </div>
                                </div>
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
            <dxpc:ASPxPopupControl ID="PopUpEdit" runat="server" ClientInstanceName="cPopUpEdit"
                HeaderText="Brokerage Amount" Modal="True" PopupHorizontalAlign="Center" PopupVerticalAlign="Middle"
                Width="500px" CloseAction="CloseButton">
                <ContentCollection>
                    <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                        <asp:Panel ID="Panel1" runat="server" Width="99%">
                            <div class="left">
                                <div style="font-size: 12px;">
                                    <div style="margin-left: 70px;">
                                        Select Type :
                                        <select id="ddlAmountBy" runat="server" style="width: 105px;">
                                            <option value="1" selected="selected">Amount</option>
                                            <option value="2">Percentage</option>
                                        </select>
                                    </div>
                                    <br class="clear" />
                                    <div class="left">
                                        <div class="left">
                                            Enter Amount/Percentage :&nbsp;</div>
                                        <div class="left">
                                            <dxe:ASPxTextBox ID="txtAmntUnitBrkg" runat="server" ClientInstanceName="ctxtAmntUnitBrkg"
                                                Width="100px" HorizontalAlign="right">
                                                <masksettings mask="&lt;0..999g&gt;.&lt;0000..9999&gt;" includeliterals="DecimalSymbol" />
                                            </dxe:ASPxTextBox></div>
                                    </div>
                                    <br />
                                    <br />
                                </div>
                                <div class="left" style="margin-left: 135px;">
                                    <dxe:ASPxButton AccessKey="d" ID="btnDone_PopUpAmount" runat="server" Width="80px"
                                        ToolTip="Done" Text="[D]one" AutoPostBack="False">
                                        <clientsideevents click="function(s, e) {fn_btnDone_PopUpAmount_Click();}"></clientsideevents>
                                    </dxe:ASPxButton>
                                </div>
                                <div class="left" style="margin-left: 10px;">
                                    <dxe:ASPxButton AccessKey="c" ID="btnCancel_PopUpAmount" runat="server" Width="80px"
                                        ToolTip="Cancel" Text="[C]ancel" AutoPostBack="False">
                                        <clientsideevents click="function(s, e) {fn_btnCancel_PopUpAmount_Click();}"></clientsideevents>
                                    </dxe:ASPxButton>
                                </div>
                                <br class="clear" />
                            </div>
                            <br class="clear" />
                        </asp:Panel>
                    </dxpc:PopupControlContentControl>
                </ContentCollection>
                <HeaderStyle BackColor="LightGray" ForeColor="Black" Font-Names="Calibri" />
            </dxpc:ASPxPopupControl>
        </div>
    </form>
</body>
</html>
