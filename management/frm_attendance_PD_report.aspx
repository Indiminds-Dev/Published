<%@ page language="C#" autoeventwireup="true" inherits="management_frm_attendance_PD_report, App_Web__yen2upk" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PD/PL/CL/SL Report</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <script type="text/javascript" language="javascript">
    function height()
    {
        if(document.body.scrollHeight>=350)
        {
            window.frameElement.height = document.body.scrollHeight;
        }
        else
        {
            window.frameElement.height = '350px';
        }
        window.frameElement.width = document.body.scrollWidth;
    }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <table>
            <tr>
                <td class="EHEADER" align="center" colspan="2">
                    <strong><span style="color: #000099">Leave Availed Employee Wise</span></strong></td>
            </tr>
            <tr>
                <td class="gridcellleft">
                    Employee ID:<asp:TextBox ID="txtID" runat="server" Width="74px"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="btnShow" runat="server" Text="show" OnClick="btnShow_Click"></asp:Button>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="grdReport" runat="server" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="AttdMonth" HeaderText="AttdMonth" />
                            <asp:BoundField DataField="PL" HeaderText="PL" />
                            <asp:BoundField DataField="CL" HeaderText="CL" />
                            <asp:BoundField DataField="SL" HeaderText="SL" />
                            <asp:BoundField DataField="PD" HeaderText="PD" />
                            <asp:BoundField DataField="HC" HeaderText="HC" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
