<%@ page language="C#" autoeventwireup="true" inherits="management_acetrades_iframe, App_Web_e158i_8t" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ACE Trade</title>
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
        if(document.body.scrollHeight>=300)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '500px';
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
 </script>
<script type="text/javascript" src="../JSFUNCTION/init.js"></script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="Panelmain" runat="server" HorizontalAlign="Center" Style="z-index: 100;
            left: 290px; position: absolute; top: 18px" Visible="true">
            <table id="tbl_main" cellpadding="0" cellspacing="0" class="login"
                width="410">
                <tbody>
                 <tr>
                    <td class="lt1">
                        <h5>
                            Imports aceTrades
                        </h5>
                    </td>
                </tr>
                
                    <tr>
                        <td class="lt">
                            <table cellpadding="0" cellspacing="12" class="width100per">
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
                                            <tr>
                                            <td class="lt" colspan="2">
                                                <div id="divProd" runat="server"></div>
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
                                    <td style="width: 283px">
                                          <asp:Button ID="btnRemove" runat="server" CssClass="btn" Text="Remove" OnClick="btnRemove_Click"/>
                                         </td>
                                    </tr>
                                            <tr>
                                            <td class="lt" colspan="6">
                                                <table>
                                                <tr>
                                                 <td colspan="2">
                                                    <div id="divterminalID" runat="server">
                                                    </div>
                                                 </td>
                                                </tr>
                                                <tr>
                                                <td  id="tdyes">
                                                    <asp:Button ID="btnYes" runat="server" CssClass="btn" OnClick="btnYes_Click" Text="Yes" Width="84px" />
                                                </td>
                                                <td id="tdno">
                                                    <asp:Button ID="btnNo" runat="server" CssClass="btn" OnClick="btnNo_Click" Text="No" Width="84px" />
                                                </td>
                                                </tr>
                                                </table>
                                            </td>
                                            </tr>
                                            <tr>
                                            <td id="tdmessage">
                                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                                        </td>
                                        </tr>
                                    <tr>
                                        
                                        <td>
                                            <select id="cmbTrade" runat="server" onchange="selectfile();">
                                                <option>Select</option>
                                                <option>FINAL CSV</option>
                                                
                                            </select>
                                        </td>
                                        
                                    </tr>
                               
                                    <tr>
                                       
                                        <td>
                                            <asp:FileUpload ID="aceTradeSelectFile" runat="server" Height="21px" Width="272px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table cellpadding="0" cellspacing="0">
                                               
                                                    <tr>
                                                        <td>
                                                            <asp:Button ID="BtnSave" runat="server" CssClass="btn" OnClick="BtnSave_Click" Text="Import File"
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
