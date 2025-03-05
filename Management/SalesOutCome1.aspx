<%@ page language="C#" autoeventwireup="true" inherits="management_SalesOutCome1, App_Web_gywepxwc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
<script language="javascript" type="text/javascript">
        function checkevent(Obj,chkObj,txtdate,txttime,nowdate,nowtime,cdate,ctime)
        {
           
            var st = chkObj.value.split("~")            
            var ob = window.opener.document.getElementById(Obj)
            var ob1 = window.opener.document.getElementById("TxtOut")
            ob.value = st[1]; 
            ob1.value = st[0];
            window.opener.document.getElementById("btnSavePhoneCallDetails").disabled=false;  
            window.opener.Changedata123(txtdate,txttime,nowdate,nowtime,cdate,ctime); 
            window.close(); 
            
        }
        function lostFocus()
        {
            var str = window.opener.document.getElementById("txtNote");
            str.focus();
        }
    </script>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
