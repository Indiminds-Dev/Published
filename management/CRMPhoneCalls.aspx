<%@ page language="C#" autoeventwireup="true" inherits="management_CRMPhoneCalls, App_Web_itibbj7j" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
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
           
           if(document.body.scrollHeight>=550)
                {
                    window.frameElement.height = document.body.scrollHeight;
                }
           else
                {
                    window.frameElement.height = '550px';
                }
                window.frameElement.widht = document.body.scrollWidht;
           
        }
    
     function CallEmail(val)
    {
   
       var frm = "frmSendMailForPhoneCall.aspx?id="+val;
       editwin=dhtmlmodal.open("Editbox", "iframe", frm, "Send Email", "width=950px,height=500px,center=1,resize=1,scrolling=2,top=500", "recal");
       editwin.onclose=function()
       {
    
         document.getElementById("f1").contentWindow.iframesource();
       }
       
        
    }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
     <table class="TableMain100">
        <tr>
            <td style="width: 100%">
                <iframe id="f1" src="CRMPhoneCallWithFrame.aspx" style="width: 100%;" frameborder="0"
                    scrolling="no"></iframe>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
