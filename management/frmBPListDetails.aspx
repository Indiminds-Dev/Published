<%@ page language="C#" autoeventwireup="true" inherits="management_frmBPListDetails, App_Web_yf04ozfw" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" /> 
    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
    <script language="javascript" type="text/javascript">
   function SignOff()
    {
       window.parent.SignOff();
    }
    </script>
</head>
<body  style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div class="TableMain100" align="center">
         <table class="TableMain100" ><tr>
            <td class="EHEADER"  style="text-align:center;" >
                <strong><span style="color: #000099"></span>BP Details</strong></td>
        </tr></table>
        <table  style="border:solid 1px white;font-size:12px;" cellpadding="2" cellpadding="2" width="600px">
            <tr>
            
                <td>
                </td>
                <td></td>
            </tr>
            <tr>
                <td class="gridcellright">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="BP ID : " Width="57px"></asp:Label>
                </td>
                <td class="gridcellleft">
                    <asp:Label ID="lblBPID" runat="server" Style="z-index: 100; left: 98px; 
                        top: 49px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="gridcellright">
                       <asp:Label ID="Label2" runat="server" Font-Bold="True"  Text="BP Name : " Width="77px"></asp:Label>
                </td>
                <td class="gridcellleft">
                    <asp:Label ID="lblBPName" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="gridcellright">
                <asp:Label ID="Label7" runat="server" Font-Bold="True"  Text="Address : "></asp:Label>
                </td>
                <td class="gridcellleft">
                    <asp:Label ID="lblAdd1" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    
                </td>
                <td class="gridcellleft">
                    <asp:Label ID="lblAdd2" runat="server"></asp:Label>
                   
                </td>
            </tr>
            
            <tr>
                <td>
                    &nbsp;</td>
                <td class="gridcellleft">
                 <asp:Label ID="lblAdd3" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="gridcellleft">
                    <asp:Label ID="lblAdd4" runat="server" ></asp:Label>                  
                </td>
            </tr>
            <tr>
                <td class="gridcellright">
                <asp:Label ID="Label6" runat="server" Font-Bold="True"  Text="Pin Code : " Width="72px"></asp:Label>
                </td>
                <td class="gridcellleft">
                <asp:Label ID="lblPin" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="gridcellright">
                    <asp:Label ID="Label9" runat="server" Font-Bold="True"  Text="Phone : "></asp:Label>
                 </td>
                <td class="gridcellleft">
                <asp:Label ID="lblPhone" runat="server" ></asp:Label>
                    </td>
            </tr>
            <tr>
                <td class="gridcellright">
                  <asp:Label ID="Label8" runat="server" Font-Bold="True"  Text="Fax : "></asp:Label>  
                </td>
                <td class="gridcellleft">
                    <asp:Label ID="lblFax" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
       </div>
        
 
    </form>
</body>
</html>
