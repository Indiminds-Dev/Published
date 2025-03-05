<%@ page language="C#" autoeventwireup="true" inherits="management_HeaderFooterDetails, App_Web_8qixh_8w" validaterequest="false" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>HeaderFooter Details</title>
       <script language="javascript" type="text/javascript">
    function SignOff()
    {
        window.parent.SignOff();
    }
    </script>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
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
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div>
    <table class="TableMain100" >
    <tr>
        <td class="gridcellleft" style="width: 100px">
                <span style="color: #000099">Header/Footer<span style="color: #000000"> :</span></span>
        </td>
        <td class="gridcellleft" style="width: 791px">
             <asp:DropDownList ID="ddlHeaderFooter" runat="server" Width="190px">
                 <asp:ListItem Value="H">Header</asp:ListItem>
                 <asp:ListItem Value="F">Footer</asp:ListItem>
             </asp:DropDownList>       
         </td>
    </tr>
    <tr>
        <td class="gridcellleft" style="width: 100px">
                <span style="color: #000099">Heading<span style="color: #000000"> :</span></span>
        </td>
        <td class="gridcellleft" style="width: 791px">
                <asp:TextBox ID="txtHeading" runat="server" Width="757px"></asp:TextBox>
         </td>
    </tr>
    <tr>
        <td class="gridcellleft" style="width: 100px; height: 410px;">
                <span style="color: #000099">Content<span style="color: #000000"> :</span></span>
        </td>
        <td class="gridcellleft" style="height: 410px; width: 791px;">
               <%-- <asp:TextBox ID="txtContent" runat="server" Width="756px" Height="400px" TextMode="MultiLine"></asp:TextBox>--%>
                <div>
                                        <asp:PlaceHolder ID="FreeTextBoxPlaceHolder" runat="server" />
                                    </div>
         </td>
    </tr>
    
        <tr>
            <td class="gridcellcenter" style="height: 34px">
                <%--<input id="btnSave" type="button" value="Save" class="btnUpdate" onclick="btnSave_Click()"
                    style="width: 60px" tabindex="33" />
                <input id="btnCancel" type="button" value="Cancel" class="btnUpdate" onclick="btnCancel_Click()"
                    style="width: 60px" tabindex="34" />--%>
            </td>
            <td  style="height: 34px; text-align: right; width: 791px;">
                    <dxe:ASPxButton ID="btnSave" runat="server" AutoPostBack="False" Text="Save" CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css"
                                    CssPostfix="Office2003_Blue" Height="3px" Width="54px" OnClick="btnSave_Click">
                                </dxe:ASPxButton>
                <asp:HiddenField ID="hdnID" runat="server" />
            </td>
        </tr>
    
    </table>
    </div>
    </form>
</body>
</html>
