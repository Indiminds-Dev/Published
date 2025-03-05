<%@ page language="C#" autoeventwireup="true" inherits="management_UserList, App_Web_i8xxwgwk" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>User List</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script language="javascript" type="text/javascript">
        function CloseWindow1()
        {
              var ob=parent.document.getElementById("IFRAME_ForAllPages").contentWindow.GetUserList();
              var ob1=parent.document.getElementById("IFRAME_ForAllPages").contentWindow.GetHiddenUserList();
              var ob2=document.getElementById("txtUserList");
              var ob3=document.getElementById("hd1User");
              ob.value = ob2.value;
              ob1.value=ob3.value;
              parent.editwin.close();

        }
        function checkevent(chkobj)
        {
            if (chkobj.checked == true)
            {
                var st=chkobj.value.split("~");
                var ob=document.getElementById("txtUserList");
                var ob1=document.getElementById("hd1User");
                if (ob.value == "")
                {
                    ob.value=st[1];
                    ob1.value=st[0];
                }
                else
                {
                    ob.value = ob.value + "," + st[1];
                    ob1.value = ob1.value + "," + st[0];
                }
            }
            else
            {
                var ob=document.getElementById("txtUserList");
                var ob1=document.getElementById("hd1User");
                if (ob.value !="") 
                {
                    var st=chkobj.value.split("~");
                    var obj12=ob.value.split(",");
                    var obj123=ob1.value.split(",");
                    var temp1 = "";
                    var temp2 = "";
                    for (i = 0 ; i < obj12.length; i++)
                    {
                        if (obj12[i] == st[1])
                        {
                        }
                        else
                        {
                            if (temp1 != "")
                            {
                                temp1 = temp1 + "," + obj12[i];
                                temp2 = temp2 + "," + obj123[i];
                            }
                            else
                            {
                                temp1 = obj12[i];
                                temp2 = obj123[i];
                            }
                        }
                    }
                    ob.value = temp1;
                    ob1.value = temp2;
                }
            }
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>
                        <asp:Button ID="btnSelectAll" runat="server" Text="Select All" CssClass="btnUpdate"
                            OnClick="btnSelectAll_Click" />
                        <asp:HiddenField ID="txtUserList" runat="server" />
                        <asp:HiddenField ID="hd1User" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
