<%@ page language="C#" autoeventwireup="true" inherits="management_frm_transInsAddStatus, App_Web_fbvamflg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
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
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    
    <script type="text/javascript" language="javascript">
    function ValidatePage()
    {
      return false;
    }    
     function InsurerCompany(obj1,obj2,obj3,obj4)
    {
         ajax_showOptions(obj1,obj2,obj3,obj4,'Main');
    }
    
    FieldName='btnCancel';
    </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div align="center">
            <table cellpadding="2" cellspacing="2" width="500px">
                <tr>
                    <td  class="gridcellleft"> <span style="color: red">*</span>
                    </td>
                    <td  class="gridcellleft"> <strong><span style="color: #000099">
                        Select Company:</span></strong>
                    </td>
                    <td  class="gridcellleft">
                        <asp:TextBox ID="txtInsurerCompany" runat="server" Width="235px" CssClass="EcoheadCon"
                            TabIndex="5"></asp:TextBox>
                              <asp:HiddenField ID="txtInsurerCompany_hidden" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td  class="gridcellleft"> <span style="color: red">*</span>
                    </td>
                    <td  class="gridcellleft"> <strong><span style="color: #000099">
                        Status:</span></strong>
                    </td>
                    <td  class="gridcellleft">
                        <asp:TextBox ID="TxtStatus" runat="server" Width="235px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td  class="gridcellleft"> <span style="color: red">*</span>
                    </td>
                    <td  class="gridcellleft"> <strong><span style="color: #000099">
                        Status Type:</span></strong>
                    </td>
                    <td  class="gridcellleft">
                        <asp:DropDownList ID="drpPolicyStatus" runat="server" Width="237px" CssClass="EcoheadCon"
                            TabIndex="30" onchange="javascript:PolicyChange(this.value);">
                            <asp:ListItem Value="0">Business in Hand</asp:ListItem>
                            <asp:ListItem Value="1">Cancelled</asp:ListItem>
                            <asp:ListItem Value="2">Canclled from inception</asp:ListItem>
                            <asp:ListItem Value="3">Cheque Bounced</asp:ListItem>
                            <asp:ListItem Value="4">Issued</asp:ListItem>
                            <asp:ListItem Value="5">Lapsed</asp:ListItem>
                            <asp:ListItem Value="6">Login</asp:ListItem>
                            <asp:ListItem Value="7">In Process</asp:ListItem>
                            <asp:ListItem Value="8">Free Look</asp:ListItem>
                            <asp:ListItem Value="9">Withdrawn</asp:ListItem>
                            <asp:ListItem Value="10">Under Writing</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td  class="gridcellleft">
                    </td>
                    <td  class="gridcellleft"> <strong><span style="color: #000099">
                        Description:</span></strong>
                    </td>
                    <td  class="gridcellleft">
                        <asp:TextBox ID="TxtDesc" runat="server" Width="235px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                    </td>
                    <td class="gridcellleft">
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btnUpdate" OnClick="btnSave_Click" OnClientClick="ValidatePage();"/>
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btnUpdate" OnClick="btnCancel_Click"/>
                    </td>
                </tr>
            </table>
        </div>
        </form>
</body>
</html>

