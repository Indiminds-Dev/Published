<%@ page language="C#" autoeventwireup="true" inherits="management_Exch_Product_Details, App_Web_0payuukt" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Product Details</title>
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
	    FieldName='lstSlection';
       function fnClientcallajax(objID,objListFun,objEvent,ObjCriteria)
         {
             ajax_showOptions(objID,'ShowClientFORMarginStocks',objEvent,'Clients','Y');
         } 
    </script>
    
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
       
        <table  id="tblShowDt" runat="server" width="100%">
            <tr>
               <td class="EHEADER"  style="text-align: center;">
                <strong><span style="color: #000099">Trade Import Details</span></strong></td>
            </tr>
         
            </table>
        <table width="100%">
            <tr>
                <td>
                    <div>
                        <dxtc:ASPxPageControl runat="server" ID="pageControl" Width="100%" EnableCallBacks="true"
                            ActiveTabIndex="1">
                            <tabpages>
<dxtc:TabPage Text="Terminal ID"><ContentCollection>
<dxw:ContentControl runat="server"><TABLE><TBODY>
<tr>
<td>
    <asp:Label ID="lblMSG" runat="server" Text="Select Terminal Ids to be Removed" Font-Bold="True" ForeColor="#0000C0"></asp:Label>
</td>
</tr>
<TR><TD><asp:CheckBoxList runat="server" RepeatColumns="10" ID="chkTerminalID" designer:wfdid="w9"></asp:CheckBoxList>
 </TD></TR><TR><TD><asp:Button runat="server" ID="btnTerminalIDRemove" CssClass="btn" Text="Remove" OnClick="btnTerminalIDRemove_Click"></asp:Button>
 </TD></TR></TBODY></TABLE></dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Text="Customer Ucc"><ContentCollection>
<dxw:ContentControl runat="server"><TABLE><TBODY>
<tr>
<td>
    <asp:Label ID="lblMSG1" runat="server" Text="Select Ucc to be Removed/Changed" Font-Bold="True" ForeColor="#0000C0"></asp:Label>
</td>
</tr>

<TR><TD><asp:CheckBoxList runat="server" RepeatDirection="Horizontal" RepeatColumns="15" Font-Size="X-Small" Font-Names="Arial Narrow" ID="chkUcc"></asp:CheckBoxList>
 </TD></TR><TR><TD runat="server" ID="td_CustTxt" class="lt"><TABLE><TBODY><TR><TD>Select One Client </TD><TD><asp:TextBox runat="server" Width="200px" Font-Size="11px" ID="txtClient" onkeyup="fnClientcallajax(this,'chkfn',event,'Clients')"></asp:TextBox>
 </TD><TD><TABLE><TBODY><TR><TD style="DISPLAY: none"><asp:HiddenField runat="server" ID="hdnDate"></asp:HiddenField>
 <asp:TextBox runat="server" Width="5px" ID="txtClient_hidden"></asp:TextBox>
 </TD></TR></TBODY></TABLE></TD><TD style="HEIGHT: 22px"><asp:Button runat="server" ID="btnCust" CssClass="btn" Text="Update" OnClick="btnCust_Click"></asp:Button>
 </TD></TR></TBODY></TABLE></TD>
</TR><TR><TD style="height: 21px"><asp:Button runat="server" ID="btnUccRemove" CssClass="btn" Text="Remove" OnClick="btnUccRemove_Click"></asp:Button>
 <asp:Button runat="server" ID="btnChangeClient" Width="129px" CssClass="btn" Text="Change Client" OnClick="btnChangeClient_Click"></asp:Button>
 </TD></TR></TBODY>
 
 <tr>
 <td>
  <asp:GridView ID="gridCheque" runat="server" Width="100%" ShowFooter="True" AllowSorting="True" OnPageIndexChanging="gridCheque_PageIndexChanging"
                                                        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333"
                                                        DataMember="ExchangeTrades_CustomerUcc" GridLines="None" Font-Size="Smaller" AllowPaging="True">
                                                        <FooterStyle BackColor="#507CD1" ForeColor="Black" Font-Bold="True"></FooterStyle>
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Ucc">
                                                                <ItemStyle Font-Size="Small" BorderWidth="2px" HorizontalAlign="Center"></ItemStyle>
                                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="True" Font-Size="Small" ForeColor="Black">
                                                                </HeaderStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCustomerUcc" runat="server" Text='<%# Eval("ExchangeTrades_CustomerUcc")%>'></asp:Label>
                                                                </ItemTemplate>
                                                                <ControlStyle Font-Size="Small" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Client Name">
                                                                <ItemStyle Font-Size="Small" BorderWidth="2px" HorizontalAlign="Center"></ItemStyle>
                                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="True" Font-Size="Small"
                                                                    ForeColor="Black"></HeaderStyle>
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblClientName" runat="server" Text='<%# Eval("ClientName") %>'
                                                                        Width="224px"></asp:Label>
                                                                </ItemTemplate>
                                                                <ControlStyle Font-Size="Small" />
                                                            </asp:TemplateField>
                                                        
                                                        </Columns>
                                                        <RowStyle BackColor="#EFF3FB" BorderColor="#BFD3EE" BorderStyle="Double" BorderWidth="2px">
                                                        </RowStyle>
                                                        <EditRowStyle BackColor="#2461BF"></EditRowStyle>
                                                        <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" Font-Bold="True"></SelectedRowStyle>
                                                        <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#2461BF"></PagerStyle>
                                                        <HeaderStyle ForeColor="White" BorderWidth="2px" CssClass="EHEADER" BorderColor="AliceBlue"
                                                            Font-Bold="True" BackColor="#507CD1"></HeaderStyle>
                                                        <AlternatingRowStyle BackColor="White" />
                                                    </asp:GridView>
 </td>
 </tr></TABLE></dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
</tabpages>
                        </dxtc:ASPxPageControl>
                    </div>
                </td>
            </tr>
        </table>
       
        </form>
</body>
</html>
