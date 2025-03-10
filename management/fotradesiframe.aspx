<%@ page language="C#" autoeventwireup="true" inherits="management_fotradesiframe, App_Web_5uqmplyf" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>NSE-FO Trade</title>
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
        if(document.body.scrollHeight>=400)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '400px';
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
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div align="center">
            <asp:Panel ID="Panelmain" runat="server" Visible="true">
                <table id="tbl_main" class="login" cellspacing="0" cellpadding="0" width="410">
                    <tbody>
                        <tr>
                            <td class="lt1">
                                <h5>
                                    Imports TRADES Files
                                </h5>
                            </td>
                        </tr>
                        <tr>
                            <td class="lt brdr">
                                <table cellspacing="0" cellpadding="0" align="center">
                                    <tbody>
							<tr>
                                            <td class="lt" colspan="2">
                                                <div id="divStatus" runat="server"> </div>
                                            </td>
                                             </tr>
                                   
                                            <tr>
                                            <td class="lt" colspan="2">
                                                <div id="divCust" runat="server"></div>
                                            </td>
                                            </tr>
                                              <tr id="tr_CustCheck" runat="server">
                                     <%--<td colspan="2">
                                        <asp:CheckBox ID="ChkClient" runat="server" ForeColor="Red" Text="Update / Remove all unidetified trades" onclick="ChkAddClient(this.checked);" Width="370px"/>
                                    </td>--%>
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
                                             <asp:Button ID="btnCust" runat="server" CssClass="btn" Text="Update" OnClick="btnCust_Click"/>
                                        </td>
                                        
                                        </tr>
                                        </table>
                                        </td>
                                    </tr>
                                    <tr id="tr_CustBtn">
                                    <td style="height: 19px">
                                          <asp:Button ID="btnRemove" runat="server" CssClass="btn" Text="Remove" OnClick="btnRemove_Click"/>
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
                                                    <td id="tdyes" style="height: 21px">
                                                        <asp:Button ID="btnYes" runat="server" CssClass="btn" OnClick="btnYes_Click" Text="Yes"
                                                            Width="84px" />
                                                    </td>
                                                    <td id="tdno" style="height: 21px">
                                                        <asp:Button ID="btnNo" runat="server" CssClass="btn" OnClick="btnNo_Click" Text="No"
                                                            Width="84px" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                            <td class="lt">
                                                <table class="width100per" cellspacing="12" cellpadding="0">
                                                    <tbody>
                                                     
                                                        <tr>
                                                            <td align="center" valign="middle">
                                                                <asp:Label ID="importstatus" runat="server" Font-Size="XX-Small" Font-Names="Arial"
                                                                    Font-Bold="True" ForeColor="Green" />
                                                            </td>
                                                        </tr>
                                                      
                                                        <tr>
                                                            <td class="lt">
                                                                <table>
                                                                    <tr>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="width: 6px">
                                                                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                                                                            </asp:ScriptManager>
                                                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                                                <ContentTemplate>
                                                                                    <asp:DropDownList ID="ddlFileList" runat="server" Width="210px" AutoPostBack="True"
                                                                                        Height="20px" OnSelectedIndexChanged="ddlFileList_SelectedIndexChanged">
                                                                                        <asp:ListItem Value="0">Select</asp:ListItem>
                                                                                        <asp:ListItem Value="1">Final CSV</asp:ListItem>
                                                                                        <asp:ListItem Value="2">Final Txt/UDiFF Files</asp:ListItem>
                                                                                        <asp:ListItem Value="3">Neat/BEST Txt</asp:ListItem>
                                                                                        <asp:ListItem Value="4">Odin Txt</asp:ListItem>
                                                                                        <asp:ListItem Value="5">Now Txt</asp:ListItem>
                                                                                        <asp:ListItem Value="6">Omne Txt</asp:ListItem>
                                                                                        <asp:ListItem Value="7">Greek Txt</asp:ListItem>
                                                                                        <asp:ListItem Value="8">Flex Txt</asp:ListItem>
                                                                                        <asp:ListItem Value="9">Now_Old Txt</asp:ListItem>
											                                            <asp:ListItem Value="10">OdinDEF Txt</asp:ListItem>
											                                            <asp:ListItem Value="11">NowDEF Txt</asp:ListItem>
											                                            <asp:ListItem Value="12">NEATDEF Txt</asp:ListItem>
											                                            <asp:ListItem Value="13">Opening Trades From Custom File</asp:ListItem>	
											                                            <asp:ListItem Value="14">Opening Trades From PS03 File</asp:ListItem>	
											                                            <asp:ListItem Value="15">CSE's CSV File</asp:ListItem>	
											                                            <asp:ListItem Value="16">RTS CSV File</asp:ListItem>	
                                                                                        <asp:ListItem Value="17">MOSL csv</asp:ListItem>
                                                                                        <asp:ListItem Value="18">SharePro TXT File</asp:ListItem>
                                                                                        <asp:ListItem Value="19">Flash CSV File</asp:ListItem>
                                                                                        <asp:ListItem Value="20">BoltPlus TXT File</asp:ListItem>
                                                                                        <asp:ListItem Value="21">FitOffice Txt</asp:ListItem>
                                                                                        <asp:ListItem Value="22">ATIN/AOne/MultiTrade CSV File</asp:ListItem>
                                                                                        <asp:ListItem Value="23">J-Trader CSV File</asp:ListItem>
                                                                                        <asp:ListItem Value="24">UTrader/QTrader CSV File</asp:ListItem>
                                                                                        <asp:ListItem Value="25">BLITZ CSV File</asp:ListItem>
                                                                                        <asp:ListItem Value="26">ShareIndia CSV File</asp:ListItem>
                                                                                        <asp:ListItem Value="27">MoneyMaker txt File</asp:ListItem>
                                                                                        <asp:ListItem Value="28">FinSpot txt File</asp:ListItem>
                                                                                        <asp:ListItem Value="29">XTS CSV File</asp:ListItem>
                                                                                        <asp:ListItem Value="30">Next Trade Files</asp:ListItem>
                                                                                        <asp:ListItem Value="31">Symphony TXT Files</asp:ListItem>
                                                                                        <asp:ListItem Value="32">WinTrade TXT Files</asp:ListItem>
                                                                                    </asp:DropDownList><br />
                                                                                    <asp:Label ID="lblMessage" runat="server" Width="270px"></asp:Label>
                                                                                </ContentTemplate>
                                                                            </asp:UpdatePanel>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:FileUpload ID="OFDSelectFile" runat="server" Width="272px" />
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
    <td style="display:none;">
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
