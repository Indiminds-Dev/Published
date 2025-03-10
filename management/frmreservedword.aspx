<%@ page language="C#" autoeventwireup="true" inherits="management_frmreservedword, App_Web_ptes6n28" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <script type="text/javascript" language="javascript">
    
//        function setvalue(obj,obj2)
//        {
//        alert("111");
//            alert(obj + '_' + obj2);
////            var textfield = window.opener.document.aspnetForm.ctl00_ContentPlaceHolder3_txtMessageHeader;
////            textfield.value = textfield.value + '< ' + obj + '>';
//        }
        
        function PostReservedWord(obj)
        {
           window.opener.document.getElementById("txt_msg").value =   window.opener.document.getElementById("txt_msg").value +  '< ' + obj + '>';       
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="Div" runat="server">
      <%--<input style="border-right: 1px groove; border-top: 1px groove; font-size: 8pt;  border-left: 1px groove; color: black; border-bottom: 1px groove; font-style: normal; font-family: Verdana; width: 125px" onclick="window.opener.document.aspnetForm.txt_msg.value=window.opener.document.aspnetForm.txt_msg.value+'< '+this.value+'>';" type="button" id="chk" name="chk" value="Recipient Address">--%>
      <%--<input style="border-right: 1px groove; border-top: 1px groove; font-size: 8pt;  border-left: 1px groove; color: black; border-bottom: 1px groove; font-style: normal; font-family: Verdana; width: 125px" onclick="PostReservedWord(this.value);" type="button" id="Button1" name="chk" value="Recipient Address">--%>
    </div>
    </form>
</body>
</html>
