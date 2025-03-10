<%@ page language="C#" autoeventwireup="true" inherits="management_nsdl_demat_transaction, App_Web_co654op-" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server" >
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>

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
    
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()" >
    <script language="javascript" type="text/javascript">
                var FieldName='a';
                 function PageLoad()
                {                    
                    dtexec1.SetDate(new Date()); 
                } 
                function CallAjaxclient(obj1,obj2,obj3)
                {              
                  ajax_showOptions(obj1,obj2,obj3,'NSDL','Main');
                }
                function CallAjaxisin(obj1,obj2,obj3)
                {                                   
                    ajax_showOptions(obj1,obj2,'NSDL' ,'Main');
                }
                function height()
                {
                    if(document.body.scrollHeight>=600)
                        window.frameElement.height = document.body.scrollHeight;
                    else
                        window.frameElement.height = '600px';
                    window.frameElement.Width = document.body.scrollWidth;
                }   
                 function SignOff()
                {
                    window.parent.SignOff();
                }
                   function pageclose()
            {

                parent.editwin.close();

            }
    </script>
    <form id="form1" runat="server" autocomplete="Off" >
    <div>
    <asp:scriptmanager ID="Scriptmanager1" runat="server"></asp:scriptmanager>
        <table>
            <tr>
                <td style="height: 24px">
                    Transaction Date:</td>
                <td colspan="5" style="height: 24px">
                    <dxe:ASPxDateEdit id="dtexec" runat="server" ClientInstanceName="dtexec1" DateOnError="Today"
                        EditFormat="Custom" EditFormatString="dd-MM-yyyy" tabIndex="1" UseMaskBehavior="True"
                        Width="150px">
                    </dxe:ASPxDateEdit></td>
                <td style="height: 24px">
                </td>
                <td align="left" rowspan="1">
                </td>
            </tr>
            <tr>
                <td style="height: 24px">
                    Client ID :
                </td>
                <td colspan="5" style="height: 24px">
                    <asp:TextBox ID="txtClient" runat="server" Width="497px"></asp:TextBox></td>
                <td style="height: 24px">
                    </td>
                <td align="left" rowspan="4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    ISIN:</td>
                <td colspan="5">
                    <asp:TextBox ID="txtisin" runat="server" Width="497px"></asp:TextBox></td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    Quantity :
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtquantity" runat="server" Width="120px"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtisin"
                        Display="None" ErrorMessage="ISIN required" ValidationGroup="a"></asp:RequiredFieldValidator></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtcer"
                        Display="None" ErrorMessage="Certificates required" ValidationGroup="a"></asp:RequiredFieldValidator></td>
                <td>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    No. of Certificates:</td>
                <td colspan="2">
                    <asp:TextBox ID="txtcer" runat="server" Width="120px"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtquantity"
                        Display="None" ErrorMessage="Quantity required" ValidationGroup="a"></asp:RequiredFieldValidator></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtslip"
                        Display="None" ErrorMessage="Demat request form no.  required" ValidationGroup="a"></asp:RequiredFieldValidator></td>
                <td>
                    </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Demat Request Form No.:</td>
                <td colspan="2">
                    <asp:TextBox ID="txtslip" runat="server" Width="120px"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtClient"
                        Display="None" ErrorMessage="Client Id required" ValidationGroup="a"></asp:RequiredFieldValidator></td>
                <td>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtquantity"
                        Display="None" ErrorMessage="Not valid Quantity" MaximumValue="999999" MinimumValue="1"
                        ValidationGroup="a"></asp:RangeValidator></td>
                <td>
                </td>
                <td>
                </td>
                <td align="left" rowspan="1">
                </td>
            </tr>
            <tr>
                <td colspan="8" rowspan="2">
                    <asp:Button ID="btnsave" runat="server" TabIndex="7"
                        Text="Save" OnClick="btnsave_Click" ValidationGroup="a" /></td>
            </tr>
            <tr>
            </tr>
            <tr>
                <td colspan="8" rowspan="1">
                    <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtcer"
                        Display="None" ErrorMessage="Not valid Certificates" MaximumValue="999999" MinimumValue="1"
                        ValidationGroup="a"></asp:RangeValidator></td>
            </tr>
            <tr>
                <td colspan="8" rowspan="1">
                    &nbsp;<asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="txtslip"
                        Display="None" ErrorMessage="Not valid Form no." MaximumValue="999999" MinimumValue="1"
                        ValidationGroup="a"></asp:RangeValidator></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 17px">
                    </td>
                <td style="width: 100px; height: 17px">
                    </td>
                <td style="width: 100px; height: 17px">
                </td>
                <td style="width: 100px; height: 17px">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List"
                        ShowMessageBox="True" ShowSummary="False" ValidationGroup="a" />
                </td>
                <td style="width: 100px; height: 17px">
                </td>
                <td style="width: 100px; height: 17px">
                </td>
                <td style="width: 100px; height: 17px">
                </td>
                <td style="width: 100px; height: 17px">
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
