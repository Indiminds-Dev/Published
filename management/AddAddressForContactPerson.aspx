<%@ page language="C#" autoeventwireup="true" inherits="management_AddAddressForContactPerson, App_Web_fbvamflg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Address</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
	<script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>
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
        function Page_Load()
        {
            document.getElementById('trState').style.display='inline';
            document.getElementById('trCity').style.display='inline';
            document.getElementById('trArea').style.display='inline';
        }
        function CallAjaxForCountry(objid,objfuncname,objevent)
        {
            ajax_showOptions(objid,objfuncname,objevent);
            document.getElementById('trState').style.display='inline';
        }
        function CallAjaxForState(objid,objfuncname,objevent)
        {
            var stateid=document.getElementById('txtCountry_hidden').value;
            ajax_showOptions(objid,objfuncname,objevent,stateid);
            document.getElementById('trCity').style.display='inline';
        }
        function CallAjaxForCity(objid,objfuncname,objevent)
        {
            var cityid=document.getElementById('txtState_hidden').value;
            ajax_showOptions(objid,objfuncname,objevent,cityid);
            document.getElementById('trArea').style.display='inline';
        }
        function CallAjaxForArea(objid,objfuncname,objevent)
        {
            var areaid=document.getElementById('txtCity_hidden').value;
            ajax_showOptions(objid,objfuncname,objevent,areaid);
        }
        function btnCalcel_Click()
        {
            window.close();
        }
        FieldName='btnCancel';
    </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server">
    <div>
        <table class="TableMain100">
            <tr>
                <td class="EcoheadCon_" style="width: 88px">
                    Address Type :
                </td>
                <td>
                    <asp:DropDownList ID="ddlAddressType" runat="server" Width="204px" Font-Size="10px">
                        <asp:ListItem>Residence</asp:ListItem>
                        <asp:ListItem>Office</asp:ListItem>
                        <asp:ListItem>Correspondence</asp:ListItem>
                        <asp:ListItem>Registered</asp:ListItem>
                        <asp:ListItem>Permanent</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="EcoheadCon_" style="width: 88px">
                    Address1 :
                </td>
                <td>
                    <asp:TextBox ID="txtAddress1" Font-Size="10px" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="EcoheadCon_" style="width: 88px">
                    Address2 :
                </td>
                <td>
                    <asp:TextBox ID="txtAddress2" Font-Size="10px" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="EcoheadCon_" style="width: 88px">
                    Address3 :
                </td>
                <td>
                    <asp:TextBox ID="txtAddress3" Font-Size="10px" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="EcoheadCon_" style="width: 88px">
                    LandMark :
                </td>
                <td>
                    <asp:TextBox ID="txtLandmark" Font-Size="10px" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="EcoheadCon_" style="width: 88px">
                    Country :
                </td>
                <td>
                    <asp:TextBox ID="txtCountry" Font-Size="10px" runat="server" onkeyup="CallAjaxForCountry(this,'Country',event)" Width="200px"></asp:TextBox>
                    <asp:HiddenField ID="txtCountry_hidden" runat="server" />
                </td>
            </tr>
            <tr id="trState">
                <td class="EcoheadCon_" style="width: 88px">
                    State :
                </td>
                <td style="height: 21px">
                    <asp:TextBox ID="txtState" Font-Size="10px" runat="server" onkeyup="CallAjaxForState(this,'State',event)" Width="200px"></asp:TextBox>
                    <asp:HiddenField ID="txtState_hidden" runat="server" />
                </td>
            </tr>
            <tr id="trCity">
                <td class="EcoheadCon_" style="width: 88px">
                    City :
                </td>
                <td>
                    <asp:TextBox ID="txtCity" Font-Size="10px" runat="server" onkeyup="CallAjaxForCity(this,'City',event)" Width="200px"></asp:TextBox>
                    <asp:HiddenField ID="txtCity_hidden" runat="server" />
                </td>
            </tr>
            <tr id="trArea">
                <td class="EcoheadCon_" style="width: 88px">
                    Area :
                </td>
                <td>
                    <asp:TextBox ID="txtArea" Font-Size="10px" runat="server" onkeyup="CallAjaxForArea(this,'Area',event)" Width="200px"></asp:TextBox>
                    <asp:HiddenField ID="txtArea_hidden" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="EcoheadCon_" style="width: 88px">
                    PinCode :
                </td>
                <td>
                    <asp:TextBox ID="txtPincode" Font-Size="10px" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnSave" runat="server" Text="Update" CssClass="btnUpdate" Height="22px" Width="61px" OnClick="btnSave_Click"/>
                    <input id="btnCalcel" type="button" class="btnUpdate" value="Cancel" style="width: 61px; height: 22px" onclick="btnCalcel_Click()" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
