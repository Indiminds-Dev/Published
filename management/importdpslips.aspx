<%@ page language="C#" autoeventwireup="true" inherits="importdpslips, App_Web__y0k_erv" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Import DI Slips</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

      <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>
     <style type="text/css">
       .grid_scroll 
       { 
            overflow-y: scroll;
            overflow-x: scroll;
            width:70%;
            scrollbar-base-color: #C0C0C0;
       }
    </style>
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
		z-index:100;
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
		z-index:5;
	}
	
	form{
		display:inline;
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
            window.frameElement.height = '500px';
        window.frameElement.Width = document.body.scrollWidth;
    }
 
     FieldName='BtnImport';
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" >
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panelmain" runat="server" Visible="true" HorizontalAlign="Center">
                <table id="tbl_main" class="login" cellspacing="0" cellpadding="0" runat="server"
                    width="510">
                    <tr>
                        <td class="lt1">
                            <h5>
                                Import slips
                            </h5>
                        </td>
                    </tr>
                    <tr>
                        <td class="lt1">
                            <table class="width100per" cellspacing="0" cellpadding="0" style="height: 150px">
                                <tr>
                                    <td align="left" colspan="2">
                                        <%--<b>Upload Fo Fund Files.</b>--%>
                                        <asp:Label ID="lblImportStatus" runat="server" Font-Bold="True" Font-Names="Arial"
                                            Font-Size="X-Small" ForeColor="Red"></asp:Label></td>
                                </tr>
                                <tr>
                                   <%-- <td colspan="2">
                                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                                        </asp:ScriptManager>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
                                        <ContentTemplate>
                                        <table  class="width100per" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td align="left" style="width:126px;">
                                                    Select File Type:
                                                </td>
                                                <td align="left">
                                                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                        <asp:ListItem Value="1">TMCL</asp:ListItem>
                                                        <asp:ListItem Value="2">GCL</asp:ListItem>
                                                        <asp:ListItem Value="3">TCL</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                            <td colspan="2" align="center">
                                                <asp:Label ID="LblFile" runat="server" Text=""></asp:Label>
                                            </td>
                                            </tr>
                                        </table>
                                        </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>--%>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <b>Select DIBook : </b>
                                    </td>
                                    <td align="left">
                                        <asp:FileUpload ID="DMFile" runat="server" Width="272px" Height="21px" Font-Bold="True" />   
                                    </td>
                                   
                                </tr>
                                <tr>
                                     <td align="left" style="height: 23px">
                                         <b>Select DISlip: </b> 
                                    </td>
                                    <td align="left" style="height: 23px">
                                        <asp:FileUpload ID="VERPTFile" runat="server" Width="272px" Height="21px" Font-Bold="True" />
                                    </td>
                                </tr>
                                <tr style="display: none">
                                         <td style="width: 277px; height: 44px; text-align: left;">
                                                <asp:TextBox ID="txtBank_hidden" runat="server" Width="46px"></asp:TextBox>
                                         </td>
                                </tr>
                                <tr>
                                    <td align="center" valign="middle" colspan="2" style="height: 50px;">
                                        <table cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td valign="top" align="left" style="height: 19px">
                                                    <asp:Button ID="BtnImport" runat="server" Text="Import File" CssClass="btn" Width="84px"
                                                        OnClick="BtnImport_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <asp:HiddenField ID="hdnfile" runat="server" />
                                
                            </table>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
