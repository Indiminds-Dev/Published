<%@ page language="C#" autoeventwireup="true" inherits="management_tradedeletecomm, App_Web_8qixh_8w" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <title>Trade Delete</title>
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
    .grid_scroll
     { 
     overflow-y: scroll;
     overflow-x: scroll;
     height:300px;
     scrollbar-base-color: #C0C0C0;
     }
	</style>
 <script language="javascript" type="text/javascript">
   function Page_Load()///Call Into Page Load
            {   
                document.getElementById('td_txtterminalid').style.display='none';
                document.getElementById('tr_expla').style.display='none';
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
            window.frameElement.width = document.body.scrollWidth;
        }
      
	
   function fn_TerminalId(obj)
      {
           if(obj=="a")
                document.getElementById('td_txtterminalid').style.display='none';
           else
                   document.getElementById('td_txtterminalid').style.display='inline';
      }
      function fn_expla(obj)
      {
        if(obj=="4")
                  document.getElementById('tr_expla').style.display='inline';
        else
                  document.getElementById('tr_expla').style.display='none';
        
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
                     document.getElementById('btnremove').click();
                     if(document.getElementById('rdbtradetypeall').checked==true)
                       {
                          document.getElementById('tr_expla').style.display='none';
                       }
                }
            }
        } 
                
    }
       FieldName='lstSlection'; 
 </script>
      <script type="text/ecmascript">
        
	    function ReceiveServerData(rValue)
        {
            var j=rValue.split('~');
       
           if(j[0]=='TerminalId')
            {
                document.getElementById('HiddenField_TerminalId').value = j[1];
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
                <td class="EHEADER" style="text-align: center;">
                    <strong><span style="color: #000099">Delete Trade</span></strong>
                </td>
            </tr>
        </table>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table>
                    <tr valign="top">
                        <td>
                            <table border="1" cellpadding="0" cellspacing="0">
                                <tr valign="top">
                                    <td class="gridcellleft" bgcolor="#b7ceec">
                                        For A Period :</td>
                                    <td>
                                        <dxe:ASPxDateEdit ID="dtFrom" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                            Font-Size="10px" Width="108px" ClientInstanceName="dtFrom">
                                            <dropdownbutton text="From">
                        </dropdownbutton>
                                        </dxe:ASPxDateEdit>
                                    </td>
                                    <td>
                                        <dxe:ASPxDateEdit ID="dtTo" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                            Font-Size="10px" Width="108px" ClientInstanceName="dtTo">
                                            <dropdownbutton text="To">
                        </dropdownbutton>
                                        </dxe:ASPxDateEdit>
                                    </td><td></td>
                                </tr>
                                <tr valign="top">
                                    <td class="gridcellleft" bgcolor="#b7ceec">
                                        Terminal Id:
                                    </td>
                                    <td style="text-align: left;" colspan="2" valign="top">
                                        <table>
                                            <tr>
                                                <td valign="top">
                                                    <asp:RadioButton ID="rdbTerminalAll" runat="server" Checked="true" GroupName="c"
                                                        onclick="fn_TerminalId('a')" />
                                                </td>
                                                <td valign="top">
                                                    All
                                                </td>
                                                <td valign="top">
                                                    <asp:RadioButton ID="rdbTerminalSelected" runat="server" GroupName="c" onclick="fn_TerminalId('b')" />
                                                </td>
                                                <td valign="top">
                                                    Selected
                                                </td>
                                                <td id="td_txtterminalid" style="display:none;">
                                                    <asp:TextBox ID="TerminalId" runat="server" onkeyup="ajax_showOptions(this,'ShowClientFORMarginStocks',event,'TerminalId')"></asp:TextBox></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                 <tr valign="top">
                                    <td class="gridcellleft" bgcolor="#b7ceec">
                                        Trade Type:
                                    </td>
                                    <td style="text-align: left;" colspan="2" valign="top">
                                        <table>
                                            <tr>
                                                <td valign="top">
                                                    <asp:DropDownList ID="ddlTYPE" runat="server" Width="100px" Font-Size="10px" onchange="fn_expla(this.value)">
                                                        <asp:ListItem Value="1">All Trades</asp:ListItem>
                                                        <asp:ListItem Value="2">Manual Trades</asp:ListItem>
                                                        <asp:ListItem Value="3">Imported Trades</asp:ListItem>
                                                        <asp:ListItem Value="4">Split Trades</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <%--<asp:RadioButton ID="rdbtradetypeall" runat="server" Checked="true" GroupName="cd" onclick="fn_expla('a')" 
                                                       />--%>
                                                </td>
                                              <%--  <td valign="top">
                                                    All
                                                </td>
                                                <td valign="top">
                                                    <asp:RadioButton ID="rdbtradetypeSelected" runat="server" GroupName="cd" onclick="fn_expla('b')" />
                                                </td>
                                                <td valign="top">
                                                    Split Trades
                                                </td>--%>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr id="tr_expla" style="display:none;">
                                    <td colspan="3">
                                        <table style="width:300px;">
                                            <tr>
                                                <td style="color: Blue;">
                                                    Only Splited Trades Will Be Remove from the System.You Have To Process Trades Again
                                                    To Get back the Original Un-Splited Records.</td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <asp:Button ID="btn_del" OnClientClick="javascript:return Delete();" runat="server"
                                            Text="Remove" CssClass="btnUpdate" Height="23px" Width="101px" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="display: none;">
                            <asp:Button ID="btnremove" runat="server" Text="Remove" CssClass="btnUpdate" Height="23px"
                                Width="101px" OnClick="btnremove_Click" />
                            <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="1px"></asp:TextBox>
                            <asp:TextBox ID="TerminalId_hidden" runat="server"></asp:TextBox></td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
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
     
    </div>
    </form>
</body>
</html>