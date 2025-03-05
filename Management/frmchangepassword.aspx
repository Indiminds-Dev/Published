<%@ page language="C#" autoeventwireup="true" inherits="management_frmchangepassword, App_Web_psdiigfa" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">
    function BtnCancel_Click()
    {
        var old=document.getElementById("TxtOldPassword");  
        var newP=document.getElementById("TxtNewPassword");  
        var confirmP=document.getElementById("TxtConfirmPassword");  
        old.value="";
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
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100" align="center">
                <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Change Pasword</span></strong>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <br />
                        <asp:Panel ID="panel1" BorderColor="white" BorderWidth="1px" runat="server" Width="400px">
                            <table>
                                <%--<tr>
                <td colspan="2" class="">
                    <span style="font-size: 10pt; color: blue"><strong>
                    Change Password </strong></span>
                </td>
            </tr>--%>
                                <tr>
                                    <td class="Ecoheadtxt">
                                        Old Password :
                                    </td>
                                    <td style="text-align: left">
                                        <asp:TextBox ID="TxtOldPassword" runat="server" CssClass="EcoheadCon" TextMode="Password"
                                            Width="160px"></asp:TextBox>
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
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtOldPassword"
                                            Display="None" ErrorMessage="Old PassWord Can Not Be Blank" SetFocusOnError="True"
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
