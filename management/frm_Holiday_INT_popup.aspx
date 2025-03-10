<%@ page language="C#" autoeventwireup="true" inherits="management_frm_Holiday_INT_popup, App_Web_kqhq1k1d" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <table style="border: solid 4px #DDECFE;" cellspacing="0px" cellpadding="0px">
            <tr>
                <td>
                    <table style="width: 100%" cellspacing="0px" style="border: solid 1px blue;">
                        <tr>
                            <td style="width: 90%; border-right: solid 1px blue;">
                                <%ShowList(); %>
                            </td>
                            <td style="vertical-align: top; text-align: center">
                                <asp:Button ID="BtnAdd" runat="server" Text="Add" OnClick="BtnAdd_Click" />
                            </td>
                        </tr>
                        <tr>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
