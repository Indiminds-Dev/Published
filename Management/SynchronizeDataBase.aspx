<%@ page language="C#" autoeventwireup="true" inherits="management_SynchronizeDataBase, App_Web_sjbhlkdr" title="Untitled Page" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
            window.frameElement.height = '200px';
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
                        <strong><span style="color: #000099">Synchronize Database</span></strong>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <br />
                        <asp:Panel ID="panel1" BorderColor="white" BorderWidth="1px" runat="server" Width="400px">
                            <table class="TableMain100">
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        <asp:Button ID="Button5" runat="server" OnClick="Read_IncrementalXML" Text="Synchronize Database" /></td>
                                    <td>
                                        &nbsp;</td>
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
