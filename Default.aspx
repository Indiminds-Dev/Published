﻿<%@ page language="C#" autoeventwireup="true" inherits="_Default, App_Web_ohx3t64c" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <script type="text/javascript" language="javascript">
        function show()
        {
            document.getElementById("tt").style.display='inline';
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="tt" style="display:none;">
        <dxe:ASPxDateEdit ID="ASPxDateEdit1" runat="server" >
        </dxe:ASPxDateEdit>
    </div>
        <input id="Button1" type="button" value="button" onclick="show()" />
    </form>
</body>
</html>
