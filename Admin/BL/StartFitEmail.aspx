<%@ page language="C#" autoeventwireup="true" inherits="Admin_BL_StartFitEmail, App_Web_ozbr_p-f" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Fit Email Service</title>
    <link href="../../css/style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    .bodyStyle {
  margin: auto;
  width: 50%;
  border: 1px solid;
  padding: 10px;
}
    </style>
    <script type="text/javascript">
    function height()
    {        
       if(document.body.scrollHeight>=350)
        window.frameElement.height = document.body.scrollHeight;
       else
        window.frameElement.height = '350px';
        window.frameElement.Width = document.body.scrollWidth;
    }    
    </script>
</head>
<body class="bodyStyle" style="background-color: #DDECFE">
    <form id="form1" runat="server">
        <div class="TableMain100">
                <div class="EHEADER" style="text-align: center;">
                    <strong><span style="color: #000099">Manage Email Service</span></strong>
                </div>
        </div>
        <table style="width:60%">
            <tr>
                <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                    Computer Name:</td>
                <td class="lt">
                    <asp:TextBox ID="txtCmpName" runat="server" TabIndex="0" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCmpName"
                        ErrorMessage="Computer Name Required!!!"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="background-color: #B7CEEC; vertical-align: top; height: 11px; text-align: left;">
                    Window UserId:
                </td>
                <td class="lt">
                    <asp:TextBox ID="txtUser" runat="server" TabIndex="0" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUser"
                        ErrorMessage="Window User Id Required!!!"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="background-color: #B7CEEC; vertical-align: top; height: 11px; text-align: left;">
                    Window Pwd:
                </td>
                <td class="lt" style="width: 75%;">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"
                        TabIndex="0" Width="201px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Window Pwd Required!!!" ControlToValidate="txtPassword"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnStart" runat="server" Text="Start Email Service" CssClass="btn"
                        OnClick="btnStart_Click" Width="155px" />
                </td>
                <td class="lt" style="width: 75%;">
                    <asp:Button ID="btnStop" runat="server" Text="Stop Email Service" CssClass="btn"
                        OnClick="btnStop_Click" Width="155px" />
                </td>
            </tr>
        </table>
        <br />
        
        
    </form>
</body>
</html>
