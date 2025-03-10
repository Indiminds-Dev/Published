<%@ page language="C#" autoeventwireup="true" inherits="management_frm_Attendance_Import_Monthly, App_Web_d3reltht" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script language="javascript" type="text/javascript">
        function height()
         {
          if(document.body.scrollHeight>=350)
           window.frameElement.height= document.body.scrollHeight; 
           else 
           window.frameElement.height = '350px';
            window.frameElement.Width= document.body.scrollWidth; }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <table class="TableMain100">
            <tr>
                <td colspan="2">
                    <asp:FileUpload ID="FLSelectFile" runat="server" Width="250px"/>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblStatus" runat="server" Width="400px" ForeColor="Blue"></asp:Label>
                </td>
                <td> <asp:Label ID="lblList" runat="server" Text="" Width="408px" ForeColor="red"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="Inport" CssClass="btnUpdate" OnClick="btnSubmit_Click" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
