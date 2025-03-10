<%@ page language="C#" autoeventwireup="true" inherits="management_Tradesiframe, App_Web_v5pngf_u" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>BSE-CM Trades</title>
     <link href="../CSS/style.css" rel="stylesheet" type="text/css" />
         <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
   <%-- <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>--%>
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
            width:55%;
            scrollbar-base-color: #C0C0C0;
        
	}
	
	</style>
	 <script language="javascript" type="text/javascript">
    function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
    {
        if(document.body.scrollHeight>=350)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '350px';
        window.frameElement.Width = document.body.scrollWidth;
    }
        FieldName='lstSlection';
      function selectfile()
    {
        var i=document.getElementById('cmbTrade').value;
        document.getElementById('txtType').value=i;

    }
      function hide()
    {
        document.getElementById('tdyes').style.display='none';
        document.getElementById('tdno').style.display='none';
        document.getElementById('tr_CustCheck').style.display='none';
        document.getElementById('tr_CustTxt').style.display='none';
        document.getElementById('tr_CustBtn').style.display='none';
    }
    function show()
    {
        document.getElementById('tdyes').style.display='inline';
        document.getElementById('tdno').style.display='inline';
    }
     function showtr_Cust()
    {
        document.getElementById('tr_CustCheck').style.display='inline';
    }

          function fnClientcallajax(objID,objListFun,objEvent,ObjCriteria)
         {
             ajax_showOptions(objID,'ShowClientFORMarginStocks',objEvent,'Clients');
         } 
     function ddlAddClient(obj)
        {
            if(obj==1)
            {
               document.getElementById('tr_CustTxt').style.display='inline';
               document.getElementById('tr_CustBtn').style.display='none';
            }
            else if(obj==2)
            {
                document.getElementById('tr_CustTxt').style.display='none';
               document.getElementById('tr_CustBtn').style.display='inline';
             }
             else
             {
               document.getElementById('tr_CustTxt').style.display='none';
               document.getElementById('tr_CustBtn').style.display='none';
             }
        }
     function OnLinkButtonClick()
     {
        var url='TradeImportDetails.aspx';
       parent.OnMoreInfoClick(url,"Trade Import Details",'800px','450px');
     
     }
    </script>
    </head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center">
            <asp:Panel ID="Panelmain" runat="server" Visible="true">
                <table id="tbl_main" class="login" cellspacing="0" cellpadding="0" width="410">
                    <tbody>
                        <tr>
                            <td class="lt1">
                                <h5>
                                    Imports BSE TRADES Files</h5>
                            </td>
                        </tr>
                        <tr>
                            <td class="lt brdr">
                                <table cellspacing="0" cellpadding="0" align="center">
                                    <tbody>
                                        <tr>
                                            <td class="lt">
                                                <table class="width100per" cellspacing="12" cellpadding="0">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                                                </asp:ScriptManager>
                                                            </td>
                                                        </tr>
                                                        <tr id="trYesNo" runat="server">
                                                            <td style="height: 99px">
                                                                <table width="100%">
                                                                    <tr>
                                                                        <td align="center">
                                                                            <table width="100%">
                                                                                <tr>
                                                                                    <td>
                                                                                        <asp:Label ID="lblYesNo" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>
                                                                                        <table width="100%">
                                                                                            <tr>
                                                                                                <td align="right">
                                                                                                    <asp:Button ID="btnYes" runat="server" CssClass="btn" Text="Yes" OnClick="btnYes_Click" />
                                                                                                </td>
                                                                                                <td align="left">
                                                                                                    <asp:Button ID="btnNo" runat="server" CssClass="btn" Text="No" OnClick="btnNo_Click" />
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
                                                        <tr>
                                                            <td class="lt">
                                                                <asp:Label ID="importstatus" runat="server" Font-Size="13px" Font-Names="Arial"
                                                                    Font-Bold="True" ForeColor="Green" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lt" colspan="2">
                                                                <div id="divStatus" runat="server">
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lt" colspan="2">
                                                                <div id="divCust" runat="server">
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr id="tr_CustCheck" runat="server">
                                                            <td>
                                                                <asp:DropDownList ID="ddlClient" runat="server" Width="191px" onchange="ddlAddClient(this.value)">
                                                                    <asp:ListItem Value="0">Select Action</asp:ListItem>
                                                                    <asp:ListItem Value="1">Update all Unidentified Clients</asp:ListItem>
                                                                    <asp:ListItem Value="2">Delete all unIdentified Clients</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr id="tr_CustTxt">
                                                            <td class="lt">
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            Select One Client
                                                                        </td>
                                                                        <td>
                                                                            <asp:TextBox ID="txtClient" runat="server" Width="200px" Font-Size="11px" onkeyup="fnClientcallajax(this,'chkfn',event,'Clients')"></asp:TextBox>
                                                                        </td>
                                                                        <td style="height: 22px">
                                                                            <asp:Button ID="btnCust" runat="server" CssClass="btn" Text="Update" OnClick="btnCust_Click" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr id="tr_CustBtn">
                                                            <td>
                                                                <asp:Button ID="btnRemove" runat="server" CssClass="btn" Text="Remove" OnClick="btnRemove_Click" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lt" colspan="2">
                                                                <table>
                                                                    <tr>
                                                                        <td colspan="4">
                                                                            <div id="divterminalID" runat="server">
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td id="tdyes">
                                                                            <asp:Button ID="btnTerminalYes" runat="server" CssClass="btn" Text="Yes"
                                                                                Width="84px" OnClick="btnTerminalYes_Click" />
                                                                        </td>
                                                                        <td id="tdno">
                                                                            <asp:Button ID="btnTerminalNo" runat="server" CssClass="btn" Text="No"
                                                                                Width="84px" OnClick="btnTerminalNo_Click" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="lt">
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                                                <ContentTemplate>
                                                                                    <asp:DropDownList ID="ddlFileList" runat="server" Width="222px" AutoPostBack="True"
                                                                                        Height="19px">
                                                                                        <asp:ListItem Value="0">Select</asp:ListItem>
                                                                                        <asp:ListItem Value="1">CSE BSE Trade File</asp:ListItem>
                                                                                        <asp:ListItem Value="2">BSE Members Trade Files (DNLD/UDiFF)</asp:ListItem>
                                                                                        <asp:ListItem Value="3">BSE Members Trade Files (TWS)</asp:ListItem>
                                                                                        <asp:ListItem Value="4">ODIN TXT</asp:ListItem>
											                                            <asp:ListItem Value="5">NOW Default</asp:ListItem>
											                                            <asp:ListItem Value="6">Auction Offeror Trades</asp:ListItem>
											                                            <asp:ListItem Value="7">FastTrade TXT File</asp:ListItem>
											                                            <asp:ListItem Value="8">Class Trade CSV File</asp:ListItem>
											                                            <asp:ListItem Value="9">OFS Trade File [ANddMMyy.tmCode]</asp:ListItem>
											                                            <asp:ListItem Value="10">BuyBack Trade File [ACQddMMyy.tmCode]</asp:ListItem>
                                                                                        <asp:ListItem Value="11">ODIN CSV</asp:ListItem>
                                                                                        <asp:ListItem Value="12">Influx Txt File</asp:ListItem>
                                                                                        <asp:ListItem Value="13">ATIN CSV File</asp:ListItem>
											                                            <asp:ListItem Value="14">BEST Txt File</asp:ListItem>
											                                            <asp:ListItem Value="15">MOSL Trade File</asp:ListItem>
											                                            <asp:ListItem Value="16">Other Formats</asp:ListItem>
                                                                                    </asp:DropDownList><br />
                                                                                    <asp:Label ID="lblMessage" runat="server" Width="270px"></asp:Label>
                                                                                </ContentTemplate>
                                                                            </asp:UpdatePanel>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:FileUpload ID="OFDSelectFile" runat="server" Width="282px" Height="23px" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Button ID="BtnSave" runat="server" Text="Import File" CssClass="btn" OnClick="BtnSave_Click"
                                                                                Width="84px" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </asp:Panel>
            <table>
                <tr>
                    <td style="display: none;">
                        <asp:HiddenField ID="hdfname" runat="server" />
                        <asp:HiddenField ID="hdnDate" runat="server" />
                        <asp:HiddenField ID="hdnTerminalID" runat="server" />
                        <asp:TextBox ID="txtClient_hidden" runat="server" Width="5px"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
