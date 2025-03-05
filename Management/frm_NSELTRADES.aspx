<%@ page language="C#" autoeventwireup="true" inherits="frm_MCXTRADES, App_Web_rtil2eyr" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
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
        if(document.body.scrollHeight>=500)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '550px';
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
            var url='TradeImportDetailsCom.aspx';
           parent.OnMoreInfoClick(url,"Trade Import Details",'800px','450px');
         }

   </script>
  
<script type="text/javascript" src="../JSFUNCTION/init.js"></script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="Panelmain" runat="server" HorizontalAlign="Center" Style="z-index: 100;
            left: 236px; position: absolute; top: 13px" Visible="true">
            <table id="tbl_main" cellpadding="0" cellspacing="0" class="login" style="height: 153px"
                width="410">
                <tbody>
                 <tr>
                    <td class="lt1" style="height: 22px">
                        <h5>
                            Imports NSEL-SPOT Trades
                        </h5>
                    </td>
                </tr>
                
                    <tr>
                        <td class="lt" style="height: 115px">
                            <table cellpadding="0" cellspacing="12" class="width100per" style="width: 100%">
                                <tbody>
                                
                                  <tr>
                                        <td colspan="2">
                                            <div id="divStatus" runat="server">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
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
                                        <td>
                                             <asp:Button ID="btnCust" runat="server" CssClass="btn" Text="Update" OnClick="btnCust_Click"/>
                                        </td>
                                        
                                        </tr>
                                        </table>
                                        </td>
                                    </tr>
                                    <tr id="tr_CustBtn">
                                    <td>
                                          <asp:Button ID="btnRemove" runat="server" CssClass="btn" Text="Remove" OnClick="btnRemove_Click"/>
                                         </td>
                                    </tr>
                            
                                    <tr>
                                        <td colspan="2">
                                            <div id="divProd" runat="server">
                                            </div>
                                        </td>
                                    </tr>
                                   
                                    <tr>
                                        <td class="lt">
                                            <table>
                                                <tr>
                                                    <td colspan="4">
                                                        <div id="divterminalID" runat="server">
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td id="tdyes">
                                                        <asp:Button ID="btnYes" runat="server" CssClass="btn" OnClick="btnYes_Click" Text="Yes"
                                                            Width="84px"/>
                                                    </td>
                                                    <td id="tdno">
                                                        <asp:Button ID="btnNo" runat="server" CssClass="btn" OnClick="btnNo_Click" Text="No"
                                                            Width="84px" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <tr>
                                        <td>
                                            <asp:DropDownList ID="cmbTrade" runat="server" AutoPostBack="True" Font-Bold="True"
                                                OnSelectedIndexChanged="cmbTrade_SelectedIndexChanged1" Width="170px">
                                                <asp:ListItem Value="0">Select </asp:ListItem>
                                                <asp:ListItem Value="1">Final CSV</asp:ListItem>
						<asp:ListItem Value="2">Odin TXT</asp:ListItem>
						<asp:ListItem Value="3">Final CSV [Only E-Series]</asp:ListItem>
						<asp:ListItem Value="4">Odin TXT [Only E-Series]</asp:ListItem>
                                            </asp:DropDownList></td>
                                            </tr>
                                    </tr>
                                     <tr>
                                        <td class="lt">
                                            <asp:Label ID="importstatus" runat="server" Font-Size="XX-Small" Font-Names="Arial"
                                                Font-Bold="True" ForeColor="Red" />
                                        </td>
                                    </tr>
                                      <tr>
                                        <td class="gridcellleft" colspan="2">
                                            <asp:Label ID="lblMessage" runat="server" Font-Bold="False"
                                                Width="243px"></asp:Label></td>
                                            
                                       </tr>
                                    <tr>
                                      
                                        <td align="right" style="width: 278px; height: 23px; text-align: left;">
                                            <asp:FileUpload ID="McxTradeSelectFile" runat="server" Height="21px" Width="272px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" colspan="2" style="height: 20px" valign="middle">
                                            <table cellpadding="0" cellspacing="0">
                                                <tbody>
                                                    <tr>
                                                        <td align="left" style="height: 19px" valign="top">
                                                            <asp:Button ID="BtnSave" runat="server" CssClass="btn" OnClick="BtnSave_Click" Text="Import File"
                                                                Width="84px" />
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
