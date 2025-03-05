<%@ page language="C#" autoeventwireup="true" inherits="management_InterestRateSlabPopup, App_Web_s3wzohpw" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
    
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

   

    <script language="javascript" type="text/javascript">

    function noNumbers(e)
    {
        var keynum
        var keychar
        var numcheck
        
        if(window.event)//IE
        {
            keynum = e.keyCode                        
            if(keynum>=48 && keynum<=57 || keynum==46)
                 {
                  return true;
                 }
                 else
                {
                 alert("Please Insert Numeric Only");
                 return false;
                }
         } 
         
          else if(e.which) // Netscape/Firefox/Opera
       {
           keynum = e.which  
           
           if(keynum>=48 && keynum<=57 || keynum==46)
                 {
                  return true;
                 }
                 else
                 {
                 alert("Please Insert Numeric Only");
                 return false;
                 }     
        }
  } 
  

</script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
        <div>
            <table border="10" cellpadding="1" cellspacing="1">
               
                <tr>
                    <td class="gridcellleft" bgcolor="#B7CEEC">
                        Slab Code:</td>
                    <td>
                        <dxe:ASPxTextBox runat="server" Width="150px"  ID="txtslabcode">
                        </dxe:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table border="10" cellpadding="1" cellspacing="1">
                            <tr>
                                <td class="gridcellleft" bgcolor="#B7CEEC">
                                    Amnt From:</td>
                                <td>
                                    <asp:TextBox runat="server" Width="150px" ID="txtmin" onkeypress="return noNumbers(event)"
                                        MaxLength="19"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table border="10" cellpadding="1" cellspacing="1">
                            <tr>
                                <td class="gridcellleft" bgcolor="#B7CEEC">
                                    Amnt To:</td>
                                <td>
                                    <asp:TextBox runat="server" Width="150px" MaxLength="19" ID="txtmax" onkeypress="return noNumbers(event)"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft" bgcolor="#B7CEEC">
                        Rate:</td>
                    <td>
                        <asp:TextBox runat="server" Width="150px" ID="txtrate" onkeypress="return noNumbers(event)"
                            MaxLength="19"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnSave" runat="server" Style="cursor: pointer" CssClass="btnupdate"
                            Text="Save" OnClientClick="return aa();" OnClick="btnSave_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>