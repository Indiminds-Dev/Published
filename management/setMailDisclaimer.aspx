<%@ page language="C#" autoeventwireup="true" inherits="management_setMailDisclaimer, App_Web_lyh0nvfl" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
      <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
   <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
   <script language="javascript" type="text/javascript">
         function SignOff()
            {
            window.parent.SignOff()
            }
        function height()
        {
           
           if(document.body.scrollHeight>=250)
                {
                    window.frameElement.height = document.body.scrollHeight;
                }
           else
                {
                    window.frameElement.height = '250px';
                }
                window.frameElement.widht = document.body.scrollWidht;
           
        }
   </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
   <table  class="TableMain100">
    <tr>
        <td class="EHEADER" colspan="2" style="text-align:center;">
            <strong><span style="color: #000099">Email Desclaimer</span></strong>
        </td>
    </tr>
    <tr>
        <td class="gridcellright" style="width: 111px">
            <span style="color: #000099">Disclaimer:</span>
        </td>
        <td class="gridcellleft">
            <asp:TextBox ID="txtDisclaimer" runat="server" Font-Size="12px" Width="90%" Height="80px" TextMode="MultiLine" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDisclaimer"
                Display="Dynamic" ErrorMessage="Enter Disclaimer."></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtDisclaimer"
                Display="Dynamic" ErrorMessage='Can not have " character!' ValidationExpression='^\w[^"]*$'></asp:RegularExpressionValidator></td>
    </tr>
    <tr>
        <td></td>
        <td class="gridcellleft">
            <asp:Button ID="btnCreate" runat="server" Text="Create" CssClass="btnUpdate" OnClick="btnCreate_Click" />
        </td>
    </tr>
</table>
    </form>
</body>
</html>
