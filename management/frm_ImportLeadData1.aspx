<%@ page language="C#" autoeventwireup="true" inherits="management_frm_ImportLeadData1, App_Web_6_wayyot" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
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
   </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
   <table class="TableMain100">
    <tr>
        <td class="Ecoheadtxt" style="width: 31%; height: 23px">
            Select File :
        </td>
        <td style="width: 243px; height: 23px; text-align: left">
            <asp:FileUpload ID="FileUpload" runat="server" />
        </td>
        <td style="height: 23px; text-align: left">
            <asp:Button ID="BtnSave" runat="server" Text="Import File" CssClass="btnUpdate" OnClick="BtnSave_Click" />
        </td>
    </tr>
</table>
    </form>
</body>
</html>
