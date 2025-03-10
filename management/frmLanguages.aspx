<%@ page language="C#" autoeventwireup="true" inherits="management_frmLanguages, App_Web_d1rqvttb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width: 123px">
            <tr>
                <td>
                     <%ShowList(); %>
                </td>
                <td style="vertical-align:top; text-align:center">
                    <asp:Button ID="BtnAdd" runat="server" Text="Add" OnClick="BtnAdd_Click" />
                </td>
            </tr>
            <tr>
                
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
