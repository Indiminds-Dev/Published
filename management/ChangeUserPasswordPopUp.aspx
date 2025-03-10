<%@ page language="C#" autoeventwireup="true" inherits="management_ChangeUserPasswordPopUp, App_Web_-k9nslwd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>
    
    <style type="text/css">
	
	/* Big box with list of options */
	#ajax_listOfOptions{
		position:absolute;	    /* Never change this one */
		width:50px;	        /* Width of box */
		height:auto;	        /* Height of box */
		overflow:auto;	        /* Scrolling features */
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
		z-index:900;
	}
	#ajax_listOfOptions_iframe{
		background-color:#F00;
		position:absolute;
		z-index:10;
	}
	
	form{
		display:inline;
	}
	 
	</style>

    <script language="javascript" type="text/javascript">    
    
    FieldName='test';
    
    function CallList(obj1,obj2,obj3)
    {
        var obj5='';
        if(obj5 != '18')
        {
            ajax_showOptions(obj1,obj2,obj3,obj5);
        }
    }
    
    function BtnCancel_Click()
    {
        var newP=document.getElementById("TxtNewPassword");  
        var confirmP=document.getElementById("TxtConfirmPassword");  
        newP.value="";
        confirmP.value="";
    }
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
     function Close()
    {
        parent.editwin.close();
    }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Change User Password</span></strong>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <br />
                        <asp:Panel ID="panel1" BorderColor="white" BorderWidth="1px" runat="server" Width="300px">
                            <table>
                                <tr>
                                    <td class="Ecoheadtxt">
                                        Login User :
                                    </td>
                                    <td style="text-align: left">
                                       <asp:TextBox ID="txtLoginUser" runat="server" CssClass="EcoheadCon" Width="160px"></asp:TextBox>
                                        <asp:HiddenField ID="txtLoginUser_hidden" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Ecoheadtxt">
                                        New Password :
                                    </td>
                                    <td style="text-align: left">
                                        <asp:TextBox ID="TxtNewPassword" runat="server" CssClass="EcoheadCon" TextMode="Password"
                                            Width="160px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Ecoheadtxt">
                                        Confirm Password :
                                    </td>
                                    <td style="text-align: left">
                                        <asp:TextBox ID="TxtConfirmPassword" runat="server" CssClass="EcoheadCon" TextMode="Password"
                                            Width="160px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Button ID="BtnSave" runat="server" Text="Update" CssClass="btnUpdate" OnClick="BtnSave_Click"
                                            ValidationGroup="a" />
                                        <input id="BtnCancel" type="button" value="Cancel" class="btnUpdate" onclick="BtnCancel_Click()" /></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLoginUser"
                                            Display="None" ErrorMessage="Login User Can Not Be Blank" SetFocusOnError="True"
                                            ValidationGroup="a"></asp:RequiredFieldValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtNewPassword"
                                            Display="None" ErrorMessage="New PassWord Can Not Be Blank" SetFocusOnError="True"
                                            ValidationGroup="a"></asp:RequiredFieldValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtConfirmPassword"
                                            Display="None" ErrorMessage="Confirm PassWord Can Not Be Blank" SetFocusOnError="True"
                                            ValidationGroup="a"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TxtNewPassword"
                                            ControlToValidate="TxtConfirmPassword" Display="None" ErrorMessage="New Password And Confirm Password Must Be Same"
                                            SetFocusOnError="True" ValidationGroup="a"></asp:CompareValidator>
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                                            ShowSummary="False" ValidationGroup="a" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <br />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
