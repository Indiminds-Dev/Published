<%@ page language="C#" autoeventwireup="true" inherits="management_customfiles, App_Web_zsukfi_p" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>CUSTOM FILES</title>
     <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

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
	
	
	</style>
	  <script language="javascript" type="text/javascript">
	 function Page_Load()///Call Into Page Load
            { 
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
       function FunClient(objID,objListFun,objEvent)
       {
        ajax_showOptions(objID,objListFun,objEvent,"Clients");
       }
        FieldName='cmbfiletype';
        </script>
     
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
    <div>
     <table class="TableMain100">
                <tr>
                    <td class="EHEADER" colspan="0" style="text-align: center; height: 22px;">
                        <strong><span id="SpanHeader" style="color: #000099">Custom Files</span></strong>
                    </td>
                  
                </tr>
            </table>
        <table class="TableMain100">
            <tr valign="top">
                <td style="width: 100px;">
                    Date Range :</td>
                <td style="width: 50px;">
                    <dxe:ASPxDateEdit ID="dtfrom" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                        Font-Size="10px" ClientInstanceName="dtfrom" Width="100px">
                        <DropDownButton Text="From">
                        </DropDownButton>
                    </dxe:ASPxDateEdit>
                </td>
                <td>
                    <dxe:ASPxDateEdit ID="dtto" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                        Font-Size="10px" ClientInstanceName="dtto" Width="100px">
                        <DropDownButton Text="To">
                        </DropDownButton>
                    </dxe:ASPxDateEdit>
                </td>
            </tr>
        </table>
        <table class="TableMain100">
            <tr valign="top">
                <td style="width: 100px;">
                    Clients :</td>
                <td>
                    <asp:TextBox ID="txtClient" runat="server" Width="200px" Font-Size="10px" onkeyup="FunClient(this,'ShowClientFORMarginStocks',event)"></asp:TextBox></td>
                <td style="display: none;">
                    <asp:TextBox ID="txtClient_hidden" runat="server" Width="5px"></asp:TextBox></td>
            </tr>
            <tr valign="top">
                <td style="width: 100px;">
                    File Type :</td>
                <td>
                    <asp:DropDownList ID="cmbfiletype" runat="server" Font-Size="11px" Width="200px">
                        <asp:ListItem Value="0">Trades</asp:ListItem>
                    </asp:DropDownList></td>
                <td>
                </td>
            </tr>
             <tr valign="top">
                <td colspan="3">
                     <asp:Button ID="btnshow" runat="server" CssClass="btnUpdate" Height="20px" Text="Generate" Width="100px" OnClick="btnshow_Click" /></td>
                
            </tr>
        </table>
        
      
    </div>
    </form>
</body>
</html>