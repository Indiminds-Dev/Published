<%@ page language="C#" autoeventwireup="true" inherits="management_frmCancelMeeting, App_Web_yxggcryg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Cancel Meetings</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script language="javascript" type="text/javascript">
    
    function closeWin()
    {
     parent.editwin.close();
    }
    function close()
    {
  
       parent.editwin.close();
    }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td colspan="3" align="center">
                        <asp:Label ID="lblName" runat="Server" Visible="false" ForeColor="Red" Font-Bold="True"
                            Width="487px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="mylabel1" style="width: 16%">
                        Reason of Cancel:</td>
                    <td>
                        <asp:DropDownList ID="drpCancelMeeting" runat="Server" Width="291px">
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="mylabel1" style="width: 16%">
                        Note:</td>
                    <td>
                        <asp:TextBox ID="txtNote" runat="Server" TextMode="multiLine" Width="781px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="3" align="Center">
                        <asp:Button ID="btnSave" runat="Server" Text="Save" CssClass="btnUpdate" OnClick="btnSave_Click" />
                        <input type="button" id="btnClose" name="btnClose" value="Close" onclick="closeWin();"
                            class="btnUpdate" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
