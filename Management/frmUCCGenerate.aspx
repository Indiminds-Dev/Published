<%@ page language="C#" autoeventwireup="true" inherits="management_frmUCCGenerate, App_Web_amufh4kc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
 <script type="text/javascript" language="javascript">
 var chkobj;
    var objchk=null;
    function chkclicked(obj)
    {
       if (objchk == null)
        {
            objchk = obj;
            objchk.checked = true;
        }
        else
        {
            objchk.checked = false;
            objchk = obj;
            objchk.checked = true;
        }
       
    }
    </script>
    <title>Untitled Page</title>
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
