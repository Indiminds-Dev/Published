<%@ page language="C#" autoeventwireup="true" inherits="Management_ImagePreview, App_Web_dwbygqb3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Image Preview</title>
    <script language="javascript" type="text/javascript" >
    function Close()
    {
        //alert("aa");
         window.opener.location = '/ImagePreview.aspx'; 
         window.close();
        //window.close();
    }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Image ID="imgCashBankDoc" runat="server"  Width="95%" />
    </div>
    <div>
       
    </div>
    </form>
</body>
</html>
