<%@ page language="C#" autoeventwireup="true" inherits="Reports_frmReport_CommissionReceivableReport_print, App_Web_sf8qvqgk" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Commission Receivable Report Print</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" language="javascript">
        function printSpecial()
        {
            window.print();
        }



    </script>

</head>
<body onload="clearPreloadPage();">
    <form id="printMe" runat="server">
        <table class="TableMain10">
            <tr>
                <td>
                    <table class="TableMain10">
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td class="gridcellleft">
                                            From date:&nbsp;<asp:Label ID="lblFromDate" runat="server" ForeColor="#0000C0"></asp:Label>
                                        </td>
                                        <td class="gridcellleft">
                                            To date:&nbsp;<asp:Label ID="lblToDate" runat="server" ForeColor="#0000C0"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="text-align: right">
                                <a id="print" href="javascript:printSpecial();"><span style="font-size: 8pt; color: #3300cc;
                                    text-decoration: underline; cursor: pointer">Print This Report</span></a>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="printReady" runat="server">
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
