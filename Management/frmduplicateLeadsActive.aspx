<%@ page language="C#" autoeventwireup="true" inherits="management_frmduplicateLeadsActive, App_Web_njtlujlb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Assembly="CrystalDecisions.Web, Version=10.2.3600.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
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
<body  style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div>
    <table  class="TableMain100">
        <tr>
            <td class="EHEADER"  style="text-align:center;">
                <strong><span style="color: #000099">Duplicate Lead Report</span></strong>
            </td>
        </tr>
        <tr>
            <td align="center">
                <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true"   DisplayGroupTree="False" />
                
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
