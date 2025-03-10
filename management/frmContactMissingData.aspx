<%@ page language="C#" autoeventwireup="true" inherits="management_frmContactMissingData, App_Web_lyh0nvfl" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Contact Missing Data</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">               
                <tr>
                    <td align="center">
                    <div>
             <b><asp:Label ID="lbl_id" runat="server" Text="Created By : "> </asp:Label>  <%=createUser%><br />
            <asp:Label ID="Label1" runat="server" Text="Create Date/Time : "> </asp:Label> <%=createDate%> <br />
            <asp:Label ID="Label2" runat="server" Text="Modified By : "> </asp:Label>  <%=modifyuser%> <br />
            <asp:Label ID="Label3" runat="server" Text="Modify Date/Time: "> </asp:Label>  <%=modifydate%> </b>
            
            </div>
                    <div id="display" runat="server">
                    
                    </div>
                    
                    </td>
                </tr>
                
            </table>
            
          
            
        </div>
    </form>
</body>
</html>