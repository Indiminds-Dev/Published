<%@ page language="C#" autoeventwireup="true" inherits="management_frm_attendance_Lock, App_Web_sjbhlkdr" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
     <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
    <script type="text/javascript" language="javascript">
        function pagecall(obj)
        {
            if(obj=='A')
            {   
                IfreameAtt.location='frm_attendance_Lock_iframe.aspx';
            }
            else    
            {
                IfreameAtt.location='frm_attendance_PD_calculation.aspx';
            }
        }
    

        function SignOff()
        {
            window.parent.SignOff()
        }
        function height()
        {
            if(document.body.scrollHeight>500)
                window.frameElement.height = document.body.scrollHeight;
            else
                window.frameElement.height='500px';
            window.frameElement.widht = document.body.scrollWidht;
        }

    </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
      <table class="TableMain100">
        <tr>
            <td class="EHEADER" style="text-align:center;">
                <asp:Label ID="lblHead" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <iframe id="IfreameAtt" name="IfreameAtt" scrolling="no" src="" frameborder="0" width="100%">
                </iframe>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
