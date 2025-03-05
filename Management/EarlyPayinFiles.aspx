<%@ page language="C#" autoeventwireup="true" inherits="management_EarlyPayinFiles, App_Web_g1t3n0jz" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Early-Payin Files</title>
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
                 Hide('showFilter');
                 Hide('tabgenerate');
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
      function FunClientScrip(objID,objListFun,objEvent)
        {
               cmbVal=document.getElementById('cmbsearchOption').value;
               cmbVal=cmbVal
               ajax_showOptions(objID,objListFun,objEvent,cmbVal);
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
              height();
        }
      function Instruments(obj)
      {
            if(obj=="a")
                Hide('showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='Instruments';
                  Show('showFilter');
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
  function NORECORD()
  {
     
      Hide('displayAll');
      Hide('showFilter');
      Hide('tabgenerate');
      alert('No Record Found!!');
      height();
  }
  function Display()
  {
      Show('displayAll');
      Hide('showFilter');
      Show('tabgenerate');
      height();
  }


  FieldName='lstSlection';
 </script>
   <script language="javascript">

 function SelectAllCheckboxes(spanChk){

   // Added as ASPX uses SPAN for checkbox
   var oItem = spanChk.children;
   var theBox= (spanChk.type=="checkbox") ? 
        spanChk : spanChk.children.item[0];
   xState=theBox.checked;
   elm=theBox.form.elements;

   for(i=0;i<elm.length;i++)
     if(elm[i].type=="checkbox" && 
              elm[i].id!=theBox.id)
     {
       //elm[i].click();
       if(elm[i].checked!=xState)
         elm[i].click();
       //elm[i].checked=xState;
     }
     
 }
</script>
	
  <script type="text/ecmascript">   
       function ReceiveServerData(rValue)
        {
               
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
                    <strong><span id="SpanHeader" style="color: #000099">Early-Payin Files</span></strong>
                </td>
              
            </tr>
        </table>
        <table id="tab2" border="0" cellpadding="0" cellspacing="0">
            <tr valign="top">
                <td >
                    <table>
                        <tr valign="top">
                            <td class="gridcellleft">
                                <table border="10" cellpadding="1" cellspacing="1">

                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Clients :</td>
                                        <td>
                                            <asp:RadioButton ID="rdbClientALL" runat="server" Checked="True" GroupName="a" onclick="Clients('a')" />
                                            All Client
                                        </td>
                                       
                                        <td>
                                            <asp:RadioButton ID="rdbClientSelected" runat="server" GroupName="a" onclick="Clients('b')" />
                                            Selected Client
                                        </td>
                                    </tr>
                                     <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Scrip :</td>
                                        <td>
                                            <asp:RadioButton ID="rdbScripAll" runat="server" Checked="True" GroupName="b" onclick="Instruments('a')" />
                                            All Scrip
                                        </td>
                                       
                                        <td>
                                            <asp:RadioButton ID="rdbScripSelected" runat="server" GroupName="b" onclick="Instruments('b')" />
                                            Selected Scrip
                                        </td>
                                    </tr>
                                    <tr>
                                       
                                        <td style="height: 22px"  colspan="3" align="left">
                                            <asp:Button ID="btnshow" runat="server" CssClass="btnUpdate" Height="20px" Text="Show"
                                                 Width="101px" OnClick="btnshow_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                       
                      
                    </table>
                </td>
                <td >
                    <table width="100%" id="showFilter">
                        <tr>
                            <td style="text-align: right; vertical-align: top; height: 134px;">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="gridcellleft" style="vertical-align: top; text-align: right; height: 21px;"
                                            id="TdFilter">
                                            <span id="spanunder"></span><span id="spanclient"></span>
                                            <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="150px" onkeyup="FunClientScrip(this,'SearchForTradeRegister',event)"></asp:TextBox>
                                            <asp:DropDownList ID="cmbsearchOption" runat="server" Font-Size="11px" Width="70px"
                                                Enabled="false">
                                                <asp:ListItem>Clients</asp:ListItem>
                                                <asp:ListItem>Instruments</asp:ListItem>
                                                
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
                    
        <div id="displayAll" >
            <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                <ContentTemplate>
                 <asp:GridView ID="grdearlypayin" runat="server" Width="100%" BorderColor="CornflowerBlue"
                                    ShowFooter="True" AllowSorting="true"  
                                    AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="2px" 
                                     ForeColor="#0000C0"  >
                                    <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True"></FooterStyle>
                                    <Columns>
                                     <asp:TemplateField HeaderText="Select">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelect" runat="server" onclick="fn_chk()"/>
                                                <asp:Label ID="lblproductid" runat="server" Text='<%#Eval("DematPosition_ProductSeriesID")%>'  Visible="false"></asp:Label>
                                                <asp:Label ID="lblclientid" runat="server"  Visible="false" Text='<%#Eval("DematPosition_CustomerID")%>'
                                                   ></asp:Label>
                                            </ItemTemplate>
                                            <HeaderTemplate>
                                                <input id="chkAll" runat="server" type="checkbox" onclick="javascript:SelectAllCheckboxes(this);" /> 
                                                <asp:Label ID="lblcheck" runat="server" Text="All"></asp:Label>
                                            </HeaderTemplate>
                                        </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Client Name"  >
                                            <ItemStyle  Wrap="False" BorderWidth="1px"  HorizontalAlign="Left"></ItemStyle>
                                            <HeaderStyle HorizontalAlign="Center" Font-Bold="False"  >
                                            </HeaderStyle>
                                            <ItemTemplate >
                                                <asp:Label ID="lblClient" runat="server" Text='<%# Eval("Client")%>'  CssClass="gridstyleheight1"></asp:Label>
                                            </ItemTemplate>
                                          
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Code" >
                                            <ItemStyle Wrap="False"  BorderWidth="1px"  HorizontalAlign="Left"></ItemStyle>
                                            <HeaderStyle HorizontalAlign="Center" Font-Bold="False"  >
                                            </HeaderStyle>
                                            <ItemTemplate >
                                                <asp:Label ID="lblUCC" runat="server" Text='<%# Eval("UCC")%>'  CssClass="gridstyleheight1"></asp:Label>
                                            </ItemTemplate>
                                          
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField HeaderText="Scrip" >
                                            <ItemStyle  Wrap="False" BorderWidth="1px"  HorizontalAlign="Left"  ></ItemStyle>
                                            <HeaderStyle  HorizontalAlign="Center" Font-Bold="False"  >
                                            </HeaderStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblScrip" runat="server" Text='<%# Eval("Scrip")%>'   CssClass="gridstyleheight1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Qty To Receive" SortExpression="flag">
                                            <ItemStyle  Wrap="False" BorderWidth="1px"  HorizontalAlign="Center"  ></ItemStyle>
                                            <HeaderStyle   HorizontalAlign="Center" Font-Bold="False"  >
                                            </HeaderStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblDematPosition_QtyToReceive" runat="server" Text='<%# Eval("DematPosition_QtyToReceive")%>'  CssClass="gridstyleheight1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                       
                                         <asp:TemplateField HeaderText="Qty Received" >
                                            <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Right"  ></ItemStyle>
                                            <HeaderStyle HorizontalAlign="Center" Font-Bold="False"  >
                                            </HeaderStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblDematPosition_QtyReceived" runat="server" Text='<%# Eval("DematPosition_QtyReceived")%>'   CssClass="gridstyleheight1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                           <asp:TemplateField HeaderText="EPI Qty">
                                            <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Right"  ></ItemStyle>
                                            <HeaderStyle HorizontalAlign="Center" Font-Bold="False"  >
                                            </HeaderStyle>
                                            <ItemTemplate>
                                                <asp:TextBox ID="txtearlypayinqty" runat="server" Text='<%# Eval("DematPosition_QtyReceived")%>'   CssClass="gridstyleheight1"></asp:TextBox>
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
                    <asp:AsyncPostBackTrigger ControlID="btnshow" EventName="Click"></asp:AsyncPostBackTrigger>
                </Triggers>
            </asp:UpdatePanel>
        </div>
        <table id="tabgenerate"> <tr >
                                       
                                        <td style="height: 22px" align="left">
                                            <asp:Button ID="btngenerate" runat="server" CssClass="btnUpdate" Height="20px" Text="Generate File"
                                                 Width="101px" OnClick="btngenerate_Click"  />
                                        </td>
                                    </tr></table>
    </div>
    </form>
</body>
</html>
