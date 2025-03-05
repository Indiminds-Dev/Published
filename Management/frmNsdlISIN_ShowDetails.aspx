<%@ page language="C#" autoeventwireup="true" inherits="management_frmNsdlISIN_ShowDetails, App_Web_s3wzohpw" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
  <script language="javascript" type="text/javascript">
    function SignOff()
    {
        window.parent.SignOff();
    }
    </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div>
    <asp:Panel ID="Panel1" runat="server" BackColor="#DDECFE" Width="100%" Height ="100%">
    <table class="TableMain100" style="border:solid 1px white;" >
        <tr>
            <td class="EHEADER"  style=" text-align:center; "> 
            <strong><span style="color: #000099"> RTA Details </span> </strong> 
            </td>            
        </tr>
        <tr>
            <td>
            
            <table class="TableMain100">
                <tr>
                    <td class="gridcellright" width="15%">
                    Code :
                    </td >                    
                    <td class="gridcellleft" width="80%">
                    <dxe:ASPxTextBox ID="txtRTACode" runat="server" ReadOnly ="True"  width="100%">
                    </dxe:ASPxTextBox>   
                    </td>      
                </tr>
                <tr>
                    <td class="gridcellright" width="15%">
                    Name :
                    </td>
                    <td class="gridcellleft" width="80%">
                    <dxe:ASPxTextBox ID="txtRTAName" runat="server" ReadOnly ="True"  width="100%">
                    </dxe:ASPxTextBox>   
                    </td>
                </tr>
                <tr>
                    <td class="gridcellright" width="15%">
                    Address :
                    </td>
                    <td class="gridcellleft" width="80%">
                    <dxe:ASPxMemo ID="memoAddr" runat="server"  Rows="3" ReadOnly ="True" width="100%">
                    </dxe:ASPxMemo>  
                    </td>
                </tr>
                <tr>
                    <td class="gridcellright" width="15%">
                    Phone :
                    </td>
                    <td class="gridcellleft" width="80%">
                    <dxe:ASPxMemo ID="memoPhone" runat="server"  Rows="1" ReadOnly ="True" width="100%">
                    </dxe:ASPxMemo>  
                    </td>
                </tr>
                <tr>
                    <td class="gridcellright" width="15%">
                    Fax :
                    </td>
                    <td class="gridcellleft" width="80%">
                    <dxe:ASPxMemo ID="memoFax" runat="server"  Rows="1" ReadOnly ="True" width="100%">
                    </dxe:ASPxMemo>  
                    </td>
                </tr>
        
            </table>
            
        
        </td> 
            
        </tr>
        
        </table>
        </asp:Panel>  
    </div>
    </form>
</body>
</html>
