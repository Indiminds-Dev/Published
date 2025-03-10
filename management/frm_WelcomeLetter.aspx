<%@ page language="C#" autoeventwireup="true" inherits="management_frm_WelcomeLetter, App_Web_0jwcfgzk" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script language="javascript" type="text/javascript">
    function height()
    {
//         alert(document.body.scrollHeight);
        if(document.body.scrollHeight>385)
        {   
            window.frameElement.height = document.body.scrollHeight;
        }
        else
        {
            window.frameElement.height="385";
        }
        window.frameElement.Width = document.body.scrollWidth;
    }
    function callDhtmlFormsParent()
    {
        parent.OnMoreInfoClick("frm_ReservedWordsForMessage.aspx","ADD RESERVED WORDS","950px","500px","Y");
    }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <table class="ColumnBackColor" style="width: 50%; border: solid 1px maroon">
            <tr>
                <td class="MylabelMaroon">
                    <asp:Label ID="Label1" runat="server" Text="Template For:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="dpTemplate" runat="server" Width="300px">
                        <asp:ListItem Text="Employee" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Customer" Value="1"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="MylabelMaroon">
                    <asp:Label ID="Label2" runat="server" Text="Message:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtMessage" runat="server" Height="174px" Width="298px"></asp:TextBox>
                </td>
            </tr>
            <tr class="rt">
                <td colspan="2" style="text-decoration: underline">
                    <asp:HyperLink ID="HpWord" runat="server" ForeColor="blue" href="javascript:void(0);"
                        onclick="callDhtmlFormsParent()">Use Reserved Words</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="lt">
                    <asp:Button ID="btnSave" runat="server" Text="Save" class="btnUpdate" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
