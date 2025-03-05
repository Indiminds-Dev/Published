<%@ page language="C#" autoeventwireup="true" inherits="management_StpFiles, App_Web_6yanuau_" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Stp Files</title>
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
	  FieldName='lstSlection';
	</style>

    <script language="javascript" type="text/javascript">
  function Page_Load()///Call Into Page Load
            {   
                Hide('tr_generate');
                Hide('tr_DOWNLOAD');
                Hide('tr_grid');
                Hide('td_selection');
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
     function NORECORD()
     {
        Hide('tr_DOWNLOAD');
        Hide('tr_grid');
        Hide('td_selection')
        alert('No Record Found !!');
     }
    function dispaly()
     {
        Show('tr_generate');
        Hide('tr_DOWNLOAD');
        Show('tr_grid');
        Hide('td_selection');
        Hide('td_selection');
        height()
     }
    function dispalycreate()
     {
        Hide('tr_generate');
        Show('tr_DOWNLOAD');
        Show('tr_grid');
        Hide('td_selection');
        alert('Files Create Successfully !!');
        height()

     }
     function download()
     {
        Hide('tr_generate');
        Hide('tr_DOWNLOAD');
        Hide('tr_grid');
        Hide('td_selection');
        height();
     }
     function fn_ddlchange(obj)
     {
         Hide('tr_generate');
         Hide('tr_DOWNLOAD');
         Hide('tr_grid');
         Hide('td_selection');
         height();
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
                        listIDs = "'"+listBoxSubs.options[i].value+"'";
                    else
                        listIDs += "," +"'"+ listBoxSubs.options[i].value+"'";
                }
            }
            
            document.getElementById('clientid').value=listIDs;
             Hide('td_selection');

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
            
            
    function btnAddsubscriptionlist_click()
        {
            var userid = document.getElementById('txtSelectionID_hidden');
         
            if(userid.value != '')
            {
                var ids = document.getElementById('txtSelectionID_hidden');
                var Client = document.getElementById('txtSelectionID');
                var listBox = document.getElementById('lstSlection');
                var tLength = listBox.length;
                 
                
                
                var no = new Option();
                no.value = ids.value;
                no.text = Client.value;
                listBox[tLength]=no;
                var recipient = document.getElementById('txtSelectionID_hidden');
                recipient.value='';
            }
            else
                alert('Please search name and then Add!')
            var s=document.getElementById('txtSelectionID');
            s.value='';
            s.focus();
            s.select();
        } 
        
        function FunClientScrip(obj1,obj2,obj3)
         { 
             ajax_showOptions(obj1,obj2,obj3,"Clientsstpprovider");
             
         }
    function fn_clients(obj)
      {
            if(obj=="a")
            {
                Hide('td_selection');
            }
             else
             {
                  Show('td_selection');
             }
              
      }
        FieldName='lstSlection';
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server" autocomplete="off">
     <asp:HiddenField ID="clientid" runat="server" />
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
                        <strong><span id="SpanHeader" style="color: #000099">STP Files</span></strong>
                    </td>
                    <td class="EHEADER" width="15%" style="height: 22px">
                    </td>
                </tr>
            </table>
            <table>
                <tr valign="top">
                    <td >
                        Export Type :</td>
                    <td>
                        <asp:DropDownList ID="ddlType" runat="server" Width="180px" Font-Size="10px" onchange="fn_ddlchange(this.value);">
                            <asp:ListItem Value="0">FT-ISO15022</asp:ListItem>
                            <asp:ListItem Value="1">NSEiT</asp:ListItem>
                            <asp:ListItem Value="2">STeADY</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td rowspan="3" id="td_selection">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td id="TdFilter">
                                    <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" onkeyup="FunClientScrip(this,'ShowClientFORMarginStocks',event)"
                                        Width="150px"></asp:TextBox>
                                    <asp:DropDownList ID="cmbsearchOption" runat="server" Enabled="false" Font-Size="11px"
                                        Width="70px">
                                        <asp:ListItem>Clientsstpprovider</asp:ListItem>
                                    </asp:DropDownList>
                                    <a id="A4" href="javascript:void(0);" onclick="btnAddsubscriptionlist_click()"><span
                                        style="font-size: 8pt; color: #009900; text-decoration: underline">Add to List</span></a><span
                                            style="font-size: 8pt; color: #009900"> </span>
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
                                                <a id="A2" href="javascript:void(0);" onclick="clientselectionfinal()"><span style="font-size: 10pt;
                                                    color: #000099; text-decoration: underline">Done</span></a> &nbsp;
                                            </td>
                                            <td>
                                                <a id="A1" href="javascript:void(0);" onclick="btnRemovefromsubscriptionlist_click()">
                                                    <span style="font-size: 8pt; color: #cc3300; text-decoration: underline">Remove</span></a>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr valign="top">
                    <td class="gridcellleft" id="TdAc" style="width: 73px">
                        Clients
                    </td>
                    <td style="text-align: left;" id="TdAc1">
                        <table>
                            <tr>
                                <td>
                                    <asp:RadioButton ID="rdClientAll" runat="server" Checked="True" GroupName="a" onclick="fn_clients('a')"/>
                                </td>
                                <td>
                                    All
                                </td>
                                <td>
                                    <asp:RadioButton ID="rdClientSelected" runat="server" GroupName="a" onclick="fn_clients('b')"/>
                                </td>
                                <td>
                                    Selected
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="tr_show" valign="top">
                    <td colspan="2">
                        <asp:Button ID="btnshow" runat="server" CssClass="btnUpdate" Height="20px" Text="Show"
                            Width="101px" OnClick="btnshow_Click" />
                    </td>
                </tr>
            </table>
            <table id="tab3">
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
            <table cellpadding="0" cellspacing="0" border="0">
            <tr id="tr_grid"><td> <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                        
                            <asp:GridView ID="grdcontract" runat="server" Width="100%" BorderColor="CornflowerBlue"
                                ShowFooter="True" AllowSorting="true" AutoGenerateColumns="False" BorderStyle="Solid"
                                BorderWidth="2px" ForeColor="#0000C0" >
                                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True"></FooterStyle>
                                <Columns>
                                   <asp:TemplateField HeaderText="Select">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelect" runat="server" />
                                        </ItemTemplate>
                                        <HeaderTemplate>
                                            <asp:Label ID="lblcheck" runat="server" Text="Select"></asp:Label>
                                        </HeaderTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Client Name" >
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblCLIENTNAME" runat="server" Text='<%# Eval("CLIENTNAME")%>' CssClass="gridstyleheight1"></asp:Label>
                                             <asp:Label ID="lblcustomerid" runat="server" Text='<%# Eval("ContractNotes_CustomerID")%>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="UCC">
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblUCC" runat="server" Text='<%# Eval("UCC")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   
                                      <asp:TemplateField HeaderText="Cntr. No." >
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Center"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblContractNotes_Number" runat="server" Text='<%# Eval("ContractNotes_Number")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="File Type" >
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Center"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblStpType" runat="server" Text='<%# Eval("StpType")%>' CssClass="gridstyleheight1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Gen.Date" >
                                        <ItemStyle Wrap="False" BorderWidth="1px" HorizontalAlign="Center"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblStpGenerateDateTime" runat="server" Text='<%# Eval("StpGenerateDateTime")%>' CssClass="gridstyleheight1"></asp:Label>
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
                            <asp:AsyncPostBackTrigger ControlID="btnshow" EventName="Click" />
                             <asp:AsyncPostBackTrigger ControlID="btnGenerate" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel></td></tr>
                    <tr id="tr_generate"><td>  <asp:Button ID="btnGenerate" runat="server" CssClass="btnUpdate" Height="20px" Text="Generate"
                            Width="101px" OnClick="btnGenerate_Click"  /><br /></td></tr>
                     <tr id="tr_DOWNLOAD"><td>  <asp:Button ID="btndownload" runat="server" CssClass="btnUpdate" Height="20px" Text="Download All Files"
                            Width="101px"  OnClick="btndownload_Click" />
                         </td></tr>
                           
                            
            </table>
            
        </div>
        <div><table><tr><td style="display:none;"><asp:TextBox ID="txtSelectionID_hidden" runat="server" Width="14px"></asp:TextBox>
</td></tr></table></div>
    </form>
</body>
</html>
