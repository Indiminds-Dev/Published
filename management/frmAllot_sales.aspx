<%@ page language="C#" autoeventwireup="true" inherits="management_frmAllot_sales, App_Web__yen2upk" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Allot to User</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">
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
                <td class="mylabel1" style="width: 13%">
                    Department:</td>
                
                <td><asp:DropDownList ID="drpDepartment" runat="Server" AutoPostBack="True" Width="300px"  OnSelectedIndexChanged="drpDepartment_SelectedIndexChanged"></asp:DropDownList></td>
            </tr>
             <tr>
                <td class="mylabel1" style="width: 13%">
                    Branch:</td>
               
                <td><asp:DropDownList ID="drpBranch" runat="Server" AutoPostBack="True"  Width="300px"  OnSelectedIndexChanged="drpBranch_SelectedIndexChanged"></asp:DropDownList></td>
            </tr>
             <tr>
                <td class="mylabel1" style="width: 13%">
                    User:</td>
                
                <td><asp:DropDownList ID="drpUser" runat="Server" Width="300px"></asp:DropDownList></td>
            </tr>
            <tr>
                <td class="mylabel1" style="width: 13%">
                    Insturction:</td>
               
                <td><asp:TextBox ID="TxtInstruction" runat="Server" TextMode="MultiLine" Width="787px" Height="200px"  Font-Size="10px"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="3" align="Center">
                    <asp:Button ID="btnSave" runat="Server" Text="Allot" CssClass="btnUpdate" OnClick="btnSave_Click" />
                    <input type="button" id="btnClose" name="btnClose" value="Close" onclick="close();" class="btnUpdate" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
